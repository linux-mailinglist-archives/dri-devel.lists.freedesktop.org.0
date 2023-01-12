Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E26671A7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70F310E8CC;
	Thu, 12 Jan 2023 12:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF90C10E2E6;
 Thu, 12 Jan 2023 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673525227; x=1705061227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P5CJ1lM0G4OeIrOSY3kHZGIlftBaqz7yL+pMvXbYbE4=;
 b=aT73vUuzqZnxo8Vu0+0ZjCZW75MzAcK7uPNS5PDwq7jv139DsiM8mJkp
 B58d4G9+97KzjgVGzgALz1vbdmfsKlxpau04yWNUah9WK+t0gVyvS08Yr
 Drt0iVtAa1r/R/DcLuSlmXJK4kSSUXS6qbww1B/SwXhGAkSoI/vv037g2
 ++l5uINN+1E5WCAPMSmXPJVIy3/D6mwq2edLr6l0j+92XEdfF94nTeEsF
 PfjTrA7RIEMq9WDUkgLRTGL/Sw99pyCN5RlmY7wOn72NND1jClc3hTbPX
 HV6nXUik9cF+mEOs91pkDeoS1fA4/7ZnSYD2nSlPZfzfBvIqIlkr5RWp0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323748222"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="323748222"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 04:07:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="721084666"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="721084666"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 04:06:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 12 Jan 2023 14:06:55 +0200
Message-ID: <87tu0wez34.fsf@intel.com>
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

Here's the first i915 feature pull towards v6.3.

drm-intel-next-2023-01-12:
drm/i915 feature pull #1 for v6.3:

Features and functionality:
- Meteorlake display enabling (Animesh, Luca, Stan, Jouni, Anusha)
- DP MST DSC support (Stan)
- Gamma/degamma readout support for the state checker (Ville)
- Enable SDP split support for DP 2.0 (Vinod)
- Add probe blocking support to i915.force_probe parameter (Rodrigo)
- Enable Xe HP 4tile support (Jonathan)

Refactoring and cleanups:
- Color refactoring, especially related to DSB usage (Ville)
- DSB refactoring (Ville)
- DVO refactoring (Ville)
- Backlight register and logging cleanups (Jani)
- Avoid display direct calls to uncore (Maarten, Jani)
- Add new "soc" sub-directory (Jani)
- Refactor DSC platform support checks (Swati)

Fixes:
- Interlace modes are no longer supported starting at display version 12 (A=
nkit)
- Use polling read for aux control (Arun)
- DMC firmware no longer requires specific versions (Gustavo)
- Fix PSR flickering and freeze issues (Jouni)
- Fix ICL+ DSI GPIO handling (Jani)
- Ratelimit errors in display engine irqs (Lucas)
- Fix DP MST DSC bpp and timeslot calculations (Stan)
- Fix CDCLK squash and crawl sequences (Ville, Anusha)
- Fix bigjoiner checks for fused pipes (Ville)
- Fix ADP+ degamma LUT size (Ville)
- Fix DVO ch7xxx and sil164 suspend/resume (Ville)
- Fix memory leak in VBT parsing (Xia Fukun)
- Fix VBT packet port selection for dual link DSI (Mikko Kovanen)
- Fix SDP infoframe product string for discrete graphics (Clint)
- Fix VLV/CHV HDMI/DP audio enable (Ville)
- Fix VRR delays and calculations (Ville)
- No longer disable transcoder for PHY test pattern change (Khaled)
- Fix dual PPS handling (Ville)
- Fix timeout and wait for DDI BUF CTL active after enabling (Ankit)

Merges:
- Backmerge drm-next to sync up with v6.2-rc1 (Jani)

BR,
Jani.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-01-12

for you to fetch changes up to f71c9b7bc35ff7c1fb68d114903876eec658439b:

  drm/i915/display: Prune Interlace modes for Display >=3D12 (2023-01-12 12=
:46:12 +0530)

----------------------------------------------------------------
drm/i915 feature pull #1 for v6.3:

Features and functionality:
- Meteorlake display enabling (Animesh, Luca, Stan, Jouni, Anusha)
- DP MST DSC support (Stan)
- Gamma/degamma readout support for the state checker (Ville)
- Enable SDP split support for DP 2.0 (Vinod)
- Add probe blocking support to i915.force_probe parameter (Rodrigo)
- Enable Xe HP 4tile support (Jonathan)

Refactoring and cleanups:
- Color refactoring, especially related to DSB usage (Ville)
- DSB refactoring (Ville)
- DVO refactoring (Ville)
- Backlight register and logging cleanups (Jani)
- Avoid display direct calls to uncore (Maarten, Jani)
- Add new "soc" sub-directory (Jani)
- Refactor DSC platform support checks (Swati)

Fixes:
- Interlace modes are no longer supported starting at display version 12 (A=
nkit)
- Use polling read for aux control (Arun)
- DMC firmware no longer requires specific versions (Gustavo)
- Fix PSR flickering and freeze issues (Jouni)
- Fix ICL+ DSI GPIO handling (Jani)
- Ratelimit errors in display engine irqs (Lucas)
- Fix DP MST DSC bpp and timeslot calculations (Stan)
- Fix CDCLK squash and crawl sequences (Ville, Anusha)
- Fix bigjoiner checks for fused pipes (Ville)
- Fix ADP+ degamma LUT size (Ville)
- Fix DVO ch7xxx and sil164 suspend/resume (Ville)
- Fix memory leak in VBT parsing (Xia Fukun)
- Fix VBT packet port selection for dual link DSI (Mikko Kovanen)
- Fix SDP infoframe product string for discrete graphics (Clint)
- Fix VLV/CHV HDMI/DP audio enable (Ville)
- Fix VRR delays and calculations (Ville)
- No longer disable transcoder for PHY test pattern change (Khaled)
- Fix dual PPS handling (Ville)
- Fix timeout and wait for DDI BUF CTL active after enabling (Ankit)

Merges:
- Backmerge drm-next to sync up with v6.2-rc1 (Jani)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/mtl: update scaler source and destination limits for MTL

Ankit Nautiyal (4):
      drm/i915/ddi: Align timeout for DDI_BUF_CTL active with Bspec
      drm/i915/ddi: Add missing wait-for-active for HDMI aligning with bspe=
c updates
      drm/i915/display: Drop check for doublescan mode in modevalid
      drm/i915/display: Prune Interlace modes for Display >=3D12

Anusha Srivatsa (3):
      drm/i915/display: Add missing checks for cdclk crawling
      drm/i915/display: Add CDCLK Support for MTL
      drm/i915/display: Add missing CDCLK Squash support for MTL

Arun R Murthy (1):
      drm/i915/dp: change aux_ctl reg read to polling read

Gustavo Sousa (2):
      drm/i915/dmc: Update DG2 DMC version to v2.08
      drm/i915/dmc: Do not require specific versions

Jani Nikula (22):
      drm/i915/hti: avoid theoretically possible negative shift
      drm/i915/fbc: drop uncore locking around i8xx/i965 fbc nuke
      drm/i915/backlight: use VLV_DISPLAY_BASE for VLV/CHV backlight regist=
ers
      drm/i915/backlight: drop DISPLAY_MMIO_BASE() use from backlight regis=
ters
      drm/i915/backlight: mass rename dev_priv to i915
      drm/i915/backlight: drop drm_device local variables in favor of i915
      drm/i915/backlight: convert DRM_DEBUG_KMS() to drm_dbg_kms()
      drm/i915/de: return the old register value from intel_de_rmw()
      drm/i915/crt: drop a bunch of unnecessary register variables
      drm/i915/crt: switch to intel_de_* register accessors in display code
      drm/i915/power: switch to intel_de_* register accessors in display co=
de
      drm/i915/dmc: switch to intel_de_* register accessors in display code
      drm/i915/dp-aux: switch to intel_de_* register accessors in display c=
ode
      drm/i915/gmbus: switch to intel_de_* register accessors in display co=
