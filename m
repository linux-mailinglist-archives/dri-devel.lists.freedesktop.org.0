Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10F5A5DF9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC1F10EC52;
	Tue, 30 Aug 2022 08:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7EA10EC52
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRWmfO1XBk3vtH+juvl1NRPu8G2utdxhxK4Rm+z8UeO9UXgERM/OOqSsOX9HqQpZa9bWULT/yqDRJ+bEw8K1KnTziIqnkv4bnozqGkfr1dHCAZJSv0e6o7JWYdqi9cDHwiE8KDlj6eIHOTwWVcSSZ7LJUT/SSek20EV5q10DIHyK3O/HwK8JrGS8IiJ0tv47XnGZNfAdmCiWkQfQ+DZPDYJDYnvSd4XehOsY7KhnRfO3y69RT8Ay2M+HWdA1kPBn/nIbreRp/u6TijSEnY9p63SOGKq6qkyKvZcPR6nyieoyINgfvZq0WmDziD3l0fNn9FepgUfahPFi/K5wnDFJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFkrGLJuHv2/SfZfqlvftHjZW7RxamumMYCvfFGElhw=;
 b=bgLzMGOmsUlNV7lW5Sl4ytDEHCiZ9kJmd7p5XkEwr5pMiinJoHD1lFwQyEK6mPneYemiUBbfOTbAT3mHgUjszuhYFbc0iGAlbzd60p7Hgjh+qupwzPXFHgEuuiUcQGN9OmAvobP7XYpxtSbyUVNDr8YCBBoOUs3KEoCnAgIpE/WHQkdWZXh5LwJ1KRtLWv0h56xRTJLdxz9hw0HcRVL1UPM8ncz2tWvcoz72WW1kzc1PEO+KGPus+Xw3ThxqK2rkcqCZc/3rHEpPDt+yi3ac1KcRaJfWKSNLEAdAmgy1NdnssaiWr7NKQ5kXKQ08ZWam1xlqFSZ3JwVxi0ChdUyZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFkrGLJuHv2/SfZfqlvftHjZW7RxamumMYCvfFGElhw=;
 b=JT0wlunqLal656RmONd4drE/NG0fNNHsWO2JgAlkzh85Jom6rYPqlIAgUm/czSUj/WsraiXrngcdjgJESKE7H9lRGhTLiKgWdM2VPxhQM2+WDxLDBIKyYj03Jyd3Wn+t9W+vqDTUgEggUewHbCz97K4SXzP6Gx/5CZkBirTMrMg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8589.jpnprd01.prod.outlook.com (2603:1096:400:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 08:22:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 08:22:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYu4hv/CDDY6+M30+sYprn/JM1O63GMiwAgADovfA=
Date: Tue, 30 Aug 2022 08:22:08 +0000
Message-ID: <OS0PR01MB5922009AED34A4E02CB97EAB86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220829091901.641784-1-biju.das.jz@bp.renesas.com>
 <20220829091901.641784-3-biju.das.jz@bp.renesas.com>
 <Yw0EcLF0PMrlB9l8@pendragon.ideasonboard.com>
In-Reply-To: <Yw0EcLF0PMrlB9l8@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9717832d-c820-4ef8-637a-08da8a60bad1
x-ms-traffictypediagnostic: TYWPR01MB8589:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bcx3CrxxKDsUbLlikLbam4exJ99N90htHJUDbF6OWaAS83oMl6g0njJU1DDgRsSpS0M8sBTYeur3eousoQzh9KDvvIyzjIcjERcnF8YexYSII78eQLvC+NVqJrjI2QpnqtHNEXJd/VzYHy4KgBtyq35k5uIxGMpva2a+r3JnU72mrtHFNqq+oC6YNMWIdUfzhRLR/wNV0Nx8adoY2fnLehlz9BOeo/gZIZ/jxOhQzGL3G7uqbgATWViAMzIz42O/qXJdn97TaRm828GqA0B3/mckW66cD96Fv4F5CZ1vlbX6vByVKYKgInhobjLey7lUUpBevwm/MOyd+ZCBqojqsKn9ZmNBEF2rK1jOqwPxjpasiGyAdGrzk+PqlPbTc+9lf2D0rG1ciL0D1A3PNNvlhRTyGAx/1UYVyrJxBjSOWCMgaSs5d7PPQt8FcRI8mERnzgw/Cx+cx2a4ogohUEfhwhugKH58XJnHRpjTtjbD6+6vLl5JRSyohYob6guqQZYfDjXAfGJ/eb/WcuynvZGw+sgyKVj7SpqqQtHDB9xZSVYK5I/GDLKlPK6vydJ+rT7mZvha5xSgLGcew374EPy/SQFP5qowrhz2zU0YSYhF/sIJVWLDTz/5WlN+kB/flfv+BBeSnWcYSheU4EfphPaGWdPWN1ENbkF5tS5YwwhXttuIPgiTXhYOsiNEGpSGmYPbBLx+7kstdNDaO7ZW23Yc/DRAj/MSLD+2Xnsjml7jqj503AGPDxhhETHcBCxZtdwqR981d505xT6xYLQU2GrWHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(478600001)(9686003)(66556008)(64756008)(33656002)(30864003)(4326008)(66446008)(41300700001)(66946007)(8676002)(5660300002)(66476007)(2906002)(6916009)(7696005)(55016003)(52536014)(26005)(76116006)(83380400001)(54906003)(6506007)(8936002)(71200400001)(316002)(86362001)(38100700002)(38070700005)(186003)(122000001)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YHJ27CFobVYoZfmX+IuFzR+eGZzNC7DjlLXik9k7MnGqjXx4KguhJrkbYijh?=
 =?us-ascii?Q?1YJIlDYhtssMJZuJFmCOR+EnNXE3+xe/qI2ofqD/41+MCta7pjmgjDFSQybE?=
 =?us-ascii?Q?jFmUSV82tOl2eMgZHllD2PKjlnuYkur8C0gecACZhEEgW3WxLyJcHqelszaE?=
 =?us-ascii?Q?eXOppVskCaPVI3YFnvjRiV8sF1D+tJJxlky+e55Igy7bYkHSzwQbqNi+mHV7?=
 =?us-ascii?Q?xF6f5h1mU4VBrSlCMrUGvtJKM20v3KDZWo8pe2/JH6L03hDxINCk/w21ZemQ?=
 =?us-ascii?Q?aOxMOeHmVFAhV6VKbetkoz4f7uvCo64T/Dv2ehybxmIZUzTjL7Fk7ToLRpNh?=
 =?us-ascii?Q?h/RWLcgUegyM1oyQP/AHrRFMCNtZ/4O6gVLgdBt9Zt04vQioW8qnJYPQaWcA?=
 =?us-ascii?Q?p8AkncIGFXzjciDUfS4sjAOZ9QWG/KkgnZIX8vu7SpJgbMty448IFNfyTmbe?=
 =?us-ascii?Q?SDo5UzOhgLN3+qfBWCgJY7quSbadL1Pqq6s7HAaPj64gaVhrA62CFn3sq/8n?=
 =?us-ascii?Q?Li2h+xARl+s1Svz31Rk7s8U/XKvOy46oVNpS5631S9Z/Rg6L1cIA+qi3JM1w?=
 =?us-ascii?Q?0MM5puuB4s6zv9+pwvKDL07/3Cj3egKsVAQeMAJrbsuQ9QujYiltOP6HkpTv?=
 =?us-ascii?Q?VxlHYOvRB7MByvLL+g9V3SVpP09Q3KabIioBz1xQc+HCDwSzYqwwb9Ih7XzE?=
 =?us-ascii?Q?as5xGDiDb0tr/jQTwZMwuCAMWUosB/wXKZ2LN7e1FkA1RlLHQ0pNg8c3hvz4?=
 =?us-ascii?Q?QSgcaYww/cH/OgkVakYslOrScixYU7pNcTthaqAdZZc7ckoseDjghdaQK3BU?=
 =?us-ascii?Q?Qr8jiBFy9wMIVTHbI3aJreY5+KwK8ZUo/pkMIHdVQlLgKnLklA625vITas7v?=
 =?us-ascii?Q?OOkBclHFZ8En4JE23mLpjCQUnxrbpN95UQWx24lyOyxJ2ulthGkDfPLJFG5t?=
 =?us-ascii?Q?Itn531lzRB3nsdOpIF6cSwTtlZ5VGFj7ZmrEWMobbucKejAwTdtkDOaH66TR?=
 =?us-ascii?Q?xvpuhxG7Az2LdNTjzIRD/Vt0rPeaHXMnfhLEKlZ6sX4XRiWp3mO82Pj/tRZ+?=
 =?us-ascii?Q?CVSksZQgxGLhTv1jkcvbnKPKp4I8yAFfs2fY4bOvXfLnmH+7H4O8mlKj3Zdt?=
 =?us-ascii?Q?BoB/MINxr9XVDQUiaosYF2Jk0m9OGJfcaywoRE/gFUw8LJZ0Vrt7/7JMzrin?=
 =?us-ascii?Q?6CtKqpdCvLl8eUcab9gh+zKohXNF7XX8qz5uv05cLsSOaSuvbudCtPSJnoV4?=
 =?us-ascii?Q?FjsQHOH23Rg5JJWKgl9J9th5cTgAo7ayrvq5hBmkNmkU3lXaywDN6GITjWzH?=
 =?us-ascii?Q?tY5mDaYYSDdOSqs1miUitYNa2musdfVM0vBLlwmwpDgsQDDiNLp/koNOBJau?=
 =?us-ascii?Q?He1Tj0M8Erh51Eceva29G0zPpC7HuCZC68aj8PZR2V+rG+R8jYwDAwAzYnrZ?=
 =?us-ascii?Q?jdfRinrZSt5aY/E0HrHoxo4LMSbL5Qrsd740YuHV8ASNYE5CsjWhrznDUNu2?=
 =?us-ascii?Q?1jtGR7SgJicSQT8AURTZPPDQ5eUnXkrc42qlrUbEO4gBrbzyATpg4nJ+8FcC?=
 =?us-ascii?Q?2BJxfdvnrBzTvowd8AiRv+DZs7irp4E+l3IZ4lmGP/3K6nPra0UtpSxr+zBf?=
 =?us-ascii?Q?Eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9717832d-c820-4ef8-637a-08da8a60bad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 08:22:08.1655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFGt4VMU+QQ4ktS43t6rWh8WgPYAXm5+DSe5ABwqjiJYRnsLWmuXsKVmG95usLdgyzHwN3iR+6rUh8uTIiX+z4kQMHCsPjnQiebb34Bwdr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8589
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Mon, Aug 29, 2022 at 10:19:01AM +0100, Biju Das wrote:
> > This driver supports the MIPI DSI encoder found in the RZ/G2L SoC. It
> > currently supports DSI video mode only.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > v5->v6:
> >  * Updated commit description
> >  * Moved handling of arst and prst from rzg2l_mipi_dsi_startup-
> >runtime
> >    PM suspend/resume handlers.
> >  * Max lane capability read at probe(), and enforced in
> >    rzg2l_mipi_dsi_host_attach()
> >  * Simplified vich1ppsetr setting.
> >  * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
> >  * Fixed typo in probe error message(arst->rst).
> >  * Reordered DRM bridge initaization in probe()
> >  * Updated typo in e-mail address.
> > v4->v5:
> >  * Added Ack from Sam.
> >  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
> >    with drm_of_get_data_lanes_count_ep() in probe.
> > v3->v4:
> >  * Updated error handling in rzg2l_mipi_dsi_startup() and
> > rzg2l_mipi_dsi_atomic_enable()
> > v2->v3:
> >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function
> instead
> >    of the memory pointer
> >  * Fixed the comment in rzg2l_mipi_dsi_startup()
> >  * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
> >  * DRM bridge parameter initialization moved to probe
> >  * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
> >  * Inserted the missing blank lane after return in probe()
> >  * Added missing MODULE_DEVICE_TABLE
> >  * Added include linux/bits.h in header file
> >  * Fixed various macros in header file.
> >  * Reorder the make file for DSI, so that it is no more dependent
> >    on RZ/G2L DU patch series.
> > v1->v2:
> >  * Rework based on dt-binding change (DSI + D-PHY) as single block
> >  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
> >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> >    and rzg2l_mipi_dsi_link_write
> >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > RFC->v1:
> >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> >    and dropped DRM as it is implied by DRM_BRIDGE
> >  * Used devm_reset_control_get_exclusive() for reset handle
> >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> >  * Added error check for pm, using pm_runtime_resume_and_get() instead
> of
> >    pm_runtime_get_sync()
> >  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
> >  * Avoided read-modify-write stopping hsclock
> >  * Used devm_platform_ioremap_resource for resource allocation
> >  * Removed unnecessary assert call from probe and remove.
> >  * wrap the line after the PTR_ERR() in probe()
> >  * Updated reset failure messages in probe
> >  * Fixed the typo arstc->prstc
> >  * Made hex constants to lower case.
> > RFC:
> >  *
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 703
> ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> >  4 files changed, 864 insertions(+)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > b/drivers/gpu/drm/rcar-du/Kconfig index c959e8c6be7d..58ffb8c2443b
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -51,6 +51,14 @@ config DRM_RCAR_MIPI_DSI
> >  	help
> >  	  Enable support for the R-Car Display Unit embedded MIPI DSI
> encoders.
> >
> > +config DRM_RZG2L_MIPI_DSI
> > +	tristate "RZ/G2L MIPI DSI Encoder Support"
> > +	depends on DRM_BRIDGE && OF
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select DRM_MIPI_DSI
> > +	help
> > +	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI
> encoders.
> > +
> >  config DRM_RCAR_VSP
> >  	bool "R-Car DU VSP Compositor Support" if ARM
> >  	default y if ARM64
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> > b/drivers/gpu/drm/rcar-du/Makefile
> > index 6f132325c8b7..b8f2c82651d9 100644
> > --- a/drivers/gpu/drm/rcar-du/Makefile
> > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > @@ -14,3 +14,5 @@ obj-$(CONFIG_DRM_RCAR_DU)		+=3D rcar-du-drm.o
> >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+=3D rcar_dw_hdmi.o
> >  obj-$(CONFIG_DRM_RCAR_LVDS)		+=3D rcar_lvds.o
> >  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+=3D rcar_mipi_dsi.o
> > +
> > +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > new file mode 100644
> > index 000000000000..46a71e39e336
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > @@ -0,0 +1,703 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G2L MIPI DSI Encoder Driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */ #include
> > +<linux/clk.h> #include <linux/delay.h> #include <linux/io.h> #include
> > +<linux/iopoll.h> #include <linux/module.h> #include <linux/of.h>
> > +#include <linux/of_device.h> #include <linux/of_graph.h> #include
> > +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> > +<linux/reset.h> #include <linux/slab.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg2l_mipi_dsi_regs.h"
> > +
> > +struct rzg2l_mipi_dsi {
> > +	struct device *dev;
> > +	void __iomem *mmio;
> > +
> > +	struct reset_control *rstc;
> > +	struct reset_control *arstc;
> > +	struct reset_control *prstc;
> > +
> > +	struct mipi_dsi_host host;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +
> > +	struct clk *vclk;
> > +
> > +	enum mipi_dsi_pixel_format format;
> > +	unsigned int num_data_lanes;
> > +	unsigned int max_lanes;
> > +	unsigned int lanes;
> > +	unsigned long mode_flags;
> > +};
> > +
> > +static inline struct rzg2l_mipi_dsi * bridge_to_rzg2l_mipi_dsi(struct
> > +drm_bridge *bridge) {
> > +	return container_of(bridge, struct rzg2l_mipi_dsi, bridge); }
> > +
> > +static inline struct rzg2l_mipi_dsi * host_to_rzg2l_mipi_dsi(struct
> > +mipi_dsi_host *host) {
> > +	return container_of(host, struct rzg2l_mipi_dsi, host); }
> > +
> > +static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32
> > +reg, u32 data) {
> > +	iowrite32(data, dsi->mmio + reg);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32
> > +reg, u32 data) {
> > +	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg); }
> > +
> > +static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32
> > +reg) {
> > +	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg); }
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Hardware Setup
> > + */
> > +
> > +static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > +				  const struct drm_display_mode *mode) {
> > +	unsigned long hsfreq;
> > +	u32 txsetr;
> > +	u32 clstptsetr;
> > +	u32 lptrnstsetr;
> > +	u32 clkkpt;
> > +	u32 clkbfht;
> > +	u32 clkstpt;
> > +	u32 golpbkt;
> > +	unsigned int bpp;
> > +	struct {
> > +		u32 tclk_miss;
> > +		u32 t_init;
> > +		u32 tclk_prepare;
> > +		u32 tclk_settle;
> > +		u32 tclk_trail;
> > +		u32 tclk_post;
> > +		u32 tclk_pre;
> > +		u32 tclk_zero;
> > +		u32 tlpx;
> > +		u32 ths_prepare;
> > +		u32 ths_settle;
> > +		u32 ths_exit;
> > +		u32 ths_trail;
> > +		u32 ths_zero;
> > +	} timings;
> > +	u32 dphyctrl0;
> > +	u32 dphytim0;
> > +	u32 dphytim1;
> > +	u32 dphytim2;
> > +	u32 dphytim3;
> > +	int ret;
> > +
> > +	/*
> > +	 * Relationship between hsclk and vclk must follow
> > +	 * vclk * bpp =3D hsclk * 8 * lanes
> > +	 * where vclk: video clock (Hz)
> > +	 *       bpp: video pixel bit depth
> > +	 *       hsclk: DSI HS Byte clock frequency (Hz)
> > +	 *       lanes: number of data lanes
> > +	 *
> > +	 * hsclk(bit) =3D hsclk(byte) * 8
> > +	 */
> > +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +	hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > +
> > +	/* All DSI global operation timings are set with recommended
> setting */
> > +	if (hsfreq > 250000) {
> > +		timings.tclk_miss =3D 1;
> > +		timings.t_init =3D 79801;
> > +		timings.tclk_prepare =3D 8;
> > +		timings.tclk_settle =3D 9;
> > +		timings.tclk_trail =3D 7;
> > +		timings.tclk_post =3D 35;
> > +		timings.tclk_pre =3D 4;
> > +		timings.tclk_zero =3D 33;
> > +		timings.tlpx =3D 6;
> > +		timings.ths_prepare =3D 9;
> > +		timings.ths_settle =3D 9;
> > +		timings.ths_exit =3D 13;
> > +		timings.ths_trail =3D 9;
> > +		timings.ths_zero =3D 16;
> > +	} else {
> > +		timings.tclk_miss =3D 1;
> > +		timings.t_init =3D 79801;
> > +		timings.tclk_prepare =3D 8;
> > +		timings.tclk_settle =3D 9;
> > +		timings.tclk_trail =3D 10;
> > +		timings.tclk_post =3D 94;
> > +		timings.tclk_pre =3D 13;
> > +		timings.tclk_zero =3D 33;
> > +		timings.tlpx =3D 6;
> > +		timings.ths_prepare =3D 12;
> > +		timings.ths_settle =3D 9;
> > +		timings.ths_exit =3D 13;
> > +		timings.ths_trail =3D 17;
> > +		timings.ths_zero =3D 23;
> > +	}
> > +
> > +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +
> > +	/* Initializing DPHY before accessing LINK */
> > +	dphyctrl0 =3D DSIDPHYCTRL0_CAL_EN_HSRX_OFS |
> DSIDPHYCTRL0_CMN_MASTER_EN |
> > +		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
> > +
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > +	usleep_range(20, 30);
> > +
> > +	dphyctrl0 |=3D DSIDPHYCTRL0_EN_LDO1200;
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > +	usleep_range(10, 20);
> > +
> > +	dphytim0 =3D DSIDPHYTIM0_TCLK_MISS(timings.tclk_miss) |
> > +		   DSIDPHYTIM0_T_INIT(timings.t_init);
> > +	dphytim1 =3D DSIDPHYTIM1_THS_PREPARE(timings.ths_prepare) |
> > +		   DSIDPHYTIM1_TCLK_PREPARE(timings.tclk_prepare) |
> > +		   DSIDPHYTIM1_THS_SETTLE(timings.ths_settle) |
> > +		   DSIDPHYTIM1_TCLK_SETTLE(timings.tclk_settle);
> > +	dphytim2 =3D DSIDPHYTIM2_TCLK_TRAIL(timings.tclk_trail) |
> > +		   DSIDPHYTIM2_TCLK_POST(timings.tclk_post) |
> > +		   DSIDPHYTIM2_TCLK_PRE(timings.tclk_pre) |
> > +		   DSIDPHYTIM2_TCLK_ZERO(timings.tclk_zero);
> > +	dphytim3 =3D DSIDPHYTIM3_TLPX(timings.tlpx) |
> > +		   DSIDPHYTIM3_THS_EXIT(timings.ths_exit) |
> > +		   DSIDPHYTIM3_THS_TRAIL(timings.ths_trail) |
> > +		   DSIDPHYTIM3_THS_ZERO(timings.ths_zero);
> > +
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM0, dphytim0);
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM1, dphytim1);
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> > +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> > +
> > +	ret =3D reset_control_deassert(dsi->rstc);
> > +	if (ret < 0)
> > +		goto err_rstc;
> > +
> > +	udelay(1);
> > +
> > +	/* Enable Data lanes and Clock lanes */
> > +	txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) |
> TXSETR_CLEN;
> > +	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> > +
> > +	/*
> > +	 * Global timings characteristic depends on high speed Clock
> Frequency
> > +	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> > +	 * - videoclock =3D 148.5 (MHz)
> > +	 * - bpp: maximum 24bpp
> > +	 * - data lanes: maximum 4 lanes
> > +	 * Therefore maximum hsclk will be 891 Mbps.
> > +	 */
> > +	if (hsfreq > 445500) {
> > +		clkkpt =3D 12;
> > +		clkbfht =3D 15;
> > +		clkstpt =3D 48;
> > +		golpbkt =3D 75;
> > +	} else if (hsfreq > 250000) {
> > +		clkkpt =3D 7;
> > +		clkbfht =3D 8;
> > +		clkstpt =3D 27;
> > +		golpbkt =3D 40;
> > +	} else {
> > +		clkkpt =3D 8;
> > +		clkbfht =3D 6;
> > +		clkstpt =3D 24;
> > +		golpbkt =3D 29;
> > +	}
> > +
> > +	clstptsetr =3D CLSTPTSETR_CLKKPT(clkkpt) |
> CLSTPTSETR_CLKBFHT(clkbfht) |
> > +		     CLSTPTSETR_CLKSTPT(clkstpt);
> > +	rzg2l_mipi_dsi_link_write(dsi, CLSTPTSETR, clstptsetr);
> > +
> > +	lptrnstsetr =3D LPTRNSTSETR_GOLPBKT(golpbkt);
> > +	rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
> > +
> > +	return 0;
> > +
> > +err_rstc:
> > +	pm_runtime_put(dsi->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi
> *dsi,
> > +					      const struct drm_display_mode *mode)
> {
> > +	u32 vich1ppsetr;
> > +	u32 vich1vssetr;
> > +	u32 vich1vpsetr;
> > +	u32 vich1hssetr;
> > +	u32 vich1hpsetr;
> > +	int dsi_format;
> > +	u32 delay[2];
> > +	u8 index;
> > +
> > +	/* Configuration for Pixel Packet */
> > +	dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +	switch (dsi_format) {
> > +	case 24:
> > +		vich1ppsetr =3D VICH1PPSETR_DT_RGB24;
> > +		break;
> > +	case 18:
> > +		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
> > +		break;
> > +	}
> > +
> > +	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
> > +	    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
> > +		vich1ppsetr |=3D VICH1PPSETR_TXESYNC_PULSE;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
> > +
> > +	/* Configuration for Video Parameters */
> > +	vich1vssetr =3D VICH1VSSETR_VACTIVE(mode->vdisplay) |
> > +		      VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
> > +	vich1vssetr |=3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
> > +			VICH1VSSETR_VSPOL_HIGH : VICH1VSSETR_VSPOL_LOW;
> > +
> > +	vich1vpsetr =3D VICH1VPSETR_VFP(mode->vsync_start - mode->vdisplay)
> |
> > +		      VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
> > +
> > +	vich1hssetr =3D VICH1HSSETR_HACTIVE(mode->hdisplay) |
> > +		      VICH1HSSETR_HSA(mode->hsync_end - mode->hsync_start);
> > +	vich1hssetr |=3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
> > +			VICH1HSSETR_HSPOL_HIGH : VICH1HSSETR_HSPOL_LOW;
> > +
> > +	vich1hpsetr =3D VICH1HPSETR_HFP(mode->hsync_start - mode->hdisplay)
> |
> > +		      VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1VSSETR, vich1vssetr);
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1VPSETR, vich1vpsetr);
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
> > +
> > +	/*
> > +	 * Configuration for Delay Value
> > +	 * Delay value based on 2 ranges of video clock.
> > +	 * 74.25MHz is videoclock of HD@60p or FHD@30p
> > +	 */
> > +	if (mode->clock > 74250) {
> > +		delay[0] =3D 231;
> > +		delay[1] =3D 216;
> > +	} else {
> > +		delay[0] =3D 220;
> > +		delay[1] =3D 212;
> > +	}
> > +
> > +	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > +		index =3D 0;
> > +	else
> > +		index =3D 1;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1SET1R,
> > +				  VICH1SET1R_DLY(delay[index]));
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_hs_clock(struct rzg2l_mipi_dsi *dsi)
> > +{
> > +	bool is_clk_cont;
> > +	u32 hsclksetr;
> > +	u32 status;
> > +	int ret;
> > +
> > +	is_clk_cont =3D !(dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +	/* Start HS clock */
> > +	hsclksetr =3D HSCLKSETR_HSCLKRUN_HS | (is_clk_cont ?
> > +					     HSCLKSETR_HSCLKMODE_CONT :
> > +					     HSCLKSETR_HSCLKMODE_NON_CONT);
> > +	rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR, hsclksetr);
> > +
> > +	if (is_clk_cont) {
> > +		ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +					status & PLSR_CLLP2HS,
> > +					2000, 20000, false, dsi, PLSR);
> > +		if (ret < 0) {
> > +			dev_err(dsi->dev, "failed to start HS clock\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	dev_dbg(dsi->dev, "Start High Speed Clock with %s clock mode",
> > +		is_clk_cont ? "continuous" : "non-continuous");
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_hs_clock(struct rzg2l_mipi_dsi *dsi) {
> > +	bool is_clk_cont;
> > +	u32 status;
> > +	int ret;
> > +
> > +	is_clk_cont =3D !(dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +	/* Stop HS clock */
> > +	rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR,
> > +				  is_clk_cont ? HSCLKSETR_HSCLKMODE_CONT :
> > +				  HSCLKSETR_HSCLKMODE_NON_CONT);
> > +
> > +	if (is_clk_cont) {
> > +		ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +					status & PLSR_CLHS2LP,
> > +					2000, 20000, false, dsi, PLSR);
> > +		if (ret < 0) {
> > +			dev_err(dsi->dev, "failed to stop HS clock\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi) {
> > +	u32 vich1set0r;
> > +	u32 status;
> > +	int ret;
> > +
> > +	/* Configuration for Blanking sequence and start video input*/
> > +	vich1set0r =3D VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> > +		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
> > +
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				status & VICH1SR_VIRDY,
> > +				2000, 20000, false, dsi, VICH1SR);
> > +	if (ret < 0)
> > +		dev_err(dsi->dev, "Failed to start video signal input\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi) {
> > +	u32 status;
> > +	int ret;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, VICH1SET0R_VSTPAFT);
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				(status & VICH1SR_STOP) && (!(status &
> VICH1SR_RUNNING)),
> > +				2000, 20000, false, dsi, VICH1SR);
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				!(status & LINKSR_HSBUSY),
> > +				2000, 20000, false, dsi, LINKSR);
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	return 0;
> > +
> > +err:
> > +	dev_err(dsi->dev, "Failed to stop video signal input\n");
> > +	return ret;
> > +}
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Bridge
> > + */
> > +
> > +static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
> > +				 enum drm_bridge_attach_flags flags) {
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +	return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> bridge,
> > +				 flags);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_bridge_state
> *old_bridge_state) {
> > +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +	const struct drm_display_mode *mode;
> > +	struct drm_connector *connector;
> > +	struct drm_crtc *crtc;
> > +	int ret;
> > +
> > +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> bridge->encoder);
> > +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +	mode =3D &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> > +
> > +	ret =3D rzg2l_mipi_dsi_startup(dsi, mode);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > +
> > +	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
> > +	if (ret < 0)
> > +		goto err_hs_clock;
> > +
> > +	ret =3D rzg2l_mipi_dsi_start_video(dsi);
> > +	if (ret < 0)
> > +		goto err_video;
> > +
> > +	return;
> > +
> > +err_video:
> > +	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +err_hs_clock:
> > +	reset_control_assert(dsi->rstc);
> > +	pm_runtime_put(dsi->dev);
>=20
> A function that wraps those two calls would be nice, you could call it
> here and in rzg2l_mipi_dsi_atomic_disable(). It would be the counterpart
> of rzg2l_mipi_dsi_startup(), the same way you have
> rzg2l_mipi_dsi_start_hs_clock() vs. rzg2l_mipi_dsi_stop_hs_clock() and
> rzg2l_mipi_dsi_stop_video() vs. rzg2l_mipi_dsi_start_video().

