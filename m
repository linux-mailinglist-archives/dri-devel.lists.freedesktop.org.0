Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF54474695
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D5410E56C;
	Tue, 14 Dec 2021 15:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE93310E552;
 Tue, 14 Dec 2021 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639496280; x=1671032280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pTEti60QHUfZfiRttXDkhEdh2WqEllJ6c7OTG913ETo=;
 b=IrtsswQ8Ni2scRLzlNkLicLkwpI9xxAhUzxogfzA8hixPl2vFoWa8X5S
 uthmgpTAI6QXceWQSwJCMuMkcuyZPnRoAgWX9WymAM3E4KE1X+Cdduot0
 k8CC0wwM4/GIPxssHHQvGRYcIVcXk5VoLMIlAwPCGd8PDP0PDtoKy8X3t
 GIgPGtAfz2Rsq/wZxabTqsoiGE8gsII+gC+2cx7mEL/czVAzgX1Bm2YHk
 HVzqx/p5knzf6b36bj59ShC8/5Y/9rc4lQgxjghj8RdKIzgYkDTnZAoN8
 dZUh5HIElMKiiZEsVu/17HhUmDsPikLELiV7JwS4IywbHjvLhh7ZwnuLp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302380431"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="302380431"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 07:37:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="518292066"
Received: from nalbarnj-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.3.235])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 07:37:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 14 Dec 2021 17:37:49 +0200
Message-ID: <87ee6f5h9u.fsf@intel.com>
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

drm-intel-next-2021-12-14:
drm/i915 feature pull #2 for v5.17:

Features and functionality:
- Add eDP privacy screen support (Hans)
- Add Raptor Lake S (RPL-S) support (Anusha)
- Add CD clock squashing support (Mika)
- Properly support ADL-P without force probe (Clint)
- Enable pipe color support (10 bit gamma) for display 13 platforms (Uma)
- Update ADL-P DMC firmware to v2.14 (Madhumitha)

Refactoring and cleanups:
- More FBC refactoring preparing for multiple FBC instances (Ville)
- Plane register cleanups (Ville)
- Header refactoring and include cleanups (Jani)
- Crtc helper and vblank wait function cleanups (Jani, Ville)
- Move pipe/transcoder/abox masks under intel_device_info.display (Ville)

Fixes:
- Add a delay to let eDP source OUI write take effect (Lyude)
- Use div32 version of MPLLB word clock for UHBR on SNPS PHY (Jani)
- Fix DMC firmware loader overflow check (Harshit Mogalapalli)
- Fully disable FBC on FIFO underruns (Ville)
- Disable FBC with double wide pipe as mutually exclusive (Ville)
- DG2 workarounds (Matt)
- Non-x86 build fixes (Siva)
- Fix HDR plane max width for NV12 (Vidya)
- Disable IRQ for selftest timestamp calculation (Anshuman)
- ADL-P VBT DDC pin mapping fix (Tejas)

Merges:
- Backmerge drm-next for privacy screen plumbing (Jani)

BR,
Jani.

The following changes since commit c8a04cbeedbc9f71c475141baa656f14f4879792:

  Merge tag 'drm-misc-next-2021-11-29' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2021-12-09 09:31:45 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-12-14

for you to fetch changes up to 96db14432d979532be4cb6d5d52a127317e68b3f:

  drm/i915: Fix implicit use of struct pci_dev (2021-12-14 10:38:29 +0200)

----------------------------------------------------------------
drm/i915 feature pull #2 for v5.17:

Features and functionality:
- Add eDP privacy screen support (Hans)
- Add Raptor Lake S (RPL-S) support (Anusha)
- Add CD clock squashing support (Mika)
- Properly support ADL-P without force probe (Clint)
- Enable pipe color support (10 bit gamma) for display 13 platforms (Uma)
- Update ADL-P DMC firmware to v2.14 (Madhumitha)

Refactoring and cleanups:
- More FBC refactoring preparing for multiple FBC instances (Ville)
- Plane register cleanups (Ville)
- Header refactoring and include cleanups (Jani)
- Crtc helper and vblank wait function cleanups (Jani, Ville)
- Move pipe/transcoder/abox masks under intel_device_info.display (Ville)

