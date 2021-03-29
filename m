Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134834C399
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602876E252;
	Mon, 29 Mar 2021 06:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130080.outbound.protection.outlook.com [40.107.13.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073A6E252
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:12:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSOq2nBlG2tOYKfm61EU2Q1T8xfnaSSe0R4wtri5izmhsUhfLEMEeNQjZ3PxEwCVbudSE186bwqGnR+2Z1GWRHT7rDiM4G9jSEYuZleiCO5VyGEeky5b18JD2faenEzlHxr4ssxvBBMT1/uT0DDelA8tlbAK6GS/pl+NLgkQtLMKGGQ791iJEumoYhRtGoN1zehQjM9V26w7Ig8+dtX24ui8JqEkGGxLA/G/jLu1mDSZ9fW+d0Sg/tm717BUty65d+j5h3+d2tkiT1IB/Pqu2sb/gqQndyD+1EOzMjfw8EjNfW46my4Y88jUnFydqtOwxjcmNZVnwa/U2xwr9NWhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cupGbUy8bnSfmGwPvc0xmgY3KRWendusf4kk+BPRhgc=;
 b=BclZhP7WC4xabziebTiR4UwkeQFLwkr1j6Mr4+6+LxGpQLY+xVITpKdehKVfnt7P9yOa99BfJjSGLT5ZtUN3b2G5irJZ5vE6vthAuhlIlssx3edMwkb4oz3Nqi2qWN7wbGvU4q/j9HbLzOv5rgnOaF6tGlqIIj+mQkw0E0nyRA2XTNec5fYne+0wEaYQaG+xfOTvGFyxvVOQSgPcQIfZOv01RJfrO4dynrnc+6gPBzrWZUkRa7YT5+7DINF0Uo9llwl07L7S8+qxS16AUGoC/RUvmhaBQthif06nw9nenOKkXZptDPiubqnEiz7i131w/WEzgcws0PtT8UiTW/xo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cupGbUy8bnSfmGwPvc0xmgY3KRWendusf4kk+BPRhgc=;
 b=spjjOGT757AJM0fxZsCteC6vvkxBB31xW0USyIzbJ6jYLHBuPADnY5UHIfFO0253/8fMp/3pWkLpzV78L5xLoibWw7ShfDhTQzsXkoPPWniBJ9AHZ5GAMCPlaTG0dLnh9XdHDtb9FTDeMWICvIR6l2me+GnUnEJdEtGo3qixen4=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2320.eurprd04.prod.outlook.com (2603:10a6:800:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 06:12:10 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 06:12:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Mon, 29 Mar 2021 13:57:21 +0800
Message-Id: <1616997446-8783-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 06:12:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 790cdbc7-b5ed-4c91-136f-08d8f27996b2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2320:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23202E70BD12912E6BFE5009987E9@VI1PR0401MB2320.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCRlj6EMec1sb7+4/60J3ZG/DOtqmAGmMDOxPQT8rYHYu0F2Q4y3CW1U7CrcOh2q+CacoZodEZmWdT6P5IEC/akMejrqtc+n5vSuQF+53iLBftFQ9LtauwsQQRV8wUWxPWKVGAJMN+cPqt1ZoUFF0cLf9/N3i27RCGeVO1JRu28NWJ88IL4fpyL8xncgic27pzPEGECribVoKBchifdeWuR9DVa7U3cvnhhFHlcIRSm/szzBzbk+Z3iG6hNCx3b1LUxbeB//GhEcmfF9p+9XcTUOXS+rWTjt+F3etXwmN90E5ZfajNPEGb8zJyVDomk5IS5d/dU3povd9jQAnBklDPRhUSOJDUewy1hmMBMS8pCYyg20tCf04h7zEJICAHlBQ184TXnjfLLXWduGRfFDq2qVU7V2y7AzK/PnRZfPBmXmVtO/xdJuMOJ9nuIUZ4gmfoIZ2IK3zPc6IWKeybKpviHrHmHL1llD4fN4eo2krghHAifVCludcaKp0W7Yd1kjJP3wG4KPfdRGT3UBso735NuD6ONS5FPBKIpvOI7gjQBLAoFboB6rwFqxqZ9A9+ENIjScfZO2gdpxGx0/YokQhM1fNhBRoW/hKfp3tEuN8rBcfDmd4ScWNpFPGzsBUmErjDjOMuUdB9YWLmDlNsLWJi37JA8Gg38ySxkx2O4iGDKhohyQiTLPhv8V3nClttJ0VzOOmjMuXeItTNIV5cQj1d+0jKrJ2GSANwp5Lqocp7CViKqdONrvKRUKAU+1IBgWzso/IQGxY5bfr0WRDbMlfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(186003)(16526019)(6506007)(7416002)(83380400001)(36756003)(2906002)(956004)(52116002)(26005)(69590400012)(86362001)(478600001)(38100700001)(30864003)(316002)(8936002)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(6512007)(5660300002)(966005)(8676002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DoMw/PGvcCAuBAi1DZfszsZAd2BRSAsEfNZfrE547W3H48leH37oI/sSQiGU?=
 =?us-ascii?Q?DejDR6ghMrPdWy08AIWssEqSNfqzaKdXB20srxr/+JA5rz9Wr5lFCesFmAXS?=
 =?us-ascii?Q?/JkoTh0/EPLFOGYACuTGVjJtjFxjksUs72ibZ7+iNfNP8aIE7ScArndLV8e+?=
 =?us-ascii?Q?sMWrh+tGbVUfj/SimtKlkntk/bRMZGi3lgbl1uQrhyRZP3Ta5pq+cnBqGUMk?=
 =?us-ascii?Q?TATSv0FDjKFjWoPjS4MNCIPqh7lOKrmgjg8VQ7AExxQUTQYx+UeBW4TKhh6Y?=
 =?us-ascii?Q?EmG9FTSFGaSZsBkrhfGvgR3OmAkEutxO2yRpgXh4TGRjdVax07ZGY2XhMWQM?=
 =?us-ascii?Q?ajvQcikGGhjHULfOWO3esWoM+6Yeo814plkrpdP1w3+rpb/1sefQ0Kes5uZK?=
 =?us-ascii?Q?W77yYcPNgiqdVT2yb/tKvdoxepnJlcDEvZ+gKMVePuFSvs7zqG04ZN/Lde5h?=
 =?us-ascii?Q?17cWldez6wk5vAZKXnB5D7wOdR4O4s1ilc4M8XpKcUuIq317TNec9GSnmQC9?=
 =?us-ascii?Q?8h6h2vAgQSQ3ieTVbZK9SBiXpBCJS8/pYJL/G1rUmmS7gwXAn3jx+bebfuVC?=
 =?us-ascii?Q?2IejJjUNH1cblPyMEUmdfyYrQp8rqvHE+PkmAJ8hvHIEe4w2OAO0+LufaPDi?=
 =?us-ascii?Q?xrQCxEc7WDhXUa8j+tKaOdOZUMrw7cHHQivCsrgyakpK+JuI4/zXl1+TD0G8?=
 =?us-ascii?Q?n8KEHq1KbATqhfBHgQulG+fEELcbY8MJsCS+FouA6jdzBv7fsJBwuzFktii5?=
 =?us-ascii?Q?Tt6EoRVPBqRavH6Y9g6z5ZrSln+lY+A4ih/wo4mD4D4suJ1Q/yRDUSM38qqj?=
 =?us-ascii?Q?2NC1CjGqU1i8Mpp3Nvsj52mhJgMTOK6UXcKwUFSau9WXKlG3or1XMupKM3i2?=
 =?us-ascii?Q?c0BnSY0FLl4OZrfxVJP6ChVbYFPqG8LDK2NjhjFypbQ1i3bSTP6PrTgxBXdy?=
 =?us-ascii?Q?QIIiBNik9YukeKRLHJ8Ubj1APzLvbkTLVehzAeB1BuiwjIfPYKdmYYjg+YjD?=
 =?us-ascii?Q?DjdlDjXMwKeivVr9X0ph6uFlZo+JSIFGUeh7Qsze+HML9gl53aYlFiLea42T?=
 =?us-ascii?Q?9/7R7qqQSXSa7PfPxNwdPC4gmfk6i28uJ5B+BYuNEA/9SXLe6X6dQMps9DVW?=
 =?us-ascii?Q?SVDh41II6J23A8sSH7hdnVuOtXwmMip9wyXQdUpqQ0F7sZhyW5CQz8Uk6Krz?=
 =?us-ascii?Q?GZCfir06L6g5aUtjakemOumY1nH2DrJj6HV2HVbqLcRxFecIAY1KREJ4EvK/?=
 =?us-ascii?Q?ixDmp44YoKG4sW+ID2RhWOWwa2eE2DUE+bbVkszssDwmmhJoVpaG2593FACy?=
 =?us-ascii?Q?gzKdIDEuFSWAMCYhiJxOUvJe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790cdbc7-b5ed-4c91-136f-08d8f27996b2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:12:10.7931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6bW2KPJp8TVec3IgM501wyFQhXo2XJNa4aBYcjEXpW6eXK1JRxxSrXwj0vhCRh8VQbx8o6FcP8LfrN+o0qXIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2320
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
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Processing Unit.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

v7->v8:
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

 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 387 +++++++++++++++++++++
 1 file changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
new file mode 100644
index 00000000..9da9560
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
