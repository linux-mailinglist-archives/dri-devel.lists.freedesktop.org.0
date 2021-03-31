Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16834F905
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773D76E9E8;
	Wed, 31 Mar 2021 06:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76D56E9E8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SROMjfOvfCnugBwTbx/19xI9a7iCC0Q1IR3dcV9B/r3HfO0GTkNQfrujEB0VdAvylPv+JtiVVg6IlVj8Fv/jN8p3d1h1vQebj0dSmo5q4N23nSC1WroVetcatRhp5avKCrbjdTVS7Ub1Nvs8BIPQmMwqlsNhaQjkNavn1KDEenzisGxl+AxSctN+eCUQwLLcDccFNXPRDE/sB6jLEh4gtArthmSu9Ilu3x6+liKJCvTEt7GM9YF41qJg7E0udJkW2rAb7fn/d1x4emhsx7kB1VXe7U6DnuuXgQSRrxi60ExQs/+81DQHdkx4HCH6WMuSCUxqZ85aXY/V5/mso4Pm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkAWrg4KI3AOwkoNrBZL362aSby4CAgzJ48egcIHNqQ=;
 b=RokxJjLgpfEC45kf1yexOK6hFxk/0hvjR562ugnVD4uU5XYs1olfPlYthswLK9LZIjRUR1tSbzcdiWUMyerDze+HVa9Mf91Iyt7dsZzOLqaXY5QNt4O8c198TOOX1Lv3nRY+oh5I+Mvz0y5lBNaSEg7hxICUNMAHFXDfcAH4n9YJijIqdEo1VA1mnwwV7VzIyxlBM7xdHOKPc90HNn03k0oQw6Ja//L9mFY1r9X2APVjRepivLtOd3UTlqZODMo8eBodOHSXBqvJiX6wVJxP3Plrmhsty1LGv/JeAbuVO254FzO99lF+tI3Kah1jv1bIaQSFd6E8nCiHiDEDfmh7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkAWrg4KI3AOwkoNrBZL362aSby4CAgzJ48egcIHNqQ=;
 b=hywxOEnE337uUkIxLp5xt35dxDb1tdKJjslBwmCuD7YnnUv7vfBEYaPmHjp/VaEDQuPIzCdgp90X4tPR4wok5Ddm5eKvyuaucP0leaaD3T9ECwj79/9B8typzeqSWDk8RuuOhdR+42OmA4UggAlVB4+g7Wqe+0unZtC9f6O+HOo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:49:01 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Wed, 31 Mar 2021 14:33:16 +0800
