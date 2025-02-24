Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27047A41FBA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 13:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ABA10E273;
	Mon, 24 Feb 2025 12:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZqny0kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1DA10E273;
 Mon, 24 Feb 2025 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740401799; x=1771937799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DsZ3YiMcbiErhjH2qjp6Omdi7x4kOKfqY3p5K6+BvOk=;
 b=lZqny0kxkDrmvBvIoqbe8HT/hXp3fL+h8GMvzZ5SdO+dQZPz8Tm+IXBN
 pKuOQLypOymse3hJgWgEu5nNtM1KOwwrEEotI9302TPYtMBXRGYYykk+b
 EVrZ/qcVfgLEsXiY5w8sgvEM7RUJ3fNz7V24QSgeuDKAmZZBDCCnHpxCd
 E4PjWze1RfvMxG/FknTDUwNBiAmpTS6p1LWDGMJoVaEOVgAqC6lrybnGN
 +VN9FVqbaCIVfXRTbQGRPZXQXfjrMXCUVJJ1w1/O6UNqQSG2zIrP10g8F
 28V4mTYuVEV/22bCgEKsCnjVKAnsFHbIKPGJjMWa7CeJk8qIHtZWajmb/ Q==;
X-CSE-ConnectionGUID: hnNDk7flQResJO986kDOWA==
X-CSE-MsgGUID: tOo6BcgGQySu0QnmSr01Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51782043"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51782043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:56:38 -0800
X-CSE-ConnectionGUID: vYyuYc8sR5K9JRMfNpOY4A==
X-CSE-MsgGUID: JsmmLFdtSxqwqBJys1Lz7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120961761"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:56:32 -0800
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
Date: Mon, 24 Feb 2025 14:56:28 +0200
Message-ID: <87h64j7b7n.fsf@intel.com>
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

The first i915 pull request towards v6.15, admittedly later than I'd
hoped, and thus also quite big in one go. On the plus side, the next one
is going to be smaller...

The vast majority of changes is display, and I don't expect this trend
to change. Increasingly, the i915 core changes will be about separating
display from it.


BR,
Jani.


drm-intel-next-2025-02-24:
drm/i915 feature pull for v6.15:

Features and functionality:
- Enable DP 128b/132b SST DSC (Jani, Imre)
- Allow DSB to perform commits when VRR is enabled (Ville)
- Compute HDMI PLLs for SNPS/C10 PHYs for rates not in fixed tables (Ankit)
- Allow DSB usage when PSR is enabled on LNL+ (Jouni)
- Enable Panel Replay mode change without full modeset (Jouni)
- Enable async flips with compressed buffers on ICL+ (Ville)
- Support luminance based brightness control via DPCD for eDP (Suraj)
- Enable VRR enable/disable without full modeset (Mitul, Ankit)
- Add debugfs facility for force testing HDCP 1.4 (Suraj)
- Add scaler tracepoints, improve plane tracepoints (Ville)
- Improve DMC wakelock debugging facilities (Gustavo)
- Allow GuC SLPC default strategies on MTL+ for performance (Rodrigo)
- Provide more information on display faults (Ville)

Refactoring and cleanups:
- Continue conversions to struct intel_display (Ville, Jani, Suraj, Imre)
- Joiner and Y plane reorganization (Ville)
- Move HDCP debugfs to intel_hdcp.c (Jani)
- Clean up and unify LSPCON interfaces (Jani)
- Move code out of intel_display.c to reduce its size (Ville)
- Clean up and simplify DDI port enabling/disabling (Imre)
- Make LPT LP a dedicated PCH type, refactor (Jani)
- Simplify DSC range BPG offset calculation (Ankit)
- Scaler cleanups (Ville)
- Remove unused code from GVT (David Alan Gilbert)
- Improve plane debugging (Ville)
- DSB and VRR refactoring (Ville)

Fixes:
- Check if vblank is sufficient for DSC prefill and scaler (Mitul)
- Fix Mesa clear color alignment regression (Ville)
- Add missing TC DP PHY lane stagger delay (Imre)
- Fix DSB + VRR usage for PTL+ (Ville)
- Improve robustness of display VT-d workarounds (Ville)
- Fix platforms for dbuf tracker state service programming (Ravi)
- Fix DMC wakelock support conditions (Gustavo)
- Amend DMC wakelock register ranges (Gustavo)
- Disable the Common Primary Timing Generator (CMTG) (Gustavo)
- Enable C20 PHY SSC (Suraj)
- Add workaround for DKL PHY DP mode write (Nemesa)
- Fix build warnings on clamp() usage (Guenter Roeck, Ankit)
- Fix error handling while adding a connector (Imre)
- Avoid full modeset at probe on vblank delay mismatches (Ville)
- Fix encoder HDMI check for HDCP line rekeying (Suraj)
- Fix HDCP repeater authentication during topology change (Suraj)
- Handle display PHY power state reset for power savings (Mika)
- Fix typos all over the place (Nitin)
- Update HDMI TMDS C20 parameters for various platforms (Dnyaneshwar)
- Guarantee a minimum hblank time for 128b/132b and 8b/10b MST (Arun, Imre)
- Do not hardcode LSPCON settle timeout (Giedrius Statkevi=C4=8Dius)

