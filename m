Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D250B5FA2A7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5710E6A6;
	Mon, 10 Oct 2022 17:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A7010E6A4;
 Mon, 10 Oct 2022 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665422462; x=1696958462;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=M93sagOiE/afYlRfaYmB3FD+toccP4mfctXeQdrive4=;
 b=YTwI4Cdem4KArIZVURF4KhdTlX6KtV+deY5TQ+2dv2HI7sIKQ1nP5X7q
 w/7wiQxQeavoS0DlNIytuubKijW2kuXtL1NuY90VRyBM6FlXoO7dWaAaD
 WhHxCGqL1n/FSNr7RuLoKmwOhjq6ItdxUXdQf8yzau1vD6Xwedm9GGkiN
 jMW3t7egg6lz0XW9pRKtqHMO3Mn+0POaN5pL2VmpyeYcNeWeGW7qGZLZj
 12Sjqm4pmWlQqN86g8SAFqBmgggg9yu7GjETh2gmszV6vY/AR9Ofk23iT
 CegzVgHOiUSh79C3AAjbn8Vy8qxw3UMm8QV7sAiqikRBDhUvslKOpjMa5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="284666503"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="284666503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 10:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="577125185"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="577125185"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 10 Oct 2022 10:20:57 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ohwSX-00024U-0X;
 Mon, 10 Oct 2022 17:20:57 +0000
Date: Tue, 11 Oct 2022 01:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 cd9fd78f5c11b5e165d9317ef11e613f4aef4dd1
Message-ID: <6344544c.DxCKNhruy5lsz7YH%lkp@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, linux-parisc@vger.kernel.org,
 linux-iio@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-nvme@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: cd9fd78f5c11b5e165d9317ef11e613f4aef4dd1  Add linux-next specific files for 20221010

Error/Warning reports:

https://lore.kernel.org/linux-doc/202209201326.sY9kHOLm-lkp@intel.com
https://lore.kernel.org/linux-doc/202209231933.vcyETtUl-lkp@intel.com
https://lore.kernel.org/linux-doc/202210070057.NpbaMyxB-lkp@intel.com
https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/llvm/202209220019.Yr2VuXhg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Warning: Documentation/translations/zh_CN/devicetree/kernel-api.rst references a file that doesn't exist: Documentation/Devicetree/kernel-api.rst
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
arch/loongarch/mm/init.c:166:24: warning: variable 'new' set but not used [-Wunused-but-set-variable]
arch/parisc/kernel/setup.c:78 setup_cmdline() warn: curly braces intended?
drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:6: warning: no previous prototype for 'virtual_disable_link_output' [-Wmissing-prototypes]
drivers/iio/adc/mcp3911.c:252 mcp3911_write_raw() error: buffer overflow 'mcp3911_osr_table' 8 <= 31
drivers/iio/adc/mcp3911.c:499 mcp3911_probe() warn: passing zero to 'PTR_ERR'
drivers/nvme/target/loop.c:578 nvme_loop_create_ctrl() warn: 'opts->queue_size - 1' 18446744073709551615 can't fit into 65535 'ctrl->ctrl.sqsize'
drivers/nvme/target/loop.c:578 nvme_loop_create_ctrl() warn: 'opts->queue_size - 1' 4294967295 can't fit into 65535 'ctrl->ctrl.sqsize'
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_422' declared with attribute error: FIELD_GET: mask is not constant
include/linux/thread_info.h:217: undefined reference to `riscv_cbom_block_size'
riscv64-linux-ld: include/linux/thread_info.h:217: undefined reference to `riscv_cbom_block_size'
security/apparmor/policy_unpack.c:1089 unpack_profile() warn: passing zero to 'ERR_PTR'
security/apparmor/policy_unpack.c:548 unpack_trans_table() error: uninitialized symbol 'table'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r002-20221010
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- alpha-randconfig-r006-20221010
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arm64-randconfig-c043-20221010
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a011-20221010
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a012-20221010
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a014-20221010
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a016-20221010
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-c001-20221010
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:FIELD_GET:mask-is-not-constant
|-- i386-randconfig-c021-20221010
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-m021-20221010
|   |-- arch-x86-kernel-apic-apic.c-generic_processor_info()-warn:always-true-condition-(num_processors-()-)-(-u32max-)
|   |-- drivers-iio-adc-mcp3911.c-mcp3911_probe()-warn:passing-zero-to-PTR_ERR
|   |-- drivers-iio-adc-mcp3911.c-mcp3911_write_raw()-error:buffer-overflow-mcp3911_osr_table
|   |-- drivers-nvme-target-loop.c-nvme_loop_create_ctrl()-warn:opts-queue_size-can-t-fit-into-ctrl-ctrl.sqsize
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-s051-20221010
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- ia64-randconfig-r013-20221010
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- ia64-randconfig-s041-20221010
clang_recent_errors
|-- arm-sama7_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm64-randconfig-r004-20221010
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r041-20221010
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- i386-randconfig-a001-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a003-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a004-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a005-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-mpc512x_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-mpc834x_itxgp_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-mpc866_ads_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-mpc885_ads_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|-- powerpc-randconfig-r033-20221010
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a001-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a003-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a004-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-r031-20221010
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg

elapsed time: 733m

configs tested: 70
configs skipped: 27

gcc tested configs:
csky                              allnoconfig
arm                           imxrt_defconfig
i386                 randconfig-a012-20221010
sh                           sh2007_defconfig
arc                               allnoconfig
alpha                             allnoconfig
sh                                  defconfig
riscv                             allnoconfig
i386                 randconfig-a011-20221010
arc                  randconfig-r043-20221010
i386                 randconfig-a013-20221010
powerpc                     tqm8541_defconfig
m68k                       m5275evb_defconfig
xtensa                    xip_kc705_defconfig
x86_64               randconfig-a011-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a014-20221010
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a013-20221010
sh                          sdk7780_defconfig
x86_64               randconfig-a016-20221010
m68k                                defconfig
i386                 randconfig-a016-20221010
arm                       omap2plus_defconfig
x86_64               randconfig-a014-20221010
mips                          rb532_defconfig
x86_64               randconfig-a015-20221010
s390                 randconfig-r044-20221010
parisc64                         alldefconfig
parisc                generic-64bit_defconfig
arm                        oxnas_v6_defconfig
powerpc                 linkstation_defconfig
arm                         at91_dt_defconfig
nios2                         10m50_defconfig
nios2                            alldefconfig
powerpc                     ep8248e_defconfig
powerpc                    sam440ep_defconfig
powerpc                     sequoia_defconfig
i386                 randconfig-c001-20221010
arm                                 defconfig
i386                                defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
i386                             allyesconfig

clang tested configs:
x86_64               randconfig-a002-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a003-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a001-20221010
x86_64               randconfig-a006-20221010
i386                 randconfig-a006-20221010
hexagon              randconfig-r045-20221010
powerpc                     mpc512x_defconfig
x86_64               randconfig-a004-20221010
i386                 randconfig-a004-20221010
hexagon                             defconfig
arm                          collie_defconfig
x86_64               randconfig-a005-20221010
arm                       versatile_defconfig
hexagon              randconfig-r041-20221010
i386                 randconfig-a005-20221010
arm                           sama7_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        bcm63xx_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
