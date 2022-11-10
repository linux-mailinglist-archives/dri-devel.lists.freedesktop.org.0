Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9545623D9D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F264D10E126;
	Thu, 10 Nov 2022 08:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49FC10E117;
 Thu, 10 Nov 2022 08:36:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42934580390;
 Thu, 10 Nov 2022 03:36:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 03:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1668069375; x=1668076575; bh=M61U7+aCfN05GVNCQYWtHj38PbQLQ2n7BkD
 dv0RScsY=; b=H985VBajhDMJnF3H+JFbGUNFb9XwoQfRo+G6kv/vdWySEjrSV7E
 q8BysbJSuysN0pypxyKKLpcL2rYuEQV6E6SFXi00zE2RebLPHFC5Sj+4OpL+9o72
 XbTYL1tIyUoGgo4INuiC89nMYhGRd78QWC0lmpl4Nft8cwIwsE0GM8VmnaJkLwTB
 Zp76aqa9yM48TrD3/ZciySGbXWHV95LWwx0MplcHGE0QKd5VsZwQTEtB71U9aTTq
 GATKD+nv9nO3URwYfSSDK+Am/+auKHbfB7HkZH8xxdOZ5sfI7YR6TNX2DTz4nd/1
 R8qOJq1N6sze7ANcJwuB0PnJvAyOER0E+Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668069375; x=
 1668076575; bh=M61U7+aCfN05GVNCQYWtHj38PbQLQ2n7BkDdv0RScsY=; b=f
 CAPNPRUGxDxcldFkbS8mhxnKfC2bueI5t0jxotcRva7QZD+eiubcpXgc0Fy3M0cY
 48xou9DLlBgeGJhur0vCEKlEiNp1z6gvAZFnrnjgcGPQcjdDK5ii5+oL11d1ILzZ
 09dFltc3gkvJMM+KwUNfuVO3Rvo2Fptgthmninl5gKoq6NhomYr7OTSmv1RyumuA
 EEr/eRisRsO76GVWZhYgdWyZiox7ZwOUodRQO9sfk4GUlLkhR0D1GAANnxJFniAP
 cQnIryc+ed37RJpXn0j9tw9wVsqXivx8M7RCssH5XcEap+oTml8OuNevtlV084Ub
 eYPggOaQh7RCadZYr8bdA==
X-ME-Sender: <xms:_rdsY8uzAFVEdpgE1gtJ9CcCYBtk5EW5mX0p-ztJXPe_ssZ12H8oqw>
 <xme:_rdsY5cL7-OCVvuLPvFf-VB6idG-OpcaCTwB2qOamvRZ0XcxoP79hvOPA8nT97DVO
 VCmCYmOD4BoepYJgH8>
X-ME-Received: <xmr:_rdsY3zxxWlnJkw89tN0QaSs17oOAe28UycadDolGLQ3NpBkkjVu9ch4E2xeFa1v3cTOagHVLrxWNya5LV7_lwCDkQYf5LuwnO4GRbI2YfLTew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekheejgeeuhfethffgheekhedufeduhfejgfehffekudefgedugffhkeefhfev
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:_rdsY_OlcEsg6UOt2q14U1rl9dM_YLJxwzrbtPmxu35-HwPkdE3QNQ>
 <xmx:_rdsY8--VkYMiXYrAZolPlNyDO5mkknVqu2p0Rjnj4utqPbJrAmYeg>
 <xmx:_rdsY3XUF8yA3VUZAgpmUqZ55yR-vbw51KoZ5VUxSB_CpefyyQO7Mw>
 <xmx:_7dsY4uPShAUYeRjHGwECM-zaSXGMdUx0uJABFCiycjWRNNhhGwjMg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 03:36:14 -0500 (EST)
Date: Thu, 10 Nov 2022 09:36:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20221110083612.g63eaocoaa554soh@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rk2ozsrex7tlsp5o"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rk2ozsrex7tlsp5o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next PR.

It looks like Daniel put a fixup for nouveau in drm-tip that I have to
remind you about :)

Maxime

drm-misc-next-2022-11-10-1:
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- atomic-helper: Add begin_fb_access and end_fb_access hooks
- fb-helper: Rework to move fb emulation into helpers
- scheduler: rework entity flush, kill and fini
- ttm: Optimize pool allocations

Driver Changes:
- amdgpu: scheduler rework
- hdlcd: Switch to DRM-managed resources
- ingenic: Fix registration error path
- lcdif: FIFO threshold tuning
- meson: Fix return type of cvbs' mode_valid
- ofdrm: multiple fixes (kconfig, types, endianness)
- sun4i: A100 and D1 support
- panel:
  - New Panel: Jadard JD9365DA-H3
