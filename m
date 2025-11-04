Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80732C31460
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A628A10E28D;
	Tue,  4 Nov 2025 13:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1uCQL8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949DF10E28D;
 Tue,  4 Nov 2025 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762263811; x=1793799811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eDj4z/kCIZ5yOJhju8Phf2ieNjXKI1petVY4fd2c2uU=;
 b=i1uCQL8bVwJ9vv4OSnFzOdPvXoILXJAIzPtZQFPubQ2hJwy7KArdXVwU
 biZpuA1gawvqyZIr5yDhD5cFkLa2XtYjn2WLIu2GcUSNEVYtLEk3Dtd4v
 60HPGMoH2+wD/3gn8qz43xl9TIwZqKzoteJogHp1uINxAfmHYH8FB1MGm
 bzSn09M7rQnjPSrdjIfmUD5xpWXTmrkf0WgQpJn8mrGMQNgtXKQ3Y1A0i
 hfb0XeIgBHl+29CTCxPRV+JeNmSH5HLi5/iik+ryGfOedDCKVs+1+xKXh
 bXXYjz4tCop8AR6XF/Pb75ph522L6iG4huly6mT1QEQmc2HTWH6YMskha A==;
X-CSE-ConnectionGUID: ipTsqO6xQRmbgfO5FcwNJA==
X-CSE-MsgGUID: tRt++jfvTF+EYi3Org2gdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74962382"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74962382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 05:43:31 -0800
X-CSE-ConnectionGUID: /T1cJfNGT76lRD3dFxn61A==
X-CSE-MsgGUID: 8EJnELW7SsGqmE7+6EYmAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="217804744"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 05:43:25 -0800
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
Date: Tue, 04 Nov 2025 15:43:23 +0200
Message-ID: <ec5a05f2df6d597a62033ee2d57225cce707b320@intel.com>
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

The first i915 feature pull towards v6.19, unfortunately a bit later
than usual and thus a bit bigger than usual. About 30 patches got pushed
between me starting to write the pull request changelog and finishing...

BR,
Jani.


drm-intel-next-2025-11-04:
drm/i915 feature pull for v6.19:

Features and functionality:
- Enable LNL+ content adaptive sharpness filter (CASF) (Nemesa)
- Use optimized VRR guardband (Ankit, Ville)
- Enable Xe3p LT PHY (Suraj)
- Enable FBC support for Xe3p_LPD display (Sai Teja, Vinod)
- Specify DMC firmware for display version 30.02 (Dnyaneshwar)
- Report reason for disabling PSR to debugfs (Micha=C5=82)
- Extend i915_display_info with Type-C port details (Khaled)
- Log DSI send packet sequence errors and contents

Refactoring and cleanups:
- Refactoring to prepare for VRR guardband optimization (Ankit)
- Abstract VRR live status wait (Ankit)
- Refactor VRR and DSB timing to handle Set Context Latency explicitly (Ank=
it)
- Helpers for prefill latency calculations (Ville)
- Refactor SKL+ watermark latency setup (Ville)
- VRR refactoring and cleanups (Ville)
- SKL+ universal plane cleanups (Ville)
- Decouple CDCLK from state->modeset refactor (Ville)
- Refactor VLV/CHV clock functions (Jani)
- Refactor fbdev handling (Jani)
- Call i915 and xe runtime PM from display via function pointers (Jouni)
- IRQ code refactoring  (Jani)
- Drop display dependency on i915 feature check macros (Jani)
- Refactor and unify i915 and xe stolen memory interfaces towards display (=
Jani)
- Switch to driver agnostic drm to display pointer chase (Jani)
- Use display version over graphics version in display code (Matt A)
- GVT cleanups (Jonathan, Andi)
- Rename a VLV clock function to unify (Micha=C5=82)
- Explicitly sanitize DMC package header num entries (Luca)
- Remove redundant port clock check from ALPM (Jouni)
- Use sysfs_emit() instead of sprintf() in PMU sysfs (Madhur Kumar)
- Clean up C20 PHY PLL register macros (Imre, Mika))
- Abstract "address in MMIO table" helper for general use (Matt A)
- Improve VRR platform abstractions (Ville)
- Move towards more standard PCI PM code usage (Ville)
- Framebuffer refactoring (Ville)
- Drop display dependency on i915_utils.h (Jani)
- Include cleanups (Jani)

