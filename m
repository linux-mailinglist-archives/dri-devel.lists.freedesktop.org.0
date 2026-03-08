Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MDUJZiGrWkE4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD614230A7F
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9B210E459;
	Sun,  8 Mar 2026 14:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AcTgOac1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5E610E11F;
 Sun,  8 Mar 2026 11:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx/dz3k1q6rnc0ff5Yahmn3sqYDYNYzLyCr3yE94II6TB4YDk7EL8XeBs/B5oaogGUrvluLTvsPpLdigTPGfjQ5gEdZVZ42TsgmOdkdq6lZFUpLwhX6m1E6Uawze8924eHfjzDFwlDwLHnlLZdB53G/jKJO+GMPLEwR8zZvHT43x5c98z81L2OfL+5WSgWghNjXiyrLh3m8JEVtkrE3cX34DQ65KOf31m/2ZiS+gEYrnAtQxmCtF1XK7nNu7x7udbrRn4I8HjYCz3Eai4J5bMc05aQACjmVyntVITD2o8yLQcuAq3EDCbkgZMl2kJVKabbHi3hO3HF0cL1zcJnCqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pwr06AyEtUM7cCqh0M2chDD9CssahoHe5YC0w4U6V8=;
 b=HZnbjjK75LMw2+cIKoVKeiyoMxPRfTV4EPA4RlRSfAsXMgqeEoLpnbDg2QQZbMfTsLgQJOTyDLEBOtZ+JfdGHnmd0QmFhX9dr5fdHlOdotTJIkrS+wE30gHz1Rf22PdyqJ4M4cD8AX/EELXTirDAsMor7UO7O26aP3Id8TKoHF++5FICOFO14DCHdnRMm5lyj4WU2HZuyUOnRCfXIK9Sxy4POar4hxLaqn4mZgl1xKmKqaGWtFE1qSQgomoW34utGdyS058Yp3vM3l3UNKhwhw4y9nTzUdyQzrNCjjBv/WHEVsC8QijFHvRDui+AoYLeGrg7KC+Y29EXqtJ4CocFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pwr06AyEtUM7cCqh0M2chDD9CssahoHe5YC0w4U6V8=;
 b=AcTgOac1Vu8p03LYw2Vqn3OlYUgJVTHvcVxNlGUp+DMsRgSlrsvL9AwrGsdcyxbepvg3Vn5D1xo0Bq2JSjeNMasWGJKBQW3lACrCsnr5wyOTy9MAh4EHH9Du+ZSMTJDrKKmmTdsL1z5AIrzOW89+rlQTwdmIejmcvZm/XI6UG3Cj8tu7amOfXNAYARPUiJr1/qR/vVOxNeJQFp3ZafoVckFhEy011T3y4b4pjRQCDM38MpccqOrhHnv4gx8Z63BQqkWNg7lU2ant9s1EVNgLNP48TUuOuZnQxDISGnmiO+7UdIa2l0+RP+n1kOTLj9kiUmN0NB/BNAUARHSNXIBH+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:23 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:23 +0000
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
 Simona Vetter <simona@ffwll.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 phy-next 14/24] phy: introduce phy_get_max_link_rate()
 helper for consumers
