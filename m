Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5433A1F14
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731736EB8F;
	Wed,  9 Jun 2021 21:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFCF6EB8B;
 Wed,  9 Jun 2021 21:30:18 +0000 (UTC)
IronPort-SDR: GH5+gztCbymHGSyVnN5TeyDRzGvMCBGuhqbLL2lnYKjkOwJJJhoCGX/+IValN+Q0WjhWwlMBgq
 wkiodeLVZ8iQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="290803631"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="290803631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 14:30:06 -0700
IronPort-SDR: Cm4G1uFBRp/NJN/M7hhbQcEhYfIFQCBApQtpaIxxbRECwzZB/I0+9howBJTnounfqcwW9ga5Ny
 B3vh36WVaRzg==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="552116750"
Received: from akshayka-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.254.35.119])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 14:30:02 -0700
Date: Wed, 9 Jun 2021 17:30:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <YMEy2Ew82BeL/hDK@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes the last pull request towards 5.14.
Mostly it is ADL-P enabling related and a few other things.

drm-intel-next-2021-06-09:

Cross-subsystem Changes:

-  x86/gpu: add JasperLake to gen11 early quirks
  (Although the patch lacks the Ack info, it has been Acked by Borislav)

Driver Changes:

- General DMC improves (Anusha)
- More ADL-P enabling (Vandita, Matt, Jose, Mika, Anusha, Imre, Lucas, Jani, Manasi, Ville, Stanislav)
- Introduce MBUS relative dbuf offset (Ville)
- PSR fixes and improvements (Gwan, Jose, Ville)
- Re-enable LTTPR non-transparent LT mode for DPCD_REV < 1.4 (Ville)
- Remove duplicated declarations (Shaokun, Wan)
- Check HDMI sink deep color capabilities during .mode_valid (Ville)
- Fix display flicker screan related to console and FBC (Chris)
- Remaining conversions of GRAPHICS_VER (Lucas)
- Drop invalid FIXME (Jose)
- Fix bigjoiner check in dsc_disable (Vandita)

Thanks,
Rodrigo.

The following changes since commit 9a91e5e0af5e03940d0eec72c36364a1701de240:

  Merge tag 'amd-drm-next-5.14-2021-05-21' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-05-21 15:59:05 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-06-09

for you to fetch changes up to 0d6695b112762aa7aad28c46e65561389b6f50d6:

  drm/i915/adl_p: Same slices mask is not same Dbuf state (2021-06-09 17:24:58 +0300)

----------------------------------------------------------------
Cross-subsystem Changes:

-  x86/gpu: add JasperLake to gen11 early quirks
  (Although the patch lacks the Ack info, it has been Acked by Borislav)

Driver Changes:

- General DMC improves (Anusha)
- More ADL-P enabling (Vandita, Matt, Jose, Mika, Anusha, Imre, Lucas, Jani, Manasi, Ville, Stanislav)
- Introduce MBUS relative dbuf offset (Ville)
- PSR fixes and improvements (Gwan, Jose, Ville)
- Re-enable LTTPR non-transparent LT mode for DPCD_REV < 1.4 (Ville)
- Remove duplicated declarations (Shaokun, Wan)
- Check HDMI sink deep color capabilities during .mode_valid (Ville)
- Fix display flicker screan related to console and FBC (Chris)
- Remaining conversions of GRAPHICS_VER (Lucas)
- Drop invalid FIXME (Jose)
- Fix bigjoiner check in dsc_disable (Vandita)

----------------------------------------------------------------
Anusha Srivatsa (13):
      drm/i915/dmc: s/intel_csr/intel_dmc
      drm/i915/dmc: s/HAS_CSR/HAS_DMC
      drm/i915/dmc: Rename macro names containing csr
      drm/i915/dmc: Rename functions names having "csr"
      drm/i915/dmc: s/intel_csr.c/intel_dmc.c and s/intel_csr.h/intel_dmc.h
      drm/i915/adl_p: Setup ports/phys
      drm/i915/adl_p: Add PLL Support
      drm/i915/adlp: Add PIPE_MISC2 programming
      drm/i915/adl_p: Update memory bandwidth parameters
      drm/i915/gvt: Add missing macro name changes
      drm/i915/dmc: s/DRM_ERROR/drm_err
      drm/i915/dmc: Add intel_dmc_has_payload() helper
      drm/i915/dmc: Move struct intel_dmc to intel_dmc.h

