Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BA7B30DA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 12:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8910A10E112;
	Fri, 29 Sep 2023 10:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458E410E110;
 Fri, 29 Sep 2023 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695984553; x=1727520553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GaGdA5N4OSWoPuozmG2u9E0hfERh2lDeddp9IQngStM=;
 b=cl1rEC68R9SCwYByv//rnw+YH2Tx2GGxLSrK+TPoczjAybgyj9meMpPy
 WHBSciF+udl/GL361rOWvlvfYdoU1CLdTwPOckdKhiccjU4o2jsvGm2zC
 6aBr3cXb0kO9vR6BlEGA9zFoXuIWoaSx5sFgk8rWy68eB8FshBYtnd7pE
 XsysVQhlzM1Fb3OHg37DeS8OlYBKvIT4o/ZL3JLl8yajN/qTs303RDNa/
 A8uxd7MVtP7EAbUX4adQHpQlxsAohQOcD2riRgvXL2zPuMxlK7cnd4Qda
 WRlWekMGrn+xrdhQ0+m5eSj/0Eq18aQghxVdS6Nd+pLiqm9yKIAW9i6GO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3847460"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="3847460"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873648680"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="873648680"
Received: from osalyk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.237])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:49:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 29 Sep 2023 13:49:05 +0300
Message-ID: <87r0mhi7a6.fsf@intel.com>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-next-2023-09-29:
drm/i915 feature pull for v6.7:

Features and functionality:
- Early Xe2 LPD / Lunarlake (LNL) display enabling (Lucas, Matt, Gustavo,
  Stanislav, Luca, Clint, Juha-Pekka, Balasubramani, Ravi)
- Plenty of various DSC improvements and fixes (Ankit)
- Add DSC PPS state readout and verification (Suraj)
- Improve fastsets for VRR, LRR and M/N updates (Ville)
- Use connector->ddc to create (non-DP MST) connector sysfs ddc symlinks (V=
ille)
- Various DSB improvements, load LUTs using DSB (Ville)
- Improve shared link bandwidth management, starting with FDI (Imre)
- Optimize get param ioctl for PXP status (Alan)
- Remove DG2 pre-production hardware workarounds (Matt)
- Add more RPL P/U PCI IDs (Dnyaneshwar)
- Add new DG2-G12 stepping (Swati)
- Add PSR sink error status to debugfs (Jouni)
- Add DP enhanced framing to crtc state checker (Ville)

Refactoring and cleanups:
- Simplify TileY/Tile4 tiling selftest enumeration (Matt)
- Remove some unused power domain code (Gustavo)
- Check stepping of display IP version rather than MTL platform (Matt)
- DP audio compute config cleanups (Vinod)
- SDVO cleanups and refactoring, more robust failure handling (Ville)
- Color register definition and readout cleanups (Jani)
- Reduce header interdependencies for frontbuffer tracking (Jani)
- Continue replacing struct edid with struct drm_edid (Jani)
- Use source physical address instead of EDID for CEC (Jani)
- Clean up Type-C port lane count functions (Luca)
- Clean up DSC PPS register definitions and readout (Jani)
- Stop using GEM_BUG_ON()/GEM_WARN_ON() in display code (Jani)
- Move more of the display probe to display code (Jani)
- Remove redundant runtime suspended state flag (Jouni)
- Move display info printing to display code (Balasubramani)
- Frontbuffer tracking improvements (Jouni)
- Add trailing newlines to debug logging (Jim Cromie)
- Separate display workarounds from clock gating init (Matt)
- Reduce dmesg log spamming for combo PHY, PLL state, FEC, DP MST (Ville, I=
mre)

Fixes:
- Fix hotplug poll detect loops via suspend/resume (Imre)
- Fix hotplug detect for forced connectors (Imre)
- Fix DSC first_line_bpg_offset calculation (Suraj)
- Fix debug prints for SDP CRC16 (Arun)
- Fix PXP runtime resume (Alan)
- Fix cx0 PHY lane handling (Gustavo)
- Fix frontbuffer tracking locking in debugfs (Juha-Pekka)
- Fix SDVO detect on some models (Ville)
- Fix SDP split configuration for DP MST (Vinod)
- Fix AUX usage and reads for HDCP on DP MST (Suraj)
- Fix PSR workaround (Jouni)
- Fix redundant AUX power get/put in DP force (Imre)
- Fix ICL DSI TCLK POST by letting hardware handle it (William)
- Fix IRQ reset for XE LP+ (Gustavo)
- Fix h/vsync_end instead of h/vtotal in VBT (Ville)
- Fix C20 PHY msgbus timeout issues (Gustavo)
- Fix pre-TGL FEC pipe A vs. DDI A mixup (Ville)
- Fix FEC state readout for DP MST (Ville)

