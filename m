Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365B4EFE58
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 06:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5458B10E0A2;
	Sat,  2 Apr 2022 04:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C256C10E0A7
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 04:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2YS2eYs4kLHoz4MHcl84peEebgSvIY832xkk1bMhsCfI5nvsO6WAxhqCfjeuq6Pj6e0E3hjh2zKIGPvwd40ujIszQKCvo/1KbnUEaSD4XQzbgKnVgiboa3fNbVKraFkPLQRE++8dNDi0sfDeWC3+mL50oKk6M/lL3pfbcS6GgTU0iRjb7+Q5si4aYY8ClIjQzqpZ3t1gxaaZ+52t3rxeShIFEfFB+pSrlvWp/vFkiugx7HTi6V5ooO1tJIVRhgh9W+QQmKWN0wP+qRSliG+iL1crw0YWnhxqHUJfftYHrJmqjMSFKS3v23ji0ZcxL04D5C9u+RtCT/u/eRr+/YtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjK68ISxlPtPopikQN4Q5k2cGpA/Ce2C8IvfLTxH7Z8=;
 b=N/+lnLJE2cMppfC04OwtpFVwbFM6Wt8/ugNRbbsGhTzKqpHomEXuUCwr2r7ivM4WdBtutICBJE0+3XI5FXOMrOfVt5WYxUNcRy90QREdCH1bB7kUiNbLSVqtR78mxUg8mGOYinOSfIhJ2BmTOtGznalWkg0vimXxxh1VOtIEAeUTMsdYGdqIZrzEwhpWNY5n50ZGAnzuMh/h5pkX84mBKctcUWk/Po8Zr/40UDeYqHgBG+8oplppscBPAj4aYSq8+2FUjQ8cpV+2x68RVUXQPfzg2t9V5IjKj/GRFax2Yls0b97IeyUVVxP7z4p3XUmdWzClpp9+ccH99M5KUJN3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjK68ISxlPtPopikQN4Q5k2cGpA/Ce2C8IvfLTxH7Z8=;
 b=CdWrGwFf9aaATYm/dXppsjhMdsd0rRSkpyTF5oD/ar3wTzn1phgEhHp5umB4mNz6kWzhq53ZqiThftzJpRmg72fQyY9kF2Nu+RByBUG7NCPqksViHJrRFAmkMdz5Otp0jUbS96GTIRbtuG6EwhN5TKnlCib5uQ8uYTW10fQIm7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3210.eurprd04.prod.outlook.com (2603:10a6:7:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 04:02:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 04:02:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/5] phy: Add LVDS configuration options
