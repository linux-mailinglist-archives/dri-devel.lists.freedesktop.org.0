Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B9438964C
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1BB6EE64;
	Wed, 19 May 2021 19:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602D66EE64;
 Wed, 19 May 2021 19:10:33 +0000 (UTC)
IronPort-SDR: 7hYbda+/9JWuALRa6RaKM+MeCUSPHEvxAQNfH7r5/PppyBtU7tmM2//bXThFI0o38TaAUFRTAZ
 xItRnXpsNzRA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262284648"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262284648"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 12:10:30 -0700
IronPort-SDR: y4XX4bdmnrZAFb0zR4KZQN2GXVwlj686Ewrzp8rwKIBF99zea/0sbWrBt+y4SXq05v1o2Ka8/H
 C9dih68FdmWg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="411859886"
Received: from jignasap-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.254.2.165])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 12:10:27 -0700
Date: Wed, 19 May 2021 15:10:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <YKVioeu0JkUAlR7y@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes the first pull request targeting 5.14.

Main highlight goes to the ADL-P platform and display XeLPD IP
enabling patches. Also with a refactor on how we handle the graphics
and display IP versions.

drm-intel-next-2021-05-19-1:
Core Changes:

- drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP spec (Jose).

Driver Changes:

- Display plane clock rates fixes and improvements (Ville).
- Uninint DMC FW loader state during shutdown (Imre).
- Convert snprintf to sysfs_emit (Xuezhi).
- Fix invalid access to ACPI _DSM objects (Takashi).
- A big refactor around how i915 addresses the graphics
  and display IP versions. (Matt, Lucas).
- Backlight fix (Lyude).
- Display watermark and DBUF fixes (Ville).
- HDCP fix (Anshuman).
- Improve cases where display is not available (Jose).
- Defeature PSR2 for RKL and ALD-S (Jose).
- VLV DSI panel power fixes and improvements (Hans).
- display-12 workaround (Jose).
- Fix modesetting (Imre).
- Drop redundant address-of op before lttpr_common_caps array (Imre).
- Fix compiler checks (Jose, Jason).
- GLK display fixes (Ville).
- Fix error code returns (Dan).
- eDP novel: back again to slow and wide link training everywhere (Kai-Heng).
- Abstract DMC FW path (Rodrigo).
- Preparation and changes for upcoming
  XeLPD display IP (Jose, Matt, Ville, Juha-Pekka, Animesh).
- Fix comment typo in DSI code (zuoqilin).
- Simplify CCS and UV plane alignment handling (Imre).
- PSR Fixes on TGL (Gwan-gyeong, Jose).
- Add intel_dp_hdcp.h and rename init (Jani).
- Move crtc and dpll declarations around (Jani).
- Fix pre-skl DP AUX precharge length (Ville).
- Remove stray newlines from random files (Ville).
- crtc->index and intel_crtc+drm_crtc pointer clean-up (Ville).
- Add frontbuffer tracking tracepoints (Ville).
- ADL-S PCI ID updates (Anand).
- Use unique backlight device names (Jani).
- A few clean-ups on i915/audio (Jani).
- Use intel_framebuffer instead of drm one on intel_fb functions (Imre).
- Add the missing MC CCS/XYUV8888 format support on display >= 12 (Imre).
- Nuke display error state (Ville).
- ADL-P initial enablement patches
  starting to land (Clint, Imre, Jose, Umesh, Vandita, Mika).
- Display clean-up around VBT and the strap bits (Lucas).
- Try YCbCr420 color when RGB fails (Werner).
- More PSR fixes and improvements (Jose).
- Other generic display code clean-up (Jose, Ville).
- Use correct downstream caps for check Src-Ctl mode for PCON (Ankit).
- Disable HiZ Raw Stall Optimization on broken gen7 (Simon).

Thanks,
Rodrigo.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-05-19-1

for you to fetch changes up to ec279384c6a02cf04a96054e82b1294a7aad6577:

  drm/i915: Initialize err in remap_io_sg() (2021-05-18 11:00:07 -0700)

----------------------------------------------------------------
Core Changes:

- drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP spec (Jose).

Driver Changes:

- Display plane clock rates fixes and improvements (Ville).
- Uninint DMC FW loader state during shutdown (Imre).
- Convert snprintf to sysfs_emit (Xuezhi).
- Fix invalid access to ACPI _DSM objects (Takashi).
- A big refactor around how i915 addresses the graphics
  and display IP versions. (Matt, Lucas).
