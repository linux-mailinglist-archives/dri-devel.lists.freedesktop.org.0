Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2535A4DD2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7629B10F26B;
	Mon, 29 Aug 2022 13:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7C710F264;
 Mon, 29 Aug 2022 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661779389; x=1693315389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fo0q1Thz44Zw2DSnCdr8UcpTq33mu38Pj5p1/bQ/+H4=;
 b=YrUPQLBBU/46TvxqojZF4m8ekWCtVD9aTqI1pOSQuUODdieFiES9yFxB
 mT0nMB9xmMrT6JL2zBcs0y9EONZMbHUVvayj7yAiEYGQJIut8ht1p6fkW
 zdrnK+hjsjproty5vswVBCTdW60pp7dt8Gnvbud5EDNzr6ndFnWcEF0iz
 Jn9HgW3G7WZIumcPe1Q9asvy18cPIUUKER6UgD0JHoH0JU2ROsD+PWCJb
 t0Rv5Ep4m9OkDCCBAnZacoL9T9RTa8YvfBmjEUNro/8huLaTDuiSjyu7t
 U3kH0+pZIeiYY73tXSd6Lv/WG0vfp6IZzSh6EgQEFRHf6uN3G/nnJZjCa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="293635244"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="293635244"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 06:23:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="737327873"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 06:23:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 29 Aug 2022 16:22:57 +0300
Message-ID: <87k06rfaku.fsf@intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-next-2022-08-29:
drm/i915 feature pull for v6.1:

Features and functionality:
- Early Meteorlake (MTL) enabling (Jos=C3=A9, Radhakrishna, Clint, Imre, Va=
ndita, Ville, Jani)
- Support more HDMI pixel clock frequencies on DG2 (Clint)
- Sanity check PCI BARs (Piotr Pi=C3=B3rkowski)
- Enable DC5 on DG2 (Anusha)
- DG2 DMC firmware version bump to v2.07 (Madhumitha)
- New ADL-S PCI ID (Jos=C3=A9)

Refactoring and cleanups:
- Add display sub-struct to struct drm_i915_private (Jani)
- Add initial runtime info to device info (Jani)
- Split out HDCP and backlight registers to separate files (Jani)

Fixes:
- Skip wm/ddb readout for disabled pipes (Ville)
- HDMI port timing quirk for GLK ECS Liva Q2 (Diego Santa Cruz)
- Fix bw init null pointer dereference (=C5=81ukasz Bartosik)
- Disable PPS power hook for DP AUX backlight (Jouni)
- Avoid warnings on registering multiple backlight devices (Arun)
- Fix dual-link DSI backlight and CABC ports for display 11+ (Jani)
- Fix Type-C PHY ownership programming in HDMI legacy mode (Imre)
- Fix unclaimed register access while loading PIPEDMC-C/D (Imre)
- Bump up CDCLK for DG2 (Stan)
- Prune modes that require HDMI 2.1 FRL (Ankit)
- Disable FBC when PSR1 is enabled in display 12-13 (Matt)
- Fix TGL+ HDMI transcoder clock and DDI BUF disable order (Imre)
- Disable PSR before disable pipe (Jos=C3=A9)
- Disable DMC handlers during firmware loading/disabling on display 12+ (Im=
re)
- Disable clock gating for PIPEDMC-A/B as a workaround (Imre)

Merges:
- Two drm-next backmerges (Rodrigo, Jani)

BR,
Jani.

The following changes since commit 2c2d7a67defa198a8b8148dbaddc9e5554efebc8:

  Merge tag 'drm-intel-gt-next-2022-08-24' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2022-08-26 10:03:43 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-08-29

for you to fetch changes up to 917bda9ab155032a02be1a57ebd4d949ae9e1528:

  Merge drm/drm-next into drm-intel-next (2022-08-29 15:14:59 +0300)

----------------------------------------------------------------
drm/i915 feature pull for v6.1:

Features and functionality:
- Early Meteorlake (MTL) enabling (Jos=C3=A9, Radhakrishna, Clint, Imre, Va=
ndita, Ville, Jani)
- Support more HDMI pixel clock frequencies on DG2 (Clint)
- Sanity check PCI BARs (Piotr Pi=C3=B3rkowski)
- Enable DC5 on DG2 (Anusha)
- DG2 DMC firmware version bump to v2.07 (Madhumitha)
- New ADL-S PCI ID (Jos=C3=A9)

