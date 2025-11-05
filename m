Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A43C35B06
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE110E2D1;
	Wed,  5 Nov 2025 12:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bju/qDdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53C310E29F;
 Wed,  5 Nov 2025 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762346797; x=1793882797;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=pKnB3ifuh24znHR5OVX5r4zNYoUZ47eG129717IE6K0=;
 b=bju/qDdKn/Ep3StEhpDsr7C5Yp5v6uUrb0ef5892PSiNgwUka4Cm9E7R
 527Mfb+Wg07ivp65Esr6Au7O4wfNaAHf8o2/l09lFFsLWXd88V0deEKzK
 pHF7pI5pB6mGGIfykDGY8/PKme2Gph/fRMiS/MKB4Xvaacd1dqHQ5mcpL
 7htdA+UuiU1nC5mHvP1kZ1eEbYzooa0CmzwgW5pHiNFMLTL9qRdsy+r3O
 JmkQDNvfuhaClWHdns5C/NkAf/ZDmh+gErxQyPlsOekZLFfcC/XXOimfK
 N6a3UZrVK3FP9fxLM4BsBbpc9dhmdJhDT4C0p/IyQLhagO3+A6TNekZqL A==;
X-CSE-ConnectionGUID: bmBIVRNSSUKKBz2tkB/wIg==
X-CSE-MsgGUID: +00uaiOzSa2zwTpRutcHlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64385770"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64385770"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:46:36 -0800
X-CSE-ConnectionGUID: lkneq3yiQb+QcbK+aNlJlA==
X-CSE-MsgGUID: bm/iUmPfTU6Jc/z+GfEQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187607578"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.65])
 ([10.245.244.65])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:46:32 -0800
Message-ID: <5afae707-c9aa-4a47-b726-5e1f1aa7a106@linux.intel.com>
Date: Wed, 5 Nov 2025 13:46:30 +0100
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

drm-misc-next-2025-11-05-1:
drm-misc-next for v6.19-rc1:

UAPI Changes:
- Add userptr support to ivpu.
- Add IOCTL's for resource and telemetry data in amdxdna.

Core Changes:
- Improve some atomic state checking handling.
- drm/client updates.
- Use forward declarations instead of including drm_print.h
- RUse allocation flags in ttm_pool/device_init and allow specifying max
  useful pool size and propagate ENOSPC.
- Updates and fixes to scheduler and bridge code.
- Add support for quirking DisplayID checksum errors.

Driver Changes:
- Assorted cleanups and fixes in rcar-du, accel/ivpu, panel/nv3052cf,
  sti, imxm, accel/qaic, accel/amdxdna, imagination, tidss, sti,
  panthor, vkms.
- Add Samsung S6E3FC2X01 DDIC/AMS641RW, Synaptics TDDI series DSI,
  TL121BVMS07-00 (IL79900A) panels.
