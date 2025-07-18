Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F197EB0A3DD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226810E991;
	Fri, 18 Jul 2025 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Wy5Q1LUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E17510E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS8koV2EcQC12ZB8Wmgp9Krpi4qYxAiT/ujS0U+LWm/ie9TulcAN9TlRotA06H3N+pKl/EmUwPyNpcHq6xOPuQy5ipCT91sO6pmAcuzfjK4WOzRd4BHzcbiP9VGpNvI3xohSERYvI/XA73pjtcELFsA5l80odta4SXOiwcvY6r+cRr9pLF/UnAjp110rcJvror0BQSEPaTjCJbyQA5dKqST2HH3/L2f+Lr0aSRo5r1iB/vH1wp/qIIBrNjcFylX6QPN1dufXFh91EgRalUNCNvUA3r/4+IO2EmirKsuAmWHgoeB7nxlPQ/4pbG57YMs7FY/GK2FkEGE+2F59GT2P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6prTOIPFdvWx2KsJQ7MU7VIZ3JWUPpUMvGCfwX2rEE=;
 b=Mad5Sl+vUeGHxmAE49dxmXbhTzw3w58o9MEfJK0bIayIn2Mj7bgwhc2BDY1UUad9f1lv4pzgIxR6MJrK8Cf6PQLH9Pv9084ckELRYgOR0JF28pqagjgKe8kyI+N/0PtqoftZtIFuX5S0GIaSWiumqWQmx/j3ExPF4FIKXZeUqlUt9ibCvUomFZ9+tQEeQhwplLas1SFPUAaU4WIAUmoXvD1jV0Im57fbJzjab/93caTB0QH94MzzvL3CHmUGTXamCoiteF5XZ+qUDUIq4vhWcFEEz4Thnt0ygAmfNRAGlm0B3lSm2qEhHbX9ZERmllJf+3/AZl+lUttIBdLKC4wBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6prTOIPFdvWx2KsJQ7MU7VIZ3JWUPpUMvGCfwX2rEE=;
 b=Wy5Q1LUZokfs2ICVD9P0g3EIi2tT1xt3SwCibGAPJPve2YMd81tVQlIqGQ47+bB1xNRlamGXbDVKkocMrZWDTfX3e8+o3AVnEZ3HsdlN6m32+GBfreBqN50G8DLXp8sGCe6mNu5VG0mGIQ3DraoK0n2BI8+3TLDLN4R6RPsUnB4sCZBogJXebp/YfqP45eL2ykM1uacYRmTjx1JLRcP5K1VScIql6+KfF1odOCALrBxbjTlaz7veflgPQMK4oMrH1NeVX7SesJXpT38NEM6LPY8pJBbFcYo1w+M9dZEbnqiHWiy/YJWsE7wOc9g1ncFoTfinu6rgI8NarlmPCaZlBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:12:48 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 10:12:48 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Fri, 18 Jul 2025 18:11:48 +0800
