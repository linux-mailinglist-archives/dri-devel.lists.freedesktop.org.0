Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKdLKZaGrWkC4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB15230A3B
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9610910E45B;
	Sun,  8 Mar 2026 14:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NyFGcQ4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF2E10E123;
 Sun,  8 Mar 2026 11:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln1RtTgnFgr7p62uKD8BZFNCNZ3GmoMEdLfz+APqqhILd3pzocV9LoLeFWHFExtO4utJ6d4Ndq1SBrnRMOmLlIiQFeQRTXjbyBGHic7H00n3wp956nFoSUFw2vFAHqWfXyTiAet8pZvh+jFbsMq7mbJ3ishwZxyH5KCwpbgDVgN6/c6t053A41EJhZK9e40og+lZzWugwBoAgUeykqF39iLLL3CYMrIg8TGW+8y30mltItEdYYQZZ+6YOfo7PeNzEsmbKsq5ZMW660zDrbFcUykBf5vQswcT6fwTlJOjNMiqx6wcpnFMj/3xUogWGtfryVdtRQgIuduu5Abn9DwgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/Ti2+QwBe2fmaud8xz/MB4G9j3MznUS5K+16zIt7yg=;
 b=FAYEkfRE84Rl+xSgtuGS3vcrBGmX4X7uRD/uGE+eFrN20Cf7pW4pQysllg+8qi2U3zwTVamHI1uCph+D8TQsg9W8l+PV/KV5t2ZGMamfQQAT18hgiTQEd4WG1RZ8DMfOnvd5UPNH0Y/aAJCF36UfGWUBxeFnRZdMjaTJjPdmaOYj7di3V6JQmnsOea5dla7EexRloUxXp094pmNst3zwr29n7Z8G2DWtE3DTuV5Ehm7OOeBSaVFkeWcc5A04J5KwUlWmiIYSDO4kmgdisjBQUf/unNluSVoVNg62yGtW7lNiOoSMdNzKxtWfPDv10ItHV2UtCbjDu2bbJDYp8kYsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/Ti2+QwBe2fmaud8xz/MB4G9j3MznUS5K+16zIt7yg=;
 b=NyFGcQ4uQw1g9PUNNxu/EysT3WYJ9W+aCANyUqIxuuODvUcSxhD94tyrjxdFZKXjSzp4QctQQO0u77OIsvUmGas8U3kOwuMKrrDGrZ5t22YAMdw+7hMHg7wvsDiy6MfHgm+caW4Mty3+UBDNOtAIffmVHRyNNKrzSS7x+EU2TcyrcBzJelApH4gROcX9E0tDvrRW9Kz15eYMkrwojduhG2THX//9nvuuZS5WY8B32gUIRaM3DjSggwVzDO2ax6g5HzWekl9uFRqmMT2SZXktv58AgSsZcyGD7lcxMWRvz9EZAESEczuSI5tu4cDi9I1hH0SFIDVRDaY3LoRw5HFDmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:43 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:43 +0000
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
 Joe Perches <joe@perches.com>