Xe driver changes:
- Re-use display vmas when possible (Maarten)
- Remove double pageflip (Maarten)
- Enable DP tunneling (Imre)
- Separate i915 and xe tracepoints (Ville)

DRM core changes:
- Increase DPCD eDP display control CAP size to 5 bytes (Suraj)
- Add DPCD eDP version 1.5 definition (Suraj)
- Add timeout parameter to drm_lspcon_set_mode() (Giedrius Statkevi=C4=8Diu=
s)

Merges:
- Backmerge drm-next (Jani)

BR,
Jani.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
25-02-24

for you to fetch changes up to 5b99dd12fe53c745b40191b9e7fe9a25653b4e7a:

  drm/i915/hdcp: Create force_hdcp14 debug fs entry (2025-02-20 12:47:57 +0=
530)

----------------------------------------------------------------
drm/i915 feature pull for v6.15:

Features and functionality:
- Enable DP 128b/132b SST DSC (Jani, Imre)
- Allow DSB to perform commits when VRR is enabled (Ville)
- Compute HDMI PLLs for SNPS/C10 PHYs for rates not in fixed tables (Ankit)
- Allow DSB usage when PSR is enabled on LNL+ (Jouni)
- Enable Panel Replay mode change without full modeset (Jouni)
- Enable async flips with compressed buffers on ICL+ (Ville)
- Support luminance based brightness control via DPCD for eDP (Suraj)
- Enable VRR enable/disable without full modeset (Mitul, Ankit)
- Add debugfs facility for force testing HDCP 1.4 (Suraj)
- Add scaler tracepoints, improve plane tracepoints (Ville)
- Improve DMC wakelock debugging facilities (Gustavo)
- Allow GuC SLPC default strategies on MTL+ for performance (Rodrigo)
- Provide more information on display faults (Ville)

Refactoring and cleanups:
- Continue conversions to struct intel_display (Ville, Jani, Suraj, Imre)
- Joiner and Y plane reorganization (Ville)
- Move HDCP debugfs to intel_hdcp.c (Jani)
- Clean up and unify LSPCON interfaces (Jani)
- Move code out of intel_display.c to reduce its size (Ville)
- Clean up and simplify DDI port enabling/disabling (Imre)
- Make LPT LP a dedicated PCH type, refactor (Jani)
- Simplify DSC range BPG offset calculation (Ankit)
- Scaler cleanups (Ville)
- Remove unused code from GVT (David Alan Gilbert)
- Improve plane debugging (Ville)
- DSB and VRR refactoring (Ville)

Fixes:
- Check if vblank is sufficient for DSC prefill and scaler (Mitul)
- Fix Mesa clear color alignment regression (Ville)
- Add missing TC DP PHY lane stagger delay (Imre)
- Fix DSB + VRR usage for PTL+ (Ville)
- Improve robustness of display VT-d workarounds (Ville)
- Fix platforms for dbuf tracker state service programming (Ravi)
- Fix DMC wakelock support conditions (Gustavo)
- Amend DMC wakelock register ranges (Gustavo)
- Disable the Common Primary Timing Generator (CMTG) (Gustavo)
- Enable C20 PHY SSC (Suraj)
- Add workaround for DKL PHY DP mode write (Nemesa)
- Fix build warnings on clamp() usage (Guenter Roeck, Ankit)
- Fix error handling while adding a connector (Imre)
- Avoid full modeset at probe on vblank delay mismatches (Ville)
- Fix encoder HDMI check for HDCP line rekeying (Suraj)
- Fix HDCP repeater authentication during topology change (Suraj)
- Handle display PHY power state reset for power savings (Mika)
- Fix typos all over the place (Nitin)
- Update HDMI TMDS C20 parameters for various platforms (Dnyaneshwar)
- Guarantee a minimum hblank time for 128b/132b and 8b/10b MST (Arun, Imre)
- Do not hardcode LSPCON settle timeout (Giedrius Statkevi=C4=8Dius)

