Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69B7821F9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660F510E185;
	Mon, 21 Aug 2023 03:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8CB10E187
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdksJzKeCQ+sx2kS/2V2q0UgOisgghdxTJFpIpMQEq4Adj7WtT3TV7BoRzV9GN7o0OvcjlGVLetzeymOaNpaEb/WusTDtuO0Fe+HCe3wJmsUuSGaTyyEkgXVS/EITKXhCinrcm390CV9ppnRaQKo1gIA1+QhmK6qHlATwxh5n9pfGhknsq5i8RBgcEDWg022DrJLwxstfKf2dB8LBrGPneMaCvAjX3tVMqo9Szq/wOn9XavNDuoiw+P3cD0RIagkdPQ/9QgEt/EQvRDguuW3yYZYCArZVvjJ+LtEY3XtMcVF1wWlif8B4y+BVVOIV18WmnyU0cVjNGgnrpf6+r/FjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaSy5Q0CXsysYWOiOideIJmkgVMU5fTcbKDsyETU8EA=;
 b=Bp61OPv1E59YXBinTpJWpcDQ8pZ06TTqPHSp+70CBmLwnFGOOBMV58EwwtTpj0e1l9YzwQhZQqr32BuyESr9PQXK4yyR1MERpMy2H6T6+kdygAAq8kF4u2IAzNsTJNzLMQgTIH4fyv40pK0c3TggMjln0050quPzb/rdcvcPuNcPONp0dJGvDfteavWPit8X0xUZgeOD3MpoM5bovDW43RXLQZ81j72ui3EOGeubaOrImuvFvo8LMqdEW0mOOpcuJyEsCiZetkVRZxsNgrOKZMXBCD1fOhpJszv6D9Fo3MlZ3NdNFH6rkeVx9Jl/WBnpyO65OpPf+WxmRWZxrwuLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaSy5Q0CXsysYWOiOideIJmkgVMU5fTcbKDsyETU8EA=;
 b=lnyL61r0OG2JRw2T6W245y+1ZtgTTkfqbyNyJgz3CRkjDV7yqhMwoshthPZQs5u9smQeeODD23/ubX4qfBOqChmVf5Czy5hSaa3ip+xnpZCnziuJTK9pSIU/BRVoR8kMZwnt1m6kpwegY7KNmsRgNsdempaw1YPlNZ9TQ9190Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:37:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:37:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 8/9] dt-bindings: display: bridge: Document
 Freescale i.MX93 MIPI DSI
