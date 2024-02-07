Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F984C50F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 07:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FEC10E49D;
	Wed,  7 Feb 2024 06:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBTkcNpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9682810E304;
 Wed,  7 Feb 2024 06:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707287930; x=1738823930;
 h=date:from:to:cc:subject:message-id;
 bh=5XH2+QhIIh6vtV8cZGfPe4lADyppCqTou0VjC/BHAxA=;
 b=mBTkcNptkJOyz7VUphE3sKFtHKnVDXeddyWdF1/Z9MUZF18gtvSsvtqn
 /Upl9p3rM3IZklIBojMmJUR27K4QLHPEQY40GqOECgJe9E6Si7D5PuIl2
 GRxqorqyx1bvifmuvJMfWaebOyhNn9bpkiR3i6pDfqASWPDtKRVwcK3iS
 a95wRXESIgmWCTOL9w7TCd8q0pgtOMutrH/FqxgZ+tSKFAk45Ri3CyjNs
 S4LUC6le7NxEgvUAkjt4ltNQdDUa8DFIHZdJBT3xKl4u+LSe+/adAtJad
 MPnRjomSgr+Cs/krU9il+WhDCqUccfjLN6RE45PW/MQlbKJzpSligdcBr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23399318"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="23399318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 22:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="6015081"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 06 Feb 2024 22:38:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rXbZu-0002Hc-2Y;
 Wed, 07 Feb 2024 06:38:38 +0000
Date: Wed, 07 Feb 2024 14:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 ceph-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-bcachefs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 nouveau@lists.freedesktop.org, ntfs3@lists.linux.dev,
 samba-technical@lists.samba.org
Subject: [linux-next:master] BUILD REGRESSION
 ac139fc7db67968e5061715508b5fc4aa7c40c56
