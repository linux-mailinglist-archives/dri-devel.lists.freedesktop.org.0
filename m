Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7C90F4CA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 19:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBB310E0B8;
	Wed, 19 Jun 2024 17:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtKdwl6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEED510E0B8;
 Wed, 19 Jun 2024 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718816906; x=1750352906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mWYBl37BZN74hQLpHrqLwjvpIWDWO1JTibGDgBx8iC4=;
 b=BtKdwl6+yuRhlZezREVhsbJovyCLZyKnIdbPPch9XVoLi5LFAku42qIy
 HwG1sGJng6IgTYDNOV4SaH4Nguschy8hORsOi0+6tvwoXplDtXOKVk7k6
 J8Xy4Nkgq/nSNwR48YzAsZQzepkliveaQCLISKMDikwHT8q4eiv0B26op
 zSvuNez6k+Zl2A5IBvTKWHPMPZmsubwEOe3oV/F93rZLBymopu1IGHFqg
 oZDgit0jOXwbh1Zkd4fdUBX9gnbTvSwghdSQMRy4ZDMKIb4NJLa1S/zqQ
 rEFgyb+Uc8tofHujhLykF0kJw7wNjza8ayx+GUS+0JXnhkNrzWLEshI1O Q==;
X-CSE-ConnectionGUID: 6S2v6Q17QLGd35AFwvGJgw==
X-CSE-MsgGUID: O/NjNq4GQve9zLBAnIaX5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15603755"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15603755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 10:08:25 -0700
X-CSE-ConnectionGUID: Rh0VPUJ4TheowC2a429PqA==
X-CSE-MsgGUID: Kg8ozO4ITBuZoqqx3ldKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41801368"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 10:08:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Date: Wed, 19 Jun 2024 20:08:15 +0300
Message-ID: <87y170eu80.fsf@intel.com>
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

The main i915 pull request for v6.11. A bit more commits than usual.
Should've started sending periodic PR's earlier to keep it more
manageable. My bad.

Highlights are BMG display, panel replay enabling, and link training
failure fallback for DP MST.

A big chunk of the commit count comes from finally removing implicit
dev_priv variable references from register macros. This is iterative
preparation for better separation of display code from i915 and xe core
code.

Off to midsummer festivities,
Jani.


drm-intel-next-2024-06-19:
drm/i915 feature pull for v6.11:

Features and functionality:
- Battlemage (BMG) Xe2 HPD display enabling (Balasubramani, Clint, Gustavo,
  Jos=C3=A9, Matt, Anusha, Lucas, Ravi, Radhakrishna, Nirmoy, Ankit, Matthe=
w)
- Panel Replay enabling (Jouni, Animesh)
- DP AUX-less ALPM (Advanced Link Power Management) and LOBF (Link off betw=
een
  frames) enabling (Animesh, Jouni)
- Enable link training failure fallback for DP MST links (Imre)
- CMRR (Content Match Refresh Rate) enabling (Mitul)
- Allow the first async flip to change modifier (Ville)
- Enable eDP AUX based HDR backlight (Suraj)
- Increase ADL-S/ADL-P/DG2+ max TMDS bitrate to 6 Gbps (Ville)

Refactoring and cleanups:
- Stop using implicit dev_priv local variable in macros (Jani)
- Expand and clean up VBT table definitions (Ville)
- PSR/ALPM refactoring (Jouni, Animesh)
- Plane fb refactoring (Ville)
- Rawclk, FSB, and mem frequency refactoring (Jani)
- GVT register macro usage cleanups (Jani, Ville)
- Plane, cursor, wm and ddb register macro and usage cleanups (Ville)
- Pipe CRC register macro cleanups (Ville)
- PCI ID macro cleanups and refactoring to match xe style (Jani)
- Move drm-intel repo to gitlab.freedesktop.org (Ryszard)
- Identify all platforms/subplatforms in display probe (Jani)
- Move Intel drm headers under include/drm/intel (Jani)
- Drop local redundant W=3D1 warnings in favour of drm subsystem warnigs (J=
ani)
- Include cleanups; include what you use (Jani)
- Convert overlay and DMC error state printing to drm_printer (Jani)
- Joiner renames (Stan)
- DSB interface cleanups (Ville)
- Improve workaround for disabling FBC when VT-d is active (Vinod)
- State checker refactoring and cleanups for color, planes and cdclk (Ville)
- Cleanups around scanline arithmetic (Ville)
- Use drm_crtc_vblank_crtc() instead of open coding (Ville)
- DSC cleanups (Ville)

Fixes:
- Improve VBT array bounds check (Luca)
- LNL PSR fixes (Jouni)
- Audio workaround, disable min hblank fix (Uma)
- Stop selecting ACPI_BUTTON config (Jani)
- Add MTL Cx0 PHY config compare (Mika)
- Fix MTL C20 PHY port clock verification (Mika)
- Fix static analyzer warning for uapi.event access (Luca)
- HDCP fixes and workarounds (Suraj)
- Fix DP MST DSC input BPP computation (Imre)
- Fix assert on pending async-put power domain work (Imre)
- Fix documentation build for DMC wakelocks (Luca)
- Disable DSC on eDP when indicated by VBT (Ville)

DRM Core changes:
- Various DPCD register additions for panel replay and ALPM (Jouni)
- Add target_rr_divider to adaptive sync SDP (Mitul)

Xe driver changes:
- Remove unused xe->enabled_irq_mask and xe->sb_lock members (Jani)
- i915 display compat header cleanups (Jani)
- Remove redundant copy of intel_fbdev_fb.h (Ville)
- Add process name to devcoredump (Jos=C3=A9)
- Add xe_gt_err_once() (Matthew)
- Implement transient flush for BMG/Xe3 (Nirmoy)

Merges:
- Backmerges to sync with xe, drm-misc and upstream (Rodrigo, Jani)

BR,
Jani.

The following changes since commit 1ddaaa244021aba8496536a6627b4ad2bc0f936a:

  Merge tag 'amd-drm-next-6.11-2024-06-07' of https://gitlab.freedesktop.or=