Refactoring and cleanups:
- Add display sub-struct to struct drm_i915_private (Jani)
- Add initial runtime info to device info (Jani)
- Split out HDCP and backlight registers to separate files (Jani)

Fixes:
- Skip wm/ddb readout for disabled pipes (Ville)
- HDMI port timing quirk for GLK ECS Liva Q2 (Diego Santa Cruz)
- Fix bw init null pointer dereference (=C5=81ukasz Bartosik)
- Disable PPS power hook for DP AUX backlight (Jouni)
- Avoid warnings on registering multiple backlight devices (Arun)
- Fix dual-link DSI backlight and CABC ports for display 11+ (Jani)
- Fix Type-C PHY ownership programming in HDMI legacy mode (Imre)
- Fix unclaimed register access while loading PIPEDMC-C/D (Imre)
- Bump up CDCLK for DG2 (Stan)
- Prune modes that require HDMI 2.1 FRL (Ankit)
- Disable FBC when PSR1 is enabled in display 12-13 (Matt)
- Fix TGL+ HDMI transcoder clock and DDI BUF disable order (Imre)
- Disable PSR before disable pipe (Jos=C3=A9)
- Disable DMC handlers during firmware loading/disabling on display 12+ (Im=
re)
- Disable clock gating for PIPEDMC-A/B as a workaround (Imre)

Merges:
- Two drm-next backmerges (Rodrigo, Jani)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/hdmi: Prune modes that require HDMI2.1 FRL

Anusha Srivatsa (3):
      drm/i915/display: Cleanup intel_phy_is_combo()
      drm/i915: Pass drm_i915_private struct instead of gt for gen11_gu_mis=
c_irq_handler/ack()
      drm/i915/dg2: Add support for DC5 state

Arun R Murthy (1):
      drm/i915/display: avoid warnings when registering dual panel backlight

Bo Liu (1):
      drm/i915/irq: Fix a "the the" typo

Clint Taylor (1):
      drm/i915/mtl: Fix rawclk for Meteorlake PCH

Diego Santa Cruz (1):
      drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk

Imre Deak (6):
      drm/i915/tgl+: Fix HDMI transcoder clock vs. DDI BUF disabling order
      drm/i915/d12+: Disable DMC handlers during loading/disabling the firm=
ware
      drm/i915/d13: Add Wa_16015201720 disabling clock gating for PIPEDMC-A=
/B
      drm/i915/xelpd: Fix unclaimed accesses while loading PIPEDMC-C/D
      drm/i915/tc: Fix PHY ownership programming in HDMI legacy mode
      drm/i915/mtl: Add VBT port and AUX_CH mapping

Jani Nikula (42):
      drm/i915/hdcp: split out hdcp registers to a separate file
      drm/i915/hdcp: replace BIT() with REG_BIT() in register definitions
      drm/i915/backlight: split out backlight registers to a separate file
      drm/i915/dsi: filter invalid backlight and CABC ports
      drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display =
11+
      drm/i915/dsi: use VBT backlight and CABC port definitions directly
      drm/i915/mtl: Meteorlake and later support DP 2.0
      drm/i915/utils: remove unused KBps/MBps/GBps macros
      drm/i915: combine device info printing into one
      drm/i915: add initial runtime info into device info
      drm/i915: move graphics.ver and graphics.rel to runtime info
      drm/i915: move fbc_mask to runtime info
      drm/i915: move page_sizes to runtime info
      drm/i915: move ppgtt_type and ppgtt_size to runtime info
      drm/i915: move has_pooled_eu to runtime info
      drm/i915: move memory_regions to runtime info
      drm/i915: move platform_engine_mask to runtime info
      drm/i915: move pipe_mask and cpu_transcoder_mask to runtime info
      drm/i915: move has_hdcp to runtime info
      drm/i915: move has_dmc to runtime info
      drm/i915: move has_dsc to runtime info
      drm/i915: add display sub-struct to drm_i915_private
      drm/i915: move cdclk_funcs to display.funcs
      drm/i915: move dpll_funcs to display.funcs
      drm/i915: move hotplug_funcs to display.funcs
      drm/i915: move wm_disp funcs to display.funcs
      drm/i915: move fdi_funcs to display.funcs
      drm/i915: move color_funcs to display.funcs
      drm/i915: move and group gmbus members under display.gmbus
      drm/i915: move and group pps members under display.pps
      drm/i915: move dmc to display.dmc
      drm/i915: move and split audio under display.audio and display.funcs
      drm/i915: move dpll under display.dpll
      drm/i915: move and group fbdev under display.fbdev
      drm/i915: move wm to display.wm
      drm/i915: move hotplug to display.hotplug
      drm/i915: move overlay to display.overlay
      drm/i915: move and group sagv under display.sagv
      drm/i915/vrr: drop window2_delay member from i915
      drm/i915: move INTEL_FRONTBUFFER_* macros to intel_frontbuffer.h
      drm/i915: split gem quirks from display quirks
      Merge drm/drm-next into drm-intel-next

