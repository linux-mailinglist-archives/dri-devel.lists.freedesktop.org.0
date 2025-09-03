Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA3B41F0D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69D10E7EB;
	Wed,  3 Sep 2025 12:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tPOEFL7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFFC10E7EA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhos/zlF3bVbYzDQwiVeMXMneZb+15bR6V7l5Ev8snEE3uxI/mt4QGOQjky82/+fUyv/AZrLJnuFp5Udh4Bl3SwclENZ3aN0X50xjmDNapqpNatyrNTOWby4+5wD7cg/0JdvX4YnY/tbu3C0sIDAxIk10vz64eoJIrlUe6U8D4ycCgFzmfkESim71eFJIzRQlvk3zPm98jI21QqTpEA2JQx0LXcQRQED1hP0/JG859WkEVtIfarYIYJeZxK9S4Efs6b3xPpF33cV7CdQUdVuWvjMO26mbDMf5wzyxKbT8Mvd3Mpt1QVMKkiqS0WMhDbvAFUk4XoHac3rv1kY54w+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wAqzozR9mQY7UCjYuq7xSSmQQkrUEiQKSdwY9ILyag=;
 b=yqBW/NcAWzUwJBhDE5mTb3be7sA3kaSBlWL4gikX1vySlMaginoTbS67FI9nmCOKym4ZgxUdQwya54Gu+g2r03lGDKIPtiOZ+qFCyndsjkKgkiVQZJQjqNsO16hYjZr7MUwfqOGx2kFI+33bdiiovRM+QEW2TgIq9wojOLRJrcnWg5Zg3eInIN7ZkRhyQCZqNAL/x6tBKs18EfV4vzkIOPn58+HhJ8LIbvAsE/6bp8o+HZnaz5u3b0X6Yzq3dN54fDrw0UvfZxthqZGu6m6TfJMjTHIKbpdzvQN7o2jLS8VuY+yQWw1rsYlvZm6Lf5X7rzI+MnENQCUHChfvbvJMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wAqzozR9mQY7UCjYuq7xSSmQQkrUEiQKSdwY9ILyag=;
 b=tPOEFL7psP0bI/AR0mA6ydrhJgDacfMCpVp8AbThBmMDVhjekmxSQtz6Yg+IzXIaEWCx6HAvTmJdB52tvz+0cgyhhHXN/hPTAUfWcys8mHs6JjVpdTMnVnzUjjl7PoSNqCVOnwf7Bnrc9b2PGGQ07ezq7kmTw74ryV4vu/evP8HZBP2ctVGo2kNGo58hdLZd8VxWZsPB7q1xyC9wn0ICpfEdEUyiIYQaxtBSVnKf0nVWSDyYVYfbWYWSLSya2Id8Swgx29xS8eevLb+r0ns6xkS013hK5V2TpIC23FOmwO7axG9x3YRyhhuAvqYBOyfypZVTXYIOhuUe5z01D6ZJMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:34:01 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 12:34:01 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <frank.li@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Wed,  3 Sep 2025 15:33:21 +0300
