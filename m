Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17E333974
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940F36E9EB;
	Wed, 10 Mar 2021 10:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB006E9EB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X42GzjE58OoyTYH0szTyEBjgAPRlke95X7s/w+BlUSDaTq3apyG9ePtu5eQdmzvjTfoyse/UH1tj1elQsDMTqA13tmqphDmROXUAgtzrO+dm/t7Nl25e0JEjctiu3uO3r5V0dc+DafMW0iiRWJoDj2ySJAIZrWj41piy1hdptah64DpNFfmycDen2RlwgPoT81MQ//J5ORQ6k9+1GJH2J2BJesT+r+vIWcCadWMScrzfaQLqbZbfZTZS8MOCDWKACXodyJPvWuG2r3vjr/xKM4B7U1g63HJyjCrhdEsW8WH6/O180FdCkOgL9LcBPDxKKhuNUXlYLhTd5z5uYZOfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+WoWrawYNO606CHrWsy47dmY2u9l90FztGd4axjIGQ=;
 b=BcYAgxS95BaIYkIBoP6SP/zfIWRb2rELJ7BMeAyNdD+B3Q5y6XEpivTNxruC4jHpBAs6wdob3cae5PkyA1i3G+JwCQXPzZ3W1nYmMLcVE5n8aqQedPzWUybdYhGLv5vzPm5Y+FzXbDlHb3nJ0MG6IuBJHRJRvCiQhThIiG2x5CjmPt7S4/DkMzNNlWU17mPrrERcYbul+GucYCO3K7P7M6n/jT0hVL8gPUvNqCYtJfyBKJy94CKhmeUuBpP/pPdx91AU8VOX2Kv4+pplYg59YGKyYyeavuZvP2oATvawq1DjE1iZnZJ2ikAzQ1cAmvLYAic1hZ862tMfzKZMk/BM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+WoWrawYNO606CHrWsy47dmY2u9l90FztGd4axjIGQ=;
 b=Jp4mT31IOBPuwsXPqMSlFHr+gbjw8BMXz6BQDjqQir7jA7dc4vR58E60mSauEFLeC1XayH+7K9m6XPdAzQzHiCCLgbXDsBVA7q/qR6AKxTnwS3xqcENmYCJ46QnrQLRv3/swEHcIokZbELBQOFLv4MJNRos12XdYhmyzP6ezOFY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 10:09:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Wed, 10 Mar 2021 17:55:27 +0800
