Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD6A4D62D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 09:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1C810E514;
	Tue,  4 Mar 2025 08:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="X6GE5Rpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBBD10E513
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 08:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWqYpekxMSTqHohY8gfEcaYGP85N5f1HIctwviXzBNmsDF+F7mAWmb8iwpmp8b8ICWWaIPNQ1dPssnguK9NnMY1CGVw8i2RWAF2HiQCofeP8pu0HeCXQS6WDyxDIj2Bz8uIXV4icwNEGE3jEYTzn0srEgK53t2BGd32lqysZguKXezk9jZHjQ2uliIuC9xzUNJI6uUaMuHtMjbuzy9VUTcMQG7MEHuhEHVxFKcgjDzymNr6GjgmnAmZBOmVx74lSofKKXYfNNgCeE4pdwhYRIIs08f9Y+DFB+Jt1gD9+HiLt+Xr0+tUkfBd3bGbEobyeCfyzYN92w0/S0mNDvtFw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+yPs7ZatDgNXPCfHYK3sNkIzz2+iO9Kl9l8cVDtgIs=;
 b=QligQlKeBj4fjDoBZEl3NXLWRYlzJRKPyJ2eDjjQv8/mWArsEYaVTBPEsMg0u0p47aB/UilenH1MvaPIjyF0St2FATSFAUHMd8gzl34Tpx4ArjeBkbMxOobtRIgqvPLgISZgIfMI9t8TGFZyyHhrReLQHKeXPCE4jZS3xFmWp6Mf8dNgC3Euimv5YeLhONlG639RU3DkMeRpK0miJKRI7TYTwcrIscLkm24s0zO4n6E/a6Pu/bhcbq2Ro4H4UHfIdVImqydET63VePDhyBi+WcNFvnOBTbHLhMyzMySzqO77tXDSfZgLDANAA2sBdh1SN//S6jVxs1m7dH52g65W3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+yPs7ZatDgNXPCfHYK3sNkIzz2+iO9Kl9l8cVDtgIs=;
 b=X6GE5Rpz1trXPQ7y3QxWjBsJDXgTHRumoFjmmi5UiwBgAcdqhGSQqAQnrquoPf+iiQc8IetJrucHuNSVHmVHXpGyR346/x8DzPaM55/N2W9mEry9/fPxBMtquvaZjjBd+ZhWcu3w0vy8nzo8rczi9JvbNAB7g/0VhQYcrophqo0T5jEBHtvqnk18EibT3Jqq8la/0glHD2kTjoqO8cdPYbLFa0qtWWLPI8sCbZjBjPKkEuVyLq7Bj7D6jjQuJAAqW9GDx319afxGJurnjWOzomJzXNfWEA9+r2HYpWNYqlXeFvoFuTnu2kxu9//9Pmhwjy5Od8b17qUfktPgw15/gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10311.eurprd04.prod.outlook.com (2603:10a6:102:413::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 08:23:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:23:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Date: Tue,  4 Mar 2025 16:24:33 +0800
