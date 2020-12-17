Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184D52DDFB3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EED89B99;
	Fri, 18 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150085.outbound.protection.outlook.com [40.107.15.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D497E6E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jeeqc1mxca9P5KjSfySyeZM9BvzLvLtIOqTqRnWykhZ0akwseeIxVZ1zTZbG/lmixcP197Tg6OTqyp07SanRVd6eywhMx2BW+w981LySErHkj/5m1O/IZY1NDwn/21rELUWAH19mhlgQjkMVU3nyidNVcdsWi7YkIkxzQ88UhLftlJEcd6L/OOqO3j6gIEqFOzRaGoau9L9JnC5uXdaJFTnyvC2pHO16/dlsK+Xxqk7IRzJ7m3WRQPI/Jw3YCRYqPxYHKYW+dsx96Jz65MtDOplNqHO12pv71sm9oblLgslcXiXBTBHdrb3Oc9xgyK7yJQyAogBR+R1uWiYF3X4Qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI+Ebi45WdhiJY2d1M40KZF1kYf+MdtNIQ6Q0eAOXHk=;
 b=MxnBlIOepf3UZRpj5KF98di6/6/u+/esBs0bX6HGF9E4w6sP2Mo+xVWtTnlemAuav1KPMVmelJ3kdbU48mWd2YrBxCMRbhzY2ul5N/kF5yA1gsPSaOr/84wpWfNDeBayDee9cZNd+u8A2bfl0pp+GL5/dy/OzhH44OiL65qIi2gCU3q3ddb5IniS2QGhuJ6PhyigItedY3P8d7aM2+sQiJpsPX1caeB+RWlIgrnEM/Qve8QbuTffNjQIXFiiNhUVuKXBmKUhguXxXmScCC2lD7Zmn0vcQ4dC9XXFy30DP1YXTHWg/cAFlRfhio2eyvJ6VADHXz/m+j9ta39QaSk3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI+Ebi45WdhiJY2d1M40KZF1kYf+MdtNIQ6Q0eAOXHk=;
 b=nb1NrBU05l4DoOZXqjkHheiXTTmvBojXpEZ6w4gi79V0qV15kQJAIsRJB1v2MhjrhB8v2jf1aVZiganW4TUaYxHDQmUxS2Bb9t+vAKg36mDpUAw+Ea3/O02P4u/+9EG6XCjGHnlzvmCTSI+uK8I9p+hW5YMsLEs8SRlFJaK3190=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:26 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:26 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 01/14] phy: Add LVDS configuration options
