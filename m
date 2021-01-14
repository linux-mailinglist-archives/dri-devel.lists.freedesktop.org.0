Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA312F74A9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A10889B5F;
	Fri, 15 Jan 2021 08:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BC16E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYvaAQnm98EWgP6FJMeQFAK5mM0wYmTJDGTiDlthsMCW5k+twvObxWdeAwgUvq9Kig+fIuTlHmju4XpxWjQjDpJBs/P3Kl3/QwHK8si6Zp4aPbYKWbXgu57zwQoALk5x0vn4yqlic5AfqvbT/7huHWuTPxkm6gUoreEYFj2mivDRWLAoCE3wLEwmEJk+E90dsQx5vqMxyKWYy74UJ+HjzKOzMW/is1vh8WMkKlt4dIX4ccpNGkZnpj127nshfQfp87T1AN0vnHnLc8P+N6JRLKB74Rq3/htvft6fOJ+Ia9/wkFY+b0wee2TR+9RnISI3jPx8M5LlNNrWHxss8Ybtlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRNxQmgk0+i5vewy3fwh2emkae6eP6B2zW6D3OP470o=;
 b=BoXmpED0qxIevDN/Hg3iGy96XN/lroArIaIpkdozZ9s1xmBbclgELN6a102YuBEIfcR3h0ER1giUNPgEsafnPOtTtJ31a1pJXx2z9QuEz1KntviIqTP3c/QqdAHy62W01QkXD6b+eXFtxd2aPAUOM48bl/6D1tYa9lruS2SwQ5VuU8T5Zv8kgcZqHXV5m9uh3ccaBWBQHJ0IdlU1FEUVgJ2P2Bq1wG8zdgLfWbva+hw8OkjounUHTO/msruouTwI1NmPhOSyF0ZY7AVTYN9VnPNrzogrIzP+riy8JRwTuyzU/IwmRKwM8ArcJu80o3bs4hQIig17SdkUE9v9ffRzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRNxQmgk0+i5vewy3fwh2emkae6eP6B2zW6D3OP470o=;
 b=HW499y3e2Hb7/soUhbGWcXIfSUdGbLOuaMnZd9a6bGdcxhpsr8RlOJllRyK5s20eQQPYuFMVvDzbXlY5s1Qp5aF32P3cvpir408MTmPx3INPKF0pQwsHSoKu3q3qxPSRSjMuPqfusnnrC7g93/B2hrROl4YF1ipaelqB0xq8WHA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 09:33:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Thu, 14 Jan 2021 17:22:09 +0800
