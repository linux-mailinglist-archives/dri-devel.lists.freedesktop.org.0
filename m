Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECA4AED1C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86C710E5F8;
	Wed,  9 Feb 2022 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BBE10E5B1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U66RxE6yQzFLvGwzq9L6H0L5e5nR/IRVbIL1skqVZf8ze43CUPYAzN75tpz87T3fcN36OPUV0KIQF7nnftTTuUTHcMuGqDa9PmcUZU1qqekRu2O2nYJ6B3ulYxXjB97KhS5Nm1+X0BXdjOYYuxIWqrU2ff0OSDpcTONO1w3mLrQxAVAbXwdvGWMzFX/6Jtud3t1pCNX6mMawDy0WJqkk/AOQFDCBIabfUwka+lRSx53MiRtH1AKN3BXMf1T4AUeHInKja+G3IK/j0pFQbqx4tjkE0WqCixAfbR084rE2OZrmdyCI4yGNkpXtfFN2ZE0ALu3ugZL02DgcYJR85gAPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2suP7M1Va2Ir+ctJZL0kaA1yx080mTOhx9UfUDqQ/dc=;
 b=gV92Rev3e930wpeXjgBTDHxKqzFq9LgTefaE4ynUuCL5nnkDindOIq21Ev9VngJWWKz9G9+rOE3emaBEOOI930FRh9ySZv+3PypYG91v2gLG8EJ7UlGmBaFSvB30tiA6uSr+WCo6dFaz2F/MTvTSOyJq5KtihdDB/1mv4Nq7draeFfNnYjOEAJvdsbepcOvCobMCwfF9ydRjM1yf9qoSPRRKkSomGwrVml1HeOzkX06jDA6nJBGENygjPT6KFf3QVR5mp6duHismUycV2VTtCAj8nCWt2oCB+pRH+1l05qUi2KD/ZWrdaoXAWRuYCu8nBA1xqp1RFNWTEBCbaPakhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2suP7M1Va2Ir+ctJZL0kaA1yx080mTOhx9UfUDqQ/dc=;
 b=t4ZqUE5bsgSfkqp4VBOh4D4LrWndl2znTAcejP3qerd137Q/FJrbwDJrgbvrQWYWKN99IW5Xe8qTu2BsPP4o3cDSOXGjOiXNvokylIdVL7GjWowMyjMTs9K8VOJXtkYlltucnMff4+fUwDhiN8OujkLCeVJvSqZleu40yh1wWzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:51:25 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 08:51:25 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v5 1/5] dt-bindings: gpu: mali-bifrost: describe clocks for
 the rk356x gpu
