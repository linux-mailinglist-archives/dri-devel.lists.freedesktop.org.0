Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B62DDFD4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5689C68;
	Fri, 18 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1026E239
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfhERirTGvyb5BDWOhJEXtWIvZ7jVSn4aJNhURIkK+hiSlUJ2nWQmBJfzABXWVocuprFTlYqQXwxKoNIF+HrFYQ7cUzhEcVQEG60xcqOga6pLIOS5zTG/4qyQLFAcb3cSY91GJHtwpqaaqhe/KxOiw3ix+DsSsctJmool8Ekcfy8Ectz8QXlwwbUs3KULPWo0c4Km3cYLjl9hMga3UyROn/T2V/n7vNeuDu6QmTr06kF09IvHLSmrcYEAMuHbgaWoW7DNCy8/tP9GLJgQs0ynhynX6yfm0+4vXlu5VWoPNW5nit3nxGHlLPVZyPX3SqYaLN/Dmome0h0nb4lDDjOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwymyRMmL9OA8RhkOJUp/xKm5vnvSY0PtN9oI6cGgyw=;
 b=LFY+ODg2Q7oWPXPvT8OtnEIH5pt5V+VhpYG/WQtbz5IWpcDFsU1IqdhSB0AaWhjqV92D2PNlOXsujxpdC6Crdkpr0lTM4FZgd7cue2fQ5a5mNp7hDznvmHmb93vnDpvoUuBjdmvCHKRM1JX7WJrr4QgO99nWgjeaNNv5LtwC01wqg5T2ibgzRxZ8ajhXYW267NmeqHG9xgUds7/i2vJN3pDId2cfuhxz1Y98UWF9FHGlrk89oFzb2wnM5KF9IhM2zznyka63riDkBP8RuG/LzwF7rvqFpRv0e91dvagiDNXHYb1AQoQG8fiX8XjyMmvmFgw+LBvhfSzYXgyHS7RKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwymyRMmL9OA8RhkOJUp/xKm5vnvSY0PtN9oI6cGgyw=;
 b=UEYtKK5rQ1/N0nuS2x14H313CPMm2zsavGgDPPmMJVcjr5bhGMYX6xeuPQSr1oabepRMmFNTg49SlfdZrw7q/xEKGrv3AiVRDIdCBOOSQwirrT2iim+s4RTeFARdzxU6cWDKp+LJvHhWftXCWAxID3scgAvW5x/wniCF8r5lDeA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:44 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Thu, 17 Dec 2020 17:59:23 +0800
Message-Id: <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
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
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ac5eca7-5caf-4316-5deb-08d8a273bcf6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73128C8AB9BE9BF9EA00AF5298C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEwjRHJMRlX1wIuPF1XSFbebzSNvkE4KUnrx3HSE/O1GeoxJW6INZaPNoX3L8fys5Bh5/kyo4WKNYtEdFPCh9vY1fdu5ay0jVKqa2sEuAQXJ4Ma1u9N/D4DJonpkYlhHeE9b+P7NuAFkMT95AnljoG57DZXAippuW8FJMRk+VS3roiGD3jXopsS0CVWwPYl4D3fcAbCWoi/vpGgEBNGFGXDlagCwvy6HtiA7goH8v13SXGnYZStNBgu2iIVdaXzGlX6G5aSbc3MzJV2MV8WLZP5KRYtHKsahAPX7O108FQTiX2Tm5Sx2IP+ojmnwGE6+QFjS3JZAsHskWqDk6NHCJXGvFsOb3IilF8+xrc3EGuxHlILwszPVoZbiNmmYVEujV0mGBH187wbP/FNIWZyBOZgSaW09CtQZgHb6h2IAdEO17pRVYPUwVYExxBhifpyr4dabCzelOiJdIOpvnRl8aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(83380400001)(966005)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K3NZ1iSm2ve7wk1m3F/RaaTIvoBaf3eMvJxccvoG3vrjvnh53iILIBfLOE/M?=
 =?us-ascii?Q?2hLr9UlyBHwAT3i09FGiuaJbEW7B8tOBhr+2qRy+acnNqzn7LjScnabiMMRK?=
 =?us-ascii?Q?9KCf71NVhWG2z+XU36veoK6Ix27KWiC4NPgz8pyrq4ODYnaQpd0qSSbDtYLo?=
 =?us-ascii?Q?q7H1RTLOPgYe43Koj5tWcXMhIWCQxTJWMt3be4LGkcy8D/KAMWI2LB6LQ7lb?=
 =?us-ascii?Q?DNVxayt+x/ua+3TrEgaCY6mDGHN15nNgWCm7VzTgqlo47e8CRtNxvhqF1k7z?=
 =?us-ascii?Q?J7eoozoYWmEZhMkpWsmjP1+BE9/bXKPy8WiTp/wM2WUOyxtXE8LQxk2UkdVC?=
 =?us-ascii?Q?cUSNf18MtvW+PpKouo/6P9gQ8sZV1QTehbS0NkL4tBcCVHcYx7xpqX4rPaPC?=
 =?us-ascii?Q?XACpXcBP4JU1xs8HMxWbobX3f7W5dKR5USCqNF2NAwuq/kivR+EDSmmulGSy?=
 =?us-ascii?Q?BX0Y4eIuWjfMAripseYMACO/lSosY5det5+oBx5/IUGGSgzBUjrx7KJD49Rl?=
 =?us-ascii?Q?eptk1mzlgShdM9cvVsoj7opCFWHDnP72J6luKDhyVe0hahSjCN8YLVcaTnFA?=
 =?us-ascii?Q?zJwPiy4pFyvcKvEWLQh/m4SRyVhHFMFphLuXv94Rbii3oeooHzLFk1e2GEH1?=
 =?us-ascii?Q?CeBBopu2NqDIXyZZhJR84JJtGpLsWW5nsoLoo/PRzCo8A6u+255FLb5RaS7n?=
 =?us-ascii?Q?Xn300QiEAFWe8UcRsGmBaLq3EXDOnYBrkpP5ugPOpacUaiecVjZuktzpRy/L?=
 =?us-ascii?Q?cCiDgtSPDAdBRQLxG9wKNoLqrjBBpjwDkrrys0Ouv58nIqPk3Y3b8rJVhrOt?=
 =?us-ascii?Q?oEoB0vFa3eITNdRgcRlT78H6RwDpZQyd2H7aNUDOLnxEFONBAb6laLFESsc9?=
 =?us-ascii?Q?fGpkqg7CGU9rBk95WblN3z2oufw+0tk2eqJqLysUuLc0uK6JWsajRIbX3Zrx?=
 =?us-ascii?Q?Xf/oL02bUA1j8wr/ZHvkkMY32O+Ty43zAvCCC+PUtmj/KGc0nrrsP3nOxDWg?=
 =?us-ascii?Q?FKLQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:44.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac5eca7-5caf-4316-5deb-08d8a273bcf6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ww6D68iV4SuLqFPuKQfaGgEktyqZM1HI/+lrJ68UaT6DYEoOC34DCMi0FFlHeFfr4NyWThDI+USBGvAjswBI2Q==
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

This patch adds bindings for i.MX8qm/qxp pixel combiner.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
new file mode 100644
index 00000000..bacacd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
@@ -0,0 +1,160 @@
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
+        oneOf:
+          - const: 0
+          - const: 1
+
+      port@0:
+        type: object
+        description: Input endpoint of the display stream.
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
+        description: Output endpoint of the display stream.
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
