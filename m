Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D13776E58
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 05:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F9710E4A5;
	Thu, 10 Aug 2023 03:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7B210E4A5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 03:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6Xy4DJ/tkXJIloP25DhQ3DFIKlKkPkNNHQVlzL+kukj7Um6qNGMloPeGPBsqkptLka4Waw43uzywhcoZThTHMe/0HDjn0kFnr/6RrrNIWNUfZGtYtd2+dECMpf9OT5pCP1neTJEOYHKW75DCIE1uhF6cUZIPNXXyXKzUjyy3rufp/u1AtqPe/B5Cz6JlrJqKB9zwVxlYnftGXhiLeHth5OrQeX/MbXQSCkpCCWMk3RshtivluN8dFmuj6tJ29kEFpxKEVph1RA0cAzwXsnw6LPDWKdE+MG0PTdyWeCvddJ1O2+NPmKM3YzXzJowAl3V+rhmLQlNEJ262g23XBtVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOkKyU1abQFdgTcRZ9bOCtS7IAZQPUgcru1CwhhDyPY=;
 b=F9kbyAxGQOtPR66hrkq+DLlrNMMzSHL0uJss75ZThV+EENVG6xaYs3baTEdPq2Gvsp1eO/oLISy5lW72lDi/JY6dG5na0gKYL3500nreh1m3K9+BaQsYIZX8dnkUriBmi/Sg5dKGx6gxjXGYHvl0N93cWGcf+zI6ZMWNxAjM2U8UmAnZpUxaJ4CTwuXfxVZrHtqlkIk0p/gS9yFvz5F++LWyN9XAmZ2f/yeKFzBfU+pVcBHszjW46BY2ELGvYYOsiBOaCp2bkwkQdlNun5gKllnk6ebi0kKiwYOPYYgNuSJs4qKgBX2cfLVtiMj6DtXASSLd+xyKGvOE/kHkjga3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOkKyU1abQFdgTcRZ9bOCtS7IAZQPUgcru1CwhhDyPY=;
 b=PKYHJ7UL1eQ0RodpvAIjg+wxFShGj4hNeOGeAVCyOos7TDAStz5lkbjmBX1Q6ejZPHIJ/Uzfg/sylbcQwLxHeCLaprkX4E9Pg6RAzCf4prywXT4vrxzoGKLD7nTofp1qZg5/DIrO4TpU0Qls7Xe835gc92YkUkjs6vKN5jOV+os=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7637.eurprd04.prod.outlook.com (2603:10a6:20b:29d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 03:10:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 03:10:54 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
Thread-Topic: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
Thread-Index: AQHZyPVXeBJTD139FkmL7cmc6zCmuK/h//CAgADZrYA=
Date: Thu, 10 Aug 2023 03:10:53 +0000
Message-ID: <AM7PR04MB70462E947D9669E11B699DDA9813A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230807061115.3244501-1-victor.liu@nxp.com>
 <CAPDyKFpyQqojAFtmY5NP1gQjL9ag1V-kHLUBRAx2UHBZ6rgVSg@mail.gmail.com>
In-Reply-To: <CAPDyKFpyQqojAFtmY5NP1gQjL9ag1V-kHLUBRAx2UHBZ6rgVSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS8PR04MB7637:EE_
x-ms-office365-filtering-correlation-id: f7712a10-7417-4c2c-c86b-08db994f6897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWI+IEjIJvYAxmUg3kXRM0cv5EYgSZDmvdgmMumD1AH6M+NzfF03CGz9SUztTuE/WKiqpQUxjNqXrbS2MJoHOmPxpLXYYJ2Zj29AA1FMeqdb5Si/W/zxMjv7sLi7s+tIX3LeDcrhSJyhHuOz4hPpLaL4+jfuNk4BN9ZxMHi3MOl/d4rSU2vgE5BMPtA/R9shA08mCy9BjEbS34mDkhgExw+oqqcjEgCxbCd7t3GagEv2U5IfidiWqV+uxvpLVHAB2ObA+HFHkT4TFUJBY/RLoCG8o7jHB2HUPUTcb8MLHtundTi7swiZtAV/rIqP9ApsaT8mbeQaAy64qMc7X0DjiBhIlKQPlwtVYQEIlbYesdQ5xs5I2TB/HTI7jco7OsmeVMhsUAK2bZln/MraV011DxXFimNG6ilDteKR9LJ836U41q26EtQPGQKa/qhLi+sERBN9h+ScOfi0ndVq8yGq9wSBoN1WoBwfgtJ+Ct/nWtYnPrK/IvFMkpIGCvFeoLqbZttpu0NnuL+V4MWbtxFOrdkPmxA31OICP79tIsHQycap5RyIo5LD3ANz4O3lGCIooyzA5Q3yOo/aKxzmgVFQveU33q3b0eaHcnX9i8n3SQg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(186006)(451199021)(1800799006)(316002)(966005)(478600001)(9686003)(2906002)(71200400001)(5660300002)(45080400002)(41300700001)(86362001)(122000001)(7696005)(8936002)(8676002)(52536014)(38070700005)(7416002)(53546011)(26005)(4326008)(6916009)(6506007)(66556008)(66946007)(66446008)(64756008)(66476007)(76116006)(54906003)(33656002)(38100700002)(55016003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QkWtaJeQTim56DRQH4iaFCCP76uAMPltHqLI5N5UVP294FPInNVrftw16Lst?=
 =?us-ascii?Q?cg98VNBfPGqHSAosQcLYdQthYS3ZnxOL0VuJWfzL0h95f8PpYRgy2Dfb7CxJ?=
 =?us-ascii?Q?zSj9oi+i34NDY9/TeoV1fMvh7N7kRo3j4J/sjLSIAYA9vvNxA1fxtgxbDhAg?=
 =?us-ascii?Q?ulIw+p1WVrMlSew8u7ESaCW08RKboAZ3bZ9WIDCudIRIQPVlfunVEf7q4Qxf?=
 =?us-ascii?Q?39yn5n4Cg28/xZKvCbE/jLXrY7BDuS8amX7znJQYygY0Kthi0eFxYzDLBtwY?=
 =?us-ascii?Q?Boh7k7i1SXCLDNQ6ulI+NThareiM4xufBRsTia+2gXkylEH02+fBg9CGiI7r?=
 =?us-ascii?Q?zqokNJXkZvZTmKzENc0fNlKRi722fTH3Yo1JR1DNHGuykXI6+IyQESDv2EHt?=
 =?us-ascii?Q?mIoQ0D23F9Ts+k2bpYhG0tSlkoFU2vRkxFTF1vcR1dScVT9tYNEKhxFOqksU?=
 =?us-ascii?Q?yeSwjvqqbum6BGLaVXLMXLUwBKxy9UjLADKyyz3OQmdj/NwDLcgjZv3Nqz1z?=
 =?us-ascii?Q?jgiXuw9h4t02TuMrqt4y9SIDisx/T7CkLrXJtK+/o0q/9yiABKUvB0sKyv/a?=
 =?us-ascii?Q?z5xAr5S+cNd9YhFTRT/F5bgJxSAmsj2sKKdvh+iXTfSfeByISdRDWDdVc6t0?=
 =?us-ascii?Q?ZQ5VOniLyRpWp3XmR6JC4gKO0zMPZsc5VUn1+5jzqtjwF39XwpM3tpqAy1n3?=
 =?us-ascii?Q?HvX7+fXBPPLfFMf6V7lf+5Kfwmp87iDXDNKNdVhLIqUwcH4HXhxtFN6WQa1y?=
 =?us-ascii?Q?6X6apqwWvE3BF42Psu2uaurrmp0aaaQ42o2vmXQ0+vpEw8J6qu3/bfDCmnwY?=
 =?us-ascii?Q?vfu0ZRbyVjMSamOQto7wVmOsFYudmv/FHLcuLOwfbFKf6hZIEyB/tnjNOOvE?=
 =?us-ascii?Q?boDKRopxgnZmu0PZlYOXTxMbpocmOAa4HM0S46Ddb9mSvI37PYn/fuxIrJzv?=
 =?us-ascii?Q?j2B7Tb94OkQqRtDVYtAo7P9jnWj3tag9Lq+3kNueZEojWI2zTqCak9iPK25z?=
 =?us-ascii?Q?hCpCDwH9DE/gplMeSpOW3A8faDN9joKesxGCbp3qQ+vqMIyyaaoPNj80i7Fk?=
 =?us-ascii?Q?fv8Jf+ak2M+XzZlHPvOQkdUZKuhWKBlV85MYTErEh8F5+X8p4bW4jPr2Kgtv?=
 =?us-ascii?Q?gaRA8eJ2yI309AHkdKFUWQy1EV3cwebvYCvGbFowEWLS8D0LEvfQQ8rDWNAD?=
 =?us-ascii?Q?AquqMPKPZEEkRJkojQPIbTQSvkD8Yczct+WncjA6nuuwpIRdD9xH3WTyaqFh?=
 =?us-ascii?Q?9CQE4C+wy2BeW9pwSs789xFEnp0HtLKnt/dHQ2cXJ7SRgiJyuqG3oliML75R?=
 =?us-ascii?Q?j0UZg9++xkWmbUB8UMD9nnF39aKTAT1VpEN1Z3HG0pBsGl7kd2VD6MCS2bTo?=
 =?us-ascii?Q?I1da5fh5iZNodrPzn1zC1tDYK/ID+dlR3uP64l3rQ/qbUW9KbZqEifhtiTv1?=
 =?us-ascii?Q?o34nIt9EGlAkAtsmeR/hlMzCxzWsNsQ8t9u0XgAafQTP2BVaxBIMgY9Kz0ob?=
 =?us-ascii?Q?56stWcf3WwBGbuj6VGX/PYmDeK/5Jwk83zWWJHmdFrS4qA4TY30gXKeHPEe/?=
 =?us-ascii?Q?FaCjHZtaZzzz6vh1dNU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7712a10-7417-4c2c-c86b-08db994f6897
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 03:10:53.8825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Isq3gNT95qfGvsnVSVWcdTu1nKK0P1nD3JYjypO4HWTq20wdd4iGgSWFh2/DzCYqerN31tCJuMttSWXZH9S+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7637
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
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, August 9, 2023 9:54 PM Ulf Hansson <ulf.hansson@linaro.org> w=
rote:
>
> On Mon, 7 Aug 2023 at 08:06, Liu Ying <victor.liu@nxp.com> wrote:
> >
> > Add the device link when panel bridge is attached and delete the link
> > when panel bridge is detached.  The drm device is the consumer while
> > the panel device is the supplier.  This makes sure that the drm device
> > suspends eariler and resumes later than the panel device, hence resolve=
s
> > problems where the order is reversed, like the problematic case mention=
ed
> > in the below link.
> >
> > Link:
> https://lore.k/
> ernel.org%2Flkml%2FCAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL%2B8fV-
> 7s1CTMqi7u3-
> Rg%40mail.gmail.com%2FT%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7
> Cb498937c20c94ab9148908db98e02662%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638271860697989733%7CUnknown%7CTWFpbGZsb3d8e
> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C3000%7C%7C%7C&sdata=3DiGMdYWbOeyVxzy9T9THCNh%2Ff%2BbKFLP0tI
> m%2BowL7h5Og%3D&reserved=3D0
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Looks good to me! Just a minor question though, don't we need to
> manage runtime PM too - or this is solely for system wide
> suspend/resume?

I think this is solely for system wide suspend/resume.
AFAICS, there is no any particular need to manage runtime PM.

>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thank you for your review.

Regards,
Liu Ying

>
> Kind regards
> Uffe
>
> > ---
> > v2->v3:
> > * Improve commit message s/swapped/reversed/.
> >
> > v1->v2:
> > * Fix bailout for panel_bridge_attach() in case device_link_add() fails=
.
> >
> >  drivers/gpu/drm/bridge/panel.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c
> b/drivers/gpu/drm/bridge/panel.c
> > index 9316384b4474..a6587d233505 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -4,6 +4,8 @@
> >   * Copyright (C) 2017 Broadcom
> >   */
> >
> > +#include <linux/device.h>
> > +
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_connector.h>
> > @@ -19,6 +21,7 @@ struct panel_bridge {
> >         struct drm_bridge bridge;
> >         struct drm_connector connector;
> >         struct drm_panel *panel;
> > +       struct device_link *link;
> >         u32 connector_type;
> >  };
> >
> > @@ -60,6 +63,8 @@ static int panel_bridge_attach(struct drm_bridge
> *bridge,
> >  {
> >         struct panel_bridge *panel_bridge =3D
> drm_bridge_to_panel_bridge(bridge);
> >         struct drm_connector *connector =3D &panel_bridge->connector;
> > +       struct drm_panel *panel =3D panel_bridge->panel;
> > +       struct drm_device *drm_dev =3D bridge->dev;
> >         int ret;
> >
> >         if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > @@ -70,6 +75,14 @@ static int panel_bridge_attach(struct drm_bridge
> *bridge,
> >                 return -ENODEV;
> >         }
> >
> > +       panel_bridge->link =3D device_link_add(drm_dev->dev, panel->dev=
,
> > +                                            DL_FLAG_STATELESS);
> > +       if (!panel_bridge->link) {
> > +               DRM_ERROR("Failed to add device link between %s and %s\=
n",
> > +                         dev_name(drm_dev->dev), dev_name(panel->dev))=
;
> > +               return -EINVAL;
> > +       }
> > +
> >         drm_connector_helper_add(connector,
> >                                  &panel_bridge_connector_helper_funcs);
> >
> > @@ -78,6 +91,7 @@ static int panel_bridge_attach(struct drm_bridge
> *bridge,
> >                                  panel_bridge->connector_type);
> >         if (ret) {
> >                 DRM_ERROR("Failed to initialize connector\n");
> > +               device_link_del(panel_bridge->link);
> >                 return ret;
> >         }
> >
> > @@ -100,6 +114,8 @@ static void panel_bridge_detach(struct drm_bridge
> *bridge)
> >         struct panel_bridge *panel_bridge =3D
> drm_bridge_to_panel_bridge(bridge);
> >         struct drm_connector *connector =3D &panel_bridge->connector;
> >
> > +       device_link_del(panel_bridge->link);
> > +
> >         /*
> >          * Cleanup the connector if we know it was initialized.
> >          *
> > --
> > 2.37.1
> >
