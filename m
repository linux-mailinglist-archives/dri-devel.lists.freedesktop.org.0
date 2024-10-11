Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A599A269
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 13:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3545F10EACA;
	Fri, 11 Oct 2024 11:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSouif8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1F10EAC5;
 Fri, 11 Oct 2024 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728644898; x=1760180898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L8lqM1iaR380WI1+WiiokbgkBl5IADCzAK0Is9M8NHk=;
 b=KSouif8ti/oy5HtWiskWGde4pS1IR2we+10wP+M834w6xo45GO0L5z3y
 OY3lfAGuqdCt3l1zTpv2rNNhSsg6qwrhhio+GYCQpE2fkyUWhCdeRX8Xr
 J5QjFZ2YMgU9h+mFn2+0/qvoxtZCf0kGb4Go6j3y19rlf4DDIf+OgTCAn
 QKauWTclAeSzVMyaaT6wuNkPhp+09Et0+lI7kl7T/l2cFLfBrJ4ptMWuU
 2PxwWiMOCbO61OYJSml6br17RfNizrtcfaDwJ8b+xroY1PQ7FTuaVGtq5
 90T0Vc9r6MTfsYMpGGTEYnQtflM9OBaoeepRo49c5894G9eRXgd+qmOTg A==;
X-CSE-ConnectionGUID: izf/xNYeR2CZdJB4yxyq9w==
X-CSE-MsgGUID: /FowBUemQZODbZoWPT/90A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38610599"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="38610599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 04:08:18 -0700
X-CSE-ConnectionGUID: 6Gcp75VSTmyoVCuQbUMh7w==
X-CSE-MsgGUID: iwi4mSP+SeOAC73gGR2r8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="100207612"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.178])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 04:08:12 -0700
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
Date: Fri, 11 Oct 2024 14:08:06 +0300
Message-ID: <878quu6go9.fsf@intel.com>
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

Here's the first i915 feature pull towards v6.13.

drm-intel-next-2024-10-11:
drm/i915 features for v6.13:

Features and functionality:
- Enable BMG and LNL+ ultra joiner support to join 2+2 pipes (Ankit, Stan)
- Enable 10bpc+CCS scanout for ICL+ and fp16+CCS scanout for TGL+ (Ville)
- Use DSB for plane/color management commits (Ville)
- Expose package temperature in hwmon (Raag)
- Add more Arrow Lake (ARL) PCI IDs (Dnyaneshwar)
- Add intel_display_caps debugfs for display capabilities and params (Jani)
- Debug log detected LTTPR PHY descriptors (Imre)

Refactoring and cleanups:
- Add intel_bo abstraction to remove drm/xe -Ddrm_i915_gem_object=3Dxe_bo h=
ack (Jani)
- IRQ enable/disable/suspend/resume cleanups (Rodrigo)
- Pre-SKL watermark/CxSR cleanups (Ville)
- Joiner refactoring and cleanups (Ankit, Stan)
- Unify PCI ROM vs. SPI flash VBT read code paths (Ville)
- Use the common gen3+ irq code for gen2 (Ville)
- Display include cleanups (Jani)
- Conversions from drm_i915_private to struct intel_display (Jani, Ville, S=
uraj)
- Convert wakeref_t underlying type to struct ref_tracker * (Jani)
- Hide VLV/CHV/BXT/GLK specific PPS handling better (Jani)
- Split out DP test request handling to a separate file (Jani)
- Add display snapshot abstraction for error state (Jani)
- Register macro cleanups (Jani)
- Add irq IMR/IER/IIR register triplet abstraction (Jani)
- Remove IS_LP() (Jani)
- Remove xe compat raw reg read/write support (Jani)
- Remove unused macro parameter (He Lugang)
- Fix typos and spelling (Yan Zhen, Shen Lichuan, Colin Ian King)
- Minor code fixes (Yuesong Li, Chen Ni)
- Minor modeset refactoring (Ville)

