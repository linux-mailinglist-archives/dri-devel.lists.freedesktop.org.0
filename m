Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387286037C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA33410F09E;
	Wed, 19 Oct 2022 02:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462C10F09C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNjG33bFAG8Nu4cKV8GRJd6ha9Lx/aGj8p+Di3rLfROH5+f2O75b5EE9tWRjzQ0VBPOuGlxRgWtEB6v5vqnwTV3PQZS00hMnr4aGdZWXo7eg+ps0Df6kYVftLgACRvKYSQ1AkGEB6ugcu78XDw+WHIAS+LKEm2QQTZSHRuRizyFTIP9+PDM6WvmfQ1mpjFFxnR4Xq1m0Pob8djuW5TJFuFOZvILqxTljixi6gY+uue13EHKIlqdAU3FJhe7Er5776mU6zA5gvJNsQwhLMiJVIs62gtCXXLykuWf6JM/bIJW/AqZTDK4545sME5JwqAz0BJWfpXbZc0/w71BqLA45Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viwPrmQtkAwAegRiwE0Sv3i3uyCj1d8yVQivfEW8Cr0=;
 b=aa7ARNgtI+byK1WugPOE504bKJ6s58zGye3hqpd1ZRR4xFcUQHDYB69ZKr4OABAY0IysPvk2XDesE2HOe/3+/6XcPGRCW5tg37kY3qqCNHMaiY6S6j/F0YrN/1l596QTT6NlaBRBDo4f43qKP6/wVuIFn3hJK7+FxEUnTune5G4pCDh5INCizo6sIeboH8dBkyjtTEpFJZuo0SO6QPHfnnMX+eFo3D26bzcfGKrKoaiOg0Q0w4XP7dhDMRFsv1z3ovsxi0qvJheDnARLuJSGKnbWuzWhuBBUVzsoRVePSbSFoDlzjVSpo9nxz2dPUz5H4t3Mhzh7ozYSIjL/7QMcwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viwPrmQtkAwAegRiwE0Sv3i3uyCj1d8yVQivfEW8Cr0=;
 b=VLpRrMtZrSCXPvOH8K4zzpw0xSK7K3U59rBynkJvL3wAYWt1GOfv4rmqbTyIuQco8HzyK4jC+OaCqQgf1t4BNEYK+82mJo+7Sg+aKLB7Vnx0qrh1a4/tS4p4QJofxPF7oLZL/oc/td8vgTHxt2ByGo+MwNF1m3GO22ebtx5GxSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 02:01:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:01:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Date: Wed, 19 Oct 2022 10:02:23 +0800
