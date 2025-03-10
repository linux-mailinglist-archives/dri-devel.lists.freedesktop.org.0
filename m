Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC221A590C6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866FE10E3DF;
	Mon, 10 Mar 2025 10:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6KuvILg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633E10E3DC;
 Mon, 10 Mar 2025 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741601334; x=1773137334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yd+GWmMiVaIwV1EMgKmvIEPgd5SFU1HdEO6MMHRcs4Y=;
 b=M6KuvILgAyJ+lL4EaEDE3R3P7rL1T30krzntJ07F/g3W9NCJWN7rEQ+I
 lROdcaIchdlmgn9QwWurK/Io3vWtZ+V14azwoj+TVjyNYfhtpw2MDXN6v
 1ID3G3X14PLp0fgTG+8N7trP9GocAY04/01oNY2FFc8+9yOS12hG0EQZ2
 Rm5HcA3GB86eIMWz3cBNoI/2+8ch8PJ2qiluTN6fxx7SosshPxe0MpD1b
 vp8lkbKh6cD0ReEwThi0YGpCD6Y+FybSbLhfXzNlVzch12naGwxTcMYIZ
 iLrYTp9wnD8qsmR4P425hKWqNHGJ0B1iZOTh6U2YcCOg5S2PLXrdmml/O A==;
X-CSE-ConnectionGUID: kW7aAMJIR7qnwaeKXzboww==
X-CSE-MsgGUID: qya4L/YaSaCZS1ycgI11UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46239984"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="46239984"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 03:08:54 -0700
X-CSE-ConnectionGUID: gXUmirtdTpC+MeX0P3/ecw==
X-CSE-MsgGUID: TkXQQnXASPyttAohlx2O2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119919781"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 03:08:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Date: Mon, 10 Mar 2025 12:08:44 +0200
Message-ID: <87o6y9gpub.fsf@intel.com>
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

The second and likely final batch of i915 features towards v6.15.

BR,
Jani.


drm-intel-next-2025-03-10:
drm/i915 feature pull #2 for v6.15:

Features and functionality:
- FBC dirty rectangle support for display version 30+ (Vinod)
- Update plane scalers via DSB based commits (Ville)
- Move runtime power status info to display power debugfs (Jani)

Refactoring and cleanups:
- Convert i915 and xe to DRM client setup (Thomas)
- Refactor and clean up CDCLK/bw/dbuf readout/sanitation (Ville)
- Conversions from drm_i915_private to struct intel_display (Jani, Suraj)
- Refactor display reset for better separation between display and core (Ja=
ni)
- Move panel fitter code together (Jani)
- Add mst and hdcp sub-structs to display structs for clarity (Jani)
- Header refactoring to clarify separation between display and i915 core (J=
ani)

Fixes:
- Fix DP MST max stream count to match number of pipes (Jani)
- Fix encoder HW state readout of DP MST UHBR (Imre)
- Fix ICL+ combo PHY cursor and coeff polarity programming (Ville)
- Fix pipeDMC and ATS fault handling (Ville)
- Display workarounds (Gustavo)
- Remove duplicate forward declaration (Vinod)
- Improve POWER_DOMAIN_*() macro type safety (Gustavo)
- Move CDCLK post plane programming later (Ville)

DRM core changes:
- Add client-hotplug helper (Thomas)
- Send pending hotplug events after client resume (Thomas)
- Add fb_restore and fb_set_suspend fb helper hooks (Thomas)
- Remove struct fb_probe fb helper hook (Thomas)
- Add const qualifier to drm_atomic_helper_damage_merged() (Vinod)

Xe driver changes:
- Convert i915 and xe to DRM client setup (Thomas)
- Refactor i915 compat headers (Jani)
- Fix fbdev GGTT mapping handling (Maarten)
- Figure out pxp instance from the gem object (Jani)

Merges:
- Backmerge drm-next to fix conflicts with drm-xe-next (Jani)

BR,
Jani.

The following changes since commit 33e26f3544a558e7476eb221ff33173759b3a116:

  Merge tag 'drm-xe-next-2025-02-24' of https://gitlab.freedesktop.org/drm/=