Fixes:
- Fix a number of DP 2.1 Panel Replay issues (Jouni)
- Fix drm/xe display lockdep issues on runtime suspend/resume (Suraj)
- Fix MTL C20 PHY PLL values for UHBR20 (Dnyaneshwar)
- Fix DP FEC enabling for UHBR rates (Chaitanya)
- Fix BMG supported UHBR rates (10 and 13.5) (Arun)
- Fix BMG CCS modifiers (Juha-Pekka)
- Fix AUX IO power enabling for eDP PSR (Imre)
- Add PSR workarounds (Jouni)
- Check for too low DSC BPC (Suraj)
- Improve HDCP wakeup robustness after suspend/resume (Suraj)
- Reduce ICP+ hotplug filter to 250 us to match DP spec (Suraj)
- Fix PSR sink enable sequence (Ville)
- Fix DP colorimetry detection (Ville)
- Apply i915gm/i945gm irq C-state workaround to CRC interrupts (Ville)

Merges:
- Backmerge to fix cross-tree conflicts (Jani)
- Backmerge to get v6.12-rc1 (Jani)

BR,
Jani.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-20=
24-10-11

for you to fetch changes up to 388629a219ace83a09f8431a2e709c6c2efcf6ee:

  drm/i915/mtl: Update PLL c20 phy value for DP uhbr20 (2024-10-09 10:02:24=
 -0700)

----------------------------------------------------------------
drm/i915 features for v6.13:

Features and functionality:
- Enable BMG and LNL+ ultra joiner support to join 2+2 pipes (Ankit, Stan)
- Enable 10bpc+CCS scanout for ICL+ and fp16+CCS scanout for TGL+ (Ville)
- Use DSB for plane/color management commits (Ville)
- Expose package temperature in hwmon (Raag)
- Add more Arrow Lake (ARL) PCI IDs (Dnyaneshwar)
- Add intel_display_caps debugfs for display capabilities and params (Jani)
- Debug log detected LTTPR PHY descriptors (Imre)

Refactoring and cleanups:
- Add intel_bo abstraction to remove drm/xe -Ddrm_i915_gem_object=3Dxe_bo h=
ack (Jani)
- IRQ enable/disable/suspend/resume cleanups (Rodrigo)
- Pre-SKL watermark/CxSR cleanups (Ville)
- Joiner refactoring and cleanups (Ankit, Stan)
- Unify PCI ROM vs. SPI flash VBT read code paths (Ville)
- Use the common gen3+ irq code for gen2 (Ville)
- Display include cleanups (Jani)
- Conversions from drm_i915_private to struct intel_display (Jani, Ville, S=
uraj)
- Convert wakeref_t underlying type to struct ref_tracker * (Jani)
- Hide VLV/CHV/BXT/GLK specific PPS handling better (Jani)
- Split out DP test request handling to a separate file (Jani)
- Add display snapshot abstraction for error state (Jani)
- Register macro cleanups (Jani)
- Add irq IMR/IER/IIR register triplet abstraction (Jani)
- Remove IS_LP() (Jani)
- Remove xe compat raw reg read/write support (Jani)
- Remove unused macro parameter (He Lugang)
- Fix typos and spelling (Yan Zhen, Shen Lichuan, Colin Ian King)
- Minor code fixes (Yuesong Li, Chen Ni)
- Minor modeset refactoring (Ville)

Fixes:
- Fix a number of DP 2.1 Panel Replay issues (Jouni)
- Fix drm/xe display lockdep issues on runtime suspend/resume (Suraj)
- Fix MTL C20 PHY PLL values for UHBR20 (Dnyaneshwar)
- Fix DP FEC enabling for UHBR rates (Chaitanya)
- Fix BMG supported UHBR rates (10 and 13.5) (Arun)
- Fix BMG CCS modifiers (Juha-Pekka)
- Fix AUX IO power enabling for eDP PSR (Imre)
- Add PSR workarounds (Jouni)
- Check for too low DSC BPC (Suraj)
- Improve HDCP wakeup robustness after suspend/resume (Suraj)
- Reduce ICP+ hotplug filter to 250 us to match DP spec (Suraj)
- Fix PSR sink enable sequence (Ville)
- Fix DP colorimetry detection (Ville)
- Apply i915gm/i945gm irq C-state workaround to CRC interrupts (Ville)

