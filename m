Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAmWHZaGrWkC4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F61230A3E
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9195B10E43C;
	Sun,  8 Mar 2026 14:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="P2+37NOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5088D10E120;
 Sun,  8 Mar 2026 11:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy1iNlie+7LvbMek4vDYAXW4PI//UI8UZIQrDsZ0nguLKYlVcIOwJyDJ+jzS0jYFvL82BRfLpBkhlvCtakBhnTPTC2/yr03jeBY7rztzvCXUU8XUyvjKXXe58Lt8OOwbs09iSaQkZNRMWPBTwrYB5eYf0J3s6P9s8vPRWGfmZPZpz75FpBtv77Y3OARWtdcBjPUU9V5F3HxWn9WW27JAElEbaSD5ozXj3B205ro6jsUyn/LTceFLbiJg0pvseuuegdK7fcbpXzFB86JBSAnNRFBTjTmCraB5NBOy8Xa+0kQkSjncqDONU2gwQA7IKZPMBiIBdIbXAMb0FFbi0E3dSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Czonliw96KjArmZDhJGx3uMonMzcdrXBUXO/2vk8F4=;
 b=M42sgiyDrWPV1l6uItIQAJWvLjvsyHaA9SUSZjBegZVXav21xFcJ/PoH1NybIslBHuCZDDGxnLjsY3yfXpfjfyTNHhgLJl/kHL+c1NmajoYSjmoHf0WhcPmwVTswOyLf9OVqJ8wRQx416f45PKgYvCPwmrPzEirHS5qac/jLEj9ewdhRjOE7SIoIgI8gJlbTgAuE6xfXGARrHGMIALYH7oxM7iIVCqCofmxcifEATm3Z/p/Y11UDKDXwNaBuZFMLMcFj9fjS3ujNYaQCuz7CwlvQYC0eSRmlQKoHVZqNERMgAKv8cpiVLCmUs32G2NQn8BBeXWAYMqaMWQEpJFL0uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Czonliw96KjArmZDhJGx3uMonMzcdrXBUXO/2vk8F4=;
 b=P2+37NOxzjifDUvqDTRBf2y0FWvwl+D2Jsw34jiZa6mX2nbc24GQv6H1lWM/nM8ztUsQeX/8lw3cLBfmuMRVx8YqWWqwA2rzRpzMaWSHP7N/B6MGMm9Tm0jJh/0PIPiV96zSBU83gjunrbE5/k30wlApYtu6qkso6wM+TZz+e64Kqd65rklvyC9aQ9lYHz4f5idINSjF5Xa/mX5dYiwPzsi4JWOxVTpUMT26ntIuIa5dNqyPcj6mkmKARYHDJ7mMY2fZrzUW1iAB+F41AsbJlnOKUfDHQHrZDuKmyq5TMMXAz63d3J7u+HfFB4wNwwhxVTJKOQVWeCOpvMIWZ9/H3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:27 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:27 +0000
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
Subject: [PATCH v2 phy-next 16/24] drm: bridge: cdns-mhdp8546: use consumer
 API for getting PHY bus width
