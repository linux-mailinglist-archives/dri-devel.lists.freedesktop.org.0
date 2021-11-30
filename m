Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3080463935
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103186EB4F;
	Tue, 30 Nov 2021 15:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA1B6EB4E;
 Tue, 30 Nov 2021 15:05:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="234955817"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="234955817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 07:05:06 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="512221218"
Received: from dmeldon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.12.174])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 07:05:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 30 Nov 2021 17:04:50 +0200
Message-ID: <87v909it0t.fsf@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-next-2021-11-30:
drm/i915 feature pull for v5.17:

Features and functionality:
- Implement per-lane DP drive settings for ICL+ (Ville)
- Enable runtime pm autosuspend by default (Tilak Tangudu)
- ADL-P DSI support (Vandita)
- Add support for pipe C and D DMC firmware (Anusha)
- Implement (near)atomic gamma LUT updates via vblank workers (Ville)
- Split plane updates to noarm+arm phases (Ville)
- Remove the CCS FB stride restrictions on ADL-P (Imre)
- Add PSR selective fetch support for biplanar formats (Jouni)
- Add support for display audio codec keepalive (Kai)
- VRR platform support for display 11 (Manasi)

Refactoring and cleanups:
- FBC refactoring and cleanups preparing for multiple FBC instances (Ville)
- PCH modeset refactoring, move to its own file (Ville)
- Refactor and simplify handling of modifiers (Imre)
- PXP cleanups (Ville)
- Display header and include refactoring (Jani)
- Some register macro cleanups (Ville)
- Refactor DP HDMI DFP limit code (Ville)

Fixes:
- Disable DSB usage for now due to incorrect gamma LUT updates (Ville)
- Check async flip state of every crtc and plane only once (Jos=C3=A9)
- Fix DPT FB suspend/resume (Imre)
- Fix black screen on reboot due to disabled DP++ TMDS output buffers (Vill=
e)
- Don't request GMBUS to generate irqs when called while irqs are off (Vill=
e)
- Fix type1 DVI DP dual mode adapter heuristics for modern platforms (Ville)
- Fix fix integer overflow in 128b/132b data rate calculation (Jani)
- Fix bigjoiner state readout (Ville)
- Build fix for non-x86 (Siva)
- PSR fixes (Jos=C3=A9, Jouni, Ville)
- Disable ADL-P underrun recovery (Jos=C3=A9)
- Fix DP link parameter usage before valid DPCD (Imre)
- VRR vblank and frame counter fixes (Ville)
- Fix fastsets on TypeC ports following a non-blocking modeset (Imre)
- Compiler warning fixes (Nathan Chancellor)
- Fix DSI HS mode commands (William Tseng)
- Error return fixes (Dan Carpenter)
- Update memory bandwidth calculations (Radhakrishna)
- Implement WM0 cursor WA for DG2 (Stan)
- Fix DSI Double pixelclock on read-back for dual-link panels (Hans de Goed=
e)
- HDMI 2.1 PCON FRL configuration fixes (Ankit)

Merges:
- DP link training delay helpers, via topic branch (Jani)
- Backmerge drm-next (Jani)

BR,
Jani.

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-11-30

for you to fetch changes up to 74ba89c08e309bfeb2b2f401bf588ab54a1542fe:

  drm/i915: Fix DPT suspend/resume on !HAS_DISPLAY platforms (2021-11-29 22=
:21:29 +0200)

----------------------------------------------------------------
drm/i915 feature pull for v5.17:

Features and functionality:
- Implement per-lane DP drive settings for ICL+ (Ville)
- Enable runtime pm autosuspend by default (Tilak Tangudu)
- ADL-P DSI support (Vandita)
- Add support for pipe C and D DMC firmware (Anusha)
- Implement (near)atomic gamma LUT updates via vblank workers (Ville)
- Split plane updates to noarm+arm phases (Ville)
- Remove the CCS FB stride restrictions on ADL-P (Imre)
- Add PSR selective fetch support for biplanar formats (Jouni)
- Add support for display audio codec keepalive (Kai)
- VRR platform support for display 11 (Manasi)

Refactoring and cleanups:
- FBC refactoring and cleanups preparing for multiple FBC instances (Ville)
- PCH modeset refactoring, move to its own file (Ville)
- Refactor and simplify handling of modifiers (Imre)
- PXP cleanups (Ville)
- Display header and include refactoring (Jani)
- Some register macro cleanups (Ville)
- Refactor DP HDMI DFP limit code (Ville)

