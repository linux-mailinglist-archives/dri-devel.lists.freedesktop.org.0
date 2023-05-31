Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E041717BDF
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87510E4A7;
	Wed, 31 May 2023 09:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE7610E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:27:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gro2/0l2bG/eWFRAmQHSe/qJl16PlkFU1LU0b0jiMhxf3uWAjx09Mi46fXfVtQGWWstiAhOhWpPg+2iX29Hr7WyZfFsJbAPr4ysefA9JA72i1WjI0PyY6cVeqePP+gfNnYzpyJDYAPqqOuBNV8En4BY7dGLpCf13Tu/Zw2B+ADf8A6e7QXvkbhJOe0zgvfSY1O4zntrOxjKu49HVBKbgSBexXxtbf+94r2EMzEKFGyrGiiOd6TH09hFDhtKh4K4HNViaHPuOv6zqinFauR+RRXwapMbCA11MSpWWWUj9wkmcd62c/vGcH5zwXXWsxEnzja20L7keayTMyA4Bmig/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui5uRSS08ZNr06mtVn5lP43/VLU/Y5Uzukp9kL/vCAE=;
 b=AgcrfRoBxdYcTvua1oISRnRcZWuskDJIZRaq3MTixm2TP9OjU55bZuLyoPd+ygm4wO+fpBzrraLEnCsWftefvyLKRbqLJaEW8OTEAC3O2lIKmQc2ciPZOFBohWq7CSu0xUxqZBCWIqAn+6HQ9R1REiAuBBXyzAYXyHYO17WnkRbjGAtXReklUPopr1+do4SAEXmwEiDPVJAp2+jo4pL4W4EPhPnihRJWNe26GXbbEM08nMZ3KqqrXtZNwjEla4UMXmkv9z5QoSle4ut4GRJhzP2Pab+WHBB3w8hCCxdmSvM9xyv1QbtpzFdKJeRlLUDLqJSGGK+zV2Kacfx+6BJlpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui5uRSS08ZNr06mtVn5lP43/VLU/Y5Uzukp9kL/vCAE=;
 b=Czm/63O8MCBhMwYwEUxufhX1su8pk6FcsCW4dncuqjwDUAeV8I9IZEpDvQFQZlaCQFnKSHi2Vxnfo4Zsb6SiOwHMTCI+LdclZz2+r/YmS3npvh2gwKHSAgg7oDk9s/fsqmE1rmLc0frx9ERz6inoWbVkswRIzl38AUqQhurXIhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7859.eurprd04.prod.outlook.com (2603:10a6:20b:24c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 09:27:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f3d5:528:d12d:50d0%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 09:27:22 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: Add NXP i.MX93 parallel
 display format configuration
Date: Wed, 31 May 2023 17:32:05 +0800
Message-Id: <20230531093206.3893469-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230531093206.3893469-1-victor.liu@nxp.com>
References: <20230531093206.3893469-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: dbabed12-c7b1-4fb5-a6f7-08db61b93d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxVQFqVIm6grZP0kvzPaQYkfzb4FJDQXMznbYr0cNwbfZu5WZFq/ot9xtKVJmvEBgf1uixqJ3tPkve2CJrm65cM+OynIWf1HpnZB2NqT2UqlO6Lfnl2yAlmgT1a4fekQBi+h9AntO5By1IaZbtFq244Yq+zh7HAYLfQj0pinnRNa6wXWjHfeM5s0gQvXocIIYC7h6wLDveduvxLfUk9tob3qdRksTcVBszFgEOH5Vt/sxK5uZ20LL8Goz9fHsYPt6+O3R30qlVVRvNAbGfcTikAP8olF3FpT7IBUhNTyyEW/S9E2AhHYhuvvWfj3HMOrqLNXZbdZZo3MSTVMjUXihfBlRnTCi95whZMa+yrWye2b6wklh+HpNxsIviz3xKSLlxuhgyEpYnQ0iDCX5h3qv4gYFkHRNXqiuTS8vs4wKPxOGxfaBnAuWTpgEw6NOl1FwOBsjEibJxbsuYN3KkK46w44Dqh0FKQQojMzPDq9pKExAWpTeWkSATqgOFK2wizw+/jPDo7cYcDpKBRQr0hwYAwBz/QqMilSQWl/IxdvpoZvXFFhIXauwdhJsWPSOXUGgOdx2SDJl+YvdXQlft5UFPoApCs68LS5kp473mjQ4w4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(7416002)(41300700001)(38350700002)(38100700002)(26005)(6506007)(66476007)(6512007)(36756003)(186003)(316002)(4326008)(66946007)(66556008)(86362001)(1076003)(478600001)(966005)(52116002)(6486002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F656RpC+jQcmm5jXbGhZjfzcK/zVBWjSb56WqynLKIQiSWayhA6hDhI5Clm+?=
 =?us-ascii?Q?HZy/ZcBfzjxO06OovL101gLK7/88vpAy3JraU5UI07VKetGgV/PeKPQ32ay9?=
 =?us-ascii?Q?HI0ChhiZD3hDpbrrrwmlmv7X1AL0WVoXV/IMBOrig5O1BtliFIO7OPYOvQq0?=
 =?us-ascii?Q?BmY6uXO5ZfFGEy+FRPDVNGPKt1t3hAwl29h4izvIv6zvHRlLXCfO8yOxzSlE?=
 =?us-ascii?Q?5/IDmVNFYmF3PZQaFr4TP4a044h58t9sYd2L5X4eY5AbcupTNxfNhuSIaeMn?=
 =?us-ascii?Q?vbG+Z948hTeFDnRnPb/mtof7sdN5us5qx4xSYvUpb3DMzeSgttEYaSxfBkfz?=
 =?us-ascii?Q?55eDRdgq8cKv8hPeNptm4PYYNVlWmgKfVbuDWMByfZG+cnAwJ1MZdmK204Gq?=
 =?us-ascii?Q?rNHytsJjja2pAhbekPL0LpEn+MliV0GKEwyRglUvOG0B5jjqgV/xxFCjqWeW?=
 =?us-ascii?Q?qnTTr0ch/jBMh1IUE2EW3zFN7MHx+R1Eu5Ct9ET0X2ensSGsLSm86pXIUYBg?=
 =?us-ascii?Q?7+WVEnDBrNWqXmC26b01oFExud6O1t61ahy7R1iOPjuhkuGiWPmNwKHE/2eu?=
 =?us-ascii?Q?iv56cUMdfaZFalAPDga3dr+uVKO7w8haziLrwVrUkGMeVL5AWMMilerKktJz?=
 =?us-ascii?Q?CTdbtoy4JWFYioH3eInCbDe00dCmt7kVyMD4yxlwi1myopVKN5H6s4KTTN9W?=
 =?us-ascii?Q?VErIgLavcEqZ2qDQFYIYbhkUsn1gqve6Us+V480YLl+LyxOakReTOi4Q8+VI?=
 =?us-ascii?Q?iBA4RyTc/GFLZDXZ9wbTYpDFF7QAZXwqc1vhYMbVXcyqx+nMiBo1DiqbVvol?=
 =?us-ascii?Q?H7LB05bgAV+NEKdTKLNKgQaHkLs36Ib7GO8l3Of5uk+rNolNCC2+gIqjN72/?=
 =?us-ascii?Q?w6BE2YuF9BmlNP4WYhOozQFUu4WKU1jxO1JO1FmKxRF52obsp9CAI0NISg8F?=
 =?us-ascii?Q?wWgD7zVQxQlfeTP2oG6zvbgIweDtZ7wR+TrSezyteFYSMIoxqqPFgWeDlqct?=
 =?us-ascii?Q?GwJA3eyGKXRtKLBaNU5GGxg0+JZokfkRWWINtGsLGNsQPGLQeJnexacw74TV?=
 =?us-ascii?Q?tQ0xZvFLc2FiaLOgs2CDWV73iceUj7aoo3AXbr8ftpPvPQDw0kLQ4LdtwnUB?=
 =?us-ascii?Q?p10MG4cqRonDNst7erKGXK8wIwZojp1R/3kwBgg56ZPw29g7JYAAo9hp12f0?=
 =?us-ascii?Q?z6xrJIet6HMbkXfqFcnpuXXkqMdzwKk65P8YXKvhS5ILRT9ukZR5PLqe3Rtx?=
 =?us-ascii?Q?fsd6V5t/c6Uj6ajMqJZ4HLTJN278tfiMxnHq3C6Hgky0+bIMATPEJZ3KgDrd?=
 =?us-ascii?Q?G1SA22WBOoZVgxLjvb75+0nKTTh14lDYAODJFh0d73Zr6RXqnu50r1Bdvvb/?=
 =?us-ascii?Q?ee4RzS/vK0YDezBXBkqDThQCLgsW9aex0kNNmUUbb0/ySEe603lso/aM9QCg?=
 =?us-ascii?Q?8d8ze+qtEwjfvnryHDJdWml+n1CGBdiRHTLAC4EUvDD4nQSRpD052ELu66Yo?=
 =?us-ascii?Q?frx5PMxXTF0ls84U98EvQXqK1+jZhgbB6fzYO61m3mV834UozVYNsqXTf9a8?=
 =?us-ascii?Q?/wkGdJkA3V3NpqyhHuPWVRzXrAjHOPMRgPLSTsmW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbabed12-c7b1-4fb5-a6f7-08db61b93d16
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 09:27:22.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQQ5OLccmIpI2uEB8/0ciggSAEzlD69XhuTnitSuagCDBkWynMaso2WiG5uzFvqcCsD592TR8jwa4fInrJN1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7859
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add device tree bindings for the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 .../display/bridge/nxp,imx93-pdfc.yaml        | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
new file mode 100644
index 000000000000..a84bfb46b01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/nxp,imx93-pdfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX93 Parallel Display Format Configuration
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
+  configures parallel display format by using the "PARALLEL_DISP_FORMAT"
+  field.
+
+properties:
+  compatible:
+    const: nxp,imx93-pdfc
+
+  reg:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port node to receive pixel data.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port node to downstream pixel data receivers.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+
+    blk-ctrl {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        bridge@60 {
+            compatible = "nxp,imx93-pdfc";
+            reg = <0x60 0x4>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    pdfc_from_lcdif: endpoint {
+                        remote-endpoint = <&lcdif_to_pdfc>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    pdfc_to_panel: endpoint {
+                        remote-endpoint = <&panel_from_pdfc>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.37.1

