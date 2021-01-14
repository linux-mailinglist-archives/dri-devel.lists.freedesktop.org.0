Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C552F74A5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4691D89B33;
	Fri, 15 Jan 2021 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA2F6E147
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjbWrIW4uw3S7JypBk9I8igjac3x+tke5GaC0Q/uzNvJPEQRpa/TuzzEJ1gYNj4PFGZk3UWZTVSFPmD5RAXpZhtN0Ktq7igbgjJfDI8QyPpXipVxCUq483vYPJ5Slib7wJ1SyuPtkHoFEDH2Xg/fJoUHjMB4WnwJl0d6zsLINyXLjt7S8sBBGMaqmJzAUzos0ublWOVQdve7uGnqiH32ENrTUczHJDYAeVxV/shp6atNM+mfxaJMyr9iFJwkkOGABQbMDkHoGBaVhJSJrelCNZGFJd1rTMxdjL25l9aaC114K8/uXyulsHeUYRzioUcptzTGraHKHAWm+NJzvxzaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iORmodMUeEZVrrlBf0aYmcA8r09umAegySM3XV3gNg=;
 b=oS6w4pJMtc/kmltZ6uNSfHxDJPetDQQ9GzbJlskDl2ajBg/jy65kt9EJKpGl3z/oD9U52HFMYmekWtsJfqOQVpc+USXohCJWqco0txjwTQ0YGevm3VaOjc2UyUZY7ob14nNpSRpB0f+1k5LhdoUWfXhS1BxoI1mZwaqbU8rT7GtRf0Mh+rbVtPXBrfsuAUJbRRG00Tg5ZE9XwWOow/9cIISynQaGOR3YS/VwExEulC7hCGAwn/JNytysJAH5LVYZ7sI1u89UCcfQJdyeRBQYazAJs88Tm2xOwlC/wl9tZORQ2hoULKRh+YqhJkd4ko6TkNSivWYEZaL1+HeEHAap7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iORmodMUeEZVrrlBf0aYmcA8r09umAegySM3XV3gNg=;
 b=YBl7CcNp+OM0Wn0JOu/pCUgioxkbrmJf2BZsb7aLKAzBdTlRm5sXsz9gm4FLmByXKyqqXZ3SJhKfLhYh99ExY1/+cwZSgw5z7j0ZtPl6t0rdhqUN0wH/I4SdG/rWy6HsuDuPV9lgYVrREEo+3qMxsCHQYQUYq4FxFzOC+qAmLDM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:32:52 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:32:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Thu, 14 Jan 2021 17:22:02 +0800
