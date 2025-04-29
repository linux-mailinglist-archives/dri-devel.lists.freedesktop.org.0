Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B971CAA0BE9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4772D10E45D;
	Tue, 29 Apr 2025 12:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj6zyorL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E829410E43E;
 Tue, 29 Apr 2025 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745930691; x=1777466691;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=TFBgqpNo87pwBswgll50qm2YXeIt01N0rcwXDWLET+0=;
 b=Pj6zyorLrUZppWK1dTa7bDmUDpilWQbMWNPA0fdIK9vahFT4jy8fCD8v
 GQZ9+JsNT73b8BrN3UxxB0figAkjWkKQRjTEjlYsLB8Vv4nSoh+uU8RjR
 CPDnTKrpzArS4OKnjNLllgzkPWHuzdx1fImX5XTY9dPaqIiy8W8b+2kwt
 vuu60E8a1gnpnuFVEVk6xtenLuS8UDo9uK1jPwAqN640tvOasIYWwipt2
 ArLfmatQa6LITi29vdvavl/2nbkbOIhm9Ha1Crxqe/SsmajydPsMLt1zA
 EWC/BKzsd+ZkCOX72sGcCcghf1y1MSewuGWVre94aQnqCCWOrpcYf1axI A==;
X-CSE-ConnectionGUID: RfFkdwQORdibknIJaXA+JQ==
X-CSE-MsgGUID: 0SG4/F2ITTK646a2jglH3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65086516"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="65086516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 05:44:44 -0700
X-CSE-ConnectionGUID: JnkTyKJlSGSw9HF498fJKg==
X-CSE-MsgGUID: qQYG9gzMRpmTt617I9QW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="133527842"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.231])
 ([10.245.244.231])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 05:44:39 -0700
Message-ID: <e2a958d9-e506-4962-8bae-0dbf2ecc000f@linux.intel.com>
Date: Tue, 29 Apr 2025 14:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

A bit late, but here's the drm-misc-next pull request.

Best regards,
~Maarten

drm-misc-next-2025-04-29:
drm-misc-next for v6.16-rc1:

UAPI Changes:
- panthor now fails in mmap_offset call for a BO created with
  DRM_PANTHOR_BO_NO_MMAP.
- Add DRM_PANTHOR_BO_SET_LABEL ioctl and label panthor kernel BOs.

Cross-subsystem Changes:
- Add kmap_local_page_try_from_panic for drm/panic.
- Add DT bindings for panels.
- Update DT bindings for imagination.
- Extend %p4cc in lib/vsprintf.c to support fourcc printing.

Core Changes:
- Remove the disgusting turds.
- Register definition updates for DP.
- DisplayID timing blocks refactor.
- Remove now unused mipi_dsi_dsc_write_seq.
- Convert panel drivers to not return error in prepare/enable and
  unprepare/disable calls.

Driver Changes:
- Assorted small fixes and featuers for rockchip, panthor, accel/ivpu,
  accel/amdxdna, hisilicon/hibmc, i915/backlight, sysfb, accel/qaic,
  udl, etnaviv, virtio, xlnx, panel/boe-bf060y8m-aj0, bridge/synopsis,
  panthor, panel/samsung/sofef00m, lontium/lt9611uxc, nouveau, panel/himax-hx8279,
  panfrost, st7571-i2c.
- Improve hibmc interrupt handling and add HPD support.
- Add NLT NL13676BC25-03F, Tianma TM070JDHG34-00, Himax HX8279/HX8279-D
  DDIC, Visionox G2647FB105, Sitronix ST7571 LCD Controller, panels.
- Add zpos, alpha and blend to renesas.
- Convert drivers to use drm_gem_is_imported, replacing gem->import_attach.
- Support TI AM68 GPU in imagination.
- Support panic handler in virtio.
- Add support to get the panel from DP AUX bus in rockchip and add
  RK3588 support.
- Make sofef00 only support the sofef00 panel, not another unrelated
  one.
