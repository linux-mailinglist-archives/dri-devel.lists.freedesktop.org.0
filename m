Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B1757892
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA5910E0D4;
	Tue, 18 Jul 2023 09:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C419E10E0D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vgz4eM0aBzYkOjjvUFM84Mt6M1fSwOjl1hSyOzuIsT+7X6YheuD0HHWpvCHZvEQ4QjiT2HuM+iy6mIEkkWjftyUz/7e+sBj1VwPivRjg25IzmRXjQzWHSZoRYf49MXkwCf+uILBXOqQxpIOuIT/t6lcx0YZbF2lTKdCiDZKUd7N5dxu1XdgP6T4SySkJIWdo34KIYZ36VdI23u6tjAjjfxOvbK7o7g7nnbIaw9dEPKUUZE++Kz0Lw78UAN1G4tYgK+lkfkcLdjZu6tLAdkbTWUZPkiqXxkr9wPpvVtOdFI7fr6soYAHnSDketr6ht1GL9fAZHZh/YjwW9wce1BVtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8xk0UvsEVfLQOVM7YatA82eXb5eWHbtJ+fX/XAb8rE=;
 b=U0DrpmMlzciV63EmqaRdH3d0wLscbrZsAZTiRgIpyVhUAp1Uzl5qmmWP1LTmMcYJ7tKk+5RpIHhYZRhhTvxCAy4NIullZmPUzDo4BxwReofUCbgknVTBiowS8fZGOqKWsdg/1ueGEbHioO4FO0YvB+akLeNOy7x2cDAt8u/NUKLvdgdWP6TDSW5V7QfxZsqrYwfmNj4MW7CC9aN9Nh1IbRfRYJNEuHvji2+k6tiebp7F2rU7le8b+sPOtPb0xTuKYI6rKHANt/gnQ2Jx+vDPCUoRgeWhV+J8rYJ5twab/+tdPD3u8Q6Dbr3RQACiy9KFP1eugzX6fX5UmZE0DgkLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8xk0UvsEVfLQOVM7YatA82eXb5eWHbtJ+fX/XAb8rE=;
 b=XaYflUBSgor0x/+LcJIfQTq38AC4Sv/I5ZP8aLn0ogV8mPiyGJak3Rk+o0Yuu3t/Tl0YEvUlCAHyROSUTUR0ps1DUtwbcY7z71jdYvhEEw04iOyNIn5fMKVaMe/iLqdmwEPni6DQKR2Ls7QsezrQSFC+tGTeIk6EpX/SljzlPb0=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by AS8PR04MB8165.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 09:55:38 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741%3]) with mapi id 15.20.6588.027; Tue, 18 Jul 2023
 09:55:38 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHX2kU9tVwb+/k68aHvm3zH4HK+/J8uAgAAR5CCAAAqGgIAABajw
Date: Tue, 18 Jul 2023 09:55:38 +0000
Message-ID: <DB8PR04MB7051AD6FAB01E782F7AE31639838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <3174425.5fSG56mABF@steina-w>
 <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
 <8287028.NyiUUSuA9g@steina-w>
