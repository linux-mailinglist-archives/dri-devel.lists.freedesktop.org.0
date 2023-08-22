Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49751783C38
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A60A10E1BB;
	Tue, 22 Aug 2023 08:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2070.outbound.protection.outlook.com [40.107.6.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0AA10E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:55:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QD2Tw6+poKjBIV/O934F/+LUXHfMks5KnSqTAWGwIPcuZhcbmzHjmv25EPRV+Z3W5j8R1w1W552qvpVk3/OzPeEhY9kU9BOkdN8V5P9IX3je2dJZMuPS2Cb0Q0Vik9Wki5TsITHSHOJlAEruJjWYg1Mc6mCkwIhSzsC1aVF7mK282no54WzIezc6Hnj6wziJWB3t8qor1sXyoGh5FXAVBsZ8/j04sR48Sth9CkvzINhBELySxDR/4R/k1hECtDTFt3Ia0YEcR6D99UqqG5R2N6P7rf2/cwYqjhnk94mzgAdh+2eTWqQyDTsTIALdDjAhm+boU5Dde7+iyGMH8cPc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoKWiOMYX/CHuiw6fIdemXv+XZyLuh38Xll8KW9TuBU=;
 b=c2gSvb/PT1JM55dk90J7hslNocpEs9nHxfGghjkHGAHAn+DmauznyAAbJxzVA+MAhTdYmHiYLC6DQyiJMWo5X641c5WujeCJIiwLdSw3/ec1GmwYuY72SyLJG0vN8W1+4aWYVyhjVYoceAAFknAf0RS0195PaebHsabYm2Bhy0h1c7ovVF9pZpJAlelTL4jHTM1DpMYATwS6EAtmh13ZaozWNASKb0cYsfXXrRAwlCJNyivDvPhAPAPFZlqdIGZhxoxds3cbHkuEPuSP3Y0ZxdSD5mWOkoZAuwZ/zf4GQlC8/zkTzLfVmxUFKZ9/a4iFwCa9P1zS98C1X9TcCG55tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoKWiOMYX/CHuiw6fIdemXv+XZyLuh38Xll8KW9TuBU=;
 b=PBwZoZ3BtWLbQcue/oxBFMAIjsz5sUrn+iK1D24Ckj7JhwPxqV0u3QH0JAJYd3dAlKVHmYiEhYIsmrz59boDIhC5YZcvL3FmChCOXoqtjHB2h44nY0cDrgAkQNZvtPyVJn2TEZhnr0wHRtMfc02L4aEhZHfFS4jbosE3bZrYL4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:55:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:55:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU
 binding
Date: Tue, 22 Aug 2023 16:59:44 +0800
Message-Id: <20230822085949.816844-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230822085949.816844-1-victor.liu@nxp.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1fadaa-4980-403e-df36-08dba2ed9401
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5pG/ta9DEzRHhqAtgd0RlB3lAikIBhSIaOPzfmxG3fKuCRZrSbsHnA77ZAocw5+9HhMqO32VvICrGPypj7JD2fe1+jK2+stsYzaVwEt0OyjsWAdv+bXQs9LjWExo2vTTlHkU/mgCCLSonBQLr9CxBakPC5xXMLipRirabs+I+O5z8yN3Hrz8RAW8H8LAeh4y+Is40UuEyf5/UWaZBC35w9TeQIkye8eh5egKag+odpC9C+9KbdQaflnJDu0EBcmTn/dnXZvcF+FFu9DF1pgue9NXkl6VMmoIwwdGOZn6Dg32je0fQpjvhx3q1/QjwrHo38+tIpt7vXyR0qPqKoV+HmqjMdsRgQkgRDsRmtP57U3uOczPCsN7ROLr8+JeUxRSRKqFqNmSfuCVpryRvj7Woc+jqGSxQYw45ZZg4TBHLgMsdIpCO3OGAW/yIixv95GglGcudIwmdIPtehblUtMWBhLxHPwlkIcz1BKnNTNRmDRhTeexNnWTugzl+g6hjXyozjj+C9MWZJoKT343naR/Bnwuf1TxcdYyy0MxOyOr21GHHYhbTlIERjf+1o/xLMS/hmLY133hZ1Cgg9fV9ApbYzOp8FNekhoAUgGWfCsyr0PopxocQgjrH4PkB5VTm9qyle/v/I6TX6eU94g92CWhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(1076003)(966005)(478600001)(6666004)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(30864003)(2906002)(7416002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+LA4G9VuVUUQQqH8hF+/Ir621BkT1NXW5BR29/p5u14zKIrzYF/oSpbM/wy?=
 =?us-ascii?Q?WAVSoI7UhAbgxfXdsdaXwfTnq1WJvBj9njdBfLp8ykwzBDITaMc7SVo70E6x?=
 =?us-ascii?Q?ymLN3h68JqEwGpE3tDVtEjKji8rxepljtamdNWtAqiA45o43gJe+G/mphFc6?=
 =?us-ascii?Q?KVc8c5Dke3CEmGDB/g6npMGWh+jVj4xWXcKNz6XTZpImsJhSa54oF60Q6A7B?=
 =?us-ascii?Q?ENu05l+NcJVzxCqBWKqYE995zaD6EsdKGXj6lx5+r+lLPNqueDIVjP9E58eD?=
 =?us-ascii?Q?iy8Q/sqcy+znkLh9H2kXmc0lNsEQ6A/m+OOJsFBwhtSP32vwlTO9WQ4fmCgG?=
 =?us-ascii?Q?6jYXbGIXElD3wGmmmpeRSeYojQUr5qKCQJqRUSUuJBJ4m6ZRYMxVxaQJjYBw?=
 =?us-ascii?Q?f+L0uZg/tPgEFmirF07GtNNSxddrG1a6GNNcaen/NpGOJlBemFWidPPIjNVW?=
 =?us-ascii?Q?HwXkPfc8S2LwKSGrfkU1kscsLJzRXIrutzLpqMQRC/DbZ2Y7X045eadH4vCz?=
 =?us-ascii?Q?+BCW7s+xuU8dXemZajhTL6ylPct7wC2wRQGTuB/y4tw+QeKeI86b/rKyOg5T?=
 =?us-ascii?Q?xdCJYWXU4o1qE8EXf9VEd/z5PmDpdHoT+WwStSBxmnncZ0pW5sooFW86njJ6?=
 =?us-ascii?Q?PyAQSWBQnJzRy6hIUtwxXwgbIArh95jRd3XhUNUlJ1TfmePhBYE9QcKwDcKz?=
 =?us-ascii?Q?BGYhmQcxVLBOmWnHOnHoBrjCm+2PuT6rkTRoZwbEQ/zK+qUvYlOhYeMvtuFi?=
 =?us-ascii?Q?i4RdnKpbfr68rpPIeiD4KUhqU7tLbfWzimvc77owfaAV1jWetCB6cEc55F3Y?=
 =?us-ascii?Q?PjcAIS+L3jP/pCOuiyMHtbTbTO74DHumg6o5YOnQiWlsZzDFb6RqYAALvcGG?=
 =?us-ascii?Q?yIu35GVvOqXd3xCfk3QNQveP4PlYya/Cr0zuoUWCGwQ+GUR9xIF02N8sD/Nr?=
 =?us-ascii?Q?+6sFVqUwPM0ew+b+E0S1w49q+IQagP61jZ8/ekHhcKLV6a7FHWaZenyuepqP?=
 =?us-ascii?Q?MpaG8vjRxarXP7NM8gpArBZz49/Tj0+GCT3oZYtoecAVnTJ0F0DW9wFVpaTY?=
 =?us-ascii?Q?2QLsrz/n70nZFp72XjyB7RDhtBfp9M5B8PoS0Fyt5iDKJlP4VxTO7WTjXUdE?=
 =?us-ascii?Q?dKrLiyuanI4v5vB+syeU2B7MsBGoJnqL26yeZPJKywhMIuTncoH25UkBPxVs?=
 =?us-ascii?Q?g3cQ/m1TUlAgeKlk42y96a4/Ugkx099Rgxv2L4oqHgRXy2eWdhxRCGvWFvlm?=
 =?us-ascii?Q?3sHJpuyxTNCkGEKxcg1qQ+SBQTPzF/zEvfuupWl/UoxXMMMqg8sdMWcyzm0V?=
 =?us-ascii?Q?YxlOr+nUZIKF2i43FaN7afvKi1AWlBQTcsIiveOkOdfWrPQapfXTbdZniXLP?=
 =?us-ascii?Q?UIzwe7jbT0g9iOQjtv0yW1qgH74DkT8W8H/LSC8fcJ8ixv1LZbK3+50yADzQ?=
 =?us-ascii?Q?l/+U+t34Mmexw7Z62zmw9Sn8X2h6tj5OM8KbixtI9f3LCSnIWuUoBKUUCZOG?=
 =?us-ascii?Q?U1zzU8l+L4/VCqn3ojpKMrbt9ce07Lx2aH0LchVb8qcfE1QnxcEx7di54XoY?=
 =?us-ascii?Q?1GpFu/tBkyDDikcrGmS91OY4egRnpa/2S7GGWDR8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1fadaa-4980-403e-df36-08dba2ed9401
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:55:48.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rcH5q2NOGOou8O0V2jP6KeCdRm91KugdZiW3rDJAg+RVNLtKu+xbD7GU8Kh3oQ2MnZAxLi3Yeg5xhUzGY7fsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
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
Cc: conor+dt@kernel.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v14:
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

