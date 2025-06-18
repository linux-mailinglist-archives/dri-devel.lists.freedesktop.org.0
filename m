Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76EBADF282
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 18:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013D510E8CF;
	Wed, 18 Jun 2025 16:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAL/Rug1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5496D10E113;
 Wed, 18 Jun 2025 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750263773; x=1781799773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q2kg5ah06aaTdtPHnTkcttInF9QGkB6CEgJi/wqL5m0=;
 b=IAL/Rug16GEtYfzijv6hX/8+SpGgm46dfAuJMb0wy4KRk4HT1T+ZaFhT
 9Z/h8Cvz/eaKhyza+WX5WiibqTvlXHwTjBE6ZJN6b6MJpUrDO+zxmq79K
 nQVscy3iItfLQ5WoVufDDTBDkP+t/gH60Qw8kY3B8aSMrah3Zq7NJ1oZG
 D1URTfABWBlMmG6WohN/XfN6n1iIcQyeHDTbqfVk4KSGzABGqyx8UJ29Z
 3e74wlSPM+CjgNknOiN+5m4LS7CardpnfXIHr8c/dYlCExdTF1UCT+MqY
 EU4rfFrlGP4SDNb4JKuscWf5w7xu9nOHm0GWOFmeo9x2Xql5sYrDirhnM A==;
X-CSE-ConnectionGUID: Uc2V8/laT7eHJ4R9Da96gg==
X-CSE-MsgGUID: B61Z9YBLTEe/ECbZnJsDnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52362584"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52362584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 09:22:52 -0700
X-CSE-ConnectionGUID: 8tkgievDR7+nSCvILAF+vg==
X-CSE-MsgGUID: i1tAqnHbQ7iwLQi1HvWmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150230242"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.161])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 09:22:46 -0700
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
Date: Wed, 18 Jun 2025 19:22:42 +0300
Message-ID: <fff9f231850ed410bd81b53de43eff0b98240d31@intel.com>
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

First i915 pull request towards v6.17.

drm-intel-next-2025-06-18:
drm/i915 feature pull for v6.17:

Features and functionality:
- Add support for DSC fractional link bpp on DP MST (Imre)
- Add support for simultaneous Panel Replay and Adaptive Sync (Jouni)
- Add support for PTL+ double buffered LUT registers (Chaitanya, Ville)
- Add PIPEDMC event handling in preparation for flip queue (Ville)

Refactoring and cleanups:
- Rename lots of DPLL interfaces to unify them (Suraj)
- Allocate struct intel_display dynamically (Jani)
- Abstract VLV IOSF sideband better (Jani)
- Use str_true_false() helper (Yumeng Fang)
- Refactor DSB code in preparation for flip queue (Ville)
- Use drm_modeset_lock_assert_held() instead of open coding (Luca)
- Remove unused arg from skl_scaler_get_filter_select() (Luca)
- Split out a separate display register header (Jani)
- Abstract DRAM detection better (Jani)
- Convert LPT/WPT SBI sideband to struct intel_display (Jani)

Fixes:
- Fix DSI HS command dispatch with forced pipeline flush (Gareth Yu)
- Fix BMG and LNL+ DP adaptive sync SDP programming (Ankit)
- Fix error path for xe display workqueue allocation (Haoxiang Li)
- Disable DP AUX access probe where not required (Imre)
- Fix DKL PHY access if the port is invalid (Luca)
- Fix PSR2_SU_STATUS access on ADL+ (Jouni)
- Add sanity checks for porch and sync on BXT/GLK DSI (Ville)

DRM core changes:
- Change AUX DPCD access probe address (Imre)
- Refactor EDID quirks, amd make them available to drivers (Imre)
- Add quirk for DPCD access probe (Imre)
- Add DPCD definitions for Panel Replay capabilities (Jouni)

Merges:
- Backmerges to sync with v6.15-rcs and v6.16-rc1 (Jani)

BR,
Jani.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
25-06-18

for you to fetch changes up to b2f7e30d2e4a34fcee8111d713bef4f29dc23c77:

  drm/i915/dsb: Disable the GOSUB interrupt (2025-06-17 19:13:58 +0300)

----------------------------------------------------------------
drm/i915 feature pull for v6.17:

