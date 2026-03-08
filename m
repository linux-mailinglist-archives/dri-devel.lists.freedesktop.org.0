Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EFEH5aGrWkE4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEEA230A39
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176E110E43A;
	Sun,  8 Mar 2026 14:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E8nYF/Id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A710E004;
 Sun,  8 Mar 2026 11:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwNS6/7PutX26TfZXe8i3Z3wdiiYe+ovt8EqsmqtbU1sOIYbouNicIMbt8cMENzSKWH7afG9j7ItnKCxNR/5cyhwXTVZ/NyjCOszljLstGtms3iWCr1amL/WMIAzdNcs8kUBrx14hNaCy80QXr2naAxpEH9EpXM1TRVP8M0+1s7mJhhBn1qyD3Wzd9Px3fwK2PpJxBfmL2QPr3S0dR/2MaLXPPkCIiACo/BHR1ndxJwYnF/AFrTq0P0akUizBlkX+IBcfnlHjsCAc9pe4R5lLVs6ysUA9hvttAwWy8A+UfUB/EfPIgVV+aZ9zpkLSI1xU8RHwLkDs0uw6wqdX37MyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH42xayCRdRe/n5MhzEEEXDuPg1Lm0ZDAZ4CQMKL/2E=;
 b=srsSBb8ZhVga51EmhzcNGcbktZTQtzaMlf9KNVa5sXSbG0f25fnRXkvrmvDMApAa1vmZwmFFSTmHXsjo59XP+3E4bd1h3vW0E10kGvvys6YFh8KrHCM+N7r8QPoMehzcqPRhc72AlGCi7vucib2jHvX8NwM1ydeB0VOzVZDT/M1K2KVEO4V9Lot904ItF1fcSbFkLsjBT1rmWllwkdantt/SS+FDpkI+h/K3lr6QsQdgJTtUsOsAN8bqvdDQPTmqWKq/LdDXNh14SRUqWqgWe+nmOYb+ZNeDkjAKBOtiQnh/n9U5k2K6tzkT7EETt1b1PVsBxt/K/j/tc3Ndwsfs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH42xayCRdRe/n5MhzEEEXDuPg1Lm0ZDAZ4CQMKL/2E=;
 b=E8nYF/Idl3u1RUxmXuF3MK7fB8Ku1iaNCOPrwIDlrcMYhOIPk1Q2KI3QdEoD5HolRv6y11roDaJPDaijBf++bAemmuf9/xibvj9+kZVQJOpS0vvC0AGgtIh87BQv+awAOdoTEsBYCHRYOHfGgeTn2en/UimfuemBveb6kTj0NV1WajwnKoV8HMyRYGIFWDbwjYXs24YRwUY8uh+lNH+8jEJVK700azEAVRTVwQTNvJ6VTwgfkPkcylJK6V/JDLYgvCV2dOShBe0jAUa/aCY/eaZMktwiQugiGXnpJgkGm1aHEKCFje2s7BK4gROMLBaj3gVSkhcOGiQXM6YGQWkrWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:09 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:10 +0000
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
 Daniel Machon <daniel.machon@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>
