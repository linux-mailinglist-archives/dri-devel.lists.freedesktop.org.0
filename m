Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579A6EB7C1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 09:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1D610E1D6;
	Sat, 22 Apr 2023 07:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EE210E14B;
 Sat, 22 Apr 2023 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682147204; x=1713683204;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=sxreZmDDUaT72LSGhnBG6QD9h7BvypJDhUX8bjvx5q0=;
 b=TScNBl6MP73UMW36GQOvHT0u0ehLsdtYxeZDd6Emy0pFsoTYscycd+V8
 pKzeTmvlMDeZTBIvCjISeyZxaTHN51KFf4YJdx9ucC29pvl2DCZoByYU2
 m6bSGaqNRMvUBneE5qHmxgDbNzsYs8u9+JDO23Txj9h6rUiAnb2kLhpxb
 Vs8OO78Ho9xNlvzFPOYxzKvXnqWNBTAgsWtlza2QXHPEDrI6faO7vFRbx
 ma0/cyML3ZR/OFnMIlbTabcW4lIUOP5TROh+M7YXrZsB2lQnK2L7FIWqN
 p8cOi2qDndl9+wD6SXJQeeHK4gfs3lfnafcq2tG8DrZWtWYNUc6tqhB4u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330341498"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="330341498"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 00:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695169202"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="695169202"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 00:06:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pq7KP-000h9e-25;
 Sat, 22 Apr 2023 07:06:37 +0000
Date: Sat, 22 Apr 2023 15:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
Message-ID: <64438769.ga6diWEjDz6sL9Vg%lkp@intel.com>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89  Add linux-next specific files for 20230421

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304210303.nlMI0sRQ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304210349.DykCi88S-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304221358.uhQrT8FL-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:351:13: warning: variable 'bw_needed' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:352:25: warning: variable 'link' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:451:16: warning: variable 'j' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1072:6: warning: no previous prototype for 'gfx_v9_4_3_disable_gpa_mode' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1072:6: warning: no previous prototype for function 'gfx_v9_4_3_disable_gpa_mode' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: unused variable 'golden_settings_gc_9_4_3' [-Wunused-const-variable]
drivers/virt/fsl_hypervisor.c:799:52: error: too many arguments to function call, expected 2, have 3
fs/ext4/super.c:1262:13: warning: unused variable 'i' [-Wunused-variable]
fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
loongarch64-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x230): undefined reference to `__ltdf2'
nios2-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x564): undefined reference to `__gesf2'
nios2-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x584): undefined reference to `__ltsf2'
phy-mtk-hdmi-mt8195.c:(.text+0x21c): undefined reference to `__floatundidf'
phy-mtk-hdmi-mt8195.c:(.text+0x284): undefined reference to `__gedf2'
phy-mtk-hdmi-mt8195.c:(.text+0x550): undefined reference to `__floatunsisf'
qca8k-leds.c:(.rodata.cst4+0x2c): undefined reference to `devm_led_classdev_register_ext'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/acpi/property.c:985 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.
drivers/gpu/drm/i915/display/intel_psr.c:2865:0-23: WARNING: i915_edp_psr_debug_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init() warn: missing error code 'err'
drivers/gpu/host1x/dev.c:417 host1x_iommu_attach() warn: passing zero to 'ERR_PTR'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240 mtk_hdmi_pll_calc() warn: impossible condition '(tmds_clk < 1.483500e+02 * 1000000) => (0.000000e+00-1.844674e+19 < -1.786711e-113)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:242 mtk_hdmi_pll_calc() warn: always true condition '(tmds_clk >= 1.483500e+02 * 1000000) => (0-u64max >= -1.786711e-113)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:242 mtk_hdmi_pll_calc() warn: impossible condition '(tmds_clk < 2.967000e+02 * 1000000) => (0.000000e+00-1.844674e+19 < -4.419080e+60)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:244 mtk_hdmi_pll_calc() warn: always true condition '(tmds_clk >= 2.967000e+02 * 1000000) => (0-u64max >= -4.419080e+60)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298 mtk_hdmi_pll_calc() error: uninitialized symbol 'ret'.
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331 mtk_hdmi_pll_drv_setting() warn: always true condition '(pixel_clk >= 7.417500e+01 * 1000000) => (0-u32max >= -7.223985e-287)'
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:336 mtk_hdmi_pll_drv_setting() warn: impossible condition '(pixel_clk < 7.417500e+01 * 1000000) => (0.000000e+00-4.294967e+09 < -7.223985e-287)'
fs/ext4/super.c:4722 ext4_check_feature_compatibility() warn: bitwise AND condition is false here
fs/ext4/verity.c:316 ext4_get_verity_descriptor_location() error: uninitialized symbol 'desc_size_disk'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- alpha-randconfig-c034-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- alpha-randconfig-r032-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- arc-randconfig-r011-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- arm64-buildonly-randconfig-r003-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- i386-randconfig-a003
|   `-- fs-ext4-super.c:warning:unused-variable-i
|-- i386-randconfig-a014
|   `-- fs-ext4-super.c:warning:unused-variable-i
|-- i386-randconfig-c021
|   `-- fs-ext4-super.c:warning:unused-variable-i
|-- i386-randconfig-m021
|   `-- drivers-acpi-property.c-acpi_data_prop_read_single()-error:potentially-dereferencing-uninitialized-obj-.
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- loongarch-randconfig-r005-20230421
|   |-- loongarch64-linux-ld:phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__ltdf2
|   |-- phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__floatundidf
|   `-- phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__gedf2
|-- m68k-randconfig-r006-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- microblaze-randconfig-c032-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- mips-randconfig-m031-20230421
|   |-- drivers-gpu-host1x-context.c-host1x_memory_context_list_init()-warn:missing-error-code-err
|   |-- drivers-gpu-host1x-dev.c-host1x_iommu_attach()-warn:passing-zero-to-ERR_PTR
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_calc()-error:uninitialized-symbol-ret-.
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_calc()-warn:always-true-condition-(tmds_clk-.483500e-)-(-u64max-.786711e-)
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_calc()-warn:always-true-condition-(tmds_clk-.967000e-)-(-u64max-.419080e-)
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_calc()-warn:impossible-condition-(tmds_clk-.483500e-)-(.000000e-.844674e-.786711e-)
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_calc()-warn:impossible-condition-(tmds_clk-.967000e-)-(.000000e-.844674e-.419080e-)
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_drv_setting()-warn:always-true-condition-(pixel_clk-.417500e-)-(-u32max-.223985e-)
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8195.c-mtk_hdmi_pll_drv_setting()-warn:impossible-condition-(pixel_clk-.417500e-)-(.000000e-.294967e-.223985e-)
|   |-- fs-ext4-super.c-ext4_check_feature_compatibility()-warn:bitwise-AND-condition-is-false-here
|   `-- fs-ext4-verity.c-ext4_get_verity_descriptor_location()-error:uninitialized-symbol-desc_size_disk-.
|-- mips-randconfig-r022-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- nios2-buildonly-randconfig-r004-20230421
|   |-- nios2-linux-ld:phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__gesf2
|   |-- nios2-linux-ld:phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__ltsf2
|   `-- phy-mtk-hdmi-mt8195.c:(.text):undefined-reference-to-__floatunsisf
|-- parisc-randconfig-r004-20230421
|   `-- qca8k-leds.c:(.rodata.cst4):undefined-reference-to-devm_led_classdev_register_ext
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- powerpc-randconfig-r004-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- powerpc-randconfig-s043-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
|-- x86_64-randconfig-a002
|   `-- fs-ext4-super.c:warning:unused-variable-i
|-- x86_64-randconfig-c002
|   `-- drivers-gpu-drm-i915-display-intel_psr.c:WARNING:i915_edp_psr_debug_fops-should-be-defined-with-DEFINE_DEBUGFS_ATTRIBUTE
|-- x86_64-randconfig-m001
|   `-- drivers-acpi-property.c-acpi_data_prop_read_single()-error:potentially-dereferencing-uninitialized-obj-.
|-- x86_64-randconfig-s023
|   `-- fs-ext4-super.c:warning:unused-variable-i
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
    |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
    `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-gfx_v9_4_3_disable_gpa_mode