Features and functionality:
- Add support for DSC fractional link bpp on DP MST (Imre)
- Add support for simultaneous Panel Replay and Adaptive Sync (Jouni)
- Add support for PTL+ double buffered LUT registers (Chaitanya, Ville)
- Add PIPEDMC event handling in preparation for flip queue (Ville)

Refactoring and cleanups:
- Rename lots of DPLL interfaces to unify them (Suraj)
- Allocate struct intel_display dynamically (Jani)
- Abstract VLV IOSF sideband better (Jani)
- Use str_true_false() helper (Yumeng Fang)
- Refactor DSB code in preparation for flip queue (Ville)
- Use drm_modeset_lock_assert_held() instead of open coding (Luca)
- Remove unused arg from skl_scaler_get_filter_select() (Luca)
- Split out a separate display register header (Jani)
- Abstract DRAM detection better (Jani)
- Convert LPT/WPT SBI sideband to struct intel_display (Jani)

Fixes:
- Fix DSI HS command dispatch with forced pipeline flush (Gareth Yu)
- Fix BMG and LNL+ DP adaptive sync SDP programming (Ankit)
- Fix error path for xe display workqueue allocation (Haoxiang Li)
- Disable DP AUX access probe where not required (Imre)
- Fix DKL PHY access if the port is invalid (Luca)
- Fix PSR2_SU_STATUS access on ADL+ (Jouni)
- Add sanity checks for porch and sync on BXT/GLK DSI (Ville)

DRM core changes:
- Change AUX DPCD access probe address (Imre)
- Refactor EDID quirks, amd make them available to drivers (Imre)
- Add quirk for DPCD access probe (Imre)
- Add DPCD definitions for Panel Replay capabilities (Jouni)

Merges:
- Backmerges to sync with v6.15-rcs and v6.16-rc1 (Jani)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP

Chaitanya Kumar Borah (7):
      drm/i915/dsb: add intel_dsb_gosub_finish()
      drm/i915/dsb: Add support for GOSUB interrupt
      drm/i915: s/dsb_color_vblank/dsb_color
      drm/i915/display: use GOSUB to program double buffered LUT registers
      drm/i915: Program DB LUT registers before vblank
      drm/i915/color: Do not pre-load LUTs with DB registers
      drm/i915: Disable updating of LUT values during vblank

Dibin Moolakadan Subrahmanian (1):
      drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup

Gareth Yu (1):
      drm/i915/dsi: Enforce pipeline flush with DSI HS transfer

Haoxiang Li (2):
      drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_w=
orkqueue()
      drm/xe/display: Add check for alloc_ordered_workqueue()

Imre Deak (21):
      drm/i915/dp: Fix determining SST/MST mode during MTP TU state computa=
tion
      drm/i915/dp_mst: Use the correct connector while computing the link B=
PP limit on MST
      drm/i915/dp_mst: Simplify handling the single-bpp case during state c=
omputation
      drm/i915/dp_mst: Validate compressed bpp vs. platform restrictions
      drm/i915/dp_mst: Update the total link slot count early
      drm/i915/dp_mst: Check BW limit on the local MST link early
      drm/i915/dp_mst: Simplify computing the min/max compressed bpp limits
      drm/i915/dp: Limit max link bpp properly to a fractional value on SST
      drm/i915/dp_mst: Add support for fractional compressed link bpps on M=
ST
      drm/i915/display: Factor out intel_display_{min, max}_pipe_bpp()
      drm/i915/dp: Export intel_dp_dsc_min_src_compressed_bpp()
      drm/i915: Add support for forcing the link bpp on a connector
      drm/i915/dp_mst: Enable fractional link bpps on MST if the bpp is for=
ced
      drm/i915/ptl: Use everywhere the correct DDI port clock select mask
      drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_C=
OUNT_ESI read
      drm/i915/dp: Fix the enabling/disabling of audio SDP splitting
      drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
      drm/edid: Define the quirks in an enum list
      drm/edid: Add support for quirks visible to DRM core and drivers
      drm/dp: Add an EDID quirk for the DPCD register access probe
      drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required

