Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIfHLbAbfWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28549BE9A0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655CB10E381;
	Fri, 30 Jan 2026 20:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="oOb2CeMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023091.outbound.protection.outlook.com [52.101.72.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F41610E381
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 20:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vlcu0brUe9yLeyrqX8hZQR9CAMQ9ByfHnh7IGIgd3EUc3IIIbRECJ8h1nJSjoGJffMJBLRPMW3Gg1bmrYfiGhuo4RuMRqZNSo81QXWpi/lI9o3aaHp/jjQDam7Q4Hhk1TKTUoVKERAFJSI4Ui4oXtBuSH6SL+/X3CoA/ASHI9Ua0GchgWaHaQlEwib976saSnH+zM33XDFaR0d3yszfVr6pU7Zo2PQO3WxijXkCm+r3I4g7D+X2AT7qBS0BqVKYH9NETjsbc5irOzKwhGWLeOmafacg5aIBDCd2sd2MPrz9MMLGWzaZkcvC5N3MC6aB+PWLgzig99lc65MXdFVwogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=;
 b=FMQjg5v5JrUTqd+drYLp3NpHCtHoSjw0tvGLyBCsSwQvY4qkxffZ7+Pc81+oTAYIa0RKfbalT8/2TEP0Itg1ucZsdBx7yWFuLNwrAt51wiIq5aFUsr2DK5Xa0FEjLbfnN5/479+QkSX3bHPw+6KNhAg0JkTYKONA0v6nE/TxQKa5mPYGZCxifpf+TyfJPlcE9wVxsQOklM8AAVL7TQA0D0drwhShmpdnfTil8x2dWHqXFIuSyZH0cm5gnpZMos7yNtj2uiUpAoPflDqknrfyyqFk3vaxqNPk9cAfvccnuGOjzjGkjRMCEjQFRl2riweNCj5Pez5CnSssnld7ulWsyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iyU2CsXvc043GMO86VtBnM1Bg1xqAUge4puoz8tRdU=;
 b=oOb2CeMuBz7WwhPlwAVHAy2a4mZNW1YNB1CsvSjHpPW9qTuoICUAPOtsvJHDUVi2DSfdXSwDWegFIiQZsxL6GFFvV09BqjVUk1cHi09n5Fsvk+BzQMQlpz0yuq7DQI/M8z+Z/iGThdbRQUPH9XJwFZ6c2c0nUM0awJ2gwwb26uKHG6uxn8ZjQY1I3vh93EQTeZWVqwNL1/jhMDmcHInUbvi30LgVnYQXinwUQnm0kgEZ2ZcOTEAWK8Av60C1D85u9tAiZmu4iiXjipdw91yYgiCCqEcgpjxUGLFkgIs/DYe0dU1yUyRkL5j2a/golxfIit5KHHWT9/jqe4VDGN28VQ==
Received: from DU7P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::18)
 by GVX0PFC71B3D6A1.EURP195.PROD.OUTLOOK.COM (2603:10a6:158:401::7e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 20:59:18 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::f7) by DU7P191CA0011.outlook.office365.com
 (2603:10a6:10:54e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Fri,
 30 Jan 2026 20:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 20:59:18 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:14 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>, 
 <Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/6] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
