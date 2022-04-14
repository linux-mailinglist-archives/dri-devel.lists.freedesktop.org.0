Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5651500699
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293410F235;
	Thu, 14 Apr 2022 07:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B98210F235
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc53NfyL2UIIZnhyeYkTdovegj/BSylCcgqxcuLNSH7OWUg1/hdyoXU3s++3lzAtoCAeeyEeLmXfYt6nAnBYTq1at07aBJ3QkGxDzlECNGDPm8x7f2MCXHBwGpWbRNGon0NzZUG6U092noGWlSiL5IxS8/WvHli74BNjSl2XQ8bv3vmUqBBMaxyHApobZuMBDJ6bUgkI51I/VJj+nIy7HHvVXKQKXBqbSFHYNW9WvjzzvrjdiKOulavOjWN01fycUTNRqLf3m3z1QdJYdsurYGcrGd4vevzaQgtXD8Ww5poNAuWO5s8KixOhn+JISU5bGrhmvswkOUdtNjQKJjnkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zikVNYi3cS+FrIsX3tOfjPXYjapqrG9gbDqBXBxuQPQ=;
 b=jcVebgU/DDUPtnQIbZ7I95X5rPHU6pYB3lymJI5kNod+4S0gkbfy/XmtFfPaC8cSB91tccgE1knUX1Utv/CMBsIULt+Q4fy8sCUShmd4yYHVXcHT9v4DA0Lg5Udki92KrRqgOBjpvTKDy7VbIDLShercJNbEuV8flUxdCW//gsSuKk7CHtYlKZ4ydYm13MDydguiQfddjFB9O5oPSA0evLzrDyJdYLQjXnRzLRuaO2/iSmhmAFH6YZYmsAHjRolqfbABrRiftjchHuk+qqZBaONLEEBiI8+LA4d5veYx7DQr7V7DlVdwdp6aHl9vilQqAqZhMnRJ0FzDUM7TgKHZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zikVNYi3cS+FrIsX3tOfjPXYjapqrG9gbDqBXBxuQPQ=;
 b=s6ne/lnwLa79o4AaeJXpSXngLuCZvvXfpJwm6P13ysBoK6ry5KI33nU31duVoex1kYOMkoHICFlUwfmjClny7NJ1ePgCdO8xnsJTMRvdAK4mHphmdg5gS8Cl1+emLu2jt4+Fidzz0BUHeWjcAgcBubhrfrVl6Dz1l0m1CKtz0Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6714.eurprd04.prod.outlook.com (2603:10a6:10:10e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:09:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 07:09:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 2/5] phy: Add LVDS configuration options
