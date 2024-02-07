Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBB84C9A8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 12:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA27F113228;
	Wed,  7 Feb 2024 11:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRyFmvbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828710E7F7;
 Wed,  7 Feb 2024 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707305720; x=1738841720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p5SisYLGWmyZC8vZA4ZGoY/ggDaVO46Rza9711M2aBo=;
 b=YRyFmvbBsuQY3moKlNmql5D3f8qdeRfEbTM4M+9NUvLnyVM/pHBE9Wlg
 TWDIzlI+C/+2Bsk+2fRlAP+i66zWoc079vqXTYWeVTPED1NpocmUQuKZ6
 vjBW5P2ZwI7ZvcVlZ/vP2demqZPjPYaGNxSF5SC9IuxAvBKN+yVmArxc9
 vhTDzFHV9O2NFemOSdOAzAtwEp/oVQsEVhz6jpUziRcCub94Qvzb9Cflh
 K7jXaEfC2lKawNjB9gnWRDHxgi+R1RsUiPnYJM7/ihL4c5dFbc2Yqit2r
 T/QmemddRjpx0qF01FJQ4nSbH98KAReb/0UpUMaiLpWMH4C+4rdgx111G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11550451"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="11550451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1541901"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:35:13 -0800
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
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 07 Feb 2024 13:35:10 +0200
Message-ID: <87cyt8cxsh.fsf@intel.com>
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

drm-intel-next-2024-02-07:
drm/i915 feature pull for v6.9:

Features and functionality:
- Early transport for panel replay and PSR (Jouni)
- New ARL PCI IDs (Matt)
- DP TPS4 PHY test pattern support (Khaled)

Refactoring and cleanups:
- Unify and improve VSC SDP for PSR and non-PSR cases (Jouni)
- Refactor memory regions and improve debug logging (Ville)
- Rework global state serialization (Ville)
- Remove unused CDCLK divider fields (Gustavo)
- Unify HDCP connector logging format (Jani)
- Use display instead of graphics version in display code (Jani)
- Move VBT and opregion debugfs next to the implementation (Jani)
- Abstract opregion interface, use opaque type (Jani)

Fixes:
- Fix MTL stolen memory access (Ville)
- Fix initial display plane readout for MTL (Ville)
- Fix HPD handling during driver init/shutdown (Imre)
- Cursor vblank evasion fixes (Ville)
- Various VSC SDP fixes (Jouni)
- Allow PSR mode changes without full modeset (Jouni)
- Fix CDCLK sanitization on module load for Xe2_LPD (Gustavo)
- Fix the max DSC bpc supported by the source (Ankit)
- Add missing LNL ALPM AUX wake configuration (Jouni)
- Cx0 PHY state readout and verify fixes (Mika)
- Fix PSR (panel replay) debugfs for MST connectors (Imre)
- Fail HDCP repeater authentication if Type1 device not present (Suraj)
- Ratelimit debug logging in vm_fault_ttm (Nirmoy)
- Use a fake PCH for MTL because south display is not on the PCH (Haridhar)
- Disable DSB for Xe driver for now (Jos=C3=A9)
- Fix some LNL display register changes (Lucas)
- Fix build on ChromeOS (Paz Zcharya)
- Preserve current shared DPLL for fastsets on Type-C ports (Ville)
- Fix state checker warnings for MG/TC/TBT PLLs (Ville)
- Fix HDCP repeater ctl register value on errors (Jani)
- Allow FBC with CCS modifiers on SKL+ (Ville)
- Fix HDCP GGTT pinning (Ville)

DRM core changes:
- Add ratelimited drm dbg print (Nirmoy)
- DPCD PSR early transport macro (Jouni)

Merges:
- Backmerge drm-next to bring Xe driver to drm-intel-next (Jani)

BR,
Jani.

