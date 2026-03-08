Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLClNQaErWkx3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE22308A7
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334D610E09C;
	Sun,  8 Mar 2026 14:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lAmb9Wfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC68C10E12D;
 Sun,  8 Mar 2026 11:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7+zEW2nCM5t5JIhV6+WRJAxLptBEOWQyy5Il8MmYcA6EczP9yrG3Vfy13ST0dv5GmNvo90E6M2IcdjIowALY41otWx47RFMYbHA2ZCEwF7X7iV9khMguwkZEHcvIH2jLPwoVPn84Lh1BM2fzlSMJdB+yPKWNG44cWhuenjJcaVDfQUd/OAUSd5hNK6LlKsO2ZXXzkTiU9hVBa1ETGoR1jW0xhxIUCIfrgItL4pQtOJLaH7ItaOKRcZAMUH24ZqfzjnA7+qImyDp435WP+btdMRWuv9/48uvU22NajVncm4CoqvAe2RwXT8Kf1uEgTk47tcMbdbnpd2NjBuWY2WVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsJyZ99YDstYMmNu27KUrz+BsoteudQbcLTPBh2gz/s=;
 b=nMnap3hAxD3/PWpkfeRi8hKeREHm9nbvqTEaNxBPRiLIExzhY9ksns+FfEjD7mwtZ2YTX06RTrMfmxqDTX9qoJcJwPDPwHkTSxsXE/zYKq4S6OTGGj7IGptkkK0g30tSVOHA4uJQhP2CaYGg8SUiUcp3cNG3hoeFjrqbpa3UsoBQEViJ7OItFNrU6OONc3p/fF/1K7BvVPccjIuR2k6NIc7z/lmub98fmU9HxTUZuJ/84I5gq3BA1zS6mWFBLlPvdik0TzkL1gMtyv4spbzwN0Xq2bUL3AWrA//0ZECikl6ozLFsHl1fDkqYrSQjERW3n5VsQrwcDRBywBRhZfSnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsJyZ99YDstYMmNu27KUrz+BsoteudQbcLTPBh2gz/s=;
 b=lAmb9WfsYx5MW7DEllnx4qUOyrUvtFlVH8ovpEqnrXWGjyzdTPLw4/T1HX5xGFZV21W3hasr/Lwhaey9y0BZt3HsT+XLQ0bTqYJonn5Wul7DsEAGFml+wiloeUnpoB4Hi2Mm4EgbiozBqy6xK+gOhXG9sLI4U/MTiFeWwLNlb9oW2ceX6Z+nB7vdHU/Xpy1XZ+ksd9sgF9PiyOPa4hi7HMmQYr0fS6nbLoa3haFf2jHh2hP9X7qhx1ndfy/VeL4yIp2Vnuu2coZNp9SeB4ZUYUtSqFQb0v2waxMpSDmmOT1LoPGqmNrut3k3dkb/KfFdfRI3wlTljvQqRvdHPCfVSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:21 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:21 +0000
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
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: [PATCH v2 phy-next 13/24] phy: make phy_get_mode(),
 phy_(get|set)_bus_width() NULL tolerant