Merges:
- Backmerge to fix cross-tree conflicts (Jani)
- Backmerge to get v6.12-rc1 (Jani)

----------------------------------------------------------------
Ankit Nautiyal (18):
      drm/i915/display: Check whether platform supports joiner
      drm/i915/display: Simplify intel_joiner_num_pipes and its usage
      drm/i915/display: Use joined pipes in intel_dp_joiner_needs_dsc
      drm/i915/display: Use joined pipes in intel_mode_valid_max_plane_size
      drm/i915/display: Use joined pipes in dsc helpers for slices, bpp
      drm/i915/display: Enhance iterators for modeset en/disable
      drm/i915/display_device: Add Check HAS_DSC for bigjoiner
      drm/i915/display_debugfs: Allow force joiner only if supported
      drm/i915/display: Modify debugfs for joiner to force n pipes
      drm/i915/dp: Add helper to compute num pipes required
      drm/i915: Split current joiner hw state readout
      drm/i915/display: Add macro HAS_ULTRAJOINER()
      drm/i915/display: Refactor enable_joiner_pipes
      drm/i915/dp: Refactor joiner max_bpp calculations into separate funct=
ions
      drm/i915/dp: Use num_joined_pipes in bigjoiner_bw_max_bpp
      drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
      drm/i915/display: Consider ultrajoiner for computing maxdotclock
      drm/i915/intel_dp: Add support for forcing ultrajoiner

Arun R Murthy (1):
      drm/i915/display: BMG supports UHBR13.5

Chaitanya Kumar Borah (1):
      drm/i915: Do not explicilty enable FEC in DP_TP_CTL for UHBR rates

Chen Ni (1):
      drm/i915/hdmi: convert comma to semicolon

Colin Ian King (1):
      drm/i915/display: Fix spelling mistake "Uncomressed" -> "Uncompressed"

Dnyaneshwar Bhadane (2):
      drm/i915/pciid: Add new PCI id for ARL
      drm/i915/mtl: Update PLL c20 phy value for DP uhbr20

He Lugang (1):
      drm/i915:Remove unused parameter in marco

Imre Deak (2):
      drm/i915/dp: Dump the LTTPR PHY descriptors
      drm/i915/dp: Fix AUX IO power enabling for eDP PSR

Jani Nikula (93):
      drm/i915/wm: move struct intel_watermark_params to i9xx_wm.c
      drm/i915/hdcp: split out intel_hdcp_shim.h for struct intel_hdcp_shim
      drm/i915/display: include drm/drm_probe_helper.h where needed
      drm/i915/display: include drm/drm_vblank.h where needed
      drm/i915/display: include media/cec-notifier.h and linux/debugfs.h wh=
ere needed
      drm/i915/fb: hide the guts of intel_fb_obj()
      drm/i915/display: drop extra includes from intel_display_types.h
      drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()
      drm/i915/pciids: separate ARL and MTL PCI IDs
      drm/i915/display: pass display to intel_crtc_for_pipe()
      drm/i915/display: convert intel_display_trace.h to struct intel_displ=
