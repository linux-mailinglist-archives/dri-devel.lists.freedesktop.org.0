Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4B2D0C3B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51FE6E58A;
	Mon,  7 Dec 2020 08:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20069.outbound.protection.outlook.com [40.107.2.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127F889E8C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 03:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUMUiLzmCafmIUwLrvCcO4mxX1/heaek/R9RNPD0m2mPeQ76lpSnSHrkCWw2PIe27kkPGcA5TngktjF2kcNf3kQBWM5rm0mozv7kbMhjUrC7HFo5bnDomijn7yEIPTPVkX10+rHTHsjoQ/Me8w7uSZIFE1RvMrRw+5Ay9X71nWKfPz3fN51XlEc4q5n7RwCppzrDhuIrm/NCYG6x81Z/zTXolVmLnJLp+gxUauZU4w8U1atSj7XiaviSNYG7VTy7GFH1am4kg1Xs+v2tAgU7atxPVBw6fL2taeDmj6HfJifbBju4izAaQ/G86K+BjMaz3K457h1HvL67FFsHCKB6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY51sls/ScEFJOa08Zr9sQ0M5t6+ZQnuRU10uGfJzMw=;
 b=Z962h9N+MXyto8wxPI455ZRTfT4o4T/j1DQPnxQ+MY6iQPjRor0YySGiNZTZo72+q6e3ugHp5g2cfskUi9IKTS88tlnfLHA3ekqUImfqt0TAOVYOd0c1OuihQMqpSwTDDpWkH3fUF+iMe99QoatN10B0UT7OiOHIdTtffWxHohE2x+LIxkk4o4B6Qzuees6fEA5pcAbrVRqfLPnARIAskAkR3mGx/UGkHyur90RtCCr/HczkGY6zoCg7rgVesudGWvjWIwRsFcsCXXY8MUEf3yrpZDk68T6U8OyKVLecFwbTUaPPjl1Kxsx6wOj7A0fCPcW1TROrjdBa6tWPryy+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY51sls/ScEFJOa08Zr9sQ0M5t6+ZQnuRU10uGfJzMw=;
 b=NeGJOMriWlgDpXHqpxo3CJJrTQ1iF13+WlsTzuKcD2+OiuviMWRcEgR22C+CobBqUn5XkUv9Rbc4B5c6g6BN2wtbyMGWWKlTpIYwFYVqN1rjmmP/2KPjcLTX7zPTUAxOhPKkZQNM3MpVSUANWHCFkwNQLZAWhQXJ4brDl2zSeh8=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3424.eurprd04.prod.outlook.com (2603:10a6:803:e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 03:29:10 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.038; Mon, 7 Dec 2020
 03:29:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Mon,  7 Dec 2020 11:20:55 +0800
Message-Id: <1607311260-13983-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0085.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::11) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0085.apcprd01.prod.exchangelabs.com (2603:1096:3:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.18 via Frontend
 Transport; Mon, 7 Dec 2020 03:29:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c2207028-e343-4914-4e7e-08d89a6042cc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB342484DAF37F68ED7DA9146498CE0@VI1PR0402MB3424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AeWWG9nyq0TlyI36CcZVX8/FC2v31WnGZq3i3Kxzf4IzagulPN3iCeHo0PiQqfckb+Vx9pqcVVkQ5LcWyZ3MT8PTPEy7Zh7/rkXWOhPUYoM2iE2rjnBgTpNUYJzk7iprhu5XRWwhIr2busfGGR4hCj48o1Lg1IfH1wisPgookjLYOWFbDMMtcSJ0gNgqU5DHY9cQIOBvBOD3qc/zUWTtwdPUqWGQlCZEcJf4Y30Ez9HFCew174MrGX4mj4yLPX9jLMtGRf7tjVQqJp2HIkIfQ6jffJnq0wjIgMlbX6pmXRRn9RAUFOrDVPuMmn87a7kGgcdHojSP2BCkKuiGz4O2nalN+jmRgd30QFcfVPHSKUylfXqtsZOEoXm6HRwnCkHsTjPbKct540O0jlXbzYvL84CcEzog5yTB+uqpAjU0dh5FvFiaD7U3InqLRLoFC3vLz9FxeY+SVmy6pYXXmCEryA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(26005)(4326008)(966005)(8676002)(7416002)(5660300002)(83380400001)(316002)(6666004)(8936002)(52116002)(6506007)(30864003)(478600001)(186003)(6512007)(69590400008)(66556008)(66476007)(2906002)(36756003)(86362001)(956004)(6486002)(2616005)(16526019)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R/YmxeyzHCtmAxfUAErSO1YmxbuJebIvJRV5rK/J+uC8dYb9TLA0HimdOUYT?=
 =?us-ascii?Q?fdfWa+nz29bdW99CZtWOqVWoSdUlYCXKT7g2bSXvhmyATfS4429QkZs6v3TX?=
 =?us-ascii?Q?T4cgnKAC7NH0qDIErnmsePwmpuOT61vhXxHd5mEceHgqFlTFNvIINdTWkxq2?=
 =?us-ascii?Q?M/UtPovgtXcJA4fmWxQUMMc0/YpvfsUsF1idxf10bwWUS9hlAh3PP28AZjTU?=
 =?us-ascii?Q?KrQuKhsH8gMpeIGOqg78x8L2734td4xPHjfpbmcmpjObDVIVZntB8KQm9rmE?=
 =?us-ascii?Q?NSCXLppaZafLyJMlHRqdUnt9cPz/KMvwfeG2OYCQcNhKKriAkkTHNkyk4KDe?=
 =?us-ascii?Q?ABwtZJBcTIoLbf9xUolOXUa6AoP1+adsSJJUhqEkcgIlkVkk9UlPrmMRLSWX?=
 =?us-ascii?Q?YKRWEeFMy0UpcmptBI7ff8ofQ8UkSAuyblVK70PG++9H0EXJldtgcMhJ2Wy/?=
 =?us-ascii?Q?E6S8++oDpj5Zr+P+P84cBDT124woCkw7B0io5QG29puyI51ePSZe2Tby4sS4?=
 =?us-ascii?Q?BKTHbFx12QLSTrR0+ilzX1GP0XlwzDil+QE9oLVTwisSAu5/bf4qBn5BIvDy?=
 =?us-ascii?Q?rNbIG2LYeUGNxYRYHaPsdoKeEy6Opl/rMNt0E1qDxCmjx+xqacIlYVhLgvGq?=
 =?us-ascii?Q?HS6DHmL3V/9x9slxazUomliOZD7D3n2FhWErKfu1WS0Z3HOU3KkDqV575W9u?=
 =?us-ascii?Q?dbxBwcDsw78pGn5pMsqSFLPrnEEVgwfltwAgHwpE/nqWW0y8JCAC0OoI9rFq?=
 =?us-ascii?Q?6/KJuVz2vlAniuqBsmHkkou5CEQH25xQW/2WWzHxX8QLlwLvytuK5Qt8DZPh?=
 =?us-ascii?Q?Zdw8RY/VpZ4XsPfdEBTb7zW4ebonwG9LthRc96IDS0HTJPCv2FNYoOTOn1u4?=
 =?us-ascii?Q?zcAwzohTuwaWXqvqKKceRxBbuqr3mF4dTxZT2sEkysgcor7IAQiprIM/lmNa?=
 =?us-ascii?Q?pk/DKR1ZLUeFO/p6c9XX8Zw6LcZPe6noq7j9BLtdKq6P+n6k7DLUb+kzKB6z?=
 =?us-ascii?Q?EBhb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2207028-e343-4914-4e7e-08d89a6042cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 03:29:10.6595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUGeqUkpTC/838A8W3SrCeE8neBzoIoz/MeRC/8T9YvcnmT8j9jutvhZxpFr63JA2cCkjCvDzrTdbJMn5kcBYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3424
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

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
index 00000000..045df5a
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
+    oneOf:
+      - const: fsl,imx8qxp-dpu
+      - const: fsl,imx8qm-dpu
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
