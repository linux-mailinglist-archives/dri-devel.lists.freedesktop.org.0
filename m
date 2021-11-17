Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C4454A3F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D5899E9;
	Wed, 17 Nov 2021 15:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40072.outbound.protection.outlook.com [40.107.4.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCFF899E9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUIVL8Mw/LMB/0puWf3TyYeHA7a/7vPSurId7GFsToKrhTFsSnuY3ABWHxwVbDuFGgINc9pGDADH1JfdGojetr6yyLu91YFLo9Cm/cx2CECdd8fSQNqDzXOb5kGy1Bofu5wXUgXm1Cn6i/ReVs22LLi0CbBuKZwRTNRpxRyT0Chfu4gXPIR4zpjCg/79YDxgQsHe4kyTzSwfA68HcIZb2ZHqllppDWoSkSXEipzHJyzBpcO/G/tihMW5wAIULYCKchSR59uzRuVUMphz+j6foMJFEQuX5gBKV9c2e1EJeBCBA3hVBr7Yffqx8l+/czLQD2DEMP45tR7IUOc25ZcCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBk6Hk0VOsiWk0qCxl/3GnGnXvkws/0uXabq4pgD6/I=;
 b=OBkDzI2t/HL6cdleJOQxKpNU3JfhvUXu+lYWvkvMlUtZpGd+0E0FY90uvWmlXFuuuaGmmsCqAruImtwnXMb0NsNdaOmgv5w1k1gYy+RvQjp79dP26QF9xSUL7CJZw4dh2xIJ/asGK5FXcz1ZquRkpKBbNgoJqhLp+h4mCsEIeA2Njpxp2sNI45ROUi0sX/C55qWe/nFb5yr4BNO8cx4YnrvifCSJESx9SRiKuLFKalBsfIO9NhV7tM4+Lid0h5dnrXcHCHMaooonLWXknSOLacLTmD9QxBWtyTlVPozFPXxHaQ2eeLPklHS/UWnirbkVoahqhGW7wFSQfreSANZLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBk6Hk0VOsiWk0qCxl/3GnGnXvkws/0uXabq4pgD6/I=;
 b=iFnSPhxvrkryf+u1EppAYV/XigbcrngspzQ3wvNhjFrZXXinhj0QLsdi4b7S8tcJN6nXUUin6ekug90p51oXnyEZci6Sr7rTM1NZdku3+nmxozXmwWXsFogXDg1IZ7G8qzNxRK4zyibghID0i3Vl9qzs+eh4bQ6vsznqlel3sHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com (2603:10a6:10:c8::19)
 by DB7PR08MB3721.eurprd08.prod.outlook.com (2603:10a6:10:7f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 15:44:41 +0000
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::a9fd:7c7f:72a5:feda]) by DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::a9fd:7c7f:72a5:feda%6]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 15:44:39 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a
Date: Wed, 17 Nov 2021 16:44:29 +0100
Message-Id: <20211117154429.2274443-1-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117143347.314294-11-s.hauer@pengutronix.de>
References: <20211117143347.314294-11-s.hauer@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0125.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::22) To DBBPR08MB4523.eurprd08.prod.outlook.com
 (2603:10a6:10:c8::19)
MIME-Version: 1.0
Received: from charlie.fritz.box (2a05:1141:1c9:7c00:2971:328c:3026:3149) by
 ZR0P278CA0125.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 15:44:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11adc9dc-ba6e-4b17-603e-08d9a9e12a58
