Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC404EFF00
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 07:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DDE10EBC5;
	Sat,  2 Apr 2022 05:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7810EBC2
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 05:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI1v0qaM3KhgOKCX28Psb5jHBtW+EdJzfAuUyVCXz+TyXJwadZVOLpXOH0j817fnuGEqeoE3/zgRhn1DPIAFku9MxOp+fdu5PsDniz0oC6ECZvhQjjo71omYQnN5j+eesP27omhKNaTzkPBzG+puajaUoUAG6tRqfJ4h59g9OSZuvBYWEfjmVYs5lrJGDnwjdg5SDcMRyAEWCug1H2PZpJ6B4EPcE/LJfBzYf4Ou1frkZE6fH35sBkW71Z8GikupJ7yyTMphkt8RO3jNoGQ0WSfiQi1BTSBRHq6gvGwPGVrEDEm5PVr5lHaSBk7iKEIUOt4czCxTjkZh1Ko9KdwewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z23oGthQQVatgNiHhq/oRsg65W52HNMSx8ap0xPZR4U=;
 b=S+Ea326d8hh3h8ZVewqHqb41v7kZX/rv5VkeldgeVPJd8WVvNeBW+BYc0Y6fPggLgFzYjg3zBBBac/zI7LmbB4g5+hVnesF9tq45FpNKZHa0h5tcjQYXGe4Y7aTVmLriCaOEecck3iDf1m/GFPLFH6GnvmQCJjX4Twqg9qEUsFqBfJERWgCLpeXfaeYVt/ZReZoFcxtHKaJeh6cr1CayP7LoJdu2ZD7lBOrlYGy8ldZgvBFaXlxvmSvcd/1Me2ilYv4cuOTDy5xUFI9IbofpjHj0i5iBC++1S8FtqEKA9su0w8d4My9rExh6qx+OeUOpuHbmo932NSPs/NBhDU+Z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z23oGthQQVatgNiHhq/oRsg65W52HNMSx8ap0xPZR4U=;
 b=lzgjOlFackcCQE1NQ+ktGzjsEFA77B/55cIqZVL1PWO93dK5ri3PTJeeGNdTqhaulG/UdMwVMVS76ICQnt3GcwB1X340afbWSTdpgTPwT6lTcOOGfyzsfUR9AWpDtm5XuCYUvGgZVKEwPwhPOhYZBy0+9Rdw/FZKHGTGWy5f3WQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Sat, 2 Apr
 2022 05:23:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 05:23:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 resend 5/5] phy: freescale: phy-fsl-imx8-mipi-dphy: Add
 i.MX8qxp LVDS PHY mode support
