Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27DEC5DB49
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155FD10EAA1;
	Fri, 14 Nov 2025 14:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZ0TVwPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001E010EA9F;
 Fri, 14 Nov 2025 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763132311; x=1794668311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H6Oe1e9h85q6IsWrH0rvgE1SKI1y3G3eAN2+Dtv96Ww=;
 b=JZ0TVwPcHCPxWlW496NSxhp9qUpFC2JohMS+AALszK9g9l4yQeh7IbBj
 JD3Mg5TuIkFFnN7XVv4OUy4n40OD79g6NozYG35QNEkpETzXjtjucXWnc
 a+jt96426Xoq/mXfMMpkcrqvBKiYuGuRiRbvNmAjDmdR51UwcXBHWeLbf
 OaJukNxnrRSqaM4Lwhv1trNK3EvLlPkzEEfcW9Rwp3yg+CaoMErPPYBsf
 djsX3KJbK7DDOEgECYSncS9ADg1d30xur2PXcFDJiWuqI/De3j/8OIDxx
 Uyo0i6w+th9/fys/Bro0yBuW1V0qZ0cTWgymm4yBc9bLMD/+lXkmX5hxv w==;
X-CSE-ConnectionGUID: D8Vy8v+mSVmZs34RiNnlcQ==
X-CSE-MsgGUID: R5A6EUS5TCGIyqQNKdHKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64432292"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="64432292"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:58:30 -0800
X-CSE-ConnectionGUID: AxLrQGdtTJmYecx+XNL7BA==
X-CSE-MsgGUID: KY0pkXaKQPy7EyDn2NHoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189987392"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:58:26 -0800
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
Date: Fri, 14 Nov 2025 16:58:23 +0200
Message-ID: <b131309bb7310ab749f1770aa6e36fa8d6a82fa5@intel.com>
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

Final drm-intel feature pull request for v6.19.


drm-intel-next-2025-11-14:
drm/i915 feature pull #2 for v6.19:

Features and functionality:
- Add initial display support for Xe3p_LPD, display version 35 (Sai Teja, M=
att
  R, Gustavo, Matt A, Ankit, Juha-pekka, Luca, Ravi Kumar)
- Compute LT PHY HDMI params when port clock not in predefined tables (Sura=
j)

Refactoring and cleanups:
- Refactor intel_frontbuffer split between i915, xe, and display (Ville)
- Clean up intel_de_wait_custom() usage (Ville)
- Unify display register polling interfaces (Ville)
- Finish removal of the expensive format info lookups (Ville)
- Cursor code cleanups (Ville)
- Convert intel_rom interfaces to struct drm_device (Jani)

Fixes:
- Fix uninitialized variable in DSI exec packet (Jonathan)
- Fix PIPEDMC logging (Alok Tiwari)
- Fix PSR pipe to vblank conversion (Jani)
- Fix intel_frontbuffer lifetime handling (Ville)
- Disable Panel Replay on DP MST for the time being (Imre)

Merges:
- Backmerge drm-next to get the drm_print.h changes (Jani)

BR,
Jani.

The following changes since commit e237dfe70867f02de223e36340fe5f8b0fe0eada:

  Merge tag 'drm-misc-next-2025-11-05-1' of https://gitlab.freedesktop.org/=
