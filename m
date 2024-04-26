Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C368B312C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 09:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1353210E151;
	Fri, 26 Apr 2024 07:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMTax+kV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C55210E151;
 Fri, 26 Apr 2024 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714115859; x=1745651859;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Jk3KD3N5immD9rl2BYmUGLivzY4ZF5VTOCAKfxBGZ/c=;
 b=RMTax+kVLG1ywLRUhD+ya5eaCh3llUCezq+adVxp9ChBDzexMHN+mtaf
 gC/EbI/Kf9tWktapHO55p6DQKaCcMTLzqKXLd8L8zCMaKsyAS7Oyne8R6
 ZZYRlxS6s/i4QThqQyqlRKihsV1fXFzl+6+mMI4YfBG/uJGS4K6bkToyj
 aSIq/55dn213obzlEfLc4AD4LCIQMqJ5D1FQwnvHjC3zGvbJ0FvFZ5Na+
 jK7XriD+vT8KXnRrIpI3MG157HiH64+PH9ZLTZCSm0qcSNcJE8cx4esU3
 HtRg/117v7+kTfdkk9G/SJR+86J56ErO7ZdXwIemeVNSXOo8xMHxKa0G9 g==;
X-CSE-ConnectionGUID: PPWBRxReTJ+mRGq1gTyMJQ==
X-CSE-MsgGUID: bnTPSw86QGOMKPnjEhvBpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9712938"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9712938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:17:38 -0700
X-CSE-ConnectionGUID: Z/x+xP5GRsGsplttb5vILQ==
X-CSE-MsgGUID: QQ/D42zKTHiIjgYJuxmERQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="62806741"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.179])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:17:30 -0700
Date: Fri, 26 Apr 2024 10:17:25 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZitVBTvZmityDi7D@jlahtine-mobl.ger.corp.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Here's the drm-intel-gt-next PR for v6.10 in one shot.

We are adding a new uAPI for Mesa to request higher GT frequency for
compute contexts on GuC platform.

Then there is a W/A for DG2 to move to fixed CCS load balancing and
make all DG2 SKUs appear with single CCS with all the EUs attached by
default. Read more below under "UAPI Changes". There is one reported
regression against it which we're working on resolving, so expect to
see -next-fixes shortly once that happens.

Beyond that we have a bunch of workaround updates/fixes, fix for UAF
that has been hunted down for a while, GT reset fix for platforms that
load GuC but don't submit via it, fix for execlists priority submission,
proper capture of EIR register on hang.

THe rest is usual code cleanups/refactoring and selftest fixes.

Regards, Joonas

***

drm-intel-gt-next-2024-04-26:

UAPI Changes:

- drm/i915/guc: Use context hints for GT frequency

    Allow user to provide a low latency context hint. When set, KMD
    sends a hint to GuC which results in special handling for this
    context. SLPC will ramp the GT frequency aggressively every time
    it switches to this context. The down freq threshold will also be
    lower so GuC will ramp down the GT freq for this context more slowly.
    We also disable waitboost for this context as that will interfere with
    the strategy.

    We need to enable the use of SLPC Compute strategy during init, but
    it will apply only to contexts that set this bit during context
    creation.

    Userland can check whether this feature is supported using a new param-
    I915_PARAM_HAS_CONTEXT_FREQ_HINT. This flag is true for all guc submission
    enabled platforms as they use SLPC for frequency management.

    The Mesa usage model for this flag is here -
    https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint

- drm/i915/gt: Enable only one CCS for compute workload

    Enable only one CCS engine by default with all the compute sices
    allocated to it.

    While generating the list of UABI engines to be exposed to the
    user, exclude any additional CCS engines beyond the first
    instance

    ***

    NOTE: This W/A will make all DG2 SKUs appear like single CCS SKUs by
    default to mitigate a hardware bug. All the EUs will still remain
    usable, and all the userspace drivers have been confirmed to be able
    to dynamically detect the change in number of CCS engines and adjust.

    For the smaller percent of applications that get perf benefit from
    letting the userspace driver dispatch across all 4 CCS engines we will
    be introducing a sysfs control as a later patch to choose 4 CCS each
    with 25% EUs (or 50% if 2 CCS).

    NOTE: A regression has been reported at

    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10895

    However Andi has been triaging the issue and we're closing in a fix
    to the gap in the W/A implementation:

    https://lists.freedesktop.org/archives/intel-gfx/2024-April/348747.html

