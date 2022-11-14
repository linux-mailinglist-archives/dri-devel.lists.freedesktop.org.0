Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A4628B9C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 22:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2CC10E324;
	Mon, 14 Nov 2022 21:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8058410E31E;
 Mon, 14 Nov 2022 21:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668462829; x=1699998829;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=yPXbgLKjXYDcCWin9eEJ/CpOeATRU45Lm0Im9KdfJzo=;
 b=UfL39G2AE5g/i5y23EvyAM+gehqIspbL/Al1BVXbb/7CTaPnyJJ/E5Y3
 u7Uxl/WT98YedQrZp3TO29K4PuEM61LEE6QrirxQmB3/NB9JZFWFPnjG/
 //00Ddn/L9e525fcUH+mCu11Knaxb0G+MJrcfjEdV+cK87jel4XK12laW
 IWwrPoj4tTt+kzUJ4PTkbc7UuZiXP7L0Gke44+qa9VknhjNueXMIeKktC
 vg2Ap+24HNm7yDUpdVlvN/nksqPHBAsjwGFDaEloGa5Pl+9q4w+kfF4/I
 Bx0J1/RDEektrEe65Oar4N6SJ/iHc5wWHqB0v3W0GiaQGl0WKZcqQbhMM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="310799295"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="310799295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 13:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="763651529"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="763651529"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 14 Nov 2022 13:53:45 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ouhOi-0000mF-2g;
 Mon, 14 Nov 2022 21:53:44 +0000