In-Reply-To: <8287028.NyiUUSuA9g@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|AS8PR04MB8165:EE_
x-ms-office365-filtering-correlation-id: b00f4bae-57f2-470b-92fd-08db877523c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b1C6ptFl1kQNy7jCMcRS/nJjY1wEAJL++5lNECEOrH56EDrSVpWHZ0MllG6VrDKCYLJnoNeUCrafaS9hgWpAiNnDvq80Zrqs15iuE7bDLZGTc2oKdHU7chkhPli5JDtdwmtWSuUwZBfCTTIeaRK9bU0Nx8aSQQyT6jddHcnwQSBOuDHsjRkqQeTD3+xxtmrwzYGA4bgusowPVT0U25vxCyZa8BAZJIk+cvBYK1dI60RZAbbhZBtV2KePQGSRiTVr7JVMeAiJgqa2kWgGl6YSqkuYwstReNv/QHpSutPLOtFRYVYb7eM5SUHFnMJiRILBxfD26n/R4C759NehsL3Iip78wKZj7fxJX2HyiJ7yNMjS0g7Af15V48ATfWc7wYyE5Ukx9PDJyTGQSnma5bZQvCrCRBNebWgpKFlv+DDhA71szdo9w9ngpL17YB/I45vABYGQrk1llP99zoN1OuR5bbG32BIjLGP83E5O56CKkC67KFiuU6ttG8uFsnV4ERvXn7uvBKgueQ27XI89F/pE9VFJD2Td9bsVsvOHk33WMZbluqa92RnM1ODYxoqJiN3w5QzXFWKEJWJU1ACfQTMe0bNQ1kjSmJmLWTEvVBvMVnk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(6506007)(9686003)(53546011)(122000001)(26005)(38100700002)(186003)(38070700005)(66574015)(83380400001)(2906002)(52536014)(7416002)(5660300002)(33656002)(478600001)(54906003)(110136005)(45080400002)(86362001)(966005)(7696005)(71200400001)(41300700001)(316002)(55016003)(8676002)(8936002)(4326008)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rQHj0eibA5UPBKCSod6K6WYRa9Z0ywY5yis7nGlJcj50fltwIK5qUhiS/n?=
 =?iso-8859-1?Q?cnBiOkPui50nT1M8FYo4VrzexnBCtkxSJy+qirwe5SSXRHdKFEBTl7eCM5?=
 =?iso-8859-1?Q?ZigFaxDCadfZY7J+rXay/00qwCU0HsoP+TC7RFNaXx9z9/SfVKEa1+HjtT?=
 =?iso-8859-1?Q?g9NULGE/c08Da0yyRqKtndl6VKIHW/Vx/t/Yvc6V3dyN5Te5saPWPnovji?=
 =?iso-8859-1?Q?fGSQiK/kSh2EpSUJOxrLAd12WejKh4SJIWOjiAJ56hQ+ui9WdjQfqgOvQd?=
 =?iso-8859-1?Q?cMcHS2E5gnFwGiFWIo/YyWtlZ7YGKvgXk7TRbew4zrwHqPNonaXgNgoQ8y?=
 =?iso-8859-1?Q?vfGZMUXRG0EFbddRhi1TlkZnRoAPsSi+eifJFn1knyYu33kup/sdNbPbCr?=
 =?iso-8859-1?Q?yk0xVmNaaH/403ozdPIZ7uxtgkVwqCcPg6dVAwbHjWKLVxJQS9tM8vU30K?=
 =?iso-8859-1?Q?QaN9qXPmtqhkjgXhcqije0+AgpJts5JQAD/Rq58XUCEQK0q5JkE9K+f/e9?=
 =?iso-8859-1?Q?Hq0P4OGvaEAVRJgGLw6on4AkD6DhKMSTkyF38Pn5KGT0F3NCeDT9j54WVy?=
 =?iso-8859-1?Q?Nf9R/Q6sy9Ijy3sKCyk659Q0yF9gkO0CUtGufZUIXjXhz4IOmzjrj69FX+?=
 =?iso-8859-1?Q?7nZmIg7sm1wDOJGdkWyU+pO2SmtZxtH+YNJ2ONhvAn8e2KPWLaNbDp/ueD?=
 =?iso-8859-1?Q?V5Ryn6FxCvEiyedGPTRCtfS/SrJBMZ3yih3jiG4WCQOl/ve7QuDe8hTR5d?=
 =?iso-8859-1?Q?hYwiHdZX6T6w8koaq8jYuUu+cH+sJD7/vRjCq4JH8PgC6GwI+dMbN6oXJu?=
 =?iso-8859-1?Q?lyOyDWA3H4utA7rlyz0tRBAKCgULTH+jYx3fZTEcWg2rNdx954rcxmgFbk?=
 =?iso-8859-1?Q?YzOxM5Q+FHl/ja2aPPa0iZnw4+EcJ/1QMYj9dU9prHb8SsyE9ncTX9lnvV?=
 =?iso-8859-1?Q?HDh74phjcqEtYIgl4Ig4+Ykwdidu7J1pLK5rUgiY5dnkwlI+LunCZ35KHJ?=
 =?iso-8859-1?Q?rvyf/RWIoSqdOr3N1Ei4sJS6DlzA8e0P2HWkI0nC/qJ6tJYvXJV2zlkpMG?=
 =?iso-8859-1?Q?D475lVlcB+2fsiWtfWy7nF6XTVveFXIisbw2E2G+Vsy/skDJFuPlHVC/1Z?=
 =?iso-8859-1?Q?jkAfVMSJ3A5dFmjh6iJ7vTXYxQhIEF17eXADjhIK1kwvfMLXUaQaXG+Rxk?=
 =?iso-8859-1?Q?OQZD2aa0X5uAmB+yYdSqjEi1X7QZYxwVPhIUo3kIIn+wdFH5kjaEzAqi96?=
 =?iso-8859-1?Q?B0Vpu8QXjPFh/rmK85KQigS2TNL+M3cWx2OW9sxsdddgaMiwK+DZ/Ua6VZ?=
 =?iso-8859-1?Q?5TAuSLK1GA5xsNzezYBM1QjJu1g5pG4FO5s1f+CcuPzuDsyPHBc1ueXmbq?=
 =?iso-8859-1?Q?wEpvJfuP39UmflgFMjJ5Ya7++N2EznEw2D6Pv9kBBcs9uO+gmJI0nDhe0T?=
 =?iso-8859-1?Q?/0IFCqhCHfcin75uyOc6EvY1VKkuXsDcqctLFqYu3xHWTVR+SCdjg4n5Ur?=
 =?iso-8859-1?Q?cP8Wt3eDiUKlnHEVhvM2NElYVjp+SNqUKfOMvjs/+dwdUzFzRRC4v9wK7q?=
 =?iso-8859-1?Q?J+qncjQGNVYCUj5tATG+3b8BA7GOhffvZKz1eTIzXAQAHaXjgrj4qZHvrp?=
 =?iso-8859-1?Q?9C0YokOGS8qKw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00f4bae-57f2-470b-92fd-08db877523c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 09:55:38.3544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rt0nWB+nMEdfst61yXWy0Yv+0YWwTd8zcgi20+u6yH0BZrRL7KmBR33LvPmiS/G9HkVSJ4ox8kOQTUCJe6wdGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8165
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

