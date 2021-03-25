Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D704348C6F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E536ECD7;
	Thu, 25 Mar 2021 09:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C695F6ECD7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWMFZ66iwBQtjVyzRgQRjFgZc/U5DEq/kpG9JIb4eU3quESEep1WMldJ4chKsi5EM/4YDtajMndhwd77ReQIC7nvvcekRsOh2anv4vc2lhVSkotd+R8hbZU89Ztu1BZDZxUKpwTj2stUf7KZeMXJEPf9avh9ecfO0jqHPpanKtjCgy20myYnl0ZiGvFYMiWUYxkpEpTVcpKuzW0RIm/YFviz+oVhE8wyX09JwjZguKloIUg6fMesnetzF/R1oiWkovWOD0pgsbNv8p0EFpSGDivRFZbz3uuQ0xeP7OfQP87tNMzWvhlyR+ql3aAOj0hcaJogdnrkhHBHfQzB/4oSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0X0hGtFCmE49bYvnLzSjWVHNNUFZN+x5SMGrSVlXew=;
 b=dd17JITGsmAHVygNw7tLDpL6iGEYrZMKb1E2RUUljyg4bhAM8Enng6VIl36v0UUKxXOUB4I3kFX1t4EXGq25DSglUWhgHuypHaTwzYHH3mIFFZYh9Xhg9/X4lw1ErO6QzRVSoMRWzWTXkQO/FIvIMjU3FhMPLArudem9lB7Rvi1UbFKJJsOBT+I6ENPN97n7psJ9pnU2i7ShUSfn9iIze+9MVot3tFYvpzN+X35niBd6y42zv/woWp56oWO/HhrF3XICdmSHt8yWT69WEschwct41tH+DDIMN2VKyq6UBp8HKy2DBZph8/aExn5LqlPQaBA2kQqlsuaNqniUGZehJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0X0hGtFCmE49bYvnLzSjWVHNNUFZN+x5SMGrSVlXew=;
 b=Q0vDyy6GzyUnWlBYtKJw4zeDJ3RiFRlOGlIcg4gWR3POpDllSd1WNdCl1bGxovcLTGWNrG7aJ9kWQpc1p3q/A3R3XlgzIEq76PseDM70iqimfPQQKwnDO21Gfo6UfLe/GemRJQUc3QEOEWEP5BSKhdV6MQqjKYpLhGynbg5qAo8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2976.eurprd04.prod.outlook.com (2603:10a6:802:8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 09:14:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 09:14:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/5] phy: Add LVDS configuration options
