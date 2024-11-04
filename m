Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411A9BB615
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 14:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D42410E442;
	Mon,  4 Nov 2024 13:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkNGwz9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852C10E43E;
 Mon,  4 Nov 2024 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730726907; x=1762262907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rCknxLYJY4hQIO2nvZzPgcOL++3pelGQKpOffNKUxTU=;
 b=AkNGwz9kiiiZc3t5daz9ZE/jQQNgh0fAKtgi+ZrcVJxCtA2W3gO/1lsl
 f0DkeOmQDfl2FZ6ib0trcLP7YUK0akdNYObigbJxQIlBlVy4ylxCkEJgQ
 H51q/GBo7+0KDYesIPrgkwmlIRQCrr4Awo8sEuBXeRktMLHK4no+UTPqc
 lNu9mKy0SEMBqlCagianrP3y6efuA9/8UtyKW59mCV4SM+AheW/n1kVWY
 NjPj/EU9u6WWsrLAlD9yojqtZNYRaY8UsscGUP1hZaMVg4IEEUzMn7aE0
 0F9GSkxKixGx2I0tsHJvFcinfee+N+2XQjPtEt0uq15OKqKUHQtmX13KU Q==;
X-CSE-ConnectionGUID: h9FdfRdoSduFNFFQJoTPUQ==
X-CSE-MsgGUID: MuV3ntepREeYjG0Xaca7RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30275766"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30275766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 05:28:27 -0800
X-CSE-ConnectionGUID: uQTBK4KfToaf6aPIWuiTnQ==
X-CSE-MsgGUID: W0nHNGWySM6Inn7AbyLxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="114442788"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 05:28:21 -0800
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
Date: Mon, 04 Nov 2024 15:28:18 +0200
Message-ID: <87h68ni0wd.fsf@intel.com>
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

The final drm-intel-next pull towards v6.13. The big item is Pantherlake
display enabling. The platform itself is only supported by the xe
driver, but display support comes from i915 display.

We're also making continuous progress on separating i915 display from
i915 core code, but this requires quite a bit of refactoring. Eventually
this will make "i915 display" more clearly a shared "Intel display" for
both i915 and xe.

BR,
Jani.

drm-intel-next-2024-11-04:
drm/i915 feature pull #2 for v6.13:

Features and functionality:

- Pantherlake (PTL) Xe3 LPD display enabling for xe driver (Clint, Suraj,
  Dnyaneshwar, Matt, Gustavo, Radhakrishna, Chaitanya, Haridhar, Juha-Pekka=
, Ravi)
- Enable dbuf overlap detection on Lunarlake and later (Stanislav, Vinod)
- Allow fastset for HDR infoframe changes (Chaitanya)
- Write DP source OUI also for non-eDP sinks (Imre)

Refactoring and cleanups:
- Independent platform identification for display (Jani)
- Display tracepoint fixes and cleanups (Gustavo)
- Share PCI ID headers between i915 and xe drivers (Jani)
- Use x100 version for full version and release checks (Jani)
- Conversions to struct intel_display (Jani, Ville)
- Reuse DP DPCD and AUX macros in gvt instead of duplication (Jani)
- Use string choice helpers (R Sundar, Sai Teja)
- Remove unused underrun detection irq code (Sai Teja)
- Color management debug improvements and other cleanups (Ville)
- Refactor panel fitter code to a separate file (Ville)
- Use try_cmpxchg() instead of open-coding (Uros Bizjak)

