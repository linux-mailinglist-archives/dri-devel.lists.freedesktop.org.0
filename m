Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC66B19FED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84410E18B;
	Mon,  4 Aug 2025 10:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E43jCi1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDCA10E42D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 10:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXehZ3Jx5caKxJkG38IIGSpHd/FDq4pzWZFcXs9Lo6ZcDHRbOsYh7/9L9H26zYVfxxKzwP0atBur3/D6khBp+iMSw0mYSLyVw/iupXAQw6JRwsgg2jOVjIPke34mXW+3Jef+DZsAhRBLwUGdSuPSqFN6Rrx4JYM9jjsMKcLjm4F51x9PoiNU0EFkbB5yuWpY7IYtA5ESRWt2D7M7IuvNCx8+pu6jAUc07j/4nDbTDwsTpGZjrQRjdUw5QK3kJHNnX63QfoYkJNcwH9IcJiVMoqbcutsB+xPMBGuy/2xbBY5jwscH4+PsWEExYkldHt3cLqyi7ntKHhjhlcWncMA88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BFNgsYvv8zj+PI4MSeefLm+Jlw0J0RHNvrrW/gh2Ak=;
 b=mttywF+BIZritfqTQitPYKPcD3lwUD34av/7ptEcZ7vxXM3EiyRrFfpLQKq9iTIGNGrAR5bnYlDuHmoXSFJgaRDhuqlspz9EG1KGcc16OHvXktwa6MMHH4lxmhnTsA9FT6169sci5VI0RLHCPOUtVcdjVYh7sMobxHqBh8k7pXg6LKyXZGA3ZXv6lKjDsu05RU3elmFkG/rrFmmDTHSOHr5VawsSy2JChDANvsYsxQ4q72EMLdEePE6Uel9eDw3VG+kd97g7uPkwpGoWnmW9wMtA1+NCHlqflNCMPPqagWMNyHsToVUArVkmS2FJ6/2HoMwqZZBDNKyt47N58L5t5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BFNgsYvv8zj+PI4MSeefLm+Jlw0J0RHNvrrW/gh2Ak=;
 b=E43jCi1+BIhJTQS731Cy0OsHBWcbY0DYdu+zCNg1OnolAG/bBFaiagHsw7CJus13UTzV/wRUVQtbj/p8G5FV4ktLwTltyHBx59KUnS4eq6W5e8S/DeN+3fdCeSQ+Zkb+7fg3YxeRjwW4cv5+xOXEf9YTxqvDhb0poLeqIgZ5GxWqXGAfJ9GuWy/RrsoeERrHM5WFn2YcsywZVpo9lvdb7D9nJ3FZk83HKBiVmeKPgYa/3aljV+WsDOH+Wjo+YJh4PbhdNuXtM80J6PNdBCCUt/gGv9LCPRFbfEy/ViuE58tAXaAxkkqgbz5umWcX5ULKdESJ/qbEBJm9VShuEC82rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:47:56 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 10:47:56 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Date: Mon,  4 Aug 2025 18:47:17 +0800