- Add debugfs BO dumping support to panthor, and print associated labels.
- Implement heartbeat based hangcheck in ivpu.
- Mass convert drivers to devm_drm_bridge_alloc api.
The following changes since commit b60301774a8fe6c30b14a95104ec099290a2e904:

  Merge tag 'drm-intel-next-2025-04-11' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-04-15 05:06:51 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-04-29

for you to fetch changes up to f2c8f90b4f676c1f860e6c2cdfe91e68fae64918:

  drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION (2025-04-29 12:29:24 +0200)

----------------------------------------------------------------
drm-misc-next for v6.16-rc1:

UAPI Changes:
- panthor now fails in mmap_offset call for a BO created with
  DRM_PANTHOR_BO_NO_MMAP.
- Add DRM_PANTHOR_BO_SET_LABEL ioctl and label panthor kernel BOs.

Cross-subsystem Changes:
- Add kmap_local_page_try_from_panic for drm/panic.
- Add DT bindings for panels.
- Update DT bindings for imagination.
- Extend %p4cc in lib/vsprintf.c to support fourcc printing.

Core Changes:
- Remove the disgusting turds.
- Register definition updates for DP.
- DisplayID timing blocks refactor.
- Remove now unused mipi_dsi_dsc_write_seq.
- Convert panel drivers to not return error in prepare/enable and
  unprepare/disable calls.

Driver Changes:
- Assorted small fixes and featuers for rockchip, panthor, accel/ivpu,
  accel/amdxdna, hisilicon/hibmc, i915/backlight, sysfb, accel/qaic,
  udl, etnaviv, virtio, xlnx, panel/boe-bf060y8m-aj0, bridge/synopsis,
  panthor, panel/samsung/sofef00m, lontium/lt9611uxc, nouveau, panel/himax-hx8279,
  panfrost, st7571-i2c.
- Improve hibmc interrupt handling and add HPD support.
- Add NLT NL13676BC25-03F, Tianma TM070JDHG34-00, Himax HX8279/HX8279-D
  DDIC, Visionox G2647FB105, Sitronix ST7571 LCD Controller, panels.
- Add zpos, alpha and blend to renesas.
- Convert drivers to use drm_gem_is_imported, replacing gem->import_attach.
- Support TI AM68 GPU in imagination.
- Support panic handler in virtio.
- Add support to get the panel from DP AUX bus in rockchip and add
  RK3588 support.
- Make sofef00 only support the sofef00 panel, not another unrelated
  one.
- Add debugfs BO dumping support to panthor, and print associated labels.
- Implement heartbeat based hangcheck in ivpu.
- Mass convert drivers to devm_drm_bridge_alloc api.

----------------------------------------------------------------
Aditya Garg (2):
      printf: add tests for generic FourCCs
      drm/appletbdrm: use %p4cl instead of %p4cc

Adrián Larumbe (4):
      drm/panthor: Introduce BO labeling
      drm/panthor: Add driver IOCTL for setting BO labels
      drm/panthor: Label all kernel BO's
      drm/panthor: show device-wide list of DRM GEM objects over DebugFS

Alessio Belle (3):
      drm/imagination: Update register defs for newer GPUs
      drm/imagination: Mask GPU IRQs in threaded handler
      drm/imagination: Handle Rogue safety event IRQs

Alexander Baransky (2):
      dt-bindings: display: panel: Add Visionox G2647FB105
      drm/panel: Add Visionox G2647FB105 panel driver

Andy Yan (2):
      drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
      drm/bridge: dw-hdmi: Avoid including uapi headers

AngeloGioacchino Del Regno (3):
      dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
      dt-bindings: display: panel: Add Himax HX8279/HX8279-D DDIC panels
      drm: panel: Add driver for Himax HX8279 DDIC panels

Antonin Godard (2):
      dt-bindings: display: simple: Add NLT NL13676BC25-03F panel
      drm/panel: simple: Add NLT NL13676BC25-03F panel entry

