Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333699FE1C6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A202D10E2CE;
	Mon, 30 Dec 2024 02:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aBzqsq4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4B010E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOBoktmMt0nHhaijLMAx/nZdEsJvGuHNJEzJEALDFaqNBOVvumRHFVcDnRtYDC+1Lil9URJtnYdpkYM1gd0WYtQUjSGGfbYR2oBqoNyAYn7DP+gwc9QSF5MA6LKwLFHAyLUld7uFR4jIwh+ijl++JEp3o2GWlRvz6uO7GskqRFhU9bGwbjlz7URXPSfhH0fT4kJJU68RnLOnFOPtsuUrnQC3apmlxTzK6CEJs3VumRw9aLrOShLb70mtLUNfJuY9Y0FYL+cbEbe+EM9GZYn7ncOlGeskwijN21E+0HAZb9Rf3zSTElpi4d1xwRTYV6bznF1PVdeAahXFZzfB2yYupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42z924f7e5n6nO+tMnugB6shsYeGLxbxclZgxJ3yYE8=;
 b=rzTKqtOaBh23A3dahH9i9hj63z+JZGlWmt3cPqBOO2zCMdY3FglE7a4aN0pfIozf64KPyQW2D6qOfCkP/UqvBDP5RsrXR/WshsKFBF88MegzCPXC7OcTYED/Shp/EgA+lJj4LUrGgq3MIOLVJDXifCLSCdMAIjJnuJ3qozADJjH4stSZgNxnG4oXYEBkp9Dsp1oRAU80yr2UU4Zai2VQg6TBt+BOk/MiI2SyB/rm6ntaPsch92B5AvurwweWLcG+TtCesoNR7tiE+n+MMTNMmZq1meovPMhhOKN7H7yKn3y73HR4+aigyW5CGFRyJOxEHtqp4SiDZ2pZYwBhUnHKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42z924f7e5n6nO+tMnugB6shsYeGLxbxclZgxJ3yYE8=;
 b=aBzqsq4KT1HqTneXYOU7AgPC4nSjWW2LpnjYvPMWdAQC+Y+6rF3Tb9lAoIRzZFjqtyjVmh7z/n7nDgL63dwiXpMqwFytJY46Gie99LVo+OGfU/AhUCiRuDqG/Iuo9yvLvubTq21is/preBGHhdWfok8xdUVWqw5qgNtIcEovqX+HvP5AdNRwmtMmRi8SQ+0IOwyzPD3ZpSs6zU4NnYvodvSsUw7jKpZq4Flu0YmjHjWjUMgN28dahRgRlecjBQQXpk7bW/w0Ob1bDNMNEaEj5w2BtZRtLPeYgdgt/+64rPu+q7nUjdWZSp+HeZomLDz74Uayf6mxhZqnU0GQ/g7knQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v8 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Mon, 30 Dec 2024 10:11:51 +0800
