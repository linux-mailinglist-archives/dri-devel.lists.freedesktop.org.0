Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2576037C6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9DA10F09C;
	Wed, 19 Oct 2022 02:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D985A10F09A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag2G8OOAfO69vGDoFgm8KozQRA2Bxz+tQJ4ClR8+FaSO4g3+j3YhELK7U8WbpEUJVswwBkgJ0/9mmPogow7bsdzunaA6z6d06nl+W+rqsPxPHHlF4t/rDEEA07JI67/+Kum3PvAmD9+Afx39iAM4VHz4lTWeeZBCzigpyFCGFG5bIAuhV0wsNnLjESgrfvWRcGCwJ+o2Mb9rAPl109gdy0uJFUMX8Cip9QoWQU1xIzHwDb/qxI5QI+wVSpmYXP5N6ti6kBr7UMSgJbGugtXPRSWN4eHwsv6r+S6I0J5bcOHWlKowWhqRdQ26I2r1GZjjvHuFUDVNsPQ7cIWq3FNOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMEPfijeHwWkgrb6qOHMQ58SBptyINFH+8AnK17YTf8=;
 b=jAXGWUlTWW6oOgn4bQcsNzM3FxqGjOHuGPk7baQvCm2dRFwxE4vpiFRS35J+nwQ3d4Rhn4gEBAjqigIdQhRY6wT6kWy7/LbNqZE175d9DNSjLMMBek+kijggHYiYeVMCrNn5B6Yv5nkbkGB8aifvaH1h7WKvz4+L8QQ/92xS/vfQ/fFsiFWc9umus8OiRS2SkdIYePEhfGencgua+1v9Z9mCvs4F9uQ3D2aBMBH/FeaMPl6fes0947dTSlPV1C0Gj9SH0rl/OmFbaObAIQAlHiSCWwJjt/vxKiFQzR2cZwkKhCaYWByxsAPbxQRM08Az+hVVBMa922RuQoKM9uC4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMEPfijeHwWkgrb6qOHMQ58SBptyINFH+8AnK17YTf8=;
 b=FqRxaKu9GRtd81fjrlsMwIWcfVrh+i9uoE9Bl5nzZq306h9nXkUoDoDebZoEHS/pveEmU7yjCwcW5+vTNHBmfUsY/a6k5BMCvge93UkN2uT/aTwtvsrL7V5H58r9b7LslFpl0/Ij3DVAs3Qz3Zpg/eoV8TMjjSvVa0/AzWRVxtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 02:01:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:01:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Wed, 19 Oct 2022 10:02:21 +0800
