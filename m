Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A2544409
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BB0113D77;
	Thu,  9 Jun 2022 06:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0304113D77
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nx+DOBqIMWHPOOnFFFvhuxhKwZQM2GS93OL0pdlOUm9IxI1lYKwWqW2LvFKBeyo51LVthnHOJV4TK8sTm6tErofU2JmlS11VW2hBNbV/IsUuc5ttC+zL3m0kxbBixkrJOzPjF55f54rzhVqgRCJnmFs3Lhe325Hvyp4AqresPjhcyR2yyFHCuh47JIy8G95yYllgmkX1W5/umI8q35YUmPaA9qOBAPam4FPPqiT+jIGtPnRrnOxgVKMHY+X3ZeXXMwbxROlmJuMMbILcBLVVZU0HjCMDS28UJG7g8c+5Sqbxz4PzbgT2I2t8rxEjEny06n5Za08Qk9GclnVZA2waOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrTNgj5phonT7Nomc4yB72k4kK6HzUGQNz+O9z91N5U=;
 b=KJ6CPfVWZIz6btzPft1zpN7ZXFEf7DPYSXp627X1pcf0nvD+MqL4EhRaBsrPn7fR7zjqFtNfplVzZqQNIkwy0bbablfXAOw25sT56pI7EHk7KuwCPu48Xw1ODCcTrasw/cg5s3ii63YfO94/cprazqFHaRrx3wY88ZGDCDZmmkq0GpdiSnDwUTmAvhW+H7lXtIUy6AQGVtAEl3jqugGsLO24NFtLmV2AF8mxwfFssSG/PtPyEy0M8CaC5XRKAF01C+ZcegsL0Q6jlTQGe8akk5H9a5CNjAU2MCJeBDSLx7nppklhC2MFjoQo3YKDBB19Ep6r2V3H9w3O/YSmZ9xRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrTNgj5phonT7Nomc4yB72k4kK6HzUGQNz+O9z91N5U=;
 b=ectPYDo9aSWKbzxlb7BLtOipAfD1bx/z2+aGFaOMO0pvnMMsJ5Yrh4eAtvpegkWMov8inzOuXYmORx25FvdZTWQef63pxqeUhnICGRREYzN8bIlWsnv8lmVGm5MwD5xh4pIKrUbcAR8GIuvBmvP6ipLDXb9VeaKaS6pHBBvIxs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Thu,  9 Jun 2022 14:49:20 +0800