Fixes:
- Workaround docking station DSC issues with high pixel clock and bpp (Imre)
- Fix Panel Replay in DSC mode (Imre)
- Disable tracepoints for PREEMPT_RT as a workaround (Maarten)
- Fix intel_crtc_get_vblank_counter() on PREEMPT_RT (Maarten)
- Fix C10 PHY identification on PTL/WCL (Dnyaneshwar)
- Take AS SDP into account with optimized guardband (Jouni)
- Fix panic structure allocation memory leak (Jani)
- Adjust an FBC workaround platforms (Vinod)
- Add fallback for CDCLK selection (Naladala)
- Avoid using invalid transcoder in MST transport select (Suraj)
- Don't use cursor size reduction on display version 14+ (Nemesa)
- Fix C20 PHY PLL register programming (Imre, Mika)
- Fix PSR frontbuffer flush handling (Jouni)
- Store ALPM parameters in crtc state (Jouni)
- Defeature DRRS on LNL+ (Ville)
- Fix the scope of the large DRAM DIMM workaround (Ville)
- Fix PICA vs. AUX power ordering issue (Gustavo)
- Fix pixel rate for computing watermark line time (Ville)
- Fix framebuffer set_tiling vs. addfb race (Ville)
- DMC event handler fixes (Ville)

DRM Core:
- CRTC sharpness strength property (Nemesa)
- DPCD DSC quirk for Synaptics Panamera devices (Imre)
- Helpers to query the branch DSC max throughput/line-width (Imre)

Merges:
- Backmerge drm-next for v6.18-rc and to sync with drm-xe-next (Jani)

BR,
Jani.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
25-11-04

for you to fetch changes up to c4227e1609b355cde373b5770bd91a7eb49eb9cb:

  drm/i915/display: Extend i915_display_info with Type-C port details (2025=
-11-04 14:27:43 +0200)

----------------------------------------------------------------
drm/i915 feature pull for v6.19:

Features and functionality:
- Enable LNL+ content adaptive sharpness filter (CASF) (Nemesa)
- Use optimized VRR guardband (Ankit, Ville)
- Enable Xe3p LT PHY (Suraj)
- Enable FBC support for Xe3p_LPD display (Sai Teja, Vinod)
- Specify DMC firmware for display version 30.02 (Dnyaneshwar)
- Report reason for disabling PSR to debugfs (Micha=C5=82)
- Extend i915_display_info with Type-C port details (Khaled)
- Log DSI send packet sequence errors and contents

Refactoring and cleanups:
- Refactoring to prepare for VRR guardband optimization (Ankit)
- Abstract VRR live status wait (Ankit)
- Refactor VRR and DSB timing to handle Set Context Latency explicitly (Ank=
it)
- Helpers for prefill latency calculations (Ville)
- Refactor SKL+ watermark latency setup (Ville)
- VRR refactoring and cleanups (Ville)
- SKL+ universal plane cleanups (Ville)
- Decouple CDCLK from state->modeset refactor (Ville)
- Refactor VLV/CHV clock functions (Jani)
- Refactor fbdev handling (Jani)
- Call i915 and xe runtime PM from display via function pointers (Jouni)
- IRQ code refactoring  (Jani)
- Drop display dependency on i915 feature check macros (Jani)
- Refactor and unify i915 and xe stolen memory interfaces towards display (=
Jani)
- Switch to driver agnostic drm to display pointer chase (Jani)
- Use display version over graphics version in display code (Matt A)
- GVT cleanups (Jonathan, Andi)
- Rename a VLV clock function to unify (Micha=C5=82)
- Explicitly sanitize DMC package header num entries (Luca)
- Remove redundant port clock check from ALPM (Jouni)
- Use sysfs_emit() instead of sprintf() in PMU sysfs (Madhur Kumar)
- Clean up C20 PHY PLL register macros (Imre, Mika))
- Abstract "address in MMIO table" helper for general use (Matt A)
- Improve VRR platform abstractions (Ville)
- Move towards more standard PCI PM code usage (Ville)
- Framebuffer refactoring (Ville)
- Drop display dependency on i915_utils.h (Jani)
- Include cleanups (Jani)

Fixes:
- Workaround docking station DSC issues with high pixel clock and bpp (Imre)
- Fix Panel Replay in DSC mode (Imre)
- Disable tracepoints for PREEMPT_RT as a workaround (Maarten)
- Fix intel_crtc_get_vblank_counter() on PREEMPT_RT (Maarten)
- Fix C10 PHY identification on PTL/WCL (Dnyaneshwar)
- Take AS SDP into account with optimized guardband (Jouni)
- Fix panic structure allocation memory leak (Jani)
- Adjust an FBC workaround platforms (Vinod)
- Add fallback for CDCLK selection (Naladala)
- Avoid using invalid transcoder in MST transport select (Suraj)
- Don't use cursor size reduction on display version 14+ (Nemesa)
- Fix C20 PHY PLL register programming (Imre, Mika)
- Fix PSR frontbuffer flush handling (Jouni)
- Store ALPM parameters in crtc state (Jouni)
- Defeature DRRS on LNL+ (Ville)
- Fix the scope of the large DRAM DIMM workaround (Ville)
- Fix PICA vs. AUX power ordering issue (Gustavo)
- Fix pixel rate for computing watermark line time (Ville)
- Fix framebuffer set_tiling vs. addfb race (Ville)
- DMC event handler fixes (Ville)