Message-Id: <20221019020226.2340782-2-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 56386df7-72bc-469d-7dc8-08dab175cec3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TLJq7/NnvTaIcN27FroCd/BvaO6z6g43OlrE31FD7nH5wte7QfG5S4+4qrGtlwTQpfqhR+//h6IiFedxTtpYf1PaUrTNhI7ojkvmuDuVert+3ZAl540k0twfS2eyqqQNq+cl49r1hi6zJLdGnjr8J5EKpreG913/2bS2oQ+bmpJyAFGZmL/CYNwu9aeT7SYY8CoxvaB0cqsfbAssOOmIG67wJc1HVbTnH1/MDncKMfTeZuPuppFUkMssnJPFqeVzWpc1H/siyZr9BTCUjsO6qWwz8SvV1R5BZJ9bH4dNRagX7+UL0w9RkgEf4JitIZXtFz/YT2xpfSJjtcNAvLdsHf2kAU0yEOF/20VzwpXkcLdxkU2jvRVGuFrfY+8T2Xz7zX/TOycr4Yzxm7j0ZahvaXhU0qoAt0ib/9QpOeKZwRTR55kj+yAPaeqlgUnhoGfwaM2Z5fbjH1lWUELa8flL+FUDq3phN9t/xdEYJqHrsKxCXoU8Q6Comcq5GmtmbsltclZ9+8qCkprraw9z9BsHEA7LSKrW/lxd47QT3untFXV0iI1cwdMzwpf4XDMFn1bhd5AGoWQKSJCnrDtti3FCu6ie5EL40PwAtJUQ5L7ym+jVbmsT9EV/upT0+bIxNpOF4McwSKNZKYIefXfUApOguy2fumEWjNG6L4KBeB1G38gAT8V7VDMIAXpnoLk8cKKOSdx6rOxn7NIychnxtnM/7S4hZ73LNK1jZytRaHUaQTcIDHtTDzhBm2M17Ctb++Ag3gTRK3B1+UCVk4DKy+YTplWkx4ngad261sS1RLDMv7ZDx5lPx3sNrAMpJRgfHr+KcJTxJMBldeLJhnuF9EhWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(316002)(83380400001)(8936002)(6512007)(5660300002)(2906002)(2616005)(1076003)(7416002)(66946007)(30864003)(66556008)(66476007)(8676002)(86362001)(186003)(52116002)(26005)(41300700001)(4326008)(6666004)(36756003)(6506007)(38100700002)(38350700002)(6486002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tCN8fKxET3Xxf04uJ0NlxS7c6e+jmiDP3iljMiKG7miZ7y8rq5ABbz0MlnTw?=
 =?us-ascii?Q?m2aTW+OhUf8GAmdir7krVeur1HTiCzvlpaD4g+G6lpv4JJdqhixzqpTQqtQQ?=
 =?us-ascii?Q?7NOC8cl2LOxOB/35g7Rn7tpyQa3tw20t1bCVLvbbXeUTEeqiLVCuAGrhkXkL?=
 =?us-ascii?Q?OWO601hdHAgZ931TIhYO5IRGMAMFr8wAKPV0BpujTO2Oq0COpXvth5LqC8x4?=
 =?us-ascii?Q?8x5ni/ipm5PriyL9G0bw4MOhLYWCjtyvBGM4+d2XArZGVxrq3Ok5zxG5QpN6?=
 =?us-ascii?Q?HihP52UK3lJBVeKCIF6MBm7V7uib7IsQVDFW/LaEsbjUdCZnOyQkAPgNyUM/?=
 =?us-ascii?Q?A6SU6LqAOKfJvsah+Wx9dS3RPV6NsfLkseE8rclSK8a09SrZBtfX6hDfn53A?=
 =?us-ascii?Q?ZaZMN84SykQ+avq0xegUIsXKx8EGlG+HJ70F3z7adKrOutxbgcL4yQCmxEMV?=
 =?us-ascii?Q?rryIwCjy3jbgUlUozOPEztReJ1vpEPp4cHUAclN1A82qPsACwL7hLA4pRhrg?=
 =?us-ascii?Q?4gU49KqC56/OVYoJ1FMy0b4QIezWTJGARz9dJUjtVlMgca03wA/5jWKQDiZD?=
 =?us-ascii?Q?DH1AOYmXr8zVEfkB14xdcnxp1dwCgm4xVMt8tw1SRujgnhDgg1Ss65VRzJKE?=
 =?us-ascii?Q?DPOI3qwR90WoTvc2pBm4qqYDtMPvKPxMNcSmr82DcRYcRzh9mImy7O/Ti+lY?=
 =?us-ascii?Q?d9MHePtjIjFq/9uWNQ5ITo76fl/pL9qNs2sLyqlAjLYeWp88uKUREBl/r0tq?=
 =?us-ascii?Q?Lm7ZC9HBlQS0rJEn8LE8NddrUpRqo2URhXTtOYpIsauzQdeZ9BO98CIxJG+k?=
 =?us-ascii?Q?/S+/0xBfmmPLXuQZ2ZiuWDXKDdhFA1Cs/KYt4XlMytlNYPJoeRVo7iHyZ/tA?=
 =?us-ascii?Q?c2G6/s0+pPYFFyTQRu07ZvLeLhbUK1X3mVnQGjJqEUHWLUtoZbE8LFguXrZV?=
 =?us-ascii?Q?64vKAYuYA3NYnuvXgsA6grBhS0nGwl12yxqGiYM8AWz8pUx619wjNyQ7l81g?=
 =?us-ascii?Q?7cKcoHgyHJN19HU6FWVxF+AGKtrwfZYGAr8BJKjd7DEAn7IjTOOoyuVWnMrd?=
 =?us-ascii?Q?Zov9X0aZs7LJKx7C9d0x2D8bF91eeJ0IME7S7t/tKLHUo1LPOhZUDl3eVB19?=
 =?us-ascii?Q?mXFTDTCtKHBVgUzKWx/7XpgtZip27Y1gGM6oXaoH1ADbOtS4F/cRIu0WSC7y?=
 =?us-ascii?Q?blHVj8FHX8hPeScS131tQTaf1eGGdKIg7Jt2c+MaXlV7kc0OkF/f8IT3cDtd?=
 =?us-ascii?Q?R+iP7zmxinFdQWvUcCrIa5gKfvgWvE5ExFaarmhK+ZfoGBX1vp9gTK1YN0G5?=
 =?us-ascii?Q?E3roMlPkqY64TN6sO9W1tZq4aqt3tLHM34BLk2EmZyl4KyWJhQQ2MXqAm8hF?=
 =?us-ascii?Q?6uLN7hLem0U+rN0xiyA8eHx1w09YFBQH4wqeJfQ9OelJFHUSl1tEu4KYZ4A0?=
 =?us-ascii?Q?gaSfhNqm+KSpOTleN0QQkYuy3wrEqTasgdUMGMCMKXYIgz01FqgXyCnQC4q3?=
 =?us-ascii?Q?jkpFu26/7M17aZsFV9K0VIHcyDrJTzzXQZX/pjifX2+26nz42MsnltNwcf38?=
 =?us-ascii?Q?5yO5IXxwq2UPgtDP6HVbNqcf3Hw6OHRRG5SdMcH3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56386df7-72bc-469d-7dc8-08dab175cec3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:01:16.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOcGMSKcNuBNQ4bBbfqt/wlxlWA44ihdJNvo8gDHxQ9SEmefuEg3QqVIc5uVsbYbbQquX/JbY8CE+vqJ6AvuMw==
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

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v13:
* No change.

