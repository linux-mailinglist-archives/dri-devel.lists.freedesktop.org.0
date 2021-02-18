Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DE831E4A2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8B26E81D;
	Thu, 18 Feb 2021 03:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AE86E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACy3j+pbUvmETs0h5eQWyWH45Eh/YllKrergTf3n8ALwNvB1V8r3QQp4SzzEQB5YNafGVXMKOeUrjjXxJp6/4zqLpWs0vbi+JfK5wkCIVmOFNym511YVqpKnCOHdrG7qptzDI07WaH0a4tYePGKMKbpwACobQyElI9szoEEkIscm2wcvUNGG1ccI/k8+CJu+14TY3x3WlfYZq8PQUq1m9mIs0DTb1wEWab3JFo9r+6WmK/fytdmQeUGndQ8PdgifGd26jdN8IfxTQL/xmN8PLUxX2pVIpuCCbDcxy0BAc2iA+QjOgjY9mfOtwLPf+TxJ/Eg6jAcPbJCFzx9JrbORbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhexI3yhccgaRq0UEmYtviBDEwAVAGSxddI0rsezZOs=;
 b=YSmC5gT3+hNmighmmtXzY+sEV1rRDCK2ezc+ELVnnKFcCLvmTXqoS3n/reVAC3Ykk5TYRqOSpTmsoMVah3CiSVWdyTbQuVwrMUwXUtFtRdEVajlNeYXmGSdG6V4NBs9w2eCYlwbJbhZ3CpAkgJwZ1QdzZuYicLTNs+hPRjZge2mksqyXc8Kp5LNl4cbouzxzlWLDkgRHbLUyFgg+qL6l8rzqaIH43mMsH8RUgU68ROxcwcFRHXyEuy7XDoqovGukZAK8VZdcwOyUGOWrZvwLdv/oTw7Stx3Uxm8NswakA0feiE+SQAliKbOvZTJOOdsHFAz1t+9KIyS2RF5MoGMm4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhexI3yhccgaRq0UEmYtviBDEwAVAGSxddI0rsezZOs=;
 b=ZU9Lr8IlT7dQJ1khPIFBJazQ0Y96tu3B8JWOOfRhT3DhlZ620OdEL9dJJGPl+GtdRxED1S70Sf1dAZwjnjjys4hdcfZj5ujDOiTBjJBiOKxpFeYEEbkt3AZcIAz5e4juA4x3t56+0MHQKstR9U4aRTa9v3Kc+kWaZSjmmu6aLSQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:42 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Thu, 18 Feb 2021 11:41:47 +0800
