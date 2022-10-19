Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D286037C5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C789A10F09A;
	Wed, 19 Oct 2022 02:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B171B10F09C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3LUC2tO6FwEpkN02Yq1LIRFBv10Ihr9Ln8cy2QfIh9r1so7cwK45nj50M1bAlNyjEiIeI1aWI16thbjgSNI5a4trD1E9JyEJCgtoFUEJD5wNU/h8cf8JEByJF0SDv8Rnb0gtG+tzD9YRW4Bj9FzRTvaWzFO/05Kx7xsVgP7NVBDfVBWtPWA8Pq7lCEBmUnfLnEmPbPPCcjj96cxmZfYXxQbNDXm+nY4AsheE9tYmk89/ksqfU4ns3HptlNa474tygEu5CtAcMkapOI5x5YZjbbaAqEPrXTxLoe+i0QissxyzYiDneMktoTAGr164AKeeFi0JCJmt4p3po2nCv/9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0tP0zjg/xcQxBan1+pUhluPpoCUgnZ/YncIu8mKfcM=;
 b=THqhXP7ssz8qFCrOLfVNWRuP+LJJE/xL4eHtmjz7SWOp1HtGFlzKsGUCq13BWCiQzX9Qk8lrpv0GaPRnQVBIdaUX2g2cKdKhO8itn3tidCydjumZKEXd5p7AXe1wzzCTDVuxX5JVokTDTP+XrrJFqXzPa7upWK3YdRelrto3iaSVCH5czNRm4KwQf7tgYAfibU1CBMdVdlvTdtzpwcpH9WyRA1CbyrvVdVLoVpTUmA4IW5rd4pnSwWfiISeXZ4TGO6loGO1o9DHyvlta7FTjwJDVHDEVuWImFC509IsQpWSD1lZSjjq1yFK5WvbZpOD8wNZPH5Ol78q5WMSO9sjANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0tP0zjg/xcQxBan1+pUhluPpoCUgnZ/YncIu8mKfcM=;
 b=qUMKv6AqXwDy3HrAle6I38LXR6TwxKcUVNDoKgm6V4ZNj+yvSuIUUmzYLyzoAxCdeUYj4T9K7fYmPggKc8E9xVCA+ZVvDnFCXlcOD0n8wfq+S3bPpLiG1el2IY6YDWozvpyY4+WQT0+xbd3w7d2VUNo5eEVp/ZlDojlOY143GZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 02:01:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:01:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Wed, 19 Oct 2022 10:02:22 +0800