X-MS-TrafficTypeDiagnostic: DB7PR08MB3721:
X-Microsoft-Antispam-PRVS: <DB7PR08MB372185A66B86503E9859727DF29A9@DB7PR08MB3721.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiUv0fg/Eqj+LjHYQE/y/5px9fuE1ATr/MwKqOfdrH0vALiKNlVwjbqf+waUBrM4+sgYx7/JU/UYbmtkM/vI5HfgLGyRdCbudvIdjh3jNrjAMKHWjojf4ebkhAAFpZoj3C9uNJiv81b+yDaPX9BxJFcLdUOmu30Isl4CJQTgQvXQ89iFzAIIG2RX3rp+I+K8w9W3KbsT2/7hITKoXQQv+nPDHoRAqa94WQVf4VGyV2czVS7sG7BVyHyeiWmmQIWLjTNXCwPpdco7/12TranRBO0r/dfkgQErq0MjB2Pao0pUVhXULn1v04udav2Ux1Zp9MNZGtk9SsWrmQsY74mik74QCiNYrUMER/oevLLLv7kstwsUYNkTkR+yd08haF2W7eCouIr1tNI59MtiFMnVE9/xFlNz2lNu5LDyE8WdkHTKXLWX/VM6YhoWpfUy2v2Q0XCJ0x8tsPVHG6lApgXatqH0+oOZH+brFQKR9WfJn+QG0F4V2mYwzaMjDv1HvTqrRrjG+vv8hJEirhrTnD/zfxgUfyNFaRUlNIh7GS6L4e2Ya2IWF7JMMj/U1S8aNWiv3TeGYVi+xE+eVnKjRhk2jRD1silHk1ZJBM1oHJg3iJKVjDYDaEYtlCSUHTzLRUbPZRlZjybRuPjebPNyQKos3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4523.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38100700002)(44832011)(316002)(66946007)(6512007)(52116002)(66556008)(107886003)(6486002)(66476007)(36756003)(186003)(6506007)(2616005)(1076003)(6666004)(4326008)(8936002)(2906002)(83380400001)(86362001)(7416002)(508600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sav42B0Zx5wELWroO0Us4TcJsJ65RlEM6ymObdTFYyIRhQvZ8eDxA+XfRSaH?=
 =?us-ascii?Q?RU3+v6rxdQQO0rWli9snM3ungs16zLfFCYAysdMJZZI3Oz5U5nKhX0StdoCE?=
 =?us-ascii?Q?MyUWUoU/84HNndtLvljFehWELsoSxQdDW/lwjgbPIMHukZukECy5uEJ1epJc?=
 =?us-ascii?Q?fxWfMHf5MemgjlJi3rmSPP5X2V2JCXXUcyL0xGFO1nVbTOkbfdTkLkaoZIPq?=
 =?us-ascii?Q?4cSxZOsKvybuMK9TfSNzH6YNsjxq98tGcA1Zf5kIT4VLFLhriCZbsEM7atb6?=
 =?us-ascii?Q?xnjaSkunlgVbDgq7SSuRjwafIyINS5TUL45OkNb2dmbPABJ5imsKTN4eEFym?=
 =?us-ascii?Q?4hcDQ93S3bXLM4AMpIecy7cRsAzqYn2qepTzIzxuGGsp0VIrPOMzngMvErLD?=
 =?us-ascii?Q?hGttnNSRb2yJVXK7TO/NicUkFzrw+pxH6pB41V4jXg725GWjqZ4B/Hw4JuOm?=
 =?us-ascii?Q?MHC0Ec9VSxeHREQerkHPPTzAtzk9HBcKM0fUNHoa0s96HLyg8+xkECs9k4Fu?=
 =?us-ascii?Q?uzLUFwDHnEuFnbx3HRrjZdjIAGXdQN3NGJbc8s+wSlYVIV8rNQKHmGga51AN?=
 =?us-ascii?Q?6e7JMeM0Q1hugrPcleXvKG6+7v85fIWcc8uOg8eK2A+vEEr2dQepun2UbQ9A?=
 =?us-ascii?Q?fwbgfWADOEp/MRJ29W61ctMmlHb2SVxpLLn+O/GqBpM/VY343f6vdDjorqSx?=
 =?us-ascii?Q?rRxDlaTeuZE25/iVaspi8JZeao2D3clb6d7bT2u19Y1Sntysxn68t+gEP5Mo?=
 =?us-ascii?Q?8kVbG9iSXGkkGzFXxdD9Tytmu+HyvGcIijRephhBcp+Z+a/j3zw+OzSFF4Lz?=
 =?us-ascii?Q?GPfi/TS8PbETbi4tW699L+ahF9l32QM5H5L+v4Pk/jf7D8pA5KlKXUeOD5vk?=
 =?us-ascii?Q?v84W86Wh8StUrn5+Z5RnfOse95A43J7OxRYT9b99VlTWaUaaaBn4ptpQ2mU3?=
 =?us-ascii?Q?Tq0zQH2vYgbhkjoAjYeTK/nvZuDPMkKQZnXiWrTGoaUHuwUvxwLYDFYd9dTL?=
 =?us-ascii?Q?XsYN1zTUMEEeD8JoVoxgO6kDsW2ORZaaGvwzGKa1+4pvl40Ncplc4rfmVkn4?=
 =?us-ascii?Q?rnCJHR2o1q4Qzine4n3TlGhzRG8T258CfmRPEbkFbtcg6BVAZV1vpHyOQ7XT?=
 =?us-ascii?Q?3eIZmKfAjpl9iyPZyCCTKmzaZ9xFP7A+O7IJKNxNK6bf+t5BB1ikrT4N/5sw?=
 =?us-ascii?Q?xO4hibuGCLAeK3vY4bL1xf+OYnngKTqDNvh1Yw6W7rVaLd9J3EWhY2sjhc5s?=
 =?us-ascii?Q?aE6jvTYlOJrDH1ABD9j6q5FVw9FcPSc82TUIW6FeC21l98C7Yrhq8/JSm47a?=
 =?us-ascii?Q?jKKhWVOj2HWMpRhicT9VQDKbCzhTSSbPTSHYK1Yh/A/HmhtrgD7LhF5zXSzs?=
 =?us-ascii?Q?dR7b+m4cje2cqpJf0G4RYveFXawPJPSHksvpN7bsok1SetU7/6Z3IqPhqjdK?=
 =?us-ascii?Q?hQ7PsvYoN6yaEdZrm2At+4BR+RJCc12fCUPBZrfyHrZITxg+XtkJMGEgfkCZ?=
 =?us-ascii?Q?0k3SIhtSZagTl3QW1J/Sjzlivsg2USCUNnOq7UK+7AfYkBCKxYgw1R0DP3Rj?=
 =?us-ascii?Q?uv10TMB8V5Kk6p9vyZ4e6r5K2emX1KTXhOMz9FG58w4oLW0BhxHkRVhQb9un?=
 =?us-ascii?Q?zFnaEfklZ6JAjsfvxnKIxmEVBtssTLNA+pYOfbjPJ52jVBW80ZHQAftKX3w1?=
 =?us-ascii?Q?NkqiOE469Q2X5bGY4aoCeOZXFQsp54bYX1rKSBp79u/U43CCEFZrV4K4MwPZ?=
 =?us-ascii?Q?M2YNi/kkzg=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 11adc9dc-ba6e-4b17-603e-08d9a9e12a58
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4523.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 15:44:39.4305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxV559LmtCZFmov2gL7pZobo8wup5YrofxKwLlfBG98ckao3WGO6q12zAoVS0V+fP2jnzfD2S7n+I/22HZuN/6Kgw5zUcK6VynPxwShiN+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3721
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
Cc: benjamin.gaignard@collabora.com, s.hauer@pengutronix.de, hjc@rock-chips.com,
 Michael Riesch <michael.riesch@wolfvision.net>, pgwipeout@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the RK356x Video Output Processor (VOP) 2 on the Pine64
Quartz64 Model A.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 4d4b2a301b1a..9fba790c6af4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -205,6 +205,16 @@ &gmac1m0_clkinout
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+	avdd-0v9-supply = <&vdda_0v9>;
+	avdd-1v8-supply = <&vcc_1v8>;
+};
+
+&hdmi_in_vp0 {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -546,3 +556,17 @@ bluetooth {
 &uart2 {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0_out_hdmi {
+	status = "okay";
+};
-- 
2.30.2