Date: Sat,  2 Apr 2022 12:03:22 +0800
Message-Id: <20220402040325.2465222-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402040325.2465222-1-victor.liu@nxp.com>
References: <20220402040325.2465222-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3434764e-ac0e-4fc5-091a-08da145d8e46
X-MS-TrafficTypeDiagnostic: HE1PR04MB3210:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB3210C0199563B9C2208C77B398E39@HE1PR04MB3210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ApWD45w7eILS3aP9Jx2zjR31YERRk7PPw/xxiRKxnJi/PoHBaxcj/QSsGVRltM02Q9Jz1tuaLAH8HVr1x4laHSaBCYqfrDtZ9zu0kPrGnCid2vveauLubfiU+DAV/1V2OrHIEFphNYnIUs9p4dwtH56jsG2cV94rOjpfhTfpckXSvRJT8LQXekmcNv1cXKIyR/X8ioSWMKIJWLhhG4fW97FM8gEqWuOsFPqwwQGvVyKP4JGQyfoxVTvYwLz17iWmaGaD5hP7iT4MMuB8GeHaB9MHv3uN0Ze9cjDb2wrxPTj0yQBCmC4LPM1lVBAZUmLSgsuDcaUBUt1mkepcsh3EyIHQnQB4GfanvLgu89cF9Zxf8y156PHWZCpgMokY5ANx5FHMIjGjTtfIjfpH7btkozkOyuIlLhUcZdn6/qFK+iEAKJPx/Z0px1A8QrQpkxmZB026tCylEX4khlxEuSO/EyoRkzvV4GF0lhwyzky8E4/aNIpWHrr1aNo7NZChfDWB0HoqRhmhVZlDFpqAYG2y+C89oIdpmbykhBJio9mLEeXWuISN8T4zo5ruB9kXtHc6OGiMKfmwBulwR/WtDsb9lLd5hVNSs4oujUbJEUU78vkdkPomoA2wDjZEUGMR26RXZjRr/F0yGhiFgLQNddWTGMuTbSmOgPzJ7Ni//3pFVurRxe81jB+yecEqfSWI9sLihqfm8g5ikYjQ6lw9rKklAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(186003)(26005)(2616005)(1076003)(83380400001)(4326008)(8676002)(66946007)(38350700002)(66556008)(66476007)(38100700002)(2906002)(36756003)(7416002)(5660300002)(8936002)(508600001)(52116002)(6486002)(6666004)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71RD+7bDpNHAOzAKKkLSog1YUNnqBZRyG0sTWArQ7/T6+mgNUsrK/JE6jAFY?=
 =?us-ascii?Q?FJYvjHsYjy1juPpZVTfI/2qGtpEJJycWnxy7Gj8yVk9/0neTf/jzkAQPbS4t?=
 =?us-ascii?Q?ZBk++dRGnlJUwq0wfoB2L1uptqM/VvsL3XvA9nbGSfiw8E71L8+BW/pwMvPp?=
 =?us-ascii?Q?cYTQ1m56ZEKkot2kwZJ+i/UpeIYUIODIuk08+/gCFFs4Hlc0GXF0738Vn6kt?=
 =?us-ascii?Q?YSoOyMm7/w4PSmW6dlmJYYkhoe5y1P5RkcoClf9sPH/gDvHHiKuJvLJj4Iks?=
 =?us-ascii?Q?0CupEvLf7mbdTUT6SvT+ysYoZvSU9Q917wd2SBKYqAziwe6jVEy9D50jat2O?=
 =?us-ascii?Q?QkoBHQhbZo644zC8yRf7YeO0yLHoh1n7g3XiKih6Xbg79VAlVWiSeY6zsWNr?=
 =?us-ascii?Q?8xpih5ESwOlH1U1TkP3u2TI+EuW04zI6+a4kTDXe4TlAfmfDosJzDIIcfjSa?=
 =?us-ascii?Q?apbgdz6nKhQY9CzgnjwSvg3kgP2Rfx0IOf07wz84cYQlzMAhNpMZjdk1ZqQv?=
 =?us-ascii?Q?Maqo4DcxJnCCP47wp9lWEQBHpYSF00UFVuAVVuEpDQLzUGV2SkxmgLWHCmGl?=
 =?us-ascii?Q?YEMFYuANhgezEbSDCc1+FPhq071BjVSFr57FfJHwc1VkWFqLBXV7k3PKPp22?=
 =?us-ascii?Q?r8jnK8toxZJDLLEbv8FCandL2nhKdsRFg2BNEa1e5spEI9PQjtoTnFmWGP0h?=
 =?us-ascii?Q?IVDJZzLjw7WWXalDfuBbB7Mz61g+pqgsgbFnTcpK5q9e36PDXOqHard9oPac?=
 =?us-ascii?Q?WJS/TTaAQMjHiV9hDfuo2doVm5RJuZp5CDmGhnsgpZyyS/f7PmNOcxMZShXw?=
 =?us-ascii?Q?gQu7lcHgZQYYPM1ZAn7Hd/gwqC+rzED1SmzZK4b44gqulAmQCrDPB3rJo6Ou?=
 =?us-ascii?Q?rKHRoMHUUxpqPH74wsKyLff/1HfOhCpKpX/klLW+ZygOqlpBU5EFuAQJtQOm?=
 =?us-ascii?Q?ZXGnLMdD7x8vYWqLsXJajMWHHLR4RiItguyHgtXZv4mcsgkJNrLuFV6Qmcs7?=
 =?us-ascii?Q?jlLup1+rdbQp2ISvjaB8t7oU1L6ZSzr9GcaNrYIPD92i2UlJc8wwtXFImJeL?=
 =?us-ascii?Q?KYpUL/9PBujMJe2fsKOuHafpj9zZbuxYxGvHauJffc56ULYjJsmtY5BljCok?=
 =?us-ascii?Q?6BMOAePhzpx6rajmKT+NJUGW855QcVStlH2i3XPHlIx6cwl5+SNxYcsBVqOF?=
 =?us-ascii?Q?u/G+v6agVyGcG6wZLAzRh/kdiuUe/6McLPBe5q9PTBR6o6Axjc16Hsz9UCbl?=
 =?us-ascii?Q?LVrttzrwdlBcUfePAJtVPvQaWg2g5KT8zyuMjup+UgeASuV7KHrZoPUGbYcC?=
 =?us-ascii?Q?QU0biCkgzfULkuwZPtXrrWvUchLWdnXatI75F7zjyqVEBurpDt07mSHKha07?=
 =?us-ascii?Q?RIwzZvAerXj78Raw/FHq1GaR1CYlMsD/hqNVi87pql1x2y6HMPi6WVlTCCjj?=
 =?us-ascii?Q?LulVbuvjFSf5hqkiVYKDo99ehd9ospoLfAhm+N81ie5l5tKXo+ZIcPQeP8yD?=
 =?us-ascii?Q?CZdkFcnV0ihQGVBeoRWdvgZ7UfAJjxy3Hiz+OcSmSTa4Elg49Czwmxew0GoH?=
 =?us-ascii?Q?gW66uuuSPUXiKxZAkpLO8U35FKbMIWIM+FvQIQga84tChwWGZpz2wwa82D+Y?=
 =?us-ascii?Q?46mVnuRKN8ATOWKV6WCbRzGS4eFSGKu4fX1BfANFuA/OK+GW63hXpCPmMAa2?=
 =?us-ascii?Q?/x94ahgojewEJzKG9hpkdyLBlq7jPazP0PhyPdcWOJghejO79PHPfiYbDAD2?=
 =?us-ascii?Q?MXvwwlOtsg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3434764e-ac0e-4fc5-091a-08da145d8e46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 04:02:08.0782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9QTPly80UCZjB4BS2wAz57X6Ltk5LjOLBGsX/xNi8Wpjx1KI2cdV9IQ1oi5BUU97E3QwqhaZNkq6buiwB8I8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3210
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch allows LVDS PHYs to be configured through
the generic functions and through a custom structure
added to the generic union.