Message-Id: <20221019020226.2340782-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221019020226.2340782-1-victor.liu@nxp.com>
References: <20221019020226.2340782-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: c65faeee-8e57-4e32-2b86-08dab175d276
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oK0QKJ7XXm5VwsA+Y8SrQl1krivisEjMF2u+JukmozMt1o686pBLghkQ8TlVKCINkFzvQ6+ZvVEbBPT/NryxhttP3i4+Tyov6vnYXYDEtLX5V/XZ3YQVdgqrASiCs9M5qz4xYJpxs1wzYXQSAg75XrPga9itod6tceYTYLuZptebfCMmgRd52JnfQDgT8LNLDcIqO2Y4B+1LRch3pErEpLUuqBXUuifFTTMl+TzFyKfY+/2cqu7RfwX1R6KzlCtbOTHnBaJxTIPltVOz9dN/zPcU4dbvsZTCiSPXvLQnCj7xPxFjblyNZoS6SIdMb3ardyIgpA9JaXkhItViN7Spn+3BoXY5c94GWQ1yEjV/KWPzLeRMgDTmGdMP0RNdV2kq0vrLXkFloAIiP9gbnCq0lYiqFt+pBOuVGSEg2Gly0yHEW6N2CU86OGUq9GIhmtZ15ssCr2CWcWHoYJfumSTM55fGWVwMRRZGNmTKqmCQZxW7V5rkJvX71mx83SAUWAA6HGuMD8/48KZf/MA9BnB5vB2Ei2ZnxV30LX7zLAwjwajlUdg4YIPW70TEk8i3cKGfnkN/jh8IbFGmjM3lSQJ5kCHKJnYe5lafttnCz2sdk/jHN3RWaxm5oBx1ygBelAW+W/cYvhuUBpmEHkjMdIdJVuVYPHKaSfbmaXgUT82aXGIv6Yp1AOEtKOYR3tMTuzMM39iRjUihLHhLJlslobznqZczTBO9k01Dcgds8F/jg0J+SuBMnFijUsr7K3pAZzFqr5vcywKdAEMvHGZRvkDisEoeehQ6+izgiuORocW2rL6eMSsreMY+h48v6M7ZkDZ8zyG+xozaTvzxUjLyUOph5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(316002)(83380400001)(8936002)(6512007)(5660300002)(2906002)(2616005)(1076003)(7416002)(66946007)(66556008)(66476007)(8676002)(86362001)(186003)(52116002)(26005)(41300700001)(4326008)(36756003)(6506007)(38100700002)(38350700002)(6486002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZUltbS3QTxMUWq65Kf2MSPlBXMwKd141kebE8N0gkBei/wdYGqJWMJiXYxhU?=
 =?us-ascii?Q?nt/6foS3vbuGVM1Itm6IkHxFb6P5DEP0Oq4gt2UEILarExULlRTKQl0d5xad?=
 =?us-ascii?Q?mVv5BSlocmCZX4YLQMuqalGizgVwMvaawX1CFOW/r96K6532JdLe58mAWm37?=
 =?us-ascii?Q?OHLy8qlZidzxrIkwIuvmwwTPRQjidfWmZEsDfeQd2fFC/Kn7FIxfSDqUtNLJ?=
 =?us-ascii?Q?yH2WlR9ti2rseiGlaMLqCxNJs4PUL5t/7+spDrGvKKJFCBFfNesPMTiVQrUr?=
 =?us-ascii?Q?RFE9NvbS+6XNHD8SC9/dSrjPesS9kMZMyhFmAMgrs8WpDNdMC0Wum1aL7Fmb?=
 =?us-ascii?Q?s8wHLMmZkcqykPiKAcbVxsjzQAj1KfHev6e4njCm+XXsNyqgYPb7p5Y8eG1Z?=
 =?us-ascii?Q?HvJx19qVDvYrFTVc5UhwZrdSnKCSEVldEAmmkBJidc+kla0T94kDuxI6OpDH?=
 =?us-ascii?Q?u47WeBQDYIBDQbcrzIpCI0ZgJjOA3h4VIWZkseDqgOniwllzdandDRVa3yiW?=
 =?us-ascii?Q?jdaoJtO7bNYoNSbuL8ULhOhNdNfjimIRiITiZ4oLExJBl3P7FVYCrW7laQ2Q?=
 =?us-ascii?Q?vQ8cJMIuQ9zz3tNpapWIlAAqArYmOV51+uIWA0IqHF/qewO8PsdfPs08Cno2?=
 =?us-ascii?Q?32VzxmkcSPOExojRko3ml+B5gcS35AIY5CEKCsaz3Jyt+UnfxTpG2+qxDyP9?=
 =?us-ascii?Q?mMyOo03MzPXbJb5IKXefzbIvdLGNwQfpPFxu0QnM35rxXEK4Wdsuuovglp/G?=
 =?us-ascii?Q?S9dnP8WZdGmsANoLVlw28cPk6ccU8gZp3wqkEPm7au9Yrti2Zw41j76Qc9NZ?=
 =?us-ascii?Q?2oZVietVRdYLvA68m34zwIXQBF1+clft8ssfnBkcT9YysJWMA9IwVj+C3820?=
 =?us-ascii?Q?c+GUtitQ1pcbG+aXHI783Kaj9G0tAgIYKqDbmtMnRQ7po6aa1oQinA7UUtM2?=
 =?us-ascii?Q?1mpxsdHdotMMkHqiGOswmRXz2GREms1aiZgxxPILYUJ92QODB6LVmCk9eXV0?=
 =?us-ascii?Q?syWr31cCBWIh3sNzlMsrkl6Ipmmp6utLcrx6qG1Py5Jxd7wpS/Vr3F+DErjI?=
 =?us-ascii?Q?7U5NvGxi7Cylaf717STDJVmw3OBCI5gemyT6Py4+ggY4gKJUarkN6UkVJlEu?=
 =?us-ascii?Q?177FEL5LG6T8Bd4KiBjAqGIoJ1pSm//mkjrTksRWJkhrpOs+RsKsvwYrzfG5?=
 =?us-ascii?Q?s89hn+5qS2uqMw+wBN20wVWFw/wbX4Al7ArWKIajrY0+7/IiGKnOmHIySM8w?=
 =?us-ascii?Q?JsrFhZnb1kcNvV2BLgLnqB9W4PCOW1q5DlLWpUCi7pblT2XSr1yPhfuBxnBu?=
 =?us-ascii?Q?ezmGYDT/ShLX8eekmOmfG7yN/hWi9t0QspCYSv/ic5y6HUu+VRZ/VmAvnflT?=
 =?us-ascii?Q?dqghFb8pcDUHMB1LhKT3feIo0APd3cmr+oqUO9cVTP5dG3DAgSA2AymS+1/7?=
 =?us-ascii?Q?RaIyk5u9dMOBO6tKCM5SjEGFuu00pbhJmlTknIyQnqlIfcULfzQjpfB+aP4V?=
 =?us-ascii?Q?6Qcs9srIHf9i1+NEMdTq/gY/nlCGUVBZAKRhljkyeVK+PxLStJjl4FeBS4fG?=
 =?us-ascii?Q?cyGaF01eaVYJgATINYgDiYal0QcxELywotUUcT4V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65faeee-8e57-4e32-2b86-08dab175d276
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:01:22.9408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6duYFQl1nIBweiOS+GccSQCY7wd+pQgH5DBVP+CgIInNtFYufwGz98UN8D/raUaqjHbZCWldqVJCHB/1XB/eHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
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
v4->v13:
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

