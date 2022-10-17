Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A2A600A6A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE4210ED06;
	Mon, 17 Oct 2022 09:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043DF10ED03
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+xSC9cyX2lQjuTA4bKKHNzQJs6kvlW0KVR77csOBI94pq2wpuTr1PMkw01qiIKgzTINJcEAueHTcFe5M+swrnFUrWSUUa7Yi1E6B+2eVn2/t8SGUROVIDGBPBpSY9DXIbJJ315v/gXQ2Yb5WkR/gNH6IpLpFRpl78QAIbCW989VQXQG074iEUcqJ8iIA3QHsKxYtIHeemP/JE5mNBU0JmRfSNXtTZTC/+TT1twi3erSFNh6o2aHW6xoGmY4iV/zYDN3pLfQd8CxYvvRZJXCQi1GTOreGKMvGQocZD2Idu3eMVkJQRWnTRTHaF1izo9ubgWPkHvRgPnscIBv2ugl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XviswpGi8oS6rIm29AnAAm/rOqyhEgClmtrJLxquOR0=;
 b=kUKJfwLQRCYOMUR9gfOYBlVZvmTptZIBbtm7Ti+Cb8GY59n4fx9P2ObhC855pPgeRS3twp1/xeelXziu4u5chvLsygFKw1Sot1zRK71DMGWdLFOAWqV9kGPONkW8NIN/khNOymsubHcMklErDAqct4hvXbyNc5iMG+EC34qdIMeChrltq7tl0VVmTna6FQJ2HKQV9WJQ0NQzPnwZUG1R9hii5dnn3zaJSoh0QQpp/20+SOfXoEGEWKlL6dqeHHSCZXdVkI2CEhi5YkhxMGu0h/M1JuQieKHuk1pSb1JUEjxY3Uo+sN9j/moox8mUgaqtWvWw34Cj486HSjWerNREzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XviswpGi8oS6rIm29AnAAm/rOqyhEgClmtrJLxquOR0=;
 b=Q945wfAmKvxWUQDkMCyaR3TOpzgMquJYAs7pUmb2JQiRsRecqBNI9R5Vm0SH3mku1GNy6oP7Tb5uWbrQH9HrbT4qxvD/5V9MyQr+qwa5DRmF+wjGGvTpdotSqSDwB28HHulKGxYQRlG340oZ5+4QxPygzHcakJTtC2y3rJ0fu6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:22:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:22:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Mon, 17 Oct 2022 17:23:04 +0800