DRM subsystem core changes:
- Assume sink supports 8 bpc when DSC is supported (Ankit)
- Add drm_edid_is_digital() helper (Jani)
- Parse source physical address from EDID (Jani)
- Add function to attach CEC without EDID (Jani)
- Reorder connector sysfs/debugfs remove (Ville)
- Register connector sysfs ddc symlink later (Ville)

Media subsystem changes:
- Add comments about CEC source physical address usage (Jani)

Merges:
- Backmerge drm-next to get v6.6-rc1 (Jani)

BR,
Jani.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-09-29

for you to fetch changes up to 3570bd989acc66add5726785058cceffa06b1f54:

  drm/i915: Update DRIVER_DATE to 20230929 (2023-09-29 12:43:23 +0300)

----------------------------------------------------------------
drm/i915 feature pull for v6.7:

Features and functionality:
- Early Xe2 LPD / Lunarlake (LNL) display enabling (Lucas, Matt, Gustavo,
  Stanislav, Luca, Clint, Juha-Pekka, Balasubramani, Ravi)
- Plenty of various DSC improvements and fixes (Ankit)
- Add DSC PPS state readout and verification (Suraj)
- Improve fastsets for VRR, LRR and M/N updates (Ville)
- Use connector->ddc to create (non-DP MST) connector sysfs ddc symlinks (V=
ille)
- Various DSB improvements, load LUTs using DSB (Ville)
- Improve shared link bandwidth management, starting with FDI (Imre)
- Optimize get param ioctl for PXP status (Alan)
- Remove DG2 pre-production hardware workarounds (Matt)
- Add more RPL P/U PCI IDs (Dnyaneshwar)
- Add new DG2-G12 stepping (Swati)
- Add PSR sink error status to debugfs (Jouni)
- Add DP enhanced framing to crtc state checker (Ville)

Refactoring and cleanups:
- Simplify TileY/Tile4 tiling selftest enumeration (Matt)
- Remove some unused power domain code (Gustavo)
- Check stepping of display IP version rather than MTL platform (Matt)
- DP audio compute config cleanups (Vinod)
- SDVO cleanups and refactoring, more robust failure handling (Ville)
- Color register definition and readout cleanups (Jani)
- Reduce header interdependencies for frontbuffer tracking (Jani)
- Continue replacing struct edid with struct drm_edid (Jani)
- Use source physical address instead of EDID for CEC (Jani)
- Clean up Type-C port lane count functions (Luca)
- Clean up DSC PPS register definitions and readout (Jani)
- Stop using GEM_BUG_ON()/GEM_WARN_ON() in display code (Jani)
- Move more of the display probe to display code (Jani)
- Remove redundant runtime suspended state flag (Jouni)
- Move display info printing to display code (Balasubramani)
- Frontbuffer tracking improvements (Jouni)
- Add trailing newlines to debug logging (Jim Cromie)
- Separate display workarounds from clock gating init (Matt)
- Reduce dmesg log spamming for combo PHY, PLL state, FEC, DP MST (Ville, I=
mre)

Fixes:
- Fix hotplug poll detect loops via suspend/resume (Imre)
- Fix hotplug detect for forced connectors (Imre)
- Fix DSC first_line_bpg_offset calculation (Suraj)
- Fix debug prints for SDP CRC16 (Arun)
- Fix PXP runtime resume (Alan)
- Fix cx0 PHY lane handling (Gustavo)
- Fix frontbuffer tracking locking in debugfs (Juha-Pekka)
- Fix SDVO detect on some models (Ville)
- Fix SDP split configuration for DP MST (Vinod)
- Fix AUX usage and reads for HDCP on DP MST (Suraj)
- Fix PSR workaround (Jouni)
- Fix redundant AUX power get/put in DP force (Imre)
- Fix ICL DSI TCLK POST by letting hardware handle it (William)
- Fix IRQ reset for XE LP+ (Gustavo)
- Fix h/vsync_end instead of h/vtotal in VBT (Ville)
- Fix C20 PHY msgbus timeout issues (Gustavo)
- Fix pre-TGL FEC pipe A vs. DDI A mixup (Ville)
- Fix FEC state readout for DP MST (Ville)

