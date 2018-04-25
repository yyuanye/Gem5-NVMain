#!/bin/sh
BENCH_HOME=/home/yyuanye/specCPU2006/benchspec/CPU2006/403.gcc
REPATH=..
NVMAINREPATH=../..
$REPATH/build/X86/gem5.opt \
--debug-flags=NVMain --debug-file=nvmain.out  \
--stats-file=gem5-DRAMCache-stats.log		\
$REPATH/configs/example/se.py \
--cpu-type=DerivO3CPU   --num-cpus=4   \
--cpu-clock=2GHz		\
--mem-type=NVMainMemory --nvmain-config=$NVMAINREPATH/nvmain/Config/2D_DRAM_example.config     \
--caches   \
--fast-forward=1000000 --maxinsts=10000000   \
--l1i_size 32kB --l1d_size 32kB		\
--l2cache --l2_size 256kB    \
--cmd="$BENCH_HOME/exe/gcc_base.amd64-m64-gcc43-nn" --options="$BENCH_HOME/data/ref/input/s04.i" -n 1   
