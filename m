Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D000303806
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4EE6E423;
	Tue, 26 Jan 2021 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612389BDB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 06:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUqFRD4s0GNK2J6cx9THtrunbxiQB+bl8PlG2K1Ec8TMUggq+qCCk07tDnvfvZCIgcLKQghaUrzIRWNILX2Hk/kqN0nCnCKG0FTX0/lGyiZnDDux1oPbkunf6K+Ol1JNmqbNH3arK5Q/wwWI62306FX9hn5PKSi4NnpEbp9QfBhqRC8rl1kiL/Wo5qYPQDQLiqwBe2OigbJePKkt8V+IoHaV7yTJ4cBiNpdxH3kZQftmcOIwYlXVJcVpa1pY7LAV1OZ8CWzAP0JsNQQrvrhCkNRlDoutdHbvfhI212APxV2vsR1yI5WL/5se1izspGJsPUEdulvSKbWae36/U8Bmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6ikzH+OjZEyzJKgLZ7doxr0Z4aeycpYlvlYetl6k/k=;
 b=VUgzNRtF1qrQjkF/tCuwDlB4IUm9NaxocWQAS2LbqomnzUH7zRuq5zMybgP9WYjJZWTYECgYon70dL49Txm8kQ4FZhS0aKovkrWIQ8/HBt3hw4oCJIoLtHwgdeCWnQhYZRhE+pjlJoLYGObKfk7Bl/FygaPtsEgZhZf+zCGaVIxDP+EMgWVS6jxfKH9VuSUJpGN03PzZzPW4qV7pFaDuM+LEaiIDn4HUSBgdC5MNcV5mILVRFVpLLMrsUARiyiwspCnp9ZnbLyqhysBnElnlvWwpfvFMcO/PEGLe9j/Y2Iw7VBbOYWEO3oatN8ziZg2dD0lnGPuF2i8Fn9qMhZr7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6ikzH+OjZEyzJKgLZ7doxr0Z4aeycpYlvlYetl6k/k=;
 b=jF1T/1mihfhfmUzzUmqSRSqfjqdr1yccmnnoha/Mn+W0puiGTupuoAg+srh78G6lDac3vCVhlTSfbFE1n13kPmOI9v1spRFLe3TGzWIa2rwSUgOn+xz2UbjnXJhB38tSW2qdWAAed286f/aPFYjr6olddkwus50E7qc72/Z8X2Y=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 06:25:50 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 06:25:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Tue, 26 Jan 2021 14:14:48 +0800
