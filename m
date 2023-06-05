Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF6721DF0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 08:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC04210E17C;
	Mon,  5 Jun 2023 06:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA77E10E17C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 06:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqOq5vqSv/qJy8h4x9OI0tCoA5OzwIPqov/cDy7991V4RvVfNZHcjZNhS7mTRKQYZtsycQ3yDAr6vSxkoaMoSAB21lmJmgLm0/6UgWtcr2nuwtDn9ZocjlRNia5W+/E/6bDus0oJXQoaq2OBiaCgAddTAzErb4mo+8ImcqsGMwcQbz2YRWnI0nlIFd7U+t9Jhq4AnGu9oY8IG1XHUiBRk66/0meu50zSbpESSw0HT2vwOaEZ07aDl3IsFlLmaZqqJms/4uCrRSqSQrWXcHjPXoG4fyiXhL0OXJDlT/C0K7M6FCg1OyB5b3FJ649vRJ2IliNSc8XX+J61t+ZmeWF8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELAhDmUVmj/Ec1l9Da6qZyWXbLsZz0z2k9yrqd6mvNo=;
 b=DglRNQKovMRO908VOmxDnm+uEGva1RJsBUWEFcoSNnX9d6Oqryv6U+5YwLmeLaRoK6BaP5zTPJzW8SJRVW/gm+Mn5dP3FSnC3end6KYy88kLC1iWJquetvmF/PSKCiitoaf/HoISqJSmy0vX7Cjcr+c1wH3ByY7IRUVK4WPGBz9GsHX4FLIp/tzywiXaD4ne1D4gCSCkOt8CFf8DYvXd93yXmNQe1dr406P+NNbfQiJM2wMFXJeRPNinR04G1tP5Xki8tQyGR1qbZI1BBjCQDW9euS3EYTCQciPs+6EdRfmqwkPtxG8pWFuCCO88V/hnQavA2EsurJokIKLk612NTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELAhDmUVmj/Ec1l9Da6qZyWXbLsZz0z2k9yrqd6mvNo=;
 b=EQQ3hO4y/VrW/NT4O6T3qJwW4jOrgaShGpCbW9pnnuEPOnffy2gnV1ddssmAJHgAGWVWCyZ8aT9cnUh46dXpkGCrrtV5x2tv6nw3AN8Prv1EBQXgnPzLsnYNAYCE7ZZAcuT3PEhXKKHRs/tdiLaP1gY8/8wVG/ccDBgD1MKFBTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 06:17:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 06:17:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Date: Mon,  5 Jun 2023 14:22:16 +0800
