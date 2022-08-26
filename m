Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C152B5A307C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7E10E330;
	Fri, 26 Aug 2022 20:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7541610E356
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 20:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661546237; x=1693082237;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=WNqQoPtoEDfuhKz78dK53UyLjWSJ01Su3d25/ZXnmFs=;
 b=nWHutpXjIKm0TezTtempq9s4WszxI698XofA+WPRG2bxBy+ry0KZHiMp
 CUABRZ1xfaIh5PYVCFuSqyvviQdZX3FUTBITVH5k0tuuCWeEc+GVeSOWX
 INrnLP3hmzu/hYr6nMBcfIYv+AHR7RM+LBWm4/rK6xtnma7v03ODsrEa4
 hTcsCrwt/1odtG23n8mtD/Uv/6y1SYQX/+jtrYnZiKu8KNFBylRn98zxB
 mobzEN8inNRhcThvdDWWvWnwurG+5x9bBapj7zwIAeA4uT9XqY5J2h7bX
 4VZbbKylMn41wAZFjc9X1trM/HUjXDH7XsHKlfYRHjeQJ7feDtU1nYErB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="294598948"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="294598948"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 13:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="561564147"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2022 13:37:14 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oRg4o-0000PO-0U;
 Fri, 26 Aug 2022 20:37:14 +0000
Date: Sat, 27 Aug 2022 04:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 8d0c42c9e80791e8baba2932d2cbd2dcead50d47
Message-ID: <63092ee3./dumJHTXFZSIk6uT%lkp@intel.com>
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
Cc: linux-hwmon@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 8d0c42c9e80791e8baba2932d2cbd2dcead50d47  Add linux-next specific files for 20220826

Error/Warning: (recently discovered and may have been fixed)

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
drivers/gpu/drm/via/via_dri1.c:353:50: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
drivers/gpu/drm/via/via_dri1.c:353:50: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
drivers/hwmon/hwmon.c:1065:66: warning: Parameter 'data' can be declared with const [constParameter]
drivers/hwmon/hwmon.c:288:15: warning: Uninitialized variable: tzdata->index [uninitvar]
drivers/hwmon/pmbus/pmbus_core.c:165:24: warning: Either the condition 'page<0' is redundant or the array 'data->info->func[32]' is accessed at index 32, which is out of bounds. [arrayIndexOutOfBoundsCond]
pci.c:(.text+0x1e0): undefined reference to `get_pch_msi_handle'

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
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- alpha-randconfig-r002-20220823
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- alpha-randconfig-r014-20220824
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- alpha-randconfig-r025-20220823
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- loongarch-randconfig-r024-20220823
|   `-- pci.c:(.text):undefined-reference-to-get_pch_msi_handle
|-- mips-randconfig-p001-20220826
|   |-- drivers-gpu-drm-via-via_dri1.c:warning:Shifting-signed-bit-value-by-bits-is-implementation-defined-behaviour-shiftTooManyBitsSigned
|   |-- drivers-gpu-drm-via-via_dri1.c:warning:Signed-integer-overflow-for-expression-.-integerOverflow
|   |-- drivers-hwmon-hwmon.c:warning:Parameter-data-can-be-declared-with-const-constParameter
|   |-- drivers-hwmon-hwmon.c:warning:Uninitialized-variable:tzdata-index-uninitvar
|   `-- drivers-hwmon-pmbus-pmbus_core.c:warning:Either-the-condition-page-is-redundant-or-the-array-data-info-func-is-accessed-at-index-which-is-out-of-bounds.-arrayIndexOutOfBoundsCond
|-- parisc-allyesconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl

elapsed time: 724m

configs tested: 86
configs skipped: 3

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
parisc                              defconfig
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
x86_64                        randconfig-a002
arc                               allnoconfig
nios2                               defconfig
alpha                             allnoconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
riscv                             allnoconfig
loongarch                         allnoconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
nios2                            allyesconfig
csky                              allnoconfig
loongarch                           defconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
parisc                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a003
parisc64                            defconfig
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
i386                          randconfig-a012
mips                             allyesconfig
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
i386                          randconfig-a016
powerpc                          allmodconfig
riscv                            allmodconfig
powerpc                          allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a015
arc                              allyesconfig
riscv                               defconfig
alpha                            allyesconfig
arm                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arm64                            allyesconfig
x86_64                           allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arc                  randconfig-r043-20220823
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
arc                  randconfig-r043-20220825
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          debian-10.3-kvm

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220825
hexagon              randconfig-r041-20220823
hexagon              randconfig-r045-20220825
riscv                randconfig-r042-20220825
s390                 randconfig-r044-20220825
riscv                randconfig-r042-20220823
hexagon              randconfig-r045-20220823
s390                 randconfig-r044-20220823

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
