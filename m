Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D292E91C171
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 16:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C94F10E2BB;
	Fri, 28 Jun 2024 14:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQeqBHkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614D10E063;
 Fri, 28 Jun 2024 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719585981; x=1751121981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i7cyVlN5OFwlHWLdv7Bf0jpGSkVnvkKIYTFFHuHnMtg=;
 b=fQeqBHkf++j7Tw7iNSBEnfcxraGSlL2zBaK5SBbygtwfUbzqGa+vdf7F
 /Naiolpe1STEKplgiXFPKdBq6wmy8f9Ldk4vb4To4omgj62St/TmTZnLT
 oaO9lhCy5ITNdMoXgO4JB6RpVUHiMT8QfBTU2yJ1DdeLeR+yq6KHxAD6u
 N4UtUWcpLBjufI5OhHM51yX574rqiuRaOiwkdjonHix7JC/NZH3YF9pb6
 fc3b9ukwHhICckTyQugvtF64W+oBRbOu5Sfgu93lZdcxJcIVMcFfeb6ed
 0gNfAbGJSowX5G2fSh1+fOb/VA74hj0K9PrprIQz8AJDZ0pC81ZyWhwAo g==;
X-CSE-ConnectionGUID: 8TER26FYSsWdjrgrvtiWwQ==
X-CSE-MsgGUID: RUMRwI4bT3SpRONshZrx/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16904959"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16904959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 07:46:12 -0700
X-CSE-ConnectionGUID: TNY4jTfLQmqEM8EFk66ImQ==
X-CSE-MsgGUID: 8VawjpGbQo6Dsd4hw8lrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="49365750"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 07:46:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 28 Jun 2024 17:46:01 +0300
Message-ID: <875xttazx2.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

Another feature pull towards v6.11, hopefully last. This should also fix
the 32-bit build issue [1] seen in drm-next.

BR,
Jani.


[1] https://lore.kernel.org/r/CAPM=3D9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=3DsyT=
MFYEUNzxhw@mail.gmail.com


drm-intel-next-2024-06-28:
drm/i915 feature pull #2 for v6.11:

Features and functionality:
- More eDP Panel Replay enabling (Jouni)
- Add async flip and flip done tracepoints (Ville)

Refactoring and cleanups:
- Clean up BDW+ pipe interrupt register definitions (Ville)
- Prep work for DSB based plane programming (Ville)
- Relocate encoder suspend/shutdown helpers (Imre)
- Polish plane surface alignment handling (Ville)

Fixes:
- Enable more fault interrupts on TGL+/MTL+ (Ville)
- Fix CMRR 32-bit build (Mitul)
- Fix PSR Selective Update Region Scan Line Capture Indication (Jouni)
- Fix cursor fb unpinning (Maarten, Ville)
- Fix Cx0 PHY PLL state verification in TBT mode (Imre)
- Fix unnecessary MG DP programming on MTL+ Type-C (Imre)

DRM changes:
- Rename drm_plane_check_pixel_format() to drm_plane_has_format() and export
  (Ville)
- Add drm_vblank_work_flush_all() (Maarten)

Xe driver changes:
- Call encoder .suspend_complete() hook also on Xe (Imre)

BR,
Jani.

