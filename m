Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED223BF7B3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 11:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B1B6E18F;
	Thu,  8 Jul 2021 09:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C218C6E18F;
 Thu,  8 Jul 2021 09:39:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="295114354"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="295114354"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 02:39:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="487485638"
Received: from victorge-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 02:39:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-next for v5.15
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 08 Jul 2021 12:39:47 +0300
Message-ID: <878s2h6t5o.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

I'll be out for a bit, so I'm sending the first batch of changes for
v5.15 early. Nothing unusual here, I just don't want to have a huge pile
waiting. :)

Rodrigo will cover me.


BR,
Jani.


drm-intel-next-2021-07-08:
drm/i915 changes for v5.15:

Features:
- Enable pipe DMC loading on XE-LPD and ADL-P (Anusha)
- Finally remove JSH and EHL force probe requirement (Tejas)

Refactoring and cleanups:
- Refactor and fix DDI buffer translations (Ville)
- Clean up FBC CFB allocation code (Ville, with a fix from Matthew)
- Finish INTEL_GEN() and friends macro conversions (Lucas)
- Misc display cleanups (Ville)

Fixes:
- PSR fixes and ADL-P workarounds (Jos=C3=A9)
- Fix drm infoframe state mismatch (Bhanuprakash)
- Force Type-C PHY disconnect during suspend/shutdown (Imre)
- Fix power sequence violation on some Chromebook models (Shawn)
- Fix VGA workaround to avoid screen flicker at boot (Emil)
- Fix display 12+ watermark workaround adjustment (Lucas)

Misc:
- Backmerge drm-next (Jani)

BR,
Jani.

The following changes since commit 8a02ea42bc1d4c448caf1bab0e05899dad503f74:

  Merge tag 'drm-intel-next-fixes-2021-06-29' of git://anongit.freedesktop.=
