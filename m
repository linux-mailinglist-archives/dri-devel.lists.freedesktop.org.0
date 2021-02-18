Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A331E4A0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E415B6E817;
	Thu, 18 Feb 2021 03:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD276E817
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8R8BF/SweASAtIK7UVr4R5IdHaSA98pJr4EsOcMYWvqwR6bNm3kKQMbvWDg5Qgs5iX6GlZNTAtVu/Z+eEzA8BgTtLpOy5pkMABZJyt7jNRMAuexaxorYomN8UmZa3JY5rIUF34AHFf//Vb63J6aovLz/TTEMFPbe5vy1jJHJO/Z906kKxLkhkSjJXa6eX9fHThkM3gYmln+2Z1sGONvY4JtQ8pu2+OoLiK+2pISWw3Qe51wh+AyfRfChzPihzrQzfdAkqEYc9OGz0mNvPVajRUUqupT+WhpkNOUxQXnXYGrTVd/ubnQFSyrpN2fuwGj5FV1eEkBrIcFuolIdGQkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnMxqjHmpfosTrBx8T7Aj1USZxeM0BaO6lMHSr2uoPA=;
 b=n84erz2CYpwlQIds3VLANK6dSDcxKymoSFPb875+dHu7RB7LphYksfbf2ylxJPC8VatnOOlzbBhJY7Z01o0au5WKMGVm7P6Pn5AgZvE5A6EsBORK2CLpWb9k9jv3YetProm0GU22cH7+LDMnOTCrey5wBmi84GXP1x0Z0wcMORg8JIFpj6YdbPRRMYb9Pf4bGZ20psliUuFTV5kDn4fGWqRzmUmcQFnoNLC5r3pIygSaahuA7IKeK47mP74KQzVrWNNMUPDl/YrmMA7TRanJ06C703fWhAcFp/rYyZg1B2jh2QhFoA6aFURnKVAF1egk7qNnfck4m/1FgYIgV5qWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnMxqjHmpfosTrBx8T7Aj1USZxeM0BaO6lMHSr2uoPA=;
 b=ECJhfhuRh45O5c7RFfd/K5pU7Jpwxlqt5IVqHtl/Ul0EkE5GGd+Kep/jeOZnvjVQaeDmLHuEZcBe0eVd2yZz1zhKGTM+LlrmxLL05MAPzTrgiydkG80iZil3nlyseujcoyedM5SuJEfHKbjqkFlBCH71KNt9OhzcN/PQu2yIXRo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:30 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Thu, 18 Feb 2021 11:41:45 +0800