Date: Sat,  2 Apr 2022 13:24:51 +0800
Message-Id: <20220402052451.2517469-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402052451.2517469-1-victor.liu@nxp.com>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f17bc912-c9ad-4142-b3b3-08da1468f86c
X-MS-TrafficTypeDiagnostic: AM7PR04MB6776:EE_
X-Microsoft-Antispam-PRVS: <AM7PR04MB6776E23C426815CD07A4795998E39@AM7PR04MB6776.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/KZ0eYp2tS5elt5hPBQC6Tdhfx+a0NbRx1K1oNfeC+EyafljFkpfxRbWuhIozO2OOoppgR3A5moYC12Ce5whUhk5J+h90aWVQNKih//eQUbdyCdbWkBbRH4rJHLShh8CfITEbWerrG581JY6nreZxA8JEU77aY3UkqAK2aS/yqTq8qrOt1pccUJO451vAI3L7sz7srlitsptwTzsRfS97nGkIc3uetyaKRdj98xs0Gyy/KGYch27pT0LjLe9bDKOkcYcU6XKU9H/pg5Z1dy6SjV0upDarKRO+ysEFHj0meIxyUff5EBLGIQjAS9yDZSiOZKCxPuPcOeRpixldwouOan+MNMeZ5585v3n5s+xtiZCmSLORwOoFzCoWUAyyqt1Z37gwMZQN2f1FDu+EaLJDg+/Zp0aBv7YMYZ8tJt56NjB2fhLwCoqBAlrvRXVgEXJIUadXogFcoaiXgGhSOupbuS6LH7BMDfXjmccPT0+cM2Qvocp7WuRC/9bWuVejksZkK8M8I8g0plp7BgQpKREKx3EJxOSD700u3V75KWtbIVDc8oLKRANMIQbPhHRh5bzd8FcRmZJRJYcAbIQQJbBa3DLHgTwD41n/9cQgBpaQ4+eAK3ksZrTJVKvMSFnR85j+gegk5lGBgDuTRwiPGVJ/9NCbUnhLUCKXGaH1x0qGir/BsQDKpOZQrS41agaEKZwi3W40b8+xddRmDmM1OrkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(30864003)(8936002)(7416002)(186003)(66556008)(26005)(2616005)(316002)(66946007)(8676002)(66476007)(5660300002)(4326008)(86362001)(66574015)(83380400001)(36756003)(2906002)(52116002)(6486002)(508600001)(38350700002)(6512007)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHZ1OGRJTjVpS005WEQxYlBIV1dkdWtVMVJJVlVrUFN1Q1Z6RkZtMWJ3amZy?=
 =?utf-8?B?d3Z2TExQNjhOd2d1bmQxVnIrRnU0NlFPMWtiNzgvRUx3UGd6Z1ZUd09CTjVI?=
 =?utf-8?B?TGVlRGtvSm9weTRYZ0xhTkN2NzhDK1lvTnF3RXp6NjNQajBlakpPTUx6WWJp?=
 =?utf-8?B?akVpeXk4OVRmUTNpcS9PWEVhbjBBdWFZS0ttV0VieWZLdmVDUC9oMk5IUDY0?=
 =?utf-8?B?YkZ5eHd6R2kyaDc3SldoNzZxbzljS0drYytVU042U1RCMXdWcVdRUGcrOFI5?=
 =?utf-8?B?OUVGWDFuUVVTK0liSkFQMXlHZ2FyZjFqYlBMK1dWaGM3akdrbm5qSUIrb3Er?=
 =?utf-8?B?NWsyVjBtM0g5ZmV4K0JUUlJ6SUxrWEhIT0VIQUJGSEc4QnFQdWFibXBQRDFm?=
 =?utf-8?B?QWM4VzZLRytlVFFSWXJWOG1raW5GbzdXS0ZIaHExR0hGNE1HdUhyMGgrUEpN?=
 =?utf-8?B?OEtJbndia3NvdVRoVGt5YnRXR3dzdkJFVVVMbnJSVUg1bGJvMzlDTndVMXZ3?=
 =?utf-8?B?R3lGWG5CZks1NXptVE15eXJ4UDJveTM4enV6d3Y5RUVzaWVYWUozekpuM1F4?=
 =?utf-8?B?cnJ5MzJyWFZES2VBd0dBblJjZVJnNUVQRkhEUWphc1NVNzk2SU9VQ3F2Nmlr?=
 =?utf-8?B?MkpRbHptRnVxdEFXbEVrc3JyMmJINTlETGVkWDRYcFBFYWtaT1R5LzV2bmlE?=
 =?utf-8?B?N0htUnlac096ejFMNHJpN3FOZm1vUEVPZllibXVwRXIxRDVJZHdjNUVGVXVs?=
 =?utf-8?B?OFZRZ0FNZ0FzdERpWWxKUTJIYnJZRStYbFlRbkp5VnFtbGZCS3lkTk9PTFV4?=
 =?utf-8?B?MEowS0RzbWJNMjA2UGQwNEN4UWt5OTRwZ0laRzMydUNUTzRiVUhTMVlYWXZD?=
 =?utf-8?B?dEV6R0I5NTNydG1YMGlBVFlLWE1GZXlvQU5HaExOeCszcUlEa3pXeHRVcWV3?=
 =?utf-8?B?N1Yxdlo4NlI3WllPejIxRmZiQjFheGZJbVhYRGcyQ1Iya0lMa0tlOXNBbTVD?=
 =?utf-8?B?Z3VEZndTaWIvSXd5MU9lUTFwWXRjU3kwNmw3K2hUNnRuQktPZEhMZ1Zza040?=
 =?utf-8?B?dXdiRC9LcVdLd1hXNk5zVFVVR2JXSG9vNTVWdU1KQjR2b3BHb2RPZWcrRkI1?=
 =?utf-8?B?RkdZR2RaTWRUbmhsVUtCNzA1Nmh6Q3I2SUUwVEZCdzdSQ0Nld0ZIQkxHK3Fq?=
 =?utf-8?B?dElZREU4WElnUUt2MzhZZStERXJMRVZNRkhRc1dsaGRsVmFqQWIydHg0amdn?=
 =?utf-8?B?Y242ditDQWg5Qkt5cHBMV21kRllQTDVDUmFnL2xha1B4UVhtSGJUd3ZHZlBo?=
 =?utf-8?B?U0NuTDdtVDZiWVI2VENpMlh5SENKS1hSTm1TRGEzdzgyUEhCZWlGOUtaTkVM?=
 =?utf-8?B?SytBQzdOVnpiNDZ3YzZwWUhhTTBWWHFJMEE5OWtkZ3VvQndJblhtL1NadWt6?=
 =?utf-8?B?US9QeWNYRnN2dG1CWndkckpHdzJTNXUzbHBtZ3lKU0VMTVdMTnhBOHBuZThM?=
 =?utf-8?B?WUFMdlFMdGp0bDlwei93Yk9malk1dVZ1WGU0RWg3czV2czllTE12OHVqM1hZ?=
 =?utf-8?B?Yk84V21VUGVJeVFxU0Z4VmRlK3I1V2tnWkRYbzRhOGZ0TUlHazVoaDBJSnlT?=
 =?utf-8?B?VlFiK3lpNUo0YWhXRWhRUnBaVk5vYU9LNHBWaVR0NkdsZ0QwakVBUDRPUWJ6?=
 =?utf-8?B?NnRtaFVWaWRaZEhVeEp5RmZ2eFVlaGZ3QnI0Z1YyVWZ5WjZIcHd0QTM4K0pD?=
 =?utf-8?B?VzV5YWJEUi94TzJBRzdvYnRpMWM3SlFzdzh0RzNrRkFnV2tzMXl2VU8wcEVp?=
 =?utf-8?B?RElJNzJoRTRtSnE5S0FlckU0TFYxNS9ZSWtaL000UmlRMHZkZSsrK1J1ODdC?=
 =?utf-8?B?d3R4SnNaM2ZUdWZ2QnAzbHgyNjkxa1NOYk9veTFNR05OcENUektjUnV0cVRR?=
 =?utf-8?B?ZWRvN1M3QzZOSitCYTVPb21EVnJnaCtMU1A3MU9hWTA5ZTFtNGRCNWo3aURC?=
 =?utf-8?B?eWxENzVkUXhtbXRLNTNUeFA3UEtwcDFCVmpEMTVyNWxuQ05KeVJsSEdKbm1G?=
 =?utf-8?B?a1o3MEZuVG5vMS8yUGNXWFFmUHp5dFZoTThMZ0JRaCtWYjRnbkVFQml4VzU4?=
 =?utf-8?B?V0RiaEhNaUdmL3BldUNuMTlQeUpzcW14bzRGM1Y0ZThFVVVOeWJleGhwQWl6?=
 =?utf-8?B?c0MweTUxVjgwK0UrYjlBa1l5V0dlc2hnWm1TWXR3VmIzcDRhY3BXbngwb2VG?=
 =?utf-8?B?M2hvV3pmTUhpQmhlVUlncnVjK2lwU0JjTjFyWGhlT005VllEbFl0VVhyM2NQ?=
 =?utf-8?B?WjFLRGIwZGdOTkp3VXRQVWdHTDMrZHowZktXWll3TU9kbm9pSTgrQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17bc912-c9ad-4142-b3b3-08da1468f86c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:23:50.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zO3k9VOd1Qc+5c7RLDars4IDWhJ7gVJSTdcZMNz2lmZ6SBmGotfyb19GgifEsDCzDHrj4aN5A0wyPU59CDvQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, narmstrong@baylibre.com,
 airlied@linux.ie, s.hauer@pengutronix.de, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 robert.foss@linaro.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8qxp SoC embeds a Mixel MIPI DPHY + LVDS PHY combo which supports
