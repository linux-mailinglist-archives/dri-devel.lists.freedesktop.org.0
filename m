Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA13CO85qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7238F20D29E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625910EB5A;
	Thu,  5 Mar 2026 08:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J5TmnhHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A022A10EA87;
 Wed,  4 Mar 2026 18:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugcgLS2a5WaAUjmbni2laYr8FU3EkZHv/AArR3CypP4tB+4HtUdOFgNzj7yX35Ets9HIocu83/wvPEPvw3bIlMK4pQ5s1lupXtGw3VVt1ex3nOwiUFKBsO2gREUXHyJoPLDwAnOJV52qQ7N/jFI9KE1xB6j9JkjYWwY4e+NkpPP4tg8u75p3RmYVmGy9YisBVmSUyVTUYI9q4obvjjIZpk2bTMgEgCyDAPuG04u/EqQM5btvE1zNZkkfx85DSulQMo/cNUK3rT2V1so/lIx559Gp1MT4WoXGBhbcIWl40koopbIldlgbXxLiAKF8nOJ2MLeIngUMAke0G16IkNzbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1E4JGqsAJxUOha5bRHq/d8cRujxwXZpuYkmtYCAdQk=;
 b=V/iGyIBkVdE3bG7YGbWs6GIOSbioyacKu+ZL1iL0k0xc3G2X/Untu4ZpxY9u+AB9dVAR1q8DZATpbYpmsZZdEE2UhkRHDVuxtRw4qzkPZE2m43D4C122fndMR+1GUDHEJ5bSEIfaDtIc8Un0wZcqSXHUydLpUptYok+T6sSnGlMqmJ/nz1M8338V311eXI2muKbkNmZ7cZzbXtYzqsc/XMrXFrL2+gtrDODChLsScJWuKMjgYuGWu8d5h2kLUN1/5vHRnfyCoqbBT/dGnqWJWLqSVtaF1cfFI11c0imBCs6uBhVN1L3RD50g0verIMKX7O5hhRqEC2OnUXtR2rOfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1E4JGqsAJxUOha5bRHq/d8cRujxwXZpuYkmtYCAdQk=;
 b=J5TmnhHolnFkzgeha9AEqC8IhYcj+NkJbNz29NEkm58CeMTYVc6wR2dt7whBSlexk585eI6LmikUVCbvPo/eU4KtW+ZPpJKIVf+JJI6g4icCBtqgBtMIFN7oylNg4Vvinx+OMtXRB42PxJGvxLUNa/BbVrOs4tu11V7B53yuDmvgoPpxzlE63XC05Pii/egLkM9wNgjxicGrzSTX9uVgVirKuyZl+/htlbXbBkVY9DJ6jl5oS31TfvGsMDG7bUHI8JDN5egGP5CmIaAlBZQavDn3vXAkz6zuJ+7s8Sly0ui56diixeF88xOnhC7UBitz0XJDXTAhkg9N6UylopU3sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:23 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:23 +0000
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
 Simona Vetter <simona@ffwll.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate() helper
 for consumers
