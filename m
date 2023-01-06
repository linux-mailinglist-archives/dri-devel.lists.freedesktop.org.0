Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1165FB0A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 06:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE610E151;
	Fri,  6 Jan 2023 05:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2048.outbound.protection.outlook.com [40.107.103.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1710E151
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 05:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlHQNpPBMvpMm3IwXjxhrkPy1qZn/HeaQ4i62jqA2mh9+M3QlqlAYyp8X0rpgendgeV4Qk0sqFJ2ibkMfL5dUduQIfl5FhjfMBhJt3bybRrMLWBrsBWb56wk5EEaKE12cGkuzZfELqPzOsLO695XfeRf7eIhxSmv7PooIowoxNXabQKHCXbzCCnnkPAUIn+w01UkFESJTXS7jRlFVBzd20QlLU+x9cgfBnbfJM6e4dhzd7iyVUrmUWvT+jOV+4A9Caig9MYB+EV8l1Kq+xr9+FzrETZCCsOGlspPPKmaXJjg68tFxkgTpnKQjZDbMwmWxMQ1Mq5ttAt9okhCgFowDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD/4h/ACjz5tS1olhgsZrP5483U8BAo8iOCiptihvYg=;
 b=ZAt3w7Cx2W0D3Z0m5+EVpC6AcNukGaLi0GfBsRXA02ivwrdBuNDIsauaOMx4DHFyGcrO1Yyuki13xbVlXr2syFTp//oIiAKQqcy+byaPXzBOSAnDweNy2XRba69PkplWOPeUrGXrx6FUuW74XTqglrxseQ/oui3Vj8aUSJNydB7kvKqwKWABZIOuG1mkARVbjCbrEs4mn90QoCbJs+XqHGI3aWEf++AoMWmeYCan57YajdslbEqOJY7lZ1yk/WUXvJ6hjJTKLDB0BePFS4+yKjtTihDNMDL6LM7q4ewXlplHnuA/0KJwkuF0aG3NjymEEEmx/Hxt6hnpfx/1vSOhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD/4h/ACjz5tS1olhgsZrP5483U8BAo8iOCiptihvYg=;
 b=gXxycG0Y/PvGk7FR52ybB4pfL7uHopyxIgqOtVsvNvYPBwiaBWY6xiXsPVFkeQyXuqVh6XfeWaznlAy/ccLzdXqoHzaRtlmPlc3hwBOAcIyDw0NaQNphjvj3wKD9lpbrO1a55U+HlooJ8qPJqFVcFrH9qmNoKhgHwyBCv8/75zA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8310.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 05:50:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 05:50:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Date: Fri,  6 Jan 2023 13:50:53 +0800
Message-Id: <20230106055056.2883302-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230106055056.2883302-1-victor.liu@nxp.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a3629f-41eb-4d44-a9a4-08daefa9e4b5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/H/wvUXe5B/Cc6ecsV/zcka9v/fXoS5wC9UTh7vxINHbmvYfAagpsG+RMyPjyzKqgbUbJhY03J4H+MsCWBeGjC+0kcOiFfJ04hg7jXCWXxT9WjgIBQhLyEk8KQm2w6EWsrW47rApRMTqOxd29gzLEL26vGfuE7Tbzx+oBV+rkvd0BAtkGLAPoPfE9NICtEkasHPJ+QgiE10bf9fdTYjpQu4lmLZH+BEcodjyXZu8Pf09Ya3gPea1hstzBTi8dkVoLqSnx88f9UTfl+9hJ6fqt/8R1pFUUjHnLiJMZkonrKMx19nz3Oncrcf3MPdsR6r4ceQBxBj3OxVs/Xsb6gdNMPfv0txjRKv2XmmyaeBC7jPmBEXug39+Lb1AT1eBwKS1Qqr4viq52CfopsC3GfcJt3pjy2c9JzMK69BVUfnHSN5XHEjGrNffNTKuHRHF1VDYWQIN3BDsLfhAgzmy22W8bOGyWkCpOd4kb/IGzhRgBCYaP6X0hqKgDbKObSjIeN+LrnJrFptBP1NV482OBESJyXFMpgt09BacZ8sWvnMhBqCZOGDsMgihlfHhsVMr9nq2JxhpK4vo6rvG3an4jzusg2GpzCVZNT+KGE1fwJAvDHs2dt1byJ/qy9BWeumFbhO7AdBvxNFUlVghuH1WGuOBSfLYP+WMrm8fG6OBytIvyK0UMyd/jxVQidnmzBMCELbFwBCgjJl/MS0LRkw9f85188QxXFH6KB2czHw/ErcuQ2sOUFmHr0YyTkZlx1C45FlZBKTGKltXMM02CmDpFVaTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(83380400001)(1076003)(6512007)(26005)(6666004)(6506007)(86362001)(36756003)(186003)(38100700002)(38350700002)(2616005)(4326008)(316002)(478600001)(41300700001)(8676002)(7416002)(2906002)(5660300002)(8936002)(52116002)(6486002)(966005)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8FlR3aBEabZAK0s801H30gwHfYAQWz3VbX31s09V2ztxbCEE1es3/1ikxYt/?=
 =?us-ascii?Q?fimVAQHnvKgMX3lLCnUvEO4qp9mTK6yNfJlhnSmVHkIl2CmM3t4ciuPNRdMi?=
 =?us-ascii?Q?cFpEjz7sQCgxuFbnP5za7wZ6rnyRMd0wJZl7G3pVgiSgFVLoM9fXnbR8Qe6e?=
 =?us-ascii?Q?S5nGper0+Y+Tt0jJktvdKA2jHx4l385MMLIwskUtlWYtXhv8/3vI1OzI18ig?=
 =?us-ascii?Q?1oXJFBmI8Ol+D7NlXpKhgdXtxBBicyWB+mD+Rz7x+RYZFuwsuRzYxBwg7sqb?=
 =?us-ascii?Q?E5OKK5HabE08VjhrzZUBNdz0Vs31l+Mq6+eOZHaQcNenXx1O7UPnaPnxWWiT?=
 =?us-ascii?Q?jgu0GZKfYvHF7uxzaYVaFLoKx9/kBWcLVCvxQsFcsPupKIXWLKPfWdGLG8XP?=
 =?us-ascii?Q?KyYf4WRe2FyxtSxe4wbQJoc4F5HnZ0Y+1QR5K5Wre4TgRe71xaQpcKlX9HnL?=
 =?us-ascii?Q?el4RiMLyRX48ZeN/O8h63jKdZZUOO2j43Yzc/iPdiaD/CoQ52sYMNeorsyRu?=
 =?us-ascii?Q?uSm55XgAMC4t9iYWfxoRFk16Q61G67DJaJ+I/FQitb5kBYMsTwVPNrpzSFaK?=
 =?us-ascii?Q?4pBdNX1//jD7sm5lsLw7JWx9c+EQUhna3zJ/Fk5VQMVCw+QEcciRSz1jvaFc?=
 =?us-ascii?Q?jjG9Nlfo6wkQtoPGq0C2n+jFHu6h1OLW+U9r5e4LYcQ2OKcHLZRQixB6LNkJ?=
 =?us-ascii?Q?xGYmEkRvyzKm/HW4SaIPb8SZm+NVmHVb6NKRtGozG6TPyXJHBojMcuL9peHv?=
 =?us-ascii?Q?ONch81fmvqq806YuK+i/TbCQ2IlGJOAZySt6R2KZjmEk6khRIyX8AKcA6sTk?=
 =?us-ascii?Q?HT8h/JmxbKY9VfI6qCY+kPJ/wWlAvb9S5jUtgs1wWGKT68vUUQmhKzJoZIg2?=
 =?us-ascii?Q?PTYD4XSJTwn7hD6lSHZayS0K30MJW4RyASkozQz3PGzeltb4RkMCnv8p4a22?=
 =?us-ascii?Q?QlPNJtvQFHaelmh6Cwel47X0b40KVtVZKHqKVMQyh93eqnZtpm+LovScJ9qc?=
 =?us-ascii?Q?ubr4DjVNzsZma8GXZXYuz2HA49oOyba3LkEVVByR43sI6Skx4o4NHZ9af56n?=
 =?us-ascii?Q?5f72pX0aVG25uPww4/mn78rShRnNN0qM3qjL/ieooFrBk8PnJKN9NfArfWWp?=
 =?us-ascii?Q?Ejv1YJVAhGYtHwdiXz0F8hAAtO94GOYsO8tdV++Wr6++HvVnBeiRfiOqAMJC?=
 =?us-ascii?Q?q/qprhdQHqftBmmxqAvW9IafKYu8s7EoXC6uVw2AraINjyEnW5cXf3oq5Mkx?=
 =?us-ascii?Q?09RyvABjTWTcTQxsv90ZvydCtmrAa69/Ie+jbE4nE8ZdjQyNlm0yYigU8tOk?=
 =?us-ascii?Q?6ULtDQ2NeuUfVMvt+xbeeKJPv0e1DYvty4whvn10egFqQcCwDRu8my5z3ifN?=
 =?us-ascii?Q?IQCywTZsJ2Bibr8eMPycn5GrMUsHJsn8F0ACpzvkxa2XrBB+AKwPzY91oSdl?=
 =?us-ascii?Q?oPmIEOBsEDdeKnfK1FAs4WJpRc4J2DeyNt0U42QrO5I06RAzfdxUlwUdyzPW?=
 =?us-ascii?Q?bpz0uxch2Aiqw17cUeJnt/YV792kZughj/ov25hDwovcNOR/2VmTpAsGx2lK?=
 =?us-ascii?Q?uGTnMsQvOur/L7ULF5LhmKwjWkir4/ptOCBACU5v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a3629f-41eb-4d44-a9a4-08daefa9e4b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 05:50:19.4936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFBi1NnYonMENCkYI4BcgQJdp+FA7eg/AMkKTfigMLj5H94flRdVPF3907cpw9O/KocDylNZNnjti5ys5Y+75w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8310
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v14:
* No change.

v9->v10:
* Add Rob's R-b tag.

v8->v9:
* Reference 'interrupts-extended' schema instead of 'interrupts' to require
  an additional interrupt(r_rtram_stall) because the reference manual does
  mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.
* Drop Rob's R-b tag, as review is needed.

v4->v8:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../display/imx/fsl,imx8qxp-dprc.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 000000000000..bd94254c1288
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.37.1

