Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EFA757748
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F57F10E0A6;
	Tue, 18 Jul 2023 09:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A010E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NStuKb3H3p9R5yj2y47J2Mru4jII4rZwIeQsdZ3siZtF1jRGcD64ENFnFSHLlx6EHfiMQrq0ihCjtuu/kevtplvu9pcU3sjxgR5fb4hjWFvsbMas/LWwv0Hv+B1O+5Oy0f9DgkIL8G7098JudHTX3oFnlyn4Rh2pAXba/CypD/kFgrUyUol2g0Yb5/ifA6BscVXfYCQFKA0YSL1Z3NeaauZOZfEqEt5jcHNJMJs4+qWhq0a1qQOXNyNiXZ2D3l4A4WPvoJapQxfuaYUKazB3Si7wRNVky9h46cGBSsiyuMfOzMwPh0e1mao/hrnhL3gYcoVXpNzhjfj0ilK8CoWS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8dagVYEFiW77Q5BGYp2789vLjQ4FpqrUtejBFYgZ+o=;
 b=FzWWsGqFRovS0rLGkIk40Uytw43q1sgOP9hoxbRPJ70f6tU2dHwEYcJRypUs74GI/wkY/iCmCGMhGFHITcVNLroEwDby++ZSvjxnk6+lpOYPbievDw4XK9FhBKgzOlX8QdfJ2Y3xk2/KritD72FAHodgL+Xn8JNguoFjjKqP2DPEjUNgbdYUOERPbFoJ/QkUaSKKuk6eX232UBFMQY5jUzPp4ijWT5cdr2RlTafzzQDcBuL/5U0EH1QceblB+w0KaVLzNtgWtnyJm+yiN1nOFzF/H6T9kMp5G32EI/Qki0BvhncF0WDV2Oc1COky4Hh4XH71rOsNYn8j5MKQQNCK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8dagVYEFiW77Q5BGYp2789vLjQ4FpqrUtejBFYgZ+o=;
 b=chCTBtBMY8mkwlYbtW3WiM+6xVJHNdcbmqIjTsScoMLsXvry2igPxG3TYcKrtMY44TYhe4c9LbC9rqfCRxMTJ9UK+bT+pnxsZX90GZlPHQRCK168gfs0QGBrSWcOlMdmlmnV9TghHYObMmoAhsMWRHXiOwwkvqhT5K6DvJfkfKw=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by AS4PR04MB9714.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 09:00:25 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741%3]) with mapi id 15.20.6588.027; Tue, 18 Jul 2023
 09:00:25 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHX2kU9tVwb+/k68aHvm3zH4HK+/J8uAgAAR5CA=
