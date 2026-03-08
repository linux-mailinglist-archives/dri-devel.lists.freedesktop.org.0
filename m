Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o1FRBJWGrWkE4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A33230A1B
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED24710E44A;
	Sun,  8 Mar 2026 14:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Tztu4paf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D183E10E135;
 Sun,  8 Mar 2026 11:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DySZgdSpm41JeaE6E6Cup9XOSGMl1BFJG+IoSWWtAZ1slLx8WD/RBmnBQkKUi7xI9/3Ud/u0wcrkz8I23QRlI8mT2WTq/xFY85g9XIt5vlhXADfWVs6uOA+R8V6osJG+G//+ne45XgLn97/REP4yc8IfAwXbZygygA4siMuAYSoFfE69gaHDh5pXlOdUGVJJ3GfrNuZPuxLfWv/A5nO0Bs795IMt+4VhjLSBlOFLerIdoUQ4ZM+ISk7yn0eh3Qu3+Lm8tZ/qi9WJp3n+ABbBqtMsgU+AngyZpVmgRhG9roi0SeBtPrxxZ79WGpW2xKUn6Wi2bpKihD4jyHUSTbDtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuNvSAMKzb6z0IxBDVlx1DMNi/SZJ2bXREInY+TguY8=;
 b=lrXr4cd5vpbDvRgJjPLQMk+Bd6C2e1MO+LVV7Ht0jUKKhZwsnxNrUP9sAipiFtLWvJ8Wm1BfEk5UdVy4YpQ+CQq5T/ZVyQtRi6+mXZajaaTHEz2e/ZnvgNWpGVoBSFbnSJXRwt/CFoI08YTvt/2fmnrIPt0ZpQ17u3i1d9I71uH3xoMbynlZF91ezjxeU70Uz2ahSHEJbN9i84zFP6FCwg5xLuDtjMAA4zgnOFMidWashytrj2Et6bRhNIkKNwp7awJWYKyQ3AHBUoA9BHu7UyK0DFx1zaM1pFdHIs8P8llqq0usZza8a6LiowwAQAxw6QvgcsqePm8Cgijxj8jUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuNvSAMKzb6z0IxBDVlx1DMNi/SZJ2bXREInY+TguY8=;
 b=Tztu4pafwrZr/XLsesC5vQc1Gij3wlJmrijYOZr8UvRSvJfoEwTX5enfQxB+7Kjq/d+MBFASTusXgcV1cf/RF6Po4jQusxgDH3ARhNOKTnYDbh+nueHbF42AGlunxxirqHhVXgHySi6vHLaXZC75dsbp+LHlgxNdhHiRExEcLhjgUM4FsEDi/uaaB0mBQcnI4lHmLSDvv/QrXpRAow7eZiQVkbmg1p0Xj0r5uk0G3B1mcbGyv+XDmqgO09WhdZ/KZ2KS5KbyRow27RjkAI60zv47VeDB3QfuqcZqwiDEuEDx/JYkEvIpa0pln1jHn41V2gPR1nKHMVWUVdz/MBZO1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:35 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:35 +0000
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 phy-next 20/24] power: supply: cpcap-charger: include
 missing <linux/property.h>