de
      drm/i915/wm: switch to intel_de_* register accessors in display code
      drm/i915/snps: switch to intel_de_* register accessors in display code
      drm/i915/tc: switch to intel_de_* register accessors in display code
      drm/i915/display: no need for gt/gen8_ppgtt.h
      drm/i915: add new "soc" sub-directory and move PCH and DRAM code there
      drm/i915/dsi: add support for ICL+ native MIPI GPIO sequence
      drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index
      Merge drm/drm-next into drm-intel-next

Jonathan Cavitt (1):
      drm/i915: Enable XE_HP 4Tile support

Jouni H=C3=B6gander (2):
      drm/i915/mtl: Initial display workarounds
      drm/i915/psr: Add continuous full frame bit together with single

Khaled Almahallawy (1):
      drm/i915/display: Don't disable DDI/Transcoder when setting phy test =
pattern

Luca Coelho (1):
      drm/i915/mtl: limit second scaler vertical scaling in ver >=3D 14

Lucas De Marchi (2):
      drm/i915: ratelimit errors in display engine irq
      drm/i915: Remove __maybe_unused from mtl_info

Maarten Lankhorst (1):
      drm/i915/de: Add more macros to remove all direct calls to uncore

Miaoqian Lin (1):
      drm/i915: Fix documentation for intel_uncore_forcewake_put__locked

Mikko Kovanen (1):
      drm/i915/dsi: fix VBT send packet port selection for dual link DSI

Nirmoy Das (1):
      drm/i915: Update docs in intel_wakeref.h

Rodrigo Vivi (1):
      drm/i915: Expand force_probe to block probe of devices as well.

Stanislav Lisovskiy (8):
      drm: Add missing DP DSC extended capability definitions.
      drm/i915: Fix intel_dp_mst_compute_link_config
      drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate fun=
ction
      drm/i915: Add DSC support to MST path
      drm/i915: Extract VESA DSC bpp alignment to separate function
      drm/i915: Bpp/timeslot calculation fixes for DP MST DSC
      drm/i915/mtl: Add support of Tile4 to MTL
      drm/i915: Fix timeslots argument for DP DSC SST case

Swati Sharma (1):
      drm/i915/dsc: Refactor dsc gen checks

Taylor, Clinton A (1):
      drm/i915/hdmi: SPD infoframe update for discrete

Ville Syrj=C3=A4l=C3=A4 (61):
      drm/i915/dvo: Remove unused panel_wants_dither
      drm/i915/dvo: Don't leak connector state on DVO init failure
      drm/i915/dvo: Actually initialize the DVO encoder type
      drm/i915/dvo: Introduce intel_dvo_connector_type()
      drm/i915/dvo: Eliminate useless 'port' variable
      drm/i915/dvo: Flatten intel_dvo_init()
      drm/i915/dvo: s/intel_encoder/encoder/ etc.
      drm/i915/dvo: s/dev_priv/i915/
      drm/i915/dvo: Use per device debugs
      drm/i915/display: Do both crawl and squash when changing cdclk
      drm/i915: Remove non-existent pipes from bigjoiner pipe mask
      drm/i915: Fix adl+ degamma LUT size
      drm/i915: s/gamma/post_csc_lut/
      drm/i915: Add glk+ degamma readout
      drm/i915: Read out CHV CGM degamma
      drm/i915: Add gamma/degamma readout for bdw+
      drm/i915: Add gamma/degamma readout for ivb/hsw
      drm/i915: Make ilk_read_luts() capable of degamma readout
      drm/i915: Prep for C8 palette readout
      drm/i915: Make .read_luts() mandatory
      drm/i915: Finish the LUT state checker
      drm/i915: Rework legacy LUT handling
      drm/i915: Use hw degamma LUT for sw gamma on glk with YCbCr output
      drm/i915: Use gamma LUT for RGB limited range compression
      drm/i915: Add 10bit gamma mode for gen2/3
      drm/i915/dvo/ch7xxx: Fix suspend/resume
      drm/i915/dvo/sil164: Nuke pointless return statements
      drm/i915/dvo/sil164: Fix suspend/resume
      drm/i915/dvo: Parametrize DVO/DVO_SRCDIM registers
      drm/i915/dvo: Define a few more DVO register bits
      drm/i915/dvo: Rename the "active data order" bits
      drm/i915/dvo: Use REG_BIT() & co. for DVO registers
      drm/i915/dvo: Use intel_de_rmw() for DVO enable/disable
      drm/i915/dvo: Extract intel_dvo_regs.h
      drm/i915/dvo: Log about what was detected on which DVO port
      drm/i915: Fix VLV/CHV HDMI/DP audio enable
      drm/i915/vrr: Make registers latch in a consitent place on icl/tgl
      drm/i915/vrr: Fix guardband/vblank exit length calculation for adl+
      drm/i915/vrr: Reorder transcoder vs. vrr enable/disable
      drm/i915/vrr: Be more careful with the bits in TRANS_VRR_CTL
      drm/i915: Introduce intel_panel_init_alloc()
      drm/i915: Do panel VBT init early if the VBT declares an explicit pan=
