Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9A31E4A9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9986E826;
	Thu, 18 Feb 2021 03:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A858E6E826
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYcHytHUcswbJfcdiYtyWdXM6oEuqg0IMszNYIJyn90KAzXd7PRAJ5qZs86KuRJt27JRkIZzQ/HdnDOxDy9RIkZyWFiD6VvWTM8Ba+uQ59+aF4Tu9dORKeny/6UGYaB/Aa4ynN3DVUBwUBhrzWqlWDtRXSztPaOWmpTlGDquAHAZ7Qx6i+3iSkqy7zEtG2meNphG525h2FRrD94vt/mdCq8UdSZRylM2nuduZp4WOmvKgELknKrDV2gpBd/BskAiqEGBiwq/cgvLTqj8SGsUa0bkvW9ZMzy9r/fVcjIqCv99rBuXC34MVqPRHpn5TIFYWsZlm5blqjz462jUA8vwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yykqupfIYQO4QHRQPuj28KPN2dZ4+fmhK+GmY2BRm84=;
 b=BhSuPrkIz6O7h0s8H0UG5NucXIHESrAEBfTOwbVX3BvKGczMJSloIg+IOBsPU5q/ZPRnCZKWGBgccXIiEqapmfY5YuUNVtHGHHAU+p0+j4ykkADQJhhW9g8pk/XfxYwGhFvZO77mjzD436mW+V0hwmqN0cJcL+Fg7aniDWKmOShsK7HbMINUtf4jewe+ZAdGnB+wm0nrAw/OCYj2dZeVk5cb6mgkxHXSiF+Id0OficwMIjZ5Gu+0Fh//SUvYvKmUfAfvbjm5L9TG2lDYyea0lgYAxLIfTIpzfgczheaNkuJZuLIrV1B8uNih7RODJwYINmWxdhYu1usARoo6FrmnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yykqupfIYQO4QHRQPuj28KPN2dZ4+fmhK+GmY2BRm84=;
 b=GCf/I5zvVxI3oq7Mt0/hOkwidup0MHe5vlLY4RCiujjAbbyIdfLs1GUCxI9IOCTDaBnSp5xk6gE0mhBzif4bsBmGTdu6tWAgEaM04CRRdPTD3v81kOaN6A9R72to+4o/nzc5mTSY5gmDCan343D07gEGdU02A5R4yBs5tyaTano=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:55:13 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:55:13 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Thu, 18 Feb 2021 11:41:52 +0800
