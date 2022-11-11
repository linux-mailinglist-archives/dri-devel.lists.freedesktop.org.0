Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EEC626132
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 19:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA8310E1A1;
	Fri, 11 Nov 2022 18:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39C10E109;
 Fri, 11 Nov 2022 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668191617; x=1699727617;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=DXNsdxx3S3JoDsCj2fv5BJWrHxxNABpYOhoARLR8qoY=;
 b=YYfy/Q6x4WTp5PfQX7meKkZFxG2fRNAedtaVCnukRmSLoSpxsrxNMtuo
 OEQZT03bNOkNCSbBRX60qZDYQHUrctJvzOZonHSnd4aGbHaHnQ8YhRJ0Z
 fQEe5E87sg2o8WZeTbKXkT/BHTmNcsIhA5mxlG/o2Zn2wSrgv/MwFksra
 x2vo2YiSnj8Q3PBGuTySwP6VQdZSkQdPSx/RcDi2CfaKunDuM0wPx7nSs
 tVp/5Nmd24VhbO7YkqcIgwJjEW/enx36KoRMSEXHnpKdS0oyc6iDtIJeO
 VumrTDB7ZTER0uN/bdmZ/4dPGIrxkXYODoMD30406lzfeQsjyUfAFKPjb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="292050080"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; d="scan'208";a="292050080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 10:33:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="668882729"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; d="scan'208";a="668882729"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 11 Nov 2022 10:33:17 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1otYq5-0004C1-0L;
 Fri, 11 Nov 2022 18:33:17 +0000
Date: Sat, 12 Nov 2022 02:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 f8f60f322f0640c8edda2942ca5f84b7a27c417a
Message-ID: <636e954a.VkBZfaeGEL+NAnI6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: f8f60f322f0640c8edda2942ca5f84b7a27c417a  Add linux-next specific files for 20221111

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210261404.b6UlzG7H-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202210270637.Q5Y7FiKJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211090634.RyFKK0WS-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211102047.QP7IThm4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211111624.1XZTuzHJ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3c24xx.h: No such file or directory
arch/x86/platform/efi/runtime-map.c:138:5: warning: no previous prototype for 'efi_get_runtime_map_size' [-Wmissing-prototypes]
arch/x86/platform/efi/runtime-map.c:143:5: warning: no previous prototype for 'efi_get_runtime_map_desc_size' [-Wmissing-prototypes]
arch/x86/platform/efi/runtime-map.c:148:5: warning: no previous prototype for 'efi_runtime_map_copy' [-Wmissing-prototypes]
csky-linux-ld: local_object.c:(.text+0x84): undefined reference to `ipv6_icmp_error'
drivers/block/zram/zram_drv.c:1857:7: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
drivers/block/zram/zram_drv.c:1857:7: warning: variable 'err' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
drivers/firmware/efi/memmap.c:57:52: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4887: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5073:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
local_object.c:(.text+0x60): undefined reference to `ipv6_icmp_error'
vmlinux.o: warning: objtool: __btrfs_map_block+0x1e22: unreachable instruction

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c:51:1: sparse: sparse: symbol 'ga100_mc_device' was not declared. Should it be static?
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
mm/khugepaged.c:2038 collapse_file() warn: iterator used outside loop: 'page'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- alpha-randconfig-r003-20221111
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-randconfig-m041-20221111
|   |-- lib-zstd-compress-huf_compress.c-HUF_getIndex()-warn:the-RANK_POSITION_LOG_BUCKETS_BEGIN-macro-might-need-parens
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|-- arm-allyesconfig
|   |-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h:No-such-file-or-directory
|   |-- drivers-firmware-efi-memmap.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-defconfig
|   |-- drivers-firmware-efi-memmap.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-oxnas_v6_defconfig
|   `-- drivers-firmware-efi-memmap.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- arm-s3c6400_defconfig
|   `-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h:No-such-file-or-directory
|-- arm64-allyesconfig
|   |-- drivers-firmware-efi-memmap.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
clang_recent_errors
|-- hexagon-randconfig-r001-20221111
|   |-- drivers-block-zram-zram_drv.c:warning:variable-err-is-used-uninitialized-whenever-condition-is-true
|   `-- drivers-block-zram-zram_drv.c:warning:variable-err-is-used-uninitialized-whenever-if-condition-is-true
`-- riscv-randconfig-r033-20221111
    |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
    |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
    |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
    `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump

elapsed time: 722m

configs tested: 74
configs skipped: 2

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                                defconfig
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
x86_64                        randconfig-a006
arc                  randconfig-r043-20221111
s390                                defconfig
riscv                randconfig-r042-20221111
s390                 randconfig-r044-20221111
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
i386                          randconfig-a014
i386                          randconfig-a001
i386                          randconfig-a003
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a005
mips                             allyesconfig
i386                          randconfig-a016
sh                               allmodconfig
arm                        oxnas_v6_defconfig
arm                         s3c6400_defconfig
m68k                          atari_defconfig
x86_64                            allnoconfig
xtensa                    xip_kc705_defconfig
s390                             allmodconfig
arm                        realview_defconfig
m68k                            q40_defconfig
arm                          gemini_defconfig
arc                              allyesconfig
s390                             allyesconfig
arm                                 defconfig
alpha                            allyesconfig
m68k                             allmodconfig
i386                             allyesconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                           h5000_defconfig
csky                                defconfig
arm                        trizeps4_defconfig
m68k                       m5275evb_defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221111
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                    mvme5100_defconfig
x86_64                          rhel-8.3-rust
powerpc                    ge_imp3a_defconfig
mips                     loongson2k_defconfig
arm                       aspeed_g4_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
