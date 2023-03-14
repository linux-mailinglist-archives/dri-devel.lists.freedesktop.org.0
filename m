Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479216B9259
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC1910E785;
	Tue, 14 Mar 2023 11:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE0510E786
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0tCS4oKu9QJJDI7tHLwdkD6SNm3QAeh5NULYq7hFZRIn4MGyXGil0jqNGoUmDR/+XzaCLZMGwvGTnkpz8knmpUI8d3ncGMm7RsPRaNX7RorepkD1jCtY9vU22pBl6mPBQk6D9n4AOwCRVbxX7j1G/ptK7s7x8fzdFtKVm8MrMUH2/xkVEhABBuHQPDjVp8LKtNjCRp5u/zKEtJTWPbfrP/2oyMwu9D8x8twjgQLEncuv742H5zqTDySa57O7IM3WxLa0XMommjBcF25yFaMD3mVQF63WEhsjfuk13Tvvo+yHZK71zSxvLowVSvnXUl7ysVi1T9ndn26MlF1peKOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyzrg9ClFD1gCBL4xDfxIUxvo3lZIeCuT3Bu0s0q6mU=;
 b=QP0ctOr3Cb1VKxwtbx7wps8H60qffAgt9PecI6wp9T+MKFG/1oZuPcqgVXgP6iHjR/CvLz3yGSz8QA8bH5Z51ZCtlKx8JsqeJFH3icgROUKQ0P6jP4w3hYr0yVuGHJ3nj8PYlesneGfPIbr9/WW049EX+v6DdDxUL8lNwnHIukgnXoHRJZwHfryVy0ET0m6QvztTXnSMeUKPoLDnyPDy24b5kTw5iNrKIDj+4GtId1QmAdX1gIRdcs7p44zJPXhMElfuZGp3flxvoAJGev3c6SThP1hVe2ENIaz9IBy/hGcOH+a/FMyZZ5gCZUuDEDm7VzSEUN37I6ot/3lCJz+o5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyzrg9ClFD1gCBL4xDfxIUxvo3lZIeCuT3Bu0s0q6mU=;
 b=vt8NrAGk+0Wqp3Rv34iMA0/IojGkrm3ZsCofXbZBouj8x0N9KTbAKWxk4ZbWhPNSGuoGb0GXZ785l42Rd+LiumA5d4GlfN4SYtmQGl0GeEbqNXA+FAVin53iSW66UtRhJ5VunE+UY/tLhvlCKE9PKAxp/gf2hXwHdxjqrAP7eM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:57:10 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:10 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix, st7789v
