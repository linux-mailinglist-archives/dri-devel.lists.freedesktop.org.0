Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509355065FD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7639110E772;
	Tue, 19 Apr 2022 07:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7E510EC51;
 Mon, 18 Apr 2022 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650289931; x=1681825931;
 h=date:from:to:cc:subject:message-id:mime-version: in-reply-to;
 bh=zE+QgmTpYYOcBWDkX6VaFMmxdEV51P5zuNRS+jB/5lM=;
 b=HW/k8sEAFHtSOFA0ywjRpBpBF2KpMvedCmmyFuN39rRvika8k+3pHnrx
 xmGdWQ0XfFC7o8kjB47MaZoOF3ZnTmlJuSyB2mRf/PCs1hU8/gBfMZ7ED
 Ya57sFLbiYa9zUyyAWu9rFUgyYo55h/5ejr6pOcSo60yLfAz3nHYjd4H5
 qn8/rb5Zci9yzTse5qPkBc6ZtxjtAlZmpL2+EQPKh7dacN30Waj6BiJ69
 AQlDmQKAxYH9GaDlFqFjXM4EIf1aRo42cAjh7VucjbU+l3F9CbH9BbIHz
 QHLirq2BqGQ1cpqLpNJoOv7aObRvdG+FYQjfldviLewwvqpcy1Nsu12zR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="262379456"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
 d="xz'?yaml'?scan'208";a="262379456"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 06:52:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
 d="xz'?yaml'?scan'208";a="554240378"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 06:52:04 -0700
Date: Mon, 18 Apr 2022 21:52:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: [drm/i915]  9c20c625e8: WARNING:possible_recursive_locking_detected
Message-ID: <20220418135201.GB25584@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20220412193817.2098308-6-bob.beckett@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 19 Apr 2022 07:34:04 +0000
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 0day robot <lkp@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Greeting,

FYI, we noticed the following commit (built with gcc-11):

commit: 9c20c625e8f84a42c7963db854df4439553e8bc4 ("[PATCH v3 5/5] drm/i915: stolen memory use ttm backend")
url: https://github.com/intel-lab-lkp/linux/commits/Robert-Beckett/drm-i915-ttm-for-stolen-region/20220413-034123
base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link: https://lore.kernel.org/dri-devel/20220412193817.2098308-6-bob.beckett@collabora.com

in testcase: kernel-selftests
version: kernel-selftests-x86_64-a17aac1b-1_20220413
with following parameters:

	group: x86
	ucode: 0xec

test-description: The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.
test-url: https://www.kernel.org/doc/Documentation/kselftest.txt


on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 32G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):



If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


