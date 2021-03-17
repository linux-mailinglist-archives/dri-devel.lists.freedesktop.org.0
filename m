Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAB33E7EE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772E96E4AB;
	Wed, 17 Mar 2021 03:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E076E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVS5ZuPa35bwjc0fLDXGi5lwy/XYg6vbc42nWT873Hxo3kyZcN74X4uuLCCXtP9WhiuNuyvaMtJtrmgQgRgVqbncBLP+zWZzIH34O7n3fZpDcNSfDkn6Sb1PSscgB635ihoLiUtCqyZ6d8TFTQDcl6nB9kh2fkySSmt5AC/HWa9ujIKtAskOiDmSLhtEVG8emtUjbPt2J/Mpg/l8K+FwgagKOLMeB4Rq80OroeSvEYsU/atObJHx5v88T04PLgHuFZbWM8zaJ4GizBL6zHdBaTAG8ohqzc9XOT4VG9pCDngq8U7Qj4F1Gqwhl+iPg4yiqHGKdPFnrJvQvd9Uc5txUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBx4kaayAORwYWznrzUShEXUbgKzMRWelPXct7djsz0=;
 b=gzwwuOTTjKmP3BVssTytc1tUX+FPDIA5a3o74QjgBVrtsfKvDNtBJX0AeAKyDpM8VvmJYy8AX/lkXhFO8FeijtxE60pdlxZO5/gBqmbW/aMRC9ocYXt5qQSAttHQSO70tr7We04h9urVfpB7shjhBplfrrbZluuh//Lon2NvR1wdmXHoe7u9qRRGNGzhKWxk6Asn/82ObY9nzsQDq4ChDVl4POH3KrQzJsxEpe6qH8iu3lfwvXAAUZ5ySZw47lZpBCgKaVUqNOSJMuGW2p/d20gk5ucAzBF8oswK2viw8l8Z4AtPQXJEHhu0tr1xJdI/o0wjUeuQqueXSDkwSiGEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBx4kaayAORwYWznrzUShEXUbgKzMRWelPXct7djsz0=;
 b=A5i8Ll1zm7PETCQylhxjDgawaQ34QYpK3zWzs8Zt6Z/BlogYQFPq5BSKPKsR3i+1IqP1CXdXz+VySbziG52Pt2ISOezOSRCGLXw/33D5dJhCwRDHIojCzNkpn99Xrpj/Us1PAg+m7PNDzwl0i7ekfpadKUn6tBr7VaIf3cn/HoI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:56:35 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Wed, 17 Mar 2021 11:42:38 +0800