ay
      drm/i915: use IS_ENABLED() instead of defined() on config options
      drm/i915/display: use to_intel_display() global state macros
      drm/i915/bios: fix printk format width
      Merge drm/drm-next into drm-intel-next
      drm/i915/reg: fix transcoder timing register style
      drm/i915/reg: fix g4x pipe data/link m/n register style
      drm/i915/reg: fix pipe conf, stat etc. register style
      drm/i915/reg: fix pipe data/link m/n register style
      drm/i915/reg: fix SKL scaler register style
      drm/i915/reg: fix PCH transcoder timing indentation
      drm/i915/reg: fix PCH transcoder timing and data/link m/n style
      drm/i915/reg: fix DIP CTL register style
      drm/i915/reg: fix small register style issues here and there
      drm/i915/reg: remove unused DSI register macros
      drm/i915/reg: remove superfluous whitespace
      drm/i915: dump display parameters captured in error state, not current
      drm/i915/display: add intel_display_snapshot abstraction
      drm/i915/display: move device info and params handling to snapshot
      drm/i915/display: move dmc snapshotting to new display snapshot
      drm/i915: move intel_get_pipe_from_crtc_id_ioctl to intel_crtc.c
      drm/i915/display: move enum i9xx_plane_id to intel_display_limits.h
      drm/i915: add i9xx_display_irq_reset()
      drm/i915/pps: add vlv_ prefix to pps_pipe and active_pipe members
      drm/i915/pps: add bxt_ prefix to pps_reset
      drm/i915/pps: only touch the vlv_ members on VLV/CHV
      drm/i915/pps: add vlv_pps_pipe_init()
      drm/i915/pps: add vlv_pps_pipe_reset()
      drm/i915/pps: add vlv_pps_port_disable()
      drm/i915/pps: rename vlv_pps_init() to vlv_pps_port_enable_unlocked()
      drm/i915/pps: add vlv_pps_backlight_initial_pipe()
      drm/i915/pps: move vlv_active_pipe() to intel_pps.c
      drm/i915/debugfs: remove superfluous kernel_param_lock/unlock
      drm/i915/debugfs: add dedicated intel_display_caps debugfs for display
      drm/i915/display: remove small micro-optimizations in irq handling
      drm/xe/display: remove compat raw reg read/write support
      drm/i915/display: start a buffer object abstraction layer
      drm/i915/display: convert intel_atomic_plane.c to struct drm_gem_obje=
ct
      drm/i915/fb: convert parts of intel_fb.c to struct drm_gem_object
      drm/i915/fbdev: convert intel_fbdev.c to struct drm_gem_object
      drm/i915/display: convert skl_universal_plane.c to struct drm_gem_obj=
ect
      drm/i915/fb: convert intel_framebuffer_init() to struct drm_gem_object
      drm/i915/fb: convert intel_fb_bo_lookup_valid_bo() to struct drm_gem_=
object
      drm/i915/fb: convert intel_fb_bo_framebuffer_init() to struct drm_i91=
5_gem_object
      drm/i915/fb: convert intel_fb_bo_framebuffer_fini() to struct drm_i91=
5_gem_object
      drm/xe/display: use correct bo type in intel_fbdev_fb_alloc()
      drm/i915/fb: convert intel_framebuffer_create() to struct drm_gem_obj=
ect
      drm/xe/display: stop using intel_fb_obj() in xe_fb_pin.c
      drm/i915/display: add intel_bo_read_from_page() and use it
      drm/i915/display: add intel_bo_get/set_frontbuffer() and use them
      drm/i915/frontbuffer: convert intel_frontbuffer_get() to struct drm_g=
em_object
      drm/i915/frontbuffer: convert frontbuffer->obj to struct drm_gem_obje=
ct
      drm/i915/display: add intel_bo_describe() and use it
      drm/i915/fb: remove intel_fb_obj()
      drm/i915/display: clean up some gem/ includes
      drm/xe/compat: remove a bunch of compat gem headers
      drm/xe: remove a number of superfluous compat macros
      drm/xe: eradicate -Ddrm_i915_gem_object=3Dxe_bo
      drm/i915/dp: split out intel_dp_test.[ch] to a dedicated file
      drm/i915/dp: fix style issues in intel_dp_test.c
      drm/i915/dp: convert intel_dp_test.c struct intel_display
      drm/i915/dp: clean up intel_dp_test.[ch] interface
      drm/i915/dp: move DP test debugfs files next to the functionality
      drm/i915/dp: fix style issues in DP test debugfs
      drm/i915/display: remove the loop in fifo underrun debugfs file creat=
ion
      drm/i915/dp: convert DP test debugfs to struct intel_display
      drm/i915/dp: add intel_dp_test_reset() and intel_dp_test_short_pulse()
      drm/i915/quirks: make intel_dpcd_quirks const
      drm/i915/pps: split intel_pps_reset_all() to vlv and bxt variants
      Merge drm/drm-next into drm-intel-next
      drm/i915/gem: fix bitwise and logical AND mixup
      drm/i915: use INTEL_WAKEREF_DEF instead of magic -1 for intel_wakeref=