either a MIPI DSI display or a LVDS display.  The PHY mode is controlled
by SCU firmware and the driver would call a SCU firmware function to
configure the PHY mode.  The single LVDS PHY has 4 data lanes to support
a LVDS display.  Also, with a master LVDS PHY and a slave LVDS PHY, they
may work together to support a LVDS display with 8 data lanes(usually, dual
LVDS link display).  Note that this patch supports the LVDS PHY mode only
for the i.MX8qxp Mixel combo PHY, i.e., the MIPI DPHY mode is yet to be
supported, so for now error would be returned from ->set_mode() if MIPI
DPHY mode is passed over to it for the combo PHY.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Guido's R-b tag.

v2->v3:
* Improve readability of mixel_dphy_set_mode(). (Guido)

v1->v2:
* Print invalid PHY mode in dmesg. (Guido)

 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 269 +++++++++++++++++-
 1 file changed, 258 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
index a95572b397ca..af1ecda091c7 100644
--- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
@@ -4,17 +4,31 @@
  * Copyright 2019 Purism SPC
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/firmware/imx/ipc.h>
+#include <linux/firmware/imx/svc/misc.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+/* Control and Status Registers(CSR) */
+#define PHY_CTRL			0x00
+#define  CCM_MASK			GENMASK(7, 5)
+#define  CCM(n)				FIELD_PREP(CCM_MASK, (n))
+#define  CA_MASK			GENMASK(4, 2)
+#define  CA(n)				FIELD_PREP(CA_MASK, (n))
+#define  RFB				BIT(1)
+#define  LVDS_EN			BIT(0)
 
 /* DPHY registers */
 #define DPHY_PD_DPHY			0x00
