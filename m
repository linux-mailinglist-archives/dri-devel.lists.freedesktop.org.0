Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D17228B0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFCA10E2AB;
	Mon,  5 Jun 2023 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A0510E2AB;
 Mon,  5 Jun 2023 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685974856; x=1717510856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A+CsSGYsiIJtaGpLf47yDeEr5vmq9Wuq3DipCB12t4A=;
 b=e3tZ6d02RKJntUPL715L5UfdMs80ktNo8e/JE4DfiyRzjQ8khaI6D+Me
 z+ZiYtyf2+3k1QD4bcIS98RWSQ//z+zwMj0RdprBr2D8PEfRRw9GpHB54
 I6a6noPXo8wj7z1gR8fwZVX0wGWxJ9k92r64QgFfBs7YFA+jjT7VCpzr9
 E/LhRQKvv9/7l684bIjveMimfvHzqmJ0uNH+UWjqty9YEgU/Kx3IfWGzc
 B6RiJY0KxIsF6h4+SQhvwU/CVK8zi2goP/Nn13RK5yzJiz0PrL1WEMN2+
 nfm4I6/P+lsvjJqWItM8seIbalj2Rj0hNshFkDWwXrub231QuuYW/FFsF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="345972232"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="345972232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="708670816"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="708670816"
Received: from egrabovs-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.198])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:20:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 05 Jun 2023 17:20:49 +0300
Message-ID: <87zg5eat32.fsf@intel.com>
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


Hi Dave & Daniel -

