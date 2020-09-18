Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F289270342
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 19:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8836ED58;
	Fri, 18 Sep 2020 17:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCAB6ED43;
 Fri, 18 Sep 2020 17:28:01 +0000 (UTC)
IronPort-SDR: 7tKae1Wj2mqqyQ5lfLRALjyyex//wOR39T1mC9tGfLdWlrg36yN9tWezsY0Q3ptpEOgmeXpbue
 TRkkFzULEHTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="244835192"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="244835192"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 10:27:57 -0700
IronPort-SDR: ewozS15Z9Yhg451n2EgeCUC4fqwCE3v+R+8SnxCAESsA+6I0jDTMVBHXUwgApXAoQcmcfMBfE+
 AetwKhDJbuxQ==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="484288019"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 10:27:57 -0700
Date: Fri, 18 Sep 2020 13:30:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <20200918173013.GA748558@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here goes our last pull request targeting 5.10.

drm-intel-next-2020-09-17:
Driver Changes:

- Reduce INTEL_DISPLAY_ENABLED to just removed outputs treating it as disco=
nnected (Ville)
- Introducing new AUX, DVO, and TC ports and refactoring code around hot pl=
ug interrupts for those. (Ville)
- Centralize PLL_ENABLE register lookup (Anusha)
- Improvements around DP downstream facing ports (DFP). (Ville)
- Enable YCbCr 444->420 conversion for HDMI DFPs. Ville
- Remove the old global state on Display's atomic modeset (Ville)
- Nuke force_min_cdclk_changed (Ville)
- Extend a TGL W/A to all SKUs and to RKL (Swathi)
drm-intel-next-2020-09-14-1:
GVT changes:

- Cleanup command access flag (Yan)
- New workaround cmd access fix (Colin)
- MIA reset state fix (Colin)

Cross-subsystem Changes:

- ACPI / LPSS: Cherry Trail PWM controller fixes for suspend/resume. (Hans)
- pwm lpss: changes for remove suspend/resume handers. (Hans)
- pwm crc: Fixes for better handling of pwm crcs. (Hans)

Driver Changes:

