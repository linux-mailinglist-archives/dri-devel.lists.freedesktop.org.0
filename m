Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC4KMpiGrWkp4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29212230A8F
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C1B10E442;
	Sun,  8 Mar 2026 14:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WqB094f8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074B810E120;
 Sun,  8 Mar 2026 11:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bzjyfh+fSwzNQb+KKOwiby7THD4/A8IZtdnIThYmW020AEWESOSe3CJTNj7BMgldt7nsRElIvNAE8OsXbmZRmykBw1q0pKIYDAqbQ5Hqnma2Du9Bcw+SuZ6zdzv/ctw4hwdwrh6PoAJZZEydO7RjypPkdUFEVhYLpH7yJEqdd+YaYhT93HfksNaaaoPryV6/Zr6AtN01nIwbSI386HHnVjz7J45iiJZa6IfFet2Mj16hh1xfp5UoKfQSGK66tCGM8ReNhnhc2bksZYzdyZmAE4MEiWI2uG8SiBzKQCMLGinhvrwQTbeJGBxkxSPEvEYLX0OVzPZL0e/RxcAiW4vNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf0UzLJ1JbD9D3iPQgZWUzpNjVwK151o4/0isZB+QGk=;
 b=wIXawmR05e434m9trU6bM/GEuslmL0N5en3rQyCRsU/l0RNLrIDHd75JIc0QUMA437oBvqeEfWkC2kKYsXKJ4fLAqRNe5Fhdpd0pBN489LDHeAeePnk7rcZSdOHk71LZj2D4CjLmODyr/IkV55iQP2KfoGj1xTTkm1jL3lLXPMHerCZ+ieOsFksciyOphvGEPzkIPPojckXR2jk/F7HVCP6qDJiHq36PEVszI0r6Bti1WTa9RQyySBwFP4Xcde0LU8b4KwJZY4ia+WF3yY1S0tq/N0Uy4GAi40ilfsD8GnmgDW//p3L9qtu7KQu8/ZRRVmbqHwczI+PhNQgq4FMX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf0UzLJ1JbD9D3iPQgZWUzpNjVwK151o4/0isZB+QGk=;
 b=WqB094f83KD35k+MbQwAQ+qehngRP9+vnesb4hS+nyRaUtxdiYzUZ7JkdbWTvFKpgSA+N81iC7boDU0yiKscN3/5Pihw6nhz84aWzQ/72nK9ErkRhceiAh2xg0/uMk7YVNdOvHqDhSA+RDWDcdZEUlo3MciAr35YwLkXNyZav1PFiUPH0mW6/xrcEXYiagrROnlw7RCQ+1owy9apdydCcZknwWagzThIR3Xue8qBc/E/lE43DI1OHEub6B8NWrQvhjYhvf9l4f4j/sPpSK3rOYeQ6FXHhGqyYybD2UOIdOY7o/0ceDfGKrRxnHkHyAXJESLpVy6h0xlkLi7Y72T+uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:01 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:01 +0000
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
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Peter Chen <peter.chen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 phy-next 03/24] usb: add missing headers transitively
 included by <linux/phy/phy.h>