Jani Nikula (46):
      drm/i915/irq: stop using HAS_GMCH()
      drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
      drm/i915: add generic read/write functions for VLV IOSF SB
      drm/i915: rewrite VLV IOSF SB unit specific read/write functions
      drm/i915: switch i915 core to generic VLV IOSF SB functions
      drm/i915: move VLV IOSF SB unit specific helpers under display
      drm/i915: convert VLV IOSF SB interface to struct drm_device
      drm/i915: rename VLV IOSF SB ports parameter to unit_mask
      drm/i915: ensure correct VLV IOSF SB units have been get/put
      drm/i915/pps: drop dependency on intel_display_conversion.h
      drm/i915/rps: pass struct intel_display to DISPLAY_VER()
      drm/i915/display: drop unused declarations from intel_display.h
      drm/i915/gem: drop intel_display.h include
      drm/i915/display: drop unnecessary includes on i915 core headers
      Merge drm/drm-next into drm-intel-next
      drm/xe/rpm: use to_xe_device() instead of container_of
      drm/xe/display: do not reference xe->display inline
      drm/i915: do not reference i915->display inline
      drm/{i915,xe}: convert i915 and xe display members into pointers
      drm/xe/display: drop duplicate display->fb_tracking.lock init
      drm/i915/display: move hotplug.dp_wq init from xe and i915 to display
      drm/xe/display: move xe->display initialization to xe_display_probe()
      drm/xe/display: add notes about how early a few functions can be call=
ed
      drm/xe/display: use xe->display to decide whether to do anything
      drm/i915/display: allocate struct intel_display dynamically
      drm/i915: stop including display/intel_display_{core, limits}.h from =
i915_drv.h
      drm/xe: stop including intel_display_{core, device}.h from xe_device_=
types.h
      drm/i915: drop intel_dpio_phy.h include from VLV IOSF SB
      drm/i915/sbi: move intel_sbi.[ch] under display/
      drm/i915/sbi: convert intel_sbi.[ch] to struct intel_display
      drm/i915/sbi: move sbi_lock under struct intel_display
      drm/i915/de: rename timeout parameters timeout_ms to highlight unit
      drm/i915: add out_value to intel_wait_for_register_fw() and intel_de_=
wait_fw()
      drm/i915/sbi: convert to intel_de_*()
      drm/i915/sbi: split out intel_sbi_regs.h
      drm/i915/sbi: clean up SBI register macro definitions and usage
      drm/i915/bw: pass struct dram_info pointer around
      drm/i915/dram: add accessor for struct dram_info and use it
      drm/i915/wm: DG2 doesn't have dram info to look up wm_lv_0_adjust_nee=
ded
      drm/i915/dram: pass struct dram_info pointer around
      drm/i915/dram: add return value and handling to intel_dram_detect()
      drm/i915/dram: allocate struct dram_info dynamically
      Merge drm/drm-next into drm-intel-next
      drm/i915: split out display register macros to a separate file
      drm/i915/display: include intel_display_reg_defs.h from display regs =
files
      drm/i915/display: drop i915_reg.h include where possible

Jouni H=C3=B6gander (15):
      drm/i915/alpm: Make intel_alpm_enable_sink available for PSR
      drm/i915/alpm: Stop writing ALPM registers when PSR is enabled
      drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards
      drm/panelreplay: Panel Replay capability DPCD register definitions
      drm/dp: Add Panel Replay capability bits from DP2.1 specification
      drm/i915/psr: Read all Panel Replay capability registers from DPCD
      drm/i915/alpm: Add PR_ALPM_CTL register definitions
      drm/i915/alpm: Write PR_ALPM_CTL register
      drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
      drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
      drm/i915/alpm: Move port alpm configuration
      drm/i915/display: Add PHY_CMN1_CONTROL register definitions
      drm/i915/display: Add function to configure LFPS sending
      drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
      drm/i915/psr: Do not disable Panel Replay in case VRR is enabled

Luca Coelho (3):
      drm/i915/dkl: return if tc_port is invalid in dkl_phy_set_hip_idx()
      drm/i915: remove unused arg in skl_scaler_get_filter_select()
      drm/i915: use drm_modeset_lock_assert_held() in intel_connector_get_p=
ipe()

