Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8B2B8EC2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4986289A9A;
	Thu, 19 Nov 2020 09:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475CA89A9A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1hxVVwesh/P4Z/z9fs4rZbAMzw8vaFpMLsRenjTo01TsKeAiA/HTt9Tbf8C1x7A4vEwdzAvq/f90jK02T6rcB92cmf2btRgBVGl7mjvwzwlgvs4OhZOD9n72rjybZan5lx0g3b6yI7KjQKj/WK0Q1fBlOFK22Os6YImFaa4HBuLIfBkVBn/oRC5vctFAuFm8RzkvAaq+3+IiKYbL3nJnJ1uUTDrhGwCyK1Eo2s9/vm7T/1xepiy3qVE2Zqh5Im0INGLf5MBla3x6mk2jjH8/hrK2Fscrg742ulgL2mOHb4AYAzDyL8XNr8oOlO5PRm/lnSf5LQG/gmtCbhrbLDxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brabHevWVaoz48jOs6nMcIDYN4cunDQ9Gsctyp/tu+0=;
 b=C0jCUe6r294yXKnuI3fW75/OB+n9gibcEXYOwVkchpBDsiYUnQOUXG4DyuLu2r5U0b12ZyUhJoGpmgqF6NZfYX5yrFYpfy3UjmTWAAO8ND6cUz3J+ZJdA0XBCHE04modK+AW821vx9TnY4QlH9v+7GNvZ1YXbCiNaPd3L3STXJpPpKdDHPXj4mVwRPdtUTyHjQ14aGE5tv7I0F7G209+RhvyuwrxN2frDuJqIM2+O88uvv59xOiJMwJODbG6CBlstpXhee55nnQypZrAqsCMMH12VPI1PkhgBZ3yvVVxITiA4O+AQAKNMpoBvy3oqJkBGQSWUrBkhO4evHvxtLL28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brabHevWVaoz48jOs6nMcIDYN4cunDQ9Gsctyp/tu+0=;
 b=MBYkOBRT56KWaOzaP66qO9r0zLoNUHgC3hk949IXZsBFdAvbkl+A+0FmwnUumEPgmN6ALBCXYDf+V8FwhiZ0/8Igbw6UE3MiedakWqpDsJ8SRwPIgE06Fr+YYjaYcHh4WEC8mPcA9MCMPdmqoiXkZcUV5/c0X+qoX4iLoqcJUTM=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 09:29:29 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Thu, 19 Nov 2020 17:22:18 +0800
Message-Id: <1605777745-23625-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01e84de5-7065-445a-60ae-08d88c6d9c56
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29739A4581CE7766098A1A6B98E00@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CivH2CfSUCGg23nnNX3FyJ48sv6SLw1/9L2JQqRhgGz/g13D61PATqLgZqUDDj8E06MwCrF2ejPaEB5BMA+mom/MY7vxcizUovGuZ6JeHq0bpy6Lt+8Z7wLPUVY2l/grsMWTT0EZz9AV0G6xKUlJeI7Q1njjuPe3nVSuOaaRS54ZvJCQMJU65hWf1vQMwMGbwJUKIGVHK3vhjBqEikEVZrNXApAvOxThHloyjQ49VFTTndjVUUucgJ0Va9QiMonMU7+IW3//NepR8zC0pcA879k8wV7tAcBy/Wb1saHQ4kwAss51jJ07KiCLaAb4e4T60HQf3tQGT+vvg2/bIq97Okc2/rf53HvNx5fcl4iSY34NPCFMWcl/XZQL9qweT0Ovpt9AN2Wld8RmgU7ofP6VCoGMEjFULguihLIAlBBx25PLLY/ELC9vJy5/qK6gbWaNsGZGqka7R9mQOtjR5flImA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(6512007)(26005)(16526019)(186003)(956004)(86362001)(5660300002)(66476007)(6486002)(66556008)(52116002)(36756003)(316002)(6506007)(66946007)(8936002)(966005)(478600001)(4326008)(7416002)(6666004)(8676002)(69590400008)(2616005)(30864003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: joPnaHqyo0MfqpLaAkm7D+1MT0fQYGcMbuqWfEE8ktScw7u+zjWbHjQ9arnrAodGYYPrK08z/HX1SmxwSc1drs8Yyn39swBc9Fz/We5w1ButfD+2B6SvtloUJGnBfA/PvWmH+VvfBkD73SofUzJeU3Mu7wzOt0DSM3JxlNf6LccNjygNe+UmH/VGdL4bSI3Nf/unYaUsgjmnUbzL4D76QRbVEZhbRGDyBIOxxz3z0Lf7vtFzAkDk1o/N530+TnL6MyHbk1Ucm+GvNiiU3ELCiOXlN31Vv9V+YTzUw35yaF/t+AHFVLPoeq/IkD10CXsC07IMTx79jUIQJxivr75g0iLSVuZAgauGDoprzpAdmvPYfRqgDGjBi1xQUzWeDDE5bXS+wou8UrbYPeP3AsBHfW1QEprQohoGLdx0WQzmNBkkze/MS4ODbdSL4J2HdVMbYHJhec7Xz329jNNvgozBF7TdWq9llQQUz8tCOhGk1H08gNbPetD6Qax2T12JzOnULo/DPdEZZsyLfcwJec/sSrv9b3U9nVeKsRb7/j/gNJLIo7m5D27AHzgdKi5dUQXqZ5fzppdUlc33pIJExcBD1l+Fkg1hWEMh1JqW6sCCcopPTgw97HrqmnpXquHAdwwkrfltQkFJcVPI0bh2ggsamw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e84de5-7065-445a-60ae-08d88c6d9c56
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:27.8803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKdwi1SnXy3NcjUgOzHHIsU9cPm4zQdkYsV44HrbhOoNN1DeFGBXpEYJGyi8IIIk9k8CbmK6Vn66PstmgpibJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
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
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 358 +++++++++++++++++++++
 1 file changed, 358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
