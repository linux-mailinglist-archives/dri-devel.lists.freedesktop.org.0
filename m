Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BA783C3F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05A310E1B9;
	Tue, 22 Aug 2023 08:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5345B10E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOHq+M8wC4aAJKDO39Zgrs4GxwBymRr8At5hQgu9umlwFjDFQzGzO2Z3z8dD19PT+TnabVAiyJhWfuTg+cQP0mMvVAjWxxRn2WFi9F64OBWj+yQ+Q0hcrHPprdtmxO2vrfcUfOSEcyiFJGH8ifO1Gi0BsW873I1XUSEK5h5lfQglC48l27tZMFyUMqMC9e0PJ1wKVcoV0asYRnZCo3b3PPwk2h6wUYWxcGLIBF+JvGfzrLizRHkNk2CuCoyZaAAJ8kCXx5WPeRC9T553EbJQ5S5iNB6oGWEgp6ojVAFgguCJDh4RR9C+mo7WhghREDJoB6C16iMDeTBV/2+cX2v7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD/4h/ACjz5tS1olhgsZrP5483U8BAo8iOCiptihvYg=;
 b=PkAP5VMjvwBUc/U0sYvscrujL9MJTWYQ345MrVimyxjX9OTzckayqqdwgAVKDKGZu/I8NxXdaaqlD9YwGtIxZoSRr32QI6fpLG4RcGa30BA11AIi2WaE+i2UBbdSqarIgsjams9WuTo/XdwzM88WkH8IS0cTpk3IaV6XD20NzHgoXL3d8BuYntkSa87bPrfWC8HvP3eStckcrpJHOmnAaZFZAXi/VXObl6O5lN6sBYbaiF6YDeIbOgB4ev+JqqtaDkKYQs3xQ58UPcxE7MiJFE2PDj2lP3KS/mjCyACtzvUbCSs9u7a1RfGw77F3V2sonzz5TpeOMvxmfUbESU/mHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD/4h/ACjz5tS1olhgsZrP5483U8BAo8iOCiptihvYg=;
 b=SQhXmCzhqeOcmmUoF9L/BWQPR58r5q3h4DKdnSXR/3MID50sQcMRh89nmPTfVO/p+KREtonQE1Lk4wz6PFJG1AK0ysIUzBLVeX4RUPV/S+oHUKFT9PwKgkkFNcVoFfNQajLexhuNZhF8sbWJlm6YAS+j7obM0qKygjq8SeB7QOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:56:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:56:00 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 RESEND 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Date: Tue, 22 Aug 2023 16:59:46 +0800
