Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218D71033D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 05:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5067310E6B2;
	Thu, 25 May 2023 03:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94AC10E6B3;
 Thu, 25 May 2023 03:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684984654; x=1716520654;
 h=date:from:to:cc:subject:message-id;
 bh=rGF7bJDuC9HkXMKz/2MVhGFmVqEFCFiZ72imjZjWERA=;
 b=B/ZUqRjvlqB4xEwFHerUjBSE+B3BDtqcDjegZfaCfKtuPXR1iuLgqJos
 iJmXZWBmxkUEFx7bMoa/rgztvUbKw84cQ5tK5xrBF7gdBjlmhtBnGub0j
 eIvv8F+BxKpgU3Za9WCx9H/QnQwEuK8OtKmSFRkB0UbZ8Yyx0agYciI3C
 dFPrveDNk/WbuI6QSTLEewDIdoDYBsZqbSyrDzEcgM6yWVJRi3RaRRecD
 9SecEwNUOX6+ADMoFOn4QKzaDOvyb23Md/TH9psfinI/qfYCg6Jeu4Qbu
 Ee1XNCaW1g84SyBHnNlsJ3jZF/X66q+4r35A945t36vE8AAHbE1CrKR+3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343237191"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343237191"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 20:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="794463813"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="794463813"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 24 May 2023 20:17:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q21Tm-000FPR-2i;
 Thu, 25 May 2023 03:17:30 +0000
Date: Thu, 25 May 2023 11:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 cf09e328589a2ed7f6c8d90f2edb697fb4f8a96b
Message-ID: <20230525031632.GDH30%lkp@intel.com>
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
Cc: linux-xfs@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 intel-gfx@lists.freedesktop.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: cf09e328589a2ed7f6c8d90f2edb697fb4f8a96b  Add linux-next specific files for 20230524

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305240732.wUCsRNAj-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202305241902.UvHtMoxa-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202305250935.6XsyIBcZ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/parisc/kernel/traps.c:312:25: error: 'SPINLOCK_BREAK_INSN' undeclared (first use in this function)
drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
drivers/gpu/drm/i915/display/intel_display.c:6012:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not a compile-time constant

Unverified Error/Warning (likely false positive, please contact us if interested):