DRM subsystem core changes:
- Assume sink supports 8 bpc when DSC is supported (Ankit)
- Add drm_edid_is_digital() helper (Jani)
- Parse source physical address from EDID (Jani)
- Add function to attach CEC without EDID (Jani)
- Reorder connector sysfs/debugfs remove (Ville)
- Register connector sysfs ddc symlink later (Ville)

Media subsystem changes:
- Add comments about CEC source physical address usage (Jani)

Merges:
- Backmerge drm-next to get v6.6-rc1 (Jani)

----------------------------------------------------------------
Alan Previn (2):
      drm/i915/pxp/mtl: intel_pxp_init_hw needs runtime-pm inside pm-comple=
te
      drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS

Ankit Nautiyal (20):
      drm/i915/dp: Consider output_format while computing dsc bpp
      drm/i915/dp: Move compressed bpp check with 420 format inside the hel=
per
      drm/i915/dp_mst: Use output_format to get the final link bpp
      drm/i915/dp: Use consistent name for link bpp and compressed bpp
      drm/i915/dp: Update Bigjoiner interface bits for computing compressed=
 bpp
      drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
      drm/i915/dp: Remove extra logs for printing DSC info
      drm/i915/dp: Avoid forcing DSC BPC for MST case
      drm/i915/dp: Add functions to get min/max src input bpc with DSC
      drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
      drm/i915/dp: Avoid left shift of DSC output bpp by 4
      drm/i915/dp: Rename helper to get DSC max pipe_bpp
      drm/i915/dp: Separate out functions for edp/DP for computing DSC bpp
      drm/i915/dp: Add DSC BPC/BPP constraints while selecting pipe bpp wit=
h DSC
      drm/i915/dp: Separate out function to get compressed bpp with joiner
      drm/i915/dp: Get optimal link config to have best compressed bpp
      drm/i915/dp: Check src/sink compressed bpp limit for edp
      drm/i915/dp: Check if force_dsc_output_format is possible
      drm/display/dp: Assume 8 bpc support when DSC is supported
      drivers/drm/i915: Honor limits->max_bpp while computing DSC max input=
 bpp

Anshuman Gupta (1):
      drm/i915/dgfx: Enable d3cold at s2idle

Arun R Murthy (1):
      drm/i915/dp: Fix LT debug print in SDP CRC enable

Balasubramani Vivekanandan (2):
      drm/i915/lnl: Add display definitions
      drm/i915/display: Print display info inside driver display initializa=
tion

Clint Taylor (2):
      drm/i915/display: Remove FBC capability from fused off pipes
      drm/i915/xe2lpd: Register DE_RRMR has been removed

Dnyaneshwar Bhadane (1):
      drm/i915/rpl: Update pci ids for RPL P/U

Gustavo Sousa (12):
      drm/i915/display: Remove unused POWER_DOMAIN_MASK
      drm/i915/cx0: Add intel_cx0_get_owned_lane_mask()
      drm/i915: Simplify intel_cx0_program_phy_lane() with loop
      drm/i915/cx0: Enable/disable TX only for owned PHY lanes
      drm/i915/cx0: Program vswing only for owned lanes
      drm/i915/display: Remove unused POWER_DOMAIN_MODESET
      drm/i915/cx0: Check and increase msgbus timeout threshold
      drm/i915/cx0: Add step for programming msgbus timer
      drm/i915/xe2lpd: Add fake PCH
      drm/i915/xe2lpd: Handle port AUX interrupts
      drm/i915/xe2lpd: Add support for HPD
      drm/i915/irq: Clear GFX_MSTR_IRQ as part of IRQ reset

Imre Deak (19):
      drm/i915: Avoid endless HPD poll detect loop via runtime suspend/resu=
