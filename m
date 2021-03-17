Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7033E7F3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DA96E4B1;
	Wed, 17 Mar 2021 03:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72EA6E4B1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU64PC3aB0eTzHqNIoUuza6h90Fhbjm7tfzxXzsuAlHhOJHa7uB7zhmMZ6qdXoTIVZ1v8L59DLCXR5xk8v56L771NZIvEvI1JQeL5JcrL2iGywEgITDKNay15lHQpDixmKvQzDyWbbtjm/eNlATibPXRIyFZpiRw9Qoa9EfFFU2GjzsRrj3YBWJM65cdwKc6HN9Zx6JmxXRhilGoLWlKJ3uPGBHXSDipdGpaZwp4lfWEMpRAZhbDYuKPTbuzho4KJnyj82HC+B/KpPLBcnF498AAhE5b9U38zu4LtynX9vQTYntjNaSN4NzFiCgZ6uPBscMIYZHaUh2HBfyIBHWZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLLd7CsPT7wJImoalKGc4scNZMMS1M71z8zpb6QtFe4=;
 b=MRAwWN1nLaeiB+J8L5HzJzUVCJj/pswA4jo8mgXH2VKbA/B0/4ADAEPjbCe0sQ8w7OA6RlqQy9Dn8euf3tzXZnWhCpFoymx77eaQ6zetZpPqpmQUXnt+oWTgDr/Dm5O9DvAtMdMnBCYK3A1S01KgW/xNhxAvS1eAZmNpa8BWzeLMB171u/AlyaRAHeMY0n9dEbGWDTXX8U4guL5nZ1JyV1kKp3b2+YLVuI3HH76vUf/IGO24bcuSqDGysDPpDXa52cI0fZo+1GGBJBpGD7lRJ7b/7Iv/WXScU1BSmt8tIWZY/bNRirfdfyQG7w53bznyrf1jNpUrxip8p2nx5076Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLLd7CsPT7wJImoalKGc4scNZMMS1M71z8zpb6QtFe4=;
 b=pN63ou+bxLS+A0R4h+ir+afPujaEDb1ZYzn0cBT6b0eR2hoetlIlerl0sJrWiZ5fKWtATxtPjmNBaoBsxUfIXVpr00DVkufzd307evD6mzrOqJxdVYA++kNnvEo48podP2vBfZT4QHHD7L6cPw5b490GH3nzjsrxuWXs0vkDEL8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:56:48 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 05/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Date: Wed, 17 Mar 2021 11:42:40 +0800
