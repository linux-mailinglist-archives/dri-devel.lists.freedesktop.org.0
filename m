Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAC9MbUbfWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C78BE9B2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7187110E951;
	Fri, 30 Jan 2026 20:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="MdBiUYFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020102.outbound.protection.outlook.com [52.101.69.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E710E383
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 20:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbYMHhC4xeixnf2B7UCayMC8XTtIX0ya56OJFnag2GZ4Sqpv4+YN/xLGObovmnJ0mZ6eg2az1hoG+7a39ZhBODY13W/Sg8hZTj6dXioYQSgKId6710x8T0pP0VJAsa62Jxhq5GUh4ouYihjYvByRfdbLmTqr4qBJCFMiMiynODZcCIvdm1wvZGHcqSJS+EhRdqQfkmw/Q1ePwU+0Oc80LyEXGeZ76cDesg8QFAD+W6jNQ25LwMYG0Jak0GNhj8D5LOQSKD7NLnFR8lo/XDzQ+cLAC3Hwx04JYbikU8lXnicpDf7AdR3C2tZvcZ9hE/M8KLmsZhycBNQjQCKWBHNA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcfMCXqhn0XTS6DP/Fu5klFJ+ex73AKBIZmtgAMT1L0=;
 b=qWPtAZQIOYiwDuQfp5VYCYel+fGY7Zu+gASoIIiMTMhOPn4hIURMaqcinD4ICynUjDRlzIFbV261+hqBMOSA9SUPKQUiR1hkFehx9icuHwTZimsno5uA93xRZlyxMy7NfkVgGhD2oNal0to2aVk7GQMv04cuUx2BDefCP8kvdBPPdibrLP/f24tUpb5c9BbxQ/KQv+EiudFdPW7cUSrAeh/zX7PmMPpJfd374wOL6MxUL1/Ge+/BPWVXXBIhQn74hNMipvt+O/UWLgonnlpau2uB2D/RjpiytSS47fop0EpfaeTOtVDWzzrqIz/GMsWpaGeEslb3gpWY1tEmP1mdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcfMCXqhn0XTS6DP/Fu5klFJ+ex73AKBIZmtgAMT1L0=;
 b=MdBiUYFhkA7POfUibdBZpuYnjsShxoKm9+yMe5639h5+9nqFFDWyLIGmoP7RaUwU/n1L6q1Wq3tTOzZdM202MfkCDXVUmHZdoWO3lw05BDdLOZ/0ey9+cpA1MC00kvJFqH0rUJkLwzzWuaKl8p/SXUU7f9W3Q3QoZVuUCG5hwZqoFhopfj34wlsBdSpI8a5lz9rjMPsdWRad3+rG472EI7xHjIRLYP6numhsXx57c2mj53G6TfUtkzgLhlLpbVqkEftMuxSY0SzP3vHHsqjuhDbO8EEvfWI4BQaxcqTaYTUWFRCxQuCjJqRNO2ewV5e/eQGThmYqzATHpq4Ix0Qn/w==
Received: from DUZPR01CA0087.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::18) by DU2P195MB2398.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:493::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 30 Jan
 2026 20:59:26 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::50) by DUZPR01CA0087.outlook.office365.com
 (2603:10a6:10:46a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 20:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 30 Jan 2026 20:59:26 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:22 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>, 
 <Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/6] arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
