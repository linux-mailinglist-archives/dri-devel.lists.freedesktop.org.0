Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4F7C6B21
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 12:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CDB10E4A5;
	Thu, 12 Oct 2023 10:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37F110E4A5;
 Thu, 12 Oct 2023 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106628; x=1728642628;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2G5aHJXgXzxiNEF12IpXPvDXikJGB7QgCvYazrQTKnk=;
 b=E292HJmaOJyV+BR8d+1Ytla520adJ1rswlCyojPXckRbAE/QwPWGdWiR
 0bSjHyshoy50quQjcYDb6Q8Ksdca4NyDXqiMy4V/azFKlQ+BRlQIvuVAB
 fiCW7egLsNEh6Nmoj1o5K11sKsB6Iw32L9yJ+ucKXfamopyAamkVYo9I7
 N8CAxOq25TvPnI2d6Cwui0m+dWMMFYmv8a98OophQrjVVtj1loCwFID5h
 GA9LPSI4Jn7sPPXsdUEgaJxJEx6K3MnlNykh3+FrnyxaCpiH+TwRUFLK5
 f/f3AK0cUduDbYQKAgDnLM0h2ZzGu/wYChMWj98zQZXxXJfGp3mgY3Nh1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384736230"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="384736230"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927940941"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="927940941"
Received: from maloneyj-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.239.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:30:25 -0700
Date: Thu, 12 Oct 2023 11:30:23 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZSfKotZVdypU6NaX@tursulin-desk>
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

Here is the second pull request for 6.7.

I say second and not final because there is a very small chance we might
be doing another one next week, to bring Meteorlake out of force probe
status, which was quite close this week but apparently not quite there.
At the moment it looks like chances are low, with some last minute
findings putting a spanner in the works so this will likely end up the
final pull request after all.

In terms of content there is not much in this one. Mostly more work on
enabling Meteorlake and some minor fixes here and there.

Regards,

Tvrtko

drm-intel-gt-next-2023-10-12:
Driver Changes:

Fixes/improvements/new stuff:

- Register engines early to avoid type confusion (Mathias Krause)
- Suppress 'ignoring reset notification' message [guc] (John Harrison)
- Update 'recommended' version to 70.12.1 for DG2/ADL-S/ADL-P/MTL [guc] (John Harrison)
- Enable WA 14018913170 [guc, dg2] (Daniele Ceraolo Spurio)

Future platform enablement:

- Clean steer semaphore on resume (Nirmoy Das)
- Skip MCR ops for ring fault register [mtl] (Nirmoy Das)
- Make i915_gem_shrinker multi-gt aware [gem] (Jonathan Cavitt)
- Enable GGTT updates with binder in MTL (Nirmoy Das, Chris Wilson)
- Invalidate the TLBs on each GT (Chris Wilson)

Miscellaneous:

- Clarify type evolution of uabi_node/uabi_engines (Mathias Krause)
- Annotate struct ct_incoming_msg with __counted_by [guc] (Kees Cook)
- More use of GT specific print helpers [gt] (John Harrison)
The following changes since commit 03d681412b38558aefe4fb0f46e36efa94bb21ef:

  drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval (2023-09-28 11:39:30 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-10-12

for you to fetch changes up to 039adf3947252693f7c882607dac2dc67e7f7ab2:

  drm/i915: More use of GT specific print helpers (2023-10-10 15:40:26 -0700)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Register engines early to avoid type confusion (Mathias Krause)
- Suppress 'ignoring reset notification' message [guc] (John Harrison)
- Update 'recommended' version to 70.12.1 for DG2/ADL-S/ADL-P/MTL [guc] (John Harrison)
- Enable WA 14018913170 [guc, dg2] (Daniele Ceraolo Spurio)

Future platform enablement:

- Clean steer semaphore on resume (Nirmoy Das)
- Skip MCR ops for ring fault register [mtl] (Nirmoy Das)
- Make i915_gem_shrinker multi-gt aware [gem] (Jonathan Cavitt)
- Enable GGTT updates with binder in MTL (Nirmoy Das, Chris Wilson)
- Invalidate the TLBs on each GT (Chris Wilson)

Miscellaneous:

- Clarify type evolution of uabi_node/uabi_engines (Mathias Krause)
- Annotate struct ct_incoming_msg with __counted_by [guc] (Kees Cook)
- More use of GT specific print helpers [gt] (John Harrison)

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915: Lift runtime-pm acquire callbacks out of intel_wakeref.mutex
      drm/i915: Invalidate the TLBs on each GT

Daniele Ceraolo Spurio (1):
      drm/i915/guc: Enable WA 14018913170

John Harrison (4):
      drm/i915/guc: Suppress 'ignoring reset notification' message
      drm/i915/guc: Update 'recommended' version to 70.12.1 for DG2/ADL-S/ADL-P/MTL
      drm/i915/gt: More use of GT specific print helpers
      drm/i915: More use of GT specific print helpers

Jonathan Cavitt (1):
      drm/i915/gem: Make i915_gem_shrinker multi-gt aware

Kees Cook (1):
      drm/i915/guc: Annotate struct ct_incoming_msg with __counted_by

Mathias Krause (2):
      drm/i915: Register engines early to avoid type confusion
      drm/i915: Clarify type evolution of uabi_node/uabi_engines

Nirmoy Das (10):
      drm/i915: Introduce intel_gt_mcr_lock_sanitize()
      drm/i915: Introduce the intel_gt_resume_early()
      drm/i915: Clean steer semaphore on resume
      drm/i915/mtl: Skip MCR ops for ring fault register
      drm/i915: Create a kernel context for GGTT updates
      drm/i915: Implement for_each_sgt_daddr_next
      drm/i915: Parameterize binder context creation
      drm/i915: Implement GGTT update method with MI_UPDATE_GTT
      drm/i915: Toggle binder context ready status
      drm/i915: Enable GGTT updates with binder in MTL

 drivers/gpu/drm/i915/gem/i915_gem_pages.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c      |  42 ++--
 drivers/gpu/drm/i915/gt/intel_engine.h            |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  69 +++++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h      |  13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c       |  17 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c              | 235 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gsc.c               |  11 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                |  62 +++++-
 drivers/gpu/drm/i915/gt/intel_gt.h                |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c            |  22 ++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c             |  20 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h             |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_print.h          |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h           |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c               |   5 +
 drivers/gpu/drm/i915/gt/intel_gtt.h               |   5 +
 drivers/gpu/drm/i915/gt/intel_reset.c             |  26 +--
 drivers/gpu/drm/i915/gt/intel_workarounds.c       |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c         |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            |   6 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c         |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h       |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c          |   8 +-
 drivers/gpu/drm/i915/i915_driver.c                |   9 +-
 drivers/gpu/drm/i915/i915_drv.h                   |  17 +-
 drivers/gpu/drm/i915/i915_gem.c                   |   9 +-
 drivers/gpu/drm/i915/i915_gpu_error.c             |  11 +-
 drivers/gpu/drm/i915/i915_perf.c                  |   8 +-
 drivers/gpu/drm/i915/i915_scatterlist.h           |  10 +
 drivers/gpu/drm/i915/intel_wakeref.c              |  52 ++---
 34 files changed, 576 insertions(+), 129 deletions(-)
