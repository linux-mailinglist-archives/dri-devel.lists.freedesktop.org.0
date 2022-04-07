Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0624F7B12
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546CA10E744;
	Thu,  7 Apr 2022 09:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C0410E744
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6vL+QftdEn8hFn1wgt2qS1bnQKOF3U7TrWK9uo7w9fdiBFB3reCMk5OmAc3XOYdQEzFdlq1uUBacaqpLtTXFaHAOifqyBCTl01mPODLSoU8BmAD2ZNoD4j2Yr5vLXpFHavgaojh0aN0KM1uzeswusI7JjDFCqhRuumssPLu45CCDdMsn4Kj5w6h5E5qpJVV8RwJNtRhXaVwznGKdF1+/dcJD8TPPZj0Es4SBjwplUqOQCrXGUG7Wv0/urUrzFe1VltEa+wnqcHTfp4hROJjdSiFbxMSLi/IV+AO6ef1ZJDt60Fc1QLEImNiZru/jxqcc0urvizDueOLnX/YHGxNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DTeauhnutkwFb64n2oBxKDlHl/nrAFIBhANcTqWmds=;
 b=Rrmqi5ZWAjeTEQ1/XtKCTaeDNcoau1Ui/E5dE8/zUU1zOiDSAy+c0HNwS+01XE3+Z9ESpPh7B7faVx4rTOvcLerTLNuDcPDZDgkfw6LXcC9Gmwgzawf/mxhZT9c7/2fdVOVJkXXMmL89IKhjqdM1vgVD7Yw4pSg2zpV+NlvnHgVxRBZK4ocWUFgBiFoSl//xU4lEdDiWX8UpO5/v5ZOYG+POsKPxltnYCMeormP56EAihAgV/YRJ2+1aLD9/RElNT2zNUYa376J6p+RUSikV0MXr5U79xpbaW1HvnOc99+mzzgAaaGQp46xLGkur2e/qoyVwPU2VwvIUIfsSK8Qp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DTeauhnutkwFb64n2oBxKDlHl/nrAFIBhANcTqWmds=;
 b=LqHwEszEavaRM3nVySsT2zBTFudI3IRH3wmXevTB77bb+XVfvjxQ2+SRZkkubQrg+XkdzkChzibzOOQgAYFM+pfdOfCaMjqVcl2Be2MjVCbhMmqQobGLIf1DiGrnmvtACqA1kps0D0CXwp/Sc108wzuQuAJT3DzH8bUTaJDt/AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Date: Thu,  7 Apr 2022 17:11:53 +0800
