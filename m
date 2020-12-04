Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772142CE9ED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B256E13A;
	Fri,  4 Dec 2020 08:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00043.outbound.protection.outlook.com [40.107.0.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01EC6E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 07:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpXMnaTu7S5TvYrUzVOq+it6lWVGuzkLKPfDZmTyGJNzpHQCYrMH9ZVLQ/2Dk5t2LpY9aLNwH1qDS5ppzHpu64Sk7hPt0O0Q3OO6pmJUh2JJkxiiZuM4XIAfj6SpMo6OxxjIWbm60saRG5UZgKutw/nlLFq6RQljXOEKMcB+AflOjO5Ds6B35Vruu93iSjkKdzcPXs0G2FqPwq+co9byEkALKbUS+mdkF6FTngOqGerKb9TS6Uts3Jufr9bknqlQTlhz3IWWOoBDziV92x+3Ya5AbDrkYX2UmP3Ek+l1Y5sSBpJSwJsgJEaJTnzp9TTzfpDhvCpmvg44SQVRIrt6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI+Ebi45WdhiJY2d1M40KZF1kYf+MdtNIQ6Q0eAOXHk=;
 b=C1VPc5MiNHtmm9a5h/Nm1c5EOhinDbV09Pu7adlRj2hSa4wWrk80htSoIb+Z2CpSA0vjV1ljMATfj9ROY6EGxesLbfI0T0wTQEn5mLlgArIf6qYsq7vk4jAs9fE0CThA+ewg+J0xPAekGtGYxWJ5JhukNnUqM6tBTY1DG2RuzJcGNpv/YLyv/1lx4UxHwfvkOLHsjVQxnodf+8VXUHrSdKI1jDj+ouJzbwKbyW1xpQrl1h6udL33g10SO+hNJSGX/SXZoa+SvKUr7zUGFVwU9K/e4AvZbiKhfuUWoYe78VNTgBUE9R4MxSfJr/y9A67qfa+uKUCXxSVW0DBxx9DKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI+Ebi45WdhiJY2d1M40KZF1kYf+MdtNIQ6Q0eAOXHk=;
 b=XdPmvpodx1ZLPtq/onCW0Uu+/bwlg9eZPzcv593DlKiGtGuhZBQjNlYGSz1IizGMUA0VKG6MeKJYG/4mQADzUEsPqcDyuulMcFak2pMGSsfyed32C5NnEduJl7m5WuvaBUISx+nH4VkjCIobQSFoC7QImPPKPLBcBvgcMK24OHY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 4 Dec
 2020 07:42:14 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 07:42:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] phy: Add LVDS configuration options
Date: Fri,  4 Dec 2020 15:33:42 +0800
Message-Id: <1607067224-15616-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend
 Transport; Fri, 4 Dec 2020 07:42:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69c5d9d5-5b56-487d-a6c3-08d898281db8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421F1C37FC9EE2339836D9998F10@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IeiZZhxPLRRqUj3sQG204KIrqnbSIuni7nufn7I8gjVm14TrutfykvlY7/iwVNVL03824Gg4zVEeeFMhLgndzQdJbeJBxGogjiY30vSuKAlAelzolITO5utxloJW713L22bX0GIcaoQVClm4zko7yC+3LrorOKM3Mf+Nd6N3YQIu1x9u+HjOWoUg9yHirP++njD4PdSGkuLlEUNSn1btVDmEq2bj5sxqGV+G8wDMhR0yJQUKvg1Tspnk8Y3FB7H1j2LHQXG3SMZpIR/zukejziz/HEFNHfbz8g7dGdjWIjxfa8jsto735sc9R0nEjDWVguVdzt+DYupPeeG6BNnsvmLz2J+9ep7mu5gTpnA5Uxv3wF/8SE+9lhuyWMEv55aG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(66556008)(6512007)(66476007)(69590400008)(66946007)(83380400001)(316002)(8676002)(36756003)(7416002)(2906002)(86362001)(6486002)(8936002)(26005)(186003)(52116002)(16526019)(2616005)(956004)(478600001)(6666004)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aqi8mrovWP4cRzY16sGIYSPktNImEy3ueW5JNNvJj5fJVFEdXd4JMu7o74z8?=
 =?us-ascii?Q?EFCVzfpO8/UXa+REu6H4P7GvZT6kOtJdhz+/D7nzVJXgkyCefGn2VAY5vixd?=
 =?us-ascii?Q?q4R+RnKprHIWquz/cPFE+ATO8Hyb2K96FAdwGCqq6N9Jv5fwgU2oVnO3p97/?=
 =?us-ascii?Q?YDyZ2KBJImBKvFyWac2/EAAy7v03iTCyY928mxsyo9ras92Dh4GwdmYKRJhE?=
 =?us-ascii?Q?UPGwMXF8a7MKG+wrLvyF1Kdbr1fFHtTiE3H55Qg/SVSB4Qzh4dQJvtMelJJR?=
 =?us-ascii?Q?uEdBu0K3IiEX7KVgHkmAnbgKCocDUkdeo27qTo1U7SEA0Fl2K+Dl9upCR432?=
 =?us-ascii?Q?2Vl8NI6EdsfNEKjJnizyql9F1CqLvdTXxci8PzxoS8x/kwm9wQFD2wzTSvwV?=
 =?us-ascii?Q?tX4IAMtd6xKWobtmdnLOvSeV9BKnWBi7a3TST8oMsWin4wm1fkbO13hL/skf?=
 =?us-ascii?Q?CzKyVdCmUuyc45XMamI1ovp6ccLY/zWQz9lC1eEKrcWeT6TObLT/yTbkGg9E?=
 =?us-ascii?Q?mhzen76BopHCfxdKE/bX2l72+iJwwwiwM9amhAZSrKpQf2VQTOOGpOfsEy4N?=
 =?us-ascii?Q?UrvsAvpvRRPHCraRFuoNClxftElcZY3fDOkXWu7+XJmShunnakVhrfjVDEJd?=
 =?us-ascii?Q?iI+a1TSsXkSYQuh4BF7rHKRaRhkF89CAPCSLTg5zFzsGDh9qQxvnzjPRff1t?=
 =?us-ascii?Q?wibJTmnhS2k5xywYQ5x4YbcVXNOE1+5rX8SasiF7eRDQjKfxBCUv9LoOHF/0?=
 =?us-ascii?Q?yoJPIppNXE4uGRTrS7vAjKLfAxyfNN1tEfVir8RB06a4AH56eMqRZ5jQqvN7?=
 =?us-ascii?Q?nkhS6rboSVVkLlMErFxtnlk0Ko+/FMQnvK+NZCXbnQFPsmD3cNizRkI5ObQi?=
 =?us-ascii?Q?XYJ7JMUmEW1SyKYIW027SQejE+vYi39Q2OptHUAWsWXkVoruNc7URadtQMNY?=
 =?us-ascii?Q?0e3pi4IYN0udrRSnwOazecjZyrntuIYLkbNSZtttMPWQIRt2tToZr8Um7LXq?=
 =?us-ascii?Q?r0Ow?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c5d9d5-5b56-487d-a6c3-08d898281db8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:42:14.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdB26VBcXJ/ZxNKrbgDw01dO67b1tFQroO6A5NanxssWy/tW9qhDHSJukXaSUuLTF2+QaxuIk79g8zpbdfWrWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
