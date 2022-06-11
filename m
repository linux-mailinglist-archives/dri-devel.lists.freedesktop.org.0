Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6570547558
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5880110E784;
	Sat, 11 Jun 2022 14:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036D510F991
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyId5QxWH0y12LNXBVirka+pGFiWgshoXayu7Gy7tQ+i2trkZsIjDTjbmEDeoHwWoCPWFTqHVCB3UNuRblVgNvw77AuiS7HunIx3NDS5udqQnL2N77pzbb/z8stA68iL3pTSlmxPsjeeJpeZNlPhMraq8s6G91lPGCdGWzHs1N0Calmcnbwd/BaLWAeoqN2rTFlj099r18x+6RbPnaRVwgmFKi8p+n/0D3/BRW1KyK+N+H/zSxEpn7OdZlH+7es6T11b7J5bVmyfH+s0Hi/5h+xX9YGABejvYi48fjVQD+2kW4f47MdtG3ySvud3yJjeFWhRIriuaTiuHwR8arYWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/0pOCAE6KiSH8FeMTDOJZD4jYaFoaD2kRh+MtNrlaA=;
 b=GFpvMLhUY+FqPHdPa14kCqgdEO80G/pFqf2l8kbn5MfjfHD81iimhRCYWPoKMrBTdyCcTIDfQQPl2RbbbaQD1O+eo9bp2PiHH+nP03ec5xoZM4fl/eSopEl4fI6LiNuk/f2JYBLBE+2ed4vUdXXuk4VYudabwnG/G221Y7ur+Xx85fu7Q08NDkXM5YJhPb1da4AhZJ3XzoCXo9xb1xPWRQlXbH8UPR7PYvbjStKmGI1cEuqFW7JY6cw0gsCEi/jRaLzHrdvzXVwT3Bk1jdBOtEFdE/19z3ogUJD9ylu6Xgi+A2OdwuZn7bo26PQX+v/5olHxA7qP/tyWRyP52mZfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/0pOCAE6KiSH8FeMTDOJZD4jYaFoaD2kRh+MtNrlaA=;
 b=BjjKy4TV6APTwtOWYFKhH+0cVS7KIkAy2So/saGPBFyC7cDRX4lFc52In3+5E+IlHfEGodNSBN7+LvMaWVMBOFOMclzbUCMkPIPl2P4Eq+GXvCM02Go/dUwEM0aaHBtqOmbAghtW8uZ7E3qUEY8ggJFgGHH9lX7A6m5bi3ShvCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 07/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Sat, 11 Jun 2022 22:14:14 +0800
