Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD14FFAB1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 17:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05010E34B;
	Wed, 13 Apr 2022 15:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56810E24C;
 Wed, 13 Apr 2022 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649865112; x=1681401112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lt92wt7pqTlF4Rh/lP5WlGLa7d04T4LMM/kmg2RHfUs=;
 b=T5WzMVWLSN+jL7AoBZamTTVjXRpeqQEs2FKgQX8+QSjsYwAQ6EOLLNS7
 WYhnnd5egtt9RKowC4k+OVctcCOkQVUuq5RfwzBEUZEJACBMKILzX/YuS
 0VAmOvk0ocsUNM4Em3XOTBVX3FDJG7rDuaT1c+SSvfk0wk4v0c38DDOvl
 /o3zSeQIAbTyBIr/eEXhL2fzOvjQZbLxVRXUZvIxb0tfREOQZqz2iYs/K
 HYqsLJ+MNTmphOsDcrpngzP7vHcZJ4qZBSHQbCdtUb1nU0D4I11V0FNri
 Q+WuluQ9XDGshAzDiqAU2kniYdrWQN9nupHj5cGiOxJOEJ4UcIHg1Bru6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262882957"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="262882957"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 08:51:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="573327297"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.150.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 08:51:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 13 Apr 2022 18:51:45 +0300
Message-ID: <874k2xgewe.fsf@intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

The first drm/i915 pull for v5.19.

BR,
Jani.


drm-intel-next-2022-04-13-1:
drm/i915 feature pull for v5.19:

Features and functionality:
- Add support for new Tile 4 format on DG2 (Stan)
- Add support for new CCS clear color compression on DG2 (Mika, Juha-Pekka)
- Add support for new render and media compression formats on DG2 (Matt)
- Support multiple eDP and LVDS native mode refresh rates (Ville)
- Support static DRRS (Ville)
- ATS-M platform info (Matt)
- RPL-S PCI IDs (Tejas)
- Extend DP HDR support to HSW+ (Uma)
- Bump ADL-P DMC version to v2.16 (Madhumitha)
- Let users disable PSR2 while enabling PSR1 (Jos=C3=A9)

Refactoring and cleanups:
- Massive DRRS and panel fixed mode refactoring and cleanups (Ville)
- Power well refactoring and cleanup (Imre)
- Clean up and refactor crtc readout and compute config (Ville)
- Use kernel string helpers (Lucas)
- Refactor gmbus pin lookups and allocation (Jani)
- PCH display cleanups (Ville)
- DPLL and DPLL manager refactoring (Ville)
- Include and header refactoring (Jani, Tvrtko)
- DMC abstractions (Jani)
- Non-x86 build refactoring (Casey)
- VBT parsing refactoring (Ville)
- Bigjoiner refactoring (Ville)
- Optimize plane, pfit, scaler, etc. programming using unlocked writes (Vil=
le)
- Split several register writes in commit to noarm+arm pairs (Ville)
- Clean up SAGV handling (Ville)
- Clean up bandwidth and ddb allocation (Ville)
- FBC cleanups (Ville)

Fixes:
- Fix native HDMI and DP HDMI DFP clock limits on deep color/4:2:0 (Ville)
- Fix DMC firmware platform check (Lucas)
- Fix cursor coordinates on bigjoiner secondary (Ville)
- Fix MSO vs. bigjoiner timing confusion (Ville)
- Fix ADL-P eDP voltage swing (Jos=C3=A9)
- Fix VRR capability property update (Manasi)
- Log DG2 SNPS PHY calibration errors (Matt, Lucas)
- Fix PCODE request status checks (Stan)
- Fix uncore unclaimed access warnings (Lucas)
- Fix VBT new max TMDS clock parsing (Shawn)
- Fix ADL-P non-existent underrun recovery (Swathi Dhanavanthri)
- Fix ADL-N stepping info (Tejas)
- Fix DPT mapping flags to contiguous (Stan)
- Fix DG2 max display bandwidth (Vinod)
- Fix DP low voltage SKU checks (Ankit)
- Fix RPL-S VT-d translation enable via quirk (Tejas)
- Fixes to PSR2 (Jos=C3=A9)
- Fix PIPE_MBUS_DBOX_CTL programming (Jos=C3=A9)
- Fix LTTPR capability read/check on DP 1.2 (Imre)
- Fix ADL-P register corruption after DDI clock enabling (Imre)
- Fix ADL-P MBUS DBOX BW and B credits (Caz)

