Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A599F4464
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301710E49C;
	Tue, 17 Dec 2024 06:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aR/yInQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E1F10E494
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v09+Ul+4kqdz0lKJmq5maoUW/g7kXnl5XaFcNUDhL5fW/DIwJc2QI7Shc6xXY36X761Qf4xyYwIYXwv3QGva+8Py5SV4R8T+t5A/31CmV+VQV1iE4UsRq88z77JJGm2fJz3/uB+rVaBcZnzoueUH7dflqcSHELyRIFaIXQpN6VUhVjDB1zLCxuKnf52lJQTAcvjG3Llrw4NpC8b1D9REK6W+S8TrwCo5CfOdytHsj5YkmUU0wLpMcQinDB8eryYA08GPoKIGiN95ScCSLzuQxClrIPNhPzo3FhyAxf18sJJ0Hl3FD/yzKKyKXGh9ZQ5E3gryVHMStrGsmOOQR8UUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uDNpPyF9LarO5kLDnVLbcMse6GUFA3xnyip2Ypj24Q=;
 b=LgNymNKlDdrx8HnvKvqfhJ30sfC+XREgz9w29kQqqfD6kVWIC6h2zUhecZVVZ5tQQqvqu8TLZmRyoILN0q80AfsrBTSpAKsPiJt4xm9QcjVw9pozJGt0DrbazizXEG21OL7xqOPd+09dCy13W1iI0iH3oQ2HCijuIWD3Vr2CEAGVoGTaV9p2w/pbC24EDjdYGC/tEi200Teom3/6MA+jJTb9R1wvTm5FQ7TSR6Isa9trnz3RH0uh1HWh9KXx0LDX0ueZ60G/9MYm3l8MNTdl1tHzoW6eL4Pil+fHqA5PVpBaIcVA8VDISTiVL/78+QusNhFSkxZxjii2YxwqGgjsiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uDNpPyF9LarO5kLDnVLbcMse6GUFA3xnyip2Ypj24Q=;
 b=aR/yInQ64lHU8QhmkDnTJzy4XZPIykc/+pW4DhKRY0lAwEJTrtniNR0cPZqbF+gqJdfiWlycmHH16I4AAKLiv+taz8Dc258D6QpnoGvSTqk5BvfF0waIFHQgmvwDs3p90is7YLhvntCHRj7y/d86dDfNXcZYx9HI3XKq0lsTDoI8Ii3rgtRVZhSbCQx+Dgaj9nYJgOBWS6rPnS1D+VNX2Oi3IRGFzSOUtz+nY2e8Hc1RW5Ym1WphVXeGpgmIahdm8yWhHnKZ3vu/pgafbZu/yNIr673w5fNLIvw66ny59Eg8qyRA9zHpisdSAlpvMIYTFzUbVRF0o+4r760PLnCRTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 17 Dec
 2024 06:53:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:53:36 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v20 3/9] phy: Add HDMI configuration options