Message-Id: <20230605062217.3716328-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230605062217.3716328-1-victor.liu@nxp.com>
References: <20230605062217.3716328-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM0PR04MB7041.eurprd04.prod.outlook.com
 (2603:10a6:208:19a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dcdbfa0-a713-421e-7a01-08db658c8ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +iMN8lvYFUQkeFzTs4ZkI1vGXYHT0iv+/N9+FTRiHNzUDBk+/9A+MktBaR2jJwhsnqiK/iG/NjFG/fgZWRrVac59yrwpnvDu9l2ksukCbs7gWKW3Ky35cUhRhbLrh7ymgy49gRunwSO9u72SVXkiBMUDKFk3xlkKJlAm71TVYdyRPIOOoiT1K2+iOG+xIsUQ+m9/KnGDtuKgIOwZAqdgoU3mGDKmD0UVv0oFE2gRJ6Bqa/dLZorg7FW4QMyuKT0hT2LhobFjfoaXxJafTeJh3Dtt8MhW6V6vBHBGxQ27kvS722OZ/4LxCw2oj/AOC2uJsep/BIYuJTIyOf4dd3o0paVY/7APALH9Cqh09cOVLWs7Rbutw8kkerDf95xwpywziReJCjYINqwf2Vq2Eg4V1H18QN6OzD6jHq6XQtNEojhg6E31DcUM77zoVu6qgdf+nc/7IgTT+qzSiTABvKC1SXlwfk9sWFBIGoOWRMxqKTUgCYC97UMvlGoSKvZYSPKbhsdVrEI7C5jhRWQCIBrSqwuNvvSYLjkeJYEGMQI5iUbYql3Ty9uckvQUgSsydlziYyDHcgZmpDESBKjT5wwuSwzGrm1G4reehv8Jrk/CpqCvfQd2R1YSF3ogAjL7Thfj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(26005)(6512007)(1076003)(6506007)(38100700002)(83380400001)(38350700002)(41300700001)(52116002)(6486002)(6666004)(186003)(478600001)(4326008)(66476007)(66556008)(316002)(66946007)(7416002)(8936002)(8676002)(5660300002)(2906002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ADKiG7fOr0tq0xMl06k3O8ZwhH52SpC6NsAknUyWqXRDQx8ZgAdcLFf+VpMs?=
 =?us-ascii?Q?+7dXH9AYdw5iuBIMF6LOow1Hx1FgH51sDQXB+4UphbvluBiKkxv28Yo31MdJ?=
 =?us-ascii?Q?6u5epg9Sm8GVAF2DGSr9vhevBdqM3IzeOWO5CLYjl71JOsXkN8DN6jHaVU7U?=
 =?us-ascii?Q?wKmGRsf5bdnwo/EYQoo+v/MbenV5dc29Gs1U4PiVyBXH2PB4GpzoPKV3R7qx?=
 =?us-ascii?Q?Nzql5F7FPLcgIxRU2J6jESg3AXcfBV7CDLEdCsuKCP68caly/XjA3ub0S9cq?=
 =?us-ascii?Q?QaZpwNNg2v7FnQRSHYkOUji7Fk2fFsDiieBLa8vhVKPDV5Q3H7wuRQPAa7Rm?=
 =?us-ascii?Q?YssZrQEOk2DoCmqDrIgP3sqmC4aRWmBNCDoODGgWYBLNcPgfdmRHhZxbO/fn?=
 =?us-ascii?Q?ZIEl1d65nuUc4oq71wD8d+d8wsZTpF+clRcpoq7e4Dv3TwwtBSJn1aEk2aAD?=
 =?us-ascii?Q?LArleXegg76MvtuRAkMRfRpc6jSij526PzptaoG3vcASwLyDtTgtlp7uXRoq?=
 =?us-ascii?Q?jAbXR2ME7ow27dLxmGHJme9RDHj/3ksvh+b9wPpiUDMEjiz/Z9JN0MFEFLfE?=
 =?us-ascii?Q?Qzb+1bchVq3kKk5qYgwt8B/PhOfyhBO+4ci2qaHawP23pap2qMWX72lyScwX?=
 =?us-ascii?Q?tqrUESq87pOOwMNWrC0l8dNUuhjaGQjtFYNOHub/mjJ3WhQoF9Y+CYdqF21Q?=
 =?us-ascii?Q?2no5xyY6qnJJ158bjQKr406nbRYIn6BZAn63eldSylmn12hYYNpk/6TxZsVg?=
 =?us-ascii?Q?gj7SGGpLnes5IYZAcPEnn6HGQqkr08SzwsOqf1l/FD6d0l192CoLER7hUkXm?=
 =?us-ascii?Q?hSjBIxOw/zBLReu9dbLpax6cBy8xmwDE21wr4cM9G81aIBP2E6eTdCGlk1Nq?=
 =?us-ascii?Q?KVcqlTjifRQdiQRbBkkjbdv8hMB5Xbti+p38FaIrX5IjOLLAdS73CGIbWs4K?=
 =?us-ascii?Q?JljHC14ijsI0VCQabScEgKQDO2Zu10ywTR5JpjwTF1iKmoLkzxvhzrBNSsM2?=
 =?us-ascii?Q?WfPhp/hzUzKbXhjj08hma50u0dmss1THS7Pjocb9jQH3RLr8lEfMZcIRGFRs?=
 =?us-ascii?Q?jc+PJVkkriGlSU8E5QiFx3Tz+GlC85OzH2vlsSiutEyKgxg92/M7gjLr4R4x?=
 =?us-ascii?Q?THSPkFJLkbGm5QWZsrv7yZAKaLg71lhLDfSO790GhQq0ERj2g2KrHq1DtLn4?=
 =?us-ascii?Q?e0SeOdnHCPEFHJdDsptC6F2/s00B/co5jYuqDPrA8QgAqkKIhBw/F46ADA39?=
 =?us-ascii?Q?tSQiKN9Gi3UX9ocuJfiZD0nK57g3gY77n2Hna1977pyeNmMigs80jlb5++mA?=
 =?us-ascii?Q?hLOTixCGYiWR2Kzi1jfORZc/LiDkfZSWiTR8X394XubN+Tx9pkGMQ76E5JTY?=
 =?us-ascii?Q?zr0xGWc8A0wKBN53aJhjFq1Dqnbwnfq38Op2X6gZY179L1Tr7uR/I4qpncvF?=
 =?us-ascii?Q?p1Uz8WpxZxquSAphKlyCgq6TXMWTlxp7rzxmE9mWNszh/vNEPyBJ4EAWdW8w?=
 =?us-ascii?Q?EtKGVR2UhcEL8R3UMl+PpQwS3vpBl9KgtuK62wc5YbdoWc6H2Y6DAT6V05np?=
 =?us-ascii?Q?Fggu4Qj3dNGol5/di20nvqdb3ccT729w2I1TzZfO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcdbfa0-a713-421e-7a01-08db658c8ee3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 06:17:37.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I9RFmOXjjS/LxSnSniNOYHhDg8+fzVWnlSx4i88QiTYccx53iryhtY+XSdsnZ10WXrB+gevzW2uo8HIZmgSOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 rfoss@kernel.org, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, peng.fan@nxp.com, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Newly introduced to replace the standalone dt-binding in v1 and v2. (Rob)

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
2.37.1