Merges:
- Backmerge drm-next (Rodrigo, Jani)


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-04-1=
3-1

for you to fetch changes up to b39d2c6202426b560641e5800c5523851b5db586:

  drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flush (=
2022-04-13 17:20:49 +0300)

----------------------------------------------------------------
drm/i915 feature pull for v5.19:

Features and functionality:
- Add support for new Tile 4 format on DG2 (Stan)
- Add support for new CCS clear color compression on DG2 (Mika, Juha-Pekka)
- Add support for new render and media compression formats on DG2 (Matt)
- Support multiple eDP and LVDS native mode refresh rates (Ville)
- Support static DRRS (Ville)
- ATS-M platform info (Matt)
- RPL-S PCI IDs (Tejas)
- Extend DP HDR support to HSW+ (Uma)
- Bump ADL-P DMC version to v2.16 (Madhumitha)
- Let users disable PSR2 while enabling PSR1 (Jos=C3=A9)

Refactoring and cleanups:
- Massive DRRS and panel fixed mode refactoring and cleanups (Ville)
- Power well refactoring and cleanup (Imre)
- Clean up and refactor crtc readout and compute config (Ville)
- Use kernel string helpers (Lucas)
- Refactor gmbus pin lookups and allocation (Jani)
- PCH display cleanups (Ville)
- DPLL and DPLL manager refactoring (Ville)
- Include and header refactoring (Jani, Tvrtko)
- DMC abstractions (Jani)
- Non-x86 build refactoring (Casey)
- VBT parsing refactoring (Ville)
- Bigjoiner refactoring (Ville)
- Optimize plane, pfit, scaler, etc. programming using unlocked writes (Vil=
le)
- Split several register writes in commit to noarm+arm pairs (Ville)
- Clean up SAGV handling (Ville)
- Clean up bandwidth and ddb allocation (Ville)
- FBC cleanups (Ville)

Fixes:
- Fix native HDMI and DP HDMI DFP clock limits on deep color/4:2:0 (Ville)
- Fix DMC firmware platform check (Lucas)
- Fix cursor coordinates on bigjoiner secondary (Ville)
- Fix MSO vs. bigjoiner timing confusion (Ville)
- Fix ADL-P eDP voltage swing (Jos=C3=A9)
- Fix VRR capability property update (Manasi)
- Log DG2 SNPS PHY calibration errors (Matt, Lucas)
- Fix PCODE request status checks (Stan)
- Fix uncore unclaimed access warnings (Lucas)
- Fix VBT new max TMDS clock parsing (Shawn)
- Fix ADL-P non-existent underrun recovery (Swathi Dhanavanthri)
- Fix ADL-N stepping info (Tejas)
- Fix DPT mapping flags to contiguous (Stan)
- Fix DG2 max display bandwidth (Vinod)
- Fix DP low voltage SKU checks (Ankit)
- Fix RPL-S VT-d translation enable via quirk (Tejas)
- Fixes to PSR2 (Jos=C3=A9)
- Fix PIPE_MBUS_DBOX_CTL programming (Jos=C3=A9)
- Fix LTTPR capability read/check on DP 1.2 (Imre)
- Fix ADL-P register corruption after DDI clock enabling (Imre)
- Fix ADL-P MBUS DBOX BW and B credits (Caz)

Merges:
- Backmerge drm-next (Rodrigo, Jani)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/dsb: modified to drm_info in dsb_prepare()

Ankit Nautiyal (2):
      drm/i915/display: Remove check for low voltage sku for max dp source =
rate
      drm/i915/intel_combo_phy: Print I/O voltage info

