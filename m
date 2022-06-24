Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AD55A279
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCEE10F043;
	Fri, 24 Jun 2022 20:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F9710EFB3;
 Fri, 24 Jun 2022 20:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656102027; x=1687638027;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5yir5qsDWmJvpcLu8qopoQ2H2wrhCorETTzmzNRdNeU=;
 b=DfBSv5hImO05Cr0wbpMO6B2WHyt3SgHDsjYSl8D2J0crrNgFcCrw8NKr
 Ztfe//KKx8DB15UnvzjoXgXN31q8dJP1y2ZnWotprzZ7qkZYAwk2nAbKA
 92BSbGZKyjoLQ/s9pEm9v5rWxvFo2EEgXzMDJJf9i2EAag1ne+FbztCQ4
 1Z4Fw1sFfoZWog/mKLY3uwiJQuSnoE97d50+6H7D6db8yeN/4iTS3oIQA
 UXOtEo48VTfZC8Fh7BX0LRILO1NubvO0lE4z/P/et3fkEENtU2u8WD3kK
 A2b7Gf2fPgChPi4yIZI+NqlmagiRSglUilQ8m6vfkSsWKYBoTFTDC7gUO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="278629607"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="278629607"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 13:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="589124453"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 24 Jun 2022 13:20:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o4pmw-0004ff-Tx;
 Fri, 24 Jun 2022 20:20:22 +0000
Date: Sat, 25 Jun 2022 04:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 2f9cb3d3bd73fc2225d66aa8fcffb632ed3eb235
Message-ID: <62b61c74.3Kp+9QDweGyj9KVR%lkp@intel.com>
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
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, ntb@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 2f9cb3d3bd73fc2225d66aa8fcffb632ed3eb235  Add linux-next specific files for 20220624

Error/Warning reports:

https://lore.kernel.org/llvm/202206221813.Dn1s6uuh-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/interrupt.c:542:55: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1025:33: warning: variable 'pre_connection_type' set but not used [-Wunused-but-set-variable]
drivers/ntb/test/ntb_perf.c:1145: undefined reference to `__umoddi3'
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for function 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for function 'pci_write' [-Wmissing-prototypes]
include/linux/fs.h:1656: warning: expecting prototype for i_gid_into_mnt(). Prototype was for i_gid_into_vfsgid() instead

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/net/pcs/pcs-xpcs.c:1031: undefined reference to `phylink_mii_c22_pcs_decode_state'
drivers/net/pcs/pcs-xpcs.c:832: undefined reference to `phylink_mii_c22_pcs_encode_advertisement'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-randconfig-m031-20220624
|   |-- drivers-gpu-drm-vc4-vc4_perfmon.c-vc4_perfmon_get()-warn:variable-dereferenced-before-check-perfmon-(see-line-)
|   `-- drivers-gpu-drm-vc4-vc4_perfmon.c-vc4_perfmon_get_values_ioctl()-warn:variable-dereferenced-before-check-perfmon-(see-line-)
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm64-buildonly-randconfig-r004-20220624
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- i386-allnoconfig
|   `-- include-linux-fs.h:warning:expecting-prototype-for-i_gid_into_mnt().-Prototype-was-for-i_gid_into_vfsgid()-instead
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-randconfig-a001
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-randconfig-a005
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-randconfig-m021
|   `-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- microblaze-randconfig-r006-20220624
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-ntb-test-ntb_perf.c:undefined-reference-to-__umoddi3
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- nios2-randconfig-r016-20220624
|   |-- drivers-net-pcs-pcs-xpcs.c:undefined-reference-to-phylink_mii_c22_pcs_decode_state
|   `-- drivers-net-pcs-pcs-xpcs.c:undefined-reference-to-phylink_mii_c22_pcs_encode_advertisement
|-- powerpc-allmodconfig
|   |-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allnoconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-asp8347_defconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-mpc834x_mds_defconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-randconfig-r002-20220624
|   `-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-randconfig-r032-20220624
|   `-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- sh-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- sparc-randconfig-r011-20220624
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- x86_64-randconfig-a002
|   |-- pcs-xpcs.c:(.text):undefined-reference-to-phylink_mii_c22_pcs_decode_state
|   `-- pcs-xpcs.c:(.text):undefined-reference-to-phylink_mii_c22_pcs_encode_advertisement
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
    |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
    `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3

clang_recent_errors
|-- hexagon-randconfig-r001-20220624
|   `-- drivers-ufs-host-tc-dwc-g210-pltfrm.c:warning:unused-variable-tc_dwc_g210_pltfm_match
`-- x86_64-allyesconfig
    |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-function-pci_read
    `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-function-pci_write

elapsed time: 728m

configs tested: 84
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
powerpc                     asp8347_defconfig
mips                           ip32_defconfig
s390                          debug_defconfig
sparc                            allyesconfig
openrisc                  or1klitex_defconfig
sh                                  defconfig
m68k                          multi_defconfig
sh                      rts7751r2d1_defconfig
xtensa                       common_defconfig
microblaze                          defconfig
arm                          iop32x_defconfig
arm                        realview_defconfig
arm                        keystone_defconfig
m68k                         apollo_defconfig
parisc64                            defconfig
arm                       aspeed_g5_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
i386                              debian-10.3
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
powerpc                           allnoconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220624
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                                 defconfig
powerpc                     ksi8560_defconfig
powerpc                       ebony_defconfig
powerpc                     kilauea_defconfig
powerpc                     kmeter1_defconfig
x86_64                           allyesconfig
arm                           omap1_defconfig
arm                         s3c2410_defconfig
powerpc                      walnut_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      pmac32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220624
riscv                randconfig-r042-20220624
hexagon              randconfig-r041-20220624
s390                 randconfig-r044-20220624

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
