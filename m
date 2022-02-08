Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D488F4ADBD1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 15:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BE610E247;
	Tue,  8 Feb 2022 14:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BDC10E247;
 Tue,  8 Feb 2022 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644332341; x=1675868341;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=soE9ua3lxNPA4+kd3fiHz1X6mrUOhpjA+R0IdBo3RaU=;
 b=joLjVl9pFlOmHctEeWUdQikeU4Gm8UCduPxp/45Sj4hmpoD0JEhCW9HD
 BLmvJpgDD1rUqc/0+O0HeXphw6I+q3wwZcqeOXQMBznpYcrD9pF8kGRAq
 eO5TtE+EmDr0JJjoz9brCBq7cu34B01F9W6WCY4JmAhP+/5XvkoLkNy5A
 Yj3I460o8QRyhf/s2BnVHcm/mz9IKJP9jH47H2CNTwBBjislE1AzSTQ7O
 AdeorxUp1nOjM8jyujB1pYAHYsbJ1hh0pHHT6wm9FUFNj5Y8+hJEC/+Lr
 eN4OIsEL6nfuP5K4bVbYuaBFSciziMWJEBrFcUR0cLFjpsqzbxwUj+J0O w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229611565"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="229611565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 06:59:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="540627009"
Received: from preritja-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.38.128])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 06:58:56 -0800
Date: Tue, 8 Feb 2022 09:58:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <YgKFLmCgpv4vQEa1@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes the first and probably biggest request towards 5.18.

Another request will come in about 2 weeks.

drm-intel-next-2022-02-08:

Cross-subsystem Changes:
------------------------

dma-buf:
- dma-buf-map: Rename to iosys-map (Lucas)

Core Changes:
-------------

drm:
- Always include the debugfs_entry in drm_crtc (Ville)
- Add orientation quirk for GPD Win Max (Anisse)

Driver Changes:
---------------

gvt:
- Constify some pointers. (Rikard Falkeborn)
- Use list_entry to access list members. (Guenter Roeck)
- Fix cmd parser error for Passmark9. (Zhenyu Wang)

i915:
- Various clean-ups including headers and removing unused and unnecessary stuff\
 (Jani, Hans, Andy, Ville)
- Cleaning up on our registers definitions i915_reg.h (Matt)
- More multi-FBC refactoring (Ville)
- Baytrail backlight fix (Hans)
- DG1 OPROM read through SPI controller (Clint)
- ADL-N platform enabling (Tejas)
- Fix slab-out-of-bounds access (Jani)
- Add opregion mailbox #5 support for possible EDID override (Anisse)
- Fix possible NULL dereferences (Harish)
- Updates and fixes around display voltage swing values (Clint, Jose)
- Fix RPM wekeref on PXP code (Juston)
- Many register definitions clean-up, including planes registers (Ville)
- More conversion towards display version over the old gen (Madhumitha, Ville)
- DP MST ESI handling improvements (Jani)
- drm device based logging conversions (Jani)
- Prevent divide by zero (Dan)
- Introduce ilk_pch_pre_enable for complete modeset abstraction (Ville)
- Async flip optimization for DG2 (Stanislav)
- Multiple DSC and bigjoiner fixes and improvements (Ville)
- Fix ADL-P TypeC Phy ready status readout (Imre)
- Fix up DP DFP 4:2:0 handling more display related fixes (Ville)
- Display M/N cleanup (Ville)
- Switch to use VGA definitions from video/vga.h (Jani)
- Fixes and improvements to abstract CPU architecture (Lucas)
- Disable unsused power wells left enabled by BIOS (Imre)
- Allow !join_mbus cases for adlp+ dbuf configuration (Ville)
- Populate pipe dbuf slices more accurately during readout (Ville)
- Workaround broken BIOS DBUF configuration on TGL/RKL (Ville)
- Fix trailing semicolon (Lucas)

Thanks,
Rodrigo.

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-02-08

for you to fetch changes up to 7938f4218168ae9fc4bdddb15976f9ebbae41999:

  dma-buf-map: Rename to iosys-map (2022-02-07 16:35:35 -0800)

----------------------------------------------------------------
Cross-subsystem Changes:
------------------------

dma-buf:
- dma-buf-map: Rename to iosys-map (Lucas)

Core Changes:
-------------

drm:
- Always include the debugfs_entry in drm_crtc (Ville)
- Add orientation quirk for GPD Win Max (Anisse)

Driver Changes:
---------------