_t
      drm/i915/display: return 0 instead of false for disabled power wakeref
      drm/i915/gt: add a macro for mock gt wakeref special value and use it
      drm/i915/audio: be explicit about intel_wakeref_t conversions
      drm/i915: switch intel_wakeref_t underlying type to struct ref_tracke=
r *
      drm/i915: remove IS_LP()
      drm/i915/soc: stop using IS_GEN9_LP() and IS_GEN9_BC()
      drm/i915/hdcp: fix connector refcounting
      drm/i915/irq: add struct i915_irq_regs triplet
      drm/i915/irq: remove GEN3_IRQ_RESET() and GEN3_IRQ_INIT() macros
      drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() mac=
ros
      drm/i915: use NULL for zero wakeref_t instead of plain integer 0

Jouni H=C3=B6gander (10):
      drm/i915/display: Handle MST connector in intel_attached_dp
      drm/i915/display: Use intel_attached_dp instead of local implementati=
on
      drm/i915/psr: Add connector debugfs files for MST connector as well
      drm/i915/psr: Do not wait for PSR being idle on on Panel Replay
      drm/i915/psr: eDP Panel Replay is not supported on pipes other than A=
 and B
      drm/i915/psr: Add intel_psr_needs_block_dc_vblank for blocking dc ent=
ry
      drm/i915/display: Prevent DC6 while vblank is enabled for Panel Replay
      Revert "drm/i915/psr: Implement WA to help reach PC10"
      drm/i915/psr: Add new SU area calculation helper to apply workarounds
      drm/i915/psr: Implement Wa 14019834836

Juha-Pekka Heikkila (1):
      drm/i915/display: Fix BMG CCS modifiers

Raag Jadav (1):
      drm/i915/hwmon: expose package temperature

Rodrigo Vivi (4):
      drm/i915/irq: Remove duplicated irq_enabled variable
      drm/i915/irq: Move irqs_enabled out of runtime_pm
      drm/i915/irq: Rename suspend/resume functions
      drm/i915/irq: Uninstall should be called just once

Shen Lichuan (1):
      drm/i915/gvt: Correct multiple typos in comments

Stanislav Lisovskiy (6):
      drm/i915: Add some essential functionality for joiners
      drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity che=
cks
      drm/i915: Implement hw state readout and checks for ultrajoiner
      drm/i915/display/vdsc: Add ultrajoiner support with DSC
      drm/i915/dp: Simplify helper to get slice count with joiner
      drm/i915: Compute config and mode valid changes for ultrajoiner

Suraj Kandpal (9):
      drm/i915/hdcp: Move to using intel_display in intel_hdcp
      drm/i915/hdcp: Use intel_display in hdcp_gsc
      drm/xe/display: Do not suspend resume dp mst during runtime
      drm/xe/display: Do not do intel_fbdev_set_suspend during runtime
      drm/i915/psr: Implement WA to help reach PC10
      drm/i915/hotplug: Reduce SHPD_FLITER_CNT for ICL and above
      drm/i915/hotplug: Add comment for XE_LPD+ SHPD_FILTER_CNT value
      drm/i915/vdsc: Add bpc check in intel_dsc_compute_params
      drm/i915/hdcp: Retry first read and writes to downstream