Driver Changes:

- Add new and fix to existing workarounds: Wa_14018575942 (MTL),
  Wa_16019325821 (Gen12.70), Wa_14019159160 (MTL), Wa_16015675438,
  Wa_14020495402 (Gen12.70) (Tejas, John, Lucas)
- Fix UAF on destroy against retire race and remove two earlier
  partial fixes (Janusz)
- Limit the reserved VM space to only the platforms that need it (Andi)
- Reset queue_priority_hint on parking for execlist platforms (Chris)
- Fix gt reset with GuC submission is disabled (Nirmoy)
- Correct capture of EIR register on hang (John)

- Remove usage of the deprecated ida_simple_xx() API
- Refactor confusing __intel_gt_reset() (Nirmoy)
- Fix the fix for GuC reset lock confusion (John)
- Simplify/extend platform check for Wa_14018913170 (John)
- Replace dev_priv with i915 (Andi)
- Add and use gt_to_guc() wrapper (Andi)
- Remove bogus null check (Rodrigo, Dan)

. Selftest improvements (Janusz, Nirmoy, Daniele)

The following changes since commit db7bbd13f08774cde0332c705f042e327fe21e73:

  drm/i915: Check before removing mm notifier (2024-02-28 13:11:32 +0000)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-gt-next-2024-04-26

for you to fetch changes up to 4d3421e04c5dc38baf15224c051256204f223c15:

  drm/i915: Fix gt reset with GuC submission is disabled (2024-04-24 18:48:32 +0200)

----------------------------------------------------------------
UAPI Changes:

- drm/i915/guc: Use context hints for GT frequency

    Allow user to provide a low latency context hint. When set, KMD
    sends a hint to GuC which results in special handling for this
    context. SLPC will ramp the GT frequency aggressively every time
    it switches to this context. The down freq threshold will also be
    lower so GuC will ramp down the GT freq for this context more slowly.
    We also disable waitboost for this context as that will interfere with
    the strategy.

    We need to enable the use of SLPC Compute strategy during init, but
    it will apply only to contexts that set this bit during context
    creation.

    Userland can check whether this feature is supported using a new param-
    I915_PARAM_HAS_CONTEXT_FREQ_HINT. This flag is true for all guc submission
    enabled platforms as they use SLPC for frequency management.

    The Mesa usage model for this flag is here -
    https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint

- drm/i915/gt: Enable only one CCS for compute workload

    Enable only one CCS engine by default with all the compute sices
    allocated to it.

    While generating the list of UABI engines to be exposed to the
    user, exclude any additional CCS engines beyond the first
    instance

    ***

    NOTE: This W/A will make all DG2 SKUs appear like single CCS SKUs by
    default to mitigate a hardware bug. All the EUs will still remain
    usable, and all the userspace drivers have been confirmed to be able
    to dynamically detect the change in number of CCS engines and adjust.

    For the smaller percent of applications that get perf benefit from
    letting the userspace driver dispatch across all 4 CCS engines we will
    be introducing a sysfs control as a later patch to choose 4 CCS each
    with 25% EUs (or 50% if 2 CCS).

    NOTE: A regression has been reported at

    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10895

    However Andi has been triaging the issue and we're closing in a fix
    to the gap in the W/A implementation:

    https://lists.freedesktop.org/archives/intel-gfx/2024-April/348747.html

Driver Changes:

- Add new and fix to existing workarounds: Wa_14018575942 (MTL),
  Wa_16019325821 (Gen12.70), Wa_14019159160 (MTL), Wa_16015675438,
  Wa_14020495402 (Gen12.70) (Tejas, John, Lucas)
- Fix UAF on destroy against retire race and remove two earlier
  partial fixes (Janusz)
