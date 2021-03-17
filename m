Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC333E7F6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610006E4B3;
	Wed, 17 Mar 2021 03:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60072.outbound.protection.outlook.com [40.107.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5720C6E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaF47kBiv3E2rdb1dntbpRmL6YicPsO8+cn+HLtCo/F+sHJT/AAuHAApHZLqVw5tMnFZgsLeeffczEbiFilt7n+VZo86mf7DEHo3C4uzCKEmmPOTpI3sn0sChVcVWsiIjWnElW9e/KancVsa1xD8qLo3fQriSST9cqJ9sNoOdoDaBT6+uGYT2h3OrJBRJWm1xV2tJQNItElHjE/j1c+lxpkG59OSpzgWQych5SWtSAjqEV971kkFK6r/Zdehbz5AY9qd74doKyq/Fy+r4wq8OXiYHiFQwTBAy3VDGv5jHf1+BU46LjgBJSEehOf8IFSL57dkP0uIcTQKUhRTCOojUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5wB+Vex7i1rpMrbY8RjOhfpob9H7t8tBtwI4yJq5uE=;
 b=AuOLEUzgIQ4DmAe3Xluhm6OdBjIHaIf3RfYBbgrPefkQVR7Zny5oaoHsSs32vSCPUiEhespzASRJ2u/2iTlWmGN8NuXywOnRV2XpoBLIIL0VuiKNTeRkKVFVS2rAJmca8xzprExVSPfS3TEeI7pNEKRRqxylzHVVo3DInuI0TwRCBXg9CD1RbEpiC/ddl9h0VBT4PTZKbeVVh8Tny/xWwqi5EGmVqY/XEOcrT8s8PtWIV/HRuPI2IkBuNXlU+xxO+y6bY7nJr0B8K32cVT78iSGcqni5NaLVK/zjNhCBzlPlfcysYgIxpeTRmpsoIeyebRvNLsRYcqP7txi/GWu85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5wB+Vex7i1rpMrbY8RjOhfpob9H7t8tBtwI4yJq5uE=;
 b=h6FAKSNkJlCjSJ88ARDQCwESxtHvxwcz7sUM1PbAO+J21KZ+NreZUqfQaof8cyOEOcPG9bQi1anw6ao/KRk8aUIinSlAFCpL880CRM5Edj1JgGRzhEAs49lQWIOwKMc3EviTBYD6/twKLafRUgtM8LwTPnd58Vj4BpXupce0K8Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:57:01 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:57:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and Status
 Registers module binding
Date: Wed, 17 Mar 2021 11:42:42 +0800
Message-Id: <1615952569-4711-8-git-send-email-victor.liu@nxp.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab1d52b7-1bbb-4145-fc73-08d8e8f8b801
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61419A5B298F621ED0E65D32986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcQHRo6DpmdkcSidYAvJGz6MSsE78vmoTQ0iOPdzyUUiHRzELB9tEgzqKs8sbLxP2kBQFMGbPxfdlVB1wDZcx3xJrIbRIbZ1Vkrb9hRNfwX30071Z37xdxvuy/q08+Tim0y4XbzWOLv1i3mPhp7QC0xCL3yM6KnJf1gfR6vd3AKwl0fa20KLhDtf7qoeTCHLgscrfk22HYNQOxXHUNh3IqDWqzN6DdSWrBY+dlzNAHiamW/HmeRKzxNeQ7Tb5jjJAANdWjEfmqqOMEgNirSzO2HYbclWRWnSQf43gR7QS/5mfP9msU3PK7HLLYfQCBkp9ONQDtekXOYlAZZPKYfSHnA6tmyExG9xHyVzR12vMJW/qNIysOebF0MC1ZSKwJy8jUhIxPK1wLpFnoAHScOmzKvRDzUdfBkEe8iEPk6lXaKcvUKJvqm+H3fYL6Im851CVY+FYEowXUx/0fabGsUiUdgQyJxC90UMSEKanmJ2ENgcWFOV/KpiRLKGZy8DvQmNePlwdCUCwetuiPpO7R67nY8SMwl5aAJ0As8/lQYs1mFCVL/pJ4sjv9YHxRnxsjTJTv034PKKt+HUyUUs3iBap7u0cXSotlNoSSupbbDTOnaAMCqpAk9fC4cfGbKrXVo3tavN+HluhcXzNm+q0CHlax95SxAw3mO5ZYLPq7gB55tRopMI3GVkvlCWGKa+/dJJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(83380400001)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(966005)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HX8QdAK2YitAiLJIrg/n3BGBPkg9dvyshyU2+tX67bVCnORPn3mqfeE6PHqE?=
 =?us-ascii?Q?T8qgNUxw+pb30URl2CFY6cDVjKaJOtZkS8zEqVlEAaslCg2Ipc5yrDLJzLU1?=
 =?us-ascii?Q?voSVzmugi773EUXxMbA0rARzX3vZ3E395lZ+PmXihB94EoDUUp/FIfzfL8Mx?=
 =?us-ascii?Q?KA9QV71SI+jUEBpJ4hie2Dw+sy/4/uPiB4sKJhdBD5X4EafluUmk5E8E3bem?=
 =?us-ascii?Q?HZltaGBVEHIEvJy+FHwm40YIrvbvqVAw4H63ye1lfLgvVxzfYrZRmxsvFlsV?=
 =?us-ascii?Q?GadKhcAQIqJJVtpg2zKhpDfO0Q5lNaODrvukFoFLXwmqIWMs/FaIhlVC/MT8?=
 =?us-ascii?Q?Yw8KtGCWqwvjpdFFJrcUC1/MFvFUI8KDq5MMjzJczo+Y23fLrz8o8XIlM3rk?=
 =?us-ascii?Q?1v+B9+gdvKBo3mthVhE+C8PPFHtNpURoseg5vMsFiFf19ijLo8CmTta8gLRM?=
 =?us-ascii?Q?HuvPk2xXSxUYMWS5CQ77ncGWBU3Sn5EbpJQbLGcHxDE8GeIESXOp8CfBMiqc?=
 =?us-ascii?Q?Gd44pJ3jEYuA2blEzTT2EJs3X2i9YliwdllvIdLBFRQi+R7XpsATw2EGjY2U?=
 =?us-ascii?Q?COfRRW6qmsuVpyYKoJhO71JKKsEaHxmEBB6nAc3mqrc2ouKNZpF4m1sxdQq1?=
 =?us-ascii?Q?2KD/V3OSPrPWQ1NMms/jB6sM2EiqN61tQzN+HGXl26i0xeBeDB4odkqFIaJE?=
 =?us-ascii?Q?PxX72M58xIcWkymTSZ3OU3PSLUrfsKJqsDKv4DYqyYcKnPEDUSRhC1OL29h+?=
 =?us-ascii?Q?Q4Cxw2zboGarSMUDAUhkdKTZhzJZJnFCxSVVAZ7xUChiaMyyNsM8TuYsl+z/?=
 =?us-ascii?Q?5PNQ3NnXLo7rojDaoePZdfzb2Ffq+nWh1EsRYRnqby5GxcgBMEuRtykoKioR?=
 =?us-ascii?Q?z++oNAPt+ZohxwF4l21LDgROCQBGO0fA689El2X/ZJNhXW2WU7jiPN1CxKPk?=
 =?us-ascii?Q?p7q2JE56YpTZW/ndDXbAO8im5LBPKWI6/tjT12m68PdcJeFN4ZeRr1AHHA1h?=
 =?us-ascii?Q?JjrvAI4rRxb7vKYvBPSHqnYPsXz1hFlF21Hk7KWo5JRBiXzuA9kXaoCBhXB9?=
 =?us-ascii?Q?3J+drNYzlb5FODAlRgRe8WXtimtyXJDwX4vlt0YLtzTpoF19nugX623naXu1?=
 =?us-ascii?Q?r0h+oRts2InI+feuYcMjF3cHZpmdKVxkmkR8/nROwrjHSMNUme0Aq4uSuugC?=
 =?us-ascii?Q?72zy1bPuMlTsilba8sbvrB8hLy1aX3xRsELzDDGqKZYGdAiDu9l+fJy3wVmN?=
 =?us-ascii?Q?yHZeNoFmq7s31fvNlN9yiAMJThB2RcZhdV36wVhTyWoU+uBkJ62ck3oKQRnb?=
 =?us-ascii?Q?2Jmm4QtDG7tuzoMNsTHQTS1a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1d52b7-1bbb-4145-fc73-08d8e8f8b801
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:57:01.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5IgLwkRilUsvDL/TrTXhZzwYUQVdtRNeEwqg+yo4WWvBKPcFr54gq+Qj/hqrdwaN5klYymnhw6DQdAA7TCgSw==
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

This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Drop 'select' schema. (Rob)

v4->v5:
* Newly introduced in v5. (Rob)

 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
new file mode 100644
index 00000000..f095771
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Control and Status Registers Module Bindings
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  As a system controller, the Freescale i.MX8qm/qxp Control and Status
+  Registers(CSR) module represents a set of miscellaneous registers of a
+  specific subsystem.  It may provide control and/or status report interfaces
+  to a mix of standalone hardware devices within that subsystem.  One typical
+  use-case is for some other nodes to acquire a reference to the syscon node
+  by phandle, and the other typical use-case is that the operating system
+  should consider all subnodes of the CSR module as separate child devices.
+
+properties:
+  $nodename:
+    pattern: "^syscon@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - fsl,imx8qxp-mipi-lvds-csr
+          - fsl,imx8qm-lvds-csr
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ipg
+
+patternProperties:
+  "^(ldb|phy|pxl2dpi)$":
+    type: object
+    description: The possible child devices of the CSR module.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-lvds-csr
+    then:
+      required:
+        - pxl2dpi
+        - ldb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-lvds-csr
+    then:
+      required:
+        - phy
+        - ldb
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    mipi_lvds_0_csr: syscon@56221000 {
+        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+        reg = <0x56221000 0x1000>;
+        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "ipg";
+
+        mipi_lvds_0_pxl2dpi: pxl2dpi {
+            compatible = "fsl,imx8qxp-pxl2dpi";
+            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+            power-domains = <&pd IMX_SC_R_MIPI_0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+
+                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
+                    };
+
+                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
+                    };
+                };
+
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+
+                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+                    };
+
+                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+                    };
+                };
+            };
+        };
+
+        mipi_lvds_0_ldb: ldb {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "fsl,imx8qxp-ldb";
+            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+            clock-names = "pixel", "bypass";
+            power-domains = <&pd IMX_SC_R_LVDS_0>;
+
+            channel@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+                phys = <&mipi_lvds_0_phy>;
+                phy-names = "lvds_phy";
+
+                port@0 {
+                    reg = <0>;
+
+                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    /* ... */
+                };
+            };
+
+            channel@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+                phys = <&mipi_lvds_0_phy>;
+                phy-names = "lvds_phy";
+
+                port@0 {
+                    reg = <0>;
+
+                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    /* ... */
+                };
+            };
+        };
+    };
+
+    mipi_lvds_0_phy: phy@56228300 {
+        compatible = "fsl,imx8qxp-mipi-dphy";
+        reg = <0x56228300 0x100>;
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+        clock-names = "phy_ref";
+        #phy-cells = <0>;
+        fsl,syscon = <&mipi_lvds_0_csr>;
+        power-domains = <&pd IMX_SC_R_MIPI_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