Xe driver changes:
- Re-use display vmas when possible (Maarten)
- Remove double pageflip (Maarten)
- Enable DP tunneling (Imre)
- Separate i915 and xe tracepoints (Ville)

DRM core changes:
- Increase DPCD eDP display control CAP size to 5 bytes (Suraj)
- Add DPCD eDP version 1.5 definition (Suraj)
- Add timeout parameter to drm_lspcon_set_mode() (Giedrius Statkevi=C4=8Diu=
s)

Merges:
- Backmerge drm-next (Jani)

----------------------------------------------------------------
Ankit Nautiyal (10):
      drm/i915/dsc: Use helper to calculate range_bpg_offset
      drm/i915/dsc: Remove old comment about DSC 444 support
      drm/i915/dp: Correct max compressed bpp bounds by using link bpp
      drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2
      drm/i915/snps_phy: Use HDMI PLL algorithm for DG2
      drm/i915/cx0_phy_regs: Add C10 registers bits
      drm/i915/intel_snps_hdmi_pll: Compute C10 HDMI PLLs with algorithm
      drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY
      drm/i915/dp: fix the Adaptive sync Operation mode for SDP
      drm/i915/dp: Return min bpc supported by source instead of 0

Arun R Murthy (1):
      drm/i915/dp: Guarantee a minimum HBlank time

Dnyaneshwar Bhadane (2):
      drm/i915/display: Add MTL subplatforms definition
      drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value

Dr. David Alan Gilbert (3):
      drm/i915/gvt: Remove intel_gvt_ggtt_h2g<->index
      drm/i915/gvt: Remove unused intel_vgpu_decode_sprite_plane
      drm/i915/gvt: Remove unused intel_gvt_in_force_nonpriv_whitelist

Giedrius Statkevi=C4=8Dius (1):
      drm/i915/lspcon: do not hardcode settle timeout

Guenter Roeck (1):
      drm/i915/backlight: Return immediately when scale() finds invalid par=
ameters

Gustavo Sousa (10):
      drm/i915/dmc_wl: Use enum values for enable_dmc_wl
      drm/i915/dmc_wl: Show description string for enable_dmc_wl
      drm/i915/dmc_wl: Allow enable_dmc_wl=3D2 to mean "match any register"
      drm/i915/dmc_wl: Allow enable_dmc_wl=3D3 to mean "always locked"
      drm/i915/display: Use display MMIO functions in intel_display_irq.c
      drm/i915/display: Wrap IRQ-specific uncore functions
      drm/i915/dmc_wl: Track pipe interrupt registers
      drm/i915/cmtg: Disable the CMTG
      drm/i915/dmc_wl: Track INITIATE_PM_DMD_REQ for DC5
      drm/i915/dmc_wl: Do not check for DMC payload

Imre Deak (22):
      drm/xe/dp: Enable DP tunneling
      drm/xe/dp: Fix non-display builds with DP tunnelling incorrectly enab=
led
      drm/i915/dp_mst: Fix error handling while adding a connector
      drm/i915/dp_mst: Use intel_connector vs. drm_connector pointer in int=
el_dp_mst.c
      drm/i915/dp_mst: Simplify using to_intel_display() passing it an inte=
l_connector pointer
      drm/i915/dp_mst: Simplify getting a drm_device pointer needed by to_i=
915()
      drm/i915/dp_mst: Use intel_display::platform.alderlake_p instead of I=
S_ALDERLAKE_P()
      drm/i915/dp_mst: Fix getting display pointer in intel_dp_mst_compute_=
min_hblank()
      drm/i915/dp_mst: Fix disabling the minimum HBlank time
      drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
      drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
      drm/i915/ddi: Make all the PORT_WIDTH macros work the same way
      drm/i915/ddi: Set missing TC DP PHY lane stagger delay in DDI_BUF_CTL
      drm/i915/ddi: Simplify the port enabling via DDI_BUF_CTL
      drm/i915/ddi: Simplify the port disabling via DDI_BUF_CTL
      drm/i915/ddi: Simplify waiting for a port to get active/idle via DDI_=
BUF_CTL
      drm/i915/ddi: Move platform checks within mtl_ddi_enable/disable_d2d_=
link()
      drm/i915/ddi: Unify the platform specific functions disabling a port
      drm/i915/ddi: Add a helper to enable a port
      drm/i915/ddi: Sanitize DDI_BUF_CTL register definitions
      drm/i915/dp: Fix error handling during 128b/132b link training
      drm/i915/dp: Fix disabling the transcoder function in 128b/132b mode