Date: Sun,  8 Mar 2026 13:39:59 +0200
Message-ID: <20260308114009.2546587-15-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P194CA0053.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::42) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c0f604-5e58-46b1-20ec-08de7d07e769
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: STQTY3KSzPWcTOS5aASazLNDWAvOptTqnk0DJOhPT1TNDZNNBrwaQcMpcqj3ADnFYRz6zqNm6prEwd6piXml1UTbh2Cfx5+VrZ07t1a8MrrSACfiNRtHgoAKSk4M1DCH0BpyC6H+FdSdMhKIh3z3zZWhVv0mTWanQ+jF2zacVAClP+Hp008ONyV4b0CqUJbswMRm5+RUI3bwb93ynbIyXm1yMHx9OVgU/BKS7GxNouJLBbex/wekLLr6FxMscV+Xfbiyf+bQtIIkMqdK9H72iqJWm6TGr+q/l/sFT5o/fhA9hdPKWKDQV26iVJB0Vor4SzYtRi+ZIEm9SaJvl+oevqx/RcUnOizmR4qoSIX/dBrjkM+x/MtWFcP21UXum/bvkMIE2+54F5SpEdxxHI9hBLdNkpK4HTjoVyb3FJMln6/cXWdyrNcsRi5hY9GjmPEVqzJcNQvb4u/bSrsvUTgC46iQoojznPj8yDwJ6i17f1AGxjraxvMrKlT1Dw60I8lp2Qfh6SnGdHG79nqsGMTRhT2a3O8u0Bt4ggi8qda+yt6P0S9UbXqOSdYpRKNkt/fMNm2PSdtoXyTW2pnWb8dJ9qHSunUX+vcJnps7HG7sN3q1MkWBxgnGUQRpMY8J5Zicnw7mi1er6Q43x9sCwGqhyHH3Q+Ncu0LeO4UN6zJJKQ8+kFy27luuXl5p2wDV1sovUXf4b9OE43zK2PhfbtxrUbU08MObs3v5VGdwM6jiCOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JgAVgV6e1QYoTPKp+tlxRr02ehlNfyCt33Srd1SmNbM3E4vo8jBy2qUFEywu?=
 =?us-ascii?Q?RlHl6uxi5zFerbfG1cfBkFJyK1fV8xsGTfT+wDoV48eIOzkqc1ORVGhOii2V?=
 =?us-ascii?Q?sigr11wLEAg+2zmtq0a9uuFM5qgrnz+7Q7KnT6rt0KInUyk/ErLkP4+fl7/s?=
 =?us-ascii?Q?U39GG8cUFKYkJgulPYiBls5BA7k5oJ40GBY+X3CaV2GeYxH+dp+9CT7XgN9w?=
 =?us-ascii?Q?XaXIwEuRCxQmpiF5amJGIOer4jbL7eU4i7Q00vWT5tb7Xx5wFfbOm3XwWFR3?=
 =?us-ascii?Q?XLaR66k3tYyqqTTMWla0CMI82iT67ilzOAhgqu2eLT53p8q2LCTEzXsx/jzx?=
 =?us-ascii?Q?857p/t4prkuOICqNKlDC3fV93MpVrqwSs2SZ9O7fOc2DoPPszunidiNUrDSD?=
 =?us-ascii?Q?D5zgE8XwANBG/zoTqoAMaNc4rvQTtPsshj049Hf2qE9p/Uxhi5++Vs4iNOKT?=
 =?us-ascii?Q?04bhdrwfWHaSpxBRIR0YdChacWeeIauWxd+eAw/Vk/HE8OR598yrTWAuLpMy?=
 =?us-ascii?Q?iIZngLmECU59qv6MMJ7RHunFWenCkWc8pReX8qKtGdir6DTiKBQWi5vUPlKV?=
 =?us-ascii?Q?wcqLcJyovDX34auZ+fwhJbYptl2uvTlpEjjOSdckYYh4Q8cNHNkRbA09d9J7?=
 =?us-ascii?Q?T7PNb5lqRs1BQaOcNXsn0Gb0RGdNrU9jBcEwIe1bGuBklRkqG3jBRSX5geS7?=
 =?us-ascii?Q?oVm+SbrUWg42mOETP1kyXY9EwK07pilhw1OWt0/R5A6R6VlFuN7XQS0f1hew?=
 =?us-ascii?Q?BR3iaV4AiRgaSCTUNaJ22lbhz1jACcg4n/iVFkUyFXhJ0NZOi3Mv+hAyMBa9?=
 =?us-ascii?Q?oEb0G60hV0n/LZ8w4HfJcpaKUwursUA/LFvc8isia5xcmayrVEQpWA6bqU+X?=
 =?us-ascii?Q?2XaNOFOfkaQn4o7sFoBdsr4dx7BetbIO9Y/WyC5gYylv4B4q/8vO/LW8lWOh?=
 =?us-ascii?Q?6H6gR4ZstBnGjRjVvK15Y0M2Jj5UiRWs7aqWVpk3pKtuehg8bxcLcAyQJWnY?=
 =?us-ascii?Q?xdMgrU53ETE+chZLsOzoLpYF3pWvDtrGMOiMcxbXK4BCbhbsXyFSIuyU/kjm?=
 =?us-ascii?Q?fPARQU/EfqNXpgJAn6RLz9XwWBOb60MB0ExGIjAfBEYD8jIK11TKL0b7WP0+?=
 =?us-ascii?Q?k4pyVLkCHDhO/gH5YDHJxvReWhQCkzQDgQxnex4lOW9RP9QoIsNABKgECaFp?=
 =?us-ascii?Q?yyLY0DeYU7Wrs7m5SawKJFC6D+lgTQ39zyoxKrRnDotNrv2CqJMil8bDOUL2?=
 =?us-ascii?Q?HIrfDAJKiPhOJu6OEq1ycgT0O2GB6T7rKBwnj8ZqC13xxmjY6vCUzq9KPcA/?=
 =?us-ascii?Q?eV50rIzK5YLnBfvTpFjzx/qE5RW/WL8Lg0u4HawCIPTMX1cXUKFcPrRMFikj?=
 =?us-ascii?Q?AmbcCuvK3uGC0E2Ik26FkVZw47l/rAQEYSzZuy3Du/7wWFBJMPeLzrviA6is?=
 =?us-ascii?Q?19ADIq52CntKEKaAc0kkjaZmwA+HfNud0TFEBruxzRZLqnLk2hoHE64Vk4mE?=
 =?us-ascii?Q?w90FkKzXTJnY3dZfLC0d/64KGpLKX5OJCgcRXFjgArcIoHgxrOtevNKYqMHy?=
 =?us-ascii?Q?dL+OM9sxx+mApxXkrOFvjFr6SuYJnQ4IzhJ1Ow9Ll+uJJ5lN+75Emkrb/2aU?=
 =?us-ascii?Q?E/yjsRsZN+oZWlq8ngTvmogDfoJEIWnCjZuTvsK3M9p8IPBitdIBwkwWptwx?=
 =?us-ascii?Q?MTr6v4qT3F7reVJyGe5r+gMVgk0Q+b8Hbe5l1YrDYYYS1UMNJ2tkPi6YNHIA?=
 =?us-ascii?Q?DTchvI50JKeV6MzjPgWVeqCso8XKgM3hggfCO8ChZHYt65siJQOyJMa2ANCH?=
