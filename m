Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04C3E5C35
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 15:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750089F33;
	Tue, 10 Aug 2021 13:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161F389F33;
 Tue, 10 Aug 2021 13:52:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="194494942"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="194494942"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 06:52:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="526153354"
Received: from aktiwary-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.249.40.8])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 06:52:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org, 
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 10 Aug 2021 16:51:58 +0300
Message-ID: <87a6lpo1a9.fsf@intel.com>
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


Hi Dave & Daniel -

drm-intel-next-2021-08-10-1:
drm/i915 changes for v5.15:

Features:
- Basic DG2 platform enabling (Matt, Animesh, Gwan-gyeong, Jos=C3=A9)
- Add PSF GV point support for display bandwidth calculation (Stan)
- Add platform release id version support (Lucas)
- Add support for forcing DSC BPP for testing (Vandita, Patnana)

Refactoring and cleanups:
- Remove CNL support completely (Lucas)
- Revid/stepping cleanup (Matt, Anusha)
- Make display stepping check upper bounds exclusive (Matt)
- Remove old GEN macros (Lucas)
- Refactor DG1 interrupt handler (Paulo)
- Refactor DMC stepping info (Anusha)

Fixes:
- Fix XELPD color capability reporting; it's not yet enabled (Uma)
- Fix DG1 memory bandwidth computation (Clint)
- Fix mux on certain HP laptops (Kai-Heng)
- Various display workarounds (Jos=C3=A9, Matt, Imre)
- Fix error state dumps wrt SFC_DONE (Matt)
- Fix DG1 and XEPLD audio power domains (Anshuman)
- Fix ADL-P and ADL-S ddi buf translation tables (Matt)
- Fix DP/HDMI modeset sequences causing issues on ADL-P (Jos=C3=A9)
- PSR2 fixes (Jos=C3=A9)
- Fix DP MST modeset with FEC on TGL+
- Fix MBUS DBOX A credits on ADL-P (Jos=C3=A9)
- Fix DP PHY test training set programming (Khaled)
- Fix dgfx pcode uncore init done wait (Badal)
- Fix DSC disable fuse check on GLK (Lucas)
- Fix shared dpll mismatch for bigjoiner secondary pipe (Manasi)
- Fix ADL-P underrun recovery (Matt)
- Fix permissions on FEC support debugfs file (Vandita)

Misc:
- Backmerge drm-next (Rodrigo)
- Bump RKL and TGL DMC firmware version (Anusha)

BR,
Jani.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-08-1=
0-1

for you to fetch changes up to 3bfa7d40ce736ffbbfe07127061f54b359ee2b12:

  drm/i915/dg2: Add support for new DG2-G11 revid 0x5 (2021-08-06 09:03:10 =
-0700)

----------------------------------------------------------------
drm/i915 changes for v5.15:

Features:
- Basic DG2 platform enabling (Matt, Animesh, Gwan-gyeong, Jos=C3=A9)
- Add PSF GV point support for display bandwidth calculation (Stan)
- Add platform release id version support (Lucas)
- Add support for forcing DSC BPP for testing (Vandita, Patnana)

Refactoring and cleanups:
- Remove CNL support completely (Lucas)
- Revid/stepping cleanup (Matt, Anusha)
- Make display stepping check upper bounds exclusive (Matt)
- Remove old GEN macros (Lucas)
- Refactor DG1 interrupt handler (Paulo)
- Refactor DMC stepping info (Anusha)

Fixes:
- Fix XELPD color capability reporting; it's not yet enabled (Uma)
- Fix DG1 memory bandwidth computation (Clint)
- Fix mux on certain HP laptops (Kai-Heng)
- Various display workarounds (Jos=C3=A9, Matt, Imre)
- Fix error state dumps wrt SFC_DONE (Matt)
- Fix DG1 and XEPLD audio power domains (Anshuman)
- Fix ADL-P and ADL-S ddi buf translation tables (Matt)
- Fix DP/HDMI modeset sequences causing issues on ADL-P (Jos=C3=A9)
- PSR2 fixes (Jos=C3=A9)
- Fix DP MST modeset with FEC on TGL+
- Fix MBUS DBOX A credits on ADL-P (Jos=C3=A9)
- Fix DP PHY test training set programming (Khaled)
- Fix dgfx pcode uncore init done wait (Badal)
- Fix DSC disable fuse check on GLK (Lucas)
- Fix shared dpll mismatch for bigjoiner secondary pipe (Manasi)
- Fix ADL-P underrun recovery (Matt)
- Fix permissions on FEC support debugfs file (Vandita)

Misc:
- Backmerge drm-next (Rodrigo)
- Bump RKL and TGL DMC firmware version (Anusha)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/dg2: Update to bigjoiner path

