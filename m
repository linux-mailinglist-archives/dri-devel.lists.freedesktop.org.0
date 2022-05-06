Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80051D5ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73E010E610;
	Fri,  6 May 2022 10:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7BC10E3C5;
 Fri,  6 May 2022 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651834075; x=1683370075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WqY9wF3bMNY5xIVmgo7uuoJB+26mJkKxqmPlLyai1Mc=;
 b=ZS/a0GtBRqmaUJdD9cBQC14zmmOIIrRslmfIznSVjq8AkptkaOUBM4Ms
 xJ3SxPPL9TPnrbp6Tbh+/UeeHgmIWlhZDqdtbsEbnUBmtAOCCOFkgx8Aw
 vNU6blX6Xywiw2Vcld20L347Vimb42mzuhCtHd0/xbnY9Hef+/309QDki
 bLCSQM/mJnFuoYDemsmTpjfqD/s0kIr+9OP6SutWlHoPXIq4HNpcs2jrA
 rxeRF2UoREPjhsjD4CmWOXIZ3gsWXcxhtR+anBfgz7MRlHqSAqoVUN4Hp
 bT9yi9w9SwTnc/m3ox1q7MxF4ovUsdd9nFCeJ7WZrWKqEd3//wJ+r5Rs8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268038371"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268038371"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:47:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585920966"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:47:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 06 May 2022 13:47:47 +0300
Message-ID: <87bkwbkkdo.fsf@intel.com>
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
 dim-tools@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-next-2022-05-06:
drm/i915 feature pull #2 for v5.19:

Features and functionality:
- Add first set of DG2 PCI IDs for "motherboard down" designs (Matt Roper)
- Add initial RPL-P PCI IDs as ADL-P subplatform (Matt Atwood)

Refactoring and cleanups:
- Power well refactoring and cleanup (Imre)
- GVT-g refactor and mdev API cleanup (Christoph, Jason, Zhi)
- DPLL refactoring and cleanup (Ville)
- VBT panel specific data parsing cleanup (Ville)
- Use drm_mode_init() for on-stack modes (Ville)

Fixes:
- Fix PSR state pipe A/B confusion by clearing more state on disable (Jos=
=C3=A9)
- Fix FIFO underruns caused by not taking DRAM channel into account (Vinod)
- Fix FBC flicker on display 11+ by enabling a workaround (Jos=C3=A9)
- Fix VBT seamless DRRS min refresh rate check (Ville)
- Fix panel type assumption on bogus VBT data (Ville)
- Fix panel data parsing for VBT that misses panel data pointers block (Vil=
le)
- Fix spurious AUX timeout/hotplug handling on LTTPR links (Imre)

Merges:
- Backmerge drm-next (Jani)
- GVT changes (Jani)

BR,
Jani.

The following changes since commit 19df0cfa258cd42f7f106f6085f1e625f26283db:

  Merge tag 'drm-misc-next-2022-04-21' of git://anongit.freedesktop.org/drm=
