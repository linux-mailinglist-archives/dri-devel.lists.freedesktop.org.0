Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E526679B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 16:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C310E1A3;
	Thu, 12 Jan 2023 15:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8710E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673538228; x=1705074228;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=V5y9ZDyylHyr8acoW5TxPlUUElfJpo4XF0XdacdD66c=;
 b=Lmd6E1D8/E78IOQ6UOvlIVWVSBqQ/6Ffk8Sb0CW6vhOZnlHBW6MeFtng
 JVMdcIXIc7IXb9vBVWn0QIz3W4NhIU569BH7VvqjIYdfJp69C6fTmq+3g
 UC9ZFu9gGvq6w9BL6v34Z+GFYxTg/eUwuLHEuO+JdV0/b/w5WytIbNrNX
 mJkMs2XT4fs0ITZQfTuBXy0zDMM5RlsAFrfy2t4QIFAni5cVYtqws7CWU
 F0DwUWV8REqBr7VZi9cbzfThPWPLOHOQLIFYvLsmD5OdmRD7LpTTZoOa3
 9mgdQkNSw4hWast2yyZrdAVbiVwT3PBz9Xg5eBUAAfRM5RxvWS3rRjSbC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388222629"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="388222629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 07:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="690170770"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="690170770"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 12 Jan 2023 07:32:18 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pFzYv-000ACo-1b;
 Thu, 12 Jan 2023 15:32:17 +0000
Date: Thu, 12 Jan 2023 23:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 0a093b2893c711d82622a9ab27da4f1172821336
Message-ID: <63c027c7.lIb97dQApL6/sb/0%lkp@intel.com>
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
 linux-afs@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 0a093b2893c711d82622a9ab27da4f1172821336  Add linux-next specific files for 20230112

Error/Warning: (recently discovered and may have been fixed)

aarch64-linux-ld: ID map text too big or misaligned
drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/vc4/vc4_dsi.c:1829:14: error: no member named 'of_node' in 'struct drm_bridge'

Unverified Error/Warning (likely false positive, please contact us if interested):

net/rxrpc/recvmsg.c:384:10: warning: Local variable 'len' shadows outer argument [shadowArgument]
net/rxrpc/rxkad.c:341:10: warning: Local variable 'buf' shadows outer variable [shadowVariable]
net/rxrpc/rxkad.c:801:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
net/rxrpc/sendmsg.c:197:2: warning: Syntax Error: AST broken, 'txb' doesn't have a parent. [internalAstError]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- aarch64-linux-ld:ID-map-text-too-big-or-misaligned
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
`-- sparc-randconfig-p002-20230112
    |-- net-rxrpc-recvmsg.c:warning:Local-variable-len-shadows-outer-argument-shadowArgument
    |-- net-rxrpc-rxkad.c:warning:Local-variable-buf-shadows-outer-variable-shadowVariable
    |-- net-rxrpc-rxkad.c:warning:Redundant-initialization-for-ret-.-The-initialized-value-is-overwritten-before-it-is-read.-redundantInitialization
    `-- net-rxrpc-sendmsg.c:warning:Syntax-Error:AST-broken-txb-doesn-t-have-a-parent.-internalAstError
clang_recent_errors
`-- mips-buildonly-randconfig-r003-20230111
    `-- drivers-gpu-drm-vc4-vc4_dsi.c:error:no-member-named-of_node-in-struct-drm_bridge

elapsed time: 724m

configs tested: 62
configs skipped: 2

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
x86_64                              defconfig
i386                          randconfig-a001
x86_64                               rhel-8.3
i386                          randconfig-a003
i386                                defconfig
i386                          randconfig-a005
arc                                 defconfig
alpha                               defconfig
x86_64                           allyesconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a002
s390                             allmodconfig
um                             i386_defconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
um                           x86_64_defconfig
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
s390                                defconfig
m68k                             allyesconfig
arc                  randconfig-r043-20230110
sh                               allmodconfig
x86_64                        randconfig-a006
m68k                             allmodconfig
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
arm64                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                           rhel-8.3-bpf
alpha                            allyesconfig
powerpc                          allmodconfig
s390                 randconfig-r044-20230110
arm                              allyesconfig
riscv                randconfig-r042-20230110
i386                             allyesconfig

clang tested configs:
i386                          randconfig-a002
x86_64                          rhel-8.3-rust
i386                          randconfig-a004
hexagon              randconfig-r041-20230110
i386                          randconfig-a013
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
arm                  randconfig-r046-20230110
i386                          randconfig-a015
x86_64                        randconfig-a014
hexagon              randconfig-r045-20230110

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
