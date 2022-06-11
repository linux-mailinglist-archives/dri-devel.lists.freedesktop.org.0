Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0131547552
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F3A10E3E2;
	Sat, 11 Jun 2022 14:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE8C10E3E2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKGN44ZMM4pCpEYZ0dMnIfslqw5GB1SrZaj3nZuV5HQsGOVpmUCZQjpt0Hzp9SPlAOeq1PC8Fd2bX7OLB6za+jwvCeNbAHSuVkEqK/hAvQcz66vq6mHXoYUSTyQnNPNY3bx9TAGB7xaPAgv2rN38y7sUyHMwWefZvAorz9Jn2MtErtKjNHWiuvXIHtJ1fuQQm+O7kxg7HG5HqPqmCtUQQnAjFyupLoFRiCtkHciAHco7UycGCgZUFNMg5SlGy+l5bpTlMuLbq79MwbIUaZiRqfateSXClb326zsDWXoKkhQwHScbwL3GGsCCG4xNyg2SiaIBs4fesxkTjTTQ/LEVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1BfWpm32TObyNwHhWqJTBk5kH+meizE/V6mBV39rBk=;
 b=RYdqpqE46T1H8z0IuzuMcU/v5MQv2bmbTNtcqRlv5aL4YczWjXTg2o6k8jl/WrAd8MZCXQ6Mgjdt29k6stId3hhpyTTIPUsYxZWFWM/pCDMRmUqEOLEmQbdykZAak8d6nS8Nqau7eM/X6VF1/lH4EdHNYxvdv02znF0JdzzsK0c5W2XgQ5oTgCAGMNTt2nLY6h5cK8d/ecDgkqPZwGNjZfd0conbAOo+RrS6Ah4EsguT1MKsjP5MgwJ4hd/JyOejsDa1CZbz50lxI2X3HUR0RuQM2hA+QYU1alULl7XQydcQ88QHxfyu0a3Upt8Tmonn3s/RqxtdaGU5bDWsKoQkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1BfWpm32TObyNwHhWqJTBk5kH+meizE/V6mBV39rBk=;
 b=UivQj9+IGAigSsbW617IxwmyDJZNc7K31r2yGEZrqog2ZE9rQlXvGwBAjSIp8h/l0YbFFhdBC+mqTASa3fTo8F9Ox7MKdGvfuHrL+TBF5x9+nHz328JYbVDAUJ85pOz9l0sr00W1JHekkrDOCMgVGWrLrwRxAuGSmqdBW6inu50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Sat, 11 Jun 2022 22:14:10 +0800
