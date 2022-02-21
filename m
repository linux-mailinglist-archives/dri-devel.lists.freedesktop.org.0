Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E94BD87C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBDD112ADB;
	Mon, 21 Feb 2022 09:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6148112AD6;
 Mon, 21 Feb 2022 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645435302; x=1676971302;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=5dO8+eQczs875rovFh5VYn7EcAoTMPPMwhJHbldq6N8=;
 b=PnqT89KLWx1blaag7fYR8PH+6jHi+BxgwKjC8+c4EL/7M72IfJIE2FeF
 a+K6XCrHrNaod6LRknGGocatmyPsyFduItsx9hgl7BSReFGhTzGVFwoC+
 XKxkn6Fd4JurHinPTjxEBglXMCeKdOOSuIku3LXHD8IhQYZ+ePFU5cBAQ
 asTCVaf9biogsg3P5iVm3YWfDT6ZBYUazODspM0pjqa88GKAeMoF5w/zu
 yDuLASLXhHh4Eb7dp5GHBuFASn+nHDGh8C/oL0/j8CX7g6Axb1Owu9FJS
 Gy9OVch6LRAvdBLRFxqmnImBQ/EHgB9Udx/PbKZBZIOjh1yABz7Pv4iTW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="249051965"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="249051965"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 01:21:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="531786869"
Received: from deyangko-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.22.248])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 01:21:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] drm-intel-gt-next
In-Reply-To: <CAPM=9tz7HpbshsbeG4JChmMGy--2h1FzJePwzwGhxdPvNkD2Kg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Yg4i2aCZvvee5Eai@jlahtine-mobl.ger.corp.intel.com>
 <CAPM=9tz7HpbshsbeG4JChmMGy--2h1FzJePwzwGhxdPvNkD2Kg@mail.gmail.com>
Date: Mon, 21 Feb 2022 11:21:35 +0200
Message-ID: <87o830378g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "DRM maintainer tools announcements, 
 discussion, and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022, Dave Airlie <airlied@gmail.com> wrote:
> On Thu, 17 Feb 2022 at 20:26, Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com> wrote:
>>
>> Hi Dave & Daniel,
>>
>> Here is the first drm-intel-gt-next feature PR towards v5.18.
>
> Am I missing some previous drm-intel pull?
>
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/gt/intel_workarou=
nds.c:
> In function =E2=80=98rcs_engine_wa_init=E2=80=99:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/gt/intel_workarou=
nds.c:2051:40:
> error: =E2=80=98XEHP_DIS_BBL_SYSPIPE=E2=80=99 undeclared (first use in th=
is function)
>  2051 |   wa_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
>       |                                        ^~~~~~~~~~~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/gt/intel_workarou=
nds.c:2051:40:
> note: each undeclared identifier is reported only once for each
> function it appears in

There's apparently a silent conflict between changes in drm-intel-next
and drm-intel-gt-next. There's a fixup patch in drm-rerere:
fixups/drm-intel-gt-next.patch.

We opted to sync the branches via drm-next pulls and backmerges, but I'm
afraid that means you'd have to use the fixups when merging. I guess we
failed to communicate that. The alternative would've been cross-merges
within drm-intel.


BR,
Jani.