The following changes since commit 60ba8c5bd94e17ab4b024f5cecf8b48e2cf36412:

  Merge tag 'drm-intel-gt-next-2022-11-03' of git://anongit.freedesktop.org=
/drm/drm-intel into drm-next (2022-11-04 17:33:34 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-11-10-1

for you to fetch changes up to 6b818c533dd8615a803a72733eace58fd06e5a3c:

  drm: panel: Add Jadard JD9365DA-H3 DSI panel (2022-11-09 10:40:56 +0100)

----------------------------------------------------------------
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- atomic-helper: Add begin_fb_access and end_fb_access hooks
- fb-helper: Rework to move fb emulation into helpers
- scheduler: rework entity flush, kill and fini
- ttm: Optimize pool allocations

Driver Changes:
- amdgpu: scheduler rework
- hdlcd: Switch to DRM-managed resources
- ingenic: Fix registration error path
- lcdif: FIFO threshold tuning
- meson: Fix return type of cvbs' mode_valid
- ofdrm: multiple fixes (kconfig, types, endianness)
- sun4i: A100 and D1 support
- panel:
  - New Panel: Jadard JD9365DA-H3

----------------------------------------------------------------
Christian K=F6nig (13):
      drm/scheduler: add drm_sched_job_add_resv_dependencies
      drm/amdgpu: use drm_sched_job_add_resv_dependencies for moves
      drm/amdgpu: drop the fence argument from amdgpu_vmid_grab
      drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab v2
      drm/amdgpu: cleanup scheduler job initialization v2
      drm/amdgpu: move explicit sync check into the CS
      drm/amdgpu: use scheduler dependencies for VM updates
      drm/amdgpu: use scheduler dependencies for UVD msgs
      drm/amdgpu: use scheduler dependencies for CS
      drm/scheduler: remove drm_sched_dependency_optimized
      drm/scheduler: rework entity flush, kill and fini
      drm/scheduler: rename dependency callback into prepare_job
      drm/ttm: optimize pool allocations a bit v2

Daniel Vetter (1):
      drm/fb-helper: Fix missing kerneldoc include

Danilo Krummrich (4):
      drm/arm/hdlcd: use drmm_* to allocate driver structures
      drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
      drm/arm/hdlcd: plane: use drm managed resources
      drm/arm/hdlcd: remove calls to drm_mode_config_cleanup()

Jagan Teki (4):
      dt-bindings: vendor-prefixes: Document Chongzhou
      dt-bindings: vendor-prefixes: Document Jadard
      dt-bindings: display: Document Jadard JD9365DA-H3 DSI panel
      drm: panel: Add Jadard JD9365DA-H3 DSI panel

Luben Tuikov (1):
      MAINTAINERS: Update GPU Scheduler email

Marek Vasut (1):
      drm: lcdif: Set and enable FIFO Panic threshold

Nathan Chancellor (1):
      drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()

Samuel Holland (4):
      dt-bindings: display: sun6i-dsi: Fix clock conditional
      dt-bindings: display: sun6i-dsi: Add the A100 variant
      drm/sun4i: dsi: Add a variant structure
      drm/sun4i: dsi: Add the A100 variant

Thomas Zimmermann (32):
      drm/ofdrm: Depend on CONFIG_MMU
      drm/ofdrm: Convert PCI IDs to CPU endianness for comparing
      drm/ofdrm: Cast error pointers to void __iomem *
      Merge drm/drm-next into drm-misc-next
      drm/komeda: Don't set struct drm_driver.lastclose
      drm/mcde: Don't set struct drm_driver.lastclose
      drm/vboxvideo: Don't set struct drm_driver.lastclose
      drm/amdgpu: Don't set struct drm_driver.output_poll_changed
      drm/imx/dcss: Don't set struct drm_driver.output_poll_changed
      drm/ingenic: Don't set struct drm_driver.output_poll_changed
      drm/logicvc: Don't set struct drm_driver.output_poll_changed
      drm/rockchip: Don't set struct drm_driver.output_poll_changed
      drm/panel-ili9341: Include <linux/backlight.h>
      drm/tve200: Include <linux/of.h>
      drm/fb-helper: Cleanup include statements in header file
      drm/fb_helper: Rename field fbdev to info in struct drm_fb_helper
      drm/fb-helper: Rename drm_fb_helper_alloc_fbi() to use _info postfix
      drm/fb-helper: Rename drm_fb_helper_unregister_fbi() to use _info pos=
tfix
      drm/fb-helper: Disconnect damage worker from update logic
      drm/fb-helper: Call fb_sync in I/O functions
      drm/fb-helper: Perform all fbdev I/O with the same implementation
      drm/fb_helper: Minimize damage-helper overhead
      drm/fb-helper: Always initialize generic fbdev emulation
      drm/fb-helper: Set flag in struct drm_fb_helper for leaking physical =
addresses
      drm/fb-helper: Move generic fbdev emulation into separate source file
      drm/fb-helper: Remove unnecessary include statements
      drm/fb-helper: Clarify use of last_close and output_poll_changed
      drm/fbdev: Include <linux/vmalloc.h>
      drm/hisilicon/hibmc: Include <linux/io.h> for readl() and writel()
      drm/fb-helper: Document struct drm_fb_helper.hint_leak_smem_start
      drm/atomic-helper: Add {begin,end}_fb_access to plane helpers
      drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap

Yuan Can (1):
      drm/ingenic: Fix missing platform_driver_unregister() call in ingenic=
_drm_init()

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml      |   30 +-
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |   70 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/gpu/drm-kms-helpers.rst              |    3 +
 MAINTAINERS                                        |    8 +-
 drivers/gpu/drm/Makefile                           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   71 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   17 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    2 -
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    2 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   25 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   43 +-
 drivers/gpu/drm/arm/hdlcd_drv.h                    |    2 +
 drivers/gpu/drm/arm/malidp_drv.c                   |    2 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |    6 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    2 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    1 +
 drivers/gpu/drm/ast/ast_drv.h                      |    1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    2 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   34 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |    1 -
 drivers/gpu/drm/drm_fb_helper.c                    | 1008 ++++++----------=
----
 drivers/gpu/drm/drm_fbdev_generic.c                |  494 ++++++++++
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   66 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    1 -
 drivers/gpu/drm/drm_probe_helper.c                 |    1 -
 drivers/gpu/drm/drm_simple_kms_helper.c            |   26 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    2 +-
 drivers/gpu/drm/gma500/framebuffer.c               |    6 +-
 drivers/gpu/drm/gud/gud_drv.c                      |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |    1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |    2 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    8 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    3 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |    2 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |    2 +-
 drivers/gpu/drm/imx/imx-tve.c                      |    1 -
 drivers/gpu/drm/imx/parallel-display.c             |    2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    9 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    2 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |    1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    2 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c             |    2 -
 drivers/gpu/drm/mcde/mcde_drv.c                    |    3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    7 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    1 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    1 -
 drivers/gpu/drm/msm/msm_fbdev.c                    |    4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    2 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   16 +
 drivers/gpu/drm/mxsfb/lcdif_regs.h                 |    1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |   27 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    6 +-
 drivers/gpu/drm/panel/Kconfig                      |   10 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    3 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  473 +++++++++
 drivers/gpu/drm/pl111/pl111_drv.c                  |    2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_drv.h                      |    1 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |    6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |    2 -
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |  196 ++--
 drivers/gpu/drm/scheduler/sched_main.c             |   81 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |    2 +-
 drivers/gpu/drm/sti/sti_drv.c                      |    2 +-
 drivers/gpu/drm/stm/drv.c                          |    2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   61 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h             |    7 +
 drivers/gpu/drm/tegra/fb.c                         |    8 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |    2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    2 +-
 drivers/gpu/drm/tiny/Kconfig                       |    2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    2 +-
 drivers/gpu/drm/tiny/bochs.c                       |    2 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    2 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    2 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    2 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    2 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   29 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    2 +-
 drivers/gpu/drm/tiny/repaper.c                     |    2 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    2 +-
 drivers/gpu/drm/tiny/st7586.c                      |    2 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   82 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    4 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |    1 -
 drivers/gpu/drm/vc4/vc4_drv.c                      |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    1 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |    1 -
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    2 +-
 include/drm/drm_fb_helper.h                        |   68 +-
 include/drm/drm_fbdev_generic.h                    |   15 +
 include/drm/drm_gem_atomic_helper.h                |   20 +-
 include/drm/drm_modeset_helper_vtables.h           |   41 +-
 include/drm/drm_simple_kms_helper.h                |   20 +
 include/drm/gpu_scheduler.h                        |   20 +-
 153 files changed, 2324 insertions(+), 1399 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jadard,=
jd9365da-h3.yaml
 create mode 100644 drivers/gpu/drm/drm_fbdev_generic.c
 create mode 100644 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 create mode 100644 include/drm/drm_fbdev_generic.h

--rk2ozsrex7tlsp5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2y3+wAKCRDj7w1vZxhR
xY2IAQDa35ZVC/0USDEc0u9VyzXFilA7ljUCgSv3rV6tEEVxgwEA89z7H7ol+axc
mnNlYK8/fBbGZf6JT4HP7uZAWP7mGAQ=
=pKfn
-----END PGP SIGNATURE-----

--rk2ozsrex7tlsp5o--
