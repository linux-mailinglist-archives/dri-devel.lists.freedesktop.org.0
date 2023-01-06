Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0BA65FB05
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 06:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD010E135;
	Fri,  6 Jan 2023 05:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2080.outbound.protection.outlook.com [40.107.6.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51F510E075
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 05:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfNBAc+Pxn1EfZXfFwI4K372t6hhnIJA7RLvwXpYq7bcUO6EGpk/SF4HS+pnjlfeW+54xWI1WxeI5plnXbCWLHVsHlcgjngCgYMAgzText4QeCV1Ww5NVsjyicadODolmcrJDuR78Op7J0NTQ2Uk4GScH41CsFB92iLl3VnHdZKuvyVk3VU72cWays5QNjMtXzAUUpIL++6ExH64eHpTOkCVTLNH64WxT4zXrQWKTELR8xt9c/3zHvIJqXOiCIb9c/rIJ3TZnhmb8d6BWeUfc8MoBLn1ckWqeo2pf9HZAegzDcKqeQ5XTE03sm1c5i7GzGzsc/N+Dek7b8Aq3CaneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoKWiOMYX/CHuiw6fIdemXv+XZyLuh38Xll8KW9TuBU=;
 b=DpvBb5dWjLl5przPjsFvz8E2RHAZgZHl2jjdzknDXc5E6KwLwAElZc7Rxu88tBzZJvuyQdcDin8h1bNntD1FeOPkJPpE0RJWTsu6cTNRBQwJCGv2GLqqBcHEpHRllt+GCA+4a/a9BHtkIbCXGMyi7Q4v3pVAu64FUiLrkiFyALRR/heys8DD1i92k2EK27Q+uX07t18CyjNODkFAitGzNmYOoVSb2izNqXapu7dZj1XTK7URTm7g1ULc/HqykYhN/pCzsj4dadoufbwTRFow5H5kGjbTcLySYlP1W5ouVCoup0BaAozq9ae/DcaqN+xGCjaKQatLmCeGbf+tHS4UBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoKWiOMYX/CHuiw6fIdemXv+XZyLuh38Xll8KW9TuBU=;
 b=NZtIlzHHFFAKfPd+pCPUc7iJwilqFizEqEvYsISAbZR7YEb1cqUVHuJQwC1qj0h0Irwe8Ow8KqwigyxLkphRotRQ0I0ABx0ziKkzEQVQbG4uffGrdQPrNK9WvYY3iYeYbAsRufYfozcCwOd94yyLaTXYf753XrRDLwv4fIbt0L8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8239.eurprd04.prod.outlook.com (2603:10a6:102:1c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 05:50:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 05:50:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Date: Fri,  6 Jan 2023 13:50:51 +0800
Message-Id: <20230106055056.2883302-2-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 1748e388-e83f-4adc-81db-08daefa9ddaf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nY4A1Eoahu0CfAn3w5CclOahJelOOUC+pNh9bkqE7SnE7JsxVQFjvic3urRTfKY+HW+8oVD/y1yZN5YSugsFy8dQkX66NSoWa1LtV+kVJJJXHYP3xwDoidbDEPnaKisqsff2pByDwWO21cdil3l0EPnUVygQ0fusksOcQGQPuwX3gHrqpONQ3Ii/y7QZ7lmymOqpC5m1B92q5e1UTH+BoYgbwgo3sw8CMVOP9znnR0eas2pDW5/cDp9jZZh1LirPgIsK0gJdyctz0s5Du/AdwAvdxWr31f/49NPzDgWNr8SoVPVraJAOOSyn3a2cMJHoZNwCcuNSrxTAMTK+CK4wXzm1XZgxyGuf5JIYllrnPDmyZJZTk7Ga8pLtLtp81wEwT/7nGPMJEO2MfYNf6pAgVHqOIvrdyuHj1Hh8PE+v010sEKFgXxzvdnO9PFF/OAcY/VZhN8cSoZJpikZR94X68bmIVShwNoZF6W0Sb6QE6rTKz9Tcchy7jF00J/lAzyBkrLpGCd/sFBJyM/me7v3+pmo39JzDAIHE7Rq5r9DOvW6soCEdLbjL0sSmi37mpmWPkkc+qpVI2NZg/8he9uYg0ZLOC4bQ/l5p05dUlrgyNimdjn2QQ0E8aKopKB+JMLKqGwARQhhx2qX0SQpN5fxf/D4fE0/04aQIP1Q+NZ5cWX2QJNMhvVyMqD6mpHOH65Su1mlNY0ZAvvJSEa9zec5j60GbMknKpriymAtYDQSrQIHGS3jKq7T9lA0PYwdYFMMr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(1076003)(83380400001)(186003)(26005)(2616005)(6506007)(86362001)(36756003)(38350700002)(38100700002)(6666004)(6512007)(8676002)(4326008)(7416002)(41300700001)(2906002)(5660300002)(8936002)(30864003)(478600001)(52116002)(966005)(66476007)(6486002)(66946007)(316002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wdxQ014G5yQm5cNpDJj8p5blXygqPwP1LIKveKrZGtS8tIW3Bb0e0254pL2Q?=
 =?us-ascii?Q?wC0tXEpW48NON1byD9ZeWYyMAxZ2ysPCJKmHrQ5vusYP/cbXyG17ZZyudyAc?=
 =?us-ascii?Q?MCOQAMmIN9DkG1ecaYD27I7woLVhdeH7sTvPYmH5yXqQcH9DpMUCj94bu8ud?=
 =?us-ascii?Q?VR83J7X6H5TMDls6M55OE23hZsRP4Zsc1dFbcMFhV/KCbfPXD0mupVHJPzOq?=
 =?us-ascii?Q?hSfV8WB4SCm7R7H48qm88b5DRANhxWf9F/dNyVBASsN5eDmsOzZVZZrgtTYB?=
 =?us-ascii?Q?OwrVe+yfqnYMhm7PWDPJPr2nK4uI2dijIfPdvwVlLG3mKWPIEDP6fHiFGh8P?=
 =?us-ascii?Q?WJ/MV9O2n26N+6t8/wQmaBKQm04GGy1Vxyc4dbzLlRotOfITAZhANKX30Yud?=
 =?us-ascii?Q?q+mtPCYAtuzrN9/rY8xK0iQgDIBLDfpjiZd//Rj44kEIsLcLuiiDcU7uB1k/?=
 =?us-ascii?Q?1NXt/tbHmSuVNTkjCzq9Rr8ae5i+67riKwgTUk6IiHbBGmYqJIYhH12Vpi9c?=
 =?us-ascii?Q?Mx8M6EnnMYMR0W+peVTtDou/Fgdlnz3lKEJfyfN7AJz60XNHxPb+9vTFbHh0?=
 =?us-ascii?Q?WDW7opj/lK91aC2oGjXFGMWLqpNfzPOP+QAMaUZqVYAYU1e7ygAZX0dFRkf7?=
 =?us-ascii?Q?dFyoLNYPq6zdm4QEu2Vk5w7VUBsXmtdR8AwQr4rm6RZDdoRntWGnLr0rUt6O?=
 =?us-ascii?Q?7hcPJckGTYWUcO0xfK0MOJNmmPBciwB+U2w885huWt9kNLGDWkH1Aq0tt+Zh?=
 =?us-ascii?Q?bDYG2vbv4Xuy9gtD7lHbSSzWM7Fkixa0ZWrDr6L4QKlZZ+MWIYcoAh3odi6a?=
 =?us-ascii?Q?oiHEwh6r8JqHimW2LgsFYPFRZAnLEHetM9sv9gdqI32ZaUQPFryuNPYbT/eX?=
 =?us-ascii?Q?In2zSeMcdyAF0e1Ipk+9AVZ3fZst1UwTrNfnr5fINmhBwxslgMUVaBJKu7oM?=
 =?us-ascii?Q?+fTeM4lc3eXwm9tz0y7XmwxnIIiPt66tm9rjZnhYaSSrgwDvoVjw+IpfnepI?=
 =?us-ascii?Q?nA2ivJVpFxZ6MpqCTAdXnkz3dy+6YZk3IHPPuC9Vv9sbJd+MWKqIvp7DTgWX?=
 =?us-ascii?Q?fvhFx4sDBvKIhPd1Wjf0Vu9S04PV1IwhUoVWjDlsq+qcV8hl3pxKqfUyMYrG?=
 =?us-ascii?Q?bQMssNbTeN1bEjiCqSmTb3SNb1a/MljuLI8fm3Gt7XGRss31YWzULY08WXgS?=
 =?us-ascii?Q?RV1Un1fG1wVL0y2lFQdpWhLuVCulADltytjd495OUqXrmZUzcabjAYJ7OaiM?=
 =?us-ascii?Q?M2935KGwUdK2XtgP5FRCbV/zLv0rzb398nMUqCkY3TNGBA8u5U5WiihA0aI1?=
 =?us-ascii?Q?MZ8ZNEzVjWC5WiICQHkqpqJjhbxBBz95fMfqxe8LA432UPwy4h20fmXEVbXf?=
 =?us-ascii?Q?lfk3fc5B0ALbtYe4IAjw/yr10s2yc6/jHsBmhibCC+wW3yXio4/C6MXM8rNd?=
 =?us-ascii?Q?UG3TEuzg3P4PkjKgcQBFQCH+U2zudl0gbdk5pzCpiOzRNUag7fAyeb/2Km5r?=
 =?us-ascii?Q?ioaifwsc/TtKeGUUgUwiWSGqD2e1Us5GhSG9xkSOV3ynB4MyhGp8Z7Wzj8Ih?=
 =?us-ascii?Q?hKD8H+9rLM978ni0zdUTaJNgcn5NE8lA/5Agiqp7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1748e388-e83f-4adc-81db-08daefa9ddaf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 05:50:07.7405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hoov9eAsSbiHEL9e/HP447LRU6iqZqPCnQeNQrh9vAmCOd0jp/IlvHRUnl4kpDRM7vYMfd/rHEM3BvzMnd9MjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8239
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