Date: Fri, 30 Jan 2026 12:58:13 -0800
Message-ID: <20260130205820.83189-4-d.haller@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|DU2P195MB2398:EE_
X-MS-Office365-Filtering-Correlation-Id: be4af203-5a0c-437c-95d6-08de60427425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b661LuzFDqiTHVZP0rgS++adAuXhAI0Tvn1gSZ7ejwKLal17eAA0I6fx1Xsn?=
 =?us-ascii?Q?MrgURSDuWWrrNgEEq9I2z5iCbeCVuY2yX7T0Nc0mJFiqQJIwDKlK8WGD1/Gm?=
 =?us-ascii?Q?6I8Y70QygHBnDkzi1YMa56rX3FwoaYXuvHOn6f+LzXItkPm81hbEPRy04Jo6?=
 =?us-ascii?Q?dAkFpDgbKVsiG5HOGAYegyvZITUWQj+alMOk6JcraGimGEmDpunoztlTuTsm?=
 =?us-ascii?Q?AN/XlP8HDt2DuDqo772SSoTwnAf1OG1nsh01OlGRcsnHWJ6mffJ60chgatqT?=
 =?us-ascii?Q?GLCnRCbJPZ849BEJQT4gix7X0WXcx9D/R88h3GtBybaPRi24rv9Ej9u+EKZo?=
 =?us-ascii?Q?yRMS9VOuBVYuzmFFnMuWwfY1+mIy7dWivD/+wTVhulc/XkZNZ2ngj+kFPWcU?=
 =?us-ascii?Q?VWcidFiMI7+N+Ls5QH27EQ1XlTrcTxB2h+wWcj0/G0kO8w98XMFdDoCkb65Q?=
 =?us-ascii?Q?MMNNF2Wi2J3ZmeNOpXHjJx/ChkJrvfqhBXDtBjXq2BCWl031IquDJzOF/18l?=
 =?us-ascii?Q?B1CT0WpjDcmGDslmv8wHqKZ+KnMNPbuRXoqBOIGMfHCTNM5tJPLRIEehWL/n?=
 =?us-ascii?Q?GyNO1iwWhtov4eO9Hay1O/PDyPgiOOfWBiIKZ8z2oZB6aCdEv2s+OGZsbYHH?=
 =?us-ascii?Q?7GGfx2VVIAYWdDBieN84JVJoxU0K1W6FYsHMQc6RwIE39sFUK9VCNWGV3kLo?=
 =?us-ascii?Q?t2rPTd+gcBQQbM3a1XZY2r7cF7d2oG3+M2rW5PlC4CSkYijyPlq5dgrDIRvy?=
 =?us-ascii?Q?G2MMdLGVQgw5qu+gtfy0X/yHEHFt4Takc53XaKXPQuokATYSqyzWakZbpK+j?=
 =?us-ascii?Q?9nMgykGN14Z6wKQ8s5H9iHCFPLCJX6xfDJAJb7XHKGj4RfrRwfVqQbhHvUw1?=
 =?us-ascii?Q?XXpB7rvrVSORt0FGSNUOspOQHHtpouWnTkglbIjMZM4H0FvSObysyUJA/A5Z?=
 =?us-ascii?Q?y2YQuAjHNW7U9Es56bz55LciV1LqMHM2wdO4Mwv6YBalCM0kQPhpH7uLJ4bT?=
 =?us-ascii?Q?r/e+9OcwKY2l3ECkvn2bP79/OavRpD4IpS0H618cQTiAXmLzNV9j4yQLY7Xt?=
 =?us-ascii?Q?PBm5cIQX/6T0ZFwjC16Yhrbb82WHKwAXs+mCwQner3chiB18BgG164SOd+cf?=
 =?us-ascii?Q?4WN8QwwD3RGyCmTIsXmDDcDPMhuC7HW/wbEkQ3I1GMTVk4SDv99SiQSDbIFz?=
 =?us-ascii?Q?J10ByQCM5QDqVn6uaMNcVk/aSWMpl0NI+Rtmd10Oy6Elyfjq7aVZLtiMDAgJ?=
 =?us-ascii?Q?rqerJGWJuKWMiuXVkbK1Dn95+7PHB/3JCi53HM+1jvySmhdateIh0r3NXGZj?=
 =?us-ascii?Q?3scdgF0qqXgzOEFI5zQZisXX/8MC7LSnpbFChwny23ieqI2YwZS1I6blYN5L?=
 =?us-ascii?Q?tgv0Pq31j5fjdo+VmYuvalQlRcakoDVBfcky/0ItRq+3IApT7kh4NR0Q8CIG?=
 =?us-ascii?Q?qyhJLBTHULQ/Y3VpZhl4DlHtqeKBkqbg4BjZWnJArYSKtczrP8DuB+elNxIC?=
 =?us-ascii?Q?pai3dBUT8dN65ZcEM+YQ3RiQ4DC5icb7Ro+Ym3EXutUnLx9jFJmB/hti5muu?=
 =?us-ascii?Q?Vc5+HcFlMAR9MlgTDxwFFbT7kCpyH7o69y9Yrga5L0h1S72Vqk8eDgdQjNvI?=
 =?us-ascii?Q?605SI1EKs7sG907i72EWiY3ERQidpbCpNOtodMLBhOnedv1h2DfClOcYBmXu?=
 =?us-ascii?Q?X+eEAX7Sx0z+XoB12txAGxzidVM=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PqlWHu/PzmYA+Db0yc9CX1Zqt1KOtfMbZBzKsKla242VgqnUDu8eyi0xCO1F4ClTGmVIvaFhA81j19gWXBJKovQX5e9BEIZa98mkTEo4jDeKqRMOn/dYCwNs2zW5eLmzdoDcPmH0p0jmLWffHm8843v8EXLJKsCySfxwiXKeJ5CjzlmU4CprsAANxtI+f9lLxKS5wfIlAU2s+kPib/p58wpR3cOl3xEPnYdziH36y5n4yRYCSk0fghQS+NmX1uGxoISuog4RAY549wu8nBx0aLZnzH5NfY5o8W2MbKykOPS5TfY6Tup+5EOTALABI2zdxj1Nid7rN0WQZygcvq6YC+SoiWOEHnICioa9VIxA2rW468PvF9fJHKD3hBDXe/ikY81IfcQZB7Yq2yJMFNrP5e8C2tAIMZ0V6Gx6QLpnk5La/qjsy8B+9D5L+vFJqcWS
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:26.5224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4af203-5a0c-437c-95d6-08de60427425
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P195MB2398
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
	NEURAL_HAM(-0.00)[-0.576];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,phytec.de:email,phytec.de:dkim,phytec.de:mid,0.0.0.1:email,0.0.0.2:email]