Message-Id: <20250718101150.3681002-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f01a613-1af3-48a6-44cd-08ddc5e3a541
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gc9dQENfUtbWhMmMKQoQTSXNYcrVosytoIDbEIWmMU2TLNd3eaWUAT0WQxJp?=
 =?us-ascii?Q?isi73FEBE17NA9/CmsZDnwAVfmYtVFJZ55UlLBlKMYGmfBt/eIYJaQwFgxfO?=
 =?us-ascii?Q?aSKReY7faHVpW/dD9v1r7ODwL1xTzu/ewfR23q2nf4RKdeo8DOO23iMgDWnb?=
 =?us-ascii?Q?cBZ0YEB4XGyHh5qwCM/yd/mEbzeByhFB+jw2TI1uAoA2JND3DosPTwTBrH7t?=
 =?us-ascii?Q?w9vp0GPgzpS9QaW3mY5HYagJHsVhZvnsBaya8IuKnuS4Zz9CnJSCShGqyLuA?=
 =?us-ascii?Q?HmhUwCU8ccfQxFn+m2a7FGaCElzV/fwjZ2OW+m85MaEnq71AWllOxF5U4QB4?=
 =?us-ascii?Q?9yxjEbipVhauvATq3ZD+mh+KmSwhekUbdpGpG4iDEgxh/DrkYe6muwEiH2s7?=
 =?us-ascii?Q?yhXymx2JzvXNE5ISSYkduLq5UTYPjPkA2pNG6leB1vLMSCrryQt4LI+ONM3I?=
 =?us-ascii?Q?yLAPSg+5ooXKb4OkjL6mIiSDOb+ZPD6Aw7hqWCWx0l9rnNgvQwUCAXRt2Jva?=
 =?us-ascii?Q?kQZ96twk0dOvyaixUK2dtoQRlgQcHCnogDCwHyUWN3f7kSB3rl6b4ykD+T2G?=
 =?us-ascii?Q?xx64KvPSxpbvNTinmYMMjtwS4uZP9Tu8ZgsPVvY48LqIBDv9LKQKfMjQ/XXa?=
 =?us-ascii?Q?yJpZVrgwnoJi+q0tbMbmoinhfvExjKMidkN8Y6IGo98C/BA4J/yAzwqccxGx?=
 =?us-ascii?Q?nTyB56g7MRWnVCRhiVn6B1bokb8QCDeQqCWWsFSrJwTCAGktqahN1ggcp8yW?=
 =?us-ascii?Q?Pj+Swy1Z7ufhhdQNjlL9zQ7qT0J90C3cneqU0C9Nym5doGVVcNSmKKh6LRTQ?=
 =?us-ascii?Q?3/5IE7n8kY9KSoRg1MyzCeCbMnVV8k7hLTCxVFYi1iCiOtTZzQqX++Eo3RPT?=
 =?us-ascii?Q?vEo29vZXVCSmS6f1Uy9LYIwIex5YbS2kND6x81grshsjgYiOD77NB3IRNk/W?=
 =?us-ascii?Q?8IfgGPz76dAJpN6Z6IFClvBnvh1AwemJMmsHq7UurajdIth+UcG3rrocEPhv?=
 =?us-ascii?Q?0DDhwY47v6od8e+Ht+uvCPxVJYNujcYc9QLpOnSja0WaKbuyPRQ+bgpyL+Hf?=
 =?us-ascii?Q?2kuAFFIzai4zWFcPyEFomk+wCfF7d67MbMYjuOhcmE4wwrvrXmyZ/p/jrFLD?=
 =?us-ascii?Q?p2fa+MTTrMjkDt8me4psje0eDncAGcWd/hnPXjrj7Bt1Hmtp8Kmw5bYcxxhM?=
 =?us-ascii?Q?Y6q3O2FTz/10pYI/um6xdRTqSYhcbI5n10P41sgjbt1aB0L2Djy7lQc9eKRm?=
 =?us-ascii?Q?e7veVTPZdKM88zSA9wDRAaETWUa8uhd2xO6m8kj2iIXXyEfp+BCDFZeRi5AH?=
 =?us-ascii?Q?c3sIn3x3Wll5C7TYFYBGhF7CF/JCbzDtUOVXjiKAuX0RMbtsxT0tqSPJBaIz?=
 =?us-ascii?Q?32bOhMzUsY1gX6E5OL/ZT32YVHqgQdTFDPb/TVaq8vwrPIlvAgaQFU6TI1tM?=
 =?us-ascii?Q?bn5pj2AHvNPYN4lgbbPH14LApi+wac8BhcACFYxEpGWUkDk5Wc3nY7e6nEFx?=
 =?us-ascii?Q?ZAmpp6j21NdEAy0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wv24vIwHYeDUiBocxKB2i//RInOdEvHl3gWPMCtAqTk0FXFh3TSaMtS85CI1?=
 =?us-ascii?Q?32A1p+YP34fP3DZKQsrsEy6UasATGen2ACpLDjMgRZ3s5XuHIgEDFC9Qv9oG?=
 =?us-ascii?Q?hlvfw8lPBl244ctcY8xrYZk3oJxuINe2GHMcCOb5ipWPOIE/qFvSHWk1gL4h?=
 =?us-ascii?Q?dSbfHcF5biahS6uh+LeyYl38GrMbyqB3M8cc4D1cr8D6+Tzaf1nhXtnbsypa?=
 =?us-ascii?Q?agKrpWxn+CZzIw0KZfrpNA+kSnRM+n+qSFFWGcC4H7eCjXlICbk8l8Bg6ajA?=
 =?us-ascii?Q?2stzy8fqVwFZMV6gKmT1fItS4CANl6jG5jdVkONvypmEtQKy+gCb2MqsJGP1?=
 =?us-ascii?Q?QAdyEvZiMMZVzLLQ6dqMGMQSoLtHKBNIAR+cGCHZZ7RTyD5BjDb+rw+BTAN/?=
 =?us-ascii?Q?ajUrizJJLPOzwnUbt3xmgl50aP2oOAKZPawUQpmgyh5y2gRb3vRdtAsccKGK?=
 =?us-ascii?Q?sHeUuY8uNqPyrPiNBGlPj0qQoxEejpC8QO6Rw1CYYR2Zvl6viKkQhmkhr1yU?=
 =?us-ascii?Q?W9g2kjANYp2gXbJnDMvTErRmtEJ+hCMDAxnXPgU+UbqIDTJV8Sj3ngH/NDhU?=
 =?us-ascii?Q?70SHWeLPtJ88bZ/twmJYCSNKEzeAfCYq7UIWVnzMGnRPm0u/vkMQ1f3VFQ4a?=
 =?us-ascii?Q?og2DdkjESpZ0Rh7/BPN3qR/8OWxLKliu76jYHK5W2zAYgRgsGLsr4SI4D58v?=
 =?us-ascii?Q?ob3efIEHFe4H5tsPLKeq7FpPdrG8YPo9FS8vAV7FFwNUcuhCGLpnFTuRF0pn?=
 =?us-ascii?Q?aNdcn9RPLTE9G3qYKFftFNJwZYR3f1wHRc2iU/X0BCBfS0EfmiYL3lOeDNrh?=
 =?us-ascii?Q?5RvGKJtOzD46pHCtBaggFhurnDzYLNeouI50ctn02GKd40g3a2w1v5KbnQiO?=
 =?us-ascii?Q?xhGrzrXiBJehYLzQI6TMXNibIOf3Iu5YPEXbIQuaKmhBnQiFS78R01V1kEnT?=
 =?us-ascii?Q?zzM6WA1994tmIt8BMpAJgX0Os9+h89vraBhspvF+eiBufgbRFISVdQGM4z7t?=
 =?us-ascii?Q?pMWHfegj4qgmoObGXeys1teSni7bXh/ZStAF3zona/JlzctOQe616TWayVMW?=
 =?us-ascii?Q?JTOC7SDB8LZLiUvSmWfDZeoNJqp2R9myYohUJj29vHXIHdtAxFJnYmrv8de7?=
 =?us-ascii?Q?DXuk12TL9r6Cs1u4rTyOX6spxXGubivkrrK0fhqa4LGEXuOTte8/Uj+OV00c?=
 =?us-ascii?Q?1kG0B3YbO05jGPd6ECC6Fdf+wLYYkAxZEJr92rMacC9plpAWe1YEWb9SGvcz?=
 =?us-ascii?Q?rTSsInmkUhjTbPoFSIwQyjyUAZGz70N1b66xHHBFF4SrABWDKm3oCRB9X3rL?=
 =?us-ascii?Q?nN8J3hzSj9s10x0s1KkICd0H3EeOnK71C4vCvd+Z6UD8zG597btpiW74jWl5?=
 =?us-ascii?Q?jIrwVBFX8EMvgbOZyyC6xpf2JVG1U/J+KWi1Y7tr3eIWK0Ss+KM/lPQ2OCF2?=
 =?us-ascii?Q?C/yc7P6yiEjXtX5yqV3zvz5Q+YAG8qf9SiQNUc7fLJOOyIfa1joLTrQzrlYP?=
 =?us-ascii?Q?r+VaGUNfv8NK3IARtYb0icTqAkbNBaKDSAqQ8UhMFsr3pkGQO0MiGiLDwBEW?=
 =?us-ascii?Q?D1BRQ8qEjFExBDb3SO7T5MQS+7HDKO2t7U7EOzIa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f01a613-1af3-48a6-44cd-08ddc5e3a541
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:12:47.9487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RBOWovLNudv8Kg9Ef48bUcX5iHfBra10dBGRr3X1m+nrijTWFW3x343K0nfgksz3tTurlIswglkXvq+3vblSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Data received from the audio subsystem can have an arbitrary component
ordering. The HTX_PAI block has integrated muxing options to select which
sections of the 32-bit input data word will be mapped to each IEC60958
field. The HTX_PAI_FIELD_CTRL register contains mux selects to
individually select P,C,U,V,Data, and Preamble.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 134 +++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                 |   6 +
 4 files changed, 148 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..d95fa84a8dcd 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -24,6 +24,13 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
 