Message-Id: <20250304082434.834031-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304082434.834031-1-victor.liu@nxp.com>
References: <20250304082434.834031-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10311:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d24b3d-932a-4e5b-e4ad-08dd5af5e73b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wlx+6QlTNAdC0SIY45j3t1YnjFICiH4YBDECi/oIxpYBo8Fs70OAa+MuyIKZ?=
 =?us-ascii?Q?/rKyx5nBPmKETiUshRDWhufoxsDbfCE41x79s0U76xiR1svcqss5hAX0qnVM?=
 =?us-ascii?Q?tftYu5PlTKbkmRS3jOR4LiLcQ6hbl7Q1yRtOzUmHfcsEG1veXUUQDQLUF2wR?=
 =?us-ascii?Q?5rLT8UwLDJnS8pt/6VMYAb79EmO97OL0xjnnAIpIFMr4GSNjEYmrGjDbC2dE?=
 =?us-ascii?Q?qeAiHDjRDypcp2IDwjJPLQLGdo2MQOb0cVCL1hq7K9cZ94XEUCGMgBj9KM5Y?=
 =?us-ascii?Q?EHvcTuiH7elJoCmpT7ztRKMWGI3OKJJNAei5qTdAD40bwipPfbOIXxw+dX0V?=
 =?us-ascii?Q?tl6WPJR461eMyY62BSRQeocewfLRw4E4SxBxpv8pecDVjJB780FohhJAv/K9?=
 =?us-ascii?Q?/hSEDt791N8b9hgRra+uDkRIitVVgNv1wV7YZg5M8tyl1pZiwNk3MXfF7+o7?=
 =?us-ascii?Q?OdSx02K+h8W2EyU0o6O5HGvYVNSC9elCDxdB1CGIoObmUfTUU08e9H9yHhYN?=
 =?us-ascii?Q?lSvnr80LVJWRTOdmOYs8eAuCa5A/bdu7mVDjSo/UfLTipqWSdV1aVwFZYgq+?=
 =?us-ascii?Q?gZTTRWoxKhBMW8ewah7lnQGoqvi61Sc8yvy+kwWDrfQr9L9wEvFQZTdnQYmX?=
 =?us-ascii?Q?oq4Up/TxvnUUweKSvT/42R03Hi5Y+JkxhPMQoTzXN4PPwaCjfEv9cz8DdHuq?=
 =?us-ascii?Q?COMm7Qwtpkb4e9D03tLrvDb8FQH+d0U7Ze81y50HL8COcuOF7VLAV3PYZf4D?=
 =?us-ascii?Q?gUL9Go+d5i3NY2Z6gcrujHXXxWWqMBQ8DsbRyEdzEGEt5LeW4CE7zBOD5hME?=
 =?us-ascii?Q?rGo3zzXrSALENwj02ENvYB36XAc7h89cGh1pn9Sll/9HAtKpG2wxpo5O+uDQ?=
 =?us-ascii?Q?UDLYi0bUJdZL4I89RFyksW5RF7J9/hfsD7UBeV/B5TASB5frrCdNSc1Dmu9u?=
 =?us-ascii?Q?MvPpxG+4pokeI0uZ+tSJ6UR4dMgMgXsK4wGsod57UjVq5p2FWS6+KcbNaFgl?=
 =?us-ascii?Q?J6xQsD7uAk6VuGtQ7rAU+Uo6RG7qDfUcImCITeL+B6WHYK+RJkh9eUYHV4Ut?=
 =?us-ascii?Q?th2sBnPxgjXkmT/4b8zAej7+KJNBO0SdndjbHxbwVHxU6pkAzOEjyg4JwDZ5?=
 =?us-ascii?Q?mxMMpB61KYr/p7A5qruQxc8+3xeaArHJOqhprx14sJ7HlpE4AWDnuTCo1iwh?=
 =?us-ascii?Q?ANhlncNhQXlra7Z6Ual9PD3NfipPiI58BMDBVQq2GYgDMX+2mv1rZfeXEUj/?=
 =?us-ascii?Q?gimKfvpG6SpK0upUmgkW3X4u0GFmeKMuGLxXg99zq4yXodLgJXmEIAKmRnsb?=
 =?us-ascii?Q?w3b27BpuzSyiB2S9EBqJZrgzkPlWuvEkh1LgITvxqJ5MPbiAhdmMP2rEqHaw?=
 =?us-ascii?Q?DjFsfYcDE8kb5yCmBCAKwjso64Ygbjj/zhL3ktNyYnaQt6gyUIhKL68IaYOg?=
 =?us-ascii?Q?769b3nuQ+ORQs3aVclCPKuDV7jhj5vE/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZvJiKoBSZ54fhaWj0/TIcSlVwu3qQMCKaLIKQUnXxxwYEN2lhoAYlHBSkMDk?=
 =?us-ascii?Q?3upkH3GE5qh3D+7vYzhlt+nFUIUzAzSdjN98Rs+Hr4qfcAGGHFOjbrSQcRED?=
 =?us-ascii?Q?bQRseqq3OvyglSabK3mrUnCKxt4NymzR0gMocqCuKtLVl7n9d+CLJH4bvJDo?=
 =?us-ascii?Q?QuEzkCKF4zVR2kekicMSVY6xpvnFR8GVeOVNkbqVFAn52TkPdaRvTGnZKl9e?=
 =?us-ascii?Q?tGiRJQf+ZvqfQlBeJl7euB7kIo9nsNvgZ13PKzR/kqzx3ux/tFkAmmih0vK5?=
 =?us-ascii?Q?D6DRhRnWZaOsi9MTDv+cgCMyOyRFiRT5ZurZJ7Ja4lraAwDaLJfkCbXLZeiM?=
 =?us-ascii?Q?TVjYHSTYQ1Ov/SF+5/nCdvIZN1mqKkFnS+5Ipe8YOqo5G4RNnGWHyH2Ar5v5?=
 =?us-ascii?Q?P8XNHYU0ip5cNk2EKZKMZre5zm2nDJuQqQ7C8/GbBjjaJG9n+SaQrc16F8Wj?=
 =?us-ascii?Q?TxT8xPWrQ7S0KLtLHJUO1bWQnUiOl9FZHkUuUfp6pf8ZsGwcD7vT0mnkiwhu?=
 =?us-ascii?Q?kA0dJTd97Cme5or7+ITqFluJSvREkLYlG6LPAxsK8+HoBG6JTNyO4DjWlkwg?=
 =?us-ascii?Q?PFV+GogfnVtnpPqQLlIQLn0RrieIhpu4ow8CjFqPymILMPVo5aykHvMYqio8?=
 =?us-ascii?Q?uMqoHT0sT+t0L2F+IBL3ooeqcU1vLHu773sZRcMkA0RyNHHnL9ZJhwMreDa4?=
 =?us-ascii?Q?/2r1WpIVHV5L+mYjc7JMvWW22X/Oy9CtKp1B8rz4it+Qngjvc6X34r3Bd86h?=
 =?us-ascii?Q?nulecxfi25TJ1GW6j8UstczIwZD4mw8N8SnCSOTvYAdByRSHFm12fFo0Jgwg?=
 =?us-ascii?Q?7fFHxDVFgAUGKEgBsfUiJ7wRCq8gjbnqJRbL6jQuAEOg8037EPUnhXzfpoeC?=
 =?us-ascii?Q?hyuH47zah3PRfW4KI+RP9RgqHiy/uqVM5RUT+EXDlvnoLNsNpWieNuCn7N2D?=
 =?us-ascii?Q?NBsj2EvUP4Ii6/l875djQlq4msMPI8v4UpVe9i0hfdzJim4zOEZcjsrarpi3?=
 =?us-ascii?Q?nA/KdoI+x/wDPLpcZY30XphgM6Q8C6zoVDB/S07FUnnC+swOgKkoEL1V0uTj?=
 =?us-ascii?Q?oil9nO5+v32JH6WrKnJOoImGKlNE+xEJTK142P1P9XNBZtNNhDdEOt1/82y6?=
 =?us-ascii?Q?Xi8ER9AhUHjF+Yg5UFHqcyj4wnuYd4vTdxdNgryZuV+FpYV7KSp5/7iJVmlX?=
 =?us-ascii?Q?rb5PVHJgOA5k2cahp0H4hukYmOXIAjCC5jwq6+ojPRgJZdpTDm29rVwEIlrA?=
 =?us-ascii?Q?WCYiw1SJbN+2+2Eav9M02jWtqbHqggZ3QoiiJO6AzMuOEpF4z9PWuqWh0eRo?=
 =?us-ascii?Q?MvpKLKMWuTaLsaddhAHlwxLgyYphjGNRDiB2zlmmnyk0xdq3T8olTJmLiJFn?=
 =?us-ascii?Q?XSdZizyVhGpJZ4BYuYrMwET1/8GRX5UgCrL9/7qLRr609YScwdyA81663WTZ?=
 =?us-ascii?Q?oxS3daSPEwp4NM38XFv16hHHS5skhtNuL9p+kJTCLcBEsCMTiRnYwT9xMmtv?=
 =?us-ascii?Q?AYpzpH+gRdIhQX6P/V7ISncvpc4DJizK/g095JYbAGg3KAvWZcNf3D94mdM0?=
 =?us-ascii?Q?zprtN1D/8xTQt0OQbPiUId3JN9ztjLUJQupEg+pC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d24b3d-932a-4e5b-e4ad-08dd5af5e73b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 08:23:55.1517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFOG5+kFb89PcpLsziDTjeJOR3qcH98dikQZxlcclSqkRh0nIa1baFDjF9joIWbuha5SFhLk2RX9LVvTk2qrDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10311
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

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v3->v5:
* No change.

v2->v3:
* Newly introduced to replace the standalone dt-binding in v1 and v2. (Rob)
* Resend with Conor's R-b tag and with the patch rebased upon v6.11-rc1.

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76..3f550c30d93d 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -24,6 +24,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -46,9 +52,43 @@ properties:
       - const: csi
       - const: dsi
 
+  bridge@60:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: nxp,imx93-pdfc
+
+      reg:
+        maxItems: 1
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input port node to receive pixel data.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Output port node to downstream pixel data receivers.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - reg
+      - ports
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
   - power-domains
   - clocks
   - clock-names
@@ -76,5 +116,33 @@ examples:
                <&clk IMX93_CLK_MIPI_DSI_GATE>;
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
+      #address-cells = <1>;
+      #size-cells = <1>;
       #power-domain-cells = <1>;
+
+      bridge@60 {
+        compatible = "nxp,imx93-pdfc";
+        reg = <0x60 0x4>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            pdfc_from_lcdif: endpoint {
+              remote-endpoint = <&lcdif_to_pdfc>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            pdfc_to_panel: endpoint {
+              remote-endpoint = <&panel_from_pdfc>;
+            };
+          };
+        };
+      };
     };
-- 
2.34.1