- Backlight fix (Lyude).
- Display watermark and DBUF fixes (Ville).
- HDCP fix (Anshuman).
- Improve cases where display is not available (Jose).
- Defeature PSR2 for RKL and ALD-S (Jose).
- VLV DSI panel power fixes and improvements (Hans).
- display-12 workaround (Jose).
- Fix modesetting (Imre).
- Drop redundant address-of op before lttpr_common_caps array (Imre).
- Fix compiler checks (Jose, Jason).
- GLK display fixes (Ville).
- Fix error code returns (Dan).
- eDP novel: back again to slow and wide link training everywhere (Kai-Heng).
- Abstract DMC FW path (Rodrigo).
- Preparation and changes for upcoming
  XeLPD display IP (Jose, Matt, Ville, Juha-Pekka, Animesh).
- Fix comment typo in DSI code (zuoqilin).
- Simplify CCS and UV plane alignment handling (Imre).
- PSR Fixes on TGL (Gwan-gyeong, Jose).
- Add intel_dp_hdcp.h and rename init (Jani).
- Move crtc and dpll declarations around (Jani).
- Fix pre-skl DP AUX precharge length (Ville).
- Remove stray newlines from random files (Ville).
- crtc->index and intel_crtc+drm_crtc pointer clean-up (Ville).
- Add frontbuffer tracking tracepoints (Ville).
- ADL-S PCI ID updates (Anand).
- Use unique backlight device names (Jani).
- A few clean-ups on i915/audio (Jani).
- Use intel_framebuffer instead of drm one on intel_fb functions (Imre).
- Add the missing MC CCS/XYUV8888 format support on display >= 12 (Imre).
- Nuke display error state (Ville).
- ADL-P initial enablement patches
  starting to land (Clint, Imre, Jose, Umesh, Vandita, Mika).
- Display clean-up around VBT and the strap bits (Lucas).
- Try YCbCr420 color when RGB fails (Werner).
- More PSR fixes and improvements (Jose).
- Other generic display code clean-up (Jose, Ville).
- Use correct downstream caps for check Src-Ctl mode for PCON (Ankit).
- Disable HiZ Raw Stall Optimization on broken gen7 (Simon).

----------------------------------------------------------------
Anand Moon (1):
      drm/i915/adl_s: ADL-S platform Update PCI ids for Mobile BGA

Animesh Manna (3):
      drm/i915/bigjoiner: Mode validation with uncompressed pipe joiner
      drm/i915/bigjoiner: Avoid dsc_compute_config for uncompressed bigjoiner
      drm/i915/bigjoiner: atomic commit changes for uncompressed joiner

Ankit Nautiyal (1):
      drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON

Anshuman Gupta (1):
      drm/i915/hdcp: Fix uninitialized symbol 'msg_end'

Anusha Srivatsa (1):
      drm/i915/adl_p: Add cdclk support for ADL-P

Clinton Taylor (3):
      drm/i915/adl_p: Add PCI Devices IDs
      drm/i915/adl_p: ADL_P device info enabling
      drm/i915/adl_p: Add PCH support

Dan Carpenter (1):
      drm/i915: fix an error code in intel_overlay_do_put_image()

Gwan-gyeong Mun (2):
      drm/i915/display/psr: Disable DC3CO when the PSR2 is used
      drm/i915/display: Disable PSR2 if TGL Display stepping is B1 from A0

Hans de Goede (2):
      drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disabling the panel
      drm/i915/display/vlv_dsi: Move panel_pwr_cycle_delay to next panel-on

Imre Deak (9):
      drm/i915: Uninit the DMC FW loader state during shutdown
      drm/i915: Fix modesetting in case of unexpected AUX timeouts
      drm/i915: Drop redundant address-of op before lttpr_common_caps array
      drm/i915: Simplify CCS and UV plane alignment handling
      drm/i915: Pass intel_framebuffer instad of drm_framebuffer to intel_fill_fb_info()
      drm/i915/tgl+: Add the missing MC CCS/XYUV8888 format support
      drm/i915/adl_p: Disable support for 90/270 FB rotation
      drm/i915/adl_p: Require a minimum of 8 tiles stride for DPT FBs
      drm/i915/adl_p: Enable remapping to pad DPT FB strides to POT

Jani Nikula (7):
      Merge drm/drm-next into drm-intel-next
      drm/i915/hdcp: add intel_dp_hdcp.h and rename init accordingly
      drm/i915/display: move crtc and dpll declarations where they belong
      drm/i915/backlight: clean up backlight device register
      drm/i915/backlight: use unique backlight device names
      drm/i915/audio: simplify, don't mask out in all branches
      drm/i915/audio: fix indentation, remove extra braces

Jason Ekstrand (1):
      drm/i915/pm: Make the wm parameter of print_wm_latency a pointer