fs/xfs/scrub/fscounters.c:459 xchk_fscounters() warn: ignoring unreachable code.
kernel/watchdog.c:40:19: sparse: sparse: symbol 'watchdog_hardlockup_user_enabled' was not declared. Should it be static?
kernel/watchdog.c:41:19: sparse: sparse: symbol 'watchdog_softlockup_user_enabled' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-s053-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- arc-allyesconfig
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   `-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|-- csky-randconfig-s032-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- i386-randconfig-m021-20230524
|   `-- fs-xfs-scrub-fscounters.c-xchk_fscounters()-warn:ignoring-unreachable-code.
|-- i386-randconfig-s001-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- i386-randconfig-s002-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- i386-randconfig-s003-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- ia64-randconfig-s053-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- parisc-randconfig-r015-20230524
|   `-- arch-parisc-kernel-traps.c:error:SPINLOCK_BREAK_INSN-undeclared-(first-use-in-this-function)
|-- parisc-randconfig-s033-20230524
|   `-- arch-parisc-kernel-traps.c:error:SPINLOCK_BREAK_INSN-undeclared-(first-use-in-this-function)
|-- x86_64-randconfig-s021-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- x86_64-randconfig-s022-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- x86_64-randconfig-s023-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
|-- x86_64-randconfig-s041-20230524
|   |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
|   `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
`-- x86_64-randconfig-s042-20230524
    |-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_hardlockup_user_enabled-was-not-declared.-Should-it-be-static
    `-- kernel-watchdog.c:sparse:sparse:symbol-watchdog_softlockup_user_enabled-was-not-declared.-Should-it-be-static
clang_recent_errors
|-- i386-randconfig-i011-20230524
|   `-- drivers-gpu-drm-i915-display-intel_display.c:warning:unannotated-fall-through-between-switch-labels
|-- i386-randconfig-i014-20230524
|   `-- drivers-gpu-drm-i915-display-intel_display.c:warning:unannotated-fall-through-between-switch-labels
|-- i386-randconfig-i015-20230524
|   `-- drivers-gpu-drm-i915-display-intel_display.c:error:unannotated-fall-through-between-switch-labels-Werror-Wimplicit-fallthrough
|-- riscv-buildonly-randconfig-r002-20230524
|   `-- drivers-gpu-drm-panel-panel-samsung-s6d7aa0.c:error:initializer-element-is-not-a-compile-time-constant
|-- x86_64-randconfig-r025-20230522
|   `-- drivers-gpu-drm-i915-display-intel_display.c:warning:unannotated-fall-through-between-switch-labels
|-- x86_64-randconfig-x091-20230524
|   `-- drivers-gpu-drm-i915-display-intel_display.c:warning:unannotated-fall-through-between-switch-labels
`-- x86_64-randconfig-x096-20230524
    `-- drivers-gpu-drm-i915-display-intel_display.c:warning:unannotated-fall-through-between-switch-labels

elapsed time: 1262m

configs tested: 159
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230521   gcc  
alpha                randconfig-r024-20230521   gcc  
alpha                randconfig-r025-20230521   gcc  
alpha                randconfig-r026-20230522   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230521   gcc  
arc                  randconfig-r023-20230522   gcc  
arc                  randconfig-r032-20230524   gcc  
arc                  randconfig-r034-20230524   gcc  
arc                  randconfig-r036-20230524   gcc  
arc                  randconfig-r043-20230524   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r035-20230524   clang
arm                  randconfig-r046-20230524   gcc  
arm                         s5pv210_defconfig   clang
arm                           stm32_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230524   clang
arm64                randconfig-r012-20230524   clang
arm64                randconfig-r021-20230522   clang
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230524   gcc  
csky                 randconfig-r014-20230524   gcc  
hexagon      buildonly-randconfig-r001-20230524   clang
hexagon      buildonly-randconfig-r004-20230524   clang
hexagon              randconfig-r024-20230522   clang
hexagon              randconfig-r041-20230524   clang
hexagon              randconfig-r045-20230524   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i011-20230524   clang
i386                 randconfig-i012-20230524   clang
i386                 randconfig-i013-20230524   clang
i386                 randconfig-i014-20230524   clang
i386                 randconfig-i015-20230524   clang
i386                 randconfig-i016-20230524   clang
i386                 randconfig-i056-20230524   gcc  
i386                 randconfig-i061-20230524   gcc  
i386                 randconfig-i062-20230524   gcc  
i386                 randconfig-i063-20230524   gcc  
i386                 randconfig-i064-20230524   gcc  
i386                 randconfig-i065-20230524   gcc  
i386                 randconfig-i066-20230524   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230524   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230524   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r006-20230524   gcc  
microblaze           randconfig-r013-20230524   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                          rb532_defconfig   gcc  
mips                          rm200_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2        buildonly-randconfig-r005-20230524   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230524   gcc  
openrisc             randconfig-r001-20230524   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230524   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc              randconfig-r021-20230521   gcc  
powerpc                     tqm8540_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230524   clang
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230524   gcc  
riscv                randconfig-r042-20230524   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230521   gcc  
s390                 randconfig-r044-20230524   clang
sh                               allmodconfig   gcc  
sh                             espt_defconfig   gcc  
sh                   randconfig-r002-20230524   gcc  
sh                   randconfig-r016-20230524   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230524   gcc  
x86_64               randconfig-a002-20230524   gcc  
x86_64               randconfig-a003-20230524   gcc  
x86_64               randconfig-a004-20230524   gcc  
x86_64               randconfig-a005-20230524   gcc  
x86_64               randconfig-a011-20230524   clang
x86_64               randconfig-a012-20230524   clang
x86_64               randconfig-a013-20230524   clang
x86_64               randconfig-a014-20230524   clang
x86_64               randconfig-a015-20230524   clang
x86_64               randconfig-a016-20230524   clang
x86_64               randconfig-r022-20230522   clang
x86_64               randconfig-r025-20230522   clang
x86_64               randconfig-x051-20230524   clang
x86_64               randconfig-x052-20230524   clang
x86_64               randconfig-x053-20230524   clang
x86_64               randconfig-x054-20230524   clang
x86_64               randconfig-x055-20230524   clang
x86_64               randconfig-x056-20230524   clang
x86_64               randconfig-x061-20230524   clang
x86_64               randconfig-x062-20230524   clang
x86_64               randconfig-x063-20230524   clang
x86_64               randconfig-x064-20230524   clang
x86_64               randconfig-x065-20230524   clang
x86_64               randconfig-x066-20230524   clang
x86_64               randconfig-x071-20230524   gcc  
x86_64               randconfig-x072-20230524   gcc  
x86_64               randconfig-x073-20230524   gcc  
x86_64               randconfig-x074-20230524   gcc  
x86_64               randconfig-x075-20230524   gcc  
x86_64               randconfig-x076-20230524   gcc  
x86_64               randconfig-x081-20230524   gcc  
x86_64               randconfig-x082-20230524   gcc  
x86_64               randconfig-x083-20230524   gcc  
x86_64               randconfig-x084-20230524   gcc  
x86_64               randconfig-x085-20230524   gcc  
x86_64               randconfig-x086-20230524   gcc  
x86_64               randconfig-x091-20230524   clang
x86_64               randconfig-x092-20230524   clang
x86_64               randconfig-x093-20230524   clang
x86_64               randconfig-x094-20230524   clang
x86_64               randconfig-x095-20230524   clang
x86_64               randconfig-x096-20230524   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