gvt:
- Constify some pointers. (Rikard Falkeborn)
- Use list_entry to access list members. (Guenter Roeck)
- Fix cmd parser error for Passmark9. (Zhenyu Wang)

i915:
- Various clean-ups including headers and removing unused and unnecessary stuff\
 (Jani, Hans, Andy, Ville)
- Cleaning up on our registers definitions i915_reg.h (Matt)
- More multi-FBC refactoring (Ville)
- Baytrail backlight fix (Hans)
- DG1 OPROM read through SPI controller (Clint)
- ADL-N platform enabling (Tejas)
- Fix slab-out-of-bounds access (Jani)
- Add opregion mailbox #5 support for possible EDID override (Anisse)
- Fix possible NULL dereferences (Harish)
- Updates and fixes around display voltage swing values (Clint, Jose)
- Fix RPM wekeref on PXP code (Juston)
- Many register definitions clean-up, including planes registers (Ville)
- More conversion towards display version over the old gen (Madhumitha, Ville)
- DP MST ESI handling improvements (Jani)
- drm device based logging conversions (Jani)
- Prevent divide by zero (Dan)
- Introduce ilk_pch_pre_enable for complete modeset abstraction (Ville)
- Async flip optimization for DG2 (Stanislav)
- Multiple DSC and bigjoiner fixes and improvements (Ville)
- Fix ADL-P TypeC Phy ready status readout (Imre)
- Fix up DP DFP 4:2:0 handling more display related fixes (Ville)
- Display M/N cleanup (Ville)
- Switch to use VGA definitions from video/vga.h (Jani)
- Fixes and improvements to abstract CPU architecture (Lucas)
- Disable unsused power wells left enabled by BIOS (Imre)
- Allow !join_mbus cases for adlp+ dbuf configuration (Ville)
- Populate pipe dbuf slices more accurately during readout (Ville)
- Workaround broken BIOS DBUF configuration on TGL/RKL (Ville)
- Fix trailing semicolon (Lucas)

----------------------------------------------------------------
Andy Shevchenko (1):
      drm/i915/dsi: Drop double check ACPI companion device for NULL

Anisse Astier (2):
      drm/i915/opregion: add support for mailbox #5 EDID
      drm: Add orientation quirk for GPD Win Max

Clint Taylor (2):
      drm/i915/dg1: Read OPROM via SPI controller
      drm/i915/snps: vswing value refined for SNPS phys

Dan Carpenter (1):
      drm/i915/overlay: Prevent divide by zero bugs in scaling

Guenter Roeck (1):
      drm/i915/gvt: Use list_entry to access list members

Hans de Goede (2):
      drm/i915/backlight: Make ext_pwm_disable_backlight() call intel_backlight_set_pwm_level()
      drm/i915: Remove unused intel_gmbus_set_speed() function

Harish Chegondi (1):
      drm/i915: Fix possible NULL pointer dereferences in i9xx_update_wm()

Imre Deak (2):
      drm/i915/adlp: Fix TypeC PHY-ready status readout
      drm/i915: Disable unused power wells left enabled by BIOS

Jani Nikula (35):
      drm/i915/cdclk: turn around i915_drv.h and intel_cdclk.h dependency
      drm/i915/cdclk: move struct intel_cdclk_funcs to intel_cdclk.c
      drm/i915/bios: fix slab-out-of-bounds access
      drm/i915: stop including i915_irq.h from i915_drv.h
      drm/i915: split out i915_getparam.h from i915_drv.h
      drm/i915: split out i915_cmd_parser.h from i915_drv.h
      drm/i915: split out i915_gem_evict.h from i915_drv.h
      drm/i915: split out gem/i915_gem_userptr.h from i915_drv.h
      drm/i915: split out gem/i915_gem_tiling.h from i915_drv.h
      drm/i915: split out PCI config space registers from i915_reg.h
      drm/i915: split out vlv sideband registers from i915_reg.h
      drm/i915/dp: make intel_dp_pack_aux() static again
      drm/i915/pcode: rename sandybridge_pcode_* to snb_pcode_*
      drm/i915/psr: remove unused lines_to_wait vbt info
      drm/i915/dpll: make intel_shared_dpll_funcs internal to intel_dpll_mgr.c
      drm/i915: split out i915_reg_read_ioctl() to i915_ioctl.[ch]
      drm/i915/mst: fix intel_dp_mst_hpd_irq() indentation
      drm/i915/mst: abstract intel_dp_ack_sink_irq_esi()
      drm/i915/mst: debug log 4 bytes of ESI right after reading
      drm/i915/mst: abstract handling of link status in DP MST
      drm/i915/mst: read link status only when requested by sink in ESI
      drm/i915/mst: ack sink irq ESI for link status changes
      drm/i915/mst: only ack the ESI we actually handled
      drm/i915: nuke local versions of WARN_ON/WARN_ON_ONCE
      drm/i915/snps: convert to drm device based logging
      drm/i915/pps: convert to drm device based logging
      drm/i915/hotplug: convert to drm device based logging
      drm/i915/dp: convert to drm device based logging
      drm/i915/plane: convert to drm device based logging and WARN
      drm/i915/sprite: convert to drm device based logging
      drm/i915/lspcon: convert to drm device based logging
      drm/i915/cdclk: update intel_dump_cdclk_config() logging
      drm/i915/cdclk: convert to drm device based logging
      drm/i915/vga: switch to use VGA definitions from video/vga.h
      drm/i915: remove VGA register definitions