Message-Id: <1611641691-17554-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
References: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR03CA0108.apcprd03.prod.outlook.com (2603:1096:4:7c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 06:25:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 309688d6-c9cd-462e-081d-08d8c1c339be
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29731E438412BD352EDFB26A98BC0@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3us/8P7EBhJMD3MfTYc+inRZu5ajK0jBMD0jijdPBI6oQe/bUzHTVsytZAE013YJtbevxyZxBRsXiATyvgo+2BrEkWeCJt/jgBjVZZiUCYa35b01WDzlASzy4eneQmMNI22CfYJY37dd3/SQcvjukyUz/ZidZ8KZKPoAHjCanDXJLlkrWSEgaZ6eWDRZ0yOyqcCaPGXMBRJzcwk4IdTOVl/DZEWKz3N88ESP6Y8r2AFMTT6fX1XBbsHMbYTBU+HSmndHlxBqW8O0MILWGl1dXqF4SVDMUg8FLzJtMqy+H7ltuS4nJ/hTADNyr720Xu+PcdNfNVy+vnJK7EhHSc/uKP33p8zvC+qxNxpnyYgihZ5Ws6xk7hXoWRu0H0h41lmcyEbOTmohVi4ceo7atuicYZm2WtRhqvwL3DQ8YmD/fiYw15os47q/m5HMysMpEReJWXm/+4V4FMZcMao6RXa3uXTRnergSa1RK3mwsLzx+6IhTyN0EzSYaR6517X5jyOoV57TIQVieu3Z4cHqtKoPxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(6506007)(83380400001)(4326008)(6512007)(86362001)(2906002)(52116002)(478600001)(956004)(2616005)(26005)(186003)(966005)(16526019)(5660300002)(8676002)(69590400011)(316002)(7416002)(36756003)(66946007)(66476007)(6486002)(66556008)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+y6QBoj7VhKWS0l7Tin+VTG/v0lmc8BJj8nPSIr0iH6SYAaP9b2nsAsQAAqO?=
 =?us-ascii?Q?+3eLD03stp8Amsfuttqio9193Wm3FQKXY1SDOpH7dRykLqyPyktHksDxI+N0?=
 =?us-ascii?Q?APzs9JQMbCOq2yGjM9HXBw+W9OyPWxbJK8xktKK0XV/CRKgsEh6O0dfT0RoO?=
 =?us-ascii?Q?mqwfy3XqviZAiyK46Qo3/+Xan1smxD/FspyuDdERgyJKpIGDJCpn/QmZa3I9?=
 =?us-ascii?Q?KT3WZvAt9wwpf/+rjiI0oYEMn9mtbt150ZiVpYq0JcMWHorvhlsP7pt2R+f4?=
 =?us-ascii?Q?hR0zlSTQpCnipsX5j0caWBUI4P7axCpEpVDBPbDWthoWkETcpgMuXC7Xian6?=
 =?us-ascii?Q?aVipyfL71jOZFjVNs7Ay8EiCDASZ4WVGxd0Szt+FFhQIBOJvRC14pOc8YFtW?=
 =?us-ascii?Q?WzI+T4gJP7To7cyAz64g1OKk6k1U0ePzz44HSL3Y8qjAPM8TucBG0YKBRYVK?=
 =?us-ascii?Q?wXUet2CXu+ZfzbfobkpJubFEI4InyBZJUj4msctdLGb/lJfFbcaaMVrV9QJH?=
 =?us-ascii?Q?E7pUvFaoelZyxl5zNCGLqORF5Iqsi2fX0/wdYQkghDAD62XwmboHRYMEPf7P?=
 =?us-ascii?Q?lZ7t8qr9ub7hLsnbd3khSeAeeRVD+79TfI2rOuMLEgSj5cPAAwKnbKcl094W?=
 =?us-ascii?Q?3Uc/k7MGey29D4UjueSNpmMfinSGk14PU6BAflrMgcjtgMEHb+p0MuRBse8e?=
 =?us-ascii?Q?OY21vUULPaFxge7/oCTOTTasT7UQ2rAxIyI9FCBI9hSRHkYOJ5zULnYCeIhS?=
 =?us-ascii?Q?o2d0tdAbR/sm/LSRfskPsr44SqWHeaLIFp02sNPXjsmbQUwdgStUPSEFDxNk?=
 =?us-ascii?Q?GsVh13mrMtHyRsP27JWEQ00fHe2T9d0VKJAIIZODJPtqNgO+HcwxN7tK0R/v?=
 =?us-ascii?Q?DNDC6P1dznJWcv62R82J4GD8jgX9W4Mc31BItGN2PPEjaE6EWoFDAvDXZcmc?=
 =?us-ascii?Q?e3ttbjOUo7nkAJviClQy4Yvgz/I5i2TDdKAR6K0aNHgdWAM6NgfztSvRg4VN?=
 =?us-ascii?Q?3t/2UWLV62OJ8fPeXtEbx+xjjhgrqK5LkWaPMoH+adAE5ybiziYUdw/w+3Rx?=
 =?us-ascii?Q?Kplcc/8W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309688d6-c9cd-462e-081d-08d8c1c339be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 06:25:50.6942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qogAhLLH1+UsdaMlbfE0kvesNlcE5eY6wTsoWkUWrqUHn4m6aP8t9UK42Holvr+hXkgpzdgiCDC0u12NyJYGFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
v6->v7:
* No change.

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
