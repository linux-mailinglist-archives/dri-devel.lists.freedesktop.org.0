Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826C6F7B34
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 04:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E341F10E18E;
	Fri,  5 May 2023 02:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC9E10E18E;
 Fri,  5 May 2023 02:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683254934; x=1714790934;
 h=date:from:to:cc:subject:message-id;
 bh=qn89V4Emd/8E6BltukrzYp0YvboKoRFlLq7PUU5Jhd8=;
 b=T3nKwEdFOwhu4ZlLqXzXGLEvIQ++lN9c/96ZmZU335HDUxt1CDY1hVE3
 MuqzxtV+gv4nnstCTBJPzdFAb9uZpPzspL2U+dhrvyu9HXBe6t0ZjJSTN
 L32DrAAlCtmoKjvV2xaeKoLJHOMKFgA9+gy7BehPd7BA/0P4t2uCmhCuJ
 +t7QWypsDR7Wimb6yZ68wgh9AHOPWQrZnalLZyy9Fg73YNXCA5DEpvoBe
 fKrqPwajNM63VRskwcvbGSeI0Dz+PsWUv/N9yPKrWfxV0347h43g+QGzz
 pi+7xUri3idGT3PLLJYmhzMe2KGVjlVthnBesEzDA536TiJIVTKzaSw5Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="346586513"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="346586513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 19:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="841483938"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="841483938"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2023 19:48:50 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pulV3-00002D-0Z;
 Fri, 05 May 2023 02:48:49 +0000
Date: Fri, 05 May 2023 10:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 145e5cddfe8b4bf607510b2dcf630d95f4db420f
Message-ID: <20230505024758.umVTa%lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: linux-bluetooth@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 145e5cddfe8b4bf607510b2dcf630d95f4db420f  Add linux-next specific files for 20230504

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304102354.Q4VOXGTE-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304220119.94Pw6YsD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304230014.YbScpx20-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304250419.YtCLtUhG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202305042329.Gyk53keD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202305050237.1cQ4fBKs-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or directory
drivers/accel/habanalabs/gaudi/gaudi.c:117:19: warning: unused variable 'gaudi_irq_name' [-Wunused-const-variable]
drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
drivers/bluetooth/btnxpuart.c:1332:34: warning: unused variable 'nxpuart_of_match_table' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6339:6: warning: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6395:21: warning: variable 'count' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:494:13: warning: variable 'j' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: unused variable 'golden_settings_gc_9_4_3' [-Wunused-const-variable]
drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:62: warning: wrong kernel-doc identifier on line:
drivers/gpu/drm/i915/i915_pmu.h:41: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/i915/i915_request.h:176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/i915/i915_vma.h:145: warning: expecting prototype for i915_vma_offset(). Prototype was for i915_vma_size() instead
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
mm/gup.c:2813:14: error: implicit declaration of function 'folio_fast_pin_allowed'; did you mean 'folio_test_pinned'? [-Werror=implicit-function-declaration]
mm/gup.c:2813:7: error: call to undeclared function 'folio_fast_pin_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
phy-mtk-hdmi-mt8195.c:(.text+0x186): undefined reference to `__floatundidf'
riscv64-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x198): undefined reference to `__ltdf2'
riscv64-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x1b8): undefined reference to `__gedf2'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/cpufreq/pcc-cpufreq.c: linux/platform_device.h is included more than once.
drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init() warn: missing error code 'err'
drivers/gpu/host1x/dev.c:417 host1x_iommu_attach() warn: passing zero to 'ERR_PTR'
fs/ext4/super.c:4722 ext4_check_feature_compatibility() warn: bitwise AND condition is false here

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- alpha-randconfig-r003-20230501
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arc-buildonly-randconfig-r001-20230430
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   `-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|-- arc-buildonly-randconfig-r002-20230502
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   `-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|-- arc-hsdk_defconfig
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   `-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|-- arc-randconfig-c043-20230430
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arc-randconfig-r035-20230501
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   `-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- csky-randconfig-r001-20230430
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-buildonly-randconfig-r001-20230502
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-randconfig-r032-20230501
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-buildonly-randconfig-r005-20230501
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-randconfig-r005-20230430
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- microblaze-randconfig-r031-20230501
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-buildonly-randconfig-r003-20230502
|   `-- mm-gup.c:error:implicit-declaration-of-function-folio_fast_pin_allowed
|-- mips-maltaup_xpa_defconfig
|   `-- mm-gup.c:error:implicit-declaration-of-function-folio_fast_pin_allowed
|-- mips-randconfig-s033-20230428
|   `-- mm-gup.c:error:implicit-declaration-of-function-folio_fast_pin_allowed
|-- openrisc-buildonly-randconfig-r004-20230430
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- openrisc-randconfig-m041-20230501
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   |-- drivers-gpu-host1x-context.c-host1x_memory_context_list_init()-warn:missing-error-code-err
|   |-- drivers-gpu-host1x-dev.c-host1x_iommu_attach()-warn:passing-zero-to-ERR_PTR
|   `-- fs-ext4-super.c-ext4_check_feature_compatibility()-warn:bitwise-AND-condition-is-false-here
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- riscv-randconfig-r042-20230504
|   |-- phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__floatundidf
|   |-- riscv64-linux-ld:phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__gedf2
|   `-- riscv64-linux-ld:phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__ltdf2
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- sparc64-randconfig-c003-20230430
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- um-allmodconfig
|   `-- arch-um-drivers-harddog_user.c:fatal-error:stdio.h:No-such-file-or-directory
|-- x86_64-allnoconfig
|   `-- drivers-cpufreq-pcc-cpufreq.c:linux-platform_device.h-is-included-more-than-once.
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- xtensa-buildonly-randconfig-r005-20230430
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:no-previous-prototype-for-amdgpu_dm_connector_funcs_force
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
`-- xtensa-buildonly-randconfig-r006-20230430
    `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
