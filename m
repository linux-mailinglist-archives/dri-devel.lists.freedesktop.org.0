Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FE1FF239
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 14:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03046E40B;
	Thu, 18 Jun 2020 12:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A746E149;
 Thu, 18 Jun 2020 12:47:05 +0000 (UTC)
IronPort-SDR: wOoll0gWwAJTwQfyDy7q8WM9QEWt6RQ5nGZCaXRK+E416E6IPf4hTieWxmDVscgcvvKoDZTGUC
 9UQYHmdOQejw==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="227252999"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="227252999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 05:47:04 -0700
IronPort-SDR: 59gyBAtMUgKQ1Cia2xmjmiQarr3SWEXFp++caC1X27qgBVSi/Ry6L/cb+Gac1xJm1/jBBKkqqr
 10eFupA+a6Pg==
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="450623329"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.14.253])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 05:47:01 -0700
Date: Thu, 18 Jun 2020 15:46:59 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20200618124659.GA12342@jlahtine-desk.ger.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

-rc1 required the usual juggling to get baseline from CI.
Needed to temporarily apply this fixup to drm-intel-fixes:
"ext4: mballoc: Use this_cpu_read instead of this_cpu_ptr"

For display side, fix for TypeC interrupt storm detection. Fixes to
TypeC, DDI and MST hardware register programming.

On GT side, fixes into timeslicing and missing workarounds after GPU
reset.

A couple of build time warning fixes.

CI results are partially back online (hopefully more will come shortly):

https://intel-gfx-ci.01.org/tree/drm-intel-fixes/combined-alt.html?

CI_DIF_483 - With the ext4 fix
CI_DIF_484 - This PR, no ext4 fix => extra warnings

Regards, Joonas

PS. I'll be away for the next 4 weeks, so expect to see the following
drm-intel-fixes PRs from Jani and Rodrigo.

***

drm-intel-fixes-2020-06-18:

- Fix for timeslicing and virtual engines/unpremptable requests
  (+ 1 dependency patch)
- Fixes into TypeC register programming and interrupt storm detecting
- Disable DIP on MST ports with the transcoder clock still on
- Avoid missing GT workarounds at reset for HSW and older gens
- Fix for unwinding multiple requests missing force restore
- Fix encoder type check for DDI vswing sequence
- Build warning fixes

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-06-18

for you to fetch changes up to 8e68c6340d5833077b3753eabedab40755571383:

  drm/i915/display: Fix the encoder type check (2020-06-16 11:34:24 +0300)

----------------------------------------------------------------
- Fix for timeslicing and virtual engines/unpremptable requests
  (+ 1 dependency patch)
- Fixes into TypeC register programming and interrupt storm detecting
- Disable DIP on MST ports with the transcoder clock still on
- Avoid missing GT workarounds at reset for HSW and older gens
- Fix for unwinding multiple requests missing force restore
- Fix encoder type check for DDI vswing sequence
- Build warning fixes

----------------------------------------------------------------
Arnd Bergmann (2):
      drm/i915/pmu: avoid an maybe-uninitialized warning
      drm/i915: work around false-positive maybe-uninitialized warning

Chris Wilson (10):
      drm/i915/gt: Incorporate the virtual engine into timeslicing
      drm/i915/selftests: Restore to default heartbeat
      drm/i915/gt: Prevent timeslicing into unpreemptable requests
      drm/i915/gt: Incrementally check for rewinding
      drm/i915/gt: Move hsw GT workarounds from init_clock_gating to workarounds
      drm/i915/gt: Move ivb GT workarounds from init_clock_gating to workarounds
      drm/i915/gt: Move vlv GT workarounds from init_clock_gating to workarounds
      drm/i915/gt: Move snb GT workarounds from init_clock_gating to workarounds
      drm/i915/gt: Move ilk GT workarounds from init_clock_gating to workarounds
      drm/i915/gt: Move gen4 GT workarounds from init_clock_gating to workarounds

Imre Deak (2):
      drm/i915/icl: Disable DIP on MST ports with the transcoder clock still on
      drm/i915/icl+: Fix hotplug interrupt disabling after storm detection

Khaled Almahallawy (1):
      drm/i915/tc: fix the reset of ln0

Vandita Kulkarni (1):
      drm/i915/display: Fix the encoder type check

 drivers/gpu/drm/i915/display/intel_ddi.c           |  12 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   8 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  52 ++++-
 drivers/gpu/drm/i915/gt/intel_ring.c               |   4 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 241 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  25 +--
 drivers/gpu/drm/i915/gt/selftest_lrc.c             | 185 ++++++++++++----
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |  18 +-
 drivers/gpu/drm/i915/gt/selftest_ring.c            | 110 ++++++++++
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  69 +++---
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |  15 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   2 +
 drivers/gpu/drm/i915/i915_irq.c                    |   1 +
 drivers/gpu/drm/i915/i915_pmu.c                    |  84 +++----
 drivers/gpu/drm/i915/i915_priolist_types.h         |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   2 +-
 drivers/gpu/drm/i915/intel_pm.c                    | 206 +-----------------
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |   1 +
 19 files changed, 668 insertions(+), 373 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_ring.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