drm/misc/kernel into drm-next (2025-11-07 12:41:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
25-11-14

for you to fetch changes up to b84befa3126634d78e31260f538453d534742908:

  drm/i915/display: Add default case to mipi_exec_send_packet (2025-11-13 1=
2:02:47 +0200)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.19:

Features and functionality:
- Add initial display support for Xe3p_LPD, display version 35 (Sai Teja, M=
att
  R, Gustavo, Matt A, Ankit, Juha-pekka, Luca, Ravi Kumar)
- Compute LT PHY HDMI params when port clock not in predefined tables (Sura=
j)

Refactoring and cleanups:
- Refactor intel_frontbuffer split between i915, xe, and display (Ville)
- Clean up intel_de_wait_custom() usage (Ville)
- Unify display register polling interfaces (Ville)
- Finish removal of the expensive format info lookups (Ville)
- Cursor code cleanups (Ville)
- Convert intel_rom interfaces to struct drm_device (Jani)

Fixes:
- Fix uninitialized variable in DSI exec packet (Jonathan)
- Fix PIPEDMC logging (Alok Tiwari)
- Fix PSR pipe to vblank conversion (Jani)
- Fix intel_frontbuffer lifetime handling (Ville)
- Disable Panel Replay on DP MST for the time being (Imre)

Merges:
- Backmerge drm-next to get the drm_print.h changes (Jani)

----------------------------------------------------------------
Alok Tiwari (1):
      drm/i915/dmc: Fix extra bracket and wrong variable in PIPEDMC error l=
ogs

Ankit Nautiyal (1):
      drm/i915/xe3p_lpd: Drop support for interlace mode

Gustavo Sousa (7):
      drm/i915/display: Use braces for if-ladder in intel_bw_init_hw()
      drm/i915/xe3p_lpd: Add CDCLK table
      drm/i915/xe3p_lpd: Load DMC firmware
      drm/i915/xe3p_lpd: Extend Wa_16025573575
      drm/i915/xe3p_lpd: Reload DMC MMIO for pipes C and D
      drm/i915/dram: Add field ecc_impacting_de_bw
      drm/i915/xe3p_lpd: Always apply WaWmMemoryReadLatency

Imre Deak (1):
      drm/i915/dp_mst: Disable Panel Replay

Jani Nikula (5):
      drm/i915/psr: fix pipe to vblank conversion
      Merge drm/drm-next into drm-intel-next
      drm/i915/rom: convert intel_rom interfaces to struct drm_device
      drm/i915/ltphy: include intel_display_utils.h instead of i915_utils.h
      drm/xe: remove stale runtime_pm member

Jonathan Cavitt (1):
      drm/i915/display: Add default case to mipi_exec_send_packet

Juha-pekka Heikkila (1):
      drm/i915/xe3p_lpd: Don't allow odd ypan or ysize with semiplanar form=
at

Luca Coelho (1):
      drm/i915/wm: don't use method1 in Xe3p_LPD onwards

Matt Atwood (1):
      drm/i915/xe3p_lpd: Update bandwidth parameters

Matt Roper (1):
      drm/i915/xe3p_lpd: Drop north display reset option programming

Ravi Kumar Vodapalli (1):
      drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers

Sai Teja Pottumuttu (4):
      drm/i915/xe3p_lpd: Add Xe3p_LPD display IP features
      drm/i915/xe3p_lpd: Expand bifield masks dbuf blocks fields
      drm/i915/xe3p_lpd: Horizontal flip support for linear surfaces
      drm/i915/xe3p_lpd: Remove gamma,csc bottom color checks

Suraj Kandpal (2):
      drm/i915/ltphy: Implement HDMI Algo for Pll state
      drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorit=
hm

Ville Syrj=C3=A4l=C3=A4 (44):
      drm/i915/overlay: Drop the DIRTYFB flush
      drm/i915/overlay: Switch to intel_frontbuffer_flip()
      drm/i915/frontbuffer: Nuke intel_frontbuffer_flip_{prepare,complete}()
      drm/i915/frontbuffer: Turn intel_bo_flush_if_display() into a frontbu=
ffer operation
      drm/i915/frontbuffer: Handle the dirtyfb cache flush inside intel_fro=
ntbuffer_flush()
      drm/i915/frontbuffer: Split fb_tracking.lock into two
      drm/i915/frontbuffer: Extract intel_frontbuffer_ref()
      drm/i915/frontbuffer: Add intel_frontbuffer::display
      drm/i915/frontbuffer: Fix intel_frontbuffer lifetime handling
      drm/i915/gem: s/i915_gem_object_get_frontbuffer/i915_gem_object_front=
buffer_lookup/
      drm/i915/cx0: Nuke extraneous timeout debugs
      drm/i915/ltphy: Nuke extraneous timeout debugs
      drm/i915/cx0: Replace XELPDP_PORT_POWERDOWN_UPDATE_TIMEOUT_US with XE=
LPDP_PORT_POWERDOWN_UPDATE_TIMEOUT_MS
      drm/i915/cx0: Get rid of XELPDP_MSGBUS_TIMEOUT_FAST_US
      drm/i915/cx0: s/XELPDP_MSGBUS_TIMEOUT_SLOW/XELPDP_MSGBUS_TIMEOUT_MS/
      drm/i915/cx0: s/XELPDP_PORT_RESET_END_TIMEOUT/XELPDP_PORT_RESET_END_T=
IMEOUT_MS/
      drm/i915/ltphy: Nuke bogus weird timeouts
      drm/i915/hdcp: Use the default 2 usec fast polling timeout
      drm/i915/pmdemand: Use the default 2 usec fast polling timeout
      drm/i915/de: Implement register waits one way
      drm/i915/de: Have intel_de_wait() hand out the final register value
      drm/i915/de: Include units in intel_de_wait*() function names
      drm/i915/de: Introduce intel_de_wait_us()
      drm/i915/de: Use intel_de_wait_us()
      drm/i915/de: Use intel_de_wait_ms() for the obvious cases
      drm/i915/de: Nuke intel_de_wait_custom()
      drm/i915/de: Introduce intel_de_wait_for_{set,clear}_us()
      drm/i915/de: Use intel_de_wait_for_{set,clear}_us()
      drm/i915/de: Use intel_de_wait_for_{set,clear}_ms()
      drm/1915/dpio: Stop using intel_de_wait_fw_ms()
      drm/i915/de: Replace __intel_de_rmw_nowl() with intel_de_rmw_fw()
      drm/i915/de: Nuke wakelocks from intel_de_wait_fw_ms()
      drm/i915/de: Replace __intel_de_wait_for_register_nowl() with intel_d=
e_wait_fw_us_atomic()
      drm/i915/power: Use the intel_de_wait_ms() out value
      drm/i915/dpio: Use the intel_de_wait_ms() out value
      drm/i915: Introduce intel_dumb_fb_max_stride()
      drm/i915: Pass drm_format_info into plane->max_stride()
      drm/i915: Populate fb->format accurately in BIOS FB readout
      drm/i915: Nuke intel_plane_config.tiling
      drm/i915/fb: Init 'ret' in each error branch in intel_framebuffer_ini=
t()
      drm/i915/wm: Use drm_get_format_info() in SKL+ cursor DDB allocation
      drm/i915: Use mode_config->cursor_width for cursor DDB allocation
      drm/i915/cursor: Extract intel_cursor_mode_config_init()
      drm/i915/cursor: Initialize 845 vs 865 cursor size separately

 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/hsw_ips.c             |   4 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  32 +-
 drivers/gpu/drm/i915/display/i9xx_plane.h          |   5 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  35 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_bo.c            |  40 +-
 drivers/gpu/drm/i915/display/intel_bo.h            |   8 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  43 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  74 +++-
 drivers/gpu/drm/i915/display/intel_color.c         |  13 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  16 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  28 +-
 drivers/gpu/drm/i915/display/intel_cursor.h        |   2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 134 +++----
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  34 +-
 drivers/gpu/drm/i915/display/intel_de.h            | 143 +++----
 drivers/gpu/drm/i915/display/intel_display.c       |  42 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   8 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   5 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   3 -
 .../gpu/drm/i915/display/intel_display_device.c    |   1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |  13 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  17 +-
 .../drm/i915/display/intel_display_power_well.c    |  42 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   5 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  19 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |  25 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   6 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  27 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   3 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  24 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_flipq.c         |   8 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   | 155 ++------
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |  18 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  49 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   4 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c        | 441 +++++++++++++++++=
+---
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |   3 +
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |  23 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   6 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  10 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   3 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |  11 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |  18 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  17 +-
 drivers/gpu/drm/i915/display/intel_sbi.c           |   6 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  10 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   8 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   6 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  25 +-
 .../drm/i915/display/skl_universal_plane_regs.h    |  12 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  40 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |  52 +--
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  54 +--
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  16 +-
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.c | 103 +++++
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |  54 +--
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   2 +
 drivers/gpu/drm/i915/i915_gem.c                    |   2 +
 drivers/gpu/drm/i915/i915_reg.h                    |   1 +
 drivers/gpu/drm/i915/i915_vma.c                    |   8 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   4 +
 drivers/gpu/drm/i915/soc/intel_dram.h              |   1 +
 drivers/gpu/drm/i915/soc/intel_rom.c               |   7 +-
 drivers/gpu/drm/i915/soc/intel_rom.h               |   6 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |   2 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  31 +-
 drivers/gpu/drm/xe/display/intel_bo.c              |  60 ++-
 drivers/gpu/drm/xe/xe_device_types.h               |   3 -
 83 files changed, 1347 insertions(+), 874 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.c

--=20
Jani Nikula, Intel
