Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B512DDFB4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE7A89B5F;
	Fri, 18 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAA1894E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDl+l2oBXz2Udr3KOnZMeoWgRFOriOFkUYlT3IxdjYQXfPGIJQD9v9gFvYcuBNIQ123XVGBa8ip21fPYmFgPTgMa4LOPysYIIHq/pQ4Vqzsla9QPmKfiIP/Ki85APEfkqmmfOpve1WLaoCV03JJy/KdocGf1FcYy7UzM+kwNF9GfunIb//7E1q1CTx0DWe+xMZkxZT3K9HIOYjiWkvzcKt+716xLB099zh7XJrqzl4V2fuKbsN+dcPM5JTMClC6EfuI+jzvjWW596Xr2a9YXP18E2e3ywfi7L+7jojJgJs7s/2WWRuFW+ddY9LsItF8vmAYtgIi/jf1kJ8ii2/6rLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggeukaEwUKyMjgCC4U0zMNjoEWhSMnPwoALU7IDSk7w=;
 b=WwmODMusMUqkL1Hps/2mbW1Tyi7B3j4tGgORdL93GENEjyqu1HeB4Qgi3UHGjPoGXnUKLj9x0JtMz7IueeTY77Oc2TM0SZ3EgLNWEJ7E0hlZ0kAeU/IFcSNQ18x+N9t6vhWJcBEyCr+f2ungYLNz8YxxhWBWZANeW/aEfwQYCJ2ZjY9NnMkgvuZv0hoOYHzXgpy2uMlqGF/2OTLb6jZ3kxP0TmYntkFMVfxKOljBbfhmp8ZonI5LojO+pXZPQrNESqCj9PMXMVWg4Xu4y2dgKqrimhC1OsYpbqKFUW8Ch2m7U/zlDUc3RRdy8OWXeaXOeQ0bZfBbTEvrdX9WOLrZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggeukaEwUKyMjgCC4U0zMNjoEWhSMnPwoALU7IDSk7w=;
 b=JdtzhnMbkWGPHkwh3Tx1WLnpjqu292z1Cq+TuqYbeNggAgojaEOYnS7rKzz9Jp48p/M75JhQls4k5rEAUviElY5Na0gjE6SSv6cERYf/m0FYhTvfVxJk26w2YzTqoJsd9HxXjmQhmZ2BJ/Ut6xmUaNGxewNkoljfIKAjJNdOjFQ=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 03:32:48 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 03:32:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Fri, 18 Dec 2020 11:23:48 +0800
