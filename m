Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332D2DDFB8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B211A89B8F;
	Fri, 18 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC596E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HprVwxlfVMigFI6r1MHdJxfw/7RUhyCchP95+hDjKr2MInb2jYC5ipzDM+Kig24Nnva6/2JluTN+RDpQABd83hEh8clklCBv6NwLA5T1LQUrPA+VlqHQLfJdb6NPmYjH1ef984nQhr7rty+TF9nFhnxfb5JvHorniZDVN9fxuPTiosLeiwwcHzVC2EoLi+ehlujuKrTVkPAM/bC/Yi80AJi94iysPQGRp/X61Q9bVHt7+ombyVutzTjfKNHX3T3eM1RrBP4Ow923lgQv3VnBrHuKNYT7DteqrbVDHbKYle4mjYsiiBsyItat3JviBblwHHzVyYMnzXLThvAYsV7cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaXAZia3/USzoybzPunkizjPhI1pgtRXaeImKLwUn5c=;
 b=cNK5o7JXoe9go4UgjVE/p/6rfoeMt32WlLH/npdlZLB3+W6jykvaMl0X/ZqDu4+Y9grLeAKVCagiW59HA7HBql0mrkgxBQPfRGvA+W8a+S3yVvKGxhbaXQ0lOCTIwmSOka0qnAtoXkU8UUcbPbOvzRjCAM/EBxelVpQuCMyWlbn/ItankX35GDz3O5TZKQtERaPRhODSwOQWfiI23CLxFfaQvlgBjvDFSUHIJg3o0fZ1pwUJOffLck84Vsbzg6+nVwQ/eqpLtdwqtRHindez2CgvKXGBTb5kLBh/2wJ+JvLZRWzaE3kn6T+UyqE0gBIHYTs295VJEgVrDW9DOjCRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaXAZia3/USzoybzPunkizjPhI1pgtRXaeImKLwUn5c=;
 b=pUACb/5Y7RaDvDS/rvvVK47B7RK3SJxOCFECNAOLf7kGRAJBhxZp+39U/6uF+wwUHFz7CL6aDcMxQ7M7/mj2nAXAjl8PpUWzYCoy9EyxrmJmsIewk6zwVSvXbPNY+DF1o7mTntfQn91+QjcBxWJhEFvzjE2QKEOBIAthue9KN+E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp display
 pixel link binding
