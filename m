Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5412B8EC5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114F489B01;
	Thu, 19 Nov 2020 09:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BB989B01
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAmJAiJiooPqRoEw8jpl1MzWTwYsiwegDGFAGcurWlnHDVsqw7HUswg/YLNh4rrrZVwhJSBo2y1ooDHo5EHQP9NTN7IbrDmdQOjVY57zjkIEyZYiOkiacDIxHg6GGS+8L6rh5osEpYyEX51JVAf2jdhhLX/GSIIHUF+1Q5uIN8LXgN8tPWT8j20EY4RaW5JpJW40rso8//dA+74P1SVICaAuX7ThtPZH8UhSUXXxvTMZzVbL8TpVHMehv3WqpcaldXBY6ZTU5lbqeiFwLTU8jkzx4Ikg+z5ZbdtlCVsPKzgnHUP9OG7RsB/dsWDlfqV1UZ8JXcZ0L8j2dtE2dcPP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btHT4xybhoIyZ8WeSPesHktEi2f+CT02Am91ZSxuq9I=;
 b=THfELW8WPI4DeqCpOQY/pHUTDpQjpt5NVeYwHjNSQbNbZpGkrJkLi6UxbCSKPwvgIMI/XkS/syscp887ypSxw7ZXp6Q+hkQASlN4QFWPPl96q9vzjQ23x6EusXz26ueSYA3kmsSOU8D1Sa9MdQzeYmBw0Ad3QqiXPUprSjsWhHXmp4oK1VCGNZiq7SbRZNCKJBnFmAAvtcJyHBDW5Nuje/vyrtycHPYBucpAVgBMh2CSrESI9/yOFc+emWyVKr6ZFsjAZoWOvrI0QEWsG3N2G+iCsRGeDuzHxFvFE0BROJb9H61EJWyjHYDOUhMtCsJwGUzouBfAQPkQL0Xdog3AUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btHT4xybhoIyZ8WeSPesHktEi2f+CT02Am91ZSxuq9I=;
 b=Cjrw5FFZ6LtuGChotQ9VMhQpUAWIEvG0rKuEhFEsesm5YQ05PGkJ5gYG2SjMyX3y1brN2w2yPN6ARnChzJcBdqy1ezJnhfNd2s8nJ2efNDpDKodMQ9ul9LTprS4x3NlVHFizlvTnlIPDYRfG6P1Cbbnq/ReZ+hjEwtI6vAPPdQs=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 09:29:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Thu, 19 Nov 2020 17:22:20 +0800
Message-Id: <1605777745-23625-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c585d003-549d-4963-1ee7-08d88c6da21a
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB297311BC97533052B0601B1F98E00@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGO65FXamXwwLvZbdZLQFc4X2iGGJluDkU9iv/xXbc4/02J5Fm4xN8deZyQUZbXDSuHGtZS0ihb91VwY4ZBhW7GsHvDWeLbnFBGeodK3H7dWHqsPGD8uwh3DAvZLEFxjRsSNx6l7Y8WXxlB0HhvLurK53WeFBf/P1idbbzKLYcFU8B5FkBWKU9RNntUXyDS44vtOqjNV5ijrt6lG9I6Zi4Wzq54Ax+ZspuxcqSU/WNaO0ivM4dOCfKc9FSZ1bJ0GJxJnHWOwj27z4+SAV4PBH72A9AIMRmYABsOIyaRu3T4jUinJevpwbZ39Ega/S20il46uHSbJVgF4bThVQthxqRg14aAihZPBiaMV4ofDDfndLQ2goAjxAZZAnFkVZty4uS2ebzXW3pOpav8jX2x2LeCRMG81xltm7gYQ3+Elt9aDV9SctL+Sx7OzDpXLweqAg7Z15HijuaS54eW2p9c6qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(6512007)(26005)(16526019)(186003)(956004)(86362001)(5660300002)(66476007)(6486002)(66556008)(52116002)(36756003)(316002)(6506007)(66946007)(8936002)(966005)(478600001)(4326008)(7416002)(6666004)(8676002)(69590400008)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tlS+6YF/kB0mRyZUOc8eFlHol86jPwWtrnN5vH3WCvzj4L+hHMxhkokDJlH2CnscrWvQ1QHA1lIUhCiB/pAj3nXad/qDnS49KOomG0Tomax5noIjEfxhBWnJevn1P9AOvvob4IHFTPaaL7/0e9caqNDH8wuQ3bm8R32VWDlXOGb441Db+Z/abIeKK15X71Z1hoR623nbcoBCSsn/gfPP+6jjRxVhi8vv0sqPN6KrmGGANqL/fPOBFLmWp9F9COWsFmDG1gKRowD8v6U8LhRow8+n9LfAnnjfJFe2ieL9MrP1pFu7pq1LUlomiuhU/fcuz8PxltAMCLoLujj6Sc82t0t1UhoVsNj6cRV4nAtjdclMSVDcWWbZXEMi4303pcWfzelz/D21pNs11ikmZgHvlokycbIVCtUmq2JOHba5yGlPQGZzYrTWA7SK+s/ljshg3enLs5KJfjVNyQL2+kKX71Vrr+vHD052LMEMTT0qf6dJMs617PbFbWBf38C0YY+jJsubj0K1LY19FG1bVQiw7KfowQSHgbX8s04KOveVrn3SvxKdTvS4W0WITA9w7FCRn7k9L+6bU0WSUO5UUec+rflJEF/9L7dMIe3UoUL7uHc9TWjRgUHnbxNXIr8Teoan+G0OlSqsqwBLMvS8bRIiNw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c585d003-549d-4963-1ee7-08d88c6da21a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:37.3808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8emuzTT4AY/jKSZS4tBQniV5Psvn/nL9FKmcMMOYL6r1CQlcpxI6uT7VqwRaWEKTg/nDJcpqEz9cs8R8H36EaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
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
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 00000000..2827dbd
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
+    oneOf:
+      - const: fsl,imx8qxp-dpr-channel
+      - const: fsl,imx8qm-dpr-channel
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
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&dc0_lpcg IMX_DC0_LPCG_DPR1_APB_CLK>,
+                 <&dc0_lpcg IMX_DC0_LPCG_DPR1_B_CLK>,
+                 <&dc0_lpcg IMX_DC0_LPCG_RTRAM1_CLK>;
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