Message-Id: <20220609064931.3068601-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dee1d790-f178-424c-68ed-08da49e40d19
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35187C676275D4EDE7E5B84C98A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQRp4Dmb1rmVnUlLRJmirvCDRY0AVZ0WBKqKbkD11SbY0vXm3vXPlNgfksMXVSBlUE6BZgBTWgsbKYVwS31qdwXnLdGwCN0fNoqD+akMTkZAeXPnMyCA+pOEa9cpQz+jnmodeYQzWnLsZkvq/cOsQcJHuNJJVKmdChOYxlMjsPO+T7Zp0pAOaYbA8qdvjGr1Rf++C8qx5hFMCumdReZc9Fc6E1Wm9NTdcokU1UMF1lX2v6dSIOEATJyDhZdBwK0nCKobdouge/vSHUkZ6GLr2oIK4f+3mzvNL46ZFJKm4jGYTAbIQgZQ0xv9/bUUWCd9f3HATM+VnYah7jilfvvB1ahmkIjqrsi7NU/shjLLnu/l99a71Uazix4yX9G82cC5ru7f/Qa2weLyXPCw9LyenPh9WwrLZ2LQ1efRNTlpEvFk6xBcrCOv4S+oo7IBJmv3sPGc0lRssz78HJ2D10FCWBDOiTiDerkoT8xEu0xlWiJGH3XeoTVaZ8IOH4Fpf3b6whZ2AsW8YcWoHSaI+Kk2YDMLY4VEKa+iHUiV0Afw+XMhj9iUFLXHu87N+xjrb5INs5yBn4ArGe9fqE9OGdkMGyjeP4DdPNnsTE5x/hZDlkQzlIsJzm3E3PXUyC09JuVVowEg+SG7KZMFwKY53E2U8z0FHqDcBp+P2fbCaTCXRqdo8n1LR4MyYon74iCh+5nwXnFtvuPDfDhSTjOKsfbMpr8/86P8jr0AFS4mFRRcrqciFHi6IgCkiw8d906uDYwQYnxWCoAl6RrLmBU8LH4CbcXAM0k/FCa3oISbpDuWg7Nepa770JZ70UaufELv5Owo1eiyz0EVdA9OmQqTU+1Hzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66476007)(508600001)(86362001)(5660300002)(8936002)(66946007)(7416002)(8676002)(52116002)(6506007)(66556008)(2906002)(6666004)(186003)(26005)(38100700002)(966005)(38350700002)(2616005)(316002)(36756003)(1076003)(6512007)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QpGcd9h+RG2OAvdiO/tkG1HElduOEyOL3YmtfW87d9Ln83J/AovgB+TdEeOg?=
 =?us-ascii?Q?xy9tOZNaSYBbrZ9h07geAl6yCA4k9x9pv94pkZ7cauteP5ShmLJvcPFze6zE?=
 =?us-ascii?Q?ZZ+re2blmQjI8lsPKpEr9sx61JjFGghUAeSjbkH+It0TawcXu6NRXmxGKCFR?=
 =?us-ascii?Q?5tlZHJjFw1zY5lFwLoChho+I7tjlGJXEsvOizg/YFTg4/3hVoP/0wZYQ4C0T?=
 =?us-ascii?Q?+pZK7NPc6fP9YAhG1mAvxFB/pbjKgRVTBtnT3bs42C4C4SQiha3gC3QYjyP2?=
 =?us-ascii?Q?UC+68dIZV5IR0M2JUas550V1P/2JOj8Hhc/jmiNQ6AcSejVaMKhYV49iSQ35?=
 =?us-ascii?Q?cWwTn9v8sIphx9YkoRMkEhy91B6EhFBvwdghQTlbgVuGJR4LdFf7z0bhRVgq?=
 =?us-ascii?Q?Se49kNcefjdodi7HKEJr8L/vzr4hJoo3XCedqsZsoXFiQ9q0wRVGHOMCLeuG?=
 =?us-ascii?Q?P2rKYyRxPeMnIasUzG1KZt62pPzobBxIUcjbh1RmwhqmE0qzuHTYok9lY6P9?=
 =?us-ascii?Q?5THyj/WatZkMwNmyYv+oY6WL97GJGxuJ1xQConwJfvBioh08e1o8ubctQVkr?=
 =?us-ascii?Q?H0x3CoCvcZEU/ImAa6PiuF/SEuwzeNgdIGeET/VChlVhft6F3lyzUXZsDGXv?=
 =?us-ascii?Q?OrlMZVtzENXxTupYXZKsB8fiC+zKccfLf9HGIXChfAbD0MsCaeHdIWcrrYFW?=
 =?us-ascii?Q?P65HJ4p4R3t6eDPxY8RR+dp48XJ6nDqsJVcNBjlwEdsZXxRjzXqD81qMWPDN?=
 =?us-ascii?Q?CwzQjI2z3tWyivEqyfGdMcDxGBauH3duNGZpzck8Vhh3GxEWP0Q5uy0yqlul?=
 =?us-ascii?Q?+TCWY07udwcS2ff39CURMGCU/S4dNbGftxW4ollQAQRVY9Z0MfqgQC272PSc?=
 =?us-ascii?Q?3Is7hpHOcn0Yv+1jQ5ZHT8LXxwL9uzOvXejswf040fTRYVIm8M2lEMdZN1eq?=
 =?us-ascii?Q?ni5GgoS8mQnwtQIdD6PkknaLwuKQMWIa+6PS356bjBc46/NzIMdWqCwZxFqD?=
 =?us-ascii?Q?PcsaF91cTItiu33X02hwqsuArVY2jk4czTTBKcdOuoDJZkSACXpfEr+FaPA3?=
 =?us-ascii?Q?d2eWM8ESV/2tnb1VmtvzepdaGqrPFAx/sOpeBFrzmTpP5x46mz2FXAFKfXAp?=
 =?us-ascii?Q?/MWGTWH4aygxJD9KgGnPAutUmf2Izlgh/9efPBfRbXhdq35uMPFsupq/mNRa?=
 =?us-ascii?Q?dCDW859h9iIjr8SdT10Fk5ZDfd6wfqDBg/6/5cQtFXQB5uxugr2UItnTX8YH?=
 =?us-ascii?Q?YTh5JTqaBCJQuIxbm9mwwq6fsdMTl0SuwJaK27Lh5I/56UCULjAl40qLNY+X?=
 =?us-ascii?Q?UBp+cQtqTqyCB5AFsrDTnvuq1VgCxoNXyNTulhxoOaWcsYOn4zTEfNb1MuXG?=
 =?us-ascii?Q?FyCOhCfUB2Nv1YKpPw3igEMzKFntCl7cQVXzCX8OeC4t9aU4oD0zCClbluPl?=
 =?us-ascii?Q?86HhOYd+df4c7bhOo9bXy881mDiPAoSYgh8QPH3/OAUF10if1ZrAStagC+bC?=
 =?us-ascii?Q?CCdGvPUSnLLVmSbYUMXlWZmcp7O6y5IZlNvSPJcnnWQBFUN1UrRKmbf6t79L?=
 =?us-ascii?Q?lXIgRpl8I8QuEiFbKFrhvzUVVEBxMAFN8P40xOb50WK4vTYhs5PYIHNMQIWV?=
 =?us-ascii?Q?rR4vbRDBR0tgF6LtYsGqem/K8ScWmjrHeq5wPx9OHuR4AYll1+P1UymksCZB?=
 =?us-ascii?Q?HWdO/SZStfCcgu3UGwcO6p6mbbxxeYxvBuQA6I3OEJnI0ILc+MZ98zWu9TGU?=
 =?us-ascii?Q?cCijzd4vXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee1d790-f178-424c-68ed-08da49e40d19
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:24.9673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoFg3yWInpqzcXwVvF1NEdETQIgbNaIN0b8mRTGl5TP0+XFnGwCjzFsnxyNFG8eLAZM58FpBcmzJsQjOZxn4pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp pixel combiner.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* Add Rob's R-b tag.

v1->v2:
* Use graph schema. (Laurent)
* Use enum instead of oneOf + const for the reg property of pixel combiner
  channels. (Rob)

 .../bridge/fsl,imx8qxp-pixel-combiner.yaml    | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
new file mode 100644
index 000000000000..50bae2122183
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
2.25.1

