Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A35544418
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430B8113DA0;
	Thu,  9 Jun 2022 06:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8563113DA5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQicI+gJt2WE/t+SQO/H9GOvbrAvrdfHD2mCGJ/g8Bobld1Nmi44vkUjLs/w7ram0BG7szGGUCqG9/fcKRQZVsSY1F+zlp8ubDsvLwvuMzhHzlXZbFjK9JHHpY6DVbql5oShy8XYDbWo00DMoe8TCl8YJD+wzY7Z6HkvBlYXPIx9WIJWwDgFMhA1wBZ+UWXagMJN8BjnpzAVaOBBuZsGUWKPcdtGjP5mWAKmC4ukp6MVZc7YfSsdr6n43WLx0re+iUystIWJajzCvcQ+4/UOFao1Q5riHZnenSuhcwC8VpgE7WWfJtmEXFjmUmLEgYfm2n0Ayta0UbxJRbC+YWfY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MFuqQgIeOIsb8c7f6wQQKF9i4OT0TOnV7McXEvV8t8=;
 b=hBSNSaL4f6CFTML/YsShVj5O+m43C1QQyX6wg+AjJqF5kOmDFz4UrJSTzCfPd2JOcOLgK1GMjZiHvFZaWk80nGSKewsVxy6IjYnRpgqYdVzktYn7PnkDRFPNdsEVw/SK8eKIGwBjWA44qSEeF3gj4Zw2HYmO9FlKcQ5lIj7IM79MCYLZVykhl9TbSTjlrpA8veqlWkFfcAsUtGyo2dd2NUHK4g639OvERm6kGBfBJP47RJmCraS2S4sIPCJF5ghrYDApUjPXWQEWRG+6OoVLvgNbokAX8fCNm5oKvZwyTNRYey8o74mhpC1mAQRHloqe6jj3abygGYR0z9qpQhQetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MFuqQgIeOIsb8c7f6wQQKF9i4OT0TOnV7McXEvV8t8=;
 b=D2phlbzPfjj3F8iXpiaRWDd0ojh00InNxUvXokkCjp2zh5RNh/Ja0brzB3W/QqCwkLl2hP+znAN4QiI3Patpne+Im7s2VzXvt5jabul050riFr4uND1J6eX/s0rNe3n3Oc0AabCB/4s6U/Eh054aMmrOCL8gM7tVUoi1JulS8bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0402MB3518.eurprd04.prod.outlook.com (2603:10a6:803:4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 07/14] dt-bindings: display: bridge: Add i.MX8qxp pixel
 link to DPI binding