DRM Core:
- CRTC sharpness strength property (Nemesa)
- DPCD DSC quirk for Synaptics Panamera devices (Imre)
- Helpers to query the branch DSC max throughput/line-width (Imre)

Merges:
- Backmerge drm-next for v6.18-rc and to sync with drm-xe-next (Jani)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gvt: Propagate vfio_set_irqs_validate_and_prepare() error

Ankit Nautiyal (26):
      drm/i915/vrr: Refactor VRR live status wait into common helper
      drm/i915/psr: s/intel_psr_min_vblank_delay/intel_psr_min_set_context_=
latency
      drm/i915/display: Add set_context_latency to crtc_state
      drm/i915/vrr: Use set_context_latency instead of intel_vrr_real_vblan=
k_delay()
      drm/i915/vrr: Use SCL for computing guardband
      drm/i915/dsb: s/intel_dsb_wait_vblank_delay/intel_dsb_wait_for_delaye=
d_vblank
      drm/i915/display: Wait for scl start instead of dsb_wait_vblanks
      drm/i915/reg_defs: Add REG_FIELD_MAX wrapper for FIELD_MAX()
      drm/i915/vrr: Clamp guardband as per hardware and timing constraints
      drm/i915/display: Drop intel_vrr_vblank_delay and use set_context_lat=
ency
      drm/i915/dsb: Inline dsb_vblank_delay() into intel_dsb_wait_for_delay=
ed_vblank()
      drm/i915/vrr: Use crtc_vsync_start/end for computing vrr.vsync_start/=
end
      drm/i915/display: Move intel_dpll_crtc_compute_clock early
      drm/i915/vrr: s/intel_vrr_compute_config_late/intel_vrr_compute_guard=
band
      drm/i915/vblank: Add helper to get correct vblank length
      drm/i915/psr: Consider SCL lines when validating vblank for wake late=
ncy
      drm/i915/psr: Introduce helper intel_psr_set_non_psr_pipes()
      drm/i915/display: Introduce dp/psr_compute_config_late()
      drm/i915/psr: Check if final vblank is sufficient for PSR features
      drm/i915/display: Add vblank_start adjustment logic for always-on VRR=
 TG
      drm/i915/display: Prepare for vblank_delay for LRR
      drm/i915/psr: Add helper to get min psr guardband
      drm/i915/dp: Add helper to get min sdp guardband
      drm/i915/dp: Check if guardband can accommodate sdp latencies
      drm/i915/vrr: Use the min static optimized guardband
      drm/i915/vrr: Use optimized guardband whenever VRR TG is active

Dnyaneshwar Bhadane (4):
      drm/pcids: Split PTL pciids group to make wcl subplatform
      drm/i915/display: Add definition for wcl as subplatform
      drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A
      drm/i915/xe3lpd: Load DMC for Xe3_LPD version 30.02

Gustavo Sousa (2):
      drm/i915/display: Extract separate AUX PW descriptors
      drm/i915/display: Enable PICA power before AUX

Imre Deak (22):
      drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
      drm/dp: Add helpers to query the branch DSC max throughput/line-width
      drm/i915/dp: Calculate DSC slice count based on per-slice peak throug=
hput
      drm/i915/dp: Pass DPCD device descriptor to intel_dp_get_dsc_sink_cap=
()
      drm/i915/dp: Verify branch devices' overall pixel throughput/line wid=
th
      drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
      drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/DP_RATE fie=
ld macros
      drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_DP flag =
macro
      drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/CONTEXT_TOG=
GLE flag macro
      drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_HDMI_FRL=
 flag macro
      drm/i915/display: Fix PHY_C20_VDR_CUSTOM_SERDES_RATE programming
      drm/i915/display: Fix PHY_C20_VDR_HDMI_RATE programming
      drm/i915/display: Add missing clock to C10 PHY state compute/HW reado=
ut
      drm/i915/dsc: Add helper to enable the DSC configuration for a CRTC
      drm/i915/dp: Ensure the FEC state stays disabled for UHBR links
      drm/i915/dp: Export helper to determine if FEC on non-UHBR links is r=
equired
      drm/i915/dp_mst: Reuse the DP-SST helper function to compute FEC conf=
ig
      drm/i915/dp_mst: Track DSC enabled status on the MST link
      drm/i915/dp_mst: Recompute all MST link CRTCs if DSC gets enabled on =
the link
      drm/i915/dp: Fix panel replay when DSC is enabled
      drm/i915/dp: Simplify intel_dp_needs_8b10b_fec()
      drm/i915/dp_mst: Fix check for FEC support for an uncompressed stream