Message-Id: <20221017092308.249665-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221017092308.249665-1-victor.liu@nxp.com>
References: <20221017092308.249665-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 371a22cc-236a-47d4-3765-08dab0210bb3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJH65lkLfsDPOAWeCMPxJ3xykQazlJeuSB3vJjYXdhQULN81Mji8gGcGbVFvo0nouRpU5WAV4aphzvb1jpLvxXA+GPpg/VORZWH4tzlCDKN3vNKaGGlu4/csAIOEatSPa3VJccou2KqWm/TCKboAOl64fRmW0/Y1K828yzxQqBY8Ibnrk8jl2dzBwv4V1WNGuEUho0Q5BFvdMckZTcf0ZRQWsEEed3lqbPsKo+rT1JMjFhi+SxQejHs6Qlx9LAKrCJiyWMfQ1koLeZpGnoX7hjinpjqBD+G2Ktr4eMVser1mYGiOp7RRA+rA5trIUO7+3Bsb8AZBzfSu5aUGky+SomaYYiPlJdz2oVg6k79Fnh1JYdn47UxH/jYgA6Spr99q9FpuDDQNQQaqzd9J7nGsUpZ9dfWbRNYhW+vio3w/nlcHkIsUqPOBR8x8BlbkLXKKiKYb31FzW8n9In+/j6f428zlgdONhFEvlWZvcUOvfouEtNEA2wYg1TmKqdd2AaqfrJ6OfkqqJdXDRG5dndZrYDaUWsl9McgF6wAAxZfnywS5ceIANzvT/T2AzZ3xibCVpcRNIDNnmtJaiOOLNHs5HaxJ8LW4rYnLxC00xXZtWzA5Thkhl1VO6kkyIVI8akqch70DX5lrkcTx3HyDW7GP55d7vhWwuavxwC+KOPttc3Q5gXYM/sOgw85EiMB/ElY8sjQCAZsy0chVdWpWYzuHlv/0Mu+kPFhMUZCqUZsKdCkRjtQPq1+B+OsiswzQXnSc9Bgai5wdONP+SQWP/7GhvXbeqC+m/QY7jfr000C56YTvGXldriM8TT7q7ShjkFiIhyZvKS5TAB5EbjhjvpPuKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(36756003)(38100700002)(38350700002)(8936002)(5660300002)(83380400001)(86362001)(26005)(6512007)(186003)(1076003)(2616005)(66946007)(7416002)(966005)(478600001)(6486002)(316002)(66556008)(66476007)(41300700001)(8676002)(4326008)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rCWM8oAydFNmD2BRyYFksq0kTznpWb8O2l94QhP6HCU8cCu7VJ5L5Mx5PSNY?=
 =?us-ascii?Q?iZCJeO+i1sNqeLcc/9PpMoF83w6eUuXIKmqgz+VSM0Bsh8cDYLZ+CdScIJ60?=
 =?us-ascii?Q?w+tTownv2P4dTjhU6fBwdS99gFgngFvyf7L3W5g7SD81fZUuJE49uuHsl4Lm?=
 =?us-ascii?Q?hf5ZySYSKas/bRusvgPD1psgKH0BHHo3CMcnL3Zu5E7cjlhkjyAQnBkV4XEr?=
 =?us-ascii?Q?9LEMojRZcYqIZTU49kVtFDIn+Bajv36HnjEbZGSLdcZvjAQ7a5VS1sANnEf7?=
 =?us-ascii?Q?CuM1/rabf12Zg3R3xIqFLmlgfVUynqJ3dzl2celvbm0D9k6BbW3ss3d+pZM4?=
 =?us-ascii?Q?sJsikFBBXqRm5tljgQsZgT/bF+KPPxW+CZ9Zdev1srTWC7UYPlNTBhdXITsn?=
 =?us-ascii?Q?2+VB34Z6dFLtDROXogTIIpgNxx/H8rBBVz/pCbFpS+rw+nmrxvj708WJMdCr?=
 =?us-ascii?Q?vx3eJvq5xUqczScWhz26oApvH13n2c0f5oKjmOvdaMNkxBtnP4bnaElM5qI/?=
 =?us-ascii?Q?CO8l31ZQppiSyOcrgBUjxzlH24+nzp/lbGL/XjUC9cE4950oUrDhhLZS1ayq?=
 =?us-ascii?Q?nFGL0KUgycJ1/ndK4HSzFI3BAsZyKuqxZ8P3gUR5bfxJfnfflgmYCpR9AnbU?=
 =?us-ascii?Q?C1Gv2chCY1Z53aFbHPMVpZNG+2WPixlr3hgaupmM4nLmHITauE+Ifd7lXlwV?=
 =?us-ascii?Q?EC4czwIkB0lfYds3RLC5+9Lol0y6FeUlmFjUR71Y3iS27R9istC6lxVGNKU4?=
 =?us-ascii?Q?uYz0rrGodu/BqbK1sBFV3gk/1pNG1Btqa8hiQJQyRVxq+J/jHv95SS8iIMgt?=
 =?us-ascii?Q?BzVsue0/4UsZHIQyhXaDrDvGEEAaZF+qu7+QG+zHTLPcDGLJBUDeXO7Wr0z4?=
 =?us-ascii?Q?Puu46whaKJzdhpchCYhnMQWLl22CAiV08K6qnqrg53X7jJGczq34H+eIQkl0?=
 =?us-ascii?Q?HXF5fPWXbnDLBvfMNAstDSwUI4fDOcw85B8SUaicIYIxneGzGEvpH3aA+xYT?=
 =?us-ascii?Q?VD7BxnK/4VEt0o7gWZCExbMrGDnK0mQk8wmSfD92LXB8JC+bsUdPx+1F7/Po?=
 =?us-ascii?Q?H4nQP8zTz/BCRlkAibNFBLaHhLXBWk0sue6sv87xTIbJ6L4CvdcIQbMRB/lX?=
 =?us-ascii?Q?En94BFVePSYu33lzkXKewARF/TOGF6C56SmBIKWnmg22vNXb2NG8BvamPk6l?=
 =?us-ascii?Q?ZUX4ONIr83Sp9M8sD6zFQEUYOYOr2aflJ7Fk9i1tVu/vA695O1y+P24jId80?=
 =?us-ascii?Q?GTCttprpeVr+Pcc979NBNZ/UTW7D50V/xp7qgMVN01Jh7kAYq7uTQHYs3zsE?=
 =?us-ascii?Q?gQFeOrcRnroAtZncK0sjRFsj4AweKJ05U3eOr+sF31RJFeqXNsqtb+OsMQht?=
 =?us-ascii?Q?BgEDrnvwpVECRg953bAcymy5Vp+8FFTaHUCVn0b3gQWnY+TC8iKdH8pVtJV8?=
 =?us-ascii?Q?IKMV6IqbVinZwe+WqutU9hg6/42dxUKEtOEiuHycjss/uHgMpkekeEA/cYEy?=
 =?us-ascii?Q?GQg59SInRiAzZIw78HQ6+WocijTmkmyY2a/YjBPEsHh4NdjY+WXS0ZwEXtvG?=
 =?us-ascii?Q?LwuvUe4KatEL73vbG+FjqhChdeXQEthY8zx//BGJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371a22cc-236a-47d4-3765-08dab0210bb3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:22:00.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKmXjvyjRm8vk6zhXpwCC+XqfLfD86KPvLlYWuMmezTP6hNxsAg6/HZy1qT8WiBqZnyNOlBmR38zVsLRdX/Shg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v12:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 000000000000..3ff46e0d4e73
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.37.1