Jani Nikula (60):
      drm/i915/gvt: store virtual_dp_monitor_edid in rodata
      drm/i915/audio: convert to struct intel_display
      drm/i915/audio: convert LPE audio to struct intel_display
      drm/i915/audio: rename function prefixes from i915 to intel
      drm/i915/dp: constify struct link_config_limits pointers
      drm/i915/dp: change the order of intel_dp_mtp_tu_compute_config() par=
ams
      drm/i915/mst: change where lane_count and port_clock are set
      drm/i915/mst: handle mst pbn_div in intel_dp_mtp_tu_compute_config()
      drm/i915/mst: remove unnecessary mst_stream_find_vcpi_slots_for_bpp()
      drm/i915/mst: use min_array() and max_array() instead of hand-rolling
      drm/i915/dp: Iterate DSC BPP from high to low on all platforms
      drm/i915/dp: Add intel_dp_dsc_bpp_step_x16() helper to get DSC BPP pr=
ecision
      drm/i915/dp: Rename some variables in xelpd_dsc_compute_link_config()
      drm/i915/dp: Pass .4 BPP values to {icl,xelpd}_dsc_compute_link_confi=
g()
      drm/i915/dp: Move max DSC BPP reduction one level higher
      drm/i915/dp: Change icl_dsc_compute_link_config() DSC BPP iteration
      drm/i915/dp: Move force_dsc_fractional_bpp_en check to intel_dp_dsc_v=
alid_bpp()
      drm/i915/dp: Unify DSC link config functions
      drm/i915/dp: Inline do_dsc_compute_compressed_bpp()
      drm/i915/dp: Simplify input BPP checks in intel_dp_dsc_compute_pipe_b=
pp()
      drm/i915/dp: Use int for compressed BPP in dsc_compute_link_config()
      drm/i915/dp: Drop compute_pipe_bpp parameter from intel_dp_dsc_comput=
e_config()
      drm/i915/dp: Pass connector state all the way to dsc_compute_link_con=
fig()
      drm/i915/mst: Convert intel_dp_mtp_tu_compute_config() to .4 format
      drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake
      drm/i915/dp: Fix potential infinite loop in 128b/132b SST
      drm/i915/dp: Add support for DP UHBR SST DSC
      Merge drm/drm-next into drm-intel-next
      drm/i915/hdmi: move declarations for hsw_read/write_infoframe() to th=
e right place
      drm/i915/lspcon: add intel_lspcon_active() and use it
      drm/i915/lspcon: change signature of lspcon_detect_hdr_capability()
      drm/i915/lspcon: change signature of lspcon_wait_pcon_mode()
      drm/i915/lspcon: remove dp_to_lspcon(), hide enc_to_intel_lspcon()
      drm/i915/lspcon: rename interfaces to intel_lspcon_* to unify
      drm/i915/display: convert intel_ddi_buf_trans.c to struct intel_displ=
ay
      drm/i915/cdclk: switch to new platform checks
      drm/i915/cx0: convert to struct intel_display based platform checks
      drm/i915/backlight: convert to use struct intel_display
      drm/i915/psr: clarify intel_psr_pre_plane_update() conditions
      drm/i915/hdcp: Move HDCP debugfs to intel_hdcp.c
      drm/i915/hdcp: rename intel_connector to connector
      drm/i915/hdcp: Convert platform checks to use display->platform
      drm/i915/hdcp: Make some functions static
      drm/i915/pch: Make LPT LP a dedicated PCH type
      drm/i915/pch: Hide PCH device IDs
      drm/i915/pch: Remove unused i915->pch_id
      drm/i915/dp: convert g4x_dp.[ch] to struct intel display
      drm/i915/hdmi: convert g4x_hdmi.[ch] to struct intel_display
      drm/i915/ips: convert hsw_ips.c to struct intel_display
      drm/i915/display: convert assert_transcoder*() to struct intel_display
      drm/i915/display: convert assert_port_valid() to struct intel_display
      drm/i915/hpd: drop dev_priv parameter from intel_hpd_pin_default()
      drm/i915/display: convert intel_set_{cpu,pch}_fifo_underrun_reporting=
() to intel_display
      drm/i915/sdvo: convert intel_sdvo.[ch] to struct intel_display
      drm/i915/display: convert intel_cpu_transcoder_mode_valid() to intel_=
display
      drm/i915/display: convert intel_mode_valid_max_plane_size() to intel_=
display
      drm/i915/dsi: convert platform checks to display->platform.<platform>=
 style
      drm/i915/combo-phy: convert intel_combo_phy.[ch] to struct intel_disp=
lay
      drm/i915/display: convert intel_fifo_underrun.[ch] to struct intel_di=
