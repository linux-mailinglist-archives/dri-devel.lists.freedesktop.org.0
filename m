Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A908432B585
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C2D6E8CA;
	Wed,  3 Mar 2021 07:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30071.outbound.protection.outlook.com [40.107.3.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0946E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiWkNkvzgibYJ21msM1ifl7JfVqb6yPuzAJriT8hJmM6d7qLb525qRG/xCaMnrymC5a93m9iHsE3q5b39JZDAcEWi02feqeNd2i0sKOABZTCWrP0ZWcLD/HmJdZWcHaoEJG/u3BqT063sI5hsCqF6ZaUG+DyBqkuFK4ccdgbGg8ycF9nVHvpua80q0q6xad4Ewr9X4qZWgTG7m5a5WufWtDYuLQ4vaDUggToYARUnHlJQMFGG1n4p98FprYOjxywRLavlyJdzvRm8YP/HZTgz9fuBW761O9+UeElk0crBARPzqZ1up6kOSom7nbuZBlyUgrmLZB2ZyZgrM7QLJxhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwk+YMpiPXsZL2QmuwpGuVC09ML7AWg1su0HFXFo7w0=;
 b=BLJ16OLCP6yFJGJu4YuMj7gKH0DQjH1dH8yTFYZVifmcfqJZQgLjP7oI108b+guYGkVpxPvmFczd01KnclvaqssfTydsJ5UwJy4reG6DpjgsiSXw6SLCpU10SiXDxX1lVy5HHWReOoz5usOyKO2yfAQXh/3S6YpNRXrV0PZ5rmvOZQcLYUbAsEwqujlLbB3BD0GIWP1b4BvgfzSCk3uyBq537ogPX6Ao8cRpDpY8+fDYMyR76x5PChKmhY33vpRj/hNNRKj2MoaU+8ObHa/wMlbLz+JxvVxvivfpXzEbYMeXFGAr0zyAgH7rfOsUQxInOCJM8V47nyF1WMFxWZvS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwk+YMpiPXsZL2QmuwpGuVC09ML7AWg1su0HFXFo7w0=;
 b=BSQ9aAn4si7oYJkBm8mOXH71y3uoXO1q1Cn/udF6O1ldCaR4cLDxmRaL2+5hWYr95er9j9cQlXWgqcgGR20GBOdCEmxqVw2blMr+/lSGTPDvxs4KzABfXhHHG1t5PfAJPeM42baKZ0baS96abSt1tJX6p9emtrLpVP6EfJxS7Gk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 07:23:09 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 07:23:09 +0000
Message-ID: <9c437b07a47b14c47f65ac58f6cf9bc95edab169.camel@nxp.com>
Subject: Re: [PATCH v4 10/14] drm/bridge: imx: Add LDB driver helper support
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Wed, 03 Mar 2021 15:21:39 +0800
In-Reply-To: <CAG3jFysTKXsmfx4x=XVdu3X0amE9EUOxN=bYo4eg+XjnqyFsVg@mail.gmail.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-11-git-send-email-victor.liu@nxp.com>
 <CAG3jFysTKXsmfx4x=XVdu3X0amE9EUOxN=bYo4eg+XjnqyFsVg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR03CA0055.apcprd03.prod.outlook.com
 (2603:1096:202:17::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HK2PR03CA0055.apcprd03.prod.outlook.com (2603:1096:202:17::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Wed, 3 Mar 2021 07:23:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27df2942-203f-425e-2534-08d8de1531a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6992990E0F2E0D7BCC75B5C398989@VI1PR04MB6992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+D2Rzk2EM16MrzyY3KxCMLWGRKupyQ6kxoDgoIww0UPowRGcYZAmAnoqbjrUpDTotU6bCMDyEj6ao1A3tVzEA9OIyKX8AnScHOerCP2ysekMXrvyn3zcGBZ5ScSztEnZsoZW6VgHzQmlZAGXR97SIU/7SohqPvBs9QgXGNmRWZdgYqfnJlpSv7stQVCGgwZZWPYbbYcsqx4bqVKGsJWrZqijmD0X2snCcKUfEoY1prCSojcdbuVKzQfb3O5VjErtPbqwMGhtDC3sCqGM+LlMncpqVyvOs1JjN/SLXL1FGUG08ZQw0eQZw+uex6U++RLIrJnG+t7riQF9zm+ZyDZExsYFL2P4AfhhkF/3qS96aMdOkRZLwdK6jbNctkSAeI9y1HQ0iKUfuW/NHycscV/0auaCv0dMBM9ay5XDS0Tf2eNnIWQ7DOBcTBCJZ8myoiymslodYbGFsB3YjL+i+y9n7SkIvPM7zWIgp67PiRkA4ART5rU94Ew8i9f3zsYsROeLbBRGH4fv+5rLn7OGw7Enw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(7416002)(316002)(16526019)(6512007)(186003)(6486002)(4326008)(6916009)(54906003)(66946007)(6506007)(26005)(52116002)(36756003)(6666004)(478600001)(86362001)(956004)(8936002)(2906002)(8676002)(66556008)(30864003)(66476007)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWlRdmViZlN6Y1NkakVxN3pJaHVPSmtYb2VOeGNXTzRQZ0NJaG1HSTNKaG00?=
 =?utf-8?B?Q2EzQ083Y2ZwL3RUdHhOamlXSStSR3QwUXgyam9RQTFDdVNIc0srZ3ozeko0?=
 =?utf-8?B?WHRnMy82cG9lKzNwdVR3UXlsd3h3TGExRTJpcVRxODZqZEl2azJ0cVpQeG5T?=
 =?utf-8?B?Q01aTVVaaWJZVEhNMEk0S1RDT0NwbXQvNmdoQjMySm11LzZyaWlpS2c1MXI1?=
 =?utf-8?B?TFVTeWowT3l5OHVjNy9kRHY3Mml5NEhKL29WNE9UUi9xZXlWdEc4L0JXS3Nl?=
 =?utf-8?B?ZjBNdGpjVTVBdTYvZVp0Q0kvT1FzUkQveklTSDNtZTVKa080a21yYXBWclVR?=
 =?utf-8?B?cncxazB0MlJycktYYzBvNEhoN1hMOHdCaytwSTloRDVQZ3diaUNFa3BlSnBr?=
 =?utf-8?B?bU5kV0NkRDBXUEg4c0pHeVZ5aGVkV3pRd3E2QnhLQlVBenVqZlRLaVZYM1pN?=
 =?utf-8?B?SDBFM3B4aDVHQ2RZdWJRVG5RbythaWE1QXVrM0tZdURIVTkyWkFFNjY2OGZG?=
 =?utf-8?B?Yk04SHlZN0RJVmovaWE2a2wyc0FMTGVyM3VFVXpVakZLcHROWjlEc0ordDlo?=
 =?utf-8?B?SFk2QWZOWCszMENxK0lKUW9MU0dISWpvL3VuYnBrRVNGQWNLR3NWNnczQjlr?=
 =?utf-8?B?Z2lrTGtiUHZ2eFoyc1krRVRFOWxwVWhOZDJjQ25BMm8rTUpQU0d1UjFWUEpY?=
 =?utf-8?B?TE1uRjdNWDVwd0xEYjlSci9yTHI5YWtjcFpzQUpHVlh1eEExUDlyQWtMNlFt?=
 =?utf-8?B?c3ErdmJwMStHUk5GQXFqdXZ0SFRkYU9uajFGMGlqQ0lZeFJwcGpaMjNtelBm?=
 =?utf-8?B?bW1tRkM2OS9lTUwxK1BmUmlFbktiN0tTQ1d5L0c3UEJ6STNPN3RhYjkwZ1JU?=
 =?utf-8?B?UUVmQUJFL0ZRcjJiRVVyOUo1NFR2WUpaVURzVmkxTE8yL2dISU1MaUNoUW0z?=
 =?utf-8?B?NzBrWmZUZndRRFluVmFmazMxRzZMUWpQVEVMSnIyUWYwN2YwdFpETzFqZGVk?=
 =?utf-8?B?WkRUV2JvU01wamtlMEpNQXB0RjBneXJrWmxwSHJYQUliM0s4NGMzOUJ0RnA3?=
 =?utf-8?B?V0lEenpTZlNCSlFGMmVLMWZ5S1pVWWpaUG5FNzJ2a1V1L2h1Q1Nkd3N5YXlv?=
 =?utf-8?B?Zk4rWmVPRnpSeCs1eHNEQVh1dFJwYUhaMlBUNUNRaXVXV0ovZnJuaW56Z2NU?=
 =?utf-8?B?VlJINEZaSFhmd2tSUGJkeFh5dERkS3k1OC9zZEY2OEJ1RHhvUW9jcUlSamFs?=
 =?utf-8?B?M296NmlIaTRtOEZTQzlEbk9leFVLM0x1RTR1cTJvYy9nWnE0UXZPQ1JIQlZW?=
 =?utf-8?B?ekR2dzMrTUVBdXhZcEFFbEorbElIbFppSGw3QnVNeVVIblFORDBzUzFMVkY3?=
 =?utf-8?B?QTJKekxNMWwzMVcwZDk4cDY3S3BKUlBGZ05ONGdlSFJya2ZpQXFnaitjUGRU?=
 =?utf-8?B?RXZCOUpQNlJZTXNGWmdpd2RPbUpmMTFwaE9Dbk9kS1ZBV2ZaTXZlM01IbFVu?=
 =?utf-8?B?VS9jenMvUnUvRnA2SWd5MnB6Y1ovNGRXRHQ5YXdjandwTFhHSHFSS1dxT1hL?=
 =?utf-8?B?UlNpdkZJOGNpL3A5YU9TeE03U3dUMFJTQ0dsSXBhMERzRUJXUHJhck5nTU95?=
 =?utf-8?B?VDIxRFR0Mk43bUFiWEYwRXpPaEVVK2FIRDZqZ2gvVHNQNkNNc2o0YzVMaDJT?=
 =?utf-8?B?cDRlcXV3eklzckpVZHhDVHEvVkVqc3JsblBsR3BvRGxyM29xZmxKNDAvVlRl?=
 =?utf-8?Q?6Qn74q6CqQOIKkz82G382TxufItFDPwCn1a+3Un?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27df2942-203f-425e-2534-08d8de1531a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 07:23:08.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qX0C+TktmFMt+mbIdrytTXl8YLASoEj6SI6Fw9M8ExH1fh19PIGvV4vQXoJtOp4XBAEHXz5st91ngb/1UeJgAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
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
Cc: "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 s.hauer@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, shawnguo@kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On Tue, 2021-03-02 at 15:22 +0100, Robert Foss wrote:
> Hey Liu,
> 
> Thanks for submitting this patch.

Thanks for reviewing this patch.

> 
> On Thu, 18 Feb 2021 at 04:59, Liu Ying <victor.liu@nxp.com> wrote:
> > This patch adds a helper to support LDB drm bridge drivers for
> > i.MX SoCs.  Helper functions exported from this driver should
> > implement common logics for all LDB modules embedded in i.MX SoCs.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Call syscon_node_to_regmap() to get regmap instead of
> >   syscon_regmap_lookup_by_phandle().
> > 
> > v1->v2:
> > * No change.
> > 
> >  drivers/gpu/drm/bridge/imx/Kconfig          |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 248 ++++++++++++++++++++++++++++
> >  include/drm/bridge/imx_ldb_helper.h         |  98 +++++++++++
> >  4 files changed, 355 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> >  create mode 100644 include/drm/bridge/imx_ldb_helper.h
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > index 1ea1ce7..23e24fd 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -1,3 +1,11 @@
> > +config DRM_IMX_LVDS_BRIDGE_HELPER
> > +       tristate "Freescale i.MX LVDS display bridge helper"
> > +       depends on OF
> > +       select DRM_PANEL_BRIDGE
> > +       help
> > +         Helper to support Freescale i.MX LVDS Display Bridge(LDB).
> > +         This bridge is embedded in a SoC.
> > +
> >  config DRM_IMX8QXP_PIXEL_COMBINER
> >         tristate "Freescale i.MX8QM/QXP pixel combiner"
> >         depends on OF
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> > index e74dd64..902b703 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1,3 +1,4 @@
> > +obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > new file mode 100644
> > index 00000000..94d7f9e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > @@ -0,0 +1,248 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2012 Sascha Hauer, Pengutronix
> > + * Copyright 2019,2020 NXP
> > + */
> > +
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <drm/bridge/imx_ldb_helper.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +
> > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> > +{
> > +       return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
> > +
> > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> > +{
> > +       return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> > +              ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
> > +
> > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state)
> > +{
> > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > +
> > +       ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> > +       ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
> > +
> > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > +                               const struct drm_display_mode *mode,
> > +                               const struct drm_display_mode *adjusted_mode)
> > +{
> > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > +       struct ldb *ldb = ldb_ch->ldb;
> > +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> > +
> > +       if (is_split)
> > +               ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
> > +
> > +       switch (ldb_ch->out_bus_format) {
> > +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > +               break;
> > +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +               if (ldb_ch->chno == 0 || is_split)
> > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> > +               if (ldb_ch->chno == 1 || is_split)
> > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> > +               break;
> > +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +               if (ldb_ch->chno == 0 || is_split)
> > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> > +                                        LDB_BIT_MAP_CH0_JEIDA;
> > +               if (ldb_ch->chno == 1 || is_split)
> > +                       ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> > +                                        LDB_BIT_MAP_CH1_JEIDA;
> > +               break;
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
> > +
> > +void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> > +{
> > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > +       struct ldb *ldb = ldb_ch->ldb;
> > +
> > +       /*
> > +        * Platform specific bridge drivers should set ldb_ctrl properly
> > +        * for the enablement, so just write the ctrl_reg here.
> > +        */
> > +       regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
> > +
> > +void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> > +{
> > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > +       struct ldb *ldb = ldb_ch->ldb;
> > +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> > +
> > +       if (ldb_ch->chno == 0 || is_split)
> > +               ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> > +       if (ldb_ch->chno == 1 || is_split)
> > +               ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> > +
> > +       regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
> > +
> > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > +                            enum drm_bridge_attach_flags flags)
> > +{
> > +       struct ldb_channel *ldb_ch = bridge->driver_private;
> > +       struct ldb *ldb = ldb_ch->ldb;
> > +
> > +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +               DRM_DEV_ERROR(ldb->dev,
> > +                             "do not support creating a drm_connector\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!bridge->encoder) {
> > +               DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       return drm_bridge_attach(bridge->encoder,
> > +                               ldb_ch->next_bridge, bridge,
> > +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
> > +
> > +int ldb_init_helper(struct ldb *ldb)
> > +{
> > +       struct device *dev = ldb->dev;
> > +       struct device_node *np = dev->of_node;
> > +       struct device_node *child;
> > +       int ret;
> > +       u32 i;
> > +
> > +       ldb->regmap = syscon_node_to_regmap(np->parent);
> > +       if (IS_ERR(ldb->regmap)) {
> > +               ret = PTR_ERR(ldb->regmap);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       for_each_available_child_of_node(np, child) {
> > +               struct ldb_channel *ldb_ch;
> > +
> > +               ret = of_property_read_u32(child, "reg", &i);
> > +               if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> > +                       ret = -EINVAL;
> > +                       DRM_DEV_ERROR(dev,
> > +                                     "invalid channel node address: %u\n", i);
> > +                       of_node_put(child);
> > +                       return ret;
> > +               }
> > +
> > +               ldb_ch = ldb->channel[i];
> > +               ldb_ch->ldb = ldb;
> > +               ldb_ch->chno = i;
> > +               ldb_ch->is_available = true;
> > +               ldb_ch->np = child;
> > +
> > +               ldb->available_ch_cnt++;
> > +       }
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_init_helper);
> > +
> > +int ldb_find_next_bridge_helper(struct ldb *ldb)
> > +{
> > +       struct device *dev = ldb->dev;
> > +       struct ldb_channel *ldb_ch;
> > +       int ret, i;
> > +
> > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > +               ldb_ch = ldb->channel[i];
> > +
> > +               if (!ldb_ch->is_available)
> > +                       continue;
> > +
> > +               ret = drm_of_find_panel_or_bridge(ldb_ch->np, 1, 0,
> > +                                                 &ldb_ch->panel,
> > +                                                 &ldb_ch->next_bridge);
> > +               if (ret) {
> > +                       if (ret != -EPROBE_DEFER)
> > +                               DRM_DEV_ERROR(dev,
> > +                                       "failed to find panel or bridge: %d\n",
> > +                                                                       ret);
> > +                       return ret;
> > +               }
> > +
> > +               if (ldb_ch->panel) {
> > +                       ldb_ch->next_bridge = devm_drm_panel_bridge_add(dev,
> > +                                                               ldb_ch->panel);
> > +                       if (IS_ERR(ldb_ch->next_bridge)) {
> > +                               ret = PTR_ERR(ldb_ch->next_bridge);
> > +                               DRM_DEV_ERROR(dev,
> > +                                       "failed to add panel bridge: %d\n",
> > +                                                                       ret);
> > +                               return ret;
> > +                       }
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
> > +
> > +void ldb_add_bridge_helper(struct ldb *ldb,
> > +                          const struct drm_bridge_funcs *bridge_funcs)
> > +{
> > +       struct ldb_channel *ldb_ch;
> > +       int i;
> > +
> > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > +               ldb_ch = ldb->channel[i];
> > +
> > +               if (!ldb_ch->is_available)
> > +                       continue;
> > +
> > +               ldb_ch->bridge.driver_private = ldb_ch;
> > +               ldb_ch->bridge.funcs = bridge_funcs;
> > +               ldb_ch->bridge.of_node = ldb_ch->np;
> > +
> > +               drm_bridge_add(&ldb_ch->bridge);
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
> > +
> > +void ldb_remove_bridge_helper(struct ldb *ldb)
> > +{
> > +       struct ldb_channel *ldb_ch;
> > +       int i;
> > +
> > +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> > +               ldb_ch = ldb->channel[i];
> > +
> > +               if (!ldb_ch->is_available)
> > +                       continue;
> > +
> > +               drm_bridge_remove(&ldb_ch->bridge);
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
> > +
> > +MODULE_DESCRIPTION("Freescale i.MX LVDS Display Bridge driver helper");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:imx-ldb-helper");
> 
> I'm not entirely sure why this set of helper functions should be a
> module. It's not a driver, but rather a toolbox for the LDB driver,
> which is fine, but there is no situation I can see where this module
> would be unloaded and the LDB driver would be loaded.

I can see drivers/gpu/drm/drm_mipi_dbi.c is also a module and
essentially provides helpers to MIPI DBI drivers, but it is not a
driver.  I don't see this imx-ldb-helper can be anything else other
than a module.

Or, do you mean that imx-ldb-helper should be only built-in?

> 
> > diff --git a/include/drm/bridge/imx_ldb_helper.h b/include/drm/bridge/imx_ldb_helper.h
> > new file mode 100644
> > index 00000000..2a7ba97
> > --- /dev/null
> > +++ b/include/drm/bridge/imx_ldb_helper.h
> 
> This header is specific to this driver, and I would expect it to not
> be useful to other drivers. Additionally the filename has a different
> format than the .c file it corresponds to. I would change the name and
> path to "drivers/gpu/drm/bridge/imx/imx-ldb-helper.h".

The i.MX53/6qdl LDB driver(drivers/gpu/drm/imx/imx-ldb.c) can
potentially use this header, but it's a DRM encoder driver.
So, maybe, it's a good idea to move this header to the 'drivers' folder
and rename it to 'imx-ldb-helper.h' ofc.  If no objections, I'll do as
what you're suggesting here in the next version.

Regards,
Liu Ying

> 
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +
> > +/*
> > + * Copyright 2019,2020 NXP
> > + */
> > +
> > +#ifndef __FSL_IMX_LDB__
> > +#define __FSL_IMX_LDB__
> > +
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_panel.h>
> > +
> > +#define LDB_CH0_MODE_EN_TO_DI0         (1 << 0)
> > +#define LDB_CH0_MODE_EN_TO_DI1         (3 << 0)
> > +#define LDB_CH0_MODE_EN_MASK           (3 << 0)
> > +#define LDB_CH1_MODE_EN_TO_DI0         (1 << 2)
> > +#define LDB_CH1_MODE_EN_TO_DI1         (3 << 2)
> > +#define LDB_CH1_MODE_EN_MASK           (3 << 2)
> > +#define LDB_SPLIT_MODE_EN              (1 << 4)
> > +#define LDB_DATA_WIDTH_CH0_24          (1 << 5)
> > +#define LDB_BIT_MAP_CH0_JEIDA          (1 << 6)
> > +#define LDB_DATA_WIDTH_CH1_24          (1 << 7)
> > +#define LDB_BIT_MAP_CH1_JEIDA          (1 << 8)
> > +#define LDB_DI0_VS_POL_ACT_LOW         (1 << 9)
> > +#define LDB_DI1_VS_POL_ACT_LOW         (1 << 10)
> > +
> > +#define MAX_LDB_CHAN_NUM               2
> > +
> > +enum ldb_channel_link_type {
> > +       LDB_CH_SINGLE_LINK,
> > +       LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS,
> > +       LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS,
> > +};
> > +
> > +struct ldb;
> > +
> > +struct ldb_channel {
> > +       struct ldb *ldb;
> > +       struct drm_bridge bridge;
> > +       struct drm_panel *panel;
> > +       struct drm_bridge *next_bridge;
> > +       struct device_node *np;
> > +       u32 chno;
> > +       bool is_available;
> > +       u32 in_bus_format;
> > +       u32 out_bus_format;
> > +       enum ldb_channel_link_type link_type;
> > +};
> > +
> > +struct ldb {
> > +       struct regmap *regmap;
> > +       struct device *dev;
> > +       struct ldb_channel *channel[MAX_LDB_CHAN_NUM];
> > +       unsigned int ctrl_reg;
> > +       u32 ldb_ctrl;
> > +       unsigned int available_ch_cnt;
> > +};
> > +
> > +#define bridge_to_ldb_ch(b)    container_of(b, struct ldb_channel, bridge)
> > +
> > +bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
> > +bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
> > +
> > +int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> > +                                  struct drm_bridge_state *bridge_state,
> > +                                  struct drm_crtc_state *crtc_state,
> > +                                  struct drm_connector_state *conn_state);
> > +
> > +void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> > +                               const struct drm_display_mode *mode,
> > +                               const struct drm_display_mode *adjusted_mode);
> > +
> > +void ldb_bridge_enable_helper(struct drm_bridge *bridge);
> > +
> > +void ldb_bridge_disable_helper(struct drm_bridge *bridge);
> > +
> > +int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> > +                            enum drm_bridge_attach_flags flags);
> > +
> > +int ldb_init_helper(struct ldb *ldb);
> > +
> > +int ldb_find_next_bridge_helper(struct ldb *ldb);
> > +
> > +void ldb_add_bridge_helper(struct ldb *ldb,
> > +                          const struct drm_bridge_funcs *bridge_funcs);
> > +
> > +void ldb_remove_bridge_helper(struct ldb *ldb);
> > +
> > +#endif /* __FSL_IMX_LDB__ */
> > --
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
