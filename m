Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45C171804
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695D66EC97;
	Thu, 27 Feb 2020 12:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5853D6E838
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 11:32:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 511D35BF;
 Thu, 27 Feb 2020 06:32:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Feb 2020 06:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=M3vxrPA8sBw0jLdJiz0cKBAEd2+WY0vy8ENByb+QUbs=; b=C9RAO0kA
 uc2/rWt+VBPGiHq/JR0ii3jKnqSYTGL1cRVl/fZ256TUUDLnVo77V8qY7KoIOQw/
 hqk+r2OY9HxdDQZ4tYTlrpLQnveerVRDz9iIIZ/Va+iNiJvz0G/VVswo87PYjWEj
 OE6y5qgGihgmF/X2CHGS4X4rz2r82Vs0jARIDDdNw7h9K+SlVeRaogpdevwjigGu
 gQu9bLe72anpFiFgFZOWTegmarlqCEFhcIijNZ9xdviRTcBWO2pCNpTw1wD4/p3Y
 mC+gYNBWDpcnW5t8RVmMPUA0mJdY2os7+zw25T2Im0derDZWFq+/drp2svwi7kjM
 ygtQi5KiEOJDOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=M3vxrPA8sBw0jLdJiz0cKBAEd2+WY
 0vy8ENByb+QUbs=; b=VDYlhTI9eThsWCoZNCEsIvG0sjqbtaGd47iejHmeDk4O2
 A97ZNOEQjlLokVJsKj9+x1LWHA1KmOCBgPIAs6EhRCG3wBddp4O0SoOW9a0CAz9u
 J0C2GevWmNCzErsjWaUbztPBZP5tCPMh+OMkfA/6NKUzATe/uV+WJzdE78Cpu3cF
 Z4TdxZiJouL6ayrCndRcluJ6DkK8fqkF4W79vbMwBuUHkhwCN9ZzJ0glatCoNnhX
 NCZvTa5lJYMUxmGYBT6iuEqv0Nd+vvXIH+a+ZzIcMH5JRdf4c9S2sIINiR/iAm0F
 i10tbd/wH8YZDV3nh3iYLLATMAVEJD8HZOWqFAyKw==
X-ME-Sender: <xms:yahXXjNDhw9mVY9PiTnRmWlFSMqBIqVsvSc2rOOuZN8dZfuldV2GFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeigdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepfh
 hrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yahXXku3MJ8u22PYLL0oi1kDsZrY-p1on3SFrBOnaVh8rtaa4yV-9g>
 <xmx:yahXXrF57w_BPCVWL5qryIECw1FiJ55sJopKnDE5NK47DybjjqJnSg>
 <xmx:yahXXsYD-QBsMhlXNeWB6bfaX_0lwmTJUovYtJDwxlzD8FeMzgD9nA>
 <xmx:yahXXrBC8XhFlZRrl3lzN0oCU1QnSBGngy-E-ORUNe4pI4OhBV562j5SrWo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0134B3280059;
 Thu, 27 Feb 2020 06:32:24 -0500 (EST)
Date: Thu, 27 Feb 2020 12:32:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200227113222.cdwzy4cvcqjtbmou@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Content-Type: multipart/mixed; boundary="===============1366317105=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1366317105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofq4swa6gkauap6z"
Content-Disposition: inline


--ofq4swa6gkauap6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-next PR.

Thank!
Maxime


drm-misc-next-2020-02-27:
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - bridge: huge rework to get rid of omap_dss custom display drivers

Driver Changes:
  - hisilicon: some fixes related to modes it can deal with / default to
  - virtio: shmem and gpu context fixes and enhancements
  - sun4i: Support for LVDS on the A33
