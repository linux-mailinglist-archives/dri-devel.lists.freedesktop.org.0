Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E467E2C5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 12:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945B010E456;
	Fri, 27 Jan 2023 11:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327A410E452;
 Fri, 27 Jan 2023 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674817896; x=1706353896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J9LJG1vPuwOCpJvCcQ0+2UdV92yhQ1m4dA1H633pX1I=;
 b=VNtpQJX+hhfBIy7h9UbI0ssZTPrUAUiRAeXmYCbe0gh1H17XbrBvnCVV
 aToKkUTQm/Vf/zt/sY1Y2k9oECj3ql37Dl3mTgMyKX5uO0r/m6E+FSQZB
 OatJVpBbD4/WnVlklxSwd2PGgTLyI53MGSGYs/zREcgA4j0z6f+n8bLSF
 hsBhFHZcRR8hdyeQBE4IZrSGrpuQvdllNs2Vw4ppc1jhRAKzMDk+yEOQ9
 tiEm1yjm1j7CO2fJvBbScFNGvvlR+rjPlNs8FhZuyUrSgPGUK968ptAZw
 qPdsWadx2C1YJLJNf5MtdLJ1FsI44R/3wIhFYOt89cbSpae7BxceUlzHN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="306715260"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="306715260"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 03:11:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="663237504"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="663237504"
Received: from kagner-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.38])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 03:11:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 27 Jan 2023 13:11:28 +0200
Message-ID: <87tu0c44gv.fsf@intel.com>
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

drm-intel-next-2023-01-27:
drm/i915 feature pull #2 v6.3:

Features and functionality:
- Enable HF-EEODB by switching HDMI, DP and LVDS to use struct drm_edid (Ja=
ni)
- Start using unversioned DMC firmware paths for new platforms (Gustavo)

Refactoring and cleanups:
- ELD refactor: Stop using hardware buffer, precompute ELD, and wire up ELD=
 in
  the state checker (Ville)
- Use generics for debugfs device parameters (Jani)
- DSB refactoring and fixes (Ville)
- Header refactoring, add new intel_display_limits.h (Jani)
- Split out GMCH code to a new file (Jani)
- Split out vblank code to a new file (Jani)
- i915_drv.h and struct drm_i915_private cleanups (Jani)
- Simplify FBC and DRRS debug attributes (Deepak R Varma)
- Remove some single-use macros (Rodrigo)

Fixes:
- Fix scaler limits for display versions 12 and 13 (Luca)
- Fix plane source size check for zero height (Drew Davenport)
- Implement PSR2 selective fetch workaround (Jouni)
- Expand a PSR workaound to more platforms and pipes (Jouni)
- Expand an HDMI infoframe workaround to all MTL steppings (Jouni)
- Enable PIPEDMC whenever its corresponding pipe is enabled (Imre)

Merges:
- Backmerge drm-next (Jani)

BR,
Jani.

The following changes since commit 68de345e101ce9a24e5c8849e69dd0dba2e8c9b2:

  Merge tag 'drm-misc-next-2023-01-24' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2023-01-25 12:14:08 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-01-27

for you to fetch changes up to d3eb347da1148fdb1c2462ae83090a4553d3f46f:

  drm/i915/mtl: Apply Wa_14013475917 for all MTL steppings (2023-01-26 13:5=
4:05 +0200)

----------------------------------------------------------------
drm/i915 feature pull #2 v6.3:

Features and functionality:
- Enable HF-EEODB by switching HDMI, DP and LVDS to use struct drm_edid (Ja=
ni)
- Start using unversioned DMC firmware paths for new platforms (Gustavo)

Refactoring and cleanups:
- ELD refactor: Stop using hardware buffer, precompute ELD, and wire up ELD=
 in
  the state checker (Ville)
- Use generics for debugfs device parameters (Jani)
- DSB refactoring and fixes (Ville)
- Header refactoring, add new intel_display_limits.h (Jani)
- Split out GMCH code to a new file (Jani)
- Split out vblank code to a new file (Jani)
- i915_drv.h and struct drm_i915_private cleanups (Jani)
- Simplify FBC and DRRS debug attributes (Deepak R Varma)
- Remove some single-use macros (Rodrigo)