Fixes:
- Disable DSB usage for now due to incorrect gamma LUT updates (Ville)
- Check async flip state of every crtc and plane only once (Jos=C3=A9)
- Fix DPT FB suspend/resume (Imre)
- Fix black screen on reboot due to disabled DP++ TMDS output buffers (Vill=
e)
- Don't request GMBUS to generate irqs when called while irqs are off (Vill=
e)
- Fix type1 DVI DP dual mode adapter heuristics for modern platforms (Ville)
- Fix fix integer overflow in 128b/132b data rate calculation (Jani)
- Fix bigjoiner state readout (Ville)
- Build fix for non-x86 (Siva)
- PSR fixes (Jos=C3=A9, Jouni, Ville)
- Disable ADL-P underrun recovery (Jos=C3=A9)
- Fix DP link parameter usage before valid DPCD (Imre)
- VRR vblank and frame counter fixes (Ville)
- Fix fastsets on TypeC ports following a non-blocking modeset (Imre)
- Compiler warning fixes (Nathan Chancellor)
- Fix DSI HS mode commands (William Tseng)
- Error return fixes (Dan Carpenter)
- Update memory bandwidth calculations (Radhakrishna)
- Implement WM0 cursor WA for DG2 (Stan)
- Fix DSI Double pixelclock on read-back for dual-link panels (Hans de Goed=
e)
- HDMI 2.1 PCON FRL configuration fixes (Ankit)

Merges:
- DP link training delay helpers, via topic branch (Jani)
- Backmerge drm-next (Jani)

----------------------------------------------------------------
Andy Shevchenko (1):
      agp/intel-gtt: Replace kernel.h with the necessary inclusions

Ankit Nautiyal (2):
      drm/i915/dp: Optimize the FRL configuration for HDMI2.1 PCON
      drm/i915/dp: For PCON TMDS mode set only the relavant bits in config =
DPCD

Anusha Srivatsa (1):
      i915/display/dmc: Add Support for PipeC and PipeD DMC

Colin Ian King (1):
      drm/i915: make array states static const

Dan Carpenter (2):
      drm/i915: pin: delete duplicate check in intel_pin_and_fence_fb_obj()
      drm/i915/guc: fix NULL vs IS_ERR() checking

Hans de Goede (1):
      drm/i915/vlv_dsi: Double pixelclock on read-back for dual-link panels

He Ying (1):
      drm: Small optimization to intel_dp_mst_atomic_master_trans_check

Imre Deak (31):
      drm/i915/dp: Skip the HW readout of DPCD on disabled encoders
      drm/i915/dp: Ensure sink rate values are always valid
      drm/i915/dp: Ensure max link params are always valid
      drm/i915/dp: Ensure sink/link max lane count values are always valid
      drm/i915/dp: Sanitize sink rate DPCD register values
      drm/i915/dp: Sanitize link common rate array lookups
      drm/i915: Add a table with a descriptor for all i915 modifiers
      drm/i915: Move intel_get_format_info() to intel_fb.c
      drm/i915: Add tiling attribute to the modifier descriptor
      drm/i915: Simplify the modifier check for interlaced scanout support
      drm/i915: Unexport is_semiplanar_uv_plane()
      drm/i915: Move intel_format_info_is_yuv_semiplanar() to intel_fb.c
      drm/i915: Add a platform independent way to get the RC CCS CC plane
      drm/i915: Handle CCS CC planes separately from CCS AUX planes
      drm/i915: Add a platform independent way to check for CCS AUX planes
      drm/i915: Move is_ccs_modifier() to intel_fb.c
      drm/i915: Add functions to check for RC CCS CC and MC CCS modifiers
      drm/i915/fb: Don't report MC CCS plane capability on GEN<12
      drm/i915/fb: Don't store bitmasks in the intel_plane_caps enum
      drm/i915/fb: Fold modifier CCS type/tiling attribute to plane caps
      drm/i915/fb: Fix rounding error in subsampled plane size calculation
      drm/i915/adlp/fb: Prevent the mapping of redundant trailing padding N=
ULL pages
      drm/i915/fb: Factor out functions to remap contiguous FB obj pages
      drm/i915/adlp/fb: Fix remapping of linear CCS AUX surfaces
      drm/i915/fb: Rename i915_color_plane_view::stride to mapping_stride
      drm/i915/adlp/fb: Remove restriction on semiplanar UV plane offset
      drm/i915/adlp/fb: Remove restriction on CCS AUX plane strides
      drm/i915: Factor out i915_ggtt_suspend_vm/i915_ggtt_resume_vm()
      drm/i915: Restore memory mapping for DPT FBs across system suspend/re=