Due to miscommunication (mea culpa) there was no earlier drm-intel-next
pull request for v6.5, so this is the first one and therefore quite
big. Sorry about that. (But hey, if there's going to be another pull
request, it'll be tiny! ;)

This round, Meteorlake display enabling stands out, although it's just
one line in the summary below. Thanks to Mika, Radhakrishna, Jos=C3=A9,
Ankit, Clint, Gustavo, Imre, Anusha, Juha-Pekka, and Matt for a ton of
MTL enabling patches.


BR,
Jani.


drm-intel-next-2023-06-05:
drm/i915 features for v6.5:

Features and functionality:
- Meteorlake (MTL) display enabling (Mika, Radhakrishna, Jos=C3=A9, Ankit, =
Clint,
  Gustavo, Imre, Anusha, Juha-Pekka, Matt)
- Allow VRR to be toggled during fastsets (Ville)
- Allow arbitrary refresh rates with VRR eDP panels (Ville)
- Support async flips on linear buffers on display ver 12+  (Arun)
- New debugfs for display clock frequencies (Bhanuprakash)
- Taint kernel when force probing unsupported devices (Jani)
- Expose CRTC CTM property on ILK/SNB/VLV (Ville)

DRM subsystem changes:
- EDID changes to support further conversion to struct drm_edid (Jani)
- Move i915 DSC parameter code to common DRM helpers (Dmitry Baryshkov)

Refactoring and cleanups:
- CSC color refactoring (Ville)
- VRR cleanups (Ville)
- Finish i915 conversion to struct drm_edid (Jani)
- Start high level display driver file (Jani)
- Hotplug refactoring (Ville)
- Misc display refactoring and cleanups (Jani, Ville)
- Use device based logging for state checker warnings (Jani)
- Split out hotplug and display irq handling (Jani)
- Move display device info and probe under display/ (Matt)
- HDCP cleanups (Suraj)
- Use localized warning ignores instead of per file (Jani)
- Remove superfluous enum i915_drm_suspend_mode (Maarten)
- PSR, pfit, scaler and chicken register definition cleanups (Ville)
- Constify pointers to hwmon_channel_info (Krzysztof Kozlowski)
- Replace all non-returning strlcpy with strscpy (Azeem Shaikh)
- Refactor VBT aux channel and DDC pin mapping (Ville)
- Include cleanups (Jani)

Fixes:
- Fix modeset locking issue in DP MST HDCP (Suraj)
- Fix disconnected Type-C/DP-alt disable at probe (Imre)
- Fix HDMI PCON DSC usage and color conversions (Ankit)
- Fix g4x HDMI infoframe/audio transmission port usage (Ville)
- Avoid use-after-free when DP connector init fails (Maarten)
- Fix voltage level for 480 MHz CDCLK (Chaitanya)
- Check HPD live state during eDP probe (Ville)
- Fix active port PLL selection for secondary MST streams (Imre)
- Check pipe source size when using SKL+ scalers (Ville)
- Fix MIPI DSI sleep sequences (Hans de Goede)
- Fix DPCD register write order to match 128b/132b requirement (Arun)
- Increase AUX timeout for Type-C (Suraj)
- Communicate display power demands to pcode (Stan)
- Fix potential division by zero in DSC compute config (Nikita Zhandarovich)
- Fix fast wake AUX sync length (Jouni)
- Fix potential oops on intel_get_crtc_new_encoder() (Ville)

Merges:
- drm-next backmerges (Rodrigo, Jani)

BR,
Jani.

The following changes since commit 85d712f033d23bb56a373e29465470c036532d46:

  Merge tag 'drm-intel-gt-next-2023-05-24' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2023-05-29 06:21:51 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-06-05

for you to fetch changes up to 619a06dba6fa38de1b85c09ac74bb8aa2449ce0c:

  drm/i915/mtl: Reset only one lane in case of MFD (2023-06-05 12:35:29 +03=
00)

----------------------------------------------------------------
drm/i915 features for v6.5:

Features and functionality:
- Meteorlake (MTL) display enabling (Mika, Radhakrishna, Jos=C3=A9, Ankit, =
Clint,
  Gustavo, Imre, Anusha, Juha-Pekka, Matt)
- Allow VRR to be toggled during fastsets (Ville)
- Allow arbitrary refresh rates with VRR eDP panels (Ville)
- Support async flips on linear buffers on display ver 12+  (Arun)
- New debugfs for display clock frequencies (Bhanuprakash)
- Taint kernel when force probing unsupported devices (Jani)
- Expose CRTC CTM property on ILK/SNB/VLV (Ville)

DRM subsystem changes:
- EDID changes to support further conversion to struct drm_edid (Jani)
- Move i915 DSC parameter code to common DRM helpers (Dmitry Baryshkov)

Refactoring and cleanups:
- CSC color refactoring (Ville)
- VRR cleanups (Ville)
- Finish i915 conversion to struct drm_edid (Jani)
- Start high level display driver file (Jani)
- Hotplug refactoring (Ville)
- Misc display refactoring and cleanups (Jani, Ville)
- Use device based logging for state checker warnings (Jani)
- Split out hotplug and display irq handling (Jani)
- Move display device info and probe under display/ (Matt)
- HDCP cleanups (Suraj)
- Use localized warning ignores instead of per file (Jani)
- Remove superfluous enum i915_drm_suspend_mode (Maarten)
- PSR, pfit, scaler and chicken register definition cleanups (Ville)
- Constify pointers to hwmon_channel_info (Krzysztof Kozlowski)
- Replace all non-returning strlcpy with strscpy (Azeem Shaikh)
- Refactor VBT aux channel and DDC pin mapping (Ville)
- Include cleanups (Jani)

Fixes:
- Fix modeset locking issue in DP MST HDCP (Suraj)
- Fix disconnected Type-C/DP-alt disable at probe (Imre)
- Fix HDMI PCON DSC usage and color conversions (Ankit)
- Fix g4x HDMI infoframe/audio transmission port usage (Ville)
- Avoid use-after-free when DP connector init fails (Maarten)
- Fix voltage level for 480 MHz CDCLK (Chaitanya)
- Check HPD live state during eDP probe (Ville)
- Fix active port PLL selection for secondary MST streams (Imre)
- Check pipe source size when using SKL+ scalers (Ville)
- Fix MIPI DSI sleep sequences (Hans de Goede)
- Fix DPCD register write order to match 128b/132b requirement (Arun)
- Increase AUX timeout for Type-C (Suraj)
- Communicate display power demands to pcode (Stan)
- Fix potential division by zero in DSC compute config (Nikita Zhandarovich)
- Fix fast wake AUX sync length (Jouni)
- Fix potential oops on intel_get_crtc_new_encoder() (Ville)

Merges:
- drm-next backmerges (Rodrigo, Jani)

----------------------------------------------------------------
Ankit Nautiyal (7):
      drm/i915/display/mtl: Fill port width in DDI_BUF_/TRANS_DDI_FUNC_/POR=
T_BUF_CTL for HDMI
      drm/i915/display: Add new member to configure PCON color conversion
      drm/i915/dp: Replace intel_dp.dfp members with the new crtc_state sin=
k_format
      drm/i915/dp: Configure PCON for conversion of output_format to YCbCr4=
44
      drm/i915/display: Use sink_format instead of ycbcr420_output flag
      drm/i915/dp: Add helper to get sink_format
      drm/i915/dp: Rearrange check for illegal mode and comments in mode_va=
lid

Anusha Srivatsa (1):
      drm/i915/mtl: Pin assignment for TypeC

Arun R Murthy (2):
      drm/i915/display/dp: 128/132b LT requirement
      drm/i915: Support Async Flip on Linear buffers

Azeem Shaikh (1):
      drm/i915: Replace all non-returning strlcpy with strscpy

Bhanuprakash Modem (1):
      drm/i915/debugfs: New debugfs for display clock frequencies

Chaitanya Kumar Borah (2):
      drm/i915/color: Fix typo for Plane CSC indexes
      drm/i915/display: Set correct voltage level for 480MHz CDCLK

Clint Taylor (3):
      drm/i915/mtl: Initial DDI port setup
      drm/i915: Add 16bit register/mask operators
      drm/i915/hdmi: C20 computed PLL frequencies

Dmitry Baryshkov (8):
      drm/i915/dsc: change DSC param tables to follow the DSC model
      drm/i915/dsc: move rc_buf_thresh values to common helper
      drm/i915/dsc: move DSC tables to DRM DSC helper
      drm/i915/dsc: stop using interim structure for calculated params
      drm/display/dsc: use flat array for rc_parameters lookup
      drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
      drm/display/dsc: include the rest of pre-SCR parameters
      drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters

Fei Yang (1):
      drm/i915/mtl: Set has_llc=3D0

Gustavo Sousa (1):
      drm/i915/mtl: Define mask for DDI AUX interrupts

Hans de Goede (1):
      drm/i915/dsi: Use unconditional msleep() instead of intel_dsi_msleep()

Imre Deak (17):
      drm/i915/dp_mst: Fix active port PLL selection for secondary MST stre=
ams
      drm/i915/adlp+: Disable DC5/6 states for TC port DDI/AUX and for comb=
o port AUX
      drm/i915/mtl: TypeC HPD live status query
      drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration
      drm/i915: Add helpers to reference/unreference a DPLL for a CRTC
      drm/i915: Make the CRTC state consistent during sanitize-disabling
      drm/i915: Update connector atomic state before crtc sanitize-disabling
      drm/i915: Separate intel_crtc_disable_noatomic_begin/complete()
      drm/i915: Factor out set_encoder_for_connector()
      drm/i915: Add support for disabling any CRTCs during HW readout/sanit=
ization
      drm/i915/dp: Add link training debug and error printing helpers
      drm/i915/dp: Convert link training error to debug message on disconne=
cted sink
      drm/i915/dp: Prevent link training fallback on disconnected port
      drm/i915/dp: Factor out intel_dp_get_active_pipes()
      drm/i915: Factor out a helper for handling atomic modeset locks/state
      drm/i915/tc: Call TypeC port flush_work/cleanup without modeset locks=
 held
      drm/i915/tc: Reset TypeC PHYs left enabled in DP-alt mode after the s=
ink disconnects

Jani Nikula (46):
      drm/i915/display: remove unnecessary i915_debugfs.h includes
      drm/i915: hide mkwrite_device_info() better
      drm/i915/display: remove intel_display_commit_duplicated_state()
      drm/i915/display: start high level display driver file
      drm/i915/display: move intel_modeset_probe_defer() to intel_display_d=
river.[ch]
      drm/i915/display: rename intel_modeset_probe_defer() -> intel_display=
_driver_probe_defer()
      drm/i915/display: move modeset probe/remove functions to intel_displa=
y_driver.c
      drm/i915/display: rename intel_display_driver_* functions
      drm/i915/display: add intel_display_reset.[ch]
      drm/i915/display: move display suspend/resume to intel_display_driver=
.[ch]
      drm/i915/display: rename intel_display_driver_suspend/resume functions
      drm/i915/display: add intel_display_driver_early_probe()
      drm/i915/pps: use intel_de_rmw() for panel unlock
      drm/i915: use explicit includes for i915_reg.h and i915_irq.h
      drm/i915/wm: remove stale and unused ilk_wm_max_level() declaration
      drm/i915/display: split out load detect to a separate file
      drm/i915/display: throw out struct intel_load_detect_pipe
      drm/i915: taint kernel when force probing unsupported devices
      drm/i915/hdcp: drop display/ prefix from include
      drm/i915/irq: relocate gmbus and dp aux irq handlers
      drm/i915/gt: drop dependency on VLV_DISPLAY_BASE
      drm/i915/bios: add helper for reading SPI
      drm/i915/dpll: drop a useless I915_STATE_WARN_ON()
      drm/i915/crtc: replace I915_STATE_WARN_ON() with I915_STATE_WARN()
      drm/i915/display: remove I915_STATE_WARN_ON()
      drm/i915/display: add i915 parameter to I915_STATE_WARN()
      drm/i915/irq: convert gen8_de_irq_handler() to void
      drm/i915/irq: split out hotplug irq handling
      drm/i915/irq: split out display irq handling
      drm/i915: fix intel_display_irq.c include order
      drm/i915: tweak language in fastset pipe config compare logging
      Merge drm/drm-next into drm-intel-next
      drm/i915: use localized __diag_ignore_all() instead of per file
      drm/edid: parse display info has_audio similar to is_hdmi
      drm/display/dp_mst: drop has_audio from struct drm_dp_mst_port
      drm/i915/dp: stop caching has_audio in struct intel_dp
      drm/i915/dp: stop caching has_hdmi_sink in struct intel_dp
      drm/i915/hdmi: stop caching has_audio in struct intel_hdmi
      drm/i915/hdmi: stop caching has_hdmi_sink in struct intel_hdmi
      drm/i915/sdvo: stop caching has_hdmi_monitor in struct intel_sdvo
      drm/i915/sdvo: stop caching has_hdmi_audio in struct intel_sdvo
      drm/edid: add drm_edid_read_switcheroo()
      drm/i915/lvds: switch to drm_edid_read_switcheroo()
      drm/edid: make drm_edid_duplicate() safe to call with NULL parameter
      drm/display/dp_mst: convert to struct drm_edid
      drm/i915/display: switch the rest of the connectors to struct drm_edid

Jos=C3=A9 Roberto de Souza (2):
      drm/i915/mtl/display: Implement DisplayPort sequences
      drm/i915: Initialize dkl_phy spin lock from display code path

Jouni H=C3=B6gander (1):
      drm/i915: Use 18 fast wake AUX sync len

Juha-Pekka Heikkila (2):
      drm/fourcc: define Intel Meteorlake related ccs modifiers
      drm/i915/mtl: Add handling for MTL ccs modifiers

Krzysztof Kozlowski (1):
      drm/i915: constify pointers to hwmon_channel_info

Maarten Lankhorst (2):
      drm/i915: Remove i915_drm_suspend_mode
      drm/i915: Flush power delayed put when connector init failed

Matt Roper (8):
      drm/i915: Use separate "DC off" power well for ADL-P and DG2
      drm/i915/mtl: Re-use ADL-P's "DC off" power well
      drm/i915/display: Move display device info to header under display/
      drm/i915: Convert INTEL_INFO()->display to a pointer
      drm/i915/display: Move display runtime info to display structure
      drm/i915/display: Make display responsible for probing its own IP
      drm/i915/display: Handle GMD_ID identification in display code
      drm/i915/display: Move feature test macros to intel_display_device.h

Mika Kahola (16):
      drm/i915/mtl: Add DP rates
      drm/i915/mtl: Create separate reg file for PICA registers
      drm/i915/mtl: Add vswing programming for C10 phys
      drm/i915/mtl: MTL PICA hotplug detection
      drm/i915/mtl: C20 PLL programming
      drm/i915/mtl: C20 HW readout
      drm/i915/mtl: Dump C20 pll hw state
      drm/i915/mtl: C20 port clock calculation
      drm/i915/mtl: Add voltage swing sequence for C20
      drm/i915/mtl: For DP2.0 10G and 20G rates use MPLLA
      drm/i915/mtl: Enabling/disabling sequence Thunderbolt pll
      drm/i915/mtl: Readout Thunderbolt HW state
      drm/i915/mtl: Power up TCSS
      drm/i915/mtl: Enable TC ports
      drm/i915/mtl: Fix expected reg value for Thunderbolt PLL disabling
      drm/i915/mtl: Reset only one lane in case of MFD

Nathan Chancellor (1):
      drm/i915: Fix clang -Wimplicit-fallthrough in intel_async_flip_check_=
hw()

Nikita Zhandarovich (1):
      drm/i915/dp: prevent potential div-by-zero

Nirmoy Das (1):
      drm/i915: Wait for active retire before i915_active_fini()

Radhakrishna Sripada (4):
      drm/i915/mtl: Add Support for C10 PHY message bus and pll programming
      drm/i915/mtl: Add C10 phy programming for HDMI
      drm/i915/mtl: Skip pcode qgv restrictions for MTL
      drm/i915/mtl: Add the missing CPU transcoder mask in intel_device_info

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Stanislav Lisovskiy (3):
      drm/i915: Communicate display power demands to pcode
      drm/i915: Fix NULL ptr deref by checking new_crtc_state
      drm/i915: Fix wrong condition in bxt_set_cdclk for DG2

Sui Jingfeng (1):
      drm/i915_drm.h: fix a typo

Suraj Kandpal (9):
      drm/i915/display: Increase AUX timeout for Type-C
      drm/i915/hdcp: Check if media_gt exists
      drm/i915/hdcp: add intel_atomic_state argument to hdcp_enable function
      drm/i915/hdcp: Remove enforce_type0 check outside loop
      drm/i915/hdcp: Fix modeset locking issue in hdcp mst
      drm/i915/hdcp: Fill hdcp2_streamid_type and k in appropriate places
      drm/i915/hdcp: Rename dev_priv to i915
      drm/i915/hdcp: Move away from master naming to arbiter
      drm/i915/hdcp: Rename comp_mutex to hdcp_mutex

Ville Syrj=C3=A4l=C3=A4 (60):
      drm/i915: Fix limited range csc matrix
      drm/i915: Introduce intel_csc_matrix struct
      drm/i915: Split chv_load_cgm_csc() into pieces
      drm/i915: Start using struct intel_csc_matrix for chv cgm csc
      drm/i915: Store ilk+ csc matrices in the crtc state
      drm/i915: Utilize crtc_state->csc on chv
      drm/i915: Sprinke a few sanity check WARNS during csc assignment
      drm/i915: Add hardware csc readout for ilk+
      drm/i915: Implement chv cgm csc readout
      drm/i915: Include the csc matrices in the crtc state dump
      drm/i915: Hook up csc into state checker
      drm/i915: Generalize planes_{enabling,disabling}()
      drm/i915/vrr: Eliminate redundant function arguments
      drm/i915/vrr: Make delayed vblank operational in VRR mode on adl/dg2
      drm/i915/vrr: Tell intel_crtc_update_active_timings() about VRR expli=
citly
      drm/i915/vrr: Relocate VRR enable/disable
      drm/i915/vrr: Allow VRR to be toggled during fastsets
      drm/i915: Flag purely internal commits to not clear crtc_state->inher=
ited
      drm/i915: Allow arbitrary refresh rates with VRR eDP panels
      drm/i915: Evade transcoder's vblank when doing seamless M/N changes
      drm/i915: Use min() instead of hand rolling it
      drm/i915: Make intel_get_crtc_new_encoder() less oopsy
      drm/i915: Make intel_{mpllb,c10pll}_state_verify() safer
      drm/i915: Introduce <platform>_hotplug_mask()
      drm/i915: Introduce intel_hpd_enable_detection()
      drm/i915: Check HPD live state during eDP probe
      drm/i915: Reuse <platform>_hotplug_mask() in .hpd_detection_setup()
      drm/i915: Check pipe source size when using skl+ scalers
      drm/i915: Relocate VBLANK_EVASION_TIME_US
      drm/i915: Relocate intel_atomic_setup_scalers()
      drm/i915: Relocate skl_get_pfit_config()
      drm/i915: Use REG_BIT() & co for the pre-ilk pfit registers
      drm/i915: Namespace pfit registers properly
      drm/i915: Use REG_BIT() & co. for ilk+ pfit registers
      drm/i915: Drop a useless forward declararion
      drm/i915: Fix up whitespace in some display chicken registers
      drm/i915: Clean up various display chicken registers
      drm/i915/psr: Clean up PSR register defininitions
      drm/i915/psr: Use intel_de_rmw()
      drm/i915/psr: Define more PSR mask bits
      drm/i915/psr: Add a FIXME for the PSR vs. AUX usage conflict
      drm/i915/psr: Include PSR_PERF_CNT in debugfs output on all platforms
      drm/i915/psr: Sprinkle cpu_transcoder variables around
      drm/i915: Define bitmasks for ilk pfit window pos/size
      drm/i915: Remove dead scaler register defines
      drm/i915: Rename skl+ scaler binding bits
      drm/i915: s/PS_COEE_INDEX_AUTO_INC/PS_COEF_INDEX_AUTO_INC/
      drm/i915: Define bitmasks for skl+ scaler window pos/size
      drm/i915: Use REG_BIT() & co. for pipe scaler registers
      drm/i915: Move has_hdmi_sink out from intel_hdmi_compute_config()
      drm/i915: Pick one HDMI port for infoframe/audio transmission on g4x
      drm/i915: Define more PS_CTRL bits
      drm/i915: Use REG_BIT() & co. for AUX CH registers
      drm/i915: Split map_aux_ch() into per-platform arrays
      drm/i915: Flip VBT DDC pin maps around
      drm/i915: Nuke intel_bios_is_port_dp_dual_mode()
      drm/i915: Expose crtc CTM property on ilk/snb
      drm/i915: Fix CHV CGM CSC coefficient sign handling
      drm/i915: Always enable CGM CSC on CHV
      drm/i915: Implement CTM property support for VLV

 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   55 +-
 drivers/gpu/drm/display/drm_dsc_helper.c           | 1006 +++++++
 drivers/gpu/drm/drm_edid.c                         |   38 +
 drivers/gpu/drm/i915/Makefile                      |   12 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    4 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  113 +
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |    4 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    2 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.h             |    1 -
 drivers/gpu/drm/i915/display/icl_dsi.c             |    1 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |  259 +-
 drivers/gpu/drm/i915/display/intel_atomic.h        |    4 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    1 +
 drivers/gpu/drm/i915/display/intel_audio.c         |    1 +
 drivers/gpu/drm/i915/display/intel_bios.c          |  251 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    3 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  209 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    1 +
 drivers/gpu/drm/i915/display/intel_color.c         |  725 ++++-
 drivers/gpu/drm/i915/display/intel_connector.c     |   18 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |    4 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   55 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   20 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   10 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   54 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 3046 ++++++++++++++++=
+++
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   50 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |  274 ++
 drivers/gpu/drm/i915/display/intel_ddi.c           |  498 +++-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   80 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 1167 ++------
 drivers/gpu/drm/i915/display/intel_display.h       |   69 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |    8 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   17 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  780 +++++
 .../gpu/drm/i915/display/intel_display_device.h    |  128 +
 .../gpu/drm/i915/display/intel_display_driver.c    |  583 ++++
 .../gpu/drm/i915/display/intel_display_driver.h    |   36 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   | 1668 +++++++++++
 drivers/gpu/drm/i915/display/intel_display_irq.h   |   81 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   52 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    3 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   92 +-
 .../drm/i915/display/intel_display_power_well.c    |    5 +-
 .../drm/i915/display/intel_display_power_well.h    |    2 +
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |   14 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |  135 +
 drivers/gpu/drm/i915/display/intel_display_reset.h |   14 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |    1 -
 drivers/gpu/drm/i915/display/intel_display_types.h |   73 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    9 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |    1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  361 ++-
 drivers/gpu/drm/i915/display/intel_dp.h            |    4 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   47 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |    3 +
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |   62 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  433 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   17 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   37 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   92 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    3 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |    1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |   42 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    7 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    5 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |    9 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |    2 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    5 +
 drivers/gpu/drm/i915/display/intel_gmbus.h         |    2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  798 ++---
 drivers/gpu/drm/i915/display/intel_hdcp.h          |   12 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   18 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  127 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    9 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    1 +
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   | 1442 +++++++++
 drivers/gpu/drm/i915/display/intel_hotplug_irq.h   |   35 +
 drivers/gpu/drm/i915/display/intel_hti.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_load_detect.c   |  225 ++
 drivers/gpu/drm/i915/display/intel_load_detect.h   |   20 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   16 +-
 drivers/gpu/drm/i915/display/intel_modeset_lock.c  |   50 +
 drivers/gpu/drm/i915/display/intel_modeset_lock.h  |   33 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  324 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   36 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   16 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  113 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   20 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    1 +
 drivers/gpu/drm/i915/display/intel_pps.c           |   16 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  261 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  207 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  108 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    7 +-
 drivers/gpu/drm/i915/display/intel_sprite.h        |   10 -
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |    1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  414 ++-
 drivers/gpu/drm/i915/display/intel_tc.h            |    5 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   20 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   15 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |    3 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  443 +--
 drivers/gpu/drm/i915/display/intel_vrr.c           |   64 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |   10 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  314 +-
 drivers/gpu/drm/i915/display/skl_scaler.h          |   12 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   26 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |    8 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    1 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    5 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    7 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    2 +
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    1 +
 drivers/gpu/drm/i915/gvt/edid.c                    |   10 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   98 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   73 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |    4 +-
 drivers/gpu/drm/i915/i915_irq.c                    | 3106 ++--------------=
----
 drivers/gpu/drm/i915/i915_irq.h                    |   48 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  390 +--
 drivers/gpu/drm/i915/i915_reg.h                    |  510 ++--
 drivers/gpu/drm/i915/i915_reg_defs.h               |  105 +
 drivers/gpu/drm/i915/i915_vma.c                    |    2 +
 drivers/gpu/drm/i915/intel_clock_gating.c          |    5 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  147 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   69 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    6 -
 drivers/gpu/drm/i915/intel_step.c                  |    8 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |    2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                   |   26 +-
 include/drm/display/drm_dp_mst_helper.h            |   14 +-
 include/drm/display/drm_dsc_helper.h               |    9 +
 include/drm/drm_connector.h                        |    8 +
 include/drm/drm_edid.h                             |    2 +
 include/drm/i915_drm.h                             |    2 +-
 include/drm/i915_hdcp_interface.h                  |    4 +-
 include/uapi/drm/drm_fourcc.h                      |   43 +
 147 files changed, 15470 insertions(+), 7367 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_phy.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_irq.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_irq.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hotplug_irq.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hotplug_irq.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_load_detect.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_load_detect.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_lock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_lock.h

--=20
Jani Nikula, Intel Open Source Graphics Center
