Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F14720862
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 19:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7971910E5EB;
	Fri,  2 Jun 2023 17:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C752010E5EB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 17:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685727055; x=1717263055;
 h=date:from:to:cc:subject:message-id;
 bh=95NNPKeCDWvKs2XdDPj6/a0IDRIxJ5J5Rri6CmgQVSQ=;
 b=aX34bsmzLfefQxEbh+/0lxACfnsqiN5k3VMA0SJA917cUvvpiGUE1Yxp
 oKIAMQ/LhmKrx2j3Ur78A6mML2jovHR8/0AhZ8hLZ9qjtEalVbWi8pIr+
 PQ2m8DrfMpM1opLQbbUMQX/Wu8V/N+ckh0N6YdqPGqFOV3kkUlUZzbUam
 nHj17AOqaHnmQAaZDDeO6zO92uDkH9LlacqQ3UhxThYFEmrhC91tKFmIg
 SDbZFV4Yac8hIYR2EboRPe3G3DV1RhgGceuiQW+Qfcw4NmDboJ9ZBtuqj
 jrsek8AjmHMfboXU+8J8kd+IH/HWCI1jo//zBBdrAoNvYkDg4arDcZQBp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="421738291"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="421738291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="954575143"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="954575143"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 02 Jun 2023 10:30:51 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q58by-0000mD-35;
 Fri, 02 Jun 2023 17:30:50 +0000
Date: Sat, 03 Jun 2023 01:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 bc708bbd8260ee4eb3428b0109f5f3be661fae46
Message-ID: <20230602173029.dm5Hs%lkp@intel.com>
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
Cc: linux-xfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: bc708bbd8260ee4eb3428b0109f5f3be661fae46  Add linux-next specific files for 20230602

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306011435.2BxsHFUE-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306021936.OktTcMAT-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'mc_bus_dev' is uninitialized when used here [-Wuninitialized]
include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
mm/zswap.c:1210:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

Unverified Error/Warning (likely false positive, please contact us if interested):

fs/btrfs/volumes.c:6412 btrfs_map_block() error: we previously assumed 'mirror_num_ret' could be null (see line 6250)
fs/smb/client/cifsfs.c:982 cifs_smb3_do_mount() warn: possible memory leak of 'cifs_sb'
fs/smb/client/cifssmb.c:4089 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4216 CIFSFindNext() warn: missing error code? 'rc'
fs/smb/client/connect.c:2725 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()
fs/smb/client/connect.c:2924 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2912)
fs/xfs/scrub/fscounters.c:459 xchk_fscounters() warn: ignoring unreachable code.
kernel/events/uprobes.c:478 uprobe_write_opcode() warn: passing zero to 'PTR_ERR'
{standard input}:1078: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   `-- include-drm-drm_print.h:error:format-ld-expects-argument-of-type-long-int-but-argument-has-type-size_t-aka-unsigned-int
|-- i386-randconfig-m021-20230531
|   |-- fs-smb-client-cifsfs.c-cifs_smb3_do_mount()-warn:possible-memory-leak-of-cifs_sb
|   |-- fs-smb-client-cifssmb.c-CIFSFindFirst()-warn:missing-error-code-rc
|   |-- fs-smb-client-cifssmb.c-CIFSFindNext()-warn:missing-error-code-rc
|   |-- fs-smb-client-connect.c-cifs_match_super()-error:tlink-dereferencing-possible-ERR_PTR()
|   |-- fs-smb-client-connect.c-generic_ip_connect()-error:we-previously-assumed-socket-could-be-null-(see-line-)
|   |-- fs-xfs-scrub-fscounters.c-xchk_fscounters()-warn:ignoring-unreachable-code.
|   `-- kernel-events-uprobes.c-uprobe_write_opcode()-warn:passing-zero-to-PTR_ERR
|-- sh-allmodconfig
|   `-- standard-input:Error:pcrel-too-far
`-- x86_64-randconfig-m001-20230531
    |-- fs-btrfs-volumes.c-btrfs_map_block()-error:we-previously-assumed-mirror_num_ret-could-be-null-(see-line-)
    |-- fs-smb-client-cifsfs.c-cifs_smb3_do_mount()-warn:possible-memory-leak-of-cifs_sb
    |-- fs-smb-client-cifssmb.c-CIFSFindFirst()-warn:missing-error-code-rc
    |-- fs-smb-client-cifssmb.c-CIFSFindNext()-warn:missing-error-code-rc
    |-- fs-smb-client-connect.c-cifs_match_super()-error:tlink-dereferencing-possible-ERR_PTR()
    |-- fs-smb-client-connect.c-generic_ip_connect()-error:we-previously-assumed-socket-could-be-null-(see-line-)
    |-- fs-xfs-scrub-fscounters.c-xchk_fscounters()-warn:ignoring-unreachable-code.
    `-- kernel-events-uprobes.c-uprobe_write_opcode()-warn:passing-zero-to-PTR_ERR
clang_recent_errors
|-- arm64-randconfig-r012-20230602
|   `-- drivers-bus-fsl-mc-fsl-mc-allocator.c:warning:variable-mc_bus_dev-is-uninitialized-when-used-here
|-- hexagon-allmodconfig
|   `-- mm-zswap.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r045-20230531
|   `-- mm-zswap.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
`-- s390-randconfig-r044-20230531
    `-- mm-zswap.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true

elapsed time: 726m

configs tested: 122
configs skipped: 5

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230531   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc          buildonly-randconfig-r005-20230602   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                           omap1_defconfig   clang
arm                  randconfig-r046-20230531   gcc  
arm                         s5pv210_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230602   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230531   clang
csky                             alldefconfig   gcc  
csky         buildonly-randconfig-r004-20230602   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230531   gcc  
hexagon              randconfig-r016-20230601   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230602   gcc  
i386                 randconfig-i002-20230602   gcc  
i386                 randconfig-i003-20230602   gcc  
i386                 randconfig-i004-20230602   gcc  
i386                 randconfig-i005-20230602   gcc  
i386                 randconfig-i006-20230602   gcc  
i386                 randconfig-i051-20230602   gcc  
i386                 randconfig-i052-20230602   gcc  
i386                 randconfig-i053-20230602   gcc  
i386                 randconfig-i054-20230602   gcc  
i386                 randconfig-i055-20230602   gcc  
i386                 randconfig-i056-20230602   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230601   gcc  
m68k                 randconfig-r014-20230601   gcc  
m68k                           sun3_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           ip28_defconfig   clang
mips                           xway_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230531   gcc  
parisc       buildonly-randconfig-r006-20230602   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230601   gcc  
parisc               randconfig-r036-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc              randconfig-r006-20230531   gcc  
powerpc              randconfig-r012-20230601   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r023-20230531   clang
riscv                randconfig-r034-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh           buildonly-randconfig-r002-20230602   gcc  
sh                   randconfig-r003-20230531   gcc  
sh                   randconfig-r015-20230601   gcc  
sh                   randconfig-r033-20230531   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230531   gcc  
sparc64              randconfig-r002-20230531   gcc  
sparc64              randconfig-r032-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230602   gcc  
xtensa               randconfig-r031-20230531   gcc  
xtensa               randconfig-r035-20230531   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