Date: Mon, 21 Aug 2023 11:40:07 +0800
Message-Id: <20230821034008.3876938-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230821034008.3876938-1-victor.liu@nxp.com>
References: <20230821034008.3876938-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e912c4a-66d5-4884-520f-08dba1f7fa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLa1p0JUlk7LU4/ZQ2d9vSdssuPL6HSe8ahGEw/3d1XEX9KjhO/E/oPzCyxVHY9VEurHjDIqT9Tr/hB9RlDK/2r+UvD8XpiKc6/Hqui9S0kc+dhK9TaSPYMHpt861jy4Af0EqWEXvi5I0bEAgpsPKsZrOFYZkwXDpuqqeclFGExSIl9pKTPwFY4lr/gKlItWDcNqT9GGN30Ae0ogYV1yvcU8ovubBoCtprxBt35M6nq0kaiSoBa9b5kMmD0O+kmtFtL5j2YvKJfPmKGmD8kgKScGGGvM7ewj4isxysjvZpLKzeE4JEwS94PtbLqypj8LClmWnevvD1bAwlftynrgmmL9lgdmAyZm0LFk0IZi09/ncnwTrYzkQoOQ+ZI79isz6SWux3ksgrZn9Xzl9jl6amNW7H8kgqBJJVAwHGel2i8jX7SOmBVFqm48ZPVExsXB629hLuVLyvrtnhsf2wHAvKq+namCZaSYCayhf+Ev4I9BJD6DYSboJ5xCpEiEzxHbDMnkALSNy2R7BHf6NSkrvwYfYTEb/iO7P5Iwxp3+rJBHMLAgF6GfCX2LAUoCzzCzdvVwUOJuLNnoZBkNqAEPsXgPlhoJTnWh8wKBZsMeiWwhqOqnwtmgohK+erR8p8pTg7iP6OPFgKjd1lDdVBoa8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(6666004)(52116002)(966005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oXWOCZOlm2yjz0G7a+O44/ESCA09E25tFQSMH9cjK7fAqfNChBohYpvlD3Gz?=
 =?us-ascii?Q?EyeOgAuCihFkCK8tnkD55iHRJI+I1lZdMoWMMYwvtSRh6W+rOHbavp/IlDzp?=
 =?us-ascii?Q?kq9Ekse4FFF/qVgABDzja9GJqYy5oRa2yR4buyC3B8z/TBev3LBdRVuZUAvW?=
 =?us-ascii?Q?rr7/N9RxmLhLgl/9gYz2oaj9UUxZC6y92Z0Mg1D/N85gG8ZkGasPNj6Ol5im?=
 =?us-ascii?Q?Z6l+pI0wBY3/dUv6bq3igLuO8tYRbxlUTkRZsOzl4I8lQ1IG0UCAs3OlE8eY?=
 =?us-ascii?Q?74Bfmp/V+0+pawopStyqEqBOuwL20eab1xdRKZg2tjdEajrtV1IgTdddO9CO?=
 =?us-ascii?Q?eZXCahjrMRPT/uFQZQtar+MHsqmYy541qcT9UYO3eQG/UF5YbDSRRl3tA4Hh?=
 =?us-ascii?Q?8lqGj0xIlUejRs2A6KxPKNo88s4Cq9W/xJ5tOk2VMyICWQCgBf5itnSItDL/?=
 =?us-ascii?Q?lSuPrXhb77F9zA03+5zzydTjXQndbj8VCQPPHWUsvjNNShJAI/QEFj6kXz3K?=
 =?us-ascii?Q?Q+hqEwByI1AXXKQCnjJ44FWmZ0FXphrzeJR3Robj3daarMu6JKwYrku87o/r?=
 =?us-ascii?Q?JgRBSjr6P64lZMJx+wkGJIVlgziBFcsd7/9LLZGPuFGIGLefxv3Qqp2kPW9p?=
 =?us-ascii?Q?21E9haoCwHc7zTbk06J5P1NIOTs24UlxuhYa1hv0cmxTIF5cs90Vv7tQF50L?=
 =?us-ascii?Q?UCkQS8nQUKhogVJO5Of59a/Z/uD1aas3s1S36jnlKKVYkpYBfOd2EG6F8mlP?=
 =?us-ascii?Q?jzJ9KviEUlhaVXzl/bSi/qDtFXKbm1xPhN3qATIY8uAEETmu0UYVXDeHIdFu?=
 =?us-ascii?Q?TMf9Sq4oXXnTLC/lGdpY3sz3erMJhTtjbWfEkp0pUfsuI8+6gFzM7kF8XMuZ?=
 =?us-ascii?Q?6x19ESwrJ8GT1bW1PgxYz20TdMmYpQoXTGyruWnuKdY7HQYcXwAL1vym9YtL?=
 =?us-ascii?Q?p87wdA0OWAzxU2dwj5F8mTRzD0ui8NytayRfK4/aV2mCoReXbAhXsz9sdmPW?=
 =?us-ascii?Q?CjJI4LthhZoxcpa6vejkAYc5LMm5/qEXQI/Rd2kHkODTkFZZhGailGKg7Eh4?=
 =?us-ascii?Q?XKPiKeU3/6SW0X/aTjr2rpyPK6gmOKsgpdAB1GNLKj5dqrHKJZYsEnysFPvL?=
 =?us-ascii?Q?/zvsWJPpjBKRaVl1bRH77TPWMeGessnhI1MQQpG4X4h+HrTdqC55L0Pr1dej?=
 =?us-ascii?Q?HLkFS9ogQ9ZSi7RhYIyA9JUrE3pbPSgO/GuGdW2IiPuWxWFJGxR+UV5uBact?=
 =?us-ascii?Q?W/pQwwsjNLzp2z56yS/tBuDbyBXEbynNiOWTh6swBpzwSS34i+CTzXTJ+0Eu?=
 =?us-ascii?Q?aCZ4lUispj/TOVMRiGrsBWkYtp5lKP+SnmmFJO3T8ckXqaUWijIwBVQ1KuQw?=
 =?us-ascii?Q?UCI3b+speJtdnAucADcr0TN5w2Ub9dsMjfaKCjMYnoEuLHaCDDOhidLyX6dm?=
 =?us-ascii?Q?ImPALNdp2mtqiy+f7D17o7Nbu9tHVbaqAbc4Rjba5UlvJHkxbGBMabSq22ij?=
 =?us-ascii?Q?5Sd8GgBBXmpJ2To3w9ALOncWnH2FETB8qniJGRwW4ZiREHb5hOEWoqvPv38A?=
 =?us-ascii?Q?jZBVr5pdPJl85Nqjk62WSGaaCXFVYjCAz22DIND7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e912c4a-66d5-4884-520f-08dba1f7fa00
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:37:42.8059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bv9ezjLVLRrLd0cBRx8R5n/cGa5peuKWxQ4d3eyery+jPRYFe9THmH8m5GewstqKhg/AJY4p8ZpW/vcnbP5n/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
controller and a Synopsys Designware MIPI DPHY.  Some configurations
and extensions to them are controlled by i.MX93 media blk-ctrl.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3:
* No change.

v1->v2:
* Add Rob's R-b tag.

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

