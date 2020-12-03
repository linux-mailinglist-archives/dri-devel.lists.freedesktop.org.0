Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBF2CD0F1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4075A6E0CE;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20052.outbound.protection.outlook.com [40.107.2.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42C989D39
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 03:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6OH2R5m9QvFsPGeGjwHpjeEQI/PKEk0XXz381frQeIxz1uXk1SWuMpgmF1izw4smrmGfB2bk469SlzFF7uJAwLOmFb0sQW1evjdZtfyxeOLRZY49UT8F5DLgV1cbo0R/OAfpT9GcDFLimVU2Yd1LaBm6nE/bPOTgE5soApaBjhoXeO1LneVAyIPQTBA4uZudKt96jRIroW/Y1pf8e8/p9IHuv6MFsIqvZjRKRgaZzrwrCrA+j41M90HtAftRL2aUg45yQZpRBdCLlf0qRq/PevwTSA6z/+LsDxQPzdnzsGrMMDzWHQB6rv18Gc1NGyt8tOZv8AcS/qAYyiLe7WW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj9BTKKjUTXetnMXkFo+erJbeD33qvhmQQRPxfEt4AQ=;
 b=jEgFZf/UPMmTN8e7EYk0ii9a7ppT2S8NhOM5ctQozZwBwYFlsK8Kx8AdcWd/CVPy6D/9plhnVlORPvi9MwaWtAhDoUhKYfsZJGcLWlcMX9prT9rZ8IAvM8wHq3kcWTIYqN0j+hOScBAjHeebs3+mfqKmQWXakSm8FQCP1EketmSLcydPQNHJ8MZSg5Q9dGm3hcZrML6vBXCciCLpNWp0XGAKSA6iHreIn0pn4KZSxZ+UJ4VXEkN3Ja8vMVDJV2ZhudAHT62C+mpfvP8GC6IvITT+psFe6lzPNclxYBem9BTyD2E8mdwZfL1fR4DMvS9zGzY89rsrMGP0OmusTWA8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj9BTKKjUTXetnMXkFo+erJbeD33qvhmQQRPxfEt4AQ=;
 b=YW66SKNjaUoBHqf1BTP7ogP70uIgH8lGUNgBmK6K50nSHCMOPMWwqlsn20/bZr5pzcnIsfGsVUN49JewIpXkZGJqnJ3VmgMtOrezcALCojaKDpVg7nItMm09V9SCGk3NbN7Gl4uD/RKIxI4LLe2OOXQzNEWj2amqkOOtUfDFR9A=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2879.eurprd04.prod.outlook.com (2603:10a6:800:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 03:14:32 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 03:14:32 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel
 binding
Date: Thu,  3 Dec 2020 11:06:28 +0800
Message-Id: <1606964791-24927-4-git-send-email-victor.liu@nxp.com>
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
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:14:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ba44c07-bdbc-4007-2f3a-08d897398dab
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28793DAF8C2B1DE6C5947A8E98F20@VI1PR0402MB2879.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHkT6T8AmlrL6GkdrFo2vZvZ9NRo+5TL7/ZN/Mzz2GcDrWDZNnijBIHGdyhYlAZTDgPjihM1rr6GBIMsmESxZjSe0LlqhGxAVqLOEzGn/d3KvTYQkS6BpuCMgu3VfzMpBFR9zhXJjYTZsFEgMRRb01hRMHlGrfktt/LqIInFbCU5b5V3GHfUorzgFeY6WmifppkYztx9Jv90kKdPWsTgObHPSJY8gm5t0h7jBZl1HLsWgPUUOlhILXPjqEoGtAPzxlB2RH23stUXX3X+2gG5ejJaaGhGI/OogtDQFvu+2eeUYtqggXkFjLLrHj7ujk9TcdZAS63DfX9Qe1M11381Sdd1DikWQvCf5f6/aeKZYNTwmVnXV45DsXB/azIwMaIbBZICQInI4w1E08MFlWdn8vyFUcwUJ6EZER2ZELfaY4GGSVyT6htJwC9BpmSFyQT0KBiq0UWxfOBfzPuzpdB9Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(8936002)(4326008)(186003)(66476007)(66556008)(5660300002)(26005)(478600001)(7416002)(6486002)(956004)(2906002)(6512007)(316002)(2616005)(66946007)(8676002)(69590400008)(86362001)(83380400001)(6506007)(52116002)(966005)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DgwmKDhUzJUfPuCGeUjaEn2o3K9VNx/QbfrE7bD8XDT5M33E61YPH1p3ex6E?=
 =?us-ascii?Q?UcnT5VloXsPo3zMxgqEZ52dC1vdUkcWnC0Tq5lNtdZ4sWVe+2bKILUtp34AK?=
 =?us-ascii?Q?iOmdrVXwoGINxLe/mOOgmMBoYrsd2dZ13U937mnwYRcAE5ssuJZGNoFhom+f?=
 =?us-ascii?Q?wLz7rBbKqPWMY7WUXcW76/cwyeuETripzKFVBZQvk1nr0AE9vMyR59FWbm3o?=
 =?us-ascii?Q?+zDnD3ygFTZEXenRWuMvNARWzQhtKQfSjz8IOiAV738whwWPBIeL5BQdu3wz?=
 =?us-ascii?Q?3cq20moDhbdCDD/V3VLuL61pCJWLv17+4jts57KqVp72n+4OAzW9AXhbFgtd?=
 =?us-ascii?Q?HN1yH4GcMLwopBkzL0mkBA8s62+HQC7IdXOlkMF11fNLblBR7Y40HdhStPgB?=
 =?us-ascii?Q?lDhmFtYZp/AMR61J/z3i7Ok9ABbWtwrwa90SEBwTmgmuH++okIlrPDyfyy5t?=
 =?us-ascii?Q?FKdluWTiLQeSGlZQWLn0v1Yx2HOzDZ9pkXBMyCPbwcchEKNn2Rm43AE9JmKI?=
 =?us-ascii?Q?UuJ549hQe555pFswoCulbrxqRfUMyg4dpcCFZ8flrcIPYI+NabiOL9GmqlEZ?=
 =?us-ascii?Q?NBoSSewQa8Jqkng6cW+ubfCRm0pNfI1tkIwYISQs1324PvYaZofu44+k9UE4?=
 =?us-ascii?Q?5rLUM5R1LBT+LpMERFOg3Ah8JJ1AYgrRVcmDNtWpImAEi5Mayu9zTa0QouKM?=
 =?us-ascii?Q?Mq+fCUZu38+Fk0PecPP9N6+QT+UcGwyDQyJMu29DbAkQars4NrAYsAbHK8HH?=
 =?us-ascii?Q?G4gm5wvTZFTXM9MkoC8KPhtQhz98LLQn2IU0kKpShb0xCEZvtAJnFXPmB4N2?=
 =?us-ascii?Q?H31Ex1egX44Wg4S62HuHU80nv2D3IfHtY+J6Pu9CusfCIULff16vE3Ef+m7g?=
 =?us-ascii?Q?q9EWjtwcjpjc8p7BTWpWjcZT/luultQS4VkYS4BZJGls0EG4z3thuGbatem8?=
 =?us-ascii?Q?JVoTwE9m/2ciqFj/la7XXEeqZcsZD2zg+2Vf1co9Nj1m9RrQLHeQ1ZE/PeXJ?=
 =?us-ascii?Q?uIM1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba44c07-bdbc-4007-2f3a-08d897398dab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:14:32.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLiXsg7Ojr5cpEtr/bkNALGzd/2QN9AXoGikgX20hwprHPPVGNly00vQtjob2Yejdb3deHBVeHv/TcxSuJ7NAQ==
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

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Note that this depends on the 'two cell binding' clock patch set which has
already landed in Shawn's i.MX clk/imx git branch.  Otherwise, imx8-lpcg.h
won't be found.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 00000000..91e9472
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
