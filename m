Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB1B07014
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC85B10E720;
	Wed, 16 Jul 2025 08:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d/I76yJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD210E735
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCU9zZQHH5AR05yIMs0IeK5z10tEgm7yxSC3etfu6ZVKV38yfQEWq+10+bf80aIKBunHX2/DhCLpEeDODy3dMYGqfvBcQzG07GBO80LbUYhfUuAIIQ6ZwQDWT42IsqojSj5cDpXWIgTbhvKAJDf0Wy8D6uTwEd8TAcr/w1Tnq1iADBZRZJyJ46JeG85CA5XA8J6B+X9ebXv0XmdnrV6Mg6JICZM39zCxQXOqdLlHd1uwkPUPTUoDndlpfpGS7/14IJseLfvTTkL9uPFdH4piZyWhFaFElV5X1nDSJSTL420HS0izRKafNAIybhwbOM6tOv0hy4S/OOaz3zCHJJDk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiGJo+ymIZco8EYkCLiHXI8IfiSge3Q1Y4gdcXmRurM=;
 b=ORiR8mcOwCMQ1KZDM7zSLcEAUJYvIBpt/H/1qsC5FPOtwZnn5k8U5bfkVjFi7+vCX6AzyPBf/1HWJK0GbQGOqhzv1bYJ2DiBEKmLTtO9EO6UiwSMBZ+NKYpYJTHnWnePBiunrUquP4DtteVgRPzU6r8FvVi1TJRH8GqPS00XLCKix7ObPFFHd1BO3GQ2fQb0x9DjwjnsKqaHolNO7oSEayUMCEJivsbSkLiF26G9We6QrDaAu75WHtWfVgxUbnE4fm3I+/Yj/I4lHeadVfFoj80H+zCQsAx2BrBnvwQ06jgB9rTF9xLYjuTEYwXuAbh/Lr7WewDy+9DjqMCLdsRutA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiGJo+ymIZco8EYkCLiHXI8IfiSge3Q1Y4gdcXmRurM=;
 b=d/I76yJCuFhkxoTdUUfizDLjXjPR2geArBC/siyknZtyHNAm+3c8oLkOuTHqgiiwjDtwfPSilnbmFwKWmVjt00YmrdHFcqGLH3vXyKLw9gVMbipT2lyDgQiVk5AnS/ozs664I/bcZLbClugi5HzVeE9S3bdqShI2FVkEYnQIdF+7Kbp9hsDR2vr6r+LQHoGUeup38K6Rgf9kQBvJbIstrxNZPftUyx7az/27DcKZLqYESapbtBhgu3WxHVklgHx9VI0u7lJhPaesRw6h4t1sT1zCU2XrGPQP1p/f5G0C5qKcX9mMYcjrVVYiFN0TOswxE5HQ9Ei9kmWqfQwbqFM3gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:54 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:54 +0000
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
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Wed, 16 Jul 2025 11:15:09 +0300
Message-Id: <20250716081519.3400158-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb7da10-741b-4a95-72e9-08ddc440fc36
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UTaFz3qwNePHUSJQMPa+dN0PrV5PmUNxxBkP+upha5I8unDuumhDysCorQFD?=
 =?us-ascii?Q?sx7ADapfxQ+bm/Xa+Y7ZbclVa0BlUz8VhTdfZ/pTv+WvDbd4mLM6jqwPHlK1?=
 =?us-ascii?Q?UqXe9CKKj3IdXCdZ2vp2EhXmyhJNEoyxa5vcav7Ki3Tt8Rze8LAkDHevUvOl?=
 =?us-ascii?Q?0GDWOUSpBwu1zxF3++cQ11CdDP9ED9RiLzxRWsIz6qt9Dt/yyT2+l8U5mJI4?=
 =?us-ascii?Q?9LvaXjyfTkOF7usasf+O2uZOmqYUj+KwPXmGFW7fj4SD6YJxP7DSuYZt0j+e?=
 =?us-ascii?Q?DFagEBQRocy1WkKCAQeGpfvynpje2KZaX0z3Mk5bvvRAXh2z1Y/hZ2o7z6Qm?=
 =?us-ascii?Q?QI39Q4f+QT107UsXoBACjy9beMm6QhfnjRnF7ASkFehR2ukIXgjxZRjZOg+w?=
 =?us-ascii?Q?oC43g5ewFZTldMcJ2/0DyQHk4mHL/J9zE41D0thwc6Gx7IqwNFUmjqSp0g2T?=
 =?us-ascii?Q?2T30Pkg0/YcruNvX8P1cBZiRg6RnSgJgLdbRBZIM7tAOxJxxYVmFC/uHN79F?=
 =?us-ascii?Q?lFiAhPBXCYPkeQrBYej6OXzIJ7m1Ep+OSc42MTIIGNMUtlrCauqLyRDQV0pP?=
 =?us-ascii?Q?U2I4qf+c6SFN5vSAeKZNC928q8PJZwm6HHQI42pP07hUPLaTJ9+0ZtdJW9mP?=
 =?us-ascii?Q?ItbQz6oLQD0EC4WJsHlObq9OeRQFRJRBWEPlnQUJSAgKFfG6ds03sqHl7219?=
 =?us-ascii?Q?/+Hg8PCVkmbzOyqV6kNOJd7G3aUA/Fk7TeDN81s1i9xwZlxUiL/xO03XHUc2?=
 =?us-ascii?Q?zXOJUutidUHsc1gmYePLSX1Tm7iTY8e+KwDVzpMZbpMBo/Kk3pytjIe2OXEN?=
 =?us-ascii?Q?4JNJ/vd/ZUDOAHWZcUN2SIHoGHUrh8ene3deRZDurhVUv35qgUnsQygh4SXM?=
 =?us-ascii?Q?Hsv6RPGNuIlNtgtY/r22o/pwZMZAbj7439ZwzPkXJqJhAcxz+W3H5+YSr7g1?=
 =?us-ascii?Q?16yOSkuu1E6zaXEK0GmpXmWCJRvoxdzz5ZhlHNDvoFJxOopiFJlMgBExoXrc?=
 =?us-ascii?Q?FJDAzLlEmQTVCH8gw3KS//KKvTWlePnCZaGFGQdW/SnA3Th3ywcC+Lcs5Uyt?=
 =?us-ascii?Q?4v3lYD/6Cf6x6CdA7qjzFYbPza7j2/fhphSiDrNHvWKWWNhD29tR7DunuToO?=
 =?us-ascii?Q?y/AJEbmJ1rt3vWyUwxXTXM1kvKlY1fAdhuEV/ciMPOK93HjkxPzSTlNAdacs?=
 =?us-ascii?Q?siE6sg1L14ybPrUr0rr1hyj5KkiEjxMw+6MBSCzMdYJCuYm4DgwvDOptWGKM?=
 =?us-ascii?Q?NgoLJgwCZlzr3RBqJGbUMqB2QyNULwr7Yup2E92igmPjAn+/IXBhZrHVq1uq?=
 =?us-ascii?Q?CQ7m2ciz5Epnn59ks4j6I0jhPYGXyZspFRhAHNvfGIkoxLDXHYbgfZRbDYvt?=
 =?us-ascii?Q?WrZz5p1q1SOT8vaU/i3AcKYiq5exAJIaSuJEOTCx7FPkSDj/H3PBZzQjD+wk?=
 =?us-ascii?Q?XziWRQXLgpPS4d1oBSs6/vh8X+YggnH16HCTj4u93w1qBYZVl3STcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9lA5Qn6lttVTSip0aoWd6WPcXxZTwPcKdUQAj44LhOtJkCoLNISiacQgUA7?=
 =?us-ascii?Q?j7wgiPFnOB4RiOMHYknVGsQEjZnAeA/9ibBmzsJ4tFRGHUO4p/dj/kfhAWDd?=
 =?us-ascii?Q?mmzaING4I/BFeJp8+dODWAFmrXZpetNYtpxE7g7iocFzD+TjJe62VLH/fr3D?=
 =?us-ascii?Q?QYZVdy5GxGTVacvNL+lPkSVeQXcGRCr/dlJTEHlunkpwK12I4Hdd57phxwJ1?=
 =?us-ascii?Q?aH7ChIHe/Q1/pZ4laTGv9sLszIlnnNUSFeW92tRP0GvRzUGUUs20WkYw+Usa?=
 =?us-ascii?Q?bPS21AZKBcytVw2kwOL63NUKhDD8ESNVZ0WSzBVMeNjJ+n0SPR2cR7QRcxMR?=
 =?us-ascii?Q?NkgDXkBMzM/TQkAOT95GEhhyXsPFQ9MsLZuYAGxMnNmls0PN/JJoJJWyI4T4?=
 =?us-ascii?Q?H46LGxg8AEkzlqUwIYrmeZgc8XmEVWdDAzmKeGpBpuRoEfxMxfPVT2AXCUwh?=
 =?us-ascii?Q?tYBKjE+R9RS/sX8AhnYLaS9k40y6Yms7jRrwKYDf/n84s5VIEGpXmdMGyRKs?=
 =?us-ascii?Q?HoYKoY1COP+30ql1S3JSvgwGyRfU86M5WECDjt/GL69So+3PPCJC48te23tL?=
 =?us-ascii?Q?w89KXUkW6Cmlv00+pe44s2uN9BQONl7yMFQXtWPbaOtpgk9GS9tgm5mXIXtD?=
 =?us-ascii?Q?5KWSLXiExC2HiiVYeuiE/2o0Jk4kjPJJ6W7/Si80hBTYpaq625WGJW6TP5I+?=
 =?us-ascii?Q?6lo2HlCuEeUGNGgyETIXj06Ece/DAmncmr4/9CRawGBEng/UIQ/srAigyMzA?=
 =?us-ascii?Q?V2j0QXPTWsC7zpwmb6waPJNi3ilHWV1RRYWr7ORGvYp5YT/8u9UAI0B1zLXp?=
 =?us-ascii?Q?l/ybebSAW8QWK4Myl80LKVb/cT+HIK9OOqHkBayIdEj7SONIuGY8VKO7nZZ3?=
 =?us-ascii?Q?wsBBB8CJPK37YBfEKvUwBohdIQ2x3OZHGUnBDjeMXCc+I7TzykUw52RTUZ0X?=
 =?us-ascii?Q?kZ8KIGBmE3gNvBchu7GH5hjU1Wd81ni0hKADZI4tqmKSw1IDLZKql/zL2IMv?=
 =?us-ascii?Q?NQoMMdc9nzLtq/GCKJwTKkiKhZYVEN5E6W/bF+x8gCW0d7QlUFnCWwL9V/5h?=
 =?us-ascii?Q?QTU7CeQROdJwzOMtwJaMOgEar42amdRJU290yI4wx2fl6OUT7B6lWs8ER3Ii?=
 =?us-ascii?Q?5lcioPnnj6BFiPNQbp2LcE6BCP6s2jzdVPDhAabicEM0/KBSPaIZMlJdWcSQ?=
 =?us-ascii?Q?UoDZf8EWujdlJkBkbnYkHSXcBefsi+gFfopNHH1hfv9wSmOwefAei6oODMOm?=
 =?us-ascii?Q?+5aMhmcvGQxYPw5XsP/KYEiQb3gNOQFbIeEEUo4bLL0KDoVElxmGZwGMa0uO?=
 =?us-ascii?Q?bbAy50sxWxyHJv5NjO/jVNqvo35vaBsx1Q4Bpx2W8wudKTPYZnzwxzF4GOTy?=
 =?us-ascii?Q?OvEgjBh4nbqXsAvT6++CPPoKy4Bv58N9JcQ4YX1MdLQZ0Lb8jdscBDIhCPm2?=
 =?us-ascii?Q?WRF9tBc3/El07cgOzkVWkazsGpNr84G6Xdqqp53Iopbv/UQs7SFitugRFDpD?=
 =?us-ascii?Q?1ft8W48Y1X9kt3Guq5fU/KyKHPXy4j8CVThgphA4iTPWeoa0MEkL87pTTNFl?=
 =?us-ascii?Q?k0gbaZmb5jIYSdxTqJYH1HWI2wJ4GF02drYitzlgI49nJhrvNxmL2f2iDZVF?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb7da10-741b-4a95-72e9-08ddc440fc36
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:54.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZYnl5BMhaK0Q+wibYyOeLw538ZilHbhzN9hw+fLHyS0kK2x3SkOqL+KKesQJNwalxllGCfZZAX8DxAL+BiC4g==
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

i.MX94 series LDB controller shares the same LDB and LVDS control
registers as i.MX8MP and i.MX93 but supports a higher maximum clock
frequency.

Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
be able to set different max frequencies for other platforms.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 665053d0cb79d..4052e1ea9201f 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX94_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	u32 max_clk_khz;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
 		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
+		.max_clk_khz = 80000,
 	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.max_clk_khz = 80000,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.max_clk_khz = 80000,
+	},
+	[IMX94_LDB] = {
+		.ldb_ctrl = 0x04,
+		.lvds_ctrl = 0x08,
+		.lvds_en_bit = true,
+		.max_clk_khz = 165000,
 	},
 };
 
@@ -270,8 +281,9 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_mode *mode)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	u32 ch_max_clk_khz = fsl_ldb->devdata->max_clk_khz;
 
-	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
+	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 * ch_max_clk_khz : ch_max_clk_khz))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -377,6 +389,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx94-ldb",
+	  .data = &fsl_ldb_devdata[IMX94_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);
-- 
2.34.1