- Add mali MediaTek MT8196 SoC gpu support.
- Add etnaviv GC8000 Nano Ultra VIP r6205 support.
- Document powervr ge7800 support in the devicetree.
The following changes since commit 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c:

  drm/ttm: add pgprot handling for RISC-V (2025-10-28 09:19:46 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-11-05-1

for you to fetch changes up to 6126a7f27f002408803f3fc50ff610699e57601d:

  dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N (2025-11-05 10:54:39 +0000)

----------------------------------------------------------------
drm-misc-next for v6.19-rc1:

UAPI Changes:
- Add userptr support to ivpu.
- Add IOCTL's for resource and telemetry data in amdxdna.

Core Changes:
- Improve some atomic state checking handling.
- drm/client updates.
- Use forward declarations instead of including drm_print.h
- RUse allocation flags in ttm_pool/device_init and allow specifying max
  useful pool size and propagate ENOSPC.
- Updates and fixes to scheduler and bridge code.
- Add support for quirking DisplayID checksum errors.

Driver Changes:
- Assorted cleanups and fixes in rcar-du, accel/ivpu, panel/nv3052cf,
  sti, imxm, accel/qaic, accel/amdxdna, imagination, tidss, sti,
  panthor, vkms.
- Add Samsung S6E3FC2X01 DDIC/AMS641RW, Synaptics TDDI series DSI,
  TL121BVMS07-00 (IL79900A) panels.
- Add mali MediaTek MT8196 SoC gpu support.
- Add etnaviv GC8000 Nano Ultra VIP r6205 support.
- Document powervr ge7800 support in the devicetree.

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA60CL08

Alok Tiwari (1):
      drm: rcar-du: fix incorrect return in rcar_du_crtc_cleanup()

Boris Brezillon (3):
      drm/panthor: Handle errors returned by drm_sched_entity_init()
      drm/panthor: Fix group_free_queue() for partially initialized queues
      drm/panthor: Fix UAF on kernel BO VA nodes

Dan Carpenter (1):
      drm/vkms: Fix use after frees on error paths

David Heidelberg (2):
      dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel

Geert Uytterhoeven (1):
      drm/imagination: Fix reference to devm_platform_get_and_ioremap_resource()

Jacek Lawrynowicz (1):
      accel/ivpu: Add support for userptr buffer objects

Jani Nikula (10):
      drm: include drm_print.h where needed
      drm/buddy: replace drm_print.h include with a forward declaration
      drm/mm: replace drm_print.h include with a forward declaration
      drm/ttm: replace drm_print.h include with a forward declaration
      drm/renesas: include drm_print.h where needed
      drm/rockchip: include drm_print.h where needed
      drm/hyperv: include drm_print.h where needed
      drm/displayid: pass iter to drm_find_displayid_extension()
      drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct drm_edid_ident
      drm/displayid: add quirk to ignore DisplayID checksum errors

Johan Hovold (4):
      drm/imx/dw-hdmi: drop unused module alias
      drm/imx/ldb: drop unused module alias
      drm/imx/tve: drop unused module alias
      drm/imx/parallel-display: drop unused module alias

José Expósito (2):
      drm/vkms: Fix run-tests.sh script name
      drm/vkms: Update testing with IGT IGT_DEVICE

Karol Wachowski (3):
      accel/ivpu: Disallow setting sched mode OS starting from NPU6
      accel/ivpu: Wait for CDYN de-assertion during power down sequence
      accel/ivpu: Improve debug and warning messages

Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel
      drm: panel: add support for Synaptics TDDI series DSI panels

Ketil Johnsen (3):
      drm/panthor: Fix UAF race between device unplug and FW event processing
      drm/panthor: disable async work during unplug
      drm/panthor: Fix race with suspend during unplug

Langyan Ye (2):
      dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
      drm/panel: ilitek-ili9882t: Add support for Ilitek IL79900A-based panels

Lizhi Hou (5):
      accel/amdxdna: Fix incorrect command state for timed out job
      accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when supported
      accel/amdxdna: Add hardware specific attributes
      accel/amdxdna: Add IOCTL parameter for resource data
      accel/amdxdna: Add IOCTL parameter for telemetry data

Luca Ceresoli (9):
      Revert "drm/display: bridge_connector: get/put the stored bridges"
      drm/display: bridge_connector: get/put the stored bridges
      drm/display: bridge_connector: get/put the panel_bridge
      drm/sti: hda: add bridge before attaching
      drm/sti: hdmi: add bridge before attaching
      drm/bridge: document that adding a bridge is mandatory before attach
      drm/bridge: add warning for bridges attached without being added
      drm/bridge: add warning for bridges using neither devm_drm_bridge_alloc() nor drm_bridge_add()
      drm/bridge: synopsys: dw-dp: add bridge before attaching

Maciej Falkowski (1):
      accel/ivpu: Remove skip of dma unmap for imported buffers

Marco Crivellari (2):
      accel/ivpu: replace use of system_unbound_wq with system_dfl_wq
      accel/ivpu: replace use of system_wq with system_percpu_wq

Marek Vasut (18):
      drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
      drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
      drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
      drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
      drm/rcar-du: dsi: Clean up VCLKSET register macros
      drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
      drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
      drm/rcar-du: dsi: Respect DSI mode flags
      drm/rcar-du: dsi: Clean up handling of DRM mode flags
      drm/rcar-du: dsi: Convert register bits to BIT() macro
      drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align panel example with ili9881c binding
      dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline
      dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
      arm64: dts: imx95: Describe Mali G310 GPU
      drm/etnaviv: add HWDB entry for GC8000 Nano Ultra VIP r6205
      dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
      dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N

Nicolas Frattaroli (3):
      dt-bindings: gpu: mali-valhall-csf: add mediatek,mt8196-mali variant
      drm/panthor: call into devfreq for current frequency
      drm/panthor: Use existing OPP table if present

Philipp Stanner (2):
      drm/sched: Fix comment in drm_sched_run_job_work()
      drm/sched: Add warning for removing hack in drm_sched_fini()

Priit Laes (1):
      drm/panel: nv3052c: Reduce duplication of init sequences

Rain Yang (1):
      drm/panthor: attach the driver's multiple power domains

Raphael Gallais-Pou (4):
      drm/sti: check dma_set_coherent_mask return value
      drm/sti: make use of drm_of_component_probe
      ARM: dts: sti: extract display subsystem out of soc
      ARM: dts: sti: remove useless cells fields

Sakari Ailus (1):
      accel/ivpu: Remove redundant pm_runtime_mark_last_busy() calls

Sourab Bera (1):
      accel/qaic: Fix typos in the documentation for qaic

Stephen Rothwell (1):
      drm/panel: synaptics-tddi: fix build error by missing regulator/consumer.h include

Thomas Zimmermann (7):
      drm/client: Remove pitch from struct drm_client_buffer
      drm/client: Move dumb-buffer handling to drm_client_framebuffer_create()
      drm/client: Inline drm_client_buffer_addfb() and _rmfb()
      drm/client: Deprecate struct drm_client_buffer.gem
      drm/client: Remove drm_client_framebuffer_delete()
      drm/client: Create client buffers with drm_client_buffer_create_dumb()
      drm/client: Flush client buffers with drm_client_buffer_sync()

Tomasz Rusinowicz (1):
      accel/ivpu: Fix race condition when unbinding BOs

Tomi Valkeinen (2):
      drm/tidss: Restructure dispc_vp_prepare() and dispc_vp_enable()
      drm/tidss: Set vblank (event) time at crtc_atomic_enable

Tvrtko Ursulin (6):
      drm/ttm: Add getter for some pool properties
      drm/ttm: Replace multiple booleans with flags in pool init
      drm/ttm: Replace multiple booleans with flags in device init
      drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
      drm/amdgpu: Configure max beneficial TTM pool allocation order
      drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM

Ville Syrjälä (2):
      drm/atomic: WARN about missing acquire_ctx in drm_atomic_get_private_obj_state()
      drm/atomic: WARN about invalid drm_foo_get_state() usage

 Documentation/accel/qaic/qaic.rst                  |   8 +-
 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   3 +-
 .../bindings/display/panel/ilitek,il79900a.yaml    |  68 +++
 .../bindings/display/panel/panel-simple-dsi.yaml   |   3 -
 .../bindings/display/panel/samsung,atna33xc20.yaml |   2 +
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml |  81 +++
 .../display/panel/synaptics,td4300-panel.yaml      |  89 ++++
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |  38 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   9 +-
 Documentation/gpu/vkms.rst                         |  19 +-
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/st/stih410.dtsi                  | 316 ++++++-----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  37 ++
 drivers/accel/amdxdna/aie2_ctx.c                   |  21 +-
 drivers/accel/amdxdna/aie2_message.c               | 585 +++++++++++++--------
 drivers/accel/amdxdna/aie2_msg_priv.h              |  67 ++-
 drivers/accel/amdxdna/aie2_pci.c                   | 113 ++++
 drivers/accel/amdxdna/aie2_pci.h                   |  35 ++
 drivers/accel/amdxdna/aie2_smu.c                   |  11 +
 drivers/accel/amdxdna/amdxdna_ctx.c                |   6 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |  12 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |   1 +
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |   6 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   4 +-
 drivers/accel/amdxdna/npu1_regs.c                  |   7 +
 drivers/accel/amdxdna/npu2_regs.c                  |   2 +
 drivers/accel/amdxdna/npu4_regs.c                  |   7 +
 drivers/accel/amdxdna/npu5_regs.c                  |   2 +
 drivers/accel/amdxdna/npu6_regs.c                  |   2 +
 drivers/accel/ethosu/ethosu_job.c                  |   1 +
 drivers/accel/ivpu/Makefile                        |   1 +
 drivers/accel/ivpu/ivpu_drv.c                      |   5 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   1 +
 drivers/accel/ivpu/ivpu_fw.c                       |   6 +
 drivers/accel/ivpu/ivpu_gem.c                      |  33 +-
 drivers/accel/ivpu/ivpu_gem.h                      |   7 +
 drivers/accel/ivpu/ivpu_gem_userptr.c              | 213 ++++++++
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |  18 +-
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |   3 +
 drivers/accel/ivpu/ivpu_ipc.c                      |   2 +-
 drivers/accel/ivpu/ivpu_job.c                      |  98 ++--
 drivers/accel/ivpu/ivpu_mmu.c                      |   2 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |   7 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |   2 +-
 drivers/accel/ivpu/ivpu_ms.c                       |  25 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   7 +-
 drivers/accel/rocket/rocket_gem.c                  |   1 +
 drivers/gpu/drm/adp/adp_drv.c                      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   9 +-
 .../drm/arm/display/komeda/komeda_framebuffer.c    |   1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   1 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   1 +
 drivers/gpu/drm/arm/malidp_drv.c                   |   1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |   1 +
 drivers/gpu/drm/armada/armada_crtc.c               |   1 +
 drivers/gpu/drm/armada/armada_debugfs.c            |   1 +
 drivers/gpu/drm/armada/armada_fb.c                 |   1 +
 drivers/gpu/drm/armada/armada_fbdev.c              |   1 +
 drivers/gpu/drm/armada/armada_gem.c                |   1 +
 drivers/gpu/drm/armada/armada_overlay.c            |   1 +
 drivers/gpu/drm/armada/armada_plane.c              |   1 +
 drivers/gpu/drm/ast/ast_mode.c                     |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |   2 +
 drivers/gpu/drm/clients/drm_log.c                  |  10 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  92 ++--
 drivers/gpu/drm/drm_atomic.c                       |  10 +
 drivers/gpu/drm/drm_bridge.c                       |   9 +
 drivers/gpu/drm/drm_buddy.c                        |   1 +
 drivers/gpu/drm/drm_client.c                       | 195 ++++---
 drivers/gpu/drm/drm_displayid.c                    |  58 +-
 drivers/gpu/drm/drm_displayid_internal.h           |   2 +
 drivers/gpu/drm/drm_dumb_buffers.c                 |   1 +
 drivers/gpu/drm/drm_fbdev_dma.c                    |   9 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |   7 +-
 drivers/gpu/drm/drm_fbdev_ttm.c                    |  10 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |   1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   1 +
 drivers/gpu/drm/drm_gem_ttm_helper.c               |   1 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   3 +-
 drivers/gpu/drm/drm_gpuvm.c                        |   1 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |   1 +
 drivers/gpu/drm/drm_mm.c                           |   1 +
 drivers/gpu/drm/drm_prime.c                        |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |  32 ++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |   2 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   1 +
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |   1 +
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |   1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |   1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |   1 +
 drivers/gpu/drm/exynos/exynos_mixer.c              |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   1 +
 drivers/gpu/drm/gma500/backlight.c                 |   2 +
 drivers/gpu/drm/gma500/cdv_device.c                |   1 +
 drivers/gpu/drm/gma500/cdv_intel_display.c         |   1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |   1 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   1 +
 drivers/gpu/drm/gma500/gem.c                       |   1 +
 drivers/gpu/drm/gma500/intel_bios.c                |   1 +
 drivers/gpu/drm/gma500/intel_gmbus.c               |   2 +
 drivers/gpu/drm/gma500/mid_bios.c                  |   1 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |   1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c         |   3 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |   1 +
 drivers/gpu/drm/gma500/opregion.c                  |   3 +
 drivers/gpu/drm/gma500/psb_drv.c                   |   1 +
 drivers/gpu/drm/gma500/psb_intel_display.c         |   1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   1 +
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   1 +
 drivers/gpu/drm/gma500/psb_irq.c                   |   1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   1 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   2 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |   1 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   1 +
 drivers/gpu/drm/i915/display/intel_connector.c     |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |   1 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   1 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   2 +
 .../drm/i915/display/intel_display_power_well.c    |   2 +
 drivers/gpu/drm/i915/display/intel_display_reset.c |   1 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   2 +
 drivers/gpu/drm/i915/display/intel_fb.c            |   1 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |   1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   2 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   1 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   1 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |   1 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |   2 +
 drivers/gpu/drm/i915/display/intel_plane.c         |   1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   2 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   1 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |   1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 +
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |   2 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   2 +
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   2 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   2 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   2 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   2 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   2 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   2 +
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   2 +
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |   1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |   2 +
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   1 +
 drivers/gpu/drm/i915/gt/intel_wopcm.c              |   2 +
 drivers/gpu/drm/i915/gt/selftest_context.c         |   2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   2 +
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |   2 +
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |   2 +
 drivers/gpu/drm/i915/gvt/cfg_space.c               |   2 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |   2 +
 drivers/gpu/drm/i915/gvt/display.c                 |   1 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   1 +
 drivers/gpu/drm/i915/gvt/edid.c                    |   1 +
 drivers/gpu/drm/i915/gvt/gtt.c                     |   2 +
 drivers/gpu/drm/i915/gvt/handlers.c                |   1 +
 drivers/gpu/drm/i915/gvt/interrupt.c               |   2 +
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   1 +
 drivers/gpu/drm/i915/gvt/mmio.c                    |   3 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |   2 +
 drivers/gpu/drm/i915/gvt/scheduler.c               |   2 +
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   2 +
 drivers/gpu/drm/i915/i915_cmd_parser.c             |   1 +
 drivers/gpu/drm/i915/i915_debugfs.c                |   1 +
 drivers/gpu/drm/i915/i915_gem.c                    |   1 +
 drivers/gpu/drm/i915/i915_getparam.c               |   2 +
 drivers/gpu/drm/i915/i915_irq.c                    |   1 +
 drivers/gpu/drm/i915/i915_module.c                 |   1 +
 drivers/gpu/drm/i915/i915_pmu.c                    |   2 +
 drivers/gpu/drm/i915/i915_query.c                  |   2 +
 drivers/gpu/drm/i915/i915_request.c                |   2 +
 drivers/gpu/drm/i915/i915_switcheroo.c             |   2 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |   2 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |   1 +
 drivers/gpu/drm/i915/i915_vgpu.c                   |   2 +
 drivers/gpu/drm/i915/i915_vma.c                    |   2 +
 drivers/gpu/drm/i915/intel_clock_gating.c          |   2 +
 drivers/gpu/drm/i915/intel_gvt.c                   |   2 +
 drivers/gpu/drm/i915/intel_memory_region.c         |   1 +
 drivers/gpu/drm/i915/intel_pcode.c                 |   2 +
 drivers/gpu/drm/i915/intel_region_ttm.c            |   2 +-
 drivers/gpu/drm/i915/intel_step.c                  |   2 +
 drivers/gpu/drm/i915/intel_uncore.c                |   1 +
 drivers/gpu/drm/i915/intel_wakeref.c               |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   2 +
 drivers/gpu/drm/i915/selftests/i915_active.c       |   2 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |   2 +
 drivers/gpu/drm/i915/soc/intel_dram.c              |   1 +
 drivers/gpu/drm/i915/soc/intel_gmch.c              |   1 +
 drivers/gpu/drm/i915/vlv_iosf_sb.c                 |   2 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |   1 +
 drivers/gpu/drm/imagination/pvr_device.c           |   2 +-
 drivers/gpu/drm/imagination/pvr_fw.c               |   1 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |   2 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |   1 +
 drivers/gpu/drm/imagination/pvr_power.c            |   1 +
 drivers/gpu/drm/imagination/pvr_vm.c               |   1 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |   1 +
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |   1 -
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |   1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   1 -
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |   1 +
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   1 -
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   1 +
 drivers/gpu/drm/kmb/kmb_drv.c                      |   1 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |   1 +
 drivers/gpu/drm/lima/lima_sched.c                  |   2 +
 drivers/gpu/drm/loongson/lsdc_benchmark.c          |   1 +
 drivers/gpu/drm/loongson/lsdc_crtc.c               |   1 +
 drivers/gpu/drm/loongson/lsdc_debugfs.c            |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |   1 +
 drivers/gpu/drm/loongson/lsdc_gem.c                |   1 +
 drivers/gpu/drm/loongson/lsdc_i2c.c                |   1 +
 drivers/gpu/drm/loongson/lsdc_irq.c                |   1 +
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |   1 +
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |   1 +
 drivers/gpu/drm/loongson/lsdc_pixpll.c             |   1 +
 drivers/gpu/drm/loongson/lsdc_plane.c              |   1 +
 drivers/gpu/drm/loongson/lsdc_ttm.c                |   4 +-
 drivers/gpu/drm/mcde/mcde_display.c                |   1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                |   1 +
 drivers/gpu/drm/mediatek/mtk_gem.c                 |   1 +
 drivers/gpu/drm/mediatek/mtk_plane.c               |   1 +
 drivers/gpu/drm/meson/meson_overlay.c              |   1 +
 drivers/gpu/drm/meson/meson_plane.c                |   1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200.c             |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c          |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   1 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   1 +
 drivers/gpu/drm/mgag200/mgag200_vga.c              |   1 +
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c          |   1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   1 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   6 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |   1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |   1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   2 +
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   1 +
 drivers/gpu/drm/omapdrm/omap_fb.c                  |   1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   1 +
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   1 +
 drivers/gpu/drm/omapdrm/omap_irq.c                 |   1 +
 drivers/gpu/drm/omapdrm/omap_overlay.c             |   1 +
 drivers/gpu/drm/omapdrm/omap_plane.c               |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  24 +
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  69 +++
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    | 580 ++++++--------------
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   | 385 ++++++++++++++
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 277 ++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   2 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   2 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   1 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |  63 ++-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |   2 +
 drivers/gpu/drm/panthor/panthor_device.c           |  23 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   3 -
 drivers/gpu/drm/panthor/panthor_drv.c              |   5 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |   3 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |  15 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   1 +
 drivers/gpu/drm/panthor/panthor_heap.c             |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c               |   2 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |   1 +
 drivers/gpu/drm/panthor/panthor_sched.c            |  12 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                      |   1 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |   1 +
 drivers/gpu/drm/qxl/qxl_gem.c                      |   1 +
 drivers/gpu/drm/qxl/qxl_image.c                    |   2 +
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |   2 +
 drivers/gpu/drm/qxl/qxl_irq.c                      |   1 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |   1 +
 drivers/gpu/drm/qxl/qxl_release.c                  |   2 +
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   3 +-
 drivers/gpu/drm/radeon/radeon.h                    |   1 +
 drivers/gpu/drm/radeon/radeon_ttm.c                |   6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c     |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  50 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   | 387 +++++++-------
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |   2 +
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   1 +
 drivers/gpu/drm/scheduler/sched_main.c             |  18 +-
 drivers/gpu/drm/sitronix/st7586.c                  |   1 +
 drivers/gpu/drm/sitronix/st7735r.c                 |   1 +
 drivers/gpu/drm/solomon/ssd130x.c                  |   1 +
 drivers/gpu/drm/sti/sti_cursor.c                   |   1 +
 drivers/gpu/drm/sti/sti_drv.c                      |  19 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   1 +
 drivers/gpu/drm/sti/sti_hda.c                      |   5 +
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   1 +
 drivers/gpu/drm/sti/sti_plane.c                    |   1 +
 drivers/gpu/drm/stm/drv.c                          |   1 +
 drivers/gpu/drm/stm/ltdc.c                         |   1 +
 drivers/gpu/drm/sun4i/sun4i_backend.c              |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |   1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |   1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   1 +
 drivers/gpu/drm/sysfb/efidrm.c                     |   1 +
 drivers/gpu/drm/sysfb/ofdrm.c                      |   1 +
 drivers/gpu/drm/sysfb/simpledrm.c                  |   1 +
 drivers/gpu/drm/sysfb/vesadrm.c                    |   1 +
 drivers/gpu/drm/tegra/dc.c                         |   1 +
 drivers/gpu/drm/tegra/drm.c                        |   1 +
 drivers/gpu/drm/tegra/dsi.c                        |   1 +
 drivers/gpu/drm/tegra/fb.c                         |   1 +
 drivers/gpu/drm/tegra/hdmi.c                       |   1 +
 drivers/gpu/drm/tegra/hub.c                        |   1 +
 drivers/gpu/drm/tegra/sor.c                        |   1 +
 drivers/gpu/drm/tests/drm_mm_test.c                |   1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  10 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  23 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   3 +-
 drivers/gpu/drm/tiny/bochs.c                       |   1 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |   1 +
 drivers/gpu/drm/tiny/gm12u320.c                    |   1 +
 drivers/gpu/drm/tiny/hx8357d.c                     |   1 +
 drivers/gpu/drm/tiny/ili9163.c                     |   1 +
 drivers/gpu/drm/tiny/ili9225.c                     |   1 +
 drivers/gpu/drm/tiny/ili9341.c                     |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     |   1 +
 drivers/gpu/drm/tiny/mi0283qt.c                    |   1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   1 +
 drivers/gpu/drm/tiny/pixpaper.c                    |   1 +
 drivers/gpu/drm/tiny/repaper.c                     |   1 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |  16 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |   2 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c        |  33 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |  22 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |   7 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |   1 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |  24 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   5 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |   9 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |  45 +-
 drivers/gpu/drm/ttm/ttm_pool_internal.h            |  25 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |   1 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |  11 +-
 drivers/gpu/drm/tve200/tve200_display.c            |   1 +
 drivers/gpu/drm/udl/udl_edid.c                     |   1 +
 drivers/gpu/drm/v3d/v3d_bo.c                       |   2 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |   1 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |   1 +
 drivers/gpu/drm/v3d/v3d_gem.c                      |   1 +
 drivers/gpu/drm/v3d/v3d_gemfs.c                    |   2 +
 drivers/gpu/drm/v3d/v3d_irq.c                      |   2 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |   1 +
 drivers/gpu/drm/v3d/v3d_submit.c                   |   1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c               |   1 +
 drivers/gpu/drm/vboxvideo/vbox_main.c              |   1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   1 +
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |   1 +
 drivers/gpu/drm/vc4/vc4_bo.c                       |   1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_gem.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   1 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_irq.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |   2 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |   1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                |   2 +
 drivers/gpu/drm/vc4/vc4_txp.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   2 +
 drivers/gpu/drm/vc4/vc4_validate.c                 |   2 +
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |   2 +
 drivers/gpu/drm/vc4/vc4_vec.c                      |   1 +
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   1 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |   2 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   1 +
 drivers/gpu/drm/vkms/vkms_configfs.c               |  20 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   1 +
 drivers/gpu/drm/vkms/vkms_drv.c                    |   1 +
 drivers/gpu/drm/vkms/vkms_output.c                 |   1 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |   1 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   1 +
 drivers/gpu/drm/xe/xe_device.c                     |   2 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |   2 +
 drivers/gpu/drm/xe/xe_tuning.c                     |   1 +
 drivers/gpu/drm/xen/xen_drm_front.c                |   1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |   1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |   1 +
 include/drm/drm_atomic.h                           |   8 +
 include/drm/drm_buddy.h                            |   2 +-
 include/drm/drm_client.h                           |  20 +-
 include/drm/drm_edid.h                             |   6 +
 include/drm/drm_mm.h                               |   2 +-
 include/drm/ttm/ttm_allocation.h                   |  12 +
 include/drm/ttm/ttm_device.h                       |   8 +-
 include/drm/ttm/ttm_pool.h                         |   8 +-
 include/drm/ttm/ttm_resource.h                     |   3 +-
 include/uapi/drm/amdxdna_accel.h                   |  34 ++
 include/uapi/drm/ivpu_accel.h                      |  52 ++
 480 files changed, 3825 insertions(+), 1463 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
 create mode 100644 drivers/accel/ivpu/ivpu_gem_userptr.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-tddi.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
 create mode 100644 include/drm/ttm/ttm_allocation.h
