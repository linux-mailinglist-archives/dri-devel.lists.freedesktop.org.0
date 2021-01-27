Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1F305DE0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 15:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66AF6E802;
	Wed, 27 Jan 2021 14:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E7F6E5CC;
 Wed, 27 Jan 2021 14:08:25 +0000 (UTC)
IronPort-SDR: ilyzNHBUbll+jSJgQw7xYcc3NXHssrUOZy5uhDzp3BcncuF/3SM+TdPWIlpZNY7mi25RRq7qtS
 e8+WG/tZeKnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="159243638"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="159243638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 06:08:24 -0800
IronPort-SDR: B/Uw7jaKtFTNxkL8Nami62Wsc9OIyHAbjYyocqZHr5zlaZ7OGBnYLaHCk4ppBdVtjigt7tFt/P
 9faon9OdKUHQ==
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="473171611"
Received: from larsonax-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.254.191.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 06:08:23 -0800
Date: Wed, 27 Jan 2021 09:08:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <20210127140822.GA711686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Hopefully this is the last pull request towards 5.12.

Please notice this contains a drm/framebuffer change needed for
supporting clear color support for TGL Render Decompression.

Here goes drm-intel-next-2021-01-27:

- HDCP 2.2 and HDCP 1.4 Gen12 DP MST support (Anshuman)
- Fix DP vswing settings and handling (Imre, Ville)
- Various display code clean-up (Jani, Ville)
- Various display refactoring, including split out of pps, aux, and fdi (Ja\
ni, Dave)
- Add DG1 missing workarounds (Jose)
- Fix display color conversion (Chris, Ville)
- Try to guess PCH type even without ISA bridge (Zhenyu)
- More backlight refactor (Lyude)
- Support two CSC module on gen11 and later (Lee)
- Async flips for all ilk+ platforms (Ville)
- Clear color support for TGL (RK)
- Add a helper to read data from a GEM object page (Imre)
- VRR/Adaptive Sync Enabling on DP/eDP for TGL+ (Manasi, Ville Aditya)

Thanks,
Rodrigo.

The following changes since commit fb5cfcaa2efbb4c71abb1dfbc8f4da727e0bfd89:

  Merge tag 'drm-intel-gt-next-2021-01-14' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2021-01-15 15:03:36 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-01-27

for you to fetch changes up to 784953a46589276b38d7e6dcb5ebf7e29db72ff1:

  drm/i915/display/vrr: Skip the VRR HW state readout on DSI transcoder (20=
21-01-26 16:34:53 -0800)

----------------------------------------------------------------
- HDCP 2.2 and HDCP 1.4 Gen12 DP MST support (Anshuman)
- Fix DP vswing settings and handling (Imre, Ville)
- Various display code clean-up (Jani, Ville)
- Various display refactoring, including split out of pps, aux, and fdi (Ja\
ni, Dave)
- Add DG1 missing workarounds (Jose)
- Fix display color conversion (Chris, Ville)
- Try to guess PCH type even without ISA bridge (Zhenyu)
- More backlight refactor (Lyude)
- Support two CSC module on gen11 and later (Lee)
- Async flips for all ilk+ platforms (Ville)
- Clear color support for TGL (RK)
- Add a helper to read data from a GEM object page (Imre)
- VRR/Adaptive Sync Enabling on DP/eDP for TGL+ (Manasi, Ville Aditya)

----------------------------------------------------------------
Aditya Swarup (1):
      drm/i915/display/dp: Attach and set drm connector VRR property

Anshuman Gupta (21):
      drm/i915/hdcp: Update CP property in update_pipe
      drm/i915/hdcp: Get conn while content_type changed
      drm/i915/hotplug: Handle CP_IRQ for DP-MST
      drm/i915/hdcp: No HDCP when encoder is't initialized
      drm/i915/hdcp: DP MST transcoder for link and stream
      drm/i915/hdcp: Move HDCP enc status timeout to header
      drm/i915/hdcp: HDCP stream encryption support
      drm/i915/hdcp: Configure HDCP1.4 MST steram encryption status
      drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
      drm/i915/hdcp: Pass dig_port to intel_hdcp_init
      drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
      misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
      drm/hdcp: Max MST content streams
      drm/i915/hdcp: MST streams support in hdcp port_data
      drm/i915/hdcp: Pass connector to check_2_2_link
      drm/i915/hdcp: Add HDCP 2.2 stream register
      drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
      drm/i915/hdcp: Configure HDCP2.2 MST steram encryption status
      drm/i915/hdcp: Enable HDCP 2.2 MST support
      drm/i915/hdcp: Fix WARN_ON(data->k > INTEL_NUM_PIPES)
      drm/i915/hdcp: Fix uninitialized symbol

