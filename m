Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEADB1019C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABBB10E8A2;
	Thu, 24 Jul 2025 07:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZbfOaE9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A2210E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTqeWq7O/piAmqtBSQ4fHX1lFKr+WAWb44oVGdrs4TYpqRKn365YGq/z3fn5LcU5oCOiuVPzW1/HxbkXpDmEGYVCZA8WP/guPCyblKJ7+Jg0BE6W9g1EF65mA2GYmtM4kflipIBEdXbBQz9fOGaS4iaHZKuWRVHLNMeM86ABMGHx/s7pamU1gocWQz/LekBhXuQ2wzYIFPcmNCHVk1TbOMHcW7EHwNxV8jZz5L9n586A2/9ynvfuSYjNkcSQV9MnWXRg1DuMYvG9e8Do1W3X6EvYgLL0yWfbpK8U8klmkFeSuW7pW32Zlm/KCXss9BbJGHj8w4Bh7JvXFs8nj0KdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7taTqWMgOdVV5Uo+opymyCbS/QrTJvq/xL96hycnptE=;
 b=NVoYJqglV64I60bWaEbXZ5/tXyITv9AiH/kHYx4399+vdDYdTILUotFIJ9Aahh/sBox7z4++XDx5l2KXGDPkeYU4ITOmUFV10wSFZFs4eYs7YmYF1UFpx5Sl9vG53ztBJEyFKox6dxdtF/cAxlOoiVRsfmu+mW9rTpvtTOIKiGklPbieJi/pM9DCXhqULRxpmzdVpE+iGLzc0Sc+VTa/J7MdQ78uSEvqj39sgV8Tg5sfx/UjQUzNS1hE6/sNZkwPRa7SZa8yvZCiqJZ33ym1ndcaXo4uN3XnOydmvjXgiie3kdyJ7rre56fonYTUCM9xapD6vqZ89K2uWn1Ts3ZwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7taTqWMgOdVV5Uo+opymyCbS/QrTJvq/xL96hycnptE=;
 b=ZbfOaE9E4otEeDE3qNUo9PYWr5ochHZmL2pf6sg8jKkcysDGRitlxqi0zPBifi7xJZZY2fQyj3m6ZURjqgjatSDtlvg2H9O7DwKh0yqZ8wfd3rtP/12Dt1OYeTJY1jpPRjgjuznf20OattJtkn/E16mCux671fMSe3xdiI8gck27gBSRuYMEVNmpdV9vCWEnSqPpsT3PAAS60QSaPTWtLJ5Sj4jwsD0gRCb5H2wilHLbebw+aJ0+mKrlphlGNSQRKK0UX+lS65LQIZGwJCrfT8vP8h/KTQTgibnTAU1BclDW8Jb12ScToKdE31IEhhVcHhzkQbPb86Q6Px8CMZKqgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:24:13 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:24:12 +0000
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
Subject: [PATCH v2 6/6] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
Date: Thu, 24 Jul 2025 15:22:48 +0800
Message-Id: <20250724072248.1517569-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f61783-a01a-491b-e845-08ddca831682
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hYzbJw0wYs+MpkZzW7tuYSJdMZExJVk4Xe4IxfmpYPxaqkCF656OC0zGaq+K?=
 =?us-ascii?Q?5eVtRujz9CojZ0b7yoLiRP21iR/39TBQSKWkQGSU3olrESseMv0DBDfKZsWL?=
 =?us-ascii?Q?M2Tn6d2ldgXlnqY5X+ZWcVBzUmCQNvLTzA4biaMpL1PfCCgFUD5LgkiKWqKi?=
 =?us-ascii?Q?9V8BRrTyhw3keuAqzV6ILi2jho93PTRsw2SBIeqqoCTsyR6jgIQmwKL1Prh5?=
 =?us-ascii?Q?1N6ESVo+uPMZ+0LNNfz0ZEV+0JrJu5qSgBdDertk1h0+VFb5N4JzoCcCS8g7?=
 =?us-ascii?Q?OQEtxC/ylAuPmzk+XTsDk2s6NgLWowRA+7p3fTzIWdCgdGN4cCL2yLV7k3G4?=
 =?us-ascii?Q?xuoxxyhYWmZZInHj9kpW+DxmNxQ7EiuHedlajMqr/BpWCYGTcdgi5q1LwoMb?=
 =?us-ascii?Q?6Ogt4xAOf/Db5xU86QxFbITkN0AjBXRfNrxgl6UZSswyQh9URUKQn0n92e2U?=
 =?us-ascii?Q?PJlHCxOYL6NreYUgdbGW7h+m0lso0awFHq6LaCMKOc4SyIHFmwfdEk0cuNfq?=
 =?us-ascii?Q?9bUhjNEvXn8vTt4RgcQ6Tp0S5y4LvxZ2ueWGVZ7U/P6J8zHEmnAige0G6cSc?=
 =?us-ascii?Q?//LnVYi8MKkBHtj4Wher9Fv7O+YAIy8pmmHGAaf60LdK0S3WaJS6nyEwp23D?=
 =?us-ascii?Q?lYbZZbtJGIAxp4q1ukKfmwtsAGE1ostBRYEveneKfUmpw10z1aPHyjhzoopN?=
 =?us-ascii?Q?pj7mthsKHziq9H3VgquH9XAmaghoBv6LVA82s7tX0K6K5L9Qx/qnXfxaA8gT?=
 =?us-ascii?Q?1JcfWbcVHB/nL3Lj6XEtkvon0N5RFmmQlW9LWIZ+A+JoFUPH+CnrzOXYFF6T?=
 =?us-ascii?Q?NXUOL80M8LLdSWypED26XIXCr4khfWY8jGjlekiNERXVH+C9uvzSlCPb7AZX?=
 =?us-ascii?Q?YyIoArxRE9nTQmy39UYb827pEIXa+bxH79miwgB2Xjz9LPJ6lQ1Jlx5n4QI0?=
 =?us-ascii?Q?41sqATmwfd5laNNSfeKCsSM8Ob7bnpKhtMcInClqTxEEGLQ18vcXfOyXqx2D?=
 =?us-ascii?Q?aDAY8aLDcIgDNf+SHH5oaoqlm3+TbR6SzwjjhYA4v1CGVlFmSu2f86RVq4Ln?=
 =?us-ascii?Q?Zbf8jhYO9BbklXK74oMJ6foRsGPZS6I0oLrMH0cHvncZ+F9j9Tf+bEbP8EWc?=
 =?us-ascii?Q?cLEUlLLG56nMRJw54xsr86O3SAuh+FSnKVGzKN0/VIzl/qXsdsBx5rHYI86W?=
 =?us-ascii?Q?MTqVQrqQhEQYs0QLwIdHBE8D2mqvZD4WRiaCLbDjfV8n4+CqfmSJZnOo4y7e?=
 =?us-ascii?Q?hRPHMa17m38KixMIFdH2ffnuZo9elcuyckhDLZ2R7Cm9B8imnTOa+FNsi4DR?=
 =?us-ascii?Q?GtutohiyC8S9DX1awSG2zAy3HUSmiDa2PVLr4RBaT5LeYn8KZmfq4QUIMnhW?=
 =?us-ascii?Q?On7zDyy22PvQtaezrXNTsYIs381dLSMdV8RPr3R3Vl9aJC6vQk0Kx+2EuF87?=
 =?us-ascii?Q?xIYQy/7qvEDAUHX3mRcDyx68R4wIwauVCWtY/V/IqTJHRe3cQFRN+AV7+Mip?=
 =?us-ascii?Q?Rdf6AXhOHmM1o7s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hi+xk9xqFChR+JVbwbtoNOpNWTiVBP4ZNk/J4YyaYsEz+l5L3MzKIJCeF7pe?=
 =?us-ascii?Q?ZOIgj0vh2eGpThWFE8Wju4wY/aVVl300aVjvPSQYoehLsUHEpWpJtmz2xy7K?=
 =?us-ascii?Q?eZdr+tbrp0/8isMGw+pk7+llRhO7weCfzl6R2CIsBuiLX2XByFiGz2XhZ0Gs?=
 =?us-ascii?Q?LCvvwb9v0P3CWBw14R5I3G9dPxlZ6+F/PxNIphQujiW3cgoBmf7LHD2nyQma?=
 =?us-ascii?Q?BwTBQtNugts8xV5ZP0ZGMAkYDVrGhynHpBJYBv7sB3M1nGVYboOCdJN3oU2y?=
 =?us-ascii?Q?rIgPikz7aI6sC6G88OZKRz5CNoiFhmN/bnVDjHV7SIkkMjbU6Dz8e/JIUy/9?=
 =?us-ascii?Q?QOg0P6tgdNjrnONfOhhz3AcwBCagtKLgHCxnZ/5SHbL6dN5kc81BXdRcrsNx?=
 =?us-ascii?Q?QdmSwMnTvJrrmpLe9WHXJWBCW91oZ63WtV8KmDWEMFJT7MaaVT3u9br0R7/F?=
 =?us-ascii?Q?KDoVGwKFH1hKs6SxB7Msk14rl1LwFmn+uWLtPQu2ARwd4lQaFQN+YRD07GPe?=
 =?us-ascii?Q?syEyEC++F7h4ctpyUf/kPDdHpvXdrkKbNEHgyJteW4EXMSQqpmWL64DzDseC?=
 =?us-ascii?Q?i94f5kc5jVuk/VWMnXZcigPiX188/AAEDaOhOpjCnGdC6PsTMHKUvzZ1MQvc?=
 =?us-ascii?Q?UNB/mpnCXatJNYIb6L8bahqj35ufP1G7w2a6X4ItY1U9Oxcb1rRJ8cLy/o/5?=
 =?us-ascii?Q?h5rHt3uOKmzmRyAZDBErhmHcIYUkjb2cWUkGsmv2z0xmPoPgEUV7zbl5Fa3j?=
 =?us-ascii?Q?kj5KUy2CGrh6B/umgO1f/E1mO0wIG5QLvx2gbAa0Sl/AuXNz2f8s/DPEsIDk?=
 =?us-ascii?Q?KiFWKOVNzS659qScwUwyrDkqtALQ/bKCaNtOTxrOdwrfIdgYItPbHtXB5mCW?=
 =?us-ascii?Q?tR8CB3yG5adUzCpbZhDan7nd+9yADJ7YtdYO7D2xMGsW3kky5Ni/DCONZ6oq?=
 =?us-ascii?Q?HJrISrQ48zVnM9JgJ6Jjj7sp/L8KWbH8cVr/7OFnVTAkGFW1OfBfy8RaU4rL?=
 =?us-ascii?Q?5UNLK0a/rjaPWDKw5tNv3V9BTkUl4pf/kb0l+wM5QlDBGARKw+ZkdNjubNRn?=
 =?us-ascii?Q?WvU9OTqP5Fla80sCpbBZkgQE1gWPZBq2jRfqHiu/0XhVzvccjVf/G8dxvCak?=
 =?us-ascii?Q?X/l660DlbXb8Li7bu437t6UlfR9dIgwKoGh8nv4IW7nyPbjqzhT+MCCWaPDe?=
 =?us-ascii?Q?mdTkQqd49JaNfu+c/bE+WZiLCwaHqHMKUKgZmW7nEzoZhVNY79tZB5aDbj2t?=
 =?us-ascii?Q?SqWNBi3j71qlVlzAIlnrLVziYYwAm/mnjdJobklXIAmWbl1d8ayvQCP7fTWU?=
 =?us-ascii?Q?JE36Xyi0QhVSXFb7O8dxsKttxPB79VD1+AZrc2u5Hp/sgjpGSm8bS4BXJDar?=
 =?us-ascii?Q?3Cbr4MQbfDN9Fml5Zm4tT6UTzIvXLsvFiPTxgbBoF+Rvq8f5+82jYqC3Y438?=
 =?us-ascii?Q?zGmGTw57hUCoGDqNRfpaeODtYt42UGjnQv7EUmyINSnOuxBEU0+aB4fj+9qR?=
 =?us-ascii?Q?NtAlROrjS8XIGlC6DK/viu7H8+cz2ji0yCZL5AxMmF4Hrut9J7uIv22z9ufp?=
 =?us-ascii?Q?E3ZER2aVfEG2h9WO3DWUJJ7OrSzskoWm5ABJevz6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f61783-a01a-491b-e845-08ddca831682
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:24:12.6307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci2wuYMupttXx8nyzfWvsE/jkCirZ6APj63F3+NjClkASgJOnBwDwBNILqYzHkGX+p13xTnrZtIHSpov6OEw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
Audio Subsystem to the HDMI TX Controller.

Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c0cc5611048e..cc9351a5bd65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -442,6 +442,10 @@ &flexcan2 {
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338e..a0b00cbcb680 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2063,7 +2063,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 
 			hdmi_pvi: display-bridge@32fc4000 {
 				compatible = "fsl,imx8mp-hdmi-pvi";
-				reg = <0x32fc4000 0x1000>;
+				reg = <0x32fc4000 0x800>;
 				interrupt-parent = <&irqsteer_hdmi>;
 				interrupts = <12>;
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
@@ -2089,6 +2089,24 @@ pvi_to_hdmi_tx: endpoint {
 				};
 			};
 
+			hdmi_pai: audio-bridge@32fc4800 {
+				compatible = "fsl,imx8mp-hdmi-pai";
+				reg = <0x32fc4800 0x800>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <14>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "apb";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+				status = "disabled";
+
+				port {
+
+					pai_to_hdmi_tx: endpoint {
+						remote-endpoint = <&hdmi_tx_from_pai>;
+					};
+				};
+			};
+
 			lcdif3: display-controller@32fc6000 {
 				compatible = "fsl,imx8mp-lcdif";
 				reg = <0x32fc6000 0x1000>;
@@ -2140,6 +2158,14 @@ port@1 {
 						reg = <1>;
 						/* Point endpoint to the HDMI connector */
 					};
+
+					port@2 {
+						reg = <2>;
+
+						hdmi_tx_from_pai: endpoint {
+							remote-endpoint = <&pai_to_hdmi_tx>;
+						};
+					};
 				};
 			};
 
-- 
2.34.1

