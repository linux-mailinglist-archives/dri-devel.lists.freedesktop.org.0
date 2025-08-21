Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F52B2EFBB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6B210E890;
	Thu, 21 Aug 2025 07:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FkYWMNbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE9E10E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idU/0JVlzCL3RZt2hH1ZiBmbsppm9TaRtqjmCglRZIouA44Yopr6QaboCXrJ5Ikj32cTDczwDpjh9tM1leawx6qyS22v3baPLM6U5FH16txohGpQ7SM24AmUVpwkpo32PbaVTLaX9EaMYE9QWrirrTDqUTtpHcEr9DP9xZyfB1Ax+UUnQn+iFxRbWQBVHgg5mQwyjEeH70rmxEPFLpOxTBgM2hz7W+8Y9o+Mm6xz1nwod+D9lZyTVkriYkzvE8G65jU32vR+wu8sYMG4gDaNAh7A8+W2ap//4HRLoJWz/F8ex2aCIPkBnnQR6iV/oKf87T9LRagZ27D8wvei/0gFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOW0QiWFlZg1FlGWJIAh3KOM4jLl1sCBQmUFGePGhC4=;
 b=sX2QOYzayNMxcBQfL8UK5iYX5sMn648FRv3u3jvJvpcLsn87F0a7nzNc4ay2/svSddzlHi/uxOew83mFyxTejVQhStJaQv30RUBs0JJ/fZ1W2CRrEGw+V2dWtQdNFRVNWpyenWjMSgllDK/WA3G97OwfGFZsUCV8SUysjBnYS6n8cxpd/uWWHbHaJuFaX4gS8XDY+k35+I6Wcf6kl+ljPMFs8MU5R1jsdX0U72iCg18UZeIBkO07JD+NQXjWGLMkZM9A9qbW+bFys5VV+SZZeUomXTG427fw33ERfRagRTtTUHoroGdbEIR6ekz/SQxjRXY4/V+AG/2ym532gOiRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOW0QiWFlZg1FlGWJIAh3KOM4jLl1sCBQmUFGePGhC4=;
 b=FkYWMNbcR7JZyALQ8X2o44PtGWnMZtB+WUQotlZ7V/kjw0vNic7tUhvCyHxvjAABKfcRCZOG8lJ9iAQye1hBcKPQFwfsi6Hct6uIkuPgv61XcZ3IyFbXc88+hHv9p0iFv39kbT4tT1KoRM7gCguO7xbw4nheox2r4jiLSIjmntFX1A2hbETWnJ3w/01BPYCIqbvj7sxEtwzlSqiRdxsLlwogzZyDnvxOneiP8vOUKOSPJdwxO/5qq+BuADrk9sIGBsMsQ+BYUgssGsq0Z3Lk7xwI44UtZCUCyigDQjOwDUu3V85MNu5LJSwBDQiYaMZAvsazZX3mexT/YvquGNak6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10607.eurprd04.prod.outlook.com (2603:10a6:150:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 07:33:18 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:33:18 +0000
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
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v5 5/7] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Thu, 21 Aug 2025 15:31:29 +0800
Message-Id: <20250821073131.2550798-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10607:EE_
X-MS-Office365-Filtering-Correlation-Id: bba793fa-b89a-4708-f6c9-08dde084ff2c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eRK6M/B1R3+ZXAMql8EXjmxbSEQQugst31w3vej11fU/2iEUdecCaQFM4RWj?=
 =?us-ascii?Q?w0tsbYHaRXMcRZulv7WnLEfNCGcKx2ALlVnaSOoaK2ZYk78UUg09gz1HN0mR?=
 =?us-ascii?Q?TwOROXHeSsA4NNXwkKPZH25fQhDfay6GuzoYnkluN/gYlhQP8Dzk8un8F+WT?=
 =?us-ascii?Q?ClXsvao6annTtB64hd7ThtihtCTtBtCRD2tBu9TLl3eWrU4rObYA293ZeHsD?=
 =?us-ascii?Q?jqXDG+9TUHluzyf2vMMe6CUcKIPNhU1+9WdposB/Cv/a8D4TbihCHC8jNsAC?=
 =?us-ascii?Q?GaYQGxOJWRAB3NFJ/19r8VHvaV/nSf+jHlHudtLQ1jKO+XCSuoWLfGGQm2NW?=
 =?us-ascii?Q?ugZcrAtCI6dKQQzpXI8Xd4XZCd9KkBis9jjQkRLHXxP2EBzftQbbRUP7/JMI?=
 =?us-ascii?Q?a7+U9+BRWelyDhXdVK4SOs4YKexZ8KuX7iEFmIGzQ3nYZqFCMrHyKDD6NUWV?=
 =?us-ascii?Q?rdP1hqP+cXZDIJqY7Vy029uEbPq/Z2I6Uyj/PJFRa05wannSqpTBCO1zSn7+?=
 =?us-ascii?Q?u0s/3CUvmbfW7ahHrb0V0Ts6yQfaAim/4LQfBHWFHgkp5biDXNUd17gKTZQz?=
 =?us-ascii?Q?xLxGrw+49LYyLAb2JPw5m470WEYXd8W8CVn2qk4CkIACh/ayFQx9FREy0roj?=
 =?us-ascii?Q?ypj90A/P2kTQY+LbvVxuCKqpznVbdTzK3UOeXSctA5BXnZX1R+qj7wKI+nCO?=
 =?us-ascii?Q?m5RLgeTn5ZORZaV06zqohlWXK/rSglQpyLwgOEJhk2jJWBLfNbB/hMxwtkIA?=
 =?us-ascii?Q?QqbvfIFnpSlZYsI1+C33ngB39Vz7p8Wk+7IEnDFmTeoq3ciWluJohz8YdzGf?=
 =?us-ascii?Q?wDgh8YV+fi3/4HvtSCDtJvAm2ZIVcLkOUIN2Ruc07XxTHf47nz0K3tBFPFY2?=
 =?us-ascii?Q?+a4AcoRJQ5vmYoj3qqR2D9tGCjF3aCYAEXXtBc7NBpOr2IAmOR+rSICXPfF6?=
 =?us-ascii?Q?RaKxrS+bme/1tRtfClGXSGUssJWrWjyxkBxHcLU493EUge+AYJilm+/zcW9i?=
 =?us-ascii?Q?WyIzCdSyStq4zjRPNbKOog54fWlujhzkKQXZz6Fc/3eHTECwHR+72xSOf3ao?=
 =?us-ascii?Q?v1HouEtf43XP0GJcCpXUZwde0q2IF5su9CUjpMAUGaZtdfpwikr1g7ZPrQLn?=
 =?us-ascii?Q?pYftaUudR5HtjmZv6d3VjiAWZ+kwvgjo54VpSUsJkM7yOi87rK8EpL/XiWKM?=
 =?us-ascii?Q?DGRYtQweYatGzZTUXMB8dlyifsJ6aURGN/Bxl6TjTrw67s2MTDw/oGfud96G?=
 =?us-ascii?Q?838Sw9/G1+0iOPnTFDDcq8dYbH9DcZm4xp7CagWEqmGTZuDspWIz803saciw?=
 =?us-ascii?Q?fctUWii/iR405idXBHFHgNSW/NxDaYQxiL6YnEgyunAuAzkZ74DNxgi9eOBV?=
 =?us-ascii?Q?rIjHJpCwhwKc9EToTDCgk0bG2MU+x0UpKFQd0/dUgsdo61NNRGY8RHFhURz4?=
 =?us-ascii?Q?AVG9UsqTzL23I4gAHWPC8p4SYjTFgNfl3m2KLamGD7dEMbaxZBjqkGMll5em?=
 =?us-ascii?Q?NEDpF0x/ADrazZc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3HS5lYnkvF3wfWuBMBc0Ht5l4+/A27/ZOKl0906NKmjrylbWMw99O3GUK5A1?=
 =?us-ascii?Q?7MhesDYXN6oaC5GGTgkILQD38Jjmo9KarSe4gwYUWntboZFJ3ywSLzbBix9/?=
 =?us-ascii?Q?1bRXXZoL/bdOadDJH9KLO+zFUGOxU2fADmxryNdPDXVxoS3czYzgFoVq/RHE?=
 =?us-ascii?Q?ov3rB5IW+JvetJovAq8byodeEIDekOr/e4PMmM26mlIWEf9g+tA1cf3ZJCES?=
 =?us-ascii?Q?8X9zEyZADBlFDczvb+dqh2OAlQVpJTR0MrkLXSgL6tFZhU7qKhktUu408QFV?=
 =?us-ascii?Q?V+NkvZ9U5O/ha8TtXwg7ni9Rx2rNHDHXeRE9xcdFQf7WAvB0k+Hddv8aCbyt?=
 =?us-ascii?Q?LZO8UDh8q7IQpMpB++tnmc+fdHX31GhdsZbnuYRAV8pE381CNPYXSg0y8Jea?=
 =?us-ascii?Q?7I8yqMfn8mTeilQvIYdNXt10Flj/wBiKMJQssZMi+PkyqKXMyLkvYNUGw4gW?=
 =?us-ascii?Q?/YPhOmlvf0R3Jb9ZRSKP/AEipoh+g8KVckCGc/MnqJe0i1BTmd7AxCBWgf5Y?=
 =?us-ascii?Q?jvxuAgoH/RimgZV8CQexReXEaJWVwaSYuCE74nabG1jNkCYGtTUbN0Qeiijc?=
 =?us-ascii?Q?VFuOPbhQ5GL+/NznWYGnrPRf93mo+Lx2S/b8a6hzmP8pXyUnWcqdXcyQIuvZ?=
 =?us-ascii?Q?x1ktzML/ufqgqzCGJumCC2+shUpxI0jb9XS4ZGAqGmqZD5al86ZxlfmiemaI?=
 =?us-ascii?Q?NXbz02EWsAblpZ6pb4E1pR978V6As9QeVcdpczmr+9XghH+0IYBURYfM0182?=
 =?us-ascii?Q?E/HS8USP4gWipdQp8fNp/eLljM4EY6IZlvbY52RnIvvl9gT4sS8gX8Fd+ima?=
 =?us-ascii?Q?0rbTq1Jmr0G8HRzxCE1QMCvswrujvtGf+ed+b0x/gCE6+ajMHeC9Y1uo1vUu?=
 =?us-ascii?Q?YXS+Ub51jTLPAD5+l/mUOK17WrRPJSHbiT/L7cdgMJg1e4tCosHWOD7HhXlF?=
 =?us-ascii?Q?o0ZaFziZebUz8SRBuK4klPKbh9TwBZXuVUib5Bm6zXB5PYUDLbe71x6bSIbS?=
 =?us-ascii?Q?C+zin7H9GrLpqFV9IIrcgPQ9MDefqKvNRq2M9CuhKFLtTwZN+dhBGJrYiHcS?=
 =?us-ascii?Q?9n7m0EXANWT8XCZd7RfAnEleEjKYOnmYdZ4XFYEbOSun3iAIo/8KvWQ0LjCY?=
 =?us-ascii?Q?HNCq8YEhH4sIFGKlnH5V1vAf5qnkohnsoDktVD6iaJA6IqNRLn5WGEEVPsOk?=
 =?us-ascii?Q?zcQc3DvFUIDUP0hlbaC/+4LhFCbz8caEKyMNdg5pnRqGKwQ3G91CpTdJmhXQ?=
 =?us-ascii?Q?2bC2aUd73D48ZlPwYWUujy1hz1NW8I4oheKIQKaTjRc0vIF+1whBSM8LBfUa?=
 =?us-ascii?Q?/iFhHEqMX/WajZPf6gNhWE76DwsPFVzWvFmQ6uF3LeDCCJapWY27JhDNgIk8?=
 =?us-ascii?Q?hwOQk9cX6LsWtpS+8+AwSooP9emtr1t8//WYNax15IAhCuz/TPb7gMOYSiyP?=
 =?us-ascii?Q?E76IBgdz6yRAB3yaZTCPzKV9Nu6dID2Jml59moVmum0zU3GkFMNyOxtsbwlF?=
 =?us-ascii?Q?2CAt88D5rm6MKnG76A3IK2fY3BslFeMjQ5Fbldrx6ly+o4NaJmLhUWWPMTEc?=
 =?us-ascii?Q?JTI/fMlnQNTPADhkT4QtAPmEjCMXYVuLeO20ZQ/P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba793fa-b89a-4708-f6c9-08dde084ff2c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:33:18.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLypBr4RzDZJ4twCOkyYjYZFVaIjBnXG/6GwbLvopk/+5cvcL/Xq5iOIaU91F3u5DDJZyzGgYfHateP8vJf2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10607
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

