Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65365B63AF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 00:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBEB10E432;
	Mon, 12 Sep 2022 22:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0AF10E428;
 Mon, 12 Sep 2022 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663021659; x=1694557659;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=EBpU68xsLpcCQoQ5Ydg1RH2aVA+reCYJEVoDTaANPPA=;
 b=c2IoRZDV0fSmp/ebRLp+gu7WtBYjinbJlYysAkb53TP5X7Hbgh81T7np
 eGLhF1THDFHJtMUQiB7teMZRjJ6O1JhCmLLDkB40/5MV7foKymB7fsJ/D
 YqtPhupERF6vDwSCLgtWfH5CFMca74P7jFOebYEUFUp4Y72pwD/JmQ4Ui
 NbT+BT9HffcrDadXYk8ouaEKisz1Ta334MchanTyQsU80FiYxAC9xDjpM
 VSNgvjCx3TfVlX1nfnsxhtZZYSYA2gxgYrF65GuvBO3r2mCNXhx0XIEGn
 w9kCz+O0WVzoHzUADqKVtkaxvafeKpb6AgZq49tnW/5/7KFd5K7gv/P2d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="285004737"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="285004737"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 15:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="646659772"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 12 Sep 2022 15:27:33 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oXrts-0002w5-1D;
 Mon, 12 Sep 2022 22:27:32 +0000
Date: Tue, 13 Sep 2022 06:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 044b771be9c5de9d817dfafb829d2f049c71c3b4
Message-ID: <631fb230.qcoZqD19biA2J50w%lkp@intel.com>
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>, linux-gpio@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 044b771be9c5de9d817dfafb829d2f049c71c3b4  Add linux-next specific files for 20220912

Error/Warning reports:

https://lore.kernel.org/linux-media/202209020437.eXEOdmfe-lkp@intel.com
https://lore.kernel.org/linux-mm/202209042337.FQi69rLV-lkp@intel.com
https://lore.kernel.org/linux-mm/202209060229.dVuyxjBv-lkp@intel.com
https://lore.kernel.org/linux-mm/202209080718.y5QmlNKH-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "ioread64" [drivers/pci/switch/switchtec.ko] undefined!
drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c:139:6: warning: no previous prototype for 'imu_v11_0_3_program_rlc_ram' [-Wmissing-prototypes]
drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x9a'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xa1'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x95'
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/scsi/qla2xxx/qla_os.c:2854:25: error: implicit declaration of function 'trace_array_get_by_name'; did you mean 'trace_array_set_clr_event'? [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_os.c:2869:9: error: implicit declaration of function 'trace_array_put' [-Werror=implicit-function-declaration]
kernel/bpf/memalloc.c:499 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_get_by_name
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_put
|   |-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- alpha-randconfig-r005-20220911
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- alpha-randconfig-r033-20220911
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- alpha-randconfig-r035-20220911
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-axs101_defconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r016-20220912
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r032-20220912
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r043-20220911
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r043-20220912
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm-defconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-randconfig-c034-20220911
|   `-- net-bluetooth-mgmt.c:WARNING:kzalloc-should-be-used-for-rp-instead-of-kmalloc-memset
|-- arm-randconfig-r032-20220911
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm64-buildonly-randconfig-r002-20220912
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
clang_recent_errors
|-- arm64-randconfig-r011-20220912
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- hexagon-allyesconfig
|   |-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|   `-- drivers-staging-media-deprecated-cpia2-cpia2_usb.c:warning:variable-frame_count-set-but-not-used
|-- i386-randconfig-a012-20220912
|   `-- sound-soc-intel-skylake-skl.c:warning:unused-variable-skl
|-- i386-randconfig-a015-20220912
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- mips-randconfig-r021-20220911
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- powerpc-randconfig-r002-20220911
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-function-imu_v11_0_3_program_rlc_ram
|-- riscv-randconfig-r015-20220912
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
`-- riscv-randconfig-r042-20220912
    `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead

elapsed time: 724m

configs tested: 82
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64               randconfig-a001-20220912
arc                          axs101_defconfig
x86_64               randconfig-a002-20220912
i386                 randconfig-a001-20220912
x86_64                               rhel-8.3
x86_64               randconfig-a003-20220912
x86_64                          rhel-8.3-func
arm                           stm32_defconfig
alpha                            allyesconfig
sh                           se7724_defconfig
x86_64                           allyesconfig
arm                                 defconfig
alpha                             allnoconfig
i386                 randconfig-a002-20220912
x86_64                         rhel-8.3-kunit
riscv                             allnoconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a006-20220912
i386                 randconfig-a004-20220912
x86_64               randconfig-a004-20220912
csky                              allnoconfig
arc                               allnoconfig
sh                           se7705_defconfig
i386                                defconfig
i386                             allyesconfig
m68k                            q40_defconfig
i386                 randconfig-a003-20220912
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm                          iop32x_defconfig
x86_64               randconfig-a005-20220912
powerpc                           allnoconfig
m68k                             allyesconfig
riscv                randconfig-r042-20220911
arm                        trizeps4_defconfig
i386                 randconfig-a006-20220912
arc                  randconfig-r043-20220912
mips                             allyesconfig
sparc64                             defconfig
i386                 randconfig-a005-20220912
powerpc                          allmodconfig
arm64                            allyesconfig
sh                               allmodconfig
s390                          debug_defconfig
arm                              allyesconfig
arc                  randconfig-r043-20220911
s390                 randconfig-r044-20220911
ia64                             allmodconfig
sh                           sh2007_defconfig
sh                         ecovec24_defconfig
sh                               alldefconfig
sh                          rsk7269_defconfig

clang tested configs:
x86_64               randconfig-a011-20220912
x86_64               randconfig-a012-20220912
i386                 randconfig-a013-20220912
x86_64               randconfig-a013-20220912
i386                 randconfig-a011-20220912
x86_64               randconfig-a014-20220912
mips                           rs90_defconfig
arm                          pcm027_defconfig
x86_64               randconfig-a016-20220912
i386                 randconfig-a012-20220912
arm                          ixp4xx_defconfig
x86_64               randconfig-a015-20220912
i386                 randconfig-a014-20220912
arm                        vexpress_defconfig
i386                 randconfig-a015-20220912
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
i386                 randconfig-a016-20220912
hexagon              randconfig-r045-20220911
hexagon              randconfig-r041-20220911
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
