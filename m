Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F03412EE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB246E314;
	Fri, 19 Mar 2021 02:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2104.outbound.protection.outlook.com [40.107.92.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84E76E314
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0xiTRMgvcQhQF+/eQQPNGEsQ4F4teEKoKhl4jupi5v3Qf8ye+JzGjlVCzqAve7jBbE+uavCFizTyu1cTxyNJ+yjueurTu+6IGDt4RRIsYashzUBd4OdM0heAwLOgYlUo1AChNxbPyfsrEGGGkVv1GNrSqcp2+urAlMMx1vs/6YRZVnuidcd9x75jii107+ZKhjjd9YeLxfrDi7BVxAaHP36azR8G/oMelKPoRx3yAcKNj+Sj4Yzecig2dukRQ4Gb7Gm7x4HXJzw3V5bA3oWoFT/c9cfmxLAqEVOB47FjqCNUWbCiR3DIxKQMudIiycJYA+jovMI6H+5KMiuMSh+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcMAHVlWIFil9xMDioAKLUkwI7RAd2ugoQndZmXnTkk=;
 b=QFkSiyl+re75fDlVYJbpoF89Xd6tngYMy7QAmq/rjG61Dchp8AappTFdhC8gGJG+EN00a+r/dDY+Abz+qQ4CJrJB1F1YBtwEG50guej3QWRF8qAlpnFT05w0oiTNlhD6j3qA7u3pZw6UhQeEz1Zj9btDe1FMWAkrBTI3vvT0jjtfKga8K4/Pw5O9hIglpuMT9HoBDUWCa2Xj1t/iLMXpGYCKOiIEoKeXv/qKvP0s2jraRTIEHfzfadD0CdSHBDsZtEsE1vtsaZTe8h+66xnblTPxaJPnblsKSJB9s1mR8gsJQ7P7CEJ/agciWAetfWKh717ZdvGsiDqMmC/ESp0eHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcMAHVlWIFil9xMDioAKLUkwI7RAd2ugoQndZmXnTkk=;
 b=LvZ0NvdBr+ei/IUj3R8qVPwWJes1bkhlSqYVgF1JK4SiarjB08wdxs1u/wWWKiI24FGrmaQJvdDeApGVSOCs1TdKzXhEtZhXMsJUcIC39P6/QmLMoCF6UDi2+IHBS1aEfbvWqbAmbbch3Yn8UEow2vlo+tOM9f2VlXJhAK4oPCs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7597.namprd04.prod.outlook.com (2603:10b6:a03:320::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 02:36:19 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:36:19 +0000
Date: Fri, 19 Mar 2021 10:36:13 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v5 1/5] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <d73a6d71667d793069a81406bc3f686846b83cc9.1616071250.git.xji@analogixsemi.com>
References: <cover.1616071250.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616071250.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 02:36:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 545e1c8f-7cb5-41db-126f-08d8ea7fc6aa
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB759788988FD95ADDDACB58FDC7689@SJ0PR04MB7597.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LN8/fSayx4lhld7A7+tp/hJkWUlDUr2+YQB7gzb/Yk9f8VMInfTwubuMO/xslyDWcrPhUKgrVWiu7nOzMcL8iVXk2NslKiSkzLRKDW0kKoSuAGJrKvtiIGpxKFruXRb3iMplnF0udy/M06XxlSJPFcTORGGaOoyWh7OcOBjd2O79WQaOcIGmey3Jkl2CMAPnEKSYuY1rXEQbsfEOc5av9kXU10Bgpz8Zq8byrO3dw7MgZi/GPzLZz0SXGBN8Gn6l0BHf2CK346ja7KmwcbvD/xWEqjk3OpiaVr7x66zj58hU5e+7BL/Q6rcos/CGJYRmcsS6chtzocS5tzJ2HD3R4CA/4nlxVIrqRiktq5JTYP6LSnzOET2PSsxofIb0NrA3U/0CGtq7z9MYKeeDpTRL1V8gZ+a/E6VM/J/9NyfkGCuT+vg7MHb3UbU8O0KoMt6iMcZLDa6r5e8sdgQF1ZH95biN3PPpovDqTAMCLWm2t79bacdy/TWEnZHnO0hYQwIhAgmA4rMbqYV1S1wRdpmU5MMkc5rcuDmJ/YghaOmVOv84+E6Sv+/OS/SHiU9Ejat5D7jpCmtWgKJ2kM20Err0O8XBQBq5mImjT5W75WPnVdMkwyBU77h3yFL6N3gavKO7QOIwXmmGFNnNeGIYHlAW6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(136003)(39850400004)(396003)(4326008)(110136005)(26005)(16526019)(86362001)(8676002)(55236004)(6486002)(956004)(2616005)(6666004)(7416002)(38100700001)(52116002)(2906002)(478600001)(5660300002)(8936002)(36756003)(6496006)(54906003)(66556008)(66476007)(316002)(66946007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DRrHaAAWdJ/Rr7vQ878QULWNYfaQz4F1Fv1g0cP02CMH6uMLP8FqLFDy5Je2?=
 =?us-ascii?Q?E2XSAr5gvcpBjeR3hhFK9uVgDSuS1em6M5n+PZdI9PfNCkXJRzcB1xPA6EJq?=
 =?us-ascii?Q?L+f5AWgfRKj+Rj9H8++Ihuk6EDpGSP7G4qVwXfAbmW2dZVmS1RjwuiWmzFa0?=
 =?us-ascii?Q?mMOBOWlWb1hAzo2v90f1PPwHuJd2fuJDQyx9VyxATvpjhb3C2ZzO8NKRKYlV?=
 =?us-ascii?Q?UVlmxef2ZuurCZ6a2sP+xKJdpLCBFbH633WGxrr7m5qlvc03uy6oh25TH4uS?=
 =?us-ascii?Q?F5ihV1HLc9yFrvJ8Sbv2+cp4Y6Ap4RBYoGMHiUCEURxyl9blKmwytOgsHKyN?=
 =?us-ascii?Q?UDvP3J+Mi7+68OrUjArJ9tRgmodSMopeNgojrmHqcsFAXavOv+sLqoPySp0Q?=
 =?us-ascii?Q?h4aLJxVDIwo8zJVdJz1fNAWpaVboTdEaq33OdEBFp4zz6LRJ5jne8SqfGgPm?=
 =?us-ascii?Q?/XMcivKcC7/aK8EiSq5EUJQz9/BNc1nJuvrEtKBz88NgAjdyaqj96wp8oO+S?=
 =?us-ascii?Q?nUw8tOJUyx14fei7VX1IWtv7Osf/9cfDxqhAQtVB+51lqHONffNI7T/O8bND?=
 =?us-ascii?Q?PDjrtN6+IVG7nQNEI5KybQvPExqEJ1dG8MeBGFp1vKZhGQnrcZyDPtpkDYPf?=
 =?us-ascii?Q?hsxTP7Bb3Iiovc+NF/qqewyf7d1FI7tYd1fAu/hhmAopg3vzlrybBNdtz3IB?=
 =?us-ascii?Q?TJnXkGsOX9bQ+LyErjTo8SaKdWqz5lAx1jxgekEE8iWK4OqqZB8s9O4JzuGj?=
 =?us-ascii?Q?fMJtNsbuhwr8DiEaoRtAJk1sv+lKTymgO0+d/Ti9Ih4/zF5vOcyTSpoZxSh5?=
 =?us-ascii?Q?TPFfcoxHs9aGV6+mrDyAULpp2Wv5DbnsKEH9qUOILw0Vx9q8z9oVgFiVvVtA?=
 =?us-ascii?Q?NbEzkk7Y6W0JuN+56/QW+c0e1VPjrUPh8dDS8lt3/mEArng7Q8agGN9xQ17k?=
 =?us-ascii?Q?l4jPXaLi4xeJfu/c3yRHNZgDT+zaxkqAeMLTZ61UkdqOyMFrAio8iVKIBPzK?=
 =?us-ascii?Q?/JabC3fUxzt5/j4zwtpt94mEaouXnKWPiaEJ1opwPiR07p4QRU1ccXJUA6hK?=
 =?us-ascii?Q?ZZKHt2OA9BeCAjo/xX1bQuJUOkY5NYRqF4BSRdEGI9IcNHgYhwN9+lRw/DoX?=
 =?us-ascii?Q?d2u7/2Is2w5O4XEtF9qncIprwTmKr1WdKFRuY7BVzTLBlsas+BHtgY76Z11x?=
 =?us-ascii?Q?9Cy2eyxh3q8nRYAdaU3Me68GsX3DX4pyXjMETrl5f4Qu/3XfbnOHFpgwVG+e?=
 =?us-ascii?Q?y1mVWS7JRnXhKzA7G3JNg0kDmvO+kWJ7UtTL2MvwY5Ri6ZkV8N7aeft/Quka?=
 =?us-ascii?Q?GzKzgLxpAAl3TY0q0iDPMgAv?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545e1c8f-7cb5-41db-126f-08d8ea7fc6aa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:36:18.9069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65JrSTd2jsCUFWFUQUwn2MJkVY815B9/Nlfom0ADiCHxhBeoChylE4+GvkNYGDhR4JdwZ0mLYUEMs6lyNMvCeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7597
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
lane1 swing register array define, and audio enable flag.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 58 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index c789784..3f54d58 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,26 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
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
 
@@ -41,13 +61,43 @@ properties:
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
@@ -73,6 +123,10 @@ examples:
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
 
+            analogix,audio-enable;
+            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
@@ -81,6 +135,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
