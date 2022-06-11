Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AA547556
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9C410E90C;
	Sat, 11 Jun 2022 14:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F1510F6D8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5PX0WKIw5Tao5GdoDii7uOk97vngJNSfaVxLxP8USt/safhNAbq1B5CWzS+TCaZ4VDo9xU741iKEuYpRa5h44RoxW0UT/Z7o+bH9BYLFNxTfv7abyLrIRHmQbtKO7OQ0VI/DbWxcHVuA2bdBJn960fWlroRYegu8enjTl7rUbli5PCQmT8igYMhmT8Qr+cq8kWe9gXjokadv75miKp3J30ALOAQThM4/pVVf4roUfwc+axYD9weXBxkZv0L3X4K21zXlN+hXb/X09ig9voAuL8tTcUmc5Pb3Q2SBba2nMfKhRF/K6L+FODeT2+sxyHZs5DQjqra3cOJxFYdVkFFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XB4N3h4KDQDH7/OD+MMKIh4S99pDER2aUMfpvXukJY4=;
 b=oHA8VOPu3jqLuYdakzKuQ/BxtnDhhWKg43mS8GQ85Y1nNjeVZGALXONMPblPFfoAUymxhO/8VptfA5MkAq3xTXO9XEcKDdFXSJ9cUdyVVpSIUPckRW+FLfqb/CQ3a1JNpFQ2oK7F2KawxunfWjBQO9z1tDsVoM4uUD6u0lSXy/9duCHBCcry1gwPT1rOlldw1Im959n2Zm4tQRbYAPqsU4oQngIau8zknWIBLrAZuWXcJWmqJLxkTHbsBcBh7yxf6KPhM5y4RgxUcULCSy+NwQ8orxrKYsA5yfHzTR5Zy37TIAd0N1pgzIaGjZI/e1NuyArYnRHa9h8rHeHeSbAXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XB4N3h4KDQDH7/OD+MMKIh4S99pDER2aUMfpvXukJY4=;
 b=kjILzf5ABhtfygw12niJz+KDxpmccAPRRCLTcsnO+P7M+UpK3X/jG0R7HpO6yLj/I2175zYo6H+qfGDNahvv9z0XnLOC3uB9IQK+JTbA+0cD76hyVN3bbUgRhxuPZP9VnxfOHjcB89LGtzifq9a3UZFbOBi5kh5JcPufEN9aShY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Sat, 11 Jun 2022 22:14:12 +0800
