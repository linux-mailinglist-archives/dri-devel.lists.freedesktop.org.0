Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9C2DDFA4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48D889AC0;
	Fri, 18 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529976E235
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmTO9mcBCQOvre0pJ6C/yXuRetxoFINIzLMjm9kmZtm1yV3PjjFeZVqGOBn9HE5+xh16gwtEEwTPdu+U0cSaXR+GvNe+xk8rG3izIlGIZreHorMWkwe7ZnfkeVLHPiGxWHKA246JChj2qBNcsWMimCXMHQ44MnEAoCU5lntNYuTnBqKHUbDvDvvDJ/aVhJatQF2sl3CqKAhGsFQgW0PeWtFQI9kLyvM4gnzm9w64n1RWOayZIMF/CUtK70FMgqM4oT3zd6Adx2r7UIyhHTpUsHuhiBHYBM2eN7A8cUy92vAsVYEd1IGcq9jZS8rJI+14W0R64MtWWiGcVte3rUjB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSx9C0dzxJg1RYa6mQThakfbqGPfToINqV2K/Wu2jHI=;
 b=KNrpgn1u+ALT+zs2Ce9XxRRjEtdQCDJfbODPswfDJObEOFDKFZFHkzyQGpBCJ0XMMfizjjrhQk/b57eOlwaXlhNz/9V2CMJpU3ej4XRd10KdTDKyadztNB2qQ5HruQTI9MwfXKYbv+tHG8pMB8UZjdOI0FJ48uo5+sZiy4Snn6018i8xBCnWfAUck2HjO8ktYKOKTEeLXJBZiIJemfXMhf8Tjw/0DhDFAQCm73aiB2404Aeglci434dfUUJtfRWRnKL0lx6BOBYm4F2CdMon+j1J0J4yAnTFsr5UjqvYg1noMW8yODi7Se8Afo70cp46HXJFETOhzMwGTVKYQECG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSx9C0dzxJg1RYa6mQThakfbqGPfToINqV2K/Wu2jHI=;
 b=Ad81XO41lYHOAA3shyH3YRDYhIO5BWnYueUnH042Lj0lJXR7JVYYR0Fd2Flyw/ig8KiA9jz8QwMeZTOQYuJmuSJxnYlv2JzRjXhny8J+eQ106ITg6IwjrUjevRugJMlJnKbUgOPkIy0SNR6efnAROsr6OOB9U1dhZvqv4RjhgTQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:09:28 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:09:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Date: Thu, 17 Dec 2020 17:59:30 +0800
