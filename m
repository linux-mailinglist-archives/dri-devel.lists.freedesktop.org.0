Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9554440B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B8E113C14;
	Thu,  9 Jun 2022 06:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2078.outbound.protection.outlook.com [40.107.104.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4342E113786
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOTJ1f3T3YG3EifuL3caI1LPmq0+TCExB0mrMN95pJkgtAynW1xEXnAPxq57CehPMBCFF6LswXLzl1ktMUXHpGsi/5GwUYB3cwKkYi3gDFl8hCU1WwBWE6Nq2rUkS2IeGo5m2rt9mhxWqnPhBpr1375Zfd38wYaGS+SJhQt7IgniyqeqSbVf789ro4UVyWDtdLHKylhwdqnATsoEBBb/3YvZyZLGC/SXU1319EVwGXarvkWtgAu9vyWy60MBbeaiM+B+BKtM0WEjI1yTTAwa0Z08fg0Bt8ICjLIwFi4knm3Sb1IrWNbp2/NDLdDlNXDdCHg4WXhKZmy+VcYMOhrSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DjxV3N7Bt0o3J/KT/FGQPU6HbG721E6s9o0CyqixvQ=;
 b=RSoUbNZe7hivqWWKkEZmtqzEV7nyZ0cdJPa8YQzbHjRJrebCKta3+DXVNsT3WVhW6E8d2dn68vARVbreEEeGTgWjtAMt3Pu1mCIK2gq2wPREepD7yqxnNjd+bUOjWng30xPgMmAjcCUpeqH53VtpKWrCJIgxYBguomyXipl1hk35Z2K4WnyGmqCHd5g+619+cbBEpzFceR+m0sLliCA6hhP6rm73HyPByORPLM7vz4tfuCbBgugxNPArTD1ciCTwNGlXISGiKnBPciHOdmQmC2q+QPs95e3El7Nj5+JAkBPR6m6c/oe1GP6qUuCS6GvYl6LKoMzMYe8d2nfnM7gj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DjxV3N7Bt0o3J/KT/FGQPU6HbG721E6s9o0CyqixvQ=;
 b=I7mOS4HPLq56kfgyLPxMj9M9a7dnauWi1PM5qHAYhPqmK2HMVQP0BbVRpn6vwUEApCueCmemMv2hbc3UXB1aZizCIKw2fKjrmnmf0Pxk5hkoD6t0T9+EGo9vJUGeDp8NGqcpSXt/asbjF07fMUyp3xxFdR3wGsHjOLM6/tADBl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Thu,  9 Jun 2022 14:49:22 +0800
Message-Id: <20220609064931.3068601-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 301c3304-93c3-46ed-06c8-08da49e41510
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3518F110CABFDA6DC27787B598A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmwBWc3cAWEIBinG2vAAv14OIiibv+Jg8E4FdTR1PuyNSl3bVPhPtIFDrgN2x0rUKNTCWehxwQlm4612pvYlCkXA18XdDRAx29A0iAbvP8EJQKZKA4vqGWa5bjeFLXRMmsvhI6crAt76io4Aaz0u8BhNCFO8Qif0RU7Kz4pq8Bedk4jlzLsuw++LMmSMDAsMS0KCei3Pzlbag9kUSjs/TjBPhdU5J9v5rXRGgCJXwqdsmccoaD/JYm8wMjK2BiDDNNrOKYXuSbtCnMqk/PB+HxmXU3CNepOLLxN0fwRskZq8c4dVhfKovoBbDTb27M45d83eLGAptZgsNWhnfvfq7lxMGa1v17VFx7acpGQ9feVkrwMz2r+9yIo/R6SLgDYvT/C4yz3QNXrKcBe0q4svfr76lh7EImChBNyKxBJiUr1/hhMmy+iYzxmxxcvhnYI/QLTPeXPnc5LckeLicFhqd1U2uuF1+9OUM/SwYQrcJXZoSICMJ47mLTqaoEC62f0l2y6mqk+iKUyRG8RA5rEHkAv9xo9cdJra+NBpZRd/abkrvQ39vf4cLnsQ/OX9WGbuOGFP5yt//+RUDvAc2j1xqx/uSV+NZ/8iLYm8R5YsJ5FiOr7NagL73pZ0XJgt/AScPjka5k9rj133mIRmoA7aQAbBr9Hv1i0VvzctiIEdbo76csNGMEZnBOUp0csclphv1drlL/4B+8Ic+I7Eguh9t4/iC1/I8+fFXQnP4UZe3hNQHovo6BXOq3fsU7rhHJ6oJ9uPQgZLHZc0dhqCIDWqtpciE0bEttQJ2KkCxeMbV1qy8ZQByrBY6P79emOT2TLlFQq5j8FcEHocCx6uFZMZJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(2616005)(38350700002)(186003)(26005)(38100700002)(6512007)(6486002)(83380400001)(36756003)(316002)(1076003)(7416002)(66946007)(8676002)(8936002)(66556008)(52116002)(6506007)(66476007)(4326008)(86362001)(5660300002)(508600001)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?no6+aKu4kxu+hG4o/OJhM1vhitFYAN7iXnYhEsrwCv+3ztlMno/b/eoq3K7A?=
 =?us-ascii?Q?DXG79MGDFO9aVPOdLcGMqVQIktxp+4nmOIcjc7kWL4HHI1jmlM29PINwbmcX?=
 =?us-ascii?Q?AMe2AT/syN1lJky4cW6zZ9DH44p98hecj1UrTYHvLKm8S+ia6PYIZ/IY6JYc?=
 =?us-ascii?Q?IrOx8CnTlWtBJvR3WbZMyMoUTiFzKrXzhaiDmDIwERWxjHaelWBgt7IHyo5v?=
 =?us-ascii?Q?ZzoljLS8BbzYtIFEfn6FW2JDsdLOEEiGh62nSKNkAtz6t+YCw9T4GNGceGlg?=
 =?us-ascii?Q?IpxGd7yzE+B/oNTdJ73xDIuHPI0cHiNvqnbbcTLQO8QF2H8SOrj5bN5me2O3?=
 =?us-ascii?Q?Ms2ZP3kTrrqlqrILRpAiOCT92Z5FkhafDL/f8h/rQWRSBWgyD+TKsWjJPvFO?=
 =?us-ascii?Q?4wmoSXR5y4qSyQ/LHny4ZYWtbPp0Ke60A6TTBNns6xWigAQbCCTaU2LXwiBI?=
 =?us-ascii?Q?IXEA7Y6+pTDAyauU2M0eLM7H9lpxpEknn3EoNi7wCvpdDYQ8ovCTxj9BRm2Y?=
 =?us-ascii?Q?HWGw0OO2A2DiAAIHlvfIyp9nGs8jvtp9tsFen2k34PUIy//SohfwRyIYpN09?=
 =?us-ascii?Q?NluAp0U3QZo5kQAjM3f8pCJzZVpRLBGYuMUIp6Pq+wf6JAxgrHJQN7IpRtGG?=
 =?us-ascii?Q?LZm+tkwyI2Y9zh//NZRVEt1RjPlkLmEzeNbvdqEznOG+YdCgN/Hvm9XfzT6M?=
 =?us-ascii?Q?Lijkdr5CpcMl2ISbd2KuuKtt8eKwJzLlAeIPVQwuwomWbdPWC1tBcVrOSlAv?=
 =?us-ascii?Q?g5z/dHYCPuWZfFns5qhTnLUS5yseIONgyddsPZTHy6NupLrjHq6r2Im1y2xx?=
 =?us-ascii?Q?VnVBc4w95LucS176ZLdBeJCdvzn2mYzvjNfU1u/8vEXlleVGqRM3N+MfUnVO?=
 =?us-ascii?Q?4946gfPExMy9lVNIPQqs20wl6/ems9zuP+D7WGDDzpHqdyKf63NiIibI8Hz+?=
 =?us-ascii?Q?p8U+bCtA8hrtrYiuBrRjxBU57KUrleteg14xQkH+J74yUk8TfsLKAYIRbMqI?=
 =?us-ascii?Q?mcSEIDytgoEbfJeMzyzSypvgYZpPLUXBlTFWn5MS5j+/7aLXgn7dv0kSnt47?=
 =?us-ascii?Q?7ElKEBFIREmvtSScCwDFmPuhTr8iuN3qFaKycLBpvT6s6EXeAtgpicoD1wzA?=
 =?us-ascii?Q?hWxN5Q0Jnwn6pXFKvfnKnJVNKp+/hhqRY3UJRn8OB4HxVstUiOnYy9uagBny?=
 =?us-ascii?Q?1aIiNJYCVzv3xns+xXHVycr+4+gWzwmwIeYfadaSjlTqBPhi4/rP2R4Vf/M0?=
 =?us-ascii?Q?wrbW5L5k225m74D20GyLfUKWxTHIFiv15LMDMcVI8CZh78xiT/oB/1WTwKcB?=
 =?us-ascii?Q?QRGld27R6IUlxS0gil+pE3PlPwU5GfBVhJsgPHshYQJJbQAESWCEX1MwfjNL?=
 =?us-ascii?Q?H+DNBaPSnntOg+FixM8eBns89pjsrBtWFf+woYwFjmJm9Mhjybn3NN8Tgjh0?=
 =?us-ascii?Q?tpju9dhbRYFd+nXpUVlWVJjE9OLeHclqyw8lzUS32eVPs/3LGUkPTR5qEtD4?=
 =?us-ascii?Q?EsG2d06ZzlqrridmH/GgiK9AxoTVOtiqHCxEHHqXewQJeQr/9I4kVvwM8KZ7?=
 =?us-ascii?Q?2LXbIAaBe5Yzcsi40/bmonFAqVRJT3HJTxsyv5ifHnVKoq/ERKitWeP6Jaoh?=
 =?us-ascii?Q?uZTnZ9/OU4jv4OSMMmuN4/tWNk3CmoC/L4V659RVfPDLsAf9JTT9+OFEsGDi?=
 =?us-ascii?Q?OLxak8cM5OZ3Z4to/WAXN/p1h7bazf3BMmDjFNz0PB6A8w6D+OfSYU96FE20?=
 =?us-ascii?Q?nUDklVPsPA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301c3304-93c3-46ed-06c8-08da49e41510
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:38.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsczIer9RZhlZWqlYmNbpDMd4NAssyaZ2Whk+zPnjNqlt6qQVao6dqIt4+Ib8nvVpd2IqzJGjnqdus3lmim0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

 .../bridge/fsl,imx8qxp-pixel-link.yaml        | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
new file mode 100644
index 000000000000..3af67ccf8db1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
@@ -0,0 +1,106 @@
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
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dc0-pixel-link0 {
+        compatible = "fsl,imx8qxp-dc-pixel-link";
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

