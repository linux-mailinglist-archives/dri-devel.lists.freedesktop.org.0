Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCTeA+k5qWnf3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B020D25C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDCC10EB40;
	Thu,  5 Mar 2026 08:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K3WzqB6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9900910EA87;
 Wed,  4 Mar 2026 18:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE0CoRsjOjoT3D/qXzT2JgOM/PCail10fckaKKlLM5fsGLLwC0D8wYQFLzpSzSeUPJhyaT1rD3OlfiNLJpMPQBzUqpjm2vHfBY9nIthD05BQsz+7pwhsMPsfgXJJEajntlWv4/GAURPAHR9OT8g6FnCWtwZA8klzYPWOILaYLup1snvRbUZ7NYJ5BUfUid1/DbS8R+TtQZ5gwop6zQ/EsF8odBgP+WjS7WejGRrqXFqfczDfj7uZAzTEi1BFruGZcsLxxfxDS1+ijz6bCVaRbPRnGJI4y4kmCcpQiNeHxPZAa029rcEcTB38DuytfRyJNivcHfS9fUd18qWbe4/tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaMZwJVyCgXdb9XYJ6l+i4GfLsgKW1Np1xdrdc49/2c=;
 b=yQX9KUay0dfVXqcG8XxZzG4BM5stQwGZ9Ch/fN+wjGsUjucQ2AXK5/KVScpl5m724jaO4nFRppPbU3eE7gLyesXUbTKLoIgeEdGH3RHIjiFew+yEJDWkQS/HihQz6NE1M9T4gPLhP0F2+vQWaXixXXRfATPtyBix6g5jr6+IgVwj7g+lUXbWuxingDZ0ovzy0vye8XSWsOYAu4j7vE2vl0klitwjNt6DpxQcMqNriYks5LCBerAIDHYezlcEvcSqwI/xc5PUxvtKzWK5JA3yFNAqsEoPF94bDOLSz94YUPVIht9HfMi7rSAOKEOQwvblllVJGEkfxgyXfWJTO3CsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaMZwJVyCgXdb9XYJ6l+i4GfLsgKW1Np1xdrdc49/2c=;
 b=K3WzqB6cePemUPvURRprn9xDWHpBW2xV2wpqAiXWZeLT+tbsDj0CPqrnKDhoHYx87boOW+Lvzd8QuEW/6OqteVSvo26lavl4KsrIFzA/U+gdMB2Nq1HdVtQhwW0TFtlBIiubMrOwQNhg/EAthh8DR/t0Ko8vBSknCC4q7flkBav4gYGCjR1ctp7iaUXn/zuvl86wrwi0jdouOSaBO62VYnda19xG2SF4rzxDgmGrQ5KKJ1Md51Y4jjEDhP2/+yX08FljRKk+3VbDwJnkNozfNO81x1iyJ/3ilFhodLn/ay7G7be4mbf6s9L21p6SjqDqMgIU4KOEXiXNxh+N5uNkcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:12 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:12 +0000
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
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH phy-next 09/22] ufs: exynos: stop poking into struct phy guts
Date: Wed,  4 Mar 2026 19:57:22 +0200
Message-ID: <20260304175735.2660419-10-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6a62e5e5-ff73-4c28-6d05-08de7a17e166
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: /BAcIO7WNlf5skYIsHwaBk1jIBRUe2C42HB+zKCqE6FjmCEDY92f1OHsRQfo6wSH7cbGWKXeRGiFVqtY51F5dvKOpu3QoTpnN4ZJOV44L3O0uOVuw0Huv90yPaHqaLzFTotB8f+GGTv3ALXOJKQKQW+1QK9Osbqn2cy/D9AKHYiggcKOHJ2slfYSKzlhvASC/a9mM5bbuPUyrWAYBaRBymofBXH1j0IVKgVmMYRsEwiNOsjgLB2Z6LcR9JJqQp5wwNrrtbb9FQbo2Nf+rpJ+kP4it7raCIMUsKu2YaGIWRtt2ez2T7XX6JaxzBKdIQKELzGLjclJ9cXEQiMsjytv6bO8IKtaO5PBKIUoYIw70gCwHueNUla5pcL5xiZGwrHrFLiX+runDX4AsSQOp0UZ5vWjGvpfoKaBboND4Sz56Lp1QVuQDOoZZEwZ3EmNY5rfF0r7zGItDZ7cyksbKyEk9+eBmbC1Iws66suctAoim3Il6XJ3tRRf+cL4ml8fzQIstSfOeGQPW3u/mdl7hJRVj2uVn+oREi7MuGfotDaklFSX1h++WPt+tuKvQ6Ol7/E3/4iLYjPLUt4LePiqAKfnyOYmXCeILBIUzlIMfnoMB5LRRXD0/jQQilI2V9DgfCJt1ATe+LNKoZUqEwjPRrfMT4Sgf87PC5cUEArDUnchKRXYSxTijBTzG7xSwBGbef5nxbFVjSDD+RvGkRWWWp8SM8N8Bwn1jRH37YhDLta8Z3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9E5LYusYCF4ykVh3ZxDspFbK77fH1y1XN4j8AkXKYoRXTSQQWCgWlA6nelRb?=
 =?us-ascii?Q?0nYcL0DHW0/xIxuinniYmQLV3ZIdu3r5/+J2ovUercA9KGSYDhqisgsnr1o3?=
 =?us-ascii?Q?RqgFHj5qRpYTUh+hkk9cnyCkSI4f+qVFdplBHXHUSN5Z20VVywbU6fu2oNew?=
 =?us-ascii?Q?2L/g++C+126u6FKVfFKfXhZhJoMPAVe+el9813xlVSSe/D/OvfEMcRVxY9qp?=
 =?us-ascii?Q?57K1nZxVMEyGDRZ/7Z/M0Z7TfY8rOp9nYYa9zXHCBychO+SaLNZXLyHn2p8B?=
 =?us-ascii?Q?+O8Va2A8cmcSu1Zlzma4eaQxgZfvJrYaqqVqWvWa6peGtvZjnhdR3SPSlEJ7?=
 =?us-ascii?Q?IOU5973vyXrbT8yXyONH25mG4EY6BqNcjOMDj97WU+MrUMSWKzu2l36GDIlE?=
 =?us-ascii?Q?r4Pl7t3ZmdMW5vNxMRPT5lt6mM8MYdgPi/fbDmqkhbYzTQ4yn0old32YwUR2?=
 =?us-ascii?Q?GbbHj2YBizxnQeuIoaIar7TpZ1HaeOSczJcNhqmmD9wbhgYtfpl0IhpYj3mi?=
 =?us-ascii?Q?k4H14mUewOQ9sWtwotW5f1qnRXpGkfYqBHCi9p6isigNi9VgaL3UKPT0QgyN?=
 =?us-ascii?Q?Lac8AXrhTTjhgxGsvUOA8/6jZtzCnLTEFgo4Olr4c80kEroLUng+oBUlhIg0?=
 =?us-ascii?Q?aSEHRwkNEI0hMqeDCyqKAUOT9uoOXcw94FVgaeEVc1jRFC3JKpxW2S+sv+nQ?=
 =?us-ascii?Q?zlBbHM4+1sAw+FGJEBQDatBeiR41ACuhlukm33HH5s7cvCrZuJfzY4u8W0bQ?=
 =?us-ascii?Q?64we1sOBtb8m5uFbu9+CMjzJtHTwV8nr4I38A8ZJsinArIhp7h/aglsoHg8P?=
 =?us-ascii?Q?RKcVgnm0nnPLJB4FjyWmSsrvNKf+14/jVGIfBQ3GLjLTKSeU/Z7Ya4z1UZqK?=
 =?us-ascii?Q?d2Cq64r5yGHSJMAqfha9qdPTvFQxP6j/wZqCBe5fXa6Ca0P4r3J7ik5xKZCE?=
 =?us-ascii?Q?dZVEC91mK8mrmrFI6dWHpAiwPWY/c46dPjEb2JCocWTv08AyEOC180VfQ6HB?=
 =?us-ascii?Q?+B1lL+TLZZgQz6J4AZ037euKKS7lN7WitneRVLiOeWT5B3mY9s9XqpKuj/5R?=
 =?us-ascii?Q?gtjLN7IUqh17sQiHeV0NVphE/2x/TWtG9tZXj5QY3n8zU1MWcuu8wjahD5J6?=
 =?us-ascii?Q?i9NQhaYeHf0oQRpFfMZFJhyN8uB6WFZMH4mA9vSB4dmTH937gsstaHxP2Dy1?=
 =?us-ascii?Q?aMVpFsTg0pjgvV2V31Xtf+QVRJiokqLgt5EW+R8JnZHAYszZE14qful7XJMS?=
 =?us-ascii?Q?/XFsnnp3IfYELtI1KFkLa3XOoNUL8uxKaW9QVUM2zRwiAHFRSDHygJ6sTTMy?=
 =?us-ascii?Q?HvHbgHXd4Nnj1WGZvONCtKHYeKycVZAogeSUQSp9x0nzTatE8MQwSY5ZNg3W?=
 =?us-ascii?Q?o5gMRx26WXj8C1IfsvhKBb755ul3k5Nx7t2u9JBqtu+gyo6gV9FMmHPW4/ie?=
 =?us-ascii?Q?m+AdQroCsitfSXfEHGol64DobkqWJNHnQnD4TigX2YXppCo6cYxkdRA1mcvv?=
 =?us-ascii?Q?uaK2Eqbwyv1Gtg5/0+nz/I02VBb+G5OwVkRj12i6qK9dPjl7+jPq3kxyhu7b?=
 =?us-ascii?Q?1x2mxQFecy0KaNmNs71zIKdS+x6OLYNPVcAfjm/+VAgjUPi8dA3mhEf47CBt?=
 =?us-ascii?Q?/kLsB84MCJlE9uFwXJWKwySe+fEqdK17gbU/ZMvBOczmOXlASspKfLxonbnW?=
 =?us-ascii?Q?hmIZ8PP8bRi4YVA9XeOhNforGfCz5Ua+vcz4Qq0CKNDiTVWjFVZ9ZCwyajet?=
 =?us-ascii?Q?dbw2iomXkyOayHaQ0Nqmd0LstmG8xJD0huZcJPNOWCnMibsDy/puhbMw032+?=