Fixes:
- Fix scaler limits for display versions 12 and 13 (Luca)
- Fix plane source size check for zero height (Drew Davenport)
- Implement PSR2 selective fetch workaround (Jouni)
- Expand a PSR workaound to more platforms and pipes (Jouni)
- Expand an HDMI infoframe workaround to all MTL steppings (Jouni)
- Enable PIPEDMC whenever its corresponding pipe is enabled (Imre)

Merges:
- Backmerge drm-next (Jani)

----------------------------------------------------------------
Deepak R Varma (3):
      drm/i915/display: Avoid full proxy f_ops for DRRS debug attributes
      drm/i915/fbc: Avoid full proxy f_ops for FBC debug attributes
      drm/i915/display: Convert i9xx_pipe_crc_auto_source to void

Drew Davenport (1):
      drm/i915/display: Check source height is > 0

Gustavo Sousa (2):
      drm/i915/dmc: Prepare to use unversioned paths
      drm/i915/dmc: Use unversioned path for ADLP

Imre Deak (1):
      drm/i915: Enable a PIPEDMC whenever its corresponding pipe is enabled

Jani Nikula (32):
      drm/i915/display: drop redundant display/ from #includes
      drm/i915/irq: split out vblank/scanline code to intel_vblank.[ch]
      drm/i915/display: move more scanline functions to intel_vblank.[ch]
      drm/i915/display: use common function for checking scanline is moving
      drm/i915/vblank: use intel_de_read()
      drm/i915/vblank: add and use intel_de_read64_2x32() to read vblank co=
unter
      drm/i915: add struct i915_dsm to wrap dsm members together
      drm/i915: drop cast from DEFINE_RES_MEM() usage
      drm/i915: move snps_phy_failed_calibration to display sub-struct unde=
r snps
      drm/i915: move pch_ssc_use to display sub-struct under dpll
      drm/i915: move chv_dpll_md and bxt_phy_grc to display sub-struct unde=
r state
      drm/i915: add i915_config.h and move relevant declarations there
      drm/i915: move I915_IDLE_ENGINES_TIMEOUT next to its only user
      drm/i915: drop a number of unnecessary forward declarations
      drm/i915: move a few HAS_ macros closer to their place
      drm/i915: move I915_GEM_GPU_DOMAINS to i915_gem.h
      drm/i915: move I915_COLOR_UNEVICTABLE to i915_gem_gtt.h
      drm/i915: move GT_FREQUENCY_MULTIPLIER and GEN9_FREQ_SCALER to intel_=
rps.h
      Merge drm/drm-next into drm-intel-next
      drm/i915: add gmch substruct to struct drm_i915_private
      drm/i915/gmch: split out soc/intel_gmch
      drm/i915/gmch: mass rename dev_priv to i915
      drm/i915/gmch: move VGA set state to GMCH code
      drm/i915/display: add intel_display_limits.h for key enums
      drm/i915/params: use generics for parameter printing
      drm/i915/params: use generics for parameter dup
      drm/i915/params: use generics for parameter free
      drm/i915/params: use generics for parameter debugfs file creation
      drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
      drm/i915/bios: convert intel_bios_init_panel() to drm_edid
      drm/i915/opregion: convert intel_opregion_get_edid() to struct drm_ed=
id
      drm/i915/panel: move panel fixed EDID to struct intel_panel

Jouni H=C3=B6gander (3):
      drm/i915/psr: Implement Wa_14015648006
      drm/i915/psr: Implement Wa_14014971492
      drm/i915/mtl: Apply Wa_14013475917 for all MTL steppings

Luca Coelho (1):
      drm/i915: update src and dst scaler limits for display ver 12 and 13

Rodrigo Vivi (1):
      drm/i915/debugfs: Get rid of single use macros.