Date: Thu, 14 Apr 2022 15:10:36 +0800
Message-Id: <20220414071039.423271-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414071039.423271-1-victor.liu@nxp.com>
References: <20220414071039.423271-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fc22ae9-9c6d-40b9-7895-08da1de5abf5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6714:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB6714267B15EF2D6869AF292998EF9@DB8PR04MB6714.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8k4ZHvr9e8mt7JKbAplSYiHuA1t/+ItDbdk3avWVqLr9iDNJnnS3hcq1mP9nmsTIFGRMghOT8eQ9WdkT9kA4SaIafrMkHYyP1rhivwqjQwBqb0SKD9fJlqcjlqi6QvdSqeLzL2Y9/1Ngpji/i1NZPsgVpkHqp3sW8HF12XYqE1JwNFnsbzo2Gf/XhUP8gOsf+QDalb25eQwXUkp5ebktTImUxPI/VjvPhPVQfNRuNXnImyw094hnNJ5zENzUoZAwJWbH9HFFejLFIuptrltopET5QyOAkHW85i5lLtZlvrOOTTgO8KIV14btRFhlUKOMnigogScEEM8Gj8zQmyE5B1uY144myQ55MYjZeooL8BzKV6jsxmQQZi3Xl5nE9HR8+UQn8wG5KM8rx+4rhEGwPXIsyju4uRsBh3D6yP0azKAlJsZeY/0CMYZdvfAQtB/wa3ncUj8EMRJREVt7cl0GLDcxTcd3x1x9ysqxqfaHZzHX9Qh9GOkpQZ7urTE7xhCnlzk9oCt/gmYUQDpbFRUmlwsEYQuSWlukvz76xARUnRlrthmv8AB5Im0UwswlJKcNZZLoy4HJcWiWoR/m8L3GkMikfl2bQSyFXyzcsY1ImzzmaWtrIesmDpVv7EEEKptawL2qR8vDSZGV1J/HxuUYbA77WuRX431EOXshNp2hdcUiPRyv0oNKC1vAJntAKlfgqaQCsW1TodTgkNuRtU0nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(1076003)(38100700002)(38350700002)(66556008)(316002)(66946007)(4326008)(66476007)(508600001)(8676002)(86362001)(2616005)(26005)(6666004)(6512007)(52116002)(6506007)(186003)(7416002)(2906002)(5660300002)(36756003)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eRBz+psjArZcniD5VQOrVRXhQZ12IUU2HqFq6DF2ljz/S9KYaQuU00hx9FjR?=
 =?us-ascii?Q?mBfSlpEZWtbSMN2DlyCqFu5PG/eIOGMLLlYiInIKnjIBszMczxNps+VNeD65?=
 =?us-ascii?Q?QPLM9bwuoJtfzygI+/LA9JgAuXmGlrIOmTlL8h5N72muHdSwuw2GgJVvquvw?=
 =?us-ascii?Q?cekB0+IncsHCFhJ1u6tESf2BFB2+k+LcXLHfibmnPuY85e4yzeiBoYvEx5CR?=
 =?us-ascii?Q?cVBh4oaMiXizuJ8NK4vAizieRUAMnI59BXWG5rFoOpq+1ln3LwcAogj4univ?=
 =?us-ascii?Q?kTfaA94M7MEoElqqcAGuKAR+k2tbaM9Znr/vEeXJt/i71Ny6R80VlglhCPYx?=
 =?us-ascii?Q?JIeFzDe5RWfFfJZojuuttNVOW8BPoSAGB3z0pzSiT80+sygAIgWzbEhjNgPy?=
 =?us-ascii?Q?+ku9aK4WAr50cZ5Chdp+RZD2eacBl8EmkvmoY/edhxywX0ZEsfoFCvtWka4M?=
 =?us-ascii?Q?KSmOzqJ22HvJnWpd5BXmAvramDanZlwaAOC0pB0iVWzDI49sbLKMW8g1VrVQ?=
 =?us-ascii?Q?WRce7C8w+ifY7XK3ENiWyerOg10qX25MmZlYf7nJMElCR1QT8xH5JPFVd4K6?=
 =?us-ascii?Q?0M6QOJvLi8wEQIIJLAWIB4JXZyn3fImbvIVG9BLEgak0jKdyvk3vQlyZEeJU?=
 =?us-ascii?Q?12/BdX91yMfnsncSj9D68zP8peAiv3vC0AJvZVc2/IWUk4FzWoZgiOCTKQtl?=
 =?us-ascii?Q?tkHBC5uiCGYqM8pn1X76NuZkmcoDOs/fto3obIh6ClVqWXh15mkkdsW6jsGn?=
 =?us-ascii?Q?enyFUwNokQmHr2FJm+SZsu+6gfwk+NrpuAwMw39nbLG0XxB+EnTBRSRHcUEO?=
 =?us-ascii?Q?SlP+HjlJshv71wyaZqDzWxpkxLcSMHugitm1v+gR8iA4UZJm/2iYuWQh9V7W?=
 =?us-ascii?Q?HMvrXqYuUcYq558IuaLH93o6v4PN+G2b2T0KiJA/wMJoYmWgMGhpEu/R8i31?=
 =?us-ascii?Q?xQoBNSBJxJwT8VY/yU1eFt2m1py2B5eOB5s8Jw1j8uFI5AGTklHJ5VGt7HZk?=
 =?us-ascii?Q?+B422FESOKXnwYq0LZmtElQyxrl4Xppjd90q54fltO9dXDugnrL0b3t1mst8?=
 =?us-ascii?Q?ue5NuUbd2Dw582lAeA3/G7BRhsB0bQjFZJUmmFLUdArsFk6sVX8Ts3iRRH+/?=
 =?us-ascii?Q?lWfbV38JpU4kbaXUIwVQo92TTVP3Xfpn2+rWg/EFCK0nhhyNImG1bG0KW7tO?=
 =?us-ascii?Q?CCylzqrETOeHLvWxXh1bkTaHE61PxkyPAeh9GeAf9yqRnFTuQANgzhqgHLiV?=
 =?us-ascii?Q?FoYVkfS4zQ0gXy/Am2+7eUa5s/bhHLiAQcXg7mZgjEnM5Q6y1CwLSUjMxgtN?=
 =?us-ascii?Q?0hqrdiKooUxDrhTw4u5h+1lkaQP4bxq5ik77OtFy3n5TIcCxmBhJqFbowkLT?=
 =?us-ascii?Q?IDWpQyrqMeT8EbUhK1UNFMJbMKy2CL+qQ77YUe4Sv9urUGYz4HWODD0PEXkY?=
 =?us-ascii?Q?rT75Tn6DZ+hu9w9boW+H+wW8t1oKc55H6u9PmjSYRSfHJlVEPFRycrd7kTkW?=
 =?us-ascii?Q?3DWZGYRvB7l8w0Y62WLEh5xWzm9lMF/e8WC2T+61u3w5LG0BA+AEry+NTVeq?=
 =?us-ascii?Q?5NGuzSY3B5aujazhPdDsQ0eom9c9p+nSqNph4OUdTMDUpchCtBO77Iks7wOa?=
 =?us-ascii?Q?vkHX8ZkmGx73rn+/zH9aAoy7ogNpv50m+bBFBzqLHUUCGb/+vY8otORFTlKm?=
 =?us-ascii?Q?cwRJwj66OxLqZZxty2XC/xd2ZgOSsQPjA8iquNsVLX+Ns4/Ep3G7eegoHtEd?=
 =?us-ascii?Q?ApY0xK8Ixg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc22ae9-9c6d-40b9-7895-08da1de5abf5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:09:09.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVrZKrCYZ2Vbjp5IkuQVHeGDsdv9/RVT5fZ/B9lksi58+cuSDBsXy0krixUKRGlpvtw5fBpSQxDQYn2wLK6PGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6714
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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
v7->v8:
* Trivial kernel doc style fix - add '*'.

v6->v7:
* Update the year of copyright.
* Better variable explanation for bits_per_lane_and_dclk_cycle.

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
index 000000000000..09931d080a6d
--- /dev/null
+++ b/include/linux/phy/phy-lvds.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020,2022 NXP
+ */
+
+#ifndef __PHY_LVDS_H_
+#define __PHY_LVDS_H_
+
+/**
+ * struct phy_configure_opts_lvds - LVDS configuration set
+ * @bits_per_lane_and_dclk_cycle:	Number of bits per lane per differential
+ *					clock cycle.
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

