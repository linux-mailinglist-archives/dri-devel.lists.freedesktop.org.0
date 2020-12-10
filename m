Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904252D555C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2896EA44;
	Thu, 10 Dec 2020 08:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159BA6E3DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5Q6NKa/7VjCYEVPLeZK64PMql5tVOV9HQdwIgsuIhatPPp0+UFUMWbX7V+HqercFndhuJ79j1l6MpubTnMmOxGexJkER4rUmy9jRqBQ4Mj8om7ImRQIG+xmElXn8V09mrUaCe1qLUJ+NGsHDi541W3chrhAlV90xTbENFJdxUTGylsK9vojjz6jiO1jxHFgshHkaDjaCeGlZy1zwZwAXUpKid9pI0w1TCKsuIW827JERN3yxn+6OXi6Puw9mK0lxt8vDzalp+vLUJN9eFvmc6sGp3NUx8hEYMrKBUCptTbjCwiY3h+ZVvBvTdXfs1XvD2YDcHJF15+0VQHAeq5Z6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT8Nv3irGjaUevvZp3uW4VD8/wtm/+1tmoRy3CCfRb8=;
 b=aMapF2qcky/yC4Td5uTUFLZqnNthI43CiQ14wL9eoAzjBWdeo5RpLsm7pGtwxcPf44O3JTbX4hbekG/o3J8h6yqTf9W7Ptk5J5sYVkA0cFOcIvKRdrVLDjXEOHDVW7BhdRh374ufPiB+V1soQmUcJ/llUrzlt1R6Z4r1kpllgMI3C9yheLkeAchKWPpufInpTpA+oWkPUJ65vIeDuZQrQ2OeQYu7zYljNBOmEDg78ZBwq86T5zbVXfoNq8gyWDSdLnvLZ3fjzAjg9ZwKnFSbeOOJKO/JnNnPY/llx3bzYw5SJ1qg60ZqQfP4bhnTYCrglgwaFZQSjRKMJaKkl2XmfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT8Nv3irGjaUevvZp3uW4VD8/wtm/+1tmoRy3CCfRb8=;
 b=cwEanuSZQExg8CX/232qewcVe/TJRNovFlxkkFi2rTkwmyZyZRA9A691as6Wx+TvkWsGac9sCUtg1Jv94K32g1p3lKg858PtWndFC44rsv/mntRb2HDDdolh5MoNG/rMZW7tFh04raqJW5SpNGYKXOXvDY/NjmPqmvP+OVoU98Q=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5454.eurprd04.prod.outlook.com (2603:10a6:803:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 05:36:17 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 05:36:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Thu, 10 Dec 2020 13:27:28 +0800
Message-Id: <1607578052-4316-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
References: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 05:36:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4eeabd7-4816-470c-0ab6-08d89ccd844e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5454:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB54547BAE21F0F494486C75B798CB0@VI1PR04MB5454.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NDMI2jHtmW5/H6iJOJwbRP9KqLnc277ucI/buyATtkRA8eEZfrSX/mLRwQQIF1Z5dzxrTieyw81gSVHpb8KAjTH28q+JGd2CzPynEAdzWLPxwH+ezu2Bkq6ZfQQHfvIV7vd178F4rj16msU2W8I3AMM39TJZi6CNGIvuH6JVKBienRHiAQyTp+CtDUGAHzWqBmJdTn07cum3hX0vSNU9aWpFBsQa165pA70GZBWnnN6NKaWpRYUfTdC6mvWtswdDCUEE1KXBYmiBjPq9WHkxetNn2z3Dw7/y57rzzJEcaf/85do9+wgeb5dxwVUiTcbPnV23LMVsLH4/UWAM4KxEI+mSQH0HW4XXdamVjW2lQOUkBNkWg7YRhmoYQIRCIIIBJBbf2oEWnBLUMYkjsdJFzkNEGCCvt5K+uELLislQ/LT4IPXhp4WQJN0mbpbQ7dwQ2ScI0ztdPwrg8hrDKpA4HAh0stHh+o7eZ5I3kyZMKCBgwaQu5v1+TggcdesDmxis
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(7416002)(6512007)(34490700003)(52116002)(83380400001)(8936002)(8676002)(6666004)(966005)(66476007)(66946007)(66556008)(6486002)(508600001)(2906002)(2616005)(69590400008)(956004)(86362001)(4326008)(186003)(5660300002)(6506007)(26005)(36756003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fs+4pUTnTY8YnqLD4hSmk3EVk5HLaqD7hQfiEEExDFEOICXcA7YAjkMHw9jD?=
 =?us-ascii?Q?8cv7wQy6BDrzrOxMOVURbVHHpor9MTh+AAxGTwqiKAlfDyFNcbc1E2kxb2UR?=
 =?us-ascii?Q?nwhzSAvHc0k3KKbf2Q8bzqxZ1yPl4XuWjfWSkVlKwnUm01cLHWaNrkY2sO65?=
 =?us-ascii?Q?RK1ZLJLDBO4Wy2qeG1uq5Yx2MjbKIQZpZkaBUsFkv9nwLmFou0P1QT02FMzi?=
 =?us-ascii?Q?P8GizwqV+RSylbHdIvN5430bLXwOtondyLkJA5REqqBunE/CG2iuhJdppm25?=
 =?us-ascii?Q?uOGmz0vt/VD1A41Q8A2Adee8vFZ2hU2tUtRu9KM6YGBdhbkhsk0JVcRt0RyB?=
 =?us-ascii?Q?lw2nVl7TSIc2pSzPgpz8KT9v+hPF8X+DnL9hDHgp0cnCl7aNvEF75DQkHL3z?=
 =?us-ascii?Q?Z/fErI1Uphh8WcuZVFnFt/6aSwcJv1EfhlaqrRH+YOddYlfB+QAH7d00/Hrp?=
 =?us-ascii?Q?UaIY7jxVf42v4T76xJHyjcg2+X3MuKHfy5Hqp0pwT4bzmnxfxsICWfZVANbk?=
 =?us-ascii?Q?jJ4Yy3YJTIoqKiyV8ogrmhUnN6ZZUgQ+7+rBy1rQAohuBTv2DSFEzThAZoeg?=
 =?us-ascii?Q?b9l5tmmnX9HLmq1ZB/h9+mxBdydm/HLDuwdyCpQFYVBkxpNYMZKtJmxPx5wB?=
 =?us-ascii?Q?uFQjesatsGLrNFOMxd852YezOazmHtl+vReWblDWe7Z4HI6TAXACVQx0nRNV?=
 =?us-ascii?Q?FQ7GUGKpA2LDkGGfoKF3RB4yEaXsuwjuCrxoLlVTCVGozJ/AaIHDIeamgYkK?=
 =?us-ascii?Q?DJo9sd/EAQ8TX+W91fUWyIIs8HClnQTLQFGSoLLdaFEtIfZSg+YGlcanHQVB?=
 =?us-ascii?Q?k7knWdGboqYUyBR+nkx2t5HHPBvMMXgFIAxFqxuVGS7vaT7XqRautDAMT909?=
 =?us-ascii?Q?qHDzN079Lu9rESH2kRAGVX7zAVCXhTtG1FgR+rhBinvGYLveJvzeZFlN0nU2?=
 =?us-ascii?Q?vuteMKP4NFlmCQ9SB09Ku+gRgGAnhUFx2d6oWN2c+CDP5rg+hy9jO2hn2CX5?=
 =?us-ascii?Q?Mdew?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 05:36:17.3401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: a4eeabd7-4816-470c-0ab6-08d89ccd844e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ES2lzcbP6N3SaaUm2TGu0kmL/oB7nm8ukQ+VQvV1O4UMeCtIWAcLa6nMctQHJZbS4ZvGkZzKBjDwSBS3i7nEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5454
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

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