Date: Sun,  8 Mar 2026 13:39:58 +0200
Message-ID: <20260308114009.2546587-14-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::15) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: cef3595e-b335-40c9-542b-08de7d07e630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: 4vB3TcEdHmQySbGEC224946l15yf4hEUdhq3Swbdo8rOQ6ih8cFjOPNIkOki6/MfKkqW47mr2Bh24WhSf3DvxIxhrqSwPze2t5NbnpQF3Y+2MjRJ1InFNyX4DhO6rldTOE9dgD9Z7GYXsy3vRRtpk82Z+kejSq+mpN7DFx6ZKdv2ALb8kp8XY7hXqeqeGO3OKxF4++webvuPzvKLsBo6JHcoAN9WGyzlU0Msxyz8fQyPqoIwaA8AhtnQ5Mg4VbS5d4qMyS6M4Vm9NvpKEK7n0QTDsT0jBPst7wxde6nA8l6Qz/e/AToTrdKB8D26ScJbswNn+NYZMRWZUsR1gUqZtPsShjB5SLEV+DCPFNJmOBCoHhCLhamsEx9ZPqHNmmrFKUI8PPlOPOZ4kHfSHzmjHrYG8pBI/dHyLih21jIzDWD25XNTur1M3ZdMoVY8bLZ3qwKKA/DY7wdAWJ6sZbiZiU3oHk7CxbY3s+iKT0kBGLQe+z1Y/GmsxrUuXJ/oZCONL13mA6hLkwz/tpBy6kJ0J8emaSENHIhNbI7Uc/r7OQR6byGOr2zchx4abrjpbTMKJOlVSBEylmWDEOka731glJjVwi4QLU2ALHZ1dNwFwOByanxIeptOY0NnUrdzwos+jplQYNdQHHD84lbAU9laFy9HWYNCfhnpy1weT6ynjBri6UnA2srZjrRCd4VXEKOBKZ67GpJwEhFJwfx0QdL/IStIm1nyrFVxmKp6O0v2jC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCTTCsTO6Y05FOD4ABItUL3UIL4dWUTKqvvGHeS58fMj17kBeNAwvSXth7sG?=
 =?us-ascii?Q?oEcTp+vtAV50xeHLGpfp08PWYfHkv6x38RproaS1hdhvfzMAwjqJ5uZhL3Fp?=
 =?us-ascii?Q?UtmTZ8KSiXUu+VKtzj25JBbnyAb8E31iQNFqw6q0muT5rP+5HbNve+SonHTL?=
 =?us-ascii?Q?GMYbvayjNEQIjxYkXSyCBNqb6c446ZvqMUnYPzj3E1n6yAlt2gil36/hIYus?=
 =?us-ascii?Q?yyZE9W+FthUxBlieUYk1nKFFnUkkupbhUm2r+8vFx2EXA4ikCNDcMbPMWMSZ?=
 =?us-ascii?Q?UV9Ot6fAH5QW7ndFApLUFe1khf+8ia9lgqZ2l8yV6eKj8ukOeMcnp1GXDtA0?=
 =?us-ascii?Q?u+RVYCxJNAnEKxRpegfFVBWkcHh1KtHV7Yf5JOYcJzdmB6mKy30YkUnWe9pE?=
 =?us-ascii?Q?YHrj3kRU0UdOfz4GrkTo9sW4uE054v7ln0PqwCmIgdK+ffc0iteEDcPEWVvA?=
 =?us-ascii?Q?1xSyWKr/Fhh15syhwuewhchYkQ7TwEZT53lSfYtTOIYnR2aVJSm2vvYHFSZX?=
 =?us-ascii?Q?0QH244urmMVWYi6436poCOPQU1PIftrjhx8BULcSMKZiXuDP2IeLandveCHS?=
 =?us-ascii?Q?IxyL8q80Ioh0d4QQ8OY5Lk+WnTGfoRykAIf8wpK9aOEZYe7jV7vDSzKU8cKg?=
 =?us-ascii?Q?ZIJVHhvKlOz3ws5W9+ACatDk/hERiuukCAdL+2acn5+SyParGvSJcarnIvfA?=
 =?us-ascii?Q?ldn0rYqk/6Nfn7kj8fZzN75A+bqgbnPvSZ3Qy+CajwAnQqpBsuQSeCBmSGTi?=
 =?us-ascii?Q?N9HMhBP2t2LspT2UfZ5vAvPkpxFG9LtBWnSoRBc1JO+InspmzwoTeLeo4ow6?=
 =?us-ascii?Q?BT754/xsNymfb5xv3IpqG7ujPSE/Te5p48Z3Mp8gUuDj+LV/92PzlwhERq0N?=
 =?us-ascii?Q?Tf4+Gp3FlKvOJ652M+krO791y4MXRzJho4Lmfph4MKYqg6h+OGIyKllC4cdK?=
 =?us-ascii?Q?hlZUlZ585dl3oqk7p1+uR1fHlFWX226Uypy8XwtsvB7NPoVeyhLeFFkNmjnW?=
 =?us-ascii?Q?+mxy47YR/6sMEVPxfSIRmKLmlsaoUABqh4h1pg5HvfwGswb+DA81/jwvYgCt?=
 =?us-ascii?Q?d1B/+mh8rfDqRAm+0lbOAQbtXwuJieutmuoS8zq27InjwK2qSGopFleWz2rk?=
 =?us-ascii?Q?3C351SkPf6QgA2qDgh5OLekw74T57dAkn1dOYZgMpaDZsI1HWVSHXG9il8ZY?=
 =?us-ascii?Q?WHFTXj6nXBiUmVVoIjh37ZuYYM+DfdLI+rpuNDdpMRhI+cL7VNUAoaPnktvz?=
 =?us-ascii?Q?Htzzgt9yvz0/39ObdqrsLwK+cgBZpv2+zLM1RxMiTcDYrETaTVeOiXGo6koj?=
 =?us-ascii?Q?Lg3/gADxmytvQDZBYOlyg4VZImXVWdqvf/9hLrMBndr9/WYtXPDz+M1iO30M?=
 =?us-ascii?Q?qrhtg/TEQfpxWKDDtB7fuQNzON6sGAnxY9xxBYVB2kB/w2ky1PlE8lJDR4a4?=
 =?us-ascii?Q?w8U2YlIyQo98nrzFLzjkolCJ41ZUJjL5oNmKObqemhVsopKtM9yPyhmd0mn3?=
 =?us-ascii?Q?xvX1PvNWq6srklQzuiIrojCoBIRM3HHQutKEyJuIVznXzDoD6qUSwstaq3RB?=
 =?us-ascii?Q?yEw5oEeDyBLnffg90AcgYgWlm9j1y0Th2eKJt6Xj0AEjH2aOceqg/FRmDG4a?=
 =?us-ascii?Q?Cy2th5XJ6mV8OL1/QSzLQ4JWtAEvpLLENm1WL0EcGUBkgAj9RUA/pSVed4nO?=
 =?us-ascii?Q?z3x4fC9qYOIIxwt2lNMwyiTTWHnqNhtndt+VhCDnMl5x4dY4CWHlsiwwFazQ?=
 =?us-ascii?Q?dyeHbAPW42mbW7pr3rf/94Y4S8gHFr0glDg/79dyAhHx5sjEZlop6ycDPZ4N?=