Date: Sun,  8 Mar 2026 13:40:05 +0200
Message-ID: <20260308114009.2546587-21-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0274.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::41) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 7239c8d3-3cb9-4689-0f97-08de7d07ee62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: u/6/ply7PZs3bFuzElJ0tYHCISYwmveEYeygDoClM91xfG2go+B6AXKhOzLS66/zAIIplU8qLm8tA6ypLP5hnqLbB3c/eB0JYj6a21iOmCe43nk3NNpW38FEDy8UIPW8y/Wo508u6vCqJHyoom9qZFIiLYeLy4+XPAPDnDDoWZEqQbt3lcwZwcqsfG0809y5DG4E+CnWVBdazgxstKtm/Bm3KhLqsi3LDQOB2cZYs7xIVTdOuKaasUMFGf/oZln8bOTK+ZpbTe4QLo+r9bhXhm70L2TqwVqv+AO3GxP5S6IMO2+BRbVPQSFu0HA++deuUZQs+QcuDaP1NHAaPnM4E7MuFeC+g6T4tFVX4vASjutcxPPQuR8/w9JhkyFD8z3Bn2HZzHUWbYoiWWIQErQP3QF38Mo57sozRUhTIFngQhpnRaKW7rScV28RZ3YwWd2nQsA639sc/YgnGnkNU5vYuN2bR7VUgm13QhY84/PEXcKRK1vsg7GEO0zUKk8JpjQIPd9irV/eme5ENTQVWA4Oms91ZpKPJJFxXzzF5MUKP3uIwh8HizVpoP+py+CSU2dvT4z21tHgKG5dpMRr51bjtwVRF98kGbC53JnZ3e2JNqgFdLN0TKs3izWgN3QPjCtZiIqHCdeBl5CJhzZoGKsyhghQKAm5+QF7W9bd07D0P9Gjk/CzGGu6eg+EUcTKE4yYsbAablJadMYT4P+ZKgGhgR0CeZ6+NetcxwyNhEuz/Co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dCCNh53AVUc4E0cZctXS6oBcsyGoHTDPewJCZdN4lNl23dgDVoUNSfr4EPFa?=
 =?us-ascii?Q?HnroA5JWcuu+E5KPEr43vou5tMWjJjw6btLGnM/3X8YwyJariUM3y3upVwWP?=
 =?us-ascii?Q?z+xMGpQ+t2zItI4Jh+r8hYUYHuSiWNh18fj9Hc2+rNi2Ym7hy5vYRQw8jA/j?=
 =?us-ascii?Q?4dwRuL+yW509+rBN3DnNzWita/zZtBqA6g9MayxQo0o6+VA/Lyv0e32DgvqF?=
 =?us-ascii?Q?jEEs+9uAoQ8mKudhBFfy4D5aKy64p84atwOeTFWa0ExBfihf7QJrqI7A7htO?=
 =?us-ascii?Q?Lq4P+ZVO9TkLw2Ooi6O93wpXjGPIIfwoy8YCJ7B82Edj4FHof+Fr6ZqOouUA?=
 =?us-ascii?Q?ttcto+gcma7P9DO+mG/rhK+j9V+fISOn6ydNuBIkrjzLCoRTPDGzvz/DJnEX?=
 =?us-ascii?Q?qFMvO8n1C6RBcqGndhtx7B1TSmYPa29kRgmoIHm3I+VgUO1OkxNpclGa7XX+?=
 =?us-ascii?Q?t8Qn6NNSWbu0KEUvAzpN4//j+7SrF8Th7DxCGMUurbd6zbkbq/lBXL1kRoGI?=
 =?us-ascii?Q?s5qrdyuby9GilqkPygSOT4B6x45dZtxtS+u7eJvkhOlRr3e0UgCwd6nS7Q42?=
 =?us-ascii?Q?IrjesjzG8V1d0G05kZ77x/dcAcdgGzVaQFBlSBGC/mbN1Y3Mt6zNwtqlF09K?=
 =?us-ascii?Q?/YpJXDMQtccgoQb6dVBZ+E2U/a9os226UO/AjzG0OT+TYfLX91bTIkfKWQm0?=
 =?us-ascii?Q?OuNY7rONHGnIs+uOhdBpsE9FTNcBN3rDj0q/sYg+nb7roNE4M/v0tNTyFO4C?=
 =?us-ascii?Q?4R20p5g4gdo2wvdqOtKrpkPGJdTv0Kv7pmpVpqbbC/1oqemaPt0hAXTA0OT+?=
 =?us-ascii?Q?WihZv9YBpXEQtxMvy/9yAqeqD/cM1l1uFwmV+hBi9RdefQTP2S5lxsvqNaGC?=
 =?us-ascii?Q?1ysMSC4BOS8sy1VqGJU/QBWAdAT8REwkt6GNGQO5fzRGlGiOwC08UkNvzZzZ?=
 =?us-ascii?Q?ImC3q+gsyWcebwffHi3Nhgc9obJ+OJvpxdpvoymtY1ERItx9lRy/r/txmz/x?=
 =?us-ascii?Q?hOpVmIIqqhiIllmEsVVYSGTjmi7li8YXCLGUOZ6NXqjxiZJ0UoK/ssOdNmJw?=
 =?us-ascii?Q?fSu9NFvlF9gP8HYG7SSVDXehnkBGP0o1Qhy515FZ38MIT9OC9b1nSAPE3/NB?=
 =?us-ascii?Q?QrPbm9e0NpDUACUl6o8IGY1IOwHx/blV72AjhO2EOqjIhEWxnqHHU+K5BfYy?=
 =?us-ascii?Q?S0VDQX4leAs9X8mH+S8lJQ30qmvgDRPw9VsSggEmV6NoLfCCRbQ29nFDNJZ4?=
 =?us-ascii?Q?udcalfAeWmNQfPLzDNKPne8SYnhnd9pRy5SMNajVrzl8Y/J3H0Eq7Eh3pZSk?=
 =?us-ascii?Q?8JF/9GfrmM6U2t95tePriKTLtc4a04cAGyU24k+LGl/q5nJj97Vp53fpannb?=
 =?us-ascii?Q?6OCARenIw+1n5sM13Hkq8JKl3vgPP9lnDkryTYNQtvt1Ez2sou2xJXDuSxRe?=
 =?us-ascii?Q?zwyMJCJD8o6iYSywH0cl+pNIocWNklfXyQqkNPdTVOwZIaIBkj4zwHzH7Vol?=
 =?us-ascii?Q?960PSAO2AvyGtJ8zIF24hLtmSdoDboysWtrpIgBbsFQfyLRNv1BUBEn9xlVC?=
 =?us-ascii?Q?jcZZqQ8GoOyECHW9A37UOHBmn/036DM3HEWuixE2LoKaKQrwO2XED5h3J28Y?=
 =?us-ascii?Q?ifHho+l4yJcBTXbFtJ7TNUzFfb/73AE0uVcL1cuVH+9SwIlhFKkyQYMGhLzR?=
 =?us-ascii?Q?9JGXGlt83iffdOscqEFIRTy4Cz8CYOsQQosqZxBwMoIjdHKZTrZa+9FPAB+X?=
 =?us-ascii?Q?+rkXqK/cz9vNQQhmAXE2Irhg1zGA2OhTfBBDiooONZwePuEQ8Ckn4sOW8SbM?=
