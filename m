Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C477C6F81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 15:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6748A10E4F2;
	Thu, 12 Oct 2023 13:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3B10E4EF;
 Thu, 12 Oct 2023 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697118207; x=1728654207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=czmuGnuhoZwDVrZ1N60qwIORAiC/Nse4LYw3afGhwQo=;
 b=ID5AZAr0jrwkG+9z2QxTc4V4Odmzp8np5dGZJn1PlYG9+iaQYu6rHpnC
 uJAeGafkDJAWdM27feWLCh67rSMoRuUgNu/A44e8LoWJTxyw5GIerZGvz
 SGfD3tTsuSF48Nw4uCw4oLSxIOKR7xYs6fu5+SNTnla8YPFJlh5OXak41
 dJfaA0h0CAZ0FD/RQg+MqbMTMhU9Ts2pZlqH8aceyiKPWKvoOZ2WkFb0b
 PDN+pKjR94fF0ILMpkQFnYK9Ck56WnBAeg3gLTTJ9Cf/K2htALn6v9s/S
 FjBSmem+sb8Ca71AE4GfjYaDunVXH9lZnw0iNVb+tlM0Cs6P12GHZ0fmR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="415972116"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="415972116"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 06:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="927999708"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="927999708"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 06:42:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 12 Oct 2023 16:42:47 +0300
Message-ID: <87r0m00xew.fsf@intel.com>
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Sima -

Here's the 2nd i915 feature pull for v6.7.

There might be another small feature pull coming next week, mainly to
remove force probe for Meteorlake, and promote it to fully
supported. There are some final issues being ironed out still.

There's a backmerge in there; I acknowledge I should pay more attention
to the details in the backmerge commit message. There was a conflict
between the drm-intel-next and drm-intel-gt-next branches I wanted to
clear before applying more patches on top.


drm-intel-next-2023-10-12:
drm/i915 feature pull #2 for v6.7:

Features and functionality:
- Preparation for i915 display code reuse in upcoming Xe driver (Jani)
- Drop the fastboot module parameter and use the platform defaults (Arun)
- Enable new LNL FBC features (Vinod)
- Add LNL display feature capability reads (Vinod)

Refactoring and cleanups:
- Locally enable W=3D1 warnings by default in i915 (Jani)
- Move HDCP GSC message code to a separate file (Suraj)
- GVT include cleanups (Jani)
- Move more display init under display/ (Jani)
- DPLL ID refactoring (Ville)
- Better abstraction of GT0 (Jani)
- Move VGA decode function to GMCH code (Uma)
- Use local64_try_cmpxchg() to optimize PMU event read (Uros Bizjak)
- Clean up FBC checks (Ville)
- Constify and unify state checker calling conventions (Ville)
- Add display step name helper (Chaitanya)

Documentation:
- Update CCS and GSC CS documentation (Rodrigo)
- Fix a number of documentation typos (Randy Dunlap)

Fixes:
- VLV DSI fixes and quirks (Hans)
- Fix crtc state memory leaks (Suraj)
- Increase LSPCON mode settle timeout (Niko Tsirakis)
- Stop clobbering old crtc state during state check (Ville)
- Fix VLV color state readout (Ville)
- Fix cx0 PHY pipe reset to allow S0iX (Khaled)
- Ensure DP MST pbn_div is up-to-date after sink reconnect (Imre)
- Drop an unnecessary NULL check to fix static analyzer warning (Suraj)
- Use an explicit rather than implicit include for frontbuffer tracking (Jo=
uni)

Merges:
- Backmerge drm-next to fix a conflict (Jani)

BR,
Jani.

The following changes since commit caacbdc28f545744770fb2caf347b3c4be9a6299:

  Merge tag 'drm-intel-gt-next-2023-09-28' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2023-10-03 06:02:30 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-10-12

for you to fetch changes up to a6028afef98a6e3f059a014452914eb01035d530:

  drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2) (2023-10-12 12=
:41:54 +0200)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.7:

Features and functionality:
- Preparation for i915 display code reuse in upcoming Xe driver (Jani)
- Drop the fastboot module parameter and use the platform defaults (Arun)
- Enable new LNL FBC features (Vinod)
- Add LNL display feature capability reads (Vinod)