Chris Wilson (1):
      drm/i915/display: Bitwise or the conversion colour specifier together

Dave Airlie (3):
      drm/i915: refactor some crtc code out of intel display. (v2)
      drm/i915: refactor pll code out into intel_dpll.c
      drm/i915: split fdi code out from intel_display.c

Imre Deak (3):
      drm/i915/dp: Move intel_dp_set_signal_levels() to intel_dp_link_train=
ing.c
      drm/i915/dp: Fix LTTPR vswing/pre-emp setting in non-transparent mode
      drm/i915/gem: Add a helper to read data from a GEM object page

Jani Nikula (20):
      drm/i915/display: remove useless use of inline
      drm/i915/display: fix the uint*_t types that have crept in
      drm/i915/pps: abstract panel power sequencer from intel_dp.c
      drm/i915/pps: rename pps_{,un}lock -> intel_pps_{,un}lock
      drm/i915/pps: rename intel_edp_backlight_* to intel_pps_backlight_*
      drm/i915/pps: rename intel_edp_panel_* to intel_pps_*
      drm/i915/pps: rename edp_panel_* to intel_pps_*_unlocked
      drm/i915/pps: abstract intel_pps_vdd_off_sync
      drm/i915/pps: add higher level intel_pps_init() call
      drm/i915/pps: abstract intel_pps_encoder_reset()
      drm/i915/pps: rename intel_dp_check_edp to intel_pps_check_power_unlo=
cked
      drm/i915/pps: rename intel_power_sequencer_reset to intel_pps_reset_a=
ll
      drm/i915/pps: add locked intel_pps_wait_power_cycle
      drm/i915/pps: rename vlv_init_panel_power_sequencer to vlv_pps_init
      drm/i915/pps: rename intel_dp_init_panel_power_sequencer* functions
      drm/i915/pps: refactor init abstractions
      drm/i915/pps: move pps code over from intel_display.c and refactor
      drm/i915/dp: abstract struct intel_dp pps members to a sub-struct
      drm/i915/dp: split out aux functionality to intel_dp_aux.c
      drm/msm/dp: fix build after dp quirk helper change

Jos=E9 Roberto de Souza (1):
      drm/i915/dg1: Apply WA 1409120013 and 14011059788

Lee Shawn C (1):
      drm/i915: support two CSC module on gen11 and later

Lyude Paul (6):
      drm/i915: Pass port to intel_panel_bl_funcs.get()
      drm/i915: Keep track of pwm-related backlight hooks separately
      drm/i915/dp: Enable Intel's HDR backlight interface (only SDR for now)
      drm/i915/dp: Allow forcing specific interfaces through enable_dpcd_ba=
cklight
      drm/dp: Revert "drm/dp: Introduce EDID-based quirks"
      drm/i915/dp: Don't use DPCD backlights that need PWM enable/disable

Manasi Navare (9):
      drm/i915/display/vrr: Create VRR file and add VRR capability check
      drm/i915/display/dp: Compute VRR state in atomic_check
      drm/i915/display/dp: Do not enable PSR if VRR is enabled
      drm/i915/display/vrr: Configure and enable VRR in modeset enable
      drm/i915/display/vrr: Send VRR push to flip the frame
      drm/i915/display/vrr: Disable VRR in modeset disable path
      drm/i915/display/vrr: Set IGNORE_MSA_PAR state in DP Sink
      drm/i915/display: Add HW state readout for VRR
      drm/i915/display/vrr: Skip the VRR HW state readout on DSI transcoder

Radhakrishna Sripada (2):
      drm/framebuffer: Format modifier for Intel Gen 12 render compression =