Date: Thu,  9 Jun 2022 14:49:24 +0800
Message-Id: <20220609064931.3068601-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9dc30f7-594a-4605-34e7-08da49e41d26
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3518:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35184D783330BBAAED7001C598A79@VI1PR0402MB3518.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uQ/wLYIDm+D+ybX8ZSbdsvC8Isd4OxfkUlOi0ClNCuGSyghH1ExZBjbzn/mhCg+mHWodkI41pODzSwYaACePPFe2g93WIHUCCExophrxfieRRvUD7Ak27YqNemCvnlS8E8qDtV0EqPC/C0dNOg7EFR/W2YbYD2XyWT+XVKwUDzQq95qkEER8c8u9mI3cP4YIdCxskM9V8ATYB/W88JgBaVMB3cUJApEu1Ep8996KtxDeeUwNSrKaPpM54993tztydr9Rq6rtBC7AFS/4u1PAA1/O7cp+reTXPdBbarHKcnXQENvp3bNgEr5WePm1EWV+bFSIyrUB+E+NqMvar1dL4vW4kUIElhtvMVSGKrSF7SsDyOF/EvTUq/cnyWjHzicgkWvKzp7Lkq1ZqGCM/Ek7YIEG4u673T52kP+g+N+DCAdakll7av1shwoph/LWZkhMc3xWWMtz0imIWpUDYmBPjS87OMf179r4EzL9ZCqrjpoeal/IVD4+8BN/6iN0W7lluY85K/XqEcpAYmFv1BfPstOvZMFkZm5vnlpmDISX2DFLYHb3yvkt6DK21gLYnmZLDQOmTu1P0miB6qH3UQSZNhrqNu6fQ0bJYmTFHdnhcRZ7hKgOwWe6k5o+tSPHWdYWcaxaQTBI+sRZvJA43dDZk96vvDuxez2yFGrir6H+nOZ0rPTQ9Z9rnbU0ya4Viaansz5lNqho8+s6NXNpcdAsTQh4/ZW+hplJe7jOMuXYDrSqdba7vCOA+XnXcQr6kbImKbCD0m5rfc62793/UvbBzdFWuC3TeRehFAiI8EzsJ/bwIB85WXyD4giZuK9H00tJOqAQhxVHczKrsiJ+FFNbPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(2616005)(38350700002)(186003)(26005)(38100700002)(6512007)(6486002)(36756003)(316002)(1076003)(7416002)(66946007)(8676002)(8936002)(66556008)(52116002)(6506007)(66476007)(4326008)(86362001)(5660300002)(508600001)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3djWXRNajZtUmFHT2dpSFFjZ0FKUFZMb25iMHJ3dEdMV2s5RnU1bWRlYmZZ?=
 =?utf-8?B?NFo3YXc0dkpVU1dSbFRTMkhOdlk3ZjNlZUpVNnRHVGh2cHFmUXFUb1QvTjBz?=
 =?utf-8?B?aE9lNTl6N3lzbzg4RTdneWdrTVN1RTVNWUpnOXpoM2FaaDZxb3FTYzQ3dHcw?=
 =?utf-8?B?WXJBZGsyeTd0QXcvby9wZERCbFNXdmc0MGZxMEdBUVkrTkt1MVlmUkVCUWZm?=
 =?utf-8?B?blplcnh4b0RpQy9vNVdjQm01V1A5aE1KWjZHZWh1TVkxalRwa0hEZ1B1emVz?=
 =?utf-8?B?dlk2NFRNOStYVjgzWWpaUU8wNkwwV2d0VWtSdUdyZE1QQURtbGhZNUt5ckdS?=
 =?utf-8?B?S29RR09VMXBBWHdvSnJqcXJzb3ZvODAwbCtJakNvSExJVXVvcURjcm5SYmZi?=
 =?utf-8?B?ajUra3BMVUxLZzE4ZjE0VlRiQndCS3pneXRSdVZQVFo4b0VpTEhlOXpiNzhy?=
 =?utf-8?B?QnF4bEo3MnI5M2l5S2NuczRscDRIWjZrY1AxaXUzMlBVQ1pOc1ErMktIRTVU?=
 =?utf-8?B?TDkzRVVTQjVKWVlhK3A2MU41cGRXM1pudjQvM1lndVU2d2FFQnRIbjR4b2JC?=
 =?utf-8?B?THFvVWdoMzdGTWdWV0NnY3c5WEdkVXpiczQreXlya21YRTdlMDRablh0RktE?=
 =?utf-8?B?SlpUais5di94bG9wcEh4Z0UySXpMQWluWTJpSUNadklpWkVMVCt6NGk3MlBM?=
 =?utf-8?B?QXpTTVluYmlQTGRUSlpaS2l3VVFROTAvT2k2RW53VGllTG1KMU02TlB5bnFH?=
 =?utf-8?B?SUdxNEhERTZmdWorVGJlYVRNRS9nNjNFeS8yS1RPaGNJeGNjSDNhQ3FyMURS?=
 =?utf-8?B?Z3VEZysxNmhFSlQ4MFNWOTBDR0hBakJ4NVdyVldYS053bkcrajdJb0VTUTVH?=
 =?utf-8?B?R2VGakx1MkZaTmNJcldrdTZaSUFSV0xkU09QbXFwVWNjd216Z3YwTENPL3hu?=
 =?utf-8?B?UTIwV2lsc0lYcDdjODBpREFsWENiRXdKOVcxdzA0ekVVVG0yK2ltWWVUa0hI?=
 =?utf-8?B?d3J5bm83cTlzcHF6Um1iNjJpMzhuVUtjdE44VVg3eUpMdkpGdkY5VHJodW9j?=
 =?utf-8?B?aHAySW41SkhWeW5Ma01yUnNad2Vzd3E1VUV5UHdCV3FRSXRMa0pQTUlzOEZC?=
 =?utf-8?B?REIyb2E1MmxYNEljSXlaVXZCT1BpditwdklIbWJXeWE4dWQ0aFI5WTJDTXpQ?=
 =?utf-8?B?NFNycXBmRjZlV1haM3hkTDRzT01lVU1sYTVhRHZtZnF6UlRkWWRqZEJxK25G?=
 =?utf-8?B?YUhqVFIvY2lpM3FSZzRwaUF0QzIrNjc1SU8zSVdvVWExOC9xM2tTdEdPL0dy?=
 =?utf-8?B?USt1K29sSi9uUEFiWUlxaUg2MGlqeFRENjd6cnVQK1YvL1JsSm42QVc3M0xF?=
 =?utf-8?B?RGR2ZExKWnE4N2FzRUlaZExjZmM4UUkvTlVhd21Wc1JHU3BQdE1aNVp5b3RB?=
 =?utf-8?B?ZXNmYkt0WEh1SkxuMFBaaTZpTWpHTWZwR0RZMGszOFRMSk44c3BXOG9jenpB?=
 =?utf-8?B?VmU0cW9mN0VTQm1MdUltcC9TeGZSTVBLVDFva0ZTMUNjK1o5ZUpKVCtNQUlJ?=
 =?utf-8?B?aGFnelRQRUhtZEtlSGMvaUc0d3VQZjNSR0VOSGQzQXludW9vdGF1L0VGbDVC?=
 =?utf-8?B?S1FwQWNKR1d5cXFSaVJwNW5PL2RMSzJBTG55TnFNTUJOcEUxSnFYWlFrd3cr?=
 =?utf-8?B?UCtaZk1zc0VXU3gza3h1SVRib2FuclU5ME9SYzVzUTFzRCttWndoL2Uzd3RK?=
 =?utf-8?B?VzM5VGZtVGMyeTdlQ3lZVk9zcUYvSjY3eFhPK3lmZm9wNDBWWVVVdVJZV08w?=
 =?utf-8?B?RTE2cnAwL2V1QzRlNjl0VE10RTREOEFrdkNqa1JmczlFQW0zOUFWdGJjcXBD?=
 =?utf-8?B?aGhlZmYvc0k1bVdjZER1d1lvUkNxQ1M5TDQrUTVMTklJSGZkckhrc2QydUJQ?=
 =?utf-8?B?U0xKZGl5MGNNN0Jlc0kwa1lVM2puRnE0b0UzL2dqcEdrL2t2YUN5cVlrcUYz?=
 =?utf-8?B?ZFI2NFFVUStGQ3FLbGtnMm9pUmtKWm5VR1hqV2hpQWtJNTM0YUNOWHhIR25M?=
 =?utf-8?B?Zk96VUJRQlR3NU1OdFpSVE9VenIycUE0djBBMHlUa044Vm4zLy81aWk5ekRL?=
 =?utf-8?B?VzFmYWF0WmFtUWNFemI3Q2lFWjluelp0UDF1Ukk5ZnBBWWd3UHdGTEdOc3U0?=
 =?utf-8?B?VHVBUlJjM0FhUVdOWVAwaFROTEtEcUdwYWpJZlNhSWR0WWZvV1hJSUN0TEhi?=
 =?utf-8?B?NWlOUTljb29Ca01LcnJua1NKMUNwNmZRdnFuYXpZV2tvWmxtbDlMd0t3OEpM?=
 =?utf-8?B?QXpsdTBoU01SRmNHTmZDdERoajVXWTZhK2ZCWHRRU0lXNktlaVRRdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dc30f7-594a-4605-34e7-08da49e41d26
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:51.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4Oo5eDNi2Ooxc0EY0ptjROOLeBrwpMZ1F/xQP3RnHCIcow1ryyzd8HFS5LsRaHoQmTPhf867qqM30/lA6XR+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3518
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