[   47.240273][  T197] WARNING: possible recursive locking detected
[   47.246317][  T197] 5.18.0-rc2-00646-g9c20c625e8f8 #1 Not tainted
[   47.252442][  T197] --------------------------------------------
[   47.258478][  T197] systemd-udevd/197 is trying to acquire lock:
[ 47.264516][ T197] ffffc90000fe72b0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_gem_object_pin_pages_unlocked (drivers/gpu/drm/i915/gem/i915_gem_pages.c:150) i915
[   47.277112][  T197]
[   47.277112][  T197] but task is already holding lock:
[ 47.284369][ T197] ffffc90000fe7578 (reservation_ww_class_acquire){+.+.}-{0:0}, at: __intel_context_do_pin (drivers/gpu/drm/i915/gt/intel_context.c:301) i915
[   47.295899][  T197]
[   47.295899][  T197] other info that might help us debug this:
[   47.303847][  T197]  Possible unsafe locking scenario:
[   47.303847][  T197]
[   47.311190][  T197]        CPU0
[   47.314346][  T197]        ----
[   47.317501][  T197]   lock(reservation_ww_class_acquire);
[   47.322925][  T197]   lock(reservation_ww_class_acquire);
[   47.328349][  T197]
[   47.328349][  T197]  *** DEADLOCK ***
[   47.328349][  T197]
[   47.336386][  T197]  May be due to missing lock nesting notation
[   47.336386][  T197]
[   47.344598][  T197] 3 locks held by systemd-udevd/197:
[ 47.349760][ T197] #0: ffff888103a96248 (&dev->mutex){....}-{3:3}, at: __driver_attach (drivers/base/dd.c:1140) 
[ 47.358945][ T197] #1: ffffc90000fe7578 (reservation_ww_class_acquire){+.+.}-{0:0}, at: __intel_context_do_pin (drivers/gpu/drm/i915/gt/intel_context.c:301) i915
[ 47.370902][ T197] #2: ffff8882069c1068 (&ce->pin_mutex){+.+.}-{3:3}, at: intel_context_alloc_state (drivers/gpu/drm/i915/gt/intel_context.c:55) i915
[   47.381889][  T197]
[   47.381889][  T197] stack backtrace:
[   47.387661][  T197] CPU: 2 PID: 197 Comm: systemd-udevd Not tainted 5.18.0-rc2-00646-g9c20c625e8f8 #1
[   47.396923][  T197] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.8.1 12/05/2017
[   47.405051][  T197] Call Trace:
[   47.408209][  T197]  <TASK>
[ 47.411020][ T197] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4)) 
[ 47.415405][ T197] validate_chain.cold (kernel/locking/lockdep.c:2958 kernel/locking/lockdep.c:3001 kernel/locking/lockdep.c:3790) 
[ 47.420400][ T197] ? check_prev_add (kernel/locking/lockdep.c:3759) 
[ 47.425307][ T197] __lock_acquire (kernel/locking/lockdep.c:5029) 
[ 47.429952][ T197] ? lock_downgrade (kernel/locking/lockdep.c:5652) 
[ 47.434680][ T197] lock_acquire (kernel/locking/lockdep.c:436 kernel/locking/lockdep.c:5646 kernel/locking/lockdep.c:5609) 
[ 47.439062][ T197] ? i915_gem_object_pin_pages_unlocked (drivers/gpu/drm/i915/gem/i915_gem_pages.c:150) i915
[ 47.446226][ T197] ? rcu_read_unlock (include/linux/rcupdate.h:723 (discriminator 5)) 
[ 47.450865][ T197] ? __mutex_unlock_slowpath (arch/x86/include/asm/atomic64_64.h:190 include/linux/atomic/atomic-long.h:449 include/linux/atomic/atomic-instrumented.h:1790 kernel/locking/mutex.c:910) 
[ 47.456379][ T197] ? wait_for_completion_io_timeout (kernel/locking/mutex.c:888) 
[ 47.462338][ T197] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:85 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
[ 47.467076][ T197] i915_gem_ww_ctx_init (include/linux/ww_mutex.h:152 drivers/gpu/drm/i915/i915_gem_ww.c:11) i915
[ 47.472948][ T197] ? i915_gem_object_pin_pages_unlocked (drivers/gpu/drm/i915/gem/i915_gem_pages.c:150) i915
[ 47.480109][ T197] i915_gem_object_pin_pages_unlocked (drivers/gpu/drm/i915/gem/i915_gem_pages.c:150) i915
[ 47.487094][ T197] ? __i915_gem_ttm_object_init (drivers/gpu/drm/i915/gem/i915_gem_object.h:228 drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1238) i915
[ 47.493632][ T197] ? __i915_gem_object_get_pages (drivers/gpu/drm/i915/gem/i915_gem_pages.c:146) i915
[ 47.500260][ T197] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125) 
[ 47.505685][ T197] ? trace_i915_gem_object_create (drivers/gpu/drm/i915/i915_trace.h:22) i915
[ 47.512317][ T197] ? __i915_gem_object_create_region (drivers/gpu/drm/i915/gem/i915_gem_region.c:102) i915
[ 47.519291][ T197] i915_gem_object_create_stolen (drivers/gpu/drm/i915/gem/i915_gem_stolen.c:547) i915
[ 47.525832][ T197] intel_engine_create_ring (drivers/gpu/drm/i915/gt/intel_ring.c:120 drivers/gpu/drm/i915/gt/intel_ring.c:173) i915
[ 47.532021][ T197] lrc_alloc (drivers/gpu/drm/i915/gt/intel_lrc.c:990) i915
[ 47.536898][ T197] intel_context_alloc_state (drivers/gpu/drm/i915/gt/intel_context.c:64) i915
[ 47.543078][ T197] __intel_context_do_pin_ww (drivers/gpu/drm/i915/gt/intel_context.c:211) i915
[ 47.549516][ T197] ? lock_downgrade (kernel/locking/lockdep.c:5652) 
[ 47.554245][ T197] ? rwlock_bug+0xc0/0xc0 
[ 47.559062][ T197] ? intel_context_alloc_state (drivers/gpu/drm/i915/gt/intel_context.c:205) i915
[ 47.565508][ T197] ? i915_gem_ww_ctx_init (include/linux/ww_mutex.h:152 drivers/gpu/drm/i915/i915_gem_ww.c:11) i915
[ 47.571532][ T197] __intel_context_do_pin (drivers/gpu/drm/i915/gt/intel_context.c:304) i915
[ 47.577452][ T197] ? __module_address (kernel/module.c:4737) 
[ 47.582878][ T197] ? __intel_context_do_pin_ww (drivers/gpu/drm/i915/gt/intel_context.c:297) i915
[ 47.589500][ T197] ? __i915_active_init (include/linux/list.h:38 drivers/gpu/drm/i915/i915_active.c:360) i915
[ 47.595344][ T197] ? intel_engine_print_breadcrumbs (drivers/gpu/drm/i915/gt/intel_context.c:371) i915
[ 47.602220][ T197] intel_engine_create_pinned_context (drivers/gpu/drm/i915/gt/intel_context.h:157 drivers/gpu/drm/i915/gt/intel_engine_cs.c:1060) i915
[ 47.609273][ T197] intel_engines_init (drivers/gpu/drm/i915/gt/intel_engine_cs.c:1100 drivers/gpu/drm/i915/gt/intel_engine_cs.c:1131 drivers/gpu/drm/i915/gt/intel_engine_cs.c:1176) i915
[ 47.614928][ T197] ? execlists_unwind_incomplete_requests (drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3485) i915
[ 47.622148][ T197] intel_gt_init (drivers/gpu/drm/i915/gt/intel_gt.c:716) i915
[ 47.627370][ T197] i915_gem_init (drivers/gpu/drm/i915/i915_gem.c:1121) i915
[ 47.632605][ T197] ? intel_modeset_init_nogem (drivers/gpu/drm/i915/display/intel_display.c:9780) i915
[ 47.638984][ T197] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:872) i915
[ 47.644545][ T197] ? i915_print_iommu_status (drivers/gpu/drm/i915/i915_driver.c:822) i915
[ 47.650627][ T197] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:167) 
[ 47.656054][ T197] i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:1202) i915
[ 47.661357][ T197] ? i915_pci_remove (drivers/gpu/drm/i915/i915_pci.c:1202) i915
[ 47.666741][ T197] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4501) 
[ 47.673211][ T197] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:45 arch/x86/include/asm/irqflags.h:80 arch/x86/include/asm/irqflags.h:138 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 47.678899][ T197] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:50 (discriminator 22)) 
[ 47.683804][ T197] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:45 arch/x86/include/asm/irqflags.h:80 arch/x86/include/asm/irqflags.h:138 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 47.689497][ T197] ? i915_pci_remove (drivers/gpu/drm/i915/i915_pci.c:1202) i915
[ 47.694894][ T197] local_pci_probe (drivers/pci/pci-driver.c:323) 
[ 47.699455][ T197] pci_call_probe (drivers/pci/pci-driver.c:391) 
[ 47.704017][ T197] ? rwlock_bug+0xc0/0xc0 
[ 47.708840][ T197] ? pci_pm_suspend_noirq (drivers/pci/pci-driver.c:351) 
[ 47.714106][ T197] ? pci_match_device (drivers/pci/pci-driver.c:107 drivers/pci/pci-driver.c:158) 
[ 47.719016][ T197] ? kernfs_put (arch/x86/include/asm/atomic.h:123 (discriminator 1) include/linux/atomic/atomic-instrumented.h:576 (discriminator 1) fs/kernfs/dir.c:513 (discriminator 1)) 
[ 47.723233][ T197] pci_device_probe (drivers/pci/pci-driver.c:460) 
[ 47.727881][ T197] ? pci_dma_configure (drivers/pci/pci-driver.c:1620) 
[ 47.732789][ T197] really_probe (drivers/base/dd.c:541 drivers/base/dd.c:620) 
[ 47.737174][ T197] __driver_probe_device (drivers/base/dd.c:751) 
[ 47.742339][ T197] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4501) 
[ 47.748815][ T197] driver_probe_device (drivers/base/dd.c:781) 
[ 47.753721][ T197] __driver_attach (drivers/base/dd.c:1141) 
[ 47.758366][ T197] ? __device_attach_driver (drivers/base/dd.c:1093) 
[ 47.763792][ T197] bus_for_each_dev (drivers/base/bus.c:301) 
[ 47.768523][ T197] ? lockdep_init_map_type (kernel/locking/lockdep.c:4812) 
[ 47.773864][ T197] ? subsys_dev_iter_exit (drivers/base/bus.c:290) 
[ 47.778948][ T197] bus_add_driver (drivers/base/bus.c:619) 
[ 47.783507][ T197] driver_register (drivers/base/driver.c:171) 
[ 47.788151][ T197] ? __pci_register_driver (include/linux/list.h:37 drivers/pci/pci-driver.c:1413) 
[ 47.793491][ T197] i915_init (drivers/gpu/drm/i915/i915_driver.c:1008) i915
[   47.798293][  T197]  ? 0xffffffffc1201000
[ 47.802324][ T197] do_one_initcall (init/main.c:1298) 
[ 47.806878][ T197] ? trace_event_raw_event_initcall_level (init/main.c:1289) 
[ 47.813525][ T197] ? memset_erms (arch/x86/lib/memset_64.S:65) 
[ 47.817734][ T197] ? kasan_unpoison (mm/kasan/shadow.c:108 mm/kasan/shadow.c:142) 
[ 47.822290][ T197] do_init_module (kernel/module.c:3731) 
[ 47.826848][ T197] __do_sys_finit_module (kernel/module.c:4222) 
[ 47.832015][ T197] ? __ia32_sys_init_module (kernel/module.c:4190) 
[ 47.837269][ T197] ? __seccomp_filter (arch/x86/include/asm/bitops.h:214 include/asm-generic/bitops/instrumented-non-atomic.h:135 kernel/seccomp.c:351 kernel/seccomp.c:378 kernel/seccomp.c:410 kernel/seccomp.c:1183) 
[ 47.842180][ T197] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 47.846475][ T197] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4501) 
[ 47.852948][ T197] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:115) 
[   47.858725][  T197] RIP: 0033:0x7fc6644eb989
[ 47.863018][ T197] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d7 64 0c 00 f7 d8 64 89 01 48
All code
========
   0:	00 c3                	add    %al,%bl
   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   9:	00 00 00 
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d d7 64 0c 00 	mov    0xc64d7(%rip),%rcx        # 0xc6511
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d d7 64 0c 00 	mov    0xc64d7(%rip),%rcx        # 0xc64e7
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.18.0-rc2-00646-g9c20c625e8f8"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.18.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.2.0-19) 11.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_CC_HAS_SLS=y
# CONFIG_SLS is not set
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# CONFIG_PERF_EVENTS_AMD_POWER is not set
CONFIG_PERF_EVENTS_AMD_UNCORE=y
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_X86_SGX=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
CONFIG_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_PRMT=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=y
# CONFIG_X86_SGX_KVM is not set
# CONFIG_KVM_AMD is not set
# CONFIG_KVM_XEN is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_HAVE_ARCH_NODE_DEV_GROUP=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_FC_APPID is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_HMM_MIRROR=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_ANON_VMA_NAME is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=y
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=y
CONFIG_IPV6_GRE=y
CONFIG_IPV6_FOU=y
CONFIG_IPV6_FOU_TUNNEL=y
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_SEG6_BPF=y
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_IPV6_IOAM6_LWTUNNEL=y
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=m
CONFIG_MPTCP_IPV6=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_FLOW_OFFLOAD=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
CONFIG_NFT_TPROXY=m
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
CONFIG_NF_FLOW_TABLE_INET=m
CONFIG_NF_FLOW_TABLE=m
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=y
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=y
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
CONFIG_NET_SCH_ETF=m
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=y
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
CONFIG_NET_SCH_FQ_PIE=m
CONFIG_NET_SCH_INGRESS=y
CONFIG_NET_SCH_PLUG=m
CONFIG_NET_SCH_ETS=m
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_FQ_PIE is not set
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
CONFIG_NET_EMATCH_CANID=m
CONFIG_NET_EMATCH_IPSET=m
CONFIG_NET_EMATCH_IPT=m
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
CONFIG_NET_ACT_MPLS=m
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
CONFIG_NET_ACT_CONNMARK=m
CONFIG_NET_ACT_CTINFO=m
CONFIG_NET_ACT_SKBMOD=m
CONFIG_NET_ACT_IFE=m
CONFIG_NET_ACT_TUNNEL_KEY=m
CONFIG_NET_ACT_CT=m
# CONFIG_NET_ACT_GATE is not set
CONFIG_NET_IFE_SKBMARK=m
CONFIG_NET_IFE_SKBPRIO=m
CONFIG_NET_IFE_SKBTCINDEX=m
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
CONFIG_NFC=m
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=m
# CONFIG_NFC_NCI_SPI is not set
# CONFIG_NFC_NCI_UART is not set
# CONFIG_NFC_HCI is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_VIRTUAL_NCI=m
# CONFIG_NFC_FDP is not set
# CONFIG_NFC_PN533_USB is not set
# CONFIG_NFC_PN533_I2C is not set
# CONFIG_NFC_MRVL_USB is not set
# CONFIG_NFC_ST_NCI_I2C is not set
# CONFIG_NFC_ST_NCI_SPI is not set
# CONFIG_NFC_NXP_NCI is not set
# CONFIG_NFC_S3FWRN5_I2C is not set
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=m
CONFIG_NET_IFE=m
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=m
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
CONFIG_ZRAM_WRITEBACK=y
# CONFIG_ZRAM_MEMORY_TRACKING is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
CONFIG_VMWARE_VMCI=m
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_PLATFORM is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
CONFIG_DUMMY=y
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
CONFIG_IFB=m
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=y
CONFIG_GENEVE=y
CONFIG_BAREUDP=m
# CONFIG_GTP is not set
CONFIG_AMT=m
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=y
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
CONFIG_NET_VRF=y
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_FIRESTREAM is not set
# CONFIG_ATM_ZATM is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_AMBASSADOR is not set
# CONFIG_ATM_HORIZON is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
CONFIG_IXGBE_IPSEC=y
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_MSE102X is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# CONFIG_PCS_XPCS is not set
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
# CONFIG_IWLMEI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
# CONFIG_RTW89 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
# CONFIG_MAC80211_HWSIM is not set
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=m
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_WMI_EC is not set
# CONFIG_SENSORS_ASUS_EC is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SIMPLE_MFD_I2C is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=m
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_DEBUG_SELFTEST=m
CONFIG_DRM_DP_HELPER=m
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=y
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=m
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_EXPORT_FOR_TESTS=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
CONFIG_DRM_LIB_RANDOM=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
# CONFIG_PRISM2_USB is not set
# CONFIG_RTL8192U is not set
# CONFIG_RTLLIB is not set
# CONFIG_RTL8723BS is not set
# CONFIG_R8712U is not set
# CONFIG_R8188EU is not set
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_VT6656 is not set
# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set
# CONFIG_LTE_GDM724X is not set
# CONFIG_FIREWIRE_SERIAL is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_FB_TFT is not set
# CONFIG_KS7010 is not set
# CONFIG_PI433 is not set
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_WFX is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMC is not set
# CONFIG_AMD_HSMP is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_HP_WMI=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_ISHTP_ECLITE is not set
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
CONFIG_PMC_ATOM=y
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
# CONFIG_MLXREG_LC is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_IRQ_REMAP=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
CONFIG_ANDROID=y
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
CONFIG_IMA_WRITE_POLICY=y
CONFIG_IMA_READ_POLICY=y
CONFIG_IMA_APPRAISE=y
CONFIG_IMA_ARCH_POLICY=y
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=y
# CONFIG_IMA_DISABLE_HTABLE is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SM4=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_STACK_HASH_ORDER=20
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_STACK_VALIDATION=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=m
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
CONFIG_PROVE_NVDIMM_LOCKING=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GLOBAL_TRACE_BUF_SIZE=1441792
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
CONFIG_PREEMPTIRQ_DELAY_TEST=m
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_SAMPLES=y
# CONFIG_SAMPLE_AUXDISPLAY is not set
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
CONFIG_SAMPLE_TRACE_PRINTK=m
CONFIG_SAMPLE_FTRACE_DIRECT=m
# CONFIG_SAMPLE_FTRACE_DIRECT_MULTI is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
# CONFIG_SAMPLE_KOBJECT is not set
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_LIVEPATCH is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
# CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
# CONFIG_SAMPLE_WATCHDOG is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
CONFIG_TEST_STRSCPY=m
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_SCANF=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=y
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
CONFIG_TEST_KMOD=m
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_HMM=m
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='kernel-selftests'
	export testcase='kernel-selftests'
	export category='functional'
	export kconfig='x86_64-rhel-8.3-kselftests'
	export need_memory='2G'
	export need_cpu=2
	export kernel_cmdline='erst_disable'
	export job_origin='kernel-selftests-x86.yaml'
	export queue_cmdline_keys='branch