X-MS-Exchange-AntiSpam-MessageData-1: TF5kUqVo+nQWTRhtT/yXpsb+raeOSj7bzk8=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c0f604-5e58-46b1-20ec-08de7d07e769
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:23.5803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8FbkHl8Csfr5/U9jvf+Ur4VmUDV+HIBgfPGou3J2Fqga31monmQFzXISw3YqWcxFMLZ7mANZX4Z5PT1Zbau5w==
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
X-Rspamd-Queue-Id: DD614230A7F
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
	RCPT_COUNT_TWELVE(0.00)[42];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com,glider.be];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Consumer drivers shouldn't dereference struct phy, not even to get to
its attributes.

We have phy_get_bus_width() as a precedent for getting the bus_width
attribute, so let's add phy_get_max_link_rate() and use it in DRM and
CAN drivers.

In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
and NULL is given by the API as a non-error case, so the PHY API should
also tolerate NULL coming back to it. This means we can further simplify
the call sites that test for the NULL quality of the transceiver.

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
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>

v1->v2: make phy_get_bus_width() NULL-tolerant to simplify CAN callers
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-dp.c             | 2 +-
 drivers/net/can/at91_can.c                          | 3 +--
 drivers/net/can/flexcan/flexcan-core.c              | 3 +--
 drivers/net/can/m_can/m_can_platform.c              | 3 +--
 drivers/net/can/rcar/rcar_canfd.c                   | 3 +--
 drivers/phy/phy-core.c                              | 9 +++++++++
 include/linux/phy/phy.h                             | 6 ++++++
 8 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index a8b6ae58cb0a..ed7ed82ddb64 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1300,7 +1300,7 @@ static u32 cdns_mhdp_get_training_interval_us(struct cdns_mhdp_device *mhdp,
 
 static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
 {
-	unsigned int link_rate;
+	u32 link_rate;
 
 	/* Get source capabilities based on PHY attributes */
 
@@ -1308,7 +1308,7 @@ static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
 	if (!mhdp->host.lanes_cnt)
 		mhdp->host.lanes_cnt = 4;
 
-	link_rate = mhdp->phy->attrs.max_link_rate;
+	link_rate = phy_get_max_link_rate(mhdp->phy);
 	if (!link_rate)
 		link_rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
 	else
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 4ab6922dd79c..79c72ee8e263 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -536,7 +536,7 @@ static int dw_dp_link_parse(struct dw_dp *dp, struct drm_connector *connector)
 
 	link->revision = link->dpcd[DP_DPCD_REV];
 	link->rate = min_t(u32, min(dp->plat_data.max_link_rate,
-				    dp->phy->attrs.max_link_rate * 100),
+				    phy_get_max_link_rate(dp->phy) * 100),
 			   drm_dp_max_link_rate(link->dpcd));
 	link->lanes = min_t(u8, phy_get_bus_width(dp->phy),
 			    drm_dp_max_lane_count(link->dpcd));
diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
index 58da323f14d7..7749da0a58f6 100644
--- a/drivers/net/can/at91_can.c
+++ b/drivers/net/can/at91_can.c
@@ -1125,8 +1125,7 @@ static int at91_can_probe(struct platform_device *pdev)
 
 	can_rx_offload_add_timestamp(dev, &priv->offload);
 
-	if (transceiver)
-		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
+	priv->can.bitrate_max = phy_get_max_link_rate(transceiver);
 
 	if (at91_is_sam9263(priv))
 		dev->sysfs_groups[0] = &at91_sysfs_attr_group;
diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
index f5d22c61503f..093e48b8da58 100644
--- a/drivers/net/can/flexcan/flexcan-core.c
+++ b/drivers/net/can/flexcan/flexcan-core.c
@@ -2210,8 +2210,7 @@ static int flexcan_probe(struct platform_device *pdev)
 	priv->reg_xceiver = reg_xceiver;
 	priv->transceiver = transceiver;
 
-	if (transceiver)
-		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
+	priv->can.bitrate_max = phy_get_max_link_rate(transceiver);
 
 	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
 		priv->irq_boff = platform_get_irq(pdev, 1);
diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_can/m_can_platform.c
index 56da411878af..2a0f163a683a 100644
--- a/drivers/net/can/m_can/m_can_platform.c
+++ b/drivers/net/can/m_can/m_can_platform.c
@@ -131,8 +131,7 @@ static int m_can_plat_probe(struct platform_device *pdev)
 		goto probe_fail;
 	}
 