el type
      drm/i915: Generalize the PPS vlv_pipe_check() stuff
      drm/i915: Try to use the correct power sequencer intiially on bxt/glk
      drm/i915: Extend dual PPS handlind for ICP+
      drm/i915: Reject unusable power sequencers
      drm/i915: Print the PPS registers using consistent format
      drm/i915: Fix whitespace
      drm/i915: Improve PPS debugs
      drm/i915: Shorten GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED a bit
      drm/i915: Clean up GAMMA_MODE defines
      drm/i915: Define skl+ palette anti-collision bit
      drm/i915: Clean up various indexed LUT registers
      drm/i915: Standardize auto-increment LUT load procedure
      drm/i915: Document LUT "max" register precision
      drm/i915: Move the DSB->mmio fallback into the LUT code
      drm/i915: Move the DSB setup/cleaup into the color code
      drm/i915: Make DSB lower level
      drm/i915: Disable DSB usage specifically for LUTs
      Revert "drm/i915: Disable DSB usage for now"
      drm/i915: Use ilk_lut_write*() for all ilk+ gamma modes

Vinod Govindapillai (1):
      drm/i915: Enable SDP split for DP2.0

Xia Fukun (1):
      drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs

 drivers/gpu/drm/i915/Kconfig                       |   15 +-
 drivers/gpu/drm/i915/Makefile                      |    7 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |   22 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |   13 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   85 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   11 +
 drivers/gpu/drm/i915/display/intel_audio.h         |    2 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |  539 ++++-----
 .../gpu/drm/i915/display/intel_backlight_regs.h    |   27 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   56 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   11 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  216 +++-
 drivers/gpu/drm/i915/display/intel_color.c         | 1276 ++++++++++++++++=
----
 drivers/gpu/drm/i915/display/intel_color.h         |   10 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   53 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   26 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   39 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   60 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    8 +
 drivers/gpu/drm/i915/display/intel_display_power.c |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   26 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   45 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    1 -
 drivers/gpu/drm/i915/display/intel_dp.c            |  215 ++--
 drivers/gpu/drm/i915/display/intel_dp.h            |   19 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   41 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  235 +++-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   98 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   13 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   94 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |  410 ++++---
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    7 +-
 drivers/gpu/drm/i915/display/intel_dvo_regs.h      |   54 +
 drivers/gpu/drm/i915/display/intel_fb.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   46 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   21 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |    3 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    9 +
 drivers/gpu/drm/i915/display/intel_panel.h         |    1 +
 drivers/gpu/drm/i915/display/intel_pps.c           |  360 ++++--
 drivers/gpu/drm/i915/display/intel_pps.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   44 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   15 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   55 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   11 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   55 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   40 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   42 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |    3 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    8 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   31 +-
 drivers/gpu/drm/i915/i915_params.c                 |    2 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   51 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  101 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   21 +-
 drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.c        |    0
 drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.h        |    0
 drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.c         |    0
 drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.h         |    0
 include/drm/display/drm_dp.h                       |    9 +-
 66 files changed, 3211 insertions(+), 1479 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dvo_regs.h
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.c (100%)
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_dram.h (100%)
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.c (100%)
 rename drivers/gpu/drm/i915/{ =3D> soc}/intel_pch.h (100%)

--=20
Jani Nikula, Intel Open Source Graphics Center