Message-Id: <1613619715-28785-12-git-send-email-victor.liu@nxp.com>
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
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:55:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7c485de-56f8-4b99-4580-08d8d3c0fea4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34210AB14FBB6D9701C2182B98859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YR8xG8f8s2EiW1miujcP+RJxkyZ7HZt9Jcj4VZEPZV24ViHBapOMx4Uxq7kZClGl6WEMrjGycYNqgAJkkaaQFAhF2q1JkxTMDqFAMUU/OOio6NwkNUH/cOW8pV0khWfFBZBx34nj89VztTkjt6NuQNQUYOiRgNldsf3enpND5vQhyFsI0vNQRQvUfjSPz/SHbRzAOwEngm7UKA8ld834AZ6SuIX2Gpzad5oyKrXBOBNuscWpkg/EEUpCQGWddkZjE85lTXhkggj/vBTuJ7ea4CoW2u6fsB1qcBsoLD6YcMPcHjRgeGXQwRzq+f15ovVfuiQW+B9MMJjlJAiRwL8b45RN7IoEos6NhdIEaSVadOVIbxfY9ewyGnq0DuTCvZIdlLMd7J+yZ9vYLFgipheSUqty+HVpDmpzO0WpgQocB9i72LhFp/q0LQ8ZD5iu0/r4CzNEyFfqSVxOe3NvtvSwmTCzZg9wEHnfbLMpHQ0581qbREHucAqvo6WvuM2sIliC4oM2l+SvGZDY8byhjdExPpxnyMQRtALcNqCIa+tc9m/xUm5PkPmsjq26UNNMBD2oYAzLB3VJeqgJfYJJde8eUXH5lmF64GtDlUp27/PfV8/bGXU1tx02zLBazUApr50sZg4SWIHk4WqUWYWfODwkOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(966005)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0apNDE0wEcnipESd+sOYXmS6Mvmub4G/p6nwroh8v7ffmqJrdxUziJF7m4bt?=
 =?us-ascii?Q?/3ZOUrZ1apGYk94AgOhY6ONSAHIAqvtMDs08UyOI6TjUoUAKp7KdAUZlCA4p?=
 =?us-ascii?Q?/ot8ABL46X7ImbMngae0xZw5K/6StiFDdn4sovoRjGoTwOwGPZ1c9q8432oM?=
 =?us-ascii?Q?jl2SWAGyxKTn1OIf/w/UpjDU/QNWfh1oWQtCz2FA4zML0dMK4eRSlxMdffhy?=
 =?us-ascii?Q?T1KjgeK0qdDpDxmPXXIEhfxveHMC3SvWk57qyudv+bJe3ZKS8Mydmbf2dZ5U?=
 =?us-ascii?Q?jErtj6HmBwZnaNPoOjKiugpgf2xO8FNP5QbiUuk7Cj+CP7lrMYFKzLF6XHu0?=
 =?us-ascii?Q?SuFsr69DSs0QhJ+XED+gGC0YSPYHw2t3g5RA8I89eV2D3QRhI3KZWvhAs9Qp?=
 =?us-ascii?Q?hmEdvyAQa5DF6MbTUr/fjKD0TcSWMM7fREKPm+0YtLPUvLecGyxTzD5BE+Iu?=
 =?us-ascii?Q?ij0u03VFhNO2I0732w5ZpzCYYJGsJw0s+v+52pUMjH1sUoD0K97Gq9w4YK6U?=
 =?us-ascii?Q?M/Qz9/fmBcHvl+EuWJ6KXBGi3irg7J9McMspwUjQcQOzMZSY/Qlpcg7U5iM1?=
 =?us-ascii?Q?quwXH4yMipRdEmjD3+blJP3E561DoaDtWbNmg1ZbNJSrAjTlhCGiW0Er1Zih?=
 =?us-ascii?Q?Lhh+qhEctclNQgkPZ1NW4Vjyt8YsJaZPDd6+86Okx4V3OejSm+MepDvAqYWW?=
 =?us-ascii?Q?ZLanhX9ssMf7jL9zYH1k/7XtWg7cHEdH7KimaqzXuSci9dMaju4+7lXk2Nci?=
 =?us-ascii?Q?8odQtrYQQiFkTMscaOA/Gb/tV8IUYxfELtbaNkWKNXQqkVkxGdqGIzfIIYIg?=
 =?us-ascii?Q?9iFmYGocT3aylSx6jPr6bEJVyxJDfwBZ94DcmMXy2jQPTSOPY9BM3MQVCHB/?=
 =?us-ascii?Q?yvdx9h5xRWKQYprhDIkDr0VVm0CD5LhgDm2OjX8FOnOx/JXwMwDvdhbUaEKn?=
 =?us-ascii?Q?r7Z5r3b7PzPYnN4iPDY+fNb/bpdogfk6TqZVORgc7CevPEGDf5TY5uRK/rnx?=
 =?us-ascii?Q?RhwwKST1FOszXvyLsboVsdXokKD5XGmiiD4WxI9KJSIrODMDxuzwXMeYGxpO?=
 =?us-ascii?Q?0OCpiHDpiyz3AWL5czalMdxvYcu8lqs/Dhr5m2Wu3XTBfvtBINsTob25i/Z0?=
 =?us-ascii?Q?yb1w7F6SeZXlpnBHYVLkecv7IwxOXrcoxaHoiFbx6OXn/ImsMRX+yEEvQt9A?=
 =?us-ascii?Q?oVM5zay7OeYWZhyJXMPnEiojchCvYjLcLOqyL5gKdbHudaJz+2OxDZVb/lht?=
 =?us-ascii?Q?Si+J4/Rdwj5QqUILEvFE2FIDszAPGpjabbttpWaaGbP+ooapKjxWSmugGDRz?=
 =?us-ascii?Q?Wi2r1SA5d6LTbA+sluFpbqSI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c485de-56f8-4b99-4580-08d8d3c0fea4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:55:13.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wBh94GSb+RUTjElsn2lK6W2euUe8rVPyl2nsKKhfVA+KuE6LxwLseNerksb8fW3tlDWs0+IUnmfmtSsSyOSjA==
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

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Add Rob's R-b tag.

v2->v3:
* Drop 'fsl,syscon' property. (Rob)
* Mention the CSR module controls LDB.

v1->v2:
* Use graph schema. (Laurent)
* Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)

 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
new file mode 100644
index 00000000..9454300
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
