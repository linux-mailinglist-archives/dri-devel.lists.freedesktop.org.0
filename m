Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E541597C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD3D6ECFB;
	Thu, 23 Sep 2021 07:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E4C6ECF8;
 Thu, 23 Sep 2021 07:45:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id E988F580B9D;
 Thu, 23 Sep 2021 03:45:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Sep 2021 03:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=IiNcv8i9k7YhONvgNqsHUuyNXx7OvuqZE8RPgUYxxjw=; b=rUxV5fdG
 KLz/xpdfJ3ZS2luzQXhS8yDbQWVl3FpSBzFAXF/Vi13qA2DXIIUAAWI945xfIV4Y
 yaWQ7uTaExcCTXNdPjmii+8IPiumzcXcg1+wNw2157/Ko1k9Ob8QT3v4u7ODul7d
 tVNkyYoCpnhLYIceAULwnpKRjFSnSyMQXj6UOX08W2grCprF6a6jNaGvpha2upca
 JU99OzitZsZmjVnx3kyuyP5gmBM9nDAn+16+TQkotOax3p5HjHdStn6nDlwhUXcQ
 m7ejzScxuWPTGLRMLOHbFyl/IWYxSfNSVKS/ohQhiVPCSs2D7trfB2/pDqEfndPP
 nzxkDJ74zsDIAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=IiNcv8i9k7YhONvgNqsHUuyNXx7Ov
 uqZE8RPgUYxxjw=; b=AMJw8UBpdwRRFMYeZHu1zlAXOr4K32M1gXy8nih+oIDRO
 6wSc4ftxR5d7GkSbFSqOCfQiG3Yawb5MCkKNVKdFF6/1yfSFWhny2eVuoPa0YoVi
 Bc9xoi37eW08FiCg1I/jgRi7pll1Ae/05R3BTrWSOJC5XTayBQBlgqlNlWK2hohS
 VoCXBic1KoMX8ANONa1GBMUjXYWZb4CZHUTHqgLQrLsQV+xVEFnlmYWRCAh5UZ4S
 0FALjol8/PTnRqkA2qFjjWb1j66TKZsabDIJSw0jQG6KO0hqCGPGUnVcYsJSy6nK
 /U8ZNw5lgLLcJYXelvP8RCxxGP85zQHQ3h6c7YGVA==
X-ME-Sender: <xms:lTBMYWofFQnGIE2uX7pAQifrYIpik9rl-De-M8gb4r-IwRFQlqTT-w>
 <xme:lTBMYUq45QH5Xv7E5JSmdIlRZWjZLqs2uUFekQRBH7pGRbo8cBER0fQTYFmUtPjau
 2RQ7tgdPfjrtItaji0>
X-ME-Received: <xmr:lTBMYbNL-jmHd2R9jxEWNHZhc33wu2k4OqFihQFugUlfpjSZrUKLUaakRP4a5KlEE9mXJ777MC1GzcsJl8PmJX63i6FTIat55y5S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeikedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:lTBMYV55fNee_E1yAJKKBsjb75sLaAk6gJSmoH7kDhEU3-QPsmzi2g>
 <xmx:lTBMYV7l9Tfhsytdedo_8vSIoOG7jfNdu_zarPXU1ShZozpvV02E1A>
 <xmx:lTBMYVi5Uze_Gmfkqylx_Cw60zSPLwoSR-rKw57JBI-q70kPpzfJGg>
 <xmx:lTBMYaGtOgtETsWxq4iSeOZ-s-DDtqyZDyWAZJylDAfR9kmDplNWIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 03:45:25 -0400 (EDT)
Date: Thu, 23 Sep 2021 09:45:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20210923074522.zaja7mzxeimxf6g3@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e7eii4wumqybct7j"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e7eii4wumqybct7j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week PR for drm-misc-next

Maxime

drm-misc-next-2021-09-23:
drm-misc-next for 5.15:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
  - Conversions to dev_err_probe() helper
  - rockchip: Various build improvements, Use
    DRM_BRIDGE_ATTACH_NO_CONNECTOR for LVDS and RGB
  - panel: New panel-edp driver
