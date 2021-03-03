Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71DF32B559
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A4C6E8C7;
	Wed,  3 Mar 2021 07:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42B36E8C4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geLE/0cXEG3ZFCqkN17pYPWeQYcyRWUQ4dioKdGe/63SCpkCX2YOyyko6XuM7Y5bJVfNina4DMGuZqIR/dpGnBQhWrmJdp3gAmw4YKP805LHKvaPfF1s8NEeP89b+9wAymxQLUOe1JgT7vCjH1wctuhjDdz8+yl1I4EP1kBA+5ElJzV9ca7lrZZOuN5HD5HeL2uQq8TRLUv6SvWD3POcWh13B3RDusGPPhwr+sw1JYfqsTWvTF69dYDY8wzfQ3j2IhyhmEX8aSaho4rU332CcTCe4Uw9d8Ps48niWNW0xE/j6rKUwo1j6RkufFoWqHyTu52EHJkYnyGTwmSTS4cffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZZ1p3JhfCbEg21DiSzMEuXa7tUXdpdlcCMZjiKvg8U=;
 b=Ai91AFrMjjyel6yeE5AKLnlHE/7tDzzRtGqwQJ6BWvf7i+4XFBtRszcYFNomp7omZb+N3tYUlOtnFGckkil5rDsPLRLIa6uAyr2qcyZGgeqp2XhLYuYZaPXUIhgz9zrGbf3cQP2VVdbjoQV6RgP4UaDG23PDWvft+Rpuf9LXQgU6FwbsMRwuGyXrfryKPM9C7fky+fcKHmIfspqXhdTq0WwOA7GTEsFfE4L0099pmK4BWDpmnVi35qHg9r+cCUgMMbpgA6sI9iIUIDM/4S6cUZ826kyiDyTf8Zo7zXYyyCupAnxgA08vzA2l6LHaTwVjJPjSX3phMZAWLnaF58JCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZZ1p3JhfCbEg21DiSzMEuXa7tUXdpdlcCMZjiKvg8U=;
 b=l3Pxfel07np3gWrE34TdcuIZeX4JBqgiZq2GCBdVrYbXHRZZZxaSvLmXJgqP/uHFSG5AI5xS8F9P/dhp/WSkewcDrMagXM6r1jIrph9ehRXbVghaKnGrZ9K1QYg4Y3vHS6smEvZmjcj0QdB/LDEsKCN4T2xe7G3II/LNwasU3ao=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4894.eurprd04.prod.outlook.com (2603:10a6:803:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Wed, 3 Mar
 2021 07:01:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 07:01:08 +0000
Message-ID: <3efe568725446c06859ee8f5fd2b5c08f462ff90.camel@nxp.com>
Subject: Re: [PATCH v4 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel
 link support
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Wed, 03 Mar 2021 14:59:36 +0800
In-Reply-To: <CAG3jFyuncs+BznKUV2M8zfMt_PCwyq+wps_wRB8QaOYxezXzOg@mail.gmail.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-8-git-send-email-victor.liu@nxp.com>
 <CAG3jFyuncs+BznKUV2M8zfMt_PCwyq+wps_wRB8QaOYxezXzOg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:203:d0::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 HKAPR04CA0014.apcprd04.prod.outlook.com (2603:1096:203:d0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 07:01:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 841c2837-ef63-41e6-d065-08d8de121e1e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4894:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4894D5CB1FC12008AEAB8A6998989@VI1PR04MB4894.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gAbrORqjQhnwnIy7jQVEueEnLY2ERpFB61ocBv5xm/Prm5Uy1pWhwObHFFBevLjDHJWX9ce9y5tTtnfNSoFj3WVlXu7WdtXUARZ6lWXObRLBTcjoOUJMNTenctWHbmI5D7BwdP/fLRRLjIvxITcN792gfm4vJSMMe0yjYl7iL/mbr7CEYSld+xCqEusu7m7w88KXqyaOUbFexsulaWm1qAAd9z5G8hN5In/bGg1asszPk8sE1PfC6a7+gNQYpE0OFWEhaFgA1K65YHSGm+zicr1dPA5EiigwnlMre4j50LZFQgnbWHY/WISf2ilWR+WECgTTK+rIf5isFdSeyDDZbt9+M3Ta092m0hMn3j8TU2odjD/6TArMFQRUK6xZbYaHNyMxL4GMvs7xzx/1vlReA3g4Dih2YNpjVwv7mE2hMnSUbNKhEaNDErylhZidVexvGtj/8E3Amh1DotgjKBXBiDNqYOWmP1lIZwO7aCQbIs83JhZWkH6Rj04oHXM13eImVkj2NN5K0mXFjPC4NyIltA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(6486002)(26005)(36756003)(956004)(6666004)(6506007)(5660300002)(186003)(2616005)(2906002)(52116002)(6916009)(86362001)(6512007)(30864003)(54906003)(66946007)(316002)(66476007)(8936002)(66556008)(4326008)(8676002)(16526019)(7416002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDlTVkxtaVh5THlxMU9QbVBaRjVSMTkyOVFFSlNQazEvVlBFams4dDJ2MFB2?=
 =?utf-8?B?ejd2a1g5VmdnZ1FyQUZWcTBnTTFmdTVJaGttUURaWCs4ME8xdTVoTVVBUzE1?=
 =?utf-8?B?bzZMNjF2ci9pd0duaU1mUXZPd0lVQjQ0RGd1bWwvQ2wrWmFxcGdidERsSEoz?=
 =?utf-8?B?OWpJVkVGcGUySEtkVitTekZ6bnI0Tmk1b0pFMkJZSEJWZzROMTBXU3RtdDJ6?=
 =?utf-8?B?WmhxbFlqMHQ5SzhWbEtITkc2Y09hbjRaSVEyZE5vU2tRbFhqZkFCY3c4MUF2?=
 =?utf-8?B?WUpWVFloRU9ybUJ6dTdVV2ZITkFPTnY5VVVZWXhEeWdncElNOGo0SHBrdGw0?=
 =?utf-8?B?TWoxK1RkdlFsblFhYmc2a0p6MzhSckRDeUt0M0FyMzlmNW9YNUxZbTVUQjRi?=
 =?utf-8?B?N0MrdDNOTXh5MXFZV2hENmcvS3NzSmhseUcxVCt3TXQ3bEpkbEp3aEM2YUpp?=
 =?utf-8?B?dStMaDF5eXNjTyt3SXhkb1huRTJldHB6Z1NwMEYyazZqZzVyMkNJeVE0Y3hL?=
 =?utf-8?B?UlQzdlhoSExHekRyTDFZQUovcUYxZWMvc01xand2SmZ0ekNENk4zb2x3eWlm?=
 =?utf-8?B?ZEFhQmpodGxhb2NCeW9oK2NPaEFYRmVhMEhneVhtNFRqY0NKNE52UzM0dThX?=
 =?utf-8?B?ZUNQS0JZdXovRU1zaS9oSndTNEsvdGpGRFlXL1h4Smg2azdZamtZM0VpZDV5?=
 =?utf-8?B?UDdwbEh5NjlUSisxSk1pZUhjSzdpUXVkajNBeW9VQ3hRUU8zU0dlYWdLRUFa?=
 =?utf-8?B?SW9IeXZaUTRmdmZ2R0dDU1ZBOVpObzQ0WFhzSUVKZG0waFRMNjJoWHZyVzNj?=
 =?utf-8?B?NnNQbDJpamNqMGpRanZHZEROeDh0VGI5ZDBlRmUySUxVb3pNdUh0eUxwbXMy?=
 =?utf-8?B?b01oYlFxUjZtaXBUSStWdXk1VXpFYjFxRjlyQVZwZ29weVpDOUJxU2trcnlW?=
 =?utf-8?B?YXc0S1FCRlhka1RKeEFxQUptMThFeG8zL3RnL2lVWDhQV2RLdGlCR0pwU0R1?=
 =?utf-8?B?NHBZK0dDakxsV0M1TDFOb0pjMm9BTVN3ekpVTnF2eUkwYU1uQ3k3RS8yQ2Np?=
 =?utf-8?B?TU00alMybW5NNE1MSHFlM2t6eVQxSFFlUm5qT3hLVnNBMndjSy9UL2JZR1Vz?=
 =?utf-8?B?amJPdkE1WDFkMmpoQ1RNZmVyeTduYzJnUFlqTFJ0QXpObTFvTThZbUJYMkxQ?=
 =?utf-8?B?aHRiNktSQld6eFdZY2JWc1Iwcy91WHVmSWRlR3E2Qk9vVG83Ymg1dGZNZW5n?=
 =?utf-8?B?TXRSc0FwOFNaOWRHNVJLNm5TNGRIQi91bzJZZ0xtTkFWSUFaL1JiN0xDSThs?=
 =?utf-8?B?RlVmQ0ZxMzZsSmdrRHhKdDR3R3VLVHVaWEFSR1p1SXBxTUx4UHVtby9nUFVC?=
 =?utf-8?B?UTdqdnZmczgvN08rS2pWeFp4ZkdIVUplUnZPbWJqQzNwNDhTVlgzMzUwQjlB?=
 =?utf-8?B?K1lKMDJVYVhhNnJHam1LTXVKY3VaZ3JqTW5MNEdhZjBUZEVqaHI3YU9LMjVz?=
 =?utf-8?B?ZzVTcUtxYkx3QXd0THdkMVI0UlliZmVJa3NEQkRORHdqQkl6NXVDWVJyaXBB?=
 =?utf-8?B?S2lqQnZkSmkybGRXM0J0U0pRVHNFcGR1M2g5RkNVUlhvczNySm9mUWFhWi9S?=
 =?utf-8?B?YkJoR21pdFZOVlhFOXptazE4UHkzOS8xekt0ME5xRlJaSWRFR2VVK0pjUldJ?=
 =?utf-8?B?QXJOTHBOWkw4QVZpRXFManI1QWxmYVFYa2Z4dFVsWldBRnRYWjRhMGFmbDRy?=
 =?utf-8?Q?8/SOofY6L4yxR6ntmhY/QUl62FyRNKQz4pR3LcE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841c2837-ef63-41e6-d065-08d8de121e1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 07:01:07.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TB2VnZ2HzoDbGO5H7cNj7DIOR9PROWbiLz5FM7l909w0N0DCx/WE0OPtMjaC+tlPHL/JauDECBRaMuwU82AJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4894
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

On Tue, 2021-03-02 at 14:53 +0100, Robert Foss wrote:
> Hey Liu,
> 
> Thanks for submitting this patch.
> 
> I only have one comment below. With that addressed, feel free to add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Thanks for reviewing this patch.

> 
> On Thu, 18 Feb 2021 at 04:59, Liu Ying <victor.liu@nxp.com> wrote:
> > This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
> > The pixel link forms a standard asynchronous linkage between
> > pixel sources(display controller or camera module) and pixel
> > consumers(imaging or displays).  It consists of two distinct
> > functions, a pixel transfer function and a control interface.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Drop two macros which help define functions and define them directly.
> > * Properly disable all pixel link controls to POR value by calling
> >   imx8qxp_pixel_link_disable_all_controls() from
> >   imx8qxp_pixel_link_bridge_probe().
> > 
> > v1->v2:
> > * Rewrite the function to find the next bridge by properly using OF APIs
> >   and dropping unnecessary DT validation. (Rob)
> > 
> >  drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile             |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 426 ++++++++++++++++++++++++
> >  3 files changed, 435 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > index f1c91b6..4d1f027 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
> >         help
> >           Choose this to enable pixel combiner found in
> >           Freescale i.MX8qm/qxp processors.
> > +
> > +config DRM_IMX8QXP_PIXEL_LINK
> > +       tristate "Freescale i.MX8QM/QXP display pixel link"
> > +       depends on OF
> > +       select DRM_KMS_HELPER
> > +       help
> > +         Choose this to enable display pixel link found in
> > +         Freescale i.MX8qm/qxp processors.
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> > index 7d7c8d6..c15469f 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1 +1,2 @@
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> > +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > new file mode 100644
> > index 00000000..2e5ba4a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > @@ -0,0 +1,426 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright 2020 NXP
> > + */
> > +
> > +#include <linux/firmware/imx/svc/misc.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_atomic_state_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +#define DRIVER_NAME            "imx8qxp-display-pixel-link"
> > +#define PL_MAX_MST_ADDR                3
> > +#define PL_MAX_NEXT_BRIDGES    2
> > +
> > +struct imx8qxp_pixel_link {
> > +       struct drm_bridge bridge;
> > +       struct drm_bridge *next_bridge;
> > +       struct device *dev;
> > +       struct imx_sc_ipc *ipc_handle;
> > +       int id;
> > +       int stream_id;
> > +       int dc_id;
> > +       u32 sink_rsc;
> > +       u32 mst_addr;
> > +       u8 mst_addr_ctrl;
> > +       u8 mst_en_ctrl;
> > +       u8 mst_vld_ctrl;
> > +       u8 sync_ctrl;
> > +};
> > +
> > +static void imx8qxp_pixel_link_enable_mst_en(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +                                     pl->mst_en_ctrl, true);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +                       "failed to enable DC%d stream%d pixel link mst_en: %d\n",
> > +                                               pl->dc_id, pl->stream_id, ret);
> > +}
> > +
> > +static void imx8qxp_pixel_link_enable_mst_vld(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +                                     pl->mst_vld_ctrl, true);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +               "failed to enable DC%d stream%d pixel link mst_vld: %d\n",
> > +                                               pl->dc_id, pl->stream_id, ret);
> > +}
> > +
> > +static void imx8qxp_pixel_link_enable_sync(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +                                     pl->sync_ctrl, true);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +                       "failed to enable DC%d stream%d pixel link sync: %d\n",
> > +                                               pl->dc_id, pl->stream_id, ret);
> > +}
> > +
> > +static int imx8qxp_pixel_link_disable_mst_en(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +                                     pl->mst_en_ctrl, false);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +               "failed to disable DC%d stream%d pixel link mst_en: %d\n",
> > +                                               pl->dc_id, pl->stream_id, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pixel_link_disable_mst_vld(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +                                     pl->mst_vld_ctrl, false);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +               "failed to disable DC%d stream%d pixel link mst_vld: %d\n",
> > +                                               pl->dc_id, pl->stream_id, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pixel_link_disable_sync(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +                                     pl->sync_ctrl, false);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +                       "failed to disable DC%d stream%d pixel link sync: %d\n",
> > +                                               pl->dc_id, pl->stream_id, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx_sc_misc_set_control(pl->ipc_handle,
> > +                                     pl->sink_rsc, pl->mst_addr_ctrl,
> > +                                     pl->mst_addr);
> > +       if (ret)
> > +               DRM_DEV_ERROR(pl->dev,
> > +                   "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
> > +                   pl->dc_id, pl->stream_id, pl->mst_addr, ret);
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
> > +                                           enum drm_bridge_attach_flags flags)
> > +{
> > +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +               DRM_DEV_ERROR(pl->dev,
> > +                             "do not support creating a drm_connector\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!bridge->encoder) {
> > +               DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       return drm_bridge_attach(bridge->encoder,
> > +                                pl->next_bridge, bridge,
> > +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +static void
> > +imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
> > +                                  const struct drm_display_mode *mode,
> > +                                  const struct drm_display_mode *adjusted_mode)
> > +{
> > +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +       imx8qxp_pixel_link_set_mst_addr(pl);
> > +}
> > +
> > +static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                             struct drm_bridge_state *old_bridge_state)
> > +{
> > +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +       imx8qxp_pixel_link_enable_mst_en(pl);
> > +       imx8qxp_pixel_link_enable_mst_vld(pl);
> > +       imx8qxp_pixel_link_enable_sync(pl);
> > +}
> > +
> > +static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                               struct drm_bridge_state *old_bridge_state)
> > +{
> > +       struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +       imx8qxp_pixel_link_disable_mst_en(pl);
> > +       imx8qxp_pixel_link_disable_mst_vld(pl);
> > +       imx8qxp_pixel_link_disable_sync(pl);
> > +}
> > +
> > +static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
> > +       MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> > +       MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> > +};
> > +
> > +static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
> > +               if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge_state,
> > +                                       struct drm_crtc_state *crtc_state,
> > +                                       struct drm_connector_state *conn_state,
> > +                                       u32 output_fmt,
> > +                                       unsigned int *num_input_fmts)
> > +{
> > +       u32 *input_fmts;
> > +
> > +       if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
> > +               return NULL;
> > +
> > +       *num_input_fmts = 1;
> > +
> > +       input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +       if (!input_fmts)
> > +               return NULL;
> > +
> > +       input_fmts[0] = output_fmt;
> > +
> > +       return input_fmts;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge_state,
> > +                                       struct drm_crtc_state *crtc_state,
> > +                                       struct drm_connector_state *conn_state,
> > +                                       unsigned int *num_output_fmts)
> > +{
> > +       *num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> > +       return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
> > +                       sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
> > +}
> > +
> > +static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
> > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> > +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> > +       .attach                 = imx8qxp_pixel_link_bridge_attach,
> > +       .mode_set               = imx8qxp_pixel_link_bridge_mode_set,
> > +       .atomic_enable          = imx8qxp_pixel_link_bridge_atomic_enable,
> > +       .atomic_disable         = imx8qxp_pixel_link_bridge_atomic_disable,
> > +       .atomic_get_input_bus_fmts =
> > +                       imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
> > +       .atomic_get_output_bus_fmts =
> > +                       imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
> > +};
> > +
> > +static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl)
> > +{
> > +       int ret;
> > +
> > +       ret = imx8qxp_pixel_link_disable_mst_en(pl);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = imx8qxp_pixel_link_disable_mst_vld(pl);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return imx8qxp_pixel_link_disable_sync(pl);
> > +}
> > +
> > +static struct drm_bridge *
> > +imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
> > +{
> > +       struct device_node *np = pl->dev->of_node;
> > +       struct device_node *port, *remote;
> > +       struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
> > +       u32 port_id;
> > +       bool found_port = false;
> > +       int reg, ep_cnt = 0;
> > +       int bridge_sel = 0;     /* select the first next bridge by default */
> 
> Is this comment on the wrong line?

I'll make this comment occupy a line just prior to this line in the
next version.

Thanks,
Liu Ying

> 
> > +
> > +       for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
> > +               port = of_graph_get_port_by_id(np, port_id);
> > +               if (!port)
> > +                       continue;
> > +
> > +               if (of_device_is_available(port)) {
> > +                       found_port = true;
> > +                       of_node_put(port);
> > +                       break;
> > +               }
> > +
> > +               of_node_put(port);
> > +       }
> > +
> > +       if (!found_port) {
> > +               DRM_DEV_ERROR(pl->dev, "no available output port\n");
> > +               return ERR_PTR(-ENODEV);
> > +       }
> > +
> > +       for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
> > +               remote = of_graph_get_remote_node(np, port_id, reg);
> > +               if (!remote)
> > +                       continue;
> > +
> > +               if (!of_device_is_available(remote->parent)) {
> > +                       DRM_DEV_DEBUG(pl->dev,
> > +                          "port%u endpoint%u remote parent is not available\n",
> > +                                                               port_id, reg);
> > +                       of_node_put(remote);
> > +                       continue;
> > +               }
> > +
> > +               next_bridge[ep_cnt] = of_drm_find_bridge(remote);
> > +               if (!next_bridge[ep_cnt]) {
> > +                       of_node_put(remote);
> > +                       return ERR_PTR(-EPROBE_DEFER);
> > +               }
> > +
> > +               /* specially select the next bridge with companion PXL2DPI */
> > +               if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
> > +                       bridge_sel = ep_cnt;
> > +
> > +               ep_cnt++;
> > +
> > +               of_node_put(remote);
> > +       }
> > +
> > +       pl->mst_addr = port_id - 1;
> > +
> > +       return next_bridge[bridge_sel];
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
> > +{
> > +       struct imx8qxp_pixel_link *pl;
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *np = dev->of_node;
> > +       int ret;
> > +
> > +       pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> > +       if (!pl)
> > +               return -ENOMEM;
> > +
> > +       ret = imx_scu_get_handle(&pl->ipc_handle);
> > +       if (ret) {
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> > +                                                                       ret);
> > +               return ret;
> > +       }
> > +
> > +       pl->id = of_alias_get_id(np, "dc_pl");
> > +       if (pl->id < 0) {
> > +               DRM_DEV_ERROR(dev,
> > +                             "failed to get pixel link node alias id: %d\n",
> > +                                                               pl->id);
> > +               return pl->id;
> > +       }
> > +
> > +       pl->dev = dev;
> > +
> > +       pl->dc_id = pl->id / 2;
> > +       pl->stream_id = pl->id % 2;
> > +
> > +       pl->sink_rsc = pl->dc_id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
> > +
> > +       if (pl->stream_id == 0) {
> > +               pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST1_ADDR;
> > +               pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST1_ENB;
> > +               pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST1_VLD;
> > +               pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL0;
> > +       } else {
> > +               pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST2_ADDR;
> > +               pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST2_ENB;
> > +               pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST2_VLD;
> > +               pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL1;
> > +       }
> > +
> > +       /* disable all controls to POR default */
> > +       ret = imx8qxp_pixel_link_disable_all_controls(pl);
> > +       if (ret)
> > +               return ret;
> > +
> > +       pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
> > +       if (IS_ERR(pl->next_bridge)) {
> > +               ret = PTR_ERR(pl->next_bridge);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> > +                                                                       ret);
> > +               return ret;
> > +       }
> > +
> > +       platform_set_drvdata(pdev, pl);
> > +
> > +       pl->bridge.driver_private = pl;
> > +       pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
> > +       pl->bridge.of_node = np;
> > +
> > +       drm_bridge_add(&pl->bridge);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
> > +{
> > +       struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
> > +
> > +       drm_bridge_remove(&pl->bridge);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
> > +       { .compatible = "fsl,imx8qm-dc-pixel-link", },
> > +       { .compatible = "fsl,imx8qxp-dc-pixel-link", },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
> > +
> > +static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
> > +       .probe  = imx8qxp_pixel_link_bridge_probe,
> > +       .remove = imx8qxp_pixel_link_bridge_remove,
> > +       .driver = {
> > +               .of_match_table = imx8qxp_pixel_link_dt_ids,
> > +               .name = DRIVER_NAME,
> > +       },
> > +};
> > +module_platform_driver(imx8qxp_pixel_link_bridge_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8QXP/QM display pixel link bridge driver");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:" DRIVER_NAME);
> > --
> > 2.7.4
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
