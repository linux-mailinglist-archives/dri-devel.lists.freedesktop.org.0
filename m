Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C65F0452
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 07:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C449B10EB79;
	Fri, 30 Sep 2022 05:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160D10E038;
 Fri, 30 Sep 2022 05:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664517134; x=1696053134;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=3KPEcgR85ZOMW5q/JgOUeEEbfoaGIM6iNZckmuOtgYs=;
 b=OfkmDMIQEryd0AhYOQeI11qEfUKsnPUZKJY3w9rQkb8hQOi/lksP3JOY
 +w3xzsPNx5+5Z+TH5WK9nHwDQJIhL/rRC3eBKhLgHP3jsLjAkyJfwsmvL
 CGxgphEp3z26faMAqS9Sg0GKzW0wqezL4OmjDmQqXsJ04GahaX+vT2mi1
 rEAeU9SNmYuqDiPZXtPMpGRi+FxtcIRa8oka9wmVAiwiET/pDiXWFDOl9
 TdLIJJ66jykWkYlABgxdRLlfEREnSLKGW2IAjqYmXM/G0M8KI6PM1xxi/
 81seGbSeiGY1Nzj6XigRMjfM7mcgl+9iNHDfcg97HEw/JR7ZkwehycGlW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="366161190"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="366161190"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="748117448"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="748117448"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 29 Sep 2022 22:52:10 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oe8wT-0000Zf-2Q;
 Fri, 30 Sep 2022 05:52:09 +0000
Date: Fri, 30 Sep 2022 13:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 1c6c4f42b3de4f18ea96d62950d0e266ca35a055
Message-ID: <633683f5.q63D6Na3AYhI/Rp2%lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 1c6c4f42b3de4f18ea96d62950d0e266ca35a055  Add linux-next specific files for 20220929

Error/Warning reports:

https://lore.kernel.org/linux-mm/202209150141.WgbAKqmX-lkp@intel.com
https://lore.kernel.org/llvm/202209300609.14WJ5tgf-lkp@intel.com
https://lore.kernel.org/llvm/202209300825.jcUh1OUm-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

