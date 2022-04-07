Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1154F7B11
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE94210E6A9;
	Thu,  7 Apr 2022 09:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1FD10E6A9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XznOxx43h2ivLZjiYZNUvhewM6oMazOfKSO+9HxHbT0QwrA7VRmbuoB2dZXAB8LvYa+Yz4nqwwemeIfmEv/EwObYG9HJRAkdN6193d9NHaXEcNOeRjHrvWwyF7bcN4Gzw6p4eREfpNXxoNStKVwc3bmdAWMCKd/smwZ264dSXVpZPFwT2MoTaaes35t5KUkGoWmRdWispr5Fuh2HkqNF+8zcskST23VLXZTFUA8hUeIBGpq6EDc+PBFYHVQ/fPhQaWXBpW4que02nEShL+c3Ncf4bLEfA+GWm2M7RZLEcNl8CdKAAN5X0R5+cRXoRLeWol/zDyi3rKE7zILXANN58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSe7scFl7aRnmwd49/XGajUAPGpTx4qCD52wLlMcyoQ=;
 b=U0GlTTcXI8qiXsk5X5DpbEhwZ9+Cy82+ywfTHCGpRNJNsCB5QS+NXetInxl8gJVznu9MLHn8ai01BUiBwJaB0dDcz2KYaXkbBK2URLEYKqRwbfhbBdILIFURD3W95xFoCuNB+pAY48Yj3S6YF4rg4IgjrpowDE6CVhG5AYMRzN0sWZ9LQWMxZBz5kbNPMwgvbIZ0jpAckmXRQA1wVp9/xC68AkfL8t1KZUCwPSFS0CvuCRhu0Ci7YhdFeRGReRePTr6WTthaFz6t9sE8bj1znjvxym4ZkDW1UN1YWqsQqvcRo03y9TKTdXDtISAIgvN3Q1MPHf/NoSmh8XV3QMt8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSe7scFl7aRnmwd49/XGajUAPGpTx4qCD52wLlMcyoQ=;
 b=fjq5tTdDkNWRXMjhexeVDv7OUSKnmz7pbMzB4e/TJ5ezOILPzi5twjOaS4W+RNRz6e0uoP+YT3ST9bIzxfmawLdb5LbyWKmafoQk8kI5GADy0jurXKK960MIYplVG3SvrUJQKrHBvvCd3hoaDNleLFhpZ51rX8/5Gep25kMObLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Thu,  7 Apr 2022 17:11:52 +0800