Message-Id: <20220611141421.718743-6-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5f60def6-147a-40e3-07ae-08da4bb48c49
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB634739E8BD7048DCD207E2CB98A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lHG/lZWOI+2k2nWJWUcMn5pc2+sY4EtdU8Q+r2a8cx0lyWoN3KfXbpv2HBWvqM6jGvMDMkht5Khdg/fahH/zZlCCLtWSP4p/ugx4sVDEH3GwExeocy2X8FC/tCKw7WWmFZL7Qyie7NG8yc8p9tk43hz4555TnFo7joZ/PMuxrkULZz4/UO+ATpJrAod+Uin58mMnoXlE6Lljhw2HpxoVJvLx/Xx4Qy+WtAqvAo6Tqq7PoZLnLpv+APEGZBHxhpSwZAPMjoQoUqmsBye6Ja6k3aewKOMwvJBVnND5hybskYrfJBzjPFjAjj+GAPE/Id4Cd5yYdPVBf9eRAT/DkpANi/WWY5uFGREy7lcwdkriXx//nkMYETX7c1ouAwyKt7PddK0vKO+vOmTYq2DhyQ0zKxPvTKd/70mgN9Vaczj8EW9BGfgdMF2zjxeRAuyfOgJoXGPzlyJhnIK4RrftwpuRuRimXLF1E8pc7H/Gdab+PQZe9UvxVwtAVdZ07oLPjuURQjqmWjr5g8+TbAOdNtyAXnTpyDhHJVYPHCWO4i7RnagDQIGFKOJ1ssyMPQ6LkiiHlLlJuPM9i0G+zvkEW4rdP1+mX4GywRgn6lZD2AcyCKRhYipSimQfwCdmyqFKYnv+laSJ3jXPoY3fCvFP5gO+jxa2pZjlBlvoe0U3fmll/S7dJxtRQVuTKNbqeN9BVfuPR3QXo5msO4ugFpAOTnOaQxlMRaQm9S68Qafm3LQNN5vZ2+viAQNOPTrwYC9vmqjFg8pL1X0owuI4F6pDzLeico9a+jlCfx6ELLhjR10FQ4QFdZrzEFe376yFf2sr2OeDNqSsVPv+RnfFeLHwPmZEnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(966005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jCB5SFbJSsqzQ5WgAQR8JpYHhRzR9iukt+XM0rprd7AjaY037rnmDqXA2TJq?=
 =?us-ascii?Q?uXcYps+gYAr7E5p9264hL8ZQl8X4wDm3aH7Z4+EDKSg9DJREv8zJTCeDuzN5?=
 =?us-ascii?Q?2YAmIkzTHtAuonPp8HoIVMgKONAJAwi0mnUfYJRMl6Gg/AZYUMfyO7GuUrbm?=
 =?us-ascii?Q?61VkQjzTK4Ux7P9OxsZxvT62CqH7ur47KnSF/YRLjj2yqeG75xqXF1EHWZCp?=
 =?us-ascii?Q?CsfRbxsEBCS77OiA21eEn9+KDJmuOceXCTCqFeT2fgHZkjwnxpsIub4H8ZVU?=
 =?us-ascii?Q?/ekZONc/sBYkToA0WcVk/avomfsrD6e6M0vaCs1jbFvJ98+7iN4hbsf0K1n8?=
 =?us-ascii?Q?M/ntuL+VXkSDGynJTMMUjHGjdWO3pfP7Le/4bvahIdAWwqjLv7Tmcp9/OVkP?=
 =?us-ascii?Q?6JLT4DiC/Yyl2HdYuCl6GlsjrJ6JXKQDuW73NJGmUx++VOF2nFXAECWyRaWe?=
 =?us-ascii?Q?/A8lTWoScRnR7XbmzWlzApuD2nuxgJIGuMsPGiTaHMYmOTtvNRs5h8ITWOzz?=
 =?us-ascii?Q?0h9KYN9ucD3PcSJkat6aBVxfNTTz9mytgxvp5En5HE+E974231xKi5/cLkpA?=
 =?us-ascii?Q?kIDXyfLdou9evFZpWam5nh6+J8SYi+iAD5NboUDpqy9eIG+YLxXVc6p7YhbU?=
 =?us-ascii?Q?rNjJAPtwNbpvQF7wfASQMkffkpI0L0hvYTcPVt0PyCfh5uVSacnrF6F1Fksn?=
 =?us-ascii?Q?JfA+XjOY6edVJRT0h/ivdvJOrp66WLg7/zQe3jaTJbLVXDMemOT0t9pgDi4z?=
 =?us-ascii?Q?re55BCi0+dHvCUOP9+tNeUwhinLOvs3T8a2RMX3gHpXiK5vCWjebDGxGE460?=
 =?us-ascii?Q?zgwaYhfUTKwvkXOoKXNDGQ72K8fKsZC1uIbOusImkfZMZHj8sj0HPRUVHVE0?=
 =?us-ascii?Q?+Ail/zzCRYG789zsYV11dnA5762ObJY+/suziF1qiYHWCC+vHxq0Plie49+Z?=
 =?us-ascii?Q?pu7m6sPgpA56bILMUcVX1H9xNOjINS1RAG4po9NSRWULrNmHUqnGLYFrPjDW?=
 =?us-ascii?Q?pJFhaBFiNkh/4xMYE/CNbH/XGtE58sW4531TvSWyKJrJXOXjh+iWRDEH15SW?=
 =?us-ascii?Q?9KJ8/PmC11r74cwCKA1KKyg0fDRGwaRaLwVaEeuI6r+hDy7voZSk7mof1CL9?=
 =?us-ascii?Q?esFfVOK5TauAxXpMqd5ANJ6hr2PsHNDBlsVbC7c2vZ8hAs/5n9vx7F85XVI2?=
 =?us-ascii?Q?V4mEixGUU0vHG6nUa3TNkMUJu9d2rE4GqnO4P+DITVBAjtiIySrB0u+KPNP+?=
 =?us-ascii?Q?9i9ec+/VV8IJ4MWB2ocmbc2iiP8cOC7PWz1Si5ETZez88TjkTiubeKmKdjyv?=
 =?us-ascii?Q?z5sLbuNn0zg9daEOHh+k8BpxudflQ7ZExHSYL0BqgUanIwpqq7syudWaNmLP?=
 =?us-ascii?Q?jhqd3nHI8qoHb0LkuRlIAZk83cwdOxDEtMt+0FPZT94XK0cjWxbU8UjnNQ40?=
 =?us-ascii?Q?pgN5Tq1iuCkgOfNS8EGTKpP4emqmzhbIsxvR+knzG/7006NV+ljvpL77i1cn?=
 =?us-ascii?Q?n5+azuB5MisWujN0Mhhkf+I6TzqUUTRumUEikyRo3cyEDOS3k3/4reprZ0OD?=
 =?us-ascii?Q?vpoxDz0APDE5scGW4sKQvX1jBcaHn30OqAvaMzYIPN8oOvIRghn9avqKAiC6?=
 =?us-ascii?Q?EfgLurFrI4Y9IbWI6xOE9A3fr2PVdHcOWUk7hVwpCz6g0r9J8TgmuAnMzOxk?=
 =?us-ascii?Q?02MwLLkfK/Pr3zjAbABf0hUVtTx3+tHn07IaIOdzLDzQufcATjDuSZNwnjxj?=
 =?us-ascii?Q?NQXV2+4p4A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f60def6-147a-40e3-07ae-08da4bb48c49
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:24.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZcIHNtK4TtygxfYesi8oyHmSRX88jci3ir+lOK7CxROYb7uCJvpI2iCy3QgiY/I69GHRbGK7wabsJmPN8syxw==
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