Date: Wed,  4 Mar 2026 19:57:26 +0200
Message-ID: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fb355c-2427-4906-d395-08de7a17e79b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: yUFkN3DbabfO7DfDyDtvyYyc4t+ypjKTZcg3umzyryQk3aTZbNcdpwD4qghyD1vfOQuAcllUiCBxfwlLfQMO2ffN/uexzDKr2jWEScPesOmlyzRA/PEWPRQgm6qOqULiFuZdNV2zMpb9ynglzBSY2jwhbkLPYIE/psERx+/qp4xlEbiyaf7ovXskJbmdJf02D5BHE3FasBxZyttyslLDQbGKEwIAUvNDvEpLwp9E1jAfCcD1BS6Noq4YhAo4RpX9IA8qk/nr6bGntbU5TqJvInYgAfP9hMQyQHx8DT3JzqMyuiWt8c3m7auRFfAzO6/Q/5u8TmimAc+Vn1KtmWsWONbJ38qMStnTD84mWkFVa0wAtPjOBku+qWNXLsrzp8Rf3Mv+/lvwmdKPgjRPE/Jz/dC0nmjjkQRJPFAIBK9UvwYfh8QMlcDo/bjCWuT0Hnv2fCzityGQLGog23dAxJki78UptCW3wwrcbEydq2j7b9BPnwmpeUPCn/C+fw1z8W0sG6b9jYYmksJVm9woA57QM2sah3JZQlQ0uLL7r43YdWlco2sL3iLQzoggK8XKD8ZhHMqjje/obDzmh9huOXFOSbxu4vt6eGsqoFeWE9a1EqtHu9t4JqEkvNQZYwWHblpT96CAGTFz+0xxCc71Xzth0vcI5b+WahBRUi6wH/vMcNawEBy1IDO9rhZYzVr2+/Gqlrnl25wgiKkam1hi2VZkTOj8Oh6XRlZYlUlhxr5Ld1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LWaQ0KD4T3JdwAmHr5Z2s1Jp79hmcYfp65+Y8Y2DA2XBhpf98DD/n9sAMvhf?=
 =?us-ascii?Q?OldHSdW92MDwyBLBkfC12cabyZIaK/3TepbHACCP4mR/9hBT4ZPgQRIHvpxM?=
 =?us-ascii?Q?kZrW6s366BWgIaMoGL+womj1qwVor+CXEYw2KNgCYQ+NK/hW2ovFCIWUqQV6?=
 =?us-ascii?Q?6wmgRaElQQhItO6cVWMRlS7hiQeF0QotwGbRZP7INneT1X6RThA5ORORhFeH?=
 =?us-ascii?Q?AWI0OyOvuJ9q7asizwCJ+bC2SbhQ0chzl8BGjXYsSyR/dB1Tke3SuJweAFDL?=
 =?us-ascii?Q?eTmx8EdEHykeDAC6YwLHKFWlcXfLESFYciWekbqw7iqVV2jJIZhrMy37Kgm2?=
 =?us-ascii?Q?xif84v7qMGG3HpxZ5/RgDqQnvT7RweIcYYjuEygF9JjEhYt4vq/eeWIg/XDX?=
 =?us-ascii?Q?0Hsf1HPB5EDXcZKn7SRHdJXLqnTelTDotNn/woo/hUZYuaEH1WOUJk0NNIIt?=
 =?us-ascii?Q?rX9MOV4QJChZ5z2NDi7YhNu4sqMJ8/WHzCVe6zZ/i06xA54K2LV7bJjn708h?=
 =?us-ascii?Q?7nKZWCJZ1n5jZDBHncxxXKS/EeRdSGBFAxLyqDxI30tY/+jRiaY0Y1rZ63FA?=
 =?us-ascii?Q?iaIW85SPOJlVObM/DzOjDrl/Dwk5693BPoQ3/yan2iE9y5cm/UyzRRCKhGOU?=
 =?us-ascii?Q?zJqw1XbPREKil9uj1xk5cJmy6FcgMdJD8ZeNMRxQjMVsVAj6WxfRegMc7osd?=
 =?us-ascii?Q?QyqTrsC0Kt1ldsAxz/LbiCEjNtHbvAPs2CyfIsbXmE1nhAfLJZmroyqSZzgE?=
 =?us-ascii?Q?nBR3DkoUx6GyYkRXjWWEAJOXhyNcaeWzaGi38Wa7hvytQC3XXZo1G+DZFmzc?=
 =?us-ascii?Q?Q9WIoOgIbVl044n6xpJhR6SoaN+faKmiiirfSHfcxqYELT5dUS6zg7xI61qT?=
 =?us-ascii?Q?XnLgfIVfjR94ZufQ2ywoPLeu3NJqN0KfSKFrk9WyPOE4hcvNdW1kjLLRxFMa?=
 =?us-ascii?Q?HkHYhoCN5Px+moSZa8GrkLi9W7arqYQT2cbfxjbYbL++E7LZQUasxnhthzR1?=
 =?us-ascii?Q?QZcK5jg0bui4VWo/rTI6sc2f7IQbADtbLKfp75LJa+NNeTXTn6w7oGPFuuoP?=
 =?us-ascii?Q?eyA5lkFYmf9gjtpAjLX788klZ0OH9NEP8zQ2BuUFg6N5zyEhFg6AgQjM50KC?=
 =?us-ascii?Q?tr/v6QRFe+QXMxdNHdE0uaGFaymHo99G4K10zrynLa4EJ2iLfNNgO9D8yXur?=
 =?us-ascii?Q?+QM1CE5aPM+S+1fMqo0L+b/6FGC9HvnSL6YlN3UlPt8SPjjBqWvri6pzZWhp?=
 =?us-ascii?Q?l98c/TtgtBAyrwdCnPZVtriTmrhZMDf7L9G7qavreXuMVudmCfsk6cf1b4tW?=
 =?us-ascii?Q?eGrUuXuF3Ow7elhWf3kQS9uKfbyR+kx2WBeZm2Y/oHXNkojvsF8Iy7I1THcv?=
 =?us-ascii?Q?hM2OGddufjzT9TK1xuzwDreCdPpeCndzgx8pDmxdo6MRPrlhDDc9bwZuyp97?=
 =?us-ascii?Q?qE1gBZspL5NL9fw/Pr5D1zhdWkbuBYawSrNQcKMez6KaaghxZeWKLMv6zusz?=
 =?us-ascii?Q?oN1uXrMyyov6IpehAg+bp81hTXsPpYa1wmQ4yH+OzmRvSxaPXuxJw0ewXJCm?=
 =?us-ascii?Q?ieLAK1swXi8Y1Y/Lqr28HWqjWz1pl2QB7wqQ09O4r2GFkV1m1YH0Q//E10Iu?=
 =?us-ascii?Q?vUjeNb7WdLb/LVvK2StqK0ulq0cnuiHXFvXDjHqkXZtpU6mAoEOMkwL+0eMy?=
 =?us-ascii?Q?CNiUydMy+WsdTzyCkomVUSPBLoPik4+D/OsO62wudPkCve0S5ig7MXCV3DEy?=
 =?us-ascii?Q?0Qs42XbZ2+VoGyNWtNmBmPwhSeI2C45p1zXRoDnWB+Zg9P58Ysv3gXLDf3rU?=
