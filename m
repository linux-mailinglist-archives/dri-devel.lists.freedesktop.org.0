Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB19C8371
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C289410E7A2;
	Thu, 14 Nov 2024 06:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TQSatUQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF60010E7A2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrKmu1ae/lyC5JgmwWfqeyDkqz+/OrRGYSBZ6quL6tFJaAITeiOS1ire308TqqqEUC/+Ju+7czq9WpP2CsFdOL/Rhl5OYVG2ANKDlZkXyDJGN1cn4vDlD08ufCiMNO178VxKu1GEVlNtd4RKPgRRzJWHdt+ZKLP5DQR15pgoH77EOa7haLCHmTC5XGvZzePvtH8hz/ok5dHZxj9zyOxUWT7RovQ/X4j39qLde8eG24meqSfyVE2EOKLZjnl5N579FNxUcLq+tIkTsRIJhCO2A0gS1IexjbmqbkEDRREzZQ/iXLlqIR3Rg135kJ3ziGd5rhOg16Q1zVJQAiDW6Ccpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30xkgxShCgjwpUU47CWqpAuTdlD6ZjqOuHTYvDzpD0w=;
 b=IZGhqBHBxVTeT6pDa18ELuWxmrxfZ1KUzLwJGQmNL1e0Wy+88/vED/H9drhhBQlntNfiWa6RXmYEC4H21CrcqBMGjURkBbsJB7xcXBOcTGsZPw1PbKdwFHpU/hq3/1mlCVZEiLaM+W6+BxdZp3KSvBvKMCBCdXss2nLc2zXSypfiuk7meAIkDzfe6a8jkY3F1nSjIK/VGurXghCIFh+ET5WriEqHS9hRJNJq9TxH6DOFotgXb6lDA8W4nH0DLIWjPTXrbHY0eps5OA0j31jlc9ZpLd25XYfCasi7gsn7DzzCXX0ybfEEI0nlRclCLEGzm9w8Nt/TbC5uXQXs4FoG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30xkgxShCgjwpUU47CWqpAuTdlD6ZjqOuHTYvDzpD0w=;
 b=TQSatUQqDLDqTmYve7vv6ELkAMF/SLIyMycf6BpR+kYE+isIARl2QeI6TrXnB7j/JtgCQDBRt2rkfbxOzkC7+i8NC7T4hnP7LWR3idiCZk61qpw1b3sWFrL5FcLzEIkreTRlK66RhUAD6FaIdwyR9JJC21e1rwCQvH0QyvoA0bBPHkP81eSn+/OiUTV0VxPBhzEbi1AtaY1aWIUEMuKrAGyqvhgQvCWJps37OaAhj1pKK5y7erAHlL8q9WQxwdxSh9EuyWBFRFZhEzNAcrqhuMkCjecShaUs9Iu7APGxJ79EBvQpapgC81TxpZn7xZhFmpdr6Xp3kPgeuEkiaVraEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:58:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:58:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v7 3/7] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Thu, 14 Nov 2024 14:57:55 +0800