commit'
	export queue='validate'
	export testbox='lkp-skl-d05'
	export tbox_group='lkp-skl-d05'
	export submit_id='625a916057588feca07a83c3'
	export job_file='/lkp/jobs/scheduled/lkp-skl-d05/kernel-selftests-x86-ucode=0xec-debian-10.4-x86_64-20200603.cgz-9c20c625e8f84a42c7963db854df4439553e8bc4-20220416-60576-12m1wsi-4.yaml'
	export id='a4cfe1f156ff9ac1551738f16ae5411e108d764b'
	export queuer_version='/zday/lkp'
	export model='Skylake'
	export nr_cpu=4
	export memory='32G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export hdd_partitions='/dev/disk/by-id/wwn-0x5000c50091e544de-part*'
	export ssd_partitions='/dev/disk/by-id/wwn-0x55cd2e4151977e28-part2'
	export rootfs_partition='/dev/disk/by-id/wwn-0x55cd2e4151977e28-part1'
	export brand='Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz'
	export commit='9c20c625e8f84a42c7963db854df4439553e8bc4'
	export need_kconfig_hw='{"E1000E"=>"y"}
SATA_AHCI
DRM_I915'
	export ucode='0xec'
	export bisect_dmesg=true
	export need_kconfig=\{\"POSIX_TIMERS\"\=\>\"y,\ v4.10-rc1\"\}
	export initrds='linux_headers
linux_selftests'
	export enqueue_time='2022-04-16 17:50:24 +0800'
	export _id='625a916057588feca07a83c6'
	export _rt='/result/kernel-selftests/x86-ucode=0xec/lkp-skl-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4'
	export user='lkp'
	export compiler='gcc-11'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='9543a52eb098ab4301b723f3999205614f83893b'
	export base_commit='ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e'
	export branch='linux-review/Robert-Beckett/drm-i915-ttm-for-stolen-region/20220413-034123'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/kernel-selftests/x86-ucode=0xec/lkp-skl-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/3'
	export scheduler_version='/lkp/lkp/.src-20220415-153857'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/kernel-selftests/x86-ucode=0xec/lkp-skl-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/vmlinuz-5.18.0-rc2-00646-g9c20c625e8f8
branch=linux-review/Robert-Beckett/drm-i915-ttm-for-stolen-region/20220413-034123
job=/lkp/jobs/scheduled/lkp-skl-d05/kernel-selftests-x86-ucode=0xec-debian-10.4-x86_64-20200603.cgz-9c20c625e8f84a42c7963db854df4439553e8bc4-20220416-60576-12m1wsi-4.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3-kselftests
commit=9c20c625e8f84a42c7963db854df4439553e8bc4
erst_disable
max_uptime=2100
LKP_SERVER=internal-lkp-server
nokaslr
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/modules.cgz'
	export linux_headers_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/linux-headers.cgz'
	export linux_selftests_initrd='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/linux-selftests.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/kernel-selftests_20220411.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/kernel-selftests-x86_64-a17aac1b-1_20220413.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20220216.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='5.17.0-rc2-00102-g4f481208749a'
	export repeat_to=6
	export schedule_notify_address=
	export kernel='/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/vmlinuz-5.18.0-rc2-00646-g9c20c625e8f8'
	export dequeue_time='2022-04-16 18:08:05 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-skl-d05/kernel-selftests-x86-ucode=0xec-debian-10.4-x86_64-20200603.cgz-9c20c625e8f84a42c7963db854df4439553e8bc4-20220416-60576-12m1wsi-4.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test group='x86' $LKP_SRC/tests/wrapper kernel-selftests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env group='x86' $LKP_SRC/stats/wrapper kernel-selftests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time kernel-selftests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--O5XBE6gyVG5Rl6Rj
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
AARZWg==

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=kernel-selftests

KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4
2022-04-16 10:09:35 ln -sf /usr/bin/clang
2022-04-16 10:09:35 ln -sf /usr/bin/llc
2022-04-16 10:09:35 sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
2022-04-16 10:09:35 make -C x86
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86'
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/single_step_syscall_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 single_step_syscall.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sysret_ss_attrs_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sysret_ss_attrs.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/syscall_nt_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 syscall_nt.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_mremap_vdso_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_mremap_vdso.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/check_initial_reg_state_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -Wl,-ereal_start -static -DCAN_BUILD_32 -DCAN_BUILD_64 check_initial_reg_state.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sigreturn_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sigreturn.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/iopl_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 iopl.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/ioperm_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 ioperm.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_vsyscall_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_vsyscall.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/mov_ss_trap_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 mov_ss_trap.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/syscall_arg_fault_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 syscall_arg_fault.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/fsgsbase_restore_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 fsgsbase_restore.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sigaltstack_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sigaltstack.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/entry_from_vm86_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 entry_from_vm86.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_syscall_vdso_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_syscall_vdso.c helpers.h thunks_32.S -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/unwind_vdso_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 unwind_vdso.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_FCMOV_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_FCMOV.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_FCOMI_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_FCOMI.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_FISTTP_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_FISTTP.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/vdso_restorer_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 vdso_restorer.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/ldt_gdt_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 ldt_gdt.c helpers.h -lrt -ldl -lm
gcc -m32 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/ptrace_syscall_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 ptrace_syscall.c helpers.h raw_syscall_helper_32.S -lrt -ldl -lm
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/single_step_syscall_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 single_step_syscall.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sysret_ss_attrs_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sysret_ss_attrs.c helpers.h thunks.S -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/syscall_nt_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 syscall_nt.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_mremap_vdso_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_mremap_vdso.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/check_initial_reg_state_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -Wl,-ereal_start -static -DCAN_BUILD_32 -DCAN_BUILD_64 check_initial_reg_state.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sigreturn_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sigreturn.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/iopl_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 iopl.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/ioperm_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 ioperm.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/test_vsyscall_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_vsyscall.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/mov_ss_trap_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 mov_ss_trap.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/syscall_arg_fault_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 syscall_arg_fault.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/fsgsbase_restore_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 fsgsbase_restore.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sigaltstack_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sigaltstack.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/fsgsbase_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 fsgsbase.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/sysret_rip_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 sysret_rip.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/syscall_numbering_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 syscall_numbering.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/corrupt_xstate_header_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 corrupt_xstate_header.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/amx_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 amx.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/ldt_gdt_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 ldt_gdt.c helpers.h -lrt -ldl
gcc -m64 -o /usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86/ptrace_syscall_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 ptrace_syscall.c helpers.h -lrt -ldl
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86'
2022-04-16 10:09:43 make run_tests -C x86
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86'
TAP version 13
1..42
# selftests: x86: single_step_syscall_32
# [RUN]	Set TF and check nop
# [OK]	Survived with TF set and 15 traps
# [RUN]	Set TF and check int80
# [OK]	Survived with TF set and 14 traps
# [RUN]	Set TF and check a fast syscall
# [OK]	Survived with TF set and 45 traps
# [RUN]	Fast syscall with TF cleared
# [OK]	Nothing unexpected happened
# [RUN]	Set TF and check SYSENTER
# 	Got SIGSEGV with RIP=f7fb7549, TF=256
# [RUN]	Fast syscall with TF cleared
# [OK]	Nothing unexpected happened
ok 1 selftests: x86: single_step_syscall_32
# selftests: x86: sysret_ss_attrs_32
# [RUN]	Syscalls followed by SS validation
# [OK]	We survived
ok 2 selftests: x86: sysret_ss_attrs_32
# selftests: x86: syscall_nt_32
# [RUN]	Set NT and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set AC and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set NT|AC and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set NT|TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set AC|TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set NT|AC|TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set DF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set TF|DF and issue a syscall
# [OK]	The syscall worked and flags are still set
ok 3 selftests: x86: syscall_nt_32
# selftests: x86: test_mremap_vdso_32
# 	AT_SYSINFO_EHDR is 0xf7f12000
# [NOTE]	Moving vDSO: [0xf7f12000, 0xf7f13000] -> [0xf7f3b000, 0xf7f3c000]
# [NOTE]	vDSO partial move failed, will try with bigger size
# [NOTE]	Moving vDSO: [0xf7f12000, 0xf7f14000] -> [0xf7f0a000, 0xf7f0c000]
# [OK]
ok 4 selftests: x86: test_mremap_vdso_32
# selftests: x86: check_initial_reg_state_32
# [OK]	All GPRs except SP are 0
# [OK]	FLAGS is 0x202
ok 5 selftests: x86: check_initial_reg_state_32
# selftests: x86: sigreturn_32
# [OK]	set_thread_area refused 16-bit data
# [OK]	set_thread_area refused 16-bit data
# [RUN]	Valid sigreturn: 64-bit CS (33), 32-bit SS (2b, GDT)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 32-bit CS (23), 32-bit SS (2b, GDT)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 16-bit CS (37), 32-bit SS (2b, GDT)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 64-bit CS (33), 16-bit SS (3f)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 32-bit CS (23), 16-bit SS (3f)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 16-bit CS (37), 16-bit SS (3f)
# [OK]	all registers okay
# [RUN]	64-bit CS (33), bogus SS (47)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	32-bit CS (23), bogus SS (47)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	16-bit CS (37), bogus SS (47)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	64-bit CS (33), bogus SS (23)
# [OK]	Got #GP(0x20) (i.e. GDT index 4, Segmentation fault)
# [RUN]	32-bit CS (23), bogus SS (23)
# [OK]	Got #GP(0x20) (i.e. GDT index 4, Segmentation fault)
# [RUN]	16-bit CS (37), bogus SS (23)
# [OK]	Got #GP(0x20) (i.e. GDT index 4, Segmentation fault)
# [RUN]	32-bit CS (4f), bogus SS (2b)
# [OK]	Got #NP(0x4c) (i.e. LDT index 9, Bus error)
# [RUN]	32-bit CS (23), bogus SS (57)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
ok 6 selftests: x86: sigreturn_32
# selftests: x86: iopl_32
# [OK]	CLI NOPped
# [OK]	STI NOPped
# [OK]	outb to 0x80 worked
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# 	child: set IOPL to 3
# [RUN]	child: write to 0x80
# [OK]	CLI NOPped
# [OK]	STI NOPped
# [OK]	outb to 0x80 worked
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [OK]	Child succeeded
# [RUN]	parent: write to 0x80 (should fail)
# [OK]	outb to 0x80 failed
# [OK]	CLI faulted
# [OK]	STI faulted
# 	iopl(3)
# 	Drop privileges
# [RUN]	iopl(3) unprivileged but with IOPL==3
# [RUN]	iopl(0) unprivileged
# [RUN]	iopl(3) unprivileged
# [OK]	Failed as expected
ok 7 selftests: x86: iopl_32
# selftests: x86: ioperm_32
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [RUN]	enable 0x80
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [RUN]	disable 0x80
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [RUN]	child: check that we inherited permissions
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [RUN]	child: Extend permissions to 0x81
# [RUN]	child: Drop permissions to 0x80
# [OK]	outb to 0x80 failed
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [RUN]	enable 0x80
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [RUN]	disable 0x80
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [OK]	Child succeeded
# 	Verify that unsharing the bitmap worked
# [OK]	outb to 0x80 worked
# 	Drop privileges
# [RUN]	disable 0x80
# [OK]	it worked
# [RUN]	enable 0x80 again
# [OK]	it failed
ok 8 selftests: x86: ioperm_32
# selftests: x86: test_vsyscall_32
# [NOTE]	failed to find getcpu in vDSO
# [RUN]	test gettimeofday()
# 	vDSO time offsets: 0.000009 0.000000
# [OK]	vDSO gettimeofday()'s timeval was okay
# [RUN]	test time()
# [OK]	vDSO time() is okay
# [RUN]	getcpu() on CPU 0
# [RUN]	getcpu() on CPU 1
ok 9 selftests: x86: test_vsyscall_32
# selftests: x86: mov_ss_trap_32
# 	SS = 0x2b, &SS = 0x0x804c11c
# 	PR_SET_PTRACER_ANY succeeded
# 	Set up a watchpoint
# 	DR0 = 804c11c, DR1 = 80493d6, DR7 = 7000a
# 	SS = 0x2b, &SS = 0x0x804c11c
# 	PR_SET_PTRACER_ANY succeeded
# 	Set up a watchpoint
# [RUN]	Read from watched memory (should get SIGTRAP)
# 	Got SIGTRAP with RIP=804922c, EFLAGS.RF=0
# [RUN]	MOV SS; INT3
# 	Got SIGTRAP with RIP=804923d, EFLAGS.RF=0
# [RUN]	MOV SS; INT 3
# 	Got SIGTRAP with RIP=804924f, EFLAGS.RF=0
# [RUN]	MOV SS; CS CS INT3
# 	Got SIGTRAP with RIP=8049262, EFLAGS.RF=0
# [RUN]	MOV SS; CSx14 INT3
# 	Got SIGTRAP with RIP=8049281, EFLAGS.RF=0
# [RUN]	MOV SS; INT 4
# 	Got SIGSEGV with RIP=80492ab
# [RUN]	MOV SS; INTO
# 	Got SIGTRAP with RIP=80492db, EFLAGS.RF=0
# [RUN]	MOV SS; ICEBP
# 	Got SIGTRAP with RIP=8049326, EFLAGS.RF=0
# [RUN]	MOV SS; CLI
# 	Got SIGSEGV with RIP=8049659
# [RUN]	MOV SS; #PF
# 	Got SIGSEGV with RIP=804961b
# [RUN]	MOV SS; INT 1
# 	Got SIGSEGV with RIP=80493b6
# [RUN]	MOV SS; breakpointed NOP
# 	Got SIGTRAP with RIP=80493d7, EFLAGS.RF=0
# [RUN]	MOV SS; SYSENTER
# 	Got SIGSEGV with RIP=f7fc0549
# [RUN]	MOV SS; INT $0x80
# [OK]	I aten't dead
ok 10 selftests: x86: mov_ss_trap_32
# selftests: x86: syscall_arg_fault_32
# [RUN]	SYSENTER with invalid state
# [OK]	Seems okay
# [RUN]	SYSCALL with invalid state
# [SKIP]	Illegal instruction
# [RUN]	SYSENTER with TF and invalid state
# [OK]	Seems okay
# [RUN]	SYSCALL with TF and invalid state
# [SKIP]	Illegal instruction
ok 11 selftests: x86: syscall_arg_fault_32
# selftests: x86: fsgsbase_restore_32
# 	Setting up a segment
# 	segment base address = 0xf7ff1000
# 	using LDT slot 0
# [OK]	The segment points to the right place.
# 	Tracee will take a nap until signaled
# 	Tracee: in tracee_zap_segment()
# 	Tracee is going back to sleep
# 	Tracee was resumed.  Will re-check segment.
# [OK]	The segment points to the right place.
# 	Setting up a segment
# 	segment base address = 0xf7ff1000
# 	using LDT slot 0
# [OK]	The segment points to the right place.
# 	Child FS=0x7
# 	Tracer: redirecting tracee to tracee_zap_segment()
# 	Tracer: restoring tracee state
# [OK]	All is well.
ok 12 selftests: x86: fsgsbase_restore_32
# selftests: x86: sigaltstack_32
# [RUN]	Test an alternate signal stack of sufficient size.
# 	Raise SIGALRM. It is expected to be delivered.
# [OK]	SIGALRM signal delivered.
ok 13 selftests: x86: sigaltstack_32
# selftests: x86: entry_from_vm86_32
# [RUN]	#BR from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	SYSENTER from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	SYSCALL from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	STI with VIP set from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	POPF with VIP set and IF clear from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	POPF with VIP and IF set from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	POPF with VIP clear and IF set from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	INT3 from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	int80 from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	UMIP tests from vm86 mode
# [SKIP]	vm86 not supported
# [INFO]	Result from SMSW:[0x0000]
# [INFO]	Result from SIDT: limit[0x0000]base[0x00000000]
# [INFO]	Result from SGDT: limit[0x0000]base[0x00000000]
# [PASS]	All the results from SMSW are identical.
# [PASS]	All the results from SGDT are identical.
# [PASS]	All the results from SIDT are identical.
# [RUN]	STR instruction from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	SLDT instruction from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	Execute null pointer from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	#BR from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	SYSENTER from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	SYSCALL from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	STI with VIP set from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	POPF with VIP set and IF clear from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	POPF with VIP and IF set from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	POPF with VIP clear and IF set from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	INT3 from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	int80 from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	UMIP tests from vm86 mode
# [SKIP]	vm86 not supported
# [INFO]	Result from SMSW:[0x0000]
# [INFO]	Result from SIDT: limit[0x0000]base[0x00000000]
# [INFO]	Result from SGDT: limit[0x0000]base[0x00000000]
# [PASS]	All the results from SMSW are identical.
# [PASS]	All the results from SGDT are identical.
# [PASS]	All the results from SIDT are identical.
# [RUN]	STR instruction from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	SLDT instruction from vm86 mode
# [SKIP]	vm86 not supported
# [RUN]	Execute null pointer from vm86 mode
# [SKIP]	vm86 not supported
ok 14 selftests: x86: entry_from_vm86_32
# selftests: x86: test_syscall_vdso_32
# [RUN]	Executing 6-argument 32-bit syscall via VDSO
# [WARN]	Flags before=0000000000200ed7 id 0 00 o d i s z 0 a 0 p 1 c
# [WARN]	Flags  after=0000000000200682 id 0 00 d i s 0 0 1 
# [WARN]	Flags change=0000000000000855 0 00 o z 0 a 0 p 0 c
# [OK]	Arguments are preserved across syscall
# [NOTE]	R11 has changed:0000000000200682 - assuming clobbered by SYSRET insn
# [OK]	R8..R15 did not leak kernel data
# [RUN]	Executing 6-argument 32-bit syscall via INT 80
# [OK]	Arguments are preserved across syscall
# [OK]	R8..R15 did not leak kernel data
# [RUN]	Executing 6-argument 32-bit syscall via VDSO
# [WARN]	Flags before=0000000000200ed7 id 0 00 o d i s z 0 a 0 p 1 c
# [WARN]	Flags  after=0000000000200686 id 0 00 d i s 0 0 p 1 
# [WARN]	Flags change=0000000000000851 0 00 o z 0 a 0 0 c
# [OK]	Arguments are preserved across syscall
# [NOTE]	R11 has changed:0000000000200686 - assuming clobbered by SYSRET insn
# [OK]	R8..R15 did not leak kernel data
# [RUN]	Executing 6-argument 32-bit syscall via INT 80
# [OK]	Arguments are preserved across syscall
# [OK]	R8..R15 did not leak kernel data
# [RUN]	Running tests under ptrace
ok 15 selftests: x86: test_syscall_vdso_32
# selftests: x86: unwind_vdso_32
# 	AT_SYSINFO is 0xf7f29540
# [OK]	AT_SYSINFO maps to linux-gate.so.1, loaded at 0x0xf7f29000
# [RUN]	Set TF and check a fast syscall
# 	In vsyscall at 0xf7f29540, returning to 0xf7d120f7
# 	SIGTRAP at 0xf7f29540
# 	  0xf7f29540
# 	  0xf7d120f7
# [OK]	  NR = 20, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f29541
# 	  0xf7f29541
# 	  0xf7d120f7
# [OK]	  NR = 20, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f29542
# 	  0xf7f29542
# 	  0xf7d120f7
# [OK]	  NR = 20, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f29543
# 	  0xf7f29543
# 	  0xf7d120f7
# [OK]	  NR = 20, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f29545
# 	  0xf7f29545
# 	  0xf7d120f7
# [OK]	  NR = 20, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f2954a
# 	  0xf7f2954a
# 	  0xf7d120f7
# [OK]	  NR = 1895, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f2954b
# 	  0xf7f2954b
# 	  0xf7d120f7
# [OK]	  NR = 1895, args = 1, 2, 3, 4, 5, 6
# 	SIGTRAP at 0xf7f2954c
# 	  0xf7f2954c
# 	  0xf7d120f7
# [OK]	  NR = 1895, args = 1, 2, 3, 4, 5, 6
# 	Vsyscall is done
# [OK]	All is well
ok 16 selftests: x86: unwind_vdso_32
# selftests: x86: test_FCMOV_32
# [RUN]	Testing fcmovCC instructions
# [OK]	fcmovCC
ok 17 selftests: x86: test_FCMOV_32
# selftests: x86: test_FCOMI_32
# [RUN]	Testing f[u]comi[p] instructions
# [OK]	f[u]comi[p]
ok 18 selftests: x86: test_FCOMI_32
# selftests: x86: test_FISTTP_32
# [RUN]	Testing fisttp instructions
# [OK]	fisttp
ok 19 selftests: x86: test_FISTTP_32
# selftests: x86: vdso_restorer_32
# [RUN]	Raise a signal, SA_SIGINFO, sa.restorer == NULL
# [OK]	SA_SIGINFO handler returned successfully
# [RUN]	Raise a signal, !SA_SIGINFO, sa.restorer == NULL
# [OK]	!SA_SIGINFO handler returned successfully
ok 20 selftests: x86: vdso_restorer_32
# selftests: x86: ldt_gdt_32
# [NOTE]	set_thread_area is available; will use GDT index 13
# [OK]	LDT entry 0 has AR 0x0040FB00 and limit 0x0000000A
# [OK]	LDT entry 0 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00907B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07300 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07100 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07500 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00507700 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507F00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507D00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507B00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [RUN]	Test fork
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 0 is invalid
# [NOTE]	set_thread_area is available; will use GDT index 13
# [OK]	LDT entry 0 has AR 0x0040FB00 and limit 0x0000000A
# [OK]	LDT entry 0 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00907B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07300 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07100 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07500 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00507700 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507F00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507D00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507B00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [RUN]	Test fork
# [OK]	Child succeeded
# [RUN]	Test size
# [DONE]	Size test
# [OK]	modify_ldt failure 22
# [OK]	LDT entry 0 has AR 0x0000F300 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x00007300 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x0000F100 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x00007300 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x00007100 and limit 0x00000001
# [OK]	LDT entry 0 has AR 0x00007100 and limit 0x00000000
# [OK]	LDT entry 0 is invalid
# [OK]	LDT entry 0 has AR 0x0040F300 and limit 0x000FFFFF
# [OK]	GDT entry 13 has AR 0x0040F300 and limit 0x000FFFFF
# [OK]	LDT entry 0 has AR 0x00C0F300 and limit 0xFFFFFFFF
# [OK]	GDT entry 13 has AR 0x00C0F300 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 has AR 0x00C0F100 and limit 0xFFFFFFFF
# [OK]	GDT entry 13 has AR 0x00C0F100 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 has AR 0x00C0F700 and limit 0xFFFFFFFF
# [OK]	GDT entry 13 has AR 0x00C0F700 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 has AR 0x00C0F500 and limit 0xFFFFFFFF
# [OK]	GDT entry 13 has AR 0x00C0F500 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 is invalid
# [RUN]	Cross-CPU LDT invalidation
# [OK]	All 5 iterations succeeded
# [RUN]	Test exec
# [OK]	LDT entry 0 has AR 0x0040FB00 and limit 0x0000002A
# [OK]	Child succeeded
# [OK]	Invalidate DS with set_thread_area: new DS = 0x0
# [OK]	Invalidate ES with set_thread_area: new ES = 0x0
# [OK]	Invalidate FS with set_thread_area: new FS = 0x0
# [OK]	Invalidate GS with set_thread_area: new GS = 0x0
ok 21 selftests: x86: ldt_gdt_32
# selftests: x86: ptrace_syscall_32
# [RUN]	Check int80 return regs
# [OK]	getpid() preserves regs
# [OK]	kill(getpid(), SIGUSR1) preserves regs
# [RUN]	Check AT_SYSINFO return regs
# [OK]	getpid() preserves regs
# [OK]	kill(getpid(), SIGUSR1) preserves regs
# [RUN]	ptrace-induced syscall restart
# [RUN]	SYSEMU
# [OK]	Initial nr and args are correct
# [RUN]	Restart the syscall (ip = 0xf7f6b549)
# [OK]	Restarted nr and args are correct
# [RUN]	Change nr and args and restart the syscall (ip = 0xf7f6b549)
# [OK]	Replacement nr and args are correct
# [OK]	Child exited cleanly
# [RUN]	kernel syscall restart under ptrace
# [RUN]	SYSCALL
# [OK]	Initial nr and args are correct
# [RUN]	SYSCALL
# [OK]	Args after SIGUSR1 are correct (ax = -514)
# [OK]	Child got SIGUSR1
# [RUN]	Step again
# [OK]	pause(2) restarted correctly
ok 22 selftests: x86: ptrace_syscall_32
# selftests: x86: single_step_syscall_64
# [RUN]	Set TF and check nop
# [OK]	Survived with TF set and 10 traps
# [RUN]	Set TF and check syscall-less opportunistic sysret
# [OK]	Survived with TF set and 12 traps
# [RUN]	Set TF and check int80
# [OK]	Survived with TF set and 9 traps
# [RUN]	Set TF and check a fast syscall
# [OK]	Survived with TF set and 22 traps
# [RUN]	Fast syscall with TF cleared
# [OK]	Nothing unexpected happened
# [RUN]	Set TF and check SYSENTER
# 	Got SIGSEGV with RIP=92f12549, TF=256
# [RUN]	Fast syscall with TF cleared
# [OK]	Nothing unexpected happened
ok 23 selftests: x86: single_step_syscall_64
# selftests: x86: sysret_ss_attrs_64
# [RUN]	Syscalls followed by SS validation
# [OK]	We survived
ok 24 selftests: x86: sysret_ss_attrs_64
# selftests: x86: syscall_nt_64
# [RUN]	Set NT and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set AC and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set NT|AC and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set NT|TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set AC|TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set NT|AC|TF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set DF and issue a syscall
# [OK]	The syscall worked and flags are still set
# [RUN]	Set TF|DF and issue a syscall
# [OK]	The syscall worked and flags are still set
ok 25 selftests: x86: syscall_nt_64
# selftests: x86: test_mremap_vdso_64
# 	AT_SYSINFO_EHDR is 0x7fff77996000
# [NOTE]	Moving vDSO: [0x7fff77996000, 0x7fff77997000] -> [0x7fb5405f2000, 0x7fb5405f3000]
# [NOTE]	vDSO partial move failed, will try with bigger size
# [NOTE]	Moving vDSO: [0x7fff77996000, 0x7fff77998000] -> [0x7fb5405f1000, 0x7fb5405f3000]
# [OK]
ok 26 selftests: x86: test_mremap_vdso_64
# selftests: x86: check_initial_reg_state_64
# [OK]	All GPRs except SP are 0
# [OK]	FLAGS is 0x202
ok 27 selftests: x86: check_initial_reg_state_64
# selftests: x86: sigreturn_64
# [OK]	set_thread_area refused 16-bit data
# [OK]	set_thread_area refused 16-bit data
# [RUN]	Valid sigreturn: 64-bit CS (33), 32-bit SS (2b, GDT)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 32-bit CS (23), 32-bit SS (2b, GDT)
# [NOTE]	SP: 8badf00d5aadc0de -> 5aadc0de
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 16-bit CS (37), 32-bit SS (2b, GDT)
# [NOTE]	SP: 8badf00d5aadc0de -> 5aadc0de
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 64-bit CS (33), 16-bit SS (3f)
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 32-bit CS (23), 16-bit SS (3f)
# [NOTE]	SP: 8badf00d5aadc0de -> 5aadc0de
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 16-bit CS (37), 16-bit SS (3f)
# [NOTE]	SP: 8badf00d5aadc0de -> 5aadc0de
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 32-bit CS (23), 32-bit SS (2b, GDT)
# 	Corrupting SS on return to 64-bit mode
# [NOTE]	SP: 8badf00d5aadc0de -> 5aadc0de
# [OK]	all registers okay
# [RUN]	Valid sigreturn: 32-bit CS (23), 16-bit SS (3f)
# 	Corrupting SS on return to 64-bit mode
# [NOTE]	SP: 8badf00d5aadc0de -> 5aadc0de
# [OK]	all registers okay
# [RUN]	64-bit CS (33), bogus SS (47)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	32-bit CS (23), bogus SS (47)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	16-bit CS (37), bogus SS (47)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	64-bit CS (33), bogus SS (33)
# [OK]	Got #GP(0x30) (i.e. GDT index 6, Segmentation fault)
# [RUN]	32-bit CS (23), bogus SS (33)
# [OK]	Got #GP(0x30) (i.e. GDT index 6, Segmentation fault)
# [RUN]	16-bit CS (37), bogus SS (33)
# [OK]	Got #GP(0x30) (i.e. GDT index 6, Segmentation fault)
# [RUN]	32-bit CS (4f), bogus SS (2b)
# [OK]	Got #NP(0x4c) (i.e. LDT index 9, Bus error)
# [RUN]	32-bit CS (23), bogus SS (57)
# [OK]	Got #GP(0x0) (i.e. Segmentation fault)
# [RUN]	Clear UC_STRICT_RESTORE_SS and corrupt SS
# [OK]	It worked
ok 28 selftests: x86: sigreturn_64
# selftests: x86: iopl_64
# [OK]	CLI NOPped
# [OK]	STI NOPped
# [OK]	outb to 0x80 worked
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# 	child: set IOPL to 3
# [RUN]	child: write to 0x80
# [OK]	CLI NOPped
# [OK]	STI NOPped
# [OK]	outb to 0x80 worked
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [OK]	Child succeeded
# [RUN]	parent: write to 0x80 (should fail)
# [OK]	outb to 0x80 failed
# [OK]	CLI faulted
# [OK]	STI faulted
# 	iopl(3)
# 	Drop privileges
# [RUN]	iopl(3) unprivileged but with IOPL==3
# [RUN]	iopl(0) unprivileged
# [RUN]	iopl(3) unprivileged
# [OK]	Failed as expected
ok 29 selftests: x86: iopl_64
# selftests: x86: ioperm_64
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [RUN]	enable 0x80
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [RUN]	disable 0x80
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [RUN]	child: check that we inherited permissions
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [RUN]	child: Extend permissions to 0x81
# [RUN]	child: Drop permissions to 0x80
# [OK]	outb to 0x80 failed
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [RUN]	enable 0x80
# [OK]	outb to 0x80 worked
# [OK]	outb to 0xed failed
# [RUN]	disable 0x80
# [OK]	outb to 0x80 failed
# [OK]	outb to 0xed failed
# [OK]	Child succeeded
# 	Verify that unsharing the bitmap worked
# [OK]	outb to 0x80 worked
# 	Drop privileges
# [RUN]	disable 0x80
# [OK]	it worked
# [RUN]	enable 0x80 again
# [OK]	it failed
ok 30 selftests: x86: ioperm_64
# selftests: x86: test_vsyscall_64
# 	vsyscall map: ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
# 	vsyscall permissions are r-x
# [RUN]	test gettimeofday()
# 	vDSO time offsets: 0.000009 0.000003
# [OK]	vDSO gettimeofday()'s timeval was okay
# 	vsyscall time offsets: 0.000011 0.000001
# [OK]	vsyscall gettimeofday()'s timeval was okay
# [RUN]	test time()
# [OK]	vDSO time() is okay
# [OK]	vsyscall time() is okay
# [RUN]	getcpu() on CPU 0
# [OK]	vDSO reported correct CPU
# [OK]	vDSO reported correct node
# [OK]	vsyscall reported correct CPU
# [OK]	vsyscall reported correct node
# [RUN]	getcpu() on CPU 1
# [OK]	vDSO reported correct CPU
# [OK]	vDSO reported correct node
# [OK]	vsyscall reported correct CPU
# [OK]	vsyscall reported correct node
# [RUN]	Checking read access to the vsyscall page
# [OK]	We have read access
# [RUN]	process_vm_readv() from vsyscall page
# [OK]	It worked and read correct data
# [RUN]	checking that vsyscalls are emulated
# [OK]	vsyscalls are emulated (1 instructions in vsyscall page)
ok 31 selftests: x86: test_vsyscall_64
# selftests: x86: mov_ss_trap_64
# 	SS = 0x2b, &SS = 0x0x4041a8
# 	PR_SET_PTRACER_ANY succeeded
# 	Set up a watchpoint
# 	DR0 = 4041a8, DR1 = 401358, DR7 = 7000a
# 	SS = 0x2b, &SS = 0x0x4041a8
# 	PR_SET_PTRACER_ANY succeeded
# 	Set up a watchpoint
# [RUN]	Read from watched memory (should get SIGTRAP)
# 	Got SIGTRAP with RIP=4011e8, EFLAGS.RF=0
# [RUN]	MOV SS; INT3
# 	Got SIGTRAP with RIP=4011fb, EFLAGS.RF=0
# [RUN]	MOV SS; INT 3
# 	Got SIGTRAP with RIP=40120f, EFLAGS.RF=0
# [RUN]	MOV SS; CS CS INT3
# 	Got SIGTRAP with RIP=401224, EFLAGS.RF=0
# [RUN]	MOV SS; CSx14 INT3
# 	Got SIGTRAP with RIP=401245, EFLAGS.RF=0
# [RUN]	MOV SS; INT 4
# 	Got SIGSEGV with RIP=40126f
# [RUN]	MOV SS; ICEBP
# 	Got SIGTRAP with RIP=4012ad, EFLAGS.RF=0
# [RUN]	MOV SS; CLI
# 	Got SIGSEGV with RIP=4015b9
# [RUN]	MOV SS; #PF
# 	Got SIGSEGV with RIP=401584
# [RUN]	MOV SS; INT 1
# 	Got SIGSEGV with RIP=401555
# [RUN]	MOV SS; SYSCALL
# [RUN]	MOV SS; breakpointed NOP
# 	Got SIGTRAP with RIP=401359, EFLAGS.RF=0
# [RUN]	MOV SS; SYSENTER
# 	Got SIGSEGV with RIP=40ff2549
# [RUN]	MOV SS; INT $0x80
# [OK]	I aten't dead
ok 32 selftests: x86: mov_ss_trap_64
# selftests: x86: syscall_arg_fault_64
# [RUN]	SYSENTER with invalid state
# [OK]	Seems okay
# [RUN]	SYSCALL with invalid state
# [OK]	SYSCALL returned normally
# [RUN]	SYSENTER with TF and invalid state
# [OK]	Seems okay
# [RUN]	SYSCALL with TF and invalid state
# [OK]	SYSCALL returned normally
# [RUN]	SYSENTER with TF, invalid state, and GSBASE < 0
# [OK]	Seems okay
ok 33 selftests: x86: syscall_arg_fault_64
# selftests: x86: fsgsbase_restore_64
# 	Setting up a segment
# 	segment base address = 0x41e27000
# 	using LDT slot 0
# [OK]	The segment points to the right place.
# 	Tracee will take a nap until signaled
# 	Tracee: in tracee_zap_segment()
# 	Tracee is going back to sleep
# 	Tracee was resumed.  Will re-check segment.
# [OK]	The segment points to the right place.
# 	Setting up a segment
# 	segment base address = 0x41e27000
# 	using LDT slot 0
# [OK]	The segment points to the right place.
# 	Child GS=0x7, GSBASE=0x41e27000
# 	Tracer: redirecting tracee to tracee_zap_segment()
# 	Tracer: restoring tracee state
# [OK]	All is well.
ok 34 selftests: x86: fsgsbase_restore_64
# selftests: x86: sigaltstack_64
# [RUN]	Test an alternate signal stack of sufficient size.
# 	Raise SIGALRM. It is expected to be delivered.
# [OK]	SIGALRM signal delivered.
ok 35 selftests: x86: sigaltstack_64
# selftests: x86: fsgsbase_64
# [OK]	GSBASE started at 1
# [RUN]	Set GS = 0x7, read GSBASE
# [OK]	GSBASE reads as 0x1 with invalid GS
# 	FSGSBASE instructions are enabled
# [RUN]	ARCH_SET_GS to 0x0
# [OK]	GSBASE was set as expected (selector 0x0)
# [OK]	ARCH_GET_GS worked as expected (selector 0x0)
# [RUN]	ARCH_SET_GS to 0x1
# [OK]	GSBASE was set as expected (selector 0x0)
# [OK]	ARCH_GET_GS worked as expected (selector 0x0)
# [RUN]	ARCH_SET_GS to 0x200000000
# [OK]	GSBASE was set as expected (selector 0x0)
# [OK]	ARCH_GET_GS worked as expected (selector 0x0)
# [RUN]	ARCH_SET_GS to 0x0
# [OK]	GSBASE was set as expected (selector 0x0)
# [OK]	ARCH_GET_GS worked as expected (selector 0x0)
# [RUN]	ARCH_SET_GS to 0x200000000
# [OK]	GSBASE was set as expected (selector 0x0)
# [OK]	ARCH_GET_GS worked as expected (selector 0x0)
# [RUN]	ARCH_SET_GS to 0x1
# [OK]	GSBASE was set as expected (selector 0x0)
# [OK]	ARCH_GET_GS worked as expected (selector 0x0)
# [RUN]	ARCH_SET_GS to 0x0 then mov 0 to %gs
# [OK]	GSBASE is 0x0
# [RUN]	ARCH_SET_GS to 0x1 then mov 0 to %gs
# [OK]	GSBASE is 0x0
# [RUN]	ARCH_SET_GS to 0x200000000 then mov 0 to %gs
# [OK]	GSBASE is 0x0
# [RUN]	ARCH_SET_GS to 0x0 then mov 0 to %gs and schedule 
# [OK]	GSBASE is 0x0
# [RUN]	ARCH_SET_GS to 0x1 then mov 0 to %gs and schedule 
# [OK]	GSBASE is 0x0
# [RUN]	ARCH_SET_GS to 0x200000000 then mov 0 to %gs and schedule 
# [OK]	GSBASE is 0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x0
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x0
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x0
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x0
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x0
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0xa1fa5f343cb85fa4
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x1
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x1
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x1
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x1
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x200000000
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x200000000
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x200000000
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x200000000
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0), then schedule to 0x200000000
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x0
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x0
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x0
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x0
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x0
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0xa1fa5f343cb85fa4
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x200000000
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x200000000
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x200000000
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x200000000
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x0) and clear gs, then schedule to 0x200000000
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x0
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x1
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x0
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x0
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x0
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x0
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0xa1fa5f343cb85fa4
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x1
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x1
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x1
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x1
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x1
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x1
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x200000000
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x1
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x200000000
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x200000000
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x200000000
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x1), then schedule to 0x200000000
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x0
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x200000000
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x0
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x0
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x0
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x0
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0xa1fa5f343cb85fa4
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x200000000
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0xa1fa5f343cb85fa4
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x0) and clear gs -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x200000000
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x1
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x1
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x1
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x1
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x1) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x200000000
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x0/0x200000000
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x200000000
# 	Before schedule, set selector to 0x1
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x1/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x200000000
# 	Before schedule, set selector to 0x2
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x200000000
# 	Before schedule, set selector to 0x3
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x3/0x0
# [RUN]	ARCH_SET_GS(0x200000000), then schedule to 0x200000000
# 	Before schedule, set selector to 0x2b
# 	other thread: ARCH_SET_GS(0x200000000) -- sel is 0x0
# [OK]	GS/BASE remained 0x2b/0x0
# [RUN]	ARCH_SET_GS(0), clear gs, then manipulate GSBASE in a different thread
# 	using LDT slot 0
# [OK]	GSBASE remained 0
# [RUN]	GS = 0x0, GSBASE = 0x0
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x0, GSBASE = 0x1
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x0, GSBASE = 0x200000000
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x0, GSBASE = 0xffffffffffffffff
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x2b, GSBASE = 0x0
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x2b, GSBASE = 0x1
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x2b, GSBASE = 0x200000000
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [RUN]	GS = 0x2b, GSBASE = 0xffffffffffffffff
# 	other thread: ARCH_SET_GS(0x0) -- sel is 0x0
# [OK]	Index and base were preserved
# [OK]	GS remained 0x7 and GSBASE changed to 0xFF
ok 36 selftests: x86: fsgsbase_64
# selftests: x86: sysret_rip_64
# [RUN]	sigreturn to 0x800000000000
# [OK]	Got SIGSEGV at RIP=0x800000000000
# [RUN]	sigreturn to 0x1000000000000
# [OK]	Got SIGSEGV at RIP=0x1000000000000
# [RUN]	sigreturn to 0x2000000000000
# [OK]	Got SIGSEGV at RIP=0x2000000000000
# [RUN]	sigreturn to 0x4000000000000
# [OK]	Got SIGSEGV at RIP=0x4000000000000
# [RUN]	sigreturn to 0x8000000000000
# [OK]	Got SIGSEGV at RIP=0x8000000000000
# [RUN]	sigreturn to 0x10000000000000
# [OK]	Got SIGSEGV at RIP=0x10000000000000
# [RUN]	sigreturn to 0x20000000000000
# [OK]	Got SIGSEGV at RIP=0x20000000000000
# [RUN]	sigreturn to 0x40000000000000
# [OK]	Got SIGSEGV at RIP=0x40000000000000
# [RUN]	sigreturn to 0x80000000000000
# [OK]	Got SIGSEGV at RIP=0x80000000000000
# [RUN]	sigreturn to 0x100000000000000
# [OK]	Got SIGSEGV at RIP=0x100000000000000
# [RUN]	sigreturn to 0x200000000000000
# [OK]	Got SIGSEGV at RIP=0x200000000000000
# [RUN]	sigreturn to 0x400000000000000
# [OK]	Got SIGSEGV at RIP=0x400000000000000
# [RUN]	sigreturn to 0x800000000000000
# [OK]	Got SIGSEGV at RIP=0x800000000000000
# [RUN]	sigreturn to 0x1000000000000000
# [OK]	Got SIGSEGV at RIP=0x1000000000000000
# [RUN]	sigreturn to 0x2000000000000000
# [OK]	Got SIGSEGV at RIP=0x2000000000000000
# [RUN]	sigreturn to 0x4000000000000000
# [OK]	Got SIGSEGV at RIP=0x4000000000000000
# [RUN]	sigreturn to 0x8000000000000000
# [OK]	Got SIGSEGV at RIP=0x8000000000000000
# [RUN]	Trying a SYSCALL that falls through to 0x7fffffffe000
# [OK]	We survived
# [RUN]	Trying a SYSCALL that falls through to 0x7ffffffff000
# [OK]	We survived
# [RUN]	Trying a SYSCALL that falls through to 0x800000000000
# [OK]	mremap to 0x7ffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0xfffffffff000
# [OK]	mremap to 0xffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x1000000000000
# [OK]	mremap to 0xfffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x1fffffffff000
# [OK]	mremap to 0x1ffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x2000000000000
# [OK]	mremap to 0x1fffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x3fffffffff000
# [OK]	mremap to 0x3ffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x4000000000000
# [OK]	mremap to 0x3fffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x7fffffffff000
# [OK]	mremap to 0x7ffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x8000000000000
# [OK]	mremap to 0x7fffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0xffffffffff000
# [OK]	mremap to 0xfffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x10000000000000
# [OK]	mremap to 0xffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x1ffffffffff000
# [OK]	mremap to 0x1fffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x20000000000000
# [OK]	mremap to 0x1ffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x3ffffffffff000
# [OK]	mremap to 0x3fffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x40000000000000
# [OK]	mremap to 0x3ffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x7ffffffffff000
# [OK]	mremap to 0x7fffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x80000000000000
# [OK]	mremap to 0x7ffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0xfffffffffff000
# [OK]	mremap to 0xffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x100000000000000
# [OK]	mremap to 0xfffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x1fffffffffff000
# [OK]	mremap to 0x1ffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x200000000000000
# [OK]	mremap to 0x1fffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x3fffffffffff000
# [OK]	mremap to 0x3ffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x400000000000000
# [OK]	mremap to 0x3fffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x7fffffffffff000
# [OK]	mremap to 0x7ffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x800000000000000
# [OK]	mremap to 0x7fffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0xffffffffffff000
# [OK]	mremap to 0xfffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x1000000000000000
# [OK]	mremap to 0xffffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x1ffffffffffff000
# [OK]	mremap to 0x1fffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x2000000000000000
# [OK]	mremap to 0x1ffffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x3ffffffffffff000
# [OK]	mremap to 0x3fffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x4000000000000000
# [OK]	mremap to 0x3ffffffffffff000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x7ffffffffffff000
# [OK]	mremap to 0x7fffffffffffe000 failed
# [RUN]	Trying a SYSCALL that falls through to 0x8000000000000000
# [OK]	mremap to 0x7ffffffffffff000 failed
ok 37 selftests: x86: sysret_rip_64
# selftests: x86: syscall_numbering_64
# [RUN]   Checking for x32 by calling x32 getpid()
# [INFO]      x32 is not supported
# [RUN]   Running tests without ptrace...
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [RUN]   Running tests under ptrace: just stop, no data read
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [RUN]   Running tests under ptrace: only getregs
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [RUN]   Running tests under ptrace: getregs, unmodified setregs
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [RUN]   Running tests under ptrace: modifying the default return
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [RUN]   Running tests under ptrace: clobbering the top 32 bits
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [RUN]   Running tests under ptrace: sign-extending the syscall number
# [RUN]       Checking system calls with msb = 0 (0x0)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 0:0 returned 0 as expected
# [OK]                x64 syscall 0:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 0:19 returned 0 as expected
# [OK]                x64 syscall 0:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 0:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 0:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 0:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 0:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1 (0x1)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1:0 returned 0 as expected
# [OK]                x64 syscall 1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1:19 returned 0 as expected
# [OK]                x64 syscall 1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1 (0xffffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1:0 returned 0 as expected
# [OK]                x64 syscall -1:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1:19 returned 0 as expected
# [OK]                x64 syscall -1:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -1:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741824 (0x40000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741824:0 returned 0 as expected
# [OK]                x64 syscall 1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741824:19 returned 0 as expected
# [OK]                x64 syscall 1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741824:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 1073741823 (0x3fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 1073741823:0 returned 0 as expected
# [OK]                x64 syscall 1073741823:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 1073741823:19 returned 0 as expected
# [OK]                x64 syscall 1073741823:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 1073741823:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 1073741823:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 1073741823:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 1073741823:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 1073741823:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 1073741823:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -1073741824 (0xc0000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -1073741824:0 returned 0 as expected
# [OK]                x64 syscall -1073741824:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -1073741824:19 returned 0 as expected
# [OK]                x64 syscall -1073741824:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -1073741824:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -1073741824:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -1073741824:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -1073741824:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -1073741824:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -1073741824:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = 2147483647 (0x7fffffff)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall 2147483647:0 returned 0 as expected
# [OK]                x64 syscall 2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall 2147483647:19 returned 0 as expected
# [OK]                x64 syscall 2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls 2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall 2147483647:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls 2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls 2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls 2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls 2147483647:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483648 (0x80000000)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483648:0 returned 0 as expected
# [OK]                x64 syscall -2147483648:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483648:19 returned 0 as expected
# [OK]                x64 syscall -2147483648:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483648:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483648:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -2147483648:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483648:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483648:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483648:0..999 returned -ENOSYS as expected
# [RUN]       Checking system calls with msb = -2147483647 (0x80000001)
# [RUN]           Checking some common syscalls as 64 bit
# [OK]                x64 syscall -2147483647:0 returned 0 as expected
# [OK]                x64 syscall -2147483647:1 returned 0 as expected
# [RUN]           Checking some 64-bit only syscalls as 64 bit
# [OK]                x64 syscall -2147483647:19 returned 0 as expected
# [OK]                x64 syscall -2147483647:20 returned 0 as expected
# [RUN]           Checking out of range system calls
# [OK]                x32 syscalls -2147483647:-64..-2 returned -ENOSYS as expected
# [OK]                x32 syscall -2147483647:-1 returned MODIFIED_BY_PTRACE as expected
# [OK]                x64 syscalls -2147483647:1073741760..1073741823 returned -ENOSYS as expected
# [OK]                x64 syscalls -2147483647:-64..-1 returned -ENOSYS as expected
# [OK]                x32 syscalls -2147483647:1073741759..1073741822 returned -ENOSYS as expected
# [RUN]           Checking for absence of x32 system calls
# [OK]                x32 syscalls -2147483647:0..999 returned -ENOSYS as expected
# [OK]    All system calls succeeded or failed as expected
ok 38 selftests: x86: syscall_numbering_64
# selftests: x86: corrupt_xstate_header_64
# [RUN]	Send ourselves a signal
# 	Wreck XSTATE header
# 	Got SIGSEGV
# [OK]	Back from the signal.  Now schedule.
# [RUN]	Send ourselves a signal
# 	Wreck XSTATE header
# 	Got SIGSEGV
# [OK]	Back from the signal.  Now schedule.
# [OK]	Back in the main thread.
ok 39 selftests: x86: corrupt_xstate_header_64
# selftests: x86: amx_64
# amx_64: [FAIL]	xstate cpuid: invalid tile data size/offset: 0/0: Success
not ok 40 selftests: x86: amx_64 # exit=1
# selftests: x86: ldt_gdt_64
# [NOTE]	set_thread_area is available; will use GDT index 12
# [OK]	LDT entry 0 has AR 0x0040FB00 and limit 0x0000000A
# [OK]	LDT entry 0 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00907B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07300 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07100 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07500 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00507700 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507F00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507D00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507B00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [RUN]	Test fork
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 0 is invalid
# [NOTE]	set_thread_area is available; will use GDT index 12
# [OK]	LDT entry 0 has AR 0x0040FB00 and limit 0x0000000A
# [OK]	LDT entry 0 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 1 is invalid
# [OK]	LDT entry 2 has AR 0x00C0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D0FB00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00907B00 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07300 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07100 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00D07500 and limit 0x0000AFFF
# [OK]	LDT entry 2 has AR 0x00507700 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507F00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507D00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507B00 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [OK]	LDT entry 2 has AR 0x00507900 and limit 0x0000000A
# [RUN]	Test fork
# [OK]	Child succeeded
# [RUN]	Test size
# [DONE]	Size test
# [OK]	modify_ldt failure 22
# [OK]	LDT entry 0 has AR 0x0000F300 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x00007300 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x0000F100 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x00007300 and limit 0x00000000
# [OK]	LDT entry 0 has AR 0x00007100 and limit 0x00000001
# [OK]	LDT entry 0 has AR 0x00007100 and limit 0x00000000
# [OK]	LDT entry 0 is invalid
# [OK]	LDT entry 0 has AR 0x0040F300 and limit 0x000FFFFF
# [OK]	LDT entry 0 has AR 0x00C0F300 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 has AR 0x00C0F100 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 has AR 0x00C0F700 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 has AR 0x00C0F500 and limit 0xFFFFFFFF
# [OK]	LDT entry 0 is invalid
# [RUN]	Cross-CPU LDT invalidation
# [OK]	All 5 iterations succeeded
# [RUN]	Test exec
# [OK]	LDT entry 0 has AR 0x0040FB00 and limit 0x0000002A
# [OK]	Child succeeded
# [OK]	Invalidate DS with set_thread_area: new DS = 0x0
# [OK]	Invalidate ES with set_thread_area: new ES = 0x0
# [OK]	Invalidate FS with set_thread_area: new FS = 0x0
# [OK]	New FSBASE was zero
# [OK]	Invalidate GS with set_thread_area: new GS = 0x0
# [OK]	New GSBASE was zero
ok 41 selftests: x86: ldt_gdt_64
# selftests: x86: ptrace_syscall_64
# [RUN]	Check int80 return regs
# [OK]	getpid() preserves regs
# [OK]	kill(getpid(), SIGUSR1) preserves regs
# [RUN]	ptrace-induced syscall restart
# [RUN]	SYSEMU
# [OK]	Initial nr and args are correct
# [RUN]	Restart the syscall (ip = 0x7fbd5eaad989)
# [OK]	Restarted nr and args are correct
# [RUN]	Change nr and args and restart the syscall (ip = 0x7fbd5eaad989)
# [OK]	Replacement nr and args are correct
# [OK]	Child exited cleanly
# [RUN]	kernel syscall restart under ptrace
# [RUN]	SYSCALL
# [OK]	Initial nr and args are correct
# [RUN]	SYSCALL
# [OK]	Args after SIGUSR1 are correct (ax = -514)
# [OK]	Child got SIGUSR1
# [RUN]	Step again
# [OK]	pause(2) restarted correctly
ok 42 selftests: x86: ptrace_syscall_64
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-kselftests-9c20c625e8f84a42c7963db854df4439553e8bc4/tools/testing/selftests/x86'

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---
:#! jobs/kernel-selftests-x86.yaml:
suite: kernel-selftests
testcase: kernel-selftests
category: functional
kconfig: x86_64-rhel-8.3-kselftests
need_memory: 2G
need_cpu: 2
kernel-selftests:
  group: x86
