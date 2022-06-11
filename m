Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8C54755E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2FB10E4B6;
	Sat, 11 Jun 2022 14:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAB110FC7C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ5fyRSANwBxKptwjSFiw4rW6RSxjXrg8OD/KuVnnyi9FXj1Z6uHSnq411y406dweI7/EZh80s1PfJ+HpdvFqy2kRDjszDYBfheoOJCjlP93QFpWDUV3TfQdVlnJRXeVhyBUQxwNsDfxlxd5pjOskGgR+WLG+qgB+pZBWG0HYOuICq5z+CFnw/u60N3NflRBDEkfXQ25MaYcyPn+7hjBzsgkc/4PemUFJ6ww5l9BbFOisSxZxPe7ZxX80glrK6BzUw1wvNquPU9d4vE3hr5ew5RIegqUMRUJF1MKY5pgwtrqLuVZlEwWsWWKWgLGY0sri6SlOUheHVRRUSX5FF9mSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtHzpvrGujaoD6LTDAFHj0YDj7pz3g+LK/+p4A6Qi+E=;
 b=gCseT0VYSsTxGuJITKkM7TTSCA16HziC18NIfeb16MyV4KO4JsBnjkRooygyN9egPI5/6wSjBT1HxQ8kBSu7vxpXSSjzx0wIlxmEbRXwT/Z/DDL9od89Frvb8wM9qdszDC472srsVPaDzStSM0A2/mAqiXCHccFDjcGztLvT95ryAMj40aKvNVWyH/+6Bk4rWIFqgURZdyGKHW0d4r7jM5YGg3Mz9SYu7DkGHRAe0ySfj1+Hw41BzyeUozA/L0WXT6Z0igKpffnYKfkUsuSISdheD9RXmym4LL2mgT5b/QxPQGhUeEn7zPNj8J/JvotVv7QYPmhLHAHlSW8K7AqPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtHzpvrGujaoD6LTDAFHj0YDj7pz3g+LK/+p4A6Qi+E=;
 b=PN3YfF+Xp5PUkTUE+CvSQTPV/g2fnEuJYeIr9X6omtEuQBvaMQaXU5x4joWAVtm2q2U3lDJgpoEkAe6tGnYGprLNyW8sOmTKJXqHp56lCNvVPZUDYN4SokOxrOgHKtLi2JJQZt3HtBr7O32gw3MURZn1DdSg7gYQF787ybnnrSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Sat, 11 Jun
 2022 14:14:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:14:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 13/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and Status
 Registers module binding