Subject: [PATCH v2 phy-next 07/24] net: lan969x: include missing <linux/of.h>
Date: Sun,  8 Mar 2026 13:39:52 +0200
Message-ID: <20260308114009.2546587-8-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3ae557-caf9-4b96-fc5e-08de7d07df63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: W874Up5sgx2+gtrAi2wo7tWGOHnbdLdjGPCb0Ehxpq/b90XLKW+mKoS6mNVlzFMIUWlx143967Y9gqMF+YDW+LGB0oPHZeoiztoOLDm35AM3WBeedF31R3jdnESgNg2nDC6VqZxEGow5ZovA649TsJ5TR3mfqAxVqTcCEYo//ZfZj+3tHDHnPcM2teiC8M957ZqMEKWVPITnrXD7MRbXh26h4J7W3Rg9kzzvZhKLZ8JKUKER94Jd6adTW7wyfvIjUDOYpI/xDuNYQnD3slEWKN/9IXCxqEmQtERYch4DD3eYwjvPozbWpfUsp6dlBFx/9UxiPNjSY8d0QrheNNa5w8lLDDuUcHRU//ZYjRqIf2ixzGsGNdWuEpvoTuV3BS5Tzb2aojspG9twdoPhCx0eGafwv4Ne3SdNLcG9LT0Ar/1P/clJznM5+xGVKR4xSnZgjSygMQem6XA++AwV6QQ9acRpI5n1wGE7kaWIEGWXrGQdTmLN3KMETQ6j15rz/wf/DFjDa4TltH/acrSyJTxpkTtN8H6g8/auu1SSjzN9NclAS6kUPcdEJESqcehsI4jOxRqlO6f2UpuYlU9RT0Jgpvbzo9h55EICc2K3V55rEzq+7/mmGlCY6aRxDIEK4lgrR/XPub7VIBd8738vgeX6qKRhnQkCqf2sMLJqn2uPqgTbfbflr/il26vlJsOiCdGDydqFYaQt+ZMyzxZgUAaomhbCN+OOo8UfFFX4I76Q864=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s90cd1CpnTBXjrXdhrFX9PAjSIFYT8MtgnG/4vk7vumj6iynCid74SE+IME/?=
 =?us-ascii?Q?O/e/useYFWtv5Bz193PXP1RLnn+lS8LgSWjKHU+QjjCqE1yXaHqhWZV+1PEb?=
 =?us-ascii?Q?pHX0OaBAuecmlHfj5R8dzNRXW31Lt/rGNOKMbs3TcPrV+H94FSSHAqZTLtht?=
 =?us-ascii?Q?aSVEU1JaofxAtkqkdYIRMw2OZHJlki9DWDmCfRpf5RcEdCcCOwt3OG90YfPX?=
 =?us-ascii?Q?8Qkn2Zh9Sr56XGFYdi9mHCZ7pB3tfmQpgaUe3Lbl5KeAWpQL1zZEsyczrUzL?=
 =?us-ascii?Q?NunyulHY5H7agsOM78YrOeWAFLcqIlFBsTC28IgqVubKbKXRY2yxVj16kE3i?=
 =?us-ascii?Q?z8ABR61WocvGTykhxCDo49jFq7UOi8kq6ZiV4vJ3qszbZdxLIXrbT2BDpgFR?=
 =?us-ascii?Q?zUdwHLMmxBAypXVtkbpW2gMuFh+sA7YAaKbKDy7GN6Kl7ZbxgTqz4oELALYM?=
 =?us-ascii?Q?KCNTOTlFFhh6S8GwDQ+2QxsT4GfK7SKAypMMuoXNNGz2vcfQ6TNj1VlQajYo?=
 =?us-ascii?Q?vWGwbFWF/e6w3T8LlWlkliYzg60xA3Zs5X+iGjTIq8Ajjn7KfavIVafJTw8G?=
 =?us-ascii?Q?NTVcbDlU4ZdhwCorifHs3FbhkODic7KKW0u/tn6TdYyTCxGeT0YGndpOL2u6?=
 =?us-ascii?Q?HGyHNQx1T5QVJCOR8nP5A4dCZKbtYdt1yWksNS/uzALTytF2BwRhxs2u+DAu?=
 =?us-ascii?Q?7SOfC2piHHBWum37peRronSb+RtrjPEF5v6KcOmp+ZYl3QDbuZBST7y6o9Xe?=
 =?us-ascii?Q?LnDqz2BsC5GkFsR4vCBN8FZEqaryoxfbScKDwh92uBQbnj3aVAfpFMDLagEG?=
 =?us-ascii?Q?AR4UJLhTGtG9vH5m8jIdbd/6Jfr2SreUngvnrhNp4dOqJ5+rKyTWH1Syb1JG?=
 =?us-ascii?Q?FxcxQQyuA7D0ZkUM0mQ3fr9DBPo5JoSf0H9fAo/VALcfRZmqCtBiZqwCOJFq?=
 =?us-ascii?Q?IwTVaRQPYH8O+5kx5LusHQIY5Ik67eR9j+i9VjehJC9lvm4A/35KsYEP42aA?=
 =?us-ascii?Q?A7W3GIfFPWYrg9+fgI77g+7zF2Kx1digKEhjAi2rZDh7h6K7h3egXKIr3v8i?=
 =?us-ascii?Q?ySQURKEGOqN4kOyymSw4FUC6pEuzOAqmA3XVGwRK3iF37UpCN91JgHjIbfiu?=
 =?us-ascii?Q?WfghAN7U2xzZIQfvXfjmNLC5Gd5CGPpW16nlitr98HOIw0ttEYvxrTQDgo26?=
 =?us-ascii?Q?6HGhPTVko6w5aWZu5MTRSz481vT0xhn7IMhD9KzXzQQaP4b4gjbb0yqW1+1y?=
 =?us-ascii?Q?u7OQ4EL5kJOt6jJTXKDmhiyJa4qzLSjAYMKlqKqXw3sQX2RwNvrXsdYeQGUo?=
 =?us-ascii?Q?8NvFB+haS00oQETOJJBED2m45jTciiGyMPK3etCe+i8LoNoH+aQWwYWswgqZ?=
 =?us-ascii?Q?p3J0IiTTs4qCuIB3HQHacCGa6feWBHlESm5pDbFsxTSHyYJs69qmaXc7Uwb5?=
 =?us-ascii?Q?pXpK4YXd6SX17HrwicNlRAQdzlVucRjB5QBaj89ASTn0KXbPdM/SinoOwNmE?=
 =?us-ascii?Q?nAdPXt/sNeaJHYIqQlbCZY2H8TZ0Doi74BP0vwBpzLEUVc7asp2CajFq2J9k?=
 =?us-ascii?Q?4xxtHX6RgxJcOiKKmBxT+8JBaVrVk8MRCXeSXpweLLj4aXVxWRFrF/0K3HrS?=
 =?us-ascii?Q?sMT1UdBY4VE0zwKbZJRpnO5DiTrS0Kp9whc3aBV83j46yLxNjbGc75PqWnRv?=
 =?us-ascii?Q?OFXULOhAp5hi19AXm6JHdBzzr9SPGSr2WwWKSTFGwLGq3/kphLlU5e3Tx8VB?=
 =?us-ascii?Q?M9U1d4yN3YSSSCKHPYd9siI1D5EcPm3GlIQhN9Xtkcq+nwlFDZ21e3xr1PNp?=
X-MS-Exchange-AntiSpam-MessageData-1: T8OtRuw5Dg++TBeccqOjJ2gdES2c9yXQq2k=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3ae557-caf9-4b96-fc5e-08de7d07df63
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:10.1430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCtyBIhmsi9hsTgpQqRe/Z59acwrB8v8Ao1MBTZDIZE/7iPtJx5S+4TpKkLr8AQ7rQ6/q1U/h5MzBFVY7haBcw==
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
X-Rspamd-Queue-Id: EBEEA230A39
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
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,lunn.ch:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This file is calling of_property_read_u32() without including the proper
header for it. It is provided by <linux/phy/phy.h>, which wants to get
rid of it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Cc: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>

v1->v2: collect tag
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c
index 4e422ca50828..249114b40c42 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries.
  */
 
+#include <linux/of.h>
 #include "lan969x.h"
 
 /* Tx clock selectors */
-- 
2.43.0

