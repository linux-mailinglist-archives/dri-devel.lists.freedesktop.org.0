Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D21277D789
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 03:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959BA10E2AC;
	Wed, 16 Aug 2023 01:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EBD10E2AC;
 Wed, 16 Aug 2023 01:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692148582; x=1723684582;
 h=date:from:to:cc:subject:message-id;
 bh=hX8g9/SbYGIqQso/VYxKc3ib964biiZXGoA4p6jFmLI=;
 b=hF0VbwiRm+vLBmT/cNPp+9g2truHYBj50rwlhA7RyEQ7lZT6D5AyM4NW
 ztz58zm7rSv63Ghvgp8/EFlEzIKuo3TCFspSpLi9cjERPkXn8H47tqPAk
 PCvHX4NJFemz1eNTqoAni7r7EwsFDlhAYIuJMkssEAYZMUCjxZuxj7B/i
 4amVmlRFUBzrbFYfBfF1hHibWXCCAkkknQv7y7uoBwOYTCWIjpgURDAnO
 USShgalmQT8kuMslSFiybybkZcAo/5wYDz4nY/CT9X0ndsYyjQUKPtY9f
 1b2A4yhaRk4gFU5bnMgEN02t5xmXP2EjMW7mNTJoUHAzE0TisaxgLIq6D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375184475"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="375184475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 18:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769016988"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="769016988"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 18:16:19 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qW58z-0001NH-30;
 Wed, 16 Aug 2023 01:16:17 +0000
Date: Wed, 16 Aug 2023 09:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 98297fc6ecafc0c7eabc5d869279fb27609fcdc1
Message-ID: <202308160948.Bs2IPJB9-lkp@intel.com>
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
Cc: linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rcu@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-crypto@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 98297fc6ecafc0c7eabc5d869279fb27609fcdc1  Add linux-next specific files for 20230815

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308081459.US5rLYAY-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308111853.ISf5a6VC-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308111926.gYjAUtn4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308112307.TPmYbd3L-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308112326.AJAVWCOC-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308160339.zgEoGVDN-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:37: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/drm_gpuva_mgr.c:1079:39: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting prototype for drm_kunit_helper_context_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead
drivers/video/backlight/lp855x_bl.c:252:11: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
drivers/watchdog/xilinx_wwdt.c:74: undefined reference to `__udivdi3'
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
kernel/rcu/update.c:529:6: warning: no previous prototype for 'torture_sched_setaffinity' [-Wmissing-prototypes]
kernel/rcu/update.c:529:6: warning: no previous prototype for function 'torture_sched_setaffinity' [-Wmissing-prototypes]
make[3]: *** No rule to make target 'rustdoc'.

Unverified Error/Warning (likely false positive, please contact us if interested):

lib/crypto/mpi/mpi-inv.c:34:15: warning: variable 'k' set but not used [-Wunused-but-set-variable]
sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:927: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- alpha-randconfig-r006-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- alpha-randconfig-r021-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- arc-randconfig-r043-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- arm-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- arm64-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-debian-10.3
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- i386-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- i386-randconfig-i011-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-randconfig-i012-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-randconfig-i013-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-randconfig-i014-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-randconfig-i015-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-randconfig-i016-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- i386-randconfig-r024-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- loongarch-allnoconfig
|   `-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_thread_lbt_defines
|-- loongarch-defconfig
|   |-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_thread_lbt_defines
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- include-linux-build_bug.h:error:bit-field-anonymous-width-not-an-integer-constant
|-- loongarch-randconfig-r033-20230815
|   |-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_thread_lbt_defines
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- m68k-allmodconfig
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- m68k-allyesconfig
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- m68k-randconfig-r032-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|-- microblaze-randconfig-r021-20230816
|   `-- drivers-watchdog-xilinx_wwdt.c:undefined-reference-to-__udivdi3
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- mips-randconfig-r005-20230815
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- nios2-randconfig-r011-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- openrisc-randconfig-r012-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|-- openrisc-randconfig-r015-20230815
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- parisc-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- parisc-randconfig-m031-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|-- parisc-randconfig-r022-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- parisc-randconfig-r026-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- parisc64-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- powerpc-randconfig-r013-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- riscv-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- riscv-randconfig-r025-20230815
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- riscv-randconfig-r042-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- riscv-rv32_defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- s390-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- s390-defconfig
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- s390-randconfig-r044-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- sh-allmodconfig
|   |-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- sparc-randconfig-r036-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- sparc64-randconfig-r001-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- sparc64-randconfig-r003-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- sparc64-randconfig-r016-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-defconfig
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- x86_64-randconfig-x001-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-randconfig-x002-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-randconfig-x003-20230815
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_replay.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-randconfig-x004-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-randconfig-x005-20230815
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-randconfig-x006-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
|-- x86_64-rhel-8.3
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
`-- xtensa-randconfig-r031-20230815
    |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
    `-- kernel-rcu-update.c:warning:no-previous-prototype-for-torture_sched_setaffinity
clang_recent_errors
|-- arm64-randconfig-r004-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- arm64-randconfig-r013-20230816
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- hexagon-randconfig-r035-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- hexagon-randconfig-r041-20230815
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-buildonly-randconfig-r004-20230815
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-buildonly-randconfig-r005-20230815
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-buildonly-randconfig-r006-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-randconfig-i001-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-randconfig-i002-20230815
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-randconfig-i003-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-randconfig-i004-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- i386-randconfig-i005-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-buildonly-randconfig-r001-20230815
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-buildonly-randconfig-r002-20230815
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-r034-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x011-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x012-20230815
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x013-20230815
|   `-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|-- x86_64-randconfig-x014-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x015-20230815
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x016-20230815
|   `-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|-- x86_64-randconfig-x071-20230815
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x073-20230815
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x074-20230815
|   `-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|-- x86_64-randconfig-x075-20230815
|   |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
|   `-- kernel-rcu-update.c:warning:no-previous-prototype-for-function-torture_sched_setaffinity
|-- x86_64-randconfig-x076-20230815
|   `-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
`-- x86_64-rhel-8.3-rust
    |-- drivers-video-backlight-lp855x_bl.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-false
    `-- make:No-rule-to-make-target-rustdoc-.