/kbuild/src/minority/drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: '__GFP_ATOMIC' undeclared (first use in this function); did you mean 'GFP_ATOMIC'?
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
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
depmod: ERROR: Cycle detected: nf_conntrack -> nf_nat -> nf_conntrack
depmod: ERROR: Found 2 modules in dependency cycles!
drivers/gpu/drm/msm/msm_gem_shrinker.c:29:28: error: '__GFP_ATOMIC' undeclared (first use in this function); did you mean 'GFP_ATOMIC'?
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x9a'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xa1'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x95'
grep: smatch_trinity_*: No such file or directory

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- arm64-buildonly-randconfig-r001-20220926
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-buildonly-randconfig-r002-20220926
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-r002-20220926
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-r033-20220926
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- ia64-allmodconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- m68k-allmodconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- m68k-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- microblaze-randconfig-m041-20220925
|   |-- drivers-gpu-drm-display-drm_dp_helper.c-drm_dp_phy_name()-warn:unsigned-dp_phy-is-never-less-than-zero.
|   |-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|   |-- drivers-pinctrl-pinctrl-amd.c-amd_gpio_dbg_show()-warn:format-string-contains-non-ascii-character-x95
|   |-- drivers-pinctrl-pinctrl-amd.c-amd_gpio_dbg_show()-warn:format-string-contains-non-ascii-character-x9a
|   |-- drivers-pinctrl-pinctrl-amd.c-amd_gpio_dbg_show()-warn:format-string-contains-non-ascii-character-xa1
|   `-- grep:smatch_trinity_:No-such-file-or-directory
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- nios2-buildonly-randconfig-r004-20220928
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- openrisc-randconfig-r015-20220925
|   |-- ERROR:devm_iio_channel_get_all-drivers-power-supply-mt6370-charger.ko-undefined
|   `-- ERROR:iio_read_channel_processed-drivers-power-supply-mt6370-charger.ko-undefined
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:__GFP_ATOMIC-undeclared-(first-use-in-this-function)
|-- s390-allmodconfig
|   |-- ERROR:devm_ioremap_resource-drivers-dma-fsl-edma.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-idma64.ko-undefined
clang_recent_errors
|-- arm-randconfig-r001-20220928
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- hexagon-allmodconfig
|   `-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:use-of-undeclared-identifier-__GFP_ATOMIC
|-- powerpc-buildonly-randconfig-r002-20220928
|   |-- drivers-gpu-drm-msm-msm_gem_shrinker.c:error:use-of-undeclared-identifier-__GFP_ATOMIC
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- s390-randconfig-r044-20220928
|   |-- apparmorfs.c:(.text):undefined-reference-to-zstd_max_clevel
|   |-- apparmorfs.c:(.text):undefined-reference-to-zstd_min_clevel
|   |-- lsm.c:(.text):undefined-reference-to-zstd_min_clevel
|   `-- s39-linux-ld:lsm.c:(.text):undefined-reference-to-zstd_max_clevel
`-- x86_64-rhel-8.3-rust
    |-- ld.lld:error:undefined-symbol:__rust_alloc
    |-- ld.lld:error:undefined-symbol:__rust_dealloc
    |-- ld.lld:error:undefined-symbol:__rust_realloc
    |-- ld.lld:error:undefined-symbol:bool-as-core::fmt::Display::fmt
    |-- ld.lld:error:undefined-symbol:core::fmt::Formatter::debug_list
    |-- ld.lld:error:undefined-symbol:core::fmt::Formatter::debug_lower_hex
    |-- ld.lld:error:undefined-symbol:core::fmt::Formatter::debug_upper_hex
    |-- ld.lld:error:undefined-symbol:core::fmt::builders::DebugList::entry
    |-- ld.lld:error:undefined-symbol:core::fmt::builders::DebugList::finish
    |-- ld.lld:error:undefined-symbol:core::panicking::panic
    |-- ld.lld:error:undefined-symbol:i32-as-core::fmt::Display::fmt
    |-- ld.lld:error:undefined-symbol:i32-as-core::fmt::LowerHex::fmt
    |-- ld.lld:error:undefined-symbol:i32-as-core::fmt::UpperHex::fmt
    |-- ld.lld:error:undefined-symbol:kernel::error::Error-as-core::convert::From-alloc::collections::TryReserveError::from
    |-- ld.lld:error:undefined-symbol:kernel::error::Error::to_kernel_errno
    |-- ld.lld:error:undefined-symbol:kernel::print::call_printk
    |-- ld.lld:error:undefined-symbol:kernel::print::format_strings::INFO
    `-- ld.lld:error:undefined-symbol:rust_fmt_argument

elapsed time: 735m

configs tested: 65
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
i386                                defconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
i386                 randconfig-a003-20220926
s390                                defconfig
x86_64               randconfig-a002-20220926
i386                 randconfig-a006-20220926
x86_64                           rhel-8.3-kvm
i386                 randconfig-a005-20220926
x86_64               randconfig-a004-20220926
arm                                 defconfig
s390                             allyesconfig
arc                  randconfig-r043-20220928
x86_64                           allyesconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64               randconfig-a001-20220926
m68k                             allmodconfig
arm                              allyesconfig
mips                             allyesconfig
x86_64               randconfig-a003-20220926
arm64                            allyesconfig
x86_64               randconfig-a005-20220926
x86_64               randconfig-a006-20220926
arc                              allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a014-20220926
hexagon              randconfig-r041-20220928
x86_64               randconfig-a016-20220926
i386                 randconfig-a012-20220926
x86_64               randconfig-a013-20220926
riscv                randconfig-r042-20220928
hexagon              randconfig-r045-20220928
s390                 randconfig-r044-20220928
x86_64               randconfig-a011-20220926
x86_64                          rhel-8.3-rust
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
