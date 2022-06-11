Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015E54755B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785810FA79;
	Sat, 11 Jun 2022 14:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60046.outbound.protection.outlook.com [40.107.6.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2F10FA79
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms/ALPDcKIIzIIxGSyIAiubvRn+b7hEMr1qir2st4liLUT1rqP85Hl+JIO+dT/4rolQX8+4xVowZvB6nKuDkYYSVUjHVr5tGFSq2PSDQnNBL7IAhv2bMsrcwUK9qE+IdM6pC1mudLf9xvsvpqkXu5OAMkfWjFDDTXN4fmuiRHAuRLpDrvrI852ehcNUXkNBiRna9bkSsDJvzJgLml89GSs0gaoTB6T0gO5FDodzYqFPNVtz4vzAvpN1hew0qIaq7vRsAbMa9K0AUSfIDcXfNW8s/OIwgindasH+py/yvRI4JNlQAsLbPmXUkLwPYzTjcyz+49w1dhoczccJxw74RlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nzwiaILeTGvvZlpFW2CN9yrCZ0Qr8QEleqjeVGUrwA=;
 b=NWw/+YLumMpmgsIAOx3LfHA9TtcOh3obRRC94l1HxdjRnnTOO3NF04ECzLqpWPg0m4s7wisll6PxIeMPX9y2uxtJYNP3D1CqYDlhf2q7738PNj8hqYWDNdXuF6byZ9Ls4Az6tMLpx7TEVKYUbcSaeduU7TA86q32w7W9dJP7sIQtYlbqxpykSLMnfPJ7WMirJkXUgitq0Jpx7yje0dGgfUEd6B06lmt5iZ7f7yWV0pGxKoH8FyQADw6DLm5NefyQBxzovDjAoCZPZhd8eEMcunrBE7JtNMsTu7EnPurOOYkDT9yiTGTZszEbQc8LLXB8gVoZ1SrbImfVg90pLjQIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nzwiaILeTGvvZlpFW2CN9yrCZ0Qr8QEleqjeVGUrwA=;
 b=NAnvQJtx2EZeCNfK537uXaCBjKVWHWtiJ61Xgh4XhiELjg/esb8WjP/pYeaJd1vy5mHrgVqS1MjCLySCrLxPUGy5iODPUJVC4TWUrWLe4Ye8vkYrlqeSojZdT/yx0qet/r3bW9pGOxpUCUVbmcE8cz5a4b3cL4ypSh0oZd3R8Ow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 10/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Sat, 11 Jun 2022 22:14:17 +0800
Message-Id: <20220611141421.718743-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eea83e0-6be7-436e-c0b6-08da4bb49f35
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB63479934CDABC65A4B1F8BE998A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CaJkSJ57R7TU/wwc6H5ZNNQTPHkC8mH9ifl45Uhtr47rosOYouTt6nNl2s750cmm6+xcdQymQJfGDD/udui/tt44QWcPewFYQSeT0XuB46YVddWF6rL63crm/pOQTN5jZrFifam86r5DpPOCaLHspOQuCXqaa2MYFRzYExgn9rSVPL2+NFwUciO0e4VU2ye896ttqK8VUfqhAScpHaV9ZaGaPXpdovx5lJRW+sNnNzAX1s2uoj5yy1WKW3iCtk2NKV6jw8fJixidbaMPrHVRtj9wRom4Ov6Af8eSOdHeXIJpo+ZT2Il3b7xPwqaN/WHqF/4eMIWcJjkocQJRKCRH0WIUDpUp1M0XAQh/EUBW8u00Tb1ECULpEQDi1sMeDKF4DPRiseZ0Dmvjdvs6E5mkhT7vPBkEVxcpkJTSo3ipZ9Y+imXNSyHDE2Bq2tNJOfoxVMi3kX4+J+m8Yulj0dXSxipWkR0ZiQ4kN7iGPQEQj1VLo+wmZCnQ+eGVENLBkJ20IUq0of2gLfJgF9FH7CjDmcWOp8nWAhhloH/XjPtUDfCScvP2Ro1N69suPCCROMXVReLQBXTcVprjo3hSQ82zw1+nNVkdrXXJjdut2kjLwUHivGyFmZFiIfWNpkQHLE967Y9nWFuRtbCITo7cBtPFbyfgmTdbpGhuhPheCQ3+6lV5+jqR2pHoL/p0WxCkKgNdwMrgeU5Qdu/5fcaKvLVVVJ9CqfRtSh3dDh1dw6uQYfaREUNkok28WkLxeRkyavF3GriKYVhLLpPpssOY00xG8b2RLn7Rtok0YI1ymd7CbeZtm4zeS2I3nmvror/PMzcykLcZVP56DNiWmF1HRq5++w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(966005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ol73s/IT6oB+3pjlGf27h873W0uOQwOhrDVg4cWvPIdnFnrB3rB6wrXERURb?=
 =?us-ascii?Q?96SqG8Rw1YXxGsiGQtyZG2/CPwrmyOHltuh3KwwKsxkpMGu+v4n10ewt6Acv?=
 =?us-ascii?Q?ZI/Ln4Q7JlmWpJnyVHq7PNVQGV4e2TSOaSpTCYNyGFNn8D3tTwP1dWqJGR4G?=
 =?us-ascii?Q?QIbKO8nfAoSIcBl1yq2N4nwnYw9p6UIoIJGiBSaY2G39xawNvxIjdcGMB/mr?=
 =?us-ascii?Q?/gi2/L17otH7VMWESWZ9mz5XIME9rGkLaArNVEmLa9JOW+IVYDF2QecFSRWi?=
 =?us-ascii?Q?hI+4ZwCPxsq3tEEBpkpwrJuEHmiMszE1t4G1wq9SsaFXxr+43Wr0YXIJePxO?=
 =?us-ascii?Q?u7nzs6kI0gAkqMDUZ82PM9V2/gy1+cxorUiGAWnMdeQ1qt83fa0aGh0wuykM?=
 =?us-ascii?Q?kn9oAQqMlX1jYE+QjMmQkO32tThXKIewMRiadgGYK6vPsVTJPbhv5ViPe0oD?=
 =?us-ascii?Q?N7ZAy/ipiyD3mE8XuZtptGRrbm3C6mgszCqhAhLEA6iwg14YedKUvNMV8N1f?=
 =?us-ascii?Q?X5R5hcV1UkbqbETLxETLgRyyt+MXXDvIMQPoL8Y53yz2qP0c1pA5T8GHsrkx?=
 =?us-ascii?Q?lB5I/t1MGdOs7Z8o3I3OlSK6DzSteCIMfY7pR7rbh8LE14FNJfPidTe12WUU?=
 =?us-ascii?Q?ER2/hSNovSq446p3s3SvXUKXgcrofTdSzf/Bec4bMLmQKGKJ3umwoFnw9oz5?=
 =?us-ascii?Q?KOgYXqRMdib6cTn0EKLx+Zbrhbylo0QzgrEdiC9nXcykJvzZFmQE6TM4BaPE?=
 =?us-ascii?Q?8kVlNZHlqESLEvtjjkbQKny/hAG7gMF6n9dir4vPAVEsbe/6VEZYLFd33e8q?=
 =?us-ascii?Q?0Wrc/tnGLndrqBQcX299Si4rX6vc7ItP8LacUNEOsxyrF+P/KfcU1lHmfAs3?=
 =?us-ascii?Q?X6btZoulsfqgyI2CAycjZaUYAXShLh0NhqWRgagIadk4/aGC9VoKKtel2kEX?=
 =?us-ascii?Q?uAnoO2MHmds07Mpltd2HNJULAixLA6fIFB0GSDlXAfv371s0odz6kct7QY9C?=
 =?us-ascii?Q?y+lqYqAtEZ52tL1UuUPnS8jTYL4nIiRqIGpkKOzSZYI8MnlYMxQQqE8ZJ1t0?=
 =?us-ascii?Q?NG2XNEiLuT16TQFxGqzoOExTbdBBKYs0mrW2QV9JdTgYTSHAvC04WYmjbgA+?=
 =?us-ascii?Q?LGlILndEr5BMRO+NjZBwwUseAr0omzw8t3e32uk69IybCPKYpJWOy4G7v74i?=
 =?us-ascii?Q?3U7l0KNyAwWMRt+nSxeGR42RK+/zjQ2iV7iA9xNmlsdEBWzjGFusiIhLsxp2?=
 =?us-ascii?Q?wkC3W/bmsZmqc3p7l0Ieocx1cIuTjeb8lKBvkxih0+mB9jLSpaUmuLG5lHZe?=
 =?us-ascii?Q?hoQf3lJAVXWGXJ7O2f7hKBcd5Tbe6V90T1qBNKlCCsM47R2WYc5yL2CCLezP?=
 =?us-ascii?Q?7W4VZuUTJFW/KFl/y/iVEOVT1+1hZzA+D2n/Iy6GQLA9sz+51NiMi4jBL3Ob?=
 =?us-ascii?Q?3DKLUaAQ8BpHOtX6QjQb0J8waq0DsXdjpzWEcTQcrqGHaw7k/pEAyTXQUjeq?=
 =?us-ascii?Q?KpvbrWVTG/VI0Q6Z54HVDaahzyCQpcunn++9Csi/J/O+ukAWRFVuc2DnDKjh?=
 =?us-ascii?Q?qO7EmMavyc4h8vNintZgVC8ku1bD5qzA3DCP3KtDeZTR4l4vvljaYJVMoJIF?=
 =?us-ascii?Q?iHhCC4PHaGLA2XAsUvYdP7hkR5xLY0kSkSzP7ZteR4OYH+DbHp4xw3Ugqx2Z?=
 =?us-ascii?Q?yidShHzVvJLZ5jK4vlientxcm4ppSHU+SV6vZhxrhkj0zpcqMQ04sKU8/u8l?=
 =?us-ascii?Q?XVRUUA0VKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eea83e0-6be7-436e-c0b6-08da4bb49f35
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:56.5049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXMzfFTHkM5zpUf0edWbbFXdY/8hgsHthNy/z/+unB6XmAZJt+lqK7cQHaLLeodkdaR0OxKvEtWR80CMxdUsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Rob's R-b tag.

v2->v3:
* Drop 'fsl,syscon' property. (Rob)
* Mention the CSR module controls LDB.

v1->v2:
* Use graph schema. (Laurent)
* Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)

 .../display/bridge/fsl,imx8qxp-ldb.yaml       | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
new file mode 100644
index 000000000000..94543006f5de
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp LVDS Display Bridge
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
+
+  The i.MX8qm/qxp LDB is controlled by Control and Status Registers(CSR) module.
+  The CSR module, as a system controller, contains the LDB's configuration
+  registers.
+
+  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
+  format and can map the input to VESA or JEIDA standards.  The two channels
+  cannot be used simultaneously, that is to say, the user should pick one of
+  them to use.  Two LDB channels from two LDB instances can work together in
+  LDB split mode to support a dual link LVDS display.  The channel indexes
+  have to be different.  Channel0 outputs odd pixels and channel1 outputs
+  even pixels.
+
+  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
+  input color format.  The two channels can be used simultaneously, either
+  in dual mode or split mode.  In dual mode, the two channels output identical
+  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
+  pixels.
+
+  A side note is that i.MX8qm/qxp LDB is officially called pixel mapper in
+  the SoC reference manuals.  The pixel mapper uses logic of LDBs embedded in
+  i.MX6qdl/sx SoCs, i.e., it is essentially based on them.  To keep the naming
+  consistency, this binding calls it LDB.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-ldb
+      - fsl,imx8qxp-ldb
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: pixel clock
+      - description: bypass clock
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: bypass
+
+  power-domains:
+    maxItems: 1
+
+  fsl,companion-ldb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to companion LDB which is used in LDB split mode.
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a channel of LDB.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The channel index.
+        enum: [ 0, 1 ]
+
+      phys:
+        description: A phandle to the phy module representing the LVDS PHY.
+        maxItems: 1
+
+      phy-names:
+        const: lvds_phy
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port of the channel.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port of the channel.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - phys
+      - phy-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - channel@0
+  - channel@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-ldb
+    then:
+      properties:
+        fsl,companion-ldb: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    ldb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx8qxp-ldb";
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+        clock-names = "pixel", "bypass";
+        power-domains = <&pd IMX_SC_R_LVDS_0>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+                };
+            };
+        };
+    };
-- 
2.25.1

