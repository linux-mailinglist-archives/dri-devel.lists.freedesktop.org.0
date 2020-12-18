Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B22DDFF0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249C26E07F;
	Fri, 18 Dec 2020 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40077.outbound.protection.outlook.com [40.107.4.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF098894E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPFFCTNiQZCc3dWAGevRHaxUxWys7PGJVALrq65HgHBp83v+sOPjr2T0Wphpouo+ZW3YhKTipp+ECApK2b0DDkljAM/B71Q4k385uGW+N8cBDzEmfwC/seuKV0TyIpiyxYy01VljztMPfiTCrEe+fdOD70De1LQsiUMDEUpxyZEwmvCwUu/yz9bry5xPaigtWC8FMfnUquKcgEX3z1Pfzzb/pRYC0AmcSNY5+FFEUR6b0M80eeUw/oGRWB21lXJF5Il7JXqGJnwcN3pAs/BZTTWd9nmT9Vv4T+ydzgF6GF1og1tUBwW/1WLj8jyZo+Os3FvK2YL8RxbX1S1Fq1DFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NHk4+SC8LMffdhs95rmG7EYD8FhJskiq/bkKTIACgQ=;
 b=l4x5VhZY3kTA2UU+3w5h1YvrJ05ozOmnLeTJp+aR9qXFOscBElD2W6QGCfDtLGpCbVbBBUwJYHUJ/PoNQIaEFMGTZLjBup4J2TS1FuBpOMlWynXH2d/UVw0gzWiB06OL821cPtgAv0c24cijIugMRiGKbObsuMWUCGEcJnSjWMCdeyw+Lyt3OUSYrrXyqTjgL0PYm8gQ/kfrSlW/ErlfriUiSs4ka30k+FHAfc+/lAC1fe2RueigHi0BcAkn+gFqtY+gyf/0D/aodaBEb5y0k9D8Ott2x72hvqV6bIPzqL3ipL4tQTvq1yPoSign0hIvjxpMJE39GeRE2DcaH21qxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NHk4+SC8LMffdhs95rmG7EYD8FhJskiq/bkKTIACgQ=;
 b=on9mIzUuCxcseX1MF98tIX3AT7AjGYHSgBbIJ6S8Q4bXOMds3+i0gJD34R+edvmjsQEeVKq50T8SjM8IdP/rc2+EKi4zAjVyNp+IsgjJA257m9NGQGRiZDMBs4BQLFk4Wbyl5CiR0q4xbxNwSjsJGEvFB+9YHoIJnhWzDrKfbbg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 03:32:59 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 03:32:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Fri, 18 Dec 2020 11:23:50 +0800
Message-Id: <1608261833-24772-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
References: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0118.apcprd02.prod.outlook.com (2603:1096:4:92::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 03:32:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07758626-c198-4211-1f52-08d8a3059e20
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2816937885985593F42C2A5C98C30@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLxJJ0s44w6ZokzPIahmllYdpvFyTsuIvW0CYbbnpc2z7Y7pRI+xpak7V/cIKE+7anW08odgsUCWOJWcabQdAW0Yrv9Afv1dnLcbFJITfU7xApFPXSKY6x/oQ6Nzd366NNjLNBP2iNZO9to+pvlGR0FLvIp1a6Z5WXZEtVZqVi4Un6W1xymaT3dYTO4qD8gO7LbSlmQ+FOjjouLrdFzlJGQNI3xeFPqrt6ulTrDwBaK1sSKVFG25pMq0GmfU3Ah6u/42vxL7vOM94D6lfjQ/iAVGl10w6OQrJvNmQBeI4LmphBBOIIXII8g8JLzg8ApgdrDaeEMaJC7aEhCZU4lnh7fETLbX2eq/quExxZx7P55XeKWxhst9DRhJkmkSwpTXa9Afp8sJaY04Zm/ioIGdWcSfHIYM1tBm6Ii8BRN/TDrFdn4ahhteOwvqVZG9bVSA7X7fpsnfD2oAXKWOlzwzmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(52116002)(478600001)(5660300002)(6666004)(36756003)(316002)(2906002)(6506007)(4326008)(2616005)(66556008)(6486002)(966005)(6512007)(16526019)(83380400001)(69590400008)(66946007)(7416002)(8936002)(8676002)(86362001)(26005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VAKCD4Emda1L0G1vFqKmmnwLKfb2vXVDLCF08tWVzUC/Yf2j/+d9O936ZHWo?=
 =?us-ascii?Q?YzL6qz8SMEzoxWmW7UPmaoELAIB5mJnA32SKdmRitmKoJq/NigIH7VpfLBMa?=
 =?us-ascii?Q?Gj0UwjBwal13E+2AEWJf1na6G3orCH/59wHWBiMFOuhqhh+E+m+/rcFzjfId?=
 =?us-ascii?Q?HUURtw2KVdbOd+6/tShuz2MChmivGmztAl+olDFqxUEJhE+VqVGJsgQh2vMN?=
 =?us-ascii?Q?JIzfaJHKbAzP7AOHol2MBsJfMJK1hJqph+VKbDpm5UtAljq6B40WP2Xtb1Jc?=
 =?us-ascii?Q?eHUcW+l1Nu6USiFhSHZ476J6cEWKMfN36EtwVdxKfviRL1zTmW7LnchB4at6?=
 =?us-ascii?Q?3wZV3zEzsB9iti8netaJCdZYMBal0Bm8R0rf3UGlte3yWmw4FPPVfh4YXKl/?=
 =?us-ascii?Q?NeLpuxI9mzFC5xU+qiJoHVWMtC2t02+EVsnMgynFCs58ERyep8W7qJftfs9R?=
 =?us-ascii?Q?slge7GKIjF+zZf7j3dZ/S6WbF/PagI3Wf55lNF6OHgRrpZkX7sOBQ3P/PSa6?=
 =?us-ascii?Q?opTXX/bRct0ljb0pCPKXgLcI/MdzADgeyHI0PF/WrNIRqb4cXiZ8KDRL1vhP?=
 =?us-ascii?Q?esidTsBDakg7Yic0aw0hAwRbScJAgP77rG0ubnJo5XtzzmTuoCHmJXCyn0Y4?=
 =?us-ascii?Q?17sh39dEakZxRDrqar8xdGtnwHydmfZcUXsiILY46Ppbxug5rx/tiaF8h78C?=
 =?us-ascii?Q?KQ8OmjSWuNs4o+z7yto24ekTc2FAZPX+isD54I1pHQQITtADceF947XHIb1d?=
 =?us-ascii?Q?Dq7uAH1pNZQy7atd8NTFYfVzWugplz41ap6uYpPEdRoku4nWkDosSf97DOYW?=
 =?us-ascii?Q?5S5DdpH9WZbCxaf5dx24ZAtKEIwRO4BbPIKzOzqCXD7BbKzgIzJoSyHS8RUJ?=
 =?us-ascii?Q?eWtp03D9nF/4Bwi0QQ90OTcmYH0JPXpcoeHcDFOqkG6vgb4P/DL8fWJJuLik?=
 =?us-ascii?Q?FpkT1a6R+IhnoyDqcKXHhxNJqw71T3yVi1wwSZ61jDhgxwwxZhP2pI6TlGdD?=
 =?us-ascii?Q?kfwa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 03:32:59.4465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 07758626-c198-4211-1f52-08d8a3059e20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCZeo3jlFsaAWuPI2ZJ38/o9vJ7hUPCvtOBneWE2BDeM5tt+OnBf+OcCnNft5ZVGYkYWD1PsWdiNpbXVMJvPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:32:02 +0000
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
