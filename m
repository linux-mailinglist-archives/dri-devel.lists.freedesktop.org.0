Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BBF3306BB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 05:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D096E328;
	Mon,  8 Mar 2021 04:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59136E043
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 04:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QclwA73kUEWh1LEokA7HHR0QlezMxSy0qu2zF8BbUD3rICXnoMagM8N+mAd/hqH7GdbLeNDyI2NTb8GrUVpssw6jxUj4yFA0CZkf1bffNF5JHgSqup74q8WIkbQmOL1ye+f2m4CB6svs0X3VyWjEtjEpCdK3nRhLKCf71+ZLxQbUq2q/dXa1J3+L8rZkSoTUPSFxojan7Zio87I40yzvQJbihl/jYMw63EyYnZksRLQk6n4mqhxrJULhlSEp6cMMc6D6ps4ddqrkyUakYtM2Rr6srTgiCGlIifqqJ/brsOjqMG7p+JP8JsWI8UP5mW7f4WG+X3fQjBjNC6sxQtD+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sA3nQ+OEULqsdeLnZgSzuNU567QUWAi8xpQWAby/mg=;
 b=Gp4JucST5mSKwfXPN7BBs2BPkW0kHhuEzcv+O/H8rhuRAcQwOrKlCPFGPHE9z3vOv2/xbgqEvc7PvbuEsazUN2YGqTgyhoOi8yB/QNrJck4d6+XNWjfsyogSCX8bTr7IgCgMA5yZC0CRVUCFg7aN69T2x7Nd4SDDINyJoDPe7ER4tndNrYwkOUrrvhVS/wBjCF4t+ag71G0CqMcOX4bgliPqRG0/IX3xdzTZ9Vy4Zg4SllILMVLDk0PvY0vD+YRvkRpDEHhaE+LHdezVZn+R4x3XjBqCReRPdT+QWssa1FfT5GrVvkF/E5mkn1cu/8+bDzQbqr+LRmcRO9VoyaHmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sA3nQ+OEULqsdeLnZgSzuNU567QUWAi8xpQWAby/mg=;
 b=cH0KD1iurQfAQQQi+yIWXWMXkjQPh5oNBatoLftfrTidc6XKVm/SOnl679EV+26OG6831/gGMwKigml5brI2dSeq7SRlofqVjNFH8CsF7a+4VEurlJUavQ6veGKPT9PW7cRzQjw8GZ3ekxhbQtN+MVruSFZIgVXVIgzV/Afri2c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3310.eurprd04.prod.outlook.com (2603:10a6:802:11::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Mon, 8 Mar
 2021 04:05:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 04:05:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/5] phy: Add LVDS configuration options
