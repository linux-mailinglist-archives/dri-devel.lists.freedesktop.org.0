Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18828665F8B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239E810E049;
	Wed, 11 Jan 2023 15:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29510E049
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673451955; x=1704987955;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NeumfjFNPS/NqypN6Xwzuh8eOINOAxO3/m1eYLMUjG0=;
 b=ntkE5IhpsZmTaH/9VS+4HbLRzn/rolT0LjmJWvRNVivQwZdG42eHodIp
 2P1G0+HGNgur6w7RglumGbZUlF3Ov3eILSyJq51GFVVfn5TaLl9NOwf1u
 l+tz1cBM2T79OKt0xAIsRX+/5P4uWzaAn3i/6smign8BfwjYdj/5wSdhF
 gDLzOJwUsKYuduFf4nMUexzGSETnEsbL9clbHf4X7DUs2jWuYO6819Vk+
 fElK2pLfdGykkDOmVSlnOcVMLn2JuwKffiNCbHKPP4bXh7xO8kLlYZCdG
 r1NuWSjs+8qtkd1/JA1U6b3H5Ln8vpPpk+mN1uXu7kpD6azTW8+cm6ir0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303143357"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="303143357"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:45:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="799854649"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="799854649"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2023 07:45:19 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pFdHx-0009Ix-2U;
 Wed, 11 Jan 2023 15:45:17 +0000
Date: Wed, 11 Jan 2023 23:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 c9e9cdd8bdcc3e1ea330d49ea587ec71884dd0f5
Message-ID: <63bed948.8r/cE1fIbWFrvOVL%lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: c9e9cdd8bdcc3e1ea330d49ea587ec71884dd0f5  Add linux-next specific files for 20230111

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301111803.2ypwa4GK-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

aarch64-linux-ld: ID map text too big or misaligned
cistpl.c:(.text+0xbc): undefined reference to `iounmap'
drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
include/linux/kcsan-checks.h:220:28: warning: 'args32' may be used uninitialized [-Wmaybe-uninitialized]
s390x-linux-ld: cistpl.c:(.text+0x354): undefined reference to `ioremap'
s390x-linux-ld: cistpl.c:(.text+0x3f6): undefined reference to `iounmap'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- aarch64-linux-ld:ID-map-text-too-big-or-misaligned
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
`-- s390-randconfig-r034-20230111
    `-- include-linux-kcsan-checks.h:warning:args32-may-be-used-uninitialized
clang_recent_errors
`-- s390-randconfig-r005-20230110
    |-- cistpl.c:(.text):undefined-reference-to-iounmap
    |-- s39-linux-ld:cistpl.c:(.text):undefined-reference-to-ioremap
    `-- s39-linux-ld:cistpl.c:(.text):undefined-reference-to-iounmap

elapsed time: 725m

configs tested: 61
configs skipped: 2

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
i386                                defconfig
arc                                 defconfig
x86_64                        randconfig-a002
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                              defconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
i386                          randconfig-a014
x86_64                               rhel-8.3
m68k                             allyesconfig
s390                                defconfig
x86_64                           rhel-8.3-bpf
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
x86_64                        randconfig-a013
s390                             allyesconfig
arc                  randconfig-r043-20230110
m68k                             allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a011
arc                              allyesconfig
sh                               allmodconfig
s390                 randconfig-r044-20230110
alpha                            allyesconfig
i386                          randconfig-a005
mips                             allyesconfig
riscv                randconfig-r042-20230110
x86_64                        randconfig-a015
x86_64                           allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                          randconfig-a013
x86_64                        randconfig-a001
hexagon              randconfig-r041-20230110
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a011
arm                  randconfig-r046-20230110
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
hexagon              randconfig-r045-20230110
i386                          randconfig-a004
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