Message-Id: <20220407091156.1211923-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407091156.1211923-1-victor.liu@nxp.com>
References: <20220407091156.1211923-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a074a09e-3592-4f87-3ef0-08da187676e1
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB934486E24F70FF03F2CF3C2398E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwEN2sj86GnnThYKMXfmLdLJA35tnhddBcAaYKcAowfU24JiNWlZH/frt60l1ht1CEYv8+jyRL9E0Crkonp6tbSoIwHhTNu/WJ0b398mSN+D7r0ALUIDy5IhKdK2BaMD9lOlXR/F+KkgJsZZ439/vENbHRkyWMCe4T0heC7H0Hd5Mb8h9qcivCvfbcWpxtJyQFtMS1O6n73jlLKlN80rKmv/gTvcf6OhjiBm1cT5iKJ4HaR6g99a6xh8eJFmYn0vM3knor/Q+hQEx1Gih+gAx4trpua92c8wqy7aOTuSdWJiiJ3HaK+6FZpmTB3GJSJeDVtNoXOjsC4u2jwbaeX7OQ+h+J6We0eAmKZErZBK3kcbqcmML1IrwVtR/Z0T0c7BMtzHsTp+5U6OwOhSlpVen20/XxTumhmgz3AzwXLNV7JwwVx/YL26U4gJp++iMbwxtQYZjdbYz1Q0W5ht6mBaN8alc0fH0nbmRlNmw9WVb9m6xhNhZcEyEy/eUpXqIp32kamXAXW0F+2xszXMhtfSUjiWTZwkjkeBR3ywHmBq2036auIwPk72nF0TZcJeyoxl0QMgstlrx8fTA1cYYsfcanbwrBp3WoRh5Qg2et0Wgv5bZuY+q26HD0jz4C8p2O64b1I3REORK9r6l2BkZP1rLD4sxJJFZzb8A4t5Nuc1eDpBiboKuWSLJtBwzeFjwgfDAhQ7lXoXpPMUbnRmiDJMUg5VEImuFR+Q5QEzhvT20s5eAVFEUQWGzmm84hY4iF/zpA2rF+e5qA+GLr/M4lJy8pqboFfpgmCgSqYUuB+56/rKv08VHK31DKJ0HPhjqM3Xau4SXqwEbhbWU/ym0LK7vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6666004)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(966005)(6512007)(7416002)(6506007)(2616005)(83380400001)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zNol7pxZag2KC7W2IsxFGvLYLBFuzjsK7QQpvSq64W0Y8bVkELzoaoTF4N4w?=
 =?us-ascii?Q?Qf7Etkq4LaVcFCV21otnlojK9Y4eIh1nFYmQ9/PVF8LNBdA4sJr/plc4Y/yd?=
 =?us-ascii?Q?kejmTu5xrhNoZQh1Jz+DTEf7ol1SAfOzTfT6e+Pv068NtwJRszLxwePpff69?=
 =?us-ascii?Q?NKIryRuodwC6SgWovN/NP8EVzp8qXSTfSKD3aCUwzRvoeUC7PibfGqJmZlkC?=
 =?us-ascii?Q?pgX2IbpYcLMFBCgDnB4I8fKi7y9RUpdMRvHTOkrDkCbv1lVIyZJ5IqwEPd7c?=
 =?us-ascii?Q?OHek6iSdkUQOe78ubhngUjxlGwFc44LntKlN3U1qalQNjH4oN3OUPkgDkgPW?=
 =?us-ascii?Q?ji1j4Y2ZSTlZFd9NYw1ZaY1Gj8OD+s8xQ3I0GZslp4FSJNShFGtY3dPnfKCb?=
 =?us-ascii?Q?NpdKs2HfTyD4scoOFB5JenGT3OpWcij3ON1MB4BNUJJG4CQmK37eRRii5fXM?=
 =?us-ascii?Q?xh6Czzm/m9odNJjhQknHGWo4jINaDsQVstvVpiYnNYfAgzMe7L4UWMHf3b1g?=
 =?us-ascii?Q?6K6oDN5ae4HitJE1UHD1B98h2Z0SGH2Z9Tzxt4TPtWPdwbd8lt+kafTi3G7I?=
 =?us-ascii?Q?fuwu2tqjZFDxS/DivuhOBYtlgh940pkPoYA8og7IRzaav7JHR+zhGdmchaSs?=
 =?us-ascii?Q?OSaiDLeJ+BgC6s2m/mgogqoi7+Ve6dd8EFSd/2N/qYrEnPAoluUxbIires9b?=
 =?us-ascii?Q?oq8gW/pGN+y7wJF1gpcqpi8djCIwJ2fT48lMVHzUh2L1GXeLu/k0KGE3JlM5?=
 =?us-ascii?Q?pRkg7JTi0sJRuvAATV7++4Qx9tB/37w3DHxjM8qFTZZpyaVKOIA5UPSUfaID?=
 =?us-ascii?Q?e2cxVKvqmy9E6LDIZQtg93OkhlyNGeqUSfVf9cvHDRrDXimk0kH2i6FQl7wp?=
 =?us-ascii?Q?Z7gFbTrAKFbu++pPpZHdkepZIrBJxfCnhLhAy66DAH/UVxdldRGNGbMjWEvE?=
 =?us-ascii?Q?EevTyLWz3QJ0fCh7riOVyGX3lpEFajOsjO3ffkyvCEnyU+0KpGQKN+ffnG/B?=
 =?us-ascii?Q?dFsePyB0jpxcsIdve2gWhb/hWLomfj4S+tJf5TQSaUoR7eJmFrbYTkCiPFFG?=
 =?us-ascii?Q?9+WNgIRuSHGAcpsNNk7NnGGcb9qYIKRFma8SjbfSHGZcRJN7BpETjecoAo86?=
 =?us-ascii?Q?OEFqdvRnAdMh6gE7gTK7M6NAMea/qzCxIQLtmaJKWv4XspXlarZ8aaH4U/9f?=
 =?us-ascii?Q?y5ba3ZwZI279sr7j3HC3kXDq986VgoWIdAGM+7QWresu4R1UMdGXH6iX237j?=
 =?us-ascii?Q?RwKI+qaMcMnLeeRCk2aCazFAW0/oaLB9Xccp00RjgempOwUtLDSvS17wWNNL?=
 =?us-ascii?Q?HY+7dPT/v5VDD78uHL2ou7T8VyB/cQnN7lqQ6w5mtVC9aGB1+ucpiMmzO4Xz?=
 =?us-ascii?Q?y19eAYs0sXR9gkTxnKDfs/hXKzgmHI2j5AV/rMiYv1YojcR/mkhXoeudaRqq?=
 =?us-ascii?Q?4V2qKHwoH6yn1d/0lhWafP0YFoDXTCUsGlEHxFh3WiZmL13MhCMBtG09FTAn?=
 =?us-ascii?Q?brwYzc72oERnH66Ih3I0QQ5tS5IVtNEjVHCesqIZmud2T9P4cFi4rmrjewWh?=
 =?us-ascii?Q?LvZibDp6WG2KkPRygntGl5gDk6xduMTj6t/60IuwFXKBG1GUx8RUHLMYJZfX?=
 =?us-ascii?Q?oMTpm3Y3IPchPV7C+TPt2l7T8d0VUOZD+YMFqrUrvQCqzdf0zaej/t1qlUoa?=
 =?us-ascii?Q?Mv//lNWjhyQBWtse4vbxAokFiNv68tSiIL46WURVUQbROHNYrUBuujvi7gOb?=
 =?us-ascii?Q?mvDqjyCWWA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a074a09e-3592-4f87-3ef0-08da187676e1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:30.8839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLOJyh3Up3zOYVOf8dwWULNWnk9U0cwKJmEYXfPkU/518QT5VF8/oqDe4owtMOm+y4zdM5WMKXcUM5631/tjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
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
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com, krzk+dt@kernel.org, guido.gunther@puri.sm,
 shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9->v10:
* No change.

v8->v9:
* No change.

v7->v8:
* No change.

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
2.25.1

