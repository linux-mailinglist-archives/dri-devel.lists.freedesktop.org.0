Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5009506179
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 03:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8571810E314;
	Tue, 19 Apr 2022 01:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3FF10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb69xiJIxX8cFiuwer7SDsuDo+KPLcDch+dmcskpgkY0zmFWxrLNjhWOcwmLlTZedLG12le6bkOyjGWCyJ01p4K+oZWdBd4n2jJPAaQommWT2956Ox1/pWHsW9OhvMFVyzIM03FKasD2YXuQQBCIW7MOCTbZnxr34L8O50rxtIqAXMsUvjoHPifpX1Hxy4vJaSciv1EQ+hFhHJpM18Th79Q4X2nlCG7ptm9m13ckyOf7OV+pa9nC4us+cVJ2ROiWSA0BWDepl31DoiTlyx/qLGO70bx/gRqRRxPwCKMz3ZVfsqpU78yD7+Y8gwQXpIGsWUvrTJpeiQcnlyarusHAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwVgVujLCDokFEM7c0bPtR5ihAMPkZO/ohpa4ZORM/I=;
 b=FeuHW1JKxXMFH3+ln86M63blQ9nZmwby/iksz50AVfVnSuYOwyqxtrCK21oCvEdwluXIUX761jX5uahwjS+E5cbZb7tECHk5IzjGLB6VOtXYhy3SgXSaKBmxulPRBJR4MimfgP7CtThqdLLstRZlpjzHiFp36iuwRJ9eqs1ke60ptqCb8FEQ5bPgLSxiOgdcEYlTdBPPPqZNFsHMUVaaikrzACSLavC5Z2Xgbpp5mX9cmT2CxB45K/cdFc2QUD53AVPGWp7FzUD1C5nXEu/SNoIE2DuK+MbiAtCvhwIbtvfmzd46Qk7v6BfR5/WczYXxnxYDU0HE9iB5iuJBLaU46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwVgVujLCDokFEM7c0bPtR5ihAMPkZO/ohpa4ZORM/I=;
 b=IKkVgLbahvMCiA0jMyjlpqbELaxutbU9Q9GNdP0+5QAd0hLdQKPoekfuKNfduI9rQ8AMRmGr9poCdimuK81TNyI4W3Ogfs2lAwa0W8r+sF0IfiJ25dOH9TU05cUMQ1lpHClcRlnuboPtGG6ctmWguhHr51b400WRsSv0cJLs3bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 01:07:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 01:07:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH resend v8 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add
 Mixel combo PHY support for i.MX8qxp