Suraj Kandpal (14):
      drm/i915/dpll: Rename intel_dpll
      drm/i915/dpll: Rename intel_dpll_funcs
      drm/i915/dpll: Rename intel_shared_dpll_state
      drm/i915/dpll: Rename macro for_each_shared_dpll
      drm/i915/dpll: Rename intel_shared_dpll_funcs
      drm/i915/dpll: Rename intel_shared_dpll
      drm/i915/dpll: Move away from using shared dpll
      drm/i915/dpll: Rename crtc_get_shared_dpll
      drm/i915/dpll: Rename intel_[enable/disable]_dpll
      drm/i915/dpll: Rename intel_unreference_dpll_crtc
      drm/i915/dpll: Rename intel_reference_dpll_crtc
      drm/i915/dpll: Rename intel_<release/reserve>_dpll
      drm/i915/dpll: Rename intel_compute_dpll
      drm/i915/dpll: Rename intel_update_active_dpll

Ville Syrj=C3=A4l=C3=A4 (20):
      drm/i915/dmc: Drop PIPEDMC faults from the fault mask on LNL+
      drm/i915/dmc: Hook up PIPEDMC interrupts
      drm/i915/dmc: Define all DMC event IDs
      drm/i915/dmc: Extract dmc_evt_ctl_disable()
      drm/i915/dmc: Relocate is_dmc_evt_{ctl,htp}_reg()
      drm/i915/dmc: Extract is_event_handler()
      drm/i915/dmc: Introduce dmc_configure_event()
      drm/i915/dsb: Extract intel_dsb_ins_align()
      drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
      drm/i915/dsb: Extract intel_dsb_{head,tail}()
      drm/i915/dsb: Implement intel_dsb_gosub()
      drm/i915: Indicate which pipe lied about its interrupts
      drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL
      drm/i915/dsi: Assert that vfp+vsync+vbp =3D=3D vtotal on BXT/GLK
      drm/i915/dsb: Use intel_dsb_ins_align() in intel_dsb_align_tail()
      drm/i915/dsb: Provide intel_dsb_head() and intel_dsb_size()
      drm/i915/dsb: Introduce intel_dsb_exec_time_us()
      drm/i915/dsb: Garbage collect the MMIO DEwake stuff
      drm/i915/dsb: Move the DSB_PMCTRL* reset out of intel_dsb_finish()
      drm/i915/dsb: Disable the GOSUB interrupt

Vivek Kasireddy (1):
      Revert "drm/xe/display: use xe->display to decide whether to do anyth=
ing"

Yumeng Fang (1):
      drm/i915/display: Use str_true_false() helper

 drivers/gpu/drm/display/drm_dp_helper.c            |   44 +-
 drivers/gpu/drm/drm_edid.c                         |  232 +-
 drivers/gpu/drm/i915/Makefile                      |    7 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    1 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    1 +
 drivers/gpu/drm/i915/display/hsw_ips.c             |    1 +
 drivers/gpu/drm/i915/display/i9xx_display_sr.c     |    2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    2 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   36 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    7 +-
 drivers/gpu/drm/i915/display/icl_dsi_regs.h        |    1 +
 drivers/gpu/drm/i915/display/intel_alpm.c          |   70 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |    4 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    1 -
 drivers/gpu/drm/i915/display/intel_backlight.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |   51 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   48 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   73 +-
 drivers/gpu/drm/i915/display/intel_color.h         |    2 +
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    3 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    1 -
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   33 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   81 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   20 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  121 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   26 +-
 .../drm/i915/display/intel_display_conversion.c    |    3 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   17 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   13 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   11 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    3 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   14 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   22 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   18 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |    4 +-
 .../drm/i915/display/intel_display_power_well.c    |   72 +-
 drivers/gpu/drm/i915/display/intel_display_regs.h  | 2935 ++++++++++++++++=