Use component helper so that imx8mp-hdmi-tx will be aggregate driver,
imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
bind() ops to get the plat_data from imx8mp-hdmi-tx device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig           |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 158 +++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  65 +++++++-
 include/drm/bridge/dw_hdmi.h                 |   6 +
 5 files changed, 236 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..b9028a5e5a06 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -18,12 +18,23 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_DW_HDMI
+	imply DRM_IMX8MP_HDMI_PAI
 	imply DRM_IMX8MP_HDMI_PVI
 	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
 
+config DRM_IMX8MP_HDMI_PAI
+	tristate "Freescale i.MX8MP HDMI PAI bridge support"
+	depends on OF
+	select DRM_DW_HDMI
+	select REGMAP
+	select REGMAP_MMIO
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
index 000000000000..8d13a35b206a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <drm/bridge/dw_hdmi.h>
+#include <sound/asoundef.h>
+
+#define HTX_PAI_CTRL			0x00
+#define   ENABLE			BIT(0)
+
+#define HTX_PAI_CTRL_EXT		0x04
+#define   WTMK_HIGH_MASK		GENMASK(31, 24)
+#define   WTMK_LOW_MASK			GENMASK(23, 16)
+#define   NUM_CH_MASK			GENMASK(10, 8)
+#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
+#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
+#define   NUM_CH(n)			FIELD_PREP(NUM_CH_MASK, (n) - 1)
+
+#define HTX_PAI_FIELD_CTRL		0x08
+#define   PRE_SEL			GENMASK(28, 24)
+#define   D_SEL				GENMASK(23, 20)
+#define   V_SEL				GENMASK(19, 15)
+#define   U_SEL				GENMASK(14, 10)
+#define   C_SEL				GENMASK(9, 5)
+#define   P_SEL				GENMASK(4, 0)
+
+struct imx8mp_hdmi_pai {
+	struct regmap	*regmap;
+};
+
+static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
+				   int width, int rate, int non_pcm,
+				   int iec958)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
+	int val;
+
+	/* PAI set control extended */
+	val =  WTMK_HIGH(3) | WTMK_LOW(3);
+	val |= NUM_CH(channel);
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
+
+	/* IEC60958 format */
+	if (iec958) {
+		val = FIELD_PREP_CONST(P_SEL,
+				       __bf_shf(IEC958_SUBFRAME_PARITY));
+		val |= FIELD_PREP_CONST(C_SEL,
+					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
+		val |= FIELD_PREP_CONST(U_SEL,
+					__bf_shf(IEC958_SUBFRAME_USER_DATA));
+		val |= FIELD_PREP_CONST(V_SEL,
+					__bf_shf(IEC958_SUBFRAME_VALIDITY));
+		val |= FIELD_PREP_CONST(D_SEL,
+					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
+		val |= FIELD_PREP_CONST(PRE_SEL,
+					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
+	} else {
+		/*
+		 * The allowed PCM widths are 24bit and 32bit, as they are supported
+		 * by aud2htx module.
+		 * for 24bit, D_SEL = 0, select all the bits.
+		 * for 32bit, D_SEL = 8, select 24bit in MSB.
+		 */
+		val = FIELD_PREP(D_SEL, width - 24);
+	}
+
+	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
+
+	/* PAI start running */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
+}
+
+static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
+
+	/* Stop PAI */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+}
+
+static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = HTX_PAI_FIELD_CTRL,
+};
+
+static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dw_hdmi_plat_data *plat_data = data;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+	struct resource *res;
+	void __iomem *base;
+
+	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
+	if (!hdmi_pai)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	hdmi_pai->regmap = devm_regmap_init_mmio_clk(dev, "apb", base,
+						     &imx8mp_hdmi_pai_regmap_config);
+	if (IS_ERR(hdmi_pai->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(hdmi_pai->regmap);
+	}
+
+	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
+	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
+	plat_data->priv_audio = hdmi_pai;
+
+	return 0;
+}
+
+static const struct component_ops imx8mp_hdmi_pai_ops = {
+	.bind   = imx8mp_hdmi_pai_bind,
+};
+
+static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
+}
+
+static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
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
+	.remove		= imx8mp_hdmi_pai_remove,
+	.driver		= {
+		.name	= "imx8mp-hdmi-pai",
+		.of_match_table = imx8mp_hdmi_pai_of_table,
+	},
+};
+module_platform_driver(imx8mp_hdmi_pai_platform_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec289..32fd3554e267 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -5,11 +5,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 
 struct imx8mp_hdmi {
 	struct dw_hdmi_plat_data plat_data;
@@ -79,10 +81,45 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
+static int imx8mp_dw_hdmi_bind(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = component_bind_all(dev, &hdmi->plat_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
+
+	hdmi->dw_hdmi = dw_hdmi_probe(pdev, &hdmi->plat_data);
+	if (IS_ERR(hdmi->dw_hdmi)) {
+		component_unbind_all(dev, &hdmi->plat_data);
+		return PTR_ERR(hdmi->dw_hdmi);
+	}
+
+	return 0;
+}
+
+static void imx8mp_dw_hdmi_unbind(struct device *dev)
+{
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_remove(hdmi->dw_hdmi);
+
+	component_unbind_all(dev, &hdmi->plat_data);
+}
+
+static const struct component_master_ops imx8mp_dw_hdmi_ops = {
+	.bind   = imx8mp_dw_hdmi_bind,
+	.unbind = imx8mp_dw_hdmi_unbind,
+};
+
 static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_hdmi_plat_data *plat_data;
+	struct component_match *match = NULL;
+	struct device_node *remote;
 	struct imx8mp_hdmi *hdmi;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
@@ -102,20 +139,38 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
 
-	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
-	if (IS_ERR(hdmi->dw_hdmi))
-		return PTR_ERR(hdmi->dw_hdmi);
-
 	platform_set_drvdata(pdev, hdmi);
 
+	/* port@2 is for hdmi_pai device */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (!remote) {
+		hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
+		if (IS_ERR(hdmi->dw_hdmi))
+			return PTR_ERR(hdmi->dw_hdmi);
+	} else {
+		drm_of_component_match_add(dev, &match, component_compare_of, remote);
+
+		of_node_put(remote);
+
+		return component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
+	}
+
 	return 0;
 }
 
 static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
+	struct device_node *remote;
 
-	dw_hdmi_remove(hdmi->dw_hdmi);
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (remote) {
+		of_node_put(remote);
+
+		component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
+	} else {
+		dw_hdmi_remove(hdmi->dw_hdmi);
+	}
 }
 
 static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 095cdd9b7424..336f062e1f9d 100644
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
 			     int width, int rate, int non_pcm, int iec958);
-- 
2.34.1