X-MS-Exchange-AntiSpam-MessageData-1: 365qEXgax/4Uqv+xfbeU30yW2AQXiNTJozQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fb355c-2427-4906-d395-08de7a17e79b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:23.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7K/7a4WazCXcuGN+B8MbT9w+GtaFK4B1ILyzO4Io2rmPwU/Rs3zFuPsfIbKYW7bU5IiLERHVpA1L+Mz7Vp1aIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
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
X-Rspamd-Queue-Id: 7238F20D29E
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
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Consumer drivers shouldn't dereference struct phy, not even to get to
its attributes.

We have phy_get_bus_width() as a precedent for getting the bus_width
attribute, so let's add phy_get_max_link_rate() and use it in DRM and
CAN drivers.

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
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-dp.c             | 2 +-
 drivers/net/can/at91_can.c                          | 2 +-
 drivers/net/can/flexcan/flexcan-core.c              | 2 +-
 drivers/net/can/m_can/m_can_platform.c              | 2 +-
 drivers/net/can/rcar/rcar_canfd.c                   | 2 +-
 drivers/phy/phy-core.c                              | 6 ++++++
 include/linux/phy/phy.h                             | 6 ++++++
 8 files changed, 19 insertions(+), 7 deletions(-)

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
index 58da323f14d7..b56db253f02d 100644
--- a/drivers/net/can/at91_can.c
+++ b/drivers/net/can/at91_can.c
@@ -1126,7 +1126,7 @@ static int at91_can_probe(struct platform_device *pdev)
 	can_rx_offload_add_timestamp(dev, &priv->offload);
 
 	if (transceiver)
-		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
+		priv->can.bitrate_max = phy_get_max_link_rate(transceiver);
 
 	if (at91_is_sam9263(priv))
 		dev->sysfs_groups[0] = &at91_sysfs_attr_group;
diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
index f5d22c61503f..3a4307bc1d61 100644
--- a/drivers/net/can/flexcan/flexcan-core.c
+++ b/drivers/net/can/flexcan/flexcan-core.c
@@ -2211,7 +2211,7 @@ static int flexcan_probe(struct platform_device *pdev)
 	priv->transceiver = transceiver;
 
 	if (transceiver)
-		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
+		priv->can.bitrate_max = phy_get_max_link_rate(transceiver);
 
 	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
 		priv->irq_boff = platform_get_irq(pdev, 1);
diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_can/m_can_platform.c
index 56da411878af..73525be6566b 100644
--- a/drivers/net/can/m_can/m_can_platform.c
+++ b/drivers/net/can/m_can/m_can_platform.c
@@ -132,7 +132,7 @@ static int m_can_plat_probe(struct platform_device *pdev)
 	}
 
 	if (transceiver)
-		mcan_class->can.bitrate_max = transceiver->attrs.max_link_rate;
+		mcan_class->can.bitrate_max = phy_get_max_link_rate(transceiver);
 
 	priv->base = addr;
 	priv->mram_base = mram_addr;
diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index eaf8cac78038..645d5671705d 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1885,7 +1885,7 @@ static int rcar_canfd_channel_probe(struct rcar_canfd_global *gpriv, u32 ch,
 	priv->channel = ch;
 	priv->gpriv = gpriv;
 	if (transceiver)
-		priv->can.bitrate_max = transceiver->attrs.max_link_rate;
+		priv->can.bitrate_max = phy_get_max_link_rate(transceiver);
 	priv->can.clock.freq = fcan_freq;
 	dev_info(dev, "can_clk rate is %u\n", priv->can.clock.freq);
 
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index a1aff00fba7c..89f7410241aa 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
 }
 EXPORT_SYMBOL_GPL(phy_set_bus_width);
 
+u32 phy_get_max_link_rate(struct phy *phy)
+{
+	return phy->attrs.max_link_rate;
+}
+EXPORT_SYMBOL_GPL(phy_get_max_link_rate);
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 36307e47760d..af9c3e795786 100644
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