Ashutosh Dixit (1):
      drm/i915/pmu: Drop redundant IS_VALLEYVIEW check in __get_rc6()

Casey Bowman (1):
      drm/i915: Split i915_run_as_guest into x86 and non-x86

Caz Yokoyama (1):
      drm/i915/display/adlp: Adjust MBUS DBOX BW and B credits

Changcheng Deng (1):
      drm/i915/dsi: use min_t() to make code cleaner

Colin Ian King (1):
      drm/i915: make a handful of read-only arrays static const

Imre Deak (10):
      drm/i915: Fix the VDSC_PW2 power domain enum value
      drm/i915: Sanitize open-coded power well enable()/disable() calls
      drm/i915: Remove redundant state verification during TypeC AUX power =
well disabling
      drm/i915: Move i915_power_well_regs struct into i915_power_well_ops
      drm/i915: Move power well get/put/enable/disable functions to a new f=
ile
      drm/i915: Add function to call a power well's sync_hw() hook
      drm/i915: Add functions to get a power well's state/name/domains/mask=
/refcount
      drm/i915: Move intel_display_power_well_is_enabled() to intel_display=
_power_well.c
      drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities
      drm/i915/adlp: Fix register corruption after DDI clock enabling

Jani Nikula (23):
      drm/i915/wm: use REG_FIELD_{PREP,GET} for PLANE_WM_BLOCKS_MASK
      drm/i915/gmbus: combine gmbus pin lookups to one function
      drm/i915/gmbus: reduce gmbus pin lookups in gmbus setup
      drm/i915/gmbus: pass gpio reg to intel_gpio_setup()
      drm/i915/gmbus: alloc intel_gmbus dynamically
      drm/i915: include linux/highmem.h and linux/swap.h where needed
      drm/i915/gmbus: move some local bus variables within loops
      drm/i915/gmbus: use to_intel_gmbus() instead of open coding
      x86/gpu: include drm/i915_pciids.h directly in early quirks
      drm/i915: move i915_gem_object_needs_bit17_swizzle() to i915_gem_tili=
ng.[ch]
      drm/i915: include uapi/drm/i915_drm.h directly where needed
      drm/i915/sdvo: prefer __packed over __attribute__((packed))
      drm/i915/dmc: simplify intel_dmc_load_program() conditions
      drm/i915/dmc: move assert_dmc_loaded() to intel_dmc.c
      drm/i915/dmc: move dmc debugfs to intel_dmc.c
      drm/i915/dmc: fix i915_reg_t usage
      drm/i915/audio: unify audio codec enable/disable debug logging
      drm/i915/audio: move has_audio checks to within codec enable/disable
      drm/i915/dp: make DSC usage logging actually useful
      drm/i915/dmc: abstract GPU error state dump
      drm/i915/dmc: hide DMC version macros
      drm/i915/dmc: split out dmc registers to a separate file
      Merge drm/drm-next into drm-intel-next

Jos=C3=A9 Roberto de Souza (13):
      drm/i915/display: Allow users to disable PSR2
      drm/i915/display/adlp: Update eDP voltage swing table
      drm/i915/display: Fix HPD short pulse handling for eDP
      drm/i915/display: Do not re-enable PSR after it was marked as not rel=
iable
      drm/i915/display/adlp: More voltage swing table updates
      docs: gpu: i915.rst: Fix DRRS documentation
      drm/i915/display/tgl+: Set default values for all registers in PIPE_M=
BUS_DBOX_CTL
      drm/i915/display/adlp: Fix programing of PIPE_MBUS_DBOX_CTL
      drm/i915/display: Add HAS_MBUS_JOINING
      drm/i915/display/psr: Set partial frame enable when forcing full fram=
e fetch
      drm/i915/display/psr: Lock and unlock PSR around pipe updates
      drm/i915/display/psr: Use continuos full frame to handle frontbuffer =
invalidations
      drm/i915/display: Fix warnings about PSR lock not held

Jouni H=C3=B6gander (1):
      drm/i915/psr: Set "SF Partial Frame Enable" also on full update

