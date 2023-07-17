Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC10755B52
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E1F10E1DF;
	Mon, 17 Jul 2023 06:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DA410E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb9+SzTir3RDJQYzSBoyZy1vasV++Da2EzDR5dZo6yJUt8JInuQTFrjNzJy9rFQ5SlZxQnZNK5ktnRWO8TONQNqdFg5DG+YwN1BGbNcPH0V5fVji0YHUds9yA+K7Fc4a8bhxlGEBgsAmd2R0AeVp8POdFJzAfj3AHLQ5BkJ1dR10zwuNKvkRywSAvMrkO/Gr+hzxPUoHKY50kBV0uqA1zm3n3zTbb8hym5wJIFjPajchzuZ3Uh9paGVMmW4s5Emx2w8NsGkO5aqrxc5PPfeTaZM/4tVQduTZizuZy2wTeOTjq1m0l+3EzjKTaIafMMqlYR7goGBzZNtRhGHR186Aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob0sIpkjIL6spa4jwGWgcCpRxAOJAnOpUMMGMWUpn8A=;
 b=A9VwJrcHlSi6f+n24QJ/cehueBxoW41fuBo7Ci/z/QcL7w7oarp9vT1U55+vpyyIxKcocyooLuf4sjDWarf2EWXBJQ/IPpwdrjb7e0Ue8WQkvRBXQWIM/+gH85leZqRzzZPlRg8WwLOBTdO2BQ7BXh00RsWQ/EbzV7katSI5Zqa4nfAS59DiXQR9RmdqDdmaILEQpU34JEkWK0U3sIARWtAK1cfNm2RohTrRM852k3YH9+X9Bt7klq+NU0dSd2qSrac550HuKwSMGhZeqLl/fBmxckdSeDP9lD6NeVDBlCVhGyK/OztLxmfnYE4f6LiC6Lq1ie22KL0QvY/AbPpC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob0sIpkjIL6spa4jwGWgcCpRxAOJAnOpUMMGMWUpn8A=;
 b=bB4qnaUaoETaaZFWarifjRUosuw1qqLHtHoypfNtk9fGBDmjLptuOtL77X+7FiJAYIBC9kX3Yo1bXgd4BWLOTVWorkQEpAdtHbqafB9Xr+6FQHsWh0hWQ9JnXVCZpibbpPcj4s01eOo9+3qW3Zk5SXEZaxPzq0xybjDMAa9szfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/9] dt-bindings: display: bridge: Document Freescale i.MX93
 MIPI DSI