Message-Id: <1610616132-8220-12-git-send-email-victor.liu@nxp.com>
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
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:33:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a99552d-d015-4106-421e-08d8b86f789f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4893BF5F5E2D0260D80B11C098A80@VI1PR04MB4893.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1/4k55ea6jVZfiBSyVcXKt5WPXtlJah8bFLW3sCbnPFVwHu335rXy7iTxO828Gb8baun3/9Caf16K7e+xwqKDVygnMzwqRJtZnwIA3wmOsfpABSVU7EbJGDSwcKlWb+/VFO1ggUL3Y3PSmY3dNto9qmbeWI+8AaTchTYHJiRsrvUXrAzwKCfO5EzuX05N+5mVXKTO6hVMsbnirMJC+gFsZaZuXInSESSnm2lWLho8N9pFL/17JyamK06KJM/2KZvQk7Lan6T1pTknArV32BKpvVsERbVdHC5QX24rgQX70qHmDVRGEYKr7NaK7tBK62/JgGxxH+Mowy0DkTcpqNgffDWq4IAL86gIOBXbOLsXV7PABZIr4bc4nPDVFNE1vB+xETi3SnqLOEyAC1u3N/O+9zqv3og3PYhFdRuC+0f70uN3b77g1xOtdfaQMiWvKoRmjCxo43wXckdfU9iQhh1CwIjuT4fLuXxmQ79xCfv758VFC7Zi1A29Na0NchFSwKx38NHPQHeuTxUJ3OIOBZZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(36756003)(6486002)(16526019)(186003)(5660300002)(4326008)(478600001)(83380400001)(8676002)(26005)(66946007)(316002)(966005)(52116002)(8936002)(6666004)(6512007)(69590400011)(66556008)(6506007)(66476007)(86362001)(956004)(2616005)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IE/5BFqhetddCC7owOQbUMnHomiOab0atJL78ls7qd2HIR9cipWuz4vu8bPk?=
 =?us-ascii?Q?EbCtV5MkwqXFeQ+JHPAwKjB0zSQM4Fba7WlGrAttkW+gBkuOpekErz7TanB4?=
 =?us-ascii?Q?zu6iG6qb44chHr8QSuqyaY5/vU6rJ/alQJ9JYdlmZjvEUyc3B3eHJFaPKPkc?=
 =?us-ascii?Q?N0FjD4XPfm95BvWyV/KzjQ07Ix6gndojMWrE3SUHsK4vNb4/Z0L5T7lctDBX?=
 =?us-ascii?Q?GGVGVuIVILPCIsknSwPGUVCHMB4+u/JkHIQZYJHrIgUmP9KH9d9TBqOL7r5z?=
 =?us-ascii?Q?fXO4+lKiW/uUIxI7dmhXgdJddQI/CCHGQ/BYEHbFFH03NFAOraaAxx1MVFMq?=
 =?us-ascii?Q?ge3wKOGq7uco5r5vrOmLgw0FsymzB88UG9XS7Sp+ee195YHUBjL5GSHFO0yG?=
 =?us-ascii?Q?PsOcsTvUPH83ZFrcXj2Vd8ieG3MQsOTSDjGZjeO7JKSQttjf8qtV+end95Rz?=
 =?us-ascii?Q?ROS7+mcxDpZfJY124bTOIqu70mHRz0bb4uYRAQTM3xTSmpnQCWhrOmxk5NGH?=
 =?us-ascii?Q?jK1bFDx/hzRJuwGwRWoZjvtTVBYdzcj9jccK8hT+q1+V2/cwgx3mPBY13Cvd?=
 =?us-ascii?Q?f173OqB6BVaaaqV7nlaSJS4IDzu7nGpPNF1eAtYfC+ivaoOV2n1h/lj6T3AF?=
 =?us-ascii?Q?6amYtXUUfXpA5UldkEw8dcm58Q2uT4Aa3/HM7iwl08QcduEWt6EZTUA6sFW1?=
 =?us-ascii?Q?yu30wwlkSRKTeRnAhsdBYdP1uZQa3HVBskzHF3jLyEddRv/OkvC/sM0Hhbph?=
 =?us-ascii?Q?Twb54vmcYmJCzvaihb8NZHOIpywRlc89YM5brpSqSciIzJVNLJUeFok8d6bD?=
 =?us-ascii?Q?HQEC9MKaOHBUFF5mprs8QDRYtQzwwUaAo5FrSm/Et/LpqZ5955j35KjUrIAE?=
 =?us-ascii?Q?/UX50Bj/pMRZwJPEquoMosZYGUZ0u5pLjKNwYXoS4rNDDkcQiNi//QeAPrBv?=
 =?us-ascii?Q?db7txAPJ/9oMIEJIGEwWSIzAKdBrd/BiRf9nPIqyUeF8TyJUyd4aRdsneE1X?=
 =?us-ascii?Q?t+/u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:37.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a99552d-d015-4106-421e-08d8b86f789f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBi/tKBqAFSSvDlM3s2KYvmHzAKbBUbxYPvsJsLB7TSWbdPksUV5yKWlzTjYa+pJ5CVAlye/I9OQMaj8MP0iEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893
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

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Use graph schema. (Laurent)
* Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 176 +++++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
new file mode 100644
index 00000000..514ac90
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
@@ -0,0 +1,176 @@
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
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers(CSR) module.
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
+  - fsl,syscon
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
+        fsl,syscon = <&mipi_lvds_0_csr>;
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