>
> Dave.
>>
>> For DG2 adds subplatform G12, missing workarounds and fixes GuC
>> loading on ARM64. C0/D0 stepping info added for RPL-S.
>>
>> For uAPI enables support for simple parallel submission with
>> execlists which was previously enabled only for GuC.
>>
>> Further fixes for PMU metrics when GuC is enabled, better error
>> reporting for GuC loading failures. Fix for PXP unbind splat.
>> Updates to GuC version 69.0.3 with improvements to GT reset
>> scenarios.
>>
>> The rest is mostly refactoring of the memory management code,
>> as highlights introduction of async unbinding/migration and
>> removal of short-term pinning in execbuf.
>>
>> Then a few selftest and coding style fixes.
>>
>> Regards, Joonas
>>
>> ***
>>
>> drm-intel-gt-next-2022-02-17:
>>
>> UAPI Changes:
>>
>> - Weak parallel submission support for execlists
>>
>>   Minimal implementation of the parallel submission support for
>>   execlists backend that was previously only implemented for GuC.
>>   Support one sibling non-virtual engine.
>>
>> Core Changes:
>>
>> - Two backmerges of drm/drm-next for header file renames/changes and
>>   i915_regs reorganization
>>
>> Driver Changes:
>>
>> - Add new DG2 subplatform: DG2-G12 (Matt R)
>> - Add new DG2 workarounds (Matt R, Ram, Bruce)
>> - Handle pre-programmed WOPCM registers for DG2+ (Daniele)
>> - Update guc shim control programming on XeHP SDV+ (Daniele)
>> - Add RPL-S C0/D0 stepping information (Anusha)
>> - Improve GuC ADS initialization to work on ARM64 on dGFX (Lucas)
>>
>> - Fix KMD and GuC race on accessing PMU busyness (Umesh)
>> - Use PM timestamp instead of RING TIMESTAMP for reference in PMU with G=
uC (Umesh)
>> - Report error on invalid reset notification from GuC (John)
>> - Avoid WARN splat by holding RPM wakelock during PXP unbind (Juston)
>> - Fixes to parallel submission implementation (Matt B.)
>> - Improve GuC loading status check/error reports (John)
>> - Tweak TTM LRU priority hint selection (Matt A.)
>> - Align the plane_vma to min_page_size of stolen mem (Ram)
>>
>> - Introduce vma resources and implement async unbinding (Thomas)
>> - Use struct vma_resource instead of struct vma_snapshot (Thomas)
>> - Return some TTM accel move errors instead of trying memcpy move (Thoma=
s)
>> - Fix a race between vma / object destruction and unbinding (Thomas)
>> - Remove short-term pins from execbuf (Maarten)
>> - Update to GuC version 69.0.3 (John, Michal Wa.)
>> - Improvements to GT reset paths in GuC backend (Matt B.)
>> - Use shrinker_release_pages instead of writeback in shmem object hooks =
(Matt A., Tvrtko)
>> - Use trylock instead of blocking lock when freeing GEM objects (Maarten)
>> - Allocate intel_engine_coredump_alloc with ALLOW_FAIL (Matt B.)
>> - Fixes to object unmapping and purging (Matt A)
>> - Check for wedged device in GuC backend (John)
>> - Avoid lockdep splat by locking dpt_obj around set_cache_level (Maarten)
>> - Allow dead vm to unbind vma's without lock (Maarten)
>> - s/engine->i915/i915/ for DG2 engine workarounds (Matt R)
>>
>> - Use to_gt() helper for GGTT accesses (Michal Wi.)
>> - Selftest improvements (Matt B., Thomas, Ram)
>> - Coding style and compiler warning fixes (Matt B., Jasmine, Andi, Colin=
, Gustavo, Dan)
>>
>> The following changes since commit 53dbee4926d3706ca9e03f3928fa85b5ec3bc=
0cc:
>>
>>   Merge tag 'drm-misc-next-2022-01-27' of git://anongit.freedesktop.org/=
drm/drm-misc into drm-next (2022-02-01 19:02:41 +1000)
>>
>> are available in the Git repository at:
>>
>>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-202=
2-02-17
>>
>> for you to fetch changes up to 154cfae6158141b18d65abb0db679bb51a8294e7:
>>
>>   drm/i915/dg2: Add Wa_22011100796 (2022-02-11 17:11:44 +0530)
>>
>> ----------------------------------------------------------------
>> UAPI Changes:
>>
>> - Weak parallel submission support for execlists
>>
>>   Minimal implementation of the parallel submission support for
>>   execlists backend that was previously only implemented for GuC.
>>   Support one sibling non-virtual engine.
>>
>> Core Changes:
>>
>> - Two backmerges of drm/drm-next for header file renames/changes and
>>   i915_regs reorganization
>>
>> Driver Changes:
>>
>> - Add new DG2 subplatform: DG2-G12 (Matt R)
>> - Add new DG2 workarounds (Matt R, Ram, Bruce)
>> - Handle pre-programmed WOPCM registers for DG2+ (Daniele)
>> - Update guc shim control programming on XeHP SDV+ (Daniele)
>> - Add RPL-S C0/D0 stepping information (Anusha)
>> - Improve GuC ADS initialization to work on ARM64 on dGFX (Lucas)
>>
>> - Fix KMD and GuC race on accessing PMU busyness (Umesh)
>> - Use PM timestamp instead of RING TIMESTAMP for reference in PMU with G=
uC (Umesh)
>> - Report error on invalid reset notification from GuC (John)
>> - Avoid WARN splat by holding RPM wakelock during PXP unbind (Juston)
>> - Fixes to parallel submission implementation (Matt B.)
>> - Improve GuC loading status check/error reports (John)
>> - Tweak TTM LRU priority hint selection (Matt A.)
>> - Align the plane_vma to min_page_size of stolen mem (Ram)
>>
>> - Introduce vma resources and implement async unbinding (Thomas)
>> - Use struct vma_resource instead of struct vma_snapshot (Thomas)
>> - Return some TTM accel move errors instead of trying memcpy move (Thoma=
s)
>> - Fix a race between vma / object destruction and unbinding (Thomas)
>> - Remove short-term pins from execbuf (Maarten)
>> - Update to GuC version 69.0.3 (John, Michal Wa.)
>> - Improvements to GT reset paths in GuC backend (Matt B.)
>> - Use shrinker_release_pages instead of writeback in shmem object hooks =
(Matt A., Tvrtko)
>> - Use trylock instead of blocking lock when freeing GEM objects (Maarten)
>> - Allocate intel_engine_coredump_alloc with ALLOW_FAIL (Matt B.)
>> - Fixes to object unmapping and purging (Matt A)
>> - Check for wedged device in GuC backend (John)
>> - Avoid lockdep splat by locking dpt_obj around set_cache_level (Maarten)
>> - Allow dead vm to unbind vma's without lock (Maarten)
>> - s/engine->i915/i915/ for DG2 engine workarounds (Matt R)
>>
>> - Use to_gt() helper for GGTT accesses (Michal Wi.)
>> - Selftest improvements (Matt B., Thomas, Ram)
>> - Coding style and compiler warning fixes (Matt B., Jasmine, Andi, Colin=
, Gustavo, Dan)
>>
>> ----------------------------------------------------------------
>> Andi Shyti (2):
>>       drm/i915: Remove unused i915->ggtt
>>       drm/i915: fix header file inclusion for might_alloc()
>>
>> Anusha Srivatsa (1):
>>       drm/i915/rpl-s: Add stepping info
>>
>> Bruce Chang (1):
>>       drm/i915/dg2: Add Wa_22011100796
>>
>> Colin Ian King (1):
>>       i915: make array flex_regs static const
>>
>> Dan Carpenter (1):
>>       drm/i915: delete shadow "ret" variable
>>
>> Daniele Ceraolo Spurio (2):
>>       drm/i915/wopcm: Handle pre-programmed WOPCM registers
>>       drm/i915/guc: Update guc shim control programming on newer platfor=
ms
>>
>> Gustavo A. R. Silva (1):
>>       drm/i915/guc: Use struct_size() helper in kmalloc()
>>
>> Jasmine Newsome (1):
>>       drm/i915/gem: Use local pointer ttm for __i915_ttm_move
>>
>> John Harrison (5):
>>       drm/i915/guc: Report error on invalid reset notification
>>       drm/i915/guc: Check for wedged before doing stuff
>>       drm/i915/guc: Temporarily bump the GuC load timeout
>>       drm/i915/guc: Update to GuC version 69.0.3
>>       drm/i915/guc: Improve GuC loading status check/error reports
>>
>> Joonas Lahtinen (1):
>>       Merge drm/drm-next into drm-intel-gt-next
>>
>> Juston Li (1):
>>       drm/i915/pxp: Hold RPM wakelock during PXP unbind
>>
>> Lucas De Marchi (2):
>>       drm/i915/guc: Prepare for error propagation
>>       drm/i915/guc: Use a single pass to calculate regset
>>
>> Maarten Lankhorst (8):
>>       drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to prevent new EN=
OSPC errors, v2.
>>       drm/i915: Add locking to i915_gem_evict_vm(), v3.
>>       drm/i915: Add object locking to i915_gem_evict_for_node and i915_g=
em_evict_something, v2.
>>       drm/i915: Add i915_vma_unbind_unlocked, and take obj lock for i915=
_vma_unbind, v2.
>>       drm/i915: Remove support for unlocked i915_vma unbind
>>       drm/i915: Remove short-term pins from execbuf, v6.
>>       drm/i915: Lock dpt_obj around set_cache_level, v2.
>>       drm/i915: Allow dead vm to unbind vma's without lock.
>>
>> Matt Roper (4):
>>       drm/i915/dg2: Add Wa_18018781329
>>       drm/i915/dg2: Add Wa_14015227452
>>       drm/i915/dg2: s/engine->i915/i915/ for engine workarounds
>>       drm/i915: Introduce G12 subplatform of DG2
>>
>> Matthew Auld (7):
>>       drm/i915: remove writeback hook
>>       drm/i915: clean up shrinker_release_pages
>>       drm/i915: don't call free_mmap_offset when purging
>>       drm/i915/ttm: only fault WILLNEED objects
>>       drm/i915/ttm: add unmap_virtual callback
>>       drm/i915/ttm: ensure we unmap when purging
>>       drm/i915/ttm: tweak priority hint selection
>>
>> Matthew Brost (11):
>>       drm/i915/execlists: Weak parallel submission support for execlists
>>       drm/i915: Fix possible uninitialized variable in parallel extension
>>       drm/i915: Increment composite fence seqno
>>       drm/i915/selftests: Add a cancel request selftest that triggers a =
reset
>>       drm/i915/guc: Remove hacks for reset and schedule disable G2H bein=
g received out of order
>>       drm/i915: Allocate intel_engine_coredump_alloc with ALLOW_FAIL
>>       drm/i915/guc: Add work queue to trigger a GT reset
>>       drm/i915/guc: Flush G2H handler during a GT reset
>>       drm/i915: Lock timeline mutex directly in error path of eb_pin_tim=
eline
>>       drm/i915/guc: Ensure multi-lrc fini breadcrumb math is correct
>>       drm/i915/selftests: Use less in contexts steal guc id test
>>
>> Micha=C5=82 Winiarski (5):
>>       drm/i915/gt: Use to_gt() helper for GGTT accesses
>>       drm/i915: Use to_gt() helper for GGTT accesses
>>       drm/i915/gem: Use to_gt() helper for GGTT accesses
>>       drm/i915/display: Use to_gt() helper for GGTT accesses
>>       drm/i915/selftests: Use to_gt() helper for GGTT accesses
>>
>> Ramalingam C (3):
>>       drm/i915/dg2: Add Wa_22011450934
>>       drm/i915: align the plane_vma to min_page_size of stolen mem
>>       drm/i915: More gt idling time with guc submission
>>
>> Thomas Hellstr=C3=B6m (9):
>>       drm/i915: Initial introduction of vma resources
>>       drm/i915: Use the vma resource as argument for gtt binding / unbin=
ding
>>       drm/i915: Don't pin the object pages during pending vma binds
>>       drm/i915: Use vma resources for async unbinding
>>       drm/i915: Asynchronous migration selftest
>>       drm/i915: Use struct vma_resource instead of struct vma_snapshot
>>       drm/i915: Fix vma resource freeing
>>       drm/i915: Fix a race between vma / object destruction and unbinding
>>       drm/i915/ttm: Return some errors instead of trying memcpy move
>>
>> Tvrtko Ursulin (1):
>>       Merge drm/drm-next into drm-intel-gt-next
>>
>> Umesh Nerlige Ramappa (2):
>>       drm/i915/pmu: Use PM timestamp instead of RING TIMESTAMP for refer=
ence
>>       drm/i915/pmu: Fix KMD and GuC race on accessing busyness
>>
>>  Documentation/gpu/i915.rst                         |   1 +
>>  drivers/gpu/drm/i915/Makefile                      |   2 +-
>>  drivers/gpu/drm/i915/display/intel_dpt.c           |  33 +-
>>  drivers/gpu/drm/i915/display/intel_fb_pin.c        |   8 +-
>>  drivers/gpu/drm/i915/display/intel_fbc.c           |   2 +-
>>  drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 +-
>>  drivers/gpu/drm/i915/display/intel_plane_initial.c |   7 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_context.c        |  11 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_context.h        |   2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 248 ++++++------
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  36 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_object.c         |  18 +
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h         |   4 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  51 ++-
>>  drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  10 -
>>  drivers/gpu/drm/i915/gem/i915_gem_pm.c             |   2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  17 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  30 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   8 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |  15 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  16 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  27 +-
>>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  39 +-
>>  .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   4 +-
>>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   2 +-
>>  .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  | 192 +++++++++-
>>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  25 +-
>>  .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |   2 +-
>>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  19 +-
>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  37 +-
>>  drivers/gpu/drm/i915/gt/intel_context.c            |   4 +-
>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   9 +-
>>  .../gpu/drm/i915/gt/intel_execlists_submission.c   |  38 ++
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c               | 133 ++++---
>>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   7 +-
>>  drivers/gpu/drm/i915/gt/intel_gt.c                 |   7 +-
>>  drivers/gpu/drm/i915/gt/intel_gt.h                 |   2 +-
>>  drivers/gpu/drm/i915/gt/intel_gtt.c                |   4 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h                |  19 +-
>>  drivers/gpu/drm/i915/gt/intel_lrc.c                |  32 ++
>>  drivers/gpu/drm/i915/gt/intel_ppgtt.c              |  22 +-
>>  drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   4 +-
>>  drivers/gpu/drm/i915/gt/intel_reset.c              |   9 +
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c        |  39 +-
>>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   2 +-
>>  drivers/gpu/drm/i915/gt/selftest_reset.c           |   2 +-
>>  drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |  80 ++--
>>  drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |  23 ++
>>  drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |  82 ++++
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c             | 126 ++++++-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  25 ++
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         | 204 +++++++---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          | 143 +++----
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  38 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  37 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  31 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |   3 +
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |   7 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 262 +++++++++----
>>  drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   1 +
>>  drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  31 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  43 ++-
>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   2 +-
>>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |   2 +-
>>  drivers/gpu/drm/i915/gvt/aperture_gm.c             |   2 +-
>>  drivers/gpu/drm/i915/gvt/dmabuf.c                  |   2 +-
>>  drivers/gpu/drm/i915/i915_debugfs.c                |   7 +-
>>  drivers/gpu/drm/i915/i915_driver.c                 |  10 +-
>>  drivers/gpu/drm/i915/i915_drv.h                    |  32 +-
>>  drivers/gpu/drm/i915/i915_gem.c                    |  37 +-
>>  drivers/gpu/drm/i915/i915_gem_evict.c              | 101 ++++-
>>  drivers/gpu/drm/i915/i915_gem_gtt.c                |  16 +-
>>  drivers/gpu/drm/i915/i915_gem_gtt.h                |   4 +
>>  drivers/gpu/drm/i915/i915_getparam.c               |   2 +-
>>  drivers/gpu/drm/i915/i915_gpu_error.c              |  89 ++---
>>  drivers/gpu/drm/i915/i915_module.c                 |   3 +
>>  drivers/gpu/drm/i915/i915_pci.c                    |   1 +
>>  drivers/gpu/drm/i915/i915_perf.c                   |   8 +-
>>  drivers/gpu/drm/i915/i915_reg.h                    |  12 +-
>>  drivers/gpu/drm/i915/i915_request.c                |  12 +-
>>  drivers/gpu/drm/i915/i915_request.h                |   6 +-
>>  drivers/gpu/drm/i915/i915_vgpu.c                   |   2 +-
>>  drivers/gpu/drm/i915/i915_vma.c                    | 376 +++++++++++++-=
----
>>  drivers/gpu/drm/i915/i915_vma.h                    |  34 +-
>>  drivers/gpu/drm/i915/i915_vma_resource.c           | 418 ++++++++++++++=
+++++++
>>  drivers/gpu/drm/i915/i915_vma_resource.h           | 234 ++++++++++++
>>  drivers/gpu/drm/i915/i915_vma_snapshot.c           | 134 -------
>>  drivers/gpu/drm/i915/i915_vma_snapshot.h           | 112 ------
>>  drivers/gpu/drm/i915/i915_vma_types.h              |  19 +-
>>  drivers/gpu/drm/i915/intel_device_info.h           |   4 +-
>>  drivers/gpu/drm/i915/intel_step.c                  |  15 +
>>  drivers/gpu/drm/i915/intel_wopcm.c                 |  42 ++-
>>  drivers/gpu/drm/i915/selftests/i915_gem.c          |   8 +-
>>  drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |  28 +-
>>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      | 209 +++++++----
>>  drivers/gpu/drm/i915/selftests/i915_request.c      | 119 +++++-
>>  drivers/gpu/drm/i915/selftests/i915_vma.c          |  30 +-
>>  drivers/gpu/drm/i915/selftests/igt_flush_test.c    |   2 +-
>>  drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  11 +-
>>  drivers/gpu/drm/i915/selftests/mock_gtt.c          |  21 +-
>>  drivers/gpu/drm/i915/selftests/mock_gtt.h          |   3 +-
>>  101 files changed, 3149 insertions(+), 1359 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>>  create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
>>  create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
>>  delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
>>  delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

--=20
Jani Nikula, Intel Open Source Graphics Center