X-MS-Exchange-AntiSpam-MessageData-1: 86FK29ROf4IXIPvk0yd3Yu4QYxCZzy5oOSo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7239c8d3-3cb9-4689-0f97-08de7d07ee62
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:35.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHCSIJhXHiDTP5fBrM47fbPtrOzfYy00vXyOvttC2f+XGSEtnra6i3VTY97bM0BVK57qAvUm30vRkhcn0nRSew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211
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
X-Rspamd-Queue-Id: 60A33230A1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

This file uses dev_fwnode() without including the proper header for it,
relying on transitive header inclusion from:

drivers/power/supply/cpcap-charger.c
- include/linux/phy/omap_usb.h
  - include/linux/usb/phy_companion.h
    - include/linux/usb/otg.h
      - include/linux/phy/phy.h
        - drivers/phy/phy-provider.h
          - include/linux/of.h
            - include/linux/property.h

With the future removal of drivers/phy/phy-provider.h from
include/linux/phy/phy.h, this transitive inclusion would break.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Cc: Sebastian Reichel <sre@kernel.org>

v1->v2: collect tag
---
 drivers/power/supply/cpcap-charger.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index d0c3008db534..24221244b45b 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -21,6 +21,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <linux/gpio/consumer.h>
-- 
2.43.0

