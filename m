Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D24AFF87
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB21E10E53D;
	Wed,  9 Feb 2022 21:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AF110E5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZwKFZAvIcH/usRBsdnJr354EbH0diPRn18hMxE8hmjYeKrcP/k7Hl4a2tvfrBIoB+4Q3Sy6TUDE44Qr2OwtLeR+deUL/JOVWyf9XC8fGG8XvaxY861xZca6WSbxzySVxFXG23rKxjstak05BfGgyWxovJ1Bi/F8y2t5GzaWus4ezyOj4saL+JswT77A8nsVBD7zBzmthnguYTuq5Bw+cPewRA6gktOqCKPfQhtGUv4I43eGDGoGzspjbdtgHrP9r5NQLJoCXmCzpByfrWCWkfV0DH2tVYleFfTj++8CRbRSgSbdhJC300aOAlt7iFkmHDe8HcMSKdlNhqyIJv41sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HEqSY99564YBUXrObStmi4N7YBFLburRTVPEPTCo3E=;
 b=N4GZ1fCck68ahleohoNjrcU5imPsevGWYZ7tWPZL7i4KXu/qvWOAlmjDJn7NPStvOAM1+tk1h6nnzt05CcjSqGV0zfe0V8DoQRDJOyzaSfZUTx/9BGY/sQLvazNCF90iUdvvLyAeNznkUPRgRHSFT4LtX1zvDlHZbtlYB6Y+llNspeOaaOvWJWqsfWmeZKmZwnteYbDKkE8Htl2PuaM4O80mbjyZDGOvobsoYlW3nI6f14UMgPCCmZJzSAz+7kmE2X1V4pd09468teK3PLDugz/OFX686Qeprma9SmSCiW8CzP+rr5Y21Wtu2/tfiyF73/2P13zpsyYXEWpEGSD4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HEqSY99564YBUXrObStmi4N7YBFLburRTVPEPTCo3E=;
 b=uslJbxBekQ0+iu+dxg0wvqieQPoijoEd7dGOzp+jpCaCYEAGIE2fRYNBSZIZKJT4jlRlcv0xXMuRBGRCqCp7RPTvOQVXDhyMg1UIs2pUDSvj+qHKiHLPULpx+1r3gegmA8iApuBWkjw64mNlvnXbjxAqFf5cNvH3cSxQNR+BeFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB4575.eurprd08.prod.outlook.com (2603:10a6:803:eb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 21:56:06 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 21:56:06 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 2/5] arm64: dts: rockchip: add gpu node to rk356x