Message-Id: <20230822085949.816844-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230822085949.816844-1-victor.liu@nxp.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 9129bc78-5c2e-4e29-cf08-08dba2ed9b61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /7mIz+9Zv3JILDqmcK/0KHqLcPdFOIddhcZu/wmoKv9eLl8vrfUrvJMlV1EZ8/8vvSDNOKVeFhyYK7VGLnyNgTJgHAnekkFxORQ8MbA+BOvwwpWJK4rb0CxN3v/vXiqlyMlQjQquYPAfqbp+k1Bc0LoWAKS8jxgUwp1ZvMr7sMMZvZ/5QopnREq2mKpQzCYEix2yS3tlgTGGWGd+MXMkeubgPDKvEJQ4f9c8+7aow5ylHy8zNTAMloiUHj8WpntQ4o5H5pKmcZS3HAu1KOaqVaQ/fuwNUYqdEzwzHS0vETmygo/FsNFG0F71V0rfcsRcnif4ExibwshwOJTIfZIB087+DzByagk99ypC+4T/moBoHV5632ptulAOr3z9tcYPfyzzqUd6k3EQxrxih56j9WFxbGnxB49+4YJ0onf/i0QCX1364e4jt/V2EqBW8leBmVtyhPxEhjRWediHUrq9REf5z74G6G8UKkz73L40SCIHUlXOlfxqsPZnZnajDpdnY99rGi9jSBu/Q6Agw0N6uEUUar5Hl+BCvApIaNYxHfvJVdhkqRvfOoOj0BIr1vkYaiIascc23sjY1G94gkjBbtpPMUm+8m9bu+OAJ5miMkrrO9Lb2uHX3ttoTG/i1RCUieK5rZ/ee6E5Vhb8ypsMAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(1076003)(966005)(478600001)(6666004)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uddQ3fjdnviYYr+dPUXpT80xc3sPMXYjQPa21lRs3QpMY4vE7eQ2c9TgXOcr?=
 =?us-ascii?Q?4Siqhn+/Zg/n/sbvFNF4gHMaeHYMWJnwJG3wPNSS3yJ5w3mwGSsl7DPGtkTh?=
 =?us-ascii?Q?WyGQVbHTFGqwG29WPNmw9Va+N5mqgAyW6dKQvCghvGwkDb5iRVIm9uY52sQ/?=
 =?us-ascii?Q?U0Mtq7irEteJOHRhrnH4kJCFTs67eQQpep4xlJqqRjYJ+401WSpViXlfEPZq?=
 =?us-ascii?Q?kHMMDxEmQLfEbyJyS1LIsQkgNsM6DCVGzW/p5+4UOLhmD4OE28okVd6JzIpz?=
 =?us-ascii?Q?RpGQCf6fA887UEaxC4XeaJIn7nvUWQ89ojFXwsxpLFs/pjwv1n/aBcaMLUBK?=
 =?us-ascii?Q?3ydGkz/NLCIcY8PRwnTHCUMdZENxbKko1TIX5xBG+thknKkBjayPQ6PBFGnv?=
 =?us-ascii?Q?MdK2Sy0twu65WmQg5D/9EZ3eC5L5ORGZFcjW2N/LBF68Mp1zDBMUFPcPHqvj?=
 =?us-ascii?Q?sJC/PjyS7USgkGzWMhUR2FYHn5JMXPgZEfbPwBz93p2gccLx673JBuym0U+/?=
 =?us-ascii?Q?H+WFIIxMwKIXD8QS/pUK0nbugRu7DIMS3IdVt0UqQKq+QeR+JZ4bdi5BE2BL?=
 =?us-ascii?Q?Lhvd3Auuops5MOBNW+MHYA0aBvAwN/0t5AfIrIuxuDOt5jsGJS+Hw/UKlrRu?=
 =?us-ascii?Q?YAm7ZzKgJdN357oDyr8rLs2nEO26kvGo8ZpWV5528P9pVwP1yC2C1qdILu6I?=
 =?us-ascii?Q?zhQ0WU6UKJ/kfQqPLkMbavFXoZTEFDP/ELFlorDttbLE3kIDrd8Fon9dg0ZT?=
 =?us-ascii?Q?vJJtz0az6CFFMrxtKLAUz67hE3y1clFV+IUE5VutNfST+dG5e2MIEuCC+GzI?=
 =?us-ascii?Q?uJv9kOo7uoYLmh2RU/DRXf1oK2KnG7gYx8pkfUqNtfbXKrSpYECbF2TH9oa5?=
 =?us-ascii?Q?ejCQ1Xuw7pTq6rVAycU1Jqib/BdyKbaJMUUyAl6iz94TMuVni11FI+62Ev89?=
 =?us-ascii?Q?sJeWqhroSq+/A2RYZo9mpqQpfvizxRO/Uk40zpmZmT5S/V3shjrbz1Qb6xUc?=
 =?us-ascii?Q?5q63LtUBYzfQeeKNtZR5R1Y7+dCHOKXhQbp1NVr5ldAL+mR9vT4zaQh5uj8S?=
 =?us-ascii?Q?M1VRvqOWWCo/dr30IWtKCJ9/6u1s//S683AdBb4LChS4vyJIUt2NgVmrOtrU?=
 =?us-ascii?Q?2g3DSnlZD1LfvARY7zHfzvas1PCUk+YFKkkM0czDds6kko0S3gOzthadFytz?=
 =?us-ascii?Q?DFNoF35Kg1rceMEciB5GG0657DHmEF+J0BQ/HVqd2ZrJ3UYmjyikvBiZSp+j?=
 =?us-ascii?Q?Sm1sffqX/W3Mt0ZmSVUKHi4WkaVE2063aTtztJXsEf9Cu50NCNFDDP2RNZeE?=
 =?us-ascii?Q?VFMrlIg72Ed6GKH2K35Mnx7YGcakTfNYcQnjDtiTYxGLZAMPE8Xo9dlHU3p7?=
 =?us-ascii?Q?MnjphbhU6cZ4QaBdSsDt5QQ8uHkMjJwwJc6eYZBlzBPklM6ITEfZllv54Zgv?=
 =?us-ascii?Q?lM9KKCRQMOAP3+Vs/+8/1Z/KCzkbldJr0kio1qQNEhgvkTzCK55sx/nYnFAq?=
 =?us-ascii?Q?+y6ZamOKT9GqPPgwApXKooGM5gC9GNqBLY0OpLktdafdzFGbNFlXWipzjYzu?=
 =?us-ascii?Q?WKRURg3qqYk5AOpZbjCITixjwp+ot+LvFaPGBf/y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9129bc78-5c2e-4e29-cf08-08dba2ed9b61
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:56:00.4235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0eCWL/nLgY8BZCJwzDe1XT9907BjajHJn/R7BFGFjDEK6Wzzz74MvdbMPEWJEQUXr+NXT4M3JTkFJdHlL4rhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
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
Cc: conor+dt@kernel.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v14:
* No change.

v9->v10:
* Add Rob's R-b tag.

v8->v9:
* Reference 'interrupts-extended' schema instead of 'interrupts' to require
  an additional interrupt(r_rtram_stall) because the reference manual does
  mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.
* Drop Rob's R-b tag, as review is needed.

v4->v8:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../display/imx/fsl,imx8qxp-dprc.yaml         | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 000000000000..bd94254c1288
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
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
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
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
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
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
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.37.1