- HDCP improvements (Anshuman)
- Gen12 W/A addition and fixes (Clint, Jose)
- Spelling fixes (Colin)
- DRRS improvements (Jose)
- EHL and TGL voltage swing table fixes (Jose)
- Fix on returns and errors handling (Nathan)
- TGL PCI ID split for perf queries (Lionel)
- HDCP refactor with the addition of 1.4 support for MST connectors (Sean)
- Fix GLK display audio regression (Kai)
- More display refactor for better split away from gem (Jani)
- Honor the VBT PWM values for better backlight handling. (Hans)
- Disable all display features when no display and other changes around it =
(Jani)
- Some code clean up removing unused stuff (Ville)
- Some g4x+ changes for better sprite upscaling and color format (Ville)
drm-intel-next-2020-09-14:
UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
The following changes since commit 166774a2c2c6b82da5d984f587567071ff00c1f3:

  drm/i915: Fix slightly botched merge in __reloc_entry_gpu (2020-09-10 15:=
19:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2020-09-17

for you to fetch changes up to 8fea92536e3efff14fa4cde7ed37c595b40a52b5:

  drm/i915: Update DRIVER_DATE to 20200917 (2020-09-17 16:43:57 -0400)

----------------------------------------------------------------
Driver Changes:

- Reduce INTEL_DISPLAY_ENABLED to just removed outputs treating it as disco=
nnected (Ville)
- Introducing new AUX, DVO, and TC ports and refactoring code around hot pl=
ug interrupts for those. (Ville)
- Centralize PLL_ENABLE register lookup (Anusha)
- Improvements around DP downstream facing ports (DFP). (Ville)
- Enable YCbCr 444->420 conversion for HDMI DFPs. Ville
- Remove the old global state on Display's atomic modeset (Ville)
- Nuke force_min_cdclk_changed (Ville)
- Extend a TGL W/A to all SKUs and to RKL (Swathi)

----------------------------------------------------------------
Anshuman Gupta (2):
      drm/i915/hdcp: Add update_pipe early return
      drm/i915/hdcp: No direct access to power_well desc

Anusha Srivatsa (1):
      drm/i915/pll: Centralize PLL_ENABLE register lookup

Chris Wilson (2):
      drm/i915: Initialise outparam for error return from wait_for_register
      drm/i915/selftests: Push the fake iommu device from the stack to data

Clint Taylor (1):
      drm/i915/gt: Implement WA_1406941453

Colin Ian King (1):
      drm/i915/vlv_dsi_pll: fix spelling mistake "Cant" -> "Can't"

Colin Xu (2):
      drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO access
      drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET

Hans de Goede (17):
      ACPI / LPSS: Resume Cherry Trail PWM controller in no-irq phase
      ACPI / LPSS: Save Cherry Trail PWM ctx registers only once (at activa=
tion)
      pwm: lpss: Fix off by one error in base_unit math in pwm_lpss_prepare=
()
      pwm: lpss: Add range limit check for the base_unit register value
      pwm: lpss: Add pwm_lpss_prepare_enable() helper
      pwm: lpss: Make pwm_lpss_apply() not rely on existing hardware state
      pwm: lpss: Remove suspend/resume handlers
      pwm: crc: Fix period / duty_cycle times being off by a factor of 256
      pwm: crc: Fix off-by-one error in the clock-divider calculations
      pwm: crc: Fix period changes not having any effect
      pwm: crc: Enable/disable PWM output on enable/disable
      pwm: crc: Implement apply() method to support the new atomic PWM API
      pwm: crc: Implement get_state() method
      drm/i915: panel: Add get_vbt_pwm_freq() helper
      drm/i915: panel: Honor the VBT PWM frequency for devs with an externa=
l PWM controller
      drm/i915: panel: Honor the VBT PWM min setting for devs with an exter=
nal PWM controller
      drm/i915: panel: Use atomic PWM API for devs with an external PWM con=
troller

Jani Nikula (7):
      drm/i915: split intel_modeset_init() pre/post gem init
      drm/i915: move more display related probe to intel_modeset_init_noirq=
()
      drm/i915: split out intel_modeset_driver_remove_nogem() and simplify
      drm/i915: remove the extra modeset init layer
      drm/i915: disable all display features when no display
      drm/i915: move gen4 GCDGMBUS save/restore to display save/restore
      drm/i915: move gmbus restore to i915_restore_display

Jos=E9 Roberto de Souza (7):
      drm/i915/display: Compute has_drrs after compute has_psr
      drm/i915/display: Disable DRRS when needed in fastsets
      drm/i915/display: Fix DRRS debugfs
      drm/i915/tgl: Fix stepping WA matching
      drm/i915/display/tgl: Use TGL DP tables for eDP ports without low pow=
er support
      drm/i915/display/ehl: Use EHL DP tables for eDP ports without low pow=
er support
      drm/i915/ehl: Update voltage swing table

Kai Vehmanen (1):
      drm/i915: fix regression leading to display audio probe failure on GLK

Lionel Landwerlin (1):
      drm/i915: break TGL pci-ids in GT 1 & 2

Nathan Chancellor (1):
      drm/i915/display: Ensure that ret is always initialized in icl_combo_=
phy_verify_state

Rodrigo Vivi (5):
      Merge drm/drm-next into drm-intel-next-queued
      Merge tag 'gvt-next-2020-09-10' of https://github.com/intel/gvt-linux=
 into drm-intel-next-queued
      drm/i915: Update DRIVER_DATE to 20200914
      drm/i915: Update DRIVER_DATE to 20200914
      drm/i915: Update DRIVER_DATE to 20200917

Sean Paul (17):
      drm/i915: Fix sha_text population code
      drm/i915: Clear the repeater bit on HDCP disable
      drm/i915: WARN if HDCP signalling is enabled upon disable
      drm/i915: Intercept Aksv writes in the aux hooks
      drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP signall=
ing
      drm/i915: Factor out hdcp->value assignments
      drm/i915: Protect workers against disappearing connectors
      drm/i915: Clean up intel_hdcp_disable
      drm/i915: Don't fully disable HDCP on a port if multiple pipes are us=
ing it
      drm/i915: Support DP MST in enc_to_dig_port() function
      drm/i915: Use ddi_update_pipe in intel_dp_mst
      drm/i915: Factor out HDCP shim functions from dp for use by dp_mst
      drm/i915: Plumb port through hdcp init
      drm/i915: Add connector to hdcp_shim->check_link()
      drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST sideband =
message
      drm/i915: Print HDCP version info for all connectors
      drm/i915: Add HDCP 1.4 support for MST connectors

Swathi Dhanavanthri (1):
      drm/i915/tgl, rkl: Make Wa_1606700617/22010271021 permanent

Ville Syrj=E4l=E4 (41):
      drm/i915: Nuke dpio_phy_iosf_port[]
      drm/i915: Kill unused savePCH_PORT_HOTPLUG
      drm/i915: Nuke the magic FBC_CONTROL save/restore
      drm/i915: Nuke MI_ARB_STATE save/restore
      drm/i915: Nuke CACHE_MODE_0 save/restore
      drm/i915: Fix g4x+ sprite dotclock limit for upscaling
      drm/i915: Use fb->format->is_yuv for the g4x+ sprite RGB vs. YUV check
      drm/i915: Reduce INTEL_DISPLAY_ENABLED to just removing the outputs
      drm/i915: Reduce INTEL_DISPLAY_ENABLED to just treat outputs as disco=
nnected
      drm/i915: Add more AUX CHs to the enum
      drm/i915: Add PORT_{H,I} to intel_port_to_power_domain()
      drm/i915: Add AUX_CH_{H,I} power domain handling
      drm/i915: Add VBT DVO ports H and I
      drm/i915: Add VBT AUX CH H and I
      drm/i915: Nuke the redundant TC/TBT HPD bit defines
      drm/i915: Configure GEN11_{TBT,TC}_HOTPLUG_CTL for ports TC5/6
      drm/i915: Split icp_hpd_detection_setup() into ddi vs. tc parts
      drm/i915: Move hpd_pin setup to encoder init
      drm/i915: Introduce HPD_PORT_TC<n>
      drm/i915: Introduce intel_hpd_hotplug_irqs()
      drm/i915: Nuke pointless variable
      drm/dp: Dump downstream facing port caps
      drm/i915/lspcon: Do not send infoframes to non-HDMI sinks
      drm/dp: Define protocol converter DPCD registers
      drm/dp: Define more downstream facing port caps
      drm/i915: Reworkd DFP max bpc handling
      drm/dp: Add helpers to identify downstream facing port types
      drm/dp: Pimp drm_dp_downstream_max_bpc()
      drm/dp: Redo drm_dp_downstream_max_clock() as drm_dp_downstream_max_d=
otclock()
      drm/i915: Reworkd DP DFP clock handling
      drm/dp: Add drm_dp_downstream_{min,max}_tmds_clock()
      drm/i915: Deal with TMDS DFP clock limits
      drm/i915: Configure DP 1.3+ protocol converted HDMI mode
      drm/dp: Add drm_dp_downstream_mode()
      drm/i915: Handle downstream facing ports w/o EDID
      drm/i915: Extract intel_hdmi_has_audio()
      drm/i915: DP->HDMI TMDS clock limits vs. deep color
      drm/dp: Add helpers for DFP YCbCr 4:2:0 handling
      drm/i915: Do YCbCr 444->420 conversion via DP protocol converters
      drm/i915: Remove the old global state stuff
      drm/i915: Nuke force_min_cdclk_changed

Yan Zhao (4):
      drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
      drm/i915/gvt: remove flag F_CMD_ACCESSED
      drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
      drm/i915/gvt: remove F_CMD_ACCESS flag for some registers

 drivers/acpi/acpi_lpss.c                           |   22 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  394 ++++++-
 drivers/gpu/drm/drm_dp_mst_topology.c              |  150 +++
 drivers/gpu/drm/drm_edid.c                         |   28 +
 drivers/gpu/drm/i915/Makefile                      |    1 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |    1 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |   39 -
 drivers/gpu/drm/i915/display/intel_atomic.h        |    4 -
 drivers/gpu/drm/i915/display/intel_audio.c         |    5 -
 drivers/gpu/drm/i915/display/intel_bios.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    1 -
 drivers/gpu/drm/i915/display/intel_crt.c           |    3 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  190 +++-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    2 +
 drivers/gpu/drm/i915/display/intel_display.c       |  134 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |    6 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   36 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   48 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 1078 +++++++---------=
----
 drivers/gpu/drm/i915/display/intel_dp.h            |   12 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  703 +++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   23 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   35 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    6 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  208 ++--
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  117 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    2 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   28 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    8 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  106 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |    2 +
 drivers/gpu/drm/i915/display/intel_psr.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    9 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    3 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   10 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    1 +
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   35 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    6 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |   44 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   32 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |    3 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |    2 +-
 drivers/gpu/drm/i915/i915_drv.c                    |  155 +--
 drivers/gpu/drm/i915/i915_drv.h                    |   66 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  227 ++---
 drivers/gpu/drm/i915/i915_reg.h                    |   38 +-
 drivers/gpu/drm/i915/i915_suspend.c                |   46 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    8 +
 drivers/gpu/drm/i915/intel_pm.c                    |    2 +-
 drivers/gpu/drm/i915/intel_sideband.c              |   16 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    3 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   12 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |    4 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |   17 +
 drivers/pwm/pwm-crc.c                              |  128 ++-
 drivers/pwm/pwm-lpss-platform.c                    |    1 -
 drivers/pwm/pwm-lpss.c                             |   85 +-
 drivers/pwm/pwm-lpss.h                             |    3 -
 include/drm/drm_dp_helper.h                        |   66 +-
 include/drm/drm_dp_mst_helper.h                    |   44 +
 include/drm/drm_edid.h                             |    4 +
 include/drm/i915_pciids.h                          |   14 +-
 69 files changed, 2861 insertions(+), 1648 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