X-Rspamd-Queue-Id: 29C78BE9B2
X-Rspamd-Action: no action

Add an overlay to use a powertip,ph128800t006-zhc01 10.1" LVDS display.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..a188e62e32b4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -132,6 +132,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar-lvds-ph128800t006.dtb
+k3-am68-phyboard-izar-lvds-ph128800t006-dtbs := k3-am68-phyboard-izar.dtb \
+	k3-am68-phyboard-izar-lvds-ph128800t006.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
@@ -319,6 +322,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-kontron-sa67-base-gpios.dtb \
+	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
new file mode 100644
index 000000000000..1b161e53f680
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ * Author: Dominik Haller <d.haller@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 32 64 96 128 160 192 224 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&exp2 12 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default>;
+		power-supply = <&bl_12v>;
+		pwms = <&main_ehrpwm0 1 6666666 0>;
+	};
+
+	bl_12v: regulator-backlight {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&exp2 13 GPIO_ACTIVE_HIGH>;
+		regulator-name = "BL_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	panel-lvds {
+		compatible = "powertip,ph128800t006-zhc01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vcc_5v0>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&panel_bridge_out>;
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	backlight_pins_default: backlight-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x064, PIN_OUTPUT, 9) /* (W28) MCAN0_TX.EHRPWM0_B */
+		>;
+	};
+};
+
+&dphy_tx0 {
+	status = "okay";
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@2 {
+		reg = <2>;
+		dpi2_out: endpoint {
+			remote-endpoint = <&dsi0_in>;
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+};
+
+&dsi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_bridge_in>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		dsi0_in: endpoint {
+			remote-endpoint = <&dpi2_out>;
+		};
+	};
+};
+
+&main_ehrpwm0 {
+        status = "okay";
+};
+
+&sn65dsi83 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			panel_bridge_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			panel_bridge_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0

