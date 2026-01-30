Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOhyArwbfWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A27EBE9CE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D7E10E384;
	Fri, 30 Jan 2026 20:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="lL/50IZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020107.outbound.protection.outlook.com
 [52.101.84.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728E10E383
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 20:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugQ3EF2pJrBIY5eoFZi2NfHeHbH6zEBjXRK+xaZnIJusq5ZwtDme2sGVBbLxvk6x+QNWknd03vFFhQIBKybOFE5g1/54WSrF71zaeT0Wztw9Nj0fLXClhlTHLybLPlNjALHZreNkfe96kPXYWrBmMaAQF2J34edZHNs8OLTcE+LkzixmXpQN7yj2H8Phu8ywqusUoIbV4iOOsH/uIgAj2ym9joJIX7NKZGybBE2eBD3dfH+Ym6GqcAQzyqKd6Y4zPI9E6Y0CCLTR+gi/fj7Eef1INlKnXLP+hhFel3TvZ99+Eobw3q5+FpDAn6ZSYGXI7rsbR0ar8zxGBlqPDWbBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=;
 b=vTZWmLFD9OIP4osruUpyQGomZ3lJ12XQVeEWxzYtBiA7VeJjYI7klfpKO4LoxaOkI1M8JzmhJ5dUKPHkLE3tt1uNE/tH+v31bC2n0NDIGB/GAfECTV2nfgHCuIeMotAQ1NwFDWYA1XS5V0ggpqnoJKq76pW9ALnmh3DF/uOyB1dr6RuRq201MB6rEGNR/D64nLWPuKMSQduxM5O0UQw+6c/M38pf6I7iEUAHxTMP5reu8w1spZZd1W0OA2Sjohh0OEk00FdmDhh+1wSOpd+R+cBc5Co9UJDzgJDWhLeJntwEgSjk2KK3iYQtxO0sRTcUXfZiB1qcTRXFs97xD0BU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=;
 b=lL/50IZfpke5IhRfkBDPSKrh+b6CZSau1rQ06Ht4Wr+/Vfv76CFPZkI2c5aLa0FmOZzCGLEO7TLy0QTVoWfyq5igrBOFoPHzPiJCtt3sTAE3O62wP8lcHQfJpmUq+ZzaCmptOa69RTw6OVFwjLwgvwwkxqbZ1qRZhtbKnxB5cWy4yLzuRVwqJQRTG/xXvouqxTyvqQKZO6xBvmvBkeEkt1txVPUAsQ2fqKcpT0cRx5x0cuBib/hACc3LDzF5Dw+/QU/dVNfinPlgPDF5ucPb4MEzXs5FGGL7XKo/cQ4m3cYacJ0DEne6JmrVqQGktC02fwngJdlGw64c/xgfehS63g==
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by GVXP195MB1736.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 20:59:30 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::f4) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 20:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 30 Jan 2026 20:59:30 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:26 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>, 
 <Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] arm64: dts: ti: k3-j721s2-main: Add DSI1
