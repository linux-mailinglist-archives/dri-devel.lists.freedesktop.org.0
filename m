Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AB837E3E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45810F2E7;
	Tue, 23 Jan 2024 01:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2989110F2B1;
 Tue, 23 Jan 2024 01:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705973782; x=1737509782;
 h=date:from:to:cc:subject:message-id;
 bh=CZClXwj7731nvVzB7BGJwX6LGZdjRnFR3hr4pIOjVPM=;
 b=IgVyfqd480IGJ3XpiVcU0mIeu6Ege3gZzqB7BfWplURUBZNiKqZvQCZ1
 vbpEY/zZQ1B6w7EVQzMFlYLrFwnkw0tzOkn2tOS4tsJjEwhMmOiIDafbO
 i3JpaZ+b5bktr5YbgVzTf1T3rr9EndecQMxZeD8nWKlNd2PW+B6t6ZqFU
 XwdzxLYgP0or3pTuIr3Qv27d+cunBd0sUY1NXUxcG/JrWBIFSX0Y1kU9X
 YNc3QcXO4aSkcjQLEXnTJ0tu0nnNtXLnAKsFOq9umGKeX0f17Fl6Oe4QA
 vurTvKIBV4dGP9oY+78O4RWxBln3FsUYpx7a06wHqoYpXGDE5eUvsK5J8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="398531567"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="398531567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 17:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856145765"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="856145765"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jan 2024 17:36:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rS5i3-00074a-2k;
 Tue, 23 Jan 2024 01:36:15 +0000
Date: Tue, 23 Jan 2024 09:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 319fbd8fc6d339e0a1c7b067eed870c518a13a02
Message-ID: <202401230901.Q0DlNgAU-lkp@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, linux-bcachefs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 etnaviv@lists.freedesktop.org, kasan-dev@googlegroups.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 319fbd8fc6d339e0a1c7b067eed870c518a13a02  Add linux-next specific files for 20240122

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-randconfig-002-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- loongarch-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- loongarch-defconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- loongarch-randconfig-r122-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- mips-allyesconfig
|   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_secondary
|   |-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_entry
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- openrisc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sh-randconfig-r131-20240122
|   |-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int-assigned-csum
|-- sparc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sparc64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sparc64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sparc64-randconfig-r123-20240122
|   `-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|-- um-randconfig-r111-20240122
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int-assigned-csum
|-- x86_64-randconfig-121-20240122
|   `-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
`-- x86_64-randconfig-r133-20240122
    `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-unsigned-int-assigned-csum
clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-randconfig-002-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-randconfig-004-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- i386-randconfig-053-20240122
|   `-- drivers-net-ethernet-broadcom-bnxt-bnxt.c:WARNING:atomic_dec_and_test-variation-before-object-free-at-line-.
|-- i386-randconfig-061-20240122
|   `-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|-- i386-randconfig-062-20240122
|   `-- drivers-usb-gadget-function-f_ncm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-max_segment_size-got-restricted-__le16-usertype
|-- i386-randconfig-141-20240122
|   |-- fs-bcachefs-btree_locking.c-bch2_trans_relock()-warn:passing-zero-to-PTR_ERR
|   |-- fs-bcachefs-buckets.c-bch2_trans_account_disk_usage_change()-error:we-previously-assumed-trans-disk_res-could-be-null-(see-line-)
|   `-- mm-huge_memory.c-thpsize_create()-warn:Calling-kobject_put-get-with-state-initialized-unset-from-line:
|-- powerpc-randconfig-r113-20240122
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-sum-got-unsigned-int-assigned-csum
|   `-- mm-kasan-common.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-gfp_t-usertype-flags-got-unsigned-int-usertype-size
|-- riscv-randconfig-001-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-buildonly-randconfig-001-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-014-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-074-20240122
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_crtc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-randconfig-102-20240122
|   `-- drivers-gpu-drm-etnaviv-etnaviv_drv.c:ERROR:probable-double-put.
`-- x86_64-randconfig-161-20240122
    |-- mm-kasan-kasan_test.c-mempool_double_free_helper()-error:double-free-of-elem
    `-- mm-kasan-kasan_test.c-mempool_uaf_helper()-warn:passing-freed-memory-elem

elapsed time: 1454m

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
arc                   randconfig-001-20240122   gcc  
arc                   randconfig-002-20240122   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                        neponset_defconfig   clang
arm                   randconfig-001-20240122   clang
arm                   randconfig-002-20240122   clang
arm                   randconfig-003-20240122   clang
arm                   randconfig-004-20240122   clang
arm                           stm32_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240122   clang
arm64                 randconfig-002-20240122   clang
arm64                 randconfig-003-20240122   clang
arm64                 randconfig-004-20240122   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240122   gcc  
csky                  randconfig-002-20240122   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240122   clang
hexagon               randconfig-002-20240122   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240122   clang
i386         buildonly-randconfig-002-20240122   clang
i386         buildonly-randconfig-003-20240122   clang
i386         buildonly-randconfig-004-20240122   clang
i386         buildonly-randconfig-005-20240122   clang
i386         buildonly-randconfig-006-20240122   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240122   clang
i386                  randconfig-002-20240122   clang
i386                  randconfig-003-20240122   clang
i386                  randconfig-004-20240122   clang
i386                  randconfig-005-20240122   clang
i386                  randconfig-006-20240122   clang
i386                  randconfig-011-20240122   gcc  
i386                  randconfig-012-20240122   gcc  
i386                  randconfig-013-20240122   gcc  
i386                  randconfig-014-20240122   gcc  
i386                  randconfig-015-20240122   gcc  
i386                  randconfig-016-20240122   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240122   gcc  
loongarch             randconfig-002-20240122   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240122   gcc  
nios2                 randconfig-002-20240122   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240122   gcc  
parisc                randconfig-002-20240122   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ppc64e_defconfig   clang
powerpc               randconfig-001-20240122   clang
powerpc               randconfig-002-20240122   clang
powerpc               randconfig-003-20240122   clang
powerpc64             randconfig-001-20240122   clang
powerpc64             randconfig-002-20240122   clang
powerpc64             randconfig-003-20240122   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240122   clang
riscv                 randconfig-002-20240122   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240122   gcc  
s390                  randconfig-002-20240122   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240122   gcc  
sh                    randconfig-002-20240122   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240122   gcc  
sparc64               randconfig-002-20240122   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240122   clang
um                    randconfig-002-20240122   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240122   clang
x86_64       buildonly-randconfig-002-20240122   clang
x86_64       buildonly-randconfig-003-20240122   clang
x86_64       buildonly-randconfig-004-20240122   clang
x86_64       buildonly-randconfig-005-20240122   clang
x86_64       buildonly-randconfig-006-20240122   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240122   gcc  
x86_64                randconfig-002-20240122   gcc  
x86_64                randconfig-003-20240122   gcc  
x86_64                randconfig-004-20240122   gcc  
x86_64                randconfig-005-20240122   gcc  
x86_64                randconfig-006-20240122   gcc  
x86_64                randconfig-011-20240122   clang
x86_64                randconfig-012-20240122   clang
x86_64                randconfig-013-20240122   clang
x86_64                randconfig-014-20240122   clang
x86_64                randconfig-015-20240122   clang
x86_64                randconfig-016-20240122   clang
x86_64                randconfig-071-20240122   clang
x86_64                randconfig-072-20240122   clang
x86_64                randconfig-073-20240122   clang
x86_64                randconfig-074-20240122   clang
x86_64                randconfig-075-20240122   clang
x86_64                randconfig-076-20240122   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240122   gcc  
xtensa                randconfig-002-20240122   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
