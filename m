Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F13070F9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A1D891CB;
	Thu, 28 Jan 2021 08:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136126E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD+U1N5h6IU/T6zMO5fb0esj97C6qi3waB17hAVjeszpP+JQId7f0UPcfRnLwlEX8h2vaec1DmQkyzIQWbqHKTgKu7bIn2ZbjW/piL2SaCZ8x0r7pmD/BcHbYdlGnIj+ncCff6Y34ecT5Ds/g+Ryc7gZ1WbjsPZ6PScTPMvSNNk+cW1LQPISROmVZZ8iAfmrRvCgS6vtoUx1HkA0mqnSLnHziqkR4F7c2vDTGMTUwtYjRwdJV7NXjoGJSe4ornslJtHfM7lSoOVEXFRvX0YYjpxODQfiESPQr7miq7Y3AR90/S7ge5v7ZKGNY8hMp9NmLY6V0HSD1AqCfxkzNWjESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rUIXxxWC7N9eeep2r0uFQLKr7Dig3+M2cWhlKx0uvw=;
 b=BayYC/aHJdRK9YvKpgBa3Jd0vsQ7AKThmfX8eFSkmNDSHD/fhHj90veyMMRStAA7sdjWPnhX40vVEmp43l7Y7oWOZJNEnHo3qWXZKXVpwReAnhkZDHHDgH5Dg4CKvNXnaTjkL6+8tkCE3q1smpB+OvMGWk5fJzCMc6buK8W6porgjp0mAU6y/jQvBXHpHaFrDr8UYYucoVnxnNllSDJw1T73hAeruwfhYUZy9g6fgKmVTjkxG9SnjWIn293BA0jXq/w79Jw6oBNvdFwMb7HYeNY2BsSvALJk0ehm/ZXD8gDRw9Tg7hCmLfBkndG0NiI45YfSs7bnLzDRr3lckYIAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rUIXxxWC7N9eeep2r0uFQLKr7Dig3+M2cWhlKx0uvw=;
 b=aRw9lxlKSbH8IoFMZB+u+VlDGkkIqlzVo/92wG5l3vXo4DvpeFL050m3dZ28nLbGdSMjE/ZbKEqA2KcFxu7h+4KnSpoFUMTz8SnEiMgHzpvs4Z0oLvFLSM/kqLvJUrbCFndJWru5jkFLHBgKyYJT2Z01BfoZ9e+XwttafnzVnBw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2975.eurprd04.prod.outlook.com (2603:10a6:802:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:42 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Wed, 27 Jan 2021 16:51:18 +0800
Message-Id: <1611737488-2791-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c384d97c-f48f-4ea3-3182-08d8c2a24dfb
X-MS-TrafficTypeDiagnostic: VI1PR04MB2975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297509DB52F2EAB959BE594E98BB0@VI1PR04MB2975.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1uj240gemcs75UqEWvEBAsTXr+Kn25M8BkMYNXB2IPFfsmAKRgC5mfrJYdF0TTWSOs+EeXe1LfgFS97ItY17LwBQ+i1cDJ2PCYFu8X//ig9sCLdn+tEau6Dx/x6A03NlE8cjm1YW6wIoTFx2qYZoW+2oQE1kmocjfOEapHuDHBZJo/o1Ycs8Ki41GTozft8lElsoU1EXRZLsAm5vdiWq4IxoVkfMUvDMDBD1K0qbgWKeHlWs2VpEKAQYISIydK18RP+AVGVpfawn9YPWjkKNF1jztwljYTqolXETwQLmK3FNpmJ+jnEgYhKxwPdOsW4JNyjCMqDdipt/Y6KaeFAdAMHsOMKTsRikaMtPZ/AJb6BbaHICxqm74nHPF2Dzpp1+jSG0P8/xa8ngFaMyXVa1pHGFbbZsY89w3nDZOmgSzQPMlt0FJQ0BeDhOeP09Vnrbke3QYfUlI8sSagWvtJokWpPgh7iuLbvgzGZsYe1AuTC5cxxpxJ2ugD27LTZ20I/khFVz5GPWBl98lWN7dO23ZiWayJ9p50qz1aMy6k7FZfTR1joV9Q0Sw3eG+NfzR1F83I9SQPzE9XQqljeZRJVHCRjV79DABH7wgi3JUmMIyf/bBZCqwOESdlZ6BXpE3Fg6uhvAKQf4SAy7CAJ8bzTU5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(2616005)(6486002)(66946007)(186003)(6666004)(956004)(7416002)(4326008)(36756003)(69590400011)(6506007)(8676002)(316002)(5660300002)(16526019)(86362001)(478600001)(6512007)(2906002)(52116002)(83380400001)(66556008)(966005)(26005)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uToAYFHB+G6CgrT/xC1rsQCPya2QLEdr1/P0qjampgP9fYEDlpRl1jVpocX5?=
 =?us-ascii?Q?Apvgj+zlvsh+bc2o9kLIdH8dTz4s8NWl0vRhfUxdNE9jFHFgOH6xLTXJk4D9?=
 =?us-ascii?Q?CniVXsvbscEW609o/XV/9k2f0KJvwK7/NlfOVLXsmIieejiqzYJbT5+5YfnM?=
 =?us-ascii?Q?d2axZq18drX+cMuP+huN+wdzh1rDvBl/ZnbyOPJT7g6mQMv3By0TgmYUhbM5?=
 =?us-ascii?Q?BO5tgpbxpuNo7fWiUtoDFIlTFPaoIBoLJBMHRBa3G+BnkaI5hwLAbgu9uCl0?=
 =?us-ascii?Q?dhblC+TQZAe4yivLVPrCbVSOFQBe1NUN1+oGKAo8b5EejVh+/8cvSb/6rKqi?=
 =?us-ascii?Q?u8KGbAizmZJNkl8+Wm5JfUad7aRaOlTCEbC783Ngcxzuz+452rff7IukeEIF?=
 =?us-ascii?Q?sihODUpiIMseZetPqaR10ZeVTc87nyQCiYGKPYz+kE13otrEjzifnSo/ZSAI?=
 =?us-ascii?Q?f3LjfaUqUG38h+Ls+rOCPq9QLqUGqrLHjW/v4NVgGkN0Un+b1gitYyAlIqqH?=
 =?us-ascii?Q?z7P946usNEYr206FWtvc0kTdz02Tjm8cTqV/PKDk0ZtTq4Yrlj8fWRq7GVHQ?=
 =?us-ascii?Q?O5V5n/t3xRtDtEdj8hIPnx14XQpR06hxSXfVxkSf4GUcTWQe3N8xBKJBN4BM?=
 =?us-ascii?Q?1q82m3arZsFuSIacVqZpFTr/KVaQG7U2sq2GY95wTsn1HXFwjrQ44UZzhOPM?=
 =?us-ascii?Q?QlbBZZoKsVv68XZAYouXWtOJKE//N/vr4T3pgY3Qp/oq+nCrkPhvPnOxt2T3?=
 =?us-ascii?Q?qgV3dm/KN785s7dm/HQIZbTV69SGhdv3S3WL/zRSOrcGI5dhnVtN9TGqTeJD?=
 =?us-ascii?Q?78rlw2XkgLIMepcAVRbRfrNFSJ4mf3zKhAcw4zgfsmFkFWobRPkf4N7tROaW?=
 =?us-ascii?Q?M5VUK6lnOVb42G6Ptu2BAsO4BKIle5IKAvtIx7slXsfUT553zr/wA1Rlf0Ap?=
 =?us-ascii?Q?ug09QNdpPBvBYtAvthKmccFeHJc+PUB6yRbzQPpVkkI2bIpEzf1UoPimZ7u8?=
 =?us-ascii?Q?tTcluQJ2KwjqiKSCw5wSfmUBmVOQTRQWe80rfJBJgCBKn1KIfPqFsiqb+RxJ?=
 =?us-ascii?Q?zKEdT3Nd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c384d97c-f48f-4ea3-3182-08d8c2a24dfb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:42.4441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5JeFUEhQALkG7V8yeYiEqt/TGoXdCxcheMh2TEZiJXkb9V0QapSclP7esNySzXNW+eVRGQLzg4ZqZ1IqxbMcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2975
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
