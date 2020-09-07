Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA625FAE4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 15:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E26E450;
	Mon,  7 Sep 2020 13:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB0B6E44E;
 Mon,  7 Sep 2020 13:00:46 +0000 (UTC)
IronPort-SDR: U0XwZ+XrCDlOOB2QQjLxRta0ajuFEF/x9v83bIs7SkUOB3pWQbke2LVjA5CS5IQ9X2KSS7mDGK
 yvTDLlQpSX7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="145707582"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="145707582"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 06:00:45 -0700
IronPort-SDR: Fk7Z+/7Q7bfMqSWdcEvH9638S6jp/kZXDh6h+CWgPtooP+mloSphgfktjsn88LYgfPPlkjm03i
 n/jfjuFmB8qw==
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="479634341"
Received: from jazminsx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.24.158])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 06:00:42 -0700
Date: Mon, 7 Sep 2020 16:00:39 +0300
From: Joonas Lahtinen <jlahtine@jlahtine-mobl.ger.corp.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <20200907130039.GA27766@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Exactly same content as previous PR:

https://lists.freedesktop.org/archives/intel-gfx/2020-September/247626.html

Just rebased adding the missing S-o-b:s and updated "Fixes:" tags according=
ly
as requested.

Regards, Joonas

***

drm-intel-gt-next-2020-09-07:

(Same content as drm-intel-gt-next-2020-09-04-3, S-o-b's added)

UAPI Changes:
(- Potential implicit changes from WW locking refactoring)

Cross-subsystem Changes:
(- WW locking changes should align the i915 locking more with others)

Driver Changes:

- MAJOR: Apply WW locking across the driver (Maarten)

- Reverts for 5 commits to make applying WW locking faster (Maarten)
- Disable preparser around invalidations on Tigerlake for non-RCS engines (=
Chris)
- Add missing dma_fence_put() for error case of syncobj timeline (Chris)
- Parse command buffer earlier in eb_relocate(slow) to facilitate backoff (=
Maarten)
- Pin engine before pinning all objects (Maarten)
- Rework intel_context pinning to do everything outside of pin_mutex (Maart=
en)

- Avoid tracking GEM context until registered (Cc: stable, Chris)
- Provide a fastpath for waiting on vma bindings (Chris)
- Fixes to preempt-to-busy mechanism (Chris)
- Distinguish the virtual breadcrumbs from the irq breadcrumbs (Chris)
- Switch to object allocations for page directories (Chris)
- Hold context/request reference while breadcrumbs are active (Chris)
- Make sure execbuffer always passes ww state to i915_vma_pin (Maarten)

- Code refactoring to facilitate use of WW locking (Maarten)
- Locking refactoring to use more granular locking (Maarten, Chris)
- Support for multiple pinned timelines per engine (Chris)
- Move complication of I915_GEM_THROTTLE to the ioctl from general code (Ch=
ris)
- Make active tracking/vma page-directory stash work preallocated (Chris)
- Avoid flushing submission tasklet too often (Chris)
- Reduce context termination list iteration guard to RCU (Chris)
- Reductions to locking contention (Chris)
- Fixes for issues found by CI (Chris)
The following changes since commit 3393649977f9a8847c659e282ea290d4b703295c:

  Merge tag 'drm-intel-next-2020-08-24-1' of git://anongit.freedesktop.org/=
drm/drm-intel into drm-next (2020-08-28 14:09:31 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2020-0=
9-07

for you to fetch changes up to e0ee152fce25dc9269c7ea5280c98aa4b3682759:

  drm/i915: Unlock the shared hwsp_gtt object after pinning (2020-09-07 15:=
08:11 +0300)

----------------------------------------------------------------
(Same content as drm-intel-gt-next-2020-09-04-3, S-o-b's added)

UAPI Changes:
(- Potential implicit changes from WW locking refactoring)

Cross-subsystem Changes:
(- WW locking changes should align the i915 locking more with others)

Driver Changes:

- MAJOR: Apply WW locking across the driver (Maarten)

- Reverts for 5 commits to make applying WW locking faster (Maarten)
- Disable preparser around invalidations on Tigerlake for non-RCS engines (=
Chris)
- Add missing dma_fence_put() for error case of syncobj timeline (Chris)
- Parse command buffer earlier in eb_relocate(slow) to facilitate backoff (=
Maarten)
- Pin engine before pinning all objects (Maarten)
- Rework intel_context pinning to do everything outside of pin_mutex (Maart=
en)

- Avoid tracking GEM context until registered (Cc: stable, Chris)
- Provide a fastpath for waiting on vma bindings (Chris)
- Fixes to preempt-to-busy mechanism (Chris)
- Distinguish the virtual breadcrumbs from the irq breadcrumbs (Chris)
- Switch to object allocations for page directories (Chris)
- Hold context/request reference while breadcrumbs are active (Chris)
- Make sure execbuffer always passes ww state to i915_vma_pin (Maarten)

- Code refactoring to facilitate use of WW locking (Maarten)
- Locking refactoring to use more granular locking (Maarten, Chris)
- Support for multiple pinned timelines per engine (Chris)
- Move complication of I915_GEM_THROTTLE to the ioctl from general code (Ch=
ris)
- Make active tracking/vma page-directory stash work preallocated (Chris)
- Avoid flushing submission tasklet too often (Chris)
- Reduce context termination list iteration guard to RCU (Chris)
- Reductions to locking contention (Chris)
- Fixes for issues found by CI (Chris)

----------------------------------------------------------------
Chris Wilson (33):
      drm/i915: Reduce i915_request.lock contention for i915_request_wait
      drm/i915/selftests: Mock the status_page.vma for the kernel_context
      drm/i915: Soften the tasklet flush frequency before waits
      drm/i915/gem: Remove disordered per-file request list for throttling
      drm/i915/gt: Disable preparser around xcs invalidations on tgl
      drm/i915/gt: Delay taking the spinlock for grabbing from the buffer p=
ool
      drm/i915/selftests: Flush the active barriers before asserting
      drm/i915/gt: Fix termination condition for freeing all buffer objects
      drm/i915/gem: Delay tracking the GEM context until it is registered
      drm/i915/gt: Support multiple pinned timelines
      drm/i915/gt: Pull release of node->age under the spinlock
      drm/i915/selftests: Drop stale timeline constructor assert
      drm/i915: Skip taking acquire mutex for no ref->active callback
      drm/i915: Export a preallocate variant of i915_active_acquire()
      drm/i915: Keep the most recently used active-fence upon discard
      drm/i915: Make the stale cached active node available for any timeline
      drm/i915: Reduce locking around i915_active_acquire_preallocate_barri=
er()
      drm/i915: Provide a fastpath for waiting on vma bindings
      drm/i915: Remove requirement for holding i915_request.lock for breadc=
rumbs
      drm/i915/gt: Replace intel_engine_transfer_stale_breadcrumbs
      drm/i915/gt: Only transfer the virtual context to the new engine if a=
ctive
      drm/i915/gt: Distinguish the virtual breadcrumbs from the irq breadcr=
umbs
      drm/i915: Preallocate stashes for vma page-directories
      drm/i915/gt: Switch to object allocations for page directories
      drm/i915/gt: Shrink i915_page_directory's slab bucket
      drm/i915/gt: Move intel_breadcrumbs_arm_irq earlier
      drm/i915/gt: Hold context/request reference while breadcrumbs are act=
ive
      drm/i915/selftests: Prevent selecting 0 for our random width/align
      drm/i915/gem: Reduce context termination list iteration guard to RCU
      drm/i915/gem: Free the fence after a fence-chain lookup failure
      drm/i915: Be wary of data races when reading the active execlists
      drm/i915: Remove i915_request.lock requirement for execution callbacks
      drm/i915: Filter wake_flags passed to default_wake_function

Maarten Lankhorst (23):
      Revert "drm/i915/gem: Async GPU relocations only"
      drm/i915: Revert relocation chaining commits.
      Revert "drm/i915/gem: Drop relocation slowpath".
      Revert "drm/i915/gem: Split eb_vma into its own allocation"
      drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.
      drm/i915: Remove locking from i915_gem_object_prepare_read/write
      drm/i915: Parse command buffer earlier in eb_relocate(slow)
      drm/i915: Use per object locking in execbuf, v12.
      drm/i915: Use ww locking in intel_renderstate.
      drm/i915: Add ww context handling to context_barrier_task
      drm/i915: Nuke arguments to eb_pin_engine
      drm/i915: Pin engine before pinning all objects, v5.
      drm/i915: Rework intel_context pinning to do everything outside of pi=
n_mutex
      drm/i915: Make sure execbuffer always passes ww state to i915_vma_pin.
      drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as w=
ell, v2.
      drm/i915: Kill last user of intel_context_create_request outside of s=
elftests
      drm/i915: Convert i915_perf to ww locking as well
      drm/i915: Dirty hack to fix selftests locking inversion
      drm/i915/selftests: Fix locking inversion in lrc selftest.
      drm/i915: Use ww pinning for intel_context_create_request()
      drm/i915: Move i915_vma_lock in the selftests to avoid lock inversion=
, v3.
      drm/i915: Add ww locking to vm_fault_gtt
      drm/i915: Add ww locking to pin_to_display_plane, v2.

Thomas Hellstr=F6m (1):
      drm/i915: Unlock the shared hwsp_gtt object after pinning

 drivers/gpu/drm/i915/display/intel_display.c       |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |   89 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  105 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   80 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 1601 +++++++++++++---=
----
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   51 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   40 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |  152 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.h     |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   10 +
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |   67 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    9 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    2 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   50 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  144 +-
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |   60 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   45 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c |    2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  106 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.h               |    5 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  181 +--
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  305 ++--
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h        |   36 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |   47 +
 drivers/gpu/drm/i915/gt/intel_context.c            |  318 ++--
 drivers/gpu/drm/i915/gt/intel_context.h            |   13 +
 drivers/gpu/drm/i915/gt/intel_context_types.h      |    5 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   20 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   34 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    3 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   31 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   97 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   23 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |  103 +-
 .../gpu/drm/i915/gt/intel_gt_buffer_pool_types.h   |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  300 +---
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  142 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  182 ++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |  150 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   73 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.h        |    9 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    1 +
 drivers/gpu/drm/i915/gt/intel_ring.c               |   10 +-
 drivers/gpu/drm/i915/gt/intel_ring.h               |    3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   42 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    1 +
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   28 +-
 drivers/gpu/drm/i915/gt/intel_timeline.h           |   24 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   43 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   30 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |    2 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   22 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   30 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   10 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    3 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   17 +-
 drivers/gpu/drm/i915/i915_active.c                 |  237 ++-
 drivers/gpu/drm/i915/i915_active.h                 |   31 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   24 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  107 +-
 drivers/gpu/drm/i915/i915_gem.h                    |   12 +
 drivers/gpu/drm/i915/i915_irq.c                    |    1 +
 drivers/gpu/drm/i915/i915_perf.c                   |   57 +-
 drivers/gpu/drm/i915/i915_request.c                |  224 +--
 drivers/gpu/drm/i915/i915_request.h                |    8 -
 drivers/gpu/drm/i915/i915_sw_fence.c               |   10 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   65 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   13 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   41 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   75 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |    4 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   18 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |    2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |    8 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |   26 +-
 82 files changed, 3743 insertions(+), 2206 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