Jos=C3=A9 Roberto de Souza (4):
      Revert "drm/i915/display: Ensure PSR gets disabled if no encoders in =
new state"
      drm/i915/psr: Disable PSR before disable pipe
      drm/i915/display/mtl: Extend MBUS programming
      drm/i915: Add new ADL-S pci id

Jouni H=C3=B6gander (2):
      drm/i915/display: Ensure PSR gets disabled if no encoders in new state
      drm/i915/backlight: Disable pps power hook for aux based backlight

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Update DG2 DMC firmware to v2.07

Matt Roper (1):
      drm/i915: Add Wa_14016291713

Piotr Pi=C3=B3rkowski (2):
      drm/i915: Use of BARs names instead of numbers
      drm/i915: Sanitycheck PCI BARs

Radhakrishna Sripada (6):
      drm/i915/mtl: Add PCH support
      drm/i915/mtl: Add support for MTL in Display Init sequences
      drm/i915: Extract wm latency adjustment to its own function
      drm/i915/mtl: memory latency data from LATENCY_LPX_LPY for WM
      drm/i915/mtl: Update memory bandwidth parameters
      drm/i915/mtl: Reuse adl-p DBUF calculations

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Stanislav Lisovskiy (1):
      drm/i915/dg2: Bump up CDCLK for DG2

Swati Sharma (1):
      drm/i915/display: Add debug print for scaler filter

Taylor, Clinton A (1):
      drm/i915/dg2: Add additional HDMI pixel clock frequencies

Vandita Kulkarni (2):
      drm/i915/dsc/mtl: Update the DSC minor version
      drm/i915/dsc/mtl: Enable alternate ICH method

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/mtl: Introduce FBC B
      drm/i915: Skip wm/ddb readout for disabled pipes

=C5=81ukasz Bartosik (1):
      drm/i915: fix null pointer dereference

 drivers/gpu/drm/i915/display/g4x_dp.c              |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   20 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   96 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   38 +-
 .../gpu/drm/i915/display/intel_backlight_regs.h    |  124 +++
 drivers/gpu/drm/i915/display/intel_bios.c          |   24 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   66 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   87 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   34 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    9 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   46 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   82 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    4 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  261 +++++
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   55 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   29 +-
 .../drm/i915/display/intel_display_power_well.c    |   19 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  142 ++-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |    2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   24 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    1 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |   24 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  112 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |    3 -
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |   14 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   12 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |    1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   26 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    8 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    2 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   18 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   46 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |  270 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   10 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  116 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   47 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    2 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   12 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   48 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   16 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    3 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      | 1116 ++++++++++++++++=
++++
 drivers/gpu/drm/i915/display/intel_tc.c            |    4 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   14 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   11 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    4 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   18 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   16 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    3 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   17 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 -
 drivers/gpu/drm/i915/gvt/cfg_space.c               |    5 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    5 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   23 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  284 +----
 drivers/gpu/drm/i915/i915_gem.c                    |    5 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    3 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   94 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  266 ++---
 drivers/gpu/drm/i915/i915_pci.h                    |    6 +
 drivers/gpu/drm/i915/i915_reg.h                    |  404 +------
 drivers/gpu/drm/i915/i915_utils.h                  |    4 -
 drivers/gpu/drm/i915/intel_device_info.c           |   71 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   82 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    1 +
 drivers/gpu/drm/i915/intel_pch.c                   |    9 +-
 drivers/gpu/drm/i915/intel_pch.h                   |    4 +
 drivers/gpu/drm/i915/intel_pci_config.h            |    7 +
 drivers/gpu/drm/i915/intel_pm.c                    |  358 ++++---
 drivers/gpu/drm/i915/intel_uncore.c                |    2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    8 +-
 include/drm/i915_pciids.h                          |    1 +
 89 files changed, 3172 insertions(+), 1684 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_core.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_regs.h

--=20
Jani Nikula, Intel Open Source Graphics Center
