Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A671C4AED1E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9648E10E5FA;
	Wed,  9 Feb 2022 08:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C7910E5B1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpSm0dmEscaZA2JegRIYfIzBaRv17ac5+LYZYzOHrozitPbmrEf8VwRWwZ7QuOP5XWv16BsU7m4a5NaZx3dRGjWSbxAFlbtco4z05ph7vxgWO64cXRN+K7i9QFlaVweYGo2+Ja87bGACa37mLMi296vhTzulOXlaFJhF9tDQrzsGMjvaOqK/ytftm8dkkSrfDk+WkjIEfikf5pRgAVyKAySdD3GHJJe6GlYzWmqyPhoQ9LNYQZLSZK0xnhv94YqAtc5yPnRQ7Z7Lsz2LDO5beizLZhyGuFrCfpd5l05Gn/5l1ppMV586PTE9oyHae5CecEKApP10g30jzqqV/V58oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoHFNvqb0jv3J8as9pJQb0e8fgE2Vfvfy1zsGXmEqls=;
 b=OqIvHpj+i8F5zhGqjCSRMi+l+3LyVPPFT7PrDufg+eVMFeUeLnH7/Qy8hXNUomvuybc/9dg4UERI9AEJP5GVuBygjOKLjdEOL84mfQkRgmwKLkWh5xosWTQ8YIkcqqp218w1PY9IsKb3H1yDVFNICK8+a0dfDKryCGLaPpPMB+NDTybOZygSD3WRK2yFlT32jJbnYqVB0GwF8rivgVtWGdekFfvL92O1C7MhZ2jrFwSsHMP/v2PNFHCiHYs6SXm93TTx3BFmkV10+IyprTFbkmgBM2H54wM8uWaEoMNaObH9d/L/hFnxP9nD7HCJJ4t5/XEK73894PccX0hnMLsVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoHFNvqb0jv3J8as9pJQb0e8fgE2Vfvfy1zsGXmEqls=;
 b=MjNLRsPy8JJdNmopEI3xfEFSu8APrC5y4Qra6dfrflQ+jxh5VneKLGAVeOnvlCLw3RjMtsI1bE6FzPwYJli/mLMjFdICoZjMFBIWJuA1+u1Io+dugptcaqm33ej2sEARXOVtREGd+skEsXw+U6vgLRD2wTQRZT6OnNWEX++zDao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:51:29 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 08:51:27 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v5 2/5] arm64: dts: rockchip: add gpu node to rk356x