splay
      drm/i915/display: convert i915_pipestat_enable_mask() to struct intel=
_display

Jouni H=C3=B6gander (18):
      drm/i915/psr: Add new function for writing sink panel replay enable b=
it
      drm/i915/psr: Enable Panel Replay on sink always when it's supported
      drm/i915/psr: Make intel_psr_enable_sink as local static function
      drm/i915/psr: Allow changing Panel Replay mode without full modeset
      drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send full update
      drm/i915/psr: Rename psr_force_hw_tracking_exit as intel_psr_force_up=
date
      drm/i915/psr: Split setting sff and cff bits away from intel_psr_forc=
e_update
      drm/i915/psr: Add register definitions for SFF_CTL and CFF_CTL regist=
ers
      drm/i915/psr: Use SFF_CTL on invalidate/flush for LunarLake onwards
      drm/i915/psr: Allow writing PSR2_MAN_TRK_CTL using DSB
      drm/i915/psr: Write PSR2_MAN_TRK_CTL on DSB commit as well
      drm/i915/display: Warn on use_dsb in non-dsb pipe update functions
      drm/i915/psr: Remove DSB_SKIP_WAITS_EN chicken bit
      drm/i915/display: Evade scanline 0 as well if PSR1 or PSR2 is enabled
      drm/i915/psr: Add function for triggering "Frame Change" event
      drm/i915/display: Ensure we have "Frame Change" event in DSB commit
      drm/i915/psr: Allow DSB usage when PSR is enabled
      drm/i915/psr: Fix drm_WARN_ON in intel_psr_disable

Maarten Lankhorst (2):
      drm/xe/display: Re-use display vmas when possible
      drm/xe: Remove double pageflip

Mika Kahola (2):
      drm/i915/display: Drop crtc_state from C10/C20 pll programming
      drm/i915/display: Allow display PHYs to reset power state

Mitul Golani (14):
      drm/i915/scaler: Add and compute scaling factors
      drm/i915/scaler: Use crtc_state to setup plane or pipe scaler
      drm/i915/scaler: Refactor max_scale computation
      drm/i915/scaler: Compute scaling factors for pipe scaler
      drm/i915/scaler: Limit pipe scaler downscaling factors for YUV420
      drm/i915/scaler: Check if vblank is sufficient for scaler
      drm/i915/dsc: Check if vblank is sufficient for dsc prefill
      drm/i915/vrr: Add crtc_state dump for vrr.vsync params
      drm/i915/vrr: Compute vrr.vsync_{start, end} during full modeset
      drm/i915/dp: Compute as_sdp.vtotal based on vrr timings
      drm/i915/dp: Compute as_sdp based on if vrr possible
      drm/i915/display: Move as sdp params change to fastset
      drm/i915/display: Skip state checker for AS SDP infoframe enable
      Revert "drm/i915/dp: Compute as_sdp based on if vrr possible"

Nemesa Garg (1):
      drm/i915/display: Add WA_14018221282

Nitin Gote (8):
      drm/i915/gt: fix typos in i915/gt files.
      drm/i915/gvt: fix typos in i915/gvt files
      drm/i915/gem: fix typos in i915/gem files
      drm/i915/pxp: fix typos in i915/pxp files
      drm/i915/selftests: fix typos in i915/selftests files
      drm/i915/soc: fix typos in i915/soc files
      drm/i915/display: fix typos in i915/display files
      drm/i915: fix typos in drm/i915 files

Ravi Kumar Vodapalli (1):
      drm/i915/display: Update DBUF_TRACKER_STATE_SERVICE only on appropria=
te platforms

Rodrigo Vivi (2):
      drm/i915/guc/slpc: Allow GuC SLPC default strategies on MTL+
      drm/i915/guc/slpc: Print more SLPC debug status information

Suraj Kandpal (20):
      drm/i915/hdcp: Fix Repeater authentication during topology change
      drm/i915/hdcp: Use correct function to check if encoder is HDMI
      drm/i915/cx0: Set ssc_enabled for c20 too
      drm/dp: Add eDP 1.5 bit definition
      drm/dp: Increase eDP display control capability size
      drm/i915/backlight: Use proper interface based on eDP version
      drm/i915/backlight: Check Luminance based brightness control for VESA
      drm/i915/backlight: Modify function to get VESA brightness in Nits
      drm/i915/backlight: Add function to change brightness in nits for VESA
      drm/i915/backlight: Setup nits based luminance via VESA
      drm/i915/backlight: Enable nits based luminance
      drm/i915: Use intel_display wherever possible
      drm/i915/dpll: Change param to intel_display in for_each_shared_dpll
      drm/i915/dpll: Use intel_display for dpll dump and compare hw state
      drm/i915/dpll: Use intel_display possible in shared_dpll_mgr hooks
      drm/i915/dpll: Use intel_display for asserting pll
      drm/i915/dpll: Use intel_display for update_refclk hook
      drm/i915/dpll: Accept intel_display as argument for shared_dpll_init
      drm/i915/dpll: Replace all other leftover drm_i915_private
      drm/i915/hdcp: Create force_hdcp14 debug fs entry

