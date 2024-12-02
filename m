Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B49DF941
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BC610E637;
	Mon,  2 Dec 2024 02:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Jwcu11GJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9C10E637
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBDpOiAhE2UqBz1AZa7GQxGgQStqj6WMnXMdZ3tnqvVhzPOn4AQLHOZQQCK1CLUYXhJvXFpy9ySbVMNXGmnQVJPi+ahIluPQJRFqqQunNYax+PK7RUSynxumpoJMKIM8PteO9Ix62I1mr/V6RJBIZoF8++NulLOXnBL9bkV6ll21jvzmhO9CWcFqhXz0KytoLk2gNlK1DXqMhIrQv/dqG7zGBjBihhovpcGcAX8FdxiVTj0XEqIa9DkemhwBamQjaJqevYtxwns1tCM+Aoq5jqIOZNn94DeIuCMsXRlTJbBkkIsKiOHMaXlZAXswqHsFodcg7+RAXlwVmo8ApYYHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM6SJETtblSsgmq+B+GEYeY42x5V6WqYe+ZXBLad3kU=;
 b=h9T+YsWcFXzknBoo3c0cgDyxMvGgOcwY8BkYLsH0Ll+pKqG1ZseNe98MHkfLDzv6rVyYgtcLK6Cwj+vMGhVvc2E9hhKggzTsgfx4gzJEcFRBJgIccUV1Dp8CBoAO22BQVjhdE3DYnRpQSle1gwGhYfJzXmOl9u+1fIj4n8/T1qH56WdJ2nDawGSz6EMXkVNo8g807CTe5mqFMoLkwX1/5RijFTHgMeqSW++kRLmnzutLuwtUadXXIYWsJ3SJ6LMuJBZ5mVBIQQQk32tPBmpspnvntac7fcwJ2qzBDmpqN2nwjJF4eh3Cwtjkm4Cy40+klMWykH2tD1kqx8vMQLHU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lM6SJETtblSsgmq+B+GEYeY42x5V6WqYe+ZXBLad3kU=;
 b=Jwcu11GJoL0gZS8PylFmVl0zVmrotEMhevDDMg7BMfGvZFGBGhp+Pqt8wFgUF30Z1JosBdNpiS8bWB//Kn3c/kY2t0GnP0j5RW4QdTrcraDLUi1s3sA9XFLddJBMT6DR9QnIlYpC9ZAnJO1Yb1wVURdOheeA30aqCANZWDNlrLTKMUth8XBXCHectGWW+VTvNVdCbGyrjP8HhdlO/Z+LXv1TdBZO84F1lz5/1RY7kwJC8aZ2xDgpzXYDv0b+TF1VCOAY1CqCCZ1+Wr9UYuSNH12EDfPvtb1QbX/5VdCW0KKCxPXGBnrgrPo1HmeW+kF8FFepX/6VK2r7B03kmn7EJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:58:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v5 17/19] arm64: dts: imx8qxp: Add MIPI-LVDS
 combo subsystems
