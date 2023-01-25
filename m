Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97467AA6B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BC610E725;
	Wed, 25 Jan 2023 06:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2087.outbound.protection.outlook.com [40.107.249.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1141510E726
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQTR7EYvWdb4Dg3vfJ8ZTtZeLyC4LVf188DYusDCn0AujS3XrmW4rRc82KumRFfGdH7alwucXmh1KinJSHna2y7HxfFeC2Y52XWOxHGuW6sz5kHtnnCW4DDtHffzKXvLKDAUU/BmIA49v7/31SqOjdpH5ahUZI2i7mwwrjp8AM2j385Z3BmiSFF0sKGaGrAz/cXSdlBm1Uwufz5vZ45JZNPdloS0f1b2tDMdPFIIx7Q9cQXOE9t9acuKkPIqZ8DZKYnEnpZByL9RuNQkm05H3LTg1VGMIVIBQo2k/hVUy0hnbwtlYKmVK4/slso3zmgMigLSOvcKYkeIj/4BaXW1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq+cFXD7FBBQCU6mFRvSqHGaz7C9gb9wkJtW/XzzXcc=;
 b=hcBGPWF6/GlKoTxxKxhaqcb/Ah9ISNbwjl0LM5ppC7SkqIjwYHQORzBi1TMNmrhmjXsAXlUSs7hNiQN8ccFZ2G4ykTTu9F+3KqdKAjiqA50NlkxAy281jXBg2bA+HVSjmuDsSApohf8dYXwn+S5dtT5wVndmF6FMxP29U2xPbe7Lb5+AZaBLfvL4i87lzG9+/eS50cz54nfcDd1qRGpOFOLVE87meHxCq0urubg2HfoB96rcl2C41cqPpiikrSWqFpF60gwOenslJVJpfzaqvlCokrFNS3E5XSphtPMMU7bKKwGu2b0Y8PQ/KTi5UQQtxszDpYoGtI08Fs+dcdvagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pq+cFXD7FBBQCU6mFRvSqHGaz7C9gb9wkJtW/XzzXcc=;
 b=GEgO+MuNoP81iapYprCvtJC3QUX1a6k6Adqsha73xZprV/BcxSf+D2Hg4YewUAq2YpjSXbEoxey0tzhJ9/XZ15Pu6NmeMUqlhftChTo0N3eJncg7ahqYNtVErXhQMGGIGFrXxLIluMVzMKjE0eTjtTIG+uA1kVbXtAJXcuQ5B60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Wed, 25 Jan 2023 14:40:25 +0800
Message-Id: <20230125064030.1222121-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230125064030.1222121-1-victor.liu@nxp.com>
References: <20230125064030.1222121-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 23119361-6b99-4666-ab4d-08dafe9ee677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmQesd/pZVy+9q00H/nJ2LOiRKTs7yavORN2oZ0UVXQ5a/Alb2qOkUH8wer8aJlQVrd5KKwfalrfeyy3JOinF0omvCIwzoPCDNxxyVV79FLduaj/lsfSRELpHbkWfYqpcOTD+awQiNhrPBEqAc71UaClW0iq7r3t/wH3eVB8cvGf5dkIvvKMytMsKVMgzgJV4ssL8sCJ82pXgjlOJ7Sp7J+0aK2m/1d7fNUKyjB6Wbp0QU4fJBt9++aTk0h3IFJZH52vZeS4U5RLmLK/CzC8MBYsAYtyT/RbMsLYmCf/k9mO8oOmluJOYxC0zuaNVbkUeVSocI0+Gji1XsfrV3VQhpPXARZipAuZH1z2a9LuxDGmwSXHN8gUqSusNZPxilKAxdnFxNJpNAyK8j1lRiKASr/gmSWq0BmsCsdfvjbMxJrWNdIhfCzwTwIKYtEeG2JR0MwQjsjRl6Biz20s5MBCBznjoGbfTD8FBQeQmFIXnreu2283d2DhVMDu+MTxgq9JUlcGJ6oS2o+B6XDVtCknavjTQoAa5rg7cmOb7WKOlq30Y/fNrEv9H1LqVwNIHFlBtFLu771cQTxunwg1xtsFuFdm9qvII6fk+sL7nkwkEAGl6qT2sjoGvvIfpdsOZemTWXfgz/PfPJ0VdnBuw7gEgEAg+AKHE9BVLyhozTOMFnvtfQHovabWHtOOGRhAd0EBwDvNpuhamIxPk41upiEKfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(83380400001)(6506007)(26005)(6486002)(478600001)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dx/Cug6BmatsQQbnhpmP+3v5EfP7M3KPNSyt7s1BOUfeu7sgun3olc20EH8K?=
 =?us-ascii?Q?9nB6nYTa5jc4R8zRlvAWfazLh7RhQ6ndXluUJt9Ld1B9dzEvY3BOWqKeQgj/?=
 =?us-ascii?Q?/j3sqt7vRMFGEQ6r5CnMFm8tCvR01YaroN11vCm7P31H3XeU52+7PIlTdqFQ?=
 =?us-ascii?Q?Is+XI1KS64iEBxHTn2VkMnN0ek1OWRAWPFtkbMueFBEI52p0DsA4gqYzgbVJ?=
 =?us-ascii?Q?jvwcprQrj7ySJPAYxySuFZOa/HcOtUptxM9MYOaL0xqRii2eKM6R1HAesSXN?=
 =?us-ascii?Q?IlCCn7RabhYi/THumuwaEzGCVv3tuDCjRx9AfVGy71DraYGzrgeHpMdtk50p?=
 =?us-ascii?Q?jjejuVY/dfL6yw1yNGmlZ212OvQem3o5BbB7RBOdM19EdyFPwWATJbOkwOLp?=
 =?us-ascii?Q?ACrFSX1uw1GKtP6LetdDJ5UlEUFPPjde2bxtg9rMUBVhHimzGACAw0yok/k6?=
 =?us-ascii?Q?Hu9cyx3eVtCty8l1cQYaLd+1LfVkynAxBUhP2Mfuz8WsYyt2PwrJqjjONrZa?=
 =?us-ascii?Q?nC1l3yX3KRit94ykKuFBGqMXxOke55w888GRftTfilmLbXS9iRTfhTaiSLXK?=
 =?us-ascii?Q?uN4kpzbklHNZ+fCZfvULCLMtg0IWaYntdZHwsInIGJA5eE9clvBb71ooRFvj?=
 =?us-ascii?Q?MpxPmTSoWSew7nusKaHUXcEkOT9khmshMASNWy1JN/qUvbDd6WJYOymby6Nh?=
 =?us-ascii?Q?J6dYYic7mSkDKT81+KXlfBd3rW4qMq/y74qkzL3SFYWjXz5lgj9hOtYXeBq2?=
 =?us-ascii?Q?SG67B6vJDD7FjdguAE8o1dCseb5au7sWbrSndRzJ+82wrrprbJnbu5DI0jav?=
 =?us-ascii?Q?0bUwnbC0D9ToUoxv33OgtNw6szByb3RvsiPD34v/U+b2+jo6Ia11XxnuNHo8?=
 =?us-ascii?Q?qZdBmDZCW0OLx26DGIVK+MhxcGpCGMvhiUli28RD6Snu4dmFTVjGapwde4Ln?=
 =?us-ascii?Q?ufFUcMXad4+3XScs1ZQzwpVETHNxMTJ22ITL0P9aY38SF2eQhbbn7WZ6E782?=
 =?us-ascii?Q?eg8NUvfGGKyxAbqHl7ykpde3lZOGmYzn7rTYq99MGvs1yUDej+J/wsG2toGw?=
 =?us-ascii?Q?pAA1wAt82limf/togfTkfqndPP7lLojTF6fkfuZRbyZ7+5H1jF6fuYcJsfJl?=
 =?us-ascii?Q?zSjEwipfvVhia3BQo1IiHSq3503FVKi+XEQ/CnFbirbNQVgkkoDigUiwrFLO?=
 =?us-ascii?Q?pwy/ZOZVvJnFGuf4wlQWWA4FQ7QXH5ffsc+dCZPayMM9Acex5GFwYdfYIBQB?=
 =?us-ascii?Q?vbOw1MogwqnlweLURaauTpTNE7Pl++XELiW2mDAVj/UfnIC1IvLRbNvlYRvt?=
 =?us-ascii?Q?Vfwo5SgkfePdTMqZQIIN196Dgv5PinZvQaKPQbPfYbWLvj46LUjvTrZNUmvZ?=
 =?us-ascii?Q?6SpMwv4yvFCTdylB44lt4Z4RhTWQcLYnqdhTVqGCT3p4fbClcC/mcW4CBOUu?=
 =?us-ascii?Q?HnzJLI/BgE+QTV6Kogp9QletksYtDuysK0JnyvHioD5Ao4qmxRbXRisu3dDA?=
 =?us-ascii?Q?Kp/m9KWAEuswd762B5LZurKqhRpbOmdoxLw+L9rIJMjUY3U6avJdATAf8z4R?=
 =?us-ascii?Q?wIlzDgzf1Li0NN697FQgu3ATnrgwlRsHR6f11ynW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23119361-6b99-4666-ab4d-08dafe9ee677
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:25.3892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdxTfgWj3M286gPCm+yW7JBt1kDq3osFt7mTu1dT4j5Gnzf3YqOlFFCKQn5cCqke5oMCUQDR0RCgMSVitje3Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is one LCDIF embedded in i.MX93 SoC to connect with
MIPI DSI controller through LCDIF cross line pattern(controlled
by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
directly or connect with a parallel display through parallel
display format(also controlled by mediamix blk-ctrl).  i.MX93
LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
tree binding for i.MX93 LCDIF.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 75b4efd70ba8..fc11ab5fc465 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
+          - fsl,imx93-lcdif
       - items:
           - enum:
               - fsl,imx6sl-lcdif
@@ -88,7 +89,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx8mp-lcdif
+            enum:
+              - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -107,6 +110,7 @@ allOf:
               enum:
                 - fsl,imx6sx-lcdif
                 - fsl,imx8mp-lcdif
+                - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -123,6 +127,7 @@ allOf:
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       required:
         - power-domains
-- 
2.37.1

