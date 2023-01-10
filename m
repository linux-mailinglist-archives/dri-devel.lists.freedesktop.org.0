Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62D66464C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A61410E600;
	Tue, 10 Jan 2023 16:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766110E600
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673368802; x=1704904802;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=8A41p5ebqdjjMuMs7ux6knUnt8QGuiTuRTEJDYNiNZ4=;
 b=Chfzw7M6NWdBUGafKkU2Bvd17hwvMILUz5M4nk+viH7hOdGVtF7GVkU4
 eOYnTZZ3mbhI3zE2p30Je1RLY5cGiklFFO9s0K+YmX8M+H6ev9h7xaNph
 gFJ2elSlC4VQiyrRyYx5R/4FPH2nrHLaBbvrEUiTx1vtdrKecYfI4KId7
 4T3eI/3gXiuED3YJuQodY3jgFv3DOyVEeSJ218G2fsbmkVmFsWLPf4PfH
 XCue9mP4SYWJgssBi5aYtIR2CEGhYu3QV1jMU6Gc3IcFjxZLaGDarKoPc
 GzE17hyYJ+BWdNssdnmANGNARs06+FPFirxjLrORMKUKNynB4Ig31VS/9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385499052"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="385499052"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 08:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831057482"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="831057482"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 08:39:59 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pFHfK-0008Cf-1k;
 Tue, 10 Jan 2023 16:39:58 +0000
Date: Wed, 11 Jan 2023 00:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 435bf71af3a0aa8067f3b87ff9febf68b564dbb6
Message-ID: <63bd94d5.zAfv1hV4mqWQkqiI%lkp@intel.com>
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
Cc: netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 435bf71af3a0aa8067f3b87ff9febf68b564dbb6  Add linux-next specific files for 20230110

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301102024.acWVRfFq-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Warning: Documentation/arm/samsung/gpio.rst references a file that doesn't exist: Documentation/arm/samsung-s3c24xx/gpio.rst
aarch64-linux-ld: ID map text too big or misaligned
drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]

Unverified Error/Warning (likely false positive, please contact us if interested):

net/devlink/leftover.c:7608 devlink_fmsg_prepare_skb() error: uninitialized symbol 'err'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- aarch64-linux-ld:ID-map-text-too-big-or-misaligned
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
|-- x86_64-allnoconfig
|   `-- Warning:Documentation-arm-samsung-gpio.rst-references-a-file-that-doesn-t-exist:Documentation-arm-samsung-s3c24xx-gpio.rst
`-- x86_64-randconfig-m001-20230109
    `-- net-devlink-leftover.c-devlink_fmsg_prepare_skb()-error:uninitialized-symbol-err-.

elapsed time: 723m

configs tested: 76
configs skipped: 6

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64               randconfig-a011-20230109
i386                 randconfig-a014-20230109
x86_64               randconfig-a013-20230109
i386                 randconfig-a011-20230109
s390                                defconfig
x86_64               randconfig-a012-20230109
i386                 randconfig-a016-20230109
i386                                defconfig
i386                 randconfig-a015-20230109
x86_64               randconfig-a014-20230109
i386                 randconfig-a013-20230109
x86_64               randconfig-a016-20230109
x86_64               randconfig-a015-20230109
x86_64                              defconfig
s390                             allyesconfig
i386                 randconfig-a012-20230109
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
arm                                 defconfig
riscv                randconfig-r042-20230109
s390                 randconfig-r044-20230109
arm64                            allyesconfig
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
arm                              allyesconfig
arc                  randconfig-r043-20230109
sh                          sdk7780_defconfig
xtensa                  audio_kc705_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
arm64                               defconfig
alpha                            allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                                defconfig
mips                           gcw0_defconfig
powerpc                      ppc40x_defconfig

clang tested configs:
i386                 randconfig-a004-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a006-20230109
i386                 randconfig-a001-20230109
i386                 randconfig-a005-20230109
hexagon              randconfig-r045-20230109
arm                  randconfig-r046-20230109
riscv                randconfig-r042-20230108
hexagon              randconfig-r041-20230108
x86_64               randconfig-a003-20230109
hexagon              randconfig-r041-20230109
x86_64               randconfig-a002-20230109
hexagon              randconfig-r045-20230108
x86_64               randconfig-a004-20230109
x86_64               randconfig-a005-20230109
x86_64               randconfig-a001-20230109
s390                 randconfig-r044-20230108
x86_64               randconfig-a006-20230109
powerpc               mpc834x_itxgp_defconfig
x86_64                          rhel-8.3-rust
powerpc                       ebony_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