+++
 drivers/gpu/drm/i915/display/intel_display_reset.c |    1 +
 drivers/gpu/drm/i915/display/intel_display_rpm.c   |    1 +
 drivers/gpu/drm/i915/display/intel_display_rps.c   |    4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   18 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    1 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h  |    2 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |  162 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    2 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  299 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   76 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    7 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   94 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  203 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  197 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  539 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   80 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  248 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    9 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |    2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_encoder.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    1 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |    1 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |    1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_gmbus_regs.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    1 +
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    7 +
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    1 +
 drivers/gpu/drm/i915/display/intel_hti_regs.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |  239 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    2 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   11 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    4 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    1 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |    2 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   21 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  154 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    1 +
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    1 +
 drivers/gpu/drm/i915/display/intel_pps_regs.h      |   15 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   79 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    2 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   10 +
 drivers/gpu/drm/i915/display/intel_sbi.c           |   90 +
 drivers/gpu/drm/i915/display/intel_sbi.h           |   27 +
 drivers/gpu/drm/i915/display/intel_sbi_regs.h      |   65 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    1 +
 drivers/gpu/drm/i915/display/intel_tv.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    1 -
 drivers/gpu/drm/i915/display/intel_vrr.c           |   25 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      |    6 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   19 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    5 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   17 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   36 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   46 +-
 drivers/gpu/drm/i915/display/vlv_sideband.c        |   50 +
 drivers/gpu/drm/i915/display/vlv_sideband.h        |  156 ++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    1 -
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |    2 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    8 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    4 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   62 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    8 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   12 +-
 drivers/gpu/drm/i915/gvt/display.h                 |   13 -
 drivers/gpu/drm/i915/gvt/edid.c                    |    1 +
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    8 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   40 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |    1 +
 drivers/gpu/drm/i915/gvt/mmio.c                    |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   75 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   34 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    2 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  156 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 2963 ----------------=
----
 drivers/gpu/drm/i915/i915_switcheroo.c             |    2 +
 drivers/gpu/drm/i915/intel_clock_gating.c          |    6 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    3 +
 drivers/gpu/drm/i915/intel_sbi.c                   |   94 -
 drivers/gpu/drm/i915/intel_sbi.h                   |   27 -
 drivers/gpu/drm/i915/intel_uncore.c                |    8 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    5 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   12 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   87 +-
 drivers/gpu/drm/i915/soc/intel_dram.h              |   26 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |    2 +
 .../gpu/drm/i915/{vlv_sideband.c =3D> vlv_iosf_sb.c} |  190 +-
 drivers/gpu/drm/i915/vlv_iosf_sb.h                 |   37 +
 .../i915/{vlv_sideband_reg.h =3D> vlv_iosf_sb_reg.h} |    6 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |  125 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |    5 +-
 .../gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h   |   42 +
 .../{vlv_sideband_reg.h =3D> vlv_iosf_sb_reg.h}      |    2 +-
 .../gpu/drm/xe/compat-i915-headers/vlv_sideband.h  |  132 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |    1 +
 drivers/gpu/drm/xe/display/xe_display.c            |   99 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    4 -
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |    4 +-
 drivers/gpu/drm/xe/display/xe_display_wa.c         |    2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |    6 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    3 +-
 drivers/gpu/drm/xe/display/xe_tdf.c                |    4 +-
 drivers/gpu/drm/xe/xe_device.c                     |    4 -
 drivers/gpu/drm/xe/xe_device_types.h               |   29 +-
 include/drm/display/drm_dp.h                       |   22 +-
 include/drm/display/drm_dp_helper.h                |    6 +
 include/drm/drm_connector.h                        |    4 +-
 include/drm/drm_edid.h                             |    8 +
 187 files changed, 6326 insertions(+), 5217 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_sbi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sbi.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_sbi_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_sideband.c
 create mode 100644 drivers/gpu/drm/i915/display/vlv_sideband.h
 delete mode 100644 drivers/gpu/drm/i915/intel_sbi.c
 delete mode 100644 drivers/gpu/drm/i915/intel_sbi.h
 rename drivers/gpu/drm/i915/{vlv_sideband.c =3D> vlv_iosf_sb.c} (54%)
 create mode 100644 drivers/gpu/drm/i915/vlv_iosf_sb.h
 rename drivers/gpu/drm/i915/{vlv_sideband_reg.h =3D> vlv_iosf_sb_reg.h} (9=
8%)
 delete mode 100644 drivers/gpu/drm/i915/vlv_sideband.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_iosf_sb.h
 rename drivers/gpu/drm/xe/compat-i915-headers/{vlv_sideband_reg.h =3D> vlv=
_iosf_sb_reg.h} (66%)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h

--=20
Jani Nikula, Intel