Ville Syrj=C3=A4l=C3=A4 (106):
      drm/i915/scaler: Extract skl_scaler_min_src_size()
      drm/i915/scaler: Extract skl_scaler_max_src_size()
      drm/i915/scaler: Extract skl_scaler_min_dst_size()
      drm/i915/scaler: Extract skl_scaler_max_dst_size()
      drm/i915/scaler: Nuke redundant code
      drm/i915/scaler: Pimp scaler debugs
      drm/i915/scaler: s/excdeed/exceed/
      drm/i915/scaler: Add scaler tracepoints
      drm/i915/fb: Relax clear color alignment to 64 bytes
      drm/i915/fb: Add debug spew for misaligned CC plane
      drm/i915/fb: Check that the clear color fits within the BO
      drm/i915: Extract intel_crtc_vblank_delay()
      drm/i915: Check vblank delay validity
      drm/i915: Fix include order
      drm/i915: Introduce intel_vrr_{vmin,vmax}_vtotal()
      drm/i915: Move framestart/etc. state dump to a better spot
      drm/i915: Include the vblank delay in the state dump
      drm/i915/vrr: Improve VRR state dump
      drm/i915: Include the scanline offset in the state dump
      drm/i915: Extract intel_mode_vblank_delay()
      drm/i915: Consolidate intel_pre_commit_crtc_state()
      drm/i915: Extract intel_crtc_active_timings()
      drm/i915/vrr: Introduce intel_vrr_vblank_delay()
      drm/i915/vrr: Drop the extra vmin adjustment for ADL+
      drm/i915/vrr: Fix vmin/vmax/flipline on TGL when using vblank delay
      drm/i915/vrr: Add extra vblank delay to estimates
      drm/i915/vrr: Plumb the DSB into intel_vrr_send_push()
      drm/i915: Allow async flips with render compression on TGL+
      drm/i915: Allow async flips with compression on ICL
      drm/i915: Introduce plane->can_async_flip()
      drm/i915: Use plane->can_async_flip() for alignment exceptions
      drm/i915: Reuse vlv_primary_min_alignment() for sprites as well
      drm/i915: Disable scanout VT-d workaround for TGL+
      drm/i915: Nuke ADL pre-production Wa_22011186057
      drm/i915: Relocate xe AUX hack
      drm/i915: Carve up skl_get_plane_caps()
      drm/i915: Keep TRANS_VBLANK.vblank_start=3D=3D0 on ADL+ even when doi=
ng LRR updates
      drm/i915: Handle interlaced modes in intel_set_transcoder_timings_lrr=
()
      drm/i915: Update TRANS_SET_CONTEXT_LATENCY during LRR updates
      drm/i915: Warn if someone tries to use intel_set_transcoder_timings*(=
) on DSI outputs
      drm/i915: Extract lrr_params_changed()
      drm/i915: Allow fastboot to fix up the vblank delay
      drm/i915/dsb: Add support for triggering VRR push with DSB
      drm/i915/dsb: Allow DSB to perform commits when VRR is enabled
      drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
      drm/i915: Drop the extra "plane" from tracepoints
      drm/i915: Pass the plane state explicitly to tracepoints
      drm/i915: Include pixel format in plane tracepoints
      drm/i915: Give i915 and xe each their own display tracepoints
      drm/i915: Move VT-d alignment into plane->min_alignment()
      drm/i915: Use more optimal VTd alignment for planes
      drm/i915: Calculate the VT-d guard size in the display code
      drm/i915: Use per-plane VT-d guard numbers
      drm/i915/fbdev: Use fb->normal_view.gtt
      drm/i915: Pass intel_display to intel_scanout_needs_vtd_wa()
      drm/i915: Decouple i915_gem_dumb_create() from the display a bit
      drm/i915: Decouple intel_fb_bo.h interfaces from driver specific types
      drm/i915: Convert intel_crtc.c to struct intel_display
      drm/i915: Convert intel_fb.c to struct intel_display
      drm/i915: Convert intel_display_power_{get,put}*() to intel_display
      drm/i915: Convert i9xx_plane.c to struct intel_display
      drm/i915: Finish intel_sprite.c struct intel_display conversion
      drm/i915: Convert intel_cursor.c to struct intel_display
      drm/i915: Convert skl_univeral_plane.c to struct intel_display
      drm/i915: Use DRM_RECT_FMT & co. for plane debugs
      drm/i915: Pimp plane debugs
      drm/i915: Fix CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dn build
      drm/i915: Continue intel_display_power struct intel_display conversion
      drm/i915/dsb: Move the +1 usec adjustment into dsb_wait_usec()
      drm/i915/vrr: Don't send push for legacy cursor updates
      drm/i915/vrr: Account for TRANS_PUSH delay
      drm/i915/dsb: Compute use_dsb earlier
      drm/i915/dsb: Introduce intel_dsb_poll()
      drm/i915/vrr: Reorder the DSB "wait for safe window" vs. TRANS_PUSH
      drm/i915/vrr: Check that the push send bit is clear after delayed vbl=