-	if (transceiver)
-		mcan_class->can.bitrate_max = transceiver->attrs.max_link_rate;
+	mcan_class->can.bitrate_max = phy_get_max_link_rate(transceiver);
 
 	priv->base = addr;
 	priv->mram_base = mram_addr;
diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index eaf8cac78038..9062db48d477 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1884,8 +1884,7 @@ static int rcar_canfd_channel_probe(struct rcar_canfd_global *gpriv, u32 ch,
 	priv->transceiver = transceiver;
 	priv->channel = ch;
 	priv->gpriv = gpriv;
-	if (transceiver)
-		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
+	priv->can.bitrate_max = phy_get_max_link_rate(transceiver);
 	priv->can.clock.freq = fcan_freq;
 	dev_info(dev, "can_clk rate is %u\n", priv->can.clock.freq);
 
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 0d0be494cfd7..737a760d97d1 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -647,6 +647,15 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
 }
 EXPORT_SYMBOL_GPL(phy_set_bus_width);
 
+u32 phy_get_max_link_rate(struct phy *phy)
+{
+	if (!phy)
+		return 0;
+
+	return phy->attrs.max_link_rate;
+}
+EXPORT_SYMBOL_GPL(phy_get_max_link_rate);
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index a7e2432ca1ae..34b656084caf 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
 int phy_notify_state(struct phy *phy, union phy_notify state);
 int phy_get_bus_width(struct phy *phy);
 void phy_set_bus_width(struct phy *phy, int bus_width);
+u32 phy_get_max_link_rate(struct phy *phy);
 #else
 static inline struct phy *phy_get(struct device *dev, const char *string)
 {
@@ -256,6 +257,11 @@ static inline int phy_get_bus_width(struct phy *phy)
 static inline void phy_set_bus_width(struct phy *phy, int bus_width)
 {
 }
+
+static inline u32 phy_get_max_link_rate(struct phy *phy)
+{
+	return 0;
+}
 #endif /* IS_ENABLED(CONFIG_GENERIC_PHY) */
 
 #endif /* __PHY_CONSUMER_H */
-- 
2.43.0