Juha-Pekka Heikkil=C3=A4 (1):
      drm/i915/dg2: Add support for DG2 clear color compression

Lee Shawn C (1):
      drm/i915: update new TMDS clock setting defined by VBT

Lucas De Marchi (8):
      drm/i915/dmc: Do not try loading wrong DMC version
      drm/i915: Use str_yes_no()
      drm/i915: Use str_enable_disable()
      drm/i915: Use str_enabled_disabled()
      drm/i915: Use str_on_off()
      drm/i915/uncore: Warn on previous unclaimed accesses
      drm/i915/uncore: Warn only if unclaimed access remains flagged
      drm/i915/dg2: Do not explode on phy calibration error

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Update DMC to v2.16 on ADL-P

Manasi Navare (1):
      drm/i915/display/vrr: Reset VRR capable property on a long hpd

Matt Roper (4):
      drm/i915/dg2: Skip output init on PHY calibration failure
      drm/i915/ats-m: add ATS-M platform info
      drm/fourcc: Introduce format modifiers for DG2 render and media compr=
ession
      drm/i915/dg2: Add support for DG2 render and media compression

Mika Kahola (1):
      drm/fourcc: Introduce format modifier for DG2 clear color

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Stanislav Lisovskiy (5):
      drm/i915: Introduce new Tile 4 format
      drm/i915/dg2: Tile 4 plane format support
      drm/i915/dg2: Use I915_BO_ALLOC_CONTIGUOUS flag for DPT
      drm/i915: Fix skl_pcode_try_request function
      drm/i915: Swap ret and status returned from skl_pcode_request

Swathi Dhanavanthri (1):
      drm/i915/display/adlp: Remove code related to underrun recovery

Tejas Upadhyay (3):
      iommu/vt-d: Add RPLS to quirk list to skip TE disabling
      drm/i915/adl-n: Add stepping info
      drm/i915: Add RPL-S PCI IDs

Tvrtko Ursulin (1):
      drm/i915: Move intel_vtd_active and run_as_guest to i915_utils

Uma Shankar (1):
      drm/i915/display: Extend DP HDR support to hsw+

Ville Syrj=C3=A4l=C3=A4 (144):
      drm/i915: Optimize icl+ universal plane programming
      drm/i915: Make skl+ universal plane registers unlocked
      drm/i915: Make cursor plane registers unlocked
      drm/i915: Make most pre-skl primary plane registers unlocked
      drm/i915: Make pre-skl sprite plane registers unlocked
      drm/i915: s/JSP2/ICP2/ PCH
      drm/i915: Avoid negative shift due to bigjoiner_pipes=3D=3D0
      drm/i915: Fix cursor coordinates on bigjoiner slave
      drm/i915: Remove nop bigjoiner state copy
      drm/i915: Rename variables in intel_crtc_compute_config()
      drm/i915: Extract intel_splitter_adjust_timings()
      drm/i915: Extract intel_bigjoiner_adjust_timings()
      drm/i915: Extract intel_crtc_compute_pipe_src()
      drm/i915: Extract intel_crtc_compute_pipe_mode()
      drm/i915: Fix MSO vs. bigjoiner timings confusion
      drm/i915: Don't skip ddb allocation if data_rate=3D=3D0
      drm/i915: Check async flip capability early on
      drm/i915: Fix the async flip wm0/ddb optimization
      drm/i915: Pimp async flip debugs
      drm/i915: Move framestart_delay to crtc_state
      drm/i915: Remove framestart_delay sanitation
      drm/i915: Relocate ibx pch port sanitation code
      drm/i915: Relocate a few more pch transcoder bits
      drm/i915: Nuke skl_wrpll_context_init()
      drm/i915: Move a bunch of stuff into rodata from the stack
      drm/i915: Clean up some struct/array initializers
      drm/i915: Remove bxt m2_frac_en
      drm/i915: Use designated initializers for bxt_dp_clk_val[]
      drm/i915: Start tracking PIPESRC as a drm_rect
      drm/i915: Eliminate bigjoiner boolean
      drm/i915: Use bigjoiner_pipes more
      drm/i915: Remove leftover cnl SAGV block time
      drm/i915: Make the PIPESRC rect relative to the entire bigjoiner area
      drm/i915: Store the /5 target clock in struct dpll on vlv/chv
      drm/i915: Remove redundant/wrong comments
      drm/i915: Clean up bxt/glk PLL registers
      drm/i915: Store the m2 divider as a whole in bxt_clk_div
      drm/i915: Replace bxt_clk_div with struct dpll
      drm/i915: Replace hand rolled bxt vco calculation with chv_calc_dpll_=