On Tuesday, July 18, 2023 5:31 PM Alexander Stein <alexander.stein@ew.tq-gr=
oup.com> wrote:
>
> Hi,

Hi,

>
> Am Dienstag, 18. Juli 2023, 11:00:25 CEST schrieb Ying Liu:
> > On Tuesday, July 18, 2023 3:49 PM Alexander Stein
> <alexander.stein@ew.tq-
> group.com> wrote:
> > > Hi,
> >
> > Hi,
> >
> > > thanks for the patch.
> >
> > Thanks for your review.
> >
> > > Am Montag, 17. Juli 2023, 08:18:31 CEST schrieb Liu Ying:
> > > > Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> > > > controller and a Synopsys Designware MIPI DPHY.  Some configuration=
s
> > > > and extensions to them are controlled by i.MX93 media blk-ctrl.
> > > >
> > > > Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> > > > bridge helpers and implementing i.MX93 MIPI DSI specific extensions=
.
> > > >
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/bridge/imx/Kconfig          |  10 +
> > > >  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
> > > >  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 934
> > >
> > > ++++++++++++++++++++
> > >
> > > >  3 files changed, 945 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > b/drivers/gpu/drm/bridge/imx/Kconfig index
> > >
> > > 9fae28db6aa7..5182298c7182
> > >
> > > > 100644
> > > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > @@ -49,4 +49,14 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> > > >
> > > >       Choose this to enable pixel link to display pixel
> > >
> > > interface(PXL2DPI)
> > >
> > > >       found in Freescale i.MX8qxp processor.
> > > >
> > > > +config DRM_IMX93_MIPI_DSI
> > > > +   tristate "Freescale i.MX93 specific extensions for Synopsys DW =
MIPI
> > >
> > > DSI"
> > >
> > > > +   depends on OF
> > > > +   depends on COMMON_CLK
> > > > +   select DRM_DW_MIPI_DSI
> > > > +   select GENERIC_PHY_MIPI_DPHY
> > > > +   help
> > > > +     Choose this to enable MIPI DSI controller found in Freescale
> > >
> > > i.MX93
> > >
> > > > +     processor.
> > > > +
> > > >
> > > >  endif # ARCH_MXC || COMPILE_TEST
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> > > > b/drivers/gpu/drm/bridge/imx/Makefile index
> > >
> > > 8e2ebf3399a1..2b0c2e44aa1b
> > >
> > > > 100644
> > > > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > > > @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-
> ldb.o
> > > >
> > > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-
> > >
> > > combiner.o
> > >
> > > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
> > > >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-
> pxl2dpi.o
> > > >
> > > > +obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> > > > diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > > > b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c new file mode 100644
> > > > index 000000000000..77f59e3407a0
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> > > >
> > > > [snip]
> > > >
> > > > +static int imx93_dsi_probe(struct platform_device *pdev)
> > > > +{
> > > > +   struct device *dev =3D &pdev->dev;
> > > > +   struct device_node *np =3D dev->of_node;
> > > > +   struct imx93_dsi *dsi;
> > > > +   int ret;
> > > > +
> > > > +   dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > > > +   if (!dsi)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   dsi->regmap =3D syscon_regmap_lookup_by_phandle(np, "fsl,media-
> > >
> > > blk-
> > > ctrl");
> > >
> > > > +   if (IS_ERR(dsi->regmap)) {
> > > > +           ret =3D PTR_ERR(dsi->regmap);
> > >
> > > > +           DRM_DEV_ERROR(dev, "failed to get block ctrl regmap:
> > > %d\n", ret);
> > >
> > > Could you use dev_err_probe here instead?
> >
> > Maybe, it's better to keep using DRM_DEV_ERROR to achieve consistent
> > error log format across the driver which is implemented in
> drm_dev_printk().
> > I see other DRM drivers do the same.
>
> I see your point. On the other hand the benefit of dev_err_probe() is tha=
t the
> message of deferred probe can be seen in
> /sys/kernel/debug/devices_deferred.
> Your check against EPROBE_DEFER will hide the message if something is not
> correct.
>
> Maybe a to be introduced DRM_DEV_ERROR_PROBE might be useful.

Maybe.  I assume this is not a must-have for this series - maybe someone ma=
y
come along to introduce it in future.

Regards,
Liu Ying

>
> Best regards,
> Alexander
>
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   dsi->clk_pixel =3D devm_clk_get(dev, "pix");
> > > > +   if (IS_ERR(dsi->clk_pixel)) {
> > > > +           ret =3D PTR_ERR(dsi->clk_pixel);
> > > > +           if (ret !=3D -EPROBE_DEFER)
> > >
> > > > +                   DRM_DEV_ERROR(dev, "failed to get pixel clock:
> > > %d\n", ret);
> > >
> > > Could you use dev_err_probe here instead?
> >
> > Ditto.
> >
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   dsi->clk_cfg =3D devm_clk_get(dev, "phy_cfg");
> > > > +   if (IS_ERR(dsi->clk_cfg)) {
> > > > +           ret =3D PTR_ERR(dsi->clk_cfg);
> > > > +           if (ret !=3D -EPROBE_DEFER)
> > >
> > > > +                   DRM_DEV_ERROR(dev, "failed to get phy cfg clock=
:
> > > %d\n", ret);
> > >
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   dsi->clk_ref =3D devm_clk_get(dev, "phy_ref");
> > > > +   if (IS_ERR(dsi->clk_ref)) {
> > > > +           ret =3D PTR_ERR(dsi->clk_ref);
> > > > +           if (ret !=3D -EPROBE_DEFER)
> > >
> > > > +                   DRM_DEV_ERROR(dev, "failed to get phy ref clock=
:
> > > %d\n", ret);
> > >
> > > Could you use dev_err_probe here instead?
> >
> > Ditto.
> >
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   dsi->ref_clk_rate =3D clk_get_rate(dsi->clk_ref);
> > > > +   if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
> > > > +       dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
> > > > +           DRM_DEV_ERROR(dev, "invalid phy ref clock rate %lu\n",
> > > > +                         dsi->ref_clk_rate);
> > > > +           return -EINVAL;
> > > > +   }
> > > > +   DRM_DEV_DEBUG_DRIVER(dev, "phy ref clock rate: %lu\n", dsi-
> > > >
> > > >ref_clk_rate);
> > > >
> > > > +
> > > > +   dsi->dev =3D dev;
> > > > +   dsi->pdata.max_data_lanes =3D 4;
> > > > +   dsi->pdata.mode_valid =3D imx93_dsi_mode_valid;
> > > > +   dsi->pdata.mode_fixup =3D imx93_dsi_mode_fixup;
> > > > +   dsi->pdata.get_input_bus_fmts =3D imx93_dsi_get_input_bus_fmts;
> > > > +   dsi->pdata.phy_ops =3D &imx93_dsi_phy_ops;
> > > > +   dsi->pdata.host_ops =3D &imx93_dsi_host_ops;
> > > > +   dsi->pdata.priv_data =3D dsi;
> > > > +   platform_set_drvdata(pdev, dsi);
> > > > +
> > > > +   dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
> > > > +   if (IS_ERR(dsi->dmd)) {
> > > > +           ret =3D PTR_ERR(dsi->dmd);
> > > > +           if (ret !=3D -EPROBE_DEFER)
> > >
> > > > +                   DRM_DEV_ERROR(dev, "failed to probe dw_mipi_dsi=
:
> > > %d\n", ret);
> > >
> > > Could you use dev_err_probe here instead?
> >
> > Ditto.
> >
> > Regards,
> > Liu Ying
> >
> > > Best regards,
> > > Alexander
> > >
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +
> > > > +static void imx93_dsi_remove(struct platform_device *pdev)
> > > > +{
> > > > +   struct imx93_dsi *dsi =3D platform_get_drvdata(pdev);
> > > > +
> > > > +   dw_mipi_dsi_remove(dsi->dmd);
> > > > +}
> > > > +
> > > > +static const struct of_device_id imx93_dsi_dt_ids[] =3D {
> > > > +   { .compatible =3D "fsl,imx93-mipi-dsi", },
> > > > +   { /* sentinel */ }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
> > > > +
> > > > +static struct platform_driver imx93_dsi_driver =3D {
> > > > +   .probe  =3D imx93_dsi_probe,
> > > > +   .remove_new =3D imx93_dsi_remove,
> > > > +   .driver =3D {
> > > > +           .of_match_table =3D imx93_dsi_dt_ids,
> > > > +           .name =3D "imx93_mipi_dsi",
> > > > +   },
> > > > +};
> > > > +module_platform_driver(imx93_dsi_driver);
> > > > +
> > > > +MODULE_DESCRIPTION("Freescale i.MX93 MIPI DSI driver");
> > > > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > > > +MODULE_LICENSE("GPL");
> > >
> > > --
> > > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germ=
any
> > > Amtsgericht M=FCnchen, HRB 105018
> > > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schnei=
der
> > >
> http://www.t/
> %2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7Cefbbc19ba3414f89448308
> db8771b5df%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638252
> 694676247773%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat
> a=3DBCL6xs5i8jZZDFC2ONKMv5%2B1o0mpuD0ocxC3BnUa2To%3D&reserved=3D0
> > > q-
> > >
> group.com%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7Cc42417f9a9484
> > >
> 3ead2b808db876380d3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > > %7C638252633665634690%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLj
> > >
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%
> > >
> 7C%7C&sdata=3DGUWOZgHFFp0nKImw2aIAsaqMv9KtgI6%2BD%2BaOdDhJ%2B
> > > tU%3D&reserved=3D0
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.t/
> q-
> group.com%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7Cefbbc19ba3414
> f89448308db8771b5df%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638252694676247773%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> C%7C&sdata=3D%2FCtQd5%2BYCDCjOKmsbiO2LSeE1hqQsrmhepmSGalydhc%3
> D&reserved=3D0
>

