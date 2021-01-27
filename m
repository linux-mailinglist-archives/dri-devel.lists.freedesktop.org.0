Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993A3070E2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4F96E905;
	Thu, 28 Jan 2021 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A76E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVGL/5iQm3NBvryh51PngdRrZ3zrrai5mR+TZsZ6RbB8t2kfgPAo52fLCuHILcr3dRAT9HyUNey6ZtLapuL+U0x2L0/4X7VLZzyOxWLN1rNcmHOeS1uIHadYv5R/S7oN9FAP66keTEt3u9m52Fr8+v239Ed1UI+KiHelzxedVDR7q37xO/RMZECkMAqwBMz7Hw5YRtOuiSQo9gpadaY/sd7RLJy5iZlyCRi3jrhFwQHKCUmbYU3eLMIft8zjtDbbHOuvBD8GKZWZE+cgbIJC1KdYuf38yVZCozgbfXtdySUpYe89ehvDw7BVUo7ACRw1gQN2lmvbEATSF0sUWZmKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw18TH4XWoFdVS9MIjloVANVts9E1ELhxwAUwhODTJI=;
 b=de2eiTql5RXx5FLnRKLKMPzhC6BwgcLhJDXBXa7J8c8Ocjc49fpfZxvJa8tsQcToCXrcnsXlMfhRquPLFdBfHNP5IhVD2kgzfhpx3+W9t2dwce1z6YNVwoschoVD1lfZP/zAgmxOAt34Gh2+lwPbQMEak0scLlaTfipJ6byt8c3gIqDnM5a+5+3vA3nar42eZBFP4+CAXa8lQFjzDedbhTDviDPs56GXwBwB2A0E8AeEaSGnH00Xb7KVe78sUoaJbEjeF5PlsGAMuJMabNZHlAizJFP3F7ilqa1efhNOV2K/weE7WmrfKqG1I+CLNL0inm597g70XMpyxLyMHj+iJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw18TH4XWoFdVS9MIjloVANVts9E1ELhxwAUwhODTJI=;
 b=i58JCmcUGn0CoZQghOip2EcjAuRRpGpt9eO9jiW6ukkFoN2pXIWxWF/isUZTJljm+yeVA+X2l9R6IQEl3dluHArlCN2YGInGfdU3VVW5C2QHUTOMi+XFoCtr5gqh35RVx+ENjGGULyIN6AwiRNqJcZ0n6Mrse3Zwqf9ekwmo5sc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Wed, 27 Jan 2021 16:51:20 +0800