Message-Id: <1615952569-4711-6-git-send-email-victor.liu@nxp.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a090e1ba-ea9f-490a-68f4-08d8e8f8b05d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61412511C588448BBB605E9E986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3Ka4h/gux5cPxry5l+wf4BBc0eKDRhwoTNP86KmZxbtenhiL2YCKZ5Co+9FFCzeLEg/GMbQT6/MwI5WUTo1lUKSI/SDtSh9+iyz6nXPTDEXL365DQ7Og7WT4LxA/rQiqeSTkfrYMSDgdxYwTwhuAViOMYDgl6Vajlac6TA/da4kyVSPzQOkZcvimFPOfy6FocCdp2AzNTSvgMrwrxx2Y/znowqFtLSb4WvvHbQJ2Su+mt2KHscdcN/9njTYaTSS4GoEoAQWBWOjLoJ8EToFzA0K+IsrLqU97cARdtRvkMa76E7BGxLmPBVSZ+f9ucGqWdBmsOz6E8ypnbe+RukM1YbNDuZ1sqE7oLQmHGVvgC299GoICs4Pye7CB/0B68ANxVxgyJkVMs/8INzh6aCnEj0kQYrT9oj/S3algBbajXcLETpclnVks+cDQj0TTAV5qUJvZx6G9RlObDjl97bQKWB6NHvTAM+dpdRt9u0mlE3wAOGujsjJT/GlZfnvqzc6qSBd7fh+AzILpQwi8eKFa79adpQn5g1S8a6xvq/pUv9TX0N8vZk4P5xOf2ZBmLa5ARpQJQ/lwKQ3RqBqQM4BBTplaYPwDfyzuhWP6U1OUkab/8qNeM3Qxi6ZG1tMl4Q4QSti594+Z+tNFT7UCNw11RHKdS9w97ma0fcvqvJzjEQBF0HnVC6PRj3CFWDpQN5D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(83380400001)(4326008)(956004)(2616005)(2906002)(52116002)(6486002)(6512007)(478600001)(966005)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pS59JhtePg5rZdZ+Fsb70ytgrP28ZLTyE0wpGD97Wy9n4PkrvsSQsgMsbWBZ?=
 =?us-ascii?Q?clZZBa9OMKNXGVjz51C68Z5pIt5kPZ9ra+4IkNK8TdYMxo51N2E62cLi4lKt?=
 =?us-ascii?Q?BQzebLV6OoFcnvSZNTFGLO3rZ9AeJE1Mw6rtCfQ7TpKAn4JtxYmKhJh8xmAz?=
 =?us-ascii?Q?THUfuOJRXB+7SSL5ndefeeu1arAvgLtS+HY/1FvmhDKwNprmCKmeW0GnTBTd?=
 =?us-ascii?Q?80rJuciv9Bv6mQ8UaXjN1pycYnCM6qhMXsEj9EJ5NVvCIXrBzuN/hAb8T4vt?=
 =?us-ascii?Q?55lN45UoM22Fpse9v70xrxw5Vo+7Ui3Ita08GicHHQGj2EFUDXarJ1z9OIbC?=
 =?us-ascii?Q?QkJM/P9wL8TOg8wfsFzpVNsD33ImTtp1Gxbp1O3jnYGZSdNt4JaWgG7IWJQr?=
 =?us-ascii?Q?nJce1lkJuB87y1OF92kWKqVi/VXeyGihAC9zXp9GOIQVL7icTEt5NxGCigIk?=
 =?us-ascii?Q?eB90R9dw8P9Q5+cqTaMcigA3bDf/yrzdzLycVTocxESB/lhEgUgGHuEzB3p4?=
 =?us-ascii?Q?EKum6SwByENHkpvFd7RJDQT0G6JJEp6jajt1DbLHt8s0t2+phsXgfb7O3Rd7?=
 =?us-ascii?Q?LM6O57VENoyyl3Ge9NATZa+QUdgBrBrWhfDeagy8P6yfk2pfHO9cMYjGmEzD?=
 =?us-ascii?Q?dB+M7wCYfEKXQZyEbFM1SZH7/ELyaV8zQubF1V1Hf/l3Qj/4BBohZ+b66XNK?=
 =?us-ascii?Q?5sifOYpFCERH+UDLP+z6pjuGBAuPijPlTfg8l5JPUGtzndsMHelEs5TW0qgZ?=
 =?us-ascii?Q?UgEnQcaWqlT0K/Rb5Bdkk3fVeHeILLsfTx9Q2ichYgNRpB7hulk5mzL5dqzq?=
 =?us-ascii?Q?1h9ljQXKsmwx5SlLLcRHZDXoTqFPlbjRhoLmfqOBdm54XvnP+seaKgqcGbod?=
 =?us-ascii?Q?a91XjyXS/dqbPsmsS8QDAKss0+k13JPK27zd4iulYdUxLeAt9h2ayvn3Jn3K?=
 =?us-ascii?Q?3AY0XBYedHUSYFoBzsK/QC8+T+iqPau8h4zDfTR/vCTX7+R7MQSYkHXVN75v?=
 =?us-ascii?Q?HaaTef4sF9wp+F5jHMJZNmCw5dAY/HDZznogvlQPlTqDr1jSKnAdxW6SS5/o?=
 =?us-ascii?Q?sgAfce+8GxY/s1nGAcoqYLp3vvjMkdbrCme3ldkXXEHOVUUsONXI24FSZyCD?=
 =?us-ascii?Q?f+/0ezsoI/XaPF3Hm6t6vo3L6r9mjMUNUDyQHHLSVyAaF8bsecBdFQokjB11?=
 =?us-ascii?Q?4Gsjl+KIQEOFgn6KKDhfkZ0iIePOVwi1Y5qOcsvxAa91wUxZeWY8q0pmtvSg?=
 =?us-ascii?Q?dOLKUhSMZO2zeL3meWfpnA42+OLGTWG0rTDiTSmd2PslECejmH1ccUaEgLQj?=
 =?us-ascii?Q?0ZqAJgkwktG0c/CyNz/y68zN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a090e1ba-ea9f-490a-68f4-08d8e8f8b05d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:48.3279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnhHJuw7GRyqlXSi3u9bu5Wmgkn4qNVtoewf943LV+EHXOVPRhkUuG/gQ0ictQQlEWiMSOfi8cW1qvmxegAcEA==
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

This patch adds bindings for i.MX8qm/qxp display pixel link.

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
