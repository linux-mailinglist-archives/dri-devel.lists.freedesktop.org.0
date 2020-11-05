Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB882A7B7D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 11:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E316EA2C;
	Thu,  5 Nov 2020 10:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328446EA2C;
 Thu,  5 Nov 2020 10:16:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9008AFF9;
 Thu,  5 Nov 2020 10:16:44 +0000 (UTC)
Date: Thu, 5 Nov 2020 11:16:41 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20201105101641.GA13099@linux-uq9g>
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

here's this week's PR for drm-misc-next. Significant changes are in the
continuing rework of the TTM code. The atomic functions for CRTCs now get
the full atomic state. It's simple, but touches a number of drivers.

Best regards
Thomas

drm-misc-next-2020-11-05:
drm-misc-next for v5.11:

UAPI Changes:

Cross-subsystem Changes:

 - arch/arm64: Describe G12b GPU as coherent
 - iommu: Support coherency for Mali LPAE

Core Changes:

 - atomic: Pass full state to CRTC atomic_{check, begin, flush}(); Use
   atomic-state pointers
 - drm: Remove SCATTER_LIST_MAX_SEGMENT; Cleanups
 - doc: Document legacy_cursor_update better; cleanups
 - edid: Don't warn n EDIDs of zero
 - ttm: New backend allocation pool; Remove old page allocator; Rework
   no_retry handling; Replace flags with booleans in struct ttm_operation_c=
tx
 - vram-helper: Cleanups

 - fbdev: Cleanups
 - console: Store font size as unsigned value

Driver Changes:

 - ast: Support new display mode
 - amdgpu: Switch to new TTM allocator
 - hisilicon: Cleanups
 - nouveau: Switch to new TTM allocator; Fix include of swiotbl.h and
   limits.h; Use state helper instead of CRTC state pointer
 - panfrost: Support cache-coherent integrations; Fix mutex corruption on
   open/close; Cleanups
 - qxl: Cleanups
 - radeon: Switch to new TTM allocator
 - ticdc: Fix build failure
 - vmwgfx: Switch to new TTM allocator
 - xlnx: Use dma_request_chan

 - fbdev/sh_mobile: Cleanups

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-11-05

for you to fetch changes up to 24e146cdf9f5a8fb464dd98ba8357d662d37d22f:

  drm: unify formatting for color management documentation (2020-11-04 17:4=
7:57 +0100)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

 - arch/arm64: Describe G12b GPU as coherent
 - iommu: Support coherency for Mali LPAE

Core Changes:

 - atomic: Pass full state to CRTC atomic_{check, begin, flush}(); Use
   atomic-state pointers
 - drm: Remove SCATTER_LIST_MAX_SEGMENT; Cleanups
 - doc: Document legacy_cursor_update better; cleanups
 - edid: Don't warn n EDIDs of zero
 - ttm: New backend allocation pool; Remove old page allocator; Rework
   no_retry handling; Replace flags with booleans in struct ttm_operation_c=
tx
 - vram-helper: Cleanups

 - fbdev: Cleanups
 - console: Store font size as unsigned value

Driver Changes:

 - ast: Support new display mode
 - amdgpu: Switch to new TTM allocator
 - hisilicon: Cleanups
 - nouveau: Switch to new TTM allocator; Fix include of swiotbl.h and
   limits.h; Use state helper instead of CRTC state pointer
 - panfrost: Support cache-coherent integrations; Fix mutex corruption on
   open/close; Cleanupse
 - qxl: Cleanups
 - radeon: Switch to new TTM allocator
 - ticdc: Fix build failure
 - vmwgfx: Switch to new TTM allocator
 - xlnx: Use dma_request_chan

 - fbdev/sh_mobile: Cleanups

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tilcdc: avoid 'make W=3D2' build failure

Bernard Zhao (1):
      gpu/drm: delete same check in if condition

Boris Brezillon (1):
      drm/panfrost: Remove unused variables in panfrost_job_close()

Chris Wilson (1):
      drm: Quieten [zero] EDID carping

