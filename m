Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP/SM/Q5qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04E20D2DA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E499010EB5C;
	Thu,  5 Mar 2026 08:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dldRAO3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64010EA85;
 Wed,  4 Mar 2026 18:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJccqbRKyh4BmwOB4Qv93kBhTByQqCK+AD1XsGv4xHIpPwYQ4wlxlSckuG2qToPBdFV+KiuGgeq836y+g+qUnIiGHnU+c2nJ+FvXkRuqdD0q/UR1Ql3nnE3r3iFJD5ErCAK99kj5aKGRQmxwj3guZ9WRBs5YXlGiar7E8ZE3eZo46Tca+m9xlFybgGNMBRn6I4V1TT7FV5t0IhwB1f37Jk1Bc/HDe0s4ARB4StpWKtTs2cpnhT4lkL8QJigOrjgT1V1+nVEL40Pvi7W69yzUgU/OQKI3EsXpudLmHe8cug9ZcZb9kY9fcIQD2HrNO7dMNCU2/ZLcTAscBV3UEvMiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kHFA8Cva1I3Uh29j+ByVw+ImGcUdFddwmsq21EkqkM=;
 b=f7ITrf3bxoRbY4kOo8TBjVKDO45iifMLZbAOcT2iAiMqPWxLS5MSFWA4zIP6JrEDACSJGw3jv4YfAUxnp4adTLdVkfgahGBYflvui1W64sbvIAwaMQcFiaWWgHl13dCXT0BwkEAU16V8Xi0YzlV9ryUL0+MApLi71ITSSLfrafivl93UJV/GFVwGtZsYSQMjUbZoAU8s02JYhztx9UTQ1HvpRhpoVFg/qxeHrCSqLY5OSP7xdHx+N7/C1YWCZIqVvICRcKN/KnWg+3z6H54dzGrFhSV4OrDg0e/UkqLcHnSAOiTflCPr9I1E0pq+lCcGozNejD3M86oWz0mjYTiB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kHFA8Cva1I3Uh29j+ByVw+ImGcUdFddwmsq21EkqkM=;
 b=dldRAO3qH3JDZPF3hQU0pBLjBm8aAQ7gXitYgRmCUjjS9GUrwK/OtnPJUXCI01d/LEUM95XG/zYY66Wzhs4ovt0JqWVtbvrBHV463pD+hsyBG6gg1YFnkJSxKRxvMlSDBBDLONdza5wsXxit5XqrPOgvshnB/J9riZZaDc99J9NnCWDZCB4yhoaD6yPRVvbFRvePmQ5vHUK3XXFhWFcFY/l1zgdEMuEqe2BneWk5nzyhu4FTaTiVYyJFjxNmFlrIKAEWfan6VPuuqSNDnzxlK8GNReVIPOwBbB7Z4e8xWgyl/XesAhkV9DMjOffirAUoNPUxLqgpWJjlKkuuIBzU4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:00:00 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:00 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
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
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH phy-next 04/22] drm: add <linux/pm_runtime.h> where missing
Date: Wed,  4 Mar 2026 19:57:17 +0200
Message-ID: <20260304175735.2660419-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 923f3cd3-bc90-41fe-d0f7-08de7a17da2d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: pJJEE5Nzk5oxyTz6E4HKc344ZqG+djxHk8jhtlXY5fbZFUOMLR/DZWduXFOCIKQRRsWBCWe+pzLCGrM0DLI/oKMRcVqf9qsRXDdPff/oNwdHIODkZJQZzbNMahq5U1SRztx/E6i2YGa4TfBwp9RITQehJQ1SsUUS6nzTcKxlNxIr1t8xuiUEIe23VMgH3eKGwB+R7OrDSRD4dimC1ACgJ2LHLTMH9qfRVUQomtZQAnoJLFsDurPGMeEY5Bg6F1ODkbFhKib4ml7VuoKS7xxsBYFEytiHup8+lkSMv2Q5MyjRWZPcXL+hi+wK9yBa5qcn0rtGhnVOhPsmrcZAzSmyUFczBrAExizpaauO8uxSaSB2jErB8GkFVIJqjr54wGqsIPrg0eO1YRw6Xk7XWvm/i3xb1LlfnUiY71jlolC24M/5DQBQnRozkqFAfKFnjW6BfCwcdDP65DNbwa2EQBHtrh0/UkwQJGtd/6PFps6bss+xmyHRqPUYhE/JlluOb6YLrQVB0EXybG0nPGN2XR724zZMbzQwr5l9RNStehQYqG2fpmduv3uT/JdIufJODpIaRJx/DDoSbj1CSmu/uwH4wx3L6zRg3zn1f3KIUq8pGbwCLhnX7+E3mWDH4Tosf6IDWLQEf/IXsWStq8cMkITrEFrOJwixjEE4Z1zvUoZZQTr1kICXOVo04KdA/e3HYEaRe12yfOOFq49f0b7oCWfOMwHJSI6geVeMU5sBq7E7VSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SrWWM4/kGbXOZAGsXxM80zxJ3NDQtA3TCVyAye3Oxu6/B4IUdzOY8uAl/DmV?=
 =?us-ascii?Q?G9phAPt1vJre3eX+LK8UJ61OpJFFNfSvZWSGhBRXUSA0vY+ATcPNchynL7NQ?=
 =?us-ascii?Q?ANN59Ufjzl8iB39m4UZ+g+Som7EeoKk4saqeWgFoT199AsVhAxdFds+XZ8BB?=
 =?us-ascii?Q?QjSEwlOTCvOUKgp0hUQMO9ecLbq6ZEoq9xukxoidx1xtv+333523mjVVabYb?=
 =?us-ascii?Q?Ew2nYwLOBlkz/oD+btJo8qBvsyN3wMdhHvJ2N49gQi2OUAbNF8oqh9aKcwXT?=
 =?us-ascii?Q?Dk+H163Eczwye+xwv7Y1y4wX8MF6aqJSqUMYkEzlnsI+6Hem0HB08e40ZV9t?=
 =?us-ascii?Q?HROjozv3UWi1LNIBYQSJGa+aCPcXuJMUBW/epZfPc4sE0jnNf64jdNjbV1qE?=
 =?us-ascii?Q?0ZtBdwQ6c5OEDY7x5xG/dkO2WAilo1z6maPYCnNEBoKUhGqV0Nl0R2Nmf2jl?=
 =?us-ascii?Q?4IZ0VVND8CtMP+QXzU+1TV65iy3raVf6CE7t8sG/wq7ramzT8pIxs5F3xt0z?=
 =?us-ascii?Q?jB7L8/uKOV4RIaHy2MkQL8CIzs9hE9Wau87dVBoSIGESQGeGXp2PzP8EBajB?=
 =?us-ascii?Q?vXtqIAOGwIVrDOJpaAgtLm/fW8SRS7C4vxTzcsP+dchpKErbJ5EE3cq4kL7v?=
 =?us-ascii?Q?WtYN+6f8I9weXCVLLiF0V7miSKmF96otSzBobL44KohztypKcF6ylLG1Xp5m?=
 =?us-ascii?Q?4VFh6B0iXdrVZxRGEEWfoqKjOOP0Eoxlz9V7e6Dk4gOqrQ6mEPYFsv7W8n3p?=
 =?us-ascii?Q?5oARUXR+40oW86r9prNwu8KcTSqpKPhkuaY2IKnA+8YAxLkr2v5/n28H2wz4?=
 =?us-ascii?Q?s1Ce6Q6o68l4Vdz91ruF0LJKjqhy3N2jq+br5+YC2J3d0j049FHnDyEfthkr?=
 =?us-ascii?Q?WsyTHCx4ntrGWzEHKMHgejpJ/PxMFUKOsjs2L9fUD0zhKQEm7suvOYVSrlIq?=
 =?us-ascii?Q?1Ww0YHsm/7LOhIDYF3mZ9QYy26uWm4k/++RErqrd5kF10EasSrSplt6kgvyX?=
 =?us-ascii?Q?cd8CshQE+uynNGCY93Md2R2BmwyR0mVQ+ePuGf/xscmA24UcbtvknzPWF6oX?=
 =?us-ascii?Q?4bzoUjbHDCh6AIKPE12rAErgVRsPe8K1VDNEcq249vhgGV9NSf3QGHrM6Drp?=
 =?us-ascii?Q?pJ7qgyk6M0LYSr/Y8+pLof+BNMrfQawIC8ft3HeeSEaGW1mtJP8dHG073TZW?=
 =?us-ascii?Q?q9Iphyz2FNhmBpvQ4dsc2Rl+HEbWdLVelNjZq8hhhloJQi8upWSnlmaNjxDx?=
 =?us-ascii?Q?ZKTVM6Kpng9WaywqjPi7pdAy9s5/thcYyhaSSleJa+eqKYAcBhHxFv8W2Dae?=
 =?us-ascii?Q?n4QEFwIJCcSCDhFGIomzRP5SCGJHr6zD6z1Lv6rziTfnOzmuVc64HQ6N85Pr?=
 =?us-ascii?Q?+wxdXEsXCo1dnCSmWT52LMKlAIne9aBujExVy/Vxy9G0D/mU2Q4+Bxu74du1?=
 =?us-ascii?Q?1tGMzQRNyRltuF4+05p+eNehqP/z+PyVa5gpFEUETSwJP15nxsaAkt4UwfaP?=
 =?us-ascii?Q?+50xd4lrZMz8pZ0mrPJOHBL09qA+L43Cfp+lOA6Xjz0I+IG/FpGkWf6oJq1W?=
 =?us-ascii?Q?2mvmHRppfNNger1Co+0gIcPD48dyNJhCHFBOnrrBIgPqDNN2RXYEdFhcnBoA?=
 =?us-ascii?Q?OwxoRlD+4+v9VLv0ZVjWDiDSp/z3Po3q+e+2Qfhq6YxORdFUuS3m2zC9eQG2?=
 =?us-ascii?Q?dHxVV9wwlXQmIdxGK08qiO10gT+msXqhoQSGBwMLh4zrEODlnqGHsKVjyf5a?=
 =?us-ascii?Q?V7C/jrp8YOuUcDW0bwDB9pSYNRvdyO0JZ1DWs0Ns8KfY2QxBWleFozm+325c?=