org/drm/drm-intel into drm-next (2021-06-30 15:42:05 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-07-08

for you to fetch changes up to cd5606aa39925ad4483e96abffc9cc62bb36c640:

  gpu/drm/i915: nuke old GEN macros (2021-07-07 16:36:32 -0700)

----------------------------------------------------------------
drm/i915 changes for v5.15:

Features:
- Enable pipe DMC loading on XE-LPD and ADL-P (Anusha)
- Finally remove JSH and EHL force probe requirement (Tejas)

Refactoring and cleanups:
- Refactor and fix DDI buffer translations (Ville)
- Clean up FBC CFB allocation code (Ville, with a fix from Matthew)
- Finish INTEL_GEN() and friends macro conversions (Lucas)
- Misc display cleanups (Ville)

Fixes:
- PSR fixes and ADL-P workarounds (Jos=C3=A9)
- Fix drm infoframe state mismatch (Bhanuprakash)
- Force Type-C PHY disconnect during suspend/shutdown (Imre)
- Fix power sequence violation on some Chromebook models (Shawn)
- Fix VGA workaround to avoid screen flicker at boot (Emil)
- Fix display 12+ watermark workaround adjustment (Lucas)

Misc:
- Backmerge drm-next (Jani)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915/hdcp: Nuke Platform check for mst hdcp init

Anusha Srivatsa (4):
      drm/i915/dmc: Introduce DMC_FW_MAIN
      drm/i915/xelpd: Pipe A DMC plugging
      drm/i915/adl_p: Pipe B DMC Support
      drm/i915/adl_p: Load DMC

Bhanuprakash Modem (1):
      drm/i915/display: Fix state mismatch in drm infoframe

Emil Velikov (1):
      drm/i915: apply WaEnableVGAAccessThroughIOPort as needed

Imre Deak (1):
      drm/i915: Force a TypeC PHY disconnect during suspend/shutdown

Jani Nikula (2):
      drm/i915/dsc: abstract helpers to get bigjoiner primary/secondary crtc
      Merge drm/drm-next into drm-intel-next

Jos=C3=A9 Roberto de Souza (7):
      Revert "drm/i915/display: Drop FIXME about turn off infoframes"
      drm/i915/display/psr: Handle SU Y granularity
      drm/i915/display/adl_p: Implement Wa_22012278275
      drm/i915/display/adl_p: Implement Wa_16011168373
      drm/i915/xelpd: Handle PSR2 SDP indication in the prior scanline
      drm/i915/display/adl_p: Implement Wa_16011303918
      drm/i915/display/dg1: Correctly map DPLLs during state readout

Kees Cook (1):
      drm/i915/display: Do not zero past infoframes.vsc

Lee Shawn C (1):
      drm/i915: keep backlight_enable on until turn eDP display off

Lucas De Marchi (5):
      drm/i915/xelpd: break feature inheritance
      drm/i915/display: fix level 0 adjustement on display ver >=3D 12
      drm/i915/display: use max_level to control loop
      drm/i915: finish INTEL_GEN and friends conversion
      gpu/drm/i915: nuke old GEN macros

Matthew Auld (1):
      drm/i915/display: check if compressed_llb was allocated

Tejas Upadhyay (3):
      drm/i915/jsl: Add W/A 1409054076 for JSL
      drm/i915/jsl: Remove require_force_probe protection
      drm/i915/ehl: Remove require_force_probe protection

Ville Syrj=C3=A4l=C3=A4 (32):
      drm/i915: s/intel/hsw/ for hsw/bdw/skl buf trans
      drm/i915: Introduce hsw_get_buf_trans()
      drm/i915: Wrap the platform specific buf trans structs into a union
      drm/i915: Rename dkl phy buf trans tables
      drm/i915: Wrap the buf trans tables into a struct
      drm/i915: Introduce intel_get_buf_trans()
      drm/i915; Return the whole buf_trans struct from get_buf_trans()
      drm/i915: Store the HDMI default entry in the bug trans struct
      drm/i915: Introduce encoder->get_buf_trans()
      drm/i915: Clean up hsw/bdw/skl/kbl buf trans funcs
      drm/i915: Introduce rkl_get_combo_buf_trans()
      drm/i915: Fix dg1 buf trans tables
      drm/i915: Deduplicate icl DP HBR2 vs. eDP HBR3 table
      drm/i915: Fix ehl edp hbr2 vswing table
      drm/i915: Clean up jsl/ehl buf trans functions
      drm/i915: Nuke buf_trans hdmi functions
      drm/i915: Add the missing adls vswing tables
      drm/i915/fbc: s/threshold/limit/
      drm/i915/fbc: Extract intel_fbc_program_cfb()
      drm/i915/fbc: Embed the compressed_llb node
      drm/i915/fbc: Don't pass around the mm node
      drm/i915/fbc: Handle 16bpp compression limit better
      drm/i915/fbc: Introduce g4x_dpfc_ctl_limit()
      drm/i915/fbc: Extract intel_fbc_stolen_end()
      drm/i915/fbc: Make the cfb allocation loop a bit more legible
      drm/i915/fbc: Allocate llb before cfb
      drm/i915: Stop hand rolling drm_crtc_mask()
      drm/i915: Clean up intel_get_load_detect_pipe() a bit
      drm/i915: Clean up intel_find_initial_plane_obj() a bit
      drm/i915: Clean up pre-skl wm calling convention
      drm/i915: Clean up intel_fbdev_init_bios() a bit
      drm/i915: s/intel_crtc/crtc/

 drivers/gpu/drm/i915/display/icl_dsi.c             |   46 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |    8 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  229 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 2461 +++++++++++-----=
----
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |   68 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  168 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   35 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    5 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   10 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  165 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |   23 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   12 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   15 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  215 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   96 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   25 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   42 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  203 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |   34 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   34 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |    2 +
 drivers/gpu/drm/i915/display/intel_tv.c            |   13 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    3 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   27 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   13 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   27 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   22 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   52 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   21 +-
 drivers/gpu/drm/i915/intel_dram.c                  |    3 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  119 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    2 +-
 37 files changed, 2424 insertions(+), 1791 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