Message-Id: <20220611141421.718743-4-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2d03f43-f249-40a8-7bdb-08da4bb484db
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB6347CBB3EEC7387877EE2FBD98A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69R4CRbMkFRGJHSwmyjjLfuOtglPpqXEVVeQYX3HV7+mkCZD1i6r2yKcHKeLuCx5xoBM1LkyPa2/+9hWc53oMrawqvPBdIAqI3tDDb6l2fyjxI/YXGkYLRG5mJLJk503hW1OHkO5uCELxivUfjQfv2LXyiHB33u37FERM1v037xzzQvgGFD29F6YS6KSLoxjZx4U7UxT0YSfpxODQmnjKau/MOwgEEoooWSz4FylmjRrLsFu3Ob/ny4xpLqqctZHWCOcn6u6EwVxzDxuMGdlxwfT5E8Pzt3yl0vdMgKK/pcwTbjFI9/6aWb4I6N9wQC1vGZkCRaps48zuEuQpQt3h/8dLXShiOzKZD+QCh1j8Xm4D3kkVOpomMCnzzmvP0jPOH40YnXUe92opqXyFZCKF54QeElFeskd+c9bxsvrf1oEbEn+a6J8W9gafNpUZ3g0Smyw2uvta0Z8bWBWTU3ehWUJmphlNV8onh9zfYxkgcW6n1QM5m2hRSq6wLnqHmUsqIP9lsdb171g9CKMDjaDXtlYq94U+qbFGpeVUlFeipTXgSD+BrL4rpDZHjokuaHBzOQ4xPk+JMmW9wJ4zHM3cIkx3D6NAP0qCRtR86B/Qeftib5jNa+DEY2XBapXI4wsPumrXUDzfILdUBqGTzpQXl+kqBSXh0eT2THACoYrtR2NjdW8OXEdV7H4vkQB+jqz/xXStspuUn3lPBP6VwxkYwm0hHmqrjXQ0+z5HsZstng0jo3BNIcy3/aUDuCZsFy1QCxPg5+8ZGi24sqBjrJeZJntaPF7xKzR2m2HSiOO8w3R2SmZEySdnNH3TjtxoyoxK7RTbI8E95pQO0ZgH+usww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(966005)(6506007)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFbO2yMtbQ+mqweMAIRGjaJor6HF6oCfkxsRV5U8++DkIGJmRRHbiAvDFbmV?=
 =?us-ascii?Q?y63n4x4Y7S2TedO5m6aPW/vaGitkQrN7YuGACFJB7otDS8LHl83b7onqDmyE?=
 =?us-ascii?Q?ctp1bIifHP25ghM6GcDbhzDof+0DpgnkRlmxz4eOtFTFp2c/E5S9crOCsdp0?=
 =?us-ascii?Q?EAoH0IgQ2svn7OAgEJaqTZBox9R3VY13tk2Glxvjgkt7qiWWvGTjs7vI4aJv?=
 =?us-ascii?Q?CVDrptX406ZJL+2cbjSLm3f40zLl+d3NYOYDinXjdCxpdaQk9fxdNLLV8Gi/?=
 =?us-ascii?Q?mDB08o9g3bgo9j9QHl947V/OGs+9HKzbdv6z1sdQy7lvP1thKHi119fMAEw8?=
 =?us-ascii?Q?v4wGITWazyxg2hrNm0Fj6K1xiB4JD5WugGjAv4Ai7i5jambpEdsi/XqunTGV?=
 =?us-ascii?Q?/D9I5PlhOJ/3oxEbpmzZec54LmcQN6800N3JWp6FY+FfKO+0mxaUcKfDhIVz?=
 =?us-ascii?Q?9gOKL2EUkKLVWL+tqBZp5Jfyi194Cwki+jeY8Kp6vl7g8Ya4MwV0Xmw9mPSj?=
 =?us-ascii?Q?ZZxkGkVEDZuHdb5N2k6d6a8EGHVwdOHS5S1ks9acByIal/BTeLT0nAjtmcFc?=
 =?us-ascii?Q?G65cO1R9Py9N9c2vj+HNfj+9DF9666cQ2oDc3l7TxmdS1+JoP4OeHJqxaPEv?=
 =?us-ascii?Q?z4Otpisprl05fOeLymcUhjsCju2K5sq3ceYYAEgK11Kicos1z4VTYeOuDUp1?=
 =?us-ascii?Q?JYelPAuOYviFaKXi/oKV/ytHTGk7Yt+HFnnqZjQl13Ros/dW5WNepfmn1xHV?=
 =?us-ascii?Q?ZF2HD2wCxeoWytqnIeLPAZ0h63+x+NDyJHmJQ8OlWHNzZqys+CTMELYcFFX4?=
 =?us-ascii?Q?SokaDDiHetZ51z8k6HBTA3ULVktEMbH+jsxvIQCvQdGe5Ah9rer0SvlMt2/m?=
 =?us-ascii?Q?lBPBCJJLIcFA13dh2g+9klBwPvcAJeAJmpzNiJnf/NgyJBsj2bjIPr9grgl+?=
 =?us-ascii?Q?ef+yROFRsB1nsHcLjuRAcolCEwB2drzuh5CrtkJUhmCMxd+GuTMC0jxLG3wp?=
 =?us-ascii?Q?5QGHE6pZIqYapi6ZfsSl+hEJkQITdm6Bh43w4GQIJbi3nzdp4bIe19JlJzWm?=
 =?us-ascii?Q?HmrIL+rFi9PWhoRiTfxlRkdyzjaDhwSqHefonEKlqQwpHf0mHKsrzM7LDAx9?=
 =?us-ascii?Q?zcxIIE1FsbKs56I3XDKsMzypP1WrwnGV0g7gwBMv5oIKQi1ClaKoRbJNH0qb?=
 =?us-ascii?Q?yyqPWuchTXhJDIYv5Owq5Zw7B2Y5pBtqDqem5Lf8kNcKwf/k2OS30EXy7lK1?=
 =?us-ascii?Q?vCeLVYks5kd30V/+L2bTP2E/7axf4g7Y3ecpktOg6aKQl8ZVMf1vZT4TaSbv?=
 =?us-ascii?Q?FhpO7wYIez30hWwRpwfB8jc3J3ioeoJ6Kxch50eLuNAwX55anbzIM5gCxAty?=
 =?us-ascii?Q?XAgfeFk6CHAL5oB8OavI8iD4vQv+BwL9Vj/pfKdFaZg8OVNPTtwd6WKeBMON?=
 =?us-ascii?Q?hHiswnwkMoV3TUQefanFEOT13wZ2EqeTiVcYWUYZh35iU4lh7ZR4lilMHnSW?=
 =?us-ascii?Q?OyaFE7BTVxBAXXoGk+VVSRTpElAn0XWcEqezt86vZAMvZ/2O5aJ7h+4rGDGM?=
 =?us-ascii?Q?QCqLD7YR62XuqHq8jbgq+D4cFArdI+m2Uf075xMr3v2CzcAS4VbFS1+P5Y/t?=
 =?us-ascii?Q?2TxrmUOqz/vHfCnStAvj5GNQT11a9jO/ybxhbF4fMoTmkN8qRlZT8Z8tN5YD?=
 =?us-ascii?Q?j4HgbVa5HTtn7K0swMdvjlomp7reUEmTCJgvraP1n/TMNQ2kRSqXzcJIetd8?=
 =?us-ascii?Q?2gbQYFtvqg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d03f43-f249-40a8-7bdb-08da4bb484db
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:12.3862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7WWj6DHAsLcnC9CGvg/i2MUAdYBYfAKTy8D2SuUANu5q9Kz0DmeBAI1BW3j9WJjyqG8YSDJaci+VUrdvv+GdQ==
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