Subject: [PATCH v2 phy-next 24/24] MAINTAINERS: add regexes for linux-phy
Date: Sun,  8 Mar 2026 13:40:09 +0200
Message-ID: <20260308114009.2546587-25-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0011.eurprd08.prod.outlook.com
 (2603:10a6:803:104::24) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 787d5382-d821-4474-a52b-08de7d07f33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: wWRPoB8UCCP6H+3GQPtKDoUOndXiTCXKMgWHtbI+iL8k+bPnBHNCmq58HAicfCbU0eMh+NSktWMozP5VbcrK+wFkQB2BnR+bV1IANcl5Xzx0NWY/lnTHlJ004E5UiEPrVb5lQii8qWq7JnCLYbXKXQ2UgVF4n549B7bEG/+0HJFK1BuNlDaSsKD+BdCx3WqvTmcG2uLXoP48eyuzHSIRQVfg8IlqQ626hFVTM6Aov3kmbOm2k0BNbLooTFV4mqDgrg5DwvgP7IO9n2EnSJnjuyrC9og60QSM3FAdXw7rLPe57o0EXyBLNZO6ywHZDjY1SzVIHnzAv7yfE8GkW0Z602TlZx30wCH99axS93XOzwuI5HX4IrsRdTw1WKL2EpaqIwFS/PgQt8jRDJmYI28pzpH9bDIXYmHubi0QBNbgGJ47IUgPyWEpXPP15Kr+JJtXa6hyugwTIyPlu/nZsr2wRysysEWGbnaxp2woHpsyEP8jdaHW34WV0blYvuXEdT4cwhE7DJz7e50d8t+QjtvQW9c4BZrtbiOoUgddLMA2acD/6rolob3Pg4v1/Ln4M5RPpEwGPt3G+U0AnRZ8Zji6+C99GyPAtill04j3Fc0Jcw37bvQO2apEdakEGhV+URNzwfrrS/PKORyEWoamIdhyq4qKLEmJxGSYMP9J4kX68BEwcRR1VElV6cjqw0ogvU3jryeyh/bD1ED+ax8VMSstUIVI/fw6NECWfpfuS8NqcVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGCBgEnSGhRJepUhVgQiz9TOvtr8qTqAeQWXFFLYAM9GEWpGkakgt1Gb4Yr0?=
 =?us-ascii?Q?38qX89xrpr8yIW28Z5KubRlpOrF9mzQ0Fsw9YC5tZEdtKX4Z6sD+2yc4A1dN?=
 =?us-ascii?Q?dl4O1N5fUqTBU/hfzZeiiMWPK0mLQGsoIGi6oS5vflghIMRLRoO+jQvkQuT/?=
 =?us-ascii?Q?NCkc+xnDwj+cgaDr/j5l6jPKmZ6UVZLFBmgMdbLsp/cWBssFy99ZlBpYAPTD?=
 =?us-ascii?Q?z6myfh95yvqAmLcZXGn6ox5/ICtJEffgpPciZ+nAdJO2GYC5Hq+YZwQ8dIEs?=
 =?us-ascii?Q?WCzwcVlz2fyFLkxhCSUwKgHLauoVUadL8XHaVa/F1ld/1IW6bDtOYO7Rfa3w?=
 =?us-ascii?Q?3aSJ53sBWnb3Vm5BIh6Y5HweeqQsddFLB5HZ0WYgZA3PYxQ7fyy22cPAoixe?=
 =?us-ascii?Q?8kGCsrZyZovBNFL9eMTSTW4+T3CoyFhCp+77vKxbZNdirraSteL+i2Nc1sGy?=
 =?us-ascii?Q?O3BwGEML4UTq/co7Uy6lRBnv02ZLGKy7y4warjLa5dQmrmIx0HT2wwksQ9yU?=
 =?us-ascii?Q?4YirolGItHacBIrEwz131JruDpnUH9ma0rwmkbwyuDt8DnBVbg5GDNJNAQIu?=
 =?us-ascii?Q?6bnJouSlz0BrsFSILLp+9icDZJQyOHl+NqXZ7456Hh3IcyTwSrZCDrB3OxUQ?=
 =?us-ascii?Q?amVqneR8nNyz9KCwhKFIAX42FDNt8rzmvSbHXbipNULeyaxkP4cEsKmXkSv3?=
 =?us-ascii?Q?ulaWkiaQKXhb41CVUnNBmnHtVBsl2oLqac0lBIjYyvUemw3P9XNbpOvcK21+?=
 =?us-ascii?Q?PZJCWRH8SIGb1sRanm7bcXG77dMWgFZV/Ds/J7l1VMc6QjyPMhWLTLSum/n+?=
 =?us-ascii?Q?JsjiRSsjvmBnfAnBPyM6yb3DUQQY7vVias1BDSSa0iQ1/IA7pS3FyY4DK1CT?=
 =?us-ascii?Q?s555zOM5BzjxqHOz+CzekQGCoGfAlXkHZ1WuCX0KrAOPdsIb1/fqO81h2H9V?=
 =?us-ascii?Q?SLgLjBvGDYS5dbyexAYAAz0b6hOXRsU7dgNvhfxOKloDO4btKQ2XBhx2Ejc/?=
 =?us-ascii?Q?X9BBpAjoIA3a341FBQYuACYj7E3UMK+ChJnNso0m0PmIJgGC4Xqlqv8jcOkR?=
 =?us-ascii?Q?Xeuivtp2GvwNgMauWp8dYvKgiRjZkJlPBeskfiR9mTL5Lt0WKVpMyxObluKb?=
 =?us-ascii?Q?qsAGJI8WEaljfDdEim1bfo7xfHy64wULFAQykD9wpPQDneuMXjT4jtd6LcRC?=
 =?us-ascii?Q?Zua9Lol4D9XZ7g1pgSeC4TU7FtCWbQHZgFeUeevOM+OJZXqLnJhQlTM5PC3d?=
 =?us-ascii?Q?APmV5umMDvAlA+nsvaAEOaYdITjYLlXrctb87/HMzL1u9+687ikvsqVSr3aa?=
 =?us-ascii?Q?UfpYJ+gb2nhXW41yVEUp8Q+LJ2p1jhI78nBjdIcUpzpgzeOO9D1qu7iSco5Q?=
 =?us-ascii?Q?HNMHCZv7ZQyjuU7vsL3p8Jkp4JHWkp9IzTUKeYFZzBFZa55jZ3PV2woaSOeg?=
 =?us-ascii?Q?KSrzV+yYyLLp/OasZdf9z24gdDMw0tUDN8eo6tIvN6A1kR4TlFvISDeU7oM+?=
 =?us-ascii?Q?FJUS0x7biM30d8V/CuOa7eusqMGwCbnJ3bRAthWCbNm2bAm4si2vnw9vkIJ4?=
 =?us-ascii?Q?kMoxcKT2Nkn/q9GKryhdOkIafwRucO8UgKrxE9edwBxQrjZnbPGC1gJcU+Ne?=
 =?us-ascii?Q?OZSfTCSuGuyt55pS8EBpv3hiurEFAIOuoCYgnoDRU/Pb4IcKyDiKscHjltmm?=
 =?us-ascii?Q?aMoE0UxN34VyLifXY4My5b78ZWBm+AR2ix7uFwGqyX/df/e+4DT7bAjdvnkQ?=
 =?us-ascii?Q?QdWG61JABgD0iaOlnSGzRIdgtWehoM6RzGOdGY85/yQ49KAbamkj5f1SJEt5?=