Message-Id: <1613619715-28785-5-git-send-email-victor.liu@nxp.com>
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
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8eb72906-14d7-422a-a5ec-08d8d3c0e47f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34215304C324BA1276ADBDCF98859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIfNM3WHfDCsbvlNQ2CRTJpBuKVIbqrtNnxp8akEhyA72Ve21EzyXEVCkU6PAeex8X/IO5+OQfgy6e6LzBP2/0Jk4hzkr3aNYoG4gwOGEDD5gDykpjvftkxUUw4lPScp3RCYzyTHlXsBLAKanY5fvEezU9lvbGZXJFIMjYrUN92yBnF17/Tm0T7i9GPy2+pFlBXN14qiuf8gCwSjDD2OjpkubRgQUNHYuwF98MF81fb1xFmdfZZb8as5NtzFzV3cls/q9gp55btTUb3D4Capffhtxi9kSVEun6sxCnh2CX00SCZb/OMGIjx3JYVaHxHB17Z/YZeM0B+kgSFS6zRAygdFsoKeIGIssdwAKGqVzVq5PiwABJlBBLaXf2UfT7QvD0f5RlMiTYOSTfIg8ebYnQBO5Q0ABPNwBQWres3ri6cVjgjZ+RNfg3dE0DGvUK7Mldk180aKbrtZa1XmwOIbuQKtx3e9fQuQ3cV8XMKKqWjcnf0ukX4ofOzkojqgLjc/d4YybOKk/GQ27nE7XPkivUo5ftL4zsHDlbcAo2fsxM5SB/GQLbX4av0ahOy92YXIx1nGYIqNJ8dIOcBdyWcuQQdVUzA+jvRz49Yt/OvR0346Vd4rnfQw7qPGhGTcKL0T6H2KwikcQbtw+GnDcEpb3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(966005)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?16O1g86c5xiScaIdH0Aaje9XWhwdub4OpKjdX0/lNmYnRpXIzexpWDWikHgH?=
 =?us-ascii?Q?z65MM3vgfRKOHocxbrCXx1dykSVTHCyFKtkzkZMdevXXS1ETn3t5I3zdV+BC?=
 =?us-ascii?Q?8uJIpPvh1gL/WYZ3IbqxjU0k9HI2dN2bqZHM8t4T2htBbsVfbwUt7T3PqUZQ?=
 =?us-ascii?Q?MWoVIjni/W2N8NCuiDzhyJGJ9FXt8ALF0NI9gt9b+TjYK9F86qQpbkSblEsK?=
 =?us-ascii?Q?quFrNINhb09DN8mVHNh4ywyOzYcWbpefAg101r/mbZ63pv9tEyUDFIvzdhjF?=
 =?us-ascii?Q?ddpr5MJDhN2fZes/F7aO9Q0+/REGMAm91oF5MqIIVirOO84rtEUM2tBRo45R?=
 =?us-ascii?Q?44E4zHK+/G2wh86SozeYqNn4zLkenXmp1sylOVBOvRWx81PgI+65VjQdi/wF?=
 =?us-ascii?Q?pp91ICkcp9186Ra1w0PEFYlcqyDMtwHtqhu2XQE0YTqUCEu2zZ+D/MMd5eBq?=
 =?us-ascii?Q?zZNfqiM4r1OBhiw+9DYdcr5s2RsLRCJ2e/lPs7bfqF0iQbzcvcr6K4gkkxft?=
 =?us-ascii?Q?tRjOUkvCp2U6+l0BwtTm18o98TuvAFD9pAvCitz1aeH7gFo9eop5L08zku8g?=
 =?us-ascii?Q?P4gvHJa9LlLa0VAOY832weM5M/GY40EpTP9UlClFBYMAVpCOtiHr5ilJ1/l4?=
 =?us-ascii?Q?J4tsfJoE47tynQe5qQOxq/PzmOCcEi01GvK9GHA7dvqWhkvQOQovlDeUPtKh?=
 =?us-ascii?Q?VWCv5XGzWUPB0r9NMhxnl24lFptEXEvMi3scWXtf+VSHS2bll8FRgNZ60Q6O?=
 =?us-ascii?Q?rk6ATOG+bBGaBgWEh22PW0XAS1NhI/EAO6JI5uFpnqS20AnPNWOYhs7ykeZ4?=
 =?us-ascii?Q?nzZIqHS38LLuJuzIyEs46aAS/xbaBYmGDqODH7IZu1PjQ67qA1cyOkc7Fwsm?=
 =?us-ascii?Q?IVlRIZ1ItXQsoXluxIlmLSoOkNFJzZj0AWLKWew6BjBx4AU7FmuzoyqE6zP8?=
 =?us-ascii?Q?qNG9KQ+7M9l17c74XQe19437Mb1xsTMikSLQftZTv11clYds4wyTZVreX8gj?=
 =?us-ascii?Q?sqdsB3RYltWu8BJTtA0sUwtMQwobzShJ/6neMn00VeIpDFyFv8hCLVfVHu5d?=
 =?us-ascii?Q?yLoIHS/Cuf1DqsJPiWGmyi88X72lF7adHDissVarHx61329O7aXjGxchR3up?=
 =?us-ascii?Q?LREbR1K/fQT853Jx9isZG23qZdUsXLETkV+xQZbRY86SQBXNYbgbflHjnleO?=
 =?us-ascii?Q?jV0ec8I6PfGeDv7tk0Dak8jMNyGFy53atPyLn21Aj5J4Ys/KQBS8cfqHs9NM?=
 =?us-ascii?Q?9tYuo1CLjd/WDLu+KKZd3b502J+HRkIoFU73gmhbNUhWVcI8EWEGIlY1VtqF?=
 =?us-ascii?Q?Syq+bGt4pQc1mOBWIb3PhUhH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb72906-14d7-422a-a5ec-08d8d3c0e47f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:30.0533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4tB6V+qn2vQ/xTUKmSGlAjJO4lKr5vhlvT4AgQ/GccmqlJ/4qt9dFhoQbhTLW3bUon+iqayCSSp/LNGBH/J1A==
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

This patch adds bindings for i.MX8qm/qxp pixel combiner.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* Add Rob's R-b tag.

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
