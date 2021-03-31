Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBF34F903
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214CB6E9E4;
	Wed, 31 Mar 2021 06:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B177A6E9E4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8ZoJW9xx0p72yRLDMhHYdpVSD0ulN9sh/WEG6gIEv5Ycbd3Fdh2J/2KZV6g7RBEwj838IYGxUD6KA2KnmNKYv23VwMMia5YIh1Tnfn1DuV8cLc+YpRiW6HIyF1/BJwyfqmbZCaEWJfRasWavTKQX+88NJoqHFNzFrgXZ1qyLm3jsgB3fnaYqzzywAFpTEF18nrjrvti20HaeeqUixxTnpgCOHtP3FGHd09l7kc4wRtKpjBpPB4RgBtjkmsKFzS/HaCrNUKg/koAfW7KRApDJkKFDs6tGlSCY8Wtqos0XHGy691ReaQyi3cQ3ZP47xnLxg6gQRF8fNoHbp/dc2cRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz5Yugx7o08tzY0Nv7fpd9Zu+HT9pCTpWdkg4DSzQTE=;
 b=RmQ1tUfbCD6FQkPEHeyJe8dKlcoZmBN0Wpiy7JGO977GBOTcSmuMYyIIbH1RVw4t7gdp2jmKgfTAXGQRQ436LaafuhN+NodXQEs53Yc86zXajDDvMuQJin0qgd67R+qnJSnm/PjaEYZF/TOi3ljFjamdTMxMJAs7Zv1pFPVtrt7Ah3m5MfsbU9DqCmQBtThkaVJtpRQKhHJ1rE5EzR3VYKKbnignG/b1PLWjm8bjGva2FoIVCTJELs0CyhnzOpvR0+Yxsypg200NwNzTDQlvpC7ZeXhFqprCMIydB0eokUCiGu7A5EhKpRUKvK92YYundqEWNeqMvn+zzX/mo/+tyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz5Yugx7o08tzY0Nv7fpd9Zu+HT9pCTpWdkg4DSzQTE=;
 b=lrKE25/m8HRyImuEvNV/wB/ktqnCfgW2mGZOIx37RDnRhrfktuCbRMeG9hS0Uw5XvEZ4Kp9bfsB3tchYAXH/vC3RYRuA1WGjSSUTk5C16lnoDxVmUTeGcLYr3vwEgFZpNTmv0y3JV1DbG+F6s06UvDYip/PTVrEmXtuTN8sHy38=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:48:46 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:48:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Wed, 31 Mar 2021 14:33:14 +0800
