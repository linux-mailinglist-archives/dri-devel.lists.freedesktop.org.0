Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BBA4D9E7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3BD10E55B;
	Tue,  4 Mar 2025 10:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dJNqTMjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6210E55B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmVPQ/2qaTzS4qm2IDhAQXO+an0WePoeji/r0u95HXpuVp4jBM5yieBez9vH9BiRtb8R/rbtgD8yxi1NTUFWkY8Lmgk9la5dHjNTgMq84f9agsJy0p2+R/wvyckoqiy+k3qz/Y3sUtEmbPP1GyJZUgmAKi8fFz3SLsnfL3eSjPBgNmUCz96KxUcoN2XJToTMo2AV7kdcHotO8zc9bjMilkyzoxQjLiPhdo/LWGxzXGxfEN4dbfVkiyZlu9ZQJw/QxHYV+GOjYSzBjCH13ONgLXZpE5BHbEHTyHX6wV8sb4Cyk8aT4AjBoMZu98OR6kjx14jceznhrqu4tAf+366tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmOF40n0foEyJJGtkAGLeeNuAeyqcsbAHS+FneWPCQw=;
 b=JLC9EIkHAoWDUzmV862hUpLWZ0QkLwXufzoIssqEApD4hpcW/ksoQFiRXWeZaApCRJ7lpX68xdOx8doUsC2Tb2x4Bh0t/REHGFbPxe38dTFmyxUJ2zpiZUJnXq/rXo382MZt6BTGEhfjovOkW8NRQ+hnT/62VBSx3EmrPmZJYSqn+a7HtdJ2H6cAwmzeqhTo4fMFJQGkqmpzhqs9ZAxCV6xEFpu3JWpnbJjRXUNQWSgopDv12TodPvRG049lIGyUGQ1OHMHm6ojIkDTLBpRwUSB2OHml44TxUHTtT8TWTPd3Uh6AB8JiNZH9i+m5+VCJxwUDIWwOh3O2ZRGXW7IxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmOF40n0foEyJJGtkAGLeeNuAeyqcsbAHS+FneWPCQw=;
 b=dJNqTMjS0o81bj+e+GWXXnIM/XhH04v/0+e35bRI3dme8C3XJrgNDziAydff02fFShGi9D3HzqFMKd9Ev2W5eOkc6XmYbBWbfbGrDS/atHSE0sRZCFVIS9PNMGPRdvhsYODlIeJZhxHIRwcJiu+PcK1sBo+tEBU9TNfnG8mOun2mYDp0j37+lwxSUGR98fNV9gQFqIM6m/pkYygXFI44ZUvrZwKcW5WDFvqjJOPoa2BJx3g9q7yUkrrCla7c3JqIcJLRAlyzSOzGvMmJ2NpunTgJRCx2N2gTyKbPrhPbliOBQLAEhxTd/MhnQNoTfR02+4etdSs5IQI3GZuJqdccgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9868.eurprd04.prod.outlook.com (2603:10a6:10:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:14:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:14:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 4/5] drm/bridge: simple-bridge: Add DPI color encoder support