This patch adds bindings for i.MX8qm/qxp pixel combiner.

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
* No change.

v2->v3:
* Add Rob's R-b tag.

v1->v2:
* Use graph schema. (Laurent)
* Use enum instead of oneOf + const for the reg property of pixel combiner
  channels. (Rob)

 .../bridge/fsl,imx8qxp-pixel-combiner.yaml    | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
new file mode 100644
index 000000000000..50bae2122183
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-combiner.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Pixel Combiner
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Pixel Combiner takes two output streams from a
+  single display controller and manipulates the two streams to support a number
+  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured as
+  either one screen, two screens, or virtual screens.  The pixel combiner is
+  also responsible for generating some of the control signals for the pixel link
+  output channel.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-pixel-combiner
+      - fsl,imx8qxp-pixel-combiner
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: apb
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a display stream of pixel combiner.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The display stream index.
+        enum: [ 0, 1 ]
+
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the display stream.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the display stream.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    pixel-combiner@56020000 {
+        compatible = "fsl,imx8qxp-pixel-combiner";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x56020000 0x10000>;
+        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
+                    remote-endpoint = <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
+                    remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+
+            port@0 {
+                reg = <0>;
+
+                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
+                    remote-endpoint = <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
+                    remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
+                };
+            };
+        };
+    };
-- 
2.25.1

