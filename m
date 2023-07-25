Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E90761FDF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 19:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3030510E3E6;
	Tue, 25 Jul 2023 17:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3655A10E3E6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690305157; x=1721841157;
 h=date:from:to:cc:subject:message-id;
 bh=Gio7G6txIcv1KOAc9HzqKHYvWme+5T9Bml8x7x4n4CY=;
 b=HsJswv6iDCd92OHQD4icNiTpcgEffyyBWsBWKy8UA4CN7CPYcNSR+OK0
 pvhErUVoAYE5OAMylh3/E4QuFbq18jz3/CbjgeopwkEqvi1mnIzJ0Eesa
 VXvX0d12pVVDWSMnLwB50xxwWPbNtJjTPBnVjxReG3GPcQhl/vUOhudOz
 lB7c/6ahWx0Egmxrj4utwqOgB54lkgSRR01LbvuPDozMdfpepi8tA9vEK
 cSID5b02TqRPyBvt23GdA2buttgWZhcWSG51VWFMhaRREFOrFBSy8V8YW
 nUKoh3pQBYUSR6Y/i5UZw8W9MBorbCl1H2fiKH+ZNCLRv/0/bRV9X4uKC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454174578"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="454174578"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 10:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="839923058"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="839923058"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2023 10:12:34 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qOLZK-0000Aj-0O;
 Tue, 25 Jul 2023 17:11:37 +0000
Date: Wed, 26 Jul 2023 01:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 1e25dd7772483f477f79986d956028e9f47f990a
Message-ID: <202307260133.BBVuOymN-lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 1e25dd7772483f477f79986d956028e9f47f990a  Add linux-next specific files for 20230725

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306260401.qZlYQpV2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307181450.sfbuvMf5-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307201439.A9MArfeq-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307251703.AgPdzkAe-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307260047.7VI2QNNG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
drivers/mfd/max77541.c:176:18: warning: cast to smaller integer type 'enum max7754x_ids' from 'const void *' [-Wvoid-pointer-to-enum-cast]
drivers/regulator/max77857-regulator.c:312:16: error: initializer element is not a compile-time constant
samples/hw_breakpoint/data_breakpoint.c:73:2: error: call to undeclared function '__symbol_put'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]

Unverified Error/Warning (likely false positive, please contact us if interested):

kernel/bpf/memalloc.c:200 add_obj_to_free_list() error: uninitialized symbol 'flags'.
kernel/bpf/memalloc.c:347 free_bulk() error: uninitialized symbol 'flags'.
kernel/bpf/memalloc.c:387 check_free_by_rcu() error: uninitialized symbol 'flags'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-m021-20230725
|   |-- kernel-bpf-memalloc.c-add_obj_to_free_list()-error:uninitialized-symbol-flags-.
|   |-- kernel-bpf-memalloc.c-check_free_by_rcu()-error:uninitialized-symbol-flags-.
|   `-- kernel-bpf-memalloc.c-free_bulk()-error:uninitialized-symbol-flags-.
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- loongarch-allyesconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- loongarch-randconfig-m041-20230725
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
`-- sparc64-randconfig-r091-20230725
    |-- drivers-gpu-drm-loongson-lsdc_benchmark.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-src-got-void-kptr
    `-- drivers-gpu-drm-loongson-lsdc_benchmark.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-volatile-noderef-__iomem-dst-got-void-kptr
clang_recent_errors
|-- arm-randconfig-r024-20230725
|   `-- drivers-regulator-max77857-regulator.c:error:initializer-element-is-not-a-compile-time-constant
|-- i386-buildonly-randconfig-r004-20230725
|   `-- samples-hw_breakpoint-data_breakpoint.c:error:call-to-undeclared-function-__symbol_put-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-declaration
|-- x86_64-buildonly-randconfig-r002-20230725
|   `-- drivers-mfd-max77541.c:warning:cast-to-smaller-integer-type-enum-max7754x_ids-from-const-void
|-- x86_64-buildonly-randconfig-r003-20230725
|   `-- drivers-mfd-max77541.c:warning:cast-to-smaller-integer-type-enum-max7754x_ids-from-const-void
|-- x86_64-randconfig-x012-20230725
|   `-- drivers-mfd-max77541.c:warning:cast-to-smaller-integer-type-enum-max7754x_ids-from-const-void
`-- x86_64-randconfig-x013-20230725
    `-- drivers-mfd-max77541.c:warning:cast-to-smaller-integer-type-enum-max7754x_ids-from-const-void

elapsed time: 727m

configs tested: 128
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230725   gcc  
alpha                randconfig-r021-20230725   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230725   gcc  
arc                  randconfig-r036-20230725   gcc  
arc                  randconfig-r043-20230725   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                  randconfig-r024-20230725   clang
arm                  randconfig-r046-20230725   clang
arm                        shmobile_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230725   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230725   gcc  
hexagon              randconfig-r041-20230725   clang
hexagon              randconfig-r045-20230725   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230725   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230725   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                           ip22_defconfig   clang
mips                 randconfig-r005-20230725   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230725   gcc  
nios2                randconfig-r035-20230725   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r033-20230725   gcc  
parisc               randconfig-r034-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r006-20230725   clang
riscv                randconfig-r022-20230725   gcc  
riscv                randconfig-r042-20230725   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230725   clang
s390                 randconfig-r013-20230725   gcc  
s390                 randconfig-r014-20230725   gcc  
s390                 randconfig-r044-20230725   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r023-20230725   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230725   gcc  
sparc                randconfig-r026-20230725   gcc  
sparc                       sparc64_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230725   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230725   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
