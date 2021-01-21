Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112B2FE584
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA656E8F0;
	Thu, 21 Jan 2021 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30048.outbound.protection.outlook.com [40.107.3.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B376E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POFKmYV85pF2aD3UFzPTJYBMuwGrTZYasGOjnJxPU9PyvhY1UbnPjOOyjzejQffmMu3MvM6HI8Wx0A2tfj/y9figoI14ybFkV4/Vi9kQotWs4Q2H9Giq3wyvy8wMCDDiUw056kL2opBZ6V/+eB5HdcuNFV/zingUBllzZpXhE7QsVm8qHPjrOvMZlJnY/38aMOBrMuDVuXxJg/9M/eSGuO2oAIiv6/0OEuWiJLcJUwtv43l3lUAxLh8cJodVNPQErDB+AYUYY3n5MOufkadCsG2HelndeSYL9p7HUI7MzhKLerxTYYrjtbgwuWrw+kTZ5w7PhLpqWwAkeQVVNbbsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYtLuRcbCLOgIMDDozt7HZz0eEoLHIXqsWBG8oxA/iA=;
 b=FFz6AsIRYW1bMneV63MTR1iSahSb5+eQBzirnBec1zQaoOBjh7GahUp6qK8RkOKsYRYvRFi4X7YA7RIB9ZlJ7ojYECZUc8MPHLRy/8itQ95FadMWEIIlarc4nJDq+nJ0u+N6ZFQufs+3axAuRqL6fGGZ93YZ7utL0xd9VTXgoCPIITSH9rJ/+iAgzWAkvfTLsQZadQqmXUWPBmz7PK44ZDWJbH42Y3xqPdgZa4XsqzOFd0ZxXuF7/eoLaEqghwwv6OfplExXjPASADpOUeNSfGIggOif7kIMAXJNUzf7iss3W1654+N1I0vhxwKNMGcGVPJlzqg/XDfUunqjiZUPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYtLuRcbCLOgIMDDozt7HZz0eEoLHIXqsWBG8oxA/iA=;
 b=j1fxq28b8TZZIXUvmj4dSjuHw4OMgd1wWu3jASpr/O279fJSw2SS1jOZW5C/K6eKxyaqM9YSiujGvv2SAM2E/voj1pRvVyAYxpUh6Xrgpsb41ejnGd9E5Ep9ALvoiU6MFlJW4b90bsW/Sds1cvzUZWHETJmRNmRzddHAe0KDuKU=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 07:25:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 07:25:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Thu, 21 Jan 2021 15:14:19 +0800
Message-Id: <1611213263-7245-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
References: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0123.apcprd06.prod.outlook.com
 (2603:1096:1:1d::25) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0123.apcprd06.prod.outlook.com (2603:1096:1:1d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 07:25:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 586f4db2-9789-4665-2131-08d8bdddb338
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5711A685AAAC608E279D980998A10@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dg9ePfBpAxESPGMUXDTj/B+KF/ql7QjDX2afXyy0tUqalWGsn420kRgHn+jIf9G3Zta4x0piY3bD7XGfe6NJPfT61QrKlP4gacsZtQGFnUJvcUHwz7B52V30IUroDSJOXLonOM3X9bdcmURepPm6DR9fQvvOqYapgKw9uQCiM3be8OzgW/7ESYrnQfCza85brjBv7dzs2/oMf9RATUX9jAPjuP54RD/CV7QhPU283N6g3PG5IxfCtLw5zX6jR1swoEaPbhvA10WeHY40jaluM+mkH8VkQN1D7/X6ycCG45kZ4vDU/zVVYGOHRN8UJ7GNumh1ESEd7z47NRRzkktz99axJ8gk8hQy0IUn5kpFr9Ri84BP2PRUabhqS26WUYv5gJkQ2fy59AFOOW5XZDCbTnbNdPWZxBM0OeYdA8q1sr9eyJj3tI13KX21tRvC4+8u+9jxLXSMKQzqNuF9cXx44ARUuv4RyUXPAoP02mv7nnieaU+guGGg7XaqYg6NHurlsRWf9JlI95d/DooZh9arVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(8936002)(2906002)(66556008)(66476007)(478600001)(36756003)(186003)(4326008)(16526019)(66946007)(83380400001)(966005)(6512007)(7416002)(8676002)(69590400011)(2616005)(26005)(52116002)(86362001)(6486002)(316002)(5660300002)(956004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eG7DeigGGYfxH2ojo3BgTt+BApzVyCmM5fRKLpDnlaQtpogzcXYmfgkNo6wb?=
 =?us-ascii?Q?oVmc/fQMY4KgwlvRZJXwLQ0PY0DHB7EqhkcEHa9TGw3ZkBYDsaOUnDF90E9q?=
 =?us-ascii?Q?zJs2xUiQIz17/WWYLVj+oOVgFqOLKV1RJHXbL25/UiB0xCnLocueOkEsD+29?=
 =?us-ascii?Q?DGlXfQmI1w4NNvBGLNl/BXK7ucdpAJUKfzwrROWGobOPuLcrC5S0ByYGCMw7?=
 =?us-ascii?Q?yaqPwO980h1x9bYte5LemXE5QrUoXK1NxboaMwuoE1DqekocOVuQ/tGwSIfg?=
 =?us-ascii?Q?hUr52Vsjz4eGas0ySl/lJ0NT14lIu5m/wqrKos/X6N8yx1RzboJuuJMfdExW?=
 =?us-ascii?Q?TGjDq8ZPGLWmGg54bYwMRMjMkKj6ZQGz8ly3MeunbAprDz0AZwHQC4g3hozf?=
 =?us-ascii?Q?MYpstcIRJnECMAjo0Lv2e6mK8HlKS0nxhE8vZDWLBbyD38R8kTw0Gz7ft9o4?=
 =?us-ascii?Q?//mW0DjpAa8J47HZ92F+gMhYasvJMxBvRWlSNxGlg8iVBS/Qj3pD25n7vdaj?=
 =?us-ascii?Q?Z1PpwqNxF3Q1J3/YDho2lmMZbEOlNjT41h+yDxOTeUjt2TrKgC5oLq0yj1o5?=
 =?us-ascii?Q?7vzElFKE7cqP/5xESgZa1LTZo0HBONZBVZdF2LH/+yStQQmF5rTYOpqnDFWZ?=
 =?us-ascii?Q?bvBJlQIE48zO0dHZAGCd4+twnJuQkh1KfbAXszHbBxwDi3eBOXPx7tgFyqoB?=
 =?us-ascii?Q?x47Lof3FYrsG+/rYUECBh3s4P41J5GLG9OSKfECk8lECpzPSZgZaS4Rvt3+C?=
 =?us-ascii?Q?ClIB0d/+Cxi8vKxhB1mUD9FNUgY6zkRGjqdZoB2t8Ip5okguayYz8vcQL9XO?=
 =?us-ascii?Q?CaU13k2+W2bnmN7EcOtlmSaKcU7cQDlowUgeyy5CletGApA4OLMm8+EAPhr2?=
 =?us-ascii?Q?6Xyl5tAl/j17px/v2QAcH4WkcZaWs82nCwTzxlDYJ7EWbAw/CEP4X2hIHv/3?=
 =?us-ascii?Q?970NnTtR7OPVw4oOCYkAxuc3ryq74JCE6F2UA8IYOBUzhgOfTSSyr6kJduqe?=
 =?us-ascii?Q?cBkR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586f4db2-9789-4665-2131-08d8bdddb338
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:25:16.7356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FedmO4J1afwer67t+osm3eu+91ZEt/7+4k27UMtJil5eK5v+DHwFBnhl6qvrmOuVJB2/XJ1WwFcHgaPQH0+3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 00000000..3ff46e0
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
