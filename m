Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C794F83A00F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F6A10F5D8;
	Wed, 24 Jan 2024 03:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BACB10E670;
 Wed, 24 Jan 2024 03:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706066691; x=1737602691;
 h=date:from:to:cc:subject:message-id;
 bh=OO19hjBQfesEcdq/8aueMqCyeS0pJFWXiXzBPSArfMQ=;
 b=f5LEv8MWUrKKrLC1TxbHAiowHNF341udABcIGfZ742pmQT0jxTas4dq1
 DUNy4o/t+lSnihkpD9Kk0rK2xKAwCTcW/n4kuZ8WrYCt8tM63dHzKi2/+
 XBCYVPTsj/O3wqEljV4jKtCzejopHqaEyF+iomID7YArI/hOetIKRrgOI
 bxIqHkE0B1YzynPlY4vPpejeXRxFnLMF98TTIv3/HV+T4gcWNxaKywFZI
 pPimOCTXFcFRtQ44hoxPNkbVAYjJMzbs6BusadSD+gC4gcQ/alxjP8yAf
 cB4iDn2xxrNMBlwB1azk4B2vaZOJIt8Afn7MxEyojf43vFP1PNFOiFDvL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8381513"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8381513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 19:24:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959366456"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="959366456"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 23 Jan 2024 19:24:48 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rSTsb-0007pR-27;
 Wed, 24 Jan 2024 03:24:45 +0000
Date: Wed, 24 Jan 2024 11:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 774551425799cb5bbac94e1768fd69eec4f78dd4
Message-ID: <202401241153.saaJ1jP1-lkp@intel.com>
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
Cc: linux-bcachefs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, etnaviv@lists.freedesktop.org,
 kasan-dev@googlegroups.com, Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 774551425799cb5bbac94e1768fd69eec4f78dd4  Add linux-next specific files for 20240123

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401231518.8q9LD8n7-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202401240123.wBsFom3Z-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/dma/at_hdmac.c:255: warning: Enum value 'ATC_IS_CYCLIC' not described in enum 'atc_status'
drivers/dma/at_hdmac.c:255: warning: Enum value 'ATC_IS_PAUSED' not described in enum 'atc_status'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r062-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- arm-multi_v5_defconfig
|   |-- drivers-dma-at_hdmac.c:warning:Enum-value-ATC_IS_CYCLIC-not-described-in-enum-atc_status
|   `-- drivers-dma-at_hdmac.c:warning:Enum-value-ATC_IS_PAUSED-not-described-in-enum-atc_status
|-- i386-randconfig-051-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- i386-randconfig-054-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- i386-randconfig-062-20240123
|   |-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int-assigned-csum
|-- i386-randconfig-141-20240123
|   |-- fs-bcachefs-btree_locking.c-bch2_trans_relock()-warn:passing-zero-to-PTR_ERR
|   |-- fs-bcachefs-buckets.c-bch2_trans_account_disk_usage_change()-error:we-previously-assumed-trans-disk_res-could-be-null-(see-line-)
|   `-- mm-huge_memory.c-thpsize_create()-warn:Calling-kobject_put-get-with-state-initialized-unset-from-line:
|-- microblaze-randconfig-r064-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- microblaze-randconfig-r123-20240123
|   `-- drivers-regulator-qcom_smd-regulator.c:sparse:sparse:symbol-smd_vreg_rpm-was-not-declared.-Should-it-be-static
|-- mips-allyesconfig
|   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_secondary
|   `-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_entry
|-- nios2-randconfig-r052-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- nios2-randconfig-r054-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- openrisc-randconfig-r131-20240123
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-unsigned-int-assigned-csum
|-- sh-randconfig-r133-20240123
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int-assigned-csum
|-- x86_64-randconfig-101-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
|-- x86_64-randconfig-102-20240123
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
`-- x86_64-randconfig-161-20240123
    |-- mm-huge_memory.c-thpsize_create()-warn:Calling-kobject_put-get-with-state-initialized-unset-from-line:
    |-- mm-kasan-kasan_test.c-mempool_double_free_helper()-error:double-free-of-elem
    `-- mm-kasan-kasan_test.c-mempool_uaf_helper()-warn:passing-freed-memory-elem