This patch adds bindings for i.MX8qm/qxp display pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* Add 'fsl,dc-id' and 'fsl,dc-stream-id' properties. (Laurent)
* Drop Rob's R-b tag.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* Add Rob's R-b tag.

v1->v2:
* Use graph schema. (Laurent)
* Require all four pixel link output ports. (Laurent)
* Mention pixel link is accessed via SCU firmware. (Rob)

 .../bridge/fsl,imx8qxp-pixel-link.yaml        | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
new file mode 100644
index 000000000000..38ecc7926fad
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Pixel Link
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
+  asynchronous linkage between pixel sources(display controller or
+  camera module) and pixel consumers(imaging or displays).
+  It consists of two distinct functions, a pixel transfer function and a
+  control interface.  Multiple pixel channels can exist per one control channel.
+  This binding documentation is only for pixel links whose pixel sources are
+  display controllers.
+
+  The i.MX8qm/qxp Display Pixel Link is accessed via System Controller Unit(SCU)
+  firmware.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-dc-pixel-link
+      - fsl,imx8qxp-dc-pixel-link
+
+  fsl,dc-id:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      u8 value representing the display controller index that the pixel link
+      connects to.
+
+  fsl,dc-stream-id:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      u8 value representing the display controller stream index that the pixel
+      link connects to.
+    enum: [0, 1]
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link input port node from upstream video source.
+
+    patternProperties:
+      "^port@[1-4]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The pixel link output port node to downstream bridge.
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-dc-pixel-link
+    then:
+      properties:
+        fsl,dc-id:
+          const: 0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-dc-pixel-link
+    then:
+      properties:
+        fsl,dc-id:
+          enum: [0, 1]
+
+required:
+  - compatible
+  - fsl,dc-id
+  - fsl,dc-stream-id
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dc0-pixel-link0 {
+        compatible = "fsl,imx8qxp-dc-pixel-link";
+        fsl,dc-id = /bits/ 8 <0>;
+        fsl,dc-stream-id = /bits/ 8 <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* from dc0 pixel combiner channel0 */
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
+                };
+            };
+
+            /* to PXL2DPIs in MIPI/LVDS combo subsystems */
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
+                };
+
+                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
+                };
+            };
+
+            /* unused */
+            port@2 {
+                reg = <2>;
+            };
+
+            /* unused */
+            port@3 {
+                reg = <3>;
+            };
+
+            /* to imaging subsystem */
+            port@4 {
+                reg = <4>;
+            };
+        };
+    };
-- 
2.25.1

