Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0533E806
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F4889DBA;
	Wed, 17 Mar 2021 03:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D5889DA9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lk2MjsRlfiC3EiR9bW6HvYNHuaHB+yT/321Id/Z9/49jGMD7dqh/ifNqSSypDQy4EQqU7uDL0rCF168phPfsxgh8HK7ZsTKZkPjeQMLGlG0Zfi743e5Zo0mgsDNtAlr1YlL9+WjMLK+BQ5WtCteqm6CXMNHyn6qBjRnkGe6kH2hbc8mMMeKGB5dX9bHME4UXDmWqvYE377tSKUifyIaxqDqWe92rQ2V7LD/AwSdV7+6oKiFykadrEsRJCUSdL1xUhs1eALyY98DbJT7r6zVAlzSo5eA1jHVKLzGEvLxYzawH4plmuj4+8JHlT/lcYVuFgduTdYsqoxNatLEpZK2KaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kexj0hq6BIA1Zj3NRevbvorsRSzQ1UslaIr2gjzADo=;
 b=lo4JZu0lbk39WyCItNtPMCA29+9QIRRftzd1ZNnb5pLBp50n2JwKbogxgyksjH4A0u1kTlroWp/ZW09sZHFf60WqTe9NlCeK5x0dalhPSp2XA91eti4bEcUjHjIeHBfCOvEhk7Zm2033oLKXL3Xyrk/DIiJfTvBMVF6yhYQUZQmcfBqYiw5C7BNSokrDngJex5TmfiKBFQTAGRGBlAcEn5Kte9eubBnPrl6PGAPYul0OLnXxuyNjnNWXAZ4v8QIrXNlzUrdhrH4M322NGdVteF3YNg9CGq5WTEYQoebQ1fYFpS7+pybSCk1k38YHoRB1QryN/FH3HGFZzhSJE/SfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kexj0hq6BIA1Zj3NRevbvorsRSzQ1UslaIr2gjzADo=;
 b=ovhYUVg3CtzrEDLYPlwN+3r/xCT9Uh7IojnPm3Hz8MtIixOZ5q7vi2Wr1KRdUdz/OULfbLE/CtS1Tfmr1OoGExXUq4VBHX7IZgXw4rBv+gHOV8PYciA3GCxyulVZPFH6iSa7Z5Yrs/2edWgzRnKiwkmWw55toYBl7vU0OyaJqg8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:57:26 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:57:26 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Wed, 17 Mar 2021 11:42:46 +0800