clang_recent_errors
|-- x86_64-randconfig-121-20240123
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-unsigned-int-assigned-csum
`-- x86_64-randconfig-r132-20240123
    `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-unsigned-int-assigned-csum

elapsed time: 1483m

configs tested: 177
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240123   gcc  
arc                   randconfig-002-20240123   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          ixp4xx_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240123   gcc  
arm                   randconfig-002-20240123   gcc  
arm                   randconfig-003-20240123   gcc  
arm                   randconfig-004-20240123   gcc  
arm                       versatile_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240123   gcc  
arm64                 randconfig-002-20240123   gcc  
arm64                 randconfig-003-20240123   gcc  
arm64                 randconfig-004-20240123   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240123   gcc  
csky                  randconfig-002-20240123   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240123   clang
hexagon               randconfig-002-20240123   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240123   gcc  
i386         buildonly-randconfig-002-20240123   gcc  
i386         buildonly-randconfig-003-20240123   gcc  
i386         buildonly-randconfig-004-20240123   gcc  
i386         buildonly-randconfig-005-20240123   gcc  
i386         buildonly-randconfig-006-20240123   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240123   gcc  
i386                  randconfig-002-20240123   gcc  
i386                  randconfig-003-20240123   gcc  
i386                  randconfig-004-20240123   gcc  
i386                  randconfig-005-20240123   gcc  
i386                  randconfig-006-20240123   gcc  
i386                  randconfig-011-20240123   clang
i386                  randconfig-012-20240123   clang
i386                  randconfig-013-20240123   clang
i386                  randconfig-014-20240123   clang
i386                  randconfig-015-20240123   clang
i386                  randconfig-016-20240123   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240123   gcc  
loongarch             randconfig-002-20240123   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                       lemote2f_defconfig   gcc  
mips                        omega2p_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240123   gcc  
nios2                 randconfig-002-20240123   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240123   gcc  
parisc                randconfig-002-20240123   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc               randconfig-001-20240123   gcc  
powerpc               randconfig-002-20240123   gcc  
powerpc               randconfig-003-20240123   gcc  
powerpc64             randconfig-001-20240123   gcc  
powerpc64             randconfig-002-20240123   gcc  
powerpc64             randconfig-003-20240123   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240123   gcc  
riscv                 randconfig-002-20240123   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240123   clang
s390                  randconfig-002-20240123   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240123   gcc  
sh                    randconfig-002-20240123   gcc  
sh                           se7206_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240123   gcc  
sparc64               randconfig-002-20240123   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240123   gcc  
um                    randconfig-002-20240123   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240123   gcc  
x86_64       buildonly-randconfig-002-20240123   gcc  
x86_64       buildonly-randconfig-003-20240123   gcc  
x86_64       buildonly-randconfig-004-20240123   gcc  
x86_64       buildonly-randconfig-005-20240123   gcc  
x86_64       buildonly-randconfig-006-20240123   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240123   clang
x86_64                randconfig-002-20240123   clang
x86_64                randconfig-003-20240123   clang
x86_64                randconfig-004-20240123   clang
x86_64                randconfig-005-20240123   clang
x86_64                randconfig-006-20240123   clang
x86_64                randconfig-011-20240123   gcc  
x86_64                randconfig-012-20240123   gcc  
x86_64                randconfig-013-20240123   gcc  
x86_64                randconfig-014-20240123   gcc  
x86_64                randconfig-015-20240123   gcc  
x86_64                randconfig-016-20240123   gcc  
x86_64                randconfig-071-20240123   gcc  
x86_64                randconfig-072-20240123   gcc  
x86_64                randconfig-073-20240123   gcc  
x86_64                randconfig-074-20240123   gcc  
x86_64                randconfig-075-20240123   gcc  
x86_64                randconfig-076-20240123   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240123   gcc  
xtensa                randconfig-002-20240123   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