params()
      drm/i915: Populate bxt/glk DPLL clock limits a bit more
      drm/i915: Remove struct dp_link_dpll
      drm/i915: Fix up some DRRS type checks
      drm/i915: Constify intel_drrs_init() args
      drm/i915: Pimp DRRS debugs
      drm/i915: Read DRRS MSA timing delay from VBT
      drm/i915: Program MSA timing delay on ilk/snb/ivb
      drm/i915: Polish drrs type enum
      drm/i915: Clean up DRRS refresh rate enum
      drm/i915: Rename PIPECONF refresh select bits
      drm/i915/dsi: Pass fixed_mode to *_dsi_add_properties()
      drm/i915/sdvo: Pass the requesed mode to intel_sdvo_create_preferred_=
input_timing()
      drm/i915/lvds: Pass fixed_mode to compute_is_dual_link_lvds()
      drm/i915: Simplify intel_panel_info()
      drm/i915: Nuke dev_priv->drrs.type
      drm/i915: Introduce intel_panel_{fixed,downclock}_mode()
      drm/i915: Introduce intel_panel_get_modes()
      drm/i915: Introduce intel_panel_preferred_fixed_mode()
      drm/i915: Introduce intel_panel_drrs_type()
      drm/i915: Introduce intel_drrs_type_str()
      drm/i915: Eliminate the intel_dp dependency from DRRS
      drm/i915: Stash DRRS state under intel_crtc
      drm/i915: Move DRRS enable/disable higher up
      drm/i915: Enable eDP DRRS on ilk/snb port A
      drm/i915: Implement static DRRS
      drm/i915: Convert fixed_mode/downclock_mode into a list
      drm/i915: Use drm_mode_copy()
      drm/i915: Put the downclock_mode check back into can_enable_drrs()
      drm/i915: Add missing tab to DRRS debugfs
      drm/i915: Fix DRRS frontbuffer_bits handling
      drm/i915: Determine DRRS frontbuffer_bits ahead of time
      drm/i915: Don't cancel/schedule drrs work if the pipe wasn't affected
      drm/i915: Schedule DRRS work from intel_drrs_enable()
      drm/i915: Do DRRS disable/enable during pre/post_plane_update()
      drm/i915: Deal with bigjoiner vs. DRRS
      drm/i915: Reject unsupported TMDS rates on ICL+
      drm/i915: Treat SAGV block time 0 as SAGV disabled
      drm/i915: Rework SAGV block time probing
      drm/i915: Probe whether SAGV works on pre-icl
      drm/i915: Reject excessive SAGV block time
      drm/i915: Rename pre-icl SAGV enable/disable functions
      drm/i915: Fix PSF GV point mask when SAGV is not possible
      drm/i915: Unconfuses QGV vs. PSF point masks
      drm/i915: Rename QGV request/response bits
      drm/i915: Tweak plane ddb allocation tracking
      drm/i915: Split plane data_rate into data_rate+data_rate_y
      drm/i915: Pre-calculate plane relative data rate
      drm/i915: Remove total[] and uv_total[] from ddb allocation
      drm/i915: Nuke intel_bw_calc_min_cdclk()
      drm/i915: Round up when calculating display bandwidth requirements
      drm/i915: Properly write lock bw_state when it changes
      drm/i915: Fix DBUF bandwidth vs. cdclk handling
      drm/i915: Add "maximum pipe read bandwidth" checks
      drm/i915: s/enable/active/ for DRRS
      drm/i915: Remove locks around skl+ scaler programming
      drm/i915: Make ilk+ pfit regiser unlocked
      drm/i915: Split color_commit() into noarm+arm pair
      drm/i915: Split pipe+output CSC programming to noarm+arm pair
      drm/i915: Pass intel_connector to intel_panel_{init,fini}()
      drm/i915: Use DRM_MODE_FMT+DRM_MODE_ARG()
      drm/i915: Extract intel_edp_add_properties()
      drm/i915: Use intel_panel_preferred_fixed_mode() more
      drm/i915: Rename intel_panel_vbt_fixed_mode()
      drm/i915: Extract intel_panel_vbt_sdvo_fixed_mode()
      drm/i915: Extract intel_panel_encoder_fixed_mode()
      drm/i915: Use intel_panel_edid_fixed_mode() for sdvo
      drm/i915: Change SDVO fixed mode handling
      drm/i915: Extract intel_edp_has_drrs()
      drm/i915: Put fixed modes directly onto the panel's fixed_modes list
      drm/i915: Refactor non-EDID fixed mode duplication
      drm/i915: Nuke intel_drrs_init()
      drm/i915: Combine the EDID fixed_mode+downclock_mode lookup into one
      drm/i915: Stop duplicating the EDID fixed/downclock modes
      drm/i915: Allow an arbitrary number of downclock modes
      drm/i915: Allow higher refresh rate alternate fixed modes
      drm/i915: Move intel_drrs_compute_config() into intel_dp.c
      drm/i915: Allow static DRRS on all eDP ports
      drm/i915: Allow static DRRS on LVDS
      drm/i915: Use drm_connector_attach_hdr_output_metadata_property()
      drm/i915: Remove dead members from dev_priv
      drm/i915/bios: Extract struct lvds_lfp_data_ptr_table
      drm/i915/dp: Extract intel_dp_tmds_clock_valid()
      drm/i915/dp: Respect the sink's max TMDS clock when dealing with DP->=