Message-Id: <1615952569-4711-12-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:57:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56bab68b-cc85-4e45-b6a2-08d8e8f8c712
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6141AC045DFF9880FFCB124E986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lyaq1LqBJqkKyn1pMSKn5OVVN4cqZrj8qI+vkpDe4zltc/CH4HfcTGzHHAJp7qlIafzCn3+W7s8CMfbe9WoKnauNhfNMyiahpTgEOujLs+I4+cHqRRzhxY6QR1ciZ1/FRX4wV2i+XhE8DUxNwbOsGEwCjZqxwATfAqz6Iw826gkWGGEZlRcZgWMbIDRPpRH8yitn+eCPtdJOfyDgKc23NfdTTr0mjSlZ31jXogitCL2KE0oRlb2HfDer+neD/Kl11Rew1R7gRoYUub4U70Et1d48yjxFJ8mhZRWe7l7dacQ2tpFAzNkl2XtCyanNzyhdUmzBVutaVhK8wHyrsvCXIntdu9G1qC6n4xUZMDj7dk2NEjXNEIwaa8Uuig3MSPT35bdDR/UJl7QQMemOT5T/Pq65tpfe03M1GSqFz+3xsTdHSNjG3xryVGkhTJFPwVXA/mOxBjkl3lvf9UATiOsO+X0RyWVVgDLNUEz0UL+hvq3Bln25+IBXYfCLw9JMmRFOOWzsAhUyik7WRHnP/SPr1vjVbusJi1LMcjBiN5TCraS+i2ePlfHMjQOD7Yg5jHdTqIFU5IfU5k02DyA7y2GhFPyFkwaiRYmLDLbMLdoxHqD2F3Cum/INH3J7OblK9+jPvI15y2z15BzqgH5yqPzkxWQx/CuHnPYWX31jQt0z7Xw9oNx/+KtuFIx0F/Rq8p//
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(83380400001)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(966005)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Eb8OVGUNyxsFk0gkfBJIy2mjZWdLBugtYTrw9+eis8p5D20BPBhiOpsh5g1+?=
 =?us-ascii?Q?+ryx6qZytWs/d6vkTQX1sYslRrKPYhHpes0QqQoB3vt16FtIGwuq8z49nvro?=
 =?us-ascii?Q?R68di0VCc6U9IQvXu38iDzDtQUsDgxX/uAyvwO/jXG2H3snO90p3xgiBfJs3?=
 =?us-ascii?Q?8cd0wlVdSY8sldZRiDIS+fFc02QBOyy9fj0BOs4n93mOszLVBOJzBVhxBd6C?=
 =?us-ascii?Q?FZhiKGDy8Ii37zVO4Gikp9lmwillYb9uFomxQpa5dphRQdGEl0/2++xk4cSk?=
 =?us-ascii?Q?kbamUE4s5ISqFxTGV0PvLtEWkgLWEeVzDtIRCMfRQbXi46Ix1NbOoMZS02Ue?=
 =?us-ascii?Q?JywfNCtgAarhVsEQgwjXkPEEu9W8udc/9N0UeUf70GOMw/uYU7FS7Hw5gDTX?=
 =?us-ascii?Q?RMu1MstLtXEcDaegpGBgFgqkZamfHD1aSFr4XJuzkcdFwoa+yjdqyGrsfKd6?=
 =?us-ascii?Q?l4xq+6voJPixqACq5tZBARUZrKj8RDRaLvppFlmDxuWH5YbCfJiYJ//CRwgj?=
 =?us-ascii?Q?BOJ84k0knhCMWLpDDLSJxpPlHUBR38j9/6hkaezXXfeprfuDuLFbgIlVca3s?=
 =?us-ascii?Q?MBnZOyecy14LyGEEmp1mdxdHCUA/mbSQU3xqKU2HyEqGC0rb5wyDbboO30Ug?=
 =?us-ascii?Q?xGslDTd5TGY5Wae7xGKzwYsY0aX5CAfoGQ7MzbmQrlsuDKABR1Bms4mwokfa?=
 =?us-ascii?Q?6JTZnrzMlyhIXmAEJZsJ9ezBWuPKdrvqZPhedxxznSMF0fN2uTmMQa2MNDgG?=
 =?us-ascii?Q?s/YjwXIlgSmFEZwJ92zMJr1PPEcd4DpugPBdbcZgh4HCrMH7sGNQLjilbX16?=
 =?us-ascii?Q?8jD1M2WdJxD7GhPTv/oFza8hXaah1xH/kxIfE2LxTwbFbu3gRjnVjMOjEDJx?=
 =?us-ascii?Q?QRRlMhcHZ/RF3Dd7zoc80fvErKwvG2PSeLa7P4+71S0drQrLiZOANbN0G8EI?=
 =?us-ascii?Q?BjJDcdDx97uLBCvDG8A2diIZPdSH3//Til0OeeqKD0GcR5/5vlOLMtqJkBVB?=
 =?us-ascii?Q?RA8KsIGG4EShl+U9bum947R6QH9Y5Jq0OdfhO833RMc5ZQdD5BIajeIBPpBD?=
 =?us-ascii?Q?K9b+RU4KkaemvyQ6NVCwOHnYsWEBNuQ/bOGyX/hnt4bAJClBALkdN6Kh3U1m?=
 =?us-ascii?Q?jhqCpHKyoVQPxAbwvQSY6VfJjsrSfwcXZRQRbbtgyotCiEYDVi9t4Kltd67c?=
 =?us-ascii?Q?+Dk3gi6GEDk2KVp+fvEythBeg4b2/GSbecBAJt6d1UIlJI96RGMUNxySn6XL?=
 =?us-ascii?Q?1tsM/djNZJlDBgvDiUA1qv2WSHF+YbeysvEKWyqjOoGH6SvpQQoXsv1dTiQC?=
 =?us-ascii?Q?itVkUNQFphziGWrdruDSAkcZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bab68b-cc85-4e45-b6a2-08d8e8f8c712
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:57:26.4249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtsobAQLvEJk/fD7CmjlaprQNYV6AKVgT8FsPzbKimDXsthif83SJczJcQVX7FnzHfw3AFzlMJO5ztEjrlufZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
