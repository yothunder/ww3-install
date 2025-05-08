#!/bin/bash

module purge
module restore ww3

export CC=gcc
export FC=gfortran
export F90=gfortran
export NetCDF_ROOT=/opt/netcdf

# git clone https://github.com/NOAA-EMC/WW3.git && mv WW3/* . && rm -rf WW3
cd /home/aac/shared/teams/dcgpu_training/epcc/yothunder/ww3
rm -rf build
mkdir build && cd build
rm -f CMakeCache.txt
cmake .. -DSWITCH=bmkg -DCMAKE_INSTALL_PREFIX=/home/aac/shared/teams/dcgpu_training/epcc/yothunder/ww3/build
make -j 32 VERBOSE=1
cp /home/aac/shared/teams/dcgpu_training/epcc/yothunder/ww3/build/bin/* /home/aac/shared/teams/dcgpu_training/epcc/yothunder/ww3/model/bin