Refactoring and cleanups:
- Locally enable W=3D1 warnings by default in i915 (Jani)
- Move HDCP GSC message code to a separate file (Suraj)
- GVT include cleanups (Jani)
- Move more display init under display/ (Jani)
- DPLL ID refactoring (Ville)
- Better abstraction of GT0 (Jani)
- Move VGA decode function to GMCH code (Uma)
- Use local64_try_cmpxchg() to optimize PMU event read (Uros Bizjak)
- Clean up FBC checks (Ville)
- Constify and unify state checker calling conventions (Ville)
- Add display step name helper (Chaitanya)

Documentation:
- Update CCS and GSC CS documentation (Rodrigo)
- Fix a number of documentation typos (Randy Dunlap)

Fixes:
- VLV DSI fixes and quirks (Hans)
- Fix crtc state memory leaks (Suraj)
- Increase LSPCON mode settle timeout (Niko Tsirakis)
- Stop clobbering old crtc state during state check (Ville)
- Fix VLV color state readout (Ville)
- Fix cx0 PHY pipe reset to allow S0iX (Khaled)
- Ensure DP MST pbn_div is up-to-date after sink reconnect (Imre)
- Drop an unnecessary NULL check to fix static analyzer warning (Suraj)
- Use an explicit rather than implicit include for frontbuffer tracking (Jo=
uni)

Merges:
- Backmerge drm-next to fix a conflict (Jani)

----------------------------------------------------------------
Arun R Murthy (1):
      drm/i915: Remove the module parameter 'fastboot'

Chaitanya Kumar Borah (1):
      drm/i915: Add wrapper for getting display step

Hans de Goede (4):
      drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS on A=
sus TF103C (v3)
      drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size on L=
enovo Yoga Tablet 2 series (v3)
      drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenov=
o Yoga Tab 3 (v2)
      drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)

Imre Deak (1):
      drm/i915/dp_mst: Make sure pbn_div is up-to-date after sink reconnect

Jani Nikula (33):
      drm/i915: define I915 during i915 driver build
      drm/i915/display: add I915 conditional build to intel_lvds.h
      drm/i915/display: add I915 conditional build to hsw_ips.h
      drm/i915/display: add I915 conditional build to i9xx_plane.h
      drm/i915/display: add I915 conditional build to intel_lpe_audio.h
      drm/i915/display: add I915 conditional build to intel_pch_refclk.h
      drm/i915/display: add I915 conditional build to intel_pch_display.h
      drm/i915/display: add I915 conditional build to intel_sprite.h
      drm/i915/display: add I915 conditional build to intel_overlay.h
      drm/i915/display: add I915 conditional build to g4x_dp.h
      drm/i915/display: add I915 conditional build to intel_dpio_phy.h
      drm/i915/display: add I915 conditional build to intel_crt.h
      drm/i915/display: add I915 conditional build to vlv_dsi.h
      drm/i915/display: add I915 conditional build to i9xx_wm.h
      drm/i915/display: add I915 conditional build to g4x_hdmi.h
      drm/i915/display: add I915 conditional build to intel_dvo.h
      drm/i915/display: add I915 conditional build to intel_sdvo.h
      drm/i915/display: add I915 conditional build to intel_tv.h
      drm/i915/display: add I915 conditional build to vlv_dsi_pll.h
      drm/i915: convert INTEL_DISPLAY_ENABLED() into a function
      drm/i915: move display info related macros to display
      drm/i915: separate display runtime info init
      drm/i915: separate subplatform init and runtime feature init
      Merge drm/drm-next into drm-intel-next
      drm/i915/mocs: use to_gt() instead of direct &i915->gt
      drm/i915: allocate i915->gt0 dynamically
      drm/i915/gt: remove i915->gt0 in favour of i915->gt[0]
      drm/i915/gvt: remove unused to_gvt() and reduce includes
      drm/i915/gvt: don't include gvt.h from intel_gvt_mmio_table.h
      drm/i915/gvt: move struct engine_mmio to mmio_context.c
      drm/i915/gvt: move structs intel_gvt_irq_info and intel_gvt_irq_map t=
o interrupt.c
      drm/i915: drop -Wall and related disables from cflags as redundant
      drm/i915: enable W=3D1 warnings by default

Jouni H=C3=B6gander (1):
      drm/i915/display: Include i915_active header in frontbuffer tracking =
code

Khaled Almahallawy (1):
      drm/i915/cx0: Only clear/set the Pipe Reset bit of the PHY Lanes Owned

Niko Tsirakis (1):
      drm/i915/display/lspcon: Increase LSPCON mode settle timeout

Randy Dunlap (1):
      drm/i915/uapi: fix doc typos