Message-Id: <1610616132-8220-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:32:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77bf23a9-aafb-4fc9-2c12-08d8b86f5d64
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571064A2197C243E65FE8A5798A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RlYsF7whNerdeambWBmZDO2C0QBy1ya2aV+aJ8dEmmUJU8pMpDpMQO7u+j/O/qdMPLxSxmqEn8dIiamxsy6oOvNG3ubXNL1n2Obr4kTKIzHr6wpqcjQJbbqrW0eovdYg87QAJs0cBYxyMCs11m/NlY02IzZH40yuc/fdetveOMagHSoAn4oo8Cr1OxO4rU7cCPNUKbxiO2V1SfMu5pTXzxLACps77zb8L6vOYvttOx3KxV2BXdFBeYhJw6xWbF4XtYxcQiLoUrAT6hrowEUF3C8//ltnYW+JcvQAbH39nalCDu+0vS43WFIDI73SjBgSYiILziDF5vXdBG9aXTys82CAZSJsu4OmujujWAAA6doptKxPoqeDy4TqZ+uLEN+E/cMdf4YUWsFNcah8G3UfDBX16h1I7NifOPYxNi4aJ4Pv9sRrUynY+AZunVmEavaFZJrVjNzSyWBAjIGcIXhc0LHbJ/mDhJ+krDdwY3tJEuNbtCHvGTTL2fpKbYGxebxD5LrtFlAVeGWZX5UOuJSVPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(83380400001)(2616005)(7416002)(86362001)(4326008)(316002)(966005)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H+oH25v834oJslDamTSWZWozjq2abgZSe/rI3IGlirWvFo4UU68JcJ4iS2EO?=
 =?us-ascii?Q?XQYrGBqkuk1sB5PxwRZT+HDFbNADGXlD7w2sIkDTw839QXZ2Ro8f4LCmrsWl?=
 =?us-ascii?Q?gSmMzoON5IvXDC+GLLw/hR1RoIBVmYtGcZS7zVPiCbBfHfzunSGd401abyBL?=
 =?us-ascii?Q?mwn/n7W7W5bOAJN9UJ1UkbCB7czdxippZhCYMQnGL5qQaw3pAQb1dDyPPuVO?=
 =?us-ascii?Q?7YXLmvOHN8ZllCQuW0RC1I4KT5F0dyxOniC2ZjaX73qy/aRsA4xmi6Xn+aXu?=
 =?us-ascii?Q?it+4aYllCBZrt1A63TXEncUyD3kPgTpXvQHAfUKDJW2ttco1ZpTtA+mUVczs?=
 =?us-ascii?Q?40cHwCIbtj9JbdLhhDgw/aIS2QDrwtl8m12R4NTNLKmWp7yLi6FJ6c2qxXao?=
 =?us-ascii?Q?YQWNSe975MXNwIKijdHsWepAAQdQ46xs3PTTvZWQ+Lfb8S3BWoMIF8lqDfB+?=
 =?us-ascii?Q?n+u9HFKul2MtVhAgPyaMXXxJvOcSUvtqL5jKETC3j/mMHbaK4KNdSIlUxWSC?=
 =?us-ascii?Q?U5DQ2lfYclR1P7flh+3iJp3922hy8/dkU4rRsymBFWQG52k9IhuQZKHNJk9N?=
 =?us-ascii?Q?657YvZ+ohVzO35ZGi1+lZKip8EafUQH+gvXn3foMNWlPVSZpwcopgcg/e3+a?=
 =?us-ascii?Q?ImNTg+3rpBvnWU4i+f+3AklPiZtqwAKgkbsWioL0Z8jLj+qNh5mzoY8zRR1X?=
 =?us-ascii?Q?uCLTzUkv/VZZzcWEwb5ZfU87S7bYkb0+FRn+6qyzS1ebn3DOILh1lC5xXP9I?=
 =?us-ascii?Q?p1O5QzN4+y4VGT2vdN9mI9dUmN84h7BpEJ1rNgH7R7E91a1XZJBFOTciI8cs?=
 =?us-ascii?Q?/H1W9Z0i2YCYmsE7HZu7C03N86WHYptIUPhgm0V5Gmvf8c5OEU7aClnaP6QN?=
 =?us-ascii?Q?j04GrJeozHltWIHZI/4zNg6hQfGSQ+GjGi+VLGNYFPAOuqq9PL6fXqXIKXYW?=
 =?us-ascii?Q?wonFQ84AK0GVQVgNpFghCkDrrxMh8nNMJ/JwsDQ3Uz4MFKqpXeI7n+yeq5/A?=
 =?us-ascii?Q?h1Nc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:32:51.8902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bf23a9-aafb-4fc9-2c12-08d8b86f5d64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhs34N1pZhH+hK2uMYzkvMXXkL7l8FnUYNAGrExiMrFoFQ1HkLvfrX9UemA+kbT+0iKH6Te5xmjKJvV1bXG5Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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

This patch adds bindings for i.MX8qm/qxp pixel combiner.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Use graph schema. (Laurent)
* Use enum instead of oneOf + const for the reg property of pixel combiner
  channels. (Rob)

 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
new file mode 100644
index 00000000..50bae21
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-combiner.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Pixel Combiner
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Pixel Combiner takes two output streams from a
+  single display controller and manipulates the two streams to support a number
+  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured as
+  either one screen, two screens, or virtual screens.  The pixel combiner is
+  also responsible for generating some of the control signals for the pixel link
+  output channel.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-pixel-combiner
+      - fsl,imx8qxp-pixel-combiner
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: apb
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a display stream of pixel combiner.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The display stream index.
+        enum: [ 0, 1 ]
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the display stream.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the display stream.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    pixel-combiner@56020000 {
+        compatible = "fsl,imx8qxp-pixel-combiner";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x56020000 0x10000>;
+        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
+                    remote-endpoint = <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
+                    remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
+                    remote-endpoint = <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
+                    remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
