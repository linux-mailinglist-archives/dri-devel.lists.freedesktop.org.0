Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF92F74B4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CDC6E241;
	Fri, 15 Jan 2021 08:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188676E147
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4XB0UaZdbEHZTBarRyI3IZEozINRFwL335iXMyGLJkl/VSbIOGKCZS9JcKa1wGl/kBbKMTAzmIFgUtw6UEqKNazx4cp8aRsKaVkR6DhJQuWxGJwBQXhybtIsjf+Yg69VxC9atndSXFiAAbW4OG9TpReDkwCKAL+myH8qVuEdEUAg70Di+iSozQI/2TwXdcCdetG1eyGyB2IGYzA7AWGAFP7VtGOW5Jha4m3fwAVrO93odDsPZfJo1zzkF1G/Q9cDELSn53SqW07MPOP9YmPdkKAZYe78O3Es893xvKsRDoXk0VlNY+IcD3zv72Mas5HIsEbK0r9+J5dnuJ7lT6fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2LPc64RtkXKLDLT/KIHyy4J6dGjx2ZJAPnZTfBsOCU=;
 b=LSOX8HJRG+LEXliK6Jrg1uzk40bBljN3fE0L6G7y4dtnBaVauDmHCcG13vUj1ij/jWoq7Hz0CqFhiV6T8rJt20/ONsami3IGA2CBYgeQql6u48G+nrqkqhFVrCbCNplKda8pADJ7/wBC2RpV7GNwotytuUu8Nr/Lm1Mh1I+uz10tPVpbADRdlBz2afARMG6ML5QVlatLQsR/bDvDy8DBkzFEQFu2viKMykaU9PvfcPUEXu0u+0TcwJw/6V9bx6UN80YLjMBS52NRybTOIRmL5Edj1ydWNF7YK9owO1GqyJvQ2WmW9tcInRR2ULGWC125se+B+gB9WE37QHy+u1xMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2LPc64RtkXKLDLT/KIHyy4J6dGjx2ZJAPnZTfBsOCU=;
 b=YWtykwuJIp2YQ8k4RpX6022ZONAfHVFYTlcLmJS0HfiWEiqGUufMxlzpR5zmV5tlGC20Ftg25HsnpfnIl3XR3NPK2B6yVKIJ2L9LA2j3ZI4YdeXq3BrhLzKCQnJXPy2JZdmzDljmcrNNd7cZWdvq5QkG+FVuyp64SYVgR5HowrY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5710.eurprd04.prod.outlook.com (2603:10a6:803:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 09:33:04 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 09:33:04 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Thu, 14 Jan 2021 17:22:04 +0800
Message-Id: <1610616132-8220-7-git-send-email-victor.liu@nxp.com>
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
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:32:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37f6b26a-031c-4fbc-bd23-08d8b86f64ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB5710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571018421425C8F6E3267D6298A80@VI1PR04MB5710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QL34UfNLcKeBxuLeRsJDgv+VxMCsCHjkTqRLRIM5D54pSoN1ClVvS196yYAzccxFm7hAFrGv/XyFIL7E64n6KD7sZVF7nvSydMzfWrq3AtfYW00E3+VAiCX9KFbm9PXMnEpDr6HkDx6h5oGJsDya12XmRmpl/G3ZsZk595cxvbLPGsivjA6hsz+af48Ht1It/tDAG9Nb4OCzbCZGxyslIJB9oQcjO5mLnulZLR/f+QufWARfhtuYWqNRgwpYSioGBSdDtmxzInSusDqmiK3TsJ6OReNO+bpl6nhYHpOG2nVLBBhud70J7gSuwvdgoywuOjOW9d3Bols4fY7Utf0ENVU5Y4DwlL9N7ibksR1GfS28ZJWbN3WjFH097j3FBmRg6pt9Gc11uLdIYXZQylQ8OwbiPXvTWpaxJAKZNBgREXlHbJLGZKOGuUsKvRqtSRH0QJEtCkAEAbU4XtLhVYsr/pk/Uyndek/1DlB+Ngdufj3bIQFLbsU9HoENmjU3yiEFnKWbNnVj6VDPv+63Wp15aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(36756003)(6486002)(956004)(8676002)(26005)(6666004)(66556008)(6512007)(66476007)(478600001)(6506007)(8936002)(83380400001)(2616005)(7416002)(86362001)(4326008)(316002)(966005)(5660300002)(186003)(52116002)(2906002)(66946007)(69590400011)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2whJ3jCqrLiOVjJauxIsNhmMFrnWxl52/IhGrdUabUEz4Q7bUME2wCS+asii?=
 =?us-ascii?Q?OCmD4DRQLDqXdcnppl7r7+JwVK+Hf1y1gXr1Sm1cP5qEXFbZYsibJFSw38ex?=
 =?us-ascii?Q?XpM6Uo455MJOvYmjVhzKbXLFXI+rxtO6bMJ5vqgfCF5qCKen+F4FBi1ZDfX/?=
 =?us-ascii?Q?1DXyEUwnPnQVLwdYgdN+l+YLQbbpJ/RzvjDFHekck0Vc8VyJJiY2S84DbNX6?=
 =?us-ascii?Q?4f7ow2/FpKtCMveqgVrxIez08iEAdaHlcuXZhgriYkceI9mn7wOwNdTHMTbq?=
 =?us-ascii?Q?y0rYtaEBHlRyrOAU8WeG3/5Eg1m7qgyp7HS+rWzyARVfYlxIfkG54F6bElnV?=
 =?us-ascii?Q?wjk3wVwneQVE97sm52mQv+Ik3o89ZyiTRZwK+AdFGKsKtylmhZ6G4iwZIcda?=
 =?us-ascii?Q?lkuL2CHRoB4Q9o8GlesNayGjNwYpDX4wMoNZvOyd4dyPj48+fgzGFr9KmWcm?=
 =?us-ascii?Q?GwlSNxw4N3QfZ2osI6O00pG7eyvuSvhOmUFHYHlugsQ7lohinFU55czfFcUW?=
 =?us-ascii?Q?GVhErLjy02srW/0Yl1ePUQXOazVdoqD1zvzXyphtgQ4UKact6SzVyT5m27UP?=
 =?us-ascii?Q?yBm6va6xXVTJvbU8UjpM17qfZL542zp1/wYY4DEpmi3e5+tGj7tfOfBv9LiV?=
 =?us-ascii?Q?cNXYXxA/PiOtxZKd8ml/7F0mVNyOyKwV1rm5/DYkuaH0hFKIxWdkLXgTRBd4?=
 =?us-ascii?Q?DPakx7mB/lmZdj7SB/jQPac/9znwRRiN62+n9acyYPc7NdcrfANirKFwbvhw?=
 =?us-ascii?Q?DwMkaHp8Rml7nDc4Yrb4fPLDAr26me+W0EU5dA9p7pzyraIahwg/+sV6QmMP?=
 =?us-ascii?Q?RLRffbZxJfxP47uXryicE0e0mKbl1ZGeaiVxPbfeSVZoJYq6Nz7BMGeFY2dP?=
 =?us-ascii?Q?vKwxVD8hUeJmC2jRm2xl3g0K6WVtadKOgA/vjaAvR16xZclFVR5nkrGFQstR?=
 =?us-ascii?Q?Om8g6ZkIZX9qrrWcAG6LxHORNwXM6SPJCrX3DksRZkx5SFQUYaD3jm21zZeJ?=
 =?us-ascii?Q?H8tj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 09:33:04.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f6b26a-031c-4fbc-bd23-08d8b86f64ef
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWQBVgDEcf4Sq3eJ+6kc9usD7GXczXcwyn2V7kAPnomXbtRMX0/snQOdzbBZXA1XzAyx0kuTgwNRHoNLjgyvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5710
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

This patch adds bindings for i.MX8qm/qxp display pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
