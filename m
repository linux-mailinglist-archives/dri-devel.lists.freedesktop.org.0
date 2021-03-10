Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E356333976
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D31D6E9F0;
	Wed, 10 Mar 2021 10:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130051.outbound.protection.outlook.com [40.107.13.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566B26E9EF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzNDNSqVvuQo21wxShIFtcNJVYJ1nwdnoZdPZ6esCfmCmvJi4LzUNTPtC4ZsjTMdEeh3oFatcNaCe/FijsQmtJZAtPzJEkcLwo3JT9jpXVCyyOvNqS8CuMbhan7yptdHx4Gw41n8NwVz7foMlNoTV6XKKUcR/pyTk+j4+91aJLEaEBlHKT03XgHJ7gVngSYqenZNMhK75l6/tXA+K0U5kD5rqDUpHbxQr/ER6TGQF0cfQMfnIRmbPREVMtWfphNa+ktaQVyCV66cGlcMM1HoYbY2EKzY0BAGZVvvwokRK2Yf24OJn1FngwIdMDB1AlgNuUw0VlckQIh3ZeGq2oDtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/q7PlZULgvJu7I/uCGFPoHPqerd5X/flwMZ3r7GdiI=;
 b=kw53f88bIZ8ztnwAVGYFW1fqVAom0i5mXrGWnvsxWDQ3TX01g5MUweWmepBJI2oZhuOKxaL+PuRILujC1b6EzDxEuSeZRb5hOQ/mTAb/T8LcVjE/lyxkvyBQgWKpgL3wMKxpiLur6BRt+VzKJDGpNGfQ4Yi7AhDd/0nC7xvEQ73MqWeylRTUqEXE5xwYOfsd9Zd5rmGYYa6ycyrck5HJf8umZTTV+eEoYrE/mh6roJiN6U2/iaUbquNyPPQBS5SN208hZAWGmW18QSf/aXee9BwML/ew8EJg5uEH1DUxvciHynGnVSXs2Xr+woFVtQ14Txb+S0zArjagHHHtEKFe2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/q7PlZULgvJu7I/uCGFPoHPqerd5X/flwMZ3r7GdiI=;
 b=dYazTsl+a+dawXsaIdAuQfr6rqTvwWD/ehBbcL9ZUuyAosI6S/2A6MwmewXfaVKjtwFnQBmR4NUYv3KG4fEOsOaQPOBgaLkISIkdcQaeppSNkHieouqezjn93/Mnj5dMdGkxGfZ1DRsEyUGR5bvJHtAb1ltCPNFkDePEIuccATY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:09:30 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Wed, 10 Mar 2021 17:55:29 +0800
Message-Id: <1615370138-5673-6-git-send-email-victor.liu@nxp.com>
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
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ce7d3ae-ced3-4d71-68b9-08d8e3ac9811
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2318B003EB65EB10B8631E6398919@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mM1GhfXgFvLVW2Brb5jCMt27m2oCQIsHvhyfrzLMLdWVQaa0Ev1c5rQVbu25t9JrVBCZbSFrhVIJ3u0azSc81Jz8nrUxm9vprGQkPKdjrTZMmgQDj+doDYUGi0ucLk+kz6UoZy8nD7Dog68ExC8knXH73WOlxBEEncLhiItAKbmn+4hlDLYULhijqt+48VtC2hebRXc+Ql5sNBnugsm+EJmclAIyLaoQGVfwg1JkK4VP8cKKvh7k/tPYpQUodx4mUjB1t/nq1NpCiPuTESB7rtcNFkL0h8s+v+ONV41aLa4rjslCSJmRepyOLdZfybMSAac2R2cYqjQAOQwQlZjysZI01M44yRXjB4qKQGtS2k7xSLyGaYkgsc4k5bjWnzCWgxSz+sk7iWgsPmTmPOS8MaVTuFvacFkTvPjDXt/XHJLJqGtKn9IfKjoxmAVIaUOC/PTyYXSidztNa/nlcf7BzgfdflYiNe3o9R97hulHIqMPpR8PV7QPlVUSv8Hku3VRTkG5wyV/wkfHZbvqvEllNanAlB0Zc4LFPAmAGfSFB7C8AKvJcO2R1nuRpNNGqY3ARrD/bn+lLI+t6btY52r/R/hKhPkoJfGamqIRf9TxD9jU4tO8yJfKFayXHMvNBRdooTBRvLHQ8csCNXmYh04QXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(66476007)(83380400001)(66556008)(8936002)(6512007)(966005)(2616005)(36756003)(6506007)(316002)(66946007)(69590400012)(956004)(4326008)(86362001)(16526019)(5660300002)(478600001)(8676002)(2906002)(52116002)(6486002)(186003)(7416002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Qb8wHxTIDL/3SQmwqa7+gYu3Hriw/u7IMMu9Nh76TQnUqs0FThNwGKnzv+8O?=
 =?us-ascii?Q?DgyOz+1Cug1jzdY0BitHqFYOE5rgAwK5GLCYj4fCKRvrImact5v7ypcy7MCX?=
 =?us-ascii?Q?yRxlvASJvux0aHk0wWtLf/zMqT6Eecbf9ET5QLAb0uGicSuL9Df059NOBJM0?=
 =?us-ascii?Q?STI6Moop5G4i8R3Dttj1G43na3K1kYTccOu+Yupe4I0bNcwEO2miKwLatnkU?=
 =?us-ascii?Q?9AF57yqShBRso4JbVVgdXydiXPywi4teqM2SLGIFj4f6nBBj8QIM0yltqn62?=
 =?us-ascii?Q?QuZ9lBgQzlYDbor0bNyVTzNg7b72Lnr9kDmhSWv16tUEcUDrpdeH5FgBElYK?=
 =?us-ascii?Q?JjhKdgdcW2zbhDSE9yVBAm8DJO/HJbJPHsHjwkNydcwsF5ToSGlNnNGOh0Wx?=
 =?us-ascii?Q?UzaepDK3Z43/cRHvTa6S+Z6uYJixmzIzMw7vC1l/YTqvilo1o1BMT7xgy0KM?=
 =?us-ascii?Q?vuWU5Q1CA8b6/rfq8e3v4fegZCgG8xpmYVckfasiNCXC2szHCYSmocOyiijP?=
 =?us-ascii?Q?2DezIcuB982jKC4TrHEsm6IYGZ4/MyOOSgGd4RQ0s9b0KbN729cGpaKt85G4?=
 =?us-ascii?Q?1m65GiPPZNoLv2VOhWqLHZQVbHKn/7m4x4AnPuSm9P3/iC5y36aC5faDZyhQ?=
 =?us-ascii?Q?DGRbgTTPZ08LH8m1ZuTbPtsKBsA5xwasn8Lb7LeC4LbtMFfbyoCOPOS+jG2K?=
 =?us-ascii?Q?H0iIH10WAml+XzqzGGxX7Pfg3DR0KnFIml04fRgJItFHy5uH7M0o/8DtDdvz?=
 =?us-ascii?Q?qPjuYE8X1bzRuGZ2tWrzHkqdVFr79+8xftHtjAjAJfBMCZ2LMuuOp5QNi/Ln?=
 =?us-ascii?Q?ODyDj6fl08Qm6J3vWUevuKzuCuNp5xc4+PVAJBY1wT60fUeg5I1DoxVElbra?=
 =?us-ascii?Q?GpZ6pxXoQzpXYas6oaZaxrixAoN6GyoJQKKVGB77nHbML8Ox3hGgtnWkckkP?=
 =?us-ascii?Q?U2bloErkebH47WVoJNRYbFsnpbW72e4p0goAD7hYa1tikl7NYs9N8Xarj/sX?=
 =?us-ascii?Q?Xq0eH50M/CNU4I5dQHm9wSfIUxIdivR1tcTUEBw/tLbwF4xK/2TCJway600k?=
 =?us-ascii?Q?liDVNy9rncByEIsWAQ3CMp47+5aXYFim9MEysBQ8Dap2do+J5pRt+BJoh4Na?=
 =?us-ascii?Q?z3KMIe+WaLY8pVnp4W0VY2J/4+MZBvC2TvFwqIQlRrIQaPs2RZtxpK3MHJuU?=
 =?us-ascii?Q?ajdKhsOK+A77Aet1RhCqRTMT7ABVA0x6BpeCmpw7YJqnne28M6rzbkBvSMLq?=
 =?us-ascii?Q?AbTAQk/WkxwLgDLTn9N/t/lfzw5lv3T6gCPVs5741n0/b6WC0iGV+tUHyfwP?=
 =?us-ascii?Q?g6PBG2ppawEewzURm76KYMyV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce7d3ae-ced3-4d71-68b9-08d8e3ac9811
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:30.0791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UryfB0XQDVctWyw7KPbkmBB2YLaIqGwPzjDDS5knv0nFCbv+0H+qSjj1nyWLKcN9PoCw4EhEaYxje55OodBdSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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

This patch adds bindings for i.MX8qm/qxp display pixel link.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
