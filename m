Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AF2E1B22
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498836E8F1;
	Wed, 23 Dec 2020 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20042.outbound.protection.outlook.com [40.107.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2323C6E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIAx+IVc9SxZacJx9fyuMs+bTe9YF7oKFXsnYXCmMS/dKAX2VqXNLJe1k9UJtvLf6GIyFYTo1IqgzjCVjZ05zHHoyFNzQ5PXfvigpFUGWfwVdqybhVT1XmjpdqsWyL+bapvfgR0MksnB8sr6CRhoDulYoq3fxnS9chHWQ6S/xHwWzGbjGNkzLX+1Zev3qXKJTujFzwf3O3VlBvQQ1KrSyMNsK7wjlhgnimHfwt8iyDqf4d8LtdvtiWLP1Lv370gISiuc2kFbjP3KSij2yc57AyVRzkzBSxaBCsRmG5ntrha/qlaOdgXcUaERAsjRWOoBtvhHb865TTUS9F0TXaXhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlgrZJsojAklTw0y/AhuonpdRxstv17K0dkMFLXoxbk=;
 b=O5ZWXcvy8wZPq6hIIhHJrdQEJ7zJCM+r28hsNR2Vc12H9GPtKipP9TtDtXlFo0rEXlXobUIQqWoJBbUt+BXvurT3MSKr0gpN09NcDH2GP5rDy6S3polYYiUsZdiKhUvfd9tJXMa5VTjVo8PcoueZRA2WljcOnI8GWP14pGBlcjUtBW1axKJ6eqGJLSja/gP9G2K5P3no7KCx7NeXInEY4QBxh3iLyyKeuYVH6BeU0xFqRdmj1iNMmtoFehXPnYvow3nE5irWgkiiiuYoEWh3nOJRVLsbfHVhnx4f8VxA9NaCQvtP5bUNprX9xIxoJC0I7xzaPMUItW5Eq2bbnkj/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlgrZJsojAklTw0y/AhuonpdRxstv17K0dkMFLXoxbk=;
 b=LSd4TuHH2hfr7Ia7ozqFn1b/a4QuaP41LYw19OsmFwhAMGiefXITBR1cK+dewJgeH9t4XUJoHsyUP2fNJxzadcgqtadF9b8JjwNV2j1yJpL1+PWdRo7kAQFoqOdo5Phx4eLN8JKBffw9abhM72qimE4rHSwJYpPpd9R1tMeEcg8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3982.eurprd04.prod.outlook.com (2603:10a6:803:49::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 09:54:46 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:54:46 +0000
Message-ID: <a47f1bee9625fd6e22720d0b3568a196682a7aef.camel@nxp.com>
Subject: Re: [PATCH 12/14] drm/bridge: imx: Add LDB support for i.MX8qxp
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org
Date: Tue, 22 Dec 2020 17:52:54 +0800
In-Reply-To: <1608199173-28760-13-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-13-git-send-email-victor.liu@nxp.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 22 Dec 2020 09:54:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75c6fc8f-6fb4-4953-c240-08d8a65f9d59
X-MS-TrafficTypeDiagnostic: VI1PR04MB3982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3982368E30217F7D31D77B6698DF0@VI1PR04MB3982.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: keJLTXfHFraZX8aKjy7SNLmElp4HgonMyS385Ao5CPEPNv5IGGUDyPbEBYcchrQz3xcgsLffgN2jnI0ltDJQ5pzNEOz6rMpfm9CYEUihICX3SeNVtumSKseK8QXCNUFan6CY+Vl26Olsi4HJTbvaCeWbH2W1h2q1lWvD64u4wNJhmbX9JbXE7pgVPBry0pEoomTWZjBGUz+Flb+HyIYXJoDbJteLlw8cFLJvsVi0Y+CC2HjSmwpLk70OquLsXmkHQ94DgSqBbh4MvLXucnUDteLu7MgYY8dTKVKmhnycEV8+fURL7+ZlrZyO5jhpSSP0kJeVMMo+od8s9bdyfMhHtisEMGfFrV5wJJHyR7hMgz4MbOb7+1ubbS2mlB5vrZqgjKQGwRhmyhB1rykjshcMVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(66476007)(2616005)(66946007)(7416002)(66556008)(186003)(16526019)(30864003)(956004)(478600001)(5660300002)(6486002)(6512007)(26005)(6506007)(8676002)(2906002)(83380400001)(4326008)(52116002)(86362001)(36756003)(6666004)(4001150100001)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rzl2b09TWTJSTmwxL3NRMmVkK1NZbkFQOXdOQ2xSVU5xMm1heUQ1WGNoOEt0?=
 =?utf-8?B?aUdaZ3dlVEswSml0eXM0SUNnNUZBWXFvVDc3N1pDQ3EwV1hhTXBRYUdKRVdt?=
 =?utf-8?B?KzZqWkFxSVJLUWFWeW5rK1lLUWNVclBSMGdvb0E5WVkybTllRHNMWkVTQjZ6?=
 =?utf-8?B?S0QzMzBvUG84LzBWclErUHBMdWRlZUgyMGhMZmxPc3RTWnFvRmdXRVhyWFNr?=
 =?utf-8?B?cHZDN0ZReEtnTGJNNWdFRm43YTROZ0psNTB0WXJ1VXBkejVSeVpySzhjN1cy?=
 =?utf-8?B?SVQrQS92MlJtdEhZci81NlZHR09NcWhnNDZSSVJpZFNIY01RbU4rVWVFcC9i?=
 =?utf-8?B?OGVxZzRVaWwrSjB2VHBJN3BudVNYelhGaVk3S1dRT1lGeHZuU3ppVG03UFNZ?=
 =?utf-8?B?MjhNVlRtNnZlL2NqcElXZExjKzhNNVZhMlB5ZjdZSmtRNXdJb0E1MUlCU2po?=
 =?utf-8?B?WG1xTUlvekhITzlvcHR2bFpCcCtmd1NpOHJIcDdhUndsUDQ2ejF5YmF6d2hU?=
 =?utf-8?B?WXBrTE90aXF3aTFhN2RCQVlMcnNISmltTnVIMHFEbmdtWHdOelVEUy81d3JY?=
 =?utf-8?B?MGYwenJmeitZcWJ1QW9WczhwNmpFckdzV2xKS0pCdmp1RXVFMXg1Z3RqSmkv?=
 =?utf-8?B?YWZiOFQ5LzUyMHFsZU13RmhjSUNTSjFjRFkxR1hxVFdtVFgxTUFjaFhlcHdG?=
 =?utf-8?B?Rm5GSWkvUFZaNGhSNU91Nkt3Yzl2cDlDaDlhL1pWNGNYTGZ1QVhIQ1JCbkVh?=
 =?utf-8?B?bmowMG15Ym9jaGxqTThQV21kMW50T3gxU1dRbEwyOXRIWE1aM0lQeFNJOVRy?=
 =?utf-8?B?YnlPU0VLckhmcmNpWGxTejhkc1RpcW5MeFB6VytNdE8zYnBtekFrZUNQUUV6?=
 =?utf-8?B?LzRLTmk3dExUVC9hclMxdStvNzRPdVhCU1RZd1VyVXFDZ25PbjZqenJqbWxk?=
 =?utf-8?B?N2t3WGJWNVE5aXM4bHhyaHY5UUFMNlRhVnM3OU4zZU9tanluK2JzWlQ3SDF2?=
 =?utf-8?B?cjllQmRGVGRhLzM3RncyRGtOdlZDdnBZNnBFczlJZnFrbzJ4OVFiQzRVRTNL?=
 =?utf-8?B?dmlEUTNEcVU1VW9FcGFSTzh0OTh0MHgxVmxJc2YyRGFiSDdTUkdjRitiaXBV?=
 =?utf-8?B?ZDdQMGpCOXQ0bDd3Y0JNS295cm1Vb3ZwL01iaW9uMDlHZ2J3UThVME9uZm04?=
 =?utf-8?B?VG4zNmZhYkQxVWNUNHhJTjhnZjFSVnNLdngxWXJvVDBCRVVDcm5xRCswWVJu?=
 =?utf-8?B?aFI2NXlhcE5ucWdBUkc3ZE9jZTlFYWhWTThkYXR1T2Y4L3R3NXRaWUVvNDU3?=
 =?utf-8?Q?xqZ8kcNhWHhCW5Pyr4Kbq1ZUnOEIcgv+2k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 09:54:46.4024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c6fc8f-6fb4-4953-c240-08d8a65f9d59
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8HDNkasHZup058+wWO5FjTQ0PpPH/4ZUsWMtXh4i5YDC9iQWK4QybtF3f6BXX+MvhUy06Eqwcw4mCyhDNFJ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3982
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-12-17 at 17:59 +0800, Liu Ying wrote:
> This patch adds a drm bridge driver for i.MX8qxp LVDS display bridge(LDB).
> The LDB has two channels.  Each of them supports up to 24bpp parallel
> input color format and can map the input to VESA or JEIDA standards.
> The two channels cannot be used simultaneously, that is to say, the user
> should pick one of them to use.  Two LDB channels from two LDB instances
> can work together in LDB split mode to support a dual link LVDS display.
> The channel indexes have to be different.  Channel0 outputs odd pixels
> and channel1 outputs even pixels.  This patch supports the LDB single
> mode and split mode.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig       |  10 +
>  drivers/gpu/drm/bridge/imx/Makefile      |   1 +
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 762 +++++++++++++++++++++++++++++++
>  3 files changed, 773 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 23e24fd..2a32ad3 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -6,6 +6,16 @@ config DRM_IMX_LVDS_BRIDGE_HELPER
>  	  Helper to support Freescale i.MX LVDS Display Bridge(LDB).
>  	  This bridge is embedded in a SoC.
>  
> +config DRM_IMX8QXP_LDB
> +	tristate "Freescale i.MX8QXP LVDS display bridge"
> +	depends on DRM_IMX_LVDS_BRIDGE_HELPER
> +	depends on OF
> +	depends on COMMON_CLK
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
> +	  Freescale i.MX8qxp processor.
> +
>  config DRM_IMX8QXP_PIXEL_COMBINER
>  	tristate "Freescale i.MX8QM/QXP pixel combiner"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 902b703..13160f0 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_DRM_IMX_LVDS_BRIDGE_HELPER) += imx-ldb-helper.o
> +obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> new file mode 100644
> index 00000000..318615fb
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -0,0 +1,762 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/imx_ldb_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +#define  LDB_CH_SEL		(1 << 28)
> +
> +#define SS_CTRL			0x20
> +#define  CH_HSYNC_M(id)		BIT(0 + ((id) * 2))
> +#define  CH_VSYNC_M(id)		BIT(1 + ((id) * 2))
> +#define  CH_PHSYNC(id)		BIT(0 + ((id) * 2))
> +#define  CH_PVSYNC(id)		BIT(1 + ((id) * 2))
> +
> +#define DRIVER_NAME		"imx8qxp-ldb"
> +
> +struct imx8qxp_ldb_channel {
> +	struct ldb_channel base;
> +	struct phy *phy;
> +	unsigned int di_id;
> +};
> +
> +struct imx8qxp_ldb {
> +	struct ldb base;
> +	struct device *dev;
> +	struct imx8qxp_ldb_channel channel[MAX_LDB_CHAN_NUM];
> +	struct clk *clk_pixel;
> +	struct clk *clk_bypass;
> +	struct drm_bridge *companion;
> +	int active_chno;
> +};
> +
> +static inline struct imx8qxp_ldb_channel *
> +base_to_imx8qxp_ldb_channel(struct ldb_channel *base)
> +{
> +	return container_of(base, struct imx8qxp_ldb_channel, base);
> +}
> +
> +static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
> +{
> +	return container_of(base, struct imx8qxp_ldb, base);
> +}
> +
> +static void imx8qxp_ldb_set_phy_cfg(struct imx8qxp_ldb *imx8qxp_ldb,
> +				    unsigned long di_clk, bool is_split,
> +				    struct phy_configure_opts_lvds *phy_cfg)
> +{
> +	phy_cfg->bits_per_lane_and_dclk_cycle = 7;
> +	phy_cfg->lanes = 4;
> +
> +	if (is_split) {
> +		phy_cfg->differential_clk_rate = di_clk / 2;
> +		phy_cfg->is_slave = !imx8qxp_ldb->companion;
> +	} else {
> +		phy_cfg->differential_clk_rate = di_clk;
> +		phy_cfg->is_slave = false;
> +	}
> +}
> +
> +static int imx8qxp_ldb_bridge_atomic_check(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +					base_to_imx8qxp_ldb_channel(ldb_ch);
> +	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +	struct drm_bridge *companion = imx8qxp_ldb->companion;
> +	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +	unsigned long di_clk = adj->clock * 1000;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> +	union phy_configure_opts opts = { };
> +	struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
> +	int ret;
> +
> +	ret = ldb_bridge_atomic_check_helper(bridge, bridge_state,
> +						crtc_state, conn_state);
> +	if (ret)
> +		return ret;
> +
> +	imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
> +	ret = phy_validate(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
> +	if (ret < 0) {
> +		DRM_DEV_DEBUG_DRIVER(imx8qxp_ldb->dev,
> +				     "failed to validate PHY: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (is_split && companion) {
> +		ret = companion->funcs->atomic_check(companion,
> +					bridge_state, crtc_state, conn_state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_mode_set(struct drm_bridge *bridge,
> +			    const struct drm_display_mode *mode,
> +			    const struct drm_display_mode *adjusted_mode)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb_channel *companion_ldb_ch;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +					base_to_imx8qxp_ldb_channel(ldb_ch);
> +	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +	struct drm_bridge *companion = imx8qxp_ldb->companion;
> +	struct device *dev = imx8qxp_ldb->dev;
> +	unsigned long di_clk = adjusted_mode->clock * 1000;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> +	union phy_configure_opts opts = { };
> +	struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
> +	u32 chno = ldb_ch->chno;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "failed to get runtime PM sync: %d\n", ret);
> +
> +	ret = phy_init(imx8qxp_ldb_ch->phy);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
> +
> +	ret = phy_set_mode(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "failed to set PHY mode: %d\n", ret);
> +
> +	if (is_split && companion) {
> +		companion_ldb_ch = bridge_to_ldb_ch(companion);
> +
> +		companion_ldb_ch->in_bus_format = ldb_ch->in_bus_format;
> +		companion_ldb_ch->out_bus_format = ldb_ch->out_bus_format;
> +	}
> +
> +	clk_set_rate(imx8qxp_ldb->clk_bypass, di_clk);
> +	clk_set_rate(imx8qxp_ldb->clk_pixel, di_clk);
> +
> +	imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
> +	ret = phy_configure(imx8qxp_ldb_ch->phy, &opts);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
> +
> +	if (chno == 0)
> +		ldb->ldb_ctrl &= ~LDB_CH_SEL;
> +	else
> +		ldb->ldb_ctrl |= LDB_CH_SEL;
> +
> +	/* input VSYNC signal from pixel link is active low */
> +	if (imx8qxp_ldb_ch->di_id == 0)
> +		ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
> +	else
> +		ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
> +
> +	/*
> +	 * For split mode, settle input VSYNC signal polarity and
> +	 * channel selection down early.
> +	 */
> +	if (is_split)
> +		regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> +
> +	ldb_bridge_mode_set_helper(bridge, mode, adjusted_mode);
> +
> +	if (adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		regmap_update_bits(ldb->regmap, SS_CTRL, CH_VSYNC_M(chno), 0);
> +	else if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		regmap_update_bits(ldb->regmap, SS_CTRL,
> +				   CH_VSYNC_M(chno), CH_PVSYNC(chno));
> +
> +	if (adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		regmap_update_bits(ldb->regmap, SS_CTRL, CH_HSYNC_M(chno), 0);
> +	else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		regmap_update_bits(ldb->regmap, SS_CTRL,
> +				   CH_HSYNC_M(chno), CH_PHSYNC(chno));
> +
> +	if (is_split && companion)
> +		companion->funcs->mode_set(companion, mode, adjusted_mode);
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +	struct drm_bridge *companion = imx8qxp_ldb->companion;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> +
> +	clk_prepare_enable(imx8qxp_ldb->clk_pixel);
> +	clk_prepare_enable(imx8qxp_ldb->clk_bypass);
> +
> +	if (is_split && companion)
> +		companion->funcs->atomic_pre_enable(companion, old_bridge_state);
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
> +				 struct drm_bridge_state *old_bridge_state)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +					base_to_imx8qxp_ldb_channel(ldb_ch);
> +	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +	struct drm_bridge *companion = imx8qxp_ldb->companion;
> +	struct device *dev = imx8qxp_ldb->dev;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> +	int ret;
> +
> +	if (ldb_ch->chno == 0 || is_split) {
> +		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> +		ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
> +				LDB_CH0_MODE_EN_TO_DI0 : LDB_CH0_MODE_EN_TO_DI1;
> +	}
> +	if (ldb_ch->chno == 1 || is_split) {
> +		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> +		ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
> +				LDB_CH1_MODE_EN_TO_DI0 : LDB_CH1_MODE_EN_TO_DI1;
> +	}
> +
> +	ldb_bridge_enable_helper(bridge);
> +
> +	ret = phy_power_on(imx8qxp_ldb_ch->phy);
> +	if (ret)
> +		DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
> +
> +	if (is_split && companion)
> +		companion->funcs->atomic_enable(companion, old_bridge_state);
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *old_bridge_state)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +					base_to_imx8qxp_ldb_channel(ldb_ch);
> +	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +	struct drm_bridge *companion = imx8qxp_ldb->companion;
> +	struct device *dev = imx8qxp_ldb->dev;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> +	int ret;
> +
> +	ret = phy_power_off(imx8qxp_ldb_ch->phy);
> +	if (ret)
> +		DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
> +
> +	ret = phy_exit(imx8qxp_ldb_ch->phy);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "failed to teardown PHY: %d\n", ret);
> +
> +	ldb_bridge_disable_helper(bridge);
> +
> +	clk_disable_unprepare(imx8qxp_ldb->clk_bypass);
> +	clk_disable_unprepare(imx8qxp_ldb->clk_pixel);
> +
> +	if (is_split && companion)
> +		companion->funcs->atomic_disable(companion, old_bridge_state);
> +
> +	ret = pm_runtime_put(dev);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
> +}
> +
> +static const u32 imx8qxp_ldb_bus_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +	MEDIA_BUS_FMT_FIXED,
> +};
> +
> +static bool imx8qxp_ldb_bus_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts); i++) {
> +		if (imx8qxp_ldb_bus_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx8qxp_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	struct drm_display_info *di;
> +	const struct drm_format_info *finfo;
> +	u32 *input_fmts;
> +
> +	if (!imx8qxp_ldb_bus_output_fmt_supported(output_fmt))
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +		di = &conn_state->connector->display_info;
> +
> +		/*
> +		 * Look at the first bus format to determine input format.
> +		 * Default to MEDIA_BUS_FMT_RGB888_1X24, if no match.
> +		 */
> +		if (di->num_bus_formats) {
> +			finfo = drm_format_info(di->bus_formats[0]);
> +
> +			input_fmts[0] = finfo->depth == 18 ?
> +					MEDIA_BUS_FMT_RGB666_1X24_CPADHI :
> +					MEDIA_BUS_FMT_RGB888_1X24;
> +		} else {
> +			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		}
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	default:
> +		kfree(input_fmts);
> +		input_fmts = NULL;
> +		break;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static u32 *
> +imx8qxp_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	*num_output_fmts = ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts);
> +	return kmemdup(imx8qxp_ldb_bus_output_fmts,
> +			sizeof(imx8qxp_ldb_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static enum drm_mode_status
> +imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
> +			      const struct drm_display_info *info,
> +			      const struct drm_display_mode *mode)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	bool is_single = ldb_channel_is_single_link(ldb_ch);
> +
> +	if (mode->clock > 170000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock > 150000 && is_single)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.mode_valid		= imx8qxp_ldb_bridge_mode_valid,
> +	.attach			= ldb_bridge_attach_helper,
> +	.atomic_check		= imx8qxp_ldb_bridge_atomic_check,
> +	.mode_set		= imx8qxp_ldb_bridge_mode_set,
> +	.atomic_pre_enable	= imx8qxp_ldb_bridge_atomic_pre_enable,
> +	.atomic_enable		= imx8qxp_ldb_bridge_atomic_enable,
> +	.atomic_disable		= imx8qxp_ldb_bridge_atomic_disable,
> +	.atomic_get_input_bus_fmts =
> +			imx8qxp_ldb_bridge_atomic_get_input_bus_fmts,
> +	.atomic_get_output_bus_fmts =
> +			imx8qxp_ldb_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static int imx8qxp_ldb_set_di_id(struct imx8qxp_ldb *imx8qxp_ldb)
> +{
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
> +	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
> +	struct device_node *remote, *port, *ep = NULL;
> +	struct device *dev = imx8qxp_ldb->dev;
> +	struct of_endpoint endpoint;
> +	int ep_cnt;
> +	int ret;
> +
> +	/* remote is PXL2DPI */
> +	remote = of_graph_get_remote_node(ldb_ch->np, 0, 0);
> +	if (!remote) {
> +		DRM_DEV_ERROR(dev, "failed to get PXL2DPI node\n");
> +		return -ENODEV;
> +	}
> +
> +	port = of_graph_get_port_by_id(remote, 0);
> +	if (!port) {
> +		DRM_DEV_ERROR(dev, "failed to get PXL2DPI node's port@0\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	ep_cnt = of_get_available_child_count(port);
> +	if (ep_cnt == 0) {
> +		DRM_DEV_ERROR(dev,
> +			"no available endpoints of PXL2DPI node's port@0\n");
> +		ret = -ENODEV;
> +		goto out;
> +	} else if (ep_cnt > 1) {
> +		DRM_DEV_ERROR(dev,
> +		       "invalid available endpoints of PXL2DPI node's port@0\n");
> +		ret = -ENOTSUPP;
> +		goto out;
> +	}
> +
> +	ep = of_get_next_available_child(port, NULL);
> +	if (!ep) {
> +		DRM_DEV_ERROR(dev,
> +		  "failed to get available endpoint of PXL2DPI node's port@0\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}

This function is not well written. I'll rewrite it in the next version
by using of_graph_get_endpoint_by_regs()
and of_graph_get_remote_endpoint() to get the remote endpoint.

Liu Ying 

> +
> +	ret = of_graph_parse_endpoint(ep, &endpoint);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev,
> +		    "failed to parse endpoint of PXL2DPI node's port@0: %d\n",
> +									ret);
> +		goto out;
> +	}
> +
> +	imx8qxp_ldb_ch->di_id = endpoint.id;
> +out:
> +	of_node_put(ep);
> +	of_node_put(port);
> +	of_node_put(remote);
> +
> +	return ret;
> +}
> +
> +static int
> +imx8qxp_ldb_check_chno_and_dual_link(struct ldb_channel *ldb_ch, int link)
> +{
> +	if ((link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS && ldb_ch->chno != 0) ||
> +	    (link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS && ldb_ch->chno != 1))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
> +{
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
> +	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
> +	struct ldb_channel *companion_ldb_ch;
> +	struct device_node *companion;
> +	struct device_node *child;
> +	struct device_node *companion_port = NULL;
> +	struct device_node *port1, *port2;
> +	struct device *dev = imx8qxp_ldb->dev;
> +	const struct of_device_id *match;
> +	u32 i;
> +	int ch_cnt;
> +	int dual_link;
> +	int ret;
> +
> +	/* Locate the companion LDB for dual-link operation, if any. */
> +	companion = of_parse_phandle(dev->of_node, "fsl,companion-ldb", 0);
> +	if (!companion)
> +		return 0;
> +
> +	if (!of_device_is_available(companion)) {
> +		DRM_DEV_ERROR(dev, "companion LDB is not available\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Sanity check: the companion bridge must have the same compatible
> +	 * string.
> +	 */
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!of_device_is_compatible(companion, match->compatible)) {
> +		DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
> +		ret = -ENXIO;
> +		goto out;
> +	}
> +
> +	ch_cnt = of_get_available_child_count(companion);
> +	if (ch_cnt == 0) {
> +		DRM_DEV_ERROR(dev, "no available companion LDB channel\n");
> +		ret = -ENODEV;
> +		goto out;
> +	} else if (ch_cnt > 1) {
> +		DRM_DEV_ERROR(dev, "invalid available companion LDB channels\n");
> +		ret = -ENOTSUPP;
> +		goto out;
> +	}
> +
> +	for_each_available_child_of_node(companion, child) {
> +		ret = of_property_read_u32(child, "reg", &i);
> +		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> +			DRM_DEV_ERROR(dev,
> +				      "invalid channel node address: %u\n", i);
> +			ret = -EINVAL;
> +			of_node_put(child);
> +			goto out;
> +		}
> +
> +		companion_port = child;
> +		of_node_put(child);
> +		break;
> +	}
> +
> +	if (companion_port == NULL) {
> +		DRM_DEV_ERROR(dev,
> +			      "failed to find companion LDB channel port\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Channel numbers have to be different, because channel0 transmits
> +	 * odd pixels and channel1 transmits even pixels.
> +	 */
> +	if (i == ldb_ch->chno) {
> +		DRM_DEV_ERROR(dev, "invalid companion LDB channel number\n");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We need to work out if the sink is expecting us to function in
> +	 * dual-link mode.  We do this by looking at the DT port nodes we are
> +	 * connected to.  If they are marked as expecting odd pixels and
> +	 * even pixels than we need to enable LDB split mode.
> +	 */
> +	port1 = of_graph_get_port_by_id(ldb_ch->np, 1);
> +	port2 = of_graph_get_port_by_id(companion_port, 1);
> +	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> +	of_node_put(port1);
> +	of_node_put(port2);
> +
> +	switch (dual_link) {
> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +		ldb_ch->link_type = LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> +		break;
> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> +		ldb_ch->link_type = LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS;
> +		break;
> +	default:
> +		ret = dual_link;
> +		DRM_DEV_ERROR(dev,
> +			      "failed to get dual link pixel order: %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = imx8qxp_ldb_check_chno_and_dual_link(ldb_ch, dual_link);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev,
> +			      "unmatched channel number(%u) vs dual link(%d)\n",
> +							ldb_ch->chno, dual_link);
> +		goto out;
> +	}
> +
> +	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
> +	if (!imx8qxp_ldb->companion) {
> +		ret = -EPROBE_DEFER;
> +		DRM_DEV_DEBUG_DRIVER(dev,
> +		       "failed to find bridge for companion bridge: %d\n", ret);
> +		goto out;
> +	}
> +
> +	DRM_DEV_DEBUG_DRIVER(dev,
> +		"dual-link configuration detected (companion bridge %pOF)\n",
> +								companion);
> +
> +	companion_ldb_ch = bridge_to_ldb_ch(imx8qxp_ldb->companion);
> +	companion_ldb_ch->link_type = ldb_ch->link_type;
> +out:
> +	of_node_put(companion);
> +	return ret;
> +}
> +
> +static int imx8qxp_ldb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct imx8qxp_ldb *imx8qxp_ldb;
> +	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch;
> +	struct ldb *ldb;
> +	struct ldb_channel *ldb_ch;
> +	int ret, i;
> +
> +	imx8qxp_ldb = devm_kzalloc(dev, sizeof(*imx8qxp_ldb), GFP_KERNEL);
> +	if (!imx8qxp_ldb)
> +		return -ENOMEM;
> +
> +	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
> +	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
> +		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "failed to get pixel clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
> +	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
> +		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "failed to get bypass clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	imx8qxp_ldb->dev = dev;
> +
> +	ldb = &imx8qxp_ldb->base;
> +	ldb->dev = dev;
> +	ldb->ctrl_reg = 0xe0;
> +
> +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
> +		ldb->channel[i] = &imx8qxp_ldb->channel[i].base;
> +
> +	ret = ldb_init_helper(ldb);
> +	if (ret)
> +		return ret;
> +
> +	if (ldb->available_ch_cnt == 0) {
> +		DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
> +		return 0;
> +	} else if (ldb->available_ch_cnt > 1) {
> +		DRM_DEV_ERROR(dev, "invalid available channel number(%u)\n",
> +							ldb->available_ch_cnt);
> +		return -ENOTSUPP;
> +	}
> +
> +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +		imx8qxp_ldb_ch = &imx8qxp_ldb->channel[i];
> +		ldb_ch = &imx8qxp_ldb_ch->base;
> +
> +		if (ldb_ch->is_available) {
> +			imx8qxp_ldb->active_chno = ldb_ch->chno;
> +			break;
> +		}
> +	}
> +
> +	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
> +	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
> +		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
> +						imx8qxp_ldb->active_chno, ret);
> +		return ret;
> +	}
> +
> +	ret = ldb_find_next_bridge_helper(ldb);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx8qxp_ldb_set_di_id(imx8qxp_ldb);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx8qxp_ldb_parse_dt_companion(imx8qxp_ldb);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, imx8qxp_ldb);
> +	pm_runtime_enable(dev);
> +
> +	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
> +
> +	return ret;
> +}
> +
> +static int imx8qxp_ldb_remove(struct platform_device *pdev)
> +{
> +	struct imx8qxp_ldb *imx8qxp_ldb = platform_get_drvdata(pdev);
> +	struct ldb *ldb = &imx8qxp_ldb->base;
> +
> +	ldb_remove_bridge_helper(ldb);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
> +{
> +	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
> +	struct ldb *ldb = &imx8qxp_ldb->base;
> +
> +	/* disable LDB by resetting the control register to POR default */
> +	regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend,
> +			   imx8qxp_ldb_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qxp-ldb" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
> +
> +static struct platform_driver imx8qxp_ldb_driver = {
> +	.probe	= imx8qxp_ldb_probe,
> +	.remove = imx8qxp_ldb_remove,
> +	.driver	= {
> +		.pm = &imx8qxp_ldb_pm_ops,
> +		.name = DRIVER_NAME,
> +		.of_match_table = imx8qxp_ldb_dt_ids,
> +	},
> +};
> +module_platform_driver(imx8qxp_ldb_driver);
> +
> +MODULE_DESCRIPTION("i.MX8QXP LVDS Display Bridge(LDB) bridge driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