sume
      drm/i915: Fix fastsets on TypeC ports following a non-blocking modeset
      drm/i915: Fix DPT suspend/resume on !HAS_DISPLAY platforms

Jani Nikula (29):
      Merge tag 'topic/drm-dp-training-delay-helpers-2021-10-19' of git://a=
nongit.freedesktop.org/drm/drm-intel into drm-intel-next
      drm/i915/dp: use new link training delay helpers
      Revert "drm/i915/bios: gracefully disable dual eDP for now"
      drm/i915/cdclk: put the cdclk vtables in const data
      drm/i915/dp: fix integer overflow in 128b/132b data rate calculation
      drm/i915/dsc: demote noisy drm_info() to drm_kms_dbg()
      Merge drm/drm-next into drm-intel-next
      drm/i915/audio: group audio under anonymous struct in drm_i915_private
      drm/i915/audio: name the audio sub-struct in drm_i915_private
      drm/i915/audio: define the audio struct separately from drm_i915_priv=
ate
      drm/i915/audio: move intel_audio_funcs internal to intel_audio.c
      drm/i915/audio: rename intel_init_audio_hooks to intel_audio_hooks_in=
it
      drm/i915: include intel-gtt.h only where needed
      agp/intel-gtt: reduce intel-gtt dependencies more
      drm/i915/fbc: fix the FBC kernel-doc warnings
      drm/i915/driver: rename i915_drv.c to i915_driver.c
      drm/i915/driver: rename driver to i915_drm_driver
      drm/i915/driver: add i915_driver_ prefix to functions
      drm/i915: drop intel_display.h include from intel_ddi.h
      drm/i915: drop intel_display.h include from intel_dpll_mgr.h
      drm/i915/debugfs: move debug printing to intel_display_power.c
      drm/i915: move structs from intel_display_power.h to .c
      drm/i915: drop intel_display.h include from intel_display_power.h
      drm/i915/pxp: fix includes for headers in include/drm
      Merge drm/drm-next into drm-intel-next
      drm/i915/dsi: split out intel_dsi_vbt.h
      drm/i915/dsi: split out vlv_dsi_pll.h
      drm/i915/dsi: split out vlv_dsi.h
      drm/i915/dsi: split out icl_dsi.h

Javier Martinez Canillas (1):
      drm/i915: Fix comment about modeset parameters

Jos=C3=A9 Roberto de Souza (8):
      drm/i915/display: Rename POWER_DOMAIN_DPLL_DC_OFF to POWER_DOMAIN_DC_=
OFF
      drm/i915/display: Add warn_on in intel_psr_pause()
      drm/i915/display: Wait PSR2 get out of deep sleep to update pipe
      drm/i915/adlp: Extend PSR2 support in transcoder B
      drm/i915/adlp: Implement workaround 16013190616
      drm/i915/display: Check async flip state of every crtc and plane once
      drm/i915/display/adlp: Disable underrun recovery
      drm/i915/psr: Fix PSR2 handling of multiplanar format

Jouni H=C3=B6gander (2):
      drm/i915/display: Add initial selective fetch support for biplanar fo=
rmats
      Revert "drm/i915/display/psr: Do full fetch when handling multi-plana=
r formats"

Kai Vehmanen (1):
      drm/i915/display: program audio CDCLK-TS for keepalives

Lucas De Marchi (1):
      drm/i915: remove CNL leftover

Manasi Navare (1):
      drm/i915/: Extend VRR platform support to Gen 11

Mullati, Siva (1):
      drm/i915: abstraction for iosf to compile on all archs

Nathan Chancellor (1):
      drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk=
()

Radhakrishna Sripada (2):
      drm/i915: Update memory bandwidth formulae
      drm/i915: Fix Memory BW formulae for ADL-P

Rodrigo Vivi (2):
      drm/i915: Clean-up bonding debug message.
      drm/i915: Don't propagate the gen split confusion further

Stanislav Lisovskiy (3):
      drm/i915/dg2: Implement WM0 cursor WA for DG2
      drm/i915/dg2: Tile 4 plane format support
      Revert "drm/i915/dg2: Tile 4 plane format support"

Tilak Tangudu (2):
      drm/i915: Disable D3Cold in s2idle and runtime pm
      drm/i915/rpm: Enable runtime pm autosuspend by default

Vandita Kulkarni (4):
      Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
      drm/i915/dsi/xelpd: Fix the bit mask for wakeup GB
      drm/i915/dsi/xelpd: Add DSI transcoder support
      drm/i915/dsi/xelpd: Disable DC states in Video mode

