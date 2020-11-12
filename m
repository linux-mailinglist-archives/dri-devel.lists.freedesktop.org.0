Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCA2B00C4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B046E17B;
	Thu, 12 Nov 2020 08:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A646E176;
 Thu, 12 Nov 2020 08:01:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F7FCAC17;
 Thu, 12 Nov 2020 08:01:17 +0000 (UTC)
Date: Thu, 12 Nov 2020 09:01:15 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20201112080115.GA7954@linux-uq9g>
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

here's this week's PR for drm-misc-next. There's a conflict between

  f644e3038f88 ("drm/nouveau: Fix out-of-bounds access when deferencing MMU=
 type")

and

  drm/nouveau/ttm: avoid using nouveau_drm.ttm.type_vram prior to nv50

which is in nouveau-fixes. They both resolve the same problem and the
nouveau tree should have precedence.

Best regards
Thomas

drm-misc-next-2020-11-12:
drm-misc-next for 5.11:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 - Remove pgprot_decrypt() before calling io_remap_pfn_range()
 - Revert "drm/dp_mst: Retrieve extended DPCD caps for topology manager"
 - ttm: Add multihop infrastructure
 - doc: Update dma-buf

Driver Changes:

 - amdgpu: Use TTM multihop
 - kmb: select DRM_MIPI_DSI and depend on ARCH_KEEMBAY; Fix build warning;
   Fix typos
 - nouveau: Use TTM multihop; Fix out-of-bounds access
 - radeon: Use TTM multihop
 - ingenic: Search for scaling coefficients to to 102% of screen size

The following changes since commit 512bce50a41c528fa15c4c014293e7bebf018658:

  Merge v5.10-rc3 into drm-next (2020-11-10 14:36:36 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-11-12

for you to fetch changes up to 05481f072787e96d08cc304cda0c10e0d02cdadc:

  drm/kmb: fix spelling mistakes in drm_info and drm_dbg messages (2020-11-=
11 22:00:05 +0100)

----------------------------------------------------------------
drm-misc-next for 5.11:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 - Remove pgprot_decrypt() before calling io_remap_pfn_range()
 - Revert "drm/dp_mst: Retrieve extended DPCD caps for topology manager"
 - ttm: Add multihop infrastructure
 - doc: Update dma-buf

Driver Changes:

 - amdgpu: Use TTM multihop
 - kmb: select DRM_MIPI_DSI and depend on ARCH_KEEMBAY; Fix build warning;
   Fix typos
 - nouveau: Use TTM multihop; Fix out-of-bounds access
 - radeon: Use TTM multihop
 - ingenic: Search for scaling coefficients to to 102% of screen size

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/virt: fix handling of the atomic flag

Alex Shi (1):
      video: fbdev: riva: remove some unused varibles

Alexander A. Klimov (1):
      drm: omapdrm: Replace HTTP links with HTTPS ones

Alexandru Gagniuc (3):
      drm/bridge: sii902x: Refactor init code into separate function
      dt-bindings: display: sii902x: Add supply bindings
      drm/bridge: sii902x: Enable I/O and core VCC supplies if present

Anitha Chrisanthus (8):
      dt-bindings: display: Add support for Intel KeemBay Display
      dt-bindings: display: Intel KeemBay MSSCAM
      dt-bindings: display: bridge: Intel KeemBay DSI
      drm/kmb: Keem Bay driver register definition
      drm/kmb: Add support for KeemBay Display
      drm/kmb: Mipi DSI part of the display driver
      drm/kmb: Build files for KeemBay Display driver
      drm/kmb: Fix build warnings

Biju Das (2):
      drm/panel: panel-simple: Add connector_type for EDT ETM0700G0DH6 panel
      drm/bridge: lvds-codec: Use dev_err_probe for error handling

Christian K=F6nig (4):
      mm: mmap: fix fput in error path v2
      mm: introduce vma_set_file function v4
      Revert "mm: introduce vma_set_file function v4"
      Revert "mm: mmap: fix fput in error path v2"

Colin Ian King (1):
      drm/kmb: fix spelling mistakes in drm_info and drm_dbg messages

Dan Carpenter (1):
      drm/virtio: Fix a double free in virtio_gpu_cmd_map()

Daniel Abrecht (1):
      drm: mxsfb: Implement .format_mod_supported

Daniel Vetter (4):
      drm/radeon: Stop changing the drm_driver struct
      drm: Compile out legacy chunks from struct drm_device
      drm: Allow const struct drm_driver
      drm/<drivers>: Constify struct drm_driver

Dave Airlie (4):
      drm/ttm: add multihop infrastrucutre (v3)
      drm/amdgpu/ttm: use multihop
      drm/nouveau/ttm: use multihop
      drm/radeon/ttm: use multihop

Deepak R Varma (3):
      drm/qxl: replace idr_init() by idr_init_base()
      drm/vc4: replace idr_init() by idr_init_base()
      drm/vgem: replace idr_init() by idr_init_base()

Dinghao Liu (1):
      drm/omap: Fix runtime PM imbalance on error

Dmitry Baryshkov (2):
      dt-bindings: display: bridge: Add documentation for LT9611UXC
      drm: bridge: add support for lontium LT9611UXC bridge

Geert Uytterhoeven (3):
      drm/fb_helper: Use min_t() to handle size_t and unsigned long
      drm: DRM_KMB_DISPLAY should select DRM_MIPI_DSI
      drm: DRM_KMB_DISPLAY should depend on ARCH_KEEMBAY

Jason Gunthorpe (1):
      drm: remove pgprot_decrypted() before calls to io_remap_pfn_range()

Jianxin Xiong (2):
      dma-buf: Fix static checker warning
      dma-buf: Document that dma-buf size is fixed

Koba Ko (1):
      Revert "drm/dp_mst: Retrieve extended DPCD caps for topology manager"

KuoHsiang Chou (2):
      drm/ast: Fixed 1920x1080 sync. polarity issue
      drm/ast: Create chip AST2600

Lee Jones (11):
      gpu/host1x: bus: Add missing description for 'driver'
      drm/panel: panel-simple: Fix 'struct panel_desc's header
      drm/panel: panel-ilitek-ili9322: Demote non-conformant kernel-doc hea=
der
      gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function '=
analogix_dp_write_byte_to_dpcd'
      drm/r128/ati_pcigart: Source file headers are not good candidates for=
 kernel-doc
      drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
      drm/mga/mga_state: Remove unused variable 'buf_priv'
      drm/omap: gem: Fix misnamed and missing parameter descriptions
      drm/omap: dmm_tiler: Demote abusive use of kernel-doc format
      drm/omap: omap_irq: Fix a couple of doc-rot issues
      drm/omap: dsi: Rework and remove a few unused variables

Luben Tuikov (1):
      drm/amdgpu: Make struct drm_driver const

Lyude Paul (1):
      drm/edid: Fix uninitialized variable in drm_cvt_modes()

Maxime Ripard (1):
      drm: Use state helper instead of CRTC state pointer

Michael Tretter (1):
      drm/encoder: remove obsolete documentation of bridge

Paul Cercueil (1):
      drm/ingenic: ipu: Search for scaling coefs up to 102% of the screen

Qinglang Miao (1):
      drm: panel: simple: add missing platform_driver_unregister() in panel=
_simple_init

Sergey Senozhatsky (1):
      drm/virtio: use kvmalloc for large allocations

Simon Ser (1):
      drm: document that blobs are ref'counted

Stephen Boyd (5):
      drm/bridge: ti-sn65dsi86: Combine register accesses in ti_sn_aux_tran=
sfer()
      drm/bridge: ti-sn65dsi86: Make polling a busy loop
      drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
      drm/bridge: ti-sn65dsi86: Update reply on aux failures
      drm/panel: simple: Add flags to boe_nv133fhm_n61

Thomas Zimmermann (18):
      drm/tiny/gm12u320: Retrieve USB device from struct drm_device.dev
      drm/udl: Retrieve USB device from struct drm_device.dev
      drm/vram-helper: Remove invariant parameters from internal kmap funct=
ion
      drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()
      drm/etnaviv: Remove empty etnaviv_gem_prime_vunmap()
      drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,vunmap}()
      drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers
      drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM backe=
nds
      drm/gem: Update internal GEM vmap/vunmap interfaces to use struct dma=
_buf_map
      drm/gem: Store client buffer mappings as struct dma_buf_map
      dma-buf-map: Add memcpy and pointer-increment interfaces
      drm/fb_helper: Support framebuffers in I/O memory
      drm/cma-helper: Make default object functions the default
      drm/gma500: Remove unused function psb_gem_get_aperture()
      drm/msm: Use struct dma_buf_map in GEM vmap ops
      drm/mediatek: Use struct dma_buf_map in GEM vmap ops
      Merge drm/drm-next into drm-misc-next
      drm/nouveau: Fix out-of-bounds access when deferencing MMU type

Tom Rix (1):
      drm: remove unneeded break

Wang Xiaojun (1):
      drm/tidss: use devm_platform_ioremap_resource_byname

YueHaibing (1):
      drm/bridge: tpd12s015: Fix irq registering in tpd12s015_probe

 .../bindings/display/bridge/intel,keembay-dsi.yaml |  101 ++
 .../bindings/display/bridge/lontium,lt9611.yaml    |    5 +-
 .../devicetree/bindings/display/bridge/sii902x.txt |    4 +
 .../bindings/display/intel,keembay-display.yaml    |   72 +
 .../bindings/display/intel,keembay-msscam.yaml     |   43 +
 Documentation/gpu/todo.rst                         |   37 +-
 MAINTAINERS                                        |    7 +
 drivers/dma-buf/dma-buf.c                          |    2 +-
 drivers/gpu/drm/Kconfig                            |    4 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   36 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h        |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  139 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    2 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    2 +-
 drivers/gpu/drm/armada/armada_crtc.c               |    8 +-
 drivers/gpu/drm/armada/armada_drv.c                |    7 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    2 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |   27 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   10 +-
 drivers/gpu/drm/ast/ast_main.c                     |    7 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    4 +-
 drivers/gpu/drm/ast/ast_tables.h                   |    4 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    2 +-
 drivers/gpu/drm/bochs/bochs_drv.c                  |    2 +-
 drivers/gpu/drm/bochs/bochs_kms.c                  |    1 -
 drivers/gpu/drm/bridge/Kconfig                     |   13 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |   88 --
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 1002 +++++++++++++
 drivers/gpu/drm/bridge/lvds-codec.c                |   11 +-
 drivers/gpu/drm/bridge/sii902x.c                   |  100 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  103 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |    2 +-
 drivers/gpu/drm/drm_client.c                       |   38 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |    7 +-
 drivers/gpu/drm/drm_drv.c                          |   17 +-
 drivers/gpu/drm/drm_edid.c                         |    2 +
 drivers/gpu/drm/drm_fb_helper.c                    |  250 +++-
 drivers/gpu/drm/drm_file.c                         |    2 +
 drivers/gpu/drm/drm_gem.c                          |   29 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |   74 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   48 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |   37 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |  120 +-
 drivers/gpu/drm/drm_internal.h                     |    5 +-
 drivers/gpu/drm/drm_prime.c                        |   14 +-
 drivers/gpu/drm/drm_vblank.c                       |   15 +-
 drivers/gpu/drm/drm_vm.c                           |    3 -
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |   14 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |   12 -
 drivers/gpu/drm/exynos/exynos_drm_gem.h            |    2 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    5 +-
 drivers/gpu/drm/gma500/gem.c                       |    6 -
 drivers/gpu/drm/gma500/psb_drv.c                   |    4 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    2 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h    |    2 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    2 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |    2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    9 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   23 +-
 drivers/gpu/drm/kmb/Kconfig                        |   13 +
 drivers/gpu/drm/kmb/Makefile                       |    2 +
 drivers/gpu/drm/kmb/kmb_crtc.c                     |  214 +++
 drivers/gpu/drm/kmb/kmb_drv.c                      |  602 ++++++++
 drivers/gpu/drm/kmb/kmb_drv.h                      |   88 ++
 drivers/gpu/drm/kmb/kmb_dsi.c                      | 1561 ++++++++++++++++=
++++
 drivers/gpu/drm/kmb/kmb_dsi.h                      |  387 +++++
 drivers/gpu/drm/kmb/kmb_plane.c                    |  522 +++++++
 drivers/gpu/drm/kmb/kmb_plane.h                    |   67 +
 drivers/gpu/drm/kmb/kmb_regs.h                     |  725 +++++++++
 drivers/gpu/drm/lima/lima_drv.c                    |    2 +-
 drivers/gpu/drm/lima/lima_gem.c                    |    6 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   11 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |    2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   15 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   20 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |    4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    2 +-
 drivers/gpu/drm/mga/mga_dma.c                      |   10 +-
 drivers/gpu/drm/mga/mga_state.c                    |    2 -
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   15 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    4 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    4 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   13 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    8 +
 drivers/gpu/drm/nouveau/Kconfig                    |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  120 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    2 -
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h              |    2 -
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   20 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c     |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c    |    3 -
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c   |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c    |    1 -
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    |    2 +-
 drivers/gpu/drm/omapdrm/dss/Kconfig                |    4 +-
 drivers/gpu/drm/omapdrm/dss/base.c                 |    2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    7 +-
 drivers/gpu/drm/omapdrm/dss/dispc.h                |    2 +-
 drivers/gpu/drm/omapdrm/dss/dispc_coefs.c          |    2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   16 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |    7 +-
 drivers/gpu/drm/omapdrm/dss/hdmi.h                 |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    8 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c            |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c           |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.h           |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    8 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h           |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_phy.c             |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c             |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi_wp.c              |    2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c    |    2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |    2 +-
 drivers/gpu/drm/omapdrm/dss/output.c               |    2 +-
 drivers/gpu/drm/omapdrm/dss/pll.c                  |    2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |    7 +-
 drivers/gpu/drm/omapdrm/dss/video-pll.c            |    2 +-
 drivers/gpu/drm/omapdrm/omap_connector.c           |    2 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |    2 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |    2 +-
 drivers/gpu/drm/omapdrm/omap_dmm_priv.h            |    2 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |    8 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.h           |    2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    4 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |    2 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c             |    2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                  |    2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |    5 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |    2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c                 |    8 +-
 drivers/gpu/drm/omapdrm/omap_plane.c               |    2 +-
 drivers/gpu/drm/omapdrm/tcm-sita.c                 |    2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |    2 +-
 drivers/gpu/drm/panel/panel-simple.c               |    8 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   14 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    3 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   15 +-
 drivers/gpu/drm/qxl/qxl_draw.c                     |   14 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   11 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |    1 -
 drivers/gpu/drm/qxl/qxl_kms.c                      |    4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |   31 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |    2 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |   12 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    3 +-
 drivers/gpu/drm/r128/ati_pcigart.c                 |    2 +-
 drivers/gpu/drm/radeon/radeon.h                    |    2 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   89 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    7 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |   49 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |   20 -
 drivers/gpu/drm/radeon/radeon_ttm.c                |  121 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   22 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h        |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    6 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    2 +-
 drivers/gpu/drm/sti/sti_drv.c                      |    2 +-
 drivers/gpu/drm/stm/drv.c                          |    2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    2 +-
 drivers/gpu/drm/tegra/dc.c                         |    8 +-
 drivers/gpu/drm/tegra/drm.c                        |    5 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |    9 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |    2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    4 +-
 drivers/gpu/drm/tiny/cirrus.c                      |   12 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   68 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    2 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    2 +-
 drivers/gpu/drm/tiny/repaper.c                     |    2 +-
 drivers/gpu/drm/tiny/st7586.c                      |    2 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   74 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   72 +
 drivers/gpu/drm/tve200/tve200_drv.c                |    2 +-
 drivers/gpu/drm/udl/udl_connector.c                |    8 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    5 +-
 drivers/gpu/drm/udl/udl_drv.h                      |    6 +-
 drivers/gpu/drm/udl/udl_main.c                     |   23 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    8 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   11 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |    7 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    2 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |    2 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   18 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |    2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |    5 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    4 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    2 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   15 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    3 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |    2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |   18 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h            |    6 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    2 +-
 drivers/gpu/drm/zte/zx_drm_drv.c                   |    2 +-
 drivers/gpu/host1x/bus.c                           |    1 +
 drivers/video/fbdev/core/fbmem.c                   |    5 -
 drivers/video/fbdev/riva/riva_hw.c                 |   14 +-
 include/drm/drm_client.h                           |    7 +-
 include/drm/drm_device.h                           |    4 +
 include/drm/drm_drv.h                              |    7 +-
 include/drm/drm_encoder.h                          |    1 -
 include/drm/drm_gem.h                              |    5 +-
 include/drm/drm_gem_cma_helper.h                   |    8 +-
 include/drm/drm_gem_shmem_helper.h                 |    4 +-
 include/drm/drm_gem_ttm_helper.h                   |    6 +
 include/drm/drm_gem_vram_helper.h                  |   14 +-
 include/drm/drm_mode_config.h                      |   12 -
 include/drm/ttm/ttm_bo_api.h                       |   28 +
 include/drm/ttm/ttm_bo_driver.h                    |    7 +-
 include/linux/dma-buf-map.h                        |   93 +-
 include/linux/dma-buf.h                            |    4 +-
 include/uapi/drm/drm_mode.h                        |    6 +
 249 files changed, 7023 insertions(+), 1412 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/intel,=
keembay-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay=
-display.yaml
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay=
-msscam.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611uxc.c
 create mode 100644 drivers/gpu/drm/kmb/Kconfig
 create mode 100644 drivers/gpu/drm/kmb/Makefile
 create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
 create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_dsi.h
 create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
 create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
 create mode 100644 drivers/gpu/drm/kmb/kmb_regs.h

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