ank
      drm/i915/dsb: Decode DSB error interrupts
      drm/i915: Make sure all planes in use by the joiner have their crtc i=
ncluded
      Revert "drm/i915: Fix NULL ptr deref by checking new_crtc_state"
      drm/i915: Rework joiner and Y plane dependency handling
      drm/i915: s/planar_slave/is_y_plane/
      drm/i915: Extract unlink_nv12_plane()
      drm/i915: Remove pointless visible check in unlink_nv12_plane()
      drm/i915: Extract link_nv12_planes()
      drm/i915: Rename the variables in icl_check_nv12_planes()
      drm/i915: Move icl+ nv12 plane register mangling into skl_universal_p=
lane.c
      drm/i915: Relocate intel_atomic_check_planes()
      drm/i915: Move modeset_retry stuff into intel_connector.c
      drm/i915: Always initialize connector->modeset_retry_work
      drm/i915: Extract intel_connector_cancel_modeset_retry_work()
      drm/i915: Extract intel_hdcp_cancel_works()
      drm/i915: Move intel_hpd_poll_fini() into intel_hotplug.c
      drm/i915: Move intel_plane_destroy() into intel_atomic_plane.c
      drm/i915: Relocate vlv_wait_port_ready()
      drm/i915: Simplify vlv_wait_port_ready() arguments
      drm/i915: Relocate intel_plane_uses_fence()
      drm/i915: Relocate intel_{rotation,remapped}_info_size()
      drm/i915: Relocate some other plane fb related stuff into intel_fb.c
      drm/i915: s/state/plane_state/
      drm/i915: Add missing else to the if ladder in missing else
      drm/i915: Introduce a minimal plane error state
      drm/i915: Pimp display fault reporting
      drm/i915: Hook in display GTT faults for IVB/HSW
      drm/i915: Hook in display GTT faults for ILK/SNB
      drm/i915: Introduce i915_error_regs
      drm/i915: Un-invert {i9xx,i965}_error_mask()
      drm/i915: Hook up display fault interrupts for VLV/CHV

Zhenyu Wang (1):
      MAINTAINERS: switch my mail address for GVT driver

 MAINTAINERS                                        |    2 +-
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c  |    4 +-
 drivers/gpu/drm/i915/Makefile                      |    2 +
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |    2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |  112 +--
 drivers/gpu/drm/i915/display/g4x_dp.h              |   14 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  170 ++--
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |    6 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   26 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  372 ++++---
 drivers/gpu/drm/i915/display/i9xx_plane.h          |   10 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    6 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   40 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  352 ++++++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |    7 +
 drivers/gpu/drm/i915/display/intel_audio.c         |  498 +++++-----
 drivers/gpu/drm/i915/display/intel_audio.h         |   14 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |  501 +++++-----
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  174 ++--
 drivers/gpu/drm/i915/display/intel_cmtg.c          |  189 ++++
 drivers/gpu/drm/i915/display/intel_cmtg.h          |   13 +
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h     |   21 +
 drivers/gpu/drm/i915/display/intel_color.c         |   11 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  180 ++--
 drivers/gpu/drm/i915/display/intel_combo_phy.h     |    8 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   42 +
 drivers/gpu/drm/i915/display/intel_connector.h     |    2 +
 drivers/gpu/drm/i915/display/intel_crt.c           |   43 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   78 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |    7 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   28 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  212 ++--
 drivers/gpu/drm/i915/display/intel_cursor.h        |    4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  299 ++++--
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   33 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  496 +++++-----
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   58 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  922 ++++++-----------
 drivers/gpu/drm/i915/display/intel_display.h       |   33 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  261 ++---
 .../gpu/drm/i915/display/intel_display_device.c    |   13 +
 .../gpu/drm/i915/display/intel_display_device.h    |   13 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   16 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  789 +++++++++++----
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    8 +-
 .../gpu/drm/i915/display/intel_display_params.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  129 +--
 drivers/gpu/drm/i915/display/intel_display_power.h |   71 +-
 .../drm/i915/display/intel_display_power_well.c    |   19 +-
 .../drm/i915/display/intel_display_power_well.h    |    4 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    2 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |  150 ++-
 drivers/gpu/drm/i915/display/intel_display_types.h |   45 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |   54 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |    9 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    7 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |   76 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  330 +++----
 drivers/gpu/drm/i915/display/intel_dp.h            |    5 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    5 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  181 +++-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   19 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  393 ++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |    5 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   36 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |    6 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |   41 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    5 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 1044 ++++++++++------=
