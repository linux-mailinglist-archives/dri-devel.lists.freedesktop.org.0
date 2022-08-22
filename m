Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3359BAF5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C209AC2E;
	Mon, 22 Aug 2022 08:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50054.outbound.protection.outlook.com [40.107.5.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079019AC20
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PngVYTGO87hSQ0g6JvLjBEzvVHDMAmEmBCku3DNaGwNOMPh43yli0sgSE4y7L/Bma4aZ7eYjmiAK8f9amTpHbO3LzDVGLzl59DrPF8sDXwnhn+2NHhuSKEooGpMKOh+VnEjE2q13CqgeGz9V6MvpRXbRu9Xn2olKImB98WRcD4S4INhhuC8Vdj5pVEa2MrwhGvRat9kAS29XIdMdEzd0PJ3s/rqTGGYMCMUR/rG49j8TGvWwq7701OEtWksl/4jzEFir2lwjlyOjUCvvabfEqIOOh9fKCLROW18RBf69DCysdKhM+Yfb+wcbrkiweSA3/j+88cbzN3cfNigdHygtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzjd0TuIpxqQmgJxk7XInMLF5hlpswn4ChA7eFZLUWs=;
 b=TPOMwNncI0Qf/+kkFwMygnMAvPWOipup9YVn8Tbd8EICmiZC25FGBTasCafKISToHI6tltzT8FqZpd8PiDA5T0/FEV/90GMJkMJK8BQaMbOBn8/qnzRa4JMujacFIUStk+3A7rHJpciy24yD5caPQ20Rr8fDKzTFdGPgmKiuEGkFjVIEZZOrzafi2d88GQjkF6Wp5h3KReCWO/gVr6TLQ4DQa0b4FYOGoUBghKsvcHQ5LR+XC3d0HkhE9qUorFAWI3f4NC4eu9lsRORXcc4IKStUHWaPYRxOpVMiAhuPs8VzzKZyDEeHuzsBPI8efcDf5YelDYXXE5dYVwK2sRpWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzjd0TuIpxqQmgJxk7XInMLF5hlpswn4ChA7eFZLUWs=;
 b=pQj7YmcP6RhrHujLWUxkThOSvZCvEF+nmSOXBjbKad5KJkjQ7zoC12idJ0+AQb55E9B5DBSh0xYxkQ/nDCwIjaj0OjelexmTnudM2RWVVwqEkCvu5yj9odf41kb1AkFc+6jrlrrDrxyeAKCZpKsY4Yzsg3CrELFpnP97yHNyS7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4865.eurprd04.prod.outlook.com (2603:10a6:208:c4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:06:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b%6]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 08:06:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Mon, 22 Aug 2022 16:07:52 +0800
Message-Id: <20220822080756.37400-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822080756.37400-1-victor.liu@nxp.com>
References: <20220822080756.37400-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 122a0ad0-37be-4637-a154-08da84154844
X-MS-TrafficTypeDiagnostic: AM0PR04MB4865:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHPS/SmQmBabc4zQjklvZ/J6x+s8sIWCzyqsu5GAizayy0z/VjqztoVba+p45nm85sgh6rfeeiV66sNC1v6+jUt/Z5usvlanYYx1+Etnrz+LEKC9UrcaVwRCXi+7IoK1eBj783qZSxj4uC2xCmbpf4vUHBbQ8Zyc4mmUIYvKL+sGVcNL10GgqblmsaU7s7OGO/qk7C3HdwpzjuvhUJRm9bRs/8vad0IM90rYj2MjTwA8cKfTqCK5JqL8d8Qcx6auhgqa0axvOeoWr2MyAOjV3inliLy+JcRHwlTDR6cl+p1Zmz7cUhbHWQyTtZvADcHCOMBHIP7VbR0YXwfQKWSht3NBi4Ovfxq3CusXs2bOSRkp98aa8xedhHckpFefLsTOAdE7mmwLsLroJKYL0ME20rpAbatSJa4srBh5/9R6wRrx73MFWq8qnEsQI1oiOAqcUQNO9aFni0pP8YYNOB+w+ctshoZXt4vcOqgy9K9tLiU8nD4ibi/4x8i71T28pNnopSm6eEsoC++JVMwpXP9W9kn52t9gCfjVDsd8xw20alMyyhMmppcd03183SbpzGC0nqxCDwviIOvFCxtmYYbos2uVQ1PFi56tr89QE6EMs9T8hXmrAGz131ulNnkutGH4Y+Y7H58MCTLUuEx+rjdz148L46U+IPf5sNcjVKcJEVprvrFROxaepsiT/rAFXlhB5dBcosS8Qi4JQMyZLPGuHnlL7iSQfUhXAfNfMuBwvHRE/VBE65Smy+Uah55n9J+tYTDAVpwuUG15UjWrLTTRYOfnVyo5PIeyx79CaXVsWBNUOoP4Fe44D3Afs9z338AQAf6iMoA6uL43jhssW84Gjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(6512007)(6506007)(316002)(6666004)(26005)(52116002)(6486002)(966005)(86362001)(41300700001)(478600001)(38350700002)(38100700002)(2616005)(186003)(1076003)(7416002)(83380400001)(66946007)(66556008)(66476007)(8936002)(2906002)(36756003)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DPvD9vTCwIVUn14ayG55gHmhf0ZhsDjMo79J39cqnjapnShvOjqmlzhzLxLD?=
 =?us-ascii?Q?611qDZnX1Yc1krexLVUk9uFO7o7ALw5AIZkGyvvpR53W1MZuLJDsgIoJVIRw?=
 =?us-ascii?Q?vzIzT1Jk+thlK4+DF0RFmcDpXKRPpCL9h+MLVEP/DU3TeAUumwIN+YagM4nT?=
 =?us-ascii?Q?MKYQ0UUvXkfnUkwF0Yaqf2OwtueHIkjddQQp0jfLUzeuo9AtCKrwjR5bs0vc?=
 =?us-ascii?Q?Qst9nVok345EasSMpw0o6Dc7cFTUN/gtj3IpiDPpumUfLhGMxz1SBO5zA7d2?=
 =?us-ascii?Q?QSOl4HJyOHZvywViADqhdlMsByGQf73p6OROIzuIciaJEx6LEv5S1lgcQqMB?=
 =?us-ascii?Q?0SofecTGGITgiRbK459lYaw/2gJl88trlT/zXh21fYHE/OAR2E5b1Z0/2OMc?=
 =?us-ascii?Q?cgYL+AJRGs2ytHsfgIjdWMmDTXw/nFyESSeKPlFwPopTjRVflFoJfGVodlQj?=
 =?us-ascii?Q?bW0g+SstjHV6GVAWon9OMhTd6mnLCPfLpTX9lr3itH5c9jsw5i+vXL4NBfQh?=
 =?us-ascii?Q?UVSpmcMR7ZVn9sW2hN0wRtazvMxkEOzPGvxMCutmCARZ4oTVxiM6BUy6uLN7?=
 =?us-ascii?Q?Q5BdXFFjzmzNim36q5SAcCUgZLMOq+jDQ0I12uDWFySz16ZzVsFv0uafW2IX?=
 =?us-ascii?Q?l4mHNXIAJldzaCultFhL1tZtePs01F4Z+VOHvRwSozk+IIQyUrW8o6GhZwbp?=
 =?us-ascii?Q?tFTyRNVY4T1+pTgNzQ8r9YvS4EbyWN63cCJiennPGE8X4EKDfnHPzmCzePfq?=
 =?us-ascii?Q?Vb63+Tz4e9Af+P9Uv+6EcX0Os4gl5GjvizRQrkYr6eveRxqlP8Y0PvU+TbmD?=
 =?us-ascii?Q?o+1TrYR+DFall50F1dWmVmOI8N2645sIItjQpPKXx/Jxz8xVAq82VuGEFBnJ?=
 =?us-ascii?Q?Nv/d51z7MHAI3/FUcDFxhHFRittkfuDeeK98YFG+V9Y4gfs76i4JcUEzioDN?=
 =?us-ascii?Q?Iqv22LGUGI23zWJ1Z2vdE5Le2PCGN97xjNiOLpe0VyxRIW/5e5F63CwhellL?=
 =?us-ascii?Q?ZxC9tv9yUhO2Kys1XGOYObsa7LDE6XdjqppnQfHrH/AgSZ01MT4AXDbwjR5m?=
 =?us-ascii?Q?xlfL93w2P6R4GGESKrDl86sWcBX56ApN2dtUDy+nKJXW1sEqu6SBghJwNGFC?=
 =?us-ascii?Q?Ze6G0/0VOeCWhuMde/HE/1/8ABgCU9zFR5fDgO5qrCarnXGTKCRrt6wa4+IQ?=
 =?us-ascii?Q?LBsO/D7VttsIMWY3Wg+YQWGD03ABj9rayT3cCoZaFs/9F/fG94T2YZRBNUAG?=
 =?us-ascii?Q?lUQiw+ceHq1R/gu9fP3P1dxj8wRR6+rgp0aFteACPppHVgsNxDzk3NwQRS/Z?=
 =?us-ascii?Q?ixlrBB8DfJ1YxrVzKqm7MfhLbtxBFHRIrCMwANGShKla0/QceBjAmLZQFS3d?=
 =?us-ascii?Q?mKZmTdt/AXGZPZEpI5W3gRB5wzKJKgtOHVRyNwRvGBVR+8XC/AlFcRMMD25r?=
 =?us-ascii?Q?yw/EV1/T1teC3r9e+QxaQWs8achVn+Ld0Bhrzy6iGK+3MkU8z5VqblReUxVt?=
 =?us-ascii?Q?VcJNYsdZM2ToJ7hUf/EQ53R9ZuvWfcUY2XmarAdpkxnRH4xT8D/43oZEZN8T?=
 =?us-ascii?Q?GHcyENaKyZ+39XxqrV7CBAb1X8hf1mHlSDWIPQPy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122a0ad0-37be-4637-a154-08da84154844
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:06:57.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdJKP9H9M7dbnQU8/jLjw6Omt6aUj0ZQ/k+KEplJdlmCwD0vM8sdh0NbWjQFsSxehXfXnvuu/lPMr1jnpXf1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4865
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
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v11:
* No change.

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
2.37.1

