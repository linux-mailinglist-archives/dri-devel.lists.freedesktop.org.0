Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCC3KJiGrWkn4AEAu9opvQ:T3
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F940230ACB
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2582A10E445;
	Sun,  8 Mar 2026 14:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MH8DPax2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FBC10E11F;
 Sun,  8 Mar 2026 11:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=excD8rfcMoV4KepGdYHsrCy6cxWBsHhnbTlPyyrI2Wmr18GJHhL7T9RVNkYyYXFlQYYij+Vzq+7OGOjxl/DMSx4SkfY/FiVeOtBOLyFc95Jo/xN3Je9doxK0zaIY4eRotFtL+nADnUwGf826m3/oIsPaT5AefnxuPfMKsBCdIYO8kUXBjeXbGgKbxGXoIYf8KVp5X2KxWE7phE5r7eBjYgOvlO40WIiHPU19goV07YaKtygik8K5mR92+khDXoqknnP4F7YyFPAzRXsVsaGya62Qbm77nYXo7EuYdFDUNDgjWnVaYYyJKZXKMbolOvAz3a+SQQF26+pl2ymZX5gzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncxqppb1+FFNQtWO5efqY92SyZpwEHdQEBSlEDYd8lc=;
 b=eMyWUU4RehKCOYOtRZV2KIHTuW7oi5Q+SU6MuktwySaZOU3HO84C8+SGNBy+3r+H53D0PpdhHkkIFc9BqGV/1Hc2NocQ7bE4Ass4fGEY+OWRG4OT0neIpNXTo6K6FeXcrgyI55exyp938LEuS820ZffFlbKW5GBLdxmXouCzWpq7RJqKQLi/QdlmCCTiSROLkr2IksO/E0y8LaJdcyIzdbmj1O6ABdhE/hkFKrEQA5vSa+FQGf0UPaUS3QpP+DUnu/qwQw4etVvCx0rP3GnvZSHhEAVPQwzWMWDEXj13xsIa3vOJz9G69I6Boui77pTtD+gJ1mZQsp92BJTkd2GBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncxqppb1+FFNQtWO5efqY92SyZpwEHdQEBSlEDYd8lc=;
 b=MH8DPax22YUqCG8r6J4jfJzraOVWhIJJ6qH79N15xXtB94+ZZnrd3uhNh+kLYgUtXymfwaalCthuosdreBZRvbRrkFkIt2xghKBVWH91/95qjpfXiSVNQ05Hcgw9PMST4/tzE9S2itbAdTeMaF4ESm9FgHgKqP5FA/BywoDEHAGaLHe9Phk7zT/rjNAUCYHafWhfiaDwif5Qx+nuvJCUMWgBfd5kh01NCHvzcAcaDln2p/ObG6NUDkFCn8Y4S8TSoWr6W/D4a+vGh0rhH72gEJmsW+xHVXUSU7jZ4cp/u14ttOKZaEPmMsktE2Tooqt8q93kVg5Rne4ozFiv+1875A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:13 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:14 +0000
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
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 phy-next 09/24] ufs: exynos: stop poking into struct phy
 guts