HDMI DFPs
      drm/i915/dp: Extract intel_dp_has_audio()
      drm/i915/dp: s/intel_dp_hdmi_ycbcr420/intel_dp_is_ycbcr420/
      drm/i915/dp: Reorder intel_dp_compute_config() a bit
      drm/i915/dp: Pass around intel_connector rather than drm_connector
      drm/i915/dp: Make intel_dp_output_format() usable for "4:2:0 also" mo=
des
      drm/i915/dp: Rework HDMI DFP TMDS clock handling
      drm/i915/dp: Add support for "4:2:0 also" modes for DP
      drm/i915/dp: Duplicate native HDMI TMDS clock limit handling for DP H=
DMI DFPs
      drm/i915/dp: Fix DFP rgb->ycbcr conversion matrix
      drm/i915/bios: Use the cached BDB version
      drm/i915/bios: Make copies of VBT data blocks
      drm/i915/bios: Use the copy of the LFP data table always
      drm/i915/bios: Validate LFP data table pointers
      drm/i915/bios: Trust the LFP data pointers
      drm/i915/bios: Validate the panel_name table
      drm/i915/fbc: Eliminate possible_framebuffer_bits
      drm/i915/fbc: Streamline frontbuffer busy bits handling
      drm/i915/fbc: Skip nuke when flip is pending
      drm/i915: Remove remaining locks from i9xx plane udpates
      drm/i915/fbc: Remove intel_fbc_global_disable()
      drm/i915/fbc: Introduce intel_fbc_sanitize()
      drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flu=
sh

Vinod Govindapillai (1):
      drm/i915: Handle the DG2 max bw properly

 Documentation/gpu/i915.rst                         |  14 +-
 arch/x86/kernel/early-quirks.c                     |   1 +
 drivers/gpu/drm/dp/drm_dp.c                        |  58 +-
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |  73 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  36 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  24 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  16 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 140 ++--
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  45 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          | 506 +++++++++----
 drivers/gpu/drm/i915/display/intel_bw.c            | 312 +++++---
 drivers/gpu/drm/i915/display/intel_bw.h            |  12 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  96 +--
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   2 +
 drivers/gpu/drm/i915/display/intel_color.c         |  95 ++-
 drivers/gpu/drm/i915/display/intel_color.h         |   3 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |  35 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   8 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  27 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  32 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  40 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 784 ++++++++++-------=