Chris Wilson (1):
      drm/i915/display: relax 2big checking around initial fb

Gwan-gyeong Mun (4):
      drm/i915/display: Replace dc3co_enabled with dc3co_exitline on intel_psr struct
      drm/i915/display: Add PSR interrupt error check function
      drm/i915/display: Remove a redundant function argument from intel_psr_enable_source()
      drm/i915/display: Introduce new intel_psr_pause/resume function

Imre Deak (9):
      drm/i915/adl_p: Program DP/HDMI link rate to DDI_BUF_CTL
      drm/i915: Reenable LTTPR non-transparent LT mode for DPCD_REV<1.4
      drm/i915/adlp: Require DPT FB CCS color planes to be 2MB aligned
      drm/i915/adlp: Fix GEM VM asserts for DPT VMs
      drm/i915/debugfs: Print remap info for DPT VMAs as well
      drm/i915/adlp: Add missing TBT AUX -> PW#2 power domain dependencies
      drm/i915/ddi: Flush encoder power domain ref puts during driver unload
      drm/i915: Fix incorrect assert about pending power domain async-put work
      drm/i915/adlp: Fix AUX power well -> PHY mapping

Jani Nikula (1):
      drm/i915/adl_p: enable MSO on pipe B

José Roberto de Souza (10):
      drm/i915/adl_p: Implement TC sequences
      drm/i915/adl_p: Don't config MBUS and DBUF during display initialization
      drm/i915/display/adl_p: Drop earlier return in tc_has_modular_fia()
      drm/i915/adl_p: Handle TC cold
      drm/i915: WA for zero memory channel
      drm/i915/display/adl_p: Allow DC3CO in pipe and port B
      drm/i915/display/adl_p: Disable PSR2
      drm/i915/display: Fix fastsets involving PSR
      drm/i915/display: Allow fastsets when DP_SDP_VSC infoframe do not match with PSR enabled
      drm/i915/display: Drop FIXME about turn off infoframes

Lucas De Marchi (5):
      drm/i915/display: fix typo when returning table
      drm/i915/gvt: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915/display: replace IS_GEN() in commented code
      drm/i915: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915: Add remaining conversions to GRAPHICS_VER

Manasi Navare (2):
      drm/i915/xelpd: Add VRR guardband for VRR CTL
      drm/i915: Initialize the mbus_offset to fix Klockwork issue

Matt Roper (2):
      drm/i915/adl_p: Add dedicated SAGV watermarks
      drm/i915/xelpd: Enhanced pipe underrun reporting

Mika Kahola (2):
      drm/i915/adl_p: Tx escape clock with DSI
      drm/i915/adl_p: Define and use ADL-P specific DP translation tables

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Shaokun Zhang (1):
      drm/i915: Remove the repeated declaration

Stanislav Lisovskiy (2):
      drm/i915/adl_p: CDCLK crawl support for ADL
      drm/i915/adl_p: Same slices mask is not same Dbuf state

Tejas Upadhyay (1):
      x86/gpu: add JasperLake to gen11 early quirks

Vandita Kulkarni (5):
      drm/i915/xelpd: Calculate VDSC RC parameters
      drm/i915/xelpd: Add rc_qp_table for rcparams calculation
      drm/i915/adl_p: Add ddb allocation support
      drm/i915/adl_p: MBUS programming
      drm/i915/dsc: Fix bigjoiner check in dsc_disable