Date: Sun,  8 Mar 2026 13:39:54 +0200
Message-ID: <20260308114009.2546587-10-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::24) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: f68c74ab-a77b-4dd9-c4c9-08de7d07e1be
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: R+W5Kd3TP2y72nGo6OIpgs0qF0VZ86GBg2vM3aBrQs6C9uHIHMTn81xCw0bOhWhWUtpyDvc4n1Q4S4lMN9sU0A+4J+zco08E1V8UARbHU2S2aiAwhxD1LosWtBb14FZxH5QGJyHQA37en2MNjkkw5NsqZ7hBhgQgT8bzDbsSuRnGeD7Ea5RNQM8tebFEupkLI0Io6HdpnDb2bfalbvLllkRXUkz4WJm5C10x5ZLwR4qEU2UV6jbAt0LfsOR5KdEI719ZPi+KxzY7GSG/c3/JsZQ3BT2U+u+6Y+HjphyShuhB/woPtoXZobJJRjEAtnn0Ivi/kFsFf6gmLH2fd8ohBexi8uU8pnmANlVZaMz+mFibmHO48xjE3b0EsHY4VLvi2iM5Q3OWHZPNzEmRgucy0mHEzfupxd74BeRYXNuUKWybixlh9L0xB0z/4+z2FnDEQmYBkllvz15yvVAAvGpajNfsKFYfQ1fn47iOFi+pge1NIpBrWhHiGRllBsPfdG6H6YUnug5LAS7DxEtj7QzIH0WCYSv4O7lAfx31BxCIwBt1SwYwEk+TxOfUeSmxjduVmbp5ErOC1cPiCWo2/8uEL/PU+tCk2Bm4+Uiz9lASm589hqskK2+zs4mYhLlMEzQilo3t7v4VNBdxBX6pzan/bdCweQpOMSvLrEXddkPfpji44xgm5v/LchIn2texbe660iqU/fMMiNn81oHGavg0ZONBqB1leJoq6f+0yzvFYwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qL3oeIZoUgNOFdtcmPrZwJeK8bgnwGwn8qXB6PQwYK4wymtR5S7CCOlcGQFY?=
 =?us-ascii?Q?bWh1cVrYxpn43kWSCeztSAzfMFWXV+pwFN8i7ZA50C1oqW7D3xa4vZS4m7Wo?=
 =?us-ascii?Q?EzAWf66FEDUZgXZz0JVdfohsoUeAK5D7Fgl7PqsS+I0yANJOikiUx2Re4ipk?=
 =?us-ascii?Q?DNqkcm964DphaSSE6jwRsCtxcjWG1aNWt3DCdTlqK1JtPzjS+3RpvZFNu/4H?=
 =?us-ascii?Q?CdSgxa9BV112m4WllKD6XsgYnKS02joTy0tCREFdPaThPVV+rkGS6QnHTh52?=
 =?us-ascii?Q?38T+dcoCBF7oFQJDSjpve+sC2e3P4pMwBKnuxuJTFV5hHhNRFlAMC21k1+xn?=
 =?us-ascii?Q?PIy2PcfjOgM0jwjYl+iPz3sIoXxhEvGrHvZR1dckVnXvvugvOD3TUB+TZVz+?=
 =?us-ascii?Q?k89+qGqXqcylEnNxiZR/0kbHxY0cL6Cl8o2Umqg4yaETs8DdF2XSQrFX4WeR?=
 =?us-ascii?Q?O3ZYNp3WCBx5bVVJ8ry6l619bMYF8nDyg68zoNeqfnb0jCLn/I4V4WTebEKC?=
 =?us-ascii?Q?j17Ci7L039VEmgpE7FiiVDkGNKWVtnHnRHHi6Ml2v1zkLgB8wBudLldpS4Ly?=
 =?us-ascii?Q?qDcCe4miyXvjQQD6cNpn71I1qyvHzg/hsbZZ5BTbZQ6y43riF5qOB+VeIcyt?=
 =?us-ascii?Q?DlDMnBdd0MW+N0poE20+G4SQY0LmSURqYOh3PD02VToAuGJHzbujVQtx2vOD?=
 =?us-ascii?Q?duvpeVgGokbMyz/25BxtGOALSrA0HxbdlDej0GFS4amOjauQUY9M86U9fkyw?=
 =?us-ascii?Q?lahfUIEgxgNT8Jswn/yBPOVh26E65m1wQFugmonHVl9yyNVIGV3N/YKoHvbG?=
 =?us-ascii?Q?q+9D6WifGsqdR9A+TzUVZdSJS4UB3LNKihN70N3OAvMdkFbD46R7qCHwNSyB?=
 =?us-ascii?Q?DRS/17uwN1p3ukm9rKj55a9Xax8oVG+KK59fTisy1KFuO2eV3cT1Khn1K4oU?=
 =?us-ascii?Q?XMIVxrVtuY0ReC4LhWLWIgP0pYt2wJ7BHK2QYJkzx5n7Sqpq3tVhsaql0FaL?=
 =?us-ascii?Q?OTTnLpiawDmwyT44CSYbleE3KCI+pDvX+Kn3yBfPK3+XYeoxPtBtWQxPBvTm?=
 =?us-ascii?Q?MOB7mi5T4BNdBwwmpBkJ+zDNF97JiaqtsjkS0TWcpEyFGBMOhWRk8FA2hS+3?=
 =?us-ascii?Q?ZC8qUCcNyNJwnsdwelSkn5R/zzw7FriFploCqtvwsbaKOEz9Jhy6S+RtZ8Yb?=
 =?us-ascii?Q?VCBoDJSeuTL/m6ACRp7azcCxVe44m7cW9vSP9Jf3V6YuxEO0Iiw9vcCjF56N?=
 =?us-ascii?Q?1toz2flEfRB1xz9rj2yXh6eMU2Kbocjy9qjlhyMouRVVUixf+zaTxEjBrIzk?=
 =?us-ascii?Q?VOKwYflo8KYJFSVffB6hRabkOctc3A19pCkwO/yIol+pX0SCgMHtFkYDZj+S?=
 =?us-ascii?Q?gZ/XSEMgbnNb/5DAR8gxWH3Cd22JrVXhjLjcAn595crZMfYileuBCon7VBs9?=
 =?us-ascii?Q?T3JYoJBgQWZK8P7QSUHV4Dt5hqHhH27hBfYpcANg89jGxoR55iYYMpKRTYYx?=
 =?us-ascii?Q?WvT7O4rGeUx8DmwnwQv0j9w6ImPRhAxbq0ju5S/1f3MFX1Fx2Ze2sFCDllec?=
 =?us-ascii?Q?InFMDw7qgbEslbg0l8hYvetDiFf8Kr2rtcaWm64PpGR1TX4j6N7yg+bdB7jz?=
 =?us-ascii?Q?VN2ng7kMDnYkbsoVRz6jwBmkXvDCwmZ9nN4xUvPWxQIzx88snPOVgKTtyC8x?=
 =?us-ascii?Q?s8f8GiviubjGcvNp+L4L0vBkc17l1xIotguuPf8bLDLSAfcdO6ufHkHNVkKi?=
 =?us-ascii?Q?zczCD+azZ1stiFUXiAZd7hKIB3D5VP7mdgwfL3OuvAqQcQgq6l6r6fHrLOst?=
