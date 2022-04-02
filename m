Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87A4EFEFF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 07:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091C610EBC4;
	Sat,  2 Apr 2022 05:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5309810EBC2
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 05:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLR7hqpxBR/fvin7OZsIYvsyhDRXG3Bh5SOoinUYyfarpl01lQHfht1jFeHUfJvNeDlB3QnfGOtJkBEWuR+FAXN7MAR3glgJxniDs5GSMk4SwVMzczaGi8GasvdSXYDZl6aMLp6+8F8poQK9WI6byo/7kaW9Ruf6qXZPV8b5yW4jok1yJxF1kficMXOtC5s7Qh+1cKttSN6yFD/cIkfz7jcNzg/ZInmOKYNHub3CZfEvQqfm9gHyZl6j2pGx6bmkDRqa/24dGwMCGc81NdrCsuZ11ciui0/TjlKjkzBglvo7bomS0zkUPVw2miN8y4/HZFWeHAxR57hhA1LFY6zUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGFfS88Z0L9svuW6iyHKRmljyrsYlgWUs4+4IejC1IY=;
 b=kifb6KAOzDsZBjeXAYr5ro4NfiuYCcxcQCQFpdPTQezvAezQxNgpv+iA18/xCKID4KGf/km08m2JpCIaUq6xh2l0Ze1hbs6rN9oOjeVNgmUuoc37Cy2ef8Ni48RYuPgorcMYyNEJLI1vnnjMPeVt+uCNWPvgrcONoRPpY1fPwfjWj2Xa3gHRo27nEsDbqYEKRfxk/cwSvMO/QltumB7R+14912fjZZ10i7iXwnqYUQJtTX8IFnvH9B7y6USZoisp/c8HxPHyLnWgeridoQ5cKohlFKt6uIIztVVl2qgE9DdDKhOskTkbzPUV1EpkNERowC03oRFWAn5Xii3f3fekHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGFfS88Z0L9svuW6iyHKRmljyrsYlgWUs4+4IejC1IY=;
 b=dxJpuPew0VRKcwF6SGsqQSLwjKZ9nYlXQGtCazPTf+65hs26pSLfJNni3Ytos5BY0nMJ2rjlBPdOMSPKmSpsGRbLJzr1G+6b+Xo4MJkR8DOKz9G3ykYhq4Gr4T3Te9ilpul+kX+xttzm2Zu+G84ynVlkpNDWS9/K9/mA6srOli4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 05:23:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 05:23:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 resend 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add
 Mixel combo PHY support for i.MX8qxp
