Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953C5BAD04
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 14:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5891210E407;
	Fri, 16 Sep 2022 12:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936CC89DA9;
 Fri, 16 Sep 2022 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663330159; x=1694866159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/bAzYcY3GD3k2FsjuacSsADivdgd0yPdSsllTF5jBnc=;
 b=loijVRmWltIWL2J8d5/GbROSKYuPug8znuXsdrGaWukcL8xVOAobY0d7
 oXkFRd4mmCFnbf82LNbtr648xAXxyS9acUNjKWDkO38z+1M2d4FxAqjBZ
 i6CAng470vbmvGlhNqVovw141S4iIFYqXA5XqsLyKpYcukgT6D4+UQWcA
 DflBDPf9dPlJMcqOuVxeEm2ky7U21curx28K3Jqr8yzRjaaPikBUqajRZ
 YRri7Ze2aj5lF4zMgLOb2DjYOjMsAQQ4vy/8bW/an7gTRgTluJYk4e6L+
 6U8KxwOMRusPMnrJ/3J2m+CSCheR+Hf3A+QC6pw4OuiVEKYbGLHnwh6cR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="279359781"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="279359781"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:09:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650853800"
Received: from malisch-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.50])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:09:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 16 Sep 2022 15:09:07 +0300
Message-ID: <87o7vfr064.fsf@intel.com>
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

The final feature pull for v6.1.

drm-intel-next-2022-09-16-1:
drm/i915 feature pull #2 for v6.1:

Features and functionality:
- More Meteorlake platform enabling (Radhakrishna, Imre, Madhumitha)
- Allow seamless M/N changes on eDP panels that support it (Ville)
- Switch DSC debugfs from output bpp to input bpc (Swati)

Refactoring and cleanups:
- Clocking and DPLL refactoring and cleanups to support seamless M/N (Ville)
- Plenty of VBT definition and parsing updates and cleanups (Ville)
- Extract SKL watermark code to a separate file, and clean up (Ville)
- Clean up IPC interfaces and debugfs (Jani)
- Continue moving display data under drm_i915_private display sub-struct (J=
ani)
- Display quirk handling refactoring and abstractions (Jani)
- Stop using implicit dev_priv in gmbus registers (Jani)
- BUG_ON() removals and conversions to drm_WARN_ON() and BUILD_BUG_ON() (Ja=
ni)
- Use drm_dp_phy_name() for logging (Jani)
- Use REG_BIT() macros for CDCLK registers (Stan)
- Move display and media IP versions to runtime info (Radhakrishna)

Fixes:
- Fix DP MST suspend to avoid use-after-free (Andrzej)
- Fix HPD suspend to avoid use-after-free for fbdev (Andrzej)
- Fix various PSR issues regarding selective update and damage clips (Jouni)
- Fix runtime pm wakerefs for driver remove and release (Mitul Golani)
- Fix conditions for filtering fixed modes for panels (Ville)
- Fix TV encoder clock computation (Ville)
- Fix dvo mode_valid hook return type (Nathan Huckleberry)

Merges:
- Backmerge drm-next to sync the DP MST atomic changes (Jani)

BR,
Jani.