Date: Wed,  9 Feb 2022 09:51:07 +0100
Message-Id: <20220209085110.3588035-3-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c048c59b-621d-492a-1e11-08d9eba95b91
X-MS-TrafficTypeDiagnostic: VI1PR08MB2927:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB292766A65F7EE09F6A1A2D5FF22E9@VI1PR08MB2927.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lQH+t2Z5XgDI1oUUf41KDIGWU0kW/rOdQvpJ+HxpTrz4hkrMar9kwZGmkyasp8d4eNPFMNhDS03iGEDr8QXeVXmSpkedxqheZS7qt59/cqP/MVggi1SZCvebgVDFkYFIuDXPTHKYoNHVGtgA7NGl8HYTHwqCvbfYL33+5EYgpsyLJ114JFA9dT67eLn9Rg5nye70M2mQR66+9FB8toTCBPEtWbqOtTHfYcD0Qg1jr9ZtHaGD0f3ShvWoXeajHZvsYzipKQldKc4iCjB6jcuDfv7aypslaVNvysud4fPBKZ4i2/EBFpvexzMKQTRHkAOMyOtsBjg5YWgeQgjbcYtQCoB3PuGYb2bBnL42DBe03mNOTSiPq2tSa74Ez6D+TZC4vy8c688TQYvwwUh1lBuUfFEzqX9trnWD5EJtSCN3qYFNPAQ39OSCNFVdnIRj2GR5846iDc4UgUrRx6k0f58RZF6Ve72yAEteYW16PVFW/Fbqxvedi6GDRxmOLqcQEm6bta+3cMNZDswzREmc+fXV1MFIHQU07QNXutTugPjBVysBIPqmD0OQ/hDBX7p7fZA/oY/e52HEaykovQSDlozqfcOJTZkRtXQOoHsjy8YqcF+cshKr8W1yz1rC0LCL4/3qy5QEwCuXb5wSis4G46ONw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66556008)(186003)(4326008)(316002)(66476007)(36756003)(6666004)(44832011)(8676002)(66946007)(7416002)(5660300002)(52116002)(6506007)(86362001)(83380400001)(2616005)(1076003)(8936002)(6486002)(508600001)(38100700002)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ERFQt+yMcp5NG7/ZDTnWPT+ZtWQ3bOdGIxi/z05bCWoDNyAskRg2dlkhj4Hn?=
 =?us-ascii?Q?784gN/iOwZgMB2PwgJ6nO9TV9lmmyLV4vtZWB7OzZBuz/9bq3lph0YjLXB9u?=
 =?us-ascii?Q?km1fisdYK+1kP3CZhaRlsHciXEFHcTjAsJDVRIU748JSp4EhuikEP+8cWs/x?=
 =?us-ascii?Q?KcV1uID+O+VkYRs6qm17e5MTqjle8UTNoWf24BLlTTaqF1kjAxUmFJz62K4C?=
 =?us-ascii?Q?f73SjXgyTRQJs9+6/sZVPi4YuXXxSv1os2Tr3qqJJAdrfDqdzjJvimG2pWS/?=
 =?us-ascii?Q?Xig6n3PVETweiHq6B56mZUGKGRcLXbHPZE+iav6SxBto4IYWpOgQE+Rz3V5S?=
 =?us-ascii?Q?/gZoAz2SXbfZVJ2Yf4sgmXr91EXjwkPz0jtZxKrdJ+jj1EblNtMNDA4lL47I?=
 =?us-ascii?Q?AuaZciiwsM0KuYLtokGRijzOo2h3clq79SMNKRc41IaVuj9gaQ9HihXMYiZ1?=
 =?us-ascii?Q?bLA4fUyoecF4yW+lXe9mKxPBPM9nTnUoLS5BtQZwlidxsuYiE1Chm/egGfNP?=
 =?us-ascii?Q?gdfqD2lpINT9MqWQismh/XkYyPi+ZzIXrphl8n9BTbw5CS3xLwDHqDqqUFyU?=
 =?us-ascii?Q?acg/HtsX30UvW18hxgDfMXrOxy768N/4Ov2PskdAxJ+rzcU6kxKhKlCSTviS?=
 =?us-ascii?Q?xJLCr+HYYFPqVGtfGLlnwZrVeoGgwUEQgeWQUTiGTPaKJIyLt3jyo2Kw+r08?=
 =?us-ascii?Q?vZg8baUjgp/gc+wQOrHbzalncznI6rW4OmOsCDGry9kGsSJMOQtWA/j7JT1X?=
 =?us-ascii?Q?IPbZCjeGHwoMFSIYL502hUCwHyWQRsNZAjcsPMloUPbDXLp0LpLl5XI6Ny7m?=
 =?us-ascii?Q?auEelJg+RHomMwASR3HvykWb+6wjWbspf0lVHlUsDFNRaBE0j0R/1WIUW7Lw?=
 =?us-ascii?Q?JxfLLF6sK4Kkes5AtpqfGKD7JUDFtHjWne4+XoS2K7YaN/FqXT2h6Yoqodc/?=
 =?us-ascii?Q?xC8rtsU3TFSnVio3YCOYthpku1g/8m15clcjMIHxGa/dCLuADvN0fa17hP+M?=
 =?us-ascii?Q?zU3FB6ACrwdSlZJkk94CPnqxmsTuC7PohVkAqVwsRSw7KsHhLDdCjIz5Up/F?=
 =?us-ascii?Q?UvrlseKaj48LyrPABrtl/Wi2SKSgwzVdyYZKx/kuRppBKjWV2aA3OEvQ5fcv?=
 =?us-ascii?Q?1zQijIHD7EbY771klrw8AX2k/IdwgWLmu3Otte7JwniKADohtE5PkrXXTZjm?=
 =?us-ascii?Q?Gs2odK5czrPnGARjUWRJ11SsJRzQGpXFlk++3maYppiEuFtGGEBvmNo71cMr?=
 =?us-ascii?Q?koRnaC6w/BO1GP6zvRIlX8psS19CgZoOhzf2k8BSYFGjgmk+d3NTjT01jaAd?=
 =?us-ascii?Q?9p5/edaMgnkaB1+3sxBW/y+OPn6yi1oL6LXOSI7zlGJkedCjqcXn5198vlaB?=
 =?us-ascii?Q?dTzwTbZ6Y+QUWjx8kxXI7JOgJlKr8dR5eLAjXOYTlvMyiSu4yXHWAFJHi2Wq?=
 =?us-ascii?Q?96psEBtFzs5CBUaC5vMxf8P3RZG8ljr4pj50XwvdJCLeuAGWCY9llXg6LJUL?=
 =?us-ascii?Q?c2WWIv1Ro8yK3CdRcaaFz5+KJ678KXXbL3xNBIb9O3fxLFjgO7BsJnbuSRPL?=
 =?us-ascii?Q?NQ0XM4rJNREF5AXwv/zix30NyjZTsbRPrg0/lWmcd/aVhpdarM41Z707psDg?=
 =?us-ascii?Q?C88pCIx91FlSLolX5Fz9e1laseq0+dwKauMdHj8vw3h1sMn013roPlFS1Tdj?=
 =?us-ascii?Q?OijpAZJSWYxf46EcWBuaFgKVmWEFOQhi2V8E3N9TUxAdM7vBENUHHnDBw3xf?=
 =?us-ascii?Q?x+zNnAuDZDsURKed36KxVNDz8AOrWRQ=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c048c59b-621d-492a-1e11-08d9eba95b91
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:51:26.9279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SViyvLkMS647Pc2sPxz2dmil059dIeQHmKK9NOdCrQfjcVnrZYwgoE4MfEqKpgSemjBi6lD0/iRI96ZqZShLuYhKHk9/8K69uhXjMh2Q7Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2927
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
index ff1689283996..47484305b7a4 100644
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
+		clock-names = "core", "bus";
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