José Roberto de Souza (25):
      drm/i915: Skip display interruption setup when display is not available
      drm/i915: Do not set any power wells when there is no display
      drm/i915: skip display initialization when there is no display
      drm/i915/display: Defeature PSR2 for RKL and ADL-S
      drm/i915/display: Implement Wa_14013723622
      Revert "drm/i915/tgl/psr: Fix glitches when doing frontbuffer modifications"
      drm/i915/display/psr: Fix cppcheck warnings
      drm/i915/display/xelpd: Do not program EDP_Y_COORDINATE_ENABLE
      drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP spec
      drm/i915/display: Disable PSR2 sel fetch in TGL pre-production
      drm/i915/xelpd: Fallback to plane stride limitations when using DPT
      drm/i915/adl_p: Add stride restriction when using DPT
      drm/i915/display: Fill PSR state during hardware configuration read out
      drm/i915/display: Replace intel_psr_enabled() calls by intel_crtc_state check
      drm/i915/display: Drop duplicated code in intel_dp_set_infoframes()
      drm/i915/display: Drop dead code from hsw_read_infoframe()
      drm/i915/display/xelpd: Implement Wa_14013475917
      drm/i915/xelpd: Provide port/phy mapping for vbt
      drm/i915/display/tc: Rename safe_mode functions ownership
      drm/i915/adl_p: Enable modular fia
      drm/i915/adl_p: Add IPs stepping mapping
      drm/i915/adl_p: Implement Wa_22011091694
      drm/i915/display/adl_p: Implement Wa_22011320316
      drm/i915/adl_p: Disable CCS on a-step (Wa_22011186057)
      drm/i915: Initialize err in remap_io_sg()

Juha-Pekka Heikkilä (1):
      drm/i915/xelpd: Support 128k plane stride

Kai-Heng Feng (1):
      drm/i915/dp: Use slow and wide link training for everything

Lucas De Marchi (16):
      drm/i915/display: use DISPLAY_VER() on remaining users
      drm/i915: rename display.version to display.ver
      drm/i915/display: rename display version macros
      drm/i915: add macros for graphics and media versions
      drm/i915/gt: replace gen use in intel_engine_cs
      drm/i915/selftests: replace unused mask with simple version
      drm/i915/selftests: eliminate use of gen_mask
      drm/i915: finish removal of gen_mask
      drm/i915: eliminate remaining uses of intel_device_info->gen
      drm/i915: finish removal of gen from intel_device_info
      drm/i915: add media and display versions to device_info print
      drm/i915: split dgfx features from gen 12
      drm/i915/display: move vbt check to intel_ddi_init()
      drm/i915/display: remove FIXME comment for intended feature
      drm/i915/display: remove strap checks from gen 9
      drm/i915/display: hide workaround for broken vbt in intel_bios.c

Lyude Paul (1):
      drm/i915/dpcd_bl: Don't try vesa interface unless specified by VBT

Matt Roper (11):
      drm/i915/display: Eliminate IS_GEN9_{BC,LP}
      drm/i915/display: Eliminate IS_GEN9_{BC,LP}
      drm/i915/xelpd: add XE_LPD display characteristics
      drm/i915/xelpd: Handle proper AUX interrupt bits
      drm/i915/xelpd: Define plane capabilities
      drm/i915/xelpd: Add XE_LPD power wells
      drm/i915/xelpd: Required bandwidth increases when VT-d is active
      drm/i915/xelpd: Add Wa_14011503030
      drm/i915/xelpd: Handle new location of outputs D and E
      drm/i915/xelpd: Increase maximum watermark lines to 255
      drm/i915/adl_p: Extend PLANE_WM bits for blocks & lines

Mika Kahola (1):
      drm/i915/adl_p: Enable/disable loadgen sharing

Rodrigo Vivi (3):
      Merge tag 'topic/intel-gen-to-ver-2021-04-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next
      drm/i915/dmc: Let's abstract the dmc path.
      Merge drm/drm-next into drm-intel-next

Simon Rettberg (1):
      drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7

Takashi Iwai (1):
      drm/i915: Fix invalid access to ACPI _DSM objects

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Enable OA formats for ADL_P

Vandita Kulkarni (3):
      drm/i915/display/dsc: Refactor intel_dp_dsc_compute_bpp
      drm/i915/xelpd: Support DP1.4 compression BPPs
      drm/i915: Get slice height before computing rc params

