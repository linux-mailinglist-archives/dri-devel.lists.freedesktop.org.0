Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D14EFE5D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 06:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DF110E132;
	Sat,  2 Apr 2022 04:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7AC10E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 04:02:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhGu3GA+8V9Kj01dNYRm5+Eci06vW3XULkMOQL4gtQ5GomcbMQl/SZleH9jwIfkP0FjCQmg0chV9LU2vdg/Fq1JvA1BEveA8APEERXqKwHZ7mcw86yqnD76vwOvELwBPscVEuzv0zAylKQv3l/EGcDERwLlZHEvItcFosBqQ1/DTpLRLk/n0dDZk44VQo/IxKM6Cqet/g4eF1kP6uR/vIPSKCNA7CqNtJM29ueZadEb+q76BVDyV15OcRK8cMaoWuhMFO+fNb4keElg4m4xsh71D3JtN5p6x85DY75/T3qkBa5DjbRnDlCXMIjTCys0t36Ah0FFJgO0d09j4gDft0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGFfS88Z0L9svuW6iyHKRmljyrsYlgWUs4+4IejC1IY=;
 b=IDGcaazyjlsC43b42BG+7ATijUe0iBvl9mcwA2IVv5U3uPNSTuODLo4VYAykxcwwXZnTHofQk7XPBu5Jm78K+Od7Y3qtyZhQczzAoC5iK2v86EZicxl2WBJ4l/ApDf2hFszaLnycQsNBD/wA5VYeYkzY50R5UjNa27pSZNqobhgTH/sBmEGqd2PUKmson7QNsHKWP9tOXey3DUh04QHj5CL2thS9IZqijUNN8LIi0rKBB/hl44n6Vm1DJpzuGgv32On2me/s60QlkCC4eMe3W42SdTjllzlqK+v07A4o7M2m5/3alqmz/JnWvdqZq84mfcYAkOgbGgEWTgswVocf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGFfS88Z0L9svuW6iyHKRmljyrsYlgWUs4+4IejC1IY=;
 b=NOb3Kr+inPxnVrvc8jKWNkrFOvqG1jVKGHIW+WOeqpz5V8SATQJOkGBy+Cc2gk1gk38RX3Rsg6eHfReM4+9YryQIXzh9sainSktVo6IMMjZ1ZcqWAh+8kcnoUb3yJWjD0x5eQInp2P5hm5VjNRmLPUpzz8rM2Ae/8kHBNLtqhk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3210.eurprd04.prod.outlook.com (2603:10a6:7:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 04:02:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 04:02:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo
 PHY support for i.MX8qxp
Date: Sat,  2 Apr 2022 12:03:24 +0800
Message-Id: <20220402040325.2465222-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402040325.2465222-1-victor.liu@nxp.com>
References: <20220402040325.2465222-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc61b012-b05a-47fd-6263-08da145d965c
X-MS-TrafficTypeDiagnostic: HE1PR04MB3210:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB3210F1EB76D6046AACD9F70098E39@HE1PR04MB3210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lwJTgdwAu6L0hHDIsybjw7SCWgG16simiPZSP3sI66/JCi0DKbR3VFYOwAMSu4B9L9GOrAzDpO+xhXvzhk1O1LArlcC8W1URLB9H+JKBcfxd58nJToTICh5Ttnr1Q/i+lvapHRXIkZIWWDCu5OT7LX26e2xcVmYE6zWJguEKdI/zNN4tR7e1EUl84V+HwDrp+lQhB4cJPFiuGp3k4Mbqs+Lhx321Hw0C7VvckRG7VpL0Lfk+FBcL8dDQAuTt5qTY3ptDDVsT9ddogdGsnLORNw20bawvkQXZBL9Pbqp+YhIxn92DrrZSo9T5ydTxBzbcZk4sr5haaEM4cRc127xE03PUkyjw+H7qD7Jzv4Fg8Cm9NIUkeH7iMcu366UnVZd0K9YdOP3yoBCKGDsIPlpijpbO162ycB4dMlnp2EC6LUqeeoPaefFnCceEbG4T3sttUq+OgOIcIGU/d4+f5RQUD47qGg0nXejg7n6LPFyElsj4upchgDQIr52DVE6/q8p6i5v87k1oYSLaLqqugp+3/KohP+LhX6ycx+1lNQgo2emyXgTa+PkxVwT/iYlaitYdJ9RvLSrdSneE1d4ej/zWacEATVtqimuB7R5mCHmx0jRawpyqBdnolOBMuktVdoK/dUjqY94/9LrR0Nz1CZmxBUu/zYzuJ56dsckmHiOgesDsry3ffojdO1+EouVQsKVjcRaLWJWz6LH0zUs3I0fzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(186003)(26005)(2616005)(1076003)(83380400001)(4326008)(8676002)(66946007)(38350700002)(66556008)(66476007)(38100700002)(2906002)(36756003)(7416002)(5660300002)(8936002)(508600001)(52116002)(6486002)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dElEUEIzN0pYVmVadWZpZzRMdnZhYVRGeHJzbzFWOTdyWTY4NUlJbHJDTEtB?=
 =?utf-8?B?RHlJRTJCR3d2b3Q5NCsxNjZUSkxaK0svU01oVU5QUmFQZnk3MWwwWEFFUXlZ?=
 =?utf-8?B?NGV0dWlRSjZlL2RjSm9zYk83bnhTSC9wUDA4TkZBVFVLM0VRRk1HNHhHeEhQ?=
 =?utf-8?B?ME9GK1RDSFVPbUJEb1FnVkJnM3Fab0pkNVdidU9XN2ZHMXZhVWVrN21hc3Ey?=
 =?utf-8?B?MXJKeGR6RXdwQmpnU1ZRT1k4Zy90eU9IZHNoeVR1UytYeDhqN1V4R3pJdzBz?=
 =?utf-8?B?Q2RrNVRJVTB0VWxZd0NFd1lVb2t2MEY1NFRRRWo5WVpUQ1AzK0NrSE5jQ1BV?=
 =?utf-8?B?UDlHWXhjckxnY2RBUVA1OEFiUHdaamNVZmdhS05aRHJUb1pJbTZBMENnR1Ew?=
 =?utf-8?B?ZnlsSzQ1OUEzSXYvK3J5MHloRXE1UnZ4VklmOTBHMWNCa2NyRkNOWnJPWFdO?=
 =?utf-8?B?WUhpd0JOdUZ0SGpnZXY2QUIyWTBrcUxRclFKWjQ1UHN4YmtrQlQ1QlNuUE1s?=
 =?utf-8?B?amNFa0s2Q0tiaXFDVGdFZVBPTTdsR3drTGpXWVhsUkFpcjVTUDQrdVZweGN5?=
 =?utf-8?B?Wk5KbUpZYzJzSW1UdzB5VHB2U1RjeTlMd2pjVDBpTjUyOXZtbWxzZzkxZ0JF?=
 =?utf-8?B?ZENVREhJMVM3cm45UGFGNFI3OUsydTFDOFc4SDROeVNnRGlQM0RVMWdvYldQ?=
 =?utf-8?B?Ym5kbHQxaDNuS05JUjV4TjZQd216T0FpTHBvaEREUGUrMm1GWVlROWtZZWNj?=
 =?utf-8?B?czUzRWVYdzZPZkcyL3VjQXVXdlVWUkx5M3BrTXlHQUR3NDJ4UzlVcUJYeXlF?=
 =?utf-8?B?dWtEdm5jS21qWm5pa1VJT2JCR1RGWHlFK3lobUhRbzhrR2diVlhHUWhvY1JK?=
 =?utf-8?B?Ni9rM3YrT1d5NC9iRVAwdy9oMFBEdWJQTitJVUJzVWlGQmNBWllCdXRVVDdz?=
 =?utf-8?B?UUhqbnlJc1BqZEVQOGgwcmw3dDFLYnZ6VklOeC9ESDlIOUtVMUgyeTFrK1Uw?=
 =?utf-8?B?SXdBMUs2b3RVNDFXZG12ZW5nUW1pOGtOcWxKeG1Tc1F0U3BsVnFEMTJ3V3E4?=
 =?utf-8?B?SkZjZHg0S1JxOWhyR1ZURlk2bnN5QkRVTGhqQVpYT1hhR0NSeTRQS2VCb1hs?=
 =?utf-8?B?Vm5BTE5ZRURwOGk5Zi9FZjF1bDc5NXJIT3c5bDBCOVBWRDFHdURYSlhob0px?=
 =?utf-8?B?bFB0QVQxS2twTEhZKzYzK3FDckdkbERudUs0RU1qbU44V1JUZGJHdStxOHk4?=
 =?utf-8?B?TmZJbEcvUnNLTjkrZEFydFRSc0dKOXE4eXlxU3djbUtrcVVoNkV2c214c1Bz?=
 =?utf-8?B?UmdWNE5OVFpOZmx6MlRGVzlMaWNZdm9PdEhXWlphc2ZXdEV3OWl2ZmU0RVhp?=
 =?utf-8?B?WWVjOWk1YUVoTUNEZnl1ang5ZFhvTmVUbVpHZnB2MC90RnF1R1BIa2lDVGsx?=
 =?utf-8?B?bFE5ZFkyRDlIRlpkWjFJUnpxOS9lb1lxKzRGdjFTb1hiNUV6S1lyUDQzYnJw?=
 =?utf-8?B?R09vUGdEVWhzSUEyWktmRW5ZMVcxN2tQNGR3ZFd1NTFxR3V5cDNNZE9xZFpo?=
 =?utf-8?B?QjlqcnlWaWRHM3RVWW45TklQaDIzeVQ4c2ZleDZTL1VEQkFhdk1TYmEyQks5?=
 =?utf-8?B?YTIvVFNBYWlPOXRvaDhlSW02ZmJYSFNRV3JlU2x6bnI0UkN1T0lrMW1Vdmla?=
 =?utf-8?B?RVU4TGRFbituUTRGZ01TMlBReUpBYkZNZW1GVXFCSkI1U3V2RXpKSkg2b25J?=
 =?utf-8?B?MU5nam5qdHNseFpLTEh4aVhTMytHWFpxcitaWWlJRzFGMnp1T2p6Nm51bkpQ?=
 =?utf-8?B?Q3JTNTZkRGRpN2thSS9vbnVIZ2Q3Ykx5QXozYlUzRTBLemhZREozZmo1aEZp?=
 =?utf-8?B?b0NSc3F5TVg3NDJQdUlNRWkzd0d5UmRMK0t6ZmxWU25xSmFDaHkrZ1dHVE56?=
 =?utf-8?B?cEc3OUNXUmpaZk52UGY1bkM2NFdZWGdLTGR3N3VwL240RzFlSjBKWmNsby9U?=
 =?utf-8?B?WXdtaFIvdkRhZ08xcEszMmhTdTFIdXJDOWI0M1VDYk9BRzdwV1FWSUt4d2Nw?=
 =?utf-8?B?eFlPL1l2bVd0eHlSYlgxQjV0YkhPQ0xOL0l4UGVGWEYwY2RRQ2NBRUtZeWps?=
 =?utf-8?B?aTVQVmdTUlNtcHRwVmhGTmFEOVEyeWw2WDhxMHZ1a2NuNVk2UnFqTWxvdmwv?=
 =?utf-8?B?VWk2QXA5Y0VFaEtZaGRHOGJTRFlPdS9FK3NCZ1preVpwTW1hWGJSeUFYMFZ2?=
 =?utf-8?B?QWQ2cjlhd0JjQUJDUVEzRFZ2L0pqRk9PaU1TZWFTTEtRcS9NRGpqSzJQWTFE?=
 =?utf-8?B?aDFOSkRIVWtGRVdIbkZDWGxSMm1JVTVQOW9NdkY5S1IweFpycG1PQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc61b012-b05a-47fd-6263-08da145d965c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 04:02:21.6477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx197uvXCOGpJD58fWtYiJzYjLJY9QHnAxaBTaZZp1R/DkmiXm1FtG35w7jzNUhNzB0C3utxPmw0LAOa8gfZmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3210
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
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

