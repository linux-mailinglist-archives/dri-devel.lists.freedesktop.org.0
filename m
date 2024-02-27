Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C99869BD4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 17:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFDF10E2F5;
	Tue, 27 Feb 2024 16:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xm7n6hz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6910E2F5;
 Tue, 27 Feb 2024 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709050618; x=1740586618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IHW12XpJW8E4ZXuvp0Evq9DkHII9eYDepnoGFrK5jR0=;
 b=Xm7n6hz/UmB8X8em4mZrDCFNab1ua/eL+lSoJzsHZv91vvmC1JTDOgQy
 bLj6m4nJcnRKP5NPLP5kNMXpqd7E587o2nN3xuojUpjpTiJp3UPfKuCUA
 NZYD1atPzfbr1X9wSNvEg2mNCA3lzLPBiNkdUihR9B3JZYUcP/NUdaASb
 sLUL9fthsWedH1uwdNIPd4CW09c6KgpETEPX/SIo9wL4lfxc5V80Muz6p
 LCo6h75IhA4Slm1wGWZHRPZ/WgjxcZ4qbYZnL5ecFH9jst17BVGecNtbU
 1jfal3/odsXhsnrFkFWSzIOjTOCeEyjcS4wAXxbrNMY8S+S2i3wt4wOmr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3559758"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3559758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="38128922"
Received: from stinti-mobl.ger.corp.intel.com (HELO localhost) ([10.252.50.15])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:16:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 27 Feb 2024 18:16:48 +0200
Message-ID: <87sf1devbj.fsf@intel.com>
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

Final i915 feature pull for v6.9.

drm-intel-next-2024-02-27-1:
drm/i915 feature pull #2 for v6.9:

Features and functionality:
- DP tunneling and bandwidth allocation support (Imre)
- Add more ADL-N PCI IDs (Gustavo)
- Enable fastboot also on older platforms (Ville)
- Bigjoiner force enable debugfs option for testing (Stan)

Refactoring and cleanups:
- Remove unused structs and struct members (Jiri Slaby)
- Use per-device debug logging (Ville)
- State check improvements (Ville)
- Hardcoded cd2x divider cleanups (Ville)
- CDCLK documentation updates (Ville, Rodrigo)

Fixes:
- HDCP MST Type1 fixes (Suraj)
- Fix MTL C20 PHY PLL values (Ravi)
- More hardware access prevention during init (Imre)
- Always enable decompression with tile4 on Xe2 (Juha-Pekka)
- Improve LNL package C residency (Suraj)

drm core changes:
- DP tunneling and bandwidth allocation helpers (Imre)

BR,
Jani.

