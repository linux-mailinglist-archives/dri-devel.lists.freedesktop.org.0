Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDEF77196A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 07:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EE210E1CA;
	Mon,  7 Aug 2023 05:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1E510E1CB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 05:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN44cXCyIcdjz75jWYlCF2ql+/YZIzF/Ou6h4chyoXDJ19CuxxpBrW15Q84IrOhKhSuyQ7BGRJBvEW++hbJbvo5+pQsdsROAcQWezKYiuMzuZIUmSytn0xjAEBTQR2YJZd+y+z6GGwNku98b+lSZN/hDMHUf3OnByrB3o+IHafNEpKNBA8gOteFevoX4zPClWXR/I0cp7UCTClsAvEM8TRWKSDO/6Cs2+kLbLm024bSOTF6aXxkFPDVRvYPvadeITe8cTFPcPVRNO8HigfMkZkpzTKtrtEawhqUFjMRXoh1xw8GNqrXVQtOP6j1T02rOR7F/H0xdvFp5NfFOAvutMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaSy5Q0CXsysYWOiOideIJmkgVMU5fTcbKDsyETU8EA=;
 b=dMYUvb6ugZ4ga6WknMBPpd7GDbK/iAJQq/iIuhTk3Lh3DR4xDUu91I86D5TpeCdGIeos+3t7U1JQh3UCL5ypecIY1KGWwsMtndA6rf4F7y1UXxeMC6o7kXT40FOCcTDXr7r1YUiinvYyqUlQJauYzePTFG1BMjjMJK+R7vtX/3DfAhIL+Q13xPnRgJ1EibFb0tHnQVNbaZvZ+oUIgNk5Dzbyb87wl/hEFgx/1OPeTgqsFXaBayWBLgfa3RmuU5osQkGcOKgVeFA66tfL0qJcuLYDClcBEscr/auWtNcj818MXkl6f53k9pQtbt09HdhKpahHRAw/3P4d3xw+/F9x3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaSy5Q0CXsysYWOiOideIJmkgVMU5fTcbKDsyETU8EA=;
 b=jS/wFCMv8CRQ8IWyK61m+sUSPULmNtgkPBrP31H7ScPoo12vtOp6iJEvmWQIKopOOvOyAXnrrPLfTpp7/feaSDdRNAKOIXWH19wq38dn7dgZWx3SwdlJvwJs6XfTzY3tWP2K2smzg477Z+05GGn/8kmDk4fO3XaXDdpVN/JZXPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 05:22:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:22:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 8/9] dt-bindings: display: bridge: Document Freescale
 i.MX93 MIPI DSI