Message-Id: <1608261833-24772-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
References: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0118.apcprd02.prod.outlook.com (2603:1096:4:92::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 03:32:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3009b7cb-14b3-4ce3-41b7-08d8a30597b3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2816C339E7817768A160F63B98C30@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8QKz5aLx3PM/4xxuVwITQTT+rMCkfhniSQ5CC/PeAsw3ncEoYMrwlWvSUBtMrpyR6n3AyezM6axWKr1hb5n/PcKkktHZlnzPMrO47tVS4hGNfRHDZJWBJswbCx4F4wIdBvnYfM/RK58CQjZ8BsQlQAaCwQXlWvz+f7JWE/vgWHRKqXPEW+wE6e8G9Z2KFbMXMWPM45kD1iErXic/r+D4T3E04la7yGj70m3ZPZ0wwNGZpU7BK4UMVVElC+oiz0uVJKMUFK4XkTQ4P+jNXoTlZogb0AI71bGj2TVBl6tW2OOE63gHEjpjlZ6VfR/rkbGRHRGTXe20vO5uvggSwlihE8EuYaZ1FLSwagWRjECgiCZt/clGXDQ8ev9nuL+swEapih1xk8LbNOePGbH8lXq/xuF2fvErhZDoM4kRUhbVRhSNTZ/suvgqj5Z3ZQvZg7lp6/xitGr4D8GndKX0CuFIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(52116002)(478600001)(5660300002)(30864003)(36756003)(316002)(2906002)(6506007)(4326008)(2616005)(66556008)(6486002)(966005)(6512007)(16526019)(83380400001)(69590400008)(66946007)(7416002)(8936002)(8676002)(86362001)(26005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W3KnX11hlIZTUNJD0yvCBz8bCTYMfuV9/5MLjMgIhBJ7+vNnqexgnSRiIyTD?=
 =?us-ascii?Q?iMdSq/PLOQ+ojBYUIz5+Ad/N6uAGilrfSiA9VDyE3H1gJubTEFbRtyHt2XRk?=
 =?us-ascii?Q?bnCoapW+E9SbbCQjA9nFbWoFLDSKnZm7qkRqfsqDEcZd7gsfiS3F3yH6o/YO?=
 =?us-ascii?Q?8qqD+GyBsk0Ylz7WsDKiG+ikdDp04mg763BVK8yaxmjgMGlQQzqOehvFiofR?=
 =?us-ascii?Q?uvp2Cc1/X08t6pMjbQPcQx2moUgAx08CspoN2baRno4FRa1EcpTbsBiFYaYh?=
 =?us-ascii?Q?IaxN6m4fLzscJofNwWlBGOTZ19qdxtmLEGLnWfbmCyMy2Wjczd3XhRA1qZYG?=
 =?us-ascii?Q?12VIFUxVpJU2A7UBwMlAa2wPJiEitmNnbJZCw4QA7dpyPYs5pjYG1HgVqHcO?=
 =?us-ascii?Q?qGC3bP9yIgML3wmnYQXm3FKdYL1h62jlbxHnKiEe6UtJ9oubkZb76dI72jpi?=
 =?us-ascii?Q?VwhSYWZH9OTNp8Y29G3tDetumhJgc15FXIl0EYgKW2R5ASvPKkSzJCh3HS79?=
 =?us-ascii?Q?5dLSf06KGCerEXqNIBaIujAyjmeFG64Nc2Wt3uSWM9bZaeElwLL1Uwx8eeXE?=
 =?us-ascii?Q?0VWh+iQA+Erbv+aeMXFJeLi13HCVxdn+u6CBH6cz7XuLjWvi8QXakXFlQoPq?=
 =?us-ascii?Q?J4YNJa6KORggkNBxALCT6tLgJ4dyVY1vyykjE3+IiQfKaPyKxR+uxy5FOvXl?=
 =?us-ascii?Q?v3cpDW7y2FVsNRIm8O6uycJl7Hx/3Lq9dOA73o8TUU66oCOYv0iUioKpBqhZ?=
 =?us-ascii?Q?lpZJvUjlgz+K6XnJb1f5N1uUUYq4taCsq4N1ezWhoH7ce/oPnuOqxU/bgWsa?=
 =?us-ascii?Q?mnkF6YerXhThLev4TSm6IjEDBMQ46LArsty38e63dB1ebRs/xtxgo2NWNQWX?=
 =?us-ascii?Q?xxbbI1EC/tTYRHlQxnisEX0NuU9DKKz+4Mwno++Okg9N/8LB5mCZh95eOXRp?=
 =?us-ascii?Q?QkWXapgxaG0WtZRdpof7zvPNWRGLDICsIyK9tGH2PoHBW9jgPRuIzDGc0DWS?=
 =?us-ascii?Q?UILL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 03:32:48.6617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 3009b7cb-14b3-4ce3-41b7-08d8a30597b3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikRJdHtyy2mbk4CWGMzk0dFokVKDOOYTq7lFDiPjnX898nQqnyG1wJE5CF6DMS1dD9Gag0c8QhROSz1qkWiEEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

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

 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 416 +++++++++++++++++++++
 1 file changed, 416 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
new file mode 100644
index 00000000..817c7f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
@@ -0,0 +1,416 @@
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
+          framegen0 sychronization status activated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 sychronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 sychronization status activated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen0 sychronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen1 sychronization status activated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 sychronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 sychronization status activated interrupt
+          (display controller, content stream 1)
+      - description: |
+          framegen1 sychronization status deactivated interrupt
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