Date: Mon, 17 Jul 2023 14:18:30 +0800
Message-Id: <20230717061831.1826878-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbae979-1275-4882-7f2d-08db868d1567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TORFTmAVY5OnSMyDZjM/OfwcaHh82h4ro06halZe0FaxWMr4Y+vhQy1g7c55vr/YJf5nVdEUg64DVIY4O+mLNSt+agD4H7gL+hEHdSZu7t1/jzM/Myb5eGA2Cs9p6AB1QAGRplMwjk39GTYXKf5AkVBYEBgdgeYiYPlPcxC08wt/Ozv+gfhSP7tbV7hsR2D0gRtMG++UVWva2DPzGluQIMqkrIXqZLBsmlxX5LAovJ3Si0/2mYG7v8LDtFBAWZwvGA3IcJvq+8+W/0E2iHCv/pDYH2h8frcof4xDwbA/uyMZ8+vswpHMRJCJhXV/WkMH1HumO8/0GpNZu5IGl5gwb5Gp3TlxThrEoyT/JTHJ1f9BK8DXEWY3bj+MYH+8p4uJlfHSKgLg23bJnj4eKnYieJPtbWAr0IsCwsej1AR4rt+BcAphZI0QtI5ha1NE1v3vfEMxmwc3/2P7zcXoNFtfOiW2YwdLpBVB8R4NLRZXq5P1/1Bmnh2j4FVzNc17hflX4zH1IZyY62943Ahbb9pXDL3hwWndOKo7yshL7q/BlJFg1UE9C7J4BQS6zAqrblHhTFVAEeChLADuO0dUT7/GEkEBZFNFUVA4rQpBb+fOJKA/uYIgTjlzAcnsbf28amUFgXz9z2MSHpOXBi5aAOhRqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(186003)(1076003)(6506007)(26005)(6512007)(966005)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWePFywa3jt7ylS1dsjrjGv7D9uA+GQ+KWJBCgZWtOWJBKtoH2voVIG8Znc+?=
 =?us-ascii?Q?7ig08SkKmjeONb+IC8WKt9iR8pz72dSTsm1EDfsmkb18HP1HiSUv6+pqRioT?=
 =?us-ascii?Q?WTMsjJW1q9/sZohQ4MNymDURVXMeRaXfxTCmwuHayrG2/4slDLJs9R5nYeXG?=
 =?us-ascii?Q?pvYGYSwFygGhvvC9WLEiSaR22+5hAWeM32fLGrjM/fiKlxnLOSPukRwoZpn4?=
 =?us-ascii?Q?ch10RnBGY7/Yyfx8zvR3mhND+I93LOdEJzDSdBw4lGAs6z8nhFDRHtMfYtiB?=
 =?us-ascii?Q?VcAI6qF+l5+8QlEZ/pLBomgaJggUqM5+Lwld2J/LL057Xxe9PfEOqAVyP+Di?=
 =?us-ascii?Q?QWutww0ONcVpqhNYnf2rnh1ujTFKlqood35rL+tVA4lhtIZ5KHmgJ8N4or1T?=
 =?us-ascii?Q?5EvXYa3DjGYPogF/0dkA23IBSVhw8i3eHBjV9Bi0fixe0Kad1nYoro+ZaJpT?=
 =?us-ascii?Q?9cxTkPn7p7gMoiLJr859/jsJ1p9GkTkQ02lcqi+25Ow5eUvEyVjVGslDH1z5?=
 =?us-ascii?Q?0qblbCOyPtcTSvB8iTUK6z6ZGijKP0sxqYbrumV0O/F3VmZdE0D3fwRfQs4C?=
 =?us-ascii?Q?oZC0B7MW9uclxtMuBFjeK1+kU52FP7Nyxo6GdVMOB4QEJTo+D52WdA/jCYEd?=
 =?us-ascii?Q?xFoAwS7eopksf4kliSxpEl4IgWSFArB/7Yt+6CGuVcsuVHEazLOHb437K8cj?=
 =?us-ascii?Q?fihkDvmTPsasap6ZHRi/VKC3ozWMsULArEuHzZNgW+2DxoKg7/nL1kqnjsHT?=
 =?us-ascii?Q?oVjDfLO+TfYDh3czWeCgf24DVs6ga0BeqkyBwbEwOwa2h48RdNCMzBzT+eUI?=
 =?us-ascii?Q?YObY+bKYez5foYG3yVps2sDe/KAcdc3gBYXDjptgHa0z6DZ+TlqGFJquxA7o?=
 =?us-ascii?Q?3t3g942xjy7l4LjD5BmeAf8Hef73vaTvTnU1guVWDf4e3K6Ib+iMkKsVOawl?=
 =?us-ascii?Q?yVi27jlfdHAFvaXAW3IdMUM9rWGjdisqtdzKjyQAfUJELzqngqAB/Fo9Ck3S?=
 =?us-ascii?Q?r+jz7YvbfwqN6QvA9HYjZpCs2Rdf1JP+qp9+7Z5xlyrWAqY7xpYTV7Ejh4yQ?=
 =?us-ascii?Q?zKrJQ4DDp2FPioOJasU+8oNdqct4GsRGfhHsGYCpd/tpTardTzYSs/BEdhhy?=
 =?us-ascii?Q?VrNa70FWGK1cfJ29/q1PxNW6AiEoa5jJb/ARXY7NgXRAoNjOcOdupV7b8OdQ?=
 =?us-ascii?Q?Q4jin6wQvQkOqPFppIn4hM1GupTvZ4hLTefsw2iYzAbj6RLmeHYqlQhdKHop?=
 =?us-ascii?Q?eNfRLjMDNy+Hfc+cA+eFuQAovOY5e1vFyAocPQ26RkS4thLLBdYSJJU3b8xU?=
 =?us-ascii?Q?ho/z6U+WiyGuV4WeBk9+lWcUmT/f8mUmZPXYt8hTH57NgvUPiH/UM6GFzfk+?=
 =?us-ascii?Q?2k99Lhr69+B7BmI+th8PMC9XPoHhfQ6zcVqyH1i+oMVXw+kVWUed2h1moqWB?=
 =?us-ascii?Q?gqdt3KqgnleXum78qck4c6hUPmNHXS17eHoeAWxAAgVZx+6oHluLhrUjPbqb?=
 =?us-ascii?Q?k1qVgtXT6B6v3MEnvJ7RnUUUV82nylfrqekxHXBTvUbzgpCoxKaO2ZA91O8X?=
 =?us-ascii?Q?j1jRzl+uH1Oi0peYD0KRW43qvpQn/aA78GyVgfsh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbae979-1275-4882-7f2d-08db868d1567
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:31.2347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k+vhbI1yzPsHPWXVzURBRwLHxkOyFsPUEFiK5Z6KjEnWOuqUWI7l1WX2qqHfhKZxxSwH/G/+jLrrSaMHdaxXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
controller and a Synopsys Designware MIPI DPHY.  Some configurations
and extensions to them are controlled by i.MX93 media blk-ctrl.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
new file mode 100644
index 000000000000..d6e51d0cf546
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx93-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX93 specific extensions to Synopsys Designware MIPI DSI
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  There is a Synopsys Designware MIPI DSI Host Controller and a Synopsys
+  Designware MIPI DPHY embedded in Freescale i.MX93 SoC.  Some configurations
+  and extensions to them are controlled by i.MX93 media blk-ctrl.
+
+allOf:
+  - $ref: snps,dw-mipi-dsi.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx93-mipi-dsi
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: pixel clock
+      - description: PHY configuration clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: pix
+      - const: phy_cfg
+      - const: phy_ref
+
+  interrupts:
+    maxItems: 1
+
+  fsl,media-blk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX93 media blk-ctrl, as a syscon, controls pixel component bit map
+      configurations from LCDIF display controller to the MIPI DSI host
+      controller and MIPI DPHY PLL related configurations through PLL SoC
+      interface.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - fsl,media-blk-ctrl
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    dsi@4ae10000 {
+        compatible = "fsl,imx93-mipi-dsi";
+        reg = <0x4ae10000 0x10000>;
+        interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX93_CLK_MIPI_DSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+                 <&clk IMX93_CLK_MIPI_PHY_CFG>,
+                 <&clk IMX93_CLK_24M>;
+        clock-names = "pclk", "pix", "phy_cfg", "phy_ref";
+        fsl,media-blk-ctrl = <&media_blk_ctrl>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_DSI>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "raydium,rm67191";
+            reg = <0>;
+            reset-gpios = <&adp5585gpio 6 GPIO_ACTIVE_LOW>;
+            dsi-lanes = <4>;
+            video-mode = <2>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                dsi_to_lcdif: endpoint {
+                    remote-endpoint = <&lcdif_to_dsi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dsi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.37.1