Message-Id: <20221019020226.2340782-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221019020226.2340782-1-victor.liu@nxp.com>
References: <20221019020226.2340782-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f0ddb7-5cb2-438b-d523-08dab175d63e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pb6vLyoXTnqVcVqA+qt6y8u+06UXBszXoB3SbV0KUh+gl65cfXzBRLDrPrPXFvqxXKxBL+cMO1Xsni1Qct3mY19gnb8HI8dwDlmloj/7UVmfmzCHsKVhUOtsgVEARsFIeQ7VegD+YhkXvlWxRWcf8IuYivGiJNVyZ9De8K3tbElzlSo3x+jwTJMDABFFsCLyWEWbvrojNMg0zKUduYMS3PTabkSpH938l/p22mlcr8ItTCVklVce0q61X0mNobWLpiIYbsW5Bvp9BYugKZThUEt+wqWDPhupFb79b+R9bHZXasCcTpDFabLnDbo9qNLN0eNaudtT2pALSEMUAA2T/zvD/SIwRXwOGi55WaSLy2ONNbT6GBxxE4cle5go8AGbPyArIPF7LGjaNsbRpePTSQ6Lu+CMUHEAiBiLWlmlNsVjt0KZE/W8O1DvzOpzU8ZGtWeKhpQjvJvxNPwO4Rtp74OEYglMJfEeMTtpxyif0p1t6WanVgY+LGfqyAArTv4p9Ka1nWkzOrq6d1lX/em6gHX+eSX0x7jVER3R/d1JUTzGl6psqWjR+KgEtsQSS/luZKoeqtE0f0w13D3WiZ00hfDCdhNGFdYVWsULWMg2r7vjSipMNakalsr8Mzd09oD+ZuEmKmKNmromlQytyU3lEUvLx9LLwsDTZawaaSF9i7IYGad4WgLeuZMkLjs1kbt6LOrsy1ZVj/jUV/Y7x2q39JWEXiY2yvLipDGuUqBoZrgTbNEOi5+w7/2HsMhtfl/o3ojIxVL46v4bRbyOAYIFRsLd+Rh6R+611R0QZ5icQWwDohlJwvdeJrRH9siitOm+Pq0f1atXG2P/WZxaBl8Agg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(316002)(83380400001)(8936002)(6512007)(5660300002)(2906002)(2616005)(1076003)(7416002)(66946007)(66556008)(66476007)(8676002)(86362001)(186003)(52116002)(26005)(41300700001)(4326008)(6666004)(36756003)(6506007)(38100700002)(38350700002)(6486002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpdqatGmOYHocZxiDYpnm1kKgUxbSIRB7OW2/Revf64l2R0BpSibM7hLc7WO?=
 =?us-ascii?Q?drr5gNZN5cVuMg5rZtjr0XkAzVts6ivAolSR7neA+0mk5pctKQKMqPVNpGgO?=
 =?us-ascii?Q?wHL0gSh9h5uTfJBvwIeZoIQuaAVxZVLLgala7XxIcPQWOW3nnV6vnilVjkj5?=
 =?us-ascii?Q?ULJbyXWOoYVMw48SkPZuse6Sb5UMawvKFpbvy2FGIq9WrN1kXWw666DGkde6?=
 =?us-ascii?Q?rp/Okc89yeBq36mZHdXAh+yYGb/rs/HBQQmUEH7xj+t61QzbfoABqzU3+TM8?=
 =?us-ascii?Q?XM5eQDrGfIFlaw3HKTx6SKNck73I+ByMPcYqj9e//Brr8Phq6KjpUBAu7+Lo?=
 =?us-ascii?Q?6maYIub643v9X7WGdglYEPafbRi9pwroSMKqGWiOW+oIOibcUysJ2JhD7Qh0?=
 =?us-ascii?Q?p4v5WV+pYwXHQlo7ltY0DY8DIyq+SJbroJlmM88/XJu0FPwHnzZ15m92rXQM?=
 =?us-ascii?Q?3EwqP7rKGtJNno4kzCSYMpcxkHefDEIv30Y/USTyjI8spFIGHyJ+wKXEpxgZ?=
 =?us-ascii?Q?AZVMycxsi0cCd10k4NS3STrp750cnU6cYNCDd7rhgysKAaccEcKI1Yr+lhiY?=
 =?us-ascii?Q?IZkmIMy6LaC1Dgji/AI9hbuVjGm0DuY9kc74GJzbixZikV0ZJYoTn/AiAV7o?=
 =?us-ascii?Q?1IKcbF5sLsDWrjyogUYAp0pqLEBRWKIVFFPOJH59BKL519UNcKEFfhxc0h+b?=
 =?us-ascii?Q?XDXUDwnUTFdp1CHlEiyoWLy98VOF4S0OCHg8D29RXpyNTVEgQEM5CxDjaNIb?=
 =?us-ascii?Q?QsBqOTzhCa+a15vgJyUXBfx4O9+yuPydjkPkJkmeaWjg1E0msca8iDRpkCkY?=
 =?us-ascii?Q?WR436WhVEWVVWP8quFMc40rG9brBA2KDytVMZRb+u43PaasNXVlcucK9NyHN?=
 =?us-ascii?Q?fd/F7zd2tlPs4AZV19fSxspz0uyWi/QxwdRCTZWeaRAW6jBhNAs/J7FkPV4l?=
 =?us-ascii?Q?BEFmSM7NmCGV/FKm+CwRZPnA3kG4ADc5YYre07AYIXTDv69MK1+Me6RaPBeZ?=
 =?us-ascii?Q?WRTSRbJwxLTGNOjQ0jbCnKFbPnNDJnaHcvIjoyoFSzlWi1nu8uo6BRHB4DKW?=
 =?us-ascii?Q?hhEAncxV7hKfykIG3rCugWi6kTzQlcAnjoIaltXxNEGRwCJz0PragQZaRR6w?=
 =?us-ascii?Q?RP6sQ0dKM5TOwVjcahpFq19kWYsirhclz+MEBdt5TvVZQZqm8rcevGpz8CiK?=
 =?us-ascii?Q?yH7v6+9QO/p9r8P3YLHa064ohVplmmwD5LFTFKKw9HxQrsKBo4a0vQEr8anD?=
 =?us-ascii?Q?K5XNnWiZXT630wA6krAPM8oT53yHgnZAyZZHgmWy+/+nFf6SizvHdUdeKt9r?=
 =?us-ascii?Q?bBhu78wh1iiHCRSs5d0PtGojKEeYR+F+EHma8lxmWheiSBnPPHz66odLegTP?=
 =?us-ascii?Q?DSHTxYtHlbhaS9vezHr1RMByr9b0xYnUx5GIYL3rDjLgkZVDguf3AVKC9A6F?=
 =?us-ascii?Q?TD2Uyoi5sOyn1MyC61FL4hAT1vuV3jw9TwMrvbBp1NoE03/+VkrevHHeTHY/?=
 =?us-ascii?Q?9qv2sZk7Sf40H1v64dwnjCyoMx52NSJ/vstxCzRajBr0Uqrs68B8+zhw7Qyx?=
 =?us-ascii?Q?Z0ccpWq0N3Bzrn5lzYdJo08wrq1D9t3AYORg7EWd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f0ddb7-5cb2-438b-d523-08dab175d63e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:01:32.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SazO97qPm+a8O0AKklYFohikCgQgZ6YDZ90cpKfhmKymzKvOR+3q+Ba/vzpeIpdgnpmiF7tnDFvxQdkXxTwEGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
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
v10->v13:
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