Fixes:
- PSR and Panel Replay fixes and workarounds (Jouni)
- Fix panel power during connector detection (Imre)
- Fix connector detection and modeset races (Imre)
- Fix C20 PHY TX MISC configuration (Gustavo)
- Improve panel fitter validity checks (Ville)
- Fix eDP short HPD interrupt handling while runtime suspended (Imre)
- Propagate DP MST DSC BW overhead/slice calculation errors (Imre)
- Stop hotplug polling for eDP connectors (Imre)
- Workaround panels reporting bad link status after PSR enable (Jouni)
- Panel Replay VRR VSC SDP related workaround and refactor (Animesh, Mitul)
- Fix memory leak on eDP init error path (Shuicheng)
- Fix GVT KVMGT Kconfig dependencies (Arnd Bergmann)
- Fix irq function documentation build warning (Rodrigo)
- Add platform check to power management fuse bit read (Clint)
- Revert kstrdup_const() and kfree_const() usage for clarity (Christophe JA=
ILLET)
- Workaround horizontal odd panning issues in display versions 20 and 30 (N=
emesa)
- Fix xe drive HDCP GSC firmware check (Suraj)

Merges:
- Backmerge drm-next to get some KVM changes (Rodrigo)
- Fix a build failure originating from previous backmerge (Jani)

BR,
Jani.

The following changes since commit 26bb2dc102783fef49336b26a94563318f9790d3:

  Merge tag 'drm-xe-next-2024-10-10' of https://gitlab.freedesktop.org/drm/=