xe/kernel into drm-next (2025-02-27 10:08:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
25-03-10

for you to fetch changes up to bb800b56f01f430f4d7b360c758a9ed28f758d75:

  drm/i915: Relocate intel_bw_crtc_update() (2025-03-07 19:11:41 +0200)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.15:

Features and functionality:
- FBC dirty rectangle support for display version 30+ (Vinod)
- Update plane scalers via DSB based commits (Ville)
- Move runtime power status info to display power debugfs (Jani)

Refactoring and cleanups:
- Convert i915 and xe to DRM client setup (Thomas)
- Refactor and clean up CDCLK/bw/dbuf readout/sanitation (Ville)
- Conversions from drm_i915_private to struct intel_display (Jani, Suraj)
- Refactor display reset for better separation between display and core (Ja=
ni)
- Move panel fitter code together (Jani)
- Add mst and hdcp sub-structs to display structs for clarity (Jani)
- Header refactoring to clarify separation between display and i915 core (J=
ani)

Fixes:
- Fix DP MST max stream count to match number of pipes (Jani)
- Fix encoder HW state readout of DP MST UHBR (Imre)
- Fix ICL+ combo PHY cursor and coeff polarity programming (Ville)
- Fix pipeDMC and ATS fault handling (Ville)
- Display workarounds (Gustavo)
- Remove duplicate forward declaration (Vinod)
- Improve POWER_DOMAIN_*() macro type safety (Gustavo)
- Move CDCLK post plane programming later (Ville)

DRM core changes:
- Add client-hotplug helper (Thomas)
- Send pending hotplug events after client resume (Thomas)
- Add fb_restore and fb_set_suspend fb helper hooks (Thomas)
- Remove struct fb_probe fb helper hook (Thomas)
- Add const qualifier to drm_atomic_helper_damage_merged() (Vinod)

Xe driver changes:
- Convert i915 and xe to DRM client setup (Thomas)
- Refactor i915 compat headers (Jani)
- Fix fbdev GGTT mapping handling (Maarten)
- Figure out pxp instance from the gem object (Jani)

Merges:
- Backmerge drm-next to fix conflicts with drm-xe-next (Jani)

----------------------------------------------------------------
Gustavo Sousa (4):
      drm/i915/display: Use IP version check for Wa_14020863754
      drm/i915/audio: Extend Wa_14020863754 to Xe3_LPD
      drm/i915/display: Use explicit base values in POWER_DOMAIN_*() macros
      drm/i915/display: Make POWER_DOMAIN_*() always result in enum intel_d=
isplay_power_domain

Imre Deak (1):
      drm/i915/dp_mst: Fix encoder HW state readout for UHBR MST

Jani Nikula (41):
      drm/i915/power: move runtime power status info to power debugfs
      drm/i915/mst: update max stream count to match number of pipes
      drm/i915/display: remove leftover struct drm_i915_private forward dec=
larations
      drm/i915/debugfs: continue display debugfs struct intel_display conve=
rsion
      drm/i915/tdf: convert intel_tdf.[ch] to struct intel_display
      drm/i915/snps: convert intel_snps_phy.[ch] to struct intel_display
      drm/i915/dkl: convert intel_dkl_phy.[ch] to struct intel_display
      drm/i915/drrs: convert intel_drrs.[ch] to struct intel_display
      drm/i915/display: convert the M/N functions to struct intel_display
      drm/i915/dpt: convert intel_dpt.[ch] interfaces to struct intel_displ=
ay
      drm/i915/fbc: convert intel_fbc.[ch] to struct intel_display
      drm/i915/rps: convert intel_display_rps.[ch] to struct intel_display
      drm/i915/ddi: convert intel_wait_ddi_buf_idle() to struct intel_displ=
ay
      drm/i915/fdi: convert intel_fdi.[ch] to struct intel_display
      drm/i915/pfit: rename intel_panel_fitting() to intel_pfit_compute_con=
fig()
      drm/i915/pfit: move ilk and i9xx pfit code to intel_pfit.[ch]
      drm/i915/pfit: fix comment style for moved comments
      drm/i915/pfit: convert moved code to struct intel_display
      drm/i915/pfit: split out intel_pfit_regs.h
      Merge drm/drm-next into drm-intel-next
      drm/i915/mst: add mst sub-struct to struct intel_dp
      drm/i915/mst: add mst sub-struct to struct intel_connector
      drm/i915/hdcp: add hdcp sub-struct to struct intel_digital_port
      drm/i915/pxp & drm/xe/pxp: Figure out pxp instance from the gem object
      drm/i915: relocate intel_plane_ggtt_offset() to intel_atomic_plane.c
      drm/i915: split out i915_gtt_view_types.h from i915_vma_types.h
      drm/i915/display: convert display reset to struct intel_display *
      drm/i915: move pending_fb_pin to struct intel_display
      drm/i915/reset: add intel_gt_gpu_reset_clobbers_display() helper
      drm/i915/reset: add intel_display_reset_test()
      drm/i915/reset: remove I915_RESET_MODESET flag
      drm/i915/reset: decide whether display reset is needed on gt side
      drm/i915/reset: pass test only parameter to intel_display_reset_finis=
h()
      drm/i915/reset: add modeset_stuck callback to intel_display_reset_pre=
pare()
      drm/i915/display: convert various port/phy helpers to struct intel_di=
splay
      drm/i915/display: convert some intel_display.[ch] functions to struct=
 intel_display
      drm/i915/display: convert intel_has_pending_fb_unpin() to struct inte=
l_display
      drm/i915/display: remove dupe intel_update_watermarks() declaration
      drm/i915/display: convert intel_display.c to struct intel_display
      drm/xe/compat: refactor compat i915_drv.h
      drm/i915/plane: convert intel_atomic_plane.[ch] to struct intel_displ=
ay

Maarten Lankhorst (1):
      drm/xe/display: Fix fbdev GGTT mapping handling.

Suraj Kandpal (1):
      drm/i915/vdsc: intel_display conversions

Thomas Zimmermann (12):
      drm/{i915, xe}: Suspend/resume fbdev emulation via client interfaces
      drm/client: Add client-hotplug helper
      drm/client: Send pending hotplug events after resume
      drm/i915/display: Remove fbdev suspend and hotplug tracking
      drm/i915/display: fbdev: Move custom restore code to new callback
      drm/i915/display: fbdev: Move custom suspend code to new callback
      drm/i915/display: Remove preferred_bpp from struct intel_fbdev
      drm/i915/display: Remove struct drm_fb_helper from struct intel_fbdev
      drm/i915/display: Move fbdev code around
      drm/{i915,xe}: Run DRM default client setup
      drm/i915/display: Remove compile guard around fbdev debugfs output
      drm/fb-helper: Remove struct drm_fb_helper.fb_probe

Ville Syrj=C3=A4l=C3=A4 (24):
      drm/i915: Fix pipeDMC and ATS fault handling
      drm/i915/dsb: Allow DSB based updates without planes
      drm/i915/dsb: Plumb dsb into plane scaler functions
      drm/i915/dsb: Allow DSB based commits when scalers are in use
      drm/i915/cdclk: Do cdclk post plane programming later
      drm/i915: Program CURSOR_PROGRAM and COEFF_POLARITY for icl+ combo PH=
Ys
      drm/i915: Drop redundant shared_dpll=3DNULL assignments
      drm/i915: Don't clobber crtc_state->cpu_transcoder for inactive crtcs
      drm/i915: Use intel_plane_set_invisible() in intel_plane_disable_noat=
omic()
      drm/i915: Extract intel_cdclk_crtc_disable_noatomic()
      drm/i915: Extract skl_wm_crtc_disable_noatomic()
      drm/i915: clean up pipe's ddb usage in intel_crtc_disable_noatomic()
      drm/i915: Add skl_wm_plane_disable_noatomic()
      drm/i915: Extract intel_bw_crtc_disable_noatomic()
      drm/i915: Extract intel_cdclk_update_hw_state()
      drm/i915: Extract intel_bw_update_hw_state()
      drm/i915: Update bw_state->active_pipes during readout
      drm/i915: Skip some bw_state readout on pre-icl
      sem/i915: Simplify intel_cdclk_update_hw_state()
      drm/i915: Simplify cdclk_disable_noatomic()
      drm/i915: Split wm sanitize from readout
      drm/i915: Do wm readout ealier for skl+
      drm/i915: Move dbuf_state->active_pipes into skl_wm_get_hw_state()
      drm/i915: Relocate intel_bw_crtc_update()

Vinod Govindapillai (9):
      drm/i915/fbc: remove one duplicate forward declaration
      drm/damage-helper: add const qualifier in drm_atomic_helper_damage_me=
rged()
      drm/i915/display: update and store the plane damage clips
      drm/i915/fbc: add register definitions for fbc dirty rect support
      drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect suppo=
rt
      drm/i915/fbc: avoid calling fbc activate if fbc is active
      drm/i915/fbc: dirty rect support for FBC
      drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
      drm/i915/fbc: handle dirty rect coords for the first frame

 drivers/gpu/drm/drm_client_event.c                 |   41 +-
 drivers/gpu/drm/drm_damage_helper.c                |    2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   20 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    2 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   18 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    2 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    2 +
 drivers/gpu/drm/i915/display/intel_atomic.h        |    1 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  126 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |    2 +
 drivers/gpu/drm/i915/display/intel_audio.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   74 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |    6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   30 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    4 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |    2 +
 drivers/gpu/drm/i915/display/intel_connector.c     |    4 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    1 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   39 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |    1 -
 drivers/gpu/drm/i915/display/intel_display.c       | 1364 +++++++++-------=
----
 drivers/gpu/drm/i915/display/intel_display.h       |   34 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |    4 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   34 +-
 .../gpu/drm/i915/display/intel_display_debugfs.h   |    6 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   18 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |    6 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    5 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    7 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |    2 +
 .../drm/i915/display/intel_display_power_well.c    |    9 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |   73 +-
 drivers/gpu/drm/i915/display/intel_display_reset.h |   12 +-
 drivers/gpu/drm/i915/display/intel_display_rps.c   |    4 +-
 drivers/gpu/drm/i915/display/intel_display_rps.h   |    4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   55 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    8 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |    3 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   50 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    2 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    8 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  158 +--
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    2 +
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |    1 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   29 +-
 drivers/gpu/drm/i915/display/intel_dpt.h           |    7 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   45 +-
 drivers/gpu/drm/i915/display/intel_drrs.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   10 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  270 +++-
 drivers/gpu/drm/i915/display/intel_fbc.h           |   10 +-
 drivers/gpu/drm/i915/display/intel_fbc_regs.h      |    9 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  340 ++---
 drivers/gpu/drm/i915/display/intel_fbdev.h         |   17 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  464 ++++---
 drivers/gpu/drm/i915/display/intel_fdi.h           |   16 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   12 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   94 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    1 -
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   55 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    3 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    6 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |    1 -
 drivers/gpu/drm/i915/display/intel_panel.c         |    1 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   35 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |  170 ++-
 drivers/gpu/drm/i915/display/intel_pfit.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_pfit_regs.h     |   79 ++
 drivers/gpu/drm/i915/display/intel_pipe_crc.h      |    1 -
 drivers/gpu/drm/i915/display/intel_quirks.c        |    2 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   75 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |    6 +-
 drivers/gpu/drm/i915/display/intel_tdf.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  182 ++-
 drivers/gpu/drm/i915/display/intel_wm.c            |    6 +
 drivers/gpu/drm/i915/display/intel_wm.h            |    1 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   60 +-
 drivers/gpu/drm/i915/display/skl_scaler.h          |    7 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   53 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   56 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    4 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    2 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    3 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   41 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |    2 +
 drivers/gpu/drm/i915/gt/intel_reset_types.h        |    3 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    3 -
 drivers/gpu/drm/i915/i915_driver.c                 |   16 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    2 -
 drivers/gpu/drm/i915/i915_gtt_view_types.h         |   59 +
 drivers/gpu/drm/i915/i915_reg.h                    |   74 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |   52 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |    4 +-
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |   15 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    8 -
 .../xe/compat-i915-headers/i915_gtt_view_types.h   |    7 +
 .../xe/compat-i915-headers/i915_scheduler_types.h  |   13 +
 .../drm/xe/compat-i915-headers/i915_vma_types.h    |   74 --
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |    2 +
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |    7 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |    4 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   13 +-
 drivers/gpu/drm/xe/display/xe_display_rps.c        |    2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |    1 +
 drivers/gpu/drm/xe/display/xe_tdf.c                |    6 +-
 drivers/gpu/drm/xe/xe_pxp.c                        |    9 +-
 drivers/gpu/drm/xe/xe_pxp.h                        |    2 +-
 include/drm/drm_client.h                           |    8 +
 include/drm/drm_damage_helper.h                    |    2 +-
 include/drm/drm_fb_helper.h                        |   44 +-
 124 files changed, 2545 insertions(+), 2374 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_pfit_regs.h
 create mode 100644 drivers/gpu/drm/i915/i915_gtt_view_types.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gtt_view_ty=
pes.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_scheduler_t=
ypes.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h

--=20
Jani Nikula, Intel