+config DRM_IMX8MP_HDMI_PAI
+	tristate "Freescale i.MX8MP HDMI PAI bridge support"
+	depends on OF
+	help
+	  Choose this to enable support for the internal HDMI TX Parallel
+	  Audio Interface found on the Freescale i.MX8MP SoC.
+
 config DRM_IMX8MP_HDMI_PVI
 	tristate "Freescale i.MX8MP HDMI PVI bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..8d01fda25451 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
 obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
+obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
new file mode 100644
index 000000000000..f09ee2622e57
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <drm/bridge/dw_hdmi.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define HTX_PAI_CTRL                   0x00
+#define HTX_PAI_CTRL_EXT               0x04
+#define HTX_PAI_FIELD_CTRL             0x08
+#define HTX_PAI_STAT                   0x0c
+#define HTX_PAI_IRQ_NOMASK             0x10
+#define HTX_PAI_IRQ_MASKED             0x14
+#define HTX_PAI_IRQ_MASK               0x18
+
+#define CTRL_ENABLE                    BIT(0)
+
+#define CTRL_EXT_WTMK_HIGH_MASK                GENMASK(31, 24)
+#define CTRL_EXT_WTMK_HIGH             (0x3 << 24)
+#define CTRL_EXT_WTMK_LOW_MASK         GENMASK(23, 16)
+#define CTRL_EXT_WTMK_LOW              (0x3 << 16)
+#define CTRL_EXT_NUM_CH_MASK           GENMASK(10, 8)
+#define CTRL_EXT_NUM_CH_SHIFT          8
+
+#define FIELD_CTRL_B_FILT              BIT(31)
+#define FIELD_CTRL_PARITY_EN           BIT(30)
+#define FIELD_CTRL_END_SEL             BIT(29)
+#define FIELD_CTRL_PRE_SEL             GENMASK(28, 24)
+#define FIELD_CTRL_PRE_SEL_SHIFT       24
+#define FIELD_CTRL_D_SEL               GENMASK(23, 20)
+#define FIELD_CTRL_D_SEL_SHIFT         20
+#define FIELD_CTRL_V_SEL               GENMASK(19, 15)
+#define FIELD_CTRL_V_SEL_SHIFT         15
+#define FIELD_CTRL_U_SEL               GENMASK(14, 10)
+#define FIELD_CTRL_U_SEL_SHIFT         10
+#define FIELD_CTRL_C_SEL               GENMASK(9, 5)
+#define FIELD_CTRL_C_SEL_SHIFT         5
+#define FIELD_CTRL_P_SEL               GENMASK(4, 0)
+#define FIELD_CTRL_P_SEL_SHIFT         0
+
+struct imx8mp_hdmi_pai {
+	struct device	*dev;
+	void __iomem	*base;
+};
+
+static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
+				   int width, int rate, int non_pcm)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
+	int val;
+
+	/* PAI set */
+	val = CTRL_EXT_WTMK_HIGH | CTRL_EXT_WTMK_LOW;
+	val |= ((channel - 1) << CTRL_EXT_NUM_CH_SHIFT);
+	writel(val, hdmi_pai->base + HTX_PAI_CTRL_EXT);
+
+	/* IEC60958 format */
+	val = 31 << FIELD_CTRL_P_SEL_SHIFT;
+	val |= 30 << FIELD_CTRL_C_SEL_SHIFT;
+	val |= 29 << FIELD_CTRL_U_SEL_SHIFT;
+	val |= 28 << FIELD_CTRL_V_SEL_SHIFT;
+	val |= 4 << FIELD_CTRL_D_SEL_SHIFT;
+	val |= 0 << FIELD_CTRL_PRE_SEL_SHIFT;
+
+	writel(val, hdmi_pai->base + HTX_PAI_FIELD_CTRL);
+	/* PAI start running */
+	writel(CTRL_ENABLE, hdmi_pai->base + HTX_PAI_CTRL);
+}
+
+static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
+
+	/* Stop PAI */
+	writel(0, hdmi_pai->base + HTX_PAI_CTRL);
+}
+
+static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dw_hdmi_plat_data *plat_data;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+	struct device_node *remote;
+	struct platform_device *hdmi_tx;
+	struct resource *res;
+
+	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
+	if (!hdmi_pai)
+		return -ENOMEM;
+
+	hdmi_pai->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(hdmi_pai->base))
+		return PTR_ERR(hdmi_pai->base);
+
+	hdmi_pai->dev = dev;
+
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 0, -1);
+	if (!remote)
+		return -EINVAL;
+
+	hdmi_tx = of_find_device_by_node(remote);
+	if (!hdmi_tx)
+		return -EINVAL;
+
+	plat_data = platform_get_drvdata(hdmi_tx);
+	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
+	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
+	plat_data->priv_audio = hdmi_pai;
+
+	return 0;
+}
+
+static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
+	{ .compatible = "fsl,imx8mp-hdmi-pai" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
+
+static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
+	.probe		= imx8mp_hdmi_pai_probe,
+	.driver		= {
+		.name	= "imx8mp-hdmi-pai",
+		.of_match_table = imx8mp_hdmi_pai_of_table,
+	},
+};
+module_platform_driver(imx8mp_hdmi_pai_platform_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index a56a3519a22a..9ca70ce80cc5 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
+	/*
+	 * priv_audio is specially used for additional audio device to get
+	 * driver data through this dw_hdmi_plat_data.
+	 */
+	void *priv_audio;
+
 	/* Platform-specific audio enable/disable (optional) */
 	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
 			     int width, int rate, int non_pcm);
-- 
2.34.1