The following changes since commit e4f868191138975f2fdf2f37c11318b47db4acc9:

  drm/v3d: fix wait for TMU write combiner flush (2021-09-15 18:43:37 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-09-23

for you to fetch changes up to 9c2fce137852e6434ca0c6fe3d75e00feb168c07:

  drm: Fix scaling_mode docs (2021-09-22 22:11:53 +0300)

----------------------------------------------------------------
drm-misc-next for 5.15:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

Driver Changes:
  - Conversions to dev_err_probe() helper
  - rockchip: Various build improvements, Use
    DRM_BRIDGE_ATTACH_NO_CONNECTOR for LVDS and RGB
  - panel: New panel-edp driver

----------------------------------------------------------------
Alex Bee (3):
      drm: bridge: it66121: Fix return value it66121_probe
      drm/rockchip: handle non-platform devices in rockchip_drm_endpoint_is=
_subdriver
      drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_a=
ttach

Alex Deucher (1):
      MAINTAINERS: add Andrey as the DRM GPU scheduler maintainer

Andy Yan (1):
      drm/rockchip: Check iommu itself instead of it's parent for device_is=
_available

Brian Norris (1):
      drm/rockchip: remove unused psr_list{,_lock}

Cai Huoqing (4):
      drm/sun4i: dsi: Make use of the helper function dev_err_probe()
      drm/sun4i: dw-hdmi: Make use of the helper function dev_err_probe()
      drm/v3d: Make use of the helper function devm_platform_ioremap_resour=
ce_byname()
      drm/rockchip: Make use of the helper function devm_platform_ioremap_r=
esource()

Douglas Anderson (15):
      dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels
      drm/edid: Break out reading block 0 of the EDID
      drm/edid: Allow querying/working with the panel ID from the EDID
      drm/edid: Use new encoded panel id style for quirks matching
      ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
      arm64: defconfig: Everyone who had PANEL_SIMPLE now gets PANEL_EDP
      drm/panel-edp: Split eDP panels out of panel-simple
      drm/panel-edp: Move some wayward panels to the eDP driver
      drm/panel-simple: Non-eDP panels don't need "HPD" handling
      drm/panel-edp: Split the delay structure out
      drm/panel-edp: Better describe eDP panel delays
      drm/panel-edp: hpd_reliable shouldn't be subtraced from hpd_absent
      drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle HPD
      drm/panel-edp: Don't re-read the EDID every time we power off the pan=
el
      drm/panel-edp: Implement generic "edp-panel"s probed by EDID

Jiapeng Chong (3):
      panfrost: make mediatek_mt8183_supplies and mediatek_mt8183_pm_domain=
s static
      drm/rockchip: dsi: Fix duplicate included linux/phy/phy.h
      drm/rockchip: dsi: make hstt_table static

Lukas Bulwahn (1):
      MAINTAINERS: fix typo in DRM DRIVER FOR SAMSUNG S6D27A1 PANELS

Maxime Ripard (1):
      drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c

Melissa Wen (1):
      drm/v3d: fix sched job resources cleanup when a job is aborted

Souptick Joarder (2):
      drm/rockchip: remove of_match_ptr() from vop_driver_dt_match
      drm/rockchip: remove of_match_ptr() from analogix dp driver

Steven Price (1):
      drm/panfrost: Calculate lock region size correctly

Ville Syrj=E4l=E4 (1):
      drm: Fix scaling_mode docs

Wolfram Sang (1):
      drm/panfrost: simplify getting .driver_data

liuyuntao (1):
      virtio-gpu: fix possible memory allocation failure

 .../bindings/display/panel/panel-edp.yaml          |  188 ++
 MAINTAINERS                                        |   10 +-
 arch/arm/configs/at91_dt_defconfig                 |    1 +
 arch/arm/configs/exynos_defconfig                  |    1 +
 arch/arm/configs/imx_v6_v7_defconfig               |    1 +
 arch/arm/configs/lpc32xx_defconfig                 |    1 +
 arch/arm/configs/multi_v5_defconfig                |    1 +
 arch/arm/configs/multi_v7_defconfig                |    1 +
 arch/arm/configs/omap2plus_defconfig               |    1 +
 arch/arm/configs/qcom_defconfig                    |    1 +
 arch/arm/configs/realview_defconfig                |    1 +
 arch/arm/configs/sama5_defconfig                   |    1 +
 arch/arm/configs/shmobile_defconfig                |    1 +
 arch/arm/configs/sunxi_defconfig                   |    1 +
 arch/arm/configs/tegra_defconfig                   |    1 +
 arch/arm/configs/versatile_defconfig               |    1 +
 arch/arm/configs/vexpress_defconfig                |    1 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/gpu/drm/bridge/ite-it66121.c               |   16 +-
 drivers/gpu/drm/bridge/panel.c                     |   37 +
 drivers/gpu/drm/drm_bridge.c                       |   34 -
 drivers/gpu/drm/drm_connector.c                    |    4 +-
 drivers/gpu/drm/drm_edid.c                         |  280 +--
 drivers/gpu/drm/panel/Kconfig                      |   16 +-
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  | 1895 ++++++++++++++++=
++++
 drivers/gpu/drm/panel/panel-simple.c               | 1072 +----------
 drivers/gpu/drm/panfrost/panfrost_device.c         |    6 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    4 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   30 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    3 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   14 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    2 -
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   33 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   26 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   14 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |   21 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    5 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   11 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    8 +-
 include/drm/drm_edid.h                             |   45 +
 45 files changed, 2522 insertions(+), 1281 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-e=
dp.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-edp.c

--e7eii4wumqybct7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUwwkgAKCRDj7w1vZxhR
xSIBAQDyXhX/azTZ0yc3BxXWIjF0Loa2Grkr6ZZ4OjP/R6Lp4gD/ay92dnAkKbdQ
Phr/aCUBr+6buqMtTROTrtTq4ZiqpQg=
=2pkA
-----END PGP SIGNATURE-----

--e7eii4wumqybct7j--
