Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B4688284
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 16:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FACF10E1E1;
	Thu,  2 Feb 2023 15:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795CF10E1E1;
 Thu,  2 Feb 2023 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675351912; x=1706887912;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=1hiGSI7yYJkj7zXJb3P5ImKWY0yPb5nCR7lnpVL9118=;
 b=EACGJJ5DwXu48TQtdGjzhYFIsPmBL7z5hov3ZFigA1ll599UtrV5P3IJ
 6PRZeRwRzx6COW4Bl+XLdN8W4DFhL7A2CI4SoPFLdHJ1z2YFAr6VKoSQO
 KhntZhrrVn3nQm9juWhVSwEY6uNqpEIRvuCuSzPfycUy8BVevBAQ6C5r9
 viojQ1NoHwzCMkeETZegTN+yBoshw6MQzESOd/Q326pTJsIYAJgj/CpTr
 1DhSTgD1Wrzeqy8mGQ0+yMXLrR/jnflHrFOazXop82IM0kq0+k1JKya94
 hvppogjBJj4eeLoCTPC0yMolV96d8qtVt5PCMqfX3/Tpj/9hyKqE+466H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="393055060"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="393055060"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 07:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="667316707"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="667316707"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 02 Feb 2023 07:26:36 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNbTv-0006cC-17;
 Thu, 02 Feb 2023 15:26:35 +0000
Date: Thu, 02 Feb 2023 23:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf
Message-ID: <63dbd5f9.EHwMUB1NksMSVh+v%lkp@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-msm@vger.kernel.org, kasan-dev@googlegroups.com,
 kvmarm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf  Add linux-next specific files for 20230202

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301301801.y5O08tQx-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301302110.mEtNwkBD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310227.SeMvYeta-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310939.TAgCOEZb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302021325.700zGa0M-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
arch/arm64/kvm/arm.c:2206: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6: warning: no previous prototype for 'link_dp_trace_set_edp_power_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6: warning: no previous prototype for function 'link_dp_trace_set_edp_power_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:158:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweron_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:158:10: warning: no previous prototype for function 'link_dp_trace_get_edp_poweron_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:163:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweroff_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:163:10: warning: no previous prototype for function 'link_dp_trace_get_edp_poweroff_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1295:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:279:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
drivers/gpu/host1x/dev.c:521:10: warning: variable 'syncpt_irq' is uninitialized when used here [-Wuninitialized]
ftrace-ops.c:(.init.text+0x2c3): undefined reference to `__udivdi3'
mm/kasan/report.c:272:44: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/media/i2c/max9286.c:802 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32
drivers/nvmem/imx-ocotp.c:599:21: sparse: sparse: symbol 'imx_ocotp_layout' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:106:40: sparse: sparse: symbol 'tsens_9607_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:26:40: sparse: sparse: symbol 'tsens_8916_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:42:40: sparse: sparse: symbol 'tsens_8939_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:62:40: sparse: sparse: symbol 'tsens_8974_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:84:40: sparse: sparse: symbol 'tsens_8974_backup_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:24:40: sparse: sparse: symbol 'tsens_qcs404_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:45:40: sparse: sparse: symbol 'tsens_8976_nvmem' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- alpha-randconfig-r026-20230129
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- alpha-randconfig-s052-20230129
|   |-- drivers-nvmem-imx-ocotp.c:sparse:sparse:symbol-imx_ocotp_layout-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8916_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8939_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8974_backup_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8974_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_9607_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v1.c:sparse:sparse:symbol-tsens_8976_nvmem-was-not-declared.-Should-it-be-static
|   `-- drivers-thermal-qcom-tsens-v1.c:sparse:sparse:symbol-tsens_qcs404_nvmem-was-not-declared.-Should-it-be-static
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-allyesconfig
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-buildonly-randconfig-r004-20230130
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
clang_recent_errors
|-- arm-randconfig-r033-20230129
|   |-- drivers-gpu-host1x-dev.c:warning:variable-syncpt_irq-is-uninitialized-when-used-here
|   `-- mm-kasan-report.c:warning:format-specifies-type-unsigned-long-but-the-argument-has-type-size_t-(aka-unsigned-int-)
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-function-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-function-link_dp_trace_get_edp_poweron_timestamp
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-function-link_dp_trace_set_edp_power_timestamp
`-- powerpc-randconfig-r015-20230130
    `-- mm-kasan-report.c:warning:format-specifies-type-unsigned-long-but-the-argument-has-type-size_t-(aka-unsigned-int-)

elapsed time: 723m

configs tested: 67
configs skipped: 3

gcc tested configs:
x86_64                            allnoconfig
x86_64               randconfig-a001-20230130
i386                 randconfig-a002-20230130
x86_64               randconfig-a003-20230130
i386                 randconfig-a001-20230130
x86_64               randconfig-a004-20230130
um                             i386_defconfig
x86_64               randconfig-a002-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
x86_64               randconfig-a006-20230130
um                           x86_64_defconfig
i386                 randconfig-a005-20230130
x86_64               randconfig-a005-20230130
i386                 randconfig-a006-20230130
arc                                 defconfig
m68k                             allmodconfig
alpha                            allyesconfig
s390                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
powerpc                          allmodconfig
s390                             allyesconfig
x86_64                              defconfig
mips                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20230129
arm                                 defconfig
arm                  randconfig-r046-20230129
i386                                defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
x86_64                           rhel-8.3-bpf
arm                              allyesconfig
x86_64                           allyesconfig
i386                             allyesconfig

clang tested configs:
x86_64               randconfig-a012-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64                          rhel-8.3-rust
x86_64               randconfig-a016-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
hexagon              randconfig-r045-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a016-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129
s390                 randconfig-r044-20230130
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