Date: Fri, 30 Jan 2026 12:58:14 -0800
Message-ID: <20260130205820.83189-5-d.haller@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|GVXP195MB1736:EE_
X-MS-Office365-Filtering-Correlation-Id: fd48db40-2a43-4045-e10a-08de6042767d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OuXK73xKHOs6wRvxyo25UER4SUV6FHXZNe9asmGcmjk/mG6635F29uNbet3R?=
 =?us-ascii?Q?1U+SovLg/BmkhtaRJnNV92qXFSk+Z+uaCHoNm8Vdq00rQbNMWtzwCRPIvC1d?=
 =?us-ascii?Q?T8AeEnQY5Pxx3jgY0oZeNv0TsSAA3wPsCCbfd6YZx9DTppSnmW9KPN4sPaII?=
 =?us-ascii?Q?19BHlIdvOCoSuNwmGHDcRaAlsW1ESNBII9yTqqwZ4jt2oBHwQYejLxuidY49?=
 =?us-ascii?Q?poUfDClksjGIMElWkMg3c/zfv6O5w4k9CJK2PgCtl1h9YIafSgIaoFo1XN83?=
 =?us-ascii?Q?5KNost7cwfjohb5znqzlI/i8ZhsJc3yuK21QYudz70OSxC80M/lmDORtfNxY?=
 =?us-ascii?Q?5YpdL3ViOiQNkEp0jJebFJFRhXV8whkNXAlbC9PypIzM09FRIE3FXSF2iTu+?=
 =?us-ascii?Q?NM8L1tZUj2GBH5oaqoruDSbsWUc37SOn4FaLZFOeR1UFyiXR4Q1bXZgYNTx5?=
 =?us-ascii?Q?3b6Y2HG5voL9bd9LhqNnxZmmcFMTKrJ5Fu4e+sGTa7BifNkJiXW8tlo3Hd5E?=
 =?us-ascii?Q?rXnfeIxGtAAFwSd7Qn1AEUX9Pn2k1/1MCVzMeoJH7tcfQaXYgItY4PMiWQgJ?=
 =?us-ascii?Q?3NC5OnBl1QeeT9b8kxcp5ZFRHVhtNpulRuuzG8MNfo8yGWZRkHBm163WamYs?=
 =?us-ascii?Q?iwQBh9CupnGgequ9wu+EIP+1/50tCdqMqCDmGHi6suaRCFEHlqRrFQAI5Fh+?=
 =?us-ascii?Q?BuyRIQdPKfA+fI90BZKjvBnAac0SI3LRd4uc7CDbJj7QV7+zKdarGHg4IkPq?=
 =?us-ascii?Q?dZt/IIX07QhfCci5sjfabinevRVhUObYRS6C1LYUYt7CAwFeqsOewH9v1qg2?=
 =?us-ascii?Q?Mto4TY8WOWey9N6pxoJ+BCcQz6R1bSDubtkYslfvBkZQUR/ogkqUlnLD81nG?=
 =?us-ascii?Q?wqVU6bm/oWH/WB3GpfvDPUyTRQL8yPI2IAyfAPzVb9oLbb6zBj+LLIT3exIq?=
 =?us-ascii?Q?A4I71SQcA2lSeT6uw1LTRyqHCB3x0mOOap7rFAJ73py6bTnCFCjRp6HkT6Fp?=
 =?us-ascii?Q?lUuJDFLcwEHSE8Nr5H/m0JTEnTgrzRwGRy0BbQOgQQpuSvA0pynuxrps58R4?=
 =?us-ascii?Q?j4XjmA0Xp5EiKDvHLKATMkYfyzP8x0NxPm+xVsz+1vWdrjEnjn1RFLaJyF25?=
 =?us-ascii?Q?4Alr6rgsz7S/Fdlmz3kXQBt3zS4Awc58qsY6Q8XNVgKM6FLY/DYdJlHEDmW9?=
 =?us-ascii?Q?d7vHtOxW+CtjXIcEUGg2GXDNhaxLm7q+NlzTTbURncSOQk8CiZpy/7rACt3G?=
 =?us-ascii?Q?KB/vavNAjcr9y5+N2WncsUw7CxJQvyereu/RdfI++d/cLemlXGnRs5tvolA5?=
 =?us-ascii?Q?OS0gBZtJ+ycqdAeulNolNHTHIvlmLxQewg22HKqNv9q5P0E4LvY7Ylw/furx?=
 =?us-ascii?Q?CVt0NGuhnd6Kyz/xIt5uCYYq2BKkf5dGIjZKaD0fDf3RT1UcEiJt0Z3EkjIY?=
 =?us-ascii?Q?imMjUmvJNt9Rs+BfJmblaPSroGKY5fNpCezGk6SUT+LmYJcbdzL6lcsFemCl?=
 =?us-ascii?Q?zWG+0nPpfx+aYOr+/ieNFFkifcDSQ94OB//o8Q5XHJHgNmKg1ipLCIocSNAY?=
 =?us-ascii?Q?W9oF1q18eV5WI2Co3fv0AhmFcCubvp3azdiewEJqtJ6qqJmTIZuYtEGx9LA6?=
 =?us-ascii?Q?7J72KPYIlpGg6rg5z4MOWfMYH2Uqs2kT39vAeKrTpLJ1NVTVxG+9noB8+Yc8?=
 =?us-ascii?Q?v/XhJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: raHKCGEjxH+GSCOrOeLq39DJALe5g6iv5l/y/dQNZYEo7H4azG9MjZHv5l7pkLN0kXB+lsffZbOcGZwZu3dDr1XBgMxUAKlQgttiIIyZ6CTrJsP0PGkag9Hfi8+IHN8Eq7KgAxlzJhXloxszQAfHVmNKr+AXifCAEp+Fcxh7Hq0uJEKzAlL2bMHl2dX/ZnWnngYnr7he4DfsUgSVweWMMpS8Nm09mbPTKf+RzHzjncU3sfrbp59NBOGJeySrpLPGwWXuHz6D5dEe+JXwi5Du5yrn0z9G8TYLCREbRr5qzBqXwUCk9JlXya+xydJXJZzEqgdBU51ciVbpuwx7niHbVi+EwiXLSwekUwqdzvZUfOmTz3XYsPepjZZ+hA732/4uVu1y9sohcF5rpky08/cDFHPeSUHl3zEePnRkar4IqvB7Yh0x7bR00DTKHB6x/6aD
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:30.4557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd48db40-2a43-4045-e10a-08de6042767d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1736
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,kwiboo.se,ideasonboard.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[d.haller@phytec.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adrien.grassein@gmail.com,m:jernej.skrabec@gmail.com,m:onas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:nm@ti.com,m:vigneshr@ti.com,m:kristo@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:upstream@lists.phytec.de,m:d.haller@phytec.de,m:linux-kernel@vger.kernel.org,m:adriengrassein@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d.haller@phytec.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[phytec.de:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_PROHIBIT(0.00)[0.68.92.0:email,0.74.196.160:email];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.511];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:email,phytec.de:dkim,phytec.de:mid,0.0.0.1:email,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.68.95.232:email,0.73.62.0:email]
X-Rspamd-Queue-Id: 3A27EBE9CE
X-Rspamd-Action: no action

Add the second DSI instance and its corresponding phy to the main domain
include file.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9f..80a32c451d1b 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1815,6 +1815,19 @@ dphy_tx0: phy@4480000 {
 		status = "disabled";
 	};
 
+	dphy_tx1: phy@4481000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x04481000 0x00 0x00001000>;
+		clocks = <&k3_clks 364 8>, <&k3_clks 364 14>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 364 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 364 14>;
+		assigned-clock-parents = <&k3_clks 364 15>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
 	dsi0: dsi@4800000 {
 		compatible = "ti,j721e-dsi";
 		reg = <0x00 0x04800000 0x00 0x00100000>,
@@ -1841,6 +1854,32 @@ port@1 {
 		};
 	};
 
+	dsi1: dsi@4900000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x04900000 0x00 0x00100000>,
+		      <0x00 0x04720000 0x00 0x00000100>;
+		clocks = <&k3_clks 155 4>, <&k3_clks 155 1>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 155 TI_SCI_PD_EXCLUSIVE>;
+		interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx1>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */
-- 
2.43.0