Ville Syrj=C3=A4l=C3=A4 (79):
      drm/i915: Move the pxp plane state computation
      drm/i915: Fix up skl_program_plane() pxp stuff
      drm/i915: Remove the drm_dbg() from the vblank evade critical section
      drm/i915: Rename intel_load_plane_csc_black()
      drm/i915: Move PCH refclock stuff into its own file
      drm/i915: Move PCH modeset code to its own file
      drm/i915: Clean up the {ilk,lpt}_pch_enable() calling convention
      drm/i915: Move LPT PCH readout code
      drm/i915: Extract ilk_pch_get_config()
      drm/i915: Move iCLKIP readout to the pch code
      drm/i915: Introduce ilk_pch_disable() and ilk_pch_post_disable()
      drm/i915: Move intel_ddi_fdi_post_disable() to fdi code
      drm/i915: Introduce lpt_pch_disable()
      drm/i915: Move function prototypes to the correct header
      drm/i915/hdmi: Split intel_hdmi_bpc_possible() to source vs. sink pair
      drm/i915/hdmi: Introduce intel_hdmi_is_ycbr420()
      drm/i915/hdmi: Introduce intel_hdmi_tmds_clock()
      drm/i915/hdmi: Unify "4:2:0 also" logic between .mode_valid() and .co=
mpute_config()
      drm/i915/hdmi: Extract intel_hdmi_output_format()
      drm/i915/psr: Disable PSR before modesets turn off all planes
      Revert "drm/i915/display: Disable audio, DRRS and PSR before planes"
      drm/i915: Disable all planes before modesetting any pipes
      drm/i915: Introduce intel_master_crtc()
      drm/i915: Simplify intel_crtc_copy_uapi_to_hw_state_nomodeset()
      drm/i915: Split PPS write from DSC enable
      drm/i915: Perform correct cpu_transcoder readout for bigjoiner
      drm/i915: Reduce bigjoiner special casing
      drm/i915: Nuke PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE
      drm/i915: Fix type1 DVI DP dual mode adapter heuristic for modern pla=
tforms
      drm/i915: Fix icl+ combo phy static lane power down setup
      drm/i915: Don't request GMBUS to generate irqs when called while irqs=
 are off
      drm/i915/hdmi: Turn DP++ TMDS output buffers back on in encoder->shut=
down()
      drm/i915: Stop using group access when progrmming icl combo phy TX
      drm/i915: Query the vswing levels per-lane for icl combo phy
      drm/i915: Query the vswing levels per-lane for icl mg phy
      drm/i915: Query the vswing levels per-lane for tgl dkl phy
      drm/i915: Query the vswing levels per-lane for snps phy
      drm/i915: Enable per-lane drive settings for icl+
      drm/i915: Use intel_de_rmw() for tgl dkl phy programming
      drm/i915: Use intel_de_rmw() for icl mg phy programming
      drm/i915: Use intel_de_rmw() for icl combo phy programming
      drm/i915: Reject planar formats when doing async flips
      drm/i915: Fix async flip with decryption and/or DPT
      drm/i915: Fix up the sprite namespacing
      drm/i915: Split update_plane() into update_noarm() + update_arm()
      drm/i915: Split skl+ plane update into noarm+arm pair
      drm/i915: Split pre-skl primary plane update into noarm+arm pair
      drm/i915: Split g4x+ sprite plane update into noarm+arm pair
      drm/i915: Split ivb+ sprite plane update into noarm+arm pair
      drm/i915: Split vlv/chv sprite plane update into noarm+arm pair
      drm/i915: Do vrr push before sampling the frame counter
      drm/i915: Use vblank workers for gamma updates
      drm/i915: Use unlocked register accesses for LUT loads
      drm/i915: Call intel_update_active_dpll() for both bigjoiner pipes
      drm/i915/fbc: Extract snb_fbc_program_fence()
      drm/i915/fbc: Extract {skl,glk}_fbc_program_cfb_stride()
      drm/i915/fbc: Just use params->fence_y_offset always
      drm/i915/fbc: Introduce intel_fbc_is_compressing()
      drm/i915/fbc: Extract helpers to compute FBC control register values
      drm/i915/fbc: Introduce intel_fbc_funcs
      drm/i915/fbc: Introduce .nuke() vfunc
      drm/i915/fbc: s/gen7/ivb/
      drm/i915/fbc: Introduce .program_cfb() vfunc
      drm/i915/fbc: Introduce intel_fbc_set_false_color()
      drm/i915/fbc: Nuke BDW_FBC_COMP_SEG_MASK
      drm/i915/fbc: Clean up all register defines
      drm/i915/fbc: Finish polishing FBC1 registers
      drm/i915: Relocate FBC_LLC_READ_CTRL
      drm/i915/fbc: s/dev_priv/i915/
      drm/i915/fbc: Start passing around intel_fbc
      drm/1915/fbc: Replace plane->has_fbc with a pointer to the fbc instan=