/drm-misc into drm-next (2022-04-22 11:15:30 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2022-05-06

for you to fetch changes up to 949665a6e237a6fd49ff207e3876d71b20b7e9f2:

  drm/i915: Respect VBT seamless DRRS min refresh rate (2022-05-05 18:27:53=
 +0300)

----------------------------------------------------------------
drm/i915 feature pull #2 for v5.19:

Features and functionality:
- Add first set of DG2 PCI IDs for "motherboard down" designs (Matt Roper)
- Add initial RPL-P PCI IDs as ADL-P subplatform (Matt Atwood)

Refactoring and cleanups:
- Power well refactoring and cleanup (Imre)
- GVT-g refactor and mdev API cleanup (Christoph, Jason, Zhi)
- DPLL refactoring and cleanup (Ville)
- VBT panel specific data parsing cleanup (Ville)
- Use drm_mode_init() for on-stack modes (Ville)

Fixes:
- Fix PSR state pipe A/B confusion by clearing more state on disable (Jos=
=C3=A9)
- Fix FIFO underruns caused by not taking DRAM channel into account (Vinod)
- Fix FBC flicker on display 11+ by enabling a workaround (Jos=C3=A9)
- Fix VBT seamless DRRS min refresh rate check (Ville)
- Fix panel type assumption on bogus VBT data (Ville)
- Fix panel data parsing for VBT that misses panel data pointers block (Vil=
le)
- Fix spurious AUX timeout/hotplug handling on LTTPR links (Imre)

Merges:
- Backmerge drm-next (Jani)
- GVT changes (Jani)

----------------------------------------------------------------
Christoph Hellwig (27):
      drm/i915/gvt: remove module refcounting in intel_gvt_{,un}register_hy=
pervisor
      drm/i915/gvt: remove enum hypervisor_type
      drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
      drm/i915/gvt: move the gvt code into kvmgt.ko
      drm/i915/gvt: remove intel_gvt_ops
      drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
      drm/i915/gvt: remove the unused from_virt_to_mfn op
      drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
      drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
      drm/i915/gvt: remove vgpu->handle
      drm/i915/gvt: devirtualize ->{read,write}_gpa
      drm/i915/gvt: devirtualize ->{get,put}_vfio_device
      drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
      drm/i915/gvt: devirtualize ->detach_vgpu
      drm/i915/gvt: devirtualize ->inject_msi
      drm/i915/gvt: devirtualize ->is_valid_gfn
      drm/i915/gvt: devirtualize ->gfn_to_mfn
      drm/i915/gvt: devirtualize ->{enable,disable}_page_track
      drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
      drm/i915/gvt: devirtualize dma_pin_guest_page
      drm/i915/gvt: remove struct intel_gvt_mpt
      drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
      drm/i915/gvt: streamline intel_vgpu_create
      drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write helpers
      drm/i915/gvt: remove kvmgt_guest_{init,exit}
      drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
      drm/i915/gvt: merge gvt.c into kvmgvt.c

Hans de Goede (1):
      drm/i915: Fix DISP_POS_Y and DISP_HEIGHT defines

Imre Deak (21):
      drm/i915: Move per-platform power well hooks to intel_display_power_w=
ell.c
      drm/i915: Unexport the for_each_power_well() macros
      drm/i915: Move the power domain->well mappings to intel_display_power=
_map.c
      drm/i915: Move the dg2 fixed_enable_delay power well param to a commo=
n bitfield
      drm/i915: Move the HSW power well flags to a common bitfield
      drm/i915: Rename the power domain names to end with pipes/ports
      drm/i915: Sanitize the power well names
      drm/i915: Convert the power well descriptor domain mask to an array o=
f domains
      drm/i915: Convert the u64 power well domains mask to a bitmap
      drm/i915: Simplify power well definitions by adding power well instan=
ces
      drm/i915: Allow platforms to share power well descriptors
      drm/i915: Simplify the DG1 power well descriptors
      drm/i915: Sanitize the ADL-S power well definition
      drm/i915: Sanitize the port -> DDI/AUX power domain mapping for each =
platform
      drm/i915: Remove the aliasing of power domain enum values
      drm/i915: Remove the ICL specific TBT power domains
      drm/i915: Remove duplicate DDI/AUX power domain mappings
      drm/i915: Remove the XELPD specific AUX and DDI power domains
      drm/i915: Fixup merge of the power well refactor patchset
      drm/i915: Fix SEL_FETCH_PLANE_*(PIPE_B+) register addresses
      drm/i915/dp: Add workaround for spurious AUX timeouts/hotplugs on LTT=
PR links

Jani Nikula (8):
      drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
      drm/i915/gvt: better align the Makefile with i915 Makefile
      Merge tag 'gvt-next-2022-04-21-for-christoph' of https://github.com/i=
ntel/gvt-linux into drm-intel-next
      Merge tag 'gvt-next-2022-04-26' of https://github.com/intel/gvt-linux=
 into drm-intel-next
      Merge drm/drm-next into drm-intel-next
      Merge tag 'gvt-next-2022-04-29' of https://github.com/intel/gvt-linux=
 into drm-intel-next
      drm/i915: move tons of power well initializers to rodata
      drm/i915: warn about missing ->get_buf_trans initialization

Jason Gunthorpe (5):
      vfio/mdev: Remove vfio_mdev.c
      vfio/mdev: Remove mdev_parent_ops dev_attr_groups
      vfio/mdev: Remove mdev_parent_ops
      vfio/mdev: Use the driver core to create the 'remove' file
      vfio/mdev: Remove mdev drvdata

Jos=C3=A9 Roberto de Souza (3):
      drm/i915/display/psr: Unset enable_psr2_sel_fetch if other checks in =
intel_psr2_config_valid() fails
      drm/i915/display/psr: Clear more PSR state during disable
      drm/i915/display: Add workaround 22014263786

Jouni H=C3=B6gander (1):
      drm/i915: Check EDID for HDR static metadata when choosing blc

Matt Atwood (1):
      drm/i915/rpl-p: Add PCI IDs

Matt Roper (1):
      drm/i915: Add first set of DG2 PCI IDs

Ville Syrj=C3=A4l=C3=A4 (22):
      drm/i915: Program i830 DPLL FP register later
      drm/i915/fbc: Consult hw.crtc instead of uapi.crtc
      drm/i915/fbc: s/false/0/
      drm/i915: Make .get_dplls() return int
      drm/i915: Pass dev_priv to intel_shared_dpll_init()
      drm/i915: Remove pointless dpll_funcs checks
      drm/i915: Adjust .crtc_compute_clock() calling convention
      drm/i915: Move stuff into intel_dpll_crtc_compute_clock()
      drm/i915: Move the dpll_hw_state clearing to intel_dpll_crtc_compute_=
clock()
      drm/i915: Clear the dpll_hw_state when disabling a pipe
      drm/i915: Split out dg2_crtc_compute_clock()
      drm/i915: Add crtc .crtc_get_shared_dpll()
      drm/i915: Use drm_mode_init() for on-stack modes
      drm/i915/bios: Reorder panel DTD parsing
      drm/i915/bios: Generate LFP data table pointers if the VBT lacks them
      drm/i915/bios: Get access to the tail end of the LFP data block
      drm/i915/bios: Document the mess around the LFP data tables
      drm/i915/bios: Assume panel_type=3D=3D0 if the VBT has bogus data
      drm/i915/bios: Extract get_panel_type()
      drm/i915/bios: Refactor panel_type code
      drm/i915/bios: Parse the seamless DRRS min refresh rate
      drm/i915: Respect VBT seamless DRRS min refresh rate

Vinod Govindapillai (1):
      drm/i915: program wm blocks to at least blocks required per line

Wan Jiabing (1):
      i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers

Zhi Wang (6):
      i915/gvt: Separate the MMIO tracking table from GVT-g
      i915/gvt: Save the initial HW state snapshot in i915
      i915/gvt: Use the initial HW state snapshot saved in i915
      drm/i915/gvt: Add missing symbol export.
      drm/i915/gvt: Make intel_gvt_match_device() static
      drm/i915/gvt: Fix the compiling error when CONFIG_DRM_I915_DEBUG_RUNT=
IME_PM=3Dn

 Documentation/driver-api/vfio-mediated-device.rst  |   27 +-
 arch/x86/kernel/early-quirks.c                     |    1 +
 drivers/gpu/drm/i915/Kconfig                       |   36 +-
 drivers/gpu/drm/i915/Makefile                      |    9 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    3 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    3 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    8 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  345 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |    4 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  176 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c | 5283 +++-------------=
----
 drivers/gpu/drm/i915/display/intel_display_power.h |  126 +-
 .../gpu/drm/i915/display/intel_display_power_map.c | 1501 ++++++
 .../gpu/drm/i915/display/intel_display_power_map.h |   14 +
 .../drm/i915/display/intel_display_power_well.c    | 1813 ++++++-
 .../drm/i915/display/intel_display_power_well.h    |  132 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   34 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   33 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |    1 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |  196 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    6 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  268 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    9 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   19 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   10 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    1 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   41 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   24 +-
 drivers/gpu/drm/i915/gvt/Makefile                  |   30 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |   89 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    4 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   36 +-
 drivers/gpu/drm/i915/gvt/execlist.c                |   12 +-
 drivers/gpu/drm/i915/gvt/firmware.c                |   25 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   55 +-
 drivers/gpu/drm/i915/gvt/gvt.c                     |  340 --
 drivers/gpu/drm/i915/gvt/gvt.h                     |  128 +-
 drivers/gpu/drm/i915/gvt/handlers.c                | 1035 +---
 drivers/gpu/drm/i915/gvt/hypercall.h               |   82 -
 drivers/gpu/drm/i915/gvt/interrupt.c               |   40 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   | 1097 ++--
 drivers/gpu/drm/i915/gvt/mmio.c                    |    4 +-
 drivers/gpu/drm/i915/gvt/mmio.h                    |    1 -
 drivers/gpu/drm/i915/gvt/mpt.h                     |  400 --
 drivers/gpu/drm/i915/gvt/opregion.c                |  148 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |    8 +-
 drivers/gpu/drm/i915/gvt/reg.h                     |    9 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   37 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |    2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   22 +-
 drivers/gpu/drm/i915/i915_driver.c                 |    7 -
 drivers/gpu/drm/i915/i915_drv.h                    |    8 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    3 +-
 drivers/gpu/drm/i915/i915_reg.h                    |    7 +-
 drivers/gpu/drm/i915/intel_device_info.c           |   30 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   11 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |  252 +-
 drivers/gpu/drm/i915/intel_gvt.h                   |   32 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        | 1292 +++++
 drivers/gpu/drm/i915/intel_pm.c                    |   19 +
 drivers/s390/cio/vfio_ccw_ops.c                    |    7 +-
 drivers/s390/crypto/vfio_ap_ops.c                  |    9 +-
 drivers/vfio/mdev/Makefile                         |    2 +-
 drivers/vfio/mdev/mdev_core.c                      |   52 +-
 drivers/vfio/mdev/mdev_driver.c                    |   10 -
 drivers/vfio/mdev/mdev_private.h                   |    6 +-
 drivers/vfio/mdev/mdev_sysfs.c                     |   37 +-
 drivers/vfio/mdev/vfio_mdev.c                      |  152 -
 include/drm/i915_pciids.h                          |   31 +
 include/linux/mdev.h                               |   82 +-
 samples/vfio-mdev/mbochs.c                         |    9 +-
 samples/vfio-mdev/mdpy.c                           |    9 +-
 samples/vfio-mdev/mtty.c                           |   39 +-
 76 files changed, 7587 insertions(+), 8261 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_map.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_map.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
 delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c

--=20
Jani Nikula, Intel Open Source Graphics Center
