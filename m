Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8290E6FB610
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 19:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38F610E2E3;
	Mon,  8 May 2023 17:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF3B10E0FC;
 Mon,  8 May 2023 17:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683567761; x=1715103761;
 h=date:from:to:cc:subject:message-id;
 bh=QzdlXeXG2PkEMSx0QmeEs0hg6hbVV4dFWxpgxeJRpyE=;
 b=UGs5qI9TRM4iE498MDCkcSuZ7AH48Fu+XnxpaOfKT/yG5weN+HS2tzYl
 n87r7NL57ZygXoUAW4gn046LOFZw5ZbfMzQlLHsgw9YLk34lgYVw+wG/+
 8OnOGSpoG9CJGeT6TAGQfc+SXu+gqqZLuP6dc/y17y09U6Qkz5yZuIHcH
 kDowSzbbCmH0+HHYWgg2XplvDkn+NEVkNvtZ2x49lG6T2wd8xPWowQvmx
 edETwcakZYS6T+E1rpD2kBrXLIvqS8MBMURDpUgw9Uoc0U5Q0mewtr2Lp
 cDEyz86y1mt8r/EXl0ZX8Zo/o+AVwqBbs0ajrwqKSHfB8llHTsfRTQtRO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330072668"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330072668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="692676913"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="692676913"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 08 May 2023 10:42:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pw4sf-0001Lt-2k;
 Mon, 08 May 2023 17:42:37 +0000
Date: Tue, 09 May 2023 01:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 52025ebbb518a2d876b8aba191b348ffb1cf368b
Message-ID: <20230508174206.ZBMZq%lkp@intel.com>
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 52025ebbb518a2d876b8aba191b348ffb1cf368b  Add linux-next specific files for 20230508

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304230014.YbScpx20-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/accel/habanalabs/gaudi/gaudi.c:117:19: warning: unused variable 'gaudi_irq_name' [-Wunused-const-variable]
drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6395:21: warning: variable 'count' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:499:13: warning: variable 'j' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: unused variable 'golden_settings_gc_9_4_3' [-Wunused-const-variable]

Unverified Warning (likely false positive, please contact us if interested):

drivers/cpufreq/pcc-cpufreq.c: linux/platform_device.h is included more than once.
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:495:2-8: preceding lock on line 491
fs/xfs/scrub/fscounters.c:459 xchk_fscounters() warn: ignoring unreachable code.

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- alpha-randconfig-c042-20230507
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:preceding-lock-on-line
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- alpha-randconfig-c043-20230507
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-randconfig-c033-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-randconfig-c041-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-randconfig-r024-20230507
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-randconfig-r025-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm64-randconfig-m041-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- csky-buildonly-randconfig-r001-20230508
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-randconfig-m031-20230507
|   `-- fs-xfs-scrub-fscounters.c-xchk_fscounters()-warn:ignoring-unreachable-code.
|-- ia64-randconfig-r003-20230508
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-randconfig-r012-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-randconfig-r023-20230507
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- openrisc-randconfig-r005-20230507
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- parisc-buildonly-randconfig-r004-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- riscv-randconfig-r042-20230508
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- s390-randconfig-r044-20230508
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- s390-randconfig-s051-20230507
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- x86_64-allnoconfig
|   `-- drivers-cpufreq-pcc-cpufreq.c:linux-platform_device.h-is-included-more-than-once.
`-- x86_64-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
    `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
clang_recent_errors
|-- arm-randconfig-r046-20230508
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:unused-variable-golden_settings_gc_9_4_3
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-gfx_v9_4_3.c:warning:unused-variable-golden_settings_gc_9_4_3
`-- x86_64-randconfig-a006-20230508
    `-- drivers-accel-habanalabs-gaudi-gaudi.c:warning:unused-variable-gaudi_irq_name

elapsed time: 720m

configs tested: 141
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230507   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230508   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                      integrator_defconfig   gcc  
arm                  randconfig-r004-20230508   gcc  
arm                  randconfig-r024-20230507   gcc  
arm                  randconfig-r025-20230507   gcc  
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230508   clang
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230507   gcc  
csky         buildonly-randconfig-r001-20230508   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230507   gcc  
hexagon      buildonly-randconfig-r006-20230508   clang
hexagon              randconfig-r024-20230508   clang
hexagon              randconfig-r034-20230507   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230508   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r002-20230508   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230507   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230508   gcc  
ia64                 randconfig-r012-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230507   gcc  
loongarch            randconfig-r023-20230507   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230507   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                 randconfig-r001-20230507   clang
mips                 randconfig-r002-20230507   clang
mips                 randconfig-r003-20230507   clang
mips                 randconfig-r006-20230508   gcc  
mips                 randconfig-r015-20230507   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230507   gcc  
nios2                randconfig-r006-20230507   gcc  
nios2                randconfig-r023-20230508   gcc  
nios2                randconfig-r033-20230507   gcc  
nios2                randconfig-r036-20230507   gcc  
openrisc     buildonly-randconfig-r002-20230507   gcc  
openrisc             randconfig-r005-20230507   gcc  
parisc       buildonly-randconfig-r004-20230507   gcc  
parisc       buildonly-randconfig-r005-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r005-20230508   clang
powerpc                    socrates_defconfig   clang
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r026-20230508   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                   randconfig-r022-20230508   gcc  
sh                   randconfig-r025-20230508   gcc  
sh                   randconfig-r026-20230507   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230507   gcc  
sparc64              randconfig-r021-20230508   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230508   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