The following changes since commit 205e18c13545ab43cc4fe4930732b4feef551198:

  nouveau/gsp: handle engines in runl without nonstall interrupts. (2024-01=
-15 16:04:48 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2024-02-07

for you to fetch changes up to 449c2d5948ba8c784dcbc5c67df1d8c54748caa4:

  drm/i915/alpm: Alpm aux wake configuration for lnl (2024-02-07 09:58:04 +=
0200)

----------------------------------------------------------------
drm/i915 feature pull for v6.9:

Features and functionality:
- Early transport for panel replay and PSR (Jouni)
- New ARL PCI IDs (Matt)
- DP TPS4 PHY test pattern support (Khaled)

Refactoring and cleanups:
- Unify and improve VSC SDP for PSR and non-PSR cases (Jouni)
- Refactor memory regions and improve debug logging (Ville)
- Rework global state serialization (Ville)
- Remove unused CDCLK divider fields (Gustavo)
- Unify HDCP connector logging format (Jani)
- Use display instead of graphics version in display code (Jani)
- Move VBT and opregion debugfs next to the implementation (Jani)
- Abstract opregion interface, use opaque type (Jani)

Fixes:
- Fix MTL stolen memory access (Ville)
- Fix initial display plane readout for MTL (Ville)
- Fix HPD handling during driver init/shutdown (Imre)
- Cursor vblank evasion fixes (Ville)
- Various VSC SDP fixes (Jouni)
- Allow PSR mode changes without full modeset (Jouni)
- Fix CDCLK sanitization on module load for Xe2_LPD (Gustavo)
- Fix the max DSC bpc supported by the source (Ankit)
- Add missing LNL ALPM AUX wake configuration (Jouni)
- Cx0 PHY state readout and verify fixes (Mika)
- Fix PSR (panel replay) debugfs for MST connectors (Imre)
- Fail HDCP repeater authentication if Type1 device not present (Suraj)
- Ratelimit debug logging in vm_fault_ttm (Nirmoy)
- Use a fake PCH for MTL because south display is not on the PCH (Haridhar)
- Disable DSB for Xe driver for now (Jos=C3=A9)
- Fix some LNL display register changes (Lucas)
- Fix build on ChromeOS (Paz Zcharya)
- Preserve current shared DPLL for fastsets on Type-C ports (Ville)
- Fix state checker warnings for MG/TC/TBT PLLs (Ville)
- Fix HDCP repeater ctl register value on errors (Jani)
- Allow FBC with CCS modifiers on SKL+ (Ville)
- Fix HDCP GGTT pinning (Ville)

DRM core changes:
- Add ratelimited drm dbg print (Nirmoy)
- DPCD PSR early transport macro (Jouni)

Merges:
- Backmerge drm-next to bring Xe driver to drm-intel-next (Jani)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/dp: Fix the max DSC bpc supported by source

Gustavo Sousa (5):
      drm/i915/cdclk: Remove divider field from tables
      drm/i915/xe2lpd: Update bxt_sanitize_cdclk()
      drm/i915/cdclk: Extract bxt_cdclk_ctl()
      drm/i915/cdclk: Reorder bxt_sanitize_cdclk()
      drm/i915/cdclk: Re-use bxt_cdclk_ctl() when sanitizing

Haridhar Kalvala (1):
      drm/i915/mtl: Add fake PCH for Meteor Lake

Imre Deak (13):
      drm/i915/dp: Fix the PSR debugfs entries wrt. MST connectors
      drm/i915: Init DRM connector polled field early
      drm/i915: Keep the connector polled state disabled after storm
      drm/i915: Move audio deinit after disabling polling
      drm/i915: Disable intel HPD poll after DRM poll init/enable
      drm/i915: Suspend the framebuffer console during driver shutdown
      drm/i915: Suspend the framebuffer console earlier during system suspe=
nd
      drm/i915: Prevent modesets during driver init/shutdown
      drm/i915: Disable hotplug detection works during driver init/shutdown
      drm/i915: Disable hotplug detection handlers during driver init/shutd=
own
      drm/i915: Add intel_digital_port lock/unlock hooks
      drm/i915: Filter out glitches on HPD lines during hotplug detection
      drm/i915/dp: Abort AUX on disconnected native DP ports

Jani Nikula (16):
      drm/i915/hdcp: unify connector logging format
      drm/i915/hdcp: fix intel_hdcp_get_repeater_ctl() error return value
      drm/i915/bios: remove some unused leftover declarations
      drm/i915/irq: use DISPLAY_VER instead of GRAPHICS_VER
      drm/i915/dmc: use DISPLAY_VER instead of GRAPHICS_VER
      drm/i915/hdcp: use DISPLAY_VER instead of GRAPHICS_VER
      drm/i915/display: use IS_DISPLAY_VER instead of IS_GRAPHICS_VER
      drm/i915/tv: use DISPLAY_VER instead of GRAPHICS_VER
      Merge drm/drm-next into drm-intel-next
      drm/i915/bios: move i915_vbt debugfs to intel_bios.c
      drm/i915/opregion: move i915_opregion debugfs to intel_opregion.c
      drm/i915/opregion: abstract getting the opregion VBT
      drm/i915/opregion: abstract ASLE presence check
      drm/i915/gvt: use local INTEL_GVT_OPREGION_SIZE
      drm/i915/opregion: make struct intel_opregion opaque
      drm/i915/opregion: remove unused lid_state

Jos=C3=A9 Roberto de Souza (1):
      drm/i915: Disable DSB in Xe KMD

Jouni H=C3=B6gander (20):
      drm/i915/display: Remove intel_crtc_state->psr_vsc
      drm/i915/display: Move colorimetry_support from intel_psr to intel_dp
      drm/i915/display: Unify VSC SPD preparation
      drm/i915/display: Fix vsc_sdp computation
      drm/i915/display: Ignore only psr specific part of vsc sdp
      drm/i915/display: Read PSR configuration before VSC SDP
      drm/i915/display: Take care of VSC select field in video dip ctl regi=
ster
      drm: Add eDP 1.5 early transport definition
      drm/i915/psr: Extend SU area to cover cursor fully if needed
      drm/i915/psr: Carry su area in crtc_state
      drm/i915/psr: Calculate and configure CUR_POS_ERLY_TPT
      drm/i915/psr: Configure PIPE_SRCSZ_ERLY_TPT for psr2 early transport
      drm/i915/psr: Enable psr2 early transport as possible
      drm/i915/psr: Disable early transport by default
      drm/i915/display: No need for full modeset due to psr
      drm/i915/psr: CAN_PSR and CAN_PANEL_REPLAY can be now local defines
      drm/i915/alpm: Add ALPM register definitions
      drm/i915/psr: Add alpm_parameters struct
      drm/i915/alpm: Calculate ALPM Entry check
      drm/i915/alpm: Alpm aux wake configuration for lnl

Khaled Almahallawy (3):
      drm/i915/dp: Use LINK_QUAL_PATTERN_* Phy test pattern names
      drm/i915/dp: Add TPS4 PHY test pattern support
      drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test=
_pattern

Lucas De Marchi (3):
      drm/i915: Drop -Wstringop-overflow
      drm/i915/xe2lpd: Move D2D enable/disable
      drm/i915/xe2lpd: Move registers to PICA

Matt Roper (1):
      drm/i915: Add additional ARL PCI IDs

Mika Kahola (5):
      drm/i915/display: Fix C20 pll selection for state verification
      drm/i915/display: Store hw clock for C20
      drm/i915/display: Cleanup mplla/mpllb selection
      drm/i915/display: Skip C10 state verification in case of fastset
      drm/i915/display: Use helper to select C20 MPLLA/B

Nirmoy Das (2):
      drm/print: Add drm_dbg_ratelimited
      drm/i915: Ratelimit debug log in vm_fault_ttm

Paz Zcharya (1):
      drm/i915/display: Include debugfs.h in intel_display_debugfs_params.c

Suraj Kandpal (1):
      drm/i915/hdcp: Fail Repeater authentication if Type1 device not prese=
nt

Ville Syrj=C3=A4l=C3=A4 (38):
      Revert "drm/i915/dsi: Do display on sequence later on icl+"
      drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT
      drm/i915: Replace a memset() with zero initialization
      drm/i915: Decouple intel_crtc_vblank_evade_scanlines() from atomic co=
mmits
      drm/i915: Reorder drm_vblank_put() vs. need_vlv_dsi_wa
      drm/i915: Introduce struct intel_vblank_evade_ctx
      drm/i915: Include need_vlv_dsi_wa in intel_vblank_evade_ctx
      drm/i915: Extract intel_vblank_evade()
      drm/i915: Move the min/max scanline sanity check into intel_vblank_ev=
ade()
      drm/i915: Move intel_vblank_evade() & co. into intel_vblank.c
      drm/i915: Perform vblank evasion around legacy cursor updates
      Revert "drm/i915/xe2lpd: Treat cursor plane as regular plane for DDB =
allocation"
      drm/i915: Try to preserve the current shared_dpll for fastset on type=
-c ports
      drm/i915: Include the PLL name in the debug messages
      drm/i915: Suppress old PLL pipe_mask checks for MG/TC/TBT PLLs
      drm/i915: Convert PLL flags to booleans
      drm/i915: Compute use_sagv_wm differently
      drm/i915: Rework global state serializaiton
      drm/i915: Extract intel_atomic_swap_state()
      drm/i915/fbc: Allow FBC with CCS modifiers on SKL+
      drm/i915/hdcp: Do intel_hdcp_component_init() much later during init
      drm/i915/hdcp: Pin the hdcp gsc message high in ggtt
      drm/i915: Use struct resource for memory region IO as well
      drm/i915: Print memory region info during probe
      drm/i915: Remove ad-hoc lmem/stolen debugs
      drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
      drm/i915: Disable the "binder"
      drm/i915: Rename the DSM/GSM registers
      drm/i915: Fix PTE decode during initial plane readout
      drm/i915: Fix region start during initial plane readout
      drm/i915: Fix MTL initial plane readout
      drm/i915: s/phys_base/dma_addr/
      drm/i915: Split the smem and lmem plane readout apart
      drm/i915: Simplify intel_initial_plane_config() calling convention
      drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
      drm/i915: Tweak BIOS fb reuse check
      drm/i915: Try to relocate the BIOS fb to the start of ggtt
      drm/i915: Annotate more of the BIOS fb takeover failure paths

 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  30 ++
 drivers/gpu/drm/i915/display/i9xx_plane.h          |   7 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |   3 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  36 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 375 ++++++++++-------=
----
 drivers/gpu/drm/i915/display/intel_crt.c           |   5 +
 drivers/gpu/drm/i915/display/intel_crtc.c          | 128 +------
 drivers/gpu/drm/i915/display/intel_cursor.c        |  63 +++-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 229 +++++++------
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |  63 +++-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  67 ++--
 drivers/gpu/drm/i915/display/intel_display.c       |  76 ++++-
 drivers/gpu/drm/i915/display/intel_display_core.h  |  18 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  26 +-
 .../i915/display/intel_display_debugfs_params.c    |   1 +
 .../gpu/drm/i915/display/intel_display_device.c    |   2 +-
 .../gpu/drm/i915/display/intel_display_driver.c    | 165 ++++++++-
 .../gpu/drm/i915/display/intel_display_driver.h    |   6 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  38 ++-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 194 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h            |  10 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  29 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   4 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  83 +++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |  18 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   4 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |   5 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  13 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   5 +-
 drivers/gpu/drm/i915/display/intel_global_state.c  | 137 +++++++-
 drivers/gpu/drm/i915/display/intel_global_state.h  |   9 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  78 +++--
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |  28 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  16 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       | 165 +++++++--
 drivers/gpu/drm/i915/display/intel_hotplug.h       |   4 +
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      | 176 +++++++---
 drivers/gpu/drm/i915/display/intel_opregion.h      |  47 ++-
 drivers/gpu/drm/i915/display/intel_panel.c         |   4 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 255 ++++++++++----
 drivers/gpu/drm/i915/display/intel_plane_initial.h |   4 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 216 +++++++++---
 drivers/gpu/drm/i915/display/intel_psr.h           |   6 -
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  63 ++++
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   6 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  40 +--
 drivers/gpu/drm/i915/display/intel_tc.h            |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   7 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        | 130 +++++++
 drivers/gpu/drm/i915/display/intel_vblank.h        |  12 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  28 ++
 drivers/gpu/drm/i915/display/skl_universal_plane.h |   2 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |  54 +--
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  25 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  13 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  18 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  10 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   3 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |  14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  25 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   2 +-
 drivers/gpu/drm/i915/i915_query.c                  |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  18 +-
 drivers/gpu/drm/i915/i915_utils.c                  |  17 +
 drivers/gpu/drm/i915/i915_utils.h                  |   2 +
 drivers/gpu/drm/i915/intel_memory_region.c         |  33 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   3 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |   8 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   4 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |  16 +-
 drivers/gpu/drm/i915/soc/intel_pch.h               |   6 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |  67 ++--
 include/drm/display/drm_dp.h                       |   1 +
 include/drm/drm_print.h                            |   3 +
 include/drm/i915_pciids.h                          |   3 +
 88 files changed, 2374 insertions(+), 1160 deletions(-)

--=20
Jani Nikula, Intel