Date: Tue,  4 Mar 2025 18:15:29 +0800
Message-Id: <20250304101530.969920-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: 443931be-a59b-4772-ca04-08dd5b056845
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Jrj4ML7qb8W6lG7JoBJ2O0odMfGB6K2mGjJpt89XX5yG1W7c+heZNQLxEj2?=
 =?us-ascii?Q?Wnh9etin4CxnKAxwBG71Of0P0IUt4jiiUq74rRIStVvEU97XuTV69z6C5Elt?=
 =?us-ascii?Q?JmfdzT7b0NcUCUWKUlCFeeS0SqZmJ4sBCyZB/OreVZDMXLL+sj5dx6ANE3BJ?=
 =?us-ascii?Q?LT6Hom9o14DyFdVlwAie9fx6ASJoLUTpWssgH0qkCy3H1AGUIXrTVOSaepec?=
 =?us-ascii?Q?rX5H3C2UvCUdxesFs7Vf/fMIfD0lQveQb0CdZwS7bhBzm1dUuHlgMTM09Fmr?=
 =?us-ascii?Q?X+MAg//VTjWfDV6t3NTGg5WEWtw6FxJb3WVsLwQVwxjp9FRn7CNaTwlHdrs0?=
 =?us-ascii?Q?qKDYHV5x0yhmlaTRaOYxfS3KfSlI4qd0nsYwqP9SfLYXf69DYvIPHHiZrt/q?=
 =?us-ascii?Q?lQAEmpDQDLGJp0EVYV+gcQzFG+CRXRfzg3xOUxPWpQQXBX4j0oe+Wfa2omHa?=
 =?us-ascii?Q?Df/UTtAiEZDrKGY6/Q5DMDLKlY3SJmYWS7ni5SgMXkZs7G5p6Bryg+Hi8PPu?=
 =?us-ascii?Q?Fw1Jw+v0/aAZ7bEqUmV1uj094B0rC6dDcZLkPzraT1oiyQiXo+DzDmLSy5VT?=
 =?us-ascii?Q?VzvDi3B23MBnrCkdEMqewEeR/4n4u1VVO7nBTV0tQXbB92BWid66EsJIx+Hm?=
 =?us-ascii?Q?x5qyH9xMWauiMPj9tBy//NQj54+x+eX1a0CDPBUBGLJTIPAyWEv7dBlobB09?=
 =?us-ascii?Q?UT/cgCWfs45rxmMC5H/uFJe8UUMb5g0vJJmLjhpPPKONah06eFOvC7Gk2AV4?=
 =?us-ascii?Q?tV77D/lnHr+aznwxGAavhGszO8kjUBJB/AS7tQMGLmi8tmjcDwQrYz8zoggF?=
 =?us-ascii?Q?hZrMVAETP2TCVjm1JUJVUdgdhgb9hsK5am6PoW63oqVOFO9MRwELcbUf59Wf?=
 =?us-ascii?Q?XB/Q9TQNedAjEmaw/AgEzzPHAseLki+96R93Hd1/R8Rrc2dK/RnTl16/O7vy?=
 =?us-ascii?Q?GcTZlBapDTvyKUsyhPls/I1zcbyNpW6C79h9sA21oW3yfFCR41Np6tvBztwe?=
 =?us-ascii?Q?bRlsWLc4kGXiehZCzacAkAkhyN34Y5jKwZSmmCgZ45CsSy1Qx9kZ/e8Ql+tC?=
 =?us-ascii?Q?g1lVi4sdx0eejwY0JJMXdssENVJ70IxpX4yuiW+QhrOFOu6p+dKNXi+DGEPp?=
 =?us-ascii?Q?1Q+94T3bGH7xQ4/f2LKXhdbc+8X8AeOKLg3h4kN5ZX2uhz0Yof9knrY3Zu0C?=
 =?us-ascii?Q?z336T9kYRRmi0t/F4dnshTAGhJvmhI9bBCN9Gu87bclK9lINaY6ZfLdiNT0G?=
 =?us-ascii?Q?tgaNaHcomHbsvFsDIf1PZkmGyEJojoeQ3PhLVY5avk+vxlis9IveD2RCh5Po?=
 =?us-ascii?Q?yvQhfpmGsMckoPyEa6IRBlbkjbMINiUolInW36PaGTkLZD+C91XLJrFEddbn?=
 =?us-ascii?Q?tln3q2XSgYHczdcDGUYfDKCCw3Eq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqKQXak1S6sADSJ69sRKQv7iwH2HpVqhKQhw2vDtYe9X/hRPqXDB7rch9NaR?=
 =?us-ascii?Q?laq/EMBebV1FAbJBZtYAp5AmlR6xZBD2uSl/VQDKTdthNO7xbNupiOeJMHs5?=
 =?us-ascii?Q?IOm5wqxjl2QykYqKLhgytI/6sd3usURo6LTuB1TBYGmGYSJn1cqfxtx8exBH?=
 =?us-ascii?Q?nJkS89swVotrGcd8nbtiszyi2wIHvE43pLV5HGGvTA6oNhdPiDBl2xhUkhIi?=
 =?us-ascii?Q?yK7t+xiJY6QNAZdKzypgKpohMuxPFbWDspHcY4DCpbDcZRvxlh0QHIQCDkSk?=
 =?us-ascii?Q?k4exQPbym8ZxxLbx+XTRZ/JAvK6qMneG6k/IfJR1XFrPo8K0eJhyrOKnvdvj?=
 =?us-ascii?Q?y4WsITm+wuhq1Lv7kgSwAI+qcDKXEnLEJ0A4KFP7SA/eAgShAj5AlhBC2N2h?=
 =?us-ascii?Q?abPE9ABeE/b28RYjCY61QDyh/Q6nKv+14/vIX+QESMxGjBtlepeu9wzHS9SA?=
 =?us-ascii?Q?XWpfRwJdTL+002VfA8DsSrGxlYIH2UXst0yMWY73DlZUgfYdfREOWkUbj1Og?=
 =?us-ascii?Q?6jKAytGQuYpqJwyrcoNsakBjO6hFhD0ifTaQkvFAUKu7+S0iajfxSJQwI0oD?=
 =?us-ascii?Q?FXmJrdWbxOu3xHjQNL3dZ1JRM9OwwTQ75kdUrGjfpmc4pIeVPTF+m9MEl8ku?=
 =?us-ascii?Q?7wVPpPnFMWR1gTTP8cw+1ehGrFrdKZXesYJpifcDYbIeF05tfk1LxbyMpKmr?=
 =?us-ascii?Q?MMWxu85QpB8WQTNEZL9lcGdLujodfoq1ynDguueIjBb54n2HucdoJY9Sl+RP?=
 =?us-ascii?Q?QZKgjojFEtvSDKmwRmTceAF3H9m0sEzK6CO1BgdTRivm/XLlnJhhNfGSKUpK?=
 =?us-ascii?Q?2NyGkHlW2x9RFFhF0Eq7nZ5QnSYf3Rt3QFTDfVeWr7ltT6c3DCfl+AEXvdG3?=
 =?us-ascii?Q?yNA8qctD8VT1eAVvUVdQDo8k56F4Ko0Toz50SLN9COXrxBSuw+J/6urRg9bx?=
 =?us-ascii?Q?EyoMDYvZUf4RTC22VAT2K+Ty+6xKvCeLeHMztKEAU0ubkjyPKvKLoenLyMTX?=
 =?us-ascii?Q?AqsmneLs8vEeld52q4cRBjUggV2BKmRHgFz0eVlDHbFFJZQ7LYDwP9pNYGOM?=
 =?us-ascii?Q?adtPcFTsnl4zJIyZrtRIpKRfToKoBJdTWsY55VZ10YBxe/qaTDdvtFH0lfE9?=
 =?us-ascii?Q?KQYgfDOylUZGTm7QdKf0hfQmG8ElM/1PRQO/Lw6Itf/rCCGix7zcDCu9SDJ5?=
 =?us-ascii?Q?EHdZvZ/s/f7Cmkw0KVbOiFoRFbA7frVVDC1es6xqxDFkZQO+ayA4j9vjOeg6?=
 =?us-ascii?Q?WLjQNU8BLqzv1fdriZm+BavJLSA2tkINsgr5Y4Jd3Sg0WctJtRgPuXGp4WBU?=
 =?us-ascii?Q?U/5IluSb8625pheDShtVnZFmfiZpayT1ueJ2S0CWM73mVxijsa5OOiZinWGJ?=
 =?us-ascii?Q?fVpMxpa6j8PwULPW4lHY10uAza7Z4aWSfR1yGsbMcb8G/pJPlbC/EzECvf9t?=
 =?us-ascii?Q?70R9Panbs8QVIbjYU23EKtqv45I7nTQHKT2uneIvCj3LviPgfv04OTFb0519?=
 =?us-ascii?Q?QcopLMygoWWDyCMI3/FdYrwI7DWjqVu/oNSrJRnCMWNchUx3hsznfmNMjt/G?=
 =?us-ascii?Q?6gxKuc4YhHpJzq8ax4qJO1YVB3FucIpIELZl63ew?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443931be-a59b-4772-ca04-08dd5b056845
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:14:54.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZRz4CLw7Hvicnr2+PCZCi4g86MChdjvGRF5w7KTdRqGQyCQcYipy7AoWXOKJrj+a3ww6Odz9I0NBq9Ti2vw5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9868
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