Date: Tue, 15 Nov 2022 05:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 5c92ddca1053df02387e8006d06094e18cc8538a
Message-ID: <6372b8ae.03wKgLWGIY41bdTG%lkp@intel.com>
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
Cc: linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-afs@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, ntfs3@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 5c92ddca1053df02387e8006d06094e18cc8538a  Add linux-next specific files for 20221114

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211041320.coq8EELJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211130053.Np70VIdn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211130943.2q8U5Ndp-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211142244.sGkXbWO2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211150003.LkfYS4HE-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "ipv6_icmp_error" [net/rxrpc/rxrpc.ko] undefined!
arch/arm/mach-s3c/devs.c:32:10: fatal error: 'linux/platform_data/dma-s3c24xx.h' file not found
arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3c24xx.h: No such file or directory
arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: 'linux/platform_data/dma-s3c24xx.h' file not found
drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4887: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5073:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
ld.lld: error: .btf.vmlinux.bin.o: unknown file type
net/rxrpc/local_object.c:36: undefined reference to `ipv6_icmp_error'
vmlinux.o: warning: objtool: apply_dir_move+0xb1: unreachable instruction

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/cpufreq/acpi-cpufreq.c:970 acpi_cpufreq_boost_init() error: uninitialized symbol 'ret'.
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: sparse: sparse: symbol 'gf100_fifo_nonstall_block' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:33:18: sparse: sparse: symbol 'nvkm_engn_cgrp_get' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: sparse: sparse: symbol 'tu102_gr_load' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: sparse: sparse: symbol 'wpr_generic_header_dump' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:49:1: sparse: sparse: symbol 'ga102_gsps' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c:51:1: sparse: sparse: symbol 'ga100_mc_device' was not declared. Should it be static?
fotg210-udc.c:(.text+0x11b8): undefined reference to `usb_del_gadget_udc'
fotg210-udc.c:(.text+0x3ba): undefined reference to `usb_gadget_giveback_request'
fotg210-udc.c:(.text+0xb9e): undefined reference to `usb_gadget_udc_reset'
lib/test_objpool.c:1007:16: sparse: sparse: symbol 'g_ot_async' was not declared. Should it be static?
lib/test_objpool.c:516:3: sparse: sparse: symbol 'g_ot_sync_ops' was not declared. Should it be static?
lib/test_objpool.c:76:3: sparse: sparse: symbol 'g_ot_data' was not declared. Should it be static?
lib/test_objpool.c:824:3: sparse: sparse: symbol 'g_ot_async_ops' was not declared. Should it be static?
lib/test_objpool.c:989:16: sparse: sparse: symbol 'g_ot_sync' was not declared. Should it be static?
lib/test_objpool.c:998:16: sparse: sparse: symbol 'g_ot_miss' was not declared. Should it be static?
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
mm/khugepaged.c:2038 collapse_file() warn: iterator used outside loop: 'page'
riscv32-linux-ld: fotg210-udc.c:(.text+0x13b6): undefined reference to `usb_ep_set_maxpacket_limit'
riscv32-linux-ld: fotg210-udc.c:(.text+0x14a4): undefined reference to `usb_add_gadget_udc'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- alpha-randconfig-c034-20221114
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- alpha-randconfig-s041-20221114
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:sparse:sparse:symbol-gf100_fifo_nonstall_block-was-not-declared.-Should-it-be-static
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:sparse:sparse:symbol-nvkm_engn_cgrp_get-was-not-declared.-Should-it-be-static
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:sparse:sparse:symbol-tu102_gr_load-was-not-declared.-Should-it-be-static
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:sparse:sparse:symbol-wpr_generic_header_dump-was-not-declared.-Should-it-be-static
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-ga102.c:sparse:sparse:symbol-ga102_gsps-was-not-declared.-Should-it-be-static
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-mc-ga100.c:sparse:sparse:symbol-ga100_mc_device-was-not-declared.-Should-it-be-static
|   |-- lib-test_objpool.c:sparse:sparse:symbol-g_ot_async-was-not-declared.-Should-it-be-static
|   |-- lib-test_objpool.c:sparse:sparse:symbol-g_ot_async_ops-was-not-declared.-Should-it-be-static
|   |-- lib-test_objpool.c:sparse:sparse:symbol-g_ot_data-was-not-declared.-Should-it-be-static
|   |-- lib-test_objpool.c:sparse:sparse:symbol-g_ot_miss-was-not-declared.-Should-it-be-static
|   |-- lib-test_objpool.c:sparse:sparse:symbol-g_ot_sync-was-not-declared.-Should-it-be-static
|   `-- lib-test_objpool.c:sparse:sparse:symbol-g_ot_sync_ops-was-not-declared.-Should-it-be-static
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-randconfig-c003-20221114
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-randconfig-r036-20221114
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
clang_recent_errors
|-- arm-s3c2410_defconfig
|   |-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h-file-not-found
|   `-- arch-arm-mach-s3c-s3c24xx.c:fatal-error:linux-platform_data-dma-s3c24xx.h-file-not-found
|-- x86_64-randconfig-a012-20221114
|   `-- vmlinux.o:warning:objtool:handle_bug:call-to-kmsan_unpoison_entry_regs()-leaves-.noinstr.text-section
`-- x86_64-randconfig-r023-20221114
    `-- ld.lld:error:.btf.vmlinux.bin.o:unknown-file-type

elapsed time: 764m

configs tested: 77
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
arc                  randconfig-r043-20221114
x86_64                              defconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
i386                 randconfig-a001-20221114
x86_64                    rhel-8.3-kselftests
s390                                defconfig
i386                 randconfig-a002-20221114
s390                             allmodconfig
i386                 randconfig-a005-20221114
s390                             allyesconfig
i386                 randconfig-a006-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a004-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a006-20221114
m68k                        stmark2_defconfig
arm                          simpad_defconfig
i386                 randconfig-c001-20221114
powerpc                    klondike_defconfig
csky                                defconfig
sh                           se7343_defconfig
sh                        edosk7760_defconfig
mips                      fuloong2e_defconfig
mips                     decstation_defconfig
powerpc                      ppc6xx_defconfig
arm                         axm55xx_defconfig
mips                      loongson3_defconfig
xtensa                  audio_kc705_defconfig
xtensa                    smp_lx200_defconfig
arm                         cm_x300_defconfig
sh                           se7619_defconfig
powerpc                    adder875_defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
mips                             allyesconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221114
hexagon              randconfig-r041-20221114
riscv                randconfig-r042-20221114
s390                 randconfig-r044-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a012-20221114
i386                 randconfig-a016-20221114
x86_64               randconfig-a013-20221114
i386                 randconfig-a013-20221114
x86_64               randconfig-a011-20221114
i386                 randconfig-a012-20221114
x86_64               randconfig-a015-20221114
i386                 randconfig-a015-20221114
x86_64               randconfig-a016-20221114
x86_64                          rhel-8.3-rust
powerpc                    ge_imp3a_defconfig
powerpc                  mpc866_ads_defconfig
arm                       spear13xx_defconfig
arm                        neponset_defconfig
mips                   sb1250_swarm_defconfig
arm                             mxs_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