Message-Id: <20220407091156.1211923-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407091156.1211923-1-victor.liu@nxp.com>
References: <20220407091156.1211923-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47e5e19a-b5d4-46d5-d059-08da18767a79
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB9344D98F3C3CE7C60C0885B298E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgSqwfOiOZW84BWZedFUDctTAM+E5RsXPY4rT1TrfPxN1C5Ew/LxxIRMbu31XaqOeFTwaAAjWmPaHLutrpq/PUgh2qtr+4UVTXW2rB13Gw2gj/0r0JoGs8P2GRLzYKpDB889XVHckbtwaOBlvrMpiC0rmugsLwTeiWxqQVCNzLj6D/a4nENxdgfmsRkj/r6/DkNXyC/C/+zUbhFcmmIYFAmrVtOTVkyF7R5alh4MSZgAq0R4QXiHr/0KK4v6ZfO7hY1Xbe97uOLVOJQVL6jG0CM3LUyuOVbIhrHC/Mc6jrlDbhMsX8zwmXrQke5kAa8AQuDDbgXOMinRAPu1j+lg93ogUQgY2Zp7q/A0CulXx1m+pfhdWq4g+Bx998UBndE6SfFaYPWqnndfQIYEnXjUBbBr64XH3xOUoHL75d1PwcN3SNrMiizRpxWaov/jUauYTlJ5fdG+1a16l+zP6DOCy514svbV34iXbFYejZl8HNuXe4v1m2QgFVJcd5+g+nkboOdTuU++Kivb2qiZRCBt7jDlCLHvl7V0vuOP7nfdZ3i3psh2JeyGboS5fCiFKP6LYW61iB4nc0EZCkcykJ0fltXpJPr71UhPRHbnqQhXbTd6V0Q9vAspV17sQT4d3uzaWRzadGzCJoXSsxcEKELzI5py3rUpxBPZf24WutqKBfFCtHfQ2FQvAeMMaPdDmTsI1qNlRpjymWgBqkvh6B09p6P9jB7EECYx/cEw01wBwanYtgDEs6KLINlC/KOzVxAHg+ZQcfHBxamRHHwNdYT5hdXXQt4J+/Y7FLAQv8Zrl+CeMeh7x9BoepjePF2WyJuX1YBnzKu5bffEHp+uPVut9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6666004)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(966005)(6512007)(7416002)(6506007)(2616005)(83380400001)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LiZQqGKh48JkQvED39J1fjOmMckZ8wdYDoPF0EX0GMfmXlWUry2RiYsPda+J?=
 =?us-ascii?Q?COjvvc6tapa+Dh5P9VY/hvg59Wyxj5ezSfqhXBTDGCk1qzr5SWfy6vYyNYHb?=
 =?us-ascii?Q?iTBX3ZRaG/ulfdnWi7fFmanrQn4w4SaxDnueX8st1etmXTOiznUU9vRbii6h?=
 =?us-ascii?Q?Dl2k3b+nhDAS/V5PEZMZziynv6BHSjA8ku3bJVLYRmc89Nxk0XrH3y6ZLcOT?=
 =?us-ascii?Q?POFJHvOanUGVGGctY5BJ7i1ypBWbSjQdMDluwRILyKl7eUr3orF6w8lfqLyP?=
 =?us-ascii?Q?vY9/kSaV+KeDEnqRb+qcDDGsYd6wOO6MyapOwLU/0ePJ4tv2D4izGem+O+AV?=
 =?us-ascii?Q?fdRsGP1QZsNPT86gcXvflZg+iRXUAYa/xHujJxvSGuHqW9ODZMYOMBtQSEl0?=
 =?us-ascii?Q?Dc33o/AhCQ2HUt/7c9uGP/CobgE236JXXFISd9+oROL0ckt5n1XQ6mZb49lR?=
 =?us-ascii?Q?TK8UL9EdbBNleYKXlRnoCFVPBIepFzHAU8Hpdcvse6cODXMImiGKx6+eCdRT?=
 =?us-ascii?Q?iu27oe91NCquqdyyBucuqB57y15WMRFVos3z0lRFwoYYywTqEgpt71oOoOaF?=
 =?us-ascii?Q?Qf7NqnarqCSkavVYJfWJ3YFeWEapEhZMT9HFEO374ULZrWCDKr35U2E6uB6L?=
 =?us-ascii?Q?YjcKQ4DUae4A2LTluOR1IoaOuWKXCEt35u2EgGdzU6LPH8UR86ScJn0yHDGv?=
 =?us-ascii?Q?jkEgyxTj6Y9WCcjBQkXtBBo9fMZlZJOt2Chi26RD2bLOli6ZJtCYuUalxCCN?=
 =?us-ascii?Q?ukZ69Tau3QZSKGJ2LCsUod5U00xQBcD+HQP1HmJg+09kK3tr31LNLE52vPOl?=
 =?us-ascii?Q?EGm5L+zN5BW2mCMd+m9Qhkxut6jZERMoJnr3bTAOgaiIEA4jEGY5kLBStE5b?=
 =?us-ascii?Q?eK616y4rxaJ/qyL6rViSY2yvbWYYLvXMGB4KSqIFLbkh3VKky/70IU4GFb9T?=
 =?us-ascii?Q?E8+JMY//Ovmdn+8ymHzXoc04q/ydX28LWbuU5K+sWGVy3XnhYHInh1l1EwyF?=
 =?us-ascii?Q?HdhzM6Q5Q41uyR4jBiLR5JmT4i2UEsUdBz1BEdXOMnQYa/ao8PGOQBLP9Fi/?=
 =?us-ascii?Q?6Xq2aBYLNH8+P0SH2udLY7e0wWZBcCXJZOTg4t5ZqEcHJONuGfeGljF+VI3h?=
 =?us-ascii?Q?ZwN6VRArmwLpi8sC8gWyR1ItqRrN0+ease1X7fBgVRJqaR1RzL3YQMpIWn6H?=
 =?us-ascii?Q?kgUw1MnzsYjumbodcwv7g10Ailp0jdYTGy0SRD8jJhKi44NT3gabIZe4LGqp?=
 =?us-ascii?Q?W1kPkT6hGoXERrsgMLHfDttYlW7F9Psben3yh+i7Qou9rXGRejr2jcSmqnLO?=
 =?us-ascii?Q?I+syI/vQ0n0bMj+ewdD8dCYIsS5+GShOAQQ8xnsRa67oqXT39T9eI8Am7Ww2?=
 =?us-ascii?Q?+TJdLo4mlAT9lTlgNGOEraB4Z8vFsV0rzviIjbPhUJ9u+5rVng1tN134Nlgg?=
 =?us-ascii?Q?0APeIu/FpcC7+LgEnS7My4s3pCDmmUQoFvS2LVhxcMbHUuoIr062LyEgr0b0?=
 =?us-ascii?Q?36+3014F9nz38jy4PbJxL8Z4x7Ls16dVpdFmoSpJWS5TMrShtiiFAvdzuqL2?=
 =?us-ascii?Q?SbTK8eKQTBy6ivJyKk4Qldyrfomr8RVnF3TdPGDaUJj00N72GyrKoUD+3S10?=
 =?us-ascii?Q?1vULbI2ueMMBJJf3lBx6wYdNBGBrf1raPyHegtjmj/F7H/0SLEy4LKQCMFmo?=
 =?us-ascii?Q?ljyfeh0uDo+Q8ui3YeW9/zkSOSJ7nh4CPGx9BoEBCMHyYOIi1MU6ewOntGAI?=
 =?us-ascii?Q?O/wMnXxZAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5e19a-b5d4-46d5-d059-08da18767a79
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:36.8388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzbGHD2le61l3gX37p4dWeNuLFkm9ML0lepX+QYbGv2n6Ai712o/tPTaNK59n7NC4LgB8ipPevKk4i0M5kjpPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com, krzk+dt@kernel.org, guido.gunther@puri.sm,
 shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9->v10:
* Add Rob's R-b tag.

v8->v9:
* Reference 'interrupts-extended' schema instead of 'interrupts' to require
  an additional interrupt(r_rtram_stall) because the reference manual does
  mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.
* Drop Rob's R-b tag, as review is needed.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
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
2.25.1