Message-Id: <1617172405-12962-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ff97e55-6eab-41f6-f6fd-08d8f4110859
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6349F3628857CDA81016769A987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: extLq0lM/sGUw1Nxko6Y9UAluMJcecaMg8Ji1bFrii9AlwVgL5VaRxjBxK3IWehDgBUh7q/DJN9144YLNAAemyDlspiIJDlfk/mTh/yzvUdtmTsqForfRC+5FOVEZjpdwtFhLmm+N9lPqoJ39iq6/a1vW+nxXDDxAwMfKwSzeMyCAXa2TcOP264iLsoUjpxS0fTQppztkViEEj7M7XVqOLlXoI/Q+OxZhtgnjyTJbb9WGrHo+C/JnkzotYvuZp27B0mPjEJHX5s+XVXNRhOcYa7/mrcr8lmrenhZqCcBc8L4ASonliEyptSCxsnCswRTeEQ+r1XQZjjG7llQShr5YLOIYJ0CQCsfU9rQzJboPRhZ8cKtkSlBl0zJDOaTwu8d6aSjgHHDhgCNsw72AD/LMxzN+/k7dZb59mWApkKbLR1vn6r18BDXLtJooqdrB5fqPfLSaK/JDlFFtJ7jw6p+YA9DFBTuTW56VhntvsZaatznaPz4lXd9zaHoJgwFI7on539FKbPFMVcuL4k+fwMAq8xE6dS3eEVbedEkdevmy81Y+GHKqldtcJ4LUYfvu0BTFyu/AJ1JXiBmcj08SFu+CEDIxj434F2/I3qmnyntFBpqSmWUcRU4mPL8OUw2RZFP26qI6/mUzdz5WUWFz+h/4GlSGzNdaTGZTD1dkSXp1zhmWdRVCHSzS38RmcMNN3SMqgFZWUEZkrwU4uCQ24QI2HuztUuyRPvOwQ8nBEmEpubFJHHGrOI0lmdBmD0Bk+GT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(966005)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(83380400001)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CSKXEL7S7xlOZ1XzMm1/pQfCDBVdqMbwngsN3LStAMx3T3ieNVF8E0AtKoRu?=
 =?us-ascii?Q?ErrC+fa168nY97vDWA3dI5rpohRMGbQtnu7yxJCgc0ci4B8rZ5DO0VrlD0Mu?=
 =?us-ascii?Q?mYz1ABgwH+wS4MR1Sj0+WjEQ9TM5UMJNon+Honyt3k4Wz0Oy5UY9xbRLV9SZ?=
 =?us-ascii?Q?nOyu0MM8cNi4W2h6gwtgQij3rAM37LH6y8TK4APaj/onCWIktEzKnO0Es13/?=
 =?us-ascii?Q?L/+d5OQ7roWCEkZIEpE3MlcphJywwBQk+rQTVliSDXSXslFZ9Q+0Z6mlvF0N?=
 =?us-ascii?Q?JVsdpBjdC+/YqMcjLJ7s1gVuMUIXI5MVtb+3kFE8yVbFApGLEXpXfQJUuUAx?=
 =?us-ascii?Q?Y+oHxpmL3kCQKtLXHKIKi+WqGDdoa5gaZ9Xe3W6qXlnofXyBytpJ/ivLPeXo?=
 =?us-ascii?Q?34aby5oTDT+fOFPHXyTAkEbGL8vMEE8BPaxSZ7sWfahdkeIoC7A/Vqfl9UIO?=
 =?us-ascii?Q?2Wp/Oj4jVOM1ZhQe+ZARsRj47/GKKQSwCyJ8VijBUXkrhSfkR01DXtkP0qPS?=
 =?us-ascii?Q?SUmrFh3XAlhWWdLbKUNOYAwuEuTEat6uwcWW7GZ82R8ByQcA3ridjqSunDoA?=
 =?us-ascii?Q?SlI9jJGUJyzGMN9VFA/vopi/MzHcanHMsV5I+J5SSGd3dpkHMOOzIPqXnnyB?=
 =?us-ascii?Q?Dsj7w7GCM6EAMrzY7JXc3keoD5n2v/jbRVEMn3H0h1nPQ3gCowVHKXRZBXha?=
 =?us-ascii?Q?fRjUUOEiShAINDy4gFZgsS55lg+ArJefs2mQ0/gzUfAUlx7AGUzy3sxzi3lI?=
 =?us-ascii?Q?mHnEihCPTyPK9D67sBoiILncpNFQnzWtXkleDHtPN4Ry4XTAytjS08miEwrN?=
 =?us-ascii?Q?0L5iCBBuiK3Qoew9MUTk6rloebHfK3xDAgoqsBrggFjg3laHs0Dgs6XV1hqT?=
 =?us-ascii?Q?5fvcWrWmBhSKR8Rl7E8UptqVCu76U1i+WZC3nXcOqj+Y+KJjpJzcJi4PhC9J?=
 =?us-ascii?Q?6sdZ/Bqp4f2BMk1a9N/JR5j5ZLpx8g8LRHiMM7ERLgjGz8pesyMThFI4xJ0n?=
 =?us-ascii?Q?gjLTn0Wgq2o32IUtE5AIihK+W/LD39H8PUHez/lfHKFUfGLnGCJmC0FMufNI?=
 =?us-ascii?Q?6nS19YCR5mmdCXFjRkCKPWEuTg+AaomtJIQpliCcWWUxs/rmxUuwyRrx4ZLH?=
 =?us-ascii?Q?MurXiKdlVOxqa9oVUDn3tI4DryozaVfB9Yzno4fHiLM70KyVT0xxlg8Tg6FN?=
 =?us-ascii?Q?DDZBlbSWYi3gneddLzDkKLtlIUxNfNaKRwGFVgK9d4QCQYlVbtKckUlLC00e?=
 =?us-ascii?Q?2b6TiO3EVI4s/2BgAszPEEXepXqUNHMx4EEyW9UNtVrSP089PMRYWUF6wiNl?=
 =?us-ascii?Q?3r+3qgCPsaKHOify0HtrI1Yo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff97e55-6eab-41f6-f6fd-08d8f4110859
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:48:46.7328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBQkaWTnG72ll/96CDP3tqbAfwdu1iK+xPGhLQoNBeu/V7GEh9mBlzjdSC+v/3Uv0ypg06aTkqYpF6gZbHBIvg==
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

This patch adds bindings for i.MX8qm/qxp pixel combiner.

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
