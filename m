Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C732CD100
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBF06EB6A;
	Thu,  3 Dec 2020 08:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C436EB34
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 03:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTVp3JZALj9FzjGWX3H6o9LdVee5s1jdM8N985xNa0p67ookt9yNh703bOZE2sGJmzrwsIyZjKmw6kVuLBclCnkTEfvVRsvHmq4sSjE9YnHMldL4Itlw3BhAWCUsO+jC4D67oNJLz3espQ/vN7krijMp0SYHSvUo9L/Wc8VMHAYyQMDhVl9bP7V4rC1yVuNdevKL97MmOJL8ZLjuuTRVitT6fR6jAWAm52rkYv4q0YXN8wbZhsKxoa2xGFexxyZiGTJBge/fqwi6FzPzRsT0dITU4DSUG2bl0NO+eREjWnDbtfapIsUjXPC2QvWPnp18blIvlTymr1Dvbof69S/eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbaY6Ry61vGUxGiLWTVdnOWiyxz5y+B1nYQX9QkPAKg=;
 b=D2Q8FCLWA+TY7HVeDc/9cJ6JXODjPPwxNx3NRhaVhxrGN6arv1BPBksBp4fxWFZN0lwvl50EQaTwtCxDkQHADBv6IfJ+Obt4aDET0QWpnRuEWFZ1pBqOiRk9rNbfwjx2semBEa3uId0Qhd3ZndlnQlbl1rYTW2ATQmxCsAuDYM5MWIoIcs2qRhdbvyN4DcUL0+Gss+QhploWObcN7XZ+9Ddfv/49W/X6kajU6wbZVHswK1rTv94iaoeME+eDlMb44kYtgQSiY8Ubm8F+Hem54jt91q/LuyYJMdWl3QvR3nQnp8lYAuesefRI6k8Vs0V82XwrFwgw/zghAb8NqQoGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbaY6Ry61vGUxGiLWTVdnOWiyxz5y+B1nYQX9QkPAKg=;
 b=EdFrWA2TVw2Xp9D7dXR2SqYjIt+W/eTjpvfxwKHBFYx2bUTf9LFAp5daD2GdrrRK2inwzyeN6Vn4s+pjUI3q1DNYOP/JTfEyGJfsTu4kvEi1BAzDeS5oGdVec2pmN8FrB3I9lYGLZiwY72cSzvFJ0yXhcT1cjrAI2AEusYe8NR8=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2879.eurprd04.prod.outlook.com (2603:10a6:800:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 03:14:21 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 03:14:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Thu,  3 Dec 2020 11:06:26 +0800
Message-Id: <1606964791-24927-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606964791-24927-1-git-send-email-victor.liu@nxp.com>
References: <1606964791-24927-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:14:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5093996-2237-4514-f90f-08d89739871f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2879932487652BA2DD121C6F98F20@VI1PR0402MB2879.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veH3woPMt9u88g3iYmhaHXKkGQ+k2WAVnWfgCXYUlILc/2GjSYDQ/X7nPbbLalwPs8i3zKFShkyBACZHEEtn8Oe4TfgeVUEk9/9CrmfYZRwZYs+LFNEAf8veix2nK12P80FuPd4sU8CaXenVW4SnGOXx2+j5H/B/RNHEBfjvrFS1HDsiVzgr214PJltJGf4/6rrBS0LF9jokX9Klpy5x/Q8t14oIccZyTbO7xG2Dynny3deMotzZIogNli6rwRbl8TzDHKq5J8h1TNTp+fqGIt5h+41Nbcxl6gT74K2ewf6t2NlAZTCDBVAENY41lpwRmCNh17Q5xhbUAlVUkzb5UAt/epKpIeht0ypComBM+e+jR2PwPeniLmecLNP8F6vrr3nPchEXAdoJA0NVNwFR0Fxp2Wq/LGSLTpl33hpVTTYaiveBOoRJudu+a25H8Mr9cg5GPoXoUs3tkb5OmFTKEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(8936002)(4326008)(186003)(66476007)(6666004)(66556008)(5660300002)(26005)(478600001)(7416002)(6486002)(956004)(2906002)(6512007)(316002)(2616005)(66946007)(30864003)(8676002)(69590400008)(86362001)(83380400001)(6506007)(52116002)(966005)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y3Hmc/eMLK5wq9Ys/LLR6EpFVkc7U+gq+8KDSqxqMCSZW4J03FRPbtX35L7d?=
 =?us-ascii?Q?WOWfmh2oH8OqWvuJf91iUGUSuVhlqCKIT1+hZ8jOZNUpJxWlLxJWKL3ZRiR3?=
 =?us-ascii?Q?JkRn5oUIZPXT161TRutG4tqe/Ewqj+D+x9qIMqaL1QUU/HXxCtzttRjEKLZh?=
 =?us-ascii?Q?7/dg0HRx9x7KcntXxclBjJjupG439GfBHox8vLpJ05Lrb4GOuic60Ru3/URW?=
 =?us-ascii?Q?+2SEYuQY9r/X07lk3ZDk37Yp9KFKhIdRJU4IyqzwH901lo4yiQq8TQeMajit?=
 =?us-ascii?Q?NMXr/VTr3470UiY4y4oyjr7yilovlMZricLDP2YpjpPL6hErRe489PlQVwyW?=
 =?us-ascii?Q?hemB3+D4DpYMXtNWzHi8CrBWNwYsBYBTYgulnxcTiNkcbg7sJM1y3HHpoBmt?=
 =?us-ascii?Q?G7ahrKK3/GJ6aIieDnZ1Uv+Hjo3EkXj7lSvVXyXb7OONOXtpaa6jK83SMnRg?=
 =?us-ascii?Q?g4jfhi1cckBkx9K4CZ5RljdEQEG/H8s2YHyN9BX/9QZs1p7d206vmuHR9lUe?=
 =?us-ascii?Q?VaiBhj8LaMcUri5JqbSQHEI3iTdV5UYYA8FEa6O+qsmlOB92ivXBNWCsx6bQ?=
 =?us-ascii?Q?azooaVLd3sTk4EmBTUMU+FI0gIAyMBEf8RJuOx7TMaXbNunnSH0S3XDZcmKv?=
 =?us-ascii?Q?6uLT9cZrZMTLWcqeeB7hyBgr4YDaMGbFXaid8DUAq11WrZlnKXn35GsqdQRp?=
 =?us-ascii?Q?l3c6jWpfaPpSojKMPwMMQXjqfYkG8mc/u/pylYg4WRfU08kUFwksnzbrzlO2?=
 =?us-ascii?Q?RGIUv0fg7uyuqrR7i0A30OpEMDQoYJbf7wPOb+iGPlxhut1SjnnmAaZzTUSU?=
 =?us-ascii?Q?7vwmfq6cylSDXIk42mnjrLIy1kIq6yKpiPt1lThUdjSH9oRDQXwjFzq4hq0I?=
 =?us-ascii?Q?LNkgm/EDGuXkrxhBFT+PV0u4iIFLiuSoqGR008S+RWToR9X9Ak+3eXGxdmHs?=
 =?us-ascii?Q?Z5VAvntycI+j+NZD0VReTdTa2pfNpCqwBcQkYQbUPlMeLfdVeHZkSZSufl59?=
 =?us-ascii?Q?xiJq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5093996-2237-4514-f90f-08d89739871f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:14:21.2412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhBLtycIKmk3Gsz5oHyNweakQ3x3kqctOvqH7VLQHk2DuAuJZ5dVS2MJLlbXpxyfksncJFbL6kClqqPfYWKIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2879
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