Jani Nikula (69):
      drm/i915: do cck get/put inside vlv_get_hpll_vco()
      drm/i915: do cck get/put inside vlv_get_cck_clock()
      drm/i915: add vlv_clock_get_gpll()
      drm/i915: add vlv_clock_get_czclk()
      drm/i915: add vlv_clock_get_hrawclk()
      drm/i915: make vlv_get_cck_clock_hpll() static
      drm/i915: add vlv_clock_get_cdclk()
      drm/i915: make vlv_get_cck_clock() static
      drm/i915: rename vlv_get_hpll_vco() to vlv_clock_get_hpll_vco()
      drm/i915: cache the results in vlv_clock_get_hpll_vco() and use it mo=
re
      drm/i915: remove vlv_get_cck_clock_hpll()
      drm/i915: remove intel_update_czclk() as unnecessary
      drm/i915: log HPLL frequency similar to CZCLK
      drm/i915: move hpll and czclk caching under display
      drm/i915: split out vlv_clock.[ch]
      drm/i915: add note on VLV/CHV hpll_freq and czclk_freq caching
      drm/xe/fbdev: use the same 64-byte stride alignment as i915
      drm/i915/fbdev: make intel_framebuffer_create() error return handling=
 explicit
      drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_alloc()
      drm/{i915, xe}/fbdev: deduplicate struct drm_mode_fb_cmd2 init
      drm/i915/fbdev: abstract bo creation
      drm/xe/fbdev: abstract bo creation
      drm/{i915, xe}/fbdev: add intel_fbdev_fb_bo_destroy()
      drm/{i915,xe}/fbdev: deduplicate fbdev creation
      drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_fill_i=
nfo()
      drm/i915/fbdev: drop dependency on display in i915 specific code
      drm/i915/irq: use a dedicated IMR cache for VLV/CHV
      drm/i915/irq: use a dedicated IMR cache for gen 5-7
      drm/i915/irq: rename irq_mask to gen2_imr_mask
      drm/i915/irq: rename de_irq_mask[] to de_pipe_imr_mask[]
      drm/i915/irq: add ilk_display_irq_reset()
      drm/i915/irq: drop intel_psr_regs.h include
      drm/i915/irq: initialize gen2_imr_mask in terms of enable_mask
      drm/i915/irq: abstract i9xx_display_irq_enable_mask()
      drm/i915/irq: move check for HAS_HOTPLUG() inside i9xx_hpd_irq_ack()
      drm/i915/irq: split ILK display irq handling
      drm/i915/gem: add i915_gem_fence_wait_priority_display() helper
      Merge drm/drm-next into drm-intel-next
      drm/{i915, xe}/stolen: rename i915_stolen_fb to intel_stolen_node
      drm/xe/stolen: rename fb to node in stolen compat header
      drm/xe/stolen: convert compat stolen macros to inline functions
      drm/xe/stolen: switch from BUG_ON() to WARN_ON() in compat
      drm/i915/stolen: convert intel_stolen_node into a real struct of its =
own
      drm/xe/stolen: convert compat static inlines to proper functions
      drm/{i915, xe}/stolen: make struct intel_stolen_node opaque
      drm/{i915, xe}/stolen: add device pointer to struct intel_stolen_node
      drm/{i915, xe}/stolen: use the stored i915/xe device pointer
      drm/{i915, xe}/stolen: convert stolen interface to struct drm_device
      drm/xe/stolen: use the same types as i915 interface
      drm/{i915,xe}: driver agnostic drm to display pointer chase
      drm/i915/irq: duplicate HAS_FBC() for irq error mask usage
      Merge drm/drm-next into drm-intel-next
      drm/i915: include gen 2 in HAS_128_BYTE_Y_TILING()
      drm/i915/display: duplicate 128-byte Y-tiling feature check
      drm/i915/display: add HAS_AUX_CCS() feature check
      drm/i915: drop unused non-i915 IS_<PLATFORM> macros
      drm/i915/panic: fix panic structure allocation memory leak
      drm/i915/display: drop a few unnecessary i915_drv.h includes
      drm/xe/compat: drop include xe_device.h from i915_drv.h
      drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
      drm/i915/dsi: log send packet sequence errors
      drm/i915/dsi: debug log send packet sequence contents
      drm/i915: split out separate files for jiffies timeout and wait helpe=
rs
      drm/i915/display: create intel_display_utils.h
      drm/i915/display: add intel_display_run_as_guest()
      drm/i915/display: add intel_display_vtd_active()
      drm/i915/display: switch to intel_display_utils.h
      drm/xe/compat: reduce i915_utils.[ch]
      drm/{i915, xe}/display: pass parent interface to display probe

Jonathan Cavitt (4):
      drm/i915/gvt: Remove unnecessary check in reg_is_mmio
      drm/i915/gvt: Fix intel_vgpu_gpa_to_mmio_offset kernel docs
      drm/i915/gvt: Simplify case switch in intel_vgpu_ioctl
      drm/i915/gvt: Improve intel_vgpu_ioctl hdr error handling