xe/kernel into drm-next (2024-10-11 08:01:16 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
24-11-04

for you to fetch changes up to 82ab75c4520cfa77c0409e70a2623561233cd109:

  drm/i915/display: Allow fastset for change in HDR infoframe (2024-11-04 1=
3:56:53 +0530)

----------------------------------------------------------------
drm/i915 feature pull #2 for v6.13:

Features and functionality:

- Pantherlake (PTL) Xe3 LPD display enabling for xe driver (Clint, Suraj,
  Dnyaneshwar, Matt, Gustavo, Radhakrishna, Chaitanya, Haridhar, Juha-Pekka=
, Ravi)
- Enable dbuf overlap detection on Lunarlake and later (Stanislav, Vinod)
- Allow fastset for HDR infoframe changes (Chaitanya)
- Write DP source OUI also for non-eDP sinks (Imre)

Refactoring and cleanups:
- Independent platform identification for display (Jani)
- Display tracepoint fixes and cleanups (Gustavo)
- Share PCI ID headers between i915 and xe drivers (Jani)
- Use x100 version for full version and release checks (Jani)
- Conversions to struct intel_display (Jani, Ville)
- Reuse DP DPCD and AUX macros in gvt instead of duplication (Jani)
- Use string choice helpers (R Sundar, Sai Teja)
- Remove unused underrun detection irq code (Sai Teja)
- Color management debug improvements and other cleanups (Ville)
- Refactor panel fitter code to a separate file (Ville)
- Use try_cmpxchg() instead of open-coding (Uros Bizjak)

Fixes:
- PSR and Panel Replay fixes and workarounds (Jouni)
- Fix panel power during connector detection (Imre)
- Fix connector detection and modeset races (Imre)
- Fix C20 PHY TX MISC configuration (Gustavo)
- Improve panel fitter validity checks (Ville)
- Fix eDP short HPD interrupt handling while runtime suspended (Imre)
- Propagate DP MST DSC BW overhead/slice calculation errors (Imre)
- Stop hotplug polling for eDP connectors (Imre)
- Workaround panels reporting bad link status after PSR enable (Jouni)
- Panel Replay VRR VSC SDP related workaround and refactor (Animesh, Mitul)
- Fix memory leak on eDP init error path (Shuicheng)
- Fix GVT KVMGT Kconfig dependencies (Arnd Bergmann)
- Fix irq function documentation build warning (Rodrigo)
- Add platform check to power management fuse bit read (Clint)
- Revert kstrdup_const() and kfree_const() usage for clarity (Christophe JA=
ILLET)
- Workaround horizontal odd panning issues in display versions 20 and 30 (N=
emesa)
- Fix xe drive HDCP GSC firmware check (Suraj)

Merges:
- Backmerge drm-next to get some KVM changes (Rodrigo)
- Fix a build failure originating from previous backmerge (Jani)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/pxp: Add missing tag for Wa_14019159160

Animesh Manna (2):
      drm/i915/vrr: Split vrr-compute-config in two phases
      drm/i915/panelreplay: Panel replay workaround with VRR

Arnd Bergmann (1):
      i915: fix DRM_I915_GVT_KVMGT dependencies

Chaitanya Kumar Borah (2):
      drm/i915/dp: Add FEC Enable Retry mechanism
      drm/i915/display: Allow fastset for change in HDR infoframe

Christophe JAILLET (1):
      drm/i915/display: Remove kstrdup_const() and kfree_const() usage

Clint Taylor (4):
      drm/i915/xe3lpd: reuse xe2lpd definition
      drm/i915/cx0: Remove bus reset after every c10 transaction
      drm/i915/display/dp: Reduce log level for SOURCE OUI write failures
      drm/i915/display: Fuse bit for power management disable removed

Dnyaneshwar Bhadane (3):
      drm/i915/ptl: Define IS_PANTHERLAKE macro
      drm/i915/cx0: Extend C10 check to PTL
      drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register

Gustavo Sousa (8):
      drm/i915/display: Fix out-of-bounds access in pipe-related tracepoints
      drm/i915/display: Zero-initialize frame/scanline counts in tracepoints
      drm/i915/display: Store pipe name in trace events
      drm/i915/display: Do not use ids from enum pipe in TP_printk()
      drm/i915/display: Cover all possible pipes in TP_printk()
      drm/i915/xe3lpd: Load DMC
      drm/i915/cx0: Pass crtc_state to intel_c20_compute_hdmi_tmds_pll()
      drm/i915/xe2lpd: Update C20 algorithm to include tx_misc

Haridhar Kalvala (1):
      drm/xe/ptl: Enable PTL display

Heikkila, Juha-pekka (1):
      drm/i915/display/xe3: disable x-tiled framebuffers

Imre Deak (12):
      drm/i915/dp: Assume panel power is off if runtime suspended
      drm/i915/dp: Disable unnecessary HPD polling for eDP
      drm/i915/dp_mst: Handle error during DSC BW overhead/slice calculation
      drm/i915/dp_mst: Don't require DSC hblank quirk for a non-DSC compati=
ble mode
      drm/i915/dp: Flush modeset commits during connector detection
      drm/i915/dp: Ensure panel power remains enabled during connector dete=
ction
      drm/i915/dp: Initialize the source OUI write timestamp always
      drm/i915/dp: Track source OUI validity explicitly
      drm/i915/dp: Reuse intel_dp_detect_dsc_caps() for eDP
      drm/i915/dp: Write the source OUI for eDP before detecting sink capab=
ilities
      drm/i915/dp: Write the source OUI during connector detection
      drm/i915/dp: Write the source OUI for non-eDP sinks as well

Jani Nikula (36):
      drm/xe: fix build failure originating from backmerge
      drm/i915/gvt: use macros from drm_dp.h instead of duplication
      drm/i915: remove all IS_<PLATFORM>_GT<N>() macros
      drm/i915/display: convert I915_STATE_WARN() to struct intel_display
      drm/i915/pciids: add PVC PCI ID macros
      drm/intel/pciids: rename i915_pciids.h to just pciids.h
      drm/xe: switch to common PCI ID macros
      drm/i915/display: reindent subplatform initialization
      drm/i915/display: use a macro to initialize subplatforms
      drm/i915/display: use a macro to define platform enumerations
      drm/i915/display: join the platform and subplatform enums
      drm/i915/display: convert display platforms to lower case
      drm/i915/display: add display platforms structure with platform membe=
rs
      drm/i915/display: add platform member to struct intel_display
      drm/i915/display: remove the display platform enum as unnecessary
      drm/i915/display: add platform group for g4x
      drm/i915/display: add subplatform group for HSW/BDW ULT
      drm/i915/bios: use display->platform.<platform> instead of IS_<PLATFO=
RM>()
      drm/i915/pps: use display->platform.<platform> instead of IS_<PLATFOR=
M>()
      drm/i915/tv: use display->platform.<platform> instead of IS_<PLATFORM=
>()
      drm/i915/vga: use display->platform.<platform> instead of IS_<PLATFOR=
M>()
      drm/i915/vblank: drop unnecessary i915 local variable
      drm/i915/vblank: use display->platform.<platform> instead of IS_<PLAT=
FORM>()
      drm/i915/gmbus: convert to struct intel_display
      drm/i915/cx0: remove unnecessary includes
      drm/i915/cx0: convert to struct intel_display
      drm/i915/dpio: convert to struct intel_display
      drm/i915/hdcp: further conversion to struct intel_display
      drm/i915/dp/hdcp: convert to struct intel_display
      drm/i915/crt: convert to struct intel_display
      drm/i915/display: convert vlv_wait_port_ready() to struct intel_displ=
ay
      drm/i915/power: convert assert_chv_phy_status() to struct intel_displ=
ay
      drm/i915/ips: convert to struct intel_display
      drm/i915/dsi: convert to struct intel_display
      drm/i915/de: remove unnecessary generic wrappers
      drm/i915/display: use x100 version for full version and release

Jouni H=C3=B6gander (4):
      drm/i915/display: Add own counter for Panel Replay vblank workaround
      drm/i915/display: Fix Panel Replay vblank enable workaround
      drm/i915/psr: vbt.psr.enable is only for eDP panels
      drm/i915/psr: WA for panels stating bad link status after PSR is enab=
led

Matt Roper (3):
      drm/i915/xe3lpd: Adjust watermark calculations
      drm/i915/xe3lpd: Add new display power wells
      drm/i915/xe3lpd: Update pmdemand programming

Mitul Golani (1):
      drm/i915/vrr: Add helper to check if vrr possible

Nemesa Garg (1):
      drm/i915/display: Add Wa_16023981245

R Sundar (2):
      drm/i915/dp: use string choice helpers
      drm/i915/ddi: use string choice helpers

Radhakrishna Sripada (1):
      drm/i915/xe3lpd: Add cdclk changes

Ravi Kumar Vodapalli (1):
      drm/i915/xe3: Underrun recovery does not exist post Xe2

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-intel-next
      drm/i915: Fix irq related documentation

Sai Teja Pottumuttu (2):
      drm/i915: Remove unused underrun irq/reporting bits
      drm/i915: Use string enable/disable choice helpers

Shuicheng Lin (1):
      drm/i915/dp: Fix memory leak in parse_lfp_panel_dtd()

Stanislav Lisovskiy (1):
      drm/i915: Implement Dbuf overlap detection feature starting from LNL

Suraj Kandpal (8):
      drm/i915/xe3lpd: Add C20 Phy consolidated programming table
      drm/i915/xe3lpd: Add new bit range of MAX swing setup
      drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG
      drm/xe/hdcp: Fix gsc structure check in fw check status
      drm/i915/xe3lpd: Increase resolution for plane to support 6k
      drm/i915/psr: Change psr size limits check
      drm/i914/xe3lpd: Increase bigjoiner limitations
      drm/i915/xe3lpd: Add check to see if edp over type c is allowed

Uros Bizjak (1):
      drm/i915/active: Use try_cmpxchg() in active_fence_cb()

Ville Syrj=C3=A4l=C3=A4 (14):
      drm/i915/irq: s/gen3/gen2/
      drm/i915/pfit: Check pipe source size against pfit limits on ILK-BDW
      drm/i915/pfit: Check pfit scaling factors on ILK-BDW
      drm/i915/pfit: Reject pfit downscaling for GMCH platforms
      drm/i915/pfit: Check pfit minimum timings in pre-SKL
      drm/i915/pfit: Reject cloning when using pfit on ILK-BDW
      drm/i915/pfit: Check pfit destination window on ILK-BDW
      drm/i915/panel: Convert panel code to intel_display
      drm/i915/pfit: Extract intel_pfit.c
      drm/i915: Remove ckey/format checks from skl_update_scaler_plane()
      drm/i915/color: Pimp debugs
      drm/i915: Handle intel_plane and intel_plane_state in to_intel_displa=
y()
      drm/i915/color: Convert color management code to intel_display
      drm/i915/color: Make color .get_config() mandatory

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |    8 +
 Documentation/gpu/i915.rst                         |    4 +-
 arch/x86/kernel/early-quirks.c                     |    2 +-
 drivers/gpu/drm/i915/Kconfig                       |    3 +-
 drivers/gpu/drm/i915/Makefile                      |    7 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   58 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    5 -
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    9 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   49 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   22 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  202 +++-
 drivers/gpu/drm/i915/display/i9xx_wm.h             |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  446 +++----
 drivers/gpu/drm/i915/display/icl_dsi.h             |    4 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  203 ++--
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   19 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    9 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    6 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  204 +---
 drivers/gpu/drm/i915/display/intel_bo.c            |   59 +
 drivers/gpu/drm/i915/display/intel_bo.h            |   27 +
 drivers/gpu/drm/i915/display/intel_bw.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 1236 +++++++++++-----=
----
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   28 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  883 +++++++-------
 drivers/gpu/drm/i915/display/intel_color.h         |   14 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  216 ++--
 drivers/gpu/drm/i915/display/intel_crt.h           |   10 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   77 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   12 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  104 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  474 ++++----
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    8 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  118 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   57 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  893 +++++++++-----
 drivers/gpu/drm/i915/display/intel_display.h       |   75 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   13 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  320 ++---
 .../gpu/drm/i915/display/intel_display_device.c    |  295 +++--
 .../gpu/drm/i915/display/intel_display_device.h    |  213 ++--
 .../gpu/drm/i915/display/intel_display_driver.c    |   52 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  345 +++---
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    6 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |   10 +
 .../gpu/drm/i915/display/intel_display_params.c    |    8 +-
 .../gpu/drm/i915/display/intel_display_params.h    |    5 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  176 +--
 drivers/gpu/drm/i915/display/intel_display_power.h |    8 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |  134 ++-
 .../drm/i915/display/intel_display_power_well.c    |  363 +++---
 .../drm/i915/display/intel_display_power_well.h    |   15 +-
 .../gpu/drm/i915/display/intel_display_snapshot.c  |   72 ++
 .../gpu/drm/i915/display/intel_display_snapshot.h  |   16 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |  261 +++--
 drivers/gpu/drm/i915/display/intel_display_types.h |  195 +--
 drivers/gpu/drm/i915/display/intel_dmc.c           |  433 +++----
 drivers/gpu/drm/i915/display/intel_dmc.h           |   30 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  958 +++++----------
 drivers/gpu/drm/i915/display/intel_dp.h            |   25 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   98 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   36 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   94 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |  765 ++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_test.h       |   23 +
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  158 ++-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |   22 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   48 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   96 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    2 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  139 ++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    7 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    5 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    9 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  154 ++-
 drivers/gpu/drm/i915/display/intel_fb.h            |    8 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    9 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |   10 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   14 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   27 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   52 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   88 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   66 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    5 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  290 ++---
 drivers/gpu/drm/i915/display/intel_gmbus.h         |   15 +-
 drivers/gpu/drm/i915/display/intel_gmbus_regs.h    |   16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  759 ++++++------
 drivers/gpu/drm/i915/display/intel_hdcp.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   40 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    9 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   44 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |    3 +-
 drivers/gpu/drm/i915/display/intel_hdcp_shim.h     |  137 +++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   46 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    3 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    3 +
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   19 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   20 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   89 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    1 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |   18 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |   25 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  330 +-----
 drivers/gpu/drm/i915/display/intel_panel.h         |    6 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   56 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    9 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |  554 +++++++++
 drivers/gpu/drm/i915/display/intel_pfit.h          |   15 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    4 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   71 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  283 +++--
 drivers/gpu/drm/i915/display/intel_pps.h           |   13 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  165 ++-
 drivers/gpu/drm/i915/display/intel_psr.h           |    2 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    7 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   11 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   27 +-
 drivers/gpu/drm/i915/display/intel_sprite.h        |    5 -
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |    3 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   11 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   13 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   21 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |    2 +
 drivers/gpu/drm/i915/display/intel_vga.c           |   45 +-
 drivers/gpu/drm/i915/display/intel_vga.h           |   14 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   20 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    2 +
 drivers/gpu/drm/i915/display/intel_wm.c            |   26 +-
 drivers/gpu/drm/i915/display/intel_wm.h            |    6 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   77 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  435 ++++---
 .../drm/i915/display/skl_universal_plane_regs.h    |    1 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   32 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    4 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |    3 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   24 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |   12 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    5 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    7 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    4 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 -
 drivers/gpu/drm/i915/gvt/display.c                 |    4 +-
 drivers/gpu/drm/i915/gvt/display.h                 |   42 -
 drivers/gpu/drm/i915/gvt/edid.c                    |   12 +-
 drivers/gpu/drm/i915/gvt/edid.h                    |    8 -
 drivers/gpu/drm/i915/gvt/gtt.c                     |    2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   43 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |    2 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +-
 drivers/gpu/drm/i915/i915_active.c                 |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    6 -
 drivers/gpu/drm/i915/i915_driver.c                 |   24 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   38 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   25 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |   11 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   40 +
 drivers/gpu/drm/i915/i915_irq.c                    |  330 ++----
 drivers/gpu/drm/i915/i915_irq.h                    |   40 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    6 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  468 ++++----
 drivers/gpu/drm/i915/i915_reg_defs.h               |   10 +
 drivers/gpu/drm/i915/i915_suspend.c                |    5 +-
 drivers/gpu/drm/i915/i915_trace.h                  |    2 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    4 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    2 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    2 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    1 -
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |    4 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    8 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |   15 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |   14 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |    4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    6 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |    4 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |    5 +-
 drivers/gpu/drm/i915/soc/intel_rom.c               |  160 +++
 drivers/gpu/drm/i915/soc/intel_rom.h               |   25 +
 drivers/gpu/drm/xe/Makefile                        |    7 +-
 .../drm/xe/compat-i915-headers/gem/i915_gem_lmem.h |    1 -
 .../drm/xe/compat-i915-headers/gem/i915_gem_mman.h |   17 -
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |   64 -
 .../gem/i915_gem_object_frontbuffer.h              |   12 -
 .../gem/i915_gem_object_types.h                    |   11 -
 .../gpu/drm/xe/compat-i915-headers/i915_debugfs.h  |   14 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    8 +-
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |   17 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   24 -
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |    4 +-
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |   10 +-
 .../gpu/drm/xe/compat-i915-headers/soc/intel_rom.h |    6 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   33 +-
 drivers/gpu/drm/xe/display/intel_bo.c              |   84 ++
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   19 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.h           |   24 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   12 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   25 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   12 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   46 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    4 +-
 drivers/gpu/drm/xe/xe_bo.h                         |    2 -
 drivers/gpu/drm/xe/xe_bo_types.h                   |    3 -
 drivers/gpu/drm/xe/xe_pci.c                        |   53 +-
 include/drm/intel/{i915_pciids.h =3D> pciids.h}      |   74 +-
 include/drm/intel/xe_pciids.h                      |  234 ----
 242 files changed, 10041 insertions(+), 7633 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_bo.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_test.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_test.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_shim.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pfit.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pfit.h
 create mode 100644 drivers/gpu/drm/i915/soc/intel_rom.c
 create mode 100644 drivers/gpu/drm/i915/soc/intel_rom.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lme=
m.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mma=
n.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect_frontbuffer.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect_types.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_rom.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_bo.c
 delete mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h
 rename include/drm/intel/{i915_pciids.h =3D> pciids.h} (94%)
 delete mode 100644 include/drm/intel/xe_pciids.h

--=20
Jani Nikula, Intel