Message-Id: <20241114065759.3341908-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114065759.3341908-1-victor.liu@nxp.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ced74fa-fd4b-4aad-5b45-08dd0479b804
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sm/jLtK2/5k6FAO24YD0akC9MZX/qH0ujLuonfikVSdRosGfukYS0/AXk7vR?=
 =?us-ascii?Q?XlOOv1MFlS5ve9rqYvss/SLeCTXPIT+Oh94ROTCEWNyLRF3GXMAEI7HapPgG?=
 =?us-ascii?Q?tkNFjqpS6Ou7ImjmP2D8MiAFTELzHPvAmwH+LguVc7WZn1S9Hh3cfH/hWVov?=
 =?us-ascii?Q?fGfzwI9ggub8jxmYx4UOJoxn/ymCIt6CBYLgdSi8F/2qVh3CfvbN6BkL/EQ/?=
 =?us-ascii?Q?oAx7H385Xo8EmmweZbfdQAR8gEB7Vdpg4nscbKXlQw6rYPsbFU9FgSRljVoU?=
 =?us-ascii?Q?lY1hf31lvZKy0STUVQu/P+C428Fds9XR3V4OdObAxqOQe9ZD5w8zWn+ZIel3?=
 =?us-ascii?Q?Ihf7WpQ9uR6Els6RSdPZ15mZaYAb35Y/Zr6qYco6Jg7nRGD1h8rMRcPpJ+4R?=
 =?us-ascii?Q?cg4ty5tiq1jPouvmxBph2e9UuuWOAnEeWF1A9a+TwxqBJ9Wzq1FyVUFqeGMT?=
 =?us-ascii?Q?6dT1m/eVLlkSFYQaFMQavUJgksohN0ngmXT2jUsekeu68g3trkEfjhHfkmD3?=
 =?us-ascii?Q?xUPMRwUHa2Fhqhq71uvYQap69KntWC/WKPj13HjCSpZHw6X0vhsQNyXXXthh?=
 =?us-ascii?Q?W1jRLvrekY8Kjf7qDkGNAaHKee1FozHU/bKRg3tfqXYPzjnKn6RF5ZEWNObx?=
 =?us-ascii?Q?/P1AIqstIVjsU9MEjS5ONhloH1tJgty86E3wlfrO6KJ65mD6WNNwMHlpD+wt?=
 =?us-ascii?Q?lQIVgqgtdDzauuq8zTQTjHrfL1QQwBJ8q+7s3dtoCDelReg7eFCWtDAVnJa8?=
 =?us-ascii?Q?Uo+iaVtmTvwJOfo0c5gSYvnhztxTsjozZ1Gf0GgPC4w75xBm/V3usCzO5CKm?=
 =?us-ascii?Q?ALtLXDuq/rgD983HLeU42HJvPa/VTGKEV+a8UwnMqqFgfEBZ4iTQD14aCNWH?=
 =?us-ascii?Q?5jpDruJugAqeL8ZVFsQ01dA6vgaSjO6ZmNBHxoF7c9XhKKBK0VR5mMypOoO7?=
 =?us-ascii?Q?2XECK1VMBGqfHw6MRI0cuHGrlbGJ1Q9G1BBWafcX8Qi4WEOk+Qk7lDLn+lmr?=
 =?us-ascii?Q?9PqpWfH9bkyHmUle3lo0x5naoHj10+uhcxhS4Z5D6wvKqMVr2/pTJ61kVMyG?=
 =?us-ascii?Q?8l0O8NYRT8GmA2Rx6neYf4LR8V8TEADDu4SahtUAdts6RubkDHkpud1H8CSY?=
 =?us-ascii?Q?vgKEdkktpwW1D9DKlrbXbbN8rAgCI0v6XRmZkOrgkT3gh4TVCdLR8hRqkwcR?=
 =?us-ascii?Q?kONpnt+grebQdZjoNL6TePmobB++MR7BY5d64TOfbrOnebD+V+pSKIygRFQw?=
 =?us-ascii?Q?HCj6pu6k2RYXQzsmO1rFmj1cPr4XIKP6WuB4cEUI/6o8wbhPUF3d11I/IwQw?=
 =?us-ascii?Q?IpqfxTv6O/Z8kKl9YxjwRGfsQc5sz/qjOPHFVOGMfAGDBm6byCKlt4R6hxZq?=
 =?us-ascii?Q?PwqbhfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zsZfh3bSkUZdtgOEv2j69tH9rgNd5/2ul96JPW+Eh7rcJpogE+GNOHMag2Ig?=
 =?us-ascii?Q?nYZN52+m7rPHy2skt6xaLJa0D/o2i5hN9Y3fr8x24yDJJKoa6zPaRL8fLjr6?=
 =?us-ascii?Q?O4lg2/iLwFCa1b56LnTzh3xF5U/xJM7pzuZO5phSM1sw3/vDHQI0Xe+jzoxd?=
 =?us-ascii?Q?wkYifAuqXpkP7yE98RZjbNW6EckBH/7K3VVPFxRpyM+dztmaQ6msVv8oSebh?=
 =?us-ascii?Q?b7hGdjT2JkyK58oc4pteZ4ayQ+AxfU6XcSVW7oOu6PClNsm6taqNzK9QMrDi?=
 =?us-ascii?Q?hW/6Of/SMlNHGyYd7eFAvpGJsP/EtclMbzzrPPHp3tBc2OYIHaYwsR7XaCvR?=
 =?us-ascii?Q?J9Q3Ge8iv9mwXneyKBrBcg4G8w9HNFRJEGSB01ZCGKZKSFBGntVO6RkQbhzr?=
 =?us-ascii?Q?hn5zp78lvPTF4TcKTGMFDVkp7YSaKdo0Iq/vgngS3JaMhOqF9StLA5mD3iU4?=
 =?us-ascii?Q?1IYd0T2rKycDzVpD2YifmPmnwUJhOjWhdkiWqqX4DVsgVHQF8zIE+t5qDeiB?=
 =?us-ascii?Q?yTTTHsjKK4hag443q5eJjSLUJ3rHqm8jJUZIleD1ryl+GeekA+PRloe9n5Fi?=
 =?us-ascii?Q?5rAa38GAD9QyZ47RFe2h1xZbQBtCSpDCvYpeJZOUNtx7nbri05VUyoL+tHU4?=
 =?us-ascii?Q?AQivYEbqj7IA4TMhW94YoLlMJjLTwrFZ1IHSzHGykeoLaAmB1gaAJx1RRs0Z?=
 =?us-ascii?Q?mJCiB9n9fUG1e1/gy+gDeyJ8Ho55eCv+Jt/QAMo8vDsW6Ecf6YsD7B1Lwho/?=
 =?us-ascii?Q?PT/r+L2gLbIGTvtlz3Ati6W6Fz7MoCFhZkfIt4xJWMYMV3mPHNkj/8VB9WjC?=
 =?us-ascii?Q?ScOtKnpdMHFgXHXnI+8MaywkTzGR1Nm08W7mWsHOsOZwVi7q+qBGis3MP6j2?=
 =?us-ascii?Q?I1R8VJZTkxRmMzRNEYzZvwq3cPYKS89fiIlVw/LvrYCyvRh7S6xQ7FhX0zZf?=
 =?us-ascii?Q?vGbn+GUUSTBjzqcbWV2fIrURtwlhSyplMbt+K8tpK5HOamRKuPtNoE6t5cqe?=
 =?us-ascii?Q?7aMuSYPjLlcfCVkXo3gM+G5XxIAgorwTItLVDbIgVZCuXjG8IkrNfFesYoS8?=
 =?us-ascii?Q?j8jB1ipV89s/2EzAGW6p0PPr/k1lBEjYLWrDn/PnLFlZNF7sY6xoVbDER2t7?=
 =?us-ascii?Q?tNHe4VUzN+TTh13anuiQuQekLpLYSe0gY1vN5kMupdptigIOi2YDWeh6lEix?=
 =?us-ascii?Q?O4hueA2FHfifJKSx63O4pjIygo5sKmkTdMOSdMIZGq6mVdFJxlZPr28FUXgM?=
 =?us-ascii?Q?sOIy6igjiwxqPB5NgCqRG4Mc5ocfaUEeQ7LfZVHIp2wrJA5VZQltnJ/m3TP7?=
 =?us-ascii?Q?vF1MEVgK+uuMkFicpnXo38zn55a+vBcbmL8qQV1rNKsdmUSt1C46V0VsKZnC?=
 =?us-ascii?Q?G6sdjmzfukSVQ47WrrHMag/1lxA1fy858xkqiSONZa2VJwAX/KCoVuQfoxHQ?=
 =?us-ascii?Q?LvOHkrNRymaZGM/75oRNbOXxjohfPJ3MvQqPh3uRIhlsEmR3NfFyA3OHV2sh?=
 =?us-ascii?Q?DFVDuh/9KzY1gUwyiOyzVM2F25nDtalsxQauXK1Q3IN1uXrP6oiYspYg5nYG?=
 =?us-ascii?Q?6pyutLLZiHJS14SovhmNekxZMeF60VtCujCUwb1B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ced74fa-fd4b-4aad-5b45-08dd0479b804
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:58:18.4359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfMXY3PsPJkzLZNkyLEC4KlxBq8u7lC6ncaNDdRwUsDkpPKKRZvozaSFYqXq4I9X3r4NRESDxS+khBBqCyy8Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
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

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* Collect Dmitry' R-b tag.

v2:
* No change.

 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..b559f3e0bef6 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -117,7 +116,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(bridge->encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -318,33 +315,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;
-- 
2.34.1