Fixes:
- Add a delay to let eDP source OUI write take effect (Lyude)
- Use div32 version of MPLLB word clock for UHBR on SNPS PHY (Jani)
- Fix DMC firmware loader overflow check (Harshit Mogalapalli)
- Fully disable FBC on FIFO underruns (Ville)
- Disable FBC with double wide pipe as mutually exclusive (Ville)
- DG2 workarounds (Matt)
- Non-x86 build fixes (Siva)
- Fix HDR plane max width for NV12 (Vidya)
- Disable IRQ for selftest timestamp calculation (Anshuman)
- ADL-P VBT DDC pin mapping fix (Tejas)

Merges:
- Backmerge drm-next for privacy screen plumbing (Jani)

----------------------------------------------------------------
Anshuman Gupta (1):
      drm/i915/selftest: Disable IRQ for timestamp calculation

Anusha Srivatsa (3):
      drm/i915/rpl-s: Add PCI IDS for Raptor Lake S
      drm/i915/rpl-s: Add PCH Support for Raptor Lake S
      drm/i915/rpl-s: Enable guc submission by default

Clint Taylor (1):
      drm/i915/adlp: Remove require_force_probe protection

Hans de Goede (2):
      drm/i915: Add intel_modeset_probe_defer() helper
      drm/i915: Add privacy-screen support (v3)

Harshit Mogalapalli (1):
      drm/i915/display: Fix an unsigned subtraction which can never be nega=
tive.

Jani Nikula (24):
      drm/i915/display: add intel_crtc_wait_for_next_vblank() and use it
      drm/i915/crtc: rename intel_get_crtc_for_pipe() to intel_crtc_for_pip=
e()
      drm/i915/crtc: rename intel_get_crtc_for_plane() to intel_crtc_for_pl=
ane()
      drm/i915/display: remove intel_wait_for_vblank()
      drm/i915/crtc: un-inline some crtc functions and move to intel_crtc.[=
ch]
      drm/i915/fb: move intel_fb_uses_dpt to intel_fb.c and un-inline
      drm/i915: split out intel_pm_types.h
      drm/i915: move enum hpd_pin to intel_display.h
      drm/i915/display: convert dp_to_i915() to a macro
      drm/i915/display: stop including i915_drv.h from intel_display_types.h
      drm/i915/snps: use div32 version of MPLLB word clock for UHBR
      drm/i915/ddi: add use_edp_hobl() and use_edp_low_vswing() helpers
      drm/i915/trace: clean up boilerplate organization
      drm/i915/trace: split out display trace to a separate file
      Merge drm/drm-next into drm-intel-next
      drm/i915/reset: include intel_display.h instead of intel_display_type=
s.h
      drm/i915/active: remove useless i915_utils.h include
      drm/i915/psr: avoid intel_frontbuffer.h include with declaration
      drm/i915/fbc: avoid intel_frontbuffer.h include with declaration
      drm/i915/fb: reduce include dependencies
      drm/i915/pxp: un-inline intel_pxp_is_enabled()
      drm/i915/pxp: remove useless includes
      drm/i915/cdclk: move intel_atomic_check_cdclk() to intel_cdclk.c
      drm/i915/cdclk: hide struct intel_cdclk_vals

Lyude Paul (1):
      drm/i915/dp: Perform 30ms delay after source OUI write

Madhumitha Tolakanahalli Pradeep (2):
      drm/i915/dmc: Change max DMC FW size on ADL-P
      drm/i915/dmc: Update DMC to v2.14 on ADL-P

Mark Brown (1):
      drm/i915: Fix implicit use of struct pci_dev

Matt Atwood (1):
      drm/i915/dg2: extend Wa_1409120013 to DG2

Matt Roper (2):
      drm/i915/dg2: s/DISP_STEPPING/DISPLAY_STEPPING/
      drm/i915/dg2: Add Wa_14010547955

Mika Kahola (4):
      drm/i915/display/dg2: Introduce CD clock squashing table
      drm/i915/display/dg2: Sanitize CD clock
      drm/i915/display/dg2: Set CD clock squashing registers
      drm/i915/display/dg2: Read CD clock from squasher table

Siva Mullati (1):
      drm/i915: Skip remap_io_mapping() for non-x86 platforms

Tejas Upadhyay (1):
      drm/i915/adl_p: Add ddc pin mapping

Uma Shankar (3):
      drm/i915/xelpd: Enable Pipe color support for D13 platform
      drm/i915/xelpd: Enable Pipe Degamma
      drm/i915/xelpd: Add Pipe Color Lut caps to platform config

Vidya Srinivas (1):
      drm/i915: Add PLANE_CUS_CTL restriction in max_width