Date: Tue, 19 Apr 2022 09:08:51 +0800
Message-Id: <20220419010852.452169-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419010852.452169-1-victor.liu@nxp.com>
References: <20220419010852.452169-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e9c6af-f83a-41c4-e977-08da21a0fe86
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB329187A9300EFC69A18ED02998F29@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vAFLN096UYyBJi5aSYP4QfS6/e0uF3o/Y//RhB+j0OLp8Y+eqf9Ge1HPerxo5pDEJm6rOBw+uRcIH7dSXc8+OXILtE0TTZxsmSoYQpN1uiqAxt/orFU+IT0H7diziyrku4mHTG4drnRfz/yLTOmuxOUw3F5i9/4A83qm5yZZ0AcdW9wfDoZ9n1L1WTF219DM+1UsdROYw2coUJUUsAqtRy++q1Jx6FAoDjgsqA3Q5gc0tWykKUZpJYacKhjRP5PMD3fJfhLoidAbZGpCONX8FQ+uyENwNWqjRfSTqy2tzdzIzreGqvxcHZa++0uyvGaEFuJqVgmUjgKw8P1W8Z/bbk3vU/eHWiCt9cOPvFgxC4pkgfVZ1AkM9qJEjLsZAdbyv9OPJFGpLqTH9uTeto6eIoFC8TSm5lOhFj8kxI1Fz4OMTX5Xd7h6WNcPbbh/YyQkdtWZinNVo5QTk7uMCfO2Jma6Tb0l9yUKe+2g5dG0Zcm5r002Z7PaqVLtEvgjeZNviA1Jac1xgU37wwWFCTdFetHeT3M9wq1kkBG360xePx4El8vA3KyquJuHbs8zO/qGDt0q0uYumravhkuuLas67I2JbmpqicStEvke5HuN2jGqeFFtFQVbqYMvt1uDdf8oxvkcsxPC2gHgcdubHGmIfxc8OrvTimhpM4nmS4fd6V04/DhD0p8qO6H/Pz1KyzWGNcZfMxo7WKaLuv2rOcGdMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(8676002)(4326008)(86362001)(6486002)(36756003)(52116002)(6512007)(6506007)(6666004)(316002)(66556008)(66476007)(2906002)(26005)(186003)(83380400001)(2616005)(1076003)(5660300002)(7416002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFFSEdqYkpCYnVyZ3JySmtVK0JvM0VLKzJMT1lvZ21RaHNjaDErNzVMa2hI?=
 =?utf-8?B?Y3Zac1FoNnFmTWFDeXFkRTNtWHczQ1ZKNnJvUlVoVWpDTHJSWU1JeGNncXRz?=
 =?utf-8?B?cXdET0pqUXRKaFB1aHVET2NCYW5PaCtsUzJ0Z1kxOG9yZUNFM1g2Qy82Qm5B?=
 =?utf-8?B?T1R4OUk1TC9ZZmRLaXFSVmFxaERQWjlmTkFFUXkrZVNHUWRteVFoWVBLSHFa?=
 =?utf-8?B?QTRvTEJkYlk1UnYyL0dUb2RQL2t1dlFSQXRWSk5EVDBpajdOWm54T1B4Z0k3?=
 =?utf-8?B?aWNaQ2p0dGtzdngvK3o4QjNEUGdjSklETnpZRURPSk5RdWN6VkgxYmVDNE9E?=
 =?utf-8?B?dm9vU1V4ZVV0enZXQ1Y3Wno1bStCdlRGRSsyQXIwci9qN1FNcGhYTHZOaTdV?=
 =?utf-8?B?YnB4UWZOQmxCQ3ZEVXhvT1BZem5PcHh6TnByS29RMThwRjBQbkdHckFPUkZn?=
 =?utf-8?B?UU1IVkdISkRubURrSDhpQTFaaC9WVFlrZGJJSCs2Ui9CUHFaVm9KdlJzb05u?=
 =?utf-8?B?cXZHOTVNaUwxcVBZaXBrazUyaFIyZGZFaDNPZ05TS1ZLZmdVRC9ZZXpDVU02?=
 =?utf-8?B?M3FFd3FHR3lDbTl4aEJ0UEJmVWRCMVpPZFNSUkZLYXk3Qko5Q0txVGw4V2pT?=
 =?utf-8?B?MTljeFJ0d3cydDA4eklrQXZhaUVXWTFOSlo4cjZFOWM2aHlGZm9hODFoOThu?=
 =?utf-8?B?K09QK2kreEdwai94MFJSNEQzRWJyaTNMMXR5QnJhOTVmNmJxM0NtMXVoRHdr?=
 =?utf-8?B?VlBpSnd1RC9YL1JCWnFkbUNpSlJSMFY1NjNZVU1aSmZXaUlBaVlnQitFaVlR?=
 =?utf-8?B?d1F3cG1XcUw4WHRBQ2wzK0NJYSsySmhLcCtpL1ZNU2IzTnI1ajI5UzRJc1Mr?=
 =?utf-8?B?TDhtd3dSc0tFYktEamh3TVZseE1rUTRLeEUzdU9aWDB2Y2RxK1U4V1dwbmNz?=
 =?utf-8?B?eDUvTTBib3E4ekFIUGdhODQ5R2VOTC8yTW5HYzJaazdsbFJnay8wRVM3ODQ0?=
 =?utf-8?B?NzZoNGowbFdJT0k3bkRuNW91bzc1SVZISHpWNWcrYXNNZTMzVExQdnkyZFI3?=
 =?utf-8?B?bk9pU0syQ29RWlg4em13OStqN21jbnBDdEdCYzllWmdCajRHTWpMSjdsWEtW?=
 =?utf-8?B?d2wrVTdiQ2xoNVVJcG5WTElFRUdLQWhkRzh4RWNKQm1pMW5zb2UvdE5VbzZh?=
 =?utf-8?B?Uk1pYUpZTkRoTy9wRFlkLzZaVVNvajlRTmJ1WVRqSkJzUldDeW5GWmU1RW1v?=
 =?utf-8?B?Y253cGpRQ3BCM2Z1cWFVY1Jlc09KVHlUeXB6S0lOWFZuc3E3YWtDaFBvcXEv?=
 =?utf-8?B?N0RHOFhDRUVzZmdhZnprbGlsOXI1Y2VUMEJURzlvRWRvcmJxa1pqbjhhYm0z?=
 =?utf-8?B?ZUFLYTJCR2wwR2U0ZzFMUVIyU2VXREhLeS9SQjZJU0x0S1RWZGpBSW8rbUFV?=
 =?utf-8?B?akl3eHpSVWx6MXh4M0V3TTJ0SFZQM0V4eVV1UWg0UnlTUC9qNFFGSExmc2xw?=
 =?utf-8?B?U1pLa28zZDhKcjJVS0hMcnNrczhYZjVuNUYyOTQ0T2J6UHJzUmdZdHRvcEJz?=
 =?utf-8?B?dWxzZzdYbUo2S2pxcXlrVTEveThQU0JCUFlIOHVWM1N4TWYwWDg1OWJqRi8y?=
 =?utf-8?B?Q1Nja255bGtxUkIzMnhpdmVGOHcvaDh4ZjF5MmpudGZaL1ArMU1lTWo1V1pL?=
 =?utf-8?B?QlRORy9xQTFHblV6Uk9yZ0R3RHNLQ1VBM0luY0c5VmVxVVA3cWVFQ2lNcnlI?=
 =?utf-8?B?SExBdnRPdFFwZ3ZhVVRRTVVKa3U4bjU3UklGU1hCYlpvTy9nL3QvR2VtMkFI?=
 =?utf-8?B?SDhySUZGcEhMdVJGbTJkNWwwWEpDYWMwQUg5YVk3QWVDVWVyQ2VEajhqeFAv?=
 =?utf-8?B?dkMxWUxqZDVVZ080K3NLeVI2dVQrZ2FsSmo2UUxWeVNpYllpdGtDYlZJeU9z?=
 =?utf-8?B?eXA3cHVZZWhMV3ZCbjZNSnhYeVBlaW80R1NJSFIyZFUxTUxIeklCV2l2T1dy?=
 =?utf-8?B?VTB3ZzhvY0JaVkEvU1d6S2FxRGo2Y2N1bFAwNy9kUHpUbFNqU0cyU01sOE1q?=
 =?utf-8?B?T3pWVjRUeWVsUVVLZEpJNHN3Q2d0WjJLYlRnY2dBV1l4b2p0cTJrOWQvL3ZT?=
 =?utf-8?B?dkNPR3J6WVJpNkpUZVVWZG9Mdk14bUxmRmE4K05zY3RKeTh0Yiszamh2V1Rs?=
 =?utf-8?B?WWczK0ZTQ3BoUWczdm5kaW1iS1VLYVdkZlg0MjcwUUpXTmp4WHJQTC95aTlJ?=
 =?utf-8?B?SHZ1dno4UnhKcFBrY2JtR2lDU1FQZ29FN2N1NnpJV0szcDYxalkzbW5wVXN1?=
 =?utf-8?B?cUwzZkZISCtpbEtoQTdoTDI4MlVjYUUrc1JKazFoQnppV0JXREJCZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e9c6af-f83a-41c4-e977-08da21a0fe86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 01:07:37.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvTQ2BlxzOMbW7hBQNV4+9jqo8AhCPyN+QFeM3MCooEQDoe8PHd/IgdeQDUeDbSNIv9QBXZMfhPnqXUxoXVqkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Mixel MIPI DPHY + LVDS PHY combo IP
