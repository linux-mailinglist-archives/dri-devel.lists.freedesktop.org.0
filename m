Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31623A945E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 09:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064AE898C4;
	Wed, 16 Jun 2021 07:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2127.outbound.protection.outlook.com [40.107.94.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4DF898C4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 07:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAZrQnm7TFn02VcDQhzRjv+nt+KtBWWa+MD4vxQzPZQWshrWQIvzDSACROh/WoDjO3LdZ6uKpWi+G9zwtknWTYQZIcDJ1zdXTglZgtMyqynysd4BN5rSSsxmBxRfUrY8gBtsJurmctAaW7xouJnUwnIUsjyEaqisGiig4Mus6U4nxwwvxqzuJX3zXpIMw0rVrqNEnZt46kEk1iWYb5HS3YQ33YdyrpKm3iL3IKoo4OipGyF6eY6omgsDBlTO+aYLJYGuaKPdzYkLCs4IyN+gjwemn1lBtJoioe7gnxDvYKSoxGTLuz3RCPclneqwhd3k64izkM8dAiXFzRTA8Dc86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHiX9lQtnIeKhj6Qt0SUl/JhVCIyQh/ysPONcF8eE/M=;
 b=RDaXdLccPu8WFvL4OTyiS+kernSLk0PO6X2kVucXWeOWrslT4A3vNmBDUUvBvBntNwGhAWCbK6IRNgjkmYgnsCiZvqLMy8oaLR5WOAzbqvemhDZp+i0EExCUKqQ9/xiDNCZ2HRmHN6u+PLe4SAJ1BwRq38TLJnFad/vCNRBtxNxd6+4lRC4bjXd+pXMBFJy7f1t2lJvLVpQpyw2ICMVh+dQGVAXB3f695lkiIj6BMLdSthC/UFfTGa4POf/WawXheKJFLsjBe19byCkKENwiNzKgEOnx+Bq40Xk5yHH+A2SX3U+nPvAYA/o4+BDCdR/AvjgUbBZ977QnIt8QeLx2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHiX9lQtnIeKhj6Qt0SUl/JhVCIyQh/ysPONcF8eE/M=;
 b=fb0NBduCFAJ1EGP1ScVa9DeNyfmpQ9IAztRiauDDTZVc3ULqTcq27wMsl2kF23abJ3UY/H27XofCxAazB8gyhHDUqFcznXZkMw/AhTOCDaD8aGpLBA5k0avp88x6pE1FqrWzcF3T/P1vZROiEB5VULNrQd6V8lDvgIqj3Ptg03o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4582.namprd04.prod.outlook.com (2603:10b6:a03:13::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 07:48:42 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 07:48:42 +0000
Date: Wed, 16 Jun 2021 15:48:36 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v8 1/4] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <75faf1744b7857508fa21578e21208216561e82b.1623725300.git.xji@analogixsemi.com>
References: <cover.1623725300.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623725300.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR04CA0058.apcprd04.prod.outlook.com
 (2603:1096:202:14::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0058.apcprd04.prod.outlook.com (2603:1096:202:14::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 16 Jun 2021 07:48:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0978457e-d222-497e-6df1-08d9309b2966
X-MS-TrafficTypeDiagnostic: BYAPR04MB4582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4582878327415CB5A47C4212C70F9@BYAPR04MB4582.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sd0wskX9XsgvoHyhhMayUwDnPXMXXnwScgos8AhS0dSv230r1NU+9bu2aUaahCpfGxRMZIkARkmtTNf+7QdgCgbTKyl0g3ZC2YbDuLjWRQGPM7JDgq6zZfDmZ1rwotRTnXQOBUbqq5Fc2bi7EB6s2fy3Xmcmeuna+0LE067UNZWwt99GK3JfuloNo7Ooc5bg0Ho2raWy6gq5Cvs5UvZ192BcjT9pAz1SFJXFCWv0SFSRgAB73vKraB4/7OdelqFAdJLt6rQLQE5qjjvEymjDDorfyBklvzMSbYG0Ze31unkTYzKKKONMJygmj5/jXaJRGQTjmC/4A+HpBMfSVWTCliKFQnMA1ZO+nzdBCDn6WyfiF4ArOrsUzYCh59P89z++15KKUkS9WjH1AhkhELdCLRJRBWZ+8L8m5C3X0EpnX2qaLdH0OXjzUuxdxXnUCVyWki0dFwIf95tDICDEEcrHPJXPPoAHGWdxcZZARkIghIUbkZSyl8yD3heuBmj2wl5gaqN6Vx3M1XImyFJq8XHCvNXfWJ+SRgwGL/SGNe9sHqN+dBLY3U8uFbYEd/F+jYB4Q2/ClPaY8UyI5+qtJ4CNFUUoeyhdBrzr8R7H/KLz9TleA1J4N7T7hnzh8vpjAgdODSt4KxBzMjF8OKLg1U5FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(376002)(366004)(396003)(136003)(52116002)(16526019)(5660300002)(316002)(478600001)(38350700002)(2616005)(4326008)(8676002)(6496006)(66946007)(55236004)(54906003)(110136005)(956004)(83380400001)(8936002)(6486002)(26005)(38100700002)(36756003)(186003)(86362001)(66556008)(6666004)(66476007)(2906002)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a73wlcq0eY7wFOAVotDDc253Vnovxz6+1MJEme647o+dgsBaiL63e6f703ev?=
 =?us-ascii?Q?PDLgBbESmkismvE/r56Y5dWCyvzlT3hv0EUOQ283mWwV7KsfaL0waH1pUxzG?=
 =?us-ascii?Q?5iYzipI0TDM1vO5FxpaZuY4WeH9TBgJl2q1vmcosW4vGdgGGKhndJ9bGV2+j?=
 =?us-ascii?Q?U3M9WTtzyGblF/iOHWB2K/iBsAIMVk2NWXaDlPWUcJXeMFGgQY1fsIccDQ1a?=
 =?us-ascii?Q?r7Gj3C1EvqiTh7c/+xmHXu54K7H6isKKnXc0+X77RzXgVAhMSSwkEF+jxlxg?=
 =?us-ascii?Q?20uJrNOZaSh0dQZVHIa7tARr5vGRL9gen3J9ViLDxt6zU8cuzQeFWHxE02gB?=
 =?us-ascii?Q?7hWmiLFnxhMmcztSkCFoCQWd196MpnxJTAKEkLv/M/KeNNHRzR6j9LJFQy+d?=
 =?us-ascii?Q?91pGyDX0wdfmhb+oZWaQj+LPaa5MT+UjMyniGjShSAiWa54Pl84weCrjq70G?=
 =?us-ascii?Q?Z46Y4y1mZnXKQfPTlY400RCZnPDUM+tMDmBGXSbkGskJXdUTpaMPA+NJC3of?=
 =?us-ascii?Q?opedxsqKDghmMpVdRdbdHsWcRx0490sVfWmrO9ZcDgklqd5603uyw2cr6rVg?=
 =?us-ascii?Q?1oJPm5/nQV7Gnb24Pw2nyZq+K3+/brX9510xz0bPDqdW/XahGlq+kKnUISkn?=
 =?us-ascii?Q?p2qaxCc6xRCwCoOriI3xS4Onmu70uHlp9Zvx4MJwW0+tWmad4ERIlBiUNXG/?=
 =?us-ascii?Q?NK89ilgeNDJAMbAAOxLKSAdZlmJ67jebdq00Abvq88YcnabFHK/J64BrkDqc?=
 =?us-ascii?Q?Y+o1wIJPBeJ/eNA/DgEgR7jxa2istG+NYKipYVMSwlyQL5nBaMY23XFSU9kB?=
 =?us-ascii?Q?URa+/lAwxAD7XFXKqj73F9pnEbiu/tlArMpbrmapGKSb93L6kBYI55U7NjeV?=
 =?us-ascii?Q?5tO9yZkx+jM6cX85RPTjpv+WZurDt2cT3wsRZzXtlvN47M30BdVL8oUcyFpV?=
 =?us-ascii?Q?jRzwuQVIAL/tySzz1dMzPu2v85/3drl5GMQq383Zp8w3X6+RMGTGrMXPaYWD?=
 =?us-ascii?Q?7F7d4MHGtrlPZVqbhheAS88RsO9V0M5qalfn3Ot0+u/V4ZwJp2cgvTcXXdRd?=
 =?us-ascii?Q?S8d/mYsjDWY+362AMLcuLpP/3Ty+lv1rbDHjzJgrDGh9YY1a+F9Yi0zfGOf9?=
 =?us-ascii?Q?GGXkd/143nD4g50m35NpxtHBv63wvKnSbTU0nv3rzUQyF02fUxG8xe9Bm/f3?=
 =?us-ascii?Q?ac+iyTwNOfJuANaZYfRNKBlKW5vkGRw0JIM8RBKhyS91lo62xeGVrhfjqshj?=
 =?us-ascii?Q?ar6Hl9pj7Ko65RIKaV5+lJ3gS+xp8ceUnHV1Lr2dFI6hNi33uwicT9we+XVu?=
 =?us-ascii?Q?8X3LPxmq32a/nFZ8BXQt3xhV?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0978457e-d222-497e-6df1-08d9309b2966
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 07:48:42.3712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZOHNKwlnhqfmGch/HgGtnx2ZhNp/A1LQ5VkAuZxVdj+khcc66DzYGka7YVw4rb38niu7a8XesoeZ3qmN14mRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4582
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Zhen Li <zhenli@analogixsemi.com>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
lane1 swing register array define, and audio enable flag.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index ab48ab2f4240..9e604d19a3d5 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,6 +43,26 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
+  analogix,lane0-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane0 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,lane1-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane1 PHY, please don't
+      add this property, or contact vendor.
+
+  analogix,audio-enable:
+    type: boolean
+    description: let the driver enable audio HDMI codec function or not.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -50,13 +70,43 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Video port for MIPI DSI input.
+          MIPI DSI/DPI input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+              bus-type: true
+              data-lanes: true
+
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
+
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
           Video port for panel or connector.
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
     required:
       - port@0
       - port@1
@@ -87,6 +137,9 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
 
             ports {
                 #address-cells = <1>;
@@ -96,6 +149,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.25.1