Ville Syrjälä (33):
      drm/i915: Split out glk_plane_min_cdclk()
      drm/i915: Update plane ratio for icl+
      drm/i915: Don't zero out the Y plane's watermarks
      drm/i915: Restore lost glk FBC 16bpp w/a
      drm/i915: Restore lost glk ccs w/a
      drm/i915: Disable LTTPR detection on GLK once again
      drm/i915: Don't use {skl, cnl}_hpd_pin() for bxt/glk
      drm/i915: Remove a few redundant glk checks
      drm/i915: Extract intel_adjusted_rate()
      drm/i915: Reuse intel_adjusted_rate() for pfit pixel rate adjustment
      drm/i915: Collect dbuf device info into a sub-struct
      drm/i915: Handle dbuf bypass path allocation earlier
      drm/i915: Store dbuf slice mask in device info
      drm/i915: Use intel_dbuf_slice_size()
      drm/i915: Use intel_de_rmw() for DBUF_POWER_REQUEST
      drm/i915: Polish for_each_dbuf_slice()
      drm/i915: Add enabledisable()
      drm/i915: Say "enable foo" instead of "set foo to enabled"
      drm/i915: Fix pre-skl DP AUX precharge length
      drm/i915: Remove stray newlines
      drm/i915: Stop using crtc->index as the pipe
      drm/i915: Add frontbuffer tracking tracepoints
      drm/i915: Don't include intel_de.h from intel_display_types.h
      drm/i915: Include intel_de_{read,write}_fw() in i915_reg_rw traces
      drm/i915: Extract some helpers to compute cdclk register values
      drm/i915: Use intel_de_rmw() in bdw cdclk programming
      drm/i915: Use intel_de_rmw() in skl cdclk programming
      drm/i915: Use intel_de_rmw() in bxt/glk/cnl+ cdclk programming
      drm/i915: Use intel_de_wait_for_*() in cnl+ cdclk programming
      drm/i915: Nuke display error state
      drm/i915: Reorder skl+ scaler vs. plane updates
      drm/i915/xelpd: First stab at DPT support
      drm/i915: Move intel_modeset_all_pipes()

Werner Sembach (3):
      drm/i915/display: New function to avoid duplicate code in upcomming commits
      drm/i915/display: Restructure output format computation for better expandability
      drm/i915/display: Use YCbCr420 as fallback when RGB fails

Xuezhi Zhang (1):
      drm/i915/sysfs: convert snprintf to sysfs_emit

zuoqilin (1):
      drm/i915/dsi: Fix comment typo

 arch/x86/kernel/early-quirks.c                     |   1 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   1 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   1 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   6 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  43 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   4 +
 drivers/gpu/drm/i915/display/intel_audio.c         |  32 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  77 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  22 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 367 ++++-----
 drivers/gpu/drm/i915/display/intel_color.c         |   7 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |   1 +
 drivers/gpu/drm/i915/display/intel_crt.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   3 +
 drivers/gpu/drm/i915/display/intel_csr.c           |  30 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c           | 109 ++-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  11 +-
 drivers/gpu/drm/i915/display/intel_de.h            |  41 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 885 +++++++++++++--------
 drivers/gpu/drm/i915/display/intel_display.h       |  31 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   9 +-
 drivers/gpu/drm/i915/display/intel_display_power.c | 551 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_display_power.h |  11 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  26 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 194 ++---
 drivers/gpu/drm/i915/display/intel_dp.h            |   3 -
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  23 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   8 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.h       |  15 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   9 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   1 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |   5 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   1 +
 drivers/gpu/drm/i915/display/intel_dsi.h           |   1 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |   1 +
 drivers/gpu/drm/i915/display/intel_fb.c            | 102 +--
 drivers/gpu/drm/i915/display/intel_fb.h            |   6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  28 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   1 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   5 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   5 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  10 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 150 ++--
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  12 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  67 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  56 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  20 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  95 ++-
 drivers/gpu/drm/i915/display/intel_psr.h           |   3 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   2 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |   1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  45 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   7 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  45 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |   2 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |   1 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |   1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 184 +++--
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  79 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  22 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |   5 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h               |   7 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  40 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   7 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   5 +
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |  18 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |   1 -
 drivers/gpu/drm/i915/i915_drv.c                    |  42 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  51 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   6 -
 drivers/gpu/drm/i915/i915_gpu_error.h              |   2 -
 drivers/gpu/drm/i915/i915_irq.c                    |  77 +-
 drivers/gpu/drm/i915/i915_mm.c                     |   2 +-
 drivers/gpu/drm/i915/i915_params.h                 |   1 -
 drivers/gpu/drm/i915/i915_pci.c                    |  52 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    |  51 +-
 drivers/gpu/drm/i915/i915_suspend.c                |   6 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |  30 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  39 +
 drivers/gpu/drm/i915/i915_utils.h                  |   5 +
 drivers/gpu/drm/i915/i915_vma_types.h              |   1 -
 drivers/gpu/drm/i915/intel_device_info.c           |   7 +-
 drivers/gpu/drm/i915/intel_device_info.h           |  13 +-
 drivers/gpu/drm/i915/intel_pch.c                   |   6 +-
 drivers/gpu/drm/i915/intel_pch.h                   |   1 +
 drivers/gpu/drm/i915/intel_pm.c                    | 128 +--
 drivers/gpu/drm/i915/intel_step.c                  |  12 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   8 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   8 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +-
 include/drm/drm_dp_helper.h                        |  16 +-
 include/drm/i915_pciids.h                          |  23 +
 107 files changed, 2805 insertions(+), 1429 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.h