Date: Thu, 25 Mar 2021 17:00:29 +0800
Message-Id: <1616662832-27048-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 09:14:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a738156-5a53-49dc-00af-08d8ef6e7541
X-MS-TrafficTypeDiagnostic: VI1PR04MB2976:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2976D1A6828259AEDE5D28D398629@VI1PR04MB2976.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YA0le0HiLyYm0nIWLbYXJhCU6+agQ/f0se5dgs1ZrB1GezsM8xCnvtn1C4996wVDZLgUHtqb6jMiAwjATMUppWV2BzTepbpBnywAduC3E3WqNqBn9a22nUi4/OwDtD4vU4/0m27ja0JXv3GhHUwox72X8g9v5ZjR6j3uV4qVaFZuwWFagA55d2gZyXr68bECONzkfineITpmEBPKJ6rCH1LC10iR+TZFChguA/sHi8zR/w28E9rP5jy4TJOJYqbPZfquWcn9d6DD6vgC3RFrXhzvxRATLTdCbrqN00O+P70fU3SPmof+vcxhNikGrSenCPDoQro8LNkIEaEQ4mdxDL/dgLtuoEpD06aCJWr76oCk+Mf48znDrh++5egk4XV2VeQA6v1vD4CXIAmlEF1oC6RFPVa2+Wh3HpFSfjXwwXwgp6d7pih6QbWS2nhbpJB/0mQ9drvhP/ihKpYYvjy3/Qnw/77unhEDoPtCq0TCK6ZwYXlW8eIfezDkd9QuOtcXlVZbkceF75vuyNCdPyty4X+Ltxlo3wCoIedYyBpdTCuQaGNqPBnN2mwFyqerrcByKXptzP3kwMuiFpwKwvoKvo/jRQ/ouglHh8AJ6iUrBesKeJZHwFXYPsOozTtYgHJP6GHHX9QXNsZE/BmamwzQHXx19SnSoHKB5/30tcsCA8RYcJ6gA6s7b8fGCG53V6jX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(66556008)(86362001)(16526019)(26005)(316002)(7416002)(66476007)(5660300002)(186003)(6666004)(478600001)(956004)(2906002)(2616005)(6506007)(66946007)(38100700001)(8936002)(6512007)(6486002)(69590400012)(83380400001)(52116002)(8676002)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RB6PMISqmZYwhvEJRdtKQbX2c3wbzyrPYu8EmIoza3v+lTE7kZdXSscFIrs8?=
 =?us-ascii?Q?Qq6S5dCE54u70KwAq0ZcFoE+WKyd6GC+R3jWsLjH/1bIVkCgJjDdJQV6nwwq?=
 =?us-ascii?Q?eW/QBIlK3ea9PjL2cHgnm6rRbE5yZvVZxyk3O6h8rxzLAykg1xj5T1M1IF9s?=
 =?us-ascii?Q?pGcoPczwpcORWmpR/+wHqlBKqAzxYRDnbvWbWw5VORfbRAmo5Rha4GmsfTbm?=
 =?us-ascii?Q?pkYgUr7j2O/TYUCSrhlvdmaw2OtzttW8Ksnz6FcT4DA0B5WlP+8LCDYyj8Du?=
 =?us-ascii?Q?s0rIsojA8evqobLLl4u6lv5j1pLCMnDX/tpn+lrtvDZWYYGwrffLdMEe7S/U?=
 =?us-ascii?Q?3h6hEIGZaQbCdT+npehu4ItiH/HUmqZa2akEzgSlM6vu3KLCIKrHUEw8nkv1?=
 =?us-ascii?Q?+HDHCRZPB5sGR9ohI67m0cIM0nS7Kh3Iji0sxn6TetMGVZkbOioeocJfZM/A?=
 =?us-ascii?Q?51xz+cG78CDUs1lTjvGe/dHc3a4UiPk7vPeUjWUU0dOp1gGpO9NnV+yPta2n?=
 =?us-ascii?Q?d0UzBLG3wQOes00tHd/OoZ263kzwH1gw46MeeSulCl+6rA2GjdaR2/Bo5NFa?=
 =?us-ascii?Q?RFLAx/1GuoDhEkywe4oE7/7wk9t0dMNw6Tii4dDaJEgB5mx2YVNJN7wsIH6c?=
 =?us-ascii?Q?npaFy2yXpQcWaALY+FXCQvl6p6cIwhtp7R6aI23YbEDlFrmw5uTm32r3LWz0?=
 =?us-ascii?Q?vTMXLLWExctOz/X62TAcfxQ2ujRJnIFcAUlLUfaw5kIAwRE00gwdxbSE+ui8?=
 =?us-ascii?Q?LInvg5OrLi78LV5fMY5nRgxjcLWrD7T3Da1dC3u+u+X1iZ2VZQLTFkGcO7jc?=
 =?us-ascii?Q?egXNLY6TdKKm2JGUHKRmfD1sQFncFYGMLORg/ZjCDwK/o8DJiAVu/mvOqbR/?=
 =?us-ascii?Q?bt8XjuoCJe/CLCPssnvCZuOVdcXCsYLtaIHbIrjJVkofR+6Akqvtk+89SMAp?=
 =?us-ascii?Q?jqCydtVPF2jr+EV53Yu5rwnTQT5ZJ2UmKocZWVp4VtDmXebpEeRP4T3hF8I+?=
 =?us-ascii?Q?8dXyEwzKnIpW3mB7W6cwwuzdTmrOhiIAP2nbOO4bbT2dkBoM0NwjRrnfTnIc?=
 =?us-ascii?Q?Jl/grn1WAvKPTSPVuCy5YWHV7qXpIplPAso4dazJpoQ/7OOQHx1Syb5EIW9N?=
 =?us-ascii?Q?2bbx1cxF6b49/PMVXZLcMU4pa3Yq7AEQ1XrPq+PkTMT9UFqoXfZlq7G3Un5u?=
 =?us-ascii?Q?WiuZwCsy3Vxa1cKs6d8Pi6LM12ILYBD0JUYirh/ma64BOCM2wNclfoXeybb2?=
 =?us-ascii?Q?paeWbE/S1Yx1+c6//4UHRHe0j/90kqUicb8N8N4ON585nb1tV4sThSu9utSf?=
 =?us-ascii?Q?7c33SjdRuFu7LTtaxfjYXmeK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a738156-5a53-49dc-00af-08d8ef6e7541
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:14:56.9388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb3cmfVewCPtbCcOs5rqwEt2RCEgdY41RzcTqBs2KWKr6YauGo6iYEEzGRYc9HQa8fiSbkiFoHn9VU5K1RzCTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2976
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
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index 00000000..7a2f474
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