elapsed time: 724m

configs tested: 112
configs skipped: 5

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230815   gcc  
alpha                randconfig-r021-20230815   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230815   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                  randconfig-r046-20230815   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230815   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230815   gcc  
hexagon              randconfig-r035-20230815   clang
hexagon              randconfig-r041-20230815   clang
hexagon              randconfig-r045-20230815   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230815   clang
i386         buildonly-randconfig-r005-20230815   clang
i386         buildonly-randconfig-r006-20230815   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230815   clang
i386                 randconfig-i002-20230815   clang
i386                 randconfig-i003-20230815   clang
i386                 randconfig-i004-20230815   clang
i386                 randconfig-i005-20230815   clang
i386                 randconfig-i006-20230815   clang
i386                 randconfig-i011-20230815   gcc  
i386                 randconfig-i012-20230815   gcc  
i386                 randconfig-i013-20230815   gcc  
i386                 randconfig-i014-20230815   gcc  
i386                 randconfig-i015-20230815   gcc  
i386                 randconfig-i016-20230815   gcc  
i386                 randconfig-r024-20230815   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r033-20230815   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                 randconfig-r032-20230815   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230815   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230815   gcc  
openrisc             randconfig-r012-20230815   gcc  
openrisc             randconfig-r015-20230815   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230815   gcc  
parisc               randconfig-r026-20230815   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230815   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r025-20230815   gcc  
riscv                randconfig-r042-20230815   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230815   gcc  
sh                               allmodconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r036-20230815   gcc  
sparc64              randconfig-r001-20230815   gcc  
sparc64              randconfig-r003-20230815   gcc  
sparc64              randconfig-r016-20230815   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230815   clang
x86_64       buildonly-randconfig-r002-20230815   clang
x86_64       buildonly-randconfig-r003-20230815   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r034-20230815   clang
x86_64               randconfig-x001-20230815   gcc  
x86_64               randconfig-x002-20230815   gcc  
x86_64               randconfig-x003-20230815   gcc  
x86_64               randconfig-x004-20230815   gcc  
x86_64               randconfig-x005-20230815   gcc  
x86_64               randconfig-x006-20230815   gcc  
x86_64               randconfig-x011-20230815   clang
x86_64               randconfig-x012-20230815   clang
x86_64               randconfig-x013-20230815   clang
x86_64               randconfig-x014-20230815   clang
x86_64               randconfig-x015-20230815   clang
x86_64               randconfig-x016-20230815   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r031-20230815   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