X-MS-Exchange-AntiSpam-MessageData-1: TxHo5y8KXSEMpdaVt2h3vaAh86iJbxUcynQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787d5382-d821-4474-a52b-08de7d07f33c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:43.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhsX1f+Wa69RPJnBNoWmgWaisdU5omCl9xDa6uKC+QZTlDGGi7OZjQvKvoK6gpjpmI6fbgnBrQ21XNLdwNO9LQ==
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
X-Rspamd-Queue-Id: EFB15230A3B
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
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perches.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,sang-engineering.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Some pragmatic shortcuts are being taken by PHY consumer driver authors,
which put a burden on the framework. A lot of these can be caught during
review.

Make sure the linux-phy list is copied on as many keywords that regexes
can reasonably catch.

Some considerations that led to this solution and not a simpler one:
- Consumers may be located anywhere, and their file naming provides no
  indication whatsoever that they are PHY API consumers.
- The network PHY API has similarly sounding API: phy_start(),
  phy_connect(), etc. Similarly, matching on "phy" would hit
  phys_addr_t, "cryptography", etc.
- The header files themselves need attention to avoid matching on
  include/linux/phy.h (network PHY), include/linux/usb/phy.h,
  drivers/net/vendor/device/phy.h, etc.
- At least for a transitional period, I suppose developers will still
  try to add PHY providers outside the subsystem (which is discouraged).

So I used \b to try to match on actual word boundaries and I went for
listing all markers of PHY API use as they may appear in patch contexts.

Bit rot is a valid concern. I will add a test to the build automation
that newly introduced struct and function names in include/linux/phy.h,
include/linux/phy-props.h and drivers/phy/phy-provider.h are matched by
the MAINTAINERS entry K: patterns.

The keyword patterns were written with great help from Joe Perches
<joe@perches.com>.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Joe Perches <joe@perches.com>

v1->v2:
- split into multiple regex patterns
- use matching-only (insted of capturing) regex patterns
- adjust commit message to reflect the Q&A from v1
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..29a1c2474bf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10713,6 +10713,17 @@ F:	Documentation/devicetree/bindings/phy/
 F:	drivers/phy/
 F:	include/dt-bindings/phy/
 F:	include/linux/phy/
+K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
+K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
+K:	\bphy_(?:create|remove)_lookup\b
+K:	\bphy_(?:get|set)_drvdata\b
+K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
+K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
+K:	\bphy_(?:init|exit|power_(?:on|off))\b
+K:	\bphy_(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
+K:	\bphy_(?:reset|configure|validate|calibrate)\b
+K:	\bphy_notify_(?:connect|disconnect|state)\b
+K:	\bstruct\s+phy(?:_ops|_attrs|_lookup|_provider)?\b
 
 GENERIC PINCTRL I2C DEMULTIPLEXER DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
-- 
2.43.0