Arnd Bergmann (2):
      drm/imagination: avoid unused-const-variable warning
      drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION

Baihan Li (9):
      drm/hisilicon/hibmc: Restructuring the header dp_reg.h
      drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage and pre-emphasis
      drm/hisilicon/hibmc: Add dp serdes cfg in dp process
      drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
      drm/hisilicon/hibmc: Getting connector info and EDID by using AUX channel
      drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
      drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
      drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
      drm/hisilicon/hibmc: Add vga connector detect functions

Biju Das (2):
      drm: renesas: Add zpos, alpha and blend properties to RZ/G2L DU
      drm: renesas: rz-du: rzg2l_mipi_dsi: Update the comment in rzg2l_mipi_dsi_start_video()

Boris Brezillon (7):
      drm/panthor: Fix GPU_COHERENCY_ACE[_LITE] definitions
      drm/panthor: Call panthor_gpu_coherency_init() after PM resume()
      drm/panthor: Update panthor_mmu::irq::mask when needed
      drm/panthor: Let IRQ handlers clear the interrupts themselves
      drm/panthor: Don't update MMU_INT_MASK in panthor_mmu_irq_handler()
      drm/panthor: Fix the panthor_gpu_coherency_init() error path
      drm/panthor: Don't create a file offset for NO_MMAP BOs

Casey Connolly (1):
      drm/panel: samsung-sofef00: Drop s6e3fc2x01 support

Chen-Yu Tsai (1):
      drm/bridge: anx7625: Use devm_pm_runtime_enable()

Christophe JAILLET (1):
      drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()

Damon Ding (11):
      drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of calling disable_irq()
      drm/bridge: analogix_dp: Remove CONFIG_PM related check in analogix_dp_bind()/analogix_dp_unbind()
      drm/bridge: analogix_dp: Add support for phy configuration.
      dt-bindings: display: rockchip: analogix-dp: Add support to get panel from the DP AUX bus
      drm/bridge: analogix_dp: Support to get &analogix_dp_device.plat_data and &analogix_dp_device.aux
      drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
      drm/bridge: analogix_dp: Add support for &drm_dp_aux.wait_hpd_asserted()
      drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
      dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
      drm/bridge: analogix_dp: Add support for RK3588
      drm/rockchip: analogix_dp: Add support for RK3588

Dan Carpenter (1):
      drm/udl: Set error code in udl_init()

Dmitry Baryshkov (9):
      drm/display: hdmi: provide central data authority for ACR params
      drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
      drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_panel()
      drm/bridge: analogix_dp: drop unused argument to analogix_dp_prepare_panel()
      drm/bridge: analogic_dp: drop panel_is_modeset
      drm/bridge: analogic_dp: drop panel_lock
      drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
      drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
      drm/panel: make prepare/enable and disable/unprepare calls return void

Egor Vorontsov (2):
      drm/edid: Implement DisplayID Type IX & X timing blocks parsing
      drm/edid: Refactor DisplayID timing block structs

Gustavo A. R. Silva (3):
      drm/nouveau: disp: Use __member_size() helper
      drm/nouveau: outp: Use __member_size() helper
      drm/nouveau: chan: Avoid -Wflex-array-member-not-at-end warnings

Hector Martin (1):
      lib/vsprintf: Add support for generic FourCCs by extending %p4cc

Jocelyn Falempe (2):
      mm/kmap: Add kmap_local_page_try_from_panic()
      drm/panic: Add support to scanout buffer as array of pages

Jose Maria Casanova Crespo (2):
      drm/v3d: fix client obtained from axi_ids on V3D 4.1
      drm/v3d: client ranges from axi_ids are different with V3D 7.1

Karol Wachowski (1):
      accel/ivpu: Implement heartbeat-based TDR mechanism

