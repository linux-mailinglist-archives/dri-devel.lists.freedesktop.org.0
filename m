Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA5B0700E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F4B10E72D;
	Wed, 16 Jul 2025 08:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p+uQGdcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB25510E720
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlHWuOuIA6q56PfKnEi6h1mZ8lwM9etP++oiprcbo+7jmXqUbBjwH+IfzTztTEs6z69aAAsiaEwxFwRXqm3TqrGlpug0uBLbNZkhpBI++fYCEPsGCze5+wGax5i68fY6/7RivBJJhH+G6AmnTOcQLxW9U1ENvLc0c8JaXIfFt8QFcN9LFgGYOArK5JOY4kRE4PzD4TsKj6U3zbM0TvFo36FNtbn5i/WTHGVSA1y9Jx5SxHL1MxFf0XrY7gvJXD3xYvk1MpCLTN7Qh9GxNzBXujgDzrGvJHnpPmAvyZ4fwOgEofYyHrLCXvxWKn47UUtSHB7m1dxiS55PcRJpGUBmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+VkBKoRo7zr7oqfzA/q7nH7cepUG68WzqMfXL8B+ko=;
 b=B7Ahf/qiFOGdGaMytFmBLHpt76lYyXvYg/G3GMiWlKSnELI/c/pL+zBPUaWT5j2huuc/FnLeGZ9ZYlDgpLoboeJmkzo96nEW01Z1zka7P1fNe2WLl3RRUJlv2ubENI8m8GHRczN1IVpVCgjhQaaYOtHA8aRuViZ+FEvsmDQULYazacx0Ffc3ZWQD8/Ul5KfmhHgDX/q1zcgKctH9Ni6Fpril+30xUJCxcJbtBTQbnuw6/QI+039BziEgQnlnU9Inm4MtLfCO3HDLCTcglVIT9Xb0kgk4m/+tT+XY0elqrzwTSKLJpSVX6+DWsAoveMJuHQ5hHRP+CpAIHbTobzVAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+VkBKoRo7zr7oqfzA/q7nH7cepUG68WzqMfXL8B+ko=;
 b=p+uQGdcb23SqgvYoNGQPuf7PEgdMaKtxd9xkjcBAQiXNpt7P3RoIPbzw0sEpoLmipPdVKXeMVoLgXnA3Zl7vQwKxAPQCcgBjDdfQjXW3ieFZLuz4QigPvqOqq2RB/v/6go+OXHWXVF62qfVKT+9Pgv//5sYMPoNtypeLuOVg6JkljzlqvBOGgNj3cVAHzd0eKVTMn5jnvLSWwXATOoSGcs6CAC5bPHuEw5+s7RKv/oieYBj25JvdG68/PaNEWuqi/cxc4JqRVGIkNSJrarpCpoRvAM0FvV1nj96/MMUf2S+c0DnPt/XuwTgwgHwYmVryqJUrnfxJnrLnlsXdDR6/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:52 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:52 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Wed, 16 Jul 2025 11:15:08 +0300