Anshuman Gupta (2):
      drm/i915/debugfs: DISPLAY_VER 13 lpsp capability
      drm/i915/dg1: Adjust the AUDIO power domain

Anusha Srivatsa (5):
      drm/i915/step: s/<platform>_revid_tbl/<platform>_revids
      drm/i915/step: Add macro magic for handling steps
      drm/i915/dmc: Change intel_get_stepping_info()
      drm/i915/firmware: Update to DMC v2.12 on TGL
      drm/i915/firmware: Update to DMC v2.03 on RKL

Badal Nilawar (1):
      drm/i915: dgfx cards need to wait on pcode's uncore init done

Clint Taylor (1):
      drm/i915/dg1: Compute MEM Bandwidth using MCHBAR

Gwan-gyeong Mun (1):
      drm/i915/dg2: Update lane disable power state during PSR

Imre Deak (2):
      drm/i915/adlp: Add workaround to disable CMTG clock gating
      drm/i915: Apply CMTG clock disabling WA while DPLL0 is enabled

Jani Nikula (1):
      drm/i915/plane: add intel_plane_helper_add() helper

Jos=C3=A9 Roberto de Souza (10):
      drm/i915/display: Settle on "adl-x" in WA comments
      drm/i915: Limit Wa_22010178259 to affected platforms
      drm/i915/display/xelpd: Extend Wa_14011508470
      drm/i915/display/adl_p: Implement PSR changes
      drm/i915/display: Disable FBC when PSR2 is enabled display 12 and new=
er
      drm/i915/dg2: Add DG2 to the PSR2 defeature list
      drm/i915/display/psr2: Mark as updated all planes that intersect with=
 pipe_clip
      drm/i915/display/psr2: Fix cursor updates using legacy apis
      drm/i915/display: Disable audio, DRRS and PSR before planes
      drm/i915/display/adl_p: Correctly program MBUS DBOX A credits

Kai-Heng Feng (1):
      drm/i915: Invoke another _DSM to enable MUX on HP Workstation laptops

Khaled Almahallawy (1):
      drm/i915/dp: DPTX writes Swing/Pre-emphs(DPCD 0x103-0x106) requested =
during PHY Layer testing

Lucas De Marchi (33):
      drm/i915: do not abbreviate version in debugfs
      drm/i915: Add release id version
      drm/i915: do not abbreviate version in debugfs
      drm/i915: Add release id version
      drm/i915: Add XE_HP initial definitions
      drm/i915/xehpsdv: add initial XeHP SDV definitions
      drm/i915: fix not reading DSC disable fuse in GLK
      drm/i915/display: split DISPLAY_VER 9 and 10 in intel_setup_outputs()
      drm/i915/display: remove PORT_F workaround for CNL
      drm/i915/display: remove explicit CNL handling from intel_cdclk.c
      drm/i915/display: remove explicit CNL handling from intel_color.c
      drm/i915/display: remove explicit CNL handling from intel_combo_phy.c
      drm/i915/display: remove explicit CNL handling from intel_crtc.c
      drm/i915/display: remove explicit CNL handling from intel_ddi.c
      drm/i915/display: remove explicit CNL handling from intel_display_deb=
ugfs.c
      drm/i915/display: remove explicit CNL handling from intel_dmc.c
      drm/i915/display: remove explicit CNL handling from intel_dp.c
      drm/i915/display: remove explicit CNL handling from intel_dpll_mgr.c
      drm/i915/display: remove explicit CNL handling from intel_vdsc.c
      drm/i915/display: remove explicit CNL handling from skl_universal_pla=
ne.c
      drm/i915/display: remove explicit CNL handling from intel_display_pow=
er.c
      drm/i915/display: remove CNL ddi buf translation tables
      drm/i915/display: rename CNL references in skl_scaler.c
      drm/i915: remove explicit CNL handling from i915_irq.c
      drm/i915: remove explicit CNL handling from intel_pm.c
      drm/i915: remove explicit CNL handling from intel_pch.c
      drm/i915: remove explicit CNL handling from intel_wopcm.c
      drm/i915: rename CNL references in intel_dram.c
      drm/i915: replace random CNL comments
      drm/i915: switch num_scalers/num_sprites to consider DISPLAY_VER
      drm/i915: remove GRAPHICS_VER =3D=3D 10
      drm/i915: rename/remove CNL registers
      drm/i915: finish removal of CNL

Manasi Navare (1):
      drm/i915/display: Fix shared dpll mismatch for bigjoiner slave

Matt Roper (40):
      drm/i915: Handle cdclk crawling flag in standard manner
      drm/i915: Make pre-production detection use direct revid comparison
      drm/i915/skl: Use revid->stepping tables
      drm/i915/kbl: Drop pre-production revision from stepping table
      drm/i915/bxt: Use revid->stepping tables
      drm/i915/glk: Use revid->stepping tables
      drm/i915/icl: Use revid->stepping tables
      drm/i915/jsl_ehl: Use revid->stepping tables
      drm/i915/rkl: Use revid->stepping tables
      drm/i915/dg1: Use revid->stepping tables
      drm/i915/cnl: Drop all workarounds
      drm/i915/icl: Drop workarounds that only apply to pre-production step=