Message-ID: <202402071439.AER2foE3-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: ac139fc7db67968e5061715508b5fc4aa7c40c56  Add linux-next specific files for 20240206

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202402061900.rTuYDlo6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402062106.cfArbjsv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402062134.a6CqAt3s-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402062139.MKznS4Qf-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402062151.Kq60k2LK-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402062210.3YyBVGF1-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/sh/boot/compressed/../../../../lib/xz/xz_dec_lzma2.c:648:(.text+0xaf0): undefined reference to `__ubsan_handle_shift_out_of_bounds'
arch/sh/boot/compressed/../../../../lib/zlib_inflate/inffast.c:132:(.text+0x738): undefined reference to `__ubsan_handle_shift_out_of_bounds'
arch/sh/boot/compressed/../../../../lib/zlib_inflate/inflate.c:57:(.text+0xbd0): undefined reference to `__ubsan_handle_shift_out_of_bounds'
arch/sh/boot/compressed/../../../../lib/zlib_inflate/inftrees.c:270:(.text+0x3dc): undefined reference to `__ubsan_handle_shift_out_of_bounds'
arch/xtensa/boot/lib/inflate.c:91:(.text+0x1a4): undefined reference to `__ubsan_handle_out_of_bounds'
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1955: warning: Function parameter or struct member 'gsp' not described in 'nvkm_gsp_radix3_sg'
fs/ceph/locks.c:379:27: warning: unused variable 'lock' [-Wunused-variable]
make[2]: *** kselftest/livepatch/test_modules: No such file or directory.  Stop.
powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data202' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data202'
powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data219' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data219'
powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data327' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data327'
sh4-linux-ld: arch/sh/boot/compressed/../../../../lib/zlib_inflate/inffast.c:305:(.text+0xac4): undefined reference to `__ubsan_handle_shift_out_of_bounds'
sh4-linux-ld: arch/sh/boot/compressed/../../../../lib/zlib_inflate/inftrees.c:315:(.text+0x60c): undefined reference to `__ubsan_handle_shift_out_of_bounds'
sh4-linux-ld: arch/sh/boot/compressed/misc.o:(.debug_addr+0x388): undefined reference to `__ubsan_handle_shift_out_of_bounds'
sh4-linux-ld: misc.c:(.text+0x23d4): undefined reference to `__ubsan_handle_shift_out_of_bounds'
xtensa-linux-ld: arch/xtensa/boot/lib/inflate.c:487:(.text+0x546): undefined reference to `__ubsan_handle_out_of_bounds'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r113-20240206
|   `-- drivers-gpu-drm-bridge-imx-imx8mp-hdmi-pvi.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- arm-randconfig-r071-20240206
|   `-- fs-ceph-locks.c:warning:unused-variable-lock
|-- i386-buildonly-randconfig-003-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-014-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-016-20240206
|   `-- include-kunit-test.h:warning:s-directive-argument-is-null
|-- i386-randconfig-052-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- mips-allyesconfig
|   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_secondary
|   `-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_entry
|-- nios2-randconfig-001-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- parisc-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-randconfig-001-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- powerpc-randconfig-r022-20230201
|   |-- powerpc-linux-ld:warning:orphan-section-bss..Lubsan_data202-from-fs-overlayfs-copy_up.o-being-placed-in-section-.bss..Lubsan_data202
|   |-- powerpc-linux-ld:warning:orphan-section-bss..Lubsan_data219-from-kernel-ptrace.o-being-placed-in-section-.bss..Lubsan_data219
|   `-- powerpc-linux-ld:warning:orphan-section-bss..Lubsan_data327-from-kernel-sched-core.o-being-placed-in-section-.bss..Lubsan_data327
|-- powerpc64-randconfig-003-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- sh-randconfig-r003-20220501
|   |-- arch-sh-boot-compressed-..-..-..-..-lib-zlib_inflate-inffast.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- arch-sh-boot-compressed-..-..-..-..-lib-zlib_inflate-inflate.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- arch-sh-boot-compressed-..-..-..-..-lib-zlib_inflate-inftrees.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sh4-linux-ld:arch-sh-boot-compressed-..-..-..-..-lib-zlib_inflate-inffast.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   `-- sh4-linux-ld:arch-sh-boot-compressed-..-..-..-..-lib-zlib_inflate-inftrees.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sh-randconfig-r015-20220607
|   `-- sh4-linux-ld:misc.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sh-randconfig-r023-20230502
|   |-- arch-sh-boot-compressed-..-..-..-..-lib-xz-xz_dec_lzma2.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   `-- sh4-linux-ld:arch-sh-boot-compressed-misc.o:(.debug_addr):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc64-randconfig-001-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- sparc64-randconfig-002-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-003-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-004-20240206
|   `-- include-kunit-test.h:warning:s-directive-argument-is-null
|-- x86_64-randconfig-161-20240206
|   |-- fs-bcachefs-btree_locking.c-bch2_trans_relock()-warn:passing-zero-to-PTR_ERR
|   |-- fs-bcachefs-buckets.c-bch2_trans_account_disk_usage_change()-error:we-previously-assumed-trans-disk_res-could-be-null-(see-line-)
|   `-- mm-huge_memory.c-thpsize_create()-warn:Calling-kobject_put-get-with-state-initialized-unset-from-line:
|-- x86_64-rhel-8.3-bpf
|   `-- make:kselftest-livepatch-test_modules:No-such-file-or-directory.-Stop.
`-- xtensa-randconfig-r022-20220710
    |-- arch-xtensa-boot-lib-inflate.c:(.text):undefined-reference-to-__ubsan_handle_out_of_bounds
    `-- xtensa-linux-ld:arch-xtensa-boot-lib-inflate.c:(.text):undefined-reference-to-__ubsan_handle_out_of_bounds
clang_recent_errors
|-- arm64-randconfig-002-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-buildonly-randconfig-002-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-buildonly-randconfig-004-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-003-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-004-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-013-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-054-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- powerpc-randconfig-003-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-006-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-012-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-014-20240206
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
`-- x86_64-randconfig-122-20240206
    |-- fs-quota-dquot.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
    `-- fs-smb-client-file.c:sparse:sparse:symbol-cifs_req_ops-was-not-declared.-Should-it-be-static

elapsed time: 1479m

configs tested: 179
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240206   gcc  
arc                   randconfig-002-20240206   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240206   clang
arm                   randconfig-002-20240206   gcc  
arm                   randconfig-003-20240206   gcc  
arm                   randconfig-004-20240206   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240206   gcc  
arm64                 randconfig-002-20240206   clang
arm64                 randconfig-003-20240206   gcc  
arm64                 randconfig-004-20240206   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240206   gcc  
csky                  randconfig-002-20240206   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240206   clang
hexagon               randconfig-002-20240206   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240206   clang
i386         buildonly-randconfig-002-20240206   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240206   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240206   clang
i386                  randconfig-002-20240206   clang
i386                  randconfig-003-20240206   clang
i386                  randconfig-004-20240206   clang
i386                  randconfig-005-20240206   clang
i386                  randconfig-006-20240206   clang
i386                  randconfig-011-20240206   clang
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-013-20240206   clang
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-016-20240206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240206   gcc  
loongarch             randconfig-002-20240206   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          malta_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240206   gcc  
nios2                 randconfig-002-20240206   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240206   gcc  
parisc                randconfig-002-20240206   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240206   clang
powerpc               randconfig-002-20240206   gcc  
powerpc               randconfig-003-20240206   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240206   gcc  
powerpc64             randconfig-002-20240206   clang
powerpc64             randconfig-003-20240206   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240206   gcc  
riscv                 randconfig-002-20240206   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240206   clang
s390                  randconfig-002-20240206   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240206   gcc  
sh                    randconfig-002-20240206   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240206   gcc  
sparc64               randconfig-002-20240206   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240206   clang
um                    randconfig-002-20240206   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-076-20240206   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240206   gcc  
xtensa                randconfig-002-20240206   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