Date: Mon,  2 Dec 2024 10:56:33 +0800
Message-Id: <20241202025635.1274467-18-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 98bce07c-f3bf-4d8b-6398-08dd127d37e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rKsi10p1MyRxmV6Dq8b362LM9c+VLzmD4DOlx3TjCmtp7vYxEvXrriHXF7M4?=
 =?us-ascii?Q?uVo2t6A5CiQa5heOpLVF+2miIMhjTy2U8aLekfJk1U+ufvipUxhXCTZrLlId?=
 =?us-ascii?Q?VHRMbaKVoh6wz21PvNautnJH0FgT3QuOxF0K720RpEl7uU+Lky8iyADIFyAL?=
 =?us-ascii?Q?CM3mgi5Bqi0arG5lv7j2NMGqAIZR1NJZE3ERk6RyX5sPZR4V1wWlLyP3mHV7?=
 =?us-ascii?Q?mdQAYH/v0QifWgWyX6mhe3XxDk/89P6KsdohweEnvPBhVJ86n+xGGNlWZ8G9?=
 =?us-ascii?Q?Mk20EgK324oG9Q+2x9lEKlAeCXRkMjsN1CkfKHyqG5RTRz2UUt124N+WvBM6?=
 =?us-ascii?Q?FSQJLRdpfKMx0U2lNIA9anCVukzVuerTvAGj+1KxRAg0drhZQuz2SfPk3qF3?=
 =?us-ascii?Q?oeULGYCpvlaQjpKDxGWrZvrrXZLnrZ5v7M23ceGeorLqIKfW5qs2uq6e3zO8?=
 =?us-ascii?Q?IPsR9HU+Dr9/EpSXBeZzooPQjJBk37V+w5DW9PJ+TKMyeFXPH34Eq0QDLktS?=
 =?us-ascii?Q?+8t23RjVuYFwGwVhX6Z3Zteb/a6wfPURwniV8cvcn4aQkHRAdWo9Fz+mbn+F?=
 =?us-ascii?Q?7/J20jaFxx8tpdatCKBTWpiiZxL2NnX5+69i/3YyKH2Egz4UqjdSKgXG/pLD?=
 =?us-ascii?Q?sXT/snGLBBSE5sDxa6rVvc+PVzPPeSr1lFMgSnhR21NiufHPNd7HhpOLtZjN?=
 =?us-ascii?Q?75YG8nlIjwfBoDmkM5I1A+M+IMhf3ojB5mu7DouBIwMxxUXG/jQO0OCR5jhP?=
 =?us-ascii?Q?2m3CYfZMymS7tu41zp3Jvvujo1KTXf2BNFDD80oLlYKyyIbqkPrhHlP0yyyW?=
 =?us-ascii?Q?X90Po406g5LxAZZnbY9KMEc8uYINAvJrggSQfm2x0BDqHAzKmrFhj0IgPw3I?=
 =?us-ascii?Q?AZVZWo1Lqlbqz+8euRsgzDTQ7g/HXFIrfTgN7I6QbFfY2qPziAO5xuKibDYN?=
 =?us-ascii?Q?TqBlMTPwAurj/Oadz6DNLyg0eT/TTy1fbazxKexaw/KY9ma/oNI2NJxv9/Q/?=
 =?us-ascii?Q?IStpGRCQc2pwdeY3b++1RtH9pe482HPct07bYMwYrcVeQ0shN/yt/DvSpwHS?=
 =?us-ascii?Q?wNL0KBXgVIRYh3VEMUKyZ1xQwml0prcm82Ge9sGBxUdY/bCSVcxHf56dO1m+?=
 =?us-ascii?Q?eDNN7+xFw/ZaBPXoAB3zTKZLa/7GlXRqvJU4aaq1NwHzJE0bVBbe5Y3ih6bz?=
 =?us-ascii?Q?JklmlDkJ0EgvAl0UhWVXS4lLi2grBpkt1PELkj1FqaFu/NdDhOBurTTCD3A/?=
 =?us-ascii?Q?/UURL9EnS2XTO6xMZBO5OclZyi2ulJN4EvkhWtoEeNOmbOL5ftVqWn2csfK2?=
 =?us-ascii?Q?ob+v/MaMwadrU67w0KWWI8ii1X8GIWCxsgD3Z+eLsL42WyE0V75kJ9SusEJ5?=
 =?us-ascii?Q?A8nl4hgaZGdYxkqwlgbOYlwpU7Bz9wUqJjCytS4PT9A0QwqbvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6JPf8vUFHHInzlEzTtWlmRFLb1TYvqwVqCCT0dCKKXW3calSBycLb1xh4rYh?=
 =?us-ascii?Q?4TgR6Ptz7M4c2z+5yyshChw5x3ZGnxQemM7gmOEOtJIDR6DMctHSaBi8l4p+?=
 =?us-ascii?Q?CR0E0/Cde9L7xIwzyyrFUOprRgHeuh1hDA3gYW1jLIqje3oddIbLGj/qV2qP?=
 =?us-ascii?Q?lXoBp7+Zzc/Ql55C9QVUe+y/eIp2wX/HtKmQ2ZW2O1hEbOF9DyMLHiQmjVKM?=
 =?us-ascii?Q?of1H1T11gc3VISmA8AVgdndK2qHM3ieAEXJhaihvxKgibHSbDRyI1PxLFzqQ?=
 =?us-ascii?Q?Y4y+/pfiL7AvwPOICilgpj98k5ZwrfZcsnduK7z+pWz+n6XbSvQykVupbt9c?=
 =?us-ascii?Q?zdT2RcNXoA7qQzEBvAF1MrmsWFAbkcXi6KmMupe8ICmTHvAXcE2iyjSj4H0t?=
 =?us-ascii?Q?aP2I55wixquwPfvSEbbuuSoVcVXxZKKs+ve1q7Pge5Ffj1HVGF4PpRiFHp/S?=
 =?us-ascii?Q?mFUqc3mH8UTvwTZvP2iqrF2g6YpXtkmYVI+bq1/Bq2PE9UIuLodgGwjfj9B3?=
 =?us-ascii?Q?6oZOIM3kyK1pyYEjokKJAsp/hrr0LNPxlhH8cYK0Escl721bMrUYc4As2pKL?=
 =?us-ascii?Q?97oZEOpait4eeQ+MRjdQw55r3DnG4s2MctrZjm1XHJhvCWUl8O3piGQE51wF?=
 =?us-ascii?Q?ymZxeSfT83ayEgPlzDIJRFUPK1D3/mP1IO1M56ZWmJr8kIL8KJu8ODaB9sbE?=
 =?us-ascii?Q?EkANfLNxPn9POjnP/6waSGKtU7V7rx2lyHTIffEV8xXv7U3sflFwjs+Xmtok?=
 =?us-ascii?Q?Yezrs/B6LxuJm8MXNVlN8AF99mS7aadVJ/VkYU/jYY4uzdEWNVFPBqD9un17?=
 =?us-ascii?Q?dbmvABjhLlc3HmXGVKEjyiMtTvPJ/NWYLZzzUT6g0pYAFajvFz0pcmq3kLzH?=
 =?us-ascii?Q?h9H3buB9UqnrNOxgRiDPVz37aV6QWd1CtmGz1nQKVsi5rt+SAwlZ/SR0XXp8?=
 =?us-ascii?Q?Sluwtzj5gVvVLkG+yXidSIok7pzYCs457MAM4hEy26GASnWipbKq1IqZ2YOi?=
 =?us-ascii?Q?U+Q8S8nIWN7yu5noQg7NOOH0hokdSv+wRsGi6drg/4VUz1BrTCkPE5bHCl9P?=
 =?us-ascii?Q?kG4wbp4q2kqjaDi8OVFP/pbIkntFLgcTTtt3u2e2nqDWDp/Aq6JtT/ihjMTI?=
 =?us-ascii?Q?zLg22EDaiDJj3Uy/YWnwTO3fyrGrACtzIf1x02Sppstck7uwh+GPmA4Svsme?=
 =?us-ascii?Q?NrKaJ1hhbizfvYrcKaI41KToN6aDDPOUmogCN3uWPmaOGH3f4+j5laLr+9oY?=
 =?us-ascii?Q?7cIIrnpu65169i2kGKLRBDe/yGLFxieS81XvjMV6l21hkzU9fr4HR03UlpFm?=
 =?us-ascii?Q?qW4nPV32MjPb4P7ntzt+SOVMt/g3xkYuK8SGEvLe0LpMS6W4Wp3xC0vjeSbt?=
 =?us-ascii?Q?IeoXGnleYybDte4acxfWeKhjtR2g2fXg7CFPrekp0Jkwl1f5STBueiL+CQx8?=
 =?us-ascii?Q?NQIulE2LGz14jmEXphDhQYYZMy+NdCcEt0qvGTQ726Jww5gUci9fvk2u3ASZ?=
 =?us-ascii?Q?c9slilsxwvbY+XO8UEdOAZLkLUKdi3ECWT1FvACpyMJmanyhZoHjaz4FXctK?=
 =?us-ascii?Q?izVwr9Rfk9IsoPFAWOzjPRHyXKyAjSeXa2GGZkHM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bce07c-f3bf-4d8b-6398-08dd127d37e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:37.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVw6o64ZHfcFgV2IfVKsZn4+O3LyaHNz75UtVn7UXyFCkf/CfEoWK8IxnLxk/EHNZL1LR0u3uMhRyWGzaEFkzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
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

