Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B886C65F079
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD3110E123;
	Thu,  5 Jan 2023 15:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED6F10E11F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672933821; x=1704469821;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=RJatMYrbPfEvNurBxtLaBiUJD4LCEtP8VKvLxxz/leM=;
 b=QPQuRG5/X0TGbFwY1aNpTZPPg0xboE5ar9Nt+QhfifD6+lTGESvGjUf0
 rBc1bZOy1SFh2k50fV2mwD3IqabbnVgHxV2BcacGGjtJ8f52jzQxnTpIl
 NN32R9iBkulz6XQRVFXZKvBlAtsHXGCbhT/Q+7ZzFyWJEC1p+usM843LA
 gjwz7SNkGXSqnyj0qvQo8fQrHycDm6PJX/qC0cXra6ZtHy8MD7KEp8cRO
 s8OKqO04H8HpkIdRci3SWduaUlBvZY7/02dJXRaDM88H8E+hLASn98nZk
 PVlO+jbxle7CbVkpsztBSHfZuhnWliYAjsSHjJhJSfEsIye39CRl84aKk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="310026050"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="310026050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 07:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="633190458"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="633190458"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 05 Jan 2023 07:50:18 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pDSVV-0001zD-1E;
 Thu, 05 Jan 2023 15:50:17 +0000
Date: Thu, 05 Jan 2023 23:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 cc3c08b41a9c9402ead726ec6deb1217081d0d8b
Message-ID: <63b6f194.O4eKwdyFWFrII4HE%lkp@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-block@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>,
 loongarch@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: cc3c08b41a9c9402ead726ec6deb1217081d0d8b  Add linux-next specific files for 20230105

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202212090509.NjAl9tbo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212170128.DFuMhkwh-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WARNING: undefined label: drm_accel_node (if the link has no caption the label must precede a section header)
Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
aarch64-linux-ld: ID map text too big or misaligned
arch/loongarch/kernel/asm-offsets.c:265:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/block/null_blk/zoned.c:769 zone_cond_store() warn: potential spectre issue 'dev->zones' [w] (local cap)
drivers/clk/qcom/camcc-sm6350.c:1745:15: sparse: sparse: symbol 'camcc_sm6350_hws' was not declared. Should it be static?
fs/udf/file.c:177 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- aarch64-linux-ld:ID-map-text-too-big-or-misaligned
|-- loongarch-allyesconfig
|   `-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_pbe_defines
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
|-- parisc-randconfig-m041-20230102
|   `-- fs-udf-file.c-udf_file_write_iter()-warn:inconsistent-returns-iinfo-i_data_sem-.
|-- riscv-randconfig-m031-20230105
|   |-- drivers-block-null_blk-zoned.c-zone_cond_store()-warn:potential-spectre-issue-dev-zones-w-(local-cap)
|   `-- drivers-regulator-tps65219-regulator.c-tps65219_regulator_probe()-warn:unsigned-rdev-is-never-less-than-zero.
|-- riscv-randconfig-s032-20230105
|   `-- drivers-clk-qcom-camcc-sm6350.c:sparse:sparse:symbol-camcc_sm6350_hws-was-not-declared.-Should-it-be-static
`-- x86_64-allnoconfig
    |-- Documentation-gpu-drm-internals:.-include-drm-drm_file.h:WARNING:undefined-label:drm_accel_node-(if-the-link-has-no-caption-the-label-must-precede-a-section-header)
    `-- Warning:tools-power-cpupower-man-cpupower-powercap-info.-references-a-file-that-doesn-t-exist:Documentation-power-powercap-powercap.txt
clang_recent_errors
`-- x86_64-rhel-8.3-rust
    `-- vmlinux.o:warning:objtool:___ksymtab_gpl-_RNvNtCsfATHBUcknU9_6kernel5print16call_printk_cont:data-relocation-to-ENDBR:_RNvNtCsfATHBUcknU9_6kernel5print16call_printk_cont

elapsed time: 726m

configs tested: 62
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
i386                          randconfig-a012
alpha                            allyesconfig
i386                          randconfig-a016
x86_64                              defconfig
m68k                             allyesconfig
arc                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-a001
alpha                               defconfig
arc                  randconfig-r043-20230105
s390                                defconfig
i386                          randconfig-a003
s390                             allmodconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
s390                 randconfig-r044-20230105
i386                             allyesconfig
arm                                 defconfig
s390                             allyesconfig
riscv                randconfig-r042-20230105
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
arm                  randconfig-r046-20230105
i386                          randconfig-a002
x86_64                        randconfig-a016
hexagon              randconfig-r041-20230105
i386                          randconfig-a004
hexagon              randconfig-r045-20230105
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