Date: Tue, 14 Mar 2023 12:56:44 +0100
Message-Id: <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS8PR08MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eec2d57-fdf5-4ff9-e4f9-08db24833df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+jPk7yndMG9zzFLnHGquYyUAgIc1hPKRTcDaSbJJ+GQ7Q4lgs1FDJJmssgFtkQchAJIfCoxSl0xMPYnL8xsh7jYg6nVmV9S9x9L7RwD2pdfk8zBUtlQPBybL+mPkFP0QCByIVcnfWPrAcjKeOXVB2/9Or2rV1Z6RsDTZIOrEykQ3ybZ1xXy4xxt/dFYytyNjYIqkUq7I5XV93zl3Wbxh+csmmrDzmi9LcCOfNMpkGxEYKHmaK+kZX7pZBpE70eTbizuc1A0YZzqyGY6of7Ic3DAg6b2pWvVg+z/iBeccxu7WSrSnoPBLzNOBMbHxJ0h6/fgocEIQjxeCR5S6H3QazZYRpNFP/TlMw6U2LoiUy7A9RpMtkIXjxFHZYzCkz0vc7jFrtz0kOV0JnWLzH7soH/vKefi+dQrbch1YRYEjXPm1tRufVdzzoLQbsLM9+XrtP3PlJORq92sPMy7TEL1/6y+m1MlxRMfNVXjp8xHF71sFxKyqhyDSVghQg1kfLNFnfSWaO9ORrnCiW5xbmPy/JqwjyeJdjBhHspqbycV2HADUuvtHPqTXfUgwxzY4Ap+m0kRlYFFEGYQVWs0V+IILRM5A4GwpjpCKeniv/6X5G4hshojbi9FGt5Uce5pcHt3qdMpaH5KChW+0nZ5Y7xC2TBX7WXLR70D7ucBxNFn2121mOlOni5by8KiwNDekcumQR7NgzvejxiMIs4BVylyXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(451199018)(478600001)(52116002)(186003)(26005)(83380400001)(107886003)(6666004)(6486002)(66556008)(54906003)(66476007)(316002)(6506007)(2616005)(66946007)(6512007)(8676002)(41300700001)(4326008)(1076003)(8936002)(44832011)(5660300002)(7416002)(38100700002)(38350700002)(2906002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIctTdp6IT9lGQeUfXGsx6aBI0Tgtitqz2Q68KPYZdkg4sVD0zqPyU6Z6DiP?=
 =?us-ascii?Q?awEk0eifs/XQatH513JwT44Aog9O6oEbk0S4Itad1fmB1YKmwS+iuhaTMM5Q?=
 =?us-ascii?Q?gIw8NnjYxuX6xrQww+TToO3DaBJbJI3kGa9yfJ8hTgiXGpGG9oGrwKDI6vbc?=
 =?us-ascii?Q?Ayc6mCAIMc5YZGINwHZabUjpiN5xDACJJkeNRCHk2gWq3txd/9x2odFOeaMd?=
 =?us-ascii?Q?v4BL/Y8gKY07gnbqmGicpImsM4VM/3f9aUWK/1yNKttvpY1357twYJ7ZBwQQ?=
 =?us-ascii?Q?N2a93TpQk4RuUbnjJS971PR3goQua26yKvSnd76qT7VNmnVDFM8L2HOQS+H3?=
 =?us-ascii?Q?aEKnMLohG+YpbKOnWJrtwehE9zlCnjc1fzvqgb/ixgiaprWu62ADLvsvMjl7?=
 =?us-ascii?Q?J7zXp50pJuAri9SgqyMSrI3vNrLhC6vqucCmE4BNH309U+tyfM7/Bmiip70g?=
 =?us-ascii?Q?VmD4Hu5EtThiMs6rXH/rWGn7f1LGWZW/wkOFeuj/v38MY6Ni//yXK9fpIzAs?=
 =?us-ascii?Q?+vCJYgp6a3x86EK8hHFieEWC1+q5sscUrCLaQ/SPqTyW6J6IAyW628LKRAxk?=
 =?us-ascii?Q?ZqL810kkPehmNFcSaS0SVOH4gbmE2KgKGH8F2BVR2bZStbks7KFMsZsx9eaj?=
 =?us-ascii?Q?45+a4Q13jU5H7L3Z7dsRew+FU3owSYR0qHifOg9wQfAK4gYfstz0+h9fwcBW?=
 =?us-ascii?Q?pkv1e7ewysxfdvW1+WnvJ0w52rvAMOahHNshCZsbygjF1tYbDpBIf2kMLYJ6?=
 =?us-ascii?Q?YvB6Gs0+BcRiW9+6WR18hCVCczCMmDySvdtwHR693ZRuLlfMOGF1GANg1OgL?=
 =?us-ascii?Q?CuZ6kswEymFDMD3lQhEnWTSZ9T16k1Ugq8k5woaIThJ7VVR/USZ+e73dKo+6?=
 =?us-ascii?Q?EtexKl3x3rBGY11TALbYeLde1cQRAsXuP/siR9m1UB3s3TcG+hGh67DAt88/?=
 =?us-ascii?Q?PLFkRXLYDhrzww1cu+5S5xCEItInGuK72Y85uKyPr7uI8P2XGeOXVRIVIp2s?=
 =?us-ascii?Q?YTGCbOljJqIww0VZ28o8qAKvrFBvvvNq2es6HF4dMHm45FcCMTXM5WA4olU3?=
 =?us-ascii?Q?xT2+VcmDheN8IyzjLLPM9aRI25qro04EKQtKLX4GpQtBxAMkeyOg1mLrTcCE?=
 =?us-ascii?Q?hJc0Bn2jIHLxXN32KRwtuIZfv7aoIqR/79eyCrSkn25kzW9txhfMAK/X6x5f?=
 =?us-ascii?Q?ohLtQVT0q653AYFlKESBN5BVh9H2uI977gB2sQW1MXVZsGSNS0m+UuuWNh8K?=
 =?us-ascii?Q?XdrWW5PwqwpEL1ACwDeWhxNHJJ3ovXV0gyLq83FGI7V4vm6APo0aYrc4d4+C?=
 =?us-ascii?Q?QBNJ+ihF1CivU20EIpNAb0VbYFD8P9mzBeJiroYJJftr74U4ALXn5cfMDaMe?=
 =?us-ascii?Q?k7r7SXKjw+jMuqSX4poiKUIQkDV9IyvTNJ3TNt2vjGb/0oSUcX6MJOqZqdHh?=
 =?us-ascii?Q?lOYvuMrPd4lTOufXze+L7IniE0EtmediRzH6hHp9LX2Vlye3ptRC0kjnHe97?=
 =?us-ascii?Q?OEdvFUXFrcTZcfqR1Dq/M4gM21jl0c3ycQUdGBTahLWQIv6N2kKntwnzuHV6?=
 =?us-ascii?Q?Y45H8Al95V9cobClU5oyXZy45MDjob26oz+T0DRgLC2cyDRENXGUllUWdmlt?=
 =?us-ascii?Q?rKQk7vEETSPh7o9IBUVl364=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eec2d57-fdf5-4ff9-e4f9-08db24833df3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:10.3173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuII/TWDWdLnvurTZb7qisEo1xLTwo4zuvUB8qIcs4NdleyUHgy0b6D0m0yqidC97B0KWEnfavRLCeLBHWTodXOHpFJxwMSBDQTkLPRRm2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sitronix-st7789v driver now considers the panel-timing property.
Add the property to the documentation.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../display/panel/sitronix,st7789v.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index ed942cd3620f..8810f123dedf 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -21,6 +21,7 @@ properties:
   reset-gpios: true
   power-supply: true
   backlight: true
+  panel-timing: true
   port: true
   rotation: true
 
@@ -54,6 +55,22 @@ examples:
             spi-cpol;
             spi-cpha;
 
+            panel-timing {
+                clock-frequency = <7000000>;
+                hactive = <240>;
+                vactive = <320>;
+                hfront-porch = <38>;
+                hback-porch = <10>;
+                hsync-len = <10>;
+                vfront-porch = <8>;
+                vback-porch = <4>;
+                vsync-len = <4>;
+                hsync-active = <1>;
+                vsync-active = <1>;
+                de-active = <1>;
+                pixelclk-active = <1>;
+            };
+
             port {
                 panel_input: endpoint {
                     remote-endpoint = <&tcon0_out_panel>;
-- 
2.37.2