José Roberto de Souza (2):
      drm/i915/display/ehl: Update voltage swing table
      drm/i915/display/adlp: Implement new step in the TC voltage swing prog sequence

Juston Li (1):
      drm/i915/pxp: Hold RPM wakelock during PXP unbind

Lucas De Marchi (4):
      drm/i915: Do not spam log with missing arch support
      drm/i915: Fix header test for !CONFIG_X86
      drm/i915: Fix trailing semicolon
      dma-buf-map: Rename to iosys-map

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Eliminate remnant GEN<n> references

Matt Roper (18):
      drm/i915: Use parameterized GPR register definitions everywhere
      drm/i915: Parameterize PWRCTX_MAXCNT
      drm/i915: Parameterize ECOSKPD
      drm/i915: Use RING_PSMI_CTL rather than per-engine macros
      drm/i915: Replace GFX_MODE_GEN7 with RING_MODE_GEN7
      drm/i915: Introduce i915_reg_defs.h
      drm/i915/gt: Move engine registers to their own header
      drm/i915: Move SNPS PHY registers to their own header
      drm/i915: Move combo PHY registers to their own header
      drm/i915: Move TC PHY registers to their own header
      drm/i915: Drop unused _PORT3 and _PORT4 TC phy register offsets
      drm/i915/perf: Move OA regs to their own header
      drm/i915/perf: Express OA register ranges with i915_range
      drm/i915: Parameterize R_PWR_CLK_STATE register definition
      drm/i915: Parameterize MI_PREDICATE registers
      drm/i915: Move GT registers to their own header file
      drm/i915: Only include i915_reg.h from .c files
      drm/i915: Move [more] GT registers to their own header file

Rikard Falkeborn (9):
      drm/i915/gvt: Constify intel_gvt_gtt_gma_ops
      drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
      drm/i915/gvt: Constify intel_gvt_irq_ops
      drm/i915/gvt: Constify intel_gvt_sched_policy_ops
      drm/i915/gvt: Constify gvt_mmio_block
      drm/i915/gvt: Constify cmd_interrupt_events
      drm/i915/gvt: Constify formats
      drm/i915/gvt: Constify gtt_type_table_entry
      drm/i915/gvt: Constify vgpu_types

Rodrigo Vivi (2):
      Merge tag 'gvt-next-2022-01-12' of https://github.com/intel/gvt-linux into drm-intel-next
      Merge drm/drm-next into drm-intel-next

Stanislav Lisovskiy (4):
      drm/i915: Pass plane to watermark calculation functions
      drm/i915: Introduce do_async_flip flag to intel_plane_state
      drm/i915: Use wm0 only during async flips for DG2
      drm/i915: Don't allocate extra ddb during async flip for DG2

Tejas Upadhyay (1):
      drm/i915/adl-n: Enable ADL-N platform