Message-Id: <1615370138-5673-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27756c52-ca43-4127-c48d-08d8e3ac9025
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23187CE7BE9DD5155EE7130A98919@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjBPTj1B8yeC9GM3LFAvswg2ZrC0OmHiQRXs6kGUApvYMt1NBOmR/+zk8VcXFGwhVEF1ZneWhzcrif59q8Uw9l9il73QAixAXb6kILwhijDNTwHOAVJngQUVMMFcH6SSxB0nIYgV+kP4tvzBgKEOnKI9njX3rf1a/iXhBz4gtLISAN9KtGPQgG9j3Bccd8jfe+RalfekIA+p0k8IxYa3FcIHUGlCv6kUVSllqrPe8TMlQnYu1igX50Mj72LhYeJF8mKHPktgy1guVCm2tjb9MeFK1NdYspa3dOSDrhB5HmAxGTioHtBNciP492Ej4qKV+FIs5gQfusbbilJN01byIXD2ZUp3dEQTbM8HhjDQwyPELB6gYReLXsOSwkPOOc/KRa7sU1NzqLc/ZxH7wHSASciOoj5vkXcjO10giPo32iuP4XJ74eQgEAkaUq/KlfMvVXcFV99IlgzXhahuAzf+YfAykjAYKJTZIHg/k5aXq9JfII9IwjKlbe1lljm/wYuLuHd0xIMwPj4Twt/+SlID+FrH70ylAH1ddr1Od5qM13muArg0A008F/ERFUFm5Q3JgIjfewJ+RCochd/ZnlNXyHRet3H6YrzcSVX0TShNoVp8Sm1ZT5ArVLp2DWKdkHDW+o33+TwMZ/OoN+ZGp5Dm4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(6666004)(66476007)(83380400001)(66556008)(8936002)(6512007)(966005)(2616005)(36756003)(6506007)(316002)(66946007)(69590400012)(956004)(4326008)(86362001)(16526019)(5660300002)(478600001)(8676002)(2906002)(52116002)(6486002)(186003)(7416002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?omUmDVwc1sKDAXEHKImeyWBxpt/GvgPDqX/CxkwV/6n5r/Bg8eZIJQz8UxFL?=
 =?us-ascii?Q?/MGRoEvhI7/9TPx5z8BJv3AOoNxIqTvdpIouRiayDi/dnnkzCaxaSlZ25hzi?=
 =?us-ascii?Q?iDO8reMlmh47almGAgwczPTOX1v1xr3xTTjzdd2HZun+nAo7vPR6NZlW/jru?=
 =?us-ascii?Q?l1wUuyaUdL2tNK7QvkUC8drF48Dg4t2oku8crTYwMbaIUdh/+ztAdgADApBH?=
 =?us-ascii?Q?isgLHKdrZwqYCQTLq78G3n8H50GrDBh9vcZaZEn/jGC6gH3jlJxizzpAm3+P?=
 =?us-ascii?Q?4yXqQJO230Fdde7EM+St7xEgCqQ0ksmAOsyGdA3DzDd45DnMMsGWHbb8JVUi?=
 =?us-ascii?Q?Qoni3oToGyb7bC6nXu970U2+46eEl28roLO2zrQktqpzHmb+0FBZrH2pulcF?=
 =?us-ascii?Q?E7jE9t7R1UFy8wFrT3PgpVYkz0lSjiELZPz+hrTMSwXA1HM0CxPIwCai5ZcE?=
 =?us-ascii?Q?cOg4ETyPOSCZjJoPgYKo0AkZJbANLjb+zZoMDgblLPWM9GWXD0UzGhOKT4VL?=
 =?us-ascii?Q?oEGRmahPmu6OI4QHrPPPZvlhuyTzZvQdJwti5Zd6IyIEAn3ysvUZnEEWd0Gf?=
 =?us-ascii?Q?P3b75QQ2bCTXVBU++gLxMNyAciVtXmnDvVUq5/rvmck8rcMfZM6TBPV1As+s?=
 =?us-ascii?Q?O62QAwmp9YSuuAhgSvddAqnwLsUaDQBQ+ZDGlM8GqJYy4AzlDMVfG0gUq+sL?=
 =?us-ascii?Q?EQpgLRaOOSjWNDyDszKH1D/6r5cAdfk6tk4bFUAdNFbtEXkuWFXg0DTJpiru?=
 =?us-ascii?Q?Kd4HAFAJKPXHTtI7DPDaTMs0+gtazd0MNP+VfJ3Ou0ARls+8Jw/i4KxmVpBc?=
 =?us-ascii?Q?/xM7JUHGcQ3Llh8iPIIUj55AxANM2GTpIrU5kL5O4mDbzUQopb6wQ/h8HvNd?=
 =?us-ascii?Q?0bVAXRShEmMvrm3vdzTUwzzBWQK7rYqmP+b/jxnlyiA0rRlYJf/j2X7m85Lj?=
 =?us-ascii?Q?/GurRdFaO3kefHGCHjfIK5cX66nOZI31sRc3eXkmOHZwABZF2jx1y3swStUk?=
 =?us-ascii?Q?Juw+903+mQudMaZuSbJyWAN/BxXLZ3UuzFejPSiehiurxBF61afxc1yzIJhp?=
 =?us-ascii?Q?dge8DbcQ/47aKvZcY0Lw/KH1/pyhtyJZ3gxtOtOaEAApdhblPe7W1gW0QF5p?=
 =?us-ascii?Q?2wdB+PPzfvXREtwB4J4xlyDd118qQ/9HBo6a6RoltvEKAgyCmLZN6RKdKgGO?=
 =?us-ascii?Q?TCddJxmn78j33clp51Cl4MvGGeGSlG0O8DT8Mk6TiIMGYr5MooCYjlKXgFlF?=
 =?us-ascii?Q?5ZmdUQnd+6lZA7U1KRG+yal8XLxH82kpGFU0cqJhHr4WakPniFd474Qbs9+v?=
 =?us-ascii?Q?RqzdOJMuKvJJHpBlaFZv9kIk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27756c52-ca43-4127-c48d-08d8e3ac9025
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:16.8017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pyg1lNR/sDOTRyOVeL92hINo+RRMq0rg5UYPSzXR0dqfVHF1yze1HZxxhA09cQycYbBw+QvkKVsJ52q7QZw+ow==
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

This patch adds bindings for i.MX8qm/qxp pixel combiner.

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
* Use enum instead of oneOf + const for the reg property of pixel combiner
  channels. (Rob)

 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
new file mode 100644
index 00000000..50bae21
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