X-MS-Exchange-AntiSpam-MessageData-1: B+dIGJQY6H4WRQWcp54LsMh3iGiIHb7wmfU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef3595e-b335-40c9-542b-08de7d07e630
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:21.6480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nR95XqzJ98h90XrS2ZJJ41B4sOlNpZkIDwOkC41mGIOIfJakA+bKtc6IYU3LZ/RfU+ADMiEjRQRhz+gSkogNCw==
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
X-Rspamd-Queue-Id: 08CE22308A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The PHY API has an optional "get" which returns NULL, so it needs to
accept that NULL coming back in.

Most PHY functions do this, only the formerly static inline attribute
dereferences did not.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: patch is new
---
 drivers/phy/phy-core.c  | 9 ++++++++-
 include/linux/phy/phy.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index a1aff00fba7c..0d0be494cfd7 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -624,19 +624,26 @@ EXPORT_SYMBOL_GPL(phy_validate);
 
 enum phy_mode phy_get_mode(struct phy *phy)
 {
+	if (!phy)
+		return PHY_MODE_INVALID;
+
 	return phy->attrs.mode;
 }
 EXPORT_SYMBOL_GPL(phy_get_mode);
 
 int phy_get_bus_width(struct phy *phy)
 {
+	if (!phy)
+		return 0;
+
 	return phy->attrs.bus_width;
 }
 EXPORT_SYMBOL_GPL(phy_get_bus_width);
 
 void phy_set_bus_width(struct phy *phy, int bus_width)
 {
-	phy->attrs.bus_width = bus_width;
+	if (phy)
+		phy->attrs.bus_width = bus_width;
 }
 EXPORT_SYMBOL_GPL(phy_set_bus_width);
 
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f208edd25afe..a7e2432ca1ae 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -248,6 +248,8 @@ static inline int phy_notify_state(struct phy *phy, union phy_notify state)
 
 static inline int phy_get_bus_width(struct phy *phy)
 {
+	if (!phy)
+		return 0;
 	return -ENOSYS;
 }
 
-- 
2.43.0