Date: Fri, 30 Jan 2026 12:58:11 -0800
Message-ID: <20260130205820.83189-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130205820.83189-1-d.haller@phytec.de>
References: <20260130205820.83189-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|GVX0PFC71B3D6A1:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb80ad4-c6f5-42b9-8682-08de60426f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C/d1w4yjyJWsGI0RJed/KWVGi+W8F6I++IlSI6q6ccX0SkZTx94V71V4tKPn?=
 =?us-ascii?Q?QZdCgHXXev/MGyiFXxEDmFXGQjCgyve7/tn3PYBYKTbh6DbdKtRy6EwcaBhu?=
 =?us-ascii?Q?vphNEg6S1a9tpc7AdTaqojS8qo21aaV79HLrYx4vNY0ABT5meW1Pfbl9Z3y3?=
 =?us-ascii?Q?Al/eUnSLISudXoP96SM025O5kxUXniz7O3D7V+ZhwKEcZgEqS8nq4Y1EMD40?=
 =?us-ascii?Q?7ASMPdvf0qeQuwOm1Qlw4Xq0q264FfMuRaxClZeo8a79MTAQ70nNEZG2e4Zf?=
 =?us-ascii?Q?DkiFgltsDqtazo0OxM678uR7bhnjp6eoEWfnkK1wNgtZ6meyCVEFo96S+pIR?=
 =?us-ascii?Q?uM8GoTjFp5FsYn1JyleQwluXL0ZMmhkeaLNg21FoDvTOZzXdGeQIY91+05zP?=
 =?us-ascii?Q?pqwA/FrMOzCt0Prznsmz14DC74uFAds9ocxkr/pheJG4wQ/09UjvwHllXpRV?=
 =?us-ascii?Q?fNUALCroso7vqeO6uE/y4C/kaz8JsncTOQhp4tXgYxb5uJf9Bhczs/cUFOzm?=
 =?us-ascii?Q?UTXJvNNRqOFo/mvgoih+mmKzpNAePWVOE3qfVkcyOfqU0FcQ1vR9dsWqBGox?=
 =?us-ascii?Q?kp71ha36ogu4785ArGndY24/tmjb897XQn8sqSPHIoJ+Y2dt+mUkffL0sUOf?=
 =?us-ascii?Q?p80V8mQDfE4UyrLL30tmulQVFugGXpGH19wEvAFWb5wi+Gm6FJGPUXX+9yCk?=
 =?us-ascii?Q?lhvUxzncXTay7NT+f30SYSwj/ZgUnq20bnXRqZhKeFqCp+n5Rq1ldr+CdMg7?=
 =?us-ascii?Q?7BKdL9J6/fMzFgR/8HMyfCB2RCkW+clj+RhRKRTsnwQK1ZsJ9WA3PFWj0Oid?=
 =?us-ascii?Q?xPwuO4KfKLR7HYomqKtVUOnnhbIwjj1mYPZ2PBPdqmW7ODHBMXWo+FjQeMvb?=
 =?us-ascii?Q?9RCvo0ZAjjHKAJMliY43nPjECU97OQvi7sGu0Vaw3lfw9eG+tUqFbVSjR1iX?=
 =?us-ascii?Q?rFBCfwpuP5H8AmY22eOnEhv7tvFzith4q1KL2eVADgndlDh79XW/YGkmsehu?=
 =?us-ascii?Q?abES04g+qyF7NFp9nZdImB+m+jAZajVgMkNEac1XIA7r3zpacV47yMvs4hFW?=
 =?us-ascii?Q?nq/ZclHIDO2jndhdAreIRFIRSdQqWyHoWo7Xy9ldqKZjJeuygJi5rt2yjWD9?=
 =?us-ascii?Q?RYkvGIZxtWy6HpoHkggF+4sJkWlAJSP+tZfTnetzUWqpOLxvMpU8tVSB9SNR?=
 =?us-ascii?Q?GJGHunK600jOLM+weeiB65c5xLj+M64sLJ+s3zldoXaN0qwk6ADdlUkgkF6H?=
 =?us-ascii?Q?hXxg1OnaM0bV0CQwH/u732yz4DnboC0ZhOZ8wNWNuVraKNKQE7aRnU4v//O2?=
 =?us-ascii?Q?divhcoHA8Eli1VOt1Ue7HDgQARFNW4mOs/Z970uKooTQ/75iISVG2LKg7JyP?=
 =?us-ascii?Q?YfABEkriYFm/152N8M66XAe9pjAAb0INJfY8VgkHPKkPdTDPMM0fcjkF/jDQ?=
 =?us-ascii?Q?LDlFZh5hm8Qgf5bAy9gNtE/gBNpa1hXyvF89c7n9aMb9pUYscSm+TXNfXrN9?=
 =?us-ascii?Q?ReMyaUxzTUcRCIocUfUsO1Ag282zC+rQZWdfLJ34qn3WLPmWHeEkHt+aEI+G?=
 =?us-ascii?Q?/OHWIh6bhbTwUJU8oQK94amrFw7GRTajQb58gKsw0LHq7gIXQBde7MEnLkdZ?=
 =?us-ascii?Q?b8Xgo21K9zmvlkTYnZq39P3ZOfbRbOQOzVAl5Lc+IbU+FeL2R4tnO32zv0er?=
 =?us-ascii?Q?ZOuI84dSrJjnB4cobnWaQ3hiHAU=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +G6vXqyrq7y0/sMMecszkg/s8XAa+XKa4cNKoLmmoYiF7fROAv9OlRtQK4DKpZ/pP7Dwlyg/MSZqkQe0U0naZ33MZCG6cpyyr957LVv6ZiFIBtVJz9ZtE/RcMTcJZl+d7RW3X+zKLUhihuQsgwoyPVO6wuEXs2Uunx4svJqZbhDYA2Q1ZBsp5qKKpg/2mK+4NIgoMMQeSf7jLkgpFazVvZrmTyYNVXijnlKOGXkfbOlhZUL7CGkHDshs7TQHjcORn9r8n7AAXYQR19r6czeIO4Z/X1+RBLfNklGd0TVJg2od30E46di+CjOLrKZFCY0bWLmsGa2EYI3k7PDmMgagcpGm7PX0DVvAypZt+orZy3W0GblcBjcWfjXVmfQsmmR7CrKuorzXj434a8XUDSxbI8FhfWF5tT0SK9BVXow1DnMr0CohaC7lOQNYxlg7j4RI
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:18.4940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb80ad4-c6f5-42b9-8682-08de60426f5c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVX0PFC71B3D6A1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,kwiboo.se,ideasonboard.com,kernel.org,ti.com];
	FORGED_SENDER(0.00)[d.haller@phytec.de,dri-devel-bounces@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adrien.grassein@gmail.com,m:jernej.skrabec@gmail.com,m:onas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:upstream@lists.phytec.de,m:d.haller@phytec.de,m:linux-kernel@vger.kernel.org,m:adriengrassein@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[d.haller@phytec.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[phytec.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.628];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,phytec.de:email,phytec.de:dkim,phytec.de:mid]
X-Rspamd-Queue-Id: 28549BE9A0
X-Rspamd-Action: no action

Assign the dss clocks in the base dts so that display overlays can be
used in any combination.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../boot/dts/ti/k3-am68-phyboard-izar.dts      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
index e221ccb30e95..b8d17bdb7685 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
@@ -298,6 +298,24 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&dss {
+	/*
+	 * VP0 - Displayport
+	 * VP1 - DPI0
+	 * VP2 - DSI0
+	 * VP3 - DPI1/DSI1
+	 */
+
+	assigned-clocks = <&k3_clks 158 2>,
+			  <&k3_clks 158 5>,
+			  <&k3_clks 158 14>,
+			  <&k3_clks 158 18>;
+	assigned-clock-parents = <&k3_clks 158 3>,
+				 <&k3_clks 158 7>,
+				 <&k3_clks 158 16>,
+				 <&k3_clks 158 22>;
+};
+
 &i2c_som_rtc {
 	trickle-resistor-ohms = <3000>;
 };
-- 
2.43.0