Jouni H=C3=B6gander (10):
      drm/i915/alpm: Remove error handling from get_lfps_cycle_min_max_time
      drm/i915/psr: Deactivate PSR only on LNL and when selective fetch ena=
bled
      drm/i915/alpm: Compute ALPM parameters into crtc_state->alpm_state
      drm/i915/alpm: Remove parameters suffix from intel_dp->alpm_parameters
      drm/i915/display: Take into account AS SDP in intel_dp_sdp_min_guardb=
and
      drm/{i915, xe}/display: Add display runtime pm parent interface
      drm/i915/display: Runtime pm wrappers for display parent interface
      drm/xe/display: Runtime pm wrappers for display parent interface
      drm/i915/display: Use display parent interface for i915 runtime pm
      drm/xe/display: Use display parent interface for xe runtime pm

Khaled Almahallawy (1):
      drm/i915/display: Extend i915_display_info with Type-C port details

Luca Coelho (1):
      drm/i915/dmc: explicitly sanitize num_entries from package_header

Maarten Lankhorst (2):
      drm/i915: Disable tracepoints for PREEMPT_RT
      drm/i915/display: Make intel_crtc_get_vblank_counter safe on PREEMPT_=
RT

Madhur Kumar (1):
      drm/i915: i915_pmu: Use sysfs_emit() instead of sprintf()

Matt Atwood (2):
      drm/i915/display: Use DISPLAY_VER over GRAPHICS_VER
      drm/i915: move and rename reg_in_range_table

Micha=C5=82 Grzelak (2):
      drm/i915: rename vlv_get_cck_clock() to vlv_clock_get_cck()
      drm/i915/display: Add no_psr_reason to PSR debugfs

Naladala Ramanaidu (1):
      drm/i915: Add fallback for CDCLK selection when min_cdclk is too high

Nemesa Garg (11):
      drm/i915: Soft defeature of cursor size reduction
      drm/drm_crtc: Introduce sharpness strength property
      drm/i915/display: Introduce HAS_CASF for sharpness support
      drm/i915/display: Add CASF strength and winsize
      drm/i915/display: Add filter lut values
      drm/i915/display: Compute the scaler coefficients
      drm/i915/display: Add and compute scaler parameter
      drm/i915/display: Configure the second scaler
      drm/i915/display: Set and get the casf config
      drm/i915/display: Enable/disable casf
      drm/i915/display: Expose sharpness strength property

Sai Teja Pottumuttu (1):
      drm/i915/xe3p_lpd: Extend FBC support to UINT16 formats

Suraj Kandpal (26):
      drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER
      drm/i915/ltphy: Add LT Phy related VDR and Pipe Registers
      drm/i915/cx0: Change register bit naming for powerdown values
      drm/i915/ltphy: Phy lane reset for LT Phy
      drm/i915/cx0: Move the HDMI FRL function to intel_hdmi
      drm/i915/ltphy: Program sequence for PORT_CLOCK_CTL for LT Phy
      drm/i915/ltphy: Add a wrapper for LT Phy powerdown change sequence
      drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
      drm/i915/ltphy: Add LT Phy Programming recipe tables
      drm/i915/ltphy: Program the VDR PLL registers for LT PHY
      drm/i915/ltphy: Update the ltpll config table value for eDP
      drm/i915/ltphy: Enable SSC during port clock programming
      drm/i915/ltphy: Add function to calculate LT PHY port clock
      drm/i915/ltphy: Program the P2P Transaction flow for LT Phy
      drm/i915/ltphy: Program the rest of the PORT_CLOCK_CTL steps
      drm/i915/ltphy: Program the rest of the LT Phy Enable sequence
      drm/i915/ltphy: Program LT Phy Non-TBT PLL disable sequence
      drm/i915/ltphy: Hook up LT Phy Enable & Disable sequences
      drm/i915/ddi: Define LT Phy Swing tables
      drm/i915/ltphy: Program LT Phy Voltage Swing
      drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence
      drm/i915/ltphy: Define the LT Phy state compare function
      drm/i915/ltphy: Define function to readout LT Phy PLL state
      drm/i915/ltphy: Define LT PHY PLL state verify function
      drm/i915/display: Aux Enable and Display powerwell timeouts
      drm/i915/ltphy: Modify the step that need to be skipped

Ville Syrj=C3=A4l=C3=A4 (104):
      drm/i915: Defeature DRRS on LNL+
      drm/i915/vrr: Extract helpers to convert between guardband and pipeli=
ne_full values
      drm/i915/vrr: Readout framestart_delay earlier
      drm/i915/vrr: Store guardband in crtc state even for icl/tgl
      drm/i915/vrr: Annotate some functions with "hw"
      drm/i915/vrr: Move the TGL SCL mangling of vmin/vmax/flipline deeper
      drm/i915/vrr: Hide the ICL/TGL intel_vrr_flipline_offset() mangling b=