me
      drm/i915: Don't change the status of forced connectors during hotplug=
 detect
      drm/i915: Don't change the status of forced connectors during HPD pol=
l detect
      drm: Add an HPD poll helper to reschedule the poll work
      drm/i915: Fix HPD polling, reenabling the output poll work as needed
      drm/i915/dp: Drop redundant AUX power get/put in intel_dp_force()
      drm/i915/mtl: Add TC port lockdep assert to AUX power well enabling
      drm/i915/dp_mst: Tune down error message during payload addition
      drm/i915/dp: Factor out helpers to compute the link limits
      drm/i915/dp: Track the pipe and link bpp limits separately
      drm/i915/dp: Skip computing a non-DSC link config if DSC is needed
      drm/i915/dp: Update the link bpp limits for DSC mode
      drm/i915/dp: Limit the output link bpp in DSC mode
      drm/i915: Add helper to modeset a set of pipes
      drm/i915: Rename intel_modeset_all_pipes() to intel_modeset_all_pipes=
_late()
      drm/i915: Factor out a helper to check/compute all the CRTC states
      drm/i915: Add helpers for BW management on shared display links
      drm/i915/fdi: Improve FDI BW sharing between pipe B and C
      drm/i915/fdi: Recompute state for affected CRTCs on FDI links

Jani Nikula (34):
      drm/i915/vma: constify unbind_fence_ops
      drm/i915/regs: split out intel_color_regs.h
      drm/i915/color: move CHV CGM pipe mode read to intel_color
      drm/i915: move HSW+ gamma mode read to intel_color
      drm/i915: move ILK+ CSC mode read to intel_color
      drm/i915/color: move SKL+ gamma and CSC enable read to intel_color
      drm/i915/color: move pre-SKL gamma and CSC enable read to intel_color
      drm/i915: add minimal i915_gem_object_frontbuffer.h
      drm/edid: add drm_edid_is_digital()
      drm/i915/display: use drm_edid_is_digital()
      drm/edid: parse source physical address
      drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
      drm/i915/cec: switch to setting physical address directly
      media: cec: core: add note about *_from_edid() function usage in drm
      drm/i915/dsc: improve clarity of the pps reg read/write helpers
      drm/i915/dsc: have intel_dsc_pps_read_and_verify() return the value
      drm/i915/dsc: have intel_dsc_pps_read() return the value
      drm/i915/dsc: rename pps write to intel_dsc_pps_write()
      drm/i915/dsc: drop redundant =3D 0 assignments
      drm/i915/dsc: clean up pps comments
      drm/i915/dsc: add the PPS number to the register content macros
      drm/i915/dsc: use REG_BIT, REG_GENMASK, and friends for PPS0 and PPS1
      drm/i915/gt: rename DBG() to GTT_TRACE()
      Merge drm/drm-next into drm-intel-next
      drm/i915/fbc: replace GEM_BUG_ON() to drm_WARN_ON()
      drm/i915/fb: replace GEM_WARN_ON() with drm_WARN_ON()
      drm/i915/dpt: replace GEM_BUG_ON() with drm_WARN_ON()
      drm/i915: move more of the display probe to display code
      drm/i915/display: call gmdid display probe at a higher level
      drm/i915: move intel_display_device_probe() one level higher
      drm/i915: add a note about fec_enable with 128b/132b
      drm/i915/dp: refactor aux_ch_name()
      drm/i915/cx0: prefer forward declarations over includes
      drm/i915: Update DRIVER_DATE to 20230929

Jim Cromie (1):
      drm/i915: add trailing newlines to msgs

Jouni H=C3=B6gander (8):
      drm/i915/psr: Apply Wa_14015648006 for all display 14 steppings
      drm/i915/fbc: Clear frontbuffer busy bits on flip
      drm/i915/psr: Clear frontbuffer busy bits on flip
      drm/i915: Add new frontbuffer tracking interface to queue flush
      drm/i915: Handle dma fences in dirtyfb callback
      drm/i915/psr: Add psr sink error status into sink status debugfs
      drm/i915: Remove runtime suspended boolean from intel_runtime_pm stru=
ct
      drm/i915: Warn on if set frontbuffer return value is not NULL on rele=