Message-Id: <1617172405-12962-6-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:48:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee6b21e0-a9d8-458f-eb1b-08d8f41110e1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB634985704614DCCD6D1E880F987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0QjxKN6WyCdkVxu4mC7kNj4183VsAe+0H1MrL7Bd4rYg0JuJ075lSt+4MRxMsKcrorRghYPPbN+NbivySLjsPlehC2LJttIyGuN8heSsNXhEvQ6X+2vzNaQ+Rk4GQ2BiPlgSLoNVXL8vck/bx4Ex8N7mY/ySJHwR0ioOUiqp9WJVoaMVgSwYnRMdQbkOp7oEn74wEpN9IgstuCn6VFy8YfnfN5kaesEdvYmQ9AwmHfnGeYB+Z4RHIixtSEIvyXC7T77HaF99iP7v1ESyosAOCQGEgBCnd3jJWrBjWvAslemdRnpieoMjV6/6axY7vTGLm51LzgthT9w1X/SxuyJoSEls7hQputl+Wvjhwof02E6jFnSfJ5brH94N8TQsmzerBjXwgacAf04+cTjwrUS4YuJ4yMVLt3Nk32F/OjJ9X+15pNJuLxXAlR0KZulOvt7bAnSIMScs9xP2rFw6S9StBcCpbjXNqPeAtt1kKPwJrgLbXBBUFdD5CZcwCEZSksCVaEIMnJbc8sFFtgk2BPPH4y952LteEFNeUElnASgGaJYth6upsfKEFqtalV+NUOD/3LBwn4QYE27wPH4JpT6uf2iNJ0/7GVXXMw5K4atpaTwwtK+0tu5Ey/8Xs9aUxof7fsMZPoB1LAD8F/IN7sKR/rFpeFGQ+RPpdS5Doy+p5n9M36tnkhHgvbQZVLsf86klQOJtDDs6BWq6/aOI/DgbCU7xLFoOx4V6Wnr6uUsMLv6krfNILug/u00pHz8pC40
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(966005)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(83380400001)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Rdb+ce4OSgMGbVd9kqGaKQbo/5Du3eucZE6hcS+pFZ5Ygx4YWc1De7PJ0h9t?=
 =?us-ascii?Q?eNPNtG2H2YXoxq/bN+A05LXIyxdR1b4WOXHGt1n1Hzqj97J6UMbsMxVJoRrx?=
 =?us-ascii?Q?kN5qSK17Igjdkeh60G+6bhFZO+fsdjfnGU6EQ2nUiYCiwO6Th4fiKPPG/KQv?=
 =?us-ascii?Q?8BIOq1dXcelSW3X+g5S06ncwr22iIqmrADLnaWhLrHyEyqqaBlqog9ULqRGu?=
 =?us-ascii?Q?Uxwc9sTrO+n0gadbZwM6PwgjUJw645Xoexs307t4rQXAhG2g8/Qb1DtmOJln?=
 =?us-ascii?Q?lEmnWmsFvgCyj00ibNeBYZOve63D7eCEQby/HJb05jAtk/pnWsZ2gXChMV04?=
 =?us-ascii?Q?FRR4z/uUWJH7KXIMFnZFgKm0I48nmtyu+scJOxAB1SJTM0fkk+2YVmJqQD+w?=
 =?us-ascii?Q?WK2zOdJ49azLZMDdLb1k3Qd3jGA6Qxrs4QbhQofppEvbGMnVcxB9gCYaN1jX?=
 =?us-ascii?Q?SqRWRCh9+V11DkLfGvVumtCGaZvFFLTqnjER0MjPnwVFhycDaRT1FJgNjYVi?=
 =?us-ascii?Q?w0XaSjzE1bLmZR3dUEz0Vr5ldW9PA66+vKe6m+bCuB2lHeayp1cdHf4yo7zh?=
 =?us-ascii?Q?auaMUSG53pRfpKQm7INu3KwqTilc5JCqbhrVS2oTVArG8zFtVK0f+zuGUz90?=
 =?us-ascii?Q?H6H2LUttHmhCj69KE2i7cFmhs4cKC2UMhHa1+Df6IYdDOs/h+smtU9AKyE6/?=
 =?us-ascii?Q?02sFcMfCa6LvMi4fdUeTxG5xlTn+1xJ1DSa5Li1/kx+6UItjJfI3ipS8Rsj1?=
 =?us-ascii?Q?KwV0pxj20ov/xJOL7qzFvrwNt+Vm6a6v8Ybk7C1AbL6CyhCSHKwfEBMt1ZxC?=
 =?us-ascii?Q?bQ3wOFDrO/Suwni2ReKgIx+P+5Qkdh9Yky1Zow38RDY2rC6gDzdhlXnxbrU7?=
 =?us-ascii?Q?D9pO3lK7DBVouGvMo0EE+fVWrlAkaZ7YCblTDL2fUK38Pt8sORB+EzNvWnwc?=
 =?us-ascii?Q?yXLf82XKABfG1dgLdGvKxQ+cH3kSvqOSJASdo5nqTi9V8EcXpKAF4ALcabFQ?=
 =?us-ascii?Q?RpM2WfhvwGiQEugd/90P3qdJp8b74ll5AOCDwevFHSvVb3ggzI93IU5GIAIJ?=
 =?us-ascii?Q?+j/u1F5GMOmEcc+P5BYHBtpknMHiFNtEA7IfmwwEpBYDCGh6pfACN9NtEdNG?=
 =?us-ascii?Q?smJn/2+tcjVpL1yXZAYEOuXTByrzODDmngiCpc7KB2NyaVUY7kqQ0azklZM/?=
 =?us-ascii?Q?LHL6RG8bYoHGWhvrobfkqtEvXa5OAyMVfY0p2EnPG8tzNQ0QTc+TKDBGVEWN?=
 =?us-ascii?Q?9O+4Kh4ACJa6CwCsU/hUef7OYLaWL62+MwPtWJ7LZfL9jclvm73ycNOKScU9?=
 =?us-ascii?Q?N+vSKYGWjT89YCY7T8S2IGw8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6b21e0-a9d8-458f-eb1b-08d8f41110e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:01.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1a7y0dSL9PwHBUUq1CfC64GbQO5zNMRYt3ycqj++YngGQbM+GsKkC6BB7ZL/wV7OYo+QBvEYjcjMiUKW6LmmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp display pixel link.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
new file mode 100644
index 00000000..3af67cc
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