etter
      drm/i915/vrr: s/intel_vrr_flipline_offset/intel_vrr_vmin_flipline_off=
set/
      drm/i915/pm: Simplify pm hook documentation
      drm/i915/pm: Hoist pci_save_state()+pci_set_power_state() to the end =
of pm _late() hook
      drm/i915/pm: Move the hibernate+D3 quirk stuff into noirq() pm hooks
      drm/i915/pm: Do pci_restore_state() in switcheroo resume hook
      drm/i915/pm: Allow drivers/pci to manage our pci state normally
      drm/i915/pm: Drop redundant pci stuff from suspend/resume paths
      drm/i915/dram: Also apply the 16Gb DIMM w/a for larger DRAM chips
      drm/i915: Apply the 16Gb DIMM w/a only for the platforms that need it
      drm/i915: Tweak the read latency fixup code
      drm/i915: Don't pass the latency array to {skl,mtl}_read_wm_latency()
      drm/i915: Move adjust_wm_latency() out from {mtl,skl}_read_wm_latency=
()
      drm/i915: Extract multiply_wm_latency() from skl_read_wm_latency()
      drm/i915: Extract increase_wm_latency()
      drm/i915: Use increase_wm_latency() for the 16Gb DIMM w/a
      drm/i915: Extract sanitize_wm_latency()
      drm/i915: Flatten sanitize_wm_latency() a bit
      drm/i915: Make wm latencies monotonic
      drm/i915: Print both the original and adjusted wm latencies
      drm/i915: Make sure wm block/lines are non-decreasing
      drm/i915: Use the the correct pixel rate to compute wm line time
      drm/i915: Deobfuscate wm linetime calculation
      drm/i915: s/intel_get_linetime_us()/skl_wm_linetime_us()/
      drm/i915/frontbuffer: Move bo refcounting intel_frontbuffer_{get,rele=
ase}()
      drm/i915/fb: Fix the set_tiling vs. addfb race, again
      drm/i915/fbdev: Select linear modifier explicitly
      drm/i915/fb: Drop the 'fb' argument from intel_fb_bo_framebuffer_init=
()
      drm/i915/wm: Use fb->modfier to check for tiled vs. untiled
      drm/i915: Introduce intel_crtc_enable_changed() and intel_any_crtc_en=
able_changed()
      drm/i915: Introduce intel_crtc_active_changed() and intel_any_crtc_ac=
tive_changed()
      drm/i915/bw: Skip the bw_state->active_pipes update if no pipe is cha=
nging its active state
      drm/1915/bw: Drop redundant display version checks
      drm/i915/cdclk: Extract glk_cdclk_audio_wa_needed()
      drm/i915/cdclk: Extract dg2_power_well_count()
      drm/i915/cdclk: Introduce intel_cdclk_modeset_checks()
      drm/i915/cdclk: Handle the force_min_cdclk state locking in intel_cdc=
lk_atomic_check()
      drm/i915/cdclk: Extract intel_cdclk_update_bw_min_cdclk()
      drm/i915/cdclk: Extract intel_cdclk_update_crtc_min_cdclk()
      drm/i915/cdclk: Rework bw_min_cdclk handling
      drm/i915/cdclk: Do intel_cdclk_update_crtc_min_cdclk() per-pipe
      drm/i915/cdclk: Relocate intel_plane_calc_min_cdclk() calls
      drm/i915/cdclk: Rework crtc min_cdclk handling
      drm/i915/cdclk: Move intel_bw_crtc_min_cdclk() handling into intel_cr=
tc_compute_min_cdclk()
      drm/i915/cdclk: Decouple cdclk from state->modeset
      drm/i915: Introduce intel_calc_enabled_pipes()
      drm/i915/cdclk: Use enabled_pipes instead of active_pipes for the glk=
 audio w/a
      drm/i915/cdclk: Hide intel_modeset_calc_cdclk()
      drm/i915/cdclk: Move intel_cdclk_atomic_check()
      drm/i915: Reject modes with linetime > 64 usec
      drm/i915/cdclk: Add prefill helpers for CDCLK
      drm/i915/cdclk: Add intel_cdclk_min_cdclk_for_prefill()
      drm/i915/dsc: Add prefill helper for DSC
      drm/i915/scaler: Add scaler prefill helpers
      drm/i915/wm: Add WM0 prefill helpers
      drm/i915/prefill: Introduce skl_prefill.c
      drm/i915/wm: Use skl_prefill
      drm/i915/bw: Untangle dbuf bw from the sagv/mem bw stuff
      drm/i915: s/"not not"/"not"/
      drm/i915/bw: Relocate intel_bw_crtc_min_cdclk()
      drm/i915/ips: Eliminate the cdclk_state stuff from hsw_ips_compute_co=