ase

Juha-Pekka Heikkila (1):
      drm/i915/display: add lock while printing frontbuffer tracking bits t=
o debugfs

Juha-Pekka Heikkil=C3=A4 (1):
      drm/i915/xe2lpd: Enable odd size and panning for planar yuv

Luca Coelho (5):
      drm/i915/tc: rename mtl_tc_port_get_pin_assignment_mask()
      drm/i915/tc: make intel_tc_port_get_lane_mask() static
      drm/i915/tc: move legacy code out of the main _max_lane_count() func
      drm/i915/tc: remove "fia" from intel_tc_port_fia_max_lane_count()
      drm/i915/xe2lpd: Read pin assignment from IOM

Lucas De Marchi (7):
      drm/i915/xelpdp: Add XE_LPDP_FEATURES
      drm/i915: Re-order if/else ladder in intel_detect_pch()
      drm/i915/display: Fix style and conventions for DP AUX regs
      drm/i915/display: Use _PICK_EVEN_2RANGES() in DP AUX regs
      drm/i915/xe2lpd: Re-order DP AUX regs
      drm/i915/xe2lpd: Extend Wa_15010685871
      drm/i915/lnl: Add gmbus/ddc support

Matt Roper (13):
      drm/i915/dg2: Recognize pre-production hardware
      drm/i915/dg2: Drop pre-production display workarounds
      drm/i915/selftest: Simplify Y-major tiling in blit selftest
      drm/i915: Eliminate has_4tile feature flag
      drm/i915: Eliminate IS_MTL_DISPLAY_STEP
      drm/i915/display: Eliminate IS_METEORLAKE checks
      drm/i915: Stop forcing clock gating init for future platforms
      drm/i915/adlp: Stop calling gen12lp_init_clock_gating()
      drm/i915/display: Extract display workarounds from clock gating init
      drm/i915/display: Apply workarounds during display init
      drm/i915/xe2lpd: FBC is now supported on all pipes
      drm/i915/xe2lpd: Don't try to program PLANE_AUX_DIST
      drm/i915/xe2lpd: Add DC state support

Ravi Kumar Vodapalli (1):
      drm/i915/xe2lpd: Add display power well

Stanislav Lisovskiy (3):
      drm/i915/xe2lpd: Treat cursor plane as regular plane for DDB allocati=
on
      drm/i915/lnl: Add CDCLK table
      drm/i915/lnl: Start using CDCLK through PLL

Suraj Kandpal (16):
      drm/i915/vdsc: Fix first_line_bpg_offset calculation
      drm/i915/hdcp: Use intel_connector argument in intel_hdcp_shim
      drm/i915/hdcp: Propagate aux info in DP HDCP functions
      drm/i915/hdcp: Send the correct aux for DPMST HDCP scenario
      drm/i915/hdcp: Adjust timeout for read in DPMST Scenario
      drm/i915/hdcp: Use intel_connector as argument for hdcp_2_2_capable
      drm/i915/hdcp: Use correct aux for capability check scenario
      drm/i915/vdsc: Refactor dsc register field macro
      drm/i915/vdsc: Add a check for dsc split cases
      drm/i915/vdsc: Add func to get no. of vdsc instances per pipe
      drm/i915/vdsc: Add function to read any PPS register
      drm/i915/vdsc: Add function to write in PPS register
      drm/i915/vdsc: Remove unused dsc registers
      drm/i915/vdsc: Fill the intel_dsc_get_pps_config function
      drm/i915/display: Compare the readout dsc pps params
      drm/i915/dsc: Fix pic_width readout

Swati Sharma (1):
      drm/i915/dg2: Add support for new DG2-G12 revid 0x1

Tvrtko Ursulin (1):
      drm/i915: Zap some empty lines

