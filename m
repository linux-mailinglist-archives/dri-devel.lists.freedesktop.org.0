Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE/XApWGrWkC4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C72230A19
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861810E430;
	Sun,  8 Mar 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b2gpCM3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35B710E11F;
 Sun,  8 Mar 2026 11:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2UjdR8XJlN4sMOXvLXNCI0/UDFJCe9xSjK3cYA7MACbrb+NmqJV1YjLb1zFmMnrwBz29hTawSyGX5wERI/to96RuGqejERFfDB0h3k/inslU5U6HuDR8ZDzQHwqBUiej1hvXfvJ/m2cybowrNZw7W4iVS5eGYcfN64v4Nly6Pr7Diy/+TMN50xVURApxt38G/cqObGspGBO1OB7tco0V7x9BqirKjtDXhU6YGWFIQ87fmKdtt3BCAzAhdmnw6c/o5G9ADRe+NJmjEbMQLtL1AHxyTbVk6qy73kqWsikzUW9uPZAYj/Mo83+DLiZCQrutxmdIxKdgvZYz7eaZgkoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNk7IOt25du3XkSDfYimR/3SGCeTsWYiiVodyn9P7zo=;
 b=X6UatU5n9M/W1R7RN/iusVUNXt4kM81TkmbVvOu3th40vkWOvsuFyHJwLRkx6b7ox0WpIqkO3xFsOIOKxup/fuwduDl7uy7hXvrSi+euiVY6PeR86q6XYI5TgwYrwa3HE+oCzLXPyYNDJvcbmqQnE2IXY+Gj6bCt9nfpeUEM7jz8uCbyvCWSjp3HcOqNFIxDb1ZlebGRp8J6/ADdwy/j4vy/cUgIglJTVkIXfqyaTujutQrzsxC+SklPCAgAksycdSU6o+YKqcjvW+3+konK0snZcuEUoz5Kx11z8x6Q+GE6eQItcQxJQ8HWACm0nuFLCB8p7O1KXbL4iTKJo6AjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNk7IOt25du3XkSDfYimR/3SGCeTsWYiiVodyn9P7zo=;
 b=b2gpCM3ohNFRC28HtEIjtw5WFC47THY8oBZTeeJnPYGhtYpv3C+gzL9vBdQNHQDeOcUYbt3zdDAKmVjWCsSkQeeO8XaodpdYHWfxGjAUIzAobVpYK4iySw1KADmWH7oAZZFGJBhYfnU+VHXzixUo9a77ixlFAzO93kbi2GQhhvx7Y+eV1VA3cIrcF6sZzJPPf0ENenka9/6/rhtMLKJ8Z/M79+/npQgkE/wgo16hiRYA6XRsIHjs3pqZO/bCmGkSXbtJ8RdWYkPpEVPnRKfU70wuwuYipHGDg4VVh4+KLP3riOOprsDfmbiBw8/Z44HgFdrpKqovNannuIdGOvSSHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:24 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:25 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 phy-next 15/24] drm/rockchip: dsi: include PHY provider
 header