Ville Syrj=C3=A4l=C3=A4 (53):
      drm/i915/cdclk: Add missing braces
      drm/i915/cdclk: Convert CDCLK code to intel_display
      drm/i915/power: Convert low level DC state code to intel_display
      drm/i915/vga: Convert VGA code to intel_display
      drm/i915/power: Convert "i830 power well" code to intel_display
      drm/i915/dmc: Convert DMC code to intel_display
      drm/i915/psr: Fix PSR sink enable sequence
      drm/i915/color: Extract intel_color_modeset()
      drm/i915: Extract intel_post_plane_update_after_readout()
      drm/i915/dp: Fix colorimetry detection
      drm/i915: Remove leftover intel_sprite_set_colorkey_ioctl() prototype
      drm/i915: Combine .compute_{pipe,intermediate}_wm() into one
      drm/i915: Extract ilk_must_disable_lp_wm()
      drm/i915: Clean up intel_wm_need_update()
      drm/i915: Move the dodgy pre-g4x wm stuff into i9xx_wm
      drm/i915: s/disable_lp_wm/disable_cxsr/
      drm/i915: Rename variables in ilk_intermedidate_wm()
      drm/i915: Set clear color block size to 0x0
      drm/i915/bios: Use drm_dbg_kms() consistently
      drm/i915/bios: Add some size checks to SPI VBT read
      drm/i915/bios: Round PCI ROM VBT allocation to multiple of 4
      drm/i915/bios: Extract intel_spi_read16()
      drm/i915/bios: Extract vbt_signature[]
      drm/i915/bios: Extract soc/intel_rom.c
      drm/i915: Introduce i915_has_legacy_blc_interrupt()
      drm/i915: Clean up gen3 hotplug irq setup
      drm/i915: Clean up some comments in gmch irq code
      drm/i915: Switch over to gen3 irq code on gen2
      drm/i915/irq: Nuke stale comments
      drm/i915/irq: Pair up the vblank enable/disable functions
      drm/i915: Extract i915gm_irq_cstate_wa_{disable,enable}()
      drm/i915: Apply the i915gm/i945gm irq C-state w/a to CRC interrupts
      drm/i915/dp: Make intel_dp_get_colorimetry_status() static
      drm/i915/dp: Extract intel_edp_set_sink_rates()
      drm/i915/dsb: Avoid reads of the DSB buffer for indexed register writ=
es
      drm/i915: Prepare clear color before wait_for_dependencies()
      drm/i915/dsb: Generate the DSB buffer in commit_tail()
      drm/i915/dsb: Enable programmable DSB interrupt
      drm/i915/dsb: Introduce intel_dsb_vblank_evade()
      drm/i915/dsb: Introduce intel_dsb_wait_usec()
      drm/i915/dsb: Introduce intel_dsb_wait_vblanks()
      drm/i915: Introduce intel_scanlines_to_usecs()
      drm/i915/dsb: Introduce intel_dsb_wait_vblank_delay()
      drm/i915: Extract intel_crtc_prepare_vblank_event()
      drm/i915: Plumb 'dsb' all way to the plane hooks
      drm/i915: Plumb 'dsb' all way to the color commit hooks
      drm/i915/dsb: Use DSB for plane/color management updates
      drm/i915: Disable compression tricks on JSL
      drm/i915: Enable 10bpc + CCS on TGL+
      drm/i915: Enable 10bpc + CCS on ICL
      drm/i915: Enable fp16 + CCS on TGL+
      drm/i915: Drop GEN12_MC_CCS check from skl_plane_max_width()
      drm/i915: s/gen12/tgl/ in the universal plane code

Yan Zhen (1):
      drm/i915/display: fix typo in the comment

Yuesong Li (1):
      drm/i915/dp: Remove double assignment in intel_dp_compute_as_sdp()

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |    8 +
 drivers/gpu/drm/i915/Makefile                      |    6 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   39 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    5 -
 drivers/gpu/drm/i915/display/hsw_ips.c             |    2 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   22 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  202 +++-
 drivers/gpu/drm/i915/display/i9xx_wm.h             |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    1 +
 drivers/gpu/drm/i915/display/intel_alpm.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  197 ++--
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   19 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    9 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  158 +--
 drivers/gpu/drm/i915/display/intel_bo.c            |   59 +
 drivers/gpu/drm/i915/display/intel_bo.h            |   27 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 1179 ++++++++++------=