Message-Id: <20250804104722.601440-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250804104722.601440-1-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 0177b917-2d73-4f61-7b29-08ddd3445eb0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TJVjaeh1BAyYKqEkWFRDCWm/UpdZb9fR85hQKGr30mKAsaCnZuHMOdIzdekq?=
 =?us-ascii?Q?LRtqpzkD5w2q+smdpZ1ptFDuER9tJHhdxf9BIaz8tIGpvwg697UalK2yTCo2?=
 =?us-ascii?Q?ocSdvqE09yOTfxT3HQfyUEnvGnQ+soHOLuUDbQI19LG2SUkQJkTzIkiHa0ur?=
 =?us-ascii?Q?addl69DBHae9LOomg3Cycmt0Td5rM6gUrsJ+7sihoehu2QRd0eT8DTMFw1gy?=
 =?us-ascii?Q?NR1hNnJhlf5gywEBzTD+/ZW4UYGGSTIITS81lr2RHlID8LIhL3pHn2tNsKGS?=
 =?us-ascii?Q?ndI0PMdXXZZ7OG7ezgKzvJG8obht6BLvpgac/t7n+d0ch9LW9/bvrVv+gGRb?=
 =?us-ascii?Q?JyE0nyngct2axrQ+E3fEmxJhow+Gh4zpnlRSiD72Wx6eDTY7Fg4t/I+ZZkq3?=
 =?us-ascii?Q?kPxUPZSyHAAQTuetX80uR04gwgkA9RXgQZka8cmpE64gaeiWPcJ/mAFLOC/H?=
 =?us-ascii?Q?xztBZ5pp7yZdL81fGBCGaXwjb11GolL/9P4s2hV9jM4LQaSQ9xWS5jxTt/JU?=
 =?us-ascii?Q?zX9Fn5vk+3c9NfQC/QSguMGlDA/zdV8Es0Tl6C5MMGpzcRBlE4T25P1ZT0oH?=
 =?us-ascii?Q?RcQhXQG8hRzST3DQPuo5MXGY7jyspkYOnpEepsaXZo16cqjdz6aWBndk3Xs6?=
 =?us-ascii?Q?MFWFLFRvdH9wZ4NOe9LiBhcpIeePPHRxB8FiG6D2uBho6tfVwBVCrQ13LWue?=
 =?us-ascii?Q?ws/sRTkyNsmROovUKZ4vDhn02U+zjOzvaAwwrnu/HeBkeaf4ip5Fsf1Ts90i?=
 =?us-ascii?Q?c35VqBVflcgy3fK9H3b5npMYSpDTYDqhN1Okhz8f6yQfbzeXS93m6DGpptF9?=
 =?us-ascii?Q?vI7Uf6ikYOTGGFKcBbIjVxW7ASc7FZfkQLmC8Ul71XjS0KYeoxwY3J9sLCFh?=
 =?us-ascii?Q?5KT8Pz4PgNQpDteZALiJ9NpQrk50H9hqWy80v4oraHMt90XwaSWrlgnAlQ4W?=
 =?us-ascii?Q?WCKudzPZbGYDXtJqfu/K+YUKua3VhvvuVO5jbdfSrToPFnkveiZC4ec7Mny6?=
 =?us-ascii?Q?X3lfcZtSco9fH36Of9xFHqRwJ34sAaqAT40ZKkHz3hQcm/m+viIk21dMoxjt?=
 =?us-ascii?Q?hmSLIyirTEtIkpp8bvODFQ2hNPDq5KkgBysYt/zvZaYrvCNfpauo+pfh4FE6?=
 =?us-ascii?Q?QySOvXGxn8yPWmElDJmw+mCikPAMN+1bqIqwC6RC0d1wkoB/Gs6KNRlzPfaO?=
 =?us-ascii?Q?AakWY/SHfAb75BBSx3JM4pbU37btyxSVbSkYHPhoxUb0Bp27ZAT2+BNmIItu?=
 =?us-ascii?Q?m9fkUePQrJO6EW3q0J73Jy7w9pR4qerb9Ur0AsoHERnazpHVCoblVk1M64MX?=
 =?us-ascii?Q?EkKlsyMhDTJ6CUqLzf0i1sGDvX+N6uG8Iwnfo9e1w56tdstSMttI97lrjIpD?=
 =?us-ascii?Q?ettxSl3ZmD8OhkaG2d7r2A06OGnmJAMy70Zxgt/t6r9PVbJ73vFFyRMs+Aaj?=
 =?us-ascii?Q?SH4zzBVa+fvTuWOtl2eOzSHwtC3pUy/6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5Jnohzyx7Do7faHzeTww17RXW6/qcrVuq++JH42xDZhYHfCv6S9pEf0eR9E?=
 =?us-ascii?Q?wjkT2KxFe8X5efBCLQKgLeqxhbliIWU3RiwDqhHZAQevDP9VQMn7mauusBdU?=
 =?us-ascii?Q?I8x2a2mni/sRTblIbPOfb59Ketda2wfKCFpbNkC5LeXN0Qv83JwtUg7U7AUG?=
 =?us-ascii?Q?oECcCOwlA+dLWjO13GUQz/y+cLZ70NnblyvJs8uchq8fuUQOoG9JUhzE97Dh?=
 =?us-ascii?Q?3yd7sU3WkO6rMgo8X+DYW5aBuSzrAewmUmDSpPH7gJTCpq5tUCxYXbC6Zsbx?=
 =?us-ascii?Q?f2udjRtIdyRp6/k6Ykhteob/FrpS5zvKxy7I31wichLfeubS2r+FBTC1/hfA?=
 =?us-ascii?Q?SUFX++jNnN3KuPAuFA5Qu4xfavRZJ8Dl6O7nrzm8l0Yrw6w6sGetO2hw316X?=
 =?us-ascii?Q?MNA2k0O7ivHNEb4s3bbxxrxR5lcoDtMDZd2XrcioqRDIUJipXaKoOPg9uXzX?=
 =?us-ascii?Q?gkkJIT6j4cTXITTbnGY4N+fzz40QeSjxbepDQZnjVxF4C6fDBXmWmM/r1cFB?=
 =?us-ascii?Q?NO004lXM7dASgoR3iCCSTJeFRRzAKwTEK0vZi8toLE5Wf5Fczb/LyeLghNK7?=
 =?us-ascii?Q?c6fjpfb4hic7HC/VgCWHOk+aIcOHAxnhdCE3n7Ud36vf8LOA5d7WTLOK9p/Z?=
 =?us-ascii?Q?w3KaOFXOahIzL10CayoSAQ7hqS6qapuoJBZkDcsLkR5MHwMnt9emLdd6qwTw?=
 =?us-ascii?Q?MKalV8O0a5Q1JuuY96nA2qVEYPVdVPcjG9Xz6o74X6gb2p6m/+TkjHrud00T?=
 =?us-ascii?Q?/mpjXp/LY8lIqRdZ8njOWHdqKwdnzccOfhLmmr5LnHrnBD7WENUS1gO6b1jx?=
 =?us-ascii?Q?TV5816gd15PE1b9XWKaEC/KYP/sG81EKjkaO5+ojzlo+DRdt6ua4pO0mAimq?=
 =?us-ascii?Q?IJjK95xq+kvd8G7lkUy3OqHZKz+jNBUMdHuaxAVPAhGl87XZBghZgHW5nf9/?=
 =?us-ascii?Q?k4KVLOrlolcEjy+jSijuqiEBH7nIS7TR3RrJYSm3tkcDoQ1L8SRv/A9wcwnV?=
 =?us-ascii?Q?UOzLugm8/N1/h47AdQ6oecqvIJWr4pxGE45T+FMiJJCgQqxwEKvsAICBp0JM?=
 =?us-ascii?Q?NHE6Hn3UZ1OHh5pOWweSQYuIGeShK8F+wC8OT9cUHPxQbdYzYo7jnoEytOJe?=
 =?us-ascii?Q?+HVTvnnLp9T8TuAaaNHRgn140eXIPk1/6vMawozPhXPSsqEKhnpRnuW1xDJH?=
 =?us-ascii?Q?WGi2ygtWgddNwCn5ELzc+Zmof/qGtfwDbI09HGvOMyBQFHufn6m7IFXtcjmr?=
 =?us-ascii?Q?YmUfAG+qUBRSjDyYd0l9Fr3Y2/WN3bIylUP45c3wWufcPT5QZ1/Q52pNAqPB?=
 =?us-ascii?Q?2ammfs+2tUiVGedKGH8F06ZVcsFWripSPvko8rUGAfo76IYchn7saJmnLrPs?=
 =?us-ascii?Q?3rt1HcHkw3Bc/tMbhJCjB08rG9JRSBdkDfcHQyTD4VrxC56zFN3e1Ev+LnHP?=
 =?us-ascii?Q?WZtD7hpz1n3/Ub/MxKpgBhL23tmNNg8FEBxoDjLad6QXUocDTXcYs9W7lkc8?=
 =?us-ascii?Q?AmyJ38iEk8wwF6JLEWVF5EctIS4DQx5VvinEhcJ5ZqePeqQcrRWoJnGWSY3I?=
 =?us-ascii?Q?ZdiIXdDBQtQqIMSK4oIIMaTHUGQpFSWJQLYaY7SE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0177b917-2d73-4f61-7b29-08ddd3445eb0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:47:55.9436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zABqbRmZtX/in2K42VHyVqqvVTh2zHUZwqRU/MN9dOKE5UcQ4yRb1sk+Upv0nVME8iNisGXesn0FMfEN6fl9Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9643
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the i.MX8MP HDMI parallel Audio interface block.

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
Controller compose the HDMI audio pipeline.

In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
index 05442d437755..6211ab8bbb0e 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -49,6 +49,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel audio input port
+
     required:
       - port@0
       - port@1
@@ -98,5 +102,13 @@ examples:
                     remote-endpoint = <&hdmi0_con>;
                 };
             };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&pai_to_hdmi_tx>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
new file mode 100644
index 000000000000..4f99682a308d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Audio Interface
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description:
+  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
+  Audio Subsystem to the HDMI TX Controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: apb
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output to the HDMI TX controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    audio-bridge@32fc4800 {
+        compatible = "fsl,imx8mp-hdmi-pai";
+        reg = <0x32fc4800 0x800>;
+        interrupt-parent = <&irqsteer_hdmi>;
+        interrupts = <14>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+        clock-names = "apb";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+
+        port {
+            pai_to_hdmi_tx: endpoint {
+                remote-endpoint = <&hdmi_tx_from_pai>;
+            };
+        };
+    };
-- 
2.34.1