as found on Freescale i.MX8qxp SoC.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Rob's and Guido's R-b tags.

v2->v3:
* No change.

v1->v2:
* Add the binding for i.MX8qxp Mixel combo PHY based on the converted binding.
  (Guido)

 .../bindings/phy/mixel,mipi-dsi-phy.yaml      | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index c34f2e6d6bd5..786cfd71cb7e 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -14,10 +14,14 @@ description: |
   MIPI-DSI IP from Northwest Logic). It represents the physical layer for the
   electrical signals for DSI.
 
+  The Mixel PHY IP block found on i.MX8qxp is a combo PHY that can work
+  in either MIPI-DSI PHY mode or LVDS PHY mode.
+
 properties:
   compatible:
     enum:
       - fsl,imx8mq-mipi-dphy
+      - fsl,imx8qxp-mipi-dphy
 
   reg:
     maxItems: 1
@@ -40,6 +44,11 @@ properties:
   "#phy-cells":
     const: 0
 
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle which points to Control and Status Registers(CSR) module.
+
   power-domains:
     maxItems: 1
 
@@ -48,12 +57,38 @@ required:
   - reg
   - clocks
   - clock-names
-  - assigned-clocks
-  - assigned-clock-parents
-  - assigned-clock-rates
   - "#phy-cells"
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mq-mipi-dphy
+    then:
+      properties:
+        fsl,syscon: false
+
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+        - assigned-clock-rates
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-dphy
+    then:
+      properties:
+        assigned-clocks: false
+        assigned-clock-parents: false
+        assigned-clock-rates: false
+
+      required:
+        - fsl,syscon
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