Date: Sat,  2 Apr 2022 13:24:50 +0800
Message-Id: <20220402052451.2517469-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402052451.2517469-1-victor.liu@nxp.com>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac110f71-a519-4e4b-4e0d-08da1468f466
X-MS-TrafficTypeDiagnostic: PAXPR04MB8750:EE_
X-Microsoft-Antispam-PRVS: <PAXPR04MB87502E50EB028F5C9AE401EE98E39@PAXPR04MB8750.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8aQYz7VRjX28JWtFD9C+5C63G9/zHYLoRv6VCrm3yDJ559u39qu1CFMxH0kt6ePr24siLj/7LT/YHFpWkfs8Rf4UFqQZ64CUmuSWJ71RWsmwRFJsjAsB9YcsvDp9d5Kda4fuQxS+L4lwIKfqQAItzZfuLiywpcBIuYWAXJOjVA5RSVJHpRYi/IoidXLHQ1XHCAIsr3q/9hrymT2xzmibrDjmsUCh5J/E6Ds0As9mW/gUPPEYFTy9bNv+ih3Snlk5zj/4tqUcBgHK9dsKLzACasymI19TRIBxUtYmioJaWi9BCCHmVFdupkUkEA8ewYmY4K0V28ES3Aa53zxPlwblQRaBTIZ4iQfOVQShBwE6Pl8iFaefWEwftHwG2GbNfFS0XmJvHno/uT2cCmx+Ik8xilfHSDlPNjayEr//J6IQLHFV4CVmNX77AIZ3hhuQmsmcYBX/FeyXHB/PidzgZVNK3vqBBwJc5k7ysWnE2dPKWbdztksVc11GkHHucK8klmPCAJrVnMQeUlp1OGDlZ8R9Efp5LMkLahbllJtNmee6bQNsLS9IHO+V8oa1FM5HmMeVHFpIW5f443UOeggrERNbF3KoC8aXIjOv1eRJo2fQ1jFSIchpfpBZFdsiJYlPYJELtL5HmjAiI7WmBcU2KWhO8wLDD+7QmcLNIAj8c11Iz/l/XDi6lFDUkQ7jf7QQr5X/4tx8XcCb5JakGt5oOqkGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6486002)(83380400001)(316002)(6512007)(52116002)(186003)(26005)(6666004)(6506007)(1076003)(2616005)(508600001)(7416002)(8936002)(86362001)(38100700002)(5660300002)(38350700002)(2906002)(66476007)(66946007)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjJZdUUvNnBRTzR4VkFGUDlxUXgzMzQ4MUtSakpjVmRES1lyZFBuRzVGTFVP?=
 =?utf-8?B?RGNwaGNqR0tKM2xuSFNJcmlmT0wrNWkwczF2bnVaUjNER2QxQi96bFRxbDBE?=
 =?utf-8?B?SXhDM2M5ajRLWnI3R2h3SStDQVRnT1JjNnFJSlZXc2ZzemZnRkZWd1RsQWx4?=
 =?utf-8?B?NkJhcHR3TytYQVlUMnFkNUxJa25reGJiWHRMZGRaNXpSZW5HSlUvQUYycTZq?=
 =?utf-8?B?bFNKV3c4Y0FjUWttVUVZTVpYRGRKcWhIUXFOdXpSQmpPY01IQlN3UWF6V2FG?=
 =?utf-8?B?aUZ5S0JENXdFQTEvSTk4SzY3TEppdGdMOUtUaWVyb3FpcWVpRTQxL3pFUnUx?=
 =?utf-8?B?aVdybFBaMGc4MHNweFlTWUxWSkoyM0h1YnFJcUpNUFQvRnU3YlFncTcwLzQz?=
 =?utf-8?B?bWg5eTkzc29BemhWanU2dStobGZHRUdnWGtTYlY5VEVpc1VHek1nN2hNc2R2?=
 =?utf-8?B?WUU0UzUyRzRBeWZPOXdLbHNQOC9lWExhaUVpMUFRZFA3UkMxS1cxQVdRZmlV?=
 =?utf-8?B?WS9LRWx6YkF3NzZpS0RCdTl2WWlsaXVMUjdVRVdjSGhTYVprdjVBVzBrbEpG?=
 =?utf-8?B?OEswMGt6RTNTSEpSemg3VTdyeThvdzFvRlk3d1g2Y0syVWhEWVhyc0ZLdjZZ?=
 =?utf-8?B?ZnhRcnNBUEE0dElVc3Npby9ETnlrNjdMZGtBZ1hyUnJ5S3QrTXFuM2ZDMk01?=
 =?utf-8?B?M2xQMEZLUUpzRlVTWXQzVVp3ZndZNW9zbU80Nnd5TThHNTkrRk4rSmNDenNk?=
 =?utf-8?B?QlVQckdlcUJxc25PYVFOcUE4WWtMVHlRRDVaZ1NpQkFRMWo0SWNDU2ZuTUg4?=
 =?utf-8?B?R2dOWDJ0OHB3RFNLZjg2N0JQNHZTYkpHcWR5RVd1M2QvckhJYVJVZ2dkSHBL?=
 =?utf-8?B?S2ZiUU43NENkYjhxOVNQZDY4cjE4MU5RdDdERXVneEN1YlhMdExJSGkzNHJB?=
 =?utf-8?B?d0NoK0pXUkZxbTBlWEtTeVJwck5KZ1AyYlNyN1Q2YlpLTXZ0R2NYOFhqcEcr?=
 =?utf-8?B?REIwc3NGbU5OcXFFU1gzOVc0WHg2R1hxMWo1b0p0WEduNXQzZTlncGN4d2ky?=
 =?utf-8?B?eTZGS3c1dTltdjg2alROcGVvdmpJeUVENnJCYTR2UloyR0s4N0ZTdEJSVWIv?=
 =?utf-8?B?MnRjZ3pvcnpFZERTR2lTdWsrWVhBTGJGcXZZMWFSRzYwaHoyM2J2RHVHOXk4?=
 =?utf-8?B?c21sREFFVEt2WE1jMUVYUFZScGpEdFA5M3BjbFhIbnEyd0dieTlrcnYxSFNr?=
 =?utf-8?B?c255NDM2RElpbVAwQnNPV3JFOHBwNVpHNEZoMm1xbnhnSVV2bTZHa2Mwc0J3?=
 =?utf-8?B?YVBjL1lRam1nT0ZMZFZKeHJ4djBoV3VOb3I1YzBOZWJBOEZBZHRSRmJDcGo2?=
 =?utf-8?B?aGs1dTRNcDhhZ3BkMW9zZllYSWVBajB4d3J3NE1BZEh4UUNVYU5jMGNDc2Ex?=
 =?utf-8?B?Q1ZrL2lCS3ZPcU9mWXpPSnhJVFl4dkw1M0ltM1YycjVRQmd3RU04WER6TG9m?=
 =?utf-8?B?Z3pETU9nOG81bVN6M251VnV1YmFQWlRoZTlJNVFHQkw0Ull2N0FMZjluTkts?=
 =?utf-8?B?Z1JQSVBNRXdHb0RGWi9mVFVSb2RyK01hREtIQWthRHQ4Vk1aNjA2TmpDNURp?=
 =?utf-8?B?NlI5eGovbFdqOHRKcSt4T2JITUhjcjcycGpYN05pRStxOWdYS0dFSUFKcUR6?=
 =?utf-8?B?Q0EwVFZ3Rzc1YXlPc1ZQWFhsSFc5aXkzMmZBZkJKWFRUN3FWblkwelptL3Vt?=
 =?utf-8?B?enpCVm1Rc2lVa0ZoN0xJbmwxOWlZQ25qVmpqSklReUNpclM5S0lVd2p5Qkov?=
 =?utf-8?B?U2JySFkzWVNYWmhFQlZhRW10VVNINkZzN21McnNXbENacUFBUGhBcVZOQUlH?=
 =?utf-8?B?eTNsbkRsQnRkREljYld0R3V5OWFPaURrcU9oMUJiK25TRUQyNkcxM2hCeGsy?=
 =?utf-8?B?dVJsTzYydnJwRzFJZ3EreWkwTWZVOEZBeUp4QWM5MUhHZ1FyN2dadnFRMEdu?=
 =?utf-8?B?YUpPNjcwa0xBanBXOHhkdVc5cnVFSDlqME9DMjZJdW1vNFlJWkJING9CbSs0?=
 =?utf-8?B?U1U5UE9oN3VDcGFjd3RmbWNjY1VoSm9kakdKU2t6VGV5cGRVbWpoWlk3TlJm?=
 =?utf-8?B?My9xYk1KemxueFJqYUpFSit0aWltOWs3OWdjcU9aUUovMmtGcTdYY1lxTzJL?=
 =?utf-8?B?UUp4dUFFS3R3Vkt0em9WN09VZ1IxY25Td0ZRQ2RBOXpKaVd3WFJkNVhEQmRY?=
 =?utf-8?B?TWRVNXh2UURSUmxzcDBmYnNVVjdaVEQvSHh4U2ZGeEM2WlFTQWk5dTEybzd3?=
 =?utf-8?B?WGVyU0tzemNKa3R0NkhGMks5YkNuOGYxTSs3Zlg3MWExUlZZcUdaZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac110f71-a519-4e4b-4e0d-08da1468f466
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 05:23:43.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtLo7ln5a8fFDKzM9iRDS4XB6I/Qe2KZhLkdo0JHiUHCsqO4UxU4+rdeuoT4YtpJHpX63CKiGn/55mMCjrPp7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, narmstrong@baylibre.com,
 airlied@linux.ie, s.hauer@pengutronix.de, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
 robert.foss@linaro.org, linux-imx@nxp.com
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