Date: Mon,  8 Mar 2021 11:52:18 +0800
Message-Id: <1615175541-29009-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0088.apcprd04.prod.outlook.com (2603:1096:202:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 04:05:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82291bbf-4b22-4058-0fd1-08d8e1e778f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB3310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3310D69E09FF753393D0FB6F98939@VI1PR04MB3310.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iS2RltSlJjMbtfOX5W4Dygme2wjaCGIwc56g/Xy7FarqeVskQ4Mr+Y/xEkGYnU+XUmrKGD06qQy3LU8rrWvZxTvKafzaKifJF8vH1THkOyRI3FhNsBz1BoHndSuVaJHV68EdKjydnTPOvH5e5/9gXN5lrZ4YbR2E2+KVofEgy3dcgLfxmSqnXf7Hm0Hj7k5WQpwZbvuj1VrgdosYG3ry76ap/oqe9Pe6Y9F6XLhHaIAQ0LNm8A0yz36HqmnK3pvaEQu0nV20Q2w7KsiPF/hMWYDa2/jUCMmUUwp5c39tVlHSd3066coo24oLyOKZa9Ev78kVOnTu7gGDYz/UUXpi23b51YNRNK0WgH6wkLD11ZKIRyHtSUw8JQeSt8HKkc6C8jq/LCf+Jo16T01bJcRtiWu/Uhlkyhy4hdVej/tR1rG24s9KBgZyc3KPnTT1vjfgQtY5LbzLodjEp7hXp47Io8XIUkmZljmC1rulnHAvX3Mt8VLEJg1OkCxBR42HxYUgM542bGZBVC90R9cNoiC0wKobNDDxx6Ewt7UezEm/TflIJIe+ljgjaBbB7fh00plbhuBQxu+8GvJrGBR/WkQT3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(66556008)(186003)(16526019)(478600001)(66946007)(2906002)(316002)(66476007)(26005)(5660300002)(52116002)(8936002)(6666004)(6486002)(36756003)(8676002)(6512007)(7416002)(4326008)(956004)(6506007)(83380400001)(2616005)(86362001)(69590400012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HrMS1JpsRDgA8E+qPQdGCtWfXCGQTW1Be38KgvoNuEp/tIG8RD51i11yG8Nn?=
 =?us-ascii?Q?8funcKbJYzVC4clQJQNRJgB12Mo3scqXx7E48UMpEXsUE+UQyUaFzBO4Ppxs?=
 =?us-ascii?Q?91//pF/FPUcMMr6si8vKaNnq5pIbsnckRa8hgTT7uBnjaqfTjJfnn7CBjDWy?=
 =?us-ascii?Q?6CacbyJv1XoPo8Z7Q01zC1Gk1FgNHMI/JQvkVuEypjyPv0GmC3UgLmUMxijz?=
 =?us-ascii?Q?cJih2PffpBYgSFyardIit5LplV42VkTRnALh2HN7RP/U1yNgUwJG+GXegW7M?=
 =?us-ascii?Q?8Ru1auzA6nljQvS2VIMI8aX5LcY5iqekiW9FLH5554VwqI6fBQGe3eSlROCI?=
 =?us-ascii?Q?P98lIervUxd4UZg7opBJLTX6ddmToB5kAxe+QLbFgjXhCtjCOiqNT/JDCQBr?=
 =?us-ascii?Q?N5inxfUSemriApCh6+IAoTk+hve7ZNXIGhUJh+nz8+TGFbHysa2pLRNTOcji?=
 =?us-ascii?Q?PZkV+ViQ57N3ZbBdMcfuluVrOFFxTu/CYFGgC3TqCKAXjKXc5DYBZR98ejjO?=
 =?us-ascii?Q?szn/gn6Dy9pDZP+daYnVmczLYCFTFn4HN3antZdUhatrqx+WG/XDwkkCjO7i?=
 =?us-ascii?Q?en/49E9snggz5Nd2hUYYVHMYPn1Ud79UmhUHOsYPglefl0r3a4HUbLAe7zEM?=
 =?us-ascii?Q?UImguHJwBtLldL1wE0jX4U2ReIsLYYgy5oyG3qiqYr87/+RJ0IPdpr4YSOAr?=
 =?us-ascii?Q?wJlLFPezj5GXY8NGkBNLsvQsdGRD5jgdZG1rPqQPyuS30Es6apVZsv8Mh6EZ?=
 =?us-ascii?Q?o1gz08bhjtUQjdhXxoLepE2k/bnd0Y4OA67SadW1wnRNOaGrEx5Wv281+AOs?=
 =?us-ascii?Q?b487y7WWeeiuNqbbgmJoxxqXL0oNXb7Bfp0oAMslHeEsfYqleNk/9uhwqDVc?=
 =?us-ascii?Q?pteZFZIDtlG8zaGHvvs9kDo2yhHm4M8BabwFvJJaZfwRAons2zfzs/HCS9aw?=
 =?us-ascii?Q?/RyhOcu7K2mzghHRXuGVz5wRqbrZoWiDmJ/LTr9SNxLxvbLFQIux+r6levRN?=
 =?us-ascii?Q?dZQDLOINqIS3B/+sbEVxMKkSSgfMrnuUog+AjX/9985FY5PayIadidqITQU6?=
 =?us-ascii?Q?rJPi+EFZuXdeTQoRFH3AQlhD8wEBYdTQ9ps0eMKnv4nKlpvpx8PiMtfBilma?=
 =?us-ascii?Q?t6LSk/pajguKgX3MP9VDLJRMV8oMfgwkCPU+W5BJ7ObzqtRbyA74WgNlqU1k?=
 =?us-ascii?Q?sJ4qfUpMRvxF87KHIS/HV2y2vEyEFdvwh22zScHnazX+wicDgenomjx/qrfY?=
 =?us-ascii?Q?BDtJ03fCtGyjJXZX/vB3IEM/94rY2uqHdObrESIOitwMC+WIb6ROVQC8nkjJ?=
 =?us-ascii?Q?op7IVSoLTG8Yb/VislozDErR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82291bbf-4b22-4058-0fd1-08d8e1e778f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 04:05:55.8272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RFNxla6cilHc4h2X7EgxYohR7gIw2d0J0ya/OeOe9bElmepZ82feqEGofjNPUEP5D+7Fy7LWwLPEPy6Xn0uoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3310
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Add Robert's R-b tag.

v2->v3:
* No change.

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