Date: Tue, 17 Dec 2024 14:51:45 +0800
Message-Id: <d1cff6c03ec3732d2244022029245ab2d954d997.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: d11b4c85-ae07-4a5d-ebd0-08dd1e67878f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rdXU3/hl8bORcT3D6pr+m6Riyn9EgFdzyVs94dF0BRLXoCvEtg6QwX7S0mrN?=
 =?us-ascii?Q?5fT/cDCzoV8ULAQw3QsA/aWsgMH//dOhW/x2Yyz7WUx4cSVARDV/0Sh8Euvc?=
 =?us-ascii?Q?Z2gHxvAo6+oPNdzmywnw7cAW4UWV5mBRiLQnPdAd5mojZvWDJIP8PfG8AjP3?=
 =?us-ascii?Q?Roae5MPCm/fsOtMNo2nuAyzC+nsiadppJxRwcw62fgaeb2qsSMLaTQIXtbtT?=
 =?us-ascii?Q?no7Zza0ou1w599WAL8EdZkJSNe3YoQDR8US7BEm9Jochs1DNnbgfRh3sedlL?=
 =?us-ascii?Q?6YsfhMtq3DTwokJxpZ7ewo3VFH3fZ4HXLY3DCNtaxyMK9m/Rjl1qzjPAxY9M?=
 =?us-ascii?Q?KhKteJdccix14V87/KXGwdMm0G6KHXKjuzVSVZiHswKnDp6qVYqkQjG34FkX?=
 =?us-ascii?Q?0DBthv0Wuik8a95oFiI1r0EzxEXwWBisyYg5zNU+o/xNssE7AeVoJhFPi93C?=
 =?us-ascii?Q?TfGOzEPLtZ0LQmfwXi7LmV+7+c+OlfW0QbLQs/0vPij6P06gXiWFN7hZTU5s?=
 =?us-ascii?Q?6WY+axTarG/rxpR1Ldk8piuHQcOJKOOaAVgRcgwEnkGlkwqPGbq24mvBN9jY?=
 =?us-ascii?Q?wrj1EAzdkmo8ruHJZ4MBjff1eu9c8lhX/bJga6ZKkcxAcyDY6qCE98gp2xY0?=
 =?us-ascii?Q?rjUbDz3c6ZSVVjvieVKfbpNp8qbm75PMgdQjgac1r/RKxfxLstP6JPxMfH3n?=
 =?us-ascii?Q?vixeYuXbrBc+9PVe18WTd/o9pEiDh+HHF8HIP9XFxwr99E6hf0z7VqRmt6Mf?=
 =?us-ascii?Q?p+A0vFTo3uR/0a2akcEG4DuFONbx+n2a44jadZ1wdQs7HXD1sMpZC6g12ax6?=
 =?us-ascii?Q?Ncoxh9QpBJecuL5SxgkbtFSRdKPp7EG3jaN489Bbt7ns+wTSg2Lwm2SdZAit?=
 =?us-ascii?Q?wAi10+B4Y4QgBC11nHVNKHOYBzcBV7XfxHCaGfHLm7csj+i9E/YGHje587oM?=
 =?us-ascii?Q?IrFvUUn5fy0/hkuMPVUZwzqV/7AAY5KW04jqReXB/8cjF6TNRmqic4t83IY0?=
 =?us-ascii?Q?iHOZvT4O2vh4S5AmV01A8gtpiRIYGMlCLTR0/fbLpqR/zY7/LfSNMmHiQEhL?=
 =?us-ascii?Q?e1OJ7rjBCQ2A3uAliKYl2Y1j9QZlJ2LDWTg+1ezy+rivdnXYiuMohuUlnL1/?=
 =?us-ascii?Q?5T+2gkxcOZVOrDcExQHB3XnT1fmH9X+IG61haCEleL3aEI5HZqAvw9HAxUxc?=
 =?us-ascii?Q?bp4jxtSjoH102kgwL8Zj0BOke8LDtTfUAqswRcw9XcRZrLMlGBL9pm3/MPIw?=
 =?us-ascii?Q?g1KvwIcr4n3Nd8wwsAZnQxHizVUuH/jT35T/ZEQWdHeiytaJR8Ryuf9FzTDf?=
 =?us-ascii?Q?Gv32iln1LbG100higof1EJnDrw2nv+T4xhpYMp+NGh/2OLJvXe9nZhCSjoI4?=
 =?us-ascii?Q?JEXpMyu4nDTIJo4uKANFRNj7DS5cmboMxMdH8VE6wktCM1HjWA6GZaxHL1MF?=
 =?us-ascii?Q?8HMcEmATM1XssA/DkAhvUy3kvjRAJOn0jTckkITaTUhd9hqFVO9/UQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hk9UnDoune/WHBor9/I6YCo+43qP/diY94bBzbomWGV6pTIpm9iU7RCYxOfs?=
 =?us-ascii?Q?DnoE1FpC/97rRql/t84KTuqBeVisRy+5kbgF5FPOtKXce8TNp1TITzlZwmQf?=
 =?us-ascii?Q?J6oZs+aC71rpEiZJDUQrrpw6qV2XSySM6nIKTvOWC1bsHDaZzT5Vx092+E5p?=
 =?us-ascii?Q?42wd4NsdhPUXyJujn3WOIfr7kOku1iX1yjXHhCbsosDYVv9FuoTTFcttQKi7?=
 =?us-ascii?Q?H9JN7oJSA3j0Guh5ncalDh9aPYNyzlHFdtYLKo4AOz9KzbtIDI9aTd5uun5J?=
 =?us-ascii?Q?AnxSzq5eYXpfOSKHsNfn1JAyhl/awjd8SqCY+cygQFjM5NHm7aKPvP4KYJ2m?=
 =?us-ascii?Q?o1k0njnVo5/de5GNTuva/7hqZ/0nuqYMC8nTZWZL4srnYCA+LkrS6l7KNdSE?=
 =?us-ascii?Q?JoMZX5QCLqMTkzGktBgaWi5AVC5WN5S8GGMZqrIF6BFUn8YzMJ+U/kqwQKkY?=
 =?us-ascii?Q?9yzU+VTkVXMiZdmujAGsGnTRI5dVrGfYDWOMu+Cbe9wKxL7DkKFEcsswt8cX?=
 =?us-ascii?Q?Cip46Vq0KAIFvbit6a3k1CC7yQLYYDb0V8fBrJJkclRJIVBh4y7vkXt/ukSQ?=
 =?us-ascii?Q?QX+RXOeTFpJijNDeZYobjdrJ1CbhDy9eNuvJpYsB3NQvSGB9iyon4//oVKYs?=
 =?us-ascii?Q?d0AB0nvhLPejuOXJUBsft4IoUiyxAXhIRIw1QRtwBfkgR8Nu3qdeXwgcG3s8?=
 =?us-ascii?Q?HLcSoaBD5iC9FvPLNgq8CE2vMW+qKifcxiLNzcB5ZvcKhYdaxaDjZfbUuBv9?=
 =?us-ascii?Q?W+j/vaQWk9aH1OaL++aRc9SrWsmkh8TXFNLkzwSAZSS4srcedePQZl2N4Gb0?=
 =?us-ascii?Q?PSnftUjf9UNfk6/jMMSuPuRPi4xmApkYeNLAOgGYBV6200IJH8JwKDN2/M6c?=
 =?us-ascii?Q?czE7mY8JSQgvgu8I/ZZaRuQ3smjo4wgP+FWOvJgyYGb30OAMlUHVUs9sEUF9?=
 =?us-ascii?Q?a8Iu1gwW+X3BhC3NkhpvBbzUooIsOi/NJYBEkx9nxbQTcPBRduqhAp16sQrO?=
 =?us-ascii?Q?Qbz7QZLnUvs82Bu48JiBeHWCcTikFn7D0VNs24Zh7xa+0TO+TH7LQdY7yq4U?=
 =?us-ascii?Q?WTsbKdq4re5IQFAnOrcBxg796La06zVzW0uSI/rwXlsuu8QNJLhSeaVL+vJb?=
 =?us-ascii?Q?3vmzk3LJQDSt2xH8Lmy059o0hNYBWZq8Nrz6MB+xmCYrgHfzm80ngkMTCPJX?=
 =?us-ascii?Q?1S0rq0yLK3vEfimILtQakwiyu4im+xF4qCOMWEgAG4cGygtjPGJa+DvLFuyv?=
 =?us-ascii?Q?B9mf9hVTLtk/G0ofrGgujyS62CB6c+yxWA/YmdxVCaCg3E1WveUvOHRZ0LOX?=
 =?us-ascii?Q?tGB1+xWDu0cMtGda52Hccg/g7lZACx9RyNgh9ej+bE6drIw28tBLIKDTQaN+?=
 =?us-ascii?Q?43PjhzkWphoNbSZFrs9SG6j78mTjCoVj+Q8fOPllxRUY/2MTdHP8rA2FgDhI?=
 =?us-ascii?Q?V+qC+jVX31PnveMiPXgD474nKKJrAqmb5ztFzqNlj85Cp761E7DIuI5vcdsW?=
 =?us-ascii?Q?3CF8OY3g3Ek+TnMmb4/KadvolyhyoF7d5WFSvJJZfT68MKBx3N8i5w4fjDDQ?=
 =?us-ascii?Q?+hUQvoEmQpck2G28+Mw5ALp0FQ6LWuRCmDRKe6MM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11b4c85-ae07-4a5d-ebd0-08dd1e67878f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:53:36.3697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofpBEQjjPfjF732Rwt+gNEtweyLZf1EMypXEvndC6j26ih5Y4pfeQuL+jSbfE2FogE+Onbg4/YCFPC9utVoVaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196
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

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
v19->v20:
- Add a-b tag.

v17->v19:
 *No change.

v16->v17:
- remove headfile hdmi.h
- add 2024 year to copyright
- Add r-b tag.

 include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 0000000000000..6a696922bc7f2
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022,2024 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned long long tmds_char_rate;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03cd5bae92d3f..4ac486b101fe4 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.34.1