Date: Tue, 18 Jul 2023 09:00:25 +0000
Message-ID: <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com> <3174425.5fSG56mABF@steina-w>
In-Reply-To: <3174425.5fSG56mABF@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|AS4PR04MB9714:EE_
x-ms-office365-filtering-correlation-id: 13a93f37-d644-4c27-0305-08db876d6cf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /APj+BKma91zP8bg4HlXyRp0lvPJVmIPbiIazmrtcIIIqeMQPsgj3nwcWUhBkETs68Eh0ZIR9CSP5JJG6lDX1d37EpWalu5zzSDMf03EcXEpJc0mXe2FaNsPhUOz/Fqc/w1LjmjppFTCDZez7UOWYRViYsDIAYn6T4wpVJ7r27lRvEaYbm0NAlO67VIjTlEa+NYqdxtY/j27x/W97EYdIi+BOjXtu19uEzynwycD0lWISc03sNqqkQ5o5jkQFaA3z7K9CC2XeEmURi1ttKdgiJniShVSL7+vvT792uN21RNBFs/FjsPgruIPYCgnR9WBAvs5nLq7Ywk1uS80J9YkOy8gPcONisjpxYyed4EMa3cIOOByrtzEHbpTKWcyy8+uNYiUb/rW/plST43rp6pLEnGo5v66w07Y5VMTyrgPA0ccxbczfntmGwgz7LIyKlfLt/ziA33LTIAB1mxvxoM7Ink0l8Vb1dBBFvayPZkmt4F6CyWlFHaxjWGq5/OQ6Y30+h2/fyxhF1Q7KM1LICnT+pSb/KyxYdae8X+1evqCiUdWK1IRD/VX4d4LvDgkZCShUNU//FeDSCS98k1PzrrHPKdNyRozN8vJ/VLXRR1FFFM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(86362001)(2906002)(33656002)(8676002)(8936002)(83380400001)(38070700005)(4326008)(316002)(41300700001)(7416002)(52536014)(5660300002)(122000001)(66556008)(66476007)(110136005)(54906003)(76116006)(66446008)(64756008)(38100700002)(66946007)(186003)(26005)(6506007)(53546011)(9686003)(478600001)(45080400002)(71200400001)(55016003)(966005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zKiWFlNog8gcKkLayknsLDzckIojArdbgxzbT5+FXeUjqVUYU5mT2BCFNg?=
 =?iso-8859-1?Q?D4u9NgeelOYZZJomDK6M05Bcf57zhNFIWL1J7UKF6X8L0/x0ldpzEc/YQs?=
 =?iso-8859-1?Q?PsF72zUcsMP6UalVG8MjnAk5e5bRNNr8JXF+tg5u88GWLVYD7+0N6TL65I?=
 =?iso-8859-1?Q?0Y427NAaPzXplaTEPmscoSGJ6x0UeYSKJ0Dwu4vsGeUMZpxZvdxZnzKUra?=
 =?iso-8859-1?Q?ebxuZGTCB/NTVEKMb1Z/6572nzwubKyKiqBQ9SRnJwotNgbTcRfk35Trp8?=
 =?iso-8859-1?Q?9stalLkC7ZiHyO8rQn+2quYrMtbfG/HyRPgtYLifRzJfk2D+lh5b4xzgHf?=
 =?iso-8859-1?Q?kGgJXKCh7HZKPBUEg+L6vznQ03YRiTZFRnovH2HyCd+1ivYHVl5Cpi4uLT?=
 =?iso-8859-1?Q?UZIgZC/i6zWpo0LhN4SI+ygDAz1i9jqSiDgZElGKs5wFyYRp2DUm067TLj?=
 =?iso-8859-1?Q?hGhwTXIlyAQ68j9YODnxzlW7zO9KGNRYVQYOY/D/7SEaKzHBDTTEDMcoQ5?=
 =?iso-8859-1?Q?UssM3LSxTpW7kbsoKvJVuWrVTunT5LtT3lVPH0ViraH6/+BVB9gqFN4gfg?=
 =?iso-8859-1?Q?EWxSztXGul3wMdZdM4+msw4WZcduJyNBBB0LVHMlhF9574lIthC/KKn20C?=
 =?iso-8859-1?Q?H70zplq1NcyTeCDNnZ/4VmUa7S2HA3wb3ktVbRpbXiP0t9yuxIY4znRYRr?=
 =?iso-8859-1?Q?xUzlPY1wQIiWZ9WQELA2dyPlU9JobY3CQj3nU734wmvze2Zyo0lKQ9RFEH?=
 =?iso-8859-1?Q?eaZAbS/PUHjloDej9XG4C0unG1zWZ14JPFE+v7viuTtOeFSsicjChVTBsM?=
 =?iso-8859-1?Q?Y4Kt8RNiuK5TNV9l8G65D/0T79F7WQ+LHKvpMSXkYtZ5TL9KfEtNdaSwMn?=
 =?iso-8859-1?Q?XW3BnKCJkp1M5DTzNHbo8af4xIE4siVhHtdKjTLRErRfJlUx2Fuw+9eupP?=
 =?iso-8859-1?Q?4aJvrN3EdLhlmA6iDmkfAMIE0sO1AxAxp/WSksH7WkWaNiI50WRbQ6ZMWc?=
 =?iso-8859-1?Q?O+bnBJoS4bJscMWNI1XO7reDkrjg/nF3NxtjPnzngmbC7IdR2m5eAhuqP7?=
 =?iso-8859-1?Q?mNMotn9rAakfzrY35z+Jks/c8ITd2YYk0AhA/T4RXEHEm7RrhoC1FNIqXA?=
 =?iso-8859-1?Q?a1RQ6MfSzbIcOFDEt/gz6rPUmfoTgdV0i7YH9iwD6Pxlwv4GUa3NvQQRCF?=
 =?iso-8859-1?Q?Zm/uN3KdcF1Qep7Dk55icrRNNQ+1H/Dlg0LrbWZ0W37zvAgq5g0KV7ad+8?=
 =?iso-8859-1?Q?kAHdyIfmKTT3pds2RD5UPwY+M3u2hH7IMlt6Mx9nK6UvHKJJ9HcprO7Qu2?=
 =?iso-8859-1?Q?/LjeJZK3VEm00RNukbHhaSeA3d3G5Kz4Jb7BOTl3nhCDmJUhQi2U76tquc?=
 =?iso-8859-1?Q?qK3oEjLR08dJ6XmJGT5B/1CSqHjONIqMuWJGrjUyU5sNa4dWHNg2yXQR9E?=
 =?iso-8859-1?Q?oCvGFq9B7CzwMtUoCePOMcjxgCtdboN3A7hUWK+rdCz9VrqrHb+gDundlC?=
 =?iso-8859-1?Q?qdsSg5shhAeWaQEBruscWUcvk/PLPogUPWbiV/6eWXqYJ/0RXHgrEmSbgb?=
 =?iso-8859-1?Q?44XcOT7WtUPazwXLvkBAe/YIxCE+vvN1twngmCxo0YOaJnVQ5t1ZX5l8gO?=
 =?iso-8859-1?Q?KTzsusf8rNrDU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a93f37-d644-4c27-0305-08db876d6cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 09:00:25.1872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /kMbV4JTYcoevkzrWhM/sI+gYHr2oieqO3cIdwbhl9eSezX2D8jkFp/mwclg1Ymi73JMaVDJlKeF1K54dOkt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9714
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