kernel_cmdline: erst_disable
job_origin: kernel-selftests-x86.yaml
:#! queue options:
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-skl-d05
tbox_group: lkp-skl-d05
submit_id: 625a376e57588fd6fc5e7b32
job_file: "/lkp/jobs/scheduled/lkp-skl-d05/kernel-selftests-x86-ucode=0xec-debian-10.4-x86_64-20200603.cgz-9c20c625e8f84a42c7963db854df4439553e8bc4-20220416-55036-ou3juh-0.yaml"
id: 0eabfc8d9e652bf9b549c6fc2eaf608c0d890a54
queuer_version: "/zday/lkp"
:#! hosts/lkp-skl-d05:
model: Skylake
nr_cpu: 4
memory: 32G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
hdd_partitions: "/dev/disk/by-id/wwn-0x5000c50091e544de-part*"
ssd_partitions: "/dev/disk/by-id/wwn-0x55cd2e4151977e28-part2"
rootfs_partition: "/dev/disk/by-id/wwn-0x55cd2e4151977e28-part1"
brand: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
:#! include/category/functional:
kmsg:
heartbeat:
meminfo:
:#! include/queue/cyclic:
commit: 9c20c625e8f84a42c7963db854df4439553e8bc4
:#! include/testbox/lkp-skl-d05:
need_kconfig_hw:
- E1000E: y
- SATA_AHCI
- DRM_I915
ucode: '0xec'
bisect_dmesg: true
:#! include/kernel-selftests:
need_kconfig:
- POSIX_TIMERS: y, v4.10-rc1
initrds:
- linux_headers
- linux_selftests
enqueue_time: 2022-04-16 11:26:39.179151259 +08:00
_id: 625a376e57588fd6fc5e7b32
_rt: "/result/kernel-selftests/x86-ucode=0xec/lkp-skl-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4"
:#! schedule options:
user: lkp
compiler: gcc-11
LKP_SERVER: internal-lkp-server
head_commit: 9543a52eb098ab4301b723f3999205614f83893b
base_commit: ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
branch: linux-devel/devel-hourly-20220415-101633
rootfs: debian-10.4-x86_64-20200603.cgz
result_root: "/result/kernel-selftests/x86-ucode=0xec/lkp-skl-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/0"
scheduler_version: "/lkp/lkp/.src-20220415-153857"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/kernel-selftests/x86-ucode=0xec/lkp-skl-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/vmlinuz-5.18.0-rc2-00646-g9c20c625e8f8
- branch=linux-devel/devel-hourly-20220415-101633
- job=/lkp/jobs/scheduled/lkp-skl-d05/kernel-selftests-x86-ucode=0xec-debian-10.4-x86_64-20200603.cgz-9c20c625e8f84a42c7963db854df4439553e8bc4-20220416-55036-ou3juh-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3-kselftests
- commit=9c20c625e8f84a42c7963db854df4439553e8bc4
- erst_disable
- max_uptime=2100
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/modules.cgz"
linux_headers_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/linux-headers.cgz"
linux_selftests_initrd: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/linux-selftests.cgz"
bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/kernel-selftests_20220411.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/kernel-selftests-x86_64-a17aac1b-1_20220413.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20220216.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn
:#! /cephfs/db/releases/20220415163227/lkp-src/include/site/inn:
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
:#! runtime status:
last_kernel: 5.17.0-rc2-00124-g572299f03afd
schedule_notify_address:
:#! user overrides:
kernel: "/pkg/linux/x86_64-rhel-8.3-kselftests/gcc-11/9c20c625e8f84a42c7963db854df4439553e8bc4/vmlinuz-5.18.0-rc2-00646-g9c20c625e8f8"
dequeue_time: 2022-04-16 12:16:25.534451327 +08:00
:#! /cephfs/db/releases/20220416111519/lkp-src/include/site/inn:
job_state: finished
loadavg: 1.35 0.46 0.17 2/142 2455
start_time: '1650082700'
end_time: '1650082713'
version: "/lkp/lkp/.src-20220415-153936:c7b8fcf9:f06178ed5"

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

ln -sf /usr/bin/clang
ln -sf /usr/bin/llc
sed -i s/default_timeout=45/default_timeout=300/ kselftest/runner.sh
make -C x86
make run_tests -C x86

--O5XBE6gyVG5Rl6Rj--