pings
      Merge branch 'topic/revid_steppings' into drm-intel-next
      drm/i915/adl_s: Wa_14011765242 is also needed on A1 display stepping
      drm/i915/rkl: Wa_1409767108 also applies to RKL
      drm/i915/rkl: Wa_1408330847 no longer applies to RKL
      drm/i915: Make display workaround upper bounds exclusive
      drm/i915/dg2: add DG2 platform info
      Merge branch 'topic/xehp-dg2-definitions-2021-07-21' into drm-intel-n=
ext
      drm/i915/dg2: Add fake PCH
      drm/i915/dg2: Add cdclk table and reference clock
      drm/i915/dg2: Skip shared DPLL handling
      drm/i915/dg2: Don't wait for AUX power well enable ACKs
      drm/i915/dg2: Setup display outputs
      drm/i915/dg2: Add dbuf programming
      drm/i915/dg2: Don't program BW_BUDDY registers
      drm/i915/dg2: Don't read DRAM info
      drm/i915/dg2: DG2 has fixed memory bandwidth
      drm/i915/dg2: Classify DG2 PHY types
      drm/i915: Program chicken bit during DP MST sequence on TGL+
      drm/i915/adl_p: Allow underrun recovery when possible
      drm/i915/adl_s: Update ddi buf translation tables
      drm/i915/adl_p: Add ddi buf translation tables for combo PHY
      drm/i915/dg2: Add MPLLB programming for SNPS PHY
      drm/i915/dg2: Add MPLLB programming for HDMI
      drm/i915/dg2: Add vswing programming for SNPS phys
      drm/i915/dg2: Update modeset sequences
      drm/i915/dg2: Wait for SNPS PHY calibration during display init
      drm/i915: Correct SFC_DONE register offset
      drm/i915/dg2: Add support for new DG2-G11 revid 0x5

Patnana Venkata Sai (1):
      drm/i915/display/dsc: Add Per connector debugfs node for DSC BPP enab=
le

Paulo Zanoni (1):
      drm/i915: Fork DG1 interrupt handler

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-intel-next
      drm/i915/bios: Fix ports mask

Stanislav Lisovskiy (2):
      drm/i915: Extend QGV point restrict mask to 0x3
      drm/i915: Implement PSF GV point support

Uma Shankar (1):
      drm/i915/display/xelpd: Fix incorrect color capability reporting

Vandita Kulkarni (2):
      drm/i915/display: Add write permissions for fec support
      drm/i915/display/dsc: Force dsc BPP

 drivers/gpu/drm/i915/Makefile                      |    1 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   46 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   19 +
 drivers/gpu/drm/i915/display/intel_acpi.h          |    3 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    7 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |    3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   11 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  178 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  107 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    5 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  106 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   12 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  630 +++--
 drivers/gpu/drm/i915/display/intel_ddi.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 2475 +++++++++++-----=
----
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |   70 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  371 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |    1 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  118 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  568 ++---
 drivers/gpu/drm/i915/display/intel_display_power.h |   15 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   32 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  232 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |   23 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   65 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    1 -
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   43 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  627 ++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  219 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   96 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   25 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   53 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    3 +
 drivers/gpu/drm/i915/display/intel_psr.c           |  265 ++-
 drivers/gpu/drm/i915/display/intel_quirks.c        |   34 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |  862 +++++++
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |   35 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   34 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |    2 +
 drivers/gpu/drm/i915/display/intel_tv.c            |   13 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    3 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   49 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   28 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   13 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    1 -
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  111 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    8 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   17 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  165 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  170 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  138 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   22 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  404 ++--
 drivers/gpu/drm/i915/intel_device_info.c           |   43 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   16 +-
 drivers/gpu/drm/i915/intel_dram.c                  |   42 +-
 drivers/gpu/drm/i915/intel_pch.c                   |    8 +-
 drivers/gpu/drm/i915/intel_pch.h                   |    2 +
 drivers/gpu/drm/i915/intel_pm.c                    |  284 ++-
 drivers/gpu/drm/i915/intel_sideband.c              |   13 +-
 drivers/gpu/drm/i915/intel_sideband.h              |    2 +-
 drivers/gpu/drm/i915/intel_step.c                  |  149 +-
 drivers/gpu/drm/i915/intel_step.h                  |   33 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    2 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |   10 +-
 79 files changed, 5320 insertions(+), 3886 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy.h

--=20
Jani Nikula, Intel Open Source Graphics Center