Ville Syrj=C3=A4l=C3=A4 (64):
      drm/i915/sdvo: Issue SetTargetOutput prior to GetAttachedDisplays
      drm/i915/sdvo: Protect macro args
      drm/i915/sdvo: s/sdvo_inputs_mask/sdvo_num_inputs/
      drm/i915: Don't warn about zero N/P in *_calc_dpll_params()
      drm/i915: Fully populate crtc_state->dpll
      drm/i915/sdvo: Pick the TV dotclock from adjusted_mode
      drm/i915/sdvo: Fail gracefully if the TV dotclock is out of range
      drm/i915/sdvo: Nuke attached_output tracking
      drm/i915/sdvo: Initialize the encoder earlier
      drm/i915/sdvo: Nuke the duplicate sdvo->port
      drm/i915/sdvo: Get rid of the per-connector i2c symlink
      drm/i915/sdvo: Rework DDC bus handling
      drm/i915/sdvo: Print out the i2c pin and slave address
      drm/i915: Constify LUT entries in checker
      drm/i915/dsb: Dump the DSB command buffer when DSB fails
      drm/i915/dsb: Avoid corrupting the first register write
      drm/i915/dsb: Don't use indexed writes when byte enables are not all =
set
      drm/i915: Only check eDP HPD when AUX CH is shared
      drm/i915/mst: Read out FEC state
      drm/i915: Fix FEC pipe A vs. DDI A mixup
      drm/i915: Fix FEC state dump
      drm/i915: Split some long lines in hsw_fdi_link_train()
      drm/i915: Stop spamming the logs with PLL state
      drm/i915: Reduce combo PHY log spam
      drm/i915: Introduce crtc_state->enhanced_framing
      drm: Reorder drm_sysfs_connector_remove() vs. drm_debugfs_connector_r=
emove()
      drm/sysfs: Register "ddc" symlink later
      drm/i915: Call the DDC bus i2c adapter "ddc"
      drm/i915/lvds: Populate connector->ddc
      drm/i915/crt: Populate connector->ddc
      drm/i915/dvo: Populate connector->ddc
      drm/i915/dp: Populate connector->ddc
      drm/i915/mst: Populate connector->ddc
      drm/i915/hdmi: Use connector->ddc everwhere
      drm/i915/hdmi: Nuke hdmi->ddc_bus
      drm/i915/hdmi: Remove old i2c symlink
      drm/i915/sdvo: Constify mapping structs
      drm/i915: Move psr unlock out from the pipe update critical section
      drm/i915: Change intel_pipe_update_{start,end}() calling convention
      drm/i915: Extract intel_crtc_vblank_evade_scanlines()
      drm/i915: Enable VRR later during fastsets
      drm/i915: Adjust seamless_m_n flag behaviour
      drm/i915: Optimize out redundant M/N updates
      drm/i915: Relocate is_in_vrr_range()
      drm/i915: Validate that the timings are within the VRR range
      drm/i915: Disable VRR during seamless M/N changes
      drm/i915: Update VRR parameters in fastset
      drm/i915: Assert that VRR is off during vblank evasion if necessary
      drm/i915: Implement transcoder LRR for TGL+
      Revert "drm/i915/mst: Populate connector->ddc"
      drm/i915/bios: Fixup h/vsync_end instead of h/vtotal
      drm/i915/dsb: Use non-locked register access
      drm/i915/dsb: Define more DSB bits
      drm/i915/dsb: Define the contents of some intstructions bit better
      drm/i915/dsb: Introduce intel_dsb_noop()
      drm/i915/dsb: Introduce intel_dsb_reg_write_masked()
      drm/i915/dsb: Add support for non-posted DSB registers writes
      drm/i915/dsb: Don't use DSB to load the LUTs during full modeset
      drm/i915/dsb: Load LUTs using the DSB during vblank
      drm/i915/dsb: Use non-posted register writes for legacy LUT
      drm/i915/dsb: Evade transcoder undelayed vblank when using DSB
      drm/i915: Introduce skl_watermark_max_latency()
      drm/i915: Introduce intel_crtc_scanline_to_hw()
      drm/i915/dsb: Use DEwake to combat PkgC latency

Vinod Govindapillai (4):
      drm/i915/display: remove redundant parameter from sdp split update
      drm/i915/display: combine DP audio compute config steps
      drm/i915/display: update intel_dp_has_audio to support MST
      drm/i915/display: configure SDP split for DP-MST