X-MS-Exchange-AntiSpam-MessageData-1: p30U1Hou19wRVnBgMFvCGg6rRqlKftFuiRA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923f3cd3-bc90-41fe-d0f7-08de7a17da2d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:59.9495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIXLaoBphsrVwDK47ddow2h+E97MHwjIeXibSVgzzPI5VL5gXBHWBdwaF7aMoQ6zjXRF9F5YHe+OyB2j/Z4upw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:48 +0000
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
X-Rspamd-Queue-Id: 5F04E20D2DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,samsung.com,amarulasolutions.com,oss.qualcomm.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Multiple DRM bridge drivers use runtime PM operations without
including the proper header, instead relying on transitive inclusion
by <linux/phy/phy.h>.

The PHY subsystem wants to get rid of headers it provides for no reason,
so modify these drivers to include what they need directly.

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
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  | 1 +
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                    | 1 +
 drivers/gpu/drm/bridge/samsung-dsim.c               | 1 +
 drivers/gpu/drm/msm/dp/dp_aux.c                     | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c              | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index efe534977d12..9dfe790e6c14 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_atomic.h>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 9392c226ff5b..a8b6ae58cb0a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -32,6 +32,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 2f7429b24fc2..9ac8796ae91e 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 930aaa659c97..54bc148fc29d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/units.h>
 
 #include <video/mipi_display.h>
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 3825a2fb48e2..5ee22f88bd28 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_runtime.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 177e30445ee8..68556daa54ae 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-- 
2.43.0

