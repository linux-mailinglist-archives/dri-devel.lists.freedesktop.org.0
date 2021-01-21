Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A02FE58D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4336B6E8FF;
	Thu, 21 Jan 2021 08:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30081.outbound.protection.outlook.com [40.107.3.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3AC6E8E4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rc4Z/BazZAi8pE+d+E17RSCubdaNk2yvIDhRqPb/H7i7lhWLFAshDoAQ2cqA6KSTgdLgB4yYiyAEmjfCGTDompJv/PUhUGV1G4ZuhFCtZhsdjPdRIxX6KjBrM756q07BOgYnAWNfbpZ14YA+/smkd6daJ1zhgADDFkopc9qbiMy8gbXkRO/pnC1Z5rYOsrV1IN5+O+22xIEohPaQ23uzWrPV688DSlK+68t+8cNhygg44ic7OlDLIFv/gEC84Zd9mvnQnNAw9shR99eCq/VpAuBtBsIKj7qc9vKdjQ2Y/uHcmz1DNQ7hq9gEtpgKqiWIJ86SC8XQ5ZJ3zvLixDj65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF5WAKfagRMSjtr9J+u9Sh6Xhitlc3U4eRjDqO1UDug=;
 b=MXzcjvVoXt+hvmnm6WMeTYFOYxgKRSMHaGtGxDzwAlCcAy9Ngm7GBBBk3TVMAhtvT7N3dknsifUwc4F2rj52FTJ0Lm0ZmgGLbzdTe/Y83jQOVk29UwQ+KffJe3aWybrOsXpg0cBFZ1Sy/lDS+AYbijedIsSmzU4p3tCtBWDjDoRKkrH1ZOgUdEux94h6Nub2w75cQ1KDCbwDtd07XxJzjRsXdEQCV2TL7YuaQ8Oswvhgcmk7pHx9Qbi2JP3jQ7dfHo33kCStVeL9hb39BHYSGDmtq/yxggVTVtQEepKLiks3n8K+eivk0ENOszmKOPX1SvP70/Gr03oOPfii8sHyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF5WAKfagRMSjtr9J+u9Sh6Xhitlc3U4eRjDqO1UDug=;
 b=KzRHfEq2IX+PN4mLU0iC2gsFo9KYowzUZkq33ZHDB6MN6Va+jdfa55Uj7ScyQRRCHzTigX4Z7Kba/iTFiz0retBkoUDLmX+4wit9N2iyBiTLuZl7lkqrdvIa69eBv7JtHRn1cOxl2Ah38LYC0Np9ip6Cx4ljvP8mtJRQ6jTxiYM=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 07:25:22 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 07:25:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Thu, 21 Jan 2021 15:14:20 +0800
Message-Id: <1611213263-7245-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 07:25:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5a2ad9e-163c-48bb-33a4-08d8bdddb674
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB571101F5629E0DF9F0CCEF4598A10@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BV8MoN42jK/bF+ql9vwui3fHdIQ6r7qVfgxFgSg2kibxKaxfRGA9FQaBiWOI3PP9+5ZXKeZ3kxPuDSpYdmxoXZdgLnEdmp+V223ZKKwpwbYdP0n+X5uwqsSu+mRh7lozouM6oyQyc5YqlCVXyLIWBd7K/ruGEiFmuxYucoPZypWSPt7jnWTB1L3hvt35ipffeMq4VGJugwjOAGx7wqnIfiQDIX4bN1n50G1OKguevbMUbw4XqVKRxiVUXAXE62pWqZhZ4pdeKfu3fbyfIa0dL8ki4vlJHOWvSTOqoxpBt/hBl0fUzakjIuQsP9TcAG2gxx0K403qUg+/vXE1eP7NYu0H4i3Rx6q8dZH/4TqZVLJhaWNePU3mIWFu5pzTN9VFmgnRqLrdKUQDl1hXNZkUMcXyUqQ2DSCc3TayNavVnH4nEZsN+MpzLb9lDYmvMReteIHRuATK/qqmMjRaior0h4Id821nxPxPagxlZJNROCy2OukbvVvpu8j9eXplvajfpRsz0JlMyJHWPpJb09aeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(8936002)(2906002)(66556008)(66476007)(478600001)(36756003)(186003)(6666004)(4326008)(16526019)(66946007)(83380400001)(966005)(6512007)(7416002)(8676002)(69590400011)(2616005)(26005)(52116002)(86362001)(6486002)(316002)(5660300002)(956004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P/0nViIoD04byhvDIYGcLwzbXSYVkdDb1qzJb93gB7Isxr85vC7o3wusZOHQ?=
 =?us-ascii?Q?r7He9ULYoRBK+spmmE8ZsbEUlukROs1bicsR05kAUnLcw84kV18Gj9eO+zjq?=
 =?us-ascii?Q?Wcm3kxrsuqt7GMmtddB8/mRVFgDcf1IZhA5EvYrLKJhD+qDKJ1fPx9nwOpWr?=
 =?us-ascii?Q?NlCGQ3QzEw3bIsUQBoS+kC5oCv8QPQP5qDkUke/KogIabheDZHmanfWXwLE2?=
 =?us-ascii?Q?eE/kekC3k4b+mzo6H/n28mQUBfFKhbaVpZ1aPu8RTYNgreJSCxLf4cODpRhV?=
 =?us-ascii?Q?KtdCNH+vn+5aNnQXQtjvJg/2NWAhmDgXycAQzY4XRik+h8VB6vMWRvEBhzBx?=
 =?us-ascii?Q?Kh8Azq7xpHx7fQ9+cXCYfg/2p5vjZYZmo4vZZLjmcDejLH9mqaA32VeEAHSY?=
 =?us-ascii?Q?xZOASby0zqha9O+41LInh601NJQw0dh2Jz47+6vCdVJGqFuUkXjMqIMBsNLK?=
 =?us-ascii?Q?vTPN3nqrbpVnXtInevtk7299A3f23LtGkzzl7slWqBo3ItSJMNEAcQofILsd?=
 =?us-ascii?Q?1wa/IDYDPeAf6Nmhlc4m2PDcUhofY5dfNvH1WjcQjlN/f7Ec00di57ROVrNL?=
 =?us-ascii?Q?S8mM3lPhHGw0bdX9e2nDzi5IJ5/4uvNsg1zhzSf4Cz1nvq7rcxlrWuSkjqEm?=
 =?us-ascii?Q?02O6JCmFm4MDmWgkmpjjvX99d1OmebeVral/Zc5udkD+6F7nTQAQ/djiDAE8?=
 =?us-ascii?Q?E59cSTbqdB4apUhFLn6jtFmkOJ2ZpCVg6G2iJFOnvbmPrQOgUZ45e0Gb2Anl?=
 =?us-ascii?Q?t4w4gmaYJmBfSdThLW1vcEJLkJYZJUvTrBFyMazVyoaeFUGYPYuLwQ8vkUdm?=
 =?us-ascii?Q?JQQkb7Z7koJ9uk2sRRUAUa5LFkcdbmbFZJdNquP2DhzXaW2Zv+zWuqrBBoER?=
 =?us-ascii?Q?NGrFEfZqhnXJ2oyq7xKTdtISyeYJfcHlulCFaqsIysTqjoBCS3f1XxqS0H3k?=
 =?us-ascii?Q?1N8QGOK7wKNO3QYOhnnfeZc8lpCPE4D+1q0WQmhhPfFX9vHHH8oG2lMUQhPV?=
 =?us-ascii?Q?zf/4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a2ad9e-163c-48bb-33a4-08d8bdddb674
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:25:22.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xBu5LsqW52isoXTtmMMJNp3pqgqj0zFpuWOjTAvEmKZz6IH76HzGFIXCUgz1Q5UUjl1GAJPX76G5UkAYgcsKw==
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

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

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 00000000..9e05c83
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to Prefetch Resolve Gaskets(PRGs)
+      associated with this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