Konstantin Shabanov (1):
      drm/rockchip: vop: Consistently use rk3399 registers consts

Kuninori Morimoto (1):
      drm: xlnx: zynqmp_dpsub: use snd_soc_dummy_dlc

Lizhi Hou (1):
      accel/amdxdna: Fix incorrect size of ERT_START_NPU commands

Luca Ceresoli (17):
      dt-bindings: display: simple: Add Tianma P0700WXF1MBAA panel
      drm/panel: simple: Tianma TM070JDHG34-00: add delays
      drm/panel: simple: add Tianma P0700WXF1MBAA panel
      platform: arm64: acer-aspire1-ec: convert to devm_drm_bridge_alloc() API
      drm/bridge: analogix-anx6345: convert to devm_drm_bridge_alloc() API
      drm/bridge: display-connector: convert to devm_drm_bridge_alloc() API
      drm/bridge: lt9611uxc: convert to devm_drm_bridge_alloc() API
      drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API
      drm/bridge: tda998x: convert to devm_drm_bridge_alloc() API
      drm/bridge: ti-sn65dsi86: convert to devm_drm_bridge_alloc() API
      drm/exynos: mic: convert to devm_drm_bridge_alloc() API
      drm/mcde: convert to devm_drm_bridge_alloc() API
      drm/msm/dp: convert to devm_drm_bridge_alloc() API
      drm/msm/dsi: convert to devm_drm_bridge_alloc() API
      drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
      drm/vc4: convert to devm_drm_bridge_alloc() API
      drm/bridge: imx8*-ldb: convert to devm_drm_bridge_alloc() API

Lucas Stach (1):
      drm/rockchip: vop: remove redundant condition check

Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller

Matt Coster (12):
      dt-bindings: gpu: img: Future-proofing enhancements
      dt-bindings: gpu: img: Add BXS-4-64 devicetree bindings
      drm/imagination: Use new generic compatible string
      drm/imagination: Add power domain control
      drm/imagination: Remove firmware enable_reg
      drm/imagination: Rename event_mask -> status_mask
      drm/imagination: Make has_fixed_data_addr a value
      drm/imagination: Use a lookup table for fw defs
      drm/imagination: Use callbacks for fw irq handling
      drm/imagination: Move ELF fw utils to common file
      drm/imagination: Use cached memory with dma_coherent
      drm/imagination: Add support for TI AM68 GPU

Michal Wilczynski (2):
      dt-bindings: gpu: Add 'resets' property for GPU initialization
      drm/imagination: Add reset controller support for GPU initialization

Miguel Ojeda (1):
      drm/panic: use `///` for private items too

Nathan Chancellor (2):
      drm/sysfb: efidrm: Avoid clang -Wsometimes-uninitialized in efidrm_device_create()
      drm/panel: himax-hx8279: Always initialize goa_{even,odd}_valid in hx8279_check_goa_config()

Philippe Simons (3):
      drm/panfrost: Add PM runtime flag
      drm/panfrost: add h616 compatible string
      drm/panfrost: reorder pd/clk/rst sequence

Rob Herring (Arm) (1):
      dt-bindings: display: rockchip,vop: Drop assigned-clocks

Ryosuke Yasuoka (1):
      drm/virtio: Support drm_panic with non-vmapped shmem BO

Sarah Walker (1):
      drm/imagination: Add RISC-V firmware processor support

Suraj Kandpal (2):
      drm/dp: Add smooth brightness register bit definition
      drm/i915/backlight: Modify condition to use panel luminance

Tejas Vipin (3):
      drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
      drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped functions
      drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq

Thomas Zimmermann (25):
      drm: Mark CONFIG_DRM_HEADER_TEST as BROKEN
      accel/ivpu: Test for imported buffers with drm_gem_is_imported()
      accel/qaic: Test for imported buffers with drm_gem_is_imported()
      drm/sysfb: Split source file
      drm/sysfb: Share helpers for integer validation
      drm/sysfb: Share helpers for screen_info validation
      drm/udl: Remove unused field dev from struct udl_device
      drm/udl: Remove unused field gem_lock from struct udl_device
      drm/udl: Improve type safety when using struct udl_device
      drm/udl: The number of pixels is always positive
      drm/udl: Handle errors from usb_get_descriptor()
      drm/udl: Return error if vendor descriptor is too short
      drm/udl: Treat vendor descriptor as u8
      drm/udl: Validate length in vendor-descriptor parser
      drm/udl: Support adapters without firmware descriptor
      drm/etnaviv: Test for imported buffers with drm_gem_is_imported()
      drm/etnaviv: Use dma_buf from GEM object instance
      drm/msm: Test for imported buffers with drm_gem_is_imported()
      drm/panfrost: Test for imported buffers with drm_gem_is_imported()
      drm/panthor: Test for imported buffers with drm_gem_is_imported()
      drm/vmwgfx: Test for imported buffers with drm_gem_is_imported()
      drm/vmwgfx: Use dma_buf from GEM object instance
      Merge drm/drm-next into drm-misc-next
      drm/virtio: Test for imported buffers with drm_gem_is_imported()
      drm/virtio: Use dma_buf from GEM object instance