X-MS-Exchange-AntiSpam-MessageData-1: pV6vv4KEDu4gJ+x9SCwp63uWFHWczsMIAhM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68c74ab-a77b-4dd9-c4c9-08de7d07e1be
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:14.1692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHUp0PdRFNWfQTPYC/uTagyjCSIhypc/P7dtkdHAQLglaDXr7Vlb4a1+IZk1JEtn698D/EOEb4iO0EXTukR3hQ==
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
X-Rspamd-Queue-Id: 3F940230ACB
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
	RCPT_COUNT_TWELVE(0.00)[28];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,linaro.org:email,oracle.com:email]
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

v1->v2: add better ufs->phy_powered_on handling in exynos_ufs_exit(),
exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
enter a phy->power_count underrun condition
---
 drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
 drivers/ufs/host/ufs-exynos.h |  1 +
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 76fee3a79c77..274e53833571 100644
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
@@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
+	if (!ufs->phy_powered_on)
+		return;
+
 	phy_power_off(ufs->phy);
 	phy_exit(ufs->phy);
 }
@@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufs->drv_data->suspend)
 		ufs->drv_data->suspend(ufs);
 
-	if (!ufshcd_is_link_active(hba))
+	if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
 		phy_power_off(ufs->phy);
+		ufs->phy_powered_on = false;
+	}
 
 	return 0;
 }
@@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+	int err;
 
-	if (!ufshcd_is_link_active(hba))
-		phy_power_on(ufs->phy);
+	if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
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