OK, will wrap these calls into a function=20
rzg2l_mipi_dsi_assert_rst_and_stop_clocks() and                   =20
is called from rzg2l_mipi_dsi_atomic_{enable,disable} to                   =
  =20
assert cmn_rst followed by stopping dsi clocks.

>=20
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> > +					  struct drm_bridge_state
> *old_bridge_state) {
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +	rzg2l_mipi_dsi_stop_video(dsi);
> > +	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +	reset_control_assert(dsi->rstc);
> > +	pm_runtime_put(dsi->dev);
> > +}
> > +
> > +static enum drm_mode_status
> > +rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > +				 const struct drm_display_info *info,
> > +				 const struct drm_display_mode *mode) {
> > +	if (mode->clock > 148500)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops =3D {
> > +	.attach =3D rzg2l_mipi_dsi_attach,
> > +	.atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
> > +	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
> > +	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Host setting
> > + */
> > +
> > +static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> > +				      struct mipi_dsi_device *device) {
> > +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +	int ret;
> > +
> > +	if (dsi->max_lanes < dsi->lanes || device->lanes > dsi-
> >num_data_lanes) {
> > +		dev_err(dsi->dev, "Invalid lanes");
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> > +	case 24:
> > +	case 18:
> > +		break;
> > +	default:
> > +		dev_warn(dsi->dev, "unsupported format");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsi->lanes =3D device->lanes;
> > +	dsi->format =3D device->format;
> > +	dsi->mode_flags =3D device->mode_flags;
> > +
> > +	dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> >of_node,
> > +						  1, 0);
> > +	if (IS_ERR(dsi->next_bridge)) {
> > +		ret =3D PTR_ERR(dsi->next_bridge);
> > +		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	drm_bridge_add(&dsi->bridge);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> > +				      struct mipi_dsi_device *device) {
> > +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +
> > +	drm_bridge_remove(&dsi->bridge);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops =3D {
> > +	.attach =3D rzg2l_mipi_dsi_host_attach,
> > +	.detach =3D rzg2l_mipi_dsi_host_detach, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Power Management
> > + */
> > +
> > +static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device
> > +*dev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D dev_get_drvdata(dev);
> > +
> > +	reset_control_assert(dsi->prstc);
> > +	reset_control_assert(dsi->arstc);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device
> > +*dev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D reset_control_deassert(dsi->arstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D reset_control_deassert(dsi->prstc);
> > +	if (ret < 0)
> > +		reset_control_assert(dsi->arstc);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops rzg2l_mipi_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend,
> > +rzg2l_mipi_pm_runtime_resume, NULL) };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Probe & Remove
> > + */
> > +
> > +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev) {
> > +	struct rzg2l_mipi_dsi *dsi;
> > +	int ret;
> > +
> > +	dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> > +	if (!dsi)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dsi);
> > +	dsi->dev =3D &pdev->dev;
> > +
> > +	ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1,
> 4);
> > +	if (ret < 0)
> > +		return dev_err_probe(dsi->dev, ret,
> > +				     "missing or invalid data-lanes
> property\n");
> > +
> > +	dsi->num_data_lanes =3D ret;
>=20
> I would store this in a local num_data_lanes variable, and ...
OK.
>=20
> > +
> > +	dsi->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(dsi->mmio))
> > +		return PTR_ERR(dsi->mmio);
> > +
> > +	dsi->vclk =3D devm_clk_get(dsi->dev, "vclk");
> > +	if (IS_ERR(dsi->vclk))
> > +		return PTR_ERR(dsi->vclk);
> > +
> > +	dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> > +	if (IS_ERR(dsi->rstc))
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > +				     "failed to get rst\n");
> > +
> > +	dsi->arstc =3D devm_reset_control_get_exclusive(dsi->dev, "arst");
> > +	if (IS_ERR(dsi->arstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dsi->arstc),
> > +				     "failed to get arst\n");
> > +
> > +	dsi->prstc =3D devm_reset_control_get_exclusive(dsi->dev, "prst");
> > +	if (IS_ERR(dsi->prstc))
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
> > +				     "failed to get prst\n");
> > +
> > +	platform_set_drvdata(pdev, dsi);
> > +
> > +	pm_runtime_enable(dsi->dev);
> > +
> > +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +	if (ret < 0)
> > +		return ret;
>=20
> This should be goto out_pm_get, and the label should be renamed to
> out_pm_disable (or just out_pm). Error labels should be named according
> to what cleanup operation they perform, not the error that they handle.
> There are a few error labels above that should also be renamed
> accordingly.