Zhang Enpei (1):
      gpu: drm: xlnx: zynqmp_dp: Use dev_err_probe()

 Documentation/core-api/printk-formats.rst          |   32 +
 .../bindings/display/panel/himax,hx8279.yaml       |   75 ++
 .../bindings/display/panel/panel-simple.yaml       |    4 +
 .../display/panel/visionox,g2647fb105.yaml         |   79 ++
 .../display/rockchip/rockchip,analogix-dp.yaml     |   25 +-
 .../bindings/display/rockchip/rockchip-vop.yaml    |    6 -
 .../bindings/display/sitronix,st7571.yaml          |   73 ++
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   82 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    6 +
 drivers/accel/amdxdna/aie2_message.c               |    6 +-
 drivers/accel/amdxdna/aie2_msg_priv.h              |   10 +-
 drivers/accel/ivpu/ivpu_drv.c                      |    4 +
 drivers/accel/ivpu/ivpu_drv.h                      |    1 +
 drivers/accel/ivpu/ivpu_fw.h                       |    1 +
 drivers/accel/ivpu/ivpu_gem.c                      |    6 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   20 +
 drivers/accel/qaic/qaic_data.c                     |    8 +-
 drivers/gpu/drm/Kconfig.debug                      |    2 +-
 drivers/gpu/drm/bridge/Kconfig                     |    1 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    8 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  192 +--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |    3 -
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |   52 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    9 +-
 drivers/gpu/drm/bridge/display-connector.c         |    8 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |    4 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |   32 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |   20 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   13 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   11 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |    7 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    7 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  168 +++
 drivers/gpu/drm/drm_displayid_internal.h           |   31 +-
 drivers/gpu/drm/drm_edid.c                         |   91 +-
 drivers/gpu/drm/drm_panel.c                        |   54 +-
 drivers/gpu/drm/drm_panic.c                        |  144 ++-
 drivers/gpu/drm/drm_panic_qr.rs                    |   29 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |    7 +-
 drivers/gpu/drm/hisilicon/hibmc/Makefile           |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c        |   16 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h       |   10 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h     |    2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c         |   91 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h         |   36 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |   90 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h        |  150 ++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c     |   71 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c    |  104 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c     |   74 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   85 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   12 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |    3 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    3 +-
 drivers/gpu/drm/imagination/Makefile               |    2 +
 drivers/gpu/drm/imagination/pvr_device.c           |  147 ++-
 drivers/gpu/drm/imagination/pvr_device.h           |   40 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |   16 +
 drivers/gpu/drm/imagination/pvr_fw.c               |   28 +-
 drivers/gpu/drm/imagination/pvr_fw.h               |   85 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |   23 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |   81 +-
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         |  165 +++
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |   17 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |    8 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |    2 -
 drivers/gpu/drm/imagination/pvr_fw_util.c          |   66 +
 drivers/gpu/drm/imagination/pvr_gem.c              |   10 +-
 drivers/gpu/drm/imagination/pvr_gem.h              |    6 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |    8 +-
 drivers/gpu/drm/imagination/pvr_power.c            |  136 +-
 drivers/gpu/drm/imagination/pvr_power.h            |    3 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    |  153 ++-
 drivers/gpu/drm/imagination/pvr_rogue_riscv.h      |   41 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    |    7 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    9 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    9 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    9 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    4 +-
 drivers/gpu/drm/msm/msm_gem.h                      |    2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |  114 +-
 drivers/gpu/drm/nouveau/nvif/outp.c                |    2 +-
 drivers/gpu/drm/panel/Kconfig                      |   20 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |  102 +-
 drivers/gpu/drm/panel/panel-himax-hx8279.c         | 1296 ++++++++++++++++++++
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |    9 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  104 +-
 drivers/gpu/drm/panel/panel-simple.c               |   66 +-
 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c  |  280 +++++
 drivers/gpu/drm/panfrost/panfrost_device.c         |   71 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |    3 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    8 +
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    2 +-
 drivers/gpu/drm/panthor/panthor_device.c           |   13 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   13 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   76 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |   10 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |  222 +++-
 drivers/gpu/drm/panthor/panthor_gem.h              |   86 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |    2 +
 drivers/gpu/drm/panthor/panthor_heap.c             |    6 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   19 +-
 drivers/gpu/drm/panthor/panthor_regs.h             |    4 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |    9 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |    9 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |    2 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  103 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |    1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    5 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   94 +-
 drivers/gpu/drm/sysfb/Makefile                     |    4 +
 drivers/gpu/drm/sysfb/drm_sysfb.c                  |   35 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   48 +
 .../{drm_sysfb_helper.c => drm_sysfb_modeset.c}    |    4 -
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c      |  107 ++
 drivers/gpu/drm/sysfb/efidrm.c                     |  130 +-
 drivers/gpu/drm/sysfb/ofdrm.c                      |   12 +-
 drivers/gpu/drm/sysfb/simpledrm.c                  |   14 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |  126 +-
 drivers/gpu/drm/tiny/Kconfig                       |   12 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/appletbdrm.c                  |    4 +-
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 1002 +++++++++++++++
 drivers/gpu/drm/udl/udl_drv.c                      |    6 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   19 +-
 drivers/gpu/drm/udl/udl_main.c                     |  175 +--
 drivers/gpu/drm/udl/udl_modeset.c                  |   21 +-
 drivers/gpu/drm/udl/udl_transfer.c                 |    6 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   60 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   34 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   20 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   12 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    6 +-
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             |    5 +-
 drivers/platform/arm64/acer-aspire1-ec.c           |    7 +-
 include/drm/bridge/analogix_dp.h                   |    7 +-
 include/drm/display/drm_dp.h                       |    1 +
 include/drm/display/drm_hdmi_helper.h              |    6 +
 include/drm/drm_mipi_dsi.h                         |   22 -
 include/drm/drm_panel.h                            |    8 +-
 include/drm/drm_panic.h                            |   12 +-
 include/linux/highmem-internal.h                   |   13 +
 include/uapi/drm/panthor_drm.h                     |   23 +
 lib/tests/printf_kunit.c                           |   39 +-
 lib/vsprintf.c                                     |   35 +-
 scripts/checkpatch.pl                              |    2 +-
 157 files changed, 6560 insertions(+), 1427 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_riscv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_util.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_riscv.h
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb.c
 rename drivers/gpu/drm/sysfb/{drm_sysfb_helper.c => drm_sysfb_modeset.c} (98%)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
 create mode 100644 drivers/gpu/drm/tiny/st7571-i2c.c
