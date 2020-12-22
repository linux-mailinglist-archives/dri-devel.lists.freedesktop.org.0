Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CAC2E1B2F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892C6E8F0;
	Wed, 23 Dec 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6066E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjS7bsAjmcL5Y2ABHeYV90Dy7NZ5c3Js41oW247i/ZOEIk7D6mR9NZEvDnga4U60prEF7sYABOfFVcEhTm06t6m/CGbIPdxSLHO/TY7v/vUKbnkB+wyUQUqsP/ZrxY8wFenUoBO81uavq0qZYQBIHbR/UaBND5hrbhO8Ws3qWi5U8+/HHsuVys0nH66MYVQ8qsBnjVVy70Dnt2xnwnGoWxauL2PTDiTkDtamjS6EviAbJ6NlVMOYWC+vL37705AqU8SksCeozjFeceSwZ+l82UIC6JdSQmqfZNg8rsrWpXv9uoCv48CuD3PbPDfMdQNGoGHBEHvmFmpN+XKm0GO/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNJjb6F+LD7bkHUfbpDF03d0ugcKVBUQ2mz/GsnqGJo=;
 b=clilLFZ78D0TbgBsaZy+neu3lhd4pVM1iXgEZNfAmX48R/fzFFo7amim+ywYzwDEjytThGbdq4MdQvFfd9AaX3/tDOAeJZl2CUi1VHELpg+Uyh7s157ocXaEnnbEWsC+bDP7zvhFfbbXrsFcmLlDkrgLXb+5biEVsgWyd+OPPM3jQsu4fnxTybT2/29WAq2t8aZZuTmPzSzziUJ6t+GkiZSHPrRKUqUmoRe1qD4efsKzXB/tHSA1SHYzqxtd4Jagx3voiDpYquvyfC/ybLQPrH8yOFqJqx0rfiUOViFdobAZ78dm3jLSf3jwgwXzwSU0fNgxmMOctgvLmqU06kEd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNJjb6F+LD7bkHUfbpDF03d0ugcKVBUQ2mz/GsnqGJo=;
 b=c1fmasGJFZKaI0/I/A6v9eQYdyj/Qz2wEzw/V6CVb2aQ0usi/3mHpxfzBw8Mpy35gNyn5ZdWYw1z3fReWSof/UYnUSN9zV33b+OjVDwCESJOIwDBLb9rldlPQhUX3wW7Gye1ML9xQDeRE9ClHJNa9p6h36wVP2aWgGW3dWX31YE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7184.eurprd04.prod.outlook.com (2603:10a6:800:125::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 09:49:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:49:16 +0000
Message-ID: <93620a81e301f88e68da283dea735da7b24204ae.camel@nxp.com>
Subject: Re: [PATCH 07/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel
 link support
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 22 Dec 2020 17:47:25 +0800
In-Reply-To: <20201221222955.GA652934@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-8-git-send-email-victor.liu@nxp.com>
 <20201221222955.GA652934@robh.at.kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Tue, 22 Dec 2020 09:49:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5ed6fca-a24b-4432-73db-08d8a65ed871
X-MS-TrafficTypeDiagnostic: VI1PR04MB7184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB718462C5ACF90EAB499C999E98DF0@VI1PR04MB7184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOCqzIwnNXhg2TiR7CksaAQDY5LmYSitl+I7u6+jQuOnJ3w73Y1xa5JSYZS3vVP98A27TYQtTjU3RIvSvQbcz080QEg9XE9XuP0/odRQebxf1dHkpndZugjTJEcMB9RueHezVQAYjKGrcIy3qKfLIJ7FtpnhfYtzBeavQA628t5kc5BkRSfXcsyWQZsZxI1lXOk4aqt/lh5ENMd4prkodQwpwKVaCRhzMYeYuVFuGiwEMlCMcx+MtmKzk4jN+mfcY49h0+XRQCfYIx/K4bXlpYXAi46RVZXD0Et9He404HuBTI3rSHOR+z3q6wNys8Z8bB8HQRUXnBM7Kd2CO2AMR/9BS5RpeoBFKfi9yALKheC5reHFM1U8GXhjDEepbEdKXUuj0vWKs3kISMfyBmoRWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39850400004)(16526019)(478600001)(66556008)(52116002)(6506007)(36756003)(186003)(66476007)(66946007)(7416002)(26005)(8676002)(8936002)(86362001)(6486002)(4326008)(5660300002)(316002)(2906002)(6512007)(30864003)(83380400001)(4001150100001)(6666004)(956004)(2616005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nk5aUXd4MVdvVzZpalB6Wit5cllxYklldzVFSTh1MmNHRTQ0Yis0TFZ4RlZG?=
 =?utf-8?B?azBlS3grakI2cHIyVXRoQkVnWmtPUWxHb0xSbjhTNW1RQmNQNTlDWjVmRSt4?=
 =?utf-8?B?R3NrK2FMcy80M0YzV1psc1pFYWlmWFhUaVcxZXF6eTB0aERPZkRIWER5TzVh?=
 =?utf-8?B?ODdoVDIvYTN4aE16bHJ3WFlrdGJPVElDZlFrQ2FGTTF3Y2d6T2xleGNRU3JV?=
 =?utf-8?B?cVNTUU9Sb3hFenFGTkJzdjdpc2tMeU9CbmVSazk4OWE0em1jTUhkQjRjbEJC?=
 =?utf-8?B?bkZPK0JSZHVYTjhabjhiOWN5d3laQzBNWU5oQUE0WEQ2T3B0TWs1ZHlac1hy?=
 =?utf-8?B?Mzl3OFNyT0duOXljdGhmNm5GYUFWUTN3ZWI0d2llQ2kwT3NETGRvT2cxM2xy?=
 =?utf-8?B?MmxFRExxZ2JTYWFPWis1UWp3N0tNWWVVT1FqaytwbGxKMGpDdWRuQm1pZTkz?=
 =?utf-8?B?ZVdxTFJjRUFtOXJMbG5weWNxS3ZPQlVWaEkyWUQvVDdmNlNXeWxVdS9xRGtJ?=
 =?utf-8?B?TU5kdVlvNmhnUGhZNXZrWnpOWUJHOW1aYlMvT2lNc1hRWE9pSHR0d1l0eXFX?=
 =?utf-8?B?RmdRa0dBVDIrWExwRVVlSFN0NTBWbkJzVEVKZHdpK2k5VWVzNmhnb0w0Y1BF?=
 =?utf-8?B?VDkxZlE4VVBya2R4RzNDRGJPSlo4NTJQSFQ3aC83K0xHcmdMVU9pRTRPdTBs?=
 =?utf-8?B?alVsYkhrTEtPZWVZdG9oTFZnZGwzZlY5d0tiSiswQmNzQVpObllDZlgzQzVS?=
 =?utf-8?B?bWZhblRsQnAzNGp2ZlVkWVJWUVR4dTFZa0NIeHJsY1VLZjJBMkVMQnlwMDkz?=
 =?utf-8?B?b1lXMnlQOE1aeUlrOVFxcFZPREJKQmdZZmNFdW1Ua2NSZVp2aGFFMnQ1QTdP?=
 =?utf-8?B?YWhYT2pvQTlOd2FBd0JaOGV4Y3BhaXdVK2tkU0MvUFVpM3lmN3YyUGVRVTJz?=
 =?utf-8?B?UkpSV25mZWNZL3pQU0ZSdG5PSVAzN0VZVmxpMW94bG5vNFh5dUh4ZFBpQ3ZW?=
 =?utf-8?B?YWpPVzZrZ0RmTjBmQjB6Z1cwSDdvRlg5OVp2ZnpOaktGQkxwYTRrQi9tUWht?=
 =?utf-8?B?Nnl6RDdrYzJiRFZqYlhxUml5V05wM3JxZjhMRWVld0JBM09YU0JyemtIMWJY?=
 =?utf-8?B?eVJJaE9hMHFkdjY0UVZCWTNaWnZBbE9mM0ZSV1NiVTZ5Q253UkhQR01FTVBD?=
 =?utf-8?B?cVdpMm9rYVlCVHd6QXJNZml2M0QrUEM3bzRZcDRXdkpxTjAxTERoZWtIWmNC?=
 =?utf-8?B?aHlwR1VYVVBYQ3JkTllJRVZIZTdoanJITFl5RWtjcjh3bG5SdXdtN0txNFlI?=
 =?utf-8?Q?JKcIJ5LGs8mgxrweB79p4tWzdiusQHODeG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 09:49:16.0995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ed6fca-a24b-4432-73db-08d8a65ed871
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBhBpTnOZOp7nBR3dhQUsP1/Iui3NGE/F6M8mwL6v9bsqpENjs7WLDV6cSy8AJqJNkrEla9EZEN3PFLaQNYZXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7184
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-21 at 15:29 -0700, Rob Herring wrote:
> On Thu, Dec 17, 2020 at 05:59:26PM +0800, Liu Ying wrote:
> > This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
> > The pixel link forms a standard asynchronous linkage between
> > pixel sources(display controller or camera module) and pixel
> > consumers(imaging or displays).  It consists of two distinct
> > functions, a pixel transfer function and a control interface.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile             |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 411 ++++++++++++++++++++++++
> >  3 files changed, 420 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > index f1c91b6..4d1f027 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
> >  	help
> >  	  Choose this to enable pixel combiner found in
> >  	  Freescale i.MX8qm/qxp processors.
> > +
> > +config DRM_IMX8QXP_PIXEL_LINK
> > +	tristate "Freescale i.MX8QM/QXP display pixel link"
> > +	depends on OF
> > +	select DRM_KMS_HELPER
> > +	help
> > +	  Choose this to enable display pixel link found in
> > +	  Freescale i.MX8qm/qxp processors.
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> > index 7d7c8d6..c15469f 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1 +1,2 @@
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> > +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > new file mode 100644
> > index 00000000..1af7467
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > @@ -0,0 +1,411 @@
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
> > +#define DRIVER_NAME		"imx8qxp-display-pixel-link"
> > +#define PL_MAX_MST_ADDR		3
> > +
> > +struct imx8qxp_pixel_link {
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +	struct device *dev;
> > +	struct imx_sc_ipc *ipc_handle;
> > +	int id;
> > +	int stream_id;
> > +	int dc_id;
> > +	u32 sink_rsc;
> > +	u32 mst_addr;
> > +	u8 mst_addr_ctrl;
> > +	u8 mst_en_ctrl;
> > +	u8 mst_vld_ctrl;
> > +	u8 sync_ctrl;
> > +};
> > +
> > +#define DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(name)			\
> > +static void								\
> > +imx8qxp_pixel_link_enable_##name(struct imx8qxp_pixel_link *pl)		\
> > +{									\
> > +	int ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,	\
> > +					  pl->name##_ctrl, true);	\
> > +	if (ret)							\
> > +		DRM_DEV_ERROR(pl->dev,					\
> > +			"failed to enable DC%d stream%d pixel link "	\
> > +			#name ": %d\n",	pl->dc_id, pl->stream_id, ret);	\
> > +}
> > +
> > +DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(mst_en)
> > +DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(mst_vld)
> > +DEFINE_IMX8QXP_PIXEL_LINK_ENABLE_CTRL(sync)
> > +
> > +#define DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(name)			\
> > +static int								\
> > +imx8qxp_pixel_link_disable_##name(struct imx8qxp_pixel_link *pl)	\
> > +{									\
> > +	int ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,	\
> > +					  pl->name##_ctrl, false);	\
> > +	if (ret)							\
> > +		DRM_DEV_ERROR(pl->dev,					\
> > +			"failed to disable DC%d stream%d pixel link "	\
> > +			#name ": %d\n",	pl->dc_id, pl->stream_id, ret);	\
> > +									\
> > +	return ret;							\
> > +}
> > +
> > +DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(mst_en)
> > +DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(mst_vld)
> > +DEFINE_IMX8QXP_PIXEL_LINK_DISABLE_CTRL(sync)
> > +
> > +static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle,
> > +				      pl->sink_rsc, pl->mst_addr_ctrl,
> > +				      pl->mst_addr);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +		    "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
> > +		    pl->dc_id, pl->stream_id, pl->mst_addr, ret);
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
> > +					    enum drm_bridge_attach_flags flags)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "do not support creating a drm_connector\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!bridge->encoder) {
> > +		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return drm_bridge_attach(bridge->encoder,
> > +				 pl->next_bridge, bridge,
> > +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +static void
> > +imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
> > +				   const struct drm_display_mode *mode,
> > +				   const struct drm_display_mode *adjusted_mode)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	imx8qxp_pixel_link_set_mst_addr(pl);
> > +}
> > +
> > +static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
> > +			      struct drm_bridge_state *old_bridge_state)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	imx8qxp_pixel_link_enable_mst_en(pl);
> > +	imx8qxp_pixel_link_enable_mst_vld(pl);
> > +	imx8qxp_pixel_link_enable_sync(pl);
> > +}
> > +
> > +static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
> > +				struct drm_bridge_state *old_bridge_state)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	imx8qxp_pixel_link_disable_mst_en(pl);
> > +	imx8qxp_pixel_link_disable_mst_vld(pl);
> > +	imx8qxp_pixel_link_disable_sync(pl);
> > +}
> > +
> > +static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
> > +	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> > +	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> > +};
> > +
> > +static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
> > +		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					struct drm_bridge_state *bridge_state,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state,
> > +					u32 output_fmt,
> > +					unsigned int *num_input_fmts)
> > +{
> > +	u32 *input_fmts;
> > +
> > +	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
> > +		return NULL;
> > +
> > +	*num_input_fmts = 1;
> > +
> > +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	input_fmts[0] = output_fmt;
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> > +					struct drm_bridge_state *bridge_state,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state,
> > +					unsigned int *num_output_fmts)
> > +{
> > +	*num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> > +	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
> > +			sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
> > +}
> > +
> > +static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
> > +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> > +	.attach			= imx8qxp_pixel_link_bridge_attach,
> > +	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
> > +	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
> > +	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
> > +	.atomic_get_input_bus_fmts =
> > +			imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
> > +	.atomic_get_output_bus_fmts =
> > +			imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
> > +};
> > +
> > +static struct drm_bridge *
> > +imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
> > +{
> > +	struct device_node *np = pl->dev->of_node;
> > +	struct device_node *port, *ep, *remote;
> > +	struct of_endpoint endpoint;
> > +	struct drm_bridge *next_bridge[2], *err_bridge;
> > +	u32 port_id, vld_port_id;
> > +	int port_cnt = 0, ep_cnt = 0;
> > +	int bridge_sel = 0;	/* select the first next bridge by default */
> > +	int ret;
> > +
> > +	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
> > +		port = of_graph_get_port_by_id(np, port_id);
> > +		if (!port)
> > +			continue;
> > +
> > +		if (of_device_is_available(port)) {
> > +			port_cnt++;
> > +			vld_port_id = port_id;
> > +		}
> > +
> > +		of_node_put(port);
> > +	}
> > +
> > +	/* check the number of available output ports */
> > +	if (port_cnt == 0) {
> > +		DRM_DEV_ERROR(pl->dev, "no available output port\n");
> > +		return ERR_PTR(-ENODEV);
> > +	} else if (port_cnt > 1) {
> > +		DRM_DEV_ERROR(pl->dev, "invalid available output ports: %d\n",
> > +								port_cnt);
> > +		return ERR_PTR(-ENOTSUPP);
> > +	}
> > +
> > +	port = of_graph_get_port_by_id(np, vld_port_id);
> > +	if (!port) {
> > +		DRM_DEV_ERROR(pl->dev, "failed to get output port\n");
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	for_each_available_child_of_node(port, ep) {
> 
> for_each_endpoint_of_node

I've rewritten this entire function locally to get the endpoints 0&1
directly by using of_graph_get_remote_node(). It does look better and
concise.

But the new function doesn't use for_each_endpoint_of_node().
It gets an available output port first(port0 is input, so still use
something like the above snippet without port number check) and then
get remotes for the two endpoints of the port.

Please let me know if it can still be improved or just review the next
version.

> 
> > +		/* 2 available endpoints at most */
> > +		if (++ep_cnt > 2) {
> > +			DRM_DEV_ERROR(pl->dev,
> > +				      "invalid available endpoints: %d\n",
> > +									ep_cnt);
> 
> Not really the kernel's job to validate the DT. Just get endpoints 0 and 
> 1 if those are the 2 you want.

Will drop the DT validation.

> 
> > +			err_bridge = ERR_PTR(-ENOTSUPP);
> > +			of_node_put(ep);
> > +			goto err;
> > +		}
> > +
> > +		ret = of_graph_parse_endpoint(ep, &endpoint);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(pl->dev, "failed to parse endpoint: %d\n",
> > +									ret);
> > +			err_bridge = ERR_PTR(ret);
> > +			of_node_put(ep);
> > +			goto err;
> > +		}
> > +
> > +		remote = of_graph_get_remote_port_parent(ep);
> > +		if (!remote || !of_device_is_available(remote)) {
> > +			DRM_DEV_ERROR(pl->dev,
> > +				      "endpoint%u has no available remote\n",
> > +								endpoint.id);
> > +			of_node_put(remote);
> > +			of_node_put(ep);
> > +			err_bridge = ERR_PTR(-ENODEV);
> > +			goto err;
> > +		} else if (!of_device_is_available(remote->parent)) {
> > +			DRM_DEV_ERROR(pl->dev,
> > +				"endpoint%u remote parent is not available\n",
> > +								endpoint.id);
> > +			of_node_put(remote);
> > +			of_node_put(ep);
> > +			err_bridge = ERR_PTR(-ENODEV);
> > +			goto err;
> > +		}
> 
> Rewrite all this in terms of of_graph_get_remote_node(). It takes care 
> of of_device_is_available checking for you.

Will do.

> 
> > +
> > +		next_bridge[ep_cnt - 1] = of_drm_find_bridge(remote);
> > +		if (!next_bridge[ep_cnt - 1]) {
> > +			of_node_put(remote);
> > +			of_node_put(ep);
> > +			err_bridge = ERR_PTR(-EPROBE_DEFER);
> > +			goto err;
> > +		}
> > +
> > +		/* specially select the next bridge with companion PXL2DPI */
> > +		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
> > +			bridge_sel = ep_cnt - 1;
> > +
> > +		of_node_put(remote);
> > +	}
> > +
> > +	pl->mst_addr = vld_port_id - 1;
> > +
> > +	of_node_put(port);
> > +
> > +	return next_bridge[bridge_sel];
> > +err:
> > +	of_node_put(port);
> > +
> > +	return err_bridge;
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
> > +{
> > +	struct imx8qxp_pixel_link *pl;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	int ret;
> > +
> > +	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> > +	if (!pl)
> > +		return -ENOMEM;
> > +
> > +	ret = imx_scu_get_handle(&pl->ipc_handle);
> > +	if (ret) {
> > +		if (ret != -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> > +									ret);
> > +		return ret;
> > +	}
> > +
> > +	pl->id = of_alias_get_id(np, "dc_pl");
> 
> What's this needed for? I doubt aliases is the right thing to use here.

pl->dc_id and pl->stream_id are calculated out based on pl->id.
And then, pl->mst_addr_ctrl/mst_en_ctrl/mst_vld_ctrl/sync_ctrl controls
can be set based on pl->stream_id. pl->dc_id determines the SCU
firmware resource to apply the controls.

Each display controller(DC) has two display streams and i.MX8qxp has
one DC while i.MX8qm has two. Pixel combiner stands bewteen the display
pixel link and display controller. It looks painful to go through the
graph up to the display controller to get pl->dc_id and pl->stream_id. 

Suggestions?

Thanks,
Liu Ying 

> 
> Rob

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