with Clear Color
      drm/i915/tgl: Add Clear Color support for TGL Render Decompression

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Ville Syrj=E4l=E4 (29):
      drm/i915: Drop one more useless master_transcoder assignment
      drm/i915: Only enable DFP 4:4:4->4:2:0 conversion when outputting YCb=
Cr 4:4:4
      drm/i915: Disable TRAINING_PATTERN_SET before stopping the TPS transm=
ission
      drm/i915: Fix the training pattern debug print
      drm/i915: Fix the PHY compliance test vs. hotplug mishap
      drm/i915: Drop redundant parens
      drm/i915: Generalize the async flip capability check
      drm/i915: Add plane vfuncs to enable/disable flip_done interrupt
      drm/i915: Move the async_flip bit setup into the .async_flip() hook
      drm/i915: Reuse the async_flip() hook for the async flip disable w/a
      drm/i915: Fix ICL MG PHY vswing handling
      drm/i915: Unify the sanity checks for the buf trans tables
      drm/i915: Store framestart_delay in dev_priv
      drm/i915: Extract intel_mode_vblank_start()
      drm/i915: Extract intel_crtc_scanlines_since_frame_timestamp()
      drm/i915/display: VRR + DRRS cannot be enabled together
      drm/i915: Rename VRR_CTL reg fields
      drm/i915/display: Helpers for VRR vblank min and max start
      drm/i915: Add vrr state dump
      drm/i915: Fix vblank timestamps with VRR
      drm/i915: Fix vblank evasion with vrr
      drm/i915: Extract intel_crtc_ddb_weight()
      drm/i915: Pass the crtc to skl_compute_dbuf_slices()
      drm/i915: Introduce intel_dbuf_slice_size()
      drm/i915: Introduce skl_ddb_entry_for_slices()
      drm/i915: Add pipe ddb entries into the dbuf state
      drm/i915: Extract intel_crtc_dbuf_weights()
      drm/i915: Encapsulate dbuf state handling harder
      drm/i915: Do a bit more initial readout for dbuf

Zhenyu Wang (1):
      drm/i915: Try to guess PCH type even without ISA bridge

 drivers/gpu/drm/drm_dp_helper.c                    |   83 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |    3 +-
 drivers/gpu/drm/i915/Makefile                      |    6 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    2 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   16 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |  325 +++
 drivers/gpu/drm/i915/display/intel_crtc.h          |   22 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   81 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 2807 ++--------------=
----
 drivers/gpu/drm/i915/display/intel_display.h       |    6 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    9 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    6 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  141 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 2315 +---------------
 drivers/gpu/drm/i915/display/intel_dp.h            |   10 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  692 +++++
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |   18 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  297 ++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  186 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   38 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |    3 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   12 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          | 1363 ++++++++++
 drivers/gpu/drm/i915/display/intel_dpll.h          |   23 +
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  683 +++++
 drivers/gpu/drm/i915/display/intel_fdi.h           |   22 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  309 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   19 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  396 +--
 drivers/gpu/drm/i915/display/intel_panel.h         |    4 +
 drivers/gpu/drm/i915/display/intel_pps.c           | 1406 ++++++++++
 drivers/gpu/drm/i915/display/intel_pps.h           |   52 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   12 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   67 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |  209 ++
 drivers/gpu/drm/i915/display/intel_vrr.h           |   33 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   65 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    8 +
 drivers/gpu/drm/i915/i915_drv.c                    |    1 +
 drivers/gpu/drm/i915/i915_drv.h                    |   20 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   81 +-
 drivers/gpu/drm/i915/i915_irq.h                    |    3 -
 drivers/gpu/drm/i915/i915_params.c                 |    2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   63 +-
 drivers/gpu/drm/i915/intel_pch.c                   |   39 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  554 ++--
 drivers/gpu/drm/i915/intel_pm.h                    |    7 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    6 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                   |    3 +-
 include/drm/drm_dp_helper.h                        |   21 +-
 include/drm/drm_hdcp.h                             |    8 +-
 include/uapi/drm/drm_fourcc.h                      |   19 +
 56 files changed, 6978 insertions(+), 5616 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_aux.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_aux.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpll.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpll.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fdi.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fdi.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pps.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pps.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
