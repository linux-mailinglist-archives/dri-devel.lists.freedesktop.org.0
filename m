Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59742500661
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336E011209B;
	Thu, 14 Apr 2022 06:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6861911209B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hinQ4xF+qKTzkSsKsVTnbnSuyYADIsX/I+8IS2U3Ww5IsOj+vhngOau2iT9ix8rkhjuxUcH4qshLcuwRS3r+82Z9A7b3p22KbMHrbBHbC//8CpKuxE00bdU77Bj2mU7fnr3wJU9KJwBKEdON0oEqU5Pd+ODO8JFowr/GLglFHypn0BrgKJr89MKeRtAGLHTm1TuOJDT8GHJ9EruyBQcn1qLj1xb9P0KiCdbWnMeGA1vFddRKf6ig8WL9st+7kzlARqi73oies2e3kQdbh2ojW0Brx9vVs1/2J1r55Rg/FcQMc+Thty7m+jSM8fZGjpx+6bcIhYwXVoMXgwzuaoxo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OysCnXbfG3jgkz/UBNk5z1dEY6LvOl0+eSokDR93wQg=;
 b=TByVS3t19vGDWXI+jvZhPms+wDX0ivPHv9Gx3ObNIblsP//kGDnVTzsJZbpYWYUPcUCzHNQhR+IxL4VZAYX0JfI0hRzsWW4hqYHmPX/FK1UxchoDujGO2w6G1xrj8zenuv2DSeL0ISxHsw0GY/XUoTpIVIVOZTilr1pIFoI7IdHPF5mtwjvgP8GMHbCR5TNJ3u7VsV2KE22skKekCRYPqBpaURli1Z1BWhbs6DnDvkohEVc3FSFmuJQ2rJyg5SxsGFr4kJGfPjM6wyfXZvuY01+WIdN2nCi7BGlDP7WM8S1fR73hpJM3CLpxXYUsDI1VTvVozbYxQrBThKBjGwpxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OysCnXbfG3jgkz/UBNk5z1dEY6LvOl0+eSokDR93wQg=;
 b=e+Mv5Wyd1CSLsYFM1Uv1YCIJUknXqfLyAWzIFQLIPUMwS4f3btw2z9GsLUkjYcqsCkoe0gqsyIEXUIfSrmbKvo+uc+9Y1ZGazbBEYEmvvojez5FIhVlpi45TaZRZ3/nJhiTA7VZxjACKI5iZ6kkgdtM+qxmQoHfjxhUQvqE1TVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB7PR04MB4457.eurprd04.prod.outlook.com (2603:10a6:5:3b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 06:47:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 06:47:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo
 PHY support for i.MX8qxp
Date: Thu, 14 Apr 2022 14:48:57 +0800
Message-Id: <20220414064858.405096-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414064858.405096-1-victor.liu@nxp.com>
References: <20220414064858.405096-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 825ddf17-32b1-4d70-d9ba-08da1de2b127
X-MS-TrafficTypeDiagnostic: DB7PR04MB4457:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB44575A9CCB342C7971E1BC3F98EF9@DB7PR04MB4457.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iD+ws2V8XxA0+0hFcr27GKhKijmhoHU9XM23DsOH5WlfVmG4umeY+7N7+KeKhWJ+HayA7fD4ZCzDTiWHi5sAxitOs4LlibsslxQYVssQZXP5Lk3+FNF50y2yYhQQtL7SBbeaWXJLmABXzpwhxBXEVqb5LhUkyJwIW+QB/FpYv99wvYlZ04Hm3hJOnDiAbysHwUJoKe2o3UU/6UpsZoma8juLG77b3yQUYNEqTqkrZFT9LIPvkBSx/KzgPlJlJsW5ni9zxuB7HcsQ6OrAp4qhY9HC3/VGvecjFiXxgPQybLxVemb2C6Ki2IlOjl4Im2aD8Qa6IR4tSQaRGLaLl/0PZvfuyIg1DP6Tar86MJq6SJhhPJ7sbmYDC7jjEijv9yttFlVBihIsfq5wTXeeDEv3PZYadXHxOiag7XFJIs/Kzwzrpmn7o+8ibDBft0li2xTWHvywyUs3AtqU9Rwf3dT+qQPzXAsAM2QgIa/61GKgn/sVCPROhdPd/E0KrJsuZkTJUPpMTZWb5iJvlf9wNndp+tgI9KuaUCO+nleMRo47nDsCcRNEPbE49qx8OCeb665otp8dt+PtNX9+/i87ib+OQZDar6zk5CvKPrLWTqlH+rU29oJeb0qILtnFsrwU9XTgdCKq6YNp6+YKYDPJgtBb/CQ+kCmDTn3oK7IHlokMt3olWhh0Oz0GrRo1Nt21f7FyEuA0C0dwEl4K6doAmTOCjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(316002)(8936002)(66476007)(4326008)(508600001)(7416002)(8676002)(66946007)(36756003)(38100700002)(38350700002)(5660300002)(83380400001)(52116002)(66556008)(6486002)(6512007)(2616005)(26005)(186003)(6506007)(86362001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1IzRWc0QWxKRjdmekxiOEhUYnBIekFrZkc2aWR6TmVlQ2YrY2FhcDhmNnlZ?=
 =?utf-8?B?RytSTWlEMnNUOExnRmJMajJUSHJyYS95UXB4cmIrQ2E5NUJqY3lpWWxFSlBI?=
 =?utf-8?B?Y2JCYVJLb3RaRU5CZ3NEMVhEVS9uajZ2bWZvNTJBOTh6MndxRHh1M0lHZ1Bm?=
 =?utf-8?B?aWFZVnZPcTRxWnpZTkFtMEpKdkkwd212QU5qcEtVc1loNWhvRHRkZUNvMUto?=
 =?utf-8?B?TERWQlBIcmVsN2dudU5MNkV0TGhtckkvaEhlVVNLYXpXZ1JEVmZBOFNzeWRk?=
 =?utf-8?B?NkZwbmpTWUVUa3RNaDNEbXVZdFpQRkZmWDdMaktUUFNzSEl2dkxxbUdtM2o1?=
 =?utf-8?B?Vm1zYzZFVER5b0hheU1kbXNneGJWRjJ3cTUwdWNpTHhBNFJTZk0xZnNYQzAw?=
 =?utf-8?B?QXZPUFhrTGRXc1NVS2Y2NWtPMkFCcDZFZ3FPMEMrQjVaNnZ6aFkrYmdsQTVT?=
 =?utf-8?B?T20zNzlleG15U3RYSlVXcjFOcXlPMGIzeFBKemRzUHBaZWpkR2tOR3BuT3BS?=
 =?utf-8?B?dnZid0E0bHE2NWMzU2NxdWJST29iQmk1UG02Z2h4NHhNekx6a2xhMnYxVG1J?=
 =?utf-8?B?VTdtcEdPZXJDbTB3MTc5d0szT1RjTzVUSUlpZ1NvVzN3ZGpqbndzRGlZanBq?=
 =?utf-8?B?a3JaZ0NzYjJWS1JHMWsvVU9Mci9ETWszRUxiSmM3eVE0R1NOeVdLOWdvOVpq?=
 =?utf-8?B?d09JUzU3SGd2RG1HWThjY2E3ZXhac2cybWMzcWp3MHo1V1pIVlh4OUwwS1NQ?=
 =?utf-8?B?RUlWcTBHd3lMZk9YT0JpK1gwSVEvMDQ2dk5QZk94ZnA4MktMekloM2I5R3VF?=
 =?utf-8?B?WWpMb296djBLb0hoZHZvTXg1b1Iyd3RjRWx4RUdXRzExSWFqN0pHRWRERTdp?=
 =?utf-8?B?NVFCZzVwWXNpOGhjUktDRWdTbzNjM2dnaTE2Z0JoUlNIaXg4N1hBays0SEMy?=
 =?utf-8?B?d2NFTjhCeElZcnUzdTJTUUg4L3J4Szdwa2dJVmQxekRCdnVSczlxKzRoVzdl?=
 =?utf-8?B?ejNrU2V6NXE1cFl4cmdyZDE5N1pDanpGYWxwUjArUWQ4dmUxeXdnZXo2Y29h?=
 =?utf-8?B?WXo3UlhzN0crK3JOUFBwY3lyK1FvZE1na1JSYXBhU2o3TTNwTGVDdVJOMTd6?=
 =?utf-8?B?ZTVENVZFWkkycFl6M1REWjV0enRMMFZ5RTZOdDVJWnFBa2lEU2g5UXZQSEli?=
 =?utf-8?B?SHpRSE1kSlhpUFB5QWl1UkVYOCtHdkxQWlROc3hsSXFhejVhSnVYYVovSGh1?=
 =?utf-8?B?bE55dkNXTnIrN0liSkRLcDV0MFFmU1hteURIS1BlSVhtU2U1dTc1eitDaWRv?=
 =?utf-8?B?Y3BhajM1K0FDd2h3eE9Yb3BjUWk1dzJvMmdxMStaK1NLdlpjSmdFZ2N4OFB2?=
 =?utf-8?B?eVY4NEFQMkRxcndDdTBXSTNEV1U4cEFmdHcvUDVTWUFJSEE0QTFpNHdJQS9o?=
 =?utf-8?B?dE5saVZRRlNHWHJqdkNveUlyTnIzQmJtTk9BajlpdHJ6OVp3aGErc255WVJq?=
 =?utf-8?B?WjZzbGdSSDk2SzVaUVlKQkJsS25UVHRlaFlKRG5iZno5Sk1nZyszQTBOKzIr?=
 =?utf-8?B?eTdram5pVVpqYmpTakIwS254SXRkUUt2RmJQT25TVmJzN3ZKcGZoeDVWSUdy?=
 =?utf-8?B?QldKVnJRVGJidEVLZ2dDeDBhc3JnSE9PV1V4ZUpucHhuRmVLRnZWVnVwMS8y?=
 =?utf-8?B?V1I5aFZKRTYzOUl3RmNmQ3dDVFE5c1N4Z2I5dm1mdWFrRmk4aEdtREt0TWFP?=
 =?utf-8?B?cHNVYmRxczJTNHBVMEd1cElWWFZJMzQrdXc3d1FLSXZGSnh2ZlhtYXJVeXVB?=
 =?utf-8?B?NWtXY1VWQnRYYzNaeS96YVZyb1E0clBIUkt6VFQ2KzlzT2RMYTFzL3dyaDFF?=
 =?utf-8?B?S3FaTDR2Mzg1NjYrVi9LQVRXMmJ0bHlZMW9tcTBHTWk3YzBlME0ySFhKVUxh?=
 =?utf-8?B?M3NFcGJsazg1YytkOW9vMnFieG5CRGtLZkFsOEtSa01GeHVZVUVxOGcrSklK?=
 =?utf-8?B?S3Z1a1RWWTRRcVdubi9VM2Qva2dFOVVHSktmTkNrc0FkNGcwUXZvK0pyUlgw?=
 =?utf-8?B?OEdIVEwyYUtaVm54VHpZUUY1aWQ3cVlROE51K1lSUlhpd3JvSXZoTVZjVlUr?=
 =?utf-8?B?Z1ZkWm56S0FsR1RVNXZadnhvVHFONWhpQURQTmJIVjQ2TDFFLzUvbnJnQkU3?=
 =?utf-8?B?NzFSVkpkdkpFcmRuMllzQWh2TEZuR2NXRWRWbldCdTdURUZmSGUzVzJ4YWU2?=
 =?utf-8?B?RlFpdzJYcGwzaE5hTi9tUUhJTUJneElYcWN1R0VYWW1mYU5aMzJYc2p2MDV5?=
 =?utf-8?B?MHdtbFlqbHIvUkN6Z3dXN05ONzBWT1hWOFg2cUN1MUZuR2VCN2Zadz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825ddf17-32b1-4d70-d9ba-08da1de2b127
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:47:50.0839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHXgiXOJb+RESbVvaKN5aYbO1LrYgqkd//pKQzqCI/bjU+kvP24RnXOtDl05sFqZcrOpmF120TUoyrdGgCOX6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4457
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