Message-Id: <20250716081519.3400158-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: b81d7190-4eac-4afc-ff65-08ddc440faa9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8xTvlPYFdRZMA6uAPsI2/ICLEmohSRyEQPXC4LoBKzF+vENWpQKadsaCVoYM?=
 =?us-ascii?Q?opAbkK1Iy793aK1X7a+fyPmkr+/K2B3gOtuBgDM4S0eiwzfnIXZ9F7R/H4gK?=
 =?us-ascii?Q?hHkbdk96yia4tNqkAe71pZ1VH+jsdkWUqMaoD6P5fSgLnq5kj+BBesOGyKqp?=
 =?us-ascii?Q?R8wmAgPZxcPnwKh3rCR1XQajTHnGmazj22V8/rEa0pM8NdeVF3BrnKQCj6p/?=
 =?us-ascii?Q?p8StafJ7zlsW0O1ILSxkdy3vXfQrGxNEVgIvHrKwk7KbrfgDA6XmgdABYk/E?=
 =?us-ascii?Q?tFwD3+RJvJ1/v9BkNQSGcGGK1CFLk9fM/Xrbscsx1kHCLWVgGaSqx22an2Fm?=
 =?us-ascii?Q?dRSOUnMMq0HUMhEBvkq+pYMfzNG4Slus/dg3I0cCPADZObepxslyz95QPZiq?=
 =?us-ascii?Q?R7nCNja3EVwZZ5rsjbNBklE+oS5xTuIBqZLsZwOtbj1ARLJLFNonUNEAdBNL?=
 =?us-ascii?Q?rm/nd4+p+k+vFOKHqz6Iz39E2KP4K21LJzXS2aSCxW4xoureyC978qScO/m8?=
 =?us-ascii?Q?/cMpV7VO0He0nETRi1IDIbZvnzvnJG33uAPZBT+OGUGoCmejsZlrq9HLyCXw?=
 =?us-ascii?Q?eGgjB0O3AJzVkIMvJJBnhrLdJeQOD76OnM+ikZyokpaAkddDObmmxMIHCjQY?=
 =?us-ascii?Q?CUVXp6XEwIZxHEKRwFkVn0gEs4OxfF3oJ67I3YM/Ce+M7sgXrHEGuEs3smAV?=
 =?us-ascii?Q?7s6ndlKDUjasuI1+OqoJCRlRV2vWOZmw+GzC/KM1D0p0Zkpo+/CFdhPlzUv/?=
 =?us-ascii?Q?gplcuTrO8XCvfNFfRGphKM50K7fjrtw08ugAkV+NO9rx4e6LM4dXBoZbJ/2Z?=
 =?us-ascii?Q?tQGNiv3OM9mFs33PPf4IXc+u/BAzRrBX6opVMnCLr+N7aYbrG9kHUw0aQ0Nb?=
 =?us-ascii?Q?uL5FEDHJtUrPTY46NIXiIECBDQLZKEzzZsfscn8l9KjtaulBzVpV0qUCKvgo?=
 =?us-ascii?Q?D2G/W+BoDKa+C62D/tJ1teDo4gjtgK6WfNK4s421S+BdYwOf1UOQj7klqBLZ?=
 =?us-ascii?Q?lNbgUYq5dZFg+k72JQwoH5ZC7fLh8LaIlLSs40VVRO/LhZXmUHnlBOP6ORfQ?=
 =?us-ascii?Q?xcTQaRYie+NieV5q6kUIPJWKvOtZPFCwVZ8r5EOQLcT4sFGCNxICHdZaSCVi?=
 =?us-ascii?Q?klcuRQqVjkybPghNa49qwhROHNW7FIzYS9G3/phqy8qYKxUBtcQpnYiPnnlU?=
 =?us-ascii?Q?uahFCC9cGHZgaFcSIHCAiVXpgjXB/MfBe/UrqDzi4pHuskVNPgPdzXJ0lFcx?=
 =?us-ascii?Q?tZqXHiqjnSJC4KltXIwTPewpNYJw+WetCfy83kcXACJ+PG3XdP/SFY2PHY5C?=
 =?us-ascii?Q?5k1C4YvzMINcgGtSP42Ve2KFjIp8An+NbjF2yRRO6ArsRcbqAW1gergIywUs?=
 =?us-ascii?Q?7m1vsVcbaVAbszvbYbIkCWoz/QAHbZriGCpUTVDkqUPYNME87SfOuWpmoim5?=
 =?us-ascii?Q?KNl120j+7Sxzi/jEiE93bP4hW5032jedeLFk35tQyVqpXthdDWTvtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7Ob3wfeUSg5mn4ciDQQ9fJBeSvAq5vSePZGCiE4T1i5c45Z24DSmTkgPj/Q?=
 =?us-ascii?Q?Ls1Fm4iijrUJtjK/7vuUCf9nbgyL4/nKwyxyNLZqMlhvA0T4QiPXMNNawj91?=
 =?us-ascii?Q?xMJgrdzXC/ZQyCqvhZr5T5eWJ95UxrdgU9rDGOlCVvnMrd7KGhSvdZdM6n6U?=
 =?us-ascii?Q?P/A4Kq2TBHUzg7RCxzJL0QdjVxbR2v0tU6M4UVVBfYHZz9Wcj1Em9r1/VdGH?=
 =?us-ascii?Q?b46vYFJjj42lvtvnSIjFv6M6hIOQ1fhsM+30+hRfq2oXCeRscvYG2x8yaJeY?=
 =?us-ascii?Q?HvBi+uMDi5tBtNQySAqahZxxURw94hA1vbHx6QDg1IcHBQcCiXW47nmAFOC2?=
 =?us-ascii?Q?ayJDfK8cpgPOJ+5RBpdABtaYQkoARIkHukcr5ji8zk21SsRuiPn2moDqQ170?=
 =?us-ascii?Q?ijtjaFp6FqirJThbRW4r9icEkAnccw+1u3cgMWmeHz3K4DLzunRuslwoZJbi?=
 =?us-ascii?Q?ITsGwFiNWAUf+8x9H6iCJk/Y8uWipBhCrw00DQVP8K1LhfEutk9IEyuymM2B?=
 =?us-ascii?Q?JQ8bBAxDKjK4XIf3Kugs6rUjVDSVO0w7cHSQ6d0U1mCY8BORzkJXFpf0O/+x?=
 =?us-ascii?Q?RCd9f7SlndegszX78cYug8bC4nsABx2sudjR3Orrnm0QNQTmfZ5aod1l0Jj9?=
 =?us-ascii?Q?23jj+76ADwx/BBHU09avviukcbvBxT1RE8R8qFigoOy8ECOkHG52AiSuOeBh?=
 =?us-ascii?Q?bJXkZaqfIt6E1pgNtXrLZ72U9sPUInf6msJH+lLsGhDFleeIdaP+ajGjXUVZ?=
 =?us-ascii?Q?/t1+qozg/UafmNNeRGsVqFwPHUbtZMTcsvSTWcNdGZOQocldqC/LJrhc5xEl?=
 =?us-ascii?Q?YVE36EirGHIwUizLB2ai27konddeT03XG0w1RoQcgOwOhTvTm3WOynZ8BtT2?=
 =?us-ascii?Q?fbwl1ibvweurI8TS8fsy3k5mnt4QGEFtqRvY24Om8zlwiloJdfoHfA6L9+AN?=
 =?us-ascii?Q?aeMrGXCK2TjsZYAV0HimoTU2ZLEEp/51FvwWpN/Rus/MFnvBKLtUcDIO3DUB?=
 =?us-ascii?Q?bPlzFdlOb9rscBMImDt+MUaj4gwxx3N26t0qjEIiiqglqE3qHmTNGzAt2wva?=
 =?us-ascii?Q?JdhwZJCVNPeSPyGlBEW9556/JUkzCAs309R8ZpKh0Eqd4RlpSZrDMuQPMBwz?=
 =?us-ascii?Q?gSk2NOTI2Y+TbbRQ5iPIbP+IhgBPy/ZSReTcoAvooVd/l3wfDb0V5d/9RJWd?=
 =?us-ascii?Q?9G/TxZsk0AJt8XX8yym8zMcczf0ysQoJ3Az+555zYpO0M0joxEn32flQl89p?=
 =?us-ascii?Q?PvMIpBiqJpozPowPEQ+YopFHGQaaYySz/cUmxbfOcAjOqv4+zTAEwAsRx9Cs?=
 =?us-ascii?Q?uozl+I4lG6fHkLPWZkNGDAXkmtsVVxvJKs3HYvRu3XklBN/BDuICRvzx6ewt?=
 =?us-ascii?Q?govwnaIuHXZOW042wG/xTcExntAmW55S8559eS3uNWGmWmoC4HLjOSFFyM+W?=
 =?us-ascii?Q?xhYDlGEOBmpNo9NSj5nRqOwfaRaVFV+Zznea4TZBMdUJ6xxJD0nZkPmW3ncS?=
 =?us-ascii?Q?y7YDAwlvbES2EV75U9vJqqfZlwYP27bt1XNJSkemTRYG8IJxTFn1uEW53RvA?=
 =?us-ascii?Q?kEa8LN8de3nHfVjjguJWZJzYCCJlYBpIogjSXwk0SZCgpYP99u+OwHABz+R2?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81d7190-4eac-4afc-ff65-08ddc440faa9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:52.1551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpS5OikGUbwXELxLld93CGafq/hcPOufL1Rp0VZ29IS5baKD7c195rcWly3yXarb0E4VgaVEGKG4sxtDg5TDfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
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

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bce..665053d0cb79d 100644
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
@@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
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
 
@@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
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