The following changes since commit 449c2d5948ba8c784dcbc5c67df1d8c54748caa4:

  drm/i915/alpm: Alpm aux wake configuration for lnl (2024-02-07 09:58:04 +=
0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2024-02-2=
7-1

for you to fetch changes up to e60cff453b82789a652239c6200bd90d5178d2a0:

  drm/i915/dp: Enable DP tunnel BW allocation mode (2024-02-27 17:35:14 +02=
00)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.9:

Features and functionality:
- DP tunneling and bandwidth allocation support (Imre)
- Add more ADL-N PCI IDs (Gustavo)
- Enable fastboot also on older platforms (Ville)
- Bigjoiner force enable debugfs option for testing (Stan)

Refactoring and cleanups:
- Remove unused structs and struct members (Jiri Slaby)
- Use per-device debug logging (Ville)
- State check improvements (Ville)
- Hardcoded cd2x divider cleanups (Ville)
- CDCLK documentation updates (Ville, Rodrigo)

Fixes:
- HDCP MST Type1 fixes (Suraj)
- Fix MTL C20 PHY PLL values (Ravi)
- More hardware access prevention during init (Imre)
- Always enable decompression with tile4 on Xe2 (Juha-Pekka)
- Improve LNL package C residency (Suraj)

drm core changes:
- DP tunneling and bandwidth allocation helpers (Imre)

----------------------------------------------------------------
Bhanuprakash Modem (1):
      drm/i915/display/debugfs: New entry "DRRS capable" to i915_drrs_status

Gustavo Sousa (1):
      drm/i915: Update ADL-N PCI IDs

Imre Deak (23):
      drm/i915: Prevent HW access during init from SDVO TV get_modes hook
      drm/i915: Prevent HW access during init from connector get_modes hooks
      drm/dp: Add drm_dp_max_dprx_data_rate()
      drm/dp: Add support for DP tunneling
      drm/i915: Fix display bpp limit computation during system resume
      drm/i915/dp: Add support to notify MST connectors to retry modesets
      drm/i915/dp: Use drm_dp_max_dprx_data_rate()
      drm/i915/dp: Factor out intel_dp_config_required_rate()
      drm/i915/dp: Export intel_dp_max_common_rate/lane_count()
      drm/i915/dp: Factor out intel_dp_update_sink_caps()
      drm/i915/dp: Factor out intel_dp_read_dprx_caps()
      drm/i915/dp: Add intel_dp_max_link_data_rate()
      drm/i915/dp: Sync instead of try-sync commits when getting active pip=
es
      drm/i915/dp: Add support for DP tunnel BW allocation
      drm/i915/dp: Add DP tunnel atomic state and check BW limit
      drm/i915/dp: Account for tunnel BW limit in intel_dp_max_link_data_ra=
te()
      drm/i915/dp: Compute DP tunnel BW during encoder state computation
      drm/i915/dp: Allocate/free DP tunnel BW during modeset
      drm/i915/dp: Handle DP tunnel IRQs
      drm/i915/dp: Call intel_dp_sync_state() always for DDI DP encoders
      drm/i915/dp: Suspend/resume DP tunnels
      drm/i915/dp: Read DPRX for all long HPD pulses
      drm/i915/dp: Enable DP tunnel BW allocation mode

Jiri Slaby (SUSE) (21):
      drm/i915: remove unused intel_dvo_dev_ops hooks
      drm/i915: remove structs intel_vgpu_pipe_format and intel_vgpu_fb_for=
mat
      drm/i915: remove intel_dsi::{port_bits,hs}
      drm/i915: remove intel_gvt_gtt::{mm_alloc_page_table, mm_free_page_ta=
ble}
      drm/i915: remove intel_gvt_mmio_info::{device, addr_range}
      drm/i915: remove intel_vgpu_workload::{ring_context, restore_inhibit}
      drm/i915: remove intel_vbt_panel_data::edp::initialized
      drm/i915: remove intel_guc::ads_engine_usage_size
      drm/i915: remove i915_drm_client::id
      drm/i915: remove i915_perf_stream::size_exponent
      drm/i915: remove intel_vgpu_gtt::active_ppgtt_mm_bitmap
      drm/i915: remove intel_vgpu_fence::base
      drm/i915: remove intel_vgpu_opregion::mapped
      drm/i915: remove intel_vgpu::intx_trigger
      drm/i915: remove gvt_mmio_block::device
      drm/i915: remove intel_gvt_irq_info::warned
      drm/i915: remove intel_gvt_event_info::policy
      drm/i915: remove intel_gvt_irq::pending_events
      drm/i915: remove execute_cb::signal
      drm/i915: remove i915_vma::obj_hash
      drm/i915: remove intel_memory_region_ops::flags

Juha-Pekka Heikkila (1):
      drm/i915/display: On Xe2 always enable decompression with tile4

Manasi Navare (1):
      drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg addre=
ss

Maxime Ripard (1):
      drm/i915/tv: Fix TV mode

Ravi Kumar Vodapalli (1):
      drm/i915/display: update pll values in sync with Bspec for MTL

Rodrigo Vivi (1):
      drm/i915: Fix doc build issue on intel_cdclk.c

Stanislav Lisovskiy (1):
      drm/i915: Add bigjoiner force enable option to debugfs

Suraj Kandpal (15):
      drm/i915/lnl: Add pkgc related register
      drm/i915/lnl: Program PKGC_LATENCY register
      drm/i915/hdcp: Move to direct reads for HDCP
      drm/i915/hdcp: Move source hdcp2 checks into its own function
      drm/i915/hdcp: Refactor intel_dp_hdcp2_capable
      drm/i915/hdcp: Pass drm_dp_aux to read_bcaps function
      drm/i915/hdcp: Rename hdcp capable functions
      drm/i915/hdcp: Add new remote capability check shim function
      drm/i915/hdcp: HDCP Capability for the downstream device
      drm/i915/hdcp: Remove additional timing for reading mst hdcp message
      drm/i915/hdcp: Extract hdcp structure from correct connector
      drm/i915/hdcp: Don't enable HDCP2.2 directly from check_link
      drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link
      drm/i915/hdcp: Allocate stream id after HDCP AKE stage
      drm/i915/hdcp: Read Rxcaps for robustibility

Ville Syrj=C3=A4l=C3=A4 (23):
      drm/i915/dp: Limit SST link rate to <=3D8.1Gbps
      drm/i915: Correct for_each_old_global_obj_in_state() arguments
      drm/i915/sdvo: Convert to per-device debugs
      drm/i915/sdvo: Fix up code alignment
      drm/i915/color: Use per-device debugs
      drm/i915/fb: Use per-device debugs
      drm/i915/bios: Switch to kms debugs
      drm/i915/bios: Use per-device debugs for VBT related stuff
      drm/i915/hdcp: Use per-device debugs
      drm/i915/wm: Pass the whole i915 to intel_get_cxsr_latency()
      drm/i915/wm: Use per-device debugs in pre-ilk wm code
      drm/i915/wm: Use per-device debugs ilk wm code
      drm/i915/dvo/ns2501: Nuke pointless casts
      drm/i915/dvo: Use sizeof(*variable) instead of sizeof(type)
      drm/i915: Fix PLL state check for gmch platforms
      drm/i915: Include the CRTC name in the ELD buffer mismatch
      drm/i915: Reuse ibx_dump_hw_state() for gmch platforms
      drm/i915: Add PLL .compare_hw_state() vfunc
      drm/i915: Enable fastboot across the board
      drm/i915/cdclk: Extract cdclk_divider()
      drm/i915/cdclk: Squash waveform is 16 bits
      drm/i915/cdclk: Remove the hardcoded divider from cdclk_compute_crawl=
_and_squash_midpoint()
      drm/i915/cdclk: Document CDCLK update methods

 drivers/gpu/drm/display/Kconfig                    |   21 +
 drivers/gpu/drm/display/Makefile                   |    2 +
 drivers/gpu/drm/display/drm_dp_helper.c            |   30 +
 drivers/gpu/drm/display/drm_dp_tunnel.c            | 1949 ++++++++++++++++=
++++
 drivers/gpu/drm/i915/Kconfig                       |   14 +
 drivers/gpu/drm/i915/Kconfig.debug                 |    1 +
 drivers/gpu/drm/i915/Makefile                      |    3 +
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |    2 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |    2 +-
 drivers/gpu/drm/i915/display/dvo_ivch.c            |    2 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |    6 +-
 drivers/gpu/drm/i915/display/dvo_sil164.c          |    2 +-
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |    2 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   81 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   10 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   73 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   61 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   11 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   32 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  132 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |    1 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   68 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   20 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   24 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  300 ++-
 drivers/gpu/drm/i915/display/intel_dp.h            |   13 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  149 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   33 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |    1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   22 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  811 ++++++++
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |  133 ++
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  103 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    3 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |    6 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |    4 -
 drivers/gpu/drm/i915/display/intel_dvo.c           |    5 +
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |   25 -
 drivers/gpu/drm/i915/display/intel_fb.c            |    7 +-
 drivers/gpu/drm/i915/display/intel_global_state.h  |    4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  226 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    7 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   27 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    6 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  234 +--
 drivers/gpu/drm/i915/display/intel_tv.c            |   10 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |    4 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    5 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   54 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    4 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |    2 -
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |   11 -
 drivers/gpu/drm/i915/gvt/gtt.h                     |    3 -
 drivers/gpu/drm/i915/gvt/gvt.h                     |    5 -
 drivers/gpu/drm/i915/gvt/interrupt.c               |    1 -
 drivers/gpu/drm/i915/gvt/interrupt.h               |    2 -
 drivers/gpu/drm/i915/gvt/mmio.h                    |    2 -
 drivers/gpu/drm/i915/gvt/scheduler.h               |    2 -
 drivers/gpu/drm/i915/i915_drm_client.h             |    2 -
 drivers/gpu/drm/i915/i915_perf_types.h             |    1 -
 drivers/gpu/drm/i915/i915_request.c                |    1 -
 drivers/gpu/drm/i915/i915_vma_types.h              |    1 -
 drivers/gpu/drm/i915/intel_memory_region.h         |    2 -
 include/drm/display/drm_dp.h                       |   61 +
 include/drm/display/drm_dp_helper.h                |    1 +
 include/drm/display/drm_dp_tunnel.h                |  248 +++
 include/drm/i915_pciids.h                          |    4 +-
 74 files changed, 4434 insertions(+), 683 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_dp_tunnel.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.h
 create mode 100644 include/drm/display/drm_dp_tunnel.h

--=20
Jani Nikula, Intel