Ville Syrjälä (67):
      drm/i915/fbc: Parametrize FBC register offsets
      drm/i915/fbc: Loop through FBC instances in various places
      drm/i915/fbc: Introduce device info fbc_mask
      drm/i915/fbc: Register per-crtc debugfs files
      drm: Always include the debugfs dentry in drm_crtc
      drm/i915/fbc: Remember to update FBC state even when not reallocating CFB
      drm/i915: Sipmplify PLANE_STRIDE masking
      drm/i915: Use REG_BIT() & co. for universal plane bits
      drm/i915: Clean up ivb+ sprite plane registers
      drm/i915: Clean up g4x+ sprite plane registers
      drm/i915: Clean up cursor registers
      drm/i915: Extract skl_plane_aux_dist()
      drm/i915: Declutter color key register stuff
      drm/i915: Nuke pointless middle men for skl+ plane programming
      drm/i915: Remove zombie async flip vt-d w/a
      drm/i915/bios: Introduce has_ddi_port_info()
      drm/i915/bios: Use i915->vbt.ports[] on CHV
      drm/i915/bios: Use i915->vbt.ports[] for all g4x+
      drm/i915/bios: Throw out the !has_ddi_port_info() codepaths
      drm/i915/bios: Nuke DEVICE_TYPE_DP_DUAL_MODE_BITS
      drm/i915/hdmi: Ignore DP++ TMDS clock limit for native HDMI ports
      drm/i915: Clean up vlv/chv sprite plane registers
      drm/i915: Clean up pre-skl primary plane registers
      drm/i915/hdmi: Clean up TMDS clock limit exceeding user mode handling
      drm/i915: Nuke dg2_ddi_pre_enable_dp()
      drm/i915: Introduce ilk_pch_pre_enable()
      drm/i915: Skip dsc readout if the transcoder is disabled
      drm/i915: Simplify intel_dsc_source_support()
      drm/i915: Use per-device debugs for bigjoiner stuff
      drm/i915: Extract hsw_configure_cpu_transcoder()
      drm/i915: Move dsc/joiner enable into hsw_crtc_enable()
      drm/i915: Fix up pixel_rate vs. clock confusion in wm calculations
      drm/i915: Use the correct plane source width in watermark calculations
      drm/i915: Use single_enabled_crtc() in i9xx_update_wm()
      drm/i915: Bump DSL linemask to 20 bits
      drm/i915: Clean up PIPEMISC register defines
      drm/i915: Clean up SKL_BOTTOM_COLOR defines
      drm/i915: Clean up PIPECONF bit defines
      drm/i915: Clean up PCH_TRANSCONF/TRANS_DP_CTL bit defines
      drm/i915: Clean up PIPESRC defines
      drm/i915: Extract intel_{get,set}_m_n()
      drm/i915: Clean up M/N register defines
      drm/i915: s/gmch_{m,n}/data_{m,n}/
      drm/i915: Move drrs hardware bit frobbing to small helpers
      drm/i915: Fix oops due to missing stack depot
      drm/i915: Enable rpm wakeref tracking whether runtime pm is enabled or not
      drm/i915: Nuke intel_dp_set_m_n()
      drm/i915: Nuke intel_dp_get_m_n()
      drm/i915: Nuke ilk_get_fdi_m_n_config()
      drm/i915: Split intel_cpu_transcoder_set_m_n() into M1/N1 vs. M2/N2 variants
      drm/i915: Split intel_cpu_transcoder_get_m_n() into M1/N1 vs. M2/N2 variants
      drm/i915: Pass crtc+cpu_transcoder to intel_cpu_transcoder_set_m_n()
      drm/i915: Move PCH transcoder M/N setup into the PCH code
      drm/i915: Move M/N setup to a more logical place on ddi platforms
      drm/i915: Extract {i9xx,ilk}_configure_cpu_transcoder()
      drm/i915: Disable DRRS on IVB/HSW port != A
      drm/i915: Extract can_enable_drrs()
      drm/i915: Fix transcoder_has_m2_n2()
      drm/i915: Clear DP M2/N2 when not doing DRRS
      drm/i915: Program pch transcoder m2/n2
      drm/i915: Dump dp_m2_n2 always
      drm/i915: Always check dp_m2_n2 on pre-bdw
      drm/i915: Document BDW+ DRRS M/N programming requirements
      drm/i915: s/GRAPHICS_VER/DISPLAY_VER/ where appropriate
      drm/i915: Allow !join_mbus cases for adlp+ dbuf configuration
      drm/i915: Populate pipe dbuf slices more accurately during readout
      drm/i915: Workaround broken BIOS DBUF configuration on TGL/RKL