The MIPI-LVDS combo subsystems are peripherals of pixel link MSI
bus in i.MX8qxp display controller subsystem.  Add the MIPI-LVDS
combo subsystems.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     |   4 +
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   3 +
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
index 299720d8c99e..94c46a20597c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -152,10 +152,12 @@ port@1 {
 
 				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
 					reg = <0>;
+					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
 				};
 
 				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
 					reg = <1>;
+					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
 				};
 			};
 
@@ -207,10 +209,12 @@ port@1 {
 
 				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
 					reg = <0>;
+					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link1>;
 				};
 
 				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
 					reg = <1>;
+					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link1>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
new file mode 100644
index 000000000000..fa7e7c33518e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+/ {
+	mipi_lvds_0_ipg_clk: clock-mipi-lvds0-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "mipi_lvds_0_ipg_clk";
+	};
+
+	mipi_lvds_1_ipg_clk: clock-mipi-lvds1-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "mipi_lvds_1_ipg_clk";
+	};
+};
+
+&dc0_pl_msi_bus {
+	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56220000 0x1000>;
+		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		clocks = <&mipi_lvds_0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+	};
+
+	mipi_lvds_0_csr: syscon@56221000 {
+		compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+		reg = <0x56221000 0x1000>;
+		clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+
+		mipi_lvds_0_pxl2dpi: pxl2dpi {
+			compatible = "fsl,imx8qxp-pxl2dpi";
+			fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+			power-domains = <&pd IMX_SC_R_MIPI_0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+			};
+		};
+
+		mipi_lvds_0_ldb: ldb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx8qxp-ldb";
+			clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+				 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+			clock-names = "pixel", "bypass";
+			assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
+			assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+			power-domains = <&pd IMX_SC_R_LVDS_0>;
+			status = "disabled";
+
+			channel@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				phys = <&mipi_lvds_0_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+					};
+				};
+			};
+
+			channel@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				phys = <&mipi_lvds_0_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+					};
+				};
+			};
+		};
+	};
+
+	mipi_lvds_0_lis_lpcg: clock-controller@56223000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+	};
+
+	mipi_lvds_0_di_mipi_lvds_regs_lpcg: clock-controller@56223004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_di_mipi_lvds_regs_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+	};
+
+	mipi_lvds_0_pwm_lpcg: clock-controller@5622300c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5622300c 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_0_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_0_ipg_clk>,
+			 <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "mipi_lvds_0_pwm_lpcg_clk",
+				     "mipi_lvds_0_pwm_lpcg_ipg_clk",
+				     "mipi_lvds_0_pwm_lpcg_32k_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0_PWM_0>;
+	};
+
+	mipi_lvds_0_i2c0_lpcg: clock-controller@56223010 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_i2c0_lpcg_clk",
+				     "mipi_lvds_0_i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0_I2C_0>;
+	};
+
+	mipi_lvds_0_pwm: pwm@56224000 {
+		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
+		reg = <0x56224000 0x1000>;
+		interrupt-parent = <&mipi_lvds_0_irqsteer>;
+		interrupts = <12>;
+		clocks = <&mipi_lvds_0_pwm_lpcg IMX_LPCG_CLK_4>,
+			 <&mipi_lvds_0_pwm_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "per";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_0_PWM_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		#pwm-cells = <3>;
+		power-domains = <&pd IMX_SC_R_MIPI_0_PWM_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_0_i2c0: i2c@56226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x56226000 0x1000>;
+		interrupt-parent = <&mipi_lvds_0_irqsteer>;
+		interrupts = <8>;
+		clocks = <&mipi_lvds_0_i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&mipi_lvds_0_i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_MIPI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_0_phy: phy@56228300 {
+		compatible = "fsl,imx8qxp-mipi-dphy";
+		reg = <0x56228300 0x100>;
+		clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+		clock-names = "phy_ref";
+		assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+		assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+		#phy-cells = <0>;
+		fsl,syscon = <&mipi_lvds_0_csr>;
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_irqsteer: interrupt-controller@56240000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56240000 0x1000>;
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		clocks = <&mipi_lvds_1_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+	};
+
+	mipi_lvds_1_csr: syscon@56241000 {
+		compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+		reg = <0x56241000 0x1000>;
+		clocks = <&mipi_lvds_1_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+
+		mipi_lvds_1_pxl2dpi: pxl2dpi {
+			compatible = "fsl,imx8qxp-pxl2dpi";
+			fsl,sc-resource = <IMX_SC_R_MIPI_1>;
+			power-domains = <&pd IMX_SC_R_MIPI_1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_lvds_1_pxl2dpi_dc0_pixel_link1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_1_pxl2dpi_dc0_pixel_link0: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_lvds_1_ldb_ch0_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mipi_lvds_1_ldb_ch1_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+			};
+		};
+
+		mipi_lvds_1_ldb: ldb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx8qxp-ldb";
+			clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>,
+				 <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+			clock-names = "pixel", "bypass";
+			assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>;
+			assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+			power-domains = <&pd IMX_SC_R_LVDS_1>;
+			status = "disabled";
+
+			channel@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				phys = <&mipi_lvds_1_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_1_ldb_ch0_mipi_lvds_1_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0>;
+					};
+				};
+			};
+
+			channel@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				phys = <&mipi_lvds_1_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_1_ldb_ch1_mipi_lvds_1_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1>;
+					};
+				};
+			};
+		};
+	};
+
+	mipi_lvds_1_lis_lpcg: clock-controller@56243000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+	};
+
+	mipi_lvds_1_di_mipi_lvds_regs_lpcg: clock-controller@56243004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_di_mipi_lvds_regs_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+	};
+
+	mipi_lvds_1_pwm_lpcg: clock-controller@5624300c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5624300c 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_1_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_1_ipg_clk>,
+			 <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "mipi_lvds_1_pwm_lpcg_clk",
+				     "mipi_lvds_1_pwm_lpcg_ipg_clk",
+				     "mipi_lvds_1_pwm_lpcg_32k_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
+	};
+
+	mipi_lvds_1_i2c0_lpcg: clock-controller@56243010 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_i2c0_lpcg_clk",
+				     "mipi_lvds_1_i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
+	};
+
+	mipi_lvds_1_pwm: pwm@56244000 {
+		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
+		reg = <0x56244000 0x1000>;
+		interrupt-parent = <&mipi_lvds_1_irqsteer>;
+		interrupts = <12>;
+		clocks = <&mipi_lvds_1_pwm_lpcg IMX_LPCG_CLK_4>,
+			 <&mipi_lvds_1_pwm_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "per";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_1_PWM_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		#pwm-cells = <3>;
+		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_i2c0: i2c@56246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x56246000 0x1000>;
+		interrupt-parent = <&mipi_lvds_1_irqsteer>;
+		interrupts = <8>;
+		clocks = <&mipi_lvds_1_i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&mipi_lvds_1_i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_phy: phy@56248300 {
+		compatible = "fsl,imx8qxp-mipi-dphy";
+		reg = <0x56248300 0x100>;
+		clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
+		clock-names = "phy_ref";
+		assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
+		assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+		#phy-cells = <0>;
+		fsl,syscon = <&mipi_lvds_1_csr>;
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 35cc82cbbcd1..25adc1090dec 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -55,6 +55,8 @@ aliases {
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mipi-dphy0 = &mipi_lvds_0_phy;
+		mipi-dphy1 = &mipi_lvds_1_phy;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -355,6 +357,7 @@ map0 {
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
 #include "imx8qxp-ss-dc.dtsi"
+#include "imx8qxp-ss-mipi-lvds.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