Date: Sat, 11 Jun 2022 22:14:20 +0800
Message-Id: <20220611141421.718743-14-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6a86b0e2-3157-4b18-0272-08da4bb4aa73
X-MS-TrafficTypeDiagnostic: DB9PR04MB8249:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB9PR04MB8249DF24C04A1DD8AC28871F98A99@DB9PR04MB8249.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5xOhdszp28kSDDqgDEkllrj9J67ins0a5/OJ4Iddq/sdMXBsoLz0dsiX18Zy+mNfODHPiINwV5aIU0xdyXhTHB9luoOG9+LXb/oFBrbTjlGCMno66bnoTZNM+Cd/rmFrwm9XiHmEo4kh8vPxl3FoVcaW1LftCHVRQWF57gPMsmqNljrWofKqHWludE7hIviV/slrs132dCQEwnHOzdxaOs6EBGj6BqBlo39YY6BYtsiNBSwjtoGupgZxq5lKIGCVMZTUBLxFN3TiaLKCm0U4tL8UJh+DGVbNcbBiuUEvt8Kov0kEhPoBjfplxyIfWvO2O1u+/RjWp3zZmUarAQnwOedZb5cx/0adQ1J+Aq2cg7SaFswPvK+IM8YHk5ZNXUAUCPY1PUYiM7rcwefwTUK0ungnTdtn0U4LmYN0Cp7k+OpLzLdERYDeUrHGdHutxCGcVEmBfdaqdb4ysZ7jOmGRQJbgC1nhSoBW82I+X+QkfFARRzyWSaoyj7EH7ubGzkQBQADevzlmAOJ/UwnrXszqGgNEJ4FdUPVrZ9fKleO2avnW+amFWthqe0nKNOfkfFXBtYminwmsw3H4YXKNtLsBpcqWJsrmHH0GY2aA+3ZEY1OlPP5XAdo9vZszfoavKLbhqNIwmv0hBSb7QNKXYgBvlHhtm4TccaUlc+ox+5STemSa5CiwPQbTFVLlioGM7jgE/eywAsaFh2RSUxCuGlJLjH6lPmZEGHJUbcgEW2w39TVLzqC9ACovZGvRj9p7dY6KI3c6XQf2DZ58IYrH226IucqjnWyLVre+3DXszX0htrifNi+0Ostu0qtx2m6XqE6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(26005)(6512007)(38100700002)(38350700002)(83380400001)(86362001)(186003)(1076003)(2616005)(8936002)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(8676002)(36756003)(7416002)(2906002)(508600001)(6486002)(966005)(6506007)(6666004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2kCy9Z0mGlkxGkurBSxDOb5RvpjMSIfDrTfv8sxrQqv3r6S5N+CLy2OIPFF?=
 =?us-ascii?Q?9Fai06LgRcDNkuJMu7OQcRloASlXWrCgl42OepA6QvVB7hlEYBW8VcWdzwr8?=
 =?us-ascii?Q?18qS8UpjgZp4hP69mv+60ZnKmHBbShEChcq2BHB10DDvu0SWcpi+ZEJvl/nz?=
 =?us-ascii?Q?KMpTJ8nFU8NxmnMx5vAmo2I8lxQvAxAhOHEK5m8K7fRkb6tIfT60EOXe/dUm?=
 =?us-ascii?Q?e59DOgRqxncqoYBI6zs6VCt9ldvZ6X7mc+/AhS3gYkym4CEJ75nmC/IvwioD?=
 =?us-ascii?Q?Q0a1ko/O4RSxj7u3gOIGEGBcTP7Spa3hCagjJHb5MsKxSslbR+Qzjwx0ykkX?=
 =?us-ascii?Q?c4plplRunvISz0yf7Kdw1jCTPrK7EXrJ1B3qy9/Ty3SUNBzbl9R2Uf1rUPLG?=
 =?us-ascii?Q?HfHZeEA8qffQ8xdbsO6M1W/MRe/DUjZnQtVp9ijmJcT32Ry8WWFbrAg1bFKm?=
 =?us-ascii?Q?qeJskOl7CvxAOdH4Ntf4g4RU8gQmvzRzbZCw/+/lokT2RSdOflUTcE20MpEJ?=
 =?us-ascii?Q?2EvkclcnDzcu9pAiAnmybTz4mZNF0MJsEcuUaHXEhEQ6XDvIa7E2zjMgO7z8?=
 =?us-ascii?Q?GfAfPcXKLXiklZ62bozgk+/1lhGzGgZ69c8LkuGSBN446Wo6hzh2imn9iLPg?=
 =?us-ascii?Q?tVwpO2HbwgMiDxLwLVSYoC9rhvvAdHX5xbLWgHUK450OOQnVLl7xkQ92+cJ9?=
 =?us-ascii?Q?AIYCDkeYkRBEr8P0S2lOHU73i9Hsy4CHJpMf2hwlrobkXqIPaCQd+QR3Hcxl?=
 =?us-ascii?Q?D2XTCxWq85fUknjliWavrcwoQHW44zdodeAX9JIZI51kyokt4QJ63MbflxdU?=
 =?us-ascii?Q?mJtC0xUTc7wl67TbQWhEXtVpPXui+rm2mknoirH0C02152idFUR06bYZTGuG?=
 =?us-ascii?Q?mCKdFJyiW9hWitVgAP8qn4VhAso8Ef0F2EaeX66uQ6HXi31ec/35wFK+9eE3?=
 =?us-ascii?Q?youpZqj0wbrh7yhmEs1ebI77V9nDx8SqH56gP2C6LeR9xG+OSHz3JwR/gYtT?=
 =?us-ascii?Q?4mSx7+EFaDBJO4sct5+3FRHBm8IjD7/wwkFgyGzBtwKyiy2lEYXmpw1O9gC8?=
 =?us-ascii?Q?jH3KMNfraNcnOUxwfZik9FYHmAj7wSqdJ/wGmuN4pt9gNUm5ZjReLehq47jY?=
 =?us-ascii?Q?LmfTfoOZmAb7LTyyOJvl+ywtI4P83+2UYrELO7c7noea82Jt2zqfLFVdurnU?=
 =?us-ascii?Q?8FDGE0iEqGGcVtbc5QhibByp7hbmlmA8gx36omyw6clS32mGdcmmne06nTtn?=
 =?us-ascii?Q?tN9RodwXB+viwTOc6eBJU0cZeQ9D6ui0e7PDJjLMMooZdVw82nmJLn9JB0Qg?=
 =?us-ascii?Q?z4FWTcLKeL8pBO2d9cGjZoXuj228NHbn7n54cC31K2lTvgtLNFCj/3uagzxX?=
 =?us-ascii?Q?8R+ebAZsZuHJmgF3TAgC2t7uBKR7tLK8Mf0X2fkLIWBA0aHoiErwS1KZBL1Q?=
 =?us-ascii?Q?eSTo6M5ezXfOj4jZf1N0qqbt4oWj6dHluDRi3uOzYYzWmDAg3u6rErLyp+/p?=
 =?us-ascii?Q?GP67n6dIQHvjQy5gOyYJGgasuxx5CNL8Ju5Wqz9tEtJF8uYLAsBlZjXhs9Sg?=
 =?us-ascii?Q?TW4HGP6w29Qgwa6QeP7e4vdDEM7gprKyDObttH7ot+7ef0HVfZWQyXxMBcp+?=
 =?us-ascii?Q?IkbyhfDKgWQFPbFlTvblET1mBUOqrv5645TBHXNx510C0bVCRbhmI33rqTBc?=
 =?us-ascii?Q?6nNZnqAovgf2zRqvLsTvx4oa/wF0Ju1AgOkvd3+mB9GYUB0r4oAM0W3Zj1Ew?=
 =?us-ascii?Q?l2AcOFwzXQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a86b0e2-3157-4b18-0272-08da4bb4aa73
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:14:15.3613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9qSFs9uQZvWzlmCpjxL4iz+QF4mFJLDfxVugkuGN2Kcz2iCXU6pv9cQlKK6bQZGouV0CnCMZDULP6cXt8Pobg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8249
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

This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* Add Rob's R-b tag.

v5->v6:
* Drop 'select' schema. (Rob)

v4->v5:
* Newly introduced in v5. (Rob)

 .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
new file mode 100644
index 000000000000..f09577105b50
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
2.25.1