Date: Sun,  8 Mar 2026 13:39:48 +0200
Message-ID: <20260308114009.2546587-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b07f63-2d80-49fe-2753-08de7d07da66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: bUxp5GEgdXuKAOpprWJS7KtSvLB5D1OiSYCoWOVoeCqKttEOHMU+Uld1l5iFfZzPn6dUie/TL2eeUQX+8S53PP1thfzlwqTXuETQX1712t4uOwdOEaYblAnEMFeGwJ8ORd+rkcpj2khO/osb5IVZqaf/9Fsk0+VRLxh5cRiF1skSElxmmKqofz3uDDS8wMGM0wwLW6VB9CnhxxIyxtBHtDPYY1CduVQdkLijikHBSwEqYaMfcBUlvgHQP/zAo7VcwUrj6qjnp+ht73svGkuYb7xiDK7HQtQ6DKViY8b1IHErEoc0xtN6vtoIYbLXR9JgXayb7UGMLmWp0Vf9QoPulx+rPaNpvZBgZhrc97v7cZWAJ+GZsC1dFe6V057eRmkqndFdv+GN7AylfULzDdSRwDY5wYduMOgOwAJ+4qSdW2CVvS26oyKAb8k2LL0W2VAA2fKuQhSEVnBGSOqRaQC5X1cK4BZK7cXlwmEv6+h2snqBBuNyX71+5Q8370X/lSBt5TIxbxRe/cemCU8JHawVypxziBJZMKmVtdHcRmgL1v53nO/CA5pX1/B3OX6L2de62Xq3CwkqNdEYIxqz9CkzNnaFuwMcIqu7a6nQg7siZU21wpIeX0wYVQMhclk79/OF6qHToLFB5yaU4ld+ewaeUu9272yhbNfWenxp6g8ivKR8oNLObUVloXbl4te1xxlpRmpUpX4HINuKgk4w4h+0faUGceUabzBP9l0eOEvB5u4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b5BhSsYQtHp9yPvoZuaQ1PENNsJN80EDo1JbFVOxssIMqconyNB4Ao682t9K?=
 =?us-ascii?Q?z5dWuePxlOrpxhzUA81hlJ0SBMw1qlw9w7sMHAcTqRSLOCFlshiKoqDKsKxS?=
 =?us-ascii?Q?Ud1kF2TQUUWkSqP1NkuaQp30tUyjxDn23ezvhDTkx/8Q1rA6cW3tzL1ve1Qw?=
 =?us-ascii?Q?dKG42AWQoyXaM1DIar0p3zVCSaeGotR+LQum3+/EToSJCQzNQS7YwRdMfJcA?=
 =?us-ascii?Q?sSktGV/rOrL+JJj1grZ0G3BNRmZLOhp4CAyE2gvUaQ3BmODFqP3zX4BFg35s?=
 =?us-ascii?Q?oq4NkyjzvsSF7EN2yuKy1l46GOrLXqR1Oq+GNrsVonzgaAlTlYbq0g8VwVAB?=
 =?us-ascii?Q?x1vNzYMNFhhALSbsnXeP7SHCmfd2pLfXMOrCTooO1JyAqHINRaOh5icoSdhB?=
 =?us-ascii?Q?2ti5g7mwxDkYymgykrJjnyE1jGC/MChV7GjWJ8QAUsxz0jQcV9Z+halvb7Qn?=
 =?us-ascii?Q?WKkdCEkr1nxq0YxsaGrXT5MTQMwseUMnZF6afCGpUVuh9gu6RfUkP2h3Pqg5?=
 =?us-ascii?Q?p2/8bAB4kSJqogw6Sr/HTUpPqUaeqoPi4sSjq5+s+HtlWZOIZDvOwXr3degM?=
 =?us-ascii?Q?a7uxuIwgE3i7IRHB9DgW8SzVjcq5bmNpyorVlAXN5Xv2Z9yLO22fffAI4vsW?=
 =?us-ascii?Q?3hN8sTMoxCMYnEZcuXStWrcRV3js718gyASRc5YYAJ5dZ6/y4EE46iFNxPM5?=
 =?us-ascii?Q?5QneWrwKQRv9mlUJwK6LvO1jGTPj2dQLX8e2Iqwlcwj1UrOF/w9L3+h+OMV4?=
 =?us-ascii?Q?NgD9oWCpa//BNW64h89L6H2Ei4FRoQjYce03Ijbi59CswJlyPDjN4YkRRD8T?=
 =?us-ascii?Q?Wc6QEyLeMapWsqzEtClTgzQFPNr7k3Dq5uYiO38aheutDOfsjt9xbKbe5u7k?=
 =?us-ascii?Q?LJoZ2PdXy5lnfl1DdeuJjs8IyZx7xa+pwnLHWiPM1vW4WPaWcTGknOYZDpEf?=
 =?us-ascii?Q?PYnOLdxoN/U9lC4tvGpY1g61kZH8rvUg04sQZ6Y+PtD4e9iLJ1V5BuF8TXhA?=
 =?us-ascii?Q?0qlodeOYK7Rc04D7fHdrHAIVgqD/2H7Ueu/VHYxxR63CLTu5oOYIfDcs6XN9?=
 =?us-ascii?Q?WBHqJ+ObH70o5e3Mlu0AvL15vnnZ9TZ0PregJnHSlldgJnxBPlMaXsSqI7lg?=
 =?us-ascii?Q?79XjWB3yejfqp6BX/k6D5cTk5ATcJJ4t2smRlmZx9GWuHdkFV9T/EKcW0iNL?=
 =?us-ascii?Q?uCn6SvK9s1HpHwjG8Uvc0pDpHcJCNDGWtlMhRT30I4n/tpQYo+cVcdXPSl7/?=
 =?us-ascii?Q?/3IgQqEHhN73rVCmfWR/U1GLk/ofFr4Z4+icVCNMVh7zWidY7LtF+48V5ZQ9?=
 =?us-ascii?Q?Z1QpResrVSo/ECxilqkzMDNJau36rOClGmVHwcyJ0YPZYN7svbfjGPH+RbxC?=
 =?us-ascii?Q?xk9JDohO3CJrD3rQry8oQalwwy4100NEO6R/VyF+/gKxzU1QmOnxX8LTjFSr?=
 =?us-ascii?Q?+FeYA7LH7RKOfmlWdw0PD4TUhdcZ2k6GxZqv/3ecwfCJlCDi1V5EmNl0VUI9?=
 =?us-ascii?Q?q/OrVa2bZ+57Z9rK6ZdfwDODtxo/bbDakb/2QKxPA7yIX0JB9UF/RCo+8k4d?=
 =?us-ascii?Q?DpMe+kOVHtIELwf9YnwATuS9+ZbDztlrnphySd+ruLPKg/wYIioNUa41dULF?=
 =?us-ascii?Q?9T8q0CO7aiO//gpOw/NDXMCmIMoK83ae3GkD8Qe8ce5OAMXl4vM+c94A/2Al?=
 =?us-ascii?Q?2jEUQrn/MowX1YoKF8GpMOsKIOg/FHaknYT9BjpMkq9V1RK+wo2ufahnYaOL?=
 =?us-ascii?Q?h6iECC1eLRa80xVpG6Mb0BxFm/Ytx2+ZPFJdvytgSJ9M1Y2GScgU6+CG28ii?=