Christian K=F6nig (12):
      drm/ttm: new TT backend allocation pool v3
      drm/ttm: wire up the new pool as default one v2
      drm/amdgpu: switch to new allocator v2
      drm/radeon: switch to new allocator v2
      drm/nouveau: switch to new allocator
      drm/vmwgfx: switch to new allocator
      drm/qxl: drop ttm_page_alloc.h include
      drm/vram_helpers: drop ttm_page_alloc.h include
      drm/ttm: nuke old page allocator
      drm/nouveu: fix swiotlb include
      drm/ttm: rework no_retry handling v2
      drm/ttm: replace context flags with bools v2

Daniel Vetter (1):
      drm/doc: Document legacy_cursor_update better

Jason Gunthorpe (1):
      drm: Remove SCATTERLIST_MAX_SEGMENT

KuoHsiang Chou (1):
      drm/ast: Support 1600x900 with 108MHz PCLK

Linus Walleij (1):
      fbdev/sh_mobile: Drop unused include

Maxime Ripard (6):
      Merge drm/drm-next into drm-misc-next
      drm/nouveau/ttm: Add limits.h
      drm/atomic: Pass the full state to CRTC atomic_check
      drm/atomic: Pass the full state to CRTC atomic begin and flush
      drm/nouveau/kms/nv50-: Use state helper instead of crtc pointer
      drm: Use the state pointer directly in atomic_check

Peilin Ye (2):
      fbdev/atafb: Remove unused extern variables
      Fonts: Make font size unsigned in font_desc

Peter Ujfalusi (1):
      drm: xlnx: Use dma_request_chan for DMA channel request

Robin Murphy (3):
      iommu/io-pgtable-arm: Support coherency for Mali LPAE
      drm/panfrost: Support cache-coherent integrations
      arm64: dts: meson: Describe G12b GPU as coherent

Simon Ser (1):
      drm: unify formatting for color management documentation

Steven Price (1):
      drm/panfrost: Don't corrupt the queue mutex on open/close

Thomas Zimmermann (1):
      drivers/video: Fix -Wstringop-truncation in hdmi.c

Tian Tao (1):
      drm/hisilicon: Adding a const declaration to an invariant construct

Yejune Deng (1):
      drm/panfrost: Replace devm_reset_control_array_get()

 .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
 .../bindings/display/panel/novatek,nt36672a.yaml   |   87 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |    3 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |   11 +
 .../bindings/display/ti/ti,j721e-dss.yaml          |   11 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/driver-api/dma-buf.rst               |    9 +
 Documentation/gpu/drm-mm.rst                       |    4 +-
 Documentation/gpu/todo.rst                         |   16 +-
 Documentation/gpu/vkms.rst                         |   99 +-
 MAINTAINERS                                        |   11 +-
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |    4 +
 drivers/dma-buf/dma-buf.c                          |   63 +-
 drivers/dma-buf/dma-resv.c                         |    2 +-
 drivers/dma-buf/heaps/heap-helpers.c               |   10 +-
 drivers/gpu/drm/Kconfig                            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |    5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   94 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  209 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   14 +-
 drivers/gpu/drm/arc/arcpgu_crtc.c                  |    4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   22 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |   16 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.h    |    2 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |    6 +-
 drivers/gpu/drm/arm/malidp_crtc.c                  |   26 +-
 drivers/gpu/drm/armada/armada_crtc.c               |   22 +-
 drivers/gpu/drm/armada/armada_drv.c                |    3 -
 drivers/gpu/drm/armada/armada_gem.c                |   12 +-
 drivers/gpu/drm/armada/armada_gem.h                |    2 -
 drivers/gpu/drm/aspeed/Kconfig                     |    1 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h                |    2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   78 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   38 +-
 drivers/gpu/drm/ast/ast_tables.h                   |    2 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   11 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |    6 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |    2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1850 ++++++++++++++++=
