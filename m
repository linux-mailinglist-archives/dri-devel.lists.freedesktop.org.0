Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888950692F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 12:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CCC10E9E7;
	Tue, 19 Apr 2022 10:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E51C10E9E7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650365754; x=1681901754;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=gnCLH4lm2+rH4RGr2p3YES7i2mqlnp69sILQ57gm7V8=;
 b=OMKWA4tW18UMrWa0yIuYoxE1Anvn0zMP0fSQ2euhYuIEIW+/iTuCb5aA
 CXXy6r78+UW8UDaaC9+ejmyWgMNam9Sjv2OX4v/awAJavgkziy4cFBvdh
 NJIg7C9iVqEhA+ai+Xqj7xLZO4aF71TXys3dPVGPkRMdZewJ0IOvhdeci
 4itmNDJeZCPssPQ0Bkn8QJSgoFF2OZYqD4sVzwqIoZn+h6tgdsa9qo/mr
 IzWbCQjd0PjiO++kv9jJ93SABCu+2ChpGgeOTmu9V0PhWL/BKJKe2LrSx
 4mWYHwaAJ08EQP8OJ43+4QEqFikTcI45FGz7e/pxldqVGBzkK1dmrihjr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="244321145"
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; d="scan'208";a="244321145"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 03:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; d="scan'208";a="613956926"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2022 03:55:48 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nglWN-0005gE-Uv;
 Tue, 19 Apr 2022 10:55:47 +0000
Date: Tue, 19 Apr 2022 18:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:pending-fixes] BUILD REGRESSION
 4604e2bc18b6af1d84e18b4da451fac9bf70f952
Message-ID: <625e94ff.voZpnIYfkSSS0rno%lkp@intel.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
branch HEAD: 4604e2bc18b6af1d84e18b4da451fac9bf70f952  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/dma-buf/st-dma-fence-unwrap.c:261:1: internal compiler error: Segmentation fault

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- riscv-randconfig-r042-20220417
    `-- drivers-dma-buf-st-dma-fence-unwrap.c:internal-compiler-error:Segmentation-fault

elapsed time: 722m

configs tested: 142
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220418
i386                 randconfig-c001-20220418
parisc                           allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                              allyesconfig
h8300                       h8s-sim_defconfig
m68k                       m5208evb_defconfig
mips                     decstation_defconfig
m68k                       m5475evb_defconfig
arm                          exynos_defconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
xtensa                generic_kc705_defconfig
sh                        sh7785lcr_defconfig
sh                        edosk7705_defconfig
arm                         vf610m4_defconfig
m68k                          hp300_defconfig
sh                   secureedge5410_defconfig
sh                               j2_defconfig
sh                            hp6xx_defconfig
arm                         nhk8815_defconfig
m68k                          amiga_defconfig
mips                       capcella_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                          tiger_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     ep8248e_defconfig
powerpc                         wii_defconfig
powerpc                      ppc40x_defconfig
ia64                             alldefconfig
powerpc                       maple_defconfig
riscv                               defconfig
h8300                               defconfig
m68k                        stmark2_defconfig
arm                          badge4_defconfig
mips                       bmips_be_defconfig
sh                          urquell_defconfig
arm                  randconfig-c002-20220418
x86_64               randconfig-c001-20220418
x86_64                        randconfig-c001
arm                  randconfig-c002-20220419
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                 randconfig-a002-20220418
i386                 randconfig-a004-20220418
i386                 randconfig-a001-20220418
i386                 randconfig-a006-20220418
i386                 randconfig-a005-20220418
i386                 randconfig-a003-20220418
x86_64               randconfig-a003-20220418
x86_64               randconfig-a004-20220418
x86_64               randconfig-a006-20220418
x86_64               randconfig-a001-20220418
x86_64               randconfig-a002-20220418
x86_64               randconfig-a005-20220418
arc                  randconfig-r043-20220418
arc                  randconfig-r043-20220417
s390                 randconfig-r044-20220417
riscv                randconfig-r042-20220417
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220419
powerpc              randconfig-c003-20220419
x86_64                        randconfig-c007
mips                 randconfig-c004-20220419
i386                          randconfig-c001
s390                 randconfig-c005-20220419
riscv                randconfig-c006-20220419
arm                           spitz_defconfig
mips                            e55_defconfig
mips                   sb1250_swarm_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                         tb0219_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a012-20220418
x86_64               randconfig-a013-20220418
x86_64               randconfig-a011-20220418
x86_64               randconfig-a015-20220418
x86_64               randconfig-a016-20220418
x86_64               randconfig-a014-20220418
i386                 randconfig-a011-20220418
i386                 randconfig-a015-20220418
i386                 randconfig-a016-20220418
i386                 randconfig-a012-20220418
i386                 randconfig-a013-20220418
i386                 randconfig-a014-20220418
riscv                randconfig-r042-20220418
hexagon              randconfig-r041-20220417
hexagon              randconfig-r041-20220418
hexagon              randconfig-r045-20220417
s390                 randconfig-r044-20220418
hexagon              randconfig-r045-20220418

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