@@ -55,8 +69,15 @@
 #define PWR_ON	0
 #define PWR_OFF	1
 
+#define MIN_VCO_FREQ 640000000
+#define MAX_VCO_FREQ 1500000000
+
+#define MIN_LVDS_REFCLK_FREQ 24000000
+#define MAX_LVDS_REFCLK_FREQ 150000000
+
 enum mixel_dphy_devtype {
 	MIXEL_IMX8MQ,
+	MIXEL_IMX8QXP,
 };
 
 struct mixel_dphy_devdata {
@@ -65,6 +86,7 @@ struct mixel_dphy_devdata {
 	u8 reg_rxlprp;
 	u8 reg_rxcdrp;
 	u8 reg_rxhs_settle;
+	bool is_combo;	/* MIPI DPHY and LVDS PHY combo */
 };
 
 static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
@@ -74,6 +96,10 @@ static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
 		.reg_rxlprp = 0x40,
 		.reg_rxcdrp = 0x44,
 		.reg_rxhs_settle = 0x48,
+		.is_combo = false,
+	},
+	[MIXEL_IMX8QXP] = {
+		.is_combo = true,
 	},
 };
 
@@ -95,8 +121,12 @@ struct mixel_dphy_cfg {
 struct mixel_dphy_priv {
 	struct mixel_dphy_cfg cfg;
 	struct regmap *regmap;
+	struct regmap *lvds_regmap;
 	struct clk *phy_ref_clk;
 	const struct mixel_dphy_devdata *devdata;
+	struct imx_sc_ipc *ipc_handle;
+	bool is_slave;
+	int id;
 };
 
 static const struct regmap_config mixel_dphy_regmap_config = {
@@ -317,7 +347,8 @@ static int mixel_dphy_set_pll_params(struct phy *phy)
 	return 0;
 }
 
-static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+static int
+mixel_dphy_configure_mipi_dphy(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
 	struct mixel_dphy_cfg cfg = { 0 };
@@ -345,15 +376,121 @@ static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	return 0;
 }
 
+static int
+mixel_dphy_configure_lvds_phy(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	struct phy_configure_opts_lvds *lvds_opts = &opts->lvds;
+	unsigned long data_rate;
+	unsigned long fvco;
+	u32 rsc;
+	u32 co;
+	int ret;
+
+	priv->is_slave = lvds_opts->is_slave;
+
+	/* LVDS interface pins */
+	regmap_write(priv->lvds_regmap, PHY_CTRL, CCM(0x5) | CA(0x4) | RFB);
+
+	/* enable MODE8 only for slave LVDS PHY */
+	rsc = priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
+	ret = imx_sc_misc_set_control(priv->ipc_handle, rsc, IMX_SC_C_DUAL_MODE,
+				      lvds_opts->is_slave);
+	if (ret) {
+		dev_err(&phy->dev, "Failed to configure MODE8: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Choose an appropriate divider ratio to meet the requirement of
+	 * PLL VCO frequency range.
+	 *
+	 *  -----  640MHz ~ 1500MHz   ------------      ---------------
+	 * | VCO | ----------------> | CO divider | -> | LVDS data rate|
+	 *  -----       FVCO          ------------      ---------------
+	 *                            1/2/4/8 div     7 * differential_clk_rate
+	 */
+	data_rate = 7 * lvds_opts->differential_clk_rate;
+	for (co = 1; co <= 8; co *= 2) {
+		fvco = data_rate * co;
+
+		if (fvco >= MIN_VCO_FREQ)
+			break;
+	}
+
+	if (fvco < MIN_VCO_FREQ || fvco > MAX_VCO_FREQ) {
+		dev_err(&phy->dev, "VCO frequency %lu is out of range\n", fvco);
+		return -ERANGE;
+	}
+
+	/*
+	 * CO is configurable, while CN and CM are not,
+	 * as fixed ratios 1 and 7 are applied respectively.
+	 */
+	phy_write(phy, __ffs(co), DPHY_CO);
+
+	/* set reference clock rate */
+	clk_set_rate(priv->phy_ref_clk, lvds_opts->differential_clk_rate);
+
+	return ret;
+}
+
+static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	if (phy->attrs.mode == PHY_MODE_MIPI_DPHY)
+		return mixel_dphy_configure_mipi_dphy(phy, opts);
+	else if (phy->attrs.mode == PHY_MODE_LVDS)
+		return mixel_dphy_configure_lvds_phy(phy, opts);
+
+	dev_err(&phy->dev,
+		"Failed to configure PHY with invalid PHY mode: %d\n",
+							phy->attrs.mode);
+	return -EINVAL;
+}
+
+static int
+mixel_dphy_validate_lvds_phy(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct phy_configure_opts_lvds *lvds_cfg = &opts->lvds;
+
+	if (lvds_cfg->bits_per_lane_and_dclk_cycle != 7) {
+		dev_err(&phy->dev, "Invalid bits per LVDS data lane: %u\n",
+					lvds_cfg->bits_per_lane_and_dclk_cycle);
+		return -EINVAL;
+	}
+
+	if (lvds_cfg->lanes != 4) {
+		dev_err(&phy->dev, "Invalid LVDS data lanes: %u\n",
+						lvds_cfg->lanes);
+		return -EINVAL;
+	}
+
+	if (lvds_cfg->differential_clk_rate < MIN_LVDS_REFCLK_FREQ ||
+	    lvds_cfg->differential_clk_rate > MAX_LVDS_REFCLK_FREQ) {
+		dev_err(&phy->dev,
+			"Invalid LVDS differential clock rate: %lu\n",
+					lvds_cfg->differential_clk_rate);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int mixel_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
 			       union phy_configure_opts *opts)
 {
-	struct mixel_dphy_cfg cfg = { 0 };
+	if (mode == PHY_MODE_MIPI_DPHY) {
+		struct mixel_dphy_cfg mipi_dphy_cfg = { 0 };
 
-	if (mode != PHY_MODE_MIPI_DPHY)
-		return -EINVAL;
+		return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy,
+							&mipi_dphy_cfg);
+	} else if (mode == PHY_MODE_LVDS) {
+		return mixel_dphy_validate_lvds_phy(phy, opts);
+	}
 
-	return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
+	dev_err(&phy->dev,
+		"Failed to validate PHY with invalid PHY mode: %d\n", mode);
+	return -EINVAL;
 }
 
 static int mixel_dphy_init(struct phy *phy)
@@ -373,26 +510,74 @@ static int mixel_dphy_exit(struct phy *phy)
 	return 0;
 }
 
-static int mixel_dphy_power_on(struct phy *phy)
+static int mixel_dphy_power_on_mipi_dphy(struct phy *phy)
 {
 	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
 	u32 locked;
 	int ret;
 
-	ret = clk_prepare_enable(priv->phy_ref_clk);
-	if (ret < 0)
-		return ret;
-
 	phy_write(phy, PWR_ON, DPHY_PD_PLL);
 	ret = regmap_read_poll_timeout(priv->regmap, DPHY_LOCK, locked,
 				       locked, PLL_LOCK_SLEEP,
 				       PLL_LOCK_TIMEOUT);
 	if (ret < 0) {
 		dev_err(&phy->dev, "Could not get DPHY lock (%d)!\n", ret);
-		goto clock_disable;
+		return ret;
 	}
 	phy_write(phy, PWR_ON, DPHY_PD_DPHY);
 
+	return 0;
+}
+
+static int mixel_dphy_power_on_lvds_phy(struct phy *phy)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	u32 locked;
+	int ret;
+
+	regmap_update_bits(priv->lvds_regmap, PHY_CTRL, LVDS_EN, LVDS_EN);
+
+	phy_write(phy, PWR_ON, DPHY_PD_DPHY);
+	phy_write(phy, PWR_ON, DPHY_PD_PLL);
+
+	/* do not wait for slave LVDS PHY being locked */
+	if (priv->is_slave)
+		return 0;
+
+	ret = regmap_read_poll_timeout(priv->regmap, DPHY_LOCK, locked,
+				       locked, PLL_LOCK_SLEEP,
+				       PLL_LOCK_TIMEOUT);
+	if (ret < 0) {
+		dev_err(&phy->dev, "Could not get LVDS PHY lock (%d)!\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mixel_dphy_power_on(struct phy *phy)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(priv->phy_ref_clk);
+	if (ret < 0)
+		return ret;
+
+	if (phy->attrs.mode == PHY_MODE_MIPI_DPHY) {
+		ret = mixel_dphy_power_on_mipi_dphy(phy);
+	} else if (phy->attrs.mode == PHY_MODE_LVDS) {
+		ret = mixel_dphy_power_on_lvds_phy(phy);
+	} else {
+		dev_err(&phy->dev,
+			"Failed to power on PHY with invalid PHY mode: %d\n",
+							phy->attrs.mode);
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		goto clock_disable;
+
 	return 0;
 clock_disable:
 	clk_disable_unprepare(priv->phy_ref_clk);
@@ -406,16 +591,51 @@ static int mixel_dphy_power_off(struct phy *phy)
 	phy_write(phy, PWR_OFF, DPHY_PD_PLL);
 	phy_write(phy, PWR_OFF, DPHY_PD_DPHY);
 
+	if (phy->attrs.mode == PHY_MODE_LVDS)
+		regmap_update_bits(priv->lvds_regmap, PHY_CTRL, LVDS_EN, 0);
+
 	clk_disable_unprepare(priv->phy_ref_clk);
 
 	return 0;
 }
 
+static int mixel_dphy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	if (priv->devdata->is_combo && mode != PHY_MODE_LVDS) {
+		dev_err(&phy->dev, "Failed to set PHY mode for combo PHY\n");
+		return -EINVAL;
+	}
+
+	if (!priv->devdata->is_combo && mode != PHY_MODE_MIPI_DPHY) {
+		dev_err(&phy->dev, "Failed to set PHY mode to MIPI DPHY\n");
+		return -EINVAL;
+	}
+
+	if (priv->devdata->is_combo) {
+		u32 rsc = priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
+
+		ret = imx_sc_misc_set_control(priv->ipc_handle,
+					      rsc, IMX_SC_C_MODE,
+					      mode == PHY_MODE_LVDS);
+		if (ret) {
+			dev_err(&phy->dev,
+				"Failed to set PHY mode via SCU ipc: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct phy_ops mixel_dphy_phy_ops = {
 	.init = mixel_dphy_init,
 	.exit = mixel_dphy_exit,
 	.power_on = mixel_dphy_power_on,
 	.power_off = mixel_dphy_power_off,
+	.set_mode = mixel_dphy_set_mode,
 	.configure = mixel_dphy_configure,
 	.validate = mixel_dphy_validate,
 	.owner = THIS_MODULE,
@@ -424,6 +644,8 @@ static const struct phy_ops mixel_dphy_phy_ops = {
 static const struct of_device_id mixel_dphy_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-dphy",
 	  .data = &mixel_dphy_devdata[MIXEL_IMX8MQ] },
+	{ .compatible = "fsl,imx8qxp-mipi-dphy",
+	  .data = &mixel_dphy_devdata[MIXEL_IMX8QXP] },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mixel_dphy_of_match);
@@ -436,6 +658,7 @@ static int mixel_dphy_probe(struct platform_device *pdev)
 	struct mixel_dphy_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
+	int ret;
 
 	if (!np)
 		return -ENODEV;
@@ -467,6 +690,30 @@ static int mixel_dphy_probe(struct platform_device *pdev)
 	dev_dbg(dev, "phy_ref clock rate: %lu\n",
 		clk_get_rate(priv->phy_ref_clk));
 
+	if (priv->devdata->is_combo) {
+		priv->lvds_regmap =
+			syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+		if (IS_ERR(priv->lvds_regmap)) {
+			ret = PTR_ERR(priv->lvds_regmap);
+			dev_err_probe(dev, ret, "Failed to get LVDS regmap\n");
+			return ret;
+		}
+
+		priv->id = of_alias_get_id(np, "mipi_dphy");
+		if (priv->id < 0) {
+			dev_err(dev, "Failed to get phy node alias id: %d\n",
+								 priv->id);
+			return priv->id;
+		}
+
+		ret = imx_scu_get_handle(&priv->ipc_handle);
+		if (ret) {
+			dev_err_probe(dev, ret,
+				      "Failed to get SCU ipc handle\n");
+			return ret;
+		}
+	}
+
 	dev_set_drvdata(dev, priv);
 
 	phy = devm_phy_create(dev, np, &mixel_dphy_phy_ops);
-- 
2.25.1

