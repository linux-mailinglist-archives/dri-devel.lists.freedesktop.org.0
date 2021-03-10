Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0D33397B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE786E9F3;
	Wed, 10 Mar 2021 10:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30072.outbound.protection.outlook.com [40.107.3.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431A6E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vwka3FKQGlPWZ1pUKAVBA07/0Qv4rlm+EOiGvsGqyGEGUziAZ5v7ra5tpNKbGHeIMd3uV/o+QCV8rG1PztPpKQOyUfRUTv898gwlp8EgFSIGNgJgpCR4+bcYDzwzNcSZXYqQq+JttkKRDT8Hr2jmoO73UFCssVl3/NkFgigK9LrlfG1lgRa6I94RJMb6RdD5ipCH/jBYoHQy5pMQayW8eqSDCHiZabKkegxK+1EBv9oYp1O2cVB9Yfs4BPGwPtQsuQdhPQdXal1/irqqQWMD7tQjnu4KuzgEER2r7PVtUIzoHI2GTW6zx8CDkCDSk9zO0kpYEAi4vMemZLJDPK5f7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWpmM0X/4Y/yLtRyLpcQ1d8AJTqEF6dyg8o70HruRc=;
 b=F4NpiPZ0BGMV1uqKST0o1037NSvFsbq/hHC9ALAnPSZ7YZTs3Gh/y9+QUwAh/lKRmwAbexBG5wTs2EXQDy1eoh56SK4DzQ/LnP398auJaiMlbjxHhn37+P1zlH6CAzCCMgP8NpifllHRHxZ4OOn6BC3bKqbsscxh1CWrQwMvrlyeYOtcdWYRFB8mXG7NSgNuqOtDwEuRSk+7ZwGZA9pb6PB1P6q1HYuOjpTeaWdjDG+j8q/Vqhr6b8Oxg/hBTmZw5l+mns3uABDtmBUdZ/6avj1ydWkFhDAaCN1FoiiZ9BH08Sh2zRiJpA8ur7MjDPaucYQ1KYjl83uxibY38Ea5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWpmM0X/4Y/yLtRyLpcQ1d8AJTqEF6dyg8o70HruRc=;
 b=XHq0nN0WrPk2rPntaUD3IBawh8BbswFkohLA1pWAApSb/jykmKqFXWZnhRLHpYI47LZG70/DSsDwaa83G3W5jk3zaWWawodu78ELo8KK0cWtwvHgZK2XO16ITIDDuF0qmgjRlQ2Rnh2apHnbjsmbAMUaFw7IfGmzTTLau9A0BuI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2813.eurprd04.prod.outlook.com (2603:10a6:800:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 10:09:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and Status
 Registers module binding
Date: Wed, 10 Mar 2021 17:55:31 +0800
Message-Id: <1615370138-5673-8-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1464fa2-9da9-4fea-0494-08d8e3ac9fbb
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB281392A14B62F7E186D3DB4F98919@VI1PR0402MB2813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AK/CM1vB8J48M95ZotgVhNEBB7Avl6zXbd6RK8vBvboy3/jWpa22H2RbTli36uaDHQkFq2FqWIyrUcZov2lWUyRE/MVppBoGZ7fovpk+U6iZ98Vquh5HV2BQiL8178d06xS8YIzgSBe5+2MqzTiQTHtEXciU1SQINujldv0FJgba2Q6jejsBF8rhuXdONUO3MyarYS9TxKzBQF+coQLGXF85EKiKtP8vH/FhGVseiG89QOAI5mMIJ+vBNeUs0tgENVEkHBoJbExuERAUFcmO1Ds5EJsaXKU4RYproNo2WOoD9S+qk3QQuwWf4pfSMF64WmodvoTUD8dydRxdAO+1qF+74mORl+nCa5BEjQPH9/d7IV4zON1FdYSCUciHfSwQpb4tUtwqXvLnO3re1iydGeWE6BuggHnSPmuSOFRkHy/Teu/A06t1NnoDeyglCxZXnqheftDlFyRPjU45Xz/J/G+k5GD7SD12DoSKKnd5iNPyaWU9MOv7pbwxowbMo5JewVhGansPi7A3XnBeZRhl5gYB8BrrXbAU+XckaC9B4hKZgugy1fnIcLOFJQodezjXq9LxAVZ07N7zc7dPnnzTFEjZkNi0X7PPfKNNbo3Cf8WMFhuJTvTwDCA9j45WT/wICIBJrTfDBCysw5z6wPweVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(8936002)(69590400012)(6512007)(6666004)(26005)(36756003)(6506007)(956004)(83380400001)(8676002)(2616005)(5660300002)(52116002)(6486002)(316002)(7416002)(478600001)(966005)(186003)(66946007)(2906002)(66476007)(66556008)(16526019)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dOT9XY+EcMRBWOf0DsfNQQfWdA/b4PBR9OPooktLfK1wsXrhUBNs0YpGL1Yf?=
 =?us-ascii?Q?x3DU61wxdsiBv/fpTt6uciWb/2R7ZRfvDfb1dYpD5q2sbl+Tc90rnq4atpDa?=
 =?us-ascii?Q?EJIM5MbUuRrkAwOrVm26QGyE4qQzxrEnXc6Zti5R4Hsdb1Houxs3ZaDncZ83?=
 =?us-ascii?Q?Jdx0zNKlez6WMLn1oF7TsnSbF0UDn1UnUO8EVNzOsbgbVia1tpBwQY62qbuH?=
 =?us-ascii?Q?0Ob0/TyZ1W21i7hQNpURTWx6Bd+KGsLEkMypUs3lxrjUesjva20HmbWpvg4u?=
 =?us-ascii?Q?ZRRUN089nFqqyHIvOYjBOHyy2ppvS7bBQFFlPoVaERgbMQQl674lTk8Gqxko?=
 =?us-ascii?Q?UOpOoUl27/SnKOgYh5oV/ZKZnGDhj+npeLeWCCbT8z8jbS0JAuvYXlytonsR?=
 =?us-ascii?Q?FJheDWvAFy+817TO0QvOrOcVg7lOcwDOfpHWEHmxCabI6jpYSWPFQAggVY8c?=
 =?us-ascii?Q?F6FcaRApUcX9aOaek6PLULANTOFK2nhQucfCMUhzzDQEXcoV5hNl6jhBUM4j?=
 =?us-ascii?Q?Zpb/S09yqAGgEXcETcXgULjdkVSjn1nk6Xrc3/lCYDSz6LhCXMgWbiHImYaE?=
 =?us-ascii?Q?ll7FQFeESh0F4G7LTNYR1GRQQaesiCAMNfG+LhiQvOyUwTj1lQnroVpD0sS/?=
 =?us-ascii?Q?+9dJf2BGw2ue+h2v/rK9iI/0orjj5ThkYzFpUK+erptGTj8J8U7TXYdDb9KX?=
 =?us-ascii?Q?kz1yqPGRQTrAhxhcACPnhnKB2itkjU57hYDr5mYEe2xgYQyXyTKnmtdDI1Q3?=
 =?us-ascii?Q?W2L14QC/Ilv+2yhSH9vRBRWcZTB/wuDe9rXNLkFKmOL/9z0q+jq2n0vrpWSE?=
 =?us-ascii?Q?6nYuKKXyFzeoQEsnbUhRIi1jLp5bUwhmUNsKJN6kq5fuUqf+AsnhQby7phZ7?=
 =?us-ascii?Q?ao4KUFjUCak08w/WBa8/GcdknOEjyEJANiibTzjJuoPAqUMUxtzSONYCn8/C?=
 =?us-ascii?Q?VZkylkInUFg0csgI2wC4rPp/wdTSLedU7PPrP1HFSXBwJhPUGZxIOU4DF9Yl?=
 =?us-ascii?Q?0igwxAACKqmVIzST72/veLusH3xzIB1FY7WlW029PJ9dQM6msr5KOWJThjr8?=
 =?us-ascii?Q?A3ulKrT9TxlhHNd2VszXZAEvxXJmOqMFUaCmC3BFMXcm4+x0J2vVAnbDT3uh?=
 =?us-ascii?Q?x2NAz1yEkjZApolX6Mc9aVZWMHqPTJtVnkIryLrr4SfXbRWEaKyYncv/82Z/?=
 =?us-ascii?Q?PMqKiyM1rHXBGQNB7aHb3JbYXD8NHZ6bariSQ8V15LaDXrCZ+S9zf2DTpryA?=
 =?us-ascii?Q?Ki2UJIRZltZKSNMhvv4S6GLJ4ryPwD8XzYpApuMnIAFKEZBm+sk7aeRBjj32?=
 =?us-ascii?Q?Dbi/V0T1jP/nHz0ACGXEtQoY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1464fa2-9da9-4fea-0494-08d8e3ac9fbb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:43.0626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQf8GCOjxovPh5xkcofDqbo3itxDOE4OvJDq4OGamk5SyLqOL9C2zhQSAlyhYeNRuk5zfKZYh1oSh3Ce0zHHrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
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
v4->v5:
* Newly introduced in v5. (Rob)

 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
new file mode 100644
index 00000000..0e724d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
@@ -0,0 +1,202 @@
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
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx8qxp-mipi-lvds-csr
+          - fsl,imx8qm-lvds-csr
+  required:
+    - compatible
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
