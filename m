Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F25572A0AC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9744910E159;
	Fri,  9 Jun 2023 16:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2420C10E159;
 Fri,  9 Jun 2023 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686329626; x=1717865626;
 h=date:from:to:cc:subject:message-id;
 bh=JAWK//mHu4QV1YFotj0qDhrypark3wKg/MHiFxQrmtg=;
 b=WpkCUXFeFnYKPjwbP5JtIrzjbA+7cmvsPZ657Bvi2dPK/1DIAtqdQf2O
 8IXinl5JgdKuawoBe2K31MLJHkXKexSi7IoaH+/tFneFnUHebmvPhkIUS
 56SRjc2Cki3NYwirtIh6kg0w8lzGAK/Hv3GHY2gBGYC2Jcbx6I5Gl8Qp1
 Ub0wOZvaz+nPXJtzAOYF7dB1eCHDmDu5V8P7kM+Knmag0b5bn1vLig4W+
 ipPSA9ajCLcAxkJQSq6iaSURu9XKaqlxRJNq0qeH+Ny1R4Gtossp3taMA
 3EPxOwusvngCXm/fAkfG5SHRoL0vhgFPn65XC0mVX2zu3hfdNTExRen+P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338000297"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="338000297"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 09:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957215847"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="957215847"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2023 09:53:37 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7fMm-0009Eo-0m;
 Fri, 09 Jun 2023 16:53:36 +0000
Date: Sat, 10 Jun 2023 00:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 53ab6975c12d1ad86c599a8927e8c698b144d669
Message-ID: <202306100045.iM5qbyCz-lkp@intel.com>
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
Cc: linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, linux-btrfs@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 53ab6975c12d1ad86c599a8927e8c698b144d669  Add linux-next specific files for 20230609

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306081708.gtVAcXsh-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306082341.UQtCM8PO-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306100035.VTusNhm4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306100056.Z3G9GUfT-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:113:17: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:147:17: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
drivers/leds/leds-cht-wcove.c:144:21: warning: no previous prototype for 'cht_wc_leds_brightness_get' [-Wmissing-prototypes]
drivers/scsi/FlashPoint.c:1712:12: warning: stack frame size (1056) exceeds limit (1024) in 'FlashPoint_HandleInterrupt' [-Wframe-larger-than]
include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
include/drm/drm_print.h:456:39: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
uvdevice.c:(.init.text+0x2e): undefined reference to `uv_info'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/net/ethernet/emulex/benet/be_main.c:2460 be_rx_compl_process_gro() error: buffer overflow '((skb_end_pointer(skb)))->frags' 17 <= u16max
drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead
fs/btrfs/volumes.c:6407 btrfs_map_block() error: we previously assumed 'mirror_num_ret' could be null (see line 6245)
kernel/events/uprobes.c:478 uprobe_write_opcode() warn: passing zero to 'PTR_ERR'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   |-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
|   `-- include-drm-drm_print.h:error:format-ld-expects-argument-of-type-long-int-but-argument-has-type-size_t-aka-unsigned-int
|-- i386-randconfig-i004-20230608
|   `-- include-drm-drm_print.h:error:format-ld-expects-argument-of-type-long-int-but-argument-has-type-size_t-aka-unsigned-int
|-- i386-randconfig-i062-20230608
|   `-- include-drm-drm_print.h:warning:format-ld-expects-argument-of-type-long-int-but-argument-has-type-size_t-aka-unsigned-int
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- s390-randconfig-r044-20230609
|   `-- uvdevice.c:(.init.text):undefined-reference-to-uv_info
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
`-- x86_64-randconfig-m001-20230608
    |-- drivers-net-ethernet-emulex-benet-be_main.c-be_rx_compl_process_gro()-error:buffer-overflow-((skb_end_pointer(skb)))-frags-u16max
    |-- fs-btrfs-volumes.c-btrfs_map_block()-error:we-previously-assumed-mirror_num_ret-could-be-null-(see-line-)
    `-- kernel-events-uprobes.c-uprobe_write_opcode()-warn:passing-zero-to-PTR_ERR
clang_recent_errors
|-- i386-randconfig-i014-20230608
|   `-- drivers-gpu-drm-i915-pxp-intel_pxp_gsccs.c:warning:format-specifies-type-long-but-the-argument-has-type-size_t-(aka-unsigned-int-)
|-- i386-randconfig-r026-20230608
|   `-- drivers-gpu-drm-i915-pxp-intel_pxp_gsccs.c:warning:format-specifies-type-long-but-the-argument-has-type-size_t-(aka-unsigned-int-)
`-- powerpc-allmodconfig
    `-- drivers-scsi-FlashPoint.c:warning:stack-frame-size-()-exceeds-limit-()-in-FlashPoint_HandleInterrupt

elapsed time: 729m

configs tested: 149
configs skipped: 6

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r011-20230608   gcc  
arc                  randconfig-r033-20230608   gcc  
arc                  randconfig-r043-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r006-20230608   clang
arm                  randconfig-r046-20230608   gcc  
arm                        spear6xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230608   clang
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r001-20230608   clang
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230608   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
i386                 randconfig-r023-20230608   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r004-20230608   gcc  
loongarch            randconfig-r025-20230608   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze           randconfig-r034-20230608   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                     cu1000-neo_defconfig   clang
mips                          malta_defconfig   clang
mips                      malta_kvm_defconfig   clang
mips                        maltaup_defconfig   clang
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230608   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230608   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc8560_ads_defconfig   clang
powerpc              randconfig-r012-20230608   clang
powerpc              randconfig-r021-20230608   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230608   gcc  
riscv                randconfig-r036-20230608   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230608   clang
s390                                defconfig   gcc  
s390                 randconfig-r013-20230608   clang
s390                 randconfig-r014-20230608   clang
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230608   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r002-20230608   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230608   gcc  
sparc                randconfig-r031-20230608   gcc  
sparc                randconfig-r035-20230608   gcc  
sparc64              randconfig-r001-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230608   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