X-MS-Exchange-AntiSpam-MessageData-1: 2DJRJyBGHbq+4LDDjgU97YJqRGDZ6WeLvek=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b07f63-2d80-49fe-2753-08de7d07da66
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:01.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyE47hYwQYQM1U099eWQQsj4ry8310UWJGS3SrouiDLu/BsNJ05KR0JN1t9gN22dQ4OJ8m188KXZsm7ntVSa1A==
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
X-Rspamd-Queue-Id: 29212230A8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,synopsys.com,linuxfoundation.org,nxp.com,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:email,linuxfoundation.org:email,pengutronix.de:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The chipidea ci_hdrc_imx driver uses regulator consumer API like
regulator_enable() but does not include <linux/regulator/consumer.h>.

The core USB HCD driver calls invalidate_kernel_vmap_range() and
flush_kernel_vmap_range(), but does not include <linux/highmem.h>.

The DWC3 gadget driver calls:
- device_property_present()
- device_property_count_u8()
- device_property_read_u8_array()
but does not include <linux/property.h>

The dwc3-generic-plat driver uses of_device_get_match_data() but does
not include <linux/of.h>.

In all these cases, the necessary includes were still provided somehow,
directly or indirectly, through <linux/phy/phy.h>. The latter header
wants to drop those includes, so fill in the required headers to avoid
any breakage.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> # dwc3
---
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

v1->v2: collect tag
---
 drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
 drivers/usb/core/hcd.c               | 1 +
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 drivers/usb/dwc3/gadget.c            | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..0a21d7cc5f5a 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -17,6 +17,7 @@
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_qos.h>
+#include <linux/regulator/consumer.h>
 
 #include "ci.h"
 #include "ci_hdrc_imx.h"
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index dee842ea6931..7a3261f72463 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/highmem.h>
 #include <linux/module.h>
 #include <linux/version.h>
 #include <linux/kernel.h>
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..2ee1bb9d7199 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/regmap.h>
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0a688904ce8c..d06171af6870 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -10,6 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-- 
2.43.0

