Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B637744C3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 20:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97310E3ED;
	Tue,  8 Aug 2023 18:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2223B10E3EB;
 Tue,  8 Aug 2023 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519291; x=1723055291;
 h=date:from:to:cc:subject:message-id;
 bh=pLS3XAzhWcP03CfQz26/7Pbx+Vr0gUmfabYeuaEMGyY=;
 b=koibOGyACY8AdzAaNGPJEtx1UXxxl+z8NbLJYn+Wgin3PDDf6l3Z/GnW
 w6RnkxPEOXylyjAqd3l3ocHSh0iIPKlwkVb0aJT1/21lkKoJO+Ej5YaCI
 C6rGVpS+i8yL59VPpGmIxImlVeQOJfijnSZjqV7J/Uy/NOBsLqR2nB0kP
 cHAm/wgyIinz8RlDPH5K2pGq0cEuEyGdsRPB5t01jVYJgj7uGbky25b0E
 2i6VwSltEtzfle3/ep+iisJfFYnVkLrzDvn20pWdRonUr8z5nOvOyX8mV
 pl4F4Dr4IrCsbWgi2V3kAIJZecKq/y/n8HY/xOT5H2zRCHEEe5CT2ogvQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351220414"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="351220414"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796829004"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="796829004"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 08 Aug 2023 11:28:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qTRR9-0005X0-06;
 Tue, 08 Aug 2023 18:28:07 +0000
Date: Wed, 09 Aug 2023 02:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
Message-ID: <202308090244.cGlSt5H7-lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 71cd4fc492ec41e4acd85e98bbf7a13753fc1e03  Add linux-next specific files for 20230808

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308081459.US5rLYAY-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:37: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
sound/soc/codecs/aw88261.c:651:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/tests/drm_exec_test.c:166 test_prepare_array() error: uninitialized symbol 'ret'.
drivers/mtd/nand/raw/qcom_nandc.c:2590 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
drivers/mtd/nand/raw/qcom_nandc.c:3017 qcom_check_op() warn: was && intended here instead of ||?
kernel/futex/waitwake.c:422 futex_wait_multiple_setup() warn: bitwise AND condition is false here
sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:927: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- csky-randconfig-m041-20230808
|   `-- drivers-gpu-drm-tests-drm_exec_test.c-test_prepare_array()-error:uninitialized-symbol-ret-.
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- mips-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- riscv-randconfig-m031-20230808
|   |-- drivers-gpu-drm-tests-drm_exec_test.c-test_prepare_array()-error:uninitialized-symbol-ret-.
|   |-- drivers-mtd-nand-raw-qcom_nandc.c-qcom_check_op()-warn:was-intended-here-instead-of
|   |-- drivers-mtd-nand-raw-qcom_nandc.c-qcom_op_cmd_mapping()-error:uninitialized-symbol-ret-.
|   `-- kernel-futex-waitwake.c-futex_wait_multiple_setup()-warn:bitwise-AND-condition-is-false-here
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- s390-randconfig-r044-20230808
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- sparc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
`-- xtensa-randconfig-r022-20230808
    `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
clang_recent_errors
`-- arm64-randconfig-r006-20230808
    `-- sound-soc-codecs-aw88261.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false

elapsed time: 721m

configs tested: 106
configs skipped: 5

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r034-20230808   gcc  
arc                  randconfig-r043-20230808   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230808   clang
arm                  randconfig-r046-20230808   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230808   clang
csky                                defconfig   gcc  
csky                 randconfig-r024-20230808   gcc  
hexagon              randconfig-r015-20230808   clang
hexagon              randconfig-r031-20230808   clang
hexagon              randconfig-r041-20230808   clang
hexagon              randconfig-r045-20230808   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230808   clang
i386         buildonly-randconfig-r005-20230808   clang
i386         buildonly-randconfig-r006-20230808   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230808   clang
i386                 randconfig-i002-20230808   clang
i386                 randconfig-i003-20230808   clang
i386                 randconfig-i004-20230808   clang
i386                 randconfig-i005-20230808   clang
i386                 randconfig-i006-20230808   clang
i386                 randconfig-i011-20230808   gcc  
i386                 randconfig-i012-20230808   gcc  
i386                 randconfig-i013-20230808   gcc  
i386                 randconfig-i014-20230808   gcc  
i386                 randconfig-i015-20230808   gcc  
i386                 randconfig-i016-20230808   gcc  
i386                 randconfig-r014-20230808   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230808   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230808   gcc  
parisc               randconfig-r016-20230808   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r005-20230808   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230808   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230808   gcc  
s390                 randconfig-r023-20230808   gcc  
s390                 randconfig-r044-20230808   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230808   gcc  
sh                   randconfig-r025-20230808   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r033-20230808   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230808   clang
x86_64       buildonly-randconfig-r002-20230808   clang
x86_64       buildonly-randconfig-r003-20230808   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230808   clang
x86_64               randconfig-r021-20230808   gcc  
x86_64               randconfig-x001-20230808   gcc  
x86_64               randconfig-x002-20230808   gcc  
x86_64               randconfig-x003-20230808   gcc  
x86_64               randconfig-x004-20230808   gcc  
x86_64               randconfig-x005-20230808   gcc  
x86_64               randconfig-x006-20230808   gcc  
x86_64               randconfig-x011-20230808   clang
x86_64               randconfig-x012-20230808   clang
x86_64               randconfig-x013-20230808   clang
x86_64               randconfig-x014-20230808   clang
x86_64               randconfig-x015-20230808   clang
x86_64               randconfig-x016-20230808   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r013-20230808   gcc  
xtensa               randconfig-r022-20230808   gcc  
xtensa               randconfig-r035-20230808   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