Ville Syrj=C3=A4l=C3=A4 (29):
      drm/i915: Get rid of the 64bit PLANE_CC_VAL mmio
      drm/i915: Rename plane YUV order bits
      drm/i915: Rename PLANE_CUS_CTL Y plane bits
      drm/i915/fbc: Eliminate racy intel_fbc_is_active() usage
      drm/i915/fbc: Pass whole plane state to intel_fbc_min_limit()
      drm/i915/fbc: Nuke lots of crap from intel_fbc_state_cache
      drm/i915/fbc: Relocate intel_fbc_override_cfb_stride()
      drm/i915/fbc: Nuke more FBC state
      drm/i915/fbc: Reuse the same struct for the cache and params
      drm/i915/fbc: Pass around FBC instance instead of crtc
      drm/i915/fbc: Track FBC usage per-plane
      drm/i915/fbc: Flatten __intel_fbc_pre_update()
      drm/i915/fbc: Pass i915 instead of FBC instance to FBC underrun stuff
      drm/i915/fbc: Move FBC debugfs stuff into intel_fbc.c
      drm/i915/fbc: Introduce intel_fbc_add_plane()
      drm/i915/fbc: Allocate intel_fbc dynamically
      drm/i915/fbc: Move stuff from intel_fbc_can_enable() into intel_fbc_c=
heck_plane()
      drm/i915/fbc: Disable FBC fully on FIFO underrun
      drm/i915/fbc: Nuke state_cache
      drm/i915/fbc: Move plane pointer into intel_fbc_state
      drm/i915/fbc: s/parms/fbc_state/
      drm/i915/fbc: No FBC+double wide pipe
      drm/i915/fbc: Pimp the FBC debugfs output
      drm/i915: Get rid of the "sizes are 0 based" stuff
      drm/i915: Allow cdclk squasher to be reconfigured live
      drm/i915: Nuke {pipe,plane}_to_crtc_mapping[]
      drm/i915: Relocate intel_crtc_for_plane()
      drm/i915: s/intel_get_first_crtc/intel_first_crtc/
      drm/i915: Move pipe/transcoder/abox masks under intel_device_info.dis=
play

 arch/x86/kernel/early-quirks.c                     |    1 +
 drivers/gpu/drm/i915/Makefile                      |    1 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |    1 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    1 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   15 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    1 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    7 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   14 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  200 +++-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   10 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   23 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   48 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |    7 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   16 +
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   94 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  153 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |   30 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   54 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    4 +-
 drivers/gpu/drm/i915/display/intel_display_trace.c |    9 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |  587 ++++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |   79 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   14 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    2 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    6 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +
 drivers/gpu/drm/i915/display/intel_fb.c            |   11 +
 drivers/gpu/drm/i915/display/intel_fb.h            |    2 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   10 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           | 1177 ++++++++++------=
----
 drivers/gpu/drm/i915/display/intel_fbc.h           |   16 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    5 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   14 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    2 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    5 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |   11 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    1 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |   34 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    8 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    7 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   17 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   61 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    1 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |    2 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |    4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    2 +-
 drivers/gpu/drm/i915/i915_active_types.h           |    2 -
 drivers/gpu/drm/i915/i915_debugfs.c                |    1 -
 drivers/gpu/drm/i915/i915_driver.c                 |    1 -
 drivers/gpu/drm/i915/i915_drv.h                    |  210 +---
 drivers/gpu/drm/i915/i915_irq.c                    |    8 +-
 drivers/gpu/drm/i915/i915_mm.c                     |   28 +-
 drivers/gpu/drm/i915/i915_mm.h                     |   35 +
 drivers/gpu/drm/i915/i915_pci.c                    |   91 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   48 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  577 +---------
 drivers/gpu/drm/i915/intel_device_info.c           |   31 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   12 +-
 drivers/gpu/drm/i915/intel_pch.c                   |    1 +
 drivers/gpu/drm/i915/intel_pch.h                   |    1 +
 drivers/gpu/drm/i915/intel_pm.c                    |   41 +-
 drivers/gpu/drm/i915/intel_pm_types.h              |   76 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    5 +
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |   15 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    2 -
 include/drm/i915_pciids.h                          |    9 +
 75 files changed, 2104 insertions(+), 1895 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_trace.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_trace.h
 create mode 100644 drivers/gpu/drm/i915/i915_mm.h
 create mode 100644 drivers/gpu/drm/i915/intel_pm_types.h

--=20
Jani Nikula, Intel Open Source Graphics Center