Message-Id: <20250903123332.2569241-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0381.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::9) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eda89fb-2a76-456d-080b-08ddeae628ac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|19092799006|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kPdVHW9uiosuW7x+cIEwtJdrOVqbEaLtU5PMSEtxJfehC36xTLvUe0NFrIYf?=
 =?us-ascii?Q?f1yQ/NOSHRZcTsmM6+jF6gBIVpBWdSLbiNmriS/OuFoTfaW0Bm1ZnXi4dkxk?=
 =?us-ascii?Q?HH+CBEFmnnaSzUZBK1SL7KmkeFgU6ovWn1sG9yK+d12ztEdAzvxYFiOrUehu?=
 =?us-ascii?Q?L8j9KrkqzLqOJ+1K4gZ2ikcMQlKrO8R2ZqZMmLG2EwBtI6VO02vnCKWLxA8W?=
 =?us-ascii?Q?4eKzBxZt5CvFzYcQxoTPsYms/UHcEmnq8KdAuMKwXECYc6vY0EJjwG8b4hzr?=
 =?us-ascii?Q?XnMF8G9vDsozAlKBZDIBiSR5gzMvqGSm/P3KXbUcKgSNNSNNhsPaQ+RlAXIA?=
 =?us-ascii?Q?5QMRsN0dtIQ2pn4FblZ76wui3PJIAJNimLxDNXMcOtDw/0OgnvG2ArK/zEIY?=
 =?us-ascii?Q?aZ0qJMESEucb7dBWvaLoOz30TuiE5ST5ilVGJuFvsyLbdPeGB2q0NIuyKU5y?=
 =?us-ascii?Q?5txeX2kWJwy4vDwYzhcetLOL18yJrUGd7QcZDY/mUjPA0BoaMM7RAa6kiUl/?=
 =?us-ascii?Q?0mdInzTCIZjq9b0urnnqaDXSbn+drU56Voun4pxmsm+yHGrnBExd3kUSY+Tc?=
 =?us-ascii?Q?Z9sW5PdByt10HdaY2ZWKbezAgIm0mimu4Fg3j19VMR6RqsOpySP23M4q4pbZ?=
 =?us-ascii?Q?N/DyrlBZPFLwO4hNt+sjtUiOmKeNMFJko1ctDhEz73xTdfDHCl0bMSNN8+nc?=
 =?us-ascii?Q?qKXBKMrZH2ipg6wf1auV1U84VKDxG2dQ4d7yaolMUDwUxRrww1Tk43VDbq6X?=
 =?us-ascii?Q?fgJ5icUB6oGdsYb5ZIpwFdLeRjAPQxy6jUgmht0cT9ebPjIlw+luQwabR7KL?=
 =?us-ascii?Q?hAMO0dsihufp/4E+YZTff0G6KOw5w1g2lk63tvf6XZFpLK7tj77W6gUnmwT7?=
 =?us-ascii?Q?2uL6nq3tSEJAoIro4zDFDzIJu/oAtC8WbsdoJ786J7oWLQ2PlyC2Ze/4aJVZ?=
 =?us-ascii?Q?ADckLV7nzq2WAC0uWwCZZZJYbNF5QvSjLsb522EMSddfFh3vh8GvPBdCJ2yC?=
 =?us-ascii?Q?VdQKUKiyTgiXjUXn24MVb48pXNfDLlfoYj7mEXTb7QN5L+gEY31ZVDb2d8uG?=
 =?us-ascii?Q?f4Xrr5kNBehjj8jT0crwP96d+w8rymTKCcDFvGAEqtVWEOnYLjFAS/dO9H1S?=
 =?us-ascii?Q?4kBJ80LaOB2aKcyDqd31opBHKYamMfao3m3StLtPBw9J48fG05yD4wyCBy8P?=
 =?us-ascii?Q?xKli4ZU9SSoSPL3FPJVQ0NSiTY6jE/MgxDhJHlcSDUWstl3FRSG3oAzfFOoh?=
 =?us-ascii?Q?TwjZ9yicNhyLK6O6Ywg/g9eOkh5TQk/FwlcTreWcFS2DWQUxtCPC4HqG6Oap?=
 =?us-ascii?Q?hs8I57Tphknb/m6X5twpWfEvqG/iXft5c71MdbBy1wVz11SXiV5VMearEfOU?=
 =?us-ascii?Q?CPeAPgPs1dLyzThaf8fwIbuQiLiFrZtohBg1yTZyyT1FcNEwu1giLjhTmTxR?=
 =?us-ascii?Q?fnSsjRt7hkBvgXOTKLAV7M2cgSAKd5dT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(19092799006)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVrlzz6mH8GEp0Q7/XphPF/XPP5/DDbtJmv5nd4gmB7HgarbuzTRWmy7w4YJ?=
 =?us-ascii?Q?s6pB1TFj7UBYBnjcIfMT7wQdiySW+RBC09//TNbmzV0znlZ7UyiErrXSJFuA?=
 =?us-ascii?Q?I3OQ2IU6yIvpzIMDMtb/YbFjjgW+c2pbSHeSJ4pDZVaGWvs0B19g+8wZnfOW?=
 =?us-ascii?Q?zxDx0G8ANgPO2pc0a5LwBhVcDEZCreca+H2AHsR5kWEUnM1A2eNb3oUN0593?=
 =?us-ascii?Q?mMmozuQ2dWXNixCI9KgGfCF/GS126bjx5djrGOIfJMNQOt/CePr7vCM0ZtyT?=
 =?us-ascii?Q?ZzaZum4j/D9Tvsr4x9DSxoeIxD9fcK3K5FoeH3MyHNdEQAAMEqKcOpiU0dtN?=
 =?us-ascii?Q?2OXRsABMQL7L8u9Ftpb3poQo908wU2ep+KTa68lvquiep/kWsyjAjwoJxHAr?=
 =?us-ascii?Q?VxLUcayxLkzzlk0Xn+0idCtQFFDtMCk4BOV6ktL9hoGfiUvi1GLGpWmZ4rP0?=
 =?us-ascii?Q?iHAqhbhJfUIPbb4gIQk1+vvEZ9sJTfCj+gxrxV0veoszryz7QeGc2Sjz9FiY?=
 =?us-ascii?Q?c8yLsBWdi7jl2TmXucw5ovfFeToFm3UIwvEgq7AZgkSjih49rC3dMjPWXQXG?=
 =?us-ascii?Q?NTR+D70Co26iz3s/NywyTZa/soSWQy3FnLoYLFiwJ/CamikTWFZu0enj7LJi?=
 =?us-ascii?Q?ihnncFQzNjooX1u4K9C82KvG/7M3jQyQw3fA/K7ce8rcYrxH2aCo4j8wd5cL?=
 =?us-ascii?Q?HUnwEuruWQ6kGGU6SzIhJjCB/6A4tWR9NO6szmjRLNQVYXP/MBFtoCCmsGqQ?=
 =?us-ascii?Q?0he69p8jC5ha1iOt703O+lH0uIKObAc5oC3DtYKyoVRwR1SwlrJSNyhQiVI4?=
 =?us-ascii?Q?IUpsRT0O3igwACCxGvJ5NqP7BUppsdbN27nwhgx0ntpwt9qmQ7ZpMygfQWVz?=
 =?us-ascii?Q?RZ10WinsjO6nldoa/2jyNh0DgguNJ3B+gxXnyGq9UmaT2miWR13OvqNA362r?=
 =?us-ascii?Q?aDhlCMZVKh9yw8J2vAV8vLgAfo5070VLzeM/pFmn3JY41a38ncSIgppk8EP5?=
 =?us-ascii?Q?qpw1sltx2EYyh/VnvIitVu0Vw6mxsFmOfANw/gnC2AcU+56cThaaA55P1EdL?=
 =?us-ascii?Q?lZ4q0kk5+QhziQLLjxSgLaoBYy3zatgjd94/YDlB4pdu5duIlxrPC0kZq0ep?=
 =?us-ascii?Q?Z98ukLXaLa1MWYHS+X79MZw82Nrn356ssEAmZsKyRW2aePEHxN/Wdih9w/Bo?=
 =?us-ascii?Q?zJgMk61dIdyYw5bj3ylI1tsLM3/Iv8g3gyGz4X38Oun5yZMHddjOw+u3eoOL?=
 =?us-ascii?Q?FTeutBMFby5zCiQVrDnwdiaAY/i9+yfuJSL3YVS0nhFtEMHlILdzUg7fYe7x?=
 =?us-ascii?Q?QC5B+T6lJJk+50ltoR9tdR4+Z9cgJonv22gRpM49M7U2EoM06QkPf11ZeKUm?=
 =?us-ascii?Q?6VankI7Wi8p6tnJE2DsHWe8odrzmz4RflpeiDGpvGYRZPNRKDTQ/NshVhHNr?=
 =?us-ascii?Q?D2g3zBREZGEI0nCqiLWCXSR4F13lX3vt5T3hUpig+1tfJO/Snw+cEv2MSPLk?=
 =?us-ascii?Q?xlefROn+wJ5SS+/ShGrIhMRxYr9ZXtWlF+ipbJaZ4Yu8i8+jIKZYF6Tw6M5s?=
 =?us-ascii?Q?evrWMorcRdpT7mjGGFJgelCw3HB1syCOF6+Cmg8A4FeGwmtDZC42eDJ1xtGx?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eda89fb-2a76-456d-080b-08ddeae628ac
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:34:00.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euSymTbyOMYWuiEE8R2VAuiWS2CNWk/g8i8jNFWvz+hRGJRMDBBFDuxJ/xjZ2bagQF0AyXj9TclvF/TbBdfnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
2.49.0

