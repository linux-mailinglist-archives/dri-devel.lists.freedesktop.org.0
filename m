Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EDC7B1C9A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812F910E644;
	Thu, 28 Sep 2023 12:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572ED10E628;
 Thu, 28 Sep 2023 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695904598; x=1727440598;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FMo128/F27wQJxhudFRZuHJvwWPZ2MeyMJ9NetC3Qro=;
 b=VDhJN4HSJpyXchozsmO6Q2WXRMrOLhlbh/oGmSEoBxGKp6KugCda+2Ly
 53pbDpq6TupLEMWpk6wDBrvvqK35Qhv0RLM3QZsTWzkDi3tqKrYtzVLvi
 EWcqdzYXRTdUg8umokZYGGUArPXuFsqjLkpeQ0f3FGD19patgXuygFzbr
 aP8ksbqKBS43VGuS57s6mM8LDwNcEIrFIvsrBdPrxGBcD11MG5XwDAqap
 feO5Gv4yXhztozQ/cUnMPpF5aa5fwnhJZ1X2nIzwi/rU6Fd0/4r5qv6jP
 CTafjLToqe7W5IaK5aFwjzVDNThSw32e9yixyNSiZN22qEYlTpLsweFhd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468330772"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="468330772"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839835800"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="839835800"
Received: from nlachman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.204.130])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:36:34 -0700
Date: Thu, 28 Sep 2023 13:36:32 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZRVzL02VFuwIkcGl@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Here goes the first pull request for 6.7.

Nothing major in this round - a bunch of fixes, mostly relating to various
GuC and PXP features/functionalities, and a few new mostly DG2
workarounds.

Tiny bit or Meteorlake enablement and a tiny bit of selftests fixes and
even less code base tidies.

Regards,

Tvrtko

drm-intel-gt-next-2023-09-28:
Driver Changes:

Fixes/improvements/new stuff:

- Fix TLB-Invalidation seqno store [mtl] (Alan Previn)
- Force a reset on internal GuC error [guc] (John Harrison)
- Define GSC fw [gsc] (Daniele Ceraolo Spurio)
- Update workaround 14016712196 [dg2/mtl] (Tejas Upadhyay)
- Mark requests for GuC virtual engines to avoid use-after-free (Andrzej Hajda)
- Add Wa_14015150844 [dg2/mtl] (Shekhar Chauhan)
- Prevent error pointer dereference (Dan Carpenter)
- Add Wa_18022495364 [tgl,adl,rpl] (Dnyaneshwar Bhadane)
- Fix GuC PMU by moving execlist stats initialization to execlist specific setup (Umesh Nerlige Ramappa)
- Fix PXP firmware load [pxp/mtl] (Alan Previn)
- Fix execution/context state of PXP contexts (Alan Previn)
- Limit the length of an sg list to the requested length (Matthew Wilcox)
- Fix reservation address in ggtt_reserve_guc_top [guc] (Javier Pello)
- Add Wa_18028616096 [dg2] (Shekhar Chauhan)
- Get runtime pm in busyness worker only if already active [guc/pmu] (Umesh Nerlige Ramappa)
- Don't set PIPE_CONTROL_FLUSH_L3 for aux inval (Nirmoy Das)

Future platform enablement:

- Fix and consolidate some workaround checks, make others IP version based [mtl] (Matt Roper)
- Replace Meteorlake subplatforms with IP version checks (Matt Roper)
- Adding DeviceID for Arrowlake-S under MTL [mtl] (Nemesa Garg)
- Run relevant bits of debugfs drop_caches per GT (Tvrtko Ursulin)

Miscellaneous:

- Remove Wa_15010599737 [dg2] (Shekhar Chauhan)
- Align igt_spinner_create_request with hangcheck [selftests] (Jonathan Cavitt)
- Remove pre-production workarounds [dg2] (Matt Roper)
- Tidy some workaround definitions (Matt Roper)
- Wait longer for tasks in migrate selftest [gt] (Jonathan Cavitt)
- Skip WA verification for GEN7_MISCCPCTL on DG2 [gt] (Andrzej Hajda)
- Silence injected failure in the load via GSC path [huc] (Daniele Ceraolo Spurio)
- Refactor deprecated strncpy (Justin Stitt)
- Update RC6 mask for mtl_drpc [debugfs/mtl] (Badal Nilawar)
- Remove a static inline that requires including i915_drv.h [gt] (Jani Nikula)
- Remove inlines from i915_gem_execbuffer.c [gem] (Jani Nikula)
- Remove gtt_offset from stream->oa_buffer.head/.tail [perf] (Ashutosh Dixit)
- Do not disable preemption for resets (Tvrtko Ursulin)
The following changes since commit 788568fad4015406fa84fc86cefbef7c470c7c1f:

  drm/i915/guc: Fix potential null pointer deref in GuC 'steal id' test (2023-08-10 16:02:01 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-09-28

for you to fetch changes up to 03d681412b38558aefe4fb0f46e36efa94bb21ef:

  drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval (2023-09-28 11:39:30 +0200)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Fix TLB-Invalidation seqno store [mtl] (Alan Previn)
- Force a reset on internal GuC error [guc] (John Harrison)
- Define GSC fw [gsc] (Daniele Ceraolo Spurio)
- Update workaround 14016712196 [dg2/mtl] (Tejas Upadhyay)
- Mark requests for GuC virtual engines to avoid use-after-free (Andrzej Hajda)
- Add Wa_14015150844 [dg2/mtl] (Shekhar Chauhan)
- Prevent error pointer dereference (Dan Carpenter)
- Add Wa_18022495364 [tgl,adl,rpl] (Dnyaneshwar Bhadane)
- Fix GuC PMU by moving execlist stats initialization to execlist specific setup (Umesh Nerlige Ramappa)
- Fix PXP firmware load [pxp/mtl] (Alan Previn)
- Fix execution/context state of PXP contexts (Alan Previn)
- Limit the length of an sg list to the requested length (Matthew Wilcox)
- Fix reservation address in ggtt_reserve_guc_top [guc] (Javier Pello)
- Add Wa_18028616096 [dg2] (Shekhar Chauhan)
- Get runtime pm in busyness worker only if already active [guc/pmu] (Umesh Nerlige Ramappa)
- Don't set PIPE_CONTROL_FLUSH_L3 for aux inval (Nirmoy Das)

Future platform enablement:

- Fix and consolidate some workaround checks, make others IP version based [mtl] (Matt Roper)
- Replace Meteorlake subplatforms with IP version checks (Matt Roper)
- Adding DeviceID for Arrowlake-S under MTL [mtl] (Nemesa Garg)
- Run relevant bits of debugfs drop_caches per GT (Tvrtko Ursulin)

Miscellaneous:

- Remove Wa_15010599737 [dg2] (Shekhar Chauhan)
- Align igt_spinner_create_request with hangcheck [selftests] (Jonathan Cavitt)
- Remove pre-production workarounds [dg2] (Matt Roper)
- Tidy some workaround definitions (Matt Roper)
- Wait longer for tasks in migrate selftest [gt] (Jonathan Cavitt)
- Skip WA verification for GEN7_MISCCPCTL on DG2 [gt] (Andrzej Hajda)
- Silence injected failure in the load via GSC path [huc] (Daniele Ceraolo Spurio)
- Refactor deprecated strncpy (Justin Stitt)
- Update RC6 mask for mtl_drpc [debugfs/mtl] (Badal Nilawar)
- Remove a static inline that requires including i915_drv.h [gt] (Jani Nikula)
- Remove inlines from i915_gem_execbuffer.c [gem] (Jani Nikula)
- Remove gtt_offset from stream->oa_buffer.head/.tail [perf] (Ashutosh Dixit)
- Do not disable preemption for resets (Tvrtko Ursulin)

----------------------------------------------------------------
Alan Previn (4):
      drm/i915: Fix TLB-Invalidation seqno store
      drm/i915/pxp/mtl: Update pxp-firmware response timeout
      drm/i915/pxp/mtl: Update pxp-firmware packet size
      drm/i915/lrc: User PXP contexts requires runalone bit in lrc

Andrzej Hajda (2):
      drm/i915: mark requests for GuC virtual engines to avoid use-after-free
      drm/i915/gt: skip WA verification for GEN7_MISCCPCTL on DG2

Ashutosh Dixit (1):
      drm/i915/perf: Remove gtt_offset from stream->oa_buffer.head/.tail

Badal Nilawar (1):
      drm/i915/gt: Update RC6 mask for mtl_drpc

Dan Carpenter (1):
      drm/i915/gt: Prevent error pointer dereference

Daniele Ceraolo Spurio (2):
      drm/i915/gsc: define gsc fw
      drm/i915/huc: silence injected failure in the load via GSC path

Dnyaneshwar Bhadane (1):
      drm/i915: Add Wa_18022495364

Jani Nikula (2):
      drm/i915/gt: remove a static inline that requires including i915_drv.h
      drm/i915/gem: remove inlines from i915_gem_execbuffer.c

Javier Pello (1):
      drm/i915/gt: Fix reservation address in ggtt_reserve_guc_top

John Harrison (1):
      drm/i915/guc: Force a reset on internal GuC error

Jonathan Cavitt (2):
      drm/i915/selftests: Align igt_spinner_create_request with hangcheck
      drm/i915/gt: Wait longer for tasks in migrate selftest

Justin Stitt (1):
      drm/i915: refactor deprecated strncpy

Matt Roper (11):
      drm/i915/dg2: Drop pre-production GT workarounds
      drm/i915: Tidy workaround definitions
      drm/i915/dg2: Drop Wa_16011777198
      drm/i915: Consolidate condition for Wa_22011802037
      drm/i915/xelpmp: Don't assume workarounds extend to future platforms
      drm/i915/xelpg: Call Xe_LPG workaround functions based on IP version
      drm/i915: Eliminate IS_MTL_GRAPHICS_STEP
      drm/i915: Eliminate IS_MTL_MEDIA_STEP
      drm/i915/mtl: Eliminate subplatforms
      drm/i915: Replace several IS_METEORLAKE with proper IP version checks
      drm/i915/mtl: Drop Wa_14017240301

Matthew Wilcox (Oracle) (1):
      i915: Limit the length of an sg list to the requested length

Nemesa Garg (1):
      drm/i915/mtl: Adding DeviceID for Arrowlake-S under MTL

Nirmoy Das (1):
      drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval

Shekhar Chauhan (3):
      drm/i915/dg2: Remove Wa_15010599737
      drm/i915: Add Wa_14015150844
      drm/i915: Add Wa_18028616096

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14016712196

Tvrtko Ursulin (2):
      drm/i915: Run relevant bits of debugfs drop_caches per GT
      drm/i915: Do not disable preemption for resets

Umesh Nerlige Ramappa (2):
      i915/pmu: Move execlist stats initialization to execlist specific setup
      i915/guc: Get runtime pm in busyness worker only if already active

 drivers/gpu/drm/i915/display/skl_universal_plane.c |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  11 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |   2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  21 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   5 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   1 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   6 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  23 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   5 +
 drivers/gpu/drm/i915/gt/intel_gt.h                 |  69 +++-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   1 -
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  10 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  79 ++--
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  23 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   9 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  34 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |   2 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 407 ++++++---------------
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |   2 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |  20 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |   6 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  64 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  15 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  63 ----
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  47 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  32 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  12 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  31 --
 drivers/gpu/drm/i915/i915_perf.c                   | 110 ++----
 drivers/gpu/drm/i915/i915_perf_types.h             |   6 -
 drivers/gpu/drm/i915/i915_request.c                |   7 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   2 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |   8 -
 drivers/gpu/drm/i915/intel_device_info.c           |  14 -
 drivers/gpu/drm/i915/intel_device_info.h           |   4 -
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |  10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   6 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   3 +
 include/drm/i915_pciids.h                          |  12 +-
 49 files changed, 529 insertions(+), 708 deletions(-)
