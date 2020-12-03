Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCD2CD0EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FDC6E0CA;
	Thu,  3 Dec 2020 08:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20081.outbound.protection.outlook.com [40.107.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A404887DE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 03:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vpab2SJMNS9TkGl+XenmiNUQYkwAxAO8oBP81V55cfuRqQhdExW2vB0OVBAfg3H09Xe0rFsEhpWIBBjAPyjmjODRkIVKRrGqZXonhmiQfa+BVSdNnKTxXO6yBmMEur9Qp1XCd7EqGCK3WEngV8o0bTqtEvKlwmfgawcleLLaQ8Wwi8+RqWtSB3CtEskoiAc5IhCU+yVElsz3dc0yyPM/OOFatjUrXP+BkJtqeeNfldRu8TAqSBxiK9o/qktsNjXItMwv9WBN5cDh8Xn1eyu6x3qwvqRn1GWsN01qjt3yvw5qj8Y5Btu5bcRonfzK3wf20THUf1O9L+v/gqnku5lZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc0WleNvV/Rb2SFlDLD2lOlBnIm8FBIlvHjGGZl8lS8=;
 b=dLDsib8xcRg5OF96FMDyku2U8hOIjYLxs5vcr+JCjasdIHZbwtc8fTY7XRBH8FCzhu5Rk1nCWYHzztsU6i5kTAuJhf1OCl2pU330yz/lOE9EiEQ1sK+fGhbxIUDZg97nEio/F75LlATFZPvRAUnk4QHJdbr91YaoOHiG+pHEM01qoNL8XQ2O5DxjABu93uCRaSKcg6S7TQKdfZPvkqxQSvyn6GTXcWVvq9+1AG2rU8zCMFP6EQ1AEA0lAQ51F6CDfR8bWSmJypvhyEFh2GKeWXTc++cOYLF4/aTbYQCL6d1HYC98AQuyT77hkfJ6Xq4SL4/PS2gyYbrUe0zCf7Zmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc0WleNvV/Rb2SFlDLD2lOlBnIm8FBIlvHjGGZl8lS8=;
 b=qPqGYopXr3oAyWf8I9cIsZzaIyEbTuzH1r+OSPnbxcrkKn8huzVMTIMD/BCW9qlOvJRt8vuW5QjsFAYy644OY24llAs/LN1ewuEgJxlzYwZ5fi6wKuo+v3UJ1YbbohlZSAtgks7gNYZ7ZiLg5E/bLemPlkoY1SuK3UN+xroO4NA=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2879.eurprd04.prod.outlook.com (2603:10a6:800:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 03:14:26 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 03:14:26 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Thu,  3 Dec 2020 11:06:27 +0800
Message-Id: <1606964791-24927-3-git-send-email-victor.liu@nxp.com>
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
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:14:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 73c219f7-870e-4bef-3e0c-08d897398a7a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB287978709CC862F112E05BF398F20@VI1PR0402MB2879.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ZapgfS5HVl+BBtwGYiNPhz/VVOZJlQNLrARb0DbxAHaJpqjG30b4+nzX9opGYaGyXAQs7uMozCAujkG6ntjhYln23SbbPOzxRlXFCQVFWDJYJ9aXXtDZrlsd7X3i9N96r9DUFtNDnF3Sk2WCxyeSdLWDpCtBMM73IligKYmfVJ+HqOg5wVvB3+iGKCIAg4J20ldnc76Y2AQfJoB2uvcXoSezp0QEYHjGdsMJ/WlQCuY97Dugv60UF1tV0zlZut9kibQZxenRIeIYEk8lbmFJL7ASM98C8w2I+Vcta2uCAQhRE2hJtls+QW0M4El+jrnShqLMc0F19BA3roLvM7TmiF6XyWlVBG1xQJDyhtIghJ82+d5UPuwaahIZq8EJDAwhtd218MGqdM8qoglJom29a8MroU145AQ6hr9Y1hMnZo6a7xu9pzRVrBElFbxoKlmtLIor+B9o92COJvJHlW2uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(8936002)(4326008)(186003)(66476007)(66556008)(5660300002)(26005)(478600001)(7416002)(6486002)(956004)(2906002)(6512007)(316002)(2616005)(66946007)(8676002)(69590400008)(86362001)(83380400001)(6506007)(52116002)(966005)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cSIk77lNd5Xrl6jpwi4gIMGHNYHb3z2L1nP6WAmnqonY9lOHjHwTkdJ/sjh7?=
 =?us-ascii?Q?kz+jOr1OqY6Dh6oV8r+TN08Me+z7ql8IrVnThEaWbe9T43q14CbxaRh9Rn1T?=
 =?us-ascii?Q?OTid0pLO8LKK1OnIOv24vDHqlEqso10AsJtTTEPTNCRIgK/Pbvts5wToT/GG?=
 =?us-ascii?Q?3pWpdQsRppANR/qlE/is2nPPS34fbAU7Ze1V6Ll33brQpGalRNuLYKCORabg?=
 =?us-ascii?Q?HhEB2iRNxYchs/5q8j5Vw3tm/11THXRWw1GXAxceXlzqI0sXMF5UN9FTThLn?=
 =?us-ascii?Q?o3dZ2ySbzulKw+enUVk0U4AZPmxk3sXOScXFbYhSZL+yQPxtRMbZV8DYw+hT?=
 =?us-ascii?Q?d7QPRVwu+rSlWiQUCmf+Cfc7M1xDlFmGHMf8TVo+xdAG3EdZIS73mIjTYW/t?=
 =?us-ascii?Q?UOo8H5FhUVzpAvDidJQwfUZJmrdPJAEuvMSXYK/S10FpcV5UIEJVXelFex0f?=
 =?us-ascii?Q?DqhCMcbsLMDjzRk3qRwxKdoOYKIUHi0WZdymMhrWYHFpE57Xpg2aQrBzP0eQ?=
 =?us-ascii?Q?7DyXVDjiQpSXLS4qkXWBwaja3FL2XZmr9P4ulVJZ/Wt18tfqfTXQQtZh8XwK?=
 =?us-ascii?Q?psOsivquplgHpg8pmcw20f6dm215aOGKglLhCszcx8sbiyGOIWDl0VCYS1zr?=
 =?us-ascii?Q?StzctPEzLLn0sxOUfOhfF1AvjkZXTK/4MnxiTpg3SWACO65DoJQFIokIxNqf?=
 =?us-ascii?Q?95kL3HKXx9ZJqtTFzv/+F7bA9ODjUNze6p2iaFSakbVrdsagzzAsld6DqOzu?=
 =?us-ascii?Q?o1la1qlz5sqU7yjD1m/jWw7qm6mPJlXdPg8pS3BY2adkbPlhZFV2F+zysWxF?=
 =?us-ascii?Q?hMY5ZMg8tGNiPXrwjeU6VuBUiZz0Y2pz3fsov1DnmZoKnAyM4j5GeNuL0o/1?=
 =?us-ascii?Q?iU8tRbgguar67fx6zdb91UBP8T2RWC1T1iAg8k76Nm+bbvCDWk6nQ38+Fikc?=
 =?us-ascii?Q?X8gTNHmwRYBU5Np7gADJUt7guavZbdC81ukGfjb1HWm7XQPgoihDLBbt36B5?=
 =?us-ascii?Q?xB5c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c219f7-870e-4bef-3e0c-08d897398a7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:14:26.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+ZUxMGLfBdJg3d0UvDSaImVU/+OaU/DgutgKb10URmrfs/WisqMJRUDvfL+tIXUPNWt5z4nyxgLHzky5DIQtQ==
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 00000000..d59e2db
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
+    oneOf:
+      - const: fsl,imx8qxp-prg
+      - const: fsl,imx8qm-prg
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