Date: Thu, 17 Dec 2020 17:59:20 +0800
Message-Id: <1608199173-28760-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77b17eca-180d-4309-d403-08d8a273b1ee
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB731226F88D3D47DA0375026598C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNvdpCAFvnGW+c9hcj2sDv9waTmrjSxrl+UaMoU8a963NKXtOi7xAXuBRoX74ZK14+G6zeG9SwKaeO2sJ2F8L484/RhZNQnO3txd4AMgAzO01dKNH/MZwN3qpPHs90+SPGZmIgkIPBC++K/TSq5e8sx6MGihHoylLQkmu5PkrnznurzJB1qOjf9u8R2rotmiB1KZO7rbFyPV9E+eebzuINadXrd4NMZqprbsNgRf6r7rTZftt5A6PMlMympJsqN+nXw7X/mHcJuTzyUBQsB3sioqkapBzgB/Nufn3ZM+ElyolB8zLAVwYkdrCc+QqDojbef6dCh+KSna1H5bN1kxa63lpO7b7/oxrhekXI34nRPjcnS2EXeMbZ7098L3g2lS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(83380400001)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zypsYH6mnC1vdBVIbzWMkqHcI+ncy84HKyX/qVpM/Dod2ecNxCjz0RnSq78q?=
 =?us-ascii?Q?CQpeb+TVdYg3sJwV1MG8BPAa5/1YQsYqWe0Xf2rmB3jHg0mzvVaVd5Gsxhmi?=
 =?us-ascii?Q?1S/VbrJrVV8tD0Axq+xm1qzV0dW6utrJRtVJWPEPbPcAlwAEEwUM7h7qJbiW?=
 =?us-ascii?Q?mfpfbPrAcz9WfJ5cw/7io8d7o3nSog6bxMgO/wJ58utpCiT5LIVgpI/6PYck?=
 =?us-ascii?Q?zpnh7Z/6H64AQ8K/SbygbkLaQzDcJASV3BXw2H58QvYjILdegfxDkyzDHCK5?=
 =?us-ascii?Q?3z7JXB2R8rnmqAX+EV+mjk9/TxAb20bYZmzZXb9h1gI6Ezrx6pCxyBUaMAmQ?=
 =?us-ascii?Q?rBGkpakoOCkQf0ZWc1OZ57Yii8zN4GROVfUSHBm09QU9LW0hH3/5mp83iY/n?=
 =?us-ascii?Q?tb+Ga5PdstFDe4RDiD7mYnFDQ1zTZrCbS1jdJOkUQHo464D2R5dmF+7C2Iir?=
 =?us-ascii?Q?6jiUyikz0m1DKsFm32r/t9Ftt+X6DYuLffLDvGoJ8WHdoeh+43+rL2r27Ezy?=
 =?us-ascii?Q?gJE4vmVE/k8Oiyc3KnRnG7eYe2n4vGfH7O7aRz0QzDU3qKDsJJ6aJWiDhcA5?=
 =?us-ascii?Q?AzmKzV2sZc6n+LH4RHzV06P/tpMpSP771It9DNFdPx8I1n+c5RSvYrAAp/CF?=
 =?us-ascii?Q?i85H5GB4Sh3jjVIN8O7gkk6xQ8pHrX9SkcwddPik8HV/xjspxADue0fEXXqY?=
 =?us-ascii?Q?bIIR8S4GN2G5OA6oMb5QegLHNmhbLAevp2GnhmlD7ZHiARAGgxE2uK2jbUal?=
 =?us-ascii?Q?P0bKxA0bgOZK7S8sicuKko2P6EUfS2dFjTrH3b1IRBhWVTFcZNzV0kj/cDxQ?=
 =?us-ascii?Q?NTXHrJKGRGk9PXdKJcSV8Lv1ZGMSq+z2CES7WuDMCxjBpUL8DbH90nf22TWq?=
 =?us-ascii?Q?/Afz6It/xVeBG8+x7+ZmCkyeBHZ8mu2Z6EO5OQTkpU3qzxODAsAHg8C1cdtx?=
 =?us-ascii?Q?Q/lm3lqAO6CYWhaWXs2OSVQcl6+sGTLN3qIdO19xaKzs92bwI7ayWAAdhgkW?=
 =?us-ascii?Q?5lxj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:26.1953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b17eca-180d-4309-d403-08d8a273b1ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXOc55oIV0pOlboZwotaQz8mLo/xnebcCP0+YF433kAb72PKrVtkDyX0WXg1hcwRhxQnNapdmwhkHiFU6dwQVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
 include/linux/phy/phy-lvds.h | 48 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  4 ++++
 2 files changed, 52 insertions(+)
 create mode 100644 include/linux/phy/phy-lvds.h

diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
new file mode 100644
index 00000000..1b5b9d6
--- /dev/null
+++ b/include/linux/phy/phy-lvds.h
@@ -0,0 +1,48 @@
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
+ *
+ * This structure is used to represent the configuration state of a
+ * LVDS phy.
+ */
+struct phy_configure_opts_lvds {
+	/**
+	 * @bits_per_lane_and_dclk_cycle:
+	 *
+	 * Number of bits per data lane and differential clock cycle.
+	 */
+	unsigned int bits_per_lane_and_dclk_cycle;
+
+	/**
+	 * @differential_clk_rate:
+	 *
+	 * Clock rate, in Hertz, of the LVDS differential clock.
+	 */
+	unsigned long differential_clk_rate;
+
+	/**
+	 * @lanes:
+	 *
+	 * Number of active, consecutive, data lanes, starting from
+	 * lane 0, used for the transmissions.
+	 */
+	unsigned int lanes;
+
+	/**
+	 * @is_slave:
+	 *
+	 * Boolean, true if the phy is a slave which works together
+	 * with a master phy to support dual link transmission,
+	 * otherwise a regular phy or a master phy.
+	 */
+	bool is_slave;
+};
+
+#endif /* __PHY_LVDS_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index e435bdb..d450b44 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
 struct phy;
@@ -51,10 +52,13 @@ enum phy_mode {
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