new file mode 100644
index 00000000..2c6b029
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
@@ -0,0 +1,358 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Processing Unit
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is comprised of two
+  main components that include a blit engine for 2D graphics accelerations
+  and a display controller for display output processing, as well as a command
+  sequencer.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx8qxp-dpu
+      - const: fsl,imx8qm-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+     - description: store9 shadow load interrupt       (blit engine)
+     - description: store9 frame complete interrupt    (blit engine)
+     - description: store9 sequence complete interrupt (blit engine)
+     - description: extdst0 shadow load interrupt       (display controller, content stream 0)
+     - description: extdst0 frame complete interrupt    (display controller, content stream 0)
+     - description: extdst0 sequence complete interrupt (display controller, content stream 0)
+     - description: extdst4 shadow load interrupt       (display controller, safety stream 0)
+     - description: extdst4 frame complete interrupt    (display controller, safety stream 0)
+     - description: extdst4 sequence complete interrupt (display controller, safety stream 0)
+     - description: extdst1 shadow load interrupt       (display controller, content stream 1)
+     - description: extdst1 frame complete interrupt    (display controller, content stream 1)
+     - description: extdst1 sequence complete interrupt (display controller, content stream 1)
+     - description: extdst5 shadow load interrupt       (display controller, safety stream 1)
+     - description: extdst5 frame complete interrupt    (display controller, safety stream 1)
+     - description: extdst5 sequence complete interrupt (display controller, safety stream 1)
+     - description: disengcfg0 shadow load interrupt       (display controller, display stream 0)
+     - description: disengcfg0 frame complete interrupt    (display controller, display stream 0)
+     - description: disengcfg0 sequence complete interrupt (display controller, display stream 0)
+     - description: framegen0 programmable interrupt0 (display controller, display stream 0)
+     - description: framegen0 programmable interrupt1 (display controller, display stream 0)
+     - description: framegen0 programmable interrupt2 (display controller, display stream 0)
+     - description: framegen0 programmable interrupt3 (display controller, display stream 0)
+     - description: signature0 shadow load interrupt       (display controller, display stream 0)
+     - description: signature0 measurement valid interrupt (display controller, display stream 0)
+     - description: signature0 error condition interrupt   (display controller, display stream 0)
+     - description: disengcfg1 shadow load interrupt       (display controller, display stream 1)
+     - description: disengcfg1 frame complete interrupt    (display controller, display stream 1)
+     - description: disengcfg1 sequence complete interrupt (display controller, display stream 1)
+     - description: framegen1 programmable interrupt0 (display controller, display stream 1)
+     - description: framegen1 programmable interrupt1 (display controller, display stream 1)
+     - description: framegen1 programmable interrupt2 (display controller, display stream 1)
+     - description: framegen1 programmable interrupt3 (display controller, display stream 1)
+     - description: signature1 shadow load interrupt       (display controller, display stream 1)
+     - description: signature1 measurement valid interrupt (display controller, display stream 1)
+     - description: signature1 error condition interrupt   (display controller, display stream 1)
+     - description: command sequencer error condition interrupt (command sequencer)
+     - description: common control software interrupt0 (common control)
+     - description: common control software interrupt1 (common control)
+     - description: common control software interrupt2 (common control)
+     - description: common control software interrupt3 (common control)
+     - description: framegen0 sychronization status activated interrupt   (display controller, safety stream 0)
+     - description: framegen0 sychronization status deactivated interrupt (display controller, safety stream 0)
+     - description: framegen0 sychronization status activated interrupt   (display controller, content stream 0)
+     - description: framegen0 sychronization status deactivated interrupt (display controller, content stream 0)
+     - description: framegen1 sychronization status activated interrupt   (display controller, safety stream 1)
+     - description: framegen1 sychronization status deactivated interrupt (display controller, safety stream 1)
+     - description: framegen1 sychronization status activated interrupt   (display controller, content stream 1)
+     - description: framegen1 sychronization status deactivated interrupt (display controller, content stream 1)
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+
+  clocks:
+    minItems: 6
+    maxItems: 7
+
+  clock-names:
+    minItems: 6
+    maxItems: 7
+
+  power-domains:
+    items:
+      - description: DC power-domain
+      - description: PLL0 power-domain
+      - description: PLL1 power-domain
+
+  power-domain-names:
+    items:
+      - const: dc
+      - const: pll0
+      - const: pll1
+
+  fsl,dpr-channels:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to DPR channels associated with
+      this DPU instance.
+
+  ports:
+    type: object
+    description: |
+      A node containing DPU output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: The DPU output port node from display stream0.
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
+        description: The DPU output port node from display stream1.
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
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - fsl,dpr-channels
+  - ports
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-dpu
+    then:
+      properties:
+        clocks:
+          minItems: 7
+
+        clock-names:
+          items:
+            - const: axi
+            - const: cfg
+            - const: pll0
+            - const: pll1
+            - const: bypass0
+            - const: disp0
+            - const: disp1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-dpu
+    then:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: axi
+            - const: cfg
+            - const: pll0
+            - const: pll1
+            - const: disp0
+            - const: disp1
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    dpu@56180000 {
+        compatible = "fsl,imx8qxp-dpu";
+        reg = <0x56180000 0x40000>;
+        interrupt-parent = <&dc0_irqsteer>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <0>,
+                       <1>,   <2>,   <3>,   <4>,
+                      <82>,  <83>,  <84>,  <85>,
+                     <209>, <210>, <211>, <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+        clocks = <&dc0_lpcg IMX_DC0_LPCG_DC_AXI_CLK>,
+                 <&dc0_lpcg IMX_DC0_LPCG_DC_CFG_CLK>,
+                 <&clk IMX_DC0_PLL0_CLK>,
+                 <&clk IMX_DC0_PLL1_CLK>,
+                 <&dc0_lpcg IMX_DC0_LPCG_DISP0_CLK>,
+                 <&dc0_lpcg IMX_DC0_LPCG_DISP1_CLK>;
+        clock-names = "axi", "cfg", "pll0", "pll1", "disp0", "disp1";
+        power-domains = <&pd IMX_SC_R_DC_0>,
+                        <&pd IMX_SC_R_DC_0_PLL_0>,
+                        <&pd IMX_SC_R_DC_0_PLL_1>;
+        power-domain-names = "dc", "pll0", "pll1";
+        fsl,dpr-channels = <&dc0_dpr1_channel1>,
+                           <&dc0_dpr1_channel2>,
+                           <&dc0_dpr1_channel3>,
+                           <&dc0_dpr2_channel1>,
+                           <&dc0_dpr2_channel2>,
+                           <&dc0_dpr2_channel3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_disp0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&pixel_combiner_ch0_dpu_disp0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_disp1_pixel_combiner_ch1: endpoint {
+                    remote-endpoint = <&pixel_combiner_ch1_dpu_disp1>;
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
