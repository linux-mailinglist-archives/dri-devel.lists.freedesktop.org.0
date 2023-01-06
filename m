Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7543965FB06
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 06:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2B010E075;
	Fri,  6 Jan 2023 05:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061.outbound.protection.outlook.com [40.107.103.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EC110E151
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 05:50:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrHaIjmpUn6EZnp1GhZ6Ph2zyONWU5y19jBrEFyP4J+FFkZyBvJs2KcV0DNKJtP60adRSM/g5HvaipzcrPm55k+d+w9wFb6SzQPPynQepro49FSrNg+MMwj8mCJUOfG96M/35l7ZCYvZJkUQNNgkHKwzY+zLH+pSjAjpe6Mt29NrbTuZE6ixv8YB8uvZ01coLAHyu93ovniRomIP900b5WRqOs3add25EcHhUjL8ynmfVFWsCMFJrNxodlqGcgNKWOXbAhorsOtmK2ZfQ3iOUSLe05aBOjpGuYqosI7lfa5MInECoi+WrygzMgrmAcfoLzjbJVZZfaiexeUTSSkYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CFlAyI0/S7S6pWy091XZdoIPCsJONHLYiyeHv4LheQ=;
 b=d2pfcIcMigELHJZOfOkcm9bYemvCH9ULnU6a79dToPHB2VpJxEA67kJHa5SdRWpYhKBcmxHRfSDTqznQLOPRuexTMMVO1lu2Q9GdfWOVewLRzLZB6QOaXSQo9yXVVbL7+Tooaa63hetNDq5lnABL+iSVGY4TlRXEZlBh1Ou8duMOk4GoFl0oUKdBTonz+3ICTYVHhFR41YNC5oGEyvul86NdQix+jHpLuU6yYDGEGrfm145zB5zfo96R7YmrTwxi9ViUJzsfKtE1i+2VBJWYecKNXZaV2b+WW9yWCi5EAueTvqncp1gVZcKF1ji6T2wyap07ROVupOSLihklGRRMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CFlAyI0/S7S6pWy091XZdoIPCsJONHLYiyeHv4LheQ=;
 b=b930W5Zd4zhmuYVHHfLyYmHYLQvI0M30dBjSraL3TCB8G/7rUJx/Hcjxc+euTJy03RV74HuNucmy+Mq582MjxEWewezwIyknBkex+0QV/s07fsZTBzw1UZ10TlSzR/9nrnw/0NB9qD7nIGLvaRL97ws26CIeV4H+HyHx1xoRmKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8310.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 05:50:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 05:50:13 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Fri,  6 Jan 2023 13:50:52 +0800
Message-Id: <20230106055056.2883302-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230106055056.2883302-1-victor.liu@nxp.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 27577670-5cdb-44a6-cd11-08daefa9e132
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqfC2u8ymV784K2NTaIJLbaWhOmK2Hjy6I4IHhgulanF+H0lHvdtN4bKd+YIg3wUImx8nI9TMNCxWwbYBO/NWChDsJJTN3yGSOS2TCsdSNp51bK6T/zgfuORBz1OAqkGVCQcvS0pik00w9eZgQHwyVYG9FXJNT414U4P5jEpLla9ImGKVGH84NK4aH1dfxGEXtmlBzhNclZ1qj0lIhYR9p6/M7gYt+nA486coQqbBxZxiOuMSkP1MI+eD7zhii0QbRfM8hhdCRtYxerEj8OkEQzCMQjkKRxlAM+bUcYEpR/COrqzdP+s4T4jPzM8DvaBqdcv54b2FnOLUZDCOUoZm6Tq7CLnhtzIOXh8U/37vVWNDrQcdGMfo3UkaQ+9pdhF5JAKEkIifZUmbV4QbpE+RD7o/EvxSuHsoHIxPtOiwPozhxdcq29EgJie9JoxwSwbDNKLsWWb0zrFB2W91UBvLILPO3A67tLZ0Oank5+kiKYm9p3TJmDTNHz8Z4JxLTvBl5niC7e8Tz7zUzC+OI3xIAzFxDg+O/6edgpVb12c1DVQS1d1IXshbxH0O5eQolh5tEUoUAQfl86+6MxwqkHMxjc11cmapNuIFIykk9xihyMS0n6CgEhGlLwhNc7X07HJlRBx+Rur7x6eb68Dd8fBEPYDSkZXHel/YezK6FPsw7f7Nn3ERjs3RXEugnPqeK6lkzOtu/aPDYD1Zn2blEu046UBojrQQc1+pZrxD5X62HkciW+xuxRucw3tnoKQXBp0fm+3A9gpylqxuQbTz4aXRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(83380400001)(1076003)(6512007)(26005)(6666004)(6506007)(86362001)(36756003)(186003)(38100700002)(38350700002)(2616005)(4326008)(316002)(478600001)(41300700001)(8676002)(7416002)(2906002)(5660300002)(8936002)(52116002)(6486002)(966005)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2zsoSc2YiswQQJdKddk3eFJTfNfqwF5SVH3g9pvql9L7jPME3zpblAFa2+Ad?=
 =?us-ascii?Q?fEQjFUntCcP4O2oqCnd9/Oymvtlm4jblpBAk/l/2PP3ZocZFoxfzSEjGmGFy?=
 =?us-ascii?Q?D0/TBjx4ch8SbIoZ0ZlgKkOunr3+OlBkytIgH8TTNQ2JKQ5Q6msAJfSvbGvy?=
 =?us-ascii?Q?yVjuoGTC3rk/tnEa0JW0cb0h2fs/jHVI/Ua2J1RFQzQ2pOdJxqxfo5saznbT?=
 =?us-ascii?Q?gGCp/1UlkJUwPTGPBAaEdiIvkRNwqG51PSm+08/UWHIwvPEpelM8/M3v+IZw?=
 =?us-ascii?Q?T7B6NFT10y4Q5nhqej9r/V9XcP2sTc83E9AqtAsfbZZJXYqR1IwLyBCKDsU3?=
 =?us-ascii?Q?5B6MAsjdVkWLDpWJgbqJYNRMauPSErUHO9sqew9A35faI1xpRPOdVytxlA2o?=
 =?us-ascii?Q?YAiR3ddEhZcQ3rpCBwoQKwZOQ7wTgfUf1lEqCcS5O20t0CCc1iGElrjIzVKg?=
 =?us-ascii?Q?NpfyRUaeNMorqv/VkTPAxiNE0hdJJ0gKuoGFsa1ZgdJXicOacLA5uNwqJE1W?=
 =?us-ascii?Q?RYnkult8CpYpIuD0dcWKeTV3ijHB9uyhM6cQrWRhIvpaPVqxodYGOnI5Y6af?=
 =?us-ascii?Q?Cu7H5at7h4qrGyDrgIKPkx1yxbKV9dJAQ3MsDgXCaj4X5obFy9/BpX3JkBvp?=
 =?us-ascii?Q?guDGXgZ3q4/eeKRk8/IQRACKcQxquAbxTxVVD4te/cKSkqjMssKRGFWtDDl5?=
 =?us-ascii?Q?MzyeJYtFQjEbQcHr/1xJy2Ow1Xb8M8Wqs/b7qdbYetwGJ/wu8WYzC4pIi3UJ?=
 =?us-ascii?Q?kI7zTW5TpK0Ufm3UTkaeAK+kpuaVZ07NomFNZWhoLgJfIgQpab3bAp6eXv09?=
 =?us-ascii?Q?LRmfv83ZsJ/LRa7u7wWlpGdKDnTlgMk/1/2z4/xlWq+rvhNCH1oA/BgCJnKX?=
 =?us-ascii?Q?ym+QiJqrzHNjYuQSqw8UC1wE4opqB26KKYS7jsIR0V82VQ6kzb34OSxcxF0E?=
 =?us-ascii?Q?etwpH0xPMp7qz/B0bX3W4c593iMtJiSfjOF9KeFSJa50VvZ+EPg1s5GB/YIK?=
 =?us-ascii?Q?8GzoC+QrYcQ3G+QUmsz9QaTvO+ltUJpI/aVL9n3V+8u57vceDI/XTeV8E4xe?=
 =?us-ascii?Q?HAj2myTspVm5PUFrIbq4vb8G/wQIzcNdOAKq0j4D/Telp3f6+1nlF387E/NF?=
 =?us-ascii?Q?zS6tKwrGEKhaOwsYXrTDL0FQ9qijYvi/1Xn9p70nhsi84qfc1JlcJSTvlDt2?=
 =?us-ascii?Q?cOQShq5CBwT8qfeKy5IV+B8oPKKPCyqORmo90QuA3v1V8S8e3NW9Ru302C4u?=
 =?us-ascii?Q?grAEyIOxNaA7Zafh81+TCNrk6AVxRuBQjzO4+N5Ih/k5m/UNE8mB4HJTKFAP?=
 =?us-ascii?Q?F4LbbNFyjvZoTL+p2fBAM6AhMF2Hzp0rsC4imANkiwjB9w/Y/dEwMPtY0deR?=
 =?us-ascii?Q?fDC3TNPeDEKv9xdR4qe6fnCFTr6Evqs4Bkp6Rx/+EGA3QAIz4Bqn/Of32Lgq?=
 =?us-ascii?Q?loWLfslNxh4ZyDUpMpWsydkWk+XCUxDff4lKzrKydpvvPac/smUANJeJ+TOY?=
 =?us-ascii?Q?56NRLWwf4DXy7mHQ1EfjbzIaCpSPF9eSmwpRjFudc6+X3Arlz3vfPEXNeMwt?=
 =?us-ascii?Q?SpBZHRDWi2mED+zkLQJnza5DSKKP3bA+lBM8zTc7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27577670-5cdb-44a6-cd11-08daefa9e132
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 05:50:13.5701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQQEfqVTD/6ig28sPLd0F84HPTacWHiIXMOrY5H+VD7PM8lMAhDFHLzFbzTNScCQrjCFIy/30sI5H6Ka+qqmCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8310
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
v4->v14:
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