clang_recent_errors
|-- i386-randconfig-a002
|   `-- fs-ext4-super.c:warning:unused-variable-i
|-- powerpc-randconfig-r026-20230421
|   `-- drivers-virt-fsl_hypervisor.c:error:too-many-arguments-to-function-call-expected-have
|-- riscv-randconfig-r025-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-function-gfx_v9_4_3_disable_gpa_mode
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:unused-variable-golden_settings_gc_9_4_3
|-- s390-randconfig-r044-20230421
|   |-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:no-previous-prototype-for-function-gfx_v9_4_3_disable_gpa_mode
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:unused-variable-golden_settings_gc_9_4_3
|-- x86_64-randconfig-a012
|   `-- fs-ext4-super.c:warning:unused-variable-i
`-- x86_64-randconfig-a014
    `-- fs-ext4-super.c:warning:unused-variable-i

elapsed time: 721m

configs tested: 122
configs skipped: 9

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230421   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230421   gcc  
arc                  randconfig-r043-20230421   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r046-20230421   gcc  
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230421   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230421   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
ia64                             alldefconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r026-20230421   gcc  
ia64                 randconfig-r035-20230421   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230421   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r006-20230421   gcc  
m68k                 randconfig-r016-20230421   gcc  
m68k                 randconfig-r034-20230421   gcc  
m68k                 randconfig-r036-20230421   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze           randconfig-r012-20230421   gcc  
microblaze           randconfig-r021-20230421   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230421   clang
mips                 randconfig-r022-20230421   gcc  
mips                          rb532_defconfig   gcc  
nios2        buildonly-randconfig-r004-20230421   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230421   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r003-20230421   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc       buildonly-randconfig-r005-20230421   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r004-20230421   gcc  
powerpc              randconfig-r023-20230421   clang
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r025-20230421   clang
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230421   gcc  
sh                          r7780mp_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230421   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230421   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