Oops. Agreed will fix this in next version.
>=20
> > +
> > +	dsi->max_lanes =3D ((rzg2l_mipi_dsi_link_read(dsi, TXSETR) >> 16) &
> > +0x3) + 1;
>=20
> ... here write
>=20
> 	dsi->max_lanes =3D min(((rzg2l_mipi_dsi_link_read(dsi, TXSETR) >>
> 16) & 3) + 1,
> 			     num_data_lanes);
>=20
> to drop the num_data_lanes field from the rzg2l_mipi_dsi structure. You
> could also use a local variable to store the register value in order to
> shorten lines:
>=20
> 	txsetr =3D rzg2l_mipi_dsi_link_read(dsi, TXSETR);
> 	dsi->max_lanes =3D min(((txsetr >> 16) & 3) + 1, num_data_lanes);
>=20
> Up to you.

OK, will fix this in next version.

Cheers,
Biju

>=20
> All those changes are fairly small, once addressed,
>=20
> Reviewed-by: Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>
>=20
> > +	pm_runtime_put(dsi->dev);
> > +
> > +	/* Initialize the DRM bridge. */
> > +	dsi->bridge.funcs =3D &rzg2l_mipi_dsi_bridge_ops;
> > +	dsi->bridge.of_node =3D dsi->dev->of_node;
> > +
> > +	/* Init host device */
> > +	dsi->host.dev =3D dsi->dev;
> > +	dsi->host.ops =3D &rzg2l_mipi_dsi_host_ops;
> > +	ret =3D mipi_dsi_host_register(&dsi->host);
> > +	if (ret < 0)
> > +		goto out_pm_get;
> > +
> > +	return 0;
> > +
> > +out_pm_get:
> > +	pm_runtime_disable(dsi->dev);
> > +	return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_remove(struct platform_device *pdev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +	mipi_dsi_host_unregister(&dsi->host);
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> > +	{ .compatible =3D "renesas,rzg2l-mipi-dsi" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
> > +
> > +static struct platform_driver rzg2l_mipi_dsi_platform_driver =3D {
> > +	.probe	=3D rzg2l_mipi_dsi_probe,
> > +	.remove	=3D rzg2l_mipi_dsi_remove,
> > +	.driver	=3D {
> > +		.name =3D "rzg2l-mipi-dsi",
> > +		.pm =3D &rzg2l_mipi_pm_ops,
> > +		.of_match_table =3D rzg2l_mipi_dsi_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(rzg2l_mipi_dsi_platform_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > +MODULE_DESCRIPTION("Renesas RZ/G2L MIPI DSI Encoder Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > new file mode 100644
> > index 000000000000..1dbc16ec64a4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > @@ -0,0 +1,151 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RZ/G2L MIPI DSI Interface Registers Definitions
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */
> > +
> > +#ifndef __RZG2L_MIPI_DSI_REGS_H__
> > +#define __RZG2L_MIPI_DSI_REGS_H__
> > +
> > +#include <linux/bits.h>
> > +
> > +/* DPHY Registers */
> > +#define DSIDPHYCTRL0			0x00
> > +#define DSIDPHYCTRL0_CAL_EN_HSRX_OFS	BIT(16)
> > +#define DSIDPHYCTRL0_CMN_MASTER_EN	BIT(8)
> > +#define DSIDPHYCTRL0_RE_VDD_DETVCCQLV18	BIT(2)
> > +#define DSIDPHYCTRL0_EN_LDO1200		BIT(1)
> > +#define DSIDPHYCTRL0_EN_BGR		BIT(0)
> > +
> > +#define DSIDPHYTIM0			0x04
> > +#define DSIDPHYTIM0_TCLK_MISS(x)	((x) << 24)
> > +#define DSIDPHYTIM0_T_INIT(x)		((x) << 0)
> > +
> > +#define DSIDPHYTIM1			0x08
> > +#define DSIDPHYTIM1_THS_PREPARE(x)	((x) << 24)
> > +#define DSIDPHYTIM1_TCLK_PREPARE(x)	((x) << 16)
> > +#define DSIDPHYTIM1_THS_SETTLE(x)	((x) << 8)
> > +#define DSIDPHYTIM1_TCLK_SETTLE(x)	((x) << 0)
> > +
> > +#define DSIDPHYTIM2			0x0c
> > +#define DSIDPHYTIM2_TCLK_TRAIL(x)	((x) << 24)
> > +#define DSIDPHYTIM2_TCLK_POST(x)	((x) << 16)
> > +#define DSIDPHYTIM2_TCLK_PRE(x)		((x) << 8)
> > +#define DSIDPHYTIM2_TCLK_ZERO(x)	((x) << 0)
> > +
> > +#define DSIDPHYTIM3			0x10
> > +#define DSIDPHYTIM3_TLPX(x)		((x) << 24)
> > +#define DSIDPHYTIM3_THS_EXIT(x)		((x) << 16)
> > +#define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
> > +#define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
> > +
> > +/* --------------------------------------------------------*/
> > +/* Link Registers */
> > +#define LINK_REG_OFFSET			0x10000
> > +
> > +/* Link Status Register */
> > +#define LINKSR				0x10
> > +#define LINKSR_LPBUSY			BIT(13)
> > +#define LINKSR_HSBUSY			BIT(12)
> > +#define LINKSR_VICHRUN1			BIT(8)
> > +#define LINKSR_SQCHRUN1			BIT(4)
> > +#define LINKSR_SQCHRUN0			BIT(0)
> > +
> > +/* Tx Set Register */
> > +#define TXSETR				0x100
> > +#define TXSETR_NUMLANECAP		(0x3 << 16)
> > +#define TXSETR_DLEN			(1 << 9)
> > +#define TXSETR_CLEN			(1 << 8)
> > +#define TXSETR_NUMLANEUSE(x)		(((x) & 0x3) << 0)
> > +
> > +/* HS Clock Set Register */
> > +#define HSCLKSETR			0x104
> > +#define HSCLKSETR_HSCLKMODE_CONT	(1 << 1)
> > +#define HSCLKSETR_HSCLKMODE_NON_CONT	(0 << 1)
> > +#define HSCLKSETR_HSCLKRUN_HS		(1 << 0)
> > +#define HSCLKSETR_HSCLKRUN_LP		(0 << 0)
> > +
> > +/* Reset Control Register */
> > +#define RSTCR				0x110
> > +#define RSTCR_SWRST			BIT(0)
> > +#define RSTCR_FCETXSTP			BIT(16)
> > +
> > +/* Reset Status Register */
> > +#define RSTSR				0x114
> > +#define RSTSR_DL0DIR			(1 << 15)
> > +#define RSTSR_DLSTPST			(0xf << 8)
> > +#define RSTSR_SWRSTV1			(1 << 4)
> > +#define RSTSR_SWRSTIB			(1 << 3)
> > +#define RSTSR_SWRSTAPB			(1 << 2)
> > +#define RSTSR_SWRSTLP			(1 << 1)
> > +#define RSTSR_SWRSTHS			(1 << 0)
> > +
> > +/* Clock Lane Stop Time Set Register */
> > +#define CLSTPTSETR			0x314
> > +#define CLSTPTSETR_CLKKPT(x)		((x) << 24)
> > +#define CLSTPTSETR_CLKBFHT(x)		((x) << 16)
> > +#define CLSTPTSETR_CLKSTPT(x)		((x) << 2)
> > +
> > +/* LP Transition Time Set Register */
> > +#define LPTRNSTSETR			0x318
> > +#define LPTRNSTSETR_GOLPBKT(x)		((x) << 0)
> > +
> > +/* Physical Lane Status Register */
> > +#define PLSR				0x320
> > +#define PLSR_CLHS2LP			BIT(27)
> > +#define PLSR_CLLP2HS			BIT(26)
> > +
> > +/* Video-Input Channel 1 Set 0 Register */
> > +#define VICH1SET0R			0x400
> > +#define VICH1SET0R_VSEN			BIT(12)
> > +#define VICH1SET0R_HFPNOLP		BIT(10)
> > +#define VICH1SET0R_HBPNOLP		BIT(9)
> > +#define VICH1SET0R_HSANOLP		BIT(8)
> > +#define VICH1SET0R_VSTPAFT		BIT(1)
> > +#define VICH1SET0R_VSTART		BIT(0)
> > +
> > +/* Video-Input Channel 1 Set 1 Register */
> > +#define VICH1SET1R			0x404
> > +#define VICH1SET1R_DLY(x)		(((x) & 0xfff) << 2)
> > +
> > +/* Video-Input Channel 1 Status Register */
> > +#define VICH1SR				0x410
> > +#define VICH1SR_VIRDY			BIT(3)
> > +#define VICH1SR_RUNNING			BIT(2)
> > +#define VICH1SR_STOP			BIT(1)
> > +#define VICH1SR_START			BIT(0)
> > +
> > +/* Video-Input Channel 1 Pixel Packet Set Register */
> > +#define VICH1PPSETR			0x420
> > +#define VICH1PPSETR_DT_RGB18		(0x1e << 16)
> > +#define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
> > +#define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> > +#define VICH1PPSETR_TXESYNC_PULSE	(1 << 15)
> > +#define VICH1PPSETR_VC(x)		((x) << 22)
> > +
> > +/* Video-Input Channel 1 Vertical Size Set Register */
> > +#define VICH1VSSETR			0x428
> > +#define VICH1VSSETR_VACTIVE(x)		(((x) & 0x7fff) << 16)
> > +#define VICH1VSSETR_VSPOL_LOW		(1 << 15)
> > +#define VICH1VSSETR_VSPOL_HIGH		(0 << 15)
> > +#define VICH1VSSETR_VSA(x)		(((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Vertical Porch Set Register */
> > +#define VICH1VPSETR			0x42c
> > +#define VICH1VPSETR_VFP(x)		(((x) & 0x1fff) << 16)
> > +#define VICH1VPSETR_VBP(x)		(((x) & 0x1fff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Size Set Register */
> > +#define VICH1HSSETR			0x430
> > +#define VICH1HSSETR_HACTIVE(x)		(((x) & 0x7fff) << 16)
> > +#define VICH1HSSETR_HSPOL_LOW		(1 << 15)
> > +#define VICH1HSSETR_HSPOL_HIGH		(0 << 15)
> > +#define VICH1HSSETR_HSA(x)		(((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Porch Set Register */
> > +#define VICH1HPSETR			0x434
> > +#define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
> > +#define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
> > +
> > +#endif /* __RZG2L_MIPI_DSI_REGS_H__ */
>=20
> --
> Regards,
>=20
> Laurent Pinchart
