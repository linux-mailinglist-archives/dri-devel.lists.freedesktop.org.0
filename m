Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD59B22D3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA9210E312;
	Mon, 28 Oct 2024 02:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K4xhjv6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2053.outbound.protection.outlook.com [40.107.105.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A85710E312
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecMiu/Fb9G1DgjjdvbOsTtzNbySpm2cisP8e2QWHUT0K8EDcqoHRezkCewQUQhVOLxPXh7Jwsa9TnC650Y7e+9RZaztQTEHjFc78T5fj/tIGWaHCAUbXOA1lT2Gp3m3KWY/8o41e9Kzu91M6GuZcR4kkQ1w0JnefGes3TD1IOIgoUoFKRLBShy2mofhRIA2f3TpT/0YfFkMFnCzr/ZPujPqp/mM1NrF3MGMMtaa0bdZKXdlk3rggOrF6DDpOmUSYX/TJ3YSqvucBT8XasCUbLTxXS9ngVZG4CC6XffPb8mjUWDvLgC6XaV0/wgzy9be7bdSSc2csEwEbN022LzQAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DIKaBFUvBNNGmCNNHQkW6OqrKpkUbgClg8+0tYRXPU=;
 b=BteOtD3qv0j3QZuKq3Kosv1XZttcogt03YryUiFOa8vNmVwycP/cVYJYNmTN/kCR+NE14F8KyfQq3lXyjH57m63FjQncK/70XNtnLVsB7fqn3d0zyJM72RKb++qoDCMMNvplN+0igJwgz27DYlBaEPjpj9YTG83V2EonbIYHvPQonRYm7JKGWsyL0RxiNmURhN4VktnxKOVyWsF+Auv5+1786rWpa1TV+fQtDkZn9OmzIMpIEPpYl6f2TFEKCAScPLos63jvGakiMXCyfQMrYjDNKL+UYe2ZxX8ZWNCVTHztpRymVCbdhg8K1OnFc2xquBg99ABzB6QGWSmfwH5CQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DIKaBFUvBNNGmCNNHQkW6OqrKpkUbgClg8+0tYRXPU=;
 b=K4xhjv6ZJrzU8+Dyge4+upHqN6tIU0QrO41vZE057+E8ketS7sEYrmj8rqaGjTRdzcfccz4Gk3+QvjssjprSPJlXlx2JremLBvM+oXRCFLqJU8gBj6joORrNoPjADXiSijY2us14wIAMO+tjLNeoxobzh5QqDregvXROu3sB4TsNBKnccKZOKGQRUoiBPDNLq2T4GgF/veKqMfKaowdgxDpGLOSyCE1Z9NIpHaNtoHy8uAezx0do4WZrcCC/Q1bmz6zZmDMwwrduUs2lyz/DEPLr6k3ACY6RnZrYBqutpictOv0V8NDdWmbRAJI1DGaeXRp+LJvDcoJSsDO4FX15aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:38:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:38:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Date: Mon, 28 Oct 2024 10:37:30 +0800
Message-Id: <20241028023740.19732-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ba5015-7576-458a-cedc-08dcf6f9943b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z1cRrJV+vjJhCchtsbC03RPw8c7SQHXJy0QttyR6CaGavmdgPOo1/EQz18IR?=
 =?us-ascii?Q?obZvIVOBRBlOoW3lU7cc9mKAXq2yAxPdbehQH/1SHASswG+SeqKtBR9TvkrK?=
 =?us-ascii?Q?UXpqQ3lJMNJd/RYAGmRJ92vr8/YvaJH3DDtk3dVxSKH8iI8lzwJHQ75TC9mP?=
 =?us-ascii?Q?H0BoSmIwHmmxek+NH/xypf3A8T7SchAPApq5SyfV5NIGCj9JYl4btpRY/YYO?=
 =?us-ascii?Q?axiFxHVNY4dohm63qS33kgAuLtOmMNGzK8r89L9nK7vLD0mR9s4wm8G7vcx8?=
 =?us-ascii?Q?1aJp3hpfKqeSKAVm4NGq8TrU3G0OEZVgIfSICyjAAifDDaijxEHenU2yuC7Y?=
 =?us-ascii?Q?/Bq50AeTGnrWZpPpAIzU8QptCgVTf/PdLTkSXdZs9v01lRl05eXvImD/GCK+?=
 =?us-ascii?Q?WvZQxM3WfRpEGKT8F5GonHJ6iU1bUbWOwiaAkhMolMnc1Nyqbe0OvRS5kk5s?=
 =?us-ascii?Q?AgJGlZBrGJ7t41DBQhG+YXULf2b6PdchaLIiVyepNO8UjegZXMr+0TRAdoEg?=
 =?us-ascii?Q?8gmfjwte8TnOHGwS+x9QzHurJRRYBdvgfX1IRl0412l+fNt1N8C5p8aRcyUl?=
 =?us-ascii?Q?rnyHFpbqijFpEbCmuuSs04FdAyVf5EdruHQR9JGMlEvQoKk8QkawZVPU1iUe?=
 =?us-ascii?Q?r5Qmmu3oUohOs1OK6OXGftaSRwgkvPjZqowGcurgxYw/LGbYEVq5uzcrs5Ai?=
 =?us-ascii?Q?49rqOh0W+9xil+488Eby55W1o/UYGF2AnkFN9RYYw5ktb098+ahKRJULHd5E?=
 =?us-ascii?Q?jbKawXngJtepKkHi5bb+OC+P62X88TyIm6fvoTrxCeSeUMHm2Qa7Eb2Lqoy0?=
 =?us-ascii?Q?YhdM9Zesn0ivXHX0fJ7pcL4LOj5fBZnC+5c9gZYMV3lUfRJ+01GGhGG8lNya?=
 =?us-ascii?Q?U3tkbMu0mtbJ5iYXVEU3RakowBaICV3USTuYkJIZsdgn2DW+R8yOsglxzBhi?=
 =?us-ascii?Q?gWapNNEdRN1gtwz4vSBPeRw9xs1uHLMP5XbmvirN5yItSWmuaAVQg/A/jTrD?=
 =?us-ascii?Q?OMW1UCjLkctrx5RhMgydNU+stOYs8dCEVdC1vSD0xnClPzv9Z/LYQ9G4UeA9?=
 =?us-ascii?Q?KCWe0e3N4IrTFo3gfmP6JGsXmQ1hiI9JdysyCTFp9b98TOvMQun4cYGl/F4U?=
 =?us-ascii?Q?SjItKLllYm1yo75zCNSNljzA2ONqm8Hg6iJ4J9LRry9/pKawflpKrlRieC0t?=
 =?us-ascii?Q?uXh3FwQZZKXcUr4zJ3LvRQOxXRaaJV7jlic3pCnNDE+H3jwuYfP+7uTO0Aot?=
 =?us-ascii?Q?qo1ode+twVXUfaMUnDKfXBbIkhZZc95fFN6ZtpsOm0kbnWrkWfOi2C1CVNp8?=
 =?us-ascii?Q?1sc2TO6StBtjrAy/jXNuboOi+5Ubjg+9grcunqJEStKmxDWEXkc7CCPyvub/?=
 =?us-ascii?Q?rDr3yxe5My/FwP9iqomhustT5tTx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8uq2WbQeXARl57rl/f1mUJ4d5qkZoGxB6r002tT3UBbspP3a13asw2H7We4?=
 =?us-ascii?Q?zqVqBXRXbQJ705pq0dxMOQaK46DPXfBXPPBRQ71Ga9rt78I8UTwrF+knfU9l?=
 =?us-ascii?Q?ITPN8sIyl8LmWzALlLVtK/QLDB8w2cE8cNvJ4RS+yoyp0Kdh90mnJuItiuBY?=
 =?us-ascii?Q?gaSbYplBsXaUbtNcxOzZ7Osuv7nwelVf3II7KczbfA/9gpr1QpwKwGoXIWlx?=
 =?us-ascii?Q?elfNd/pRqyyLR+kTNPxj4Cho0mGgCEbKlbMErFJe/tGBzExhzfNAkLfg3cnE?=
 =?us-ascii?Q?kGMOTCuqqYbbMWLQzhcqhoiAbbni2q2jdl9ArtwNxDqoVgkQtPVAMgvN9wP/?=
 =?us-ascii?Q?vhILa8xQMVTHY6D1O7Zj0pbtVCQBXeVS7H99rkYAEEkqWvYJMH83jnl474oa?=
 =?us-ascii?Q?G6ZOYzOp6pvKmXjRAJTpaR+rxsOJr4qg6/yXUxRHCv2Gje/unq1LjUoMVv7A?=
 =?us-ascii?Q?TE2mJm1MvfVWsMKePDy4SqvAyHI3C9jN6OQvGoBXKCQn0+jSNFq8bNKIN8pj?=
 =?us-ascii?Q?14mrW2IdMSjD+cEsV5ZWq+b9jgNllFJ96EYoRmaXsdmcXJqYJuyn/Yv9hFVy?=
 =?us-ascii?Q?OtkiHXT/HzOJmmsmmiaOZ8P/q5QI6TxntVT7oLce8TZvEfHxtIDWZ7B+3bS+?=
 =?us-ascii?Q?clKAoeZsE+uiYQnk/1fNgT7wcnBi2VZwa2yfh+POW+eoEFOnTq9qEK2B3Jgw?=
 =?us-ascii?Q?b/L9jAVuJ7tqb4t8DzN+Q6e6Teln66ZVPyfUqRq7dsQXXgicuti1DIM90ipd?=
 =?us-ascii?Q?RsNmlg/goJWcHCH5b23oaE3pJpFFviEVfxuLEbZayhOGSDCoY8Hx8Rs8HihH?=
 =?us-ascii?Q?g28h0Fu5cpR/bq4IJemG8roOGoRxk3Xo1fDzGCjKJfY1Jg9pyd5Ool0mSTMk?=
 =?us-ascii?Q?1BfVxDMXIpjEeBdk6zcVRbvHGz2bfe/IOlqvMOgKACAQzhCRg+hfOto1jUxW?=
 =?us-ascii?Q?kcHN5lhmHYig15uzmYbr0knae88FfhMsOvjRjwpMIgq3dn/hc7mOH52bMsYS?=
 =?us-ascii?Q?+P1FEe5IQLcRiyiZnvWdejyGNYeVtjeZ9MY6my1i+L7xwKEEc04AgsPLmNEM?=
 =?us-ascii?Q?qZyH3Rj0LmqG2f76REVMy/iNKJgmhwVFUadJF3hRCkied/D7TTmhqgXcA89y?=
 =?us-ascii?Q?G6pnFwoB9AbE3WryNHcsnWxoAJP667jVZkrEqzzSLprianbnF0PTrxgbcqWk?=
 =?us-ascii?Q?l2jK4xeUf7Rq/QKOtG2kIcijgreja2ghDPk6QNRjvXVPz7MFDDtJkk14kftd?=
 =?us-ascii?Q?8Aik5PR3iRjXNaa3GxCjrggp/ETOjjeSxMxWUgMXkjZp++LH7rvYk0qV9QVi?=
 =?us-ascii?Q?lTFGuy9FgBqVDBv3W6539fy6L9AsFmQG/H1rNfUiGvOI54L6/Grjx/sWfQxq?=
 =?us-ascii?Q?e9LkGCviO8M+R/VbxWCiYxMgrHtRAOYwaeIJgLoMShZZ0pOeL+1cAHFsQvqr?=
 =?us-ascii?Q?jkebXVp8uv8b6o46rZcc0tOehbolI1/jD52/4d3N4eZLdrPZbSih+35NYfhB?=
 =?us-ascii?Q?P8Bneds31NAmQFCOfR8rCbNMa7mcT3sn4L6C7XL/ONPXZ5WuIPjj06c7OYJC?=
 =?us-ascii?Q?z2AZ4ZGA6havGjIVRZuIe/EGPXGPYJqD4ySq0QJ1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ba5015-7576-458a-cedc-08dcf6f9943b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:38:17.6095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwbNlO4nj6CZ0bUGrokFisihhELNsUCnFtD6Jg/uiihaSVrZ2x5+W0EMoed3jSjK/mxzGvqXE2k9+qe5Ro5yvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiple display modes could be read from a display device's EDID.
Use clk_round_rate() to validate the "ldb" clock rate for each mode
in drm_bridge_funcs::mode_valid() to filter unsupported modes out.

Also, since this driver doesn't directly reference pixel clock, use
clk_round_rate() to validate the pixel clock rate against the "ldb"
clock if the "ldb" clock and the pixel clock are sibling in clock
tree.  This is not done in display controller driver because
drm_crtc_helper_funcs::mode_valid() may not decide to do the
validation or not if multiple encoders are connected to the CRTC,
e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
parallel display output simultaneously.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this patch depends on a patch in shawnguo/imx/fixes:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v4:
* No change.

v3:
* No change.

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation.  (Maxime)

 drivers/gpu/drm/bridge/fsl-ldb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b559f3e0bef6..77afc169f0d3 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	bool ldb_clk_pixel_clk_sibling;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
@@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.ldb_clk_pixel_clk_sibling = true,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.ldb_clk_pixel_clk_sibling = true,
 	},
 };
 
@@ -269,11 +273,31 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_info *info,
 		   const struct drm_display_mode *mode)
 {
+	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
 	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
+	/* Validate "ldb" clock rate. */
+	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
+		return MODE_NOCLOCK;
+
+	/*
+	 * Since this driver doesn't directly reference pixel clock and
+	 * display controller driver cannot validate pixel clock due to
+	 * multiple types of encoders connected, use "ldb" clock to
+	 * validate pixel clock rate, if the two clocks are sibling.
+	 */
+	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
+		pclk_rate = mode->clock * HZ_PER_KHZ;
+
+		rounded_pclk_rate = clk_round_rate(fsl_ldb->clk, pclk_rate);
+		if (rounded_pclk_rate != pclk_rate)
+			return MODE_NOCLOCK;
+	}
+
 	return MODE_OK;
 }
 
-- 
2.34.1