A DPI color encoder, as a simple display bridge, converts input DPI color
coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
bits in every color component though). Add the DPI color encoder support
in the simple bridge driver.

[1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 104 ++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index ab0b0e36e97a..c0445bd20e07 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -17,12 +18,14 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 struct simple_bridge_info {
 	const struct drm_bridge_timings *timings;
 	unsigned int connector_type;
+	const struct drm_bridge_funcs *bridge_funcs;
 };
 
 struct simple_bridge {
@@ -34,6 +37,9 @@ struct simple_bridge {
 	struct drm_bridge	*next_bridge;
 	struct regulator	*vdd;
 	struct gpio_desc	*enable;
+
+	int			dpi_color_coding_input;
+	int			dpi_color_coding_output;
 };
 
 static inline struct simple_bridge *
@@ -156,16 +162,93 @@ static void simple_bridge_disable(struct drm_bridge *bridge)
 		regulator_disable(sbridge->vdd);
 }
 
-static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
+static const struct drm_bridge_funcs default_simple_bridge_bridge_funcs = {
 	.attach		= simple_bridge_attach,
 	.enable		= simple_bridge_enable,
 	.disable	= simple_bridge_disable,
 };
 
+static u32 *
+dpi_color_encoder_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	if (sbridge->dpi_color_coding_output != output_fmt)
+		return NULL;
+
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+	input_fmts[0] = sbridge->dpi_color_coding_input;
+	return input_fmts;
+}
+
+static const struct drm_bridge_funcs dpi_color_encoder_bridge_funcs = {
+	.attach				= simple_bridge_attach,
+	.enable				= simple_bridge_enable,
+	.disable			= simple_bridge_disable,
+	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts	= dpi_color_encoder_atomic_get_input_bus_fmts,
+};
+
+static int simple_bridge_get_dpi_color_coding(struct simple_bridge *sbridge,
+					      struct device *dev)
+{
+	struct device_node *ep0, *ep1 = NULL;
+	int ret = 0;
+
+	ep0 = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	if (!ep0) {
+		dev_err(dev, "failed to get port@0 endpoint\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	ep1 = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
+	if (!ep1) {
+		dev_err(dev, "failed to get port@1 endpoint\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	sbridge->dpi_color_coding_input = drm_of_dpi_get_color_coding(ep0);
+	if (sbridge->dpi_color_coding_input < 0) {
+		dev_err(dev, "failed to get DPI input media bus format\n");
+		ret = sbridge->dpi_color_coding_input;
+		goto out;
+	}
+
+	sbridge->dpi_color_coding_output = drm_of_dpi_get_color_coding(ep1);
+	if (sbridge->dpi_color_coding_output < 0) {
+		dev_err(dev, "failed to get DPI output media bus format\n");
+		ret = sbridge->dpi_color_coding_output;
+		goto out;
+	}
+
+out:
+	of_node_put(ep1);
+	of_node_put(ep0);
+
+	return ret;
+}
+
 static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	int ret;
 
 	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
 	if (!sbridge)
@@ -202,8 +285,14 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
+	if (of_device_is_compatible(pdev->dev.of_node, "dpi-color-encoder")) {
+		ret = simple_bridge_get_dpi_color_coding(sbridge, &pdev->dev);
+		if (ret)
+			return ret;
+	}
+
 	/* Register the bridge. */
-	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
+	sbridge->bridge.funcs = sbridge->info->bridge_funcs;
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
@@ -253,29 +342,40 @@ static const struct of_device_id simple_bridge_match[] = {
 		.compatible = "dumb-vga-dac",
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
+			.bridge_funcs = &default_simple_bridge_bridge_funcs,
 		},
 	}, {
 		.compatible = "adi,adv7123",
 		.data = &(const struct simple_bridge_info) {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
+			.bridge_funcs = &default_simple_bridge_bridge_funcs,
+		},
+	}, {
+		.compatible = "dpi-color-encoder",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_DPI,
+			.bridge_funcs = &dpi_color_encoder_bridge_funcs,
 		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_Composite,
+			.bridge_funcs = &default_simple_bridge_bridge_funcs,
 		},
 	}, {
 		.compatible = "ti,ths8135",
 		.data = &(const struct simple_bridge_info) {
 			.timings = &ti_ths8135_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
+			.bridge_funcs = &default_simple_bridge_bridge_funcs,
 		},
 	}, {
 		.compatible = "ti,ths8134",
 		.data = &(const struct simple_bridge_info) {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
+			.bridge_funcs = &default_simple_bridge_bridge_funcs,
 		},
 	},
 	{},
-- 
2.34.1