On Tuesday, July 18, 2023 3:49 PM Alexander Stein <alexander.stein@ew.tq-gr=
oup.com> wrote:
>
> Hi,

Hi,

>
> thanks for the patch.

Thanks for your review.

>
> Am Montag, 17. Juli 2023, 08:18:31 CEST schrieb Liu Ying:
> > Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> > controller and a Synopsys Designware MIPI DPHY.  Some configurations
> > and extensions to them are controlled by i.MX93 media blk-ctrl.
> >
> > Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> > bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig          |  10 +
> >  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
> >  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 934
> ++++++++++++++++++++
> >  3 files changed, 945 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig index
> 9fae28db6aa7..5182298c7182
> > 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -49,4 +49,14 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> >       Choose this to enable pixel link to display pixel
> interface(PXL2DPI)
> >       found in Freescale i.MX8qxp processor.
> >
> > +config DRM_IMX93_MIPI_DSI
> > +   tristate "Freescale i.MX93 specific extensions for Synopsys DW MIPI
> DSI"
> > +   depends on OF
> > +   depends on COMMON_CLK
> > +   select DRM_DW_MIPI_DSI
> > +   select GENERIC_PHY_MIPI_DPHY
> > +   help
> > +     Choose this to enable MIPI DSI controller found in Freescale
> i.MX93
> > +     processor.
> > +
> >  endif # ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> > b/drivers/gpu/drm/bridge/imx/Makefile index
> 8e2ebf3399a1..2b0c2e44aa1b
> > 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-
> combiner.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
> > +obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c new file mode 100644
> > index 000000000000..77f59e3407a0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>
> > [snip]
>
> > +static int imx93_dsi_probe(struct platform_device *pdev)
> > +{
> > +   struct device *dev =3D &pdev->dev;
> > +   struct device_node *np =3D dev->of_node;
> > +   struct imx93_dsi *dsi;
> > +   int ret;
> > +
> > +   dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > +   if (!dsi)
> > +           return -ENOMEM;
> > +
> > +   dsi->regmap =3D syscon_regmap_lookup_by_phandle(np, "fsl,media-
> blk-
> ctrl");
> > +   if (IS_ERR(dsi->regmap)) {
> > +           ret =3D PTR_ERR(dsi->regmap);
> > +           DRM_DEV_ERROR(dev, "failed to get block ctrl regmap:
> %d\n", ret);
>
> Could you use dev_err_probe here instead?

Maybe, it's better to keep using DRM_DEV_ERROR to achieve consistent
error log format across the driver which is implemented in drm_dev_printk()=
.
I see other DRM drivers do the same.

>
> > +           return ret;
> > +   }
> > +
> > +   dsi->clk_pixel =3D devm_clk_get(dev, "pix");
> > +   if (IS_ERR(dsi->clk_pixel)) {
> > +           ret =3D PTR_ERR(dsi->clk_pixel);
> > +           if (ret !=3D -EPROBE_DEFER)
> > +                   DRM_DEV_ERROR(dev, "failed to get pixel clock:
> %d\n", ret);
>
> Could you use dev_err_probe here instead?

Ditto.

>
> > +           return ret;
> > +   }
> > +
> > +   dsi->clk_cfg =3D devm_clk_get(dev, "phy_cfg");
> > +   if (IS_ERR(dsi->clk_cfg)) {
> > +           ret =3D PTR_ERR(dsi->clk_cfg);
> > +           if (ret !=3D -EPROBE_DEFER)
> > +                   DRM_DEV_ERROR(dev, "failed to get phy cfg clock:
> %d\n", ret);
> > +           return ret;
> > +   }
> > +
> > +   dsi->clk_ref =3D devm_clk_get(dev, "phy_ref");
> > +   if (IS_ERR(dsi->clk_ref)) {
> > +           ret =3D PTR_ERR(dsi->clk_ref);
> > +           if (ret !=3D -EPROBE_DEFER)
> > +                   DRM_DEV_ERROR(dev, "failed to get phy ref clock:
> %d\n", ret);
>
> Could you use dev_err_probe here instead?

Ditto.

>
> > +           return ret;
> > +   }
> > +
> > +   dsi->ref_clk_rate =3D clk_get_rate(dsi->clk_ref);
> > +   if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
> > +       dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
> > +           DRM_DEV_ERROR(dev, "invalid phy ref clock rate %lu\n",
> > +                         dsi->ref_clk_rate);
> > +           return -EINVAL;
> > +   }
> > +   DRM_DEV_DEBUG_DRIVER(dev, "phy ref clock rate: %lu\n", dsi-
> >ref_clk_rate);
> > +
> > +   dsi->dev =3D dev;
> > +   dsi->pdata.max_data_lanes =3D 4;
> > +   dsi->pdata.mode_valid =3D imx93_dsi_mode_valid;
> > +   dsi->pdata.mode_fixup =3D imx93_dsi_mode_fixup;
> > +   dsi->pdata.get_input_bus_fmts =3D imx93_dsi_get_input_bus_fmts;
> > +   dsi->pdata.phy_ops =3D &imx93_dsi_phy_ops;
> > +   dsi->pdata.host_ops =3D &imx93_dsi_host_ops;
> > +   dsi->pdata.priv_data =3D dsi;
> > +   platform_set_drvdata(pdev, dsi);
> > +
> > +   dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
> > +   if (IS_ERR(dsi->dmd)) {
> > +           ret =3D PTR_ERR(dsi->dmd);
> > +           if (ret !=3D -EPROBE_DEFER)
> > +                   DRM_DEV_ERROR(dev, "failed to probe dw_mipi_dsi:
> %d\n", ret);
>
> Could you use dev_err_probe here instead?

Ditto.

Regards,
Liu Ying

>
> Best regards,
> Alexander
>
> > +           return ret;
> > +   }
> > +
> > +   return 0;
> > +}
> > +
> > +static void imx93_dsi_remove(struct platform_device *pdev)
> > +{
> > +   struct imx93_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +   dw_mipi_dsi_remove(dsi->dmd);
> > +}
> > +
> > +static const struct of_device_id imx93_dsi_dt_ids[] =3D {
> > +   { .compatible =3D "fsl,imx93-mipi-dsi", },
> > +   { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
> > +
> > +static struct platform_driver imx93_dsi_driver =3D {
> > +   .probe  =3D imx93_dsi_probe,
> > +   .remove_new =3D imx93_dsi_remove,
> > +   .driver =3D {
> > +           .of_match_table =3D imx93_dsi_dt_ids,
> > +           .name =3D "imx93_mipi_dsi",
> > +   },
> > +};
> > +module_platform_driver(imx93_dsi_driver);
> > +
> > +MODULE_DESCRIPTION("Freescale i.MX93 MIPI DSI driver");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL");
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.t/
> q-
> group.com%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7Cc42417f9a9484
> 3ead2b808db876380d3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638252633665634690%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> 7C%7C&sdata=3DGUWOZgHFFp0nKImw2aIAsaqMv9KtgI6%2BD%2BaOdDhJ%2B
> tU%3D&reserved=3D0
>