++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  390 +++++
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |    2 +-
 drivers/gpu/drm/bridge/tc358764.c                  |  107 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   43 +-
 drivers/gpu/drm/drm_atomic.c                       |   39 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   34 +-
 drivers/gpu/drm/drm_bridge_connector.c             |    2 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |    4 +-
 drivers/gpu/drm/drm_connector.c                    |    5 +
 drivers/gpu/drm/drm_dp_aux_dev.c                   |    2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |    7 +-
 drivers/gpu/drm/drm_edid.c                         |    4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   26 +-
 drivers/gpu/drm/drm_fourcc.c                       |    1 +
 drivers/gpu/drm/drm_gem.c                          |   53 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |   28 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   17 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  180 +-
 drivers/gpu/drm/drm_internal.h                     |    8 +-
 drivers/gpu/drm/drm_ioctl.c                        |    2 +-
 drivers/gpu/drm/drm_pci.c                          |    6 +-
 drivers/gpu/drm/drm_prime.c                        |   33 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |   14 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   13 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   19 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |   13 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   10 -
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |   15 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |    8 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    7 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    2 +
 drivers/gpu/drm/gma500/gem.c                       |   18 +-
 drivers/gpu/drm/gma500/gem.h                       |    3 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    9 -
 drivers/gpu/drm/gma500/psb_drv.h                   |    2 -
 drivers/gpu/drm/hisilicon/hibmc/Makefile           |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   93 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   20 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   33 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |   99 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   42 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    8 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   21 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    3 -
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   18 +-
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c   |   14 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    4 -
 drivers/gpu/drm/i915/i915_scatterlist.h            |    2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    3 -
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |   13 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |   14 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |    2 -
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |   16 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  304 +++-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |    3 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |    4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   20 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    5 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   11 +
 drivers/gpu/drm/meson/meson_crtc.c                 |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   34 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   21 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   13 -
 drivers/gpu/drm/msm/msm_drv.h                      |    1 -
 drivers/gpu/drm/msm/msm_gem.c                      |   19 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   16 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   11 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  295 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    4 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   14 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    1 -
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   14 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h              |    2 +
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    8 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    4 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    2 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   19 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   34 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |   21 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    9 -
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   18 +-
 drivers/gpu/drm/omapdrm/omap_gem.h                 |    2 -
 drivers/gpu/drm/panel/Kconfig                      |   21 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |  711 ++++++++
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   20 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |   14 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    7 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    2 +-
 drivers/gpu/drm/panel/panel-simple.c               |   29 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    2 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |  250 +++
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |    7 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    7 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   10 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |    1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    2 +
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    2 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   61 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    1 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |    5 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |    2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   13 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    1 -
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |    4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |   72 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |   25 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |    4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |  110 +-
 drivers/gpu/drm/radeon/radeon.h                    |    1 -
 drivers/gpu/drm/radeon/radeon_display.c            |    9 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   23 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |   31 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  126 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    7 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  232 +--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   21 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    5 -
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   18 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    3 +
 drivers/gpu/drm/sti/sti_crtc.c                     |    6 +-
 drivers/gpu/drm/stm/ltdc.c                         |    6 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |   17 +-
 drivers/gpu/drm/tegra/dc.c                         |   18 +-
 drivers/gpu/drm/tegra/drm.c                        |    4 -
 drivers/gpu/drm/tegra/gem.c                        |   31 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   20 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    2 +
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   70 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   42 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |    7 +-
 drivers/gpu/drm/ttm/Makefile                       |    5 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |    5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  201 +--
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  103 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   43 +-
 drivers/gpu/drm/ttm/ttm_memory.c                   |   13 +-
 drivers/gpu/drm/ttm/ttm_page_alloc.c               | 1189 -------------
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c           | 1239 -------------
 drivers/gpu/drm/ttm/ttm_pool.c                     |  667 +++++++
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    2 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   12 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  256 +--
 drivers/gpu/drm/tve200/tve200_drv.c                |    4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    6 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   21 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   19 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   12 -
 drivers/gpu/drm/vc4/vc4_drv.h                      |    4 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   25 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    4 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   19 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   21 +-
 drivers/gpu/drm/via/via_mm.c                       |    2 +-
 drivers/gpu/drm/virtio/Makefile                    |    2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |   26 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    8 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   79 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  185 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   34 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   37 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   23 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   46 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  156 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c              |  164 ++
 drivers/gpu/drm/vkms/Makefile                      |    1 -
 drivers/gpu/drm/vkms/vkms_composer.c               |   17 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   24 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   30 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   29 -
 drivers/gpu/drm/vkms/vkms_gem.c                    |  248 ---
 drivers/gpu/drm/vkms/vkms_plane.c                  |   13 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   95 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  231 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    2 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |   44 +-
 drivers/gpu/drm/xen/xen_drm_front.h                |    2 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |   15 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   18 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   14 +-
 drivers/gpu/drm/zte/zx_vou.c                       |    6 +-
 drivers/gpu/vga/vga_switcheroo.c                   |    7 +-
 drivers/iommu/io-pgtable-arm.c                     |   11 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   17 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   19 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   21 +-
 drivers/misc/fastrpc.c                             |    6 +-
 drivers/video/console/sticore.c                    |    2 +-
 drivers/video/fbdev/atafb.c                        |    8 -
 drivers/video/fbdev/aty/radeon_base.c              |    4 +-
 drivers/video/fbdev/cirrusfb.c                     |    3 +-
 drivers/video/fbdev/core/fbmem.c                   |   44 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |    3 +-
 drivers/video/fbdev/matrox/matroxfb_base.c         |    8 +-
 drivers/video/fbdev/mx3fb.c                        |    2 -
 drivers/video/fbdev/nvidia/nv_of.c                 |    3 +-
 .../omap2/omapfb/displays/connector-analog-tv.c    |    7 +-
 .../fbdev/omap2/omapfb/displays/connector-dvi.c    |    7 +-
 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |    7 +-
 .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  |    7 +-
 .../omapfb/displays/panel-sharp-ls037v7dw01.c      |    7 +-
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   |    7 +-
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |    7 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c  |   10 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c  |   10 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c    |   10 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c    |   16 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c        |    6 +-
 drivers/video/fbdev/omap2/omapfb/dss/video-pll.c   |   20 +-
 drivers/video/fbdev/sbuslib.c                      |  124 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    7 +-
 drivers/video/fbdev/sis/300vtbl.h                  |    2 -
 drivers/video/fbdev/sis/sis_accel.h                |   14 +-
 drivers/video/hdmi.c                               |    8 +-
 include/drm/drm_atomic.h                           |   12 +-
 include/drm/drm_dp_helper.h                        |   72 +-
 include/drm/drm_drv.h                              |   85 +-
 include/drm/drm_gem.h                              |    2 +-
 include/drm/drm_gem_vram_helper.h                  |    3 -
 include/drm/drm_mode_config.h                      |   13 +
 include/drm/drm_modeset_helper_vtables.h           |   22 +-
 include/drm/drm_prime.h                            |    5 +-
 include/drm/ttm/ttm_bo_api.h                       |   98 +-
 include/drm/ttm/ttm_bo_driver.h                    |  107 +-
 include/drm/ttm/ttm_caching.h                      |   36 +
 include/drm/ttm/ttm_page_alloc.h                   |  122 --
 include/drm/ttm/ttm_placement.h                    |   15 -
 include/drm/ttm/ttm_pool.h                         |   91 +
 include/drm/ttm/ttm_resource.h                     |   12 +-
 include/drm/ttm/ttm_set_memory.h                   |  150 --
 include/drm/ttm/ttm_tt.h                           |   82 +-
 include/linux/dma-buf-map.h                        |  193 ++
 include/linux/dma-buf.h                            |   14 +-
 include/linux/font.h                               |    2 +-
 include/linux/platform_data/shmob_drm.h            |    2 -
 include/linux/scatterlist.h                        |    6 -
 include/uapi/drm/drm_fourcc.h                      |   41 +-
 include/uapi/drm/virtgpu_drm.h                     |   39 +-
 include/uapi/linux/virtio_gpu.h                    |   78 +
 tools/testing/scatterlist/main.c                   |    2 +-
 318 files changed, 8618 insertions(+), 6228 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analog=
ix,anx7625.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek=
,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 create mode 100644 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
 delete mode 100644 drivers/gpu/drm/ttm/ttm_page_alloc.c
 delete mode 100644 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_pool.c
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_vram.c
 delete mode 100644 drivers/gpu/drm/vkms/vkms_gem.c
 create mode 100644 include/drm/ttm/ttm_caching.h
 delete mode 100644 include/drm/ttm/ttm_page_alloc.h
 create mode 100644 include/drm/ttm/ttm_pool.h
 delete mode 100644 include/drm/ttm/ttm_set_memory.h
 create mode 100644 include/linux/dma-buf-map.h

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