Rodrigo Vivi (3):
      drm/i915: Abstract display info away during probe
      drm/i915: Add missing CCS documentation
      drm/i915: Add missing GSCCS documentation

Suraj Kandpal (6):
      drm/i915/ddi: Remove redundant intel_connector NULL check
      drm/i915/display: Free crtc_state in verify_crtc_state
      drm/i915/display: Use intel_crtc_destroy_state instead kfree
      drm/i915/display: Use correct method to free crtc_state
      drm/i915/hdcp: Move checks for gsc health status
      drm/i915/hdcp: Move common message filling function to its own file

Uma Shankar (1):
      drm/i915/display: Created exclusive version of vga decode setup

Uros Bizjak (1):
      drm/i915/pmu: Use local64_try_cmpxchg in i915_pmu_event_read

Ville Syrj=C3=A4l=C3=A4 (23):
      drm/i915: Stop requiring PLL index =3D=3D PLL ID
      drm/i915: Decouple I915_NUM_PLLS from PLL IDs
      drm/i915: Introduce for_each_shared_dpll()
      drm/i915: s/dev_priv/i915/ in the shared_dpll code
      drm/i915/fbc: Remove ancient 16k plane stride limit
      drm/i915/fbc: Split plane stride checks per-platform
      drm/i915/fbc: Split plane tiling checks per-platform
      drm/i915/fbc: Split plane rotation checks per-platform
      drm/i915/fbc: Split plane pixel format checks per-platform
      drm/i915/fbc: Remove pointless "stride is multiple of 64 bytes" check
      drm/i915/psr: Unify PSR pre/post plane update hooks
      drm/i915: Stop clobbering old crtc state during state check
      drm/i915: Constify the crtc states in the DPLL checker
      drm/i915: Simplify DPLL state checker calling convention
      drm/i915: Constify watermark state checker
      drm/i915: Simplify watermark state checker calling convention
      drm/i915: Constify the snps/c10x PLL state checkers
      drm/i915: Simplify snps/c10x DPLL state checker calling convetion
      drm/i915: Constify remainder of the state checker
      drm/i915: Simplify the state checker calling convetions
      drm/i915: s/pipe_config/crtc_state/ in the state checker
      drm/i915: s/dev_priv/i915/ in the state checker
      drm/i915: Fix VLV color state readout

Vinod Govindapillai (5):
      drm/i915/lnl: possibility to enable FBC on first three planes
      drm/i915/lnl: update the supported plane formats with FBC
      drm/i915/xe2lpd: display capability register definitions
      drm/i915/xe2lpd: update the dsc feature capability
      drm/i915/xe2lpd: update the scaler feature capability

 Documentation/gpu/i915.rst                         |  29 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |  23 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   8 +-
 drivers/gpu/drm/drm_connector.c                    |  11 +-
 drivers/gpu/drm/drm_edid.c                         |  22 +-
 drivers/gpu/drm/drm_internal.h                     |   2 +
 drivers/gpu/drm/drm_sysfs.c                        |  22 +-
 drivers/gpu/drm/i915/Makefile                      |  49 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |  10 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |  26 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   6 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |  12 +
 drivers/gpu/drm/i915/display/hsw_ips.c             |   1 +
 drivers/gpu/drm/i915/display/hsw_ips.h             |  35 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   1 +
 drivers/gpu/drm/i915/display/i9xx_plane.h          |  23 +
 drivers/gpu/drm/i915/display/i9xx_wm.h             |  17 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |  13 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   2 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  14 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |   3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  26 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 107 ++-
 drivers/gpu/drm/i915/display/intel_color.c         | 155 +++-
 drivers/gpu/drm/i915/display/intel_color.h         |   2 +
 drivers/gpu/drm/i915/display/intel_color_regs.h    | 286 ++++++
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  17 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   6 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  66 +-
 drivers/gpu/drm/i915/display/intel_crt.h           |  14 +
 drivers/gpu/drm/i915/display/intel_crtc.c          | 118 ++-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   6 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   3 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 215 ++---
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |  17 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |  13 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  40 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 490 +++++++---
 drivers/gpu/drm/i915/display/intel_display.h       |   8 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  13 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 156 +++-
 .../gpu/drm/i915/display/intel_display_device.h    |  41 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   8 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  10 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   1 -
 .../gpu/drm/i915/display/intel_display_power_map.c |  63 +-
 .../drm/i915/display/intel_display_power_well.c    |  52 +-
 .../drm/i915/display/intel_display_power_well.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  49 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |  48 +
 drivers/gpu/drm/i915/display/intel_display_wa.h    |  13 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 879 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h            |  34 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  49 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |  80 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  87 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 167 ++--
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |  96 ++
 drivers/gpu/drm/i915/display/intel_dpll.c          |  57 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 987 +++++++++++------=