X-MS-Exchange-AntiSpam-MessageData-1: XphljbJhyuxjlontw/RwNRcvCQBvD9iD7LM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a62e5e5-ff73-4c28-6d05-08de7a17e166
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:12.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIz24iC6pjkCKO72XskK9jHYkwXliR7bqQFnKd9xeADMnCHNdRvbMcLWVEVnr8HKvPPkTi1spD3ckYnJ7ViTtg==
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
X-Rspamd-Queue-Id: 6A9B020D25C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,samsung.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,hansenpartnership.com:email]
X-Rspamd-Action: no action

The Exynos host controller driver is clearly a PHY consumer (gets the
ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
to get the generic_phy->power_count.

The UFS core (specifically ufshcd_link_startup()) may call the variant
operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
if the link startup fails and needs to be retried.

However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
the generic_phy->power_count, because in the general sense of the API, a
single Generic PHY may have multiple consumers. If ufs-exynos looks at
generic_phy->power_count, there's no guarantee that *ufs-exynos* is the
one who previously bumped that power count. So it may be powering down
the PHY on behalf of another consumer.

The correct way in which this should be handled is ufs-exynos should
*remember* whether it has initialized and powered up the PHY before, and
power it down during link retries. Not rely on the power_count (which,
btw, on the writer side is modified under &phy->mutex, but on the reader
side is accessed unlocked). This is a discouraged pattern even if here
it doesn't cause functional problems.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/ufs/host/ufs-exynos.c | 17 ++++++++++++++---
 drivers/ufs/host/ufs-exynos.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 76fee3a79c77..eff2abbf9a9b 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
 
-	if (generic_phy->power_count) {
+	if (ufs->phy_powered_on) {
 		phy_power_off(generic_phy);
 		phy_exit(generic_phy);
+		ufs->phy_powered_on = false;
 	}
 
 	ret = phy_init(generic_phy);
@@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	if (ret)
 		goto out_exit_phy;
 
+	ufs->phy_powered_on = true;
+
 	return 0;
 
 out_exit_phy:
@@ -1737,9 +1740,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+	int err;
 
-	if (!ufshcd_is_link_active(hba))
-		phy_power_on(ufs->phy);
+	if (!ufshcd_is_link_active(hba)) {
+		err = phy_power_on(ufs->phy);
+		if (err) {
+			dev_err(hba->dev, "Failed to power on PHY: %pe\n",
+				ERR_PTR(err));
+		} else {
+			ufs->phy_powered_on = true;
+		}
+	}
 
 	exynos_ufs_config_smu(ufs);
 	exynos_ufs_fmp_resume(hba);
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index abe7e472759e..683b9150e2ba 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -227,6 +227,7 @@ struct exynos_ufs {
 	int avail_ln_rx;
 	int avail_ln_tx;
 	int rx_sel_idx;
+	bool phy_powered_on;
 	struct ufs_pa_layer_attr dev_req_params;
 	struct ufs_phy_time_cfg t_cfg;
 	ktime_t entry_hibern8_t;
-- 
2.43.0