- Limit the reserved VM space to only the platforms that need it (Andi)
- Reset queue_priority_hint on parking for execlist platforms (Chris)
- Fix gt reset with GuC submission is disabled (Nirmoy)
- Correct capture of EIR register on hang (John)

- Remove usage of the deprecated ida_simple_xx() API
- Refactor confusing __intel_gt_reset() (Nirmoy)
- Fix the fix for GuC reset lock confusion (John)
- Simplify/extend platform check for Wa_14018913170 (John)
- Replace dev_priv with i915 (Andi)
- Add and use gt_to_guc() wrapper (Andi)
- Remove bogus null check (Rodrigo, Dan)

. Selftest improvements (Janusz, Nirmoy, Daniele)

----------------------------------------------------------------
Andi Shyti (7):
      drm/i915/gt: Create the gt_to_guc() wrapper
      drm/i915/guc: Use the new gt_to_guc() wrapper
      drm/i915/gt: Limit the reserved VM space to only the platforms that need it
      drm/i915/gem: Replace dev_priv with i915
      drm/i915/gt: Disable HW load balancing for CCS
      drm/i915/gt: Do not generate the command streamer for all the CCS
      drm/i915/gt: Enable only one CCS for compute workload

Chris Wilson (1):
      drm/i915/gt: Reset queue_priority_hint on parking

Christophe JAILLET (1):
      drm/i915/guc: Remove usage of the deprecated ida_simple_xx() API

Daniele Ceraolo Spurio (1):
      drm/i915/dg2: wait for HuC load completion before running selftests

Janusz Krzysztofik (5):
      drm/i915/selftest_hangcheck: Check sanity with more patience
      drm/i915/selftests: Fix dependency of some timeouts on HZ
      drm/i915/vma: Fix UAF on destroy against retire race
      drm/i915: Remove extra multi-gt pm-references
      Revert "drm/i915: Wait for active retire before i915_active_fini()"

John Harrison (6):
      drm/i915/guc: Correct capture of EIR register on hang
      drm/i915/guc: Simplify/extend platform check for Wa_14018913170
      drm/i915: Enable Wa_16019325821
      drm/i915/guc: Add support for w/a KLVs
      drm/i915/guc: Enable Wa_14019159160
      drm/i915/guc: Fix the fix for reset lock confusion

Lucas De Marchi (1):
      drm/i915: Drop WA 16015675438

Nirmoy Das (3):
      drm/i915/selftests: Pick correct caching mode.
      drm/i915: Refactor confusing __intel_gt_reset()
      drm/i915: Fix gt reset with GuC submission is disabled

Radhakrishna Sripada (1):
      drm/i915/xelpg: Add Wa_14020495402

Rodrigo Vivi (1):
      drm/i915/guc: Remove bogus null check

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14018575942

Vinay Belgaumkar (1):
      drm/i915/guc: Use context hints for GT frequency

 drivers/gpu/drm/i915/Makefile                      |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 16 +++-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 22 +-----
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |  8 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         | 18 ++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  6 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    | 14 ++--
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  5 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           | 22 ++++--
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  3 +
 drivers/gpu/drm/i915/gt/intel_context_types.h      |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 23 +++++-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  3 -
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  8 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  5 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  9 +--
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  8 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 | 14 +++-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c        | 39 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h        | 13 ++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  7 ++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  8 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              | 51 ++++++++++--
 drivers/gpu/drm/i915/gt/intel_reset.h              |  3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  6 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 43 ++++++++--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  6 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  | 21 +++++
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             | 15 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         | 91 +++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     | 12 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        | 17 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 78 ++++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  4 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  4 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |  2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |  6 ++
 drivers/gpu/drm/i915/i915_vma.c                    | 52 ++++++++++---
 drivers/gpu/drm/i915/selftests/i915_selftest.c     | 36 ++++++++-
 .../drm/i915/selftests/intel_scheduler_helpers.c   |  6 +-
 include/uapi/drm/i915_drm.h                        | 15 ++++
 61 files changed, 598 insertions(+), 190 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
