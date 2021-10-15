Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E0142FB61
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 20:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1F6EDF7;
	Fri, 15 Oct 2021 18:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2190D6EDF1;
 Fri, 15 Oct 2021 18:45:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="288830853"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="288830853"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 11:45:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="525520763"
Received: from bouhlelx-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.144.97])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 11:45:15 -0700
Date: Fri, 15 Oct 2021 14:45:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next
Message-ID: <YWnMORrixyw90O3/@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-next-2021-10-15:

Likely the last one towards 5.15.

UAPI Changes:

- No Functional change, but a clarification around I915_TILING values (Matt).

Driver Changes:

- Changes around async flip VT-d w/a (Ville)
- Delete bogus NULL check in intel_ddi_encoder_destroy (Dan)
- DP link training improvements and DP per-lane driver settings (Ville)
- Free the returned object of acpi_evaluate_dsm (Zenghui)
- Fixes and improvements around DP's UHBR and MST (Jani)
- refactor plane config + pin out (Dave)
- remove unused include in intel_dsi_vbt.c (Lucas)
- some code clean up (Lucas, Jani)
- gracefully disable dual eDP (Jani)
- Remove memory frequency calculation (Jose)
- Fix oops on platforms w/o hpd support (Ville)
- Clean up PXP Kconfig info (Rodrigo)

Thanks,
Rodrigo.

The following changes since commit 1176d15f0f6e556d54ced510ac4a91694960332b:

  Merge tag 'drm-intel-gt-next-2021-10-08' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-10-11 18:09:39 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-10-15

for you to fetch changes up to c974cf01b248c6f4220bfadd57cce74058453aea:

  drm/i915: Clean up PXP Kconfig info. (2021-10-15 14:22:11 -0400)

----------------------------------------------------------------
UAPI Changes:

- No Functional change, but a clarification around I915_TILING values (Matt).

Driver Changes:

- Changes around async flip VT-d w/a (Ville)
- Delete bogus NULL check in intel_ddi_encoder_destroy (Dan)
- DP link training improvements and DP per-lane driver settings (Ville)
- Free the returned object of acpi_evaluate_dsm (Zenghui)
- Fixes and improvements around DP's UHBR and MST (Jani)
- refactor plane config + pin out (Dave)
- remove unused include in intel_dsi_vbt.c (Lucas)
- some code clean up (Lucas, Jani)
- gracefully disable dual eDP (Jani)
- Remove memory frequency calculation (Jose)
- Fix oops on platforms w/o hpd support (Ville)
- Clean up PXP Kconfig info (Rodrigo)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/tc: Delete bogus NULL check in intel_ddi_encoder_destroy()

Dave Airlie (5):
      drm/i915/display: move plane prepare/cleanup to intel_atomic_plane.c
      drm/i915/display: let intel_plane_uses_fence be used from other places.
      drm/i915/display: refactor out initial plane config for crtcs
      drm/i915/display: refactor initial plane config to a separate file
      drm/i915/display: move pin/unpin fb/plane code to a new file.

Jani Nikula (9):
      drm/i915/dg2: fix snps buf trans for uhbr
      drm/i915/dp: take LTTPR into account in 128b/132b rates
      drm/i915/mst: abstract intel_dp_mst_source_support()
      drm/i915/dp: abstract intel_dp_lane_max_vswing_reached()
      drm/i915/dg2: update link training for 128b/132b
      drm/i915: split out vlv sideband to a separate file
      drm/i915/bios: gracefully disable dual eDP for now
      drm/i915: split out intel_pcode.[ch] to separate file
      drm/i915: rename intel_sideband.[ch] to intel_sbi.[ch]

José Roberto de Souza (1):
      drm/i915: Remove memory frequency calculation

Lucas De Marchi (1):
      drm/i915/display: remove unused intel-mid.h include

Matt Roper (1):
      drm/i915/uapi: Add comment clarifying purpose of I915_TILING_* values

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-intel-next
      drm/i915: Clean up PXP Kconfig info.

Ville Syrjälä (14):
      drm/i915: Extend the async flip VT-d w/a to skl/bxt
      drm/i195: Make the async flip VT-d workaround dynamic
      drm/i915: Tweak the DP "max vswing reached?" condition
      drm/i915: Show LTTPR in the TPS debug print
      drm/i915: Print the DP vswing adjustment request
      drm/i915: Pimp link training debug prints
      drm/i915: Call intel_dp_dump_link_status() for CR failures
      drm/i915: Remove pointless extra namespace from dkl/snps buf trans structs
      drm/i915: Shrink {icl_mg,tgl_dkl}_phy_ddi_buf_trans
      drm/i915: Use standard form terminating condition for lane for loops
      drm/i915: Remove dead DKL_TX_LOADGEN_SHARING_PMD_DISABLE stuff
      drm/i915: Extract icl_combo_phy_loadgen_select()
      drm/i915: Add all per-lane register definitions for icl combo phy
      drm/i915: Fix oops on platforms w/o hpd support

Zenghui Yu (1):
      drm/i915: Free the returned object of acpi_evaluate_dsm()

 drivers/gpu/drm/i915/Kconfig                       |  10 +-
 drivers/gpu/drm/i915/Makefile                      |   6 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   4 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  14 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   7 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 209 ++++++
 drivers/gpu/drm/i915/display/intel_bios.c          |  47 ++
 drivers/gpu/drm/i915/display/intel_bw.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   3 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  76 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |  18 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 784 ++-------------------
 drivers/gpu/drm/i915/display/intel_display.h       |  15 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   6 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   1 -
 drivers/gpu/drm/i915/display/intel_dp.c            |  29 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 352 ++++++---
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  15 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |   4 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   5 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        | 274 +++++++
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |  28 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   1 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 283 ++++++++
 drivers/gpu/drm/i915/display/intel_plane_initial.h |  13 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   6 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   3 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   3 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   1 -
 drivers/gpu/drm/i915/i915_drv.c                    |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  24 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |   1 -
 drivers/gpu/drm/i915/intel_dram.c                  |  32 +-
 drivers/gpu/drm/i915/intel_pcode.c                 | 235 ++++++
 drivers/gpu/drm/i915/intel_pcode.h                 |  26 +
 drivers/gpu/drm/i915/intel_pm.c                    |  17 +-
 drivers/gpu/drm/i915/intel_sbi.c                   |  73 ++
 drivers/gpu/drm/i915/intel_sbi.h                   |  23 +
 drivers/gpu/drm/i915/intel_sideband.c              | 577 ---------------
 drivers/gpu/drm/i915/vlv_sideband.c                | 266 +++++++
 .../drm/i915/{intel_sideband.h => vlv_sideband.h}  |  34 +-
 include/uapi/drm/i915_drm.h                        |   6 +
 57 files changed, 1974 insertions(+), 1607 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_pin.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_pin.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.h
 create mode 100644 drivers/gpu/drm/i915/intel_pcode.c
 create mode 100644 drivers/gpu/drm/i915/intel_pcode.h
 create mode 100644 drivers/gpu/drm/i915/intel_sbi.c
 create mode 100644 drivers/gpu/drm/i915/intel_sbi.h
 delete mode 100644 drivers/gpu/drm/i915/intel_sideband.c
 create mode 100644 drivers/gpu/drm/i915/vlv_sideband.c
 rename drivers/gpu/drm/i915/{intel_sideband.h => vlv_sideband.h} (77%)
