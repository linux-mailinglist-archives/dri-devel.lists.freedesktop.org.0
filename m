Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E09E2425CC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59726E8AC;
	Wed, 12 Aug 2020 07:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320112.outbound.protection.outlook.com [40.107.132.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC789D7C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 11:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp+MJA2Jud8j2Ah4jb53jvOYMLl8mdusm8wW+ofszzSDNjskfLY22r5P2pbokhAceQs4SAeerDzEZ/FImm6cpHntphCkvnl09OZ7IxJEDqxD38qcqoM5kXtAW+U2Qal/Xnc14CKJo9PbUAK7Qi9uaFZvZlUNtqIRLKkWZ55hvU8z9DLshR88Ht9i9fl5sGCARs+yULnPg1W7v62S5Lga9RK8Nf29VUWeMoFQwKjnCYPRqcUaKgY8ZUfEZz56R3otYPMdPq7Zv2Hr0OHJD57nvKG/qgvHquV/8AKi6wG9d0AjCfaobNY8WcaKH2XPmTLXnBLXN9xFFmZcfuoyBaLOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnDFtGaBbH87J/9C6YlxEKrbSagg3TyKC8mcAXxsnRo=;
 b=l062zOhKTdfYISgyUfDxjo22KV/5tJ7n7AwTrZ9EoVu/COpgPwAFNd2FcQ37qm4AussnKSqTn4we8wWcU6k3SRDrJxborVODbXoNedKXp1UIO8IZw2plKIc9npIc4zrA3KHRxpzK1NHysCm1cxODfVKjojYSdroZgWQuk3Srg0FJtPyzEiXNjF+8FqHEVSHxel2eEnx7o95pCwGx4T5Uvl5ynkrl9BuT7suCQikeqnfxXiqkiYRqWw4jPy3n3fwmyFRrkRt59pAmFuHGfK7QnR1UQLdCfleViS3crQF+XPsM7Oy8iFbk3xx7VbpGjZ3SHTeUVb3WWJ4xYLwPoK2Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnDFtGaBbH87J/9C6YlxEKrbSagg3TyKC8mcAXxsnRo=;
 b=m+/SvfXbuM9VZsbZEq8DwQm7VaYeMnYBnrfYLrihUB+MWCYp2FMZjZ148Zz4QNbXhSBa3FcLVZ66Fi0xuPBPRCjoX27pWnMsIOidM7fOV0Ob1Y/ZauHUJwtFIktBq79X+hgXIi1m9KuwpFekn/LafUTarHythQsR6YkWE5bTEP8=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB3834.jpnprd01.prod.outlook.com
 (2603:1096:404:d8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 11:03:07 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 11:03:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Thread-Topic: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Thread-Index: AQHWbyoUe/wbIA6WqU+/YSDXc2CLDakyvsOAgAAAdpA=
Date: Tue, 11 Aug 2020 11:03:07 +0000
Message-ID: <TYBPR01MB5309733E900B575CF1AF42DD86450@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-3-biju.das.jz@bp.renesas.com>
 <20200811105955.GE6054@pendragon.ideasonboard.com>
In-Reply-To: <20200811105955.GE6054@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 82e04512-1553-49ec-8c1a-08d83de62107
x-ms-traffictypediagnostic: TY2PR01MB3834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3834C401EF17D751DE14BF3686450@TY2PR01MB3834.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpRZg5eYOwQlwHP031bzv79sg8Ypp0oCrTyGZc7YqoipMh7QoD5x5MVVmSRe6vyrwfAWlbc3MnF/XxZdMl0ioTQNScaNPmydQseF77k+BRkNHTwyiSZyQS5YS0l76k31pqYcLsAFSunS/TEjzYI0C1i+TQW9Pm+/ifhnzRUSKB96JB3tTCUMRsdjjVbMHFEcJRl7jwDucotii7NxszR2fe6nDjhg0ojYREpLkVa5BCXK6lt49yuvYzBK3Ns06qPJwNLgVb+zvyawd/xtaRzPK2w3V43zY97+eTNniGbdZlb+TsXeoB+QD9iiktATJtXE9TOWd/Ij3v3uoAtR2K+B+thWUYkVzlqSfWobdEakYeKEPUJCjVEW9jxEhcO415IJCkS/lKTz3QcEW7NE4rvdDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYBPR01MB5309.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(86362001)(9686003)(2906002)(7416002)(33656002)(7696005)(316002)(478600001)(66476007)(71200400001)(76116006)(66946007)(55016002)(66556008)(8936002)(54906003)(6916009)(186003)(6506007)(5660300002)(4326008)(66446008)(8676002)(64756008)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dWzwyYXVVK5TconmAmD2pWDh82s/WgnZ5BD0Ou9atE5FjObRPIbTMzazNaucT7S72WJ12C9kuK0+1G+eat4XXJcAFcjrtgM8vjlbf7bep+8TTHh1Wc27n1PbyqNk/08jM17sGoNs7D33aVPNbXdTlF42l8kW6QoPaTkdqS05y1crmnkZnboAaiYKVAxLzS/NQecOIGs3zFc0K1WNGMSpcZ5TQUlTIh7N2hZ1xKcd9+uyKmJg3jpO0I3LN5NBcfQwEv/P+T6mpY+u3syfiUNvMhSvMASJ/WJOzzYvIbpT98FlqXl1sewUZ+uwJb633a3MnICvVB0yh9YG1lnY0ASq/nFgaZQ5LYDG1U5EclmN7SSl++eUMgBy8gKwbFBeAzxmGP4FuIWaIro+zmbMZhnlaBgNj6GpRzYNwqV8w7/fs+X0uk2felPbRb9d5FJ98PUzUwRXU8kO1IUWcUIJxZsqixjJYaNqRV9mmXTyRDMP5MBOm4Yj8XzY2HixNpmCJ6ZwBz7e+7dukTu3vmD0m1l6dN8JMgfccc4bqiUh7N+JslPupavTxL9CUkqon/XQrOH0Li/SrDlxBBqCX9lP7/quIX7OedEwwcQOL9McENzMl9oGAAD4mPyeiDKwi/3dYd2QigOYBqVco2vFmuAl8i7jpQ==
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e04512-1553-49ec-8c1a-08d83de62107
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 11:03:07.7088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlDvka/6aTMSN47X6mj/ALSfSwrhPMDMxLEcTxcz4s0qFmp1AoIMhy4y9nbAH4w923Kxopwdf537V6RNRaHl3AMKWGFR3sGZ433PkLqisEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3834
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for
> regulator
>
> Hi Biju,
>
> Thank you for the patch.
>
> On Mon, Aug 10, 2020 at 04:22:18PM +0100, Biju Das wrote:
> > Add the support for enabling optional regulator that may be used as
> > VCC source.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > New Patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > ---
> >  drivers/gpu/drm/bridge/lvds-codec.c | 29
> > +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c
> > b/drivers/gpu/drm/bridge/lvds-codec.c
> > index 24fb1befdfa2..5858a29aafe6 100644
> > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > @@ -10,13 +10,16 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regulator/consumer.h>
> >
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_panel.h>
> >
> >  struct lvds_codec {
> > +struct device *dev;
> >  struct drm_bridge bridge;
> >  struct drm_bridge *panel_bridge;
> > +struct regulator *vcc;
> >  struct gpio_desc *powerdown_gpio;
> >  u32 connector_type;
> >  };
> > @@ -38,6 +41,14 @@ static int lvds_codec_attach(struct drm_bridge
> > *bridge,  static void lvds_codec_enable(struct drm_bridge *bridge)  {
> >  struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> > +int ret;
> > +
> > +ret = regulator_enable(lvds_codec->vcc);
> > +if (ret) {
> > +dev_err(lvds_codec->dev,
> > +"Failed to enable regulator \"vcc\": %d\n", ret);
> > +return;
> > +}
> >
> >  if (lvds_codec->powerdown_gpio)
> >  gpiod_set_value_cansleep(lvds_codec->powerdown_gpio,
> 0); @@ -46,9
> > +57,15 @@ static void lvds_codec_enable(struct drm_bridge *bridge)
> > static void lvds_codec_disable(struct drm_bridge *bridge)  {
> >  struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> > +int ret;
> >
> >  if (lvds_codec->powerdown_gpio)
> >  gpiod_set_value_cansleep(lvds_codec->powerdown_gpio,
> 1);
> > +
> > +ret = regulator_disable(lvds_codec->vcc);
> > +if (ret)
> > +dev_err(lvds_codec->dev,
> > +"Failed to disable regulator \"vcc\": %d\n", ret);
> >  }
> >
> >  static const struct drm_bridge_funcs funcs = { @@ -63,12 +80,24 @@
> > static int lvds_codec_probe(struct platform_device *pdev)
> >  struct device_node *panel_node;
> >  struct drm_panel *panel;
> >  struct lvds_codec *lvds_codec;
> > +int error;
>
> The driver tends to use "ret" for error status variables. If you're fine with this
> change there's no need to resubmit the patch, I can fix when applying.

Yes, I am ok with that.

Cheers,
Biju


> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
