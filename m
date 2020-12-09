Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83B2D3D59
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DB56E15F;
	Wed,  9 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FAE6E10D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJbfmTJfIa0tQ7ATW/04T6TNuG7M2g/KsoqYfJHbp0zSxVoTP712xxl7m/j5XOQUVSKvQqeXjuLtEe93/D9SbquCI4tudNthbOwdOXd47sooGrRrg8GqyN/xTFQur+w+gk1o1WseHSYqU59JqZFROipUayHaB7dJVJb79XOr2fUSdfv/RiyKX5PQR7OSjUzgCIrre9F+wSRepQGW/SYGEt9kuIt0vDhgEUcBFVcGr4WXCsfwHqBC6i7c9+lOuOyXfyghWhC5FIWp/RZ5cWlDXJFb5jnxd/Nz2dFM9oToFJMPg5pF8K7hBkQaGyCEU/FnDfK1vVXmKmVbTzHUL9v0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFvT59+r4gZfTsCQGwYdSt1yVz2qzP7N0XAR+GjRjjE=;
 b=mPpug9YHcYxMdoMRPZzG9p5Pb77oZHsVL6n2YJpy+AX2eKej7Yh3MwAoxSfF8pd9h6BbAOYg+/R3+qRe9JPZyc5dqfWLvfJZ1IWbCKs6JYi4oXo7aUKSCVgOHXrAEgCWi2YkU1JwMWFH3aJnOiMc9X3FNBiMICYmdD+lRZ8KsonwaxDyLecZ5BFf/ya+FE5KEWcXQgI94Zgna1m/Lug3tp88IY8ku9ESsOTCbpq3mJDKk5hg2pIT/FRyErNZa/3TR36Ehbn3p7imkO+fy+DIKOq8S3DI6/R+BsdYzksIQpg30eBl2gHMB7GsDNOCQwG7hBAhAz7BEnDAribxb1/rLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFvT59+r4gZfTsCQGwYdSt1yVz2qzP7N0XAR+GjRjjE=;
 b=UxjwARv8s+71rvHLTo4y4xN8hXSocrmpJN+xTfWIA40OoA+zfTZq22KASiKzU99xkXweA5zF/kCvrmikJCHP4L/+AGyC2jAeKMOEtoJWlxEgu60Ka0JSEDlkbbEVcq1Oj078FOZLFEd9Owgm4HjDdfsfWfALN4BfGTnF7w6/DxQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 06:33:06 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 06:33:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/5] phy: Add LVDS configuration options
Date: Wed,  9 Dec 2020 14:24:25 +0800
Message-Id: <1607495069-10946-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
References: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0148.apcprd06.prod.outlook.com
 (2603:1096:1:1f::26) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0148.apcprd06.prod.outlook.com (2603:1096:1:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 06:32:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5602feb3-d7f1-478e-3acf-08d89c0c49b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6144B852ED09C3BD562322B098CC0@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQLLIto9KUBlOVou4DBi6VVgpDkg+JCsv/3TVlmnda1nbmSYlorNpMC3kwihQvzH0vSoSPzYOHLTU4cMZnMMozDx6FG2q8l3QeB4zs6QZyKgc2IduHOWuY5xNWPknD7HMo5Q/hl2mCQqazX+Kt//a58WnLQnJ0VhQ6u+Dq7vY0DmDbJqlTmIfClZu0BoOuaQTNZiwC8aJKIW/Ys4z6A7Yf5PU+OzOZpxIim7q9G9CXiaoOh1q5NWRXK5z0APvYQ0UraH3qe9lOpi7rH/pHXSHd9Fn+n3KscrE8XPZVa20yDTR0ybgTyTLXpEhSoHGuOTRXktPlwmUx2Uz42xUl2mjh9tSEbIs9r7F1YCznv74j9/yqXxcvDf50lAEldJjDzou1V0AsL5ZfMiz3xwF7N1ZndesB3OdEJ8L7+0WOIF83c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(2616005)(26005)(52116002)(5660300002)(186003)(16526019)(34490700003)(8936002)(8676002)(6486002)(6666004)(66476007)(2906002)(69590400008)(7416002)(956004)(36756003)(6512007)(508600001)(66946007)(83380400001)(4326008)(6506007)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I7TdXgdPSJRCVffNPsgmxqvDD3WdgnqxdCqVodqZH6fEst8ub+7P8moolTG7?=
 =?us-ascii?Q?rD6x7dLnjbZWoawv2Whj5qtq2n9or4BvrNkq45Xr5OGvjAuujeMc277hv0LF?=
 =?us-ascii?Q?Eqq60oskPjFIFThJmRz+VzxgjqP5jPCXjOZxaYXPAOnXOwFQ5Ilr0YtZyUX4?=
 =?us-ascii?Q?Yd3F334pVUUV/A/LEZuHLcK2SOZW5Q8oX1kS8yr2sVjgJXg2TkzNamZpbyUs?=
 =?us-ascii?Q?p0j6mbWHIw6Ypqjeoknkx8Q6Q2un0uYITqFNpdMYyTdoU7uJfWNLUhjaFLQH?=
 =?us-ascii?Q?vDwxnTR0PQKZbnRjYltsWd/NWxyvrG/LUaiue3iPJzqm//zA5vw4k3dGOR5p?=
 =?us-ascii?Q?wBZBuYiB3uNBb0U9PbUFPks1Dyhp5vv08znEihP+SJlwqeHdl235Y4iHTnWA?=
 =?us-ascii?Q?hW5+9/N6RLrmAgzKjbjHCfAsKhFvfYaSIq/olCPQxMXjIWB19kbIM4wKu3az?=
 =?us-ascii?Q?SPPHMscamn2B+257tvjVkwEFR/q+b5vqlgLf5MHYggoHvH+roKUWU33aoy4b?=
 =?us-ascii?Q?Ib4E9h4ca6p/CxjzWhkeGlWOfJVKrNSwS+ND2ii1y5hNkEOkdD/qVOtqbP+9?=
 =?us-ascii?Q?wbbR4LJNHzoOD3C0O4mWOntvSR/xJVr6SEUz4Vv2D3ysupe5mwKOSEKzQxfj?=
 =?us-ascii?Q?hZ3X8uU7m2aR40EeZ+l53+3Mob3I99K/1juq84uV1R55EUH1yN1CkEH2TNCi?=
 =?us-ascii?Q?8y43f+0zj1E3OVIYeZOaqvoxf8LChvMssljbZQ8P1ocbzZ9xQW5/RO93O5i7?=
 =?us-ascii?Q?aKVjNJ8OgsS71EQ8LipHsmADRMrkqRMOVSY7lj4ifMyeW/s8I3Ook/PfyExG?=
 =?us-ascii?Q?kMLTnjJbgt1bZFhrYB/VKhM5ST/AIckrYhN8g3A/vKxu/Gw1a+4v2ueazSBt?=
 =?us-ascii?Q?XMZ0g6aPwBfX6CMzGcdlEUzVnol3pCG2JNSY84L2ClGfVepw5YGbuhm7tSx0?=
 =?us-ascii?Q?QijAOLRcncq7K5SqALvWHb41uihRWX7Z3fpf+toIdetoKFpfkDKegMlzoI2x?=
 =?us-ascii?Q?LVJL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 06:33:06.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5602feb3-d7f1-478e-3acf-08d89c0c49b1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/rrSpsBp7V9UAgFOt9k7MNttI4602VH0p1BzSJC9rMhFkVGHpfA/ANmBz5phitGAJsu+oURiUjRiEmRntZDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
 jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
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
v1->v2:
* No change.

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