William Tseng (1):
      drm/i915/dsi: let HW maintain CLK_POST

 drivers/gpu/drm/display/drm_dp_cec.c               |  23 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   8 +-
 drivers/gpu/drm/drm_connector.c                    |  11 +-
 drivers/gpu/drm/drm_edid.c                         |  22 +-
 drivers/gpu/drm/drm_internal.h                     |   2 +
 drivers/gpu/drm/drm_sysfs.c                        |  22 +-
 drivers/gpu/drm/i915/Makefile                      |   2 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |  10 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   6 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   1 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   1 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |  13 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   2 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  14 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   6 +-
 drivers/gpu/drm/i915/display/intel_audio.h         |   3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  47 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   1 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 107 ++-
 drivers/gpu/drm/i915/display/intel_color.c         | 154 +++-
 drivers/gpu/drm/i915/display/intel_color.h         |   2 +
 drivers/gpu/drm/i915/display/intel_color_regs.h    | 286 +++++++
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  17 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   6 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  64 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          | 118 ++-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   6 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   3 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 205 ++---
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |  14 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |  13 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  38 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 476 +++++++----
 drivers/gpu/drm/i915/display/intel_display.h       |   8 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   4 +
 .../gpu/drm/i915/display/intel_display_device.c    |  98 ++-
 .../gpu/drm/i915/display/intel_display_device.h    |  31 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   8 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  10 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   1 -
 .../gpu/drm/i915/display/intel_display_power_map.c |  63 +-
 .../drm/i915/display/intel_display_power_well.c    |  52 +-
 .../drm/i915/display/intel_display_power_well.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  49 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |  48 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h    |  13 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 884 ++++++++++++++++-=
----
 drivers/gpu/drm/i915/display/intel_dp.h            |  34 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  49 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |  80 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  87 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 156 ++--
 drivers/gpu/drm/i915/display/intel_dpll.c          |  54 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |   1 +
 drivers/gpu/drm/i915/display/intel_dsb.c           | 217 ++++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   9 +-
 drivers/gpu/drm/i915/display/intel_dsb_regs.h      |  31 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |  11 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  61 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  23 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |   2 +
 drivers/gpu/drm/i915/display/intel_fdi.c           | 169 +++-
 drivers/gpu/drm/i915/display/intel_fdi.h           |   8 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |  34 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   4 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  33 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 121 +--
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  85 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  24 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       | 212 +++++
 drivers/gpu/drm/i915/display/intel_link_bw.h       |  37 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |  14 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  33 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   2 +
 drivers/gpu/drm/i915/display/intel_panel.c         |  17 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   1 +
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  52 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          | 381 ++++-----
 drivers/gpu/drm/i915/display/intel_sdvo_regs.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  66 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |   3 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  14 +
 drivers/gpu/drm/i915/display/intel_vblank.h        |   1 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 630 +++++++--------
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     | 397 +++------
 drivers/gpu/drm/i915/display/intel_vrr.c           |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |   1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   7 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  32 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  89 ---
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h | 103 +++
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   1 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  39 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  36 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  10 +-
 drivers/gpu/drm/i915/i915_driver.h                 |   4 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  18 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   2 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   4 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   2 +
 drivers/gpu/drm/i915/i915_pci.c                    |   1 -
 drivers/gpu/drm/i915/i915_reg.h                    | 281 +------
 drivers/gpu/drm/i915/i915_vma.c                    |   1 +
 drivers/gpu/drm/i915/i915_vma_resource.c           |   2 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |  52 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  14 -
 drivers/gpu/drm/i915/intel_device_info.h           |   1 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   1 -
 drivers/gpu/drm/i915/intel_runtime_pm.h            |   4 +-
 drivers/gpu/drm/i915/intel_step.c                  |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |  40 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |  18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |   5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |   9 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +
 drivers/gpu/drm/i915/soc/intel_pch.c               |  12 +-
 drivers/gpu/drm/i915/soc/intel_pch.h               |   2 +
 drivers/media/cec/core/cec-adap.c                  |   5 +
 drivers/media/cec/core/cec-notifier.c              |   5 +
 include/drm/display/drm_dp_helper.h                |   6 +
 include/drm/drm_connector.h                        |   8 +
 include/drm/drm_edid.h                             |   1 +
 include/drm/i915_pciids.h                          |   8 +-
 143 files changed, 4578 insertions(+), 2465 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_link_bw.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_link_bw.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h

--=20
Jani Nikula, Intel
