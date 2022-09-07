Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DE5AF8E5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 02:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B08210E057;
	Wed,  7 Sep 2022 00:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FE710E057;
 Wed,  7 Sep 2022 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662509457; x=1694045457;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5VL1HdoAlQpX/wJgCDQycSomzAIMxMiV5IkyN0016so=;
 b=dhIPvwufq41j6iFqhlpLKFLotQUHfpKb8hKBLnUwNKJvs0o7uyZv3cN1
 lCINu3dhmz4c6HO9DvextMOVPbhiVbAaBYEOjpv4KFF/ssVe4MpZhfpan
 7fOQRjdkBCgVmjFssbci5eUQF8cRYRljYQp7+1Gf2S6RTucspacqx94ar
 zXkBJGF+6/2FEa201N0DSRcH4HBJc4j9EOnnuf0czFFH0vFktq0OipcVZ
 zf3I6W57OWCdZCyaOKhbION9tRjTNpzwMkro5PtOZUHtZNlRhexHgpRjH
 mrMnfWipOnwcLTsSxoFEzfdPCMpW43k7IOVCgDrdy6icGpPED7eXyGE/9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="296740852"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="296740852"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 17:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="647424580"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 06 Sep 2022 17:10:53 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oViea-0005oX-0t;
 Wed, 07 Sep 2022 00:10:52 +0000
Date: Wed, 07 Sep 2022 08:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 840126e36e8ff272cb63158646433fa1324533d9
Message-ID: <6317e168.JCyIK4idIjFsweBL%lkp@intel.com>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 840126e36e8ff272cb63158646433fa1324533d9  Add linux-next specific files for 20220906

Error/Warning reports:

https://lore.kernel.org/linux-mm/202209021204.DcLzOllr-lkp@intel.com
https://lore.kernel.org/linux-mm/202209042337.FQi69rLV-lkp@intel.com
https://lore.kernel.org/linux-mm/202209060229.dVuyxjBv-lkp@intel.com
https://lore.kernel.org/linux-mm/202209070728.o3stvgVt-lkp@intel.com
https://lore.kernel.org/llvm/202208312208.HjwleIeN-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
arm-linux-gnueabi-ld: vkms_formats.c:(.text+0x1e98): undefined reference to `__divdi3'
drivers/base/regmap/regmap-mmio.c:221:17: error: implicit declaration of function 'writesb'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:224:17: error: implicit declaration of function 'writesw'; did you mean 'writew'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:227:17: error: implicit declaration of function 'writesl'; did you mean 'writel'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writesl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:358:17: error: implicit declaration of function 'readsb'; did you mean 'readb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:361:17: error: implicit declaration of function 'readsw'; did you mean 'readw'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:364:17: error: implicit declaration of function 'readsl'; did you mean 'readl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c:139:6: warning: no previous prototype for 'imu_v11_0_3_program_rlc_ram' [-Wmissing-prototypes]
drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead
drivers/gpu/drm/vkms/vkms_formats.c:(.text+0x4b0): undefined reference to `__divdi3'
drivers/gpu/drm/vkms/vkms_formats.c:259: undefined reference to `__divdi3'
drivers/gpu/drm/vkms/vkms_plane.c:105 vkms_plane_atomic_update() warn: variable dereferenced before check 'fb' (see line 103)
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
include/linux/string.h:303:42: warning: 'strnlen' specified bound 4 exceeds source size 3 [-Wstringop-overread]
kernel/bpf/memalloc.c:344 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
ld: drivers/gpu/drm/vkms/vkms_formats.c:260: undefined reference to `__divdi3'
ld: vkms_formats.c:(.text+0x47f): undefined reference to `__divdi3'
mips-linux-ld: vkms_formats.c:(.text+0x384): undefined reference to `__divdi3'
mips-linux-ld: vkms_formats.c:(.text.argb_u16_to_RGB565+0xd0): undefined reference to `__divdi3'
mipsel-linux-ld: drivers/gpu/drm/vkms/vkms_formats.c:(.text+0x4d8): undefined reference to `__divdi3'
sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
vkms_formats.c:(.text+0x455): undefined reference to `__divdi3'
vkms_formats.c:(.text.argb_u16_to_RGB565+0xb0): undefined reference to `__divdi3'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/usb/host/ehci-atmel.c:28:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-exynos.c:35:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-npcm7xx.c:27:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-orion.c:68:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-platform.c:56:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ehci-spear.c:27:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]
drivers/usb/host/ohci-platform.c:44:19: warning: unused variable 'hcd_name' [-Wunused-const-variable]

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
|   `-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|-- alpha-buildonly-randconfig-r001-20220906
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- arm-randconfig-r006-20220906
|   |-- ERROR:__aeabi_ldivmod-drivers-gpu-drm-vkms-vkms.ko-undefined
|   `-- ERROR:__aeabi_uldivmod-drivers-gpu-drm-vkms-vkms.ko-undefined
|-- arm-randconfig-r013-20220905
|   `-- arm-linux-gnueabi-ld:vkms_formats.c:(.text):undefined-reference-to-__divdi3
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- csky-randconfig-r006-20220906
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- csky-randconfig-s031-20220906
|   |-- ERROR:__divdi3-drivers-gpu-drm-vkms-vkms.ko-undefined
|   `-- kernel-exit.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-struct-sighand_struct-sighand-got-struct-sighand_struct-noderef-__rcu-sighand
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|-- i386-randconfig-a001
|   |-- drivers-usb-host-ehci-platform.c:warning:hcd_name-defined-but-not-used
|   `-- drivers-usb-host-ohci-platform.c:warning:hcd_name-defined-but-not-used
|-- i386-randconfig-a003
|   |-- ERROR:__divdi3-drivers-gpu-drm-vkms-vkms.ko-undefined
|   `-- ERROR:__udivdi3-drivers-gpu-drm-vkms-vkms.ko-undefined
|-- i386-randconfig-a012
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:undefined-reference-to-__divdi3
|   `-- ld:drivers-gpu-drm-vkms-vkms_formats.c:undefined-reference-to-__divdi3
|-- i386-randconfig-a014
|   |-- ld:vkms_formats.c:(.text):undefined-reference-to-__divdi3
clang_recent_errors
|-- arm64-randconfig-r005-20220906
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-function-imu_v11_0_3_program_rlc_ram
|-- hexagon-randconfig-r001-20220906
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- hexagon-randconfig-r045-20220907
|   |-- drivers-usb-host-ehci-exynos.c:warning:unused-variable-hcd_name
|   |-- drivers-usb-host-ehci-npcm7xx.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ehci-orion.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a002
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- i386-randconfig-a011
|   |-- drivers-usb-host-ehci-platform.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ohci-platform.c:warning:unused-variable-hcd_name
|-- i386-randconfig-a015
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- riscv-randconfig-r004-20220906
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-function-imu_v11_0_3_program_rlc_ram
|-- riscv-randconfig-r042-20220907
|   |-- drivers-usb-host-ehci-atmel.c:warning:unused-variable-hcd_name
|   `-- drivers-usb-host-ehci-spear.c:warning:unused-variable-hcd_name
|-- s390-randconfig-r036-20220906
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:call-to-undeclared-function-trace_array_get_by_name-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:call-to-undeclared-function-trace_array_put-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-scsi-qla2xxx-qla_os.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-trace_array-from-int
|-- x86_64-randconfig-a003
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- x86_64-randconfig-a012
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
`-- x86_64-randconfig-a016
    `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead

elapsed time: 721m

configs tested: 64
configs skipped: 2

gcc tested configs:
arc                  randconfig-r043-20220906
riscv                randconfig-r042-20220906
um                           x86_64_defconfig
s390                 randconfig-r044-20220906
um                             i386_defconfig
i386                          randconfig-a014
i386                          randconfig-a001
i386                          randconfig-a012
i386                                defconfig
i386                          randconfig-a016
i386                          randconfig-a003
m68k                             allmodconfig
i386                          randconfig-a005
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
x86_64                        randconfig-a004
ia64                             allmodconfig
arm                              allyesconfig
microblaze                      mmu_defconfig
openrisc                         alldefconfig
arm                          pxa3xx_defconfig
sh                          r7785rp_defconfig
sh                     sh7710voipgw_defconfig
arm64                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
sh                               allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