----
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   28 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  218 ++--
 drivers/gpu/drm/i915/display/intel_color.h         |    8 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   69 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   12 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  104 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |    8 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   21 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   11 +
 drivers/gpu/drm/i915/display/intel_display.c       |  816 ++++++++++----
 drivers/gpu/drm/i915/display/intel_display.h       |   56 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |    8 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  320 ++----
 .../gpu/drm/i915/display/intel_display_device.c    |    4 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    7 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   37 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  299 +++--
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    5 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |   10 +
 .../gpu/drm/i915/display/intel_display_params.c    |    8 +-
 .../gpu/drm/i915/display/intel_display_params.h    |    5 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  101 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    8 +-
 .../drm/i915/display/intel_display_power_well.c    |  249 +++--
 .../drm/i915/display/intel_display_power_well.h    |   15 +-
 .../gpu/drm/i915/display/intel_display_snapshot.c  |   72 ++
 .../gpu/drm/i915/display/intel_display_snapshot.h  |   16 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |   55 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  184 +--
 drivers/gpu/drm/i915/display/intel_dmc.c           |  427 +++----
 drivers/gpu/drm/i915/display/intel_dmc.h           |   30 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  797 +++----------
 drivers/gpu/drm/i915/display/intel_dp.h            |   23 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    1 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   36 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   56 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |  765 +++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_test.h       |   23 +
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    2 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  139 ++-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    7 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  152 ++-
 drivers/gpu/drm/i915/display/intel_fb.h            |    8 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    9 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |   10 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   14 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   27 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   30 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   66 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  737 ++++++------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   40 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    9 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   44 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |    3 +-
 drivers/gpu/drm/i915/display/intel_hdcp_shim.h     |  137 +++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    3 +
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   13 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   20 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    1 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |   18 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |   25 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    4 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  188 +++-
 drivers/gpu/drm/i915/display/intel_pps.h           |   12 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  107 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    1 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    5 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    1 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |   27 +-
 drivers/gpu/drm/i915/display/intel_sprite.h        |    5 -
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |    3 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    1 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |    2 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   21 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |    2 +
 drivers/gpu/drm/i915/display/intel_vga.c           |   45 +-
 drivers/gpu/drm/i915/display/intel_vga.h           |   14 +-
 drivers/gpu/drm/i915/display/intel_wm.c            |   26 +-
 drivers/gpu/drm/i915/display/intel_wm.h            |    6 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  408 ++++---
 drivers/gpu/drm/i915/display/skl_watermark.c       |   12 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   24 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |   12 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    5 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |    4 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    9 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 -
 drivers/gpu/drm/i915/gvt/gtt.c                     |    2 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |    2 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    6 -
 drivers/gpu/drm/i915/i915_driver.c                 |   24 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   25 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |   11 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   40 +
 drivers/gpu/drm/i915/i915_irq.c                    |  328 ++----
 drivers/gpu/drm/i915/i915_irq.h                    |   38 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  456 ++++----
 drivers/gpu/drm/i915/i915_reg_defs.h               |   10 +
 drivers/gpu/drm/i915/i915_suspend.c                |    3 +-
 drivers/gpu/drm/i915/i915_trace.h                  |    2 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    4 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    1 -
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |    4 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    8 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    7 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |   14 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |    4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    6 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |    4 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |    5 +-
 drivers/gpu/drm/i915/soc/intel_rom.c               |  160 +++
 drivers/gpu/drm/i915/soc/intel_rom.h               |   25 +
 drivers/gpu/drm/xe/Makefile                        |    6 +-
 .../drm/xe/compat-i915-headers/gem/i915_gem_lmem.h |    1 -
 .../drm/xe/compat-i915-headers/gem/i915_gem_mman.h |   17 -
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |   64 --
 .../gem/i915_gem_object_frontbuffer.h              |   12 -
 .../gem/i915_gem_object_types.h                    |   11 -
 .../gpu/drm/xe/compat-i915-headers/i915_debugfs.h  |   14 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    5 +-
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |    9 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   24 -
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |    4 +-
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |   10 +-
 .../gpu/drm/xe/compat-i915-headers/soc/intel_rom.h |    6 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   31 +-
 drivers/gpu/drm/xe/display/intel_bo.c              |   84 ++
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   19 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.h           |   24 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   12 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   19 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   12 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   44 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    4 +-
 drivers/gpu/drm/xe/xe_bo.h                         |    2 -
 drivers/gpu/drm/xe/xe_bo_types.h                   |    3 -
 include/drm/intel/i915_pciids.h                    |   40 +-
 192 files changed, 6407 insertions(+), 4731 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_bo.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_test.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_test.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_shim.h
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

--=20
Jani Nikula, Intel