Date: Sun,  8 Mar 2026 13:40:00 +0200
Message-ID: <20260308114009.2546587-16-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0902CA0031.eurprd09.prod.outlook.com
 (2603:10a6:802:1::20) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: 2facc553-b9fa-4de7-84c2-08de7d07e867
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: XiD4btnTV2XvlqEuG7xBWf9S5Zz2ydUDKhKBlREU3DT9fkOLDDi6Vahg9+Zuc+rG5SVubr8PvtqmTZ/shd1qqDhdOG/p9/vZ0Uz5B7VTesM9NfL+YB/2jvX3PfsEnm3/VgJBR+53d0xwig5SkHhOBRtUB54nDFrC2adbWbnZRmDMnSglgjGzwanyoB0uvKpXOe2pz1q65cUGRyUPjpn62fvRu02yctTzMi/Zv0XJLG6BIjeluow8CIlSGDpEO3OtFLUxlVy6tci9Hu2N0LleV6uqrJV0adPmCRk4yynZFxMHaZ9jwB3xZk5L7fQ8eOD0rtxS4cy+hrIsm8wzTSWgO4xdqZ16t4fValjLH+wPkMhjxrQJUdU2SDCuF3jizXaYEbRL6sb43lA6epYszzbDXYHeaQ5IO3123rot7kJi6XHTKzGmGuOmNfaKflEBiac8GEAdJNLNihdopUVQC2STcl+B2Ezu9GRDyBGSSTuPGPqfWznqjQ73hUgsa2OFv/hBqtPBWwEyg1rJXPr6E4X+k9KTKhhJWBvBfZnUaOUA7zMR+mpKR5vp55ahFXHI5OqbODJOChhLHT091ArBcgoKLMXAO1p08cPdVQ71uuouiyUMBHwxlNxTwqcKBjyAYRuQ7ylSsbFCnvgx4FOSQR3fVJOp0khAwMUoRKUmU6tuu3hMEVhegDvg8iND+0j9IiQEMy4eLroIj75UHr12xaz07JBmt7tzR2bqvNdaymQ/GQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G8iIa7X8blMCJEziZOdwm4dTxsC1PQ5AXkcNan5zzY0XixDo6aF3A2xQJ+Ce?=
 =?us-ascii?Q?G5qLbmHj5uwbrVSBcJSMwiJnCQRKBuvYCpcVr1EfOdgpziu8cs2Ezx837Ozn?=
 =?us-ascii?Q?vpwWCoEIAq4x5Hus7Ae/PUQjxYBnSUc5/rSdafVO6Kjr530SKyRFqCf1Qt37?=
 =?us-ascii?Q?B2jBypqlXvjw3RsdSVS8eMkhBnvlyqH0F3EtQuUnk5M+VlhZ0aSRpL6sBizo?=
 =?us-ascii?Q?Gq6Z+zDcNlhUdIUeBmNXkj1zqSISkeQtYcuDswrTBkvJLwS2jTLibbH69srs?=
 =?us-ascii?Q?Sx3jRPCK9z1uWWyWMYeTS1SXtfhXFxzUYgY7GkHBK6iw1mjpIWx1a8LUtgq9?=
 =?us-ascii?Q?lBH71/AZXF3LLdCXGmAB+ffBPuJfiFho+/hhipLz+pRqaTJ69CqeJsz0/Wwe?=
 =?us-ascii?Q?F08VzDdTvtSs8jtE+NHJJTMAWEadFZ0+yfoBNZsgMCCA7ehnHr0HmFJUqEn/?=
 =?us-ascii?Q?az+jTQhSWVkf3HYVTnHXowMqVjrplG2m/noT8R2LallktAdPSvRPO9driLhw?=
 =?us-ascii?Q?tuqDOVpzmfLFINjmJAmVoef7aAzvPQbqqP0tigadU6QsRE4ou5U9BlNdjdno?=
 =?us-ascii?Q?w7cvsujR+Iv3Q6p7PfeTFfoHk5wMeKBYupwi9OVSiKkAGf7Aq067wPpPbag3?=
 =?us-ascii?Q?wiPVh6ihD5gW+WCTpvdG7GVHKhBQXdbxfmGd10cLk651s5K9ijNKXDfCPgYD?=
 =?us-ascii?Q?H64bDEwWBIkvWhW4Hrf1M0dwbLe+N3s+3+w8ETTDTV3btDud7b1+xjNVzzub?=
 =?us-ascii?Q?CTrbamKh0AvMTp/4OSCQeBUFnwZct8fa//1k4RLcdEgZPtSlVzBHu0PiIJE3?=
 =?us-ascii?Q?A2nmnJ8WY9PzqyP0Yfq4Rv5yPGR5FSXxNqzxsybWt2ekeN1CSeeUP1jjcMmQ?=
 =?us-ascii?Q?CJryVk08ohI4aDXftYzEAznSed/FItdytQHlKf86MNJfXjQdQw3DeQCy/bbf?=
 =?us-ascii?Q?WQ9ARYptfKdUJBI1iqFWpJIVNLH1ochQ5fgxx3JGq0/DVlmUGDdpc/59PTz/?=
 =?us-ascii?Q?66uApBX/P7BITBfehnXop/l/7ZvYPXJUCPzJEpXd/nG0PegavEW68/d4N3uk?=
 =?us-ascii?Q?eMLmRY+o4XDoSWP6ycCC58wuR2YzU+7or27F6V9leCvg9I+wyoiiVoC9eo/m?=
 =?us-ascii?Q?iUfpGZUS0mbp1dqgfiiDb0A801MMJdEeDv9pJJXvZLKA9mZytverHAaQoPtu?=
 =?us-ascii?Q?BQkkGzt+sIthhYXPDlyMPZztH27PvSKObgt+Az09XPlrJKaEg6QyhKgXNEpU?=
 =?us-ascii?Q?wcEQFGM9+Ti3gDszhKlosI6NlyCrEuh6QyIQpL3as2rZUjVDCjuzYZMall76?=
 =?us-ascii?Q?OXjfFwQRcQdNqISrwKtwJLaVBv/2yZIXCnf8BaAvlbVbVqTfBMFpfwzD8qlA?=
 =?us-ascii?Q?TcvrtMMvCYCT+t/zFvUm8bGhPGcGqyJsDCC/fzYkv4fJn65XVNt06UpRZWC9?=
 =?us-ascii?Q?7pJEPuH6fFhlYHT4Jb7B/7U3YKg74gNXMDywmnae7ytZH4hgyVeM6Nz6LV3Q?=
 =?us-ascii?Q?dvWA+oEn0kfpkiZj329fTuj/yHkev6R8JDGbBngsKv/MFem0TldTzoESLcrr?=
 =?us-ascii?Q?Asto4qnUk+fEZn+F/e2C303nelex6RMp2BKAZNP/aZ+avdAWqCogySTHaaLX?=
 =?us-ascii?Q?T68qwVWyKXtCrjIOo8JwgK45924gKQguE2czwJN5HQQiD3dq5tMkvTzF+S3E?=
 =?us-ascii?Q?OT7TNVmdZb1B+i/JQT8qLKdJB4bIyYLSeZgUpACCvey9fK64EzFRkAo/hPz1?=
 =?us-ascii?Q?0rUQJfXmmJV5kxsA2+3gKI/P4KRd16k3TQeF0cUq0AD5HJlHqs4ZVNhV3eIh?=
X-MS-Exchange-AntiSpam-MessageData-1: hw3r2bAySq57RGC7htYcLrblcCnEo5v/nOU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2facc553-b9fa-4de7-84c2-08de7d07e867
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:25.2968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3HjVsDGAnOmrmTSxn/9X1CCvvENynh6nvPN5kGSD5QswWDbrpFvH5vaIhVLEiKjK89TtDxwwZRlwcR5CxRRsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 39C72230A19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Rockchip DSI controller is a PHY consumer driver, which is also a
PHY provider (calls devm_phy_create()) that lives out of drivers/phy/.

According to Vinod, this is discouraged, although it would be difficult
for me to address a proper movement here.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

v1->v2: none
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..c0aaa51e0237 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -27,6 +27,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "../../../phy/phy-provider.h" /* FIXME */
 #include "rockchip_drm_drv.h"
 
 #define DSI_PHY_RSTZ			0xa0
-- 
2.43.0