Date: Wed,  9 Feb 2022 09:51:06 +0100
Message-Id: <20220209085110.3588035-2-michael.riesch@wolfvision.net>
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
X-MS-Office365-Filtering-Correlation-Id: d4a78839-0035-4383-1e03-08d9eba95a67
X-MS-TrafficTypeDiagnostic: VI1PR08MB2927:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB2927405843FD148C55197C93F22E9@VI1PR08MB2927.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aujmJEyHFrRCPjyyvdL116c2WOiU9Zyk2Jn38v3fQvxoTQqQ4plqnlWPcqzL3ViSq+o3RoyNZUYeE55pJyUg6vGxjbdcFmyLGvNK++R73PFvXiPQ9RVTmQO/XSsp2GKg29RRhYg63zvFdcl5VSzFMAAxWxjfzkoGGKT8lyX2pCg1oZOQwY3YQj8+Xs1PNu7m9ROPG6ztDREOWq54tmPnXL57XJ3vtktw1N25YS9d74hvSQUMHqkP7Nez6imtAqSzlzt12qJRDa4y/2j9bf+M0P4C/qr5KXKkvQHSncAA1xjdQnUJKfbM5z16EA6ky4CZ9c/PSXlVqLHFxi+zI4yYqbTXNQaqKlx0An6AfjnYBlO65xtfxes26BhUOHnXP4brb7UL8TKXJPMWUpqtvCSe9WBxq6U9cvOCpCycSaesSMLg0LNWjaLTTX4IDKolU4uC58PcfJbl+Fl23k225MfR/R40m7TtqqYc2tLnxc9LaSDd8SuCMSHx0yca39ssLqRPMBGxG6Ngi+HzhtufIxmXff+7UNBJHkgDY0HzypVqEU+P0rrgtjZF58hKLBSlz32jAPMufztJNVqzXSmN5Pgx0MiQpJR+1JjJcSPv4dX9ZW1ztKrwJo8MDbv//LPOJyKRYQEN9Akb/AgdRRSeUIC75Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66556008)(186003)(4326008)(316002)(66476007)(36756003)(6666004)(44832011)(8676002)(66946007)(7416002)(5660300002)(52116002)(6506007)(86362001)(83380400001)(2616005)(1076003)(8936002)(6486002)(508600001)(38100700002)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y+mM8shedqmjsrl6jvche8kxJXdI/QnIjBu8R5hK8+dTS9kEZIRJbXT3XGSc?=
 =?us-ascii?Q?qEpqlXF0t21+Qtb0pN6/AZRI/p8Zmb3d/Fsr0/8A89TonEIdhHDXgoAWbnoj?=
 =?us-ascii?Q?ZELvLb6N3I6js3ecwGEG4AdTh3jilaFIRAAlnFmvQdCl4ys+MqkcwGiw1jWk?=
 =?us-ascii?Q?FWOiTBG2ur8j9+Ps6H1JlebxvjDi0xKZRRemyD3rs0rjtt9L2ho+7DceEC5V?=
 =?us-ascii?Q?FG376macjpW49J9EryJjOp6aN0tbWxwAqhCpkho7MZC5THSvpClUpwLtBbp/?=
 =?us-ascii?Q?NbAkcdaXQRE3WLiPW/mgkgY6B9QDbz9wfG2L63J/RrKZU8yfugM0AuG19Qj+?=
 =?us-ascii?Q?aajWpvPrMxhi/YOi1OxZ+3DsZHrFWm84qLm+L/1S1F3QJXRmsVHxxtlGVrgs?=
 =?us-ascii?Q?d3pJObO/WLda4wOo7NawVKhe1/TBxsbbV30wCrlY5Q7Oqo+65tkNEDYCFk0B?=
 =?us-ascii?Q?Lyz0yYr0kX2DBE0WRfNm1pw3boSMzRQph1ZZJLIDNeNSSoiqH6NG4GZQ4kpA?=
 =?us-ascii?Q?c4ar7wtWQimF1j1Z7Js5LTOSIQAnL9mSlwD6UP8h4ZUOUoT88U/ZIRk0esJ7?=
 =?us-ascii?Q?JZwKbmHbXqIvcn8GABt0DZPl5Qk8UnVuMGBmj91Rz4IwOMKyhPocg7iskQ5A?=
 =?us-ascii?Q?G1ML1lFYTHbqrAJs0t1NcQkdheAsD2lRsq7dNsYOkcvMYn3WsHRXnZro4CMG?=
 =?us-ascii?Q?KzgbgFaYb0AwbyXon9O/kIE7y78k8Hu+ilSU+pINOJA8CrrwlMfpRPH0O0rJ?=
 =?us-ascii?Q?nWNG4EK3Kw9iTAPygBjwTYGDv82MzNvnd6T9my79+XbVzx1eU70KdCEluXvj?=
 =?us-ascii?Q?Y/aTWMXrJWFKrSPiFRRTdhlTdN3QiVjFWMKuPyofzioi64A61nKqKSgqjLIJ?=
 =?us-ascii?Q?JMAoi5xfmiFO6Ee6S1joc5DV2DDPiH3JQbOp+hg+q0DV/7Vse0yVX4KkIjXz?=
 =?us-ascii?Q?D9PzCulh0kHvK/30zjUVyNln+1K4oOjTyhWCwHTRtcI50y50TjDRc497VNWP?=
 =?us-ascii?Q?3WRHHPHy0eiyXMkVUTANcTx/9Cqzm+tR3xxMuBnezDrWyeBN0SBrxx+/CZcI?=
 =?us-ascii?Q?11LE5A/7YiyrtflD1fsN7cfqGhXtLgy9mm+dhzEURo0INcrv2zsM8xOzCQiq?=
 =?us-ascii?Q?QXAb5c2YEFBp01KSx74O4bXZO+MBBCHZxCgIQPfoAR0l2FhODHwQe2sjmpYL?=
 =?us-ascii?Q?2NADD5SmoWLpg6wHXSKzcszTIGtNbDvhGuBOm242mJS5wLNZkXsKKX1pVGfJ?=
 =?us-ascii?Q?RIKAONqaE5EYDFyQy0vPfqlcm+1fHjGOD1Jdchs5yMCeVWs6m+EjbLBk9h3p?=
 =?us-ascii?Q?jgoUXbAR1aVychPyKIPqF8ZlX+mkcAiACldXIOFjfTYjLxamjuBtNwe5ogCF?=
 =?us-ascii?Q?9fC7yFrOPV+U+SuEulxBbZ21/zPVv42o06AhGuu44ic8SwacBJKHzSrhv/cS?=
 =?us-ascii?Q?a5dUQxWvZqt8xDvW+ienZHWCFsDBV/3yU81eUj2UXtSIdxTFk5EdXqMutjVR?=
 =?us-ascii?Q?LEyGKvAFo4pZki3idFEwy5ozlrxT2EjK0KOKprEMCO9aHbh5wXO79eBfqFDS?=
 =?us-ascii?Q?r1IER9WLWvWYgMg8QNR0h4YQJy8kKGyL6X1YQ98CvZwBlanZ/eWxLnNz0yWp?=
 =?us-ascii?Q?hAvX+c7fudgg9jzXJxtfJw/VYPv3+5P8lmE7LQdXoXV1W3tGfQtYRuftOqFV?=
 =?us-ascii?Q?/GKRlr9/G3jTVriQ2NamqoTAiCppt/jc4PqjwHbk90m63In5T4k4wAkap/XS?=
 =?us-ascii?Q?DaPmSFF3rh1WFf5gzqQ0tQ7aiG4IeYE=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a78839-0035-4383-1e03-08d9eba95a67
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:51:25.0374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPUJ18d+a7F3/Zy60rDdxojI05zICad/Wy9rVZjIFMUCe9v+HMIjJvxSl85vLmiGjbHTsv3iNM24OqLmKELxqvH79BeqkYIw7OLDILQ2LBM=
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
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Bee <knaerzche@gmail.com>

The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
Reflect this in the SoC specific part of the binding.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
[move the changes to the SoC section]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 63a08f3f321d..21409c8d3813 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -159,6 +159,21 @@ allOf:
         power-domains:
           maxItems: 1
         sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mali
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+           - const: core
+           - const: bus
+      required:
+        - clock-names
 
 examples:
   - |
-- 
2.30.2