nfig()
      drm/i915/fbc: Decouple FBC from intel_cdclk_atomic_check()
      drm/i915: s/min_cdck[]/plane_min_cdclk[]/
      drm/i915: Compute per-crtc min_cdclk earlier
      drm/i915: Include the per-crtc minimum cdclk in the crtc state dump
      drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S
      drm/i915/dmc: Fixup TGL/ADL-S HRR event handler type
      drm/i915/dmc: Set DMC_EVT_CTL_ENABLE for disabled event handlers as w=
ell
      drm/i915/vrr: Fix intel_vrr_always_use_vrr_tg()=3D=3Dtrue on TGL
      drm/i915/lrr: Include SCL in lrr_params_changed()
      drm/i915: Remove the "vblank delay" state dump
      drm/i915/vrr: Compute fixed refresh rate timings the same way as CMRR=
 timings
      drm/i915/vrr: Reorganize intel_vrr_compute_cmrr_timings() a bit
      drm/i195/vrr: Move crtc_state->vrr.{vmin,vmax} update into intel_vrr_=
compute_vrr_timings()
      drm/i915/vrr: Move compute_fixed_rr_timings()
      drm/i915/vrr: Extract intel_vrr_set_vrr_timings()
      drm/i915/vrr: Avoid redundant TRANS_PUSH write in intel_vrr_enable()
      drm/i915/vrr: Move EMP_AS_SDP_TL write into intel_vrr_set_transcoder_=
timings()
      drm/i915/vrr: Use trans_vrr_ctl() in intel_vrr_transcoder_disable()
      drm/i915/vrr: Extract intel_vrr_tg_disable()
      drm/i915/vrr: Extract intel_vrr_tg_enable()
      drm/i915/vrr: Disable VRR TG in intel_vrr_transcoder_disable() only o=
n always use_vrr_tg() platforms
      drm/i915/vrr: Always write TRANS_VRR_CTL in intel_vrr_set_transcoder_=
timings() on !always_use_vrr_tg()
      drm/i915/vrr: Remove redundant HAS_VRR() checks
      drm/i915/vrr: Move HAS_VRR() check into intel_vrr_set_transcoder_timi=
ngs()
      drm/i915/vrr: s/crtc_state/old_crtc_state/ in intel_vrr_transcoder_di=
sable()
      drm/i915/vrr: Nuke intel_vrr_vblank_exit_length()
      drm/i915/vrr: Nuke intel_vrr_vmin_flipline()
      drm/i915/vrr: Update the intel_vrr_extra_vblank_delay() comment
      drm/i915/vrr: Check HAS_VRR() first in intel_vrr_is_capable()
      drm/i915: Rewrite icl_min_plane_width()
      drm/i915: Drop the min plane width w/a adl+
      drm/i915: Implement .min_plane_width() for PTL+
      drm/i915: Start checking plane min size for the chroma plane
      drm/i915: Introduce intel_plane_min_height()
      drm/i915: Remove pointless crtc hw.enable check
      drm/i915: Extract glk_plane_has_planar()
      drm/i915: Unify the logic in {skl,glk}_plane_has_*()