Message-Id: <1613619715-28785-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9885c192-8cbd-4001-cbac-08d8d3c0ec3a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB342132F5ED8CDAFB7806E41D98859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izRN22eVBx2JRRdMlQd8LxzYY190//wFTTRlx10Wsc1vUTmDx6E/weUCFx8IkfLmqBVQBdOnoJkksO8nIfbqry2xd4ETMVEvhSjjDRo7fuVdYR1525c1t8UzcKUY+DzqnNx51vhlCj5A9i44cUHAFEQpVRHarXYTFlaiYyBdmjOD8Ik7SnsZpXtcBbVaWYkIzBxIOA9yZHQHld/RNURo9RHMIv6iMWoHq/oVZafo7Hgx0Yv0s2JgZZ1hy0vNTG4TzqsyIS+kfyvHbfaeKMWSeLi1C47yAoyEYogfq5vk0irGmv8F/ZgRXqAxXdux1piA4tI6ixzzJxWeRpNntw0YJBuUa7tEZC737MX8A0nFlcEXUl2sZl/cF0nKQbsW47RelKb4GplhaJ53eRuaU59SeqvvCXx28ymAw1BzjVwR3CuPfijnAzmG61TfybLiky13x9kjZONZpHfgEBHkn2CaDFfvaaH8gu+YZ4sj2+YK5AQqOp6zZAjibP/hgTvzFgr9cmdmNGAu6X4fWOMpVMF9bx/FQtqaJWZpq4vW9KZttJnuIEQMBAqH1vHnfji8CjS8pby7V6VRGoqDZlmbD3ZHyL/nY23ciGhfU+YUX1tr4V4ihg0CacqDO/UtTQ6BzjHBO5piigpiiGS/j0JIeCnfow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(966005)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZNqV0yE2K0F8IHtSFlqxwK8quteOgvm3J83m4orSf6w61YfwTzmbgoRPl2xw?=
 =?us-ascii?Q?TrK5zVOuX8mDEqVmzfa7133ke8zt+gjry/9R8ZY2KUYykFjl8/rGzFZWcveh?=
 =?us-ascii?Q?L5rzy4tfgeM3JqSwfgh2h/hmjDQyKbQ2JpUp9TCjoHMc2O374fGoHBmPVMEz?=
 =?us-ascii?Q?BAyKjzUgFYo2SWGaYFSiztoYpEwUPLheyfTv6DQ8wVy+ti3UlsbWNqwLB6Ko?=
 =?us-ascii?Q?YNn/aLbkU5OiOONph4pMktps4Bfc3XXPHdnqh1yFUElESgV7MhOYVgMqGMlN?=
 =?us-ascii?Q?q+4SqClG1mPvG/BDxPqeSeONcDcL7CncE+IzH+4ydWvBOOgt7Fj8Zze8IOxH?=
 =?us-ascii?Q?0eBtdQVPT9oln1qC6FkfV7GFXj9ickbPMAbBTiYbkQxz4H25oDk2CSlc5iD+?=
 =?us-ascii?Q?SQiH1mInPeobNUn1+SE40nCCyvuP6dPTH982qXXWbxUE9t63uny6DpvwrXhU?=
 =?us-ascii?Q?dBAiH+oXcHvlm1NyQUZ0V5B4jyFnHaQCBSHSre6PhR6Xse7rr2lOHf50Ow1a?=
 =?us-ascii?Q?Jew24E/tUvTXmQyu5TpTf1kn5y7VMJoCOfTXfZeUoy5khPivM4iKxAZtdR/N?=
 =?us-ascii?Q?tnIorHkVWPe8zKssGkidS/EHiNQGi/oexPvF6MW5VEYXVAqLfBhW3zP0XNfd?=
 =?us-ascii?Q?AC0A1+UAQ+VWeEusYAhkPEN0WCwQ+nIRZBhPeVAVulU8uTLVRr6IVyR8NWW9?=
 =?us-ascii?Q?ArvwIFrvN5cgW0InakI9k9L7V6Vy/FLwrXylSyqgrpL2aY3zPw9MAQKMGvqU?=
 =?us-ascii?Q?6dFw+yTZ14sodHW7+s/oOzX+hR8IvasZnoDPVsK7gN+WgkDBopmoTreghWq1?=
 =?us-ascii?Q?QAuuwRbUjlPN1lvvmdBtp8em67xll2rDiAYyGQF02RrPQPx5c9qnvoPr4Mf6?=
 =?us-ascii?Q?7hjvwjs/OfkmP5aR+OUDaJt+XLqFvfMCQbrTyFcjdm7gKXfqnSSN7A71+qT0?=
 =?us-ascii?Q?mrEn83h1rXXXwn525y7TsKOZLQ5u+OAO7QzK2iGDXumlad8mjncdKtX/pDBL?=
 =?us-ascii?Q?DZBXyUtAavLOr4BRRJu5/Jzms/VbyBju6gPISVWlt/Go/NURvQCpq41jmuQJ?=
 =?us-ascii?Q?7mtATrGPorFUB2spSfiw47XnEA7igU7cJZby/La8LY5iK6c/ZYb5KjeQgoep?=
 =?us-ascii?Q?BLGr1MH17a2p1L+/7nMdAooMi/5XyQPSGW2oKhZc+rs0I1AHIS035Lafzeze?=
 =?us-ascii?Q?5EXzHr2hWSz1m061btYdwEjr5M48WmLUVpQhOzRio/ejt8s6p4MZ6O0yFyRF?=
 =?us-ascii?Q?fcS/WBUBBzectLYlQUZAqvsI5RM7R4qszasM9AURpnHHtmS1WEtOHCElcjXe?=
 =?us-ascii?Q?Gi7xoQJgQttpychcnVPN08C4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9885c192-8cbd-4001-cbac-08d8d3c0ec3a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:42.7030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pyJeTDhb2+1OvZHtLLhF93XeTRP7RX1gSI1xwYh1ehW1EFzYlO8kB1XblspuWX46EWVRuARUIN7HBxdigjOxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp display pixel link.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* Add Rob's R-b tag.

v1->v2:
* Use graph schema. (Laurent)
* Require all four pixel link output ports. (Laurent)
* Mention pixel link is accessed via SCU firmware. (Rob)

 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
new file mode 100644
index 00000000..3af67cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Pixel Link
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
+  asynchronous linkage between pixel sources(display controller or
+  camera module) and pixel consumers(imaging or displays).
+  It consists of two distinct functions, a pixel transfer function and a
+  control interface.  Multiple pixel channels can exist per one control channel.
+  This binding documentation is only for pixel links whose pixel sources are
+  display controllers.
+
+  The i.MX8qm/qxp Display Pixel Link is accessed via System Controller Unit(SCU)
+  firmware.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-dc-pixel-link
+      - fsl,imx8qxp-dc-pixel-link
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link input port node from upstream video source.
+
+    patternProperties:
+      "^port@[1-4]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link output port node to downstream bridge.
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dc0-pixel-link0 {
+        compatible = "fsl,imx8qxp-dc-pixel-link";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* from dc0 pixel combiner channel0 */
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
+                };
+            };
+
+            /* to PXL2DPIs in MIPI/LVDS combo subsystems */
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
+                };
+
+                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
+                };
+            };
+
+            /* unused */
+            port@2 {
+                reg = <2>;
+            };
+
+            /* unused */
+            port@3 {
+                reg = <3>;
+            };
+
+            /* to imaging subsystem */
+            port@4 {
+                reg = <4>;
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
