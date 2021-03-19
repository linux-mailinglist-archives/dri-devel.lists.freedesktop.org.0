Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65B3415CD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 07:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044C46E986;
	Fri, 19 Mar 2021 06:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2133.outbound.protection.outlook.com [40.107.223.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A958B6E986
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 06:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU4LEENeRNvcIALV9Qe1/sASA1v7Y6GR6omVZNlO/SL6jZFoRDhpPSM7HQvrq8Bjetg52gLMFvsOip+9w1K4kcy2Zxtlr4XeGlhGv37C2/e5IOGy+IJcu4YF5/s3gC9+wM6oo0h75masB/dIHrqmXoo7BSAyWvCzOGguToTvrK2yVAZebtHc7DTH9Ms69mEJ0EOMRrl3LS3BtwgknvkUA5ubjK6OV7M/+7K1XzSzf/rEzTIMs3l/iUTBAkS0gKMrkpG0yPy+BllQUw+uKGee2zUmJkVeU5HjLpEO7e6hfpUHFElMcaPZ9Da0MBFh5t28hAx3gLBO2w9tT4VsCbnUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAtwGnwSPFchf/xK46R+lyXD+Lj9/kehGreqjV+V8qI=;
 b=Gea2J+E2ucJnS6dymef8mjiDKMI7hAwK0/J18ObUgcaRZHfLaesPOSmZdR4idWyvcE9cjX2KX5N7C/HtV2YZZCKwXutcJXFVKAGIQt29Q6mpJBnTtnuIYjy+XxTdiHas+9LMAcuwo9a0xvBQstQscpG2T47R1LPsalJLGgCH4aGjEvaDAw0lBApqyokIfetUeo9+SsLS/+jT9xUMYEiswAIKmK/ZCFQ+fWCdwVnHwhstjnFm6J761mFhLbMVJZpjg8nAeNIFxoVb8qDGhkUvQMaZFD6Bge4+MdARLyPZwMaflHJrNI/gDt29xCifvL7c6GoX3LxcMedMpJl/lCYPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAtwGnwSPFchf/xK46R+lyXD+Lj9/kehGreqjV+V8qI=;
 b=4HuySeYsmzWWyLWSTJQe/iAcehsAtpXBPcLaJJKFo+az4IY4yM3SnszHACuEZgZPnbBjdnU3ZT+Nq9wMZ376M6FWxIa8KC5/CeRNJ1KqB2zKj96JL/O6HJ17ThBAEZTd8P2pZPsVaQc2rI0DjnMCZ513TjBotg7zZ9bGqC261LY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4581.namprd04.prod.outlook.com (2603:10b6:a03:15::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 06:32:45 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:32:45 +0000
Date: Fri, 19 Mar 2021 14:32:39 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v6 1/5] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <4b09b40ce53c5b5fe7d2ba65a3c7a1b23f6eec04.1616135353.git.xji@analogixsemi.com>
References: <cover.1616135353.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616135353.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0148.apcprd02.prod.outlook.com (2603:1096:202:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 06:32:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddac081b-1d1c-497d-4da6-08d8eaa0ce6c
X-MS-TrafficTypeDiagnostic: BYAPR04MB4581:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4581F2470635411D5FAA9065C7689@BYAPR04MB4581.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2tC/LFDhshTqAqjglpXZuz2tMcJqt/+nWKgpysRMwieWDuyjxY9+tvLKiVm2hT6oRzmzFy7JuqDXvyg2Jq+07aL6NMwJBmG5cKW1irf14S0K8ba4cipadGc1OnwFxv7K2Ic2rByAv0fQ/0+YanFyS3fj0xUq7ZirZkYojFKfphILlPdoA1QW2wHneponw1h0lZu638N5OvyW8AEXKbiKMim4dqPiViUCqu7RYyCLmlCRGjoJe0ZGMbMQm/0lD2Dl/jMMIIxGV9js2IR3pBJOeyYaiF5P1jyTNy3MN6RWTT206rvRV5Sqxmy+d5GpKZRrxhGNse8Mic3xJyw3gqPI0lGo6HESwK+d2NNTmjfAsFrIDTuJ953K623kiQ0KcBGd3gfH4fyqh24Lq5tOH2da2kTkYYgix/FfLb+KctlBuHfCulHQhx3sp1OXABKUYw2zf6S9CnOzkaTmQyXa51PHSg54RVHqcSZLGDD0HKoDDj4nS7voxgi5RXvDgKaxAzXEKJB6JbvJXVMbRsQu2Dq3PL0QVd1Jf7q6h3K1ca03N2iIjt9I6x3LRjp3u+AeA0jf4Fmy80fc0gOoIojU5/R2XufqCOJBt8asJ8lQer05X2cU9BDOisZ3JJM7WE1CdI9CpjuC2KsL4Ug0NXKJXO0Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(39840400004)(136003)(396003)(26005)(54906003)(7416002)(186003)(36756003)(2616005)(6486002)(86362001)(6496006)(956004)(38100700001)(16526019)(2906002)(52116002)(8676002)(5660300002)(4326008)(110136005)(66476007)(316002)(478600001)(55236004)(66946007)(6666004)(83380400001)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9objvXZ6EqQtc/6med8y5/kJZzshdwTFwwCxBVfgyJ4Oxo41LQHEpDu7Ivw8?=
 =?us-ascii?Q?EBpAmioX8VJ4mRMrjzzZBelG+vp6sy+iday2WNGsJXzXQVH5dk2cfGwUDpP/?=
 =?us-ascii?Q?46w0CGfwO17Tznkd+LQeMo1/viXBg/jx/vaxJcqKeE8G12RflfNVp2s+rMh0?=
 =?us-ascii?Q?oTRG7FG8PCkbIKQHRjU0ZuxTOKPpfim9Wa0nTtbmUqMsGLt2EUJTLtA3bqoV?=
 =?us-ascii?Q?ihRzYQZEC9PAW82aEmCdw2Amr5OrPIvN4TwFYTNHBmD0aoVCkysawSvTcgOo?=
 =?us-ascii?Q?quq1r8JegrJr5xds3Et9gRzY0Uecr0a07GF+PSGUPEF6wTidi8t1YWKjU00E?=
 =?us-ascii?Q?gKTzOKNU2FBiP3NFFgZxf2jFyosVPj9T4h6B68RSfyss71IC1W9+QpF5eIOX?=
 =?us-ascii?Q?/V0KRQVrxD+pyfHBgQSQrT9ZpuUrEG1EMfDXrAFtytAt68njwtc2hSWRW66C?=
 =?us-ascii?Q?4N6Z68rNjbpug5xbFH6bJ+6sBYIUBSpIK7FHYzKJiB3LDVLf4W8rM0dFPtuh?=
 =?us-ascii?Q?eaOZVezk1l3vl3uxhS+YJnKE5UTtR17pq9nanQHNLFKFAXRUYn79OdbMyus1?=
 =?us-ascii?Q?mnbXK71Bv478xcHAjE4Su8z0TcTGTRl1rgDboIYy4RsOfbvKzOiY6QUJTUPa?=
 =?us-ascii?Q?AFsBHA9rGo/t7E3cuAyXx4h144H/xsGXtuQOOJb0IipBHcs+58UOWrpcEuaN?=
 =?us-ascii?Q?CjeEkIIEf8YHTRG10AG89nuSImCjF2TXvjw6oYRQ6plKy5jQ5IzZm7Qp54tX?=
 =?us-ascii?Q?c6HrNvbGKAfY7mZYGODRCToHqZW/a3dlQnWLeQwT0Q/KHYLChGRjCHrjZMAh?=
 =?us-ascii?Q?1vX9TadKV8Wq0614oPYOO8LIiNo2dcJ0FOiu1Rtlphb6bcA4oUk75ELspD4d?=
 =?us-ascii?Q?0TmKzbIQjR57m/MbbzaKymmLu/aVXefqIrRLOkNfvSqRdiSDsDliCzP3hi+N?=
 =?us-ascii?Q?NV1sUuESDCgxxqw3CxpJlWfuvetnIA2SBNh3x5yLZu4TKxs2dSfYsxzF1dDR?=
 =?us-ascii?Q?aaNBBCLx0JIBKPDd6ofcztloxoBntjRUg6Tq9p4I+DTbWTN+9Bc9wLYY9TpC?=
 =?us-ascii?Q?0sVG0PAFbA8GCSlpjoDi8WfHBUbQnVjrNDlzea1rpwFL1vopUg54L4bw9o7g?=
 =?us-ascii?Q?gE1EmEYQhJjOhrPNuIC2O1trnBteBVZI9rYDcJvVHqqoPF3FRRFStKJDu6eu?=
 =?us-ascii?Q?KWvejr6I24mvrUaz0YhV+kr4phps4+eXO6Rya3eq0375TRStnJtu0VhF+Uy0?=
 =?us-ascii?Q?vUlUJMvFNNScuZkVwjd87hgK/5QiX9OdE4dC/oP1rQh+fUir6zULzyM2W7vw?=
 =?us-ascii?Q?0NtmxlOV+Irsu8q7IFVaF+f1?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddac081b-1d1c-497d-4da6-08d8eaa0ce6c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 06:32:45.4852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZ1B2aO/nTzmbyH8ShU6FxiSZUM1i5bMM00BT1L1RTclabDlcyROEpRNIYqU35w9e8QhVQgs3KjjTp0KmcOUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4581
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
 .../display/bridge/analogix,anx7625.yaml      | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index c789784efe30..3f54d5876982 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