The following changes since commit 89b03aeaef16f8ab48c10c399f97c836bdbae838:

  drm/vkms: fix 32bit compilation error by replacing macros (2022-09-11 22:=
28:56 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-09-1=
6-1

for you to fetch changes up to 21f0b7dabf9c358e75a539b5554c0375bf1abe0a:

  drm/i915: Fix return type of mode_valid function hook (2022-09-15 10:28:5=
5 +0300)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.1:

Features and functionality:
- More Meteorlake platform enabling (Radhakrishna, Imre, Madhumitha)
- Allow seamless M/N changes on eDP panels that support it (Ville)
- Switch DSC debugfs from output bpp to input bpc (Swati)

Refactoring and cleanups:
- Clocking and DPLL refactoring and cleanups to support seamless M/N (Ville)
- Plenty of VBT definition and parsing updates and cleanups (Ville)
- Extract SKL watermark code to a separate file, and clean up (Ville)
- Clean up IPC interfaces and debugfs (Jani)
- Continue moving display data under drm_i915_private display sub-struct (J=
ani)
- Display quirk handling refactoring and abstractions (Jani)
- Stop using implicit dev_priv in gmbus registers (Jani)
- BUG_ON() removals and conversions to drm_WARN_ON() and BUILD_BUG_ON() (Ja=
ni)
- Use drm_dp_phy_name() for logging (Jani)
- Use REG_BIT() macros for CDCLK registers (Stan)
- Move display and media IP versions to runtime info (Radhakrishna)

Fixes:
- Fix DP MST suspend to avoid use-after-free (Andrzej)
- Fix HPD suspend to avoid use-after-free for fbdev (Andrzej)
- Fix various PSR issues regarding selective update and damage clips (Jouni)
- Fix runtime pm wakerefs for driver remove and release (Mitul Golani)
- Fix conditions for filtering fixed modes for panels (Ville)
- Fix TV encoder clock computation (Ville)
- Fix dvo mode_valid hook return type (Nathan Huckleberry)

Merges:
- Backmerge drm-next to sync the DP MST atomic changes (Jani)

----------------------------------------------------------------
Andrzej Hajda (3):
      drm/i915/hpd: suspend MST at the end of intel_modeset_driver_remove
      drm/i915/fbdev: suspend HPD before fbdev unregistration
      drm/i915/fbdev: do not create fbdev if HPD is suspended

Ankit Nautiyal (1):
      drm/i915/vdsc: Set VDSC PIC_HEIGHT before using for DP DSC

Imre Deak (2):
      drm/i915/mtl: Add display power wells
      drm/i915/mtl: Add DP AUX support on TypeC ports

Jani Nikula (46):
      drm/i915: move and group hdcp under display.hdcp
      drm/i915: move and group max_bw and bw_obj under display.bw
      drm/i915: move opregion to display.opregion
      drm/i915: move and group cdclk under display.cdclk
      drm/i915: move backlight to display.backlight
      drm/i915: move mipi_mmio_base to display.dsi
      drm/i915: move vbt to display.vbt
      drm/i915: move fbc to display.fbc
      drm/i915: move and group power related members under display.power
      drm/i915: move and group fdi members under display.fdi
      drm/i915: move fb_tracking under display sub-struct
      drm/i915: move dbuf under display sub-struct
      drm/i915: move and group modeset_wq and flip_wq under display.wq
      drm/i915/quirks: abstract checking for display quirks
      drm/i915/quirks: abstract quirks further by making quirk ids an enum
      drm/i915: move quirks under display sub-struct
      drm/i915: move atomic_helper under display sub-struct
      drm/i915: move and group properties under display.properties
      drm/i915/gmbus: split out gmbus regs in a separate file
      drm/i915/gmbus: whitespace cleanup in reg definitions
      drm/i915/gmbus: add wrapper for gmbus mmio base
      drm/i915/gmbus: stop using implicit dev_priv in register definitions
      drm/i915/reg: stop using implicit dev_priv in DSPCLK_GATE_D
      drm/i915/gmbus: mass dev_priv -> i915 rename
      drm/i915/crt: remove BUG_ON()
      drm/i915/dpll: replace BUG_ON() with drm_WARN_ON()
      drm/i915/pch: replace BUG_ON() with drm_WARN_ON()
      drm/i915/perf: replace BUG_ON() with WARN_ON()
      drm/i915/fence: replace BUG_ON() with BUILD_BUG_ON()
      drm/i915: remove unused macro I915_GTT_OFFSET_NONE
      drm/i915: remove unused i915_gem_set_global_seqno() declaration
      drm/i915: un-inline i915_gem_drain_workqueue()
      drm/i915: un-inline i915_gem_drain_freed_objects()
      drm/i915: split out i915_gem.c declarations to i915_gem.h
      Revert "drm/i915: Add DSC support to MST path"
      Revert "drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to sepa=
rate function"
      Revert "drm/i915: Fix intel_dp_mst_compute_link_config"
      Revert "drm: Add missing DP DSC extended capability definitions."
      drm/i915/dsb: hide struct intel_dsb better
      Merge drm/drm-next into drm-intel-next
      drm/i915/dp: use drm_dp_phy_name() for logging
      drm/i915/ipc: refactor and rename IPC functions
      drm/i915/ipc: move IPC debugfs to skl_watermark.c
      drm/i915/ipc: register debugfs only if IPC available
      drm/i915/display: move IPC under display wm sub-struct
      drm/i915/ipc: use intel_uncore_rmw() to enable/disable

Jouni H=C3=B6gander (4):
      drm/i915/psr: Equation changed for sending start/stop on prior line
      drm/i915/psr: Disable PSR2 when SDP is sent on prior line
      drm/i915/display: Use original src in psr2 sel fetch area calculation
      drm/i915/display: Use drm helper instead of own loop for damage clips

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/mtl: Update CHICKEN_TRANS* register addresses

Mitul Golani (1):
      drm/i915/display: Fix warning callstack for imbalance wakeref

Nathan Huckleberry (1):
      drm/i915: Fix return type of mode_valid function hook

Radhakrishna Sripada (4):
      drm/i915: Move display and media IP version to runtime info
      drm/i915/mtl: Add gmbus and gpio support
      drm/i915/mtl: Obtain SAGV values from MMIO instead of GT pcode mailbox
      drm/i915/mtl: Update MBUS_DBOX credits

Stanislav Lisovskiy (5):
      drm/i915: Start using REG_BIT* macros with CDCLK registers
      drm: Add missing DP DSC extended capability definitions.
      drm/i915: Fix intel_dp_mst_compute_link_config
      drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate fun=
ction
      drm/i915: Add DSC support to MST path

Swati Sharma (1):
      drm/i915/dsc: convert dsc debugfs entry from output_bpp to input_bpc

Ville Syrj=C3=A4l=C3=A4 (41):
      drm/i915/bios: Dump PNPID and panel name
      drm/i915/bios: Copy the whole MIPI sequence block
      drm/i915: Allow more varied alternate fixed modes for panels
      drm/i915/bios: Validate fp_timing terminator presence
      drm/i915/bios: Use hardcoded fp_timing size for generating LFP data p=
ointers
      drm/i915: Implement WaEdpLinkRateDataReload
      Revert "drm/i915/display: Re-add check for low voltage sku for max dp=
 source rate"
      drm/i915: Unify VBT version number comments
      drm/i915: Add some more VBT version number comments
      drm/i915: Properly define the DP redriver VBT bits
      drm/i915: Define VBT eDP/DP max lane count bits
      drm/i915: Add the VBT LTTPR transparent vs. non-transparent bits
      drm/i915: Define VBT max HDMI FRL rate bits
      drm/i915: Document the sets of bits in the driver features block
      drm/i915: Define more VBT driver features block bits
      drm/i915: Define all possible VBT device handles
      drm/i915: Rename some VBT bits
      drm/i915: Parse DP/eDP max lane count from VBT
      drm/i915: Relocate intel_crtc_dotclock()
      drm/i915: Shuffle some PLL code around
      drm/i915: Extract HAS_DOUBLE_BUFFERED_M_N()
      drm/i915/dsi: Extract {vlv,bxt}_get_pclk()
      drm/i915: Do .crtc_compute_clock() earlier
      drm/i915: Reassign DPLLs only for crtcs going throug .compute_config()
      drm/i915: Feed the DPLL output freq back into crtc_state
      drm/i915: Compute clocks earlier
      drm/i915: Make M/N checks non-fuzzy
      drm/i915: Make all clock checks non-fuzzy
      drm/i915: Set active dpll early for icl+
      drm/i915: Nuke fastet state copy hacks
      drm/i915: Skip intel_modeset_pipe_config_late() if the pipe is not en=
abled
      drm/i915: Add intel_panel_highest_mode()
      drm/i915: Allow M/N change during fastset on bdw+
      drm/i915: Use a fixed N value always
      drm/i915: Round TMDS clock to nearest
      drm/i915: Split intel_read_wm_latency() into per-platform versions
      drm/i915: Extract skl_watermark.c
      drm/i915: Use REG_FIELD_GET() to extract skl+ wm latencies
      drm/i915/bios: Fix VBT ACPI DPMS bit polarity
      drm/i915/bios: Add the "Disable compression for the Display Port/HDMI=
 external display" bit
      drm/i915: Fix TV encoder clock computation

 drivers/gpu/drm/i915/Makefile                      |    3 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    4 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   22 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    8 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    2 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  102 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   77 +-
 .../gpu/drm/i915/display/intel_backlight_regs.h    |  124 +
 drivers/gpu/drm/i915/display/intel_bios.c          |  392 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |  152 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  293 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    4 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   35 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    8 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   13 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    9 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   71 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  372 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    6 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  418 ++
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  147 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  153 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |  119 +-
 .../drm/i915/display/intel_display_power_well.c    |  129 +-
 .../drm/i915/display/intel_display_power_well.h    |   16 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |    3 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  142 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |    2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  147 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   57 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    1 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  105 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |    8 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  111 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  326 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   30 +
 drivers/gpu/drm/i915/display/intel_dsb.h           |   28 -
 drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |    3 -
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |   14 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    4 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   18 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |    1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   36 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   20 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   56 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   18 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  290 +-
 drivers/gpu/drm/i915/display/intel_gmbus.h         |    1 +
 drivers/gpu/drm/i915/display/intel_gmbus_regs.h    |   81 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  139 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |  270 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  116 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   47 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   15 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    8 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |   42 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   16 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   45 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |    3 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   16 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |    1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   51 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   43 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |   25 +-
 drivers/gpu/drm/i915/display/intel_quirks.h        |   14 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   18 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      | 1116 ++++++
 drivers/gpu/drm/i915/display/intel_tc.c            |    4 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   23 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |  346 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   14 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       | 3562 +++++++++++++++++
 drivers/gpu/drm/i915/display/skl_watermark.h       |   80 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   30 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |  141 +-
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        |  188 +-
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
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    4 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   17 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 -
 drivers/gpu/drm/i915/gvt/cfg_space.c               |    5 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |    3 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    7 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   42 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  521 +--
 drivers/gpu/drm/i915/i915_gem.c                    |   44 +-
 drivers/gpu/drm/i915/i915_gem.h                    |   43 +
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    3 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   94 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  286 +-
 drivers/gpu/drm/i915/i915_pci.h                    |    6 +
 drivers/gpu/drm/i915/i915_perf.c                   |    3 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  541 +--
 drivers/gpu/drm/i915/i915_sw_fence.c               |    2 -
 drivers/gpu/drm/i915/i915_sw_fence.h               |    6 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    4 -
 drivers/gpu/drm/i915/intel_device_info.c           |   91 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   93 +-
 drivers/gpu/drm/i915/intel_dram.c                  |   41 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    1 +
 drivers/gpu/drm/i915/intel_pch.c                   |    9 +-
 drivers/gpu/drm/i915/intel_pch.h                   |    4 +
 drivers/gpu/drm/i915/intel_pci_config.h            |    7 +
 drivers/gpu/drm/i915/intel_pm.c                    | 4056 ++--------------=
----
 drivers/gpu/drm/i915/intel_pm.h                    |   65 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    8 +-
 include/drm/i915_pciids.h                          |    1 +
 133 files changed, 9451 insertions(+), 7234 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_core.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_gmbus_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_watermark.c
 create mode 100644 drivers/gpu/drm/i915/display/skl_watermark.h

--=20
Jani Nikula, Intel Open Source Graphics Center