Vinod Govindapillai (4):
      drm/i915/fbc: update the impacted platforms in wa_22014263786
      drm/i915/xe3p_lpd: Add FBC support for FP16 formats
      drm/i915/xe3p_lpd: extract pixel format valid routine for FP16 formats
      drm/i915/xe3p_lpd: use pixel normalizer for fp16 formats for FBC

 drivers/gpu/drm/display/drm_dp_helper.c            |  156 ++
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_crtc.c                         |   35 +
 drivers/gpu/drm/i915/Makefile                      |   12 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |    2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   61 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    2 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    7 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    4 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |   91 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  315 +--
 drivers/gpu/drm/i915/display/intel_bw.h            |    6 +-
 drivers/gpu/drm/i915/display/intel_casf.c          |  290 +++
 drivers/gpu/drm/i915/display/intel_casf.h          |   21 +
 drivers/gpu/drm/i915/display/intel_casf_regs.h     |   33 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  449 +++--
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   16 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   98 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   11 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   16 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  131 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   21 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   25 +-
 drivers/gpu/drm/i915/display/intel_dbuf_bw.c       |  295 +++
 drivers/gpu/drm/i915/display/intel_dbuf_bw.h       |   37 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   43 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   83 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |    9 +
 drivers/gpu/drm/i915/display/intel_display.c       |  319 ++--
 drivers/gpu/drm/i915/display/intel_display.h       |    8 +-
 .../drm/i915/display/intel_display_conversion.c    |   20 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   29 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    8 +
 .../gpu/drm/i915/display/intel_display_device.c    |   18 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   13 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |    9 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  128 +-
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    8 +-
 .../gpu/drm/i915/display/intel_display_jiffies.h   |   43 +
 drivers/gpu/drm/i915/display/intel_display_power.c |    2 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   26 +-
 .../drm/i915/display/intel_display_power_well.c    |   22 +-
 drivers/gpu/drm/i915/display/intel_display_rpm.c   |   33 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   68 +-
 drivers/gpu/drm/i915/display/intel_display_utils.c |   32 +
 drivers/gpu/drm/i915/display/intel_display_utils.h |   31 +
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    2 +
 drivers/gpu/drm/i915/display/intel_display_wa.h    |    1 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |  108 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  263 ++-
 drivers/gpu/drm/i915/display/intel_dp.h            |   12 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    2 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   49 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   31 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   11 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |   57 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   34 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   67 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |    3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  198 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |    3 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   61 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   58 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |   14 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_flipq.c         |    6 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   10 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |    1 -
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   16 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    5 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   17 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c        | 2000 ++++++++++++++++=
++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |   44 +
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |   75 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   14 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    2 +
 drivers/gpu/drm/i915/display/intel_pch.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   61 +-
 drivers/gpu/drm/i915/display/intel_plane.h         |    3 -
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |    3 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  440 +++--
 drivers/gpu/drm/i915/display/intel_psr.h           |    5 +-
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |    2 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   15 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |    3 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |   15 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |    2 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   26 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    3 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |  502 +++--
 drivers/gpu/drm/i915/display/intel_vrr.h           |    5 +-
 drivers/gpu/drm/i915/display/skl_prefill.c         |  157 ++
 drivers/gpu/drm/i915/display/skl_prefill.h         |   46 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |  234 ++-
 drivers/gpu/drm/i915/display/skl_scaler.h          |   17 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  168 +-
 .../drm/i915/display/skl_universal_plane_regs.h    |   12 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |  343 ++--
 drivers/gpu/drm/i915/display/skl_watermark.h       |    3 +
 drivers/gpu/drm/i915/display/vlv_clock.c           |   88 +
 drivers/gpu/drm/i915/display/vlv_clock.h           |   38 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    1 +
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |    2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  104 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   34 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    7 +
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |    8 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |    1 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   18 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    9 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |    1 +
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   35 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |    4 +-
 drivers/gpu/drm/i915/i915_config.c                 |    2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  149 +-
 drivers/gpu/drm/i915/i915_driver.h                 |    2 +
 drivers/gpu/drm/i915/i915_drv.h                    |   21 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  105 +-
 drivers/gpu/drm/i915/i915_jiffies.h                |   16 +
 drivers/gpu/drm/i915/i915_mmio_range.c             |   18 +
 drivers/gpu/drm/i915/i915_mmio_range.h             |   19 +
 drivers/gpu/drm/i915/i915_perf.c                   |   67 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    4 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |   10 +
 drivers/gpu/drm/i915/i915_utils.h                  |   41 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   77 +
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    3 +
 drivers/gpu/drm/i915/intel_uncore.c                |   15 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    8 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |    1 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    4 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   10 +-
 drivers/gpu/drm/xe/Makefile                        |    8 +-
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |    4 +-
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |   79 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    4 -
 .../xe/compat-i915-headers/i915_scheduler_types.h  |   13 -
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |    9 +-
 drivers/gpu/drm/xe/display/ext/i915_utils.c        |   27 -
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |    3 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   68 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   12 +-
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |   61 +-
 drivers/gpu/drm/xe/display/xe_display_rpm.h        |   11 +
 drivers/gpu/drm/xe/display/xe_stolen.c             |  123 ++
 drivers/gpu/drm/xe/xe_device_types.h               |   16 +-
 drivers/gpu/drm/xe/xe_pci.c                        |    1 +
 include/drm/display/drm_dp.h                       |    3 +
 include/drm/display/drm_dp_helper.h                |   14 +
 include/drm/drm_crtc.h                             |   18 +
 include/drm/intel/display_member.h                 |   42 +
 include/drm/intel/display_parent_interface.h       |   45 +
 include/drm/intel/pciids.h                         |    5 +-
 184 files changed, 7604 insertions(+), 2289 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dbuf_bw.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dbuf_bw.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_jiffies.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_utils.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_utils.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_lt_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_lt_phy.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_prefill.c
 create mode 100644 drivers/gpu/drm/i915/display/skl_prefill.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_clock.c
 create mode 100644 drivers/gpu/drm/i915/display/vlv_clock.h
 create mode 100644 drivers/gpu/drm/i915/i915_jiffies.h
 create mode 100644 drivers/gpu/drm/i915/i915_mmio_range.c
 create mode 100644 drivers/gpu/drm/i915/i915_mmio_range.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_scheduler_t=
ypes.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_utils.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_rpm.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_stolen.c
 create mode 100644 include/drm/intel/display_member.h
 create mode 100644 include/drm/intel/display_parent_interface.h

--=20
Jani Nikula, Intel