----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   29 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  126 ++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    3 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |    8 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    8 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  410 +++++---
 drivers/gpu/drm/i915/display/intel_fb.h            |   31 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |   18 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |    8 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   23 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |    4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   12 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |    8 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |   21 +-
 drivers/gpu/drm/i915/display/intel_fdi.h           |    7 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  183 ++--
 drivers/gpu/drm/i915/display/intel_fifo_underrun.h |   18 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   10 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  214 +++-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |   11 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   27 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    9 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   31 +-
 drivers/gpu/drm/i915/display/intel_hotplug.h       |    4 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |  118 +--
 drivers/gpu/drm/i915/display/intel_lpe_audio.h     |   18 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   30 +-
 drivers/gpu/drm/i915/display/intel_lspcon.h        |   25 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   18 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   19 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   22 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   49 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   34 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    5 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   34 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  230 +++--
 drivers/gpu/drm/i915/display/intel_psr.h           |   10 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   10 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  300 +++---
 drivers/gpu/drm/i915/display/intel_sdvo.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_sdvo_regs.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |  364 +++++++
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.h |   17 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   39 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |    1 -
 drivers/gpu/drm/i915/display/intel_sprite.c        |  178 ++--
 drivers/gpu/drm/i915/display/intel_sprite.h        |    6 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   90 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    6 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   86 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |    6 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   67 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    5 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |  172 +++-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    9 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  330 ++++---
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  656 +++++++-----
 drivers/gpu/drm/i915/display/skl_universal_plane.h |   14 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  113 ++-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    3 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   14 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   14 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |   10 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   17 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |    2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    2 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    8 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    6 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    4 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |    4 +-
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |    2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    2 +-
 drivers/gpu/drm/i915/gt/shaders/README             |    6 +-
 .../gpu/drm/i915/gt/shaders/clear_kernel/hsw.asm   |    2 +-
 .../gpu/drm/i915/gt/shaders/clear_kernel/ivb.asm   |    2 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |    4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   39 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    2 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   15 +-
 drivers/gpu/drm/i915/gvt/display.c                 |    2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |    2 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |    2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |  117 ---
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |    2 -
 drivers/gpu/drm/i915/gvt/gtt.c                     |   68 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |   14 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   23 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |    2 +-
 drivers/gpu/drm/i915/gvt/mmio.h                    |    3 -
 drivers/gpu/drm/i915/gvt/mmio_context.c            |    6 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   11 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |    6 +-
 drivers/gpu/drm/i915/i915_driver.c                 |    2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    1 -
 drivers/gpu/drm/i915/i915_gem.c                    |    6 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   69 +-
 drivers/gpu/drm/i915/i915_irq.h                    |    4 +
 drivers/gpu/drm/i915/i915_module.c                 |    2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   19 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |    2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   71 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |    8 +
 drivers/gpu/drm/i915/i915_request.c                |    2 +-
 drivers/gpu/drm/i915/i915_request.h                |    4 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   10 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    2 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |    2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    2 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    2 +-
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |    2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |    2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   21 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |   15 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |   44 +-
 drivers/gpu/drm/i915/soc/intel_pch.h               |   45 +-
 drivers/gpu/drm/xe/Kconfig                         |   14 +
 drivers/gpu/drm/xe/Makefile                        |    5 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |    3 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   23 +
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |    7 +-
 drivers/gpu/drm/xe/display/xe_display.c            |    2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   49 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   12 +-
 drivers/gpu/drm/xe/xe_device_types.h               |    1 -
 include/drm/display/drm_dp.h                       |    3 +-
 include/drm/display/drm_dp_dual_mode_helper.h      |    2 +-
 include/drm/intel/pciids.h                         |    7 +-
 237 files changed, 8250 insertions(+), 5777 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cmtg_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.h

--=20
Jani Nikula, Intel