Message-Id: <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:09:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91c9bd8b-7da1-40e3-0fe5-08d8a273d6bb
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73128493F01935BF59C7C40398C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L+UXiscYb2vdoovAiG657gK4cg7SwXvLaIXVO6djwAO9+CVCGXGGx38UIFqECiGQroyMtehKhUERHzGEVJoOx3sIuZWpukwvaIJJ1qhlM8nthxh14et99rVD31UDtT/OtDZeM5yA1KlCFjj3PCQJHV5LC3kGImLxnQznG1dUB0QRdBxpe3spxlyjLXFoI46MuEvOYxUR8ag4ZCvBQShbosy68ye0EYaXt4GS3UtifFnfrS0ccgVO1SMtpNRMyMPQr5VjUSIlWHcBkAh1MK1ZQnGSjkcSF8tck/mokC0H6kRvQa4XU8/axl1zsrZvpUAF8bsFP+fuMnXOf+hbvT9jmEsKMu9u2g+sCowP2+Mq3s1kZRXvn4Fm6ny2SpesNRVEWl/nVH8G9kbVBIsePMa1iB1aAO2qCy5Nl9dFiQArulxv7pjqwEffv8a6kkppRbCqK6aAMMqxn2iw+Zus1GD3fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(83380400001)(966005)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RdYinPKjh7ES89llBwqM9iL5abNkNyBZV3CWNgQF/UxeyujvK1fkoFddDtOa?=
 =?us-ascii?Q?OQ3V0kssv324PEMiN8vjEcrl9gRavu/Bm1pmDVozHgKnDd3d95aqVykue9ky?=
 =?us-ascii?Q?8/pFWtCzEesx2vhx0lVd/aCH9KKn+nWVjQFHTV2iDrlsrT2VbLCUMP2+wiNP?=
 =?us-ascii?Q?wgynzC4nJXamhrgiO89AVfy2pfNFd8FOXjbSW8bfOyFiv41Lb2f+5OluofpP?=
 =?us-ascii?Q?pooD0wy0SWaQMZ+18H8PIvtWybxRAJPTP2e2Dql4B00ZUpols/2P+mrXq42k?=
 =?us-ascii?Q?ttkANEldXMUTYDIrn1aj74AmolysoM9uRbhmeRxWrMRjYxGCVvU7qAaeJHtD?=
 =?us-ascii?Q?Reojn1rYmLaQibzd6PuVd6zk+8aojA6ZAZbm9uFBTFKUjO+dIbY35l8UkFh4?=
 =?us-ascii?Q?mPrIbFHPbWf+QnLo7CpYruwKbOVyNKEVaSrna9cUa2MwWb5hLs//fR9p8py0?=
 =?us-ascii?Q?BrMHXQEgRvVf4qVCickCN8SgjbvnTn6uBCyTbaQQhLsUn+Oh0tTwIfP7b6vs?=
 =?us-ascii?Q?iRK3ujCU+M5MbSj8gZIH5Vetom7icisWKvIaMvNRpZA8W9iqHkY0zQQgjKh/?=
 =?us-ascii?Q?oFeQhl/ygiuUXkrFOquBFA2GjWxHzzxszjCUOWf3sGp7Aq81h/fTrOUbHUaV?=
 =?us-ascii?Q?3wvY+WMT9E9t2NZL3K81xq34iG8BNzS96Rd1T740S3PmAmKrifiFcB9R7X/x?=
 =?us-ascii?Q?8pdd6w9FIRxdyx3xV/+vtJkzoAm2PSxwIFfyvqpxq6tVML9PeBoa54W357/i?=
 =?us-ascii?Q?UYXo+EPjNYeDsOKt7NmxTjP4W0RclPdmeAZY22HmgTMO0yzu7t5mhi/KDw3i?=
 =?us-ascii?Q?D8sSeVQvf+k+CIWgDxmRbB25SKHHdXearwkzhr92BuIDHLGMf+QTOpkdltUF?=
 =?us-ascii?Q?bTxukct1sGzNxvAgkEL4NY43jThF7nVvLX+27SaL8pURxt8LmpCn9MmcuTED?=
 =?us-ascii?Q?KeK5YE+qxPWdd1/5En+KfZrBMIegqSZccEOruQJRpxr6teUx5/lpQbsjqzAl?=
 =?us-ascii?Q?b3a3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:09:27.8548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c9bd8b-7da1-40e3-0fe5-08d8a273d6bb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Usvlaie06iGk2CUi6DtQqxFQ95uSRbyMy/E/oqGa3x5YywAAaTkVCdDfL7F89l5Ph/ef40AZHW7hBpRBVixFAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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

This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 185 +++++++++++++++++++++
 1 file changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
new file mode 100644
index 00000000..4e5ff6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp LVDS Display Bridge
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
+
+  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
+  format and can map the input to VESA or JEIDA standards.  The two channels
+  cannot be used simultaneously, that is to say, the user should pick one of
+  them to use.  Two LDB channels from two LDB instances can work together in
+  LDB split mode to support a dual link LVDS display.  The channel indexes
+  have to be different.  Channel0 outputs odd pixels and channel1 outputs
+  even pixels.
+
+  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
+  input color format.  The two channels can be used simultaneously, either
+  in dual mode or split mode.  In dual mode, the two channels output identical
+  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
+  pixels.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-ldb
+      - fsl,imx8qxp-ldb
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: pixel clock
+      - description: bypass clock
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: bypass
+
+  power-domains:
+    maxItems: 1
+
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers(CSR) module.
+
+  fsl,companion-ldb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to companion LDB which is used in LDB split mode.
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: Represents a channel of LDB.
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      reg:
+        description: The channel index.
+        enum: [ 0, 1 ]
+
+      phys:
+        description: A phandle to the phy module representing the LVDS PHY.
+        maxItems: 1
+
+      phy-names:
+        const: lvds_phy
+
+      port@0:
+        type: object
+        description: Input port of the channel.
+
+        properties:
+          reg:
+            const: 0
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        description: Output port of the channel.
+
+        properties:
+          reg:
+            const: 1
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+      - phys
+      - phy-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - fsl,syscon
+  - channel@0
+  - channel@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-ldb
+    then:
+      properties:
+        fsl,companion-ldb: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    ldb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx8qxp-ldb";
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+        clock-names = "pixel", "bypass";
+        power-domains = <&pd IMX_SC_R_LVDS_0>;
+        fsl,syscon = <&mipi_lvds_0_csr>;
+
+        channel@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                };
+            };
+        };
+
+        channel@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            phys = <&mipi_lvds_0_phy>;
+            phy-names = "lvds_phy";
+
+            port@0 {
+                reg = <0>;
+
+                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
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
