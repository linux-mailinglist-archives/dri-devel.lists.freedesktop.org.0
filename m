Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779166833C0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F93D10E378;
	Tue, 31 Jan 2023 17:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BB410E2A7;
 Tue, 31 Jan 2023 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675185731; x=1706721731;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=bpvJgwwe71sy+pvgY/I6hCatJa+6nAncMTfShycDUFo=;
 b=UAC7P6616YNkbornukrK2ujkgX6tyvQGAZ/4RPL2KzYp4BvG0XJcK7y9
 vs7KOQxHmaO4bMPjR/JwCmFp8nGdwoTk4NXubjrNjNVnj4cBqxcu8L9wi
 soAIVEWvN5KN1tIeTohh0M/HgBRaQCP7a59zW4e9c0ST2DCuYuytFSoUA
 sGMiQFv6c4xu7wzX6ODyDx7Zb7FCNyR0JpZV+StOH7fJ8qBF7d2seyiF3
 7aMxswORNii1JGNe6KNYTEmPDKlzhXANSQhM84FJ79WR9fLkrSrgZ2A7P
 VYJTcCuoLcOhgr/6y/NSbFdGzWpgsn7MNWVp2HT/S5io2kgS65gJ2bh0j Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355228113"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="355228113"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 09:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="728019117"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="728019117"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2023 09:22:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pMuKb-0004a6-2P;
 Tue, 31 Jan 2023 17:22:05 +0000
Date: Wed, 01 Feb 2023 01:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 80bd9028fecadae4e8e3a278cd32d74badc2a6e0
Message-ID: <63d94e2e.jzxGzbcXl36Z5WOi%lkp@intel.com>
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
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 80bd9028fecadae4e8e3a278cd32d74badc2a6e0  Add linux-next specific files for 20230131

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301230743.Xnut0Zvc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301300743.bp7Dpazv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301301801.y5O08tQx-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301302110.mEtNwkBD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310227.SeMvYeta-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310939.TAgCOEZb-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/riscv/uabi.rst:24: WARNING: Enumerated list ends without a blank line; unexpected unindent.
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
arch/arm64/kvm/arm.c:2206: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead
drivers/clk/qcom/gcc-sa8775p.c:313:32: warning: unused variable 'gcc_parent_map_10' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:318:37: warning: unused variable 'gcc_parent_data_10' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:333:32: warning: unused variable 'gcc_parent_map_12' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:338:37: warning: unused variable 'gcc_parent_data_12' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6: warning: no previous prototype for 'link_dp_trace_set_edp_power_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:158:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweron_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:163:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweroff_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1295:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:279:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
drivers/gpu/host1x/dev.c:520:6: warning: variable 'syncpt_irq' is uninitialized when used here [-Wuninitialized]
ftrace-ops.c:(.init.text+0x2cb): undefined reference to `__udivdi3'

Unverified Error/Warning (likely false positive, please contact us if interested):

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
|-- arm-randconfig-s032-20230129
|   `-- drivers-nvmem-imx-ocotp.c:sparse:sparse:symbol-imx_ocotp_layout-was-not-declared.-Should-it-be-static
|-- arm-randconfig-s041-20230129
|   `-- drivers-nvmem-imx-ocotp.c:sparse:sparse:symbol-imx_ocotp_layout-was-not-declared.-Should-it-be-static
|-- arm64-allyesconfig
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-buildonly-randconfig-r005-20230130
|   `-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|-- csky-randconfig-c44-20230131
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
clang_recent_errors
|-- arm-randconfig-r001-20230129
|   `-- drivers-gpu-host1x-dev.c:warning:variable-syncpt_irq-is-uninitialized-when-used-here
|-- mips-buildonly-randconfig-r006-20230129
|   |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_10
|   |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_12
|   |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_10
|   `-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_12
`-- mips-randconfig-r036-20230129
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_10
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_12
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_10
    `-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_12

elapsed time: 723m

configs tested: 69
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64               randconfig-a001-20230130
i386                                defconfig
s390                             allyesconfig
x86_64               randconfig-a003-20230130
powerpc                           allnoconfig
x86_64               randconfig-a004-20230130
i386                 randconfig-a002-20230130
x86_64               randconfig-a002-20230130
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a001-20230130
x86_64                          rhel-8.3-func
i386                 randconfig-a004-20230130
x86_64               randconfig-a006-20230130
i386                 randconfig-a003-20230130
x86_64                              defconfig
i386                 randconfig-a005-20230130
x86_64               randconfig-a005-20230130
ia64                             allmodconfig
i386                 randconfig-a006-20230130
x86_64                               rhel-8.3
i386                             allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20230129
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-bpf
arc                              allyesconfig
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
sh                               allmodconfig
arc                  randconfig-r043-20230130
i386                          randconfig-c001
mips                             allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a015-20230130
hexagon              randconfig-r041-20230129
x86_64               randconfig-a016-20230130
riscv                randconfig-r042-20230129
i386                 randconfig-a013-20230130
riscv                randconfig-r042-20230130
i386                 randconfig-a012-20230130
hexagon              randconfig-r045-20230130
i386                 randconfig-a014-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
i386                 randconfig-a015-20230130
i386                 randconfig-a011-20230130
s390                 randconfig-r044-20230129
i386                 randconfig-a016-20230130
s390                 randconfig-r044-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
