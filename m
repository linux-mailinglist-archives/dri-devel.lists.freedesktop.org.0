Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C850069C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4F10F237;
	Thu, 14 Apr 2022 07:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30063.outbound.protection.outlook.com [40.107.3.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC2610FC8C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxejaADVjmaztHg4K01nldj/1D95T3Xx6sYB5TAesAvLp4R4XwWxX4b1YciU6bTCYNEhoigOuGXE+eH3MH1keSdSUxmXhmKSgkAQq4iMbX2eHQFtRFuMVy7AXsuwjeGtJluaW5VJRYJJOEbAC6Yl1FLwLYUbzeSI+bi+z00MWN8uM7K+/zCKV77ltR88JpCjhBN8tK7XwIPyy1yNdAC2HS+f8oBnBmreUjFJo7E6UqrFPTIExhdcwpIKVLn75Z27zpR5zV0Vkv5z+b0xNcv/mQHMnGnQf3A1dAVFjg1X2yimVfMI9XH6nq7IGoMUmsnt03GA/6luty1mnpLUNFU2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwVgVujLCDokFEM7c0bPtR5ihAMPkZO/ohpa4ZORM/I=;
 b=LG1p1feeDa4tEImtL1mRI/iXTAz4ErpW/tDqUsoX7jS+ccmBWYouGsHlNQBnpxcrdiN5u6TMWgzVCyh94RP3rH3QD6k4O3GeV1NiOqp6SUKiQR/6hm1HIANZV+c5DwNAt0+8ud6vncW9XcEO8dNLEwhg4gfgB7j6V3pqETaKbyIdz9bZFTi0ZcXNUjD6bL34OI1LLYHIswa88tpcNju4N36rcDIXUObe3ErB4ly8v33dByVLRIz62gjAnH4ven9v3ZPd9N/JoNgEahYgIFDboommCMljnwXHD50LlUT+7DyQEELRyeh6guVMFeFfUMEU4drFXWPA36Mo7xt4r8rO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwVgVujLCDokFEM7c0bPtR5ihAMPkZO/ohpa4ZORM/I=;
 b=DRpGXdGRUv7uZzQMEEuGBCcYaBZceTtxAd0+uaI6Om0PcZq0vKICvlk6HsZJCdBSX0kPrJkrMQMbJmL1DCBOJh1AsG1ab6mf8LGMMJVBl11Oou3OY2xoDsQfTsS0b0ANV4gcc8fmayFPK+wuWlejnz38YONPHdlLa7TKKFYarNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM5PR04MB3027.eurprd04.prod.outlook.com (2603:10a6:206:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:09:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 07:09:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo
 PHY support for i.MX8qxp
Date: Thu, 14 Apr 2022 15:10:38 +0800
Message-Id: <20220414071039.423271-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414071039.423271-1-victor.liu@nxp.com>
References: <20220414071039.423271-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193c7933-d7ec-40f1-d10b-08da1de5b4d5
X-MS-TrafficTypeDiagnostic: AM5PR04MB3027:EE_
X-Microsoft-Antispam-PRVS: <AM5PR04MB3027DBF941EE90B60FB669CF98EF9@AM5PR04MB3027.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8gSz5/KyecXHYKcsl7nMpCQ0wXTRZjIVqrQ4jtOkGm+VB1S0JHUjZG01Vkv6oRsLdf1IKISNZLHFYphovH4L5JLOZKjaNVaX70Smm/8qFjjhy9vwAE4y31obbPUep4JXFPXsR6XYHQBPsxU3wObYDJyAZl1CDKVobgnaXKfW5aDGiXbS58nvaA2vt1BlqdTTO6kXRGqRPvOBTZd9n5P+04r6n/fIOgRqueEvtZsNjuo7tNY7GHNM0zFN+lH4rc+iWR1hFaowYlRNW9JxibHAkW88MvfEm7TBoj087vZ14qYsLRj5ua3WdqELPcMWDKwP3VmShYyR2Psc+0OydoR/sX+uhZCubrxVqTEvdhEAxA7t3+iHjkKOj9iMj6PzE/AefZtasZ8/YNVeaADSLoYJx3oHaD8jhKw8oHoE8rFwSU7AE9K07ZDMixKi6pfBaca7CV17kQceA+FOPpvbBWrut2eyvMKFhRkFc96Y3tbr9VdSme0MbtPBwNW6FiNBtxFN4gzSpB8DqWbdK/oAgbVLXvQgPQE1Vx7Z65R281E9auo8pkPchFgIduacFWXLFKpJlmX63C6v1um7Q0gpjB+N65w4RjZXFThpqxcKLdJDEwOquoOF1NM42IMw9t/fSR046yQ0E0X4gi6pymTMDNdKViuHhCPxKTRiFwEdMyi/sAXtwARTleyv2GXm5ngdAzbQXjuuHHrMiqybwDvJLu07Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6666004)(316002)(8936002)(7416002)(66476007)(4326008)(508600001)(8676002)(66946007)(36756003)(38100700002)(38350700002)(66556008)(6486002)(83380400001)(52116002)(5660300002)(6512007)(2616005)(26005)(186003)(86362001)(6506007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJicG5JVkZhMlA3T2V2dnd6YjBLNC9CWTFNQTAwa2EzaEhJM0thdStCSGpu?=
 =?utf-8?B?WW1ZSWt1WjBlQThiQ203d1N1Wi83alovWk11cDFZNFVOUnB2VlM2c2FBZFgv?=
 =?utf-8?B?d1FGb3dYekEzd1BGM05LQ3FSbFBuTEhWU0x4THdVTUc5d1ltWFN5cXBFUCt3?=
 =?utf-8?B?cDlwZzJwbXZsUUpkb2pZRjM0cTBxckFnbVA5bFVkVEdNK1JtVWY4NkhnWGVH?=
 =?utf-8?B?aUJpd05oaTFNdVg4ZVQyem5YMUx4TmtmRTVsT3hpdFdZdlFraVJzaXFCdStD?=
 =?utf-8?B?bXNtVUZXNXZNaXRnbTJ2Vy9KSWtsaXpvRExyMFY1SjBma0pVQUQ4N1BlUUxM?=
 =?utf-8?B?WEczZzRsejJJRlVxMWRMUmhjZ3Z6d3pVREZkbmZOZXpZazA0VHRCUzVCSi85?=
 =?utf-8?B?QlFNbUJ2Tjh6SHJaWVdFWVNQeVEyL25JMkUyblAxZm1ValY1OGUrNzR5WllV?=
 =?utf-8?B?RWg5QXpXbTh1alhZWWJjdFMzQ01lMWJhRDQzK1ZwSEtoRHJ0Z3ZlTmdxVS9h?=
 =?utf-8?B?RlZvNzRRaFE5dDRlemVlUVNzRkFsUS9NUkRCdVRjUk1qSzNJRXlUZ1BhbkhQ?=
 =?utf-8?B?QXp1SzIrSVZjang0QWJmYWxFZSthcXJsMGZ6VHIyTVE0OGwwanV5L2UvUTNW?=
 =?utf-8?B?bXR1YVl3VXkzYmUvZ2wxWDMzZWhZSFo0Z0FYakhMQXJINDVuMU9SWC9sa3Rp?=
 =?utf-8?B?OTM5WEU3ZGdLOGlUQ1BvQ2QwckdkWnFPdW56bUdsM2VKQmZOMXQ5TFZrd1A1?=
 =?utf-8?B?Z2c1TlVXU0NLUEdBWFo3YzY3dkNCRWIxNnRNUnBqT0ZJdGgyQU53VDFiQ2M4?=
 =?utf-8?B?N3dmaVQxUnJPaEo5QWR1bmRsQ3Z6Sk1mS2hyODZzT0lsTlZ3TUJqaDYvbmlQ?=
 =?utf-8?B?WUp3Q0N0cmlIdlZrVWZXaFFzaDM0ZlgvYWo2dGNhRmJSUjdzOEp2VUpneTJD?=
 =?utf-8?B?N3hhZ2trSDgxUlM2ZGk2dDRzcmJ2L0g5dE5VcG1jMUJRUTBkQzZpOWRGVDhN?=
 =?utf-8?B?T1pFVmtyVTRDb2pyNlpoV1NBL3hFNXZlc1Z0TXZJTFVBaXlxUnRMcFUrd3Ur?=
 =?utf-8?B?U0VuNFhjYnR3NldGcVNCaCtZUmNvQVdSdWdxR1J4Rmxtc0VmQ2pqZHZVWFF4?=
 =?utf-8?B?Q05na1B6Mksxc25oeFNRK0tjdm1SZkx6N3ZqV1Zka1FsMEJvZHQvTEtYTGRU?=
 =?utf-8?B?WG9lM0dJYXdyVXgzMm1aZzdXbU51cUo5d0JRSjl2MzVtcDNNR0Vrbm9reGNi?=
 =?utf-8?B?bHlOdW5sYVVrb0NIRndxU0UxSzY2bEtqNWFUd2VmY1ZTTHUzQzhmRS8yNXM4?=
 =?utf-8?B?TExMM29iRVdYbW1NMDhUU2RMYmJuaENlaDVnM0M4aldIZ3JJbHcwaVdXajFE?=
 =?utf-8?B?MzgweTBRbjJ6UFVmY2krd3JkaWJSSklwd1ZUdUVYclAzbGJJNFNtQzhEaWxU?=
 =?utf-8?B?dU03N2ZuM0pCRElZdjg5LzhsWlg3TFdJWW41bkUzUk9GTWkzT0JJUDhlbTZx?=
 =?utf-8?B?bC96aTMrWjhMa2UwZzVlL05jU0MrNkZhODhSdkhCNmpsUWV4RVBac3Y2d2NJ?=
 =?utf-8?B?ZXdkZkczb0orRThSczRUQjRWTXlGWlU3cTZ2RDlxMXF3dFN4a1VaMW04ajBU?=
 =?utf-8?B?bFJqZXplSnRuZVh2L2NxYlYwSklUTEJjTnlQcFJmMUIrVmtMLzhlaCtleE9m?=
 =?utf-8?B?MWRlSm5CbllFREV4akh6b0pmb0JWSVhKS1ZBbHFUU09ETVVZeFJnbGlZbWlU?=
 =?utf-8?B?UXBqWWY2TFhxdEpheU9sUmE5aHhPWDRKOGxSRHZmZTRHb1JyZ0NBNFl1ejkr?=
 =?utf-8?B?SkJjeE5jV05aYU4xQ2tJOHNTelVaMldyRTNCSktFbitwRkRxWGRnczNuaTdo?=
 =?utf-8?B?K1JjbjJTbllSaDZQTjFRcllwUmgwbGxjWEYxNHl4SmhUWHhqQWU2dHdvK2F2?=
 =?utf-8?B?TXpWYzRUYUp4MlZOWUFqMHVDazRzdi9pSDhMVS9kSllqMDFBc2tCWFpqbkVF?=
 =?utf-8?B?WWdTY1JRcXI1b1JhTnlDNXpzUmdwTlRlUGJ3akNITzNETjRYWFRGd28xd21W?=
 =?utf-8?B?WVBwSGxRVlFiVjNrRWlqME92QTlKaldOdXk0NnRvL29pNHZZa0JYSlo4N29w?=
 =?utf-8?B?MUtKVkRhb2lOcndiTFNWc1BlYnlZcGV2ZkFsbXAyWFM3NnRqZjFxR3o2dlov?=
 =?utf-8?B?Sm00Y2V6SXQ1UVNQemNzN3c0NEVyOWJLWUd4blNJdktXQ3BMQ1N6TDkraVlZ?=
 =?utf-8?B?OEdFSkEzMitlZmcrdXdGZkRrYlduVHlEVytjaG9mNCtrMU93SlR6U1NFRjht?=
 =?utf-8?B?cFlrSE5iMThiaXU0K2xGYXVmRkxLNmcwekpTa3dhd1NNWnREZ3lmdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193c7933-d7ec-40f1-d10b-08da1de5b4d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:09:24.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GG83gnQLk1XZ16Y15mpwuE58I/JDK7aFjEORqkYQtH6EFObaFi5Y+ZltdUXwdV2+smxfQ+Xg1pxtczMThwZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3027
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