Date: Mon,  7 Aug 2023 13:26:07 +0800
Message-Id: <20230807052608.3038698-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230807052608.3038698-1-victor.liu@nxp.com>
References: <20230807052608.3038698-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 6104382d-7767-4f93-42ba-08db97065585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UT35+6FAvWXpTHNOtLRLydFqVNPg2JKbQp2Dw2GYyOSO9n/rlyQdXJyw4ydP1GExVZJnwxqjx53vscX5YDjfT+fzfn3DlhQFlmV8RAWDP2iW7NqqFPjSl1d1kUJv/GwxvemMhPPq6aKNDt3XQAbCUBW8LuN7xUGwyXvD2lOkh9htkmPIcr06GRWJMoeWq6MynDZl8DZ5oSh9GoeqiH+w7dHHWIGPEnT36tXAwCzZtMJNaHtQx87TJKSFqkyCekQbt3cDAhN2XAHeS7tAKuTM4LxPXClkgpQgt+QYWLv1gXw+L9fw5hdqt+HXuBhaB9yGqN6M+OXBH3yDru1ol6U7yJ1F6n3Izp5VJnX5p0e8MDSAKHsfn2MW0dT9oK0/nE4uPIbvWyOq3ooN/pk7UKx1JdhamN0ZW0usTGVBeD5k9DEvqUrvbTs1yDBNPHKfwDjtcI81Yc4esxw3FeBAIWXyAU06+N8MXDZA6fXhJMo5kzP6f+LTf3AbHCSNGnFzQe2VCk80cWsDQl4nfxv2n7zXLGZyo7sLydopJaMTGv8ha4tN2k4vE7Gkbzdd5xc5LEAEVL2ml6gd2A0y34Wn/NFhPYk5/UftIkLO4qo3jJ+PS3fAYwZ1DgfASFOXpQhSZGRU3YIebuomxl8tLhczbzk/Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2616005)(6486002)(52116002)(6666004)(6512007)(478600001)(86362001)(966005)(26005)(36756003)(1076003)(6506007)(41300700001)(316002)(8936002)(5660300002)(8676002)(7416002)(38350700002)(4326008)(2906002)(66946007)(66556008)(66476007)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o0Bkq0DhcuoGiAjEo62bFfQMUDvbZcKIKsRMpVaEykSekD/Gk+YvEw9UYkQr?=
 =?us-ascii?Q?ROM478QV+xpZfSnJq2EOT69qLvVu7vjMOzND8p0O+DMPU8QDOWtseJdVtqOD?=
 =?us-ascii?Q?kL3OKvzFcLuhHY4vV6UaeT/vRTqKOgjTYpPxqijU2cuawPsE3ZESJZbQpWDw?=
 =?us-ascii?Q?xLgNWZuU6Aa60KUcC7ikeM9AknKY4QKWZbI0k6QvhbCvO1HbGx7fHko4ed3u?=
 =?us-ascii?Q?TCcvI9rZwICu095DKUl4NuzHaofj+543PDSQTMbKeq2Esc2kUoAGwb78R5pk?=
 =?us-ascii?Q?mvo8YJTT7WRRgXsj6LgeMTSHM4xwl6sbgebOtU19EVzgvwjyIX4zEcc0SRm4?=
 =?us-ascii?Q?0uxZDoVA+zA8MWQ/RCy7oQyMnhLk9XSu4d8ALbGI+CzSRB897xmMsk+RLIyy?=
 =?us-ascii?Q?ThPlPAsJUB28wb92tLy9zFaarCC844C2ff9qaNoGCemHfQ5x9qyoln8yGVBX?=
 =?us-ascii?Q?XLRe7vvjgSIEE7uo1HlINRUPOr/xI6Y6dUJ/w3o9vunGsSgJTHW9VK16YLvu?=
 =?us-ascii?Q?DoYkcbahaxEiUq4tm7D9DhwF0M+/0YEU083Fslt8VjyPUH5hRutm5ZHMjhHQ?=
 =?us-ascii?Q?2aKY+gwOsucU7pL8tMfHZyPQXYJnLg2NwZJWOArJqruSahcwTdG5MCxse4OH?=
 =?us-ascii?Q?oSoxZBYyVBE0D7dpc16AGXBR3rrizkUS5HxKoUEgtot+0HPRVbRKOtlDp5y/?=
 =?us-ascii?Q?w5cxuA7SXnUxDmmPdXudraQQvU+hSh42fCWbtzM+XJO4KCY/jWzkMrW41Iuh?=
 =?us-ascii?Q?W7q3MmL9JUl/EEwCAAfR66d3e9aLOtQ0dDi6NlatA13Prx/+zh/KU4BGXxb1?=
 =?us-ascii?Q?awiVFDI8NunVj8SP3/ZOymWL/qm5jnoE109KTPqWcttRj/PgrnJQaA2Nv8s3?=
 =?us-ascii?Q?F2J1GQEZPsKWwskSlSu5pBq9NbUdGUtv+Cw91ND4kFVaQCOZ0J9P9V+sYcyn?=
 =?us-ascii?Q?haf/g5l49rFzkTHfJcNQeRByDJSA9PVz0QrrOacGeHvwtcgQpWhLUA3UrzLX?=
 =?us-ascii?Q?mU+gs98R6xvr63cIL2MKyzusr4CcPgZDNpoeGwN4FRj82ypcWJAj9ZAG+MRY?=
 =?us-ascii?Q?s+cAdnYYWp4ViBh4uihqjZr2hyUT6J7diJ+eA3r44jCVVBX2aX/P44CsLF+G?=
 =?us-ascii?Q?36drnTsNBNfy4V98V2+vMWbh6bPVU1yizZ7tlYx4Xse5UvoscmqbnlBB2y0G?=
 =?us-ascii?Q?Vlgw7RPHJa0CF0bCFrPDp+vL1FPrcRYnSj3a8j5l7bXgGNXOfbtfYq2P0shY?=
 =?us-ascii?Q?86MYKNlWJK8P4o+Fl0VPs4SN835pim5PSyee+N1+2/hp2Um4JHtE6CBmrrjS?=
 =?us-ascii?Q?ujAYzWPxPFWdRXvM2j41KuCILB9+xLfKi2X6cllD6l7RHDjGBL19IZTi8og6?=
 =?us-ascii?Q?vPNb8A+0bNDDGuFbVZ0rVQslm09bcE+3sBfto0mepvyAemFrK9MHYMTRk048?=
 =?us-ascii?Q?M+31417HRsMYWBd/rRR14JrZCbIyTUqZcZNiJMe8bdYjjEbhatX044L1Wadt?=
 =?us-ascii?Q?oOw4VIcPUMkLB8OWaq/c+XjHzrKbVhA3Pge+dswhRaHjrrbJlwNo0a1/C4Tg?=
 =?us-ascii?Q?YWsHwIA9PYD6mz714NwOwXJ8yRCLqbAqBQ2n8NZK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6104382d-7767-4f93-42ba-08db97065585
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:22:46.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlZy5OZW4cmHHTqt2YXyVX3C0GTH34Xnvt6WHp4mNVs4ebB0rePHQuJ6ZT4yDl8HQLKluxcmKzZkaxbv7gRRUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390
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