Message-Id: <20220611141421.718743-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be87a9b6-d69b-4bee-76c1-08da4bb493bd
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB63471F34C12E70276FE8E05E98A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F43BbUTtYc90wBntw/VyEJexy8UBgTvE4PrwhS9oeTr1Qy3vWNE0stpEtccrls9pLKMgdk0fQ6umRY+FRxnJsK/whalYtGTQczaJeoGmEP2yBrJCMnc5WghUL51+HXIyOb9K7lG7u4J/gX/ix55iIif1qmsBDNyGeAoGTeMi0mEWx/065Gc5ZmX7TiLEXjwC/XQ/xCr2F3iaUUe3Zi3r1xNpFzEbDKSUrUvivEhdPPRCwVY9UrDGmUjbql8Hk6xNQeECsHadAiTMELGqAMlYqhzqJOdmRoN+WZ93qq0+s3M3MRaS6O43aNQxLbpjGZK3TF2VibptKYthR+tRpef6J/noQpkUCU3E6QpBQOrxvHI3FfXl2xDoOETXQVG9PG5ve7i7eXkIJ11zhazqI373YJpJxxjkChDwBmB5GCn67d1B88vRVn20/4pyIG7pjgBYVi1OQNPy2jsjmjTwEcIsTI9rsgj+lh5TqeMr6c9TCc70oiJ1mYU9mJtPKH27vEBQrPrr+IvQGrEdNrQyKx+tKHN4csQZo/Y5XzZmKICLB9aDoOw83h8XULVh2fKDfXu1x3C/ON3qKBe0M71PAQ86+fPtM2dJXrOB9xElk35QqaD27hZ4cHPICLLMM3WRzektqKU6fq5o/DQ6F5C4S6dh0T/7+kuUHol63P12ONGm/uDFh0CJXZGQ+5mKZsmVDJFc8sqSRmIgLIUqPfeqBnxLh4yOiU36BLZbnrnF5s2/jatMZ7xJvgMHxr4CMSjmYNgwBJVsntScI1WwlpYbtB1TxIEvWAWryFvxw4KTGcURrYAXkLWJr+GcdU9c061Q8EmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(52116002)(38350700002)(38100700002)(6512007)(26005)(966005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGEvQ3NzQkJCWFBYamFyaVlMTzY4UnZKVDEycnc2ZXJBaTJpQkZlNE4xNkdH?=
 =?utf-8?B?dkIyeVJIaitPL2pTSlNHRXltR05vWEtJdHFTRXRURlRvVENCeUpGVG9PSEJl?=
 =?utf-8?B?T0Y5Zno1cjNrYVk5R3lRUEpVS2tQMmxDVG9pSm1JUFhsaWY4NjlWOUdzWXJ1?=
 =?utf-8?B?RzQ2anUvaUlJWFdJWTRrUUhTUnVwdmNsM1dTK3hEM3IwMjMzcCt0cTNnbDRE?=
 =?utf-8?B?dFlWakJkcmkrK1FrcjBUb1puaFNndkI5QzJ0SnpzYWwxdDF0elJlNjIyVzNE?=
 =?utf-8?B?TmI0THlEV1hIMDNubERBZklHdFFGRHhxVnI0amptQlNBRnhOWVlvTy9kZExX?=
 =?utf-8?B?RWdNSFpycm13Vm5tRkZkQnlIRjhpbWZPTStBV2FvcDljOHZqRVArZVRGUWg2?=
 =?utf-8?B?OFViSFJsY29BbmtLd2lNMjdGMWVRNmpPL1BGdmZpbTd6UHY3enZXbkE3ODRr?=
 =?utf-8?B?d0d0WExzNmc5L25VYndUdUVEdjJ3MC9tMWQwVWFTVUVlZXQ3MTI4ZW1nWDBZ?=
 =?utf-8?B?OFUxNVJMazZzaTlEZFNMeWx5ZHgzKzl0R3BvNHptUGRLaWNnMnVzdmNNemww?=
 =?utf-8?B?R2hBaXp3WmxXanp4YksrSjQxY0QwcndoWDQyRXpoRy8xdWFUL2k2VHVFZ2Zl?=
 =?utf-8?B?U2I3OXg1aUZ5eG83dnNrMHdxOXE0RFhFKzhVNlN3a24wTFYrTlZ3KzdVUHF1?=
 =?utf-8?B?YzQ0Q0p1YmFLNWgycURCMmoySFUvT1Y1d3VWa243c1NPS2pOYTYyWXh6NnpR?=
 =?utf-8?B?Sm43UlhjNnV4RmhaWitSZ2d3a2V2YW9yZHU1dGlGcUpZbTExQUpMREQ4Z1My?=
 =?utf-8?B?ZEw4K0l4enY1OTdkNDNTOHF0Q2lkVkhDcngxOUdLemlhdnU0aE4wTnBDdU5t?=
 =?utf-8?B?MVNnZUxRcmxwR1Q1SkJwUWpaSUZVc0Q0WUw5RmUzV0Fpdm1zQmhSQ3JHSWZM?=
 =?utf-8?B?NzJNUElmWWdRREs4ZDBxd05SR1cyNjdLYis2cWg1NU5wTUpLVzJiL0swZVp2?=
 =?utf-8?B?MWNOaVg0KzFMQjFLSFNiS3dhOUNqTnRwS1pxTjVhVmtxZVRRN3M3K3hXMnNJ?=
 =?utf-8?B?eVNreFpiNHpQT2g5WmQwK21tNEErd3B2bkVsUXZtSzlTcjVzeXJTa0M4UmZR?=
 =?utf-8?B?S1BvdnR3cVQyVzdRbWlBMXpRKytlTnR2dmRqa05nNFFJR2dtNjNaUzhJQ0Jq?=
 =?utf-8?B?RFFiNnNyb0hZYkQ5SnU5c09TOE1RRVdjRGFndDdqZmxLK3E3dlY4eVdLY2RN?=
 =?utf-8?B?RW92MDdhdmNYU3BxY1lTSzZITkgvTnl0anlKdzI1L0V1OTFCeDNpNkFXSHBt?=
 =?utf-8?B?VDNucHBjWlZKUEF4ckszTmZFazlQZWFUZkdRLzlFZ0Uwdi9vTk1rME11ek4r?=
 =?utf-8?B?dUNOalNsaFp0T1lHVE1uakFsQjdwUXRGdmJqdmVnakFJQU8yR0pEUTZCVHZh?=
 =?utf-8?B?Zjd0cGpUSGo0VVBpUWJRZWdmWjdCazR5QnBoRXkyaU80aUFUUEN0cnVyekw4?=
 =?utf-8?B?cVZtbGlYazZmMStuNFduZ2dQYUN3d3ZVS1NpL3ZiajI0bWxZRCs4RTdvc0Fz?=
 =?utf-8?B?c3pHalBHbzhRaGFxTEVwTkt2bDBkdUI3eGg5YmZQcnVROHdWOG9MZHQzYU5z?=
 =?utf-8?B?Y0YxUFl4MGI3YXhWbFJLd1ZFMWhxa3dINExPMDVRVUlDM0dLWlVhYnhTQnJL?=
 =?utf-8?B?NWJYSmtRd1NRZUpDdU1jVm11cDV0TzZGUkkyWHd0Z0pKb21obElyc0dMa3A0?=
 =?utf-8?B?UW1KS3JBYkk2ejU0N3U3S1hzdVpNMWtkeHRPV1lRM3ZqbDJBMU41VVhFZnFx?=
 =?utf-8?B?dGNacHBLdXJVSjlVQkRHM3VraFhGNzFVQVB4ZS8vMUtPNGZCUEdVL3RLZ0d2?=
 =?utf-8?B?TFdYUnVmN2d0ejBFZGkzRWdxVFdDVVJkcWdGL3ZLTE1yN0hET1ViR2hkN3o0?=
 =?utf-8?B?ZXpVMUV2OGxyejRTa1F0Z3c5bTgrRFpwS21mWDJucC9MUXhhQnJkMXlhTy9w?=
 =?utf-8?B?Z3c3WW5NTzBLTnYzVXh2Uk1BYjh0NHJCVTQxRjlmRWQvSkl0QnhCQkRRSW44?=
 =?utf-8?B?YmVPUVkzbVA4NGJoNkFBa2NMQ21RcjQ1UkVRdEdRTXlhaTRCUnlnandSdi9q?=
 =?utf-8?B?aXVtMkREL3lRb2FwOVhVNHpLaFJvOXBUbGYrTjJZa3hkbE04QVRiZ3dkdVpa?=
 =?utf-8?B?dUd0d2U5M3VRZUNkWXlZREhSVmZsNU0xT2s5VlRlMDJJUW1tMlJjeWp5YjBx?=
 =?utf-8?B?R3N2NjZXcEpyOFhBNjJsZkk2ZE04TFhORUh3WDRKMXMwOGJwZ2w3Q2dLMlZn?=
 =?utf-8?B?VHphU1YzODFId2s3eUJUMEVWeERyMHBPejRzRmh1QjFDT0dQdFNlQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be87a9b6-d69b-4bee-76c1-08da4bb493bd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:37.4336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAXYnWj6bcFhTeEMkKLXL738RRvrBw6C6JiZRtESI6EFH0dfyqMZ4UXIvlhZwqRYjLOCBLmxLGoB8rRk+bNR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* Add Rob's R-b tag.

v4->v5:
* No change.

v3->v4:
* Add 'fsl,sc-resource' property. (Rob)

v2->v3:
* Drop 'fsl,syscon' property. (Rob)
* Mention the CSR module controls PXL2DPI.

v1->v2:
* Use graph schema. (Laurent)

 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml   | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
new file mode 100644
index 000000000000..e4e77fad05f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pxl2dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Pixel Link to Display Pixel Interface
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The Freescale i.MX8qxp Pixel Link to Display Pixel Interface(PXL2DPI)
+  interfaces the pixel link 36-bit data output and the DSI controller’s
+  MIPI-DPI 24-bit data input, and inputs of LVDS Display Bridge(LDB) module
+  used in LVDS mode, to remap the pixel color codings between those modules.
+  This module is purely combinatorial.
+
+  The i.MX8qxp PXL2DPI is controlled by Control and Status Registers(CSR) module.
+  The CSR module, as a system controller, contains the PXL2DPI's configuration
+  register.
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-pxl2dpi
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this PXL2DPI instance.
+
+  power-domains:
+    maxItems: 1
+
+  fsl,companion-pxl2dpi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to companion PXL2DPI which is used by downstream
+      LVDS Display Bridge(LDB) in split mode.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The PXL2DPI input port node from pixel link.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: The PXL2DPI output port node to downstream bridge.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - fsl,sc-resource
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    pxl2dpi {
+        compatible = "fsl,imx8qxp-pxl2dpi";
+        fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+        power-domains = <&pd IMX_SC_R_MIPI_0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                mipi_lvds_0_pxl2dpi_dc_pixel_link0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&dc_pixel_link0_mipi_lvds_0_pxl2dpi>;
+                };
+
+                mipi_lvds_0_pxl2dpi_dc_pixel_link1: endpoint@1 {
+                     reg = <1>;
+                     remote-endpoint = <&dc_pixel_link1_mipi_lvds_0_pxl2dpi>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+                };
+
+                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+                };
+            };
+        };
+    };
-- 
2.25.1