Date: Sun,  8 Mar 2026 13:40:01 +0200
Message-ID: <20260308114009.2546587-17-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0217.eurprd08.prod.outlook.com
 (2603:10a6:802:15::26) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: b7936de1-b613-448e-c7f0-08de7d07e9ac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: 5QRy9ZPslCQKNpCSFE0nkXrzJ5ket0UK0zyjYB2Q5PHWZTvYCNPn1SSEBEcwtP886VO8lmjkBO/9Sn8P4JmELllNFwHEx3ctz8+3rrJI2Wr1Cz5QAJnv8lJEt7uNAo5jHWU59wanDVJ2VU3AjmM83sUWhBjexLCimRbloZ3BWgacdvkRKc5DSbnf+Heen8nGNSi+NQkZfUazvql59OqFE8TUgrLdGf/nakDNRHzaD4HdXOTmCsKUyAwIlDf+pGa1DRZmYrrXQJ4TTduioA/8/kjTHgqql+0WmMveFBbcHD1iI0eVqeU6qD9ATYfix5RQXhfKsHAJQnnByAU9ivvw0ziZ2yczEDJN30kKT+lwACE1Wmm8ge4JlKsfl+NmkPqLwKCI/mkS732gdVyPdYiD/5Dl/lN5aAHSXWkH1f9cLylWSjd3VsSJ8y0BHaR1X6auH9ZFOJc9Ht4QRAS84VZpcUXrNIi6kKPGQUJiESVop5jIHrz/lyd8rDKrqaVQXS0BH9AAhpBhqAO+d6Uvpje+Sh+G59rWy/ebP7t57Uj9a1Bq6NOdpQ+gCDxTQSMaGXdrdb8KScJ9hZiTwM9QMOAD0A4K2Tf2/j/QLLdBC23rmpR7Z28Dzngz/9jx4CnGXgEQByODr2+NDdR8QHVwaWD7YZXBTknX1UKEs/CEw3VE8GULoXe8Ijw2NT9E8DQyTGhpGZFHE4l/D54s6WLvUtbGH6slBKZnIY9Ramw4swjttrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJVwATUTzF3HSM90iMh75N2lNOeHUVyQO887vrqeExyRWITzDLsbFTi6ey7h?=
 =?us-ascii?Q?Vx5pXbsnDyZTYvDsZkBidovhktZc4/g9Y6zw9yqH/8SmFKOvcI9BHpDL8xzP?=
 =?us-ascii?Q?KJJ0xcjPAQ9iJwcSbMihWZwZtEny/x4/lOVKEAjdHLeauqyUMPUWKFOqR27P?=
 =?us-ascii?Q?l6NDLBcMYXN3F/UihQOlxfw4pTiBlYCbrrclr+mFIivRah8dXQEgqgSHZkmR?=
 =?us-ascii?Q?qqMxpAtKqJJ/AeBnotXtPA4SyIQnjjDXgYMv33YsD23XlYQSXDxuQy3TQ35E?=
 =?us-ascii?Q?L965+kkFqHkwtS2EIJkah51/A9qtP3x+kXQVZmD1DT4mtzyKwOtvjEdUIxwG?=
 =?us-ascii?Q?AjJ8UvEwFp7iaNI1P1yPUX3VOqyrKyn7hwDoOxyPCZB82nwxU7HpZIpwtcLh?=
 =?us-ascii?Q?ioWbPaSG2q6OI4ao3DUz0qZx/kSQjAZWYv3u3qunycdZdwi4VUwki80Wn5E5?=
 =?us-ascii?Q?qnqSadBhWLPHV3hiz5eHcB9Ar2hC+zkhtz2ZR5EWAychH5Eu2tNmsbe1fHk1?=
 =?us-ascii?Q?MQFkGXNWJECuIwRX+9Myx9DTS1YTU+XiTKavJIoM/KzMZ9kDNdwQ/4IylcBx?=
 =?us-ascii?Q?AndYY+jMuoC0Y/iWfJgvouT4K/x+1cHtSwouoOOnCuuDH3eK0PVRYLqQ2yVZ?=
 =?us-ascii?Q?bbFjsUWK4EZf97gFuPHFqzu4HeAffXd6KZPpI23bCPhxzT8FlTFsIZfQ13HV?=
 =?us-ascii?Q?V1jJ8eUdFepFIM04KDoCLfTlosKfqh9pu6j40CSu6GSIGSJdigf1QGaGjViu?=
 =?us-ascii?Q?nsnyndiHDNblTLdVlQ5OaYlAGT4+npq19Cl1LyDlJnuWHm9FfO4e5FXpNODp?=
 =?us-ascii?Q?Xzr6qlCl8RIePFahy1csEv/Q4mQXA+sdBvslZT+ZcV55qU1whTEwG4JqCYM+?=
 =?us-ascii?Q?kiJdsDOmj7FdxjYdzjyGbf6dCJveCFRWSo6rnbejDeP0EhSpE2FNav1lGmO0?=
 =?us-ascii?Q?Uwqkt1Up3XfQr05bAItyP+qdwD7fe9MMjjtALQ1oUScS2ld4vhnR2l++Gpoq?=
 =?us-ascii?Q?7Yj2O40qpO4lg+FKP5KkSnFZYBp/Dxs5GjDt8+JQKDnV6WPPPvWDg+FskQgP?=
 =?us-ascii?Q?AQ91pFKFgVvWQ5QT3vmFySxYLeGV66DYOt9VFVc/Xd20CTgkehYCnz/1mmXY?=
 =?us-ascii?Q?+6cBhnwdfsAoPUJ4qoy6rKMti4YswJNi3Czo9RKRNRiH2HH0A7gQmLDGPZNT?=
 =?us-ascii?Q?JuYsoHIYZc62Utj/CvVOqu0krkhLq72UwlWY7e/N8fp2cMKjO8pn2CLMbszy?=
 =?us-ascii?Q?k0xZbLCKV06ogflIptfHnh1b/v6uMCqp4Q5/2Ux2je+4gKm7vvsyxHo2Y/i4?=
 =?us-ascii?Q?DDeHyHmAqmi9xJAEbHS+b657sUBaUlZeRhDK7BqPZDuThYLx5TMp8RjPiINC?=
 =?us-ascii?Q?raM+LOGT71s7GxqeM1F+V5n/82d1NpYouE4hB1/cjzPdDQjvXvv7QyE1VAb3?=
 =?us-ascii?Q?oq0cvoETHnXqAnoU+nf7SUvUdYqOxfGQjoyTax5RlEQ6QQq5c6Gro5aFGwqK?=
 =?us-ascii?Q?b0hL3Z7aR/bs/Pvkbbuc7dWiuCfi+P5ZhQXO8vGunKLlBbDemN6A5ssRdRgF?=
 =?us-ascii?Q?jLqh3GnaeXk/aTmBc4W8wYWbht3BcZvt4Be8F7J93tWHvqCIbScidaD4Z3tM?=
 =?us-ascii?Q?DJy+oJq1maHv/im6u4Ec986walj//kzt+tBz6JWb9aISsoyquSkOk9vuV5DY?=
 =?us-ascii?Q?HDuaim64R3Uibq99oTUjd4hu6nPRrYz7JYM0631MEed8yAbbGo7qwDc16RZw?=
 =?us-ascii?Q?BlgT6PP5LCGG9bibLR0fKBhWFnfp7xEuHWyZ7wnBUzaLj81q1w05e4uMXwRD?=
X-MS-Exchange-AntiSpam-MessageData-1: 1BuTUeXLBhLdEJSi0X3+75aS2d84s+AObNs=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7936de1-b613-448e-c7f0-08de7d07e9ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:27.6100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9qQB3nZfGWrXrI1OOZtm6qPORtWbj3ziz+v55x3M/Ja52moR34EXjBeE11iQvtHVEPfs/UixR7wQT6c6j1Xfg==
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
X-Rspamd-Queue-Id: 02F61230A3E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The Cadence MHDP8546 DP bridge driver gets the PHY bus_width attribute
(holding number of lanes) directly, but doing this will no longer be
possible after the definition of struct phy is hidden from consumers.

Use the phy_get_bus_width() API function designed specifically for
consumers.

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
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ed7ed82ddb64..e3f8a281f147 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1304,7 +1304,7 @@ static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
 
 	/* Get source capabilities based on PHY attributes */
 
-	mhdp->host.lanes_cnt = mhdp->phy->attrs.bus_width;
+	mhdp->host.lanes_cnt = phy_get_bus_width(mhdp->phy);
 	if (!mhdp->host.lanes_cnt)
 		mhdp->host.lanes_cnt = 4;
 
-- 
2.43.0