g/agd5f/linux into drm-next (2024-06-11 14:01:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
24-06-19

for you to fetch changes up to d754ed2821fd9675d203cb73c4afcd593e28b7d0:

  Merge drm/drm-next into drm-intel-next (2024-06-19 11:38:31 +0300)

----------------------------------------------------------------
drm/i915 feature pull for v6.11:

Features and functionality:
- Battlemage (BMG) Xe2 HPD display enabling (Balasubramani, Clint, Gustavo,
  Jos=C3=A9, Matt, Anusha, Lucas, Ravi, Radhakrishna, Nirmoy, Ankit, Matthe=
w)
- Panel Replay enabling (Jouni, Animesh)
- DP AUX-less ALPM (Advanced Link Power Management) and LOBF (Link off betw=
een
  frames) enabling (Animesh, Jouni)
- Enable link training failure fallback for DP MST links (Imre)
- CMRR (Content Match Refresh Rate) enabling (Mitul)
- Allow the first async flip to change modifier (Ville)
- Enable eDP AUX based HDR backlight (Suraj)
- Increase ADL-S/ADL-P/DG2+ max TMDS bitrate to 6 Gbps (Ville)

Refactoring and cleanups:
- Stop using implicit dev_priv local variable in macros (Jani)
- Expand and clean up VBT table definitions (Ville)
- PSR/ALPM refactoring (Jouni, Animesh)
- Plane fb refactoring (Ville)
- Rawclk, FSB, and mem frequency refactoring (Jani)
- GVT register macro usage cleanups (Jani, Ville)
- Plane, cursor, wm and ddb register macro and usage cleanups (Ville)
- Pipe CRC register macro cleanups (Ville)
- PCI ID macro cleanups and refactoring to match xe style (Jani)
- Move drm-intel repo to gitlab.freedesktop.org (Ryszard)
- Identify all platforms/subplatforms in display probe (Jani)
- Move Intel drm headers under include/drm/intel (Jani)
- Drop local redundant W=3D1 warnings in favour of drm subsystem warnigs (J=
ani)
- Include cleanups; include what you use (Jani)
- Convert overlay and DMC error state printing to drm_printer (Jani)
- Joiner renames (Stan)
- DSB interface cleanups (Ville)
- Improve workaround for disabling FBC when VT-d is active (Vinod)
- State checker refactoring and cleanups for color, planes and cdclk (Ville)
- Cleanups around scanline arithmetic (Ville)
- Use drm_crtc_vblank_crtc() instead of open coding (Ville)
- DSC cleanups (Ville)

Fixes:
- Improve VBT array bounds check (Luca)
- LNL PSR fixes (Jouni)
- Audio workaround, disable min hblank fix (Uma)
- Stop selecting ACPI_BUTTON config (Jani)
- Add MTL Cx0 PHY config compare (Mika)
- Fix MTL C20 PHY port clock verification (Mika)
- Fix static analyzer warning for uapi.event access (Luca)
- HDCP fixes and workarounds (Suraj)
- Fix DP MST DSC input BPP computation (Imre)
- Fix assert on pending async-put power domain work (Imre)
- Fix documentation build for DMC wakelocks (Luca)
- Disable DSC on eDP when indicated by VBT (Ville)

DRM Core changes:
- Various DPCD register additions for panel replay and ALPM (Jouni)
- Add target_rr_divider to adaptive sync SDP (Mitul)

Xe driver changes:
- Remove unused xe->enabled_irq_mask and xe->sb_lock members (Jani)
- i915 display compat header cleanups (Jani)
- Remove redundant copy of intel_fbdev_fb.h (Ville)
- Add process name to devcoredump (Jos=C3=A9)
- Add xe_gt_err_once() (Matthew)
- Implement transient flush for BMG/Xe3 (Nirmoy)

Merges:
- Backmerges to sync with xe, drm-misc and upstream (Rodrigo, Jani)

----------------------------------------------------------------
Animesh Manna (5):
      drm/i915/alpm: Move alpm parameters from intel_psr
      drm/i915/alpm: Move alpm related code to a new file
      drm/i915/alpm: Add compute config for lobf
      drm/i915/alpm: Enable lobf from source in ALPM_CTL
      drm/i915/alpm: Add debugfs for LOBF

Ankit Nautiyal (1):
      Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"

Anusha Srivatsa (1):
      drm/i915/xe2hpd: Configure CHICKEN_MISC_2 before enabling planes

Balasubramani Vivekanandan (6):
      drm/i915/bmg: Define IS_BATTLEMAGE macro
      drm/i915/xe2hpd: Add new C20 PHY SRAM address
      drm/i915/xe2hpd: Add support for eDP PLL configuration
      drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
      drm/xe/bmg: Enable the display support
      drm/i915/display/bmg: Add platform descriptor

Chaitanya Kumar Borah (1):
      drm/i915/audio: Fix audio time stamp programming for DP

Clint Taylor (2):
      drm/i915/bmg: Lane reversal requires writes to both context lanes
      drm/i915/xe2hpd: Initial cdclk table

Gustavo Sousa (1):
      drm/i915/bmg: Load DMC

Imre Deak (24):
      drm/i915: Fix audio component initialization
      drm/i915: Fix assert on pending async-put power domain work when it r=
equeues itself
      drm/i915/dp_mst: Fix DSC input BPP computation
      drm/i915/dp_mst: Align TUs to avoid splitting symbols across MTPs
      drm/i915/dp: Move link train params to a substruct in intel_dp
      drm/i915/dp: Move link train fallback to intel_dp_link_training.c
      drm/i915/dp: Sanitize intel_dp_get_link_train_fallback_values()
      drm/i915: Factor out function to modeset commit a set of pipes
      drm/i915/dp: Use a commit modeset for link retraining MST links
      drm/i915/dp: Recheck link state after modeset
      drm/i915/dp: Reduce link params only after retrying with unchanged pa=
rams
      drm/i915/dp: Pass atomic state to link training function
      drm/i915/dp: Send a link training modeset-retry uevent to all MST con=
nectors
      drm/i915/dp: Use check link state work in the hotplug handler
      drm/i915/dp: Use check link state work in the detect handler
      drm/i915/dp: Use check link state work in the HPD IRQ handler
      drm/i915/dp: Disable link retraining after the last fallback step
      drm/i915/dp_mst: Reset intel_dp->link_trained during disabling
      drm/i915/dp_mst: Enable link training fallback for MST
      drm/i915/dp: Add debugfs entries to force the link rate/lane count
      drm/i915/dp: Add debugfs entries to get the max link rate/lane count
      drm/i915/dp: Add debugfs entry to force link training failure
      drm/i915/dp: Add debugfs entry to force link retrain
      drm/i915/dp: Add debugfs entry to get the link retrain disabled state

Jani Nikula (196):
      drm/i915: pass dev_priv explicitly to TRANS_EXITLINE
      drm/i915: pass dev_priv explicitly to EDP_PSR_CTL
      drm/i915: pass dev_priv explicitly to TRANS_PSR_IMR
      drm/i915: pass dev_priv explicitly to TRANS_PSR_IIR
      drm/i915: pass dev_priv explicitly to EDP_PSR_AUX_CTL
      drm/i915: pass dev_priv explicitly to EDP_PSR_AUX_DATA
      drm/i915: pass dev_priv explicitly to EDP_PSR_STATUS
      drm/i915: pass dev_priv explicitly to EDP_PSR_PERF_CNT
      drm/i915: pass dev_priv explicitly to EDP_PSR_DEBUG
      drm/i915: pass dev_priv explicitly to EDP_PSR2_CTL
      drm/i915: pass dev_priv explicitly to PSR_EVENT
      drm/i915: pass dev_priv explicitly to EDP_PSR2_STATUS
      drm/i915: pass dev_priv explicitly to PSR2_SU_STATUS
      drm/i915: pass dev_priv explicitly to PSR2_MAN_TRK_CTL
      drm/i915: pass dev_priv explicitly to PIPE_SRCSZ_ERLY_TPT
      drm/i915: pass dev_priv explicitly to ALPM_CTL
      FIXME drm/i915: pass dev_priv explicitly to ALPM_CTL2
      drm/i915: pass dev_priv explicitly to PORT_ALPM_CTL
      drm/i915: pass dev_priv explicitly to PORT_ALPM_LFPS_CTL
      drm/i915: pass dev_priv explicitly to PIPE_CRC_CTL
      drm/i915: pass dev_priv explicitly to PIPE_CRC_*
      drm/i915: pass dev_priv explicitly to PORT_DFT2_G4X
      drm/i915: pass dev_priv explicitly to TRANS_VRR_CTL
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VMAX
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VMIN
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VMAXSHIFT
      drm/i915: pass dev_priv explicitly to TRANS_VRR_STATUS
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VTOTAL_PREV
      drm/i915: pass dev_priv explicitly to TRANS_VRR_FLIPLINE
      drm/i915: pass dev_priv explicitly to TRANS_VRR_STATUS2
      drm/i915: pass dev_priv explicitly to TRANS_PUSH
      drm/i915: pass dev_priv explicitly to TRANS_VRR_VSYNC
      drm/xe/display: remove unused xe->enabled_irq_mask
      drm/xe/display: remove unused xe->sb_lock
      drm/i915/pciids: add INTEL_PNV_IDS(), use acronym
      drm/i915/pciids: add INTEL_ILK_IDS(), use acronym
      drm/i915/pciids: add INTEL_SNB_IDS()
      drm/i915/pciids: add INTEL_IVB_IDS()
      drm/i915/pciids: don't include WHL/CML PCI IDs in CFL
      drm/i915/pciids: remove 11 from INTEL_ICL_IDS()
      drm/i915/pciids: remove 12 from INTEL_TGL_IDS()
      drm/i915/pciids: don't include RPL-U PCI IDs in RPL-P
      drm/i915: pass dev_priv explicitly to CURCNTR
      drm/i915: pass dev_priv explicitly to CURBASE
      drm/i915: pass dev_priv explicitly to CURPOS
      drm/i915: pass dev_priv explicitly to CURPOS_ERLY_TPT
      drm/i915: pass dev_priv explicitly to CURSIZE
      drm/i915: pass dev_priv explicitly to CUR_FBC_CTL
      drm/i915: pass dev_priv explicitly to CUR_CHICKEN
      drm/i915: pass dev_priv explicitly to CURSURFLIVE
      drm/i915/pciids: switch to xe driver style PCI ID macros
      drm/i915: stop redefining INTEL_VGA_DEVICE
      drm/i915: pass dev_priv explicitly to DSPADDR_VLV
      drm/i915: pass dev_priv explicitly to DSPCNTR
      drm/i915: pass dev_priv explicitly to DSPADDR
      drm/i915: pass dev_priv explicitly to DSPLINOFF
      drm/i915: pass dev_priv explicitly to DSPSTRIDE
      drm/i915: pass dev_priv explicitly to DSPPOS
      drm/i915: pass dev_priv explicitly to DSPSIZE
      drm/i915: pass dev_priv explicitly to DSPSURF
      drm/i915: pass dev_priv explicitly to DSPTILEOFF
      drm/i915: pass dev_priv explicitly to DSPOFFSET
      drm/i915: pass dev_priv explicitly to DSPSURFLIVE
      drm/i915: pass dev_priv explicitly to DSPGAMC
      drm/i915: pass dev_priv explicitly to PRIMPOS
      drm/i915: pass dev_priv explicitly to PRIMSIZE
      drm/i915: pass dev_priv explicitly to PRIMCNSTALPHA
      drm/i915: pass dev_priv explicitly to PIPEGCMAX
      drm/i915: pass dev_priv explicitly to _MMIO_PPS
      drm/i915: pass dev_priv explicitly to PP_STATUS
      drm/i915: pass dev_priv explicitly to PP_CONTROL
      drm/i915: pass dev_priv explicitly to PP_ON_DELAYS
      drm/i915: pass dev_priv explicitly to PP_OFF_DELAYS
      drm/i915: pass dev_priv explicitly to PP_DIVISOR
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_CTL
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_GCP
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_AVI_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_VS_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_SPD_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_GMP_DATA
      drm/i915: pass dev_priv explicitly to HSW_TVIDEO_DIP_VSC_DATA
      drm/i915: pass dev_priv explicitly to GLK_TVIDEO_DIP_DRM_DATA
      drm/i915: pass dev_priv explicitly to ICL_VIDEO_DIP_PPS_DATA
      drm/i915: pass dev_priv explicitly to ICL_VIDEO_DIP_PPS_ECC
      drm/i915: pass dev_priv explicitly to ADL_TVIDEO_DIP_AS_SDP_DATA
      drm/i915/display: move params copy at probe earlier
      drm/i915/display: change probe for no display case
      drm/i915/display: check platforms without display one level higher
      drm/i915/display: change GMD ID display ip ver propagation at probe
      drm/i915/display: add platform descriptors
      drm/i915: add LNL PCI IDs
      drm/i915/display: change display probe to identify GMD ID based platf=
orms
      drm/i915/display: identify platforms with enum and name
      drm/i915/display: add support for subplatforms
      drm/i915/display: add probe message
      drm/i915/gvt: use proper macros for DP AUX CH CTL registers
      drm/i915: remove unused DP AUX CH register macros
      drm/i915: rearrange DP AUX register macros
      drm/i915: move PCH DP AUX CH regs to intel_dp_aux_regs.h
      drm/i915: remove intermediate _PCH_DP_* macros
      drm/i915: drop unnecessary i915_reg.h includes
      drm/i915: reduce includes in intel_clock_gating.c
      drm: move intel-gtt.h under include/drm/intel
      drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
      drm: move i915_component.h under include/drm/intel
      drm: move intel_lpe_audio.h under include/drm/intel
      drm: move i915_drm.h under include/drm/intel
      drm: move i915_pxp_tee_interface.h under include/drm/intel
      drm: move i915_pciids.h under include/drm/intel
      drm: move xe_pciids.h under include/drm/intel
      drm: move i915_hdcp_interface.h under include/drm/intel
      MAINTAINERS: update i915 and xe entries for include/drm/intel
      drm/i915: drop redundant W=3D1 warnings from Makefile
      drm/i915/display: include gem/i915_gem_stolen.h where needed
      drm/i915/display: include gt/intel_gt_types.h where needed
      drm/i915/display: include i915_gpu_error.h where needed
      drm/i915/display: include intel_uncore.h where needed
      drm/i915/display: include intel_step.h where needed
      drm/i915/display: include xe_bo.h, gem_object_types etc. where needed
      drm/xe/display: move compat uncore stubs to the correct file
      drm/xe/display: move compat runtime pm stubs to the correct file
      drm/xe/display: reduce includes in compat i915_drv.h
      drm/xe/display: drop i915_drv.h include from xe code
      drm/i915/dmc: convert intel_dmc_print_error_state() to drm_printer
      drm/i915/overlay: convert intel_overlay_print_error_state() to drm_pr=
inter
      drm/i915: pass dev_priv explicitly to DPLL
      drm/i915: pass dev_priv explicitly to DPLL_MD
      drm/i915: pass dev_priv explicitly to TRANS_HTOTAL
      drm/i915: pass dev_priv explicitly to TRANS_HBLANK
      drm/i915: pass dev_priv explicitly to TRANS_HSYNC
      drm/i915: pass dev_priv explicitly to TRANS_VTOTAL
      drm/i915: pass dev_priv explicitly to TRANS_VBLANK
      drm/i915: pass dev_priv explicitly to TRANS_VSYNC
      drm/i915: pass dev_priv explicitly to BCLRPAT
      drm/i915: pass dev_priv explicitly to TRANS_VSYNCSHIFT
      drm/i915: pass dev_priv explicitly to PIPESRC
      drm/i915: pass dev_priv explicitly to TRANS_MULT
      drm/i915: pass dev_priv explicitly to PORT_HOTPLUG_EN
      drm/i915: pass dev_priv explicitly to PORT_HOTPLUG_STAT
      drm/i915: pass dev_priv explicitly to PFIT_CONTROL
      drm/i915: pass dev_priv explicitly to PFIT_PGM_RATIOS
      drm/i915: pass dev_priv explicitly to PFIT_AUTO_RATIOS
      drm/i915: pass dev_priv explicitly to TRANSCONF
      drm/i915: pass dev_priv explicitly to PIPEDSL
      drm/i915: pass dev_priv explicitly to PIPEFRAME
      drm/i915: pass dev_priv explicitly to PIPEFRAMEPIXEL
      drm/i915: pass dev_priv explicitly to PIPESTAT
      drm/i915: pass dev_priv explicitly to PIPE_ARB_CTL
      drm/i915: pass dev_priv explicitly to ICL_PIPESTATUS
      drm/i915: pass dev_priv explicitly to DSPARB
      drm/i915: pass dev_priv explicitly to DSPFW1
      drm/i915: pass dev_priv explicitly to DSPFW2
      drm/i915: pass dev_priv explicitly to DSPFW3
      drm/i915: pass dev_priv explicitly to PIPE_FRMCOUNT_G4X
      drm/i915: pass dev_priv explicitly to PIPE_FLIPCOUNT_G4X
      drm/i915: pass dev_priv explicitly to CHV_BLEND
      drm/i915: pass dev_priv explicitly to CHV_CANVAS
      drm/i915: pass dev_priv explicitly to SWF0
      drm/i915: pass dev_priv explicitly to SWF1
      drm/i915: pass dev_priv explicitly to SWF3
      drm/i915: pass dev_priv explicitly to PIPE_DATA_M1
      drm/i915: pass dev_priv explicitly to PIPE_DATA_N1
      drm/i915: pass dev_priv explicitly to PIPE_DATA_M2
      drm/i915: pass dev_priv explicitly to PIPE_DATA_N2
      drm/i915: pass dev_priv explicitly to PIPE_LINK_M1
      drm/i915: pass dev_priv explicitly to PIPE_LINK_N1
      drm/i915: pass dev_priv explicitly to PIPE_LINK_M2
      drm/i915: pass dev_priv explicitly to PIPE_LINK_N2
      drm/i915: pass dev_priv explicitly to TRANS_DDI_FUNC_CTL
      drm/i915: pass dev_priv explicitly to TRANS_DDI_FUNC_CTL2
      drm/i915: pass dev_priv explicitly to TGL_DP_TP_CTL
      drm/i915: pass dev_priv explicitly to TGL_DP_TP_STATUS
      drm/i915: pass dev_priv explicitly to TRANS_MSA_MISC
      drm/i915: pass dev_priv explicitly to TRANS_SET_CONTEXT_LATENCY
      drm/i915: pass dev_priv explicitly to MTL_CLKGATE_DIS_TRANS
      drm/i915: do not select ACPI_BUTTON
      drm/i915: pass dev_priv explicitly to HSW_STEREO_3D_CTL
      drm/i915/gvt: remove the unused end parameter from calc_index()
      drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
      drm/i915/gvt: rename range variable to stride
      drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
      drm/i915: relocate some DSPCNTR reg bit definitions
      drm/i915: remove unused pipe/plane B register macros
      drm/i915/mso: using joiner is not possible with eDP MSO
      drm/i915/wm: rename intel_get_cxsr_latency -> pnv_get_cxsr_latency
      drm/i915/wm: clarify logging on not finding CxSR latency config
      drm/i915/dram: separate fsb freq detection from mem freq
      drm/i915/dram: split out pnv DDR3 detection
      drm/i915/dram: rearrange mem freq init
      drm/i915/gt: remove mem freq from gt debugfs
      drm/i915: convert fsb_freq and mem_freq to kHz
      drm/i915: extend the fsb_freq initialization to more platforms
      drm/i915: use i9xx_fsb_freq() for GT clock frequency
      drm/i915/cdclk: use i9xx_fsb_freq() for rawclk_freq initialization
      drm/i915: move comments about FSB straps to proper place
      Merge drm/drm-next into drm-intel-next

Jos=C3=A9 Roberto de Souza (3):
      drm/i915/xe2hpd: Properly disable power in port A
      drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits
      drm/xe: Add process name to devcoredump

Jouni H=C3=B6gander (49):
      drm/i915/psr: Rename has_psr2 as has_sel_update
      drm/i915/display: Do not print "psr: enabled" for on Panel Replay
      drm/i915/dp: Use always vsc revision 0x6 for Panel Replay
      drm/i915/psr: Rename psr2_enabled as sel_update_enabled
      drm/panelreplay: dpcd register definition for panelreplay SU
      drm/i915/psr: Detect panel replay selective update support
      drm/i915/psr: Modify intel_dp_get_su_granularity to support panel rep=
lay
      drm/i915/psr: Panel replay uses SRD_STATUS to track it's status
      drm/i915/psr: Do not apply workarounds in case of panel replay
      drm/i915/psr: Update PSR module parameter descriptions
      drm/i915/psr: Split intel_psr2_config_valid for panel replay
      drm/i915/psr: Add panel replay sel update support to debugfs interface
      drm/i915/psr: LunarLake IO and Fast Wake time line count maximums are=
 68
      drm/i915/psr: LunarLake PSR2_CTL[IO Wake Lines] is 6 bits wide
      drm/i915/psr: PSR2_CTL[Block Count Number] not needed for LunarLake
      drm/i915/psr: Store pr_dpcd in intel_dp
      drm/panel replay: Add edp1.5 Panel Replay bits and register
      drm/i915/psr: Move printing sink PSR support to own function
      drm/i915/psr: Move printing PSR mode to own function
      drm/i915/psr: modify psr status debugfs to support eDP Panel Replay
      drm/display: Add missing aux less alpm wake related bits
      drm/i915/psr: Add Early Transport status boolean into intel_psr
      drm/i915/psr: Get Early Transport status in intel_psr_pipe_get_config
      drm/i915/psr: Use enable boolean from intel_crtc_state for Early Tran=
sport
      drm/i915/display: Selective fetch Y position on Region Early Transport
      drm/i915/psr: Allow setting I915_PSR_DEBUG_SU_REGION_ET_DISABLE via d=
ebugfs
      drm/i915/psr: Add Early Transport into psr debugfs interface
      drm/i915/alpm: Do not use fast_wake_lines for aux less wake time
      drm/i915/alpm: Write also AUX Less Wake lines into ALPM_CTL
      drm/i915/display: Take panel replay into account in vsc sdp unpacking
      drm/i915/display: Skip Panel Replay on pipe comparison if no active p=
lanes
      drm/display: Add missing Panel Replay Enable SU Region ET bit
      drm/i915/psr: Split enabling sink for PSR and Panel Replay
      drm/i915/alpm: Share alpm support checks with PSR code
      drm/i915/psr: Add Panel Replay support to intel_psr2_config_et_valid
      drm/i915/psr: Print Panel Replay status instead of frame lock status
      drm/i915/psr: Move vblank length check to separate function
      drm/i915/psr: Take into account SU SDP scanline indication in vblank =
check
      drm/i915/psr: Check vblank against IO buffer wake time on Lunarlake
      drm/i915/psr: Wake time is aux less wake time for Panel Replay
      drm/i915/psr: Set SU area width as pipe src width
      drm/i915/display: Wa 16021440873 is writing wrong register
      drm/i915/alpm: Fix port clock usage in AUX Less wake time calculation
      drm/i915/psr: Disable Panel Replay if PSR mode is set via module para=
meter
      drm/i915/psr: Disable PSR2 SU Region ET if enable_psr module paramete=
r is set
      drm/i915/psr: Disable PSR/Panel Replay on sink side for PSR only
      drm/i915/psr: Add new debug bit to disable Panel Replay
      Revert "drm/i915/psr: Disable early transport by default"
      intel_alpm: Fix wrong offset for PORT_ALPM_* registers

Karthikeyan Ramasubramanian (1):
      drm/i915/bios: Fix parsing backlight BDB data

Luca Coelho (3):
      Documentation/i915: remove kernel-doc for DMC wakelocks
      drm/i915/bios: double check array-boundary in parse_sdvo_lvds_data
      drm/i915: move uapi.event outside spinlock in intel_crtc_vblank_work

Lucas De Marchi (1):
      drm/i915/xe2hpd: Add display info

Matt Roper (2):
      drm/i915/xe2hpd: Add max memory bandwidth algorithm
      drm/i915/bmg: BMG should re-use MTL's south display logic

Matthew Auld (2):
      drm/xe/gt_print: add xe_gt_err_once()
      drm/i915/display: perform transient flush

Mika Kahola (3):
      drm/i915/display: Calculate crtc clock rate based on PLL parameters
      drm/i915/display: Revert "drm/i915/display: Skip C10 state verificati=
on in case of fastset"
      drm/i915/display: Add compare config for MTL+ platforms

Mitul Golani (11):
      drm/i915: Update indentation for VRR registers and bits
      drm/i915: Separate VRR related register definitions
      drm/i915: Define and compute Transcoder CMRR registers
      drm/i915: Update trans_vrr_ctl flag when cmrr is computed
      drm/dp: Add refresh rate divider to struct representing AS SDP
      drm/i915/display: Add support for pack and unpack
      drm/i915/display: Compute Adaptive sync SDP params
      drm/i915/display: Compute vrr vsync params
      drm/i915: Compute CMRR and calculate vtotal
      drm/i915/display: Send vrr vsync params whne vrr is enabled
      drm/i915/display: Update calculation to avoid overflow

Nirmoy Das (2):
      drm/xe/device: implement transient flush
      drm/i915/selftests: Set always_coherent to false when reading from CPU

Radhakrishna Sripada (1):
      drm/i915/bmg: Extend DG2 tc check to future

Ravi Kumar Vodapalli (1):
      drm/i915/xe2hpd: update pll values in sync with Bspec

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Ryszard Knop (1):
      MAINTAINERS: Move the drm-intel repo location to fd.o GitLab

Stanislav Lisovskiy (2):
      drm/i915: Rename all bigjoiner to joiner
      drm/i915: Rename bigjoiner master/slave to bigjoiner primary/secondary

Suraj Kandpal (11):
      drm/i915/hdcp: Disable HDCP Line Rekeying for HDCP2.2 on HDMI
      drm/i915/dp: Make has_gamut_metadata_dip() non static
      drm/i915/dp: Rename intel struct inside intel_panel
      drm/i915/dp: Add TCON HDR capability checks
      drm/i915/dp: Fix Register bit naming
      drm/i915/dp: Drop comments on EDP HDR DPCD registers
      drm/i915/dp: Enable AUX based backlight for HDR
      drm/i915/dp: Write panel override luminance values
      drm/i915/hdcp: Move aux assignment after connector type check
      drm/i915/hdcp: Check mst_port to determine connector type
      drm/i915/hdcp: Fix IS_METEORLAKE usage for HDCP line rekeying

Uma Shankar (1):
      drm/i915: Implement Audio WA_14020863754

Vidya Srinivas (1):
      drm/i915/dpt: Make DPT object unshrinkable

Ville Syrj=C3=A4l=C3=A4 (115):
      drm/i915: Align PLANE_SURF to 16k on ADL for async flips
      drm/i915: Reject async flips if we need to change DDB/watermarks
      drm/i915: Allow the initial async flip to change modifier
      drm/i915: Eliminate extra frame from skl-glk sync->async flip change
      drm/i915: s/need_async_flip_disable_wa/need_async_flip_toggle_wa/
      drm/i915/bios: Define eDP DSC disable bit
      drm/i915/bios: Remove version number comment from DEVICE_HANDLE_EFP4
      drm/i915/bios: Indicate which VBT structures are based on EDID
      drm/i915/bios: Get rid of "LVDS" from all LFP data stuff
      drm/i915/bios: Rename SDVO DTD blocks a bit
      drm/i915/bios: Define "TV" child device handle
      drm/i915/bios: Flag "VBIOS only" VBT data blocks
      drm/i915/bios: Add version notes for some blocks
      drm/i915/bios: Define VBT block 3 (Display Toggle Option) contents
      drm/i915/bios: Define VBT block 4 (Mode Support List) contents
      drm/i915/bios: Define VBT block 5 (Generic Mode Table)
      drm/i915/bios: Define VBT blocks 6,7,8 (register tables) contents
      drm/i915/bios: Define VBT block 10 (Mode Removal Table) contents
      drm/i915/bios: Define VBT block 12 (Driver Persistent Algorithm) cont=
ents
      drm/i915/bios: Define VBT block 15 (Dot Clock Override Table) contents
      drm/i915/bios: Define ALM only VBT block 9 contents
      drm/i915/bios: Define VBT block 17 (SV Test Functions) contents
      drm/i915/bios: Define VBT block 18 (Driver Rotation) contents
      drm/i915/bios: Define VBT blocks 16,29,31 (Toggle List) contents
      drm/i915/bios: Define VBT blocks 19,30,32 (Display Configuration Remo=
val Table) contents
      drm/i915/bios: Define VBT block 20 (OEM Customizable Modes) contents
      drm/i915/bios: Define VBT block 21 (EFP List) contents
      drm/i915/bios: Define VBT block 24 (SDVO LVDS PnP ID) contents
      drm/i915/bios: Define VBT block 25 (SDVO LVDS PPS) contents
      drm/i915/bios: Define VBT block 26 (TV Options) contents
      drm/i915/bios: Define VBT block 28 (EFP DTD) contents
      drm/i915/bios: Define VBT block 45 (eDP BFI) contents
      drm/i915/bios: Define VBT block 46 (Chromaticity For Narrow Gamut Pan=
el) contents
      drm/i915/bios: Define VBT block 51 (Fixed Set Mode Table) contents
      drm/i915/bios: Define VBT block 55 (RGB Palette Table) contents
      drm/i915/bios: Define VBT block 57 (Vswing PreEmphasis Table) contents
      drm/i915/bios: Define VBT block 50 (MIPI) contents
      drm/i915/bios: Define VBT block 55 (Compression Parameters)
      drm/i915/bios: Define VBT block 252 (int15 Hook)
      drm/i915/bios: Define VBT block 253 (PRD Table) contents
      drm/i915: Use drm_crtc_vblank_crtc()
      drm/xe: Nuke xe's copy of intel_fbdev_fb.h
      drm/i915: Split gen2 vs. gen3 .max_stride()
      drm/i915: Clean up skl+ plane stride limits
      drm/i915: Drop 'uses_fence' parameter from intel_pin_fb_obj_dpt()
      drm/i915: Extract intel_plane_needs_physical()
      drm/i915: Polish types in fb calculations
      drm/i915: Constify 'fb' in during pinning
      drm/i915: Change intel_fbdev_fb_alloc() return type
      drm/i915: Cleanup fbdev fb setup
      drm/i915: Rename the fb pinning functions to indicate the address spa=
ce
      drm/i915: Nuke _MMIO_PLANE_GAMC()
      drm/i915: Extract skl_universal_plane_regs.h
      drm/i915: Extract intel_cursor_regs.h
      drm/i915: Move skl+ wm/ddb registers to proper headers
      drm/i915/gvt: Use the proper PLANE_AUX_DIST() define
      drm/i915/gvt: Use the proper PLANE_AUX_OFFSET() define
      drm/i915/gvt: Use the full PLANE_KEY*() defines
      drm/i915/gvt: Use PLANE_CTL and PLANE_SURF defines
      drm/i915: Drop useless PLANE_FOO_3 register defines
      drm/i915: Shuffle the skl+ plane register definitions
      drm/i915: Use REG_BIT for PLANE_WM bits
      drm/i915: Drop a few unwanted tabs from skl+ plane reg defines
      drm/i915: Refactor skl+ plane register offset calculations
      drm/i915: Extract skl_plane_{wm,ddb}_reg_val()
      drm/i915: Nuke skl_write_wm_level() and skl_ddb_entry_write()
      drm/i915: Handle SKL+ WM/DDB registers next to all other plane regist=
ers
      drm/i915: Bump max TMDS bitrate to 6 Gbps on ADL-S/ADL-P/DG2+
      drm/i915: Add skl+ plane name aliases to enum plane_id
      drm/i915: Clean up the cursor register defines
      drm/i915: Add separate define for SEL_FETCH_CUR_CTL()
      drm/i915: Simplify PIPESRC_ERLY_TPT definition
      drm/i915: Rename selective fetch plane registers
      drm/i915: Add separate defines for cursor WM/DDB register bits
      drm/i915: Move PIPEGCMAX to intel_color_regs.h
      drm/i915: Extract i9xx_plane_regs.h
      drm/i915: Polish pre-skl primary plane registers
      drm/i915: Document a few pre-skl primary plane platform dependencies
      drm/i915: Polish sprite plane register definitions
      drm/i915: Document which platforms use which sprite registers
      drm/i915: Define SEL_FETCH_PLANE registers via PICK_EVEN_2RANGES()
      drm/i915: Fix SEL_FETCH_{SIZE,OFFSET} registers
      drm/i915: Plumb the entire atomic state into intel_color_check()
      drm/i915: Hide the intel_crtc_needs_color_update() inside intel_color=
_check()
      drm/i915: Bury c8_planes_changed() in intel_color_check()
      drm/i915/cdclk: Plumb the full atomic state deeper
      drm/i915: Plumb the full atomic state into icl_check_nv12_planes()
      drm/i915: Plumb the full atomic state into skl_ddb_add_affected_plane=
s()
      drm/i915: Reuse intel_mode_vblank_start()
      drm/i915: Extract intel_mode_vblank_end()
      drm/i915: Extract intel_mode_vtotal()
      drm/i915: Simplify scanline_offset handling for gen2
      drm/i915: Move intel_crtc_scanline_offset()
      drm/i915: Switch intel_usecs_to_scanlines() to 64bit maths
      drm/i915/dsb: Polish the DSB ID enum
      drm/i915/dsb: Move DSB ID definition to the header
      drm/i915/dsb: Pass DSB engine ID to intel_dsb_prepare()
      drm/i915/dsb: Use intel_color_uses_dsb()
      drm/i915: Extract intel_pipe_crc_regs.h
      drm/i915: Switch PIPE_CRC_RES_*_IVB to _MMIO_PIPE()
      drm/i915: Regroup pipe CRC regs
      drm/i915: Add a separate definition for PIPE_CRC_RES_HSW
      drm/i915: Document which platforms have which CRC registers
      drm/i915: Define the PIPE_CRC_EXP registers
      drm/i915: Protect CRC reg macro arguments for consistency
      drm/i915: Reduce DDI clock gating printk level from NOTICE to DEBUG
      drm/i915/bios: Define block 46 chromaticity coordinates properly
      drm/i915/bios: Define the "luminance and gamma" sub-struct of block 46
      drm/i915: Drop redundant dsc_decompression_aux check
      drm/i915: Extract intel_dp_has_dsc()
      drm/i915: Handle MST in intel_dp_has_dsc()
      drm/i915: Use intel_dp_has_dsc() during .compute_config()
      drm/i915: Reuse intel_dp_supports_dsc() for MST
      drm/i915: Utilize edp_disable_dsc from VBT
      drm/i915: Remove bogus MST check in intel_dp_has_audio()

Vinod Govindapillai (1):
      drm/i915/display: update handling of FBC when VT-d active workaround

 Documentation/gpu/i915.rst                         |   5 +-
 MAINTAINERS                                        |   7 +-
 arch/x86/kernel/early-quirks.c                     |  85 +-
 drivers/char/agp/intel-agp.c                       |   2 +-
 drivers/char/agp/intel-gtt.c                       |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |   1 -
 drivers/gpu/drm/i915/Makefile                      |  27 +-
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |   1 -
 drivers/gpu/drm/i915/display/g4x_dp.c              |  37 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          | 104 ++-
 drivers/gpu/drm/i915/display/i9xx_plane_regs.h     | 112 +++
 drivers/gpu/drm/i915/display/i9xx_wm.c             | 114 +--
 drivers/gpu/drm/i915/display/icl_dsi.c             |  46 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          | 414 +++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h          |  27 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |   1 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  62 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   1 +
 drivers/gpu/drm/i915/display/intel_audio.c         |  17 +-
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |   3 +
 drivers/gpu/drm/i915/display/intel_bios.c          | 243 +++---
 drivers/gpu/drm/i915/display/intel_bw.c            |  65 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 130 ++-
 drivers/gpu/drm/i915/display/intel_color.c         | 143 +--
 drivers/gpu/drm/i915/display/intel_color.h         |   4 +-
 drivers/gpu/drm/i915/display/intel_color_regs.h    |   5 +
 drivers/gpu/drm/i915/display/intel_crt.c           |  50 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |  15 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  15 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        | 102 ++-
 drivers/gpu/drm/i915/display/intel_cursor_regs.h   | 112 +++
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 368 +++++++-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   8 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |  48 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 129 +--
 drivers/gpu/drm/i915/display/intel_display.c       | 823 +++++++++--------
 drivers/gpu/drm/i915/display/intel_display.h       |  13 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 937 ++++++++++++++---=
---
 .../gpu/drm/i915/display/intel_display_device.h    |  89 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  46 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |  21 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  20 +-
 .../drm/i915/display/intel_display_power_well.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  87 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |   1 -
 drivers/gpu/drm/i915/display/intel_dmc.c           |  21 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |   6 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 414 +++++----
 drivers/gpu/drm/i915/display/intel_dp.h            |  24 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 149 +++-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |  18 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   5 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 538 +++++++++++-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   8 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  84 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  63 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   1 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   9 +-
 drivers/gpu/drm/i915/display/intel_dpt.h           |   5 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |   1 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |   8 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  31 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   9 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   6 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   5 +-
 drivers/gpu/drm/i915/display/intel_encoder.c       |  39 +
 drivers/gpu/drm/i915/display/intel_encoder.h       |  16 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  45 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |  75 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h        |  12 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  38 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  40 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  15 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  13 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  27 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   2 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  41 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  31 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  60 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   8 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |  21 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |   6 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  21 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  21 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h | 152 ++++
 drivers/gpu/drm/i915/display/intel_pps.c           |  32 +-
 drivers/gpu/drm/i915/display/intel_pps_regs.h      |  16 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 969 ++++++++++-------=
----
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  93 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   1 -
 drivers/gpu/drm/i915/display/intel_sprite_regs.h   | 242 ++---
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_tdf.h           |  25 +
 drivers/gpu/drm/i915/display/intel_vblank.c        | 169 ++--
 drivers/gpu/drm/i915/display/intel_vblank.h        |   5 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      | 729 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  19 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   6 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           | 182 +++-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      | 127 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 206 +++--
 drivers/gpu/drm/i915/display/skl_universal_plane.h |   2 +
 .../drm/i915/display/skl_universal_plane_regs.h    | 442 ++++++++++
 drivers/gpu/drm/i915/display/skl_watermark.c       | 134 +--
 drivers/gpu/drm/i915/display/skl_watermark.h       |  13 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |  83 --
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   1 -
 drivers/gpu/drm/i915/gt/intel_rps.c                |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |   4 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |  15 +-
 drivers/gpu/drm/i915/gvt/display.c                 |  73 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   3 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |  23 +-
 drivers/gpu/drm/i915/gvt/handlers.c                | 163 ++--
 drivers/gpu/drm/i915/gvt/reg.h                     |   3 -
 drivers/gpu/drm/i915/i915_drv.h                    |  11 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   5 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   5 +-
 drivers/gpu/drm/i915/i915_pci.c                    | 151 ++--
 drivers/gpu/drm/i915/i915_reg.h                    | 927 ++---------------=
---
 drivers/gpu/drm/i915/i915_suspend.c                |  48 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |  14 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  92 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        | 353 ++++----
 drivers/gpu/drm/i915/intel_pci_config.h            |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   4 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              | 216 +++--
 drivers/gpu/drm/i915/soc/intel_dram.h              |   1 +
 drivers/gpu/drm/i915/soc/intel_gmch.c              |   2 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |   4 +-
 drivers/gpu/drm/xe/Makefile                        |   5 +-
 .../gem/i915_gem_object_types.h                    |  11 +
 .../{ =3D> gem}/i915_gem_stolen.h                    |   0
 .../compat-i915-headers/{ =3D> gt}/intel_gt_types.h  |   0
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  67 +-
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |  51 ++
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   5 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   1 -
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   7 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |  37 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.h        |  21 -
 drivers/gpu/drm/xe/display/xe_display.c            |   3 -
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |   9 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  24 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |  23 +-
 drivers/gpu/drm/xe/display/xe_tdf.c                |  13 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   3 +
 drivers/gpu/drm/xe/xe_device.c                     |  49 ++
 drivers/gpu/drm/xe/xe_device.h                     |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   2 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   4 +-
 drivers/gpu/drm/xe/xe_gt_printk.h                  |   3 +
 drivers/gpu/drm/xe/xe_pci.c                        |   3 +-
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c         |   4 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                   |   4 +-
 drivers/misc/mei/pxp/mei_pxp.c                     |   4 +-
 drivers/platform/x86/intel_ips.c                   |   2 +-
 include/drm/display/drm_dp.h                       |  28 +-
 include/drm/display/drm_dp_helper.h                |   1 +
 include/drm/i915_pciids.h                          | 767 ----------------
 include/drm/{ =3D> intel}/i915_component.h           |   0
 include/drm/{ =3D> intel}/i915_drm.h                 |   0
 .../drm/{ =3D> intel}/i915_gsc_proxy_mei_interface.h |   0
 include/drm/{ =3D> intel}/i915_hdcp_interface.h      |   0
 include/drm/intel/i915_pciids.h                    | 800 +++++++++++++++++
 include/drm/{ =3D> intel}/i915_pxp_tee_interface.h   |   0
 include/drm/{ =3D> intel}/intel-gtt.h                |   0
 include/drm/{ =3D> intel}/intel_lpe_audio.h          |   0
 include/drm/{ =3D> intel}/xe_pciids.h                |   0
 include/sound/hdaudio.h                            |   2 +-
 sound/x86/intel_hdmi_audio.c                       |   2 +-
 189 files changed, 8817 insertions(+), 5484 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/i9xx_plane_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_alpm.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cursor_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_encoder.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_encoder.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_tdf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect_types.h
 rename drivers/gpu/drm/xe/compat-i915-headers/{ =3D> gem}/i915_gem_stolen.=
h (100%)
 rename drivers/gpu/drm/xe/compat-i915-headers/{ =3D> gt}/intel_gt_types.h =
(100%)
 delete mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_tdf.c
 delete mode 100644 include/drm/i915_pciids.h
 rename include/drm/{ =3D> intel}/i915_component.h (100%)
 rename include/drm/{ =3D> intel}/i915_drm.h (100%)
 rename include/drm/{ =3D> intel}/i915_gsc_proxy_mei_interface.h (100%)
 rename include/drm/{ =3D> intel}/i915_hdcp_interface.h (100%)
 create mode 100644 include/drm/intel/i915_pciids.h
 rename include/drm/{ =3D> intel}/i915_pxp_tee_interface.h (100%)
 rename include/drm/{ =3D> intel}/intel-gtt.h (100%)
 rename include/drm/{ =3D> intel}/intel_lpe_audio.h (100%)
 rename include/drm/{ =3D> intel}/xe_pciids.h (100%)

--=20
Jani Nikula, Intel