The following changes since commit d754ed2821fd9675d203cb73c4afcd593e28b7d0:

  Merge drm/drm-next into drm-intel-next (2024-06-19 11:38:31 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
24-06-28

for you to fetch changes up to 32a120f52a4c0121bca8f2328d4680d283693d60:

  drm/i915/mtl: Skip PLL state verification in TBT mode (2024-06-28 12:50:5=
2 +0300)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.11:

Features and functionality:
- More eDP Panel Replay enabling (Jouni)
- Add async flip and flip done tracepoints (Ville)

Refactoring and cleanups:
- Clean up BDW+ pipe interrupt register definitions (Ville)
- Prep work for DSB based plane programming (Ville)
- Relocate encoder suspend/shutdown helpers (Imre)
- Polish plane surface alignment handling (Ville)

Fixes:
- Enable more fault interrupts on TGL+/MTL+ (Ville)
- Fix CMRR 32-bit build (Mitul)
- Fix PSR Selective Update Region Scan Line Capture Indication (Jouni)
- Fix cursor fb unpinning (Maarten, Ville)
- Fix Cx0 PHY PLL state verification in TBT mode (Imre)
- Fix unnecessary MG DP programming on MTL+ Type-C (Imre)

DRM changes:
- Rename drm_plane_check_pixel_format() to drm_plane_has_format() and export
  (Ville)
- Add drm_vblank_work_flush_all() (Maarten)

Xe driver changes:
- Call encoder .suspend_complete() hook also on Xe (Imre)

----------------------------------------------------------------
Imre Deak (5):
      drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
      drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
      drm/xe: Use the encoder suspend helper also used by the i915 driver
      drm/i915/display: For MTL+ platforms skip mg dp programming
      drm/i915/mtl: Skip PLL state verification in TBT mode

Jouni H=C3=B6gander (12):
      drm/i915/psr: Set DP_PSR_SU_REGION_SCANLINE_CAPTURE bit when needed
      drm/i915/psr: Check panel ALPM capability for eDP Panel Replay
      drm/i915/psr: Inform Panel Replay source support on eDP as well
      drm/i915/psr: enable sink for eDP1.5 Panel Replay
      drm/i915/psr: Check panel Early Transport capability for eDP PR
      drm/i915/psr: 128b/132b Panel Replay is not supported on eDP
      drm/i915/psr: HW will not allow PR on eDP when HDCP enabled
      drm/i915/alpm: Make crtc_state as const in intel_alpm_compute_params
      drm/i915/psr: Perform psr2 checks related to ALPM for Panel Replay
      drm/i915/psr: Perform scanline indication check for Panel Replay as w=
ell
      drm/i915/psr: Check Early Transport for Panel Replay as well
      drm/i915/psr: Modify dg2_activate_panel_replay to support eDP

Maarten Lankhorst (2):
      drm: Add drm_vblank_work_flush_all().
      drm/i915: Use the same vblank worker for atomic unpin

Mitul Golani (1):
      drm/i915/display: Consider adjusted_pixel_rate to be u64

Ville Syrj=C3=A4l=C3=A4 (28):
      drm/i915: Use REG_BIT() for bdw+ pipe interrupts
      drm/i915: Document bdw+ pipe interrupt bits
      drm/i915: Sort bdw+ pipe interrupt bits
      drm/i915: Extend GEN9_PIPE_PLANE_FLIP_DONE() to cover all universal p=
lanes
      drm/i915: Nuke the intermediate pipe fault bitmasks
      drm/i915: Enable pipeDMC fault interrupts on tgl+
      drm/i915: Enable plane/pipeDMC ATS fault interrupts on mtl
      drm/i915: Extract intel_crtc_arm_vblank_event()
      drm/i915: Add async flip tracepoint
      drm/i915: Add flip done tracepoint
      drm/i915: Introduce intel_mode_vdisplay()
      drm/i915: Pass the whole atomic state to intel_color_prepare_commit()
      drm/i915/dsb: Plumb the whole atomic state into intel_dsb_prepare()
      drm/i915/dsb: Convert the DSB code to use intel_display rather than i=
915
      drm/i915/dsb: Add i915.enable_dsb module parameter
      drm/i915: Drop useless intel_dsb.h include
      drm/i915/dsb: Document that the ATS fault bits are for mtl+
      drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
      drm: Export drm_plane_has_format()
      drm/i915: Introduce the plane->min_alignment() vfunc
      drm/i915: Introduce fb->min_alignment
      drm/i915: Split cursor alignment to per-platform vfuncs
      drm/i915: Split pre-skl platforms out from intel_surf_alignment()
      drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
      drm/i915: Update plane alignment requirements for TGL+
      drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff
      drm/i915: Use vblank worker to unpin old legacy cursor fb safely
      drm/i915/dsb: Try to document that DSB_STATUS bit 16 is level trigger=
ed

 drivers/gpu/drm/drm_atomic.c                       |   7 +-
 drivers/gpu/drm/drm_crtc.c                         |   6 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   2 -
 drivers/gpu/drm/drm_plane.c                        |  32 ++--
 drivers/gpu/drm/drm_vblank_work.c                  |  22 +++
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  75 +++++++++-
 drivers/gpu/drm/i915/display/intel_alpm.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  35 ++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   6 +
 drivers/gpu/drm/i915/display/intel_color.c         |  13 +-
 drivers/gpu/drm/i915/display/intel_color.h         |   3 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |  59 ++++++--
 drivers/gpu/drm/i915/display/intel_crtc.h          |   1 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |  64 +++++++-
 drivers/gpu/drm/i915/display/intel_cursor.h        |   3 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  11 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  15 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  50 ++++++-
 .../gpu/drm/i915/display/intel_display_params.c    |   3 +
 .../gpu/drm/i915/display/intel_display_params.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |  50 +++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |   8 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   1 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  66 ++++----
 drivers/gpu/drm/i915/display/intel_dsb.h           |   4 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |   6 +-
 drivers/gpu/drm/i915/display/intel_encoder.c       |  44 ++++++
 drivers/gpu/drm/i915/display/intel_encoder.h       |   4 +
 drivers/gpu/drm/i915/display/intel_fb.c            | 151 ++++-------------=
--
 drivers/gpu/drm/i915/display/intel_fb.h            |   3 -
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |  39 +++--
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 166 +++++++++++++++++=
----
 drivers/gpu/drm/i915/display/intel_sprite.c        |  26 ++++
 drivers/gpu/drm/i915/display/intel_vblank.c        |  10 ++
 drivers/gpu/drm/i915/display/intel_vblank.h        |   1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |   2 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  85 ++++++++++-
 drivers/gpu/drm/i915/i915_driver.c                 |  51 +------
 drivers/gpu/drm/i915/i915_reg.h                    |  80 +++++-----
 drivers/gpu/drm/xe/display/xe_display.c            |  18 +--
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   4 +-
 include/drm/drm_plane.h                            |   2 +
 include/drm/drm_vblank_work.h                      |   2 +
 48 files changed, 873 insertions(+), 391 deletions(-)

--=20
Jani Nikula, Intel