Message-Id: <1615952569-4711-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e5f5ea4-9da5-4f11-89f4-08d8e8f8a8d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6141755DE9B85F15369A3F65986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODplfC6eLickEFcFgfFH4pNG8dUfU9cerSssrNB7BACQpBAS2BMsXaFF9cTSrPMqFqZRxQiw+7PpU8X6gjtsRjI5PAg8IlybzPh6EhPTajcvnFlKQDXBxLBHrZSxlbwNFSshyYVKMF3b23SzI806xvefX1vnc8AEbxa6MpdbsaUMpmHjsRiH7Y5IwyEMrs2dCxx5PCNa7YfnHG4kwjgTlOCtScZtagYR1SgGctNmvKkAIhMwAxMi+1sdjV+2+xpYT9aZ1m7/vCzXyIukYNa3qLi/+yxKGXu0P92MLPNLmr6s8GYWeBFdNuJj2YLJpzBN5kFrTrPJjeX+CiwPqCpfifAe/l3Qew/XKiLaQ4pKmoJcyw1zcSQOhAn8OhoxVaGUcNMRe2Yc0Dt+9RVN2NrdIEaI7iJQlt7HZ/bTNQj9WqvLnBHule/lumaqr/q35f6zqJG0DIq8cH6mFvVE02ICrRMjUiMxp9M8WXvDYOC0kB4hvVGH30cbIuPKjtr3y6atNQILtt0NLb6F0hGklsm/xtSdhHZbKsdmWcNjvviuPEwGj4R+HhyK7HtxSEFgJfpeCNK3scAj3iU8TMWOgl903HiV91AMNzvuABZI248LujvqSjurqwSVExe4b8ewAc5cjQr5fQVOVCaJDxDfkyMF8wa1eYmGPlyVz+0LaVT1SjBgNHz35wkbAiFD44ACkl1p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(83380400001)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(6666004)(478600001)(966005)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dUF/DDG7jpdG3bIL+RQEkzh+6x9qAGlHUB4WBJzYBcw2LH4vcQuLo7oqCJQw?=
 =?us-ascii?Q?tlfby7AYNcaBIDkDZvQC/LUPY7q54jbNL831xVW7wuSvTIP2lennZD9l3TjY?=
 =?us-ascii?Q?vkSl46rYSZHsAiIqhOCnCEFa97G85EHcmbOO265WELM0voa67Djq0MRyC5or?=
 =?us-ascii?Q?mAyFLhZEXYWoHe99SIE5GJFPj4CYBo3rErcr1ZbrTYHoOQmjdOtDBLlr3Hun?=
 =?us-ascii?Q?Rfu5uojPq2IJHp96qKkv02ZPkCHgY4U8S0c5egzbSTErTfMxu11TUZVnoSiz?=
 =?us-ascii?Q?YQiLnBSP6U7o5a1ggLKqZHplniAP16hiDZUANjG5nIG5Db3f8keWoYnuSGY3?=
 =?us-ascii?Q?4GpIXOmi3G0FGEFTcTRXPN8uJuprDfqtu6JPhXu+wVMghv6X7wnOfZLOJ0e4?=
 =?us-ascii?Q?MGkk5U8Qdhi1gc8O0CpAgvGk/E6K7KXFklZHMNLSQL7kJdVVApxgEbFU6SfJ?=
 =?us-ascii?Q?uIfBDe4i40mgUPG+a0KflbDkEZrGmvoZ2O9gly9CTcO0T81BYeu3L0jiQlmK?=
 =?us-ascii?Q?5BuJfaO8ytl90JIAxmGax2AGcbsbZWd5PzVzi8qZYJkC6ijnN/IZpDgwUZHB?=
 =?us-ascii?Q?otA9gzTh1lGexRuu7FSUkuu/ZV9I9mgqly4T3rjOr3c2VaAqPho38SVTqWZx?=
 =?us-ascii?Q?m5O/EWRa6r37OGBP8G4urlDRAbc5bsFXcu+bTq+hhtmfAyDGtH1hlQVq9wKW?=
 =?us-ascii?Q?tYMOepbBebjU92YIuJuK9ZaI8gYl3NhNuLsSBcA01tka2VA/qynnPC9pkzeO?=
 =?us-ascii?Q?ybKBGOGpOQ4WNb8j3FTlsO1V52FTHmquVhuZPyyz4+jif2qfSf2XF5Ncvzjb?=
 =?us-ascii?Q?QgOtz8ZSWjODb8ziVhHTTr/BAsdVxfxQcc4E7Hl2ZzxXZDGWsCP7Kbaxil4g?=
 =?us-ascii?Q?4E1qQCPjgA8wLU5cgv3pnblcLXCTtSoHgUF/YhRSEISxqip/g9yr6Bek79r0?=
 =?us-ascii?Q?RKFKt+Fq3DlBo3F8vp7Fk4HwTIzE9vM52wdT7PPHTFXqdVRrgwl+6RRbDx6u?=
 =?us-ascii?Q?YjE/dMzqKzU97l6VdrZga+ZzHTsLF/bym47sEHSMTivI1nhY5O3KNAYKoyYP?=
 =?us-ascii?Q?zXS3iBxF3WPWePC7g1waM3xQPakJtkDVsDED2Fkk6AnN/YenDsAZJSyF93N0?=
 =?us-ascii?Q?6ekspbpPEMAsFSKr86pJNtD7I6r4cp5SaBoqCRqYec7mbjRgwNknfotejPnp?=
 =?us-ascii?Q?e91yVDHOvo+DXfktm89RicOaaXmTefiRdX1N9QxnVw78GpapSAVcwIUxaUor?=
 =?us-ascii?Q?bs12Km9UDB5sJaExq1QEfEYFz56CoO3NPpZnCVjh4LbtZPp2/i1rsjCO9Rw2?=
 =?us-ascii?Q?aaqow93J2qkyE+T5nZT8+9zs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5f5ea4-9da5-4f11-89f4-08d8e8f8a8d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:35.6842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lvax2u9aiR7Q2Z8X8VKb29kptot8sXkLlULdAKvt8KGQUrlVAJnBVfM2FtGAph/2O7x1rWlC3Ousv1EDZXicg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
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