Ville Syrjälä (10):
      drm/i915: Introduce MBUS relative dbuf offsets
      drm/i915: Extract intel_hdmi_bpc_possible()
      drm/i915: Move has_hdmi_sink check into intel_hdmi_bpc_possible()
      drm/i915: Move platform checks into intel_hdmi_bpc_possible()
      drm/i915: Check sink deep color capabilitis during HDMI .mode_valid()
      drm/i915: Move the TMDS clock division into intel_hdmi_mode_clock_valid()
      drm/i915: Drop redundant has_hdmi_sink check
      drm/i915/adl_p: Disable FIFO underrun recovery
      drm/i915/adl_p: Implement Wa_22012358565
      drm/i915: Disable PSR around cdclk changes

Wan Jiabing (1):
      drm/i915/display: remove duplicated argument

 Documentation/gpu/i915.rst                         |  12 +-
 arch/x86/kernel/early-quirks.c                     |   1 +
 drivers/gpu/drm/i915/Makefile                      |   3 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  21 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |  20 ++
 drivers/gpu/drm/i915/display/intel_atomic.h        |   1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |   4 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  85 ++++-
 drivers/gpu/drm/i915/display/intel_csr.h           |  21 --
 drivers/gpu/drm/i915/display/intel_cursor.c        |   4 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |  53 ++-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  53 +++
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |   4 +
 drivers/gpu/drm/i915/display/intel_display.c       | 143 +++++++-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  30 +-
 drivers/gpu/drm/i915/display/intel_display_power.c | 139 ++++----
 drivers/gpu/drm/i915/display/intel_display_types.h |   5 +-
 .../drm/i915/display/{intel_csr.c => intel_dmc.c}  | 386 +++++++++++----------
 drivers/gpu/drm/i915/display/intel_dmc.h           |  43 +++
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  71 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  69 +++-
 drivers/gpu/drm/i915/display/intel_fb.c            |  13 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  57 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 104 +++---
 drivers/gpu/drm/i915/display/intel_psr.c           | 187 +++++++---
 drivers/gpu/drm/i915/display/intel_psr.h           |   2 +
 drivers/gpu/drm/i915/display/intel_qp_tables.c     | 309 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_qp_tables.h     |  14 +
 drivers/gpu/drm/i915/display/intel_tc.c            | 152 +++++++-
 drivers/gpu/drm/i915/display/intel_tc.h            |   2 +
 drivers/gpu/drm/i915/display/intel_tv.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          | 117 ++++++-
 drivers/gpu/drm/i915/display/intel_vrr.c           |  58 +++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  27 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   3 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |  10 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  14 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |   2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |  10 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   4 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   4 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |  10 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  47 ++-
 drivers/gpu/drm/i915/i915_drv.c                    |  28 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  64 ++--
 drivers/gpu/drm/i915/i915_gem.c                    |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  92 ++---
 drivers/gpu/drm/i915/i915_irq.c                    |  53 +--
 drivers/gpu/drm/i915/i915_irq.h                    |   1 +
 drivers/gpu/drm/i915/i915_pci.c                    |   5 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  44 +--
 drivers/gpu/drm/i915/i915_pmu.c                    |   8 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 200 ++++++++---
 drivers/gpu/drm/i915/i915_request.c                |   4 +-
 drivers/gpu/drm/i915/i915_suspend.c                |  16 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |   2 +-
 drivers/gpu/drm/i915/i915_vgpu.c                   |   2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   2 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   7 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  24 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   4 +-
 drivers/gpu/drm/i915/intel_dram.c                  |  14 +-
 drivers/gpu/drm/i915/intel_pch.c                   |  10 +-
 drivers/gpu/drm/i915/intel_pm.c                    | 323 +++++++++++++++--
 drivers/gpu/drm/i915/intel_pm.h                    |   4 +-
 drivers/gpu/drm/i915/intel_sideband.c              |   2 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  24 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |  10 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   4 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   6 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   8 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |  12 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   2 +-
 76 files changed, 2421 insertions(+), 888 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_csr.h
 rename drivers/gpu/drm/i915/display/{intel_csr.c => intel_dmc.c} (61%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_qp_tables.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_qp_tables.h
