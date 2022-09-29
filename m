Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF645EF0A7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA8210E336;
	Thu, 29 Sep 2022 08:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BDC10E3D2;
 Thu, 29 Sep 2022 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664440646; x=1695976646;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Y0T8lpxJFurjnxxDGFDdmqLbfP82UgdNhHjDFAAckvo=;
 b=aSjUX9asUPiT8N9lpQ+qMkFG8FLg8xNW18mYPB5ncIOYqgj9M/Q1iXVO
 OpPqMIlNF9YQrhl/DyKo434IUiq/15BCtSKAz4fASJxzIjOQNVEK3bNhQ
 Ir2Ile5cJyZd4ysjGTk0l8L3OmO1YsgTMuQzUdXw2Ped0ydkBIVocttW/
 II4CQcvdq0sdlCcR9+loiGqrng3AbFau+HjEgGqjrpEn8tC5haBIMSmDm
 bNs/u5vhxd3vv3fNHXY4nLlzWP7PU5CvybNd/xwPbTIofmWo887ZRpAMo
 HzQ/vYrd52OlfLaqsblfCA6j95Y9PvIrZpryIxOuUNKIfi4hlUTWc+q/u g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="300551088"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="300551088"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 01:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="797473230"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="797473230"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 29 Sep 2022 01:37:19 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1odp2k-0000uK-2Y;
 Thu, 29 Sep 2022 08:37:18 +0000
Date: Thu, 29 Sep 2022 16:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 de90d455a35e474a184c898e66a6a108c3a99434
Message-ID: <6335591f.BHWTYTiAbxJo9pPx%lkp@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, apparmor@lists.ubuntu.com,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>, iommu@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, amd-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: de90d455a35e474a184c898e66a6a108c3a99434  Add linux-next specific files for 20220928

Error/Warning reports:

https://lore.kernel.org/linux-mm/202209150141.WgbAKqmX-lkp@intel.com
https://lore.kernel.org/llvm/202209220019.Yr2VuXhg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_iio_channel_get_all" [drivers/power/supply/mt6370-charger.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/clk/xilinx/clk-xlnx-clock-wizard.ko] undefined!
ERROR: modpost: "iio_read_channel_processed" [drivers/power/supply/mt6370-charger.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
aarch64-linux-ld: security/apparmor/lsm.c:1545: undefined reference to `zstd_max_clevel'
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
depmod: ERROR: Cycle detected: nf_conntrack -> nf_nat -> nf_conntrack
depmod: ERROR: Found 2 modules in dependency cycles!
drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: '__GFP_ATOMIC' undeclared (first use in this function); did you mean 'GFP_ATOMIC'?
drivers/gpu/drm/tests/drm_format_helper_test.c:381:31: warning: use of NULL 'buf' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
drivers/iommu/ipmmu-vmsa.c:946:34: warning: 'ipmmu_of_ids' defined but not used [-Wunused-const-variable=]
include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_243' declared with attribute error: FIELD_PREP: mask is not constant
include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_256' declared with attribute error: FIELD_PREP: mask is not constant
include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_265' declared with attribute error: FIELD_PREP: mask is not constant
include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_284' declared with attribute error: FIELD_PREP: mask is not constant
include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_290' declared with attribute error: FIELD_PREP: mask is not constant
include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_408' declared with attribute error: FIELD_PREP: mask is not constant
security/apparmor/apparmorfs.c:1204: undefined reference to `zstd_min_clevel'
security/apparmor/apparmorfs.c:1210: undefined reference to `zstd_max_clevel'
security/apparmor/lsm.c:1545: undefined reference to `zstd_min_clevel'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r043-20220926
|   |-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_PREP:mask-is-not-constant
|-- arm-buildonly-randconfig-r001-20220926
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_PREP:mask-is-not-constant
|-- arm-randconfig-c002-20220925
|   `-- drivers-gpu-drm-tests-drm_format_helper_test.c:warning:use-of-NULL-buf-where-non-null-expected-CWE
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-buildonly-randconfig-r006-20220926
|   |-- aarch64-linux-ld:security-apparmor-lsm.c:undefined-reference-to-zstd_max_clevel
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   |-- security-apparmor-apparmorfs.c:undefined-reference-to-zstd_max_clevel
|   |-- security-apparmor-apparmorfs.c:undefined-reference-to-zstd_min_clevel
|   `-- security-apparmor-lsm.c:undefined-reference-to-zstd_min_clevel
|-- arm64-randconfig-r035-20220926
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_PREP:mask-is-not-constant
|-- i386-buildonly-randconfig-r003-20220926
|   `-- drivers-iommu-ipmmu-vmsa.c:warning:ipmmu_of_ids-defined-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- nios2-buildonly-randconfig-r005-20220925
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_PREP:mask-is-not-constant
|-- openrisc-randconfig-r015-20220925
|   |-- ERROR:devm_iio_channel_get_all-drivers-power-supply-mt6370-charger.ko-undefined
|   `-- ERROR:iio_read_channel_processed-drivers-power-supply-mt6370-charger.ko-undefined
|-- powerpc-buildonly-randconfig-r003-20220925
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_PREP:mask-is-not-constant
|-- s390-allmodconfig
|   |-- ERROR:devm_ioremap_resource-drivers-dma-fsl-edma.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-idma64.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-qcom-hdma.ko-undefined
|   |-- ERROR:devm_memremap-drivers-misc-open-dice.ko-undefined
|   |-- ERROR:devm_memunmap-drivers-misc-open-dice.ko-undefined
|   |-- ERROR:devm_platform_ioremap_resource-drivers-char-xillybus-xillybus_of.ko-undefined
|   |-- ERROR:devm_platform_ioremap_resource-drivers-clk-xilinx-clk-xlnx-clock-wizard.ko-undefined
|   |-- ERROR:ioremap-drivers-tty-ipwireless-ipwireless.ko-undefined
|   |-- ERROR:iounmap-drivers-net-ethernet-pcnet_cs.ko-undefined
|   `-- ERROR:iounmap-drivers-tty-ipwireless-ipwireless.ko-undefined
|-- sparc-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- sparc-randconfig-r036-20220926
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_PREP:mask-is-not-constant
`-- x86_64-rhel-8.3-kselftests
    |-- depmod:ERROR:Cycle-detected:nf_conntrack-nf_nat-nf_conntrack
    `-- depmod:ERROR:Found-modules-in-dependency-cycles
clang_recent_errors
`-- s390-randconfig-r044-20220926
    `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output

elapsed time: 729m

configs tested: 64
configs skipped: 2

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
arm                                 defconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64                               rhel-8.3
x86_64               randconfig-a001-20220926
powerpc                           allnoconfig
i386                          randconfig-a001
i386                                defconfig
i386                          randconfig-a003
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
i386                          randconfig-a005
x86_64               randconfig-a006-20220926
x86_64                           allyesconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                              allyesconfig
arc                  randconfig-r043-20220925
arm64                            allyesconfig
riscv                randconfig-r042-20220925
alpha                            allyesconfig
arc                  randconfig-r043-20220926
arc                              allyesconfig
s390                 randconfig-r044-20220925
m68k                             allmodconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                 randconfig-a012-20220926
i386                 randconfig-a011-20220926
i386                          randconfig-a006
i386                 randconfig-a015-20220926
i386                          randconfig-a004
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
x86_64               randconfig-a012-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a013-20220926
hexagon              randconfig-r045-20220925
x86_64               randconfig-a011-20220926
hexagon              randconfig-r041-20220926
x86_64               randconfig-a015-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
