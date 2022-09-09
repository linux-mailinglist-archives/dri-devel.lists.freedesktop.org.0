Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526D5B2967
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 00:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A4810E77D;
	Thu,  8 Sep 2022 22:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33D910E77D;
 Thu,  8 Sep 2022 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662676657; x=1694212657;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Wg50WZaCdnHgKFNnF024mSmECqYSVjQXtdakITNd+0g=;
 b=TYO+uoPOlBYx3b0gx3SV4VwkQj7/J1sVxZyAuDW6/WaGYiE4CBha924/
 ymKGtZzqMWk9KRvBf8lua6MQ3GapFDlFO9hgA6Tvwfs5KIGiSsW5/NUFQ
 TCoPQC9t/IC7udALlQXpDvl15pNvBJWhzbvjCaGDqGFwZKZPoDK+MFjW/
 P0ol1uxp8sMTszhmFEiLvUh/zX10qmBhDc4Tq5+DXukaIHiiN9aZu5jy8
 83MMkXU8RSYr9D0ER3oOYf0Ic8Lg+er8Y5WPnRhOpCkYQa3Z5KsqxLgFW
 9H1sfdu1KiUQmM6WISoY/r0+AFYVT7qucRew19Me3DMifXzZTaQzZKXhU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323542152"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="323542152"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 15:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="615060039"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 08 Sep 2022 15:37:33 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oWQ9N-0000Nt-0V;
 Thu, 08 Sep 2022 22:37:33 +0000
Date: Fri, 09 Sep 2022 06:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 47c191411b68a771261be3dc0bd6f68394cef358
Message-ID: <631a6e9c.D4HRv8SAAnTyu/QX%lkp@intel.com>
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
Cc: alsa-devel@alsa-project.org, amd-gfx@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com,
 linux-gpio@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 47c191411b68a771261be3dc0bd6f68394cef358  Add linux-next specific files for 20220908

Error/Warning reports:

https://lore.kernel.org/linux-mm/202209042337.FQi69rLV-lkp@intel.com
https://lore.kernel.org/linux-mm/202209080718.y5QmlNKH-lkp@intel.com
https://lore.kernel.org/llvm/202209090343.JPAFJt74-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
arm-linux-gnueabi-ld: vkms_formats.c:(.text+0x824): undefined reference to `__aeabi_ldivmod'
drivers/base/regmap/regmap-mmio.c:222:17: error: implicit declaration of function 'writesb'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:225:17: error: implicit declaration of function 'writesw'; did you mean 'writew'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:228:17: error: implicit declaration of function 'writesl'; did you mean 'writel'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:232:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:232:17: error: implicit declaration of function 'writesq'; did you mean 'writesl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:358:17: error: implicit declaration of function 'readsb'; did you mean 'readb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:361:17: error: implicit declaration of function 'readsw'; did you mean 'readw'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:364:17: error: implicit declaration of function 'readsl'; did you mean 'readl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
drivers/crypto/aspeed/aspeed-hace.c:133 aspeed_hace_probe() warn: platform_get_irq() does not return zero
drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c:139:6: warning: no previous prototype for 'imu_v11_0_3_program_rlc_ram' [-Wmissing-prototypes]
drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead
drivers/gpu/drm/vkms/vkms_formats.c:259: undefined reference to `__divdi3'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x9a'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xa1'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x95'
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/scsi/qla2xxx/qla_os.c:2854:25: error: implicit declaration of function 'trace_array_get_by_name'; did you mean 'trace_array_set_clr_event'? [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_os.c:2869:9: error: implicit declaration of function 'trace_array_put' [-Werror=implicit-function-declaration]
fs/btrfs/volumes.c:6549 __btrfs_map_block() error: we previously assumed 'mirror_num_ret' could be null (see line 6376)
ld: drivers/gpu/drm/vkms/vkms_formats.c:260: undefined reference to `__divdi3'
ld: vkms_formats.c:(.text+0x362): undefined reference to `__divdi3'
ld: vkms_formats.c:(.text+0x3b2): undefined reference to `__divdi3'
ld: vkms_formats.c:(.text+0x3ba): undefined reference to `__divdi3'
ld: vkms_formats.c:(.text+0x47f): undefined reference to `__divdi3'
mips-linux-ld: vkms_formats.c:(.text.argb_u16_to_RGB565+0xd0): undefined reference to `__divdi3'
mm/kasan/kasan_test_module.c:90:26: sparse:    struct kasan_rcu_info *
mm/kasan/kasan_test_module.c:90:26: sparse:    struct kasan_rcu_info [noderef] __rcu *
sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
vkms_formats.c:(.text+0x266): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x338): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x388): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x390): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x455): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x804): undefined reference to `__aeabi_ldivmod'
vkms_formats.c:(.text.argb_u16_to_RGB565+0xb0): undefined reference to `__divdi3'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_get_by_name
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_put
|   |-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- alpha-randconfig-r013-20220907
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- alpha-randconfig-r034-20220907
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-randconfig-r003-20220907
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r026-20220907
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-randconfig-s033-20220907
|   |-- kernel-bpf-hashtab.c:sparse:sparse:cast-removes-address-space-__percpu-of-expression
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-noderef-__percpu-assigned-pptr-got-void
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-ptr_to_pptr-got-void-noderef-__percpu-assigned-pptr
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void-pptr
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-pptr-got-void-noderef-__percpu
|   `-- kernel-exit.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-struct-sighand_struct-sighand-got-struct-sighand_struct-noderef-__rcu-sighand
clang_recent_errors
|-- i386-randconfig-a002
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- i386-randconfig-a006
|   `-- ld.lld:error:undefined-symbol:__udivdi3
|-- i386-randconfig-a013
|   `-- ld.lld:error:undefined-symbol:__udivdi3
|-- i386-randconfig-a015
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- powerpc-randconfig-r021-20220907
|   |-- arch-powerpc-math-emu-fre.c:warning:no-previous-prototype-for-function-fre
|   |-- arch-powerpc-math-emu-frsqrtes.c:warning:no-previous-prototype-for-function-frsqrtes
|   |-- arch-powerpc-math-emu-fsqrt.c:warning:no-previous-prototype-for-function-fsqrt
|   |-- arch-powerpc-math-emu-fsqrts.c:warning:no-previous-prototype-for-function-fsqrts
|   |-- arch-powerpc-math-emu-mtfsf.c:warning:no-previous-prototype-for-function-mtfsf
|   `-- arch-powerpc-math-emu-mtfsfi.c:warning:no-previous-prototype-for-function-mtfsfi
|-- x86_64-randconfig-a003
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- x86_64-randconfig-a012
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
`-- x86_64-randconfig-a016
    `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead

elapsed time: 734m

configs tested: 75
configs skipped: 4

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
x86_64                        randconfig-a011
powerpc                           allnoconfig
arc                              allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a014
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a013
i386                                defconfig
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a003
x86_64                        randconfig-a006
arc                  randconfig-r043-20220908
x86_64                        randconfig-a004
i386                          randconfig-a005
arm                                 defconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
i386                             allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220907
i386                          randconfig-c001
s390                 randconfig-r044-20220908
riscv                randconfig-r042-20220908
x86_64                           allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
m68k                       m5275evb_defconfig
sh                         ap325rxa_defconfig
arm                        cerfcube_defconfig
powerpc                         wii_defconfig
xtensa                  cadence_csp_defconfig
arm                        mvebu_v7_defconfig

clang tested configs:
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a014
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220907
i386                          randconfig-a015
hexagon              randconfig-r041-20220908
i386                          randconfig-a006
i386                          randconfig-a004
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220908
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                          rhel-8.3-rust
powerpc                        icon_defconfig
arm                       spear13xx_defconfig
arm                         palmz72_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