Message-Id: <1611737488-2791-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 438c61a0-b1d4-48d4-bee3-08d8c2a2557f
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297584497D3920BB88B7E4ED98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bOWs3rdaNqeUgPCJjwKNHI9o3CGRjG96eyxykD06WIZ2zW1e4q0a7qonVrwOF0LfEp8N4RTC/+ibNPifP1AAZjPxk1nlwQ5trq5P6qo6NWfjCdX8zqrRtA1Ujdz/vdz+O2cklLOBTtd5deQ7Ys4YbiO8iX4tgrGC6FPdg7z7GzFlNKtWkR4RTY5MrTD0Cp1mQ96+hc0OcdrsZD58fIZ+J4gzfWyXxx65qbSlkYboUhMt1j718oVMOZNxYcW+Vr8BESsD5HyxBoCTDhYJapfnwmZEQcO6eZcUARJBndW5JeyFnD6N4ML6ATDTWYG4LilzzpptF/EvyXvZktDK0pf2z80Qf8wE5fxLpVXCeH3lhmuyLDI6ixmp5Jcd4SLC87IcezTPSnx+R3X+8dbnTXvSwP9JH0qFshaWRDRMuw9X5YH/Ad+hutfl7qd6+baqpJ6Raw3dlt2M8+t3AuXq23ze3kjpKfOiAvQgruspephytJk8REE2HfvwB/uWP7pPQrJOVUfMN+0TQ6hWVsAOM08dSPuyVBYFnPqX4jkwXZgSqrqIxVG+ExC5no7UwTJf7cNOtltpydcUF7Vssy9BCAz8Ur5Oqg/jk2ja429dED9wzFk1VshVYc72sTIueQVLXlqp4qMOi08aZ3LOS6AcDmIYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(83380400001)(66556008)(966005)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DulF9+/dA/njapDxzG54iljpCu4e/DVf8XqF5XWh3mk2fIbqse473JYs/0DD?=
 =?us-ascii?Q?YugVH0+YE8TTV5vc+uLfazWPnFYK4Minj8XPmDPyUjIeH1Q7PeJeNBzFvaJb?=
 =?us-ascii?Q?/YcZHKodP2YR8Zk34D+fRHarA5YC6lxqr5kciHSGxmoFgxGhqQ/tgLX4ocnD?=
 =?us-ascii?Q?lOZ2bU6mbtaRThNHtO12bEnMsXzGGu4/2j1gtaKvszo6pq/6RvEtwQRSDfLb?=
 =?us-ascii?Q?RQRJcYuunMA/j7L7mJ6GcmGNQgsvjm/bT2byse1Spny87CzoJOqoC0LjEFE9?=
 =?us-ascii?Q?racxpWvZtISc+NIoNVe6hGAoizHtx638q+AWQoIGvuUYqF4V0D8G8MlXT+4F?=
 =?us-ascii?Q?hdIkSa+nT38X5zQuTd/yvxH9bgDTphuwU6DLxB1o1lxf5aqVm/8d11OSe/i2?=
 =?us-ascii?Q?mnfEslG517t+TpDsy/SUzHNqWhAykFXbu8mSynUHxeq7zrzIgGAB1VH1rbMM?=
 =?us-ascii?Q?ZbVqouf5AwkbUMhE7Yaehr4UijkKNBaV7koo8wGqWh9AhXURpMHHLfEcrInK?=
 =?us-ascii?Q?bLLmSNo5qkR0uScpJAw1nRB1LxfW/2iRZRZdVMJysdmqziu8+qOCGEXs1IRK?=
 =?us-ascii?Q?0srIEXl73w0WlmsFLLITWaeRPIAqVANXk/NHKOyxtoK7X6DcSsMCxz2qNIZT?=
 =?us-ascii?Q?dABGLk1rJduchfj81palmWKlHuJ0NEMAQ7HeuIbvj2k7lrbECgweCjuB+nFl?=
 =?us-ascii?Q?s0h7cAII+N0y9/3T4Yv9DVhaHxIKKzgZipfG/qIw6vsCDgTywefciJCoboHs?=
 =?us-ascii?Q?4uyN9wCwn5CO1msrWdg0JXajEWvY3Dyj12dtynBk0yySM8e8Hc3bOwzl8Thy?=
 =?us-ascii?Q?Ih3cKwwD1E/SKeCwLoZTzVhg6tss1xC1/rI0Rrfbp+fThR4Tuff52o7WYiaB?=
 =?us-ascii?Q?sm3Q6QGOV6w2i9UbNQ6CL+sSUYlxpsXdKM9HExs08MPe4bTF9/cnyWy+VJeG?=
 =?us-ascii?Q?12Y9eJy6MBnviAz8ty64D1XNXN7uY34KYACENq5HWXdXFbY3L5CiOLtuNixw?=
 =?us-ascii?Q?5EznV5irMnoB2cuJH3sAmrKfZ/WQiwIBRmvnT4Ds5ZpH2cE6xsxiQimVdt4l?=
 =?us-ascii?Q?sydl2wDC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438c61a0-b1d4-48d4-bee3-08d8c2a2557f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:55.3237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acfe+6ACk5AVOsYbpoEkdoecqiBbJPs3V7/tzFURMUXNHZc8mi9DJIblBa0xWH67B3Z+BD1CoP5HpA0L4opo1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