The parameters added here are based on common LVDS PHY
implementation practices.  The set of parameters
should cover all potential users.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Rebase upon v5.17-rc1.

v4->v5:
* Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
* Trivial tweaks.
* Drop Robert's R-b tag.

v3->v4:
* Add Robert's R-b tag.

v2->v3:
* No change.

v1->v2:
* No change.

 include/linux/phy/phy-lvds.h | 32 ++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  4 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/linux/phy/phy-lvds.h

diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
new file mode 100644
index 000000000000..7a2f4747f624
--- /dev/null
+++ b/include/linux/phy/phy-lvds.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020 NXP
+ */
+
+#ifndef __PHY_LVDS_H_
+#define __PHY_LVDS_H_
+
+/**
+ * struct phy_configure_opts_lvds - LVDS configuration set
+ * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane and
+ *					differential clock cycle.
+ * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
+ *					differential clock.
+ * @lanes:				Number of active, consecutive,
+ *					data lanes, starting from lane 0,
+ *					used for the transmissions.
+ * @is_slave:				Boolean, true if the phy is a slave
+ *					which works together with a master
+ *					phy to support dual link transmission,
+ *					otherwise a regular phy or a master phy.
+ *
+ * This structure is used to represent the configuration state of a LVDS phy.
+ */
+struct phy_configure_opts_lvds {
+	unsigned int	bits_per_lane_and_dclk_cycle;
+	unsigned long	differential_clk_rate;
+	unsigned int	lanes;
+	bool		is_slave;
+};
+
+#endif /* __PHY_LVDS_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f3286f4cd306..b1413757fcc3 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -57,10 +58,13 @@ enum phy_media {
  *		the MIPI_DPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
+ * @lvds:	Configuration set applicable for phys supporting
+ *		the LVDS phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
+	struct phy_configure_opts_lvds		lvds;
 };
 
 /**
-- 
2.25.1

