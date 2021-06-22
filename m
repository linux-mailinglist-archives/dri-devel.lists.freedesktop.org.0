Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6353B0483
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E836E4CB;
	Tue, 22 Jun 2021 12:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2092.outbound.protection.outlook.com [40.107.244.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABB46E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+p5DaF3kKxvjVvbwB6CyChq/CgtQSujv9KjAcdyVaD1i64UODxhfbEGN28L5VvOvj0lrb7QKQBmsjgCub4b3aeP13rSqrVoKLxP3CFPCt5wtJIs95MvWkvlyMzSpvU8ICPoaXfxeThNch/HGNLZ16OQ3JsspMf6UpbMmgxEdrI1yzaWgD3bV5h8uwW7vcm6UXUQlw14dQVUWwSiuKomgJ+frKQQdTsbDvsMY+QUUtYvH157lyJe1gBa2byPXV6cDBd6Q4Bdq//3rXmQ2FW9ZDYlf5TwF0e9cYKSemjzu8iAkAOzGp9ZrdkmTeYem0z+rGQ4oLmYz3SO252AY5C5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHiX9lQtnIeKhj6Qt0SUl/JhVCIyQh/ysPONcF8eE/M=;
 b=I/17BgdmOzFSsmeF5IcWw/iCgomYplBKVDrldQWCtemZ5zhV/FmpeEj5VSclz+GoGnlEueOyoioFNceEjr5QU+PTQ6YEJH19SEMwQ9zpSHzoEeWo/aKB8RYUq81qlk7zpp6ddErdt8qwJEq2s1WDwd3B9xD7VzaccTi/JIuCcYXxRPIvPO3TOZGgjds1yr0xAvPsgiGfP81/7lpfmFTrpbNVJ9nopYYQgSM0KiZXx1lrJvctPNGoL1vf11NHiE97c0ATVcmRjedOPlCzMjTL3iQxe0XSA1YYrl+9Nz664IYcPrQoksvhQbxPLTLyXnOaoytwkwDYU5QaHqLNBVh6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHiX9lQtnIeKhj6Qt0SUl/JhVCIyQh/ysPONcF8eE/M=;
 b=ceXcjVnrPOCKH8uFFfL4HDyRjZX2dLB1yOULbCiIIt+2M3s7X9Ac4bhJTir8EO4dxAM0tHVQOKxwQtHxWxwghb04FgV5YwNkuPio8ISx/tIbmi7gybY/M0ob0V8aQwlHuX8MLOHF+UXPo6a82F3ew39lFHpwBXs1osloDmTbVcw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6785.namprd04.prod.outlook.com (2603:10b6:a03:218::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 12:31:27 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 12:31:27 +0000
Date: Tue, 22 Jun 2021 20:31:20 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
References: <cover.1624349479.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624349479.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.5 via Frontend Transport; Tue, 22 Jun 2021 12:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6cef2a5-b73b-473c-c185-08d93579a775
X-MS-TrafficTypeDiagnostic: BY5PR04MB6785:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB678572BCD4E718646F084CC7C7099@BY5PR04MB6785.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9Y1X+gEQkPzG67/A47HiZRvez011EW8rYDz/l6VBPE+tB7cyHkZBb8WcsobOfxSdIBd0GpnJo9KTdXedO5NpDBFeuzeyFV132AXm1G84M++VRRNiwFAN1PHALpIf9KpTOBtqt9kzXa6DLUlGzssQH3I6QQsQO/MiKRUkwGiywlFYC12ISy9hT5RBCU94ESXImQiJODa3aLQ3wdJ2SR/jJL/f/dd68ruKMdgbjhGH2qcNVDWrddb8Ys5g/U7Dfdd9LaWVKBpi3TGUDx4kh2Vh/Vz2mnJm+Xnx6PUIGgK/woSXsqKrC9iiPzEIkVd4WtUguNZSWWQnWud8dsAV9fjtRBRTVvj4CbW8jwYErknrT+K0p1U8w5rFH3IZLxJCbb62FKwgMQws61Zq2F/fnKwdtA6sUSJ0h150a1qji6NEXrRPqjNnuGKX37kDiPlnKLm/melexovJu28YPPqNZ6nM0M+yrwvn04yaQ+UJbwGn3UQeYYQ8oiPi7ooPSwE5yefRRyIFxcNsdWWwPT8yDHI2jpeDSVh25CFp4IPp+0Q+M8lxg5pd5jSwyH3RVGFcGjDZTeCoq+Erwmo3yBDLOjyOhR9G5vTvvnUUwFr2RwNrRJav5nr1Kbhfj/R1NjAuTgWZXmm1Ry0uvMix9F0bCu/pzUW5HlPNO3hq1mgwI+EIGRU7VbK5XFLV+lGAIa24zkHpolvIO5wj15XkBI67bvlEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(136003)(346002)(376002)(366004)(86362001)(7416002)(66556008)(2616005)(16526019)(66946007)(2906002)(4326008)(6666004)(956004)(36756003)(66476007)(55236004)(26005)(38350700002)(83380400001)(38100700002)(186003)(6486002)(110136005)(8676002)(52116002)(316002)(5660300002)(54906003)(478600001)(8936002)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C87yBl0806IYufuGXgh8bMKQr0pcE1F7T4zB0r8E4nwDnPCoV3Ag1XIqBvKQ?=
 =?us-ascii?Q?CwlT/P75C/3RznD8kjI3iqROgXBZCjUTbny9rSMk9q3nsc0tXxDYslz+xWbL?=
 =?us-ascii?Q?lp3cJawOIp+p2+KC+vLCKqubnwqwMED1icfrT86LDSk58JaFUIaxCz4HdUUk?=
 =?us-ascii?Q?Y/dWp0hgk/sAlS9lNBcqe0FUoFZB2PmYYSs5qBDOzuFFjUtiIiHb2ctDFVXh?=
 =?us-ascii?Q?VtoUiuufcSwtKo2NWeISAbhm+YqyuzpHP2DzRlWs4Rb9HofO8EE/RcS1/id0?=
 =?us-ascii?Q?dXIT/a05lmAiZ/Zo6EUsSvHSx1ScaHqjSIsFY+VxV0vbnijLZhrLqk9/uar1?=
 =?us-ascii?Q?pWuzkGy4IsoK5/Kr4X9zs1FoCcduU5WQrh5Pjgmkk9FYIOCSzAtGfTW1xu7F?=
 =?us-ascii?Q?UwVt5X0tzA0lN64nnwQxnyDNJvoK/rFjxf1XT5Dq02uqfXij/jdLP+PQXVRy?=
 =?us-ascii?Q?3r57mt5qoNLhGIRpBTSzPptqkHnFNOAzGhDBrhqpDqC0r9fI5Rpxtq94m3lw?=
 =?us-ascii?Q?f+uzsEUUXzH35TBCtsX+ZwB315jnCKU8oRXgx3A1MbyIORT7O+WnFoZCnXqs?=
 =?us-ascii?Q?uOqJ0OP5Zxbh8QCnV7BNxBFR7ve7mf/aMAWN6D2aoekHYoza+ovX64hRg73+?=
 =?us-ascii?Q?AQOM8n89lNPiKtvEJ/sT2igMuW9bVRBeB5RXn47MludBbGcEfP/6sXSgLlB/?=
 =?us-ascii?Q?X9ZpP1jPlWZs8gBxyEf341/PAMmvls3+7ONfNqBH+4zN6ASHFu0XE8TyAMdJ?=
 =?us-ascii?Q?FNc2dW7+27zBCd9o2Fpk3JAntdz8BuJpdEsCyeuDxBxYVYSfb75WR7DgNDih?=
 =?us-ascii?Q?+q4t5RuU0Pcht6eLV1LsZu20zStm7RPQoQMqWtk8dklhqIuOBpbeVl5dTOaN?=
 =?us-ascii?Q?b3RQjbu2aGJW5q9sj9XVOYKj0LtR1JpG10CJAYzFCIm4d2qWHXKHLJmSEbwg?=
 =?us-ascii?Q?/ccJgD1wEkK+htUuZqsPUXx2UR7ZdyUvBN/JlAedY9OqupKKw7VzetuyQ3N9?=
 =?us-ascii?Q?PDuHNFFFXjQ3S9w8YSUSzbKTzJ0ywHmEqq+bNVcM8rmOwicccQVYT96folll?=
 =?us-ascii?Q?ZwUo8nfe/9kMhiU9Ij0YExgPqPn6pqmnZ7RO4gc0yITrh+uGzVIfrCHu+/Pu?=
 =?us-ascii?Q?Ld2NpF9LYW4gEg/X4ugytwPhU279mJmfNOrb/tp0tyahbmCNbsXAGYI1199G?=
 =?us-ascii?Q?ZiruHam3UuH07sVXkADX+T8zJAdI5/4IOPJW01kdpsyLALEKbB+bRGzDMe1N?=
 =?us-ascii?Q?7cnx9qL3YwS688Ery6lKzuKQAaaLbcRUq4B3nnPOt2WLFpqqVUxiWyM2yRzB?=
 =?us-ascii?Q?ugu2MTEcKQws0KTzPfFI2JqN?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cef2a5-b73b-473c-c185-08d93579a775
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 12:31:26.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2wEzszonWx7GaHDpp5C/IRg2HXG+Ce+d6Jy0mWcYEYr1gxowuvgVNJUCR+JMkXeE7Sp8WGcBl2kliaGABUF4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6785
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