clang_recent_errors
|-- hexagon-randconfig-r035-20230430
|   `-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c:warning:variable-ret-is-uninitialized-when-used-here
|-- hexagon-randconfig-r045-20230504
|   `-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-i915-gt-uc-guc_capture_fwif.h:warning:wrong-kernel-doc-identifier-on-line:
|   |-- drivers-gpu-drm-i915-i915_pmu.h:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-i915-i915_request.h:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-i915-i915_vma.h:warning:expecting-prototype-for-i915_vma_offset().-Prototype-was-for-i915_vma_size()-instead
|-- mips-bcm63xx_defconfig
|   `-- mm-gup.c:error:call-to-undeclared-function-folio_fast_pin_allowed-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- s390-randconfig-r044-20230503
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:unused-variable-golden_settings_gc_9_4_3
|-- x86_64-randconfig-a016-20230501
|   `-- drivers-accel-habanalabs-gaudi-gaudi.c:warning:unused-variable-gaudi_irq_name
`-- x86_64-randconfig-r025-20230501
    `-- drivers-bluetooth-btnxpuart.c:warning:unused-variable-nxpuart_of_match_table

elapsed time: 733m

configs tested: 158
configs skipped: 17

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230430   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230501   gcc  
alpha                randconfig-r014-20230503   gcc  
alpha                randconfig-r033-20230430   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230430   gcc  
arc          buildonly-randconfig-r002-20230502   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r006-20230501   gcc  
arc                  randconfig-r022-20230501   gcc  
arc                  randconfig-r033-20230501   gcc  
arc                  randconfig-r034-20230501   gcc  
arc                  randconfig-r035-20230501   gcc  
arc                  randconfig-r043-20230503   gcc  
arc                  randconfig-r043-20230504   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                          moxart_defconfig   clang
arm                        neponset_defconfig   clang
arm                  randconfig-r003-20230430   clang
arm                  randconfig-r046-20230503   gcc  
arm                  randconfig-r046-20230504   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230502   clang
arm64                randconfig-r006-20230430   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230430   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r035-20230430   clang
hexagon              randconfig-r041-20230503   clang
hexagon              randconfig-r041-20230504   clang
hexagon              randconfig-r045-20230503   clang
hexagon              randconfig-r045-20230504   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230501   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230501   gcc  
i386                 randconfig-a002-20230501   gcc  
i386                 randconfig-a003-20230501   gcc  
i386                 randconfig-a004-20230501   gcc  
i386                 randconfig-a005-20230501   gcc  
i386                 randconfig-a006-20230501   gcc  
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230502   gcc  
ia64         buildonly-randconfig-r004-20230502   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r032-20230501   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230501   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230502   gcc  
loongarch            randconfig-r005-20230430   gcc  
loongarch            randconfig-r024-20230501   gcc  
m68k                             allmodconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k         buildonly-randconfig-r001-20230501   gcc  
m68k         buildonly-randconfig-r006-20230501   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r034-20230430   gcc  
microblaze           randconfig-r001-20230501   gcc  
microblaze           randconfig-r002-20230430   gcc  
microblaze           randconfig-r031-20230501   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips         buildonly-randconfig-r003-20230502   gcc  
mips                           ip27_defconfig   clang
mips                          rm200_defconfig   clang
nios2        buildonly-randconfig-r004-20230501   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230502   gcc  
nios2                randconfig-r024-20230430   gcc  
openrisc     buildonly-randconfig-r004-20230430   gcc  
openrisc             randconfig-r004-20230501   gcc  
openrisc             randconfig-r012-20230503   gcc  
parisc       buildonly-randconfig-r006-20230502   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc              randconfig-r031-20230430   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r036-20230430   gcc  
riscv                randconfig-r042-20230503   clang
riscv                randconfig-r042-20230504   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230503   clang
s390                 randconfig-r021-20230430   clang
s390                 randconfig-r044-20230503   clang
s390                 randconfig-r044-20230504   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230502   gcc  
sh                   randconfig-r022-20230430   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230501   gcc  
sparc                randconfig-r015-20230503   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230501   gcc  
x86_64               randconfig-a002-20230501   gcc  
x86_64               randconfig-a003-20230501   gcc  
x86_64               randconfig-a004-20230501   gcc  
x86_64               randconfig-a005-20230501   gcc  
x86_64               randconfig-a006-20230501   gcc  
x86_64               randconfig-a011-20230501   clang
x86_64               randconfig-a012-20230501   clang
x86_64               randconfig-a013-20230501   clang
x86_64               randconfig-a014-20230501   clang
x86_64               randconfig-a015-20230501   clang
x86_64               randconfig-a016-20230501   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r025-20230501   clang
x86_64               randconfig-r026-20230501   clang
x86_64               randconfig-r036-20230501   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230430   gcc  
xtensa       buildonly-randconfig-r006-20230430   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r005-20230502   gcc  
xtensa               randconfig-r032-20230430   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
