Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572775780E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2594F10E30A;
	Tue, 18 Jul 2023 09:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD510E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689672665; x=1721208665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=57+ullO1ijISCv2nmZbVaR8CKu2emO90qj71uBLQ9hU=;
 b=niguQ2bkCWDWvE9eOgimRyedhd4L/qPU+gDJpolwAwkAB/zmxQAT2TCD
 KYAdUJyhwHW8k7NCx+WKdrBN5LcnMbZIlwfU2PbKR8TfQfZ+19+8NBoh0
 f2i7A+bA4oEDD50WvFUyipbRkrnvfhfPYFVUi84dd7IHn4KNvSLF/18Bb
 EQFeCT+sKND+lKUoQWczysBTRUSjS3MXm0UOXJCybBTw2U0l92eUi10N7
 Gx2crWihdoxnRchW047Sz3uhO5X9t6nLn1STYI0mVa0lWJy+Yh6ONKVMq
 PlG0Ax+yoTnFbZoBGKxS1OvLQdOFlqR6o1+GhJP+eaaMYvZxBXXNDauQr A==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684792800"; d="scan'208";a="31982646"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Jul 2023 11:31:02 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1428F280078;
 Tue, 18 Jul 2023 11:31:02 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Date: Tue, 18 Jul 2023 11:31:01 +0200
Message-ID: <8287028.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <3174425.5fSG56mABF@steina-w>
 <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Dienstag, 18. Juli 2023, 11:00:25 CEST schrieb Ying Liu:
> On Tuesday, July 18, 2023 3:49 PM Alexander Stein <alexander.stein@ew.tq-
group.com> wrote:
> > Hi,
>=20
> Hi,
>=20
> > thanks for the patch.
>=20
> Thanks for your review.
>=20
> > Am Montag, 17. Juli 2023, 08:18:31 CEST schrieb Liu Ying:
> > > Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> > > controller and a Synopsys Designware MIPI DPHY.  Some configurations
> > > and extensions to them are controlled by i.MX93 media blk-ctrl.
> > >=20
> > > Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> > > bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
> > >=20
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/bridge/imx/Kconfig          |  10 +
> > >  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
> > >  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 934
> >=20
> > ++++++++++++++++++++
> >=20
> > >  3 files changed, 945 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > > b/drivers/gpu/drm/bridge/imx/Kconfig index
> >=20
> > 9fae28db6aa7..5182298c7182
> >=20
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > @@ -49,4 +49,14 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> > >=20
> > >       Choose this to enable pixel link to display pixel
> >=20
> > interface(PXL2DPI)
> >=20
> > >       found in Freescale i.MX8qxp processor.
> > >=20
> > > +config DRM_IMX93_MIPI_DSI
> > > +   tristate "Freescale i.MX93 specific extensions for Synopsys DW MI=
PI
> >=20
> > DSI"
> >=20
> > > +   depends on OF
> > > +   depends on COMMON_CLK
> > > +   select DRM_DW_MIPI_DSI
> > > +   select GENERIC_PHY_MIPI_DPHY
> > > +   help
> > > +     Choose this to enable MIPI DSI controller found in Freescale
> >=20
> > i.MX93
> >=20
> > > +     processor.
> > > +
> > >=20
> > >  endif # ARCH_MXC || COMPILE_TEST
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> > > b/drivers/gpu/drm/bridge/imx/Makefile index
> >=20
> > 8e2ebf3399a1..2b0c2e44aa1b
> >=20
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > > @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> > >=20
> > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-
> >=20
> > combiner.o
> >=20
> > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
> > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
> > >=20
> > > +obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> > > diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > > b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c new file mode 100644
> > > index 000000000000..77f59e3407a0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > >=20
> > > [snip]
> > >=20
> > > +static int imx93_dsi_probe(struct platform_device *pdev)
> > > +{
> > > +   struct device *dev =3D &pdev->dev;
> > > +   struct device_node *np =3D dev->of_node;
> > > +   struct imx93_dsi *dsi;
> > > +   int ret;
> > > +
> > > +   dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > > +   if (!dsi)
> > > +           return -ENOMEM;
> > > +
> > > +   dsi->regmap =3D syscon_regmap_lookup_by_phandle(np, "fsl,media-
> >=20
> > blk-
> > ctrl");
> >=20
> > > +   if (IS_ERR(dsi->regmap)) {
> > > +           ret =3D PTR_ERR(dsi->regmap);
> >=20
> > > +           DRM_DEV_ERROR(dev, "failed to get block ctrl regmap:
> > %d\n", ret);
> >=20
> > Could you use dev_err_probe here instead?
>=20
> Maybe, it's better to keep using DRM_DEV_ERROR to achieve consistent
> error log format across the driver which is implemented in drm_dev_printk=
().
> I see other DRM drivers do the same.

I see your point. On the other hand the benefit of dev_err_probe() is that =
the=20
message of deferred probe can be seen in /sys/kernel/debug/devices_deferred.
Your check against EPROBE_DEFER will hide the message if something is not=20
correct.

Maybe a to be introduced DRM_DEV_ERROR_PROBE might be useful.

Best regards,
Alexander

> > > +           return ret;
> > > +   }
> > > +
> > > +   dsi->clk_pixel =3D devm_clk_get(dev, "pix");
> > > +   if (IS_ERR(dsi->clk_pixel)) {
> > > +           ret =3D PTR_ERR(dsi->clk_pixel);
> > > +           if (ret !=3D -EPROBE_DEFER)
> >=20
> > > +                   DRM_DEV_ERROR(dev, "failed to get pixel clock:
> > %d\n", ret);
> >=20
> > Could you use dev_err_probe here instead?
>=20
> Ditto.
>=20
> > > +           return ret;
> > > +   }
> > > +
> > > +   dsi->clk_cfg =3D devm_clk_get(dev, "phy_cfg");
> > > +   if (IS_ERR(dsi->clk_cfg)) {
> > > +           ret =3D PTR_ERR(dsi->clk_cfg);
> > > +           if (ret !=3D -EPROBE_DEFER)
> >=20
> > > +                   DRM_DEV_ERROR(dev, "failed to get phy cfg clock:
> > %d\n", ret);
> >=20
> > > +           return ret;
> > > +   }
> > > +
> > > +   dsi->clk_ref =3D devm_clk_get(dev, "phy_ref");
> > > +   if (IS_ERR(dsi->clk_ref)) {
> > > +           ret =3D PTR_ERR(dsi->clk_ref);
> > > +           if (ret !=3D -EPROBE_DEFER)
> >=20
> > > +                   DRM_DEV_ERROR(dev, "failed to get phy ref clock:
> > %d\n", ret);
> >=20
> > Could you use dev_err_probe here instead?
>=20
> Ditto.
>=20
> > > +           return ret;
> > > +   }
> > > +
> > > +   dsi->ref_clk_rate =3D clk_get_rate(dsi->clk_ref);
> > > +   if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
> > > +       dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
> > > +           DRM_DEV_ERROR(dev, "invalid phy ref clock rate %lu\n",
> > > +                         dsi->ref_clk_rate);
> > > +           return -EINVAL;
> > > +   }
> > > +   DRM_DEV_DEBUG_DRIVER(dev, "phy ref clock rate: %lu\n", dsi-
> > >
> > >ref_clk_rate);
> > >
> > > +
> > > +   dsi->dev =3D dev;
> > > +   dsi->pdata.max_data_lanes =3D 4;
> > > +   dsi->pdata.mode_valid =3D imx93_dsi_mode_valid;
> > > +   dsi->pdata.mode_fixup =3D imx93_dsi_mode_fixup;
> > > +   dsi->pdata.get_input_bus_fmts =3D imx93_dsi_get_input_bus_fmts;
> > > +   dsi->pdata.phy_ops =3D &imx93_dsi_phy_ops;
> > > +   dsi->pdata.host_ops =3D &imx93_dsi_host_ops;
> > > +   dsi->pdata.priv_data =3D dsi;
> > > +   platform_set_drvdata(pdev, dsi);
> > > +
> > > +   dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
> > > +   if (IS_ERR(dsi->dmd)) {
> > > +           ret =3D PTR_ERR(dsi->dmd);
> > > +           if (ret !=3D -EPROBE_DEFER)
> >=20
> > > +                   DRM_DEV_ERROR(dev, "failed to probe dw_mipi_dsi:
> > %d\n", ret);
> >=20
> > Could you use dev_err_probe here instead?
>=20
> Ditto.
>=20
> Regards,
> Liu Ying
>=20
> > Best regards,
> > Alexander
> >=20
> > > +           return ret;
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static void imx93_dsi_remove(struct platform_device *pdev)
> > > +{
> > > +   struct imx93_dsi *dsi =3D platform_get_drvdata(pdev);
> > > +
> > > +   dw_mipi_dsi_remove(dsi->dmd);
> > > +}
> > > +
> > > +static const struct of_device_id imx93_dsi_dt_ids[] =3D {
> > > +   { .compatible =3D "fsl,imx93-mipi-dsi", },
> > > +   { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
> > > +
> > > +static struct platform_driver imx93_dsi_driver =3D {
> > > +   .probe  =3D imx93_dsi_probe,
> > > +   .remove_new =3D imx93_dsi_remove,
> > > +   .driver =3D {
> > > +           .of_match_table =3D imx93_dsi_dt_ids,
> > > +           .name =3D "imx93_mipi_dsi",
> > > +   },
> > > +};
> > > +module_platform_driver(imx93_dsi_driver);
> > > +
> > > +MODULE_DESCRIPTION("Freescale i.MX93 MIPI DSI driver");
> > > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > > +MODULE_LICENSE("GPL");
> >=20
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.t/
> > q-
> > group.com%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7Cc42417f9a9484
> > 3ead2b808db876380d3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > %7C638252633665634690%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> > 7C%7C&sdata=3DGUWOZgHFFp0nKImw2aIAsaqMv9KtgI6%2BD%2BaOdDhJ%2B
> > tU%3D&reserved=3D0


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