v6->v7:
* Add Rob's R-b tag back.

v5->v6:
* Use graph schema. So, drop Rob's R-b tag as review is needed.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Fix yamllint warnings.
* Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as the
  display controller subsystem spec does say that they exist.
* Use new dt binding way to add clocks in the example.
* Trivial tweaks for the example.

 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387 ++++++++++++++++++
 1 file changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
new file mode 100644
index 000000000000..6b05c586cd9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
@@ -0,0 +1,387 @@
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
+    enum:
+      - fsl,imx8qxp-dpu
+      - fsl,imx8qm-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: |
+          store9 shadow load interrupt(blit engine)
+      - description: |
+          store9 frame complete interrupt(blit engine)
+      - description: |
+          store9 sequence complete interrupt(blit engine)
+      - description: |
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description: |
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description: |
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: |
+          command sequencer error condition interrupt(command sequencer)
+      - description: |
+          common control software interrupt0(common control)
+      - description: |
+          common control software interrupt1(common control)
+      - description: |
+          common control software interrupt2(common control)
+      - description: |
+          common control software interrupt3(common control)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
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
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: axi
+      - const: cfg
+      - const: pll0
+      - const: pll1
+      - const: bypass0
+      - const: bypass1
+      - const: disp0
+      - const: disp1
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
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DPU output port node from display stream0.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The DPU output port node from display stream1.
+
+    required:
+      - port@0
+      - port@1
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
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
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
+        clocks = <&dc0_dpu_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_dpu_lpcg IMX_LPCG_CLK_4>,
+                 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+                 <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>,
+                 <&clk IMX_SC_R_DC_0_VIDEO0 IMX_SC_PM_CLK_BYPASS>,
+                 <&clk IMX_SC_R_DC_0_VIDEO1 IMX_SC_PM_CLK_BYPASS>,
+                 <&dc0_disp_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+        clock-names = "axi", "cfg",
+                      "pll0", "pll1", "bypass0", "bypass1",
+                      "disp0", "disp1";
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
+                dpu0_disp0_pixel_combiner0_ch0: endpoint {
+                    remote-endpoint = <&pixel_combiner0_ch0_dpu0_disp0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu0_disp1_pixel_combiner0_ch1: endpoint {
+                    remote-endpoint = <&pixel_combiner0_ch1_dpu0_disp1>;
+                };
+            };
+        };
+    };
-- 
2.37.1