Message-Id: <20241230021207.220144-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e38e888-aa12-4d40-0701-08dd28776857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i9gXXzu9/RjmS189k8uMxu6C7ArpgAbIMGHwxyOX5c2+GSpyCDSpwL96NdBX?=
 =?us-ascii?Q?g9asL9x0WstirP0nQVlOwNuWh9lZPvshqlztdwASjhvXpSpN2GnR9nagjOmF?=
 =?us-ascii?Q?0Y1BZTpvNZVL5eP+mWl4QjJmJLFAst1PZFxyg+62KSfHIDnBgTTxbY/vcVaU?=
 =?us-ascii?Q?2bbQjOMJgBkDCNp1JvjZHU6+vTbxqXezQzU+SVC0Pmd/wSPk+Kvm7U2ItuHa?=
 =?us-ascii?Q?jYCmo6zMMgb5D4CQOZeUR+ATuDabmn8ArRL30zgah18mKAEkzYwYmKA5DsPg?=
 =?us-ascii?Q?2DMghjklPDhatqMuo6dSxdLUU2MAED6X+irbcGiQU1VJApgs1rHKOpubJvx0?=
 =?us-ascii?Q?f6Pj6upFbq/5pKp3CGBs783dN6pBa8dzx0ex8eCewRgC2MSeb0D71mRVo1Td?=
 =?us-ascii?Q?CvpmS10Wa5IDyxX1B1uZfa+fcY9ivbAzObMllqa9qXQQwbms+/qBhawOlEon?=
 =?us-ascii?Q?MFWYVaiPZ7s8c4D6a/cM5IqRobkbk14bT0nJ+Xs6uBpgj2/b8gHXXpYVpNlC?=
 =?us-ascii?Q?gIG8HMAc5UvoirqNfMluYpT354o5bcxzCE8d+bwuLJly4iELqEfxOFO1QVXW?=
 =?us-ascii?Q?5s03rtPV9yMPMYJN1fPkNwFIXaD9OqvVeOA/SfMmMHaCx0/Rr1dfclMkiwO+?=
 =?us-ascii?Q?wdyqcG2uBdsoEfDEIyowN6eblktG7k7vAT5d6W8poJywHGAKy7rH8DrT5MOX?=
 =?us-ascii?Q?fVy/Mb9PGuKBU0W8R3y2IVyy7puDjDodrIC7EUcfgguw9GgaujWagSxzCcjj?=
 =?us-ascii?Q?bLWoJ5DbIvoO6JJYYOaStT2NP6wK9XqXP1PP+fD6cK2s1P5/0/ncvtxTHfDr?=
 =?us-ascii?Q?CI5G6KSeQfryVVzqXcycZ3hSj2WHK8ENdi0WzUnTLkPiPOGF/oy2Pxjwdio7?=
 =?us-ascii?Q?WGPvimB3Ts2ZHOnJr0Cr3EYJ2+EbkunK1iQ9xN2NcPQdfJMeolKyj6LfncTp?=
 =?us-ascii?Q?BvgSqmO8ZGdyCpmGsLksCRdYL3txguRJFY0aDP1KFjaJuhkasYR93906RDfv?=
 =?us-ascii?Q?NBSpOZPFE3AhSJ/N7bBYGFnp16ZCWCe+HazwvDSNyBDuUaWdtE3djWnG5pxl?=
 =?us-ascii?Q?h8wLl1Cl+btArwZh/PxNFyi4e95nkfNOYwy8Khm07RUv4u7OHZt8IyceOIne?=
 =?us-ascii?Q?KBKg4lBMvI1PKSbm6r+Y0kvfJ+Jjnl9WmNrvdx9x/2f7pBrRwqvKGsYsWoEJ?=
 =?us-ascii?Q?Eiuj2o2Wwtpmk4Gv74hKJtt1e9huaqUaMsvUvE2AW0ZA4d82m99Os8/9pNDU?=
 =?us-ascii?Q?tnOsVuPufE2w8rM3kQPn3SLyOMyi/qxURVDEHUBfVc5Qp8YesX7p+iYs4WZ+?=
 =?us-ascii?Q?NQjF8ljCFQcyYu6JnWcJQPmK3HRN2REyPrDN/rEZ4xMTAiW92QyttdofHhqh?=
 =?us-ascii?Q?QqwEWjRYpwZul2QHrHb9AiD5ctmX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SG+c8j5Pk5+60sDHOubXLSV1E+rkCYnKUgDneupMwtlYWNNwd1NW7l+UmN5U?=
 =?us-ascii?Q?Zx5Rpdcu7OgYbHcIbkg87g4sdJjJwuI8aOXlbsq0/XvHFaMlqhgOyUl5+jdC?=
 =?us-ascii?Q?Ht8mEzDxCxIsInKIO5MGwyip5SwHQew1+M6ZS/6Jfi2T5fw+a1EzJnBZvyQp?=
 =?us-ascii?Q?GyChyesaA5A6NY2YwxaNkcXXkn4jrL+trmmrTdhGBGihGGBiKlAVs/pFvprw?=
 =?us-ascii?Q?7qejOFWObR0bf44D5AETvq/kAEFxcOzn77JZxB61Yg3Q0Voz/XwDhzkP8ict?=
 =?us-ascii?Q?IOfcpWpf/O/3qnXd1FfX2lJZ9k3wdyIGe19SEpfqlkexdJEHm7f/mG+dqvzD?=
 =?us-ascii?Q?zRF9YnKJPie/RsfloMXCuzqgXby59Hsl7CTvEvk0mbHfqVNGmfkXbzdWSv2W?=
 =?us-ascii?Q?+yyTmOxW1nVe83rYpiQYlGRn7pfGxJte86VoSY0sGvWGes8C9pH+8VTMSqFH?=
 =?us-ascii?Q?B7om8x2u5R7I7YSnr1zV3sh2R4z0rk6BdQ+9uX/vDplNTUSvp3WiuHByEEKz?=
 =?us-ascii?Q?I8SiVnyJWhhF16IKeaKTsBbXTSLtl5e/sBypLq1qUD1cxfhS/aKnrJYaqkLr?=
 =?us-ascii?Q?TeyhmyUAo3OnVzHXt/dZzlc0UtBevb9dgKiix5vp0bpUXSYjMviFg1V3JsWS?=
 =?us-ascii?Q?/0tgDj+8DAkg/ypuWFKwlZDecexF/kO/T1wop/DZ1gzFhky78yNVLaEQ/t2i?=
 =?us-ascii?Q?xYMJOH/iR4bW2VDxqfvhi01XYElggiP+TQl9PoVo4jrN/XgQPQBvUwrRog22?=
 =?us-ascii?Q?cAHABgwhEZmNJpr9QPmRuC4H1Gy2iyo3r2+BrNSrp9yJq4XkuReo6qOA0yqv?=
 =?us-ascii?Q?Yz+yMDHrjqeM7MMkUMkDdNdDW24XOBKwOeQ0qusL3dyg86BVg0JzVCHZ7b5h?=
 =?us-ascii?Q?LdAOZ5bkMTiN/S1Qe/c4k2xCaamM4dTatUWbj6gGodbESVheT3PUNmTGrqbN?=
 =?us-ascii?Q?6xzIbtZuBqnzE3+0fNNXs9CdrK5lLzjaGKfPyIVwaCRfTH+zvF3fxe1EBUlD?=
 =?us-ascii?Q?jcicmTkcb2byYYBSdak/pWs/BDAVzyW0x45s9XC83dNrn4CAnPpDN4OIdeQQ?=
 =?us-ascii?Q?z2mH5ri3A6k13ljc0XALe594b36ufA0zUPDnR4ZzXkBArGNQ5fm/ms4O2NgJ?=
 =?us-ascii?Q?Tnw/kNmiF4L4SI4m6qPiwTswgJ60SIT1QrNzXOUNc5uH6Cic6u6ljMf4Z9hg?=
 =?us-ascii?Q?veu8xNbXWa9cRavYqmZ5gTWxLQl/EwtE1kfHvs70oxEK0KQxiBCbo8DHKSH7?=
 =?us-ascii?Q?RX0pAjuZ4snzrMlpDEOx8ikg4TU75qwSzRm8ebq6n2eHJ2EBuMwDvYwE3gy2?=
 =?us-ascii?Q?VxXmkbNH7XGBIkUnn2Y/nQcTfAiZ+2DHJr8T+chBmO/LI296GnKuOrOHDC4X?=
 =?us-ascii?Q?rJoNbljddzRabBMSMceEbCD337hu961lzH1jz9BP92optktKsowrH+NJyhmd?=
 =?us-ascii?Q?E8mfXhwM5mhniNIup0T1285fYEO5SsqZ+PUcQ4MoWz8CGORwT1u3gGitSKqG?=
 =?us-ascii?Q?IPF23jwtDHxrIVFJkZIOy09ZPDwN/jYrj4UIlL0OcyLQpf/n5/xVNU0yO99F?=
 =?us-ascii?Q?v/i2Jda1jJ6/hsiyL4ss40Vh2WvHCnRY/Vn+e48G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e38e888-aa12-4d40-0701-08dd28776857
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:27.4794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0yFcgqojDiiMuf1uqUaRhu3eV7Me/I1dpCQde/XsErVYEdNbdgwp2ytiyTb1dCtbJkJX+S7g090Rfjrh/wkIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8qxp Display Controller display engine consists of all processing units
that operate in a display clock domain.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Drop DT alias documentations and add instance numbers to compatible strings.
  (Rob)

v6:
* No change.

v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Drop port property. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
new file mode 100644
index 000000000000..91f3bb77d8d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Display Engine
+
+description:
+  All Processing Units that operate in a display clock domain. Pixel pipeline
+  is driven by a video timing and cannot be stalled. Implements all display
+  specific processing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-display-engine
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: cfg
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^dither@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-dither
+
+  "^framegen@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-framegen
+
+  "^gammacor@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-gammacor
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^signature@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-signature
+
+  "^tcon@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-tcon
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-engine@5618b400 {
+        compatible = "fsl,imx8qxp-dc-display-engine";
+        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+        reg-names = "top", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <15>, <16>, <17>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        framegen@5618b800 {
+            compatible = "fsl,imx8qxp-dc-framegen";
+            reg = <0x5618b800 0x98>;
+            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+            interrupt-names = "int0", "int1", "int2", "int3",
+                              "primsync_on", "primsync_off",
+                              "secsync_on", "secsync_off";
+        };
+
+        tcon@5618c800 {
+            compatible = "fsl,imx8qxp-dc-tcon";
+            reg = <0x5618c800 0x588>;
+
+            port {
+                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+                };
+            };
+        };
+    };
-- 
2.34.1