----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |  33 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   1 +
 drivers/gpu/drm/i915/display/intel_dsb.c           | 217 ++++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   9 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |  31 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   3 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |  13 +-
 drivers/gpu/drm/i915/display/intel_dvo.h           |   6 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  61 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           | 181 +++-
 drivers/gpu/drm/i915/display/intel_fbc.h           |   2 +
 drivers/gpu/drm/i915/display/intel_fdi.c           | 169 +++-
 drivers/gpu/drm/i915/display/intel_fdi.h           |   8 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |  35 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   4 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  41 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      | 617 +------------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |   1 +
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  | 592 ++++++++++++
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |  72 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 123 +--
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  87 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  24 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       | 212 +++++
 drivers/gpu/drm/i915/display/intel_link_bw.h       |  37 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.h     |  18 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |  29 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  33 +-
 drivers/gpu/drm/i915/display/intel_lvds.h          |  19 +
 .../gpu/drm/i915/display/intel_modeset_verify.c    | 134 +--
 .../gpu/drm/i915/display/intel_modeset_verify.h    |  11 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   2 +
 drivers/gpu/drm/i915/display/intel_overlay.h       |  35 +
 drivers/gpu/drm/i915/display/intel_panel.c         |  19 +-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |  53 ++
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   7 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |  23 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   1 +
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  72 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |   3 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          | 383 ++++----
 drivers/gpu/drm/i915/display/intel_sdvo.h          |  13 +
 drivers/gpu/drm/i915/display/intel_sdvo_regs.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   7 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |   3 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.h        |   8 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  66 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |   3 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.h            |   6 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |  14 +
 drivers/gpu/drm/i915/display/intel_vblank.h        |   1 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 630 ++++++-------
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     | 397 +++------
 drivers/gpu/drm/i915/display/intel_vga.c           |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |   1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  16 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  40 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |   6 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             | 130 +++
 drivers/gpu/drm/i915/display/vlv_dsi.h             |  13 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  89 --
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h | 103 +++
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   1 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  39 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  36 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  10 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   4 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   4 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |   9 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |  17 +
 drivers/gpu/drm/i915/gvt/interrupt.h               |  31 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |   8 +
 drivers/gpu/drm/i915/gvt/mmio_context.h            |  10 -
 drivers/gpu/drm/i915/i915_driver.c                 |  11 +-
 drivers/gpu/drm/i915/i915_driver.h                 |   4 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  38 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   4 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   2 +
 drivers/gpu/drm/i915/i915_params.c                 |   5 -
 drivers/gpu/drm/i915/i915_params.h                 |   1 -
 drivers/gpu/drm/i915/i915_pci.c                    |   1 -
 drivers/gpu/drm/i915/i915_pmu.c                    |   9 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 290 +-----
 drivers/gpu/drm/i915/i915_vma.c                    |   1 +
 drivers/gpu/drm/i915/i915_vma_resource.c           |   2 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |  52 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  36 -
 drivers/gpu/drm/i915/intel_device_info.h           |   1 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   4 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   1 -
 drivers/gpu/drm/i915/intel_runtime_pm.h            |   4 +-
 drivers/gpu/drm/i915/intel_step.c                  |   6 +
 drivers/gpu/drm/i915/intel_step.h                  |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |  40 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |  18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |   5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |   9 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   3 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |  14 +
 drivers/gpu/drm/i915/soc/intel_gmch.h              |   2 +
 drivers/gpu/drm/i915/soc/intel_pch.c               |  12 +-
 drivers/gpu/drm/i915/soc/intel_pch.h               |   2 +
 drivers/media/cec/core/cec-adap.c                  |   5 +
 drivers/media/cec/core/cec-notifier.c              |   5 +
 include/drm/display/drm_dp_helper.h                |   6 +
 include/drm/drm_connector.h                        |   8 +
 include/drm/drm_edid.h                             |   1 +
 include/drm/i915_pciids.h                          |   8 +-
 include/uapi/drm/i915_drm.h                        |   8 +-
 191 files changed, 6812 insertions(+), 3874 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_link_bw.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_link_bw.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h

--=20
Jani Nikula, Intel