----
 drivers/gpu/drm/i915/display/intel_display.h       |   3 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   | 302 +++-----
 drivers/gpu/drm/i915/display/intel_display_power.c | 541 +++-----------
 drivers/gpu/drm/i915/display/intel_display_power.h |  37 +-
 .../drm/i915/display/intel_display_power_well.c    | 113 +++
 .../drm/i915/display/intel_display_power_well.h    | 153 ++++
 drivers/gpu/drm/i915/display/intel_display_trace.h |   9 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  43 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           | 131 +++-
 drivers/gpu/drm/i915/display/intel_dmc.h           |  10 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  30 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 581 +++++++++------
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  31 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   8 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  44 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 144 ++--
 drivers/gpu/drm/i915/display/intel_dpt.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          | 406 ++++-------
 drivers/gpu/drm/i915/display/intel_drrs.h          |  20 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   7 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |  24 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   7 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |  49 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  68 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |   1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  96 ++-
 drivers/gpu/drm/i915/display/intel_fbc.h           |   2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         | 142 ++--
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   1 +
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  57 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |  22 +-
 drivers/gpu/drm/i915/display/intel_panel.c         | 359 ++++++----
 drivers/gpu/drm/i915/display/intel_panel.h         |  33 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  99 ++-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |  10 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   1 +
 drivers/gpu/drm/i915/display/intel_psr.c           | 183 ++++-
 drivers/gpu/drm/i915/display/intel_psr.h           |   5 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  88 +--
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  51 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |  12 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |  21 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  24 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   4 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  22 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 266 +++++--
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  15 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |   8 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.h         |   2 +
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |   3 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  10 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   7 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   1 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  11 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   7 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   5 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |  54 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   1 -
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  12 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   5 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  13 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |   9 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |  10 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |  20 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |  20 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |   2 +
 drivers/gpu/drm/i915/i915_debugfs.c                |  18 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   5 +-
 drivers/gpu/drm/i915/i915_driver.h                 |   4 +
 drivers/gpu/drm/i915/i915_drv.h                    | 122 +---
 drivers/gpu/drm/i915/i915_gpu_error.c              |  21 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |   6 +
 drivers/gpu/drm/i915/i915_params.c                 |   7 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  39 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   5 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 133 ++--
 drivers/gpu/drm/i915/i915_suspend.c                |   4 -
 drivers/gpu/drm/i915/i915_utils.c                  |  11 +
 drivers/gpu/drm/i915/i915_utils.h                  |  37 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  11 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_dram.c                  |  10 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   2 +
 drivers/gpu/drm/i915/intel_memory_region.h         |   2 +-
 drivers/gpu/drm/i915/intel_pch.c                   |   3 +-
 drivers/gpu/drm/i915/intel_pcode.c                 |   4 +-
 drivers/gpu/drm/i915/intel_pm.c                    | 526 +++++++-------
 drivers/gpu/drm/i915/intel_pm.h                    |   1 +
 drivers/gpu/drm/i915/intel_step.c                  |   7 +
 drivers/gpu/drm/i915/intel_uncore.c                |  27 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   2 -
 drivers/gpu/drm/i915/selftests/i915_active.c       |   3 +-
 drivers/gpu/drm/i915/vlv_suspend.c                 |   3 +-
 drivers/iommu/intel/iommu.c                        |   2 +-
 include/drm/dp/drm_dp_helper.h                     |   2 +
 include/drm/i915_drm.h                             |   3 +-
 include/drm/i915_pciids.h                          |   4 +-
 include/uapi/drm/drm_fourcc.h                      |  47 ++
 149 files changed, 4340 insertions(+), 3676 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_well.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_well.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_regs.h

--=20
Jani Nikula, Intel Open Source Graphics Center