Date: Thu, 17 Dec 2020 17:59:25 +0800
Message-Id: <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0a03dfd-1820-455f-c485-08d8a273c434
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7312CC0F68ACEC735A152C1198C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnAS26CfQqBy1g3MYXfu+B+/yGGDpQHU9gJ1uGnMM6FX6lji7hDk1UGZW0Envh3xmsjl+YhHepeYgss4htG6CbuEf5ZomsaCks0JxmK84kC7h0af2UFD962HjxRUn2Mpjuf+wlmjaSruhIrCI9A7okzQKgzZiQ6V1AdG6SsK4wawgXSbfdZIoP32SMeUI4r5bSIAFn1Ep2/k3pzgGsuInIb/cnILeIx4zDVF163q+O4zPZegS7HgFsTsmAj3VItf45WGZJo/03wzdCu0lf8UJa1latl6Ei26o5RjwJurHMO+h1mfd7LRtlYDi/rkANAdD9ENxwAdiGp/8K34XKu1IFjhUxg/EmmYRsPrORzdFKVhICSwuNre5gsPwiOox/NUx8IjBlp23/jmnmIwrS9hGgZz0FhXBtZBlhxv0En3iKJSkQ1vVJVpRRV/l2Xvo0oRPsPo9GOLHEhVkYGtjvhDnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(966005)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nCgHNZ3W34BoHEpaDIvptLPrm/7wNno/OF10AEpQo3esvTgd/Jtx9tTe0Hu4?=
 =?us-ascii?Q?S4hkjAHwfzovWkyliaKKX36eODIvG3dJSixLhrogv542LVup9NYrO+0+sNVh?=
 =?us-ascii?Q?JiuoQ4m9nqxxh/paWNyHlwiwMwO7C7ian6QqVLYRfS0R82jm+lfJCTD2L65/?=
 =?us-ascii?Q?YPCLwzSL1E2aOsIoxXlniYt8x7ZzYUiKjbQqWxR7D6ZlKyNe0VRFnrZIoGB+?=
 =?us-ascii?Q?kkl4QFyIoUD2OSsvoRMu0lP+B8QbbKlnKdwgqfcsZ/+JBOaBnbf4+O5r9a7Y?=
 =?us-ascii?Q?xO6bdRn6bhzdcxcEUXDjRaNl08zg5JXa7f13LcZ2p93vQyFvbCJScO3lP+oK?=
 =?us-ascii?Q?T9C+bSDspVgX7dFfjyhoUUhwgmK0yt3fspGIPFg4DtgerOSF/oL3uoJdLf8O?=
 =?us-ascii?Q?asgzZgQtUhBbmraH6pu3MYC4GsWHoYOtUiozM87FIBzTTeWG9o4F7Emyb+h4?=
 =?us-ascii?Q?MEs/RpD6OJbRS18tcTZ0y+6i37vdrRwWaEb7TtLTP3zpVJ1I91lIvK015fBi?=
 =?us-ascii?Q?uPp0kIL2FZEZJPOh+Q6bXidhIT5EVruclJpV0oWa+M/2y+1Bhp+KYuSAlsy4?=
 =?us-ascii?Q?qYVsd28ZHP8bS5CNLrXc7UsZYo2dMcY0a3IRbt7+D/j/pWCzrK6OAVusNms6?=
 =?us-ascii?Q?+xcliO7gjXy7VXCqGe90tVd0cMQ8LJBMXoWWSLoYS3CZyyGe8BFKcB2p0jCT?=
 =?us-ascii?Q?jqiIOY1M63EJHN+AEtRD3nfsdIaaB5OH0yjCoPPKquFkt9rBYj5AZvyzv630?=
 =?us-ascii?Q?6i+LCfyLe7aJ+QG7Igq0/5OePUFEQ6rFj0hIk+UsHug7/kCk43wkH/purSrX?=
 =?us-ascii?Q?Ro+w2GccS+aZhrkabN+JOMI2WywYuTPeUtBWON31/9+Z0jkdGiX2oQQr7fxp?=
 =?us-ascii?Q?xAV+9JizsZx3EhUouuLSd/iOCyzbsrwY3220R+iIQw2HZyVf5SPG70uAI3kO?=
 =?us-ascii?Q?wi730uHMJfg3jXQMMyakppMuCslDSxcSD0lEu5y4NkL5MVfwpwWinewZWOCm?=
 =?us-ascii?Q?aTDr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:56.7817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a03dfd-1820-455f-c485-08d8a273c434
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT7zFKKjHNPE7hx/cPnbONXiQMlCg1numcBpof0p6agTih3NxnpaRxd557o80RiMcZxnTR/bsIl/DgjQ8TD6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
new file mode 100644
index 00000000..fd24a0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
@@ -0,0 +1,128 @@
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
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-dc-pixel-link
+      - fsl,imx8qxp-dc-pixel-link
+
+  ports:
+    type: object
+    description: |
+      A node containing pixel link input & output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: The pixel link input port node from upstream video source.
+
+        properties:
+          reg:
+            const: 0
+
+        required:
+          - reg
+
+    patternProperties:
+      "^port@[1-4]$":
+        type: object
+        description: The pixel link output port node to downstream bridge.
+
+        properties:
+          reg:
+            enum: [ 1, 2, 3, 4 ]
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+
+    anyOf:
+      - required:
+          - port@1
+      - required:
+          - port@2
+      - required:
+          - port@3
+      - required:
+          - port@4
+
+    additionalProperties: false
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