The following changes since commit d718e53a48f7bcfa6cdd0c00d5ed1fb516595446:

  drm/sun4i: tcon: Support LVDS output on Allwinner A20 (2020-02-20 18:25:36 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-02-27

for you to fetch changes up to 18b39fb975b79d6526449ca7c8ab504bc92e2825:

  drm/virtio: add virtio_gpu_is_shmem helper (2020-02-27 11:31:34 +0100)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - bridge: huge rework to get rid of omap_dss custom display drivers

Driver Changes:
  - hisilicon: some fixes related to modes it can deal with / default to
  - virtio: shmem and gpu context fixes and enhancements
  - sun4i: Support for LVDS on the A33

----------------------------------------------------------------
Boris Brezillon (1):
      drm/bridge: panel: Propagate bus format/flags

Gurchetan Singh (6):
      drm/virtio: use consistent names for drm_files
      drm/virtio: factor out context create hypercall
      drm/virtio: track whether or not a context has been initiated
      drm/virtio: enqueue virtio_gpu_create_context after the first 3D ioctl
      drm/virtio: make mmap callback consistent with callbacks
      drm/virtio: add virtio_gpu_is_shmem helper

Laurent Pinchart (56):
      drm/bridge: lvds-codec: Add to_lvds_codec() function
      drm/bridge: lvds-codec: Constify the drm_bridge_funcs structure
      video: hdmi: Change return type of hdmi_avi_infoframe_init() to void
      drm/connector: Add helper to get a connector type name
      drm/edid: Add flag to drm_display_info to identify HDMI sinks
      drm/bridge: Document the drm_encoder.bridge_chain field as private
      drm/bridge: Fix atomic state ops documentation
      drm/bridge: Improve overview documentation
      drm/bridge: Add connector-related bridge operations and data
      drm/bridge: Add interlace_allowed flag to drm_bridge
      drm/bridge: Extend bridge API to disable connector creation
      drm/bridge: dumb-vga-dac: Rename internal symbols to simple-bridge
      drm/bridge: dumb-vga-dac: Rename driver to simple-bridge
      drm/bridge: simple-bridge: Add support for non-VGA bridges
      drm/bridge: simple-bridge: Add support for enable GPIO
      drm/bridge: simple-bridge: Add support for the TI OPA362
      drm/bridge: Add bridge driver for display connectors
      drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter
      drm/bridge: panel: Implement bridge connector operations
      drm/bridge: tfp410: Replace manual connector handling with bridge
      drm/bridge: tfp410: Allow operation without drm_connector
      drm: Add helper to create a connector for a chain of bridges
      drm/omap: dss: Cleanup DSS ports on initialisation failure
      drm/omap: Simplify HDMI mode and infoframe configuration
      drm/omap: Factor out display type to connector type conversion
      drm/omap: Use the drm_panel_bridge API
      drm/omap: dss: Fix output next device lookup in DT
      drm/omap: Add infrastructure to support drm_bridge local to DSS outputs
      drm/omap: dss: Make omap_dss_device_ops optional
      drm/omap: hdmi: Allocate EDID in the .read_edid() operation
      drm/omap: hdmi4: Rework EDID read to isolate data read
      drm/omap: hdmi5: Rework EDID read to isolate data read
      drm/omap: hdmi4: Register a drm_bridge for EDID read
      drm/omap: hdmi5: Register a drm_bridge for EDID read
      drm/omap: hdmi4: Move mode set, enable and disable operations to bridge
      drm/omap: hdmi5: Move mode set, enable and disable operations to bridge
      drm/omap: hdmi4: Implement drm_bridge .hpd_notify() operation
      drm/omap: dss: Remove .set_hdmi_mode() and .set_infoframe() operations
      drm/omap: venc: Register a drm_bridge
      drm/omap: Create connector for bridges
      drm/omap: Switch the HDMI and VENC outputs to drm_bridge
      drm/omap: Remove HPD, detect and EDID omapdss operations
      drm/omap: hdmi: Remove omap_dss_device operations
      drm/omap: venc: Remove omap_dss_device operations
      drm/omap: hdmi4: Simplify EDID read
      drm/omap: hdmi5: Simplify EDID read
      drm/omap: dpi: Sort includes alphabetically
      drm/omap: dpi: Reorder functions in sections
      drm/omap: dpi: Simplify clock setting API
      drm/omap: dpi: Register a drm_bridge
      drm/omap: sdi: Sort includes alphabetically
      drm/omap: sdi: Register a drm_bridge
      drm/omap: Hardcode omap_connector type to DSI
      drm/omap: dss: Inline the omapdss_display_get() function
      drm/omap: dss: Remove unused omapdss_of_find_connected_device() function
      drm/omap: dss: Remove unused omap_dss_device operations

Marek Szyprowski (1):
      drm/panel: ld9040: add MODULE_DEVICE_TABLE with SPI IDs

Maxime Ripard (1):
      drm/sun4i: tcon: Support LVDS on the A33

Nicolas Boichat (3):
      drm/panfrost: Improve error reporting in panfrost_gpu_power_on
      drm/panfrost: Add support for multiple regulators
      drm/panfrost: Add support for multiple power domains

Tian Tao (6):
      drm/hisilicon: Add new clock/resolution configurations
      drm/hisilicon: Enable the shadowfb for hibmc
      drm/hisilicon: fixed the wrong resolution configurations
      drm/hisilicon: Add the mode_valid function
      drm/hisilicon: Set preferred mode resolution and maximum resolution
      drm/hisilicon: Fixed pcie resource conflict between drm and firmware

Tomi Valkeinen (1):
      drm/panel: simple: fix osd070t1718_19ts sync drive edge

Torsten Duwe (2):
      drm/bridge: analogix-anx78xx: Fix drm_dp_link helper removal
      drm/bridge: analogix-anx6345: Avoid duplicate -supply suffix

Xinliang Liu (1):
      MAINTAINERS: Update myself email address

 Documentation/gpu/drm-kms-helpers.rst              |  18 +-
 Documentation/gpu/todo.rst                         |  14 +
 MAINTAINERS                                        |   5 +-
 arch/arm/configs/davinci_all_defconfig             |   2 +-
 arch/arm/configs/integrator_defconfig              |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/omap2plus_defconfig               |   7 +-
 arch/arm/configs/shmobile_defconfig                |   2 +-
 arch/arm/configs/sunxi_defconfig                   |   2 +-
 arch/arm/configs/versatile_defconfig               |   2 +-
 drivers/gpu/drm/Makefile                           |   3 +-
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |   2 +-
 drivers/gpu/drm/bridge/Kconfig                     |  29 +-
 drivers/gpu/drm/bridge/Makefile                    |   4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   8 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  12 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  13 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  10 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   6 +-
 drivers/gpu/drm/bridge/display-connector.c         | 295 ++++++++++++++++
 drivers/gpu/drm/bridge/dumb-vga-dac.c              | 300 ----------------
 drivers/gpu/drm/bridge/lvds-codec.c                |  21 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   8 +-
 drivers/gpu/drm/bridge/panel.c                     |  21 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |   8 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   5 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   8 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   3 +-
 drivers/gpu/drm/bridge/simple-bridge.c             | 342 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  10 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   8 +-
 drivers/gpu/drm/bridge/tc358764.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   9 +-
 drivers/gpu/drm/bridge/tc358768.c                  |   6 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   5 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   8 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 | 222 +++++-------
 drivers/gpu/drm/bridge/ti-tpd12s015.c              | 211 ++++++++++++
 drivers/gpu/drm/drm_bridge.c                       | 314 +++++++++++++++--
 drivers/gpu/drm/drm_bridge_connector.c             | 379 +++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                    |  15 +
 drivers/gpu/drm/drm_edid.c                         |  11 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |  23 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   9 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h   |   2 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  11 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |  10 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |   2 +-
 drivers/gpu/drm/imx/parallel-display.c             |   4 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c              |   2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  10 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   4 +-
 drivers/gpu/drm/msm/edp/edp.c                      |   2 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c               |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   2 +-
 drivers/gpu/drm/omapdrm/displays/Kconfig           |  22 --
 drivers/gpu/drm/omapdrm/displays/Makefile          |   4 -
 .../gpu/drm/omapdrm/displays/connector-analog-tv.c |  97 ------
 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c  | 183 ----------
 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c  | 137 --------
 .../gpu/drm/omapdrm/displays/encoder-tpd12s015.c   | 217 ------------
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    |   2 +-
 drivers/gpu/drm/omapdrm/dss/Makefile               |   2 +-
 drivers/gpu/drm/omapdrm/dss/base.c                 |  55 +--
 drivers/gpu/drm/omapdrm/dss/display.c              |   9 -
 drivers/gpu/drm/omapdrm/dss/dpi.c                  | 349 ++++++++++---------
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   4 +-
 drivers/gpu/drm/omapdrm/dss/dss-of.c               |  28 --
 drivers/gpu/drm/omapdrm/dss/dss.c                  |  58 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi.h                 |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                | 337 ++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c           |  59 +---
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.h           |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                | 313 +++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |  48 +--
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h           |   5 +-
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c    |   5 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |  46 +--
 drivers/gpu/drm/omapdrm/dss/output.c               |  53 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  | 192 +++++++----
 drivers/gpu/drm/omapdrm/dss/venc.c                 | 269 ++++++++-------
 drivers/gpu/drm/omapdrm/omap_connector.c           | 247 +-------------
 drivers/gpu/drm/omapdrm/omap_connector.h           |   3 -
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  90 +++--
 drivers/gpu/drm/omapdrm/omap_encoder.c             |  83 +----
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   6 +
 drivers/gpu/drm/panel/panel-simple.c               |   3 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         | 127 ++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h         |  26 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  30 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  11 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  11 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   2 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/stm/ltdc.c                         |   2 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   2 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   1 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |   2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   5 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |  78 +++--
 drivers/gpu/drm/virtio/virtgpu_kms.c               |  28 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |  11 +-
 drivers/video/hdmi.c                               |  11 +-
 include/drm/drm_bridge.h                           | 237 ++++++++++++-
 include/drm/drm_bridge_connector.h                 |  18 +
 include/drm/drm_connector.h                        |   9 +
 include/drm/drm_encoder.h                          |   3 +-
 include/linux/hdmi.h                               |   2 +-
 128 files changed, 3463 insertions(+), 2584 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/display-connector.c
 delete mode 100644 drivers/gpu/drm/bridge/dumb-vga-dac.c
 create mode 100644 drivers/gpu/drm/bridge/simple-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/ti-tpd12s015.c
 create mode 100644 drivers/gpu/drm/drm_bridge_connector.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/dss-of.c
 create mode 100644 include/drm/drm_bridge_connector.h

--ofq4swa6gkauap6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXleoxgAKCRDj7w1vZxhR
xWnaAPsEocBTz6ebR5Rx6AwJIf36prmFYhiAy+peeJ1F39/OJAD/RgZz0SFw2OAi
YZAxgfZd+GLUf/WvVzj5SkqGuoLpPw0=
=Qhhx
-----END PGP SIGNATURE-----

--ofq4swa6gkauap6z--

--===============1366317105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1366317105==--