ce
      drm/i915: Move vrr push after the frame counter sampling again
      drm/i915: Do vblank evasion correctly if vrr push has already been se=
nt
      drm/i915: Fix framestart_delay commens in VRR code
      drm/i915: Declare .(de)gamma_lut_tests for icl+
      drm/i915: Disable DSB usage for now
      drm/i915: Clean up FPGA_DBG/CLAIM_ER bits
      drm/i915: Clean up DPINVGTT/VLV_DPFLIPSTAT bits
      drm/i915: Clean up CRC register defines

William Tseng (2):
      drm/i915/dsi: disable lpdt if it is not enabled
      drm/i915/dsi: transmit brightness command in HS state

 drivers/char/agp/intel-gtt.c                       |    1 +
 drivers/gpu/drm/drm_dp_helper.c                    |  153 +-
 drivers/gpu/drm/i915/Kconfig                       |    2 +-
 drivers/gpu/drm/i915/Makefile                      |    4 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  134 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   10 +-
 drivers/gpu/drm/i915/display/icl_dsi.h             |   15 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   89 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   23 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  140 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |    4 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  213 ++-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    5 +
 drivers/gpu/drm/i915/display/intel_color.c         |  130 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   13 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |  107 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |    7 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |   69 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  348 ++--
 drivers/gpu/drm/i915/display/intel_ddi.h           |    5 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 1920 ++++------------=
----
 drivers/gpu/drm/i915/display/intel_display.h       |   17 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   69 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  132 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |  102 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   51 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  161 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   43 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   32 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    7 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   58 +
 drivers/gpu/drm/i915/display/intel_dpt.h           |    4 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |   42 -
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    4 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.h       |   22 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  706 +++++--
 drivers/gpu/drm/i915/display/intel_fb.h            |   31 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   12 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           | 1000 +++++-----
 drivers/gpu/drm/i915/display/intel_fbc.h           |   11 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  136 +-
 drivers/gpu/drm/i915/display/intel_fdi.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |    2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   13 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  117 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   42 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  501 +++++
 drivers/gpu/drm/i915/display/intel_pch_display.h   |   27 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  648 +++++++
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |   21 +
 drivers/gpu/drm/i915/display/intel_psr.c           |  125 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    3 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  257 +--
 drivers/gpu/drm/i915/display/intel_sprite.h        |    4 -
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   65 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   18 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    1 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |    1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  462 +++--
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    8 +
 drivers/gpu/drm/i915/display/vlv_dsi.h             |   19 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    1 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |   38 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  266 ++-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    2 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    2 +
 drivers/gpu/drm/i915/{i915_drv.c =3D> i915_driver.c} |   43 +-
 drivers/gpu/drm/i915/i915_driver.h                 |   24 +
 drivers/gpu/drm/i915/i915_drv.h                    |   75 +-
 drivers/gpu/drm/i915/i915_iosf_mbi.h               |   42 +
 drivers/gpu/drm/i915/i915_irq.c                    |    2 +-
 drivers/gpu/drm/i915/i915_module.c                 |    4 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   22 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  358 ++--
 drivers/gpu/drm/i915/i915_switcheroo.c             |    5 +-
 drivers/gpu/drm/i915/i915_trace.h                  |   75 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |   19 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   41 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    3 +
 drivers/gpu/drm/i915/intel_uncore.c                |    2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |    6 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |    3 +-
 include/drm/drm_dp_helper.h                        |   21 +-
 include/drm/intel-gtt.h                            |    8 +-
 93 files changed, 5549 insertions(+), 3910 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/icl_dsi.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsi_vbt.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_display.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch_refclk.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dsi_pll.h
 rename drivers/gpu/drm/i915/{i915_drv.c =3D> i915_driver.c} (97%)
 create mode 100644 drivers/gpu/drm/i915/i915_driver.h
 create mode 100644 drivers/gpu/drm/i915/i915_iosf_mbi.h

--=20
Jani Nikula, Intel Open Source Graphics Center