Zhenyu Wang (1):
      drm/i915/gvt: Fix cmd parser error for Passmark9

 Documentation/driver-api/device-io.rst             |    9 +
 Documentation/driver-api/dma-buf.rst               |    9 -
 Documentation/gpu/todo.rst                         |   20 +-
 MAINTAINERS                                        |    9 +-
 arch/x86/kernel/early-quirks.c                     |    1 +
 drivers/dma-buf/dma-buf.c                          |   22 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   10 +-
 drivers/dma-buf/heaps/system_heap.c                |   10 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    8 +-
 drivers/gpu/drm/drm_cache.c                        |   18 +-
 drivers/gpu/drm/drm_client.c                       |    9 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   12 +-
 drivers/gpu/drm/drm_gem.c                          |   12 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |    9 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   16 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   15 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    4 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   25 +-
 drivers/gpu/drm/drm_internal.h                     |    6 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |    8 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/drm_prime.c                        |    4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    8 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |    4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    5 +-
 drivers/gpu/drm/i915/Makefile                      |    3 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   18 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |    2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  105 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    7 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    2 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    8 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |    1 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |    3 +
 drivers/gpu/drm/i915/display/intel_bios.c          |  215 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   14 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   65 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    9 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    1 +
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |  162 +
 drivers/gpu/drm/i915/display/intel_crt.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    1 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |   25 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  143 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   42 +-
 drivers/gpu/drm/i915/display/intel_de.h            |    1 -
 drivers/gpu/drm/i915/display/intel_display.c       |  571 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |   36 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   45 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    2 +-
 drivers/gpu/drm/i915/display/intel_display_trace.h |    1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   22 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   14 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  165 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    2 -
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    8 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |    4 -
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |    2 -
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   36 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   46 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |  115 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   29 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  238 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |    7 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    7 -
 drivers/gpu/drm/i915/display/intel_gmbus.h         |    1 -
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  100 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    6 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   14 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |  144 +-
 drivers/gpu/drm/i915/display/intel_lvds.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |   56 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |   10 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |    4 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   88 +-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |    8 +
 drivers/gpu/drm/i915/display/intel_pps.c           |   22 +-
 drivers/gpu/drm/i915/display/intel_sdvo.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   30 +-
 drivers/gpu/drm/i915/display/intel_snps_phy_regs.h |   75 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |   65 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_tc_phy_regs.h   |  280 ++
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   26 -
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    7 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    9 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  195 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    8 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.h         |   18 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.h        |   14 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    3 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |    3 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    6 +-
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |    6 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |    2 +
 drivers/gpu/drm/i915/gt/gen6_engine_cs.c           |    1 +
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |    2 +
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |    1 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    3 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |    1 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    4 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |  223 ++
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   10 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c          |    1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            | 1554 ++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c                |    1 +
 drivers/gpu/drm/i915/gt/intel_llc.c                |   10 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    2 +
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h            |   15 -
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   16 +-
 drivers/gpu/drm/i915/gt/intel_rc6.h                |    2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    1 +
 drivers/gpu/drm/i915/gt/intel_reset.c              |    4 +
 drivers/gpu/drm/i915/gt/intel_ring.c               |    1 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   12 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   10 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    3 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |    1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    8 +-
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |    2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |    1 +
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |    1 +
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    1 +
 drivers/gpu/drm/i915/gt/selftest_llc.c             |    5 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    6 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |    1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |    1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    1 +
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |    1 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    4 +-
 drivers/gpu/drm/i915/gvt/display.c                 |   17 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   19 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |    1 +
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |   49 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   70 +-
 drivers/gpu/drm/i915/gvt/gtt.h                     |    4 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |    2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   36 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |   11 +-
 drivers/gpu/drm/i915/gvt/interrupt.h               |    4 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |    3 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |    6 +-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |    2 +-
 drivers/gpu/drm/i915/gvt/reg.h                     |    1 -
 drivers/gpu/drm/i915/gvt/sched_policy.c            |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +
 drivers/gpu/drm/i915/gvt/scheduler.h               |    2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |    4 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |   76 +-
 drivers/gpu/drm/i915/i915_cmd_parser.h             |   26 +
 drivers/gpu/drm/i915/i915_debugfs.c                |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |    3 +
 drivers/gpu/drm/i915/i915_drv.h                    |   90 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    1 +
 drivers/gpu/drm/i915/i915_gem_evict.c              |    1 +
 drivers/gpu/drm/i915/i915_gem_evict.h              |   24 +
 drivers/gpu/drm/i915/i915_gem_gtt.c                |    1 +
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +
 drivers/gpu/drm/i915/i915_getparam.h               |   15 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |    2 +
 drivers/gpu/drm/i915/i915_ioc32.c                  |    1 +
 drivers/gpu/drm/i915/i915_ioctl.c                  |   94 +
 drivers/gpu/drm/i915/i915_ioctl.h                  |   14 +
 drivers/gpu/drm/i915/i915_irq.c                    |    8 +-
 drivers/gpu/drm/i915/i915_mm.h                     |    4 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   24 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  137 +-
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |  137 +
 drivers/gpu/drm/i915/i915_perf_types.h             |    2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    2 +
 drivers/gpu/drm/i915/i915_reg.h                    | 4102 +++-----------------
 drivers/gpu/drm/i915/i915_reg_defs.h               |  101 +
 drivers/gpu/drm/i915/i915_request.c                |    1 +
 drivers/gpu/drm/i915/i915_suspend.c                |    1 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |    1 +
 drivers/gpu/drm/i915/i915_utils.h                  |   15 -
 drivers/gpu/drm/i915/i915_vma.c                    |    3 +-
 drivers/gpu/drm/i915/intel_device_info.c           |   13 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    5 +-
 drivers/gpu/drm/i915/intel_dram.c                  |    7 +-
 drivers/gpu/drm/i915/intel_pci_config.h            |   85 +
 drivers/gpu/drm/i915/intel_pcode.c                 |   32 +-
 drivers/gpu/drm/i915/intel_pcode.h                 |   12 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  397 +-
 drivers/gpu/drm/i915/intel_pm.h                    |    2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    7 +-
 drivers/gpu/drm/i915/intel_sbi.c                   |    1 +
 drivers/gpu/drm/i915/intel_uncore.c                |   73 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |    1 +
 drivers/gpu/drm/i915/vlv_sideband.c                |    1 +
 drivers/gpu/drm/i915/vlv_sideband.h                |    2 +
 drivers/gpu/drm/i915/vlv_sideband_reg.h            |  180 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |    2 +
 drivers/gpu/drm/lima/lima_gem.c                    |    3 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |    7 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |    5 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |    4 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    4 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    6 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   13 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |    8 +-
 drivers/gpu/drm/qxl/qxl_draw.c                     |    6 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   10 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |    8 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |    4 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |    4 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    9 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |    5 +-
 drivers/gpu/drm/tegra/gem.c                        |   10 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    8 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    7 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   16 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   42 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |    8 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    3 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    4 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |    4 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    6 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |    2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |    7 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h            |    6 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |    8 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    9 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   11 +-
 drivers/misc/fastrpc.c                             |    4 +-
 include/drm/drm_cache.h                            |    6 +-
 include/drm/drm_client.h                           |    7 +-
 include/drm/drm_crtc.h                             |    2 -
 include/drm/drm_gem.h                              |    6 +-
 include/drm/drm_gem_atomic_helper.h                |    6 +-
 include/drm/drm_gem_cma_helper.h                   |    6 +-
 include/drm/drm_gem_framebuffer_helper.h           |    8 +-
 include/drm/drm_gem_shmem_helper.h                 |   12 +-
 include/drm/drm_gem_ttm_helper.h                   |    6 +-
 include/drm/drm_gem_vram_helper.h                  |    9 +-
 include/drm/drm_prime.h                            |    6 +-
 include/drm/i915_pciids.h                          |    6 +
 include/drm/ttm/ttm_bo_api.h                       |   10 +-
 include/drm/ttm/ttm_kmap_iter.h                    |   10 +-
 include/drm/ttm/ttm_resource.h                     |    6 +-
 include/linux/dma-buf-map.h                        |  266 --
 include/linux/dma-buf.h                            |   12 +-
 include/linux/iosys-map.h                          |  257 ++
 274 files changed, 6341 insertions(+), 6120 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_combo_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_tc_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_tiling.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_userptr.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_engine_regs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_regs.h
 create mode 100644 drivers/gpu/drm/i915/i915_cmd_parser.h
 create mode 100644 drivers/gpu/drm/i915/i915_gem_evict.h
 create mode 100644 drivers/gpu/drm/i915/i915_getparam.h
 create mode 100644 drivers/gpu/drm/i915/i915_ioctl.c
 create mode 100644 drivers/gpu/drm/i915/i915_ioctl.h
 create mode 100644 drivers/gpu/drm/i915/i915_perf_oa_regs.h
 create mode 100644 drivers/gpu/drm/i915/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/i915/intel_pci_config.h
 create mode 100644 drivers/gpu/drm/i915/vlv_sideband_reg.h
 delete mode 100644 include/linux/dma-buf-map.h
 create mode 100644 include/linux/iosys-map.h