Ville Syrj=C3=A4l=C3=A4 (24):
      drm/i915/dsb: Stop with the RMW
      drm/i915/dsb: Inline DSB_CTRL writes into intel_dsb_commit()
      drm/i915/dsb: Align DSB register writes to 8 bytes
      drm/i915/dsb: Fix DSB command buffer size checks
      drm/i915/dsb: Extract assert_dsb_has_room()
      drm/i915/dsb: Extract intel_dsb_emit()
      drm/i915/dsb: Improve the indexed reg write checks
      drm/i915/dsb: Handle the indexed vs. not inside the DSB code
      drm/i915/dsb: Introduce intel_dsb_align_tail()
      drm/i915/dsb: Allow the caller to pass in the DSB buffer size
      drm/i915/dsb: Add mode DSB opcodes
      drm/i915/audio: Don't program the hardware ELD buffer on ilk+
      drm/i915/audio: Don't program the hardware ELD buffer on hsw+
      drm/i915/audio: Introduce a struct for the acomp audio state
      drm/i915/audio: Precompute the ELD
      drm/i915/audio: Don't enable audio with bogus ELD
      drm/i915/audio: Hardware ELD readout
      drm/i915/sdvo: Precompute the ELD
      drm/i915/sdvo: Only use "presence detect" for has_audio readout
      drm/i915/sdvo: Do ELD hardware readout
      drm/i915/audio: Hook up ELD into the state checker
      drm/i915/audio: Include ELD in the state dump
      drm/i915/audio: s/ilk/ibx/
      drm/i915/audio: Clean up the PCH type checks

 drivers/gpu/drm/i915/Makefile                      |   2 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   2 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   2 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   1 +
 drivers/gpu/drm/i915/display/intel_audio.c         | 317 ++++++++-------
 drivers/gpu/drm/i915/display/intel_audio.h         |   7 +
 drivers/gpu/drm/i915/display/intel_bios.c          |  32 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   4 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   2 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  47 +--
 drivers/gpu/drm/i915/display/intel_connector.c     |   5 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   1 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  17 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   7 +
 drivers/gpu/drm/i915/display/intel_display.c       | 155 ++++----
 drivers/gpu/drm/i915/display/intel_display.h       | 115 +-----
 drivers/gpu/drm/i915/display/intel_display_core.h  |  34 +-
 .../gpu/drm/i915/display/intel_display_limits.h    | 124 ++++++
 .../gpu/drm/i915/display/intel_display_power_map.c |   1 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  13 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  90 ++++-
 drivers/gpu/drm/i915/display/intel_dmc.h           |   4 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  10 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  95 +++--
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   9 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   8 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           | 246 ++++++------
 drivers/gpu/drm/i915/display/intel_dsb.h           |   5 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  22 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  36 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  51 ++-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   4 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |  29 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  10 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |   4 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  10 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  23 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  57 ++-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  45 ++-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        | 441 +++++++++++++++++=
++++
 drivers/gpu/drm/i915/display/intel_vblank.h        |  23 ++
 drivers/gpu/drm/i915/display/intel_vga.c           |  32 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  11 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   2 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  42 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   5 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |   5 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  12 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   1 +
 drivers/gpu/drm/i915/gt/intel_rps.h                |   3 +
 drivers/gpu/drm/i915/gt/selftest_reset.c           |   2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   1 +
 drivers/gpu/drm/i915/gvt/display.c                 |   1 +
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |   2 +-
 drivers/gpu/drm/i915/i915_config.c                 |   5 +-
 drivers/gpu/drm/i915/i915_config.h                 |  23 ++
 drivers/gpu/drm/i915/i915_debugfs.c                |   6 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |  33 +-
 drivers/gpu/drm/i915/i915_driver.c                 | 145 +------
 drivers/gpu/drm/i915/i915_drv.h                    | 119 ++----
 drivers/gpu/drm/i915/i915_gem.h                    |   7 +
 drivers/gpu/drm/i915/i915_gem_gtt.h                |   2 +
 drivers/gpu/drm/i915/i915_irq.c                    | 408 -----------------=
--
 drivers/gpu/drm/i915/i915_irq.h                    |   6 -
 drivers/gpu/drm/i915/i915_params.c                 |  86 ++--
 drivers/gpu/drm/i915/i915_pci.c                    |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    |   3 +-
 drivers/gpu/drm/i915/i915_request.c                |   1 +
 drivers/gpu/drm/i915/i915_vma.c                    |   1 +
 drivers/gpu/drm/i915/intel_device_info.c           |   1 +
 drivers/gpu/drm/i915/intel_device_info.h           |   2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1 +
 drivers/gpu/drm/i915/intel_memory_region.c         |   2 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   1 +
 drivers/gpu/drm/i915/intel_pm_types.h              |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   4 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |   2 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              | 171 ++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h              |  18 +
 drivers/gpu/drm/i915/vlv_sideband.c                |   1 +
 98 files changed, 1819 insertions(+), 1498 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vblank.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_vblank.h
 create mode 100644 drivers/gpu/drm/i915/i915_config.h
 create mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.c
 create mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.h

--=20
Jani Nikula, Intel Open Source Graphics Center
