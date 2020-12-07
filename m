Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9437E2D0C30
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F446E563;
	Mon,  7 Dec 2020 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A9C89E9E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 03:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAq0aF0EQOL07hFIoLKJneV24sK8t0X0I8+9xHM5OrFjg3eQqOWKaa9awFk9tjwgRCrtSzOZSp2B9J2tCOEfbHrhC09OOS21DRW/QNvnCAuGaY4ib3VSGNR+3wrSxD8gp0qqG48R/POrNfl5bp6bfm7UOlSPNPT/UCYoUwJWLJ5uhk5Mq43jNU/53gCspMGHb8tprusegLUBmm4QXx5BX2XGnzUXx0vlSbJyx8U6emZGPf5Dru9KXW3U0VejisrTX7IVyxDT90IqiorgdN3CuAap/uPaB9XQjz/WAv7Dfzap7IDMrKIkcsWt5vtOeETGwkpjrqeoU5++Y1Svv9ljgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+SPVZ8QvjjacYFtoaqt2fAwiItMjgto9C/8rcBQnsg=;
 b=FhBfV1hIEygjytLaUtUmzhBgodqZzIlzS6cL4LZR2CixqlpoaMbM4wacuQL8TXL7dYxvzTAvgIlGMU/PQYxxQXpaUS9skNBNSNbZSBqNBaY9yiGWZSGPHshuiUreKqIiOwomdn5bdtgr1ju05MTQKl5/zDJD/xIFVx6b9zY2anAa5bt7T3TC3hcuhDlLv8qwiGlBrxVqDbZpm5ic5RoG8/Z1VDif6pNG+ok2nDelh9rq+zH3COobunEpsP1G7RCV9N/xG2eE5PCRAISaw/t21gTu0Yym8qbvNWPBqg6yLORObdggnio6TSelksneruTrIdZTNMcpI3owJ7fnQckH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+SPVZ8QvjjacYFtoaqt2fAwiItMjgto9C/8rcBQnsg=;
 b=hpLDdvHQd5vf6TzQMMns8ud9NCxIzZ+eZVCyPQ/dxQb45BztmRVFNAM1SWqvQUag7vqmbhhgBR9j6IijuvVz1T37Wxa+oBnvIkm9v3ceOfxWFUoer0AnXovgnwmiXHgnrfbMHXG9gSzT/MVjKMlh3xmrZ8kZSGM8HnllIUX4DGo=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3424.eurprd04.prod.outlook.com (2603:10a6:803:e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 03:29:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.038; Mon, 7 Dec 2020
 03:29:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Mon,  7 Dec 2020 11:20:56 +0800
Message-Id: <1607311260-13983-3-git-send-email-victor.liu@nxp.com>
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
 Transport; Mon, 7 Dec 2020 03:29:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e95e4bc8-2574-4b9c-2a82-08d89a604666
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34249DF79BCE11A67978627798CE0@VI1PR0402MB3424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slqC2Qt0Gh3VfFWek5fvU+Cwlfjit2t19YcfS5EaI85JCMM7wSRKofdl0xd5rfThyoMndp9ILGwWHbNzCHxaayKjf+QbvU+3kKEXvnOMAK2vGsxU8cdescsG2AKnNC2uF3gMjuqBcvbyeuqYmSUJ6/jp86O5ji1UJKEit1gHiLeBxibHbpSUFsERnFZpAkw4b9/2gtPGvDicDTAACzWOycDs8Zc8ACwF0cAlWgp/yGjosTQFphvQWmJAyy3HqlrDrcvvGGPO0lfpcQ+RKJfAInzhu2tMfHSyJWWzoxJ8t11BnN5ZDt/3B5tV3A7/WtuhG/I+yP3cfwqxHJz9RbB6u/MhqpcU5A3BrZqSlKChAST2AQleJLL8SAABhb0mExgQ9sM/kLhhCOJ/xyR3f740GJ1yahF8VJoynFQLRZu3kBLuic8JR1rXKf/ybBKfRwf6AorYwLVBddVk5GV72csIKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(26005)(4326008)(966005)(8676002)(7416002)(5660300002)(83380400001)(316002)(6666004)(8936002)(52116002)(6506007)(478600001)(186003)(6512007)(69590400008)(66556008)(66476007)(2906002)(36756003)(86362001)(956004)(6486002)(2616005)(16526019)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3NClRBbUXvdhXZ3Jx3YvpM8eooTfb6RdklH7EgbSmC1IurvRknOF8h5vvdiv?=
 =?us-ascii?Q?R1r5W9d2v3WTV/94a3tphDrmx6IOVXn5KgDjhTV9kaMUVw7vUsv7zR0bZibK?=
 =?us-ascii?Q?JZycbDzyZimBYvVU5QcgVC1R66y10ZgY8NRwhP/zakirg7fWM4HQ+7pS/tY2?=
 =?us-ascii?Q?edMvQrw+5ZoGGzfYl4duyzkkS5lD+6LT3x3fKbu1xvKtzhyeHSe8DUDEv63P?=
 =?us-ascii?Q?eMMSpBF6qapIWtwpzylUdTq5JyRm/JjTgfUgv5nHUVAQwxt+jtSbPBy3SJFN?=
 =?us-ascii?Q?B8k7Iei0jE1DzyzleXtcyRJWipJUDRc9R6wF5EU3E0yU+d9Oru7YR78i4+J1?=
 =?us-ascii?Q?gpm9oiuiG+PjmC+yXjJI4ZA43+sDhnBw1Mzo88ZYPJcJvdGI+ISuM7R5oMLp?=
 =?us-ascii?Q?YkfoYlnWnc/2FRurYpXqmERCVJOvvhfevqm1C9h7T4S5L/pn7r1+efd+d1v1?=
 =?us-ascii?Q?XrhQOKd9fm51QK9OKbJYZ1CDs3ZXIcZ2gzsLz9oNKrxP7MNavfA6dLK0uXrL?=
 =?us-ascii?Q?aiNbtjXwYjqMQFXMocQM6+NFhSPmiUocC21wi2fKC41mknu/BG0oDdJuPhOr?=
 =?us-ascii?Q?2qJTa2k9sYXJUucPYCA40/21yVAbkY1H4pguBOSIsTLQN5Xvk0gIPQkD+RZS?=
 =?us-ascii?Q?lGxawpIc+TyKF80U5Dfx/1kVsuwiyG7WhlxBOPC/Ti75Bqeyl17dy01keMjU?=
 =?us-ascii?Q?x5vv1z9WFjzSOSqOF4/fqE2c6m/bPQEFckdJWmQAoT15ntp5ZHcjNmOzspkE?=
 =?us-ascii?Q?k23xcMAMLmqwbh38/aa611sWiH4/15il/l8WzEAyamMWFHyMhiu5g3atezie?=
 =?us-ascii?Q?HXCqlhCu3MeptJc7e+nmqzzKtJo/UmajbR3pbm2RwLtNB63gB8A9brJ+alp8?=
 =?us-ascii?Q?Ia2+9pH0Ups+peYQ9BGat32VrINrVfwSgtv72be9ESu/WpaGnXSfktzNeNTv?=
 =?us-ascii?Q?6yZ4V64Ms3OeFma/fJtJouE8IkpIAfNOE1NCpLrKWh/HMFZaB9Y5rmGosQ7n?=
 =?us-ascii?Q?t9Zr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95e4bc8-2574-4b9c-2a82-08d89a604666
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 03:29:16.4372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E19v0wfQVQZONMwduaGrDFSW8rMbVTpP4QOrZo/dMS53ar13kuPttZL29D5QBwhEw8gI5tAYh2mU1BZJ0lxe5w==
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

v2->v3:
* No change.

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