Date: Wed,  9 Feb 2022 22:55:46 +0100
Message-Id: <20220209215549.94524-3-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209215549.94524-1-michael.riesch@wolfvision.net>
References: <20220209215549.94524-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0197.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::8) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc481682-3152-45a6-a9f9-08d9ec16f8fc
X-MS-TrafficTypeDiagnostic: VI1PR08MB4575:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB4575DC23B3EAA88AC87536B8F22E9@VI1PR08MB4575.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aK6qfnw4RikqbqpmRQ/CMr70Mxlf6TIU+NWU+cA+BHm4LKNZ7kL94Ic5y8KkGauB7EiQJO6GbCULoAqTzXf4zPMDCwPulpXE4Q7Vxm9J6FzFu31AfwtUP0jo/IaKX7ankNOPk79xw28iDSxw8kM7pW7jamQd9PJanHyVlUsy8PYxSc9OpCPV0033hcF3wYugHdqO1o97BDgQ3jxKz6fVlTEAIHP7SzHGYwc9DSyMZGFoZTsp9tMN2bkxDOh1cOoeCgANI7wXRaiPYnChW80EblkqOB34Hg9EVxzO/7a62XrEtiIiqcTYWdP/O9gm/mieIutPyLGlJSHdcpkAAiI3YBRtbzqOlPr8WFMfVRpVGGnrlZFPO3KsEU2569GFfiKpjtzyuf6dNdbhnTa2LOKXrBP4bsoF+Hae3AJVsFFHaT8hWaPs3maof3hf/T0/13y7QKkUfYRm0pkiNuoNly6pG4/XYbpzRmoEBs7HEIh2mxWhTOV8YiJWEFBm5S2ep5gbDsprN/5KudYMvwq/QzOp2mJmoc+se7X5qtQOVbOGU1Aea4HQ8s0GauUBK6iba9twxJ35DSmFhmTa7zWUa6IF5ARrxS7Zt8uu7L/pDXIS5FreIoTaKYyXVNUvI2RvRacw+4neyRP5HCgbOiqwTey12A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(2906002)(4326008)(508600001)(316002)(54906003)(52116002)(36756003)(6666004)(6506007)(6486002)(2616005)(44832011)(1076003)(86362001)(7416002)(66946007)(66556008)(186003)(8676002)(66476007)(8936002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?poajkVAnLCDqHOvV1rjvOGY5gxxPNBH5TD2wtrp1kTxDcaU15YOALQpoKPGF?=
 =?us-ascii?Q?csr/a62QJ/MHi93UNx+H4OOhLCAPFTcyTHFNCo+61A8e5U3AisriKZAjjXF8?=
 =?us-ascii?Q?agYMLy/0wIbqBaas3jDhAmL1GvYRmdeLDdHKX0aPN5sCUxYQ3T9Ei+hkDDCy?=
 =?us-ascii?Q?l7rbY2vOT+gda01Yf/QZHjglXfvdI/ckyMZl31ILzYaytOL8BjpCG/fTbjwT?=
 =?us-ascii?Q?/EKNzgwiM5W8mHcekEFA7iwWg6j218wLIodLZ7bHIcweIovAtv9tdD20MteI?=
 =?us-ascii?Q?IkuDUZ3eoMSGghVDt/Xf+4g5opS8oMAPr8VE8FW+kIkWeWfVXJtOAOXnf5ju?=
 =?us-ascii?Q?FchDuUpOXQ0cifMsTDBNMyIPsIcf6GdVhAmjDRY6LfdzGSFJh2yI9UJHVztb?=
 =?us-ascii?Q?AKdYp12fCihaU7OBHR/IfluGOmScOGSQVaKdMmy28KJxBdWPV9FqudoYG3tN?=
 =?us-ascii?Q?dvvtAYsGldmzA4Af6PsFgskGqaERuI4DuE8HsxGJtVUvxnq4i8yK6sCh47S+?=
 =?us-ascii?Q?I+hczaP+foQfoTE2ZQ3lXzn1nQvoWoqCiRcp6Xq+rNGvhHvLLvIHG9dfZGXq?=
 =?us-ascii?Q?SLugYK2X5deCZzzS2uyQiJfANkSt8UL+34LsJCZKrXvOevIpApGISAbiknvj?=
 =?us-ascii?Q?6/rOJ9fipBAgYblOAacEJ1+c6K9dwWtEkYRG8kIsO5n3KqVqRKZeRw7N4ki8?=
 =?us-ascii?Q?jSER+YXGii0eL/3+6U0izeQLOw+ggIrTBaARnqFXwP/1Fkyu5LEClZufBAqZ?=
 =?us-ascii?Q?U4uECYlGx8EeptQFqjbM7syL/00McpYmgc64i4HlooigF9KiwNMNWRtiGbEZ?=
 =?us-ascii?Q?Zey8YszPraBvGzN823Rt7HwlrzCDR1nMWsUtNGj+yqDMtw677FdDHJ93nlfs?=
 =?us-ascii?Q?vVJXk9FDeEtUSRZWvvjhxUv5ySyJ2Z9FC21HZ3KVCePlPsZZCqh+cvnV+pZ4?=
 =?us-ascii?Q?cKACl4fi8Tj7TR0xLRG4QxrGGk1/JRXNf/92wLXU+ZHVgg/5AA7nmdpezioc?=
 =?us-ascii?Q?dq3eBwJyKPgwcB7f+U3rQlBfHrkd2F8j7NeqpuB7uTb1FedrDELpaki9IcMe?=
 =?us-ascii?Q?Ws3gMiCkohTdb+O0vN4lHsf0crdsBIDKT7Vq4Qp+tXx8p0pK7eY0GjbwKUSD?=
 =?us-ascii?Q?1bvevyrlgfeRDhLRMmrHYkPxpJ9hQVJYjvxC2m1QrDsO68EaO87hEPafZKjp?=
 =?us-ascii?Q?D3xej6I7rfOKFQ2dmRs2R9tIghhXuAf6VK2oyCDxEnayfmSBTyutQgv2pBbV?=
 =?us-ascii?Q?vBQw9wWPhT3lGo3nsDiT4LVIshfomZ8W2Eglb8dD6gDPwZEfMEa7DX4RK9J8?=
 =?us-ascii?Q?iF1oAzQmNIB0MKJv8PBan9Cta2OQKs2694OXqCU+52h/fJRGwYZVaa8Xf19f?=
 =?us-ascii?Q?Auy/gayOxdhqT2Xq+PrgYdPXxE4+Qlza+6Sstp6iUIua9e16He+btlGIjwSO?=
 =?us-ascii?Q?3Iy8xAmxFFZNu182UNRG0WmlHfuEaySugwiPeRO4P9CnPuPI4WXP8+Lr7hkA?=
 =?us-ascii?Q?xkyQlW2ozL3dE1k7qvrq3y558iDBD8M6XnDXDv//ppP5kVqBpcVa0JbujaPa?=
 =?us-ascii?Q?bixoDcppWkLTaK+PBljYa/TumN3wtPicznYPY9g/aOEWhQGCUrJHU8Pi/jeJ?=
 =?us-ascii?Q?5A/JaMAAUwlw9E6E7sPYgAHc4pu9ORTCDM2p+Ill08aXU974p99ACD/YM+qD?=
 =?us-ascii?Q?C1jQ3Rztp5SyGD+n4NAEyV9c2PzeEY8IYydG9BWTP6YXGB7UP6qFhHgJ1Lwq?=
 =?us-ascii?Q?dSrgQ5LrbHrJ63tZB/k9GHawvYSqtp8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cc481682-3152-45a6-a9f9-08d9ec16f8fc
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 21:56:06.1629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5w+oLRr84eksY5rZsRTyuRwk8mlXkXMFSpNx2TV+Lweir+yyRNNE3+AtgpuWUVHJ2juAx3ZiPdn2ltRCbXnDoiuVgO/3oz82bYracmqlK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4575
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ezequiel Garcia <ezequiel@collabora.com>

Rockchip SoCs RK3566 and RK3568 have a Mali Gondul core
which is based on the Bifrost architecture. It has
one shader core and two execution engines.

Quoting the datasheet:

Mali-G52 1-Core-2EE
* Support 1600Mpix/s fill rate when 800MHz clock frequency
* Support 38.4GLOPs when 800MHz clock frequency

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index ff1689283996..50bbea862a6a 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -144,6 +144,40 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <900000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
@@ -444,6 +478,21 @@ power-domain@RK3568_PD_RKVENC {
 		};
 	};
 
+	gpu: gpu@fde60000 {
+		compatible = "rockchip,rk3568-mali", "arm,mali-bifrost";
+		reg = <0x0 0xfde60000 0x0 0x4000>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&scmi_clk 1>, <&cru CLK_GPU>;
+		clock-names = "gpu", "bus";
+		#cooling-cells = <2>;
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&power RK3568_PD_GPU>;
+		status = "disabled";
+	};
+
 	sdmmc2: mmc@fe000000 {
 		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xfe000000 0x0 0x4000>;
-- 
2.30.2

