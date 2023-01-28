Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A843767F46A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 04:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B96B10E1D0;
	Sat, 28 Jan 2023 03:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C28610E1D0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 03:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwpZwCsoG+RGPWOlA2HSYgfGzhqiXuXV8pk1STe09X8X4XkUa4GGCq4HIyB+zZKCkE38UoSQMGUf0+lHUmJqKzoxbGp8fRUWj6iJEVlBmsru2YGEmBWJgVtWF5k+L98dxKidIBCt3EoBOSWQ7F6zD9IwHFE6KxZ/emgwJcHF/jg6Ow2+FjuES8ie4sYUSoVxO8YHjdkwOWcZh/36g3gEDjWmt2yqfVq5xYmKFIyjwiov2nMrS1L5d4v0d1/65/THsMJDuim5kKzoaNmaYRt3i+hajFffWcHggVdtQmET/3Mj0vEXfcRNPba9oswxdTeB5Km1Zf0YMd+lvT1dlqAT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk0nTKbouhy2e1SQfqLMiMC0z8RB+wUvXYFWb6dGPJQ=;
 b=KHMKf5NvISXJKX+YhfdMhizUXQIxO0xv39K+gdGjHsFfrUlzQNcwqitAbisgsYk/3wQAslbi70KuQGuzm8VGn1juLLfJJhaGZka54R0fmYZ4mVM4xyauERDebwP1pc9sJL88WaJ9N8IAmIDXQ1f0rsly+ctldioFXJsvNwQ6CrHat+3BYXZnvBdGeuAQhB0nQGMMbvymqJ6TjDuM+tTN/0LXvHrc9jrNsK31s7As20bay5FUbeAQtCNXJmzt+lnC0OfHRsypHXnupPlk1J4/fj1P6MgyNYDMzJDEwAWT5U3hd+7vbQd7QHjgCuOTDXYCIW045OeBYu8c6cEqJPP4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk0nTKbouhy2e1SQfqLMiMC0z8RB+wUvXYFWb6dGPJQ=;
 b=ZQaUEDEJAp2lk9DQm2hrnurWHt37MW1G68N+156613hJttGQ83888pK3iRbrPvAArHuXxpElDYjYXM0BcyNwpXUYgX8UOgZ1Lt2UVjxcVtLjDXJ9V4bnCtWbOefWb04yIpaPV9xwCcBR+CDSIsCYxiCjkTskxaGSCkvzLc2XZtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9203.eurprd04.prod.outlook.com (2603:10a6:102:222::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sat, 28 Jan
 2023 03:46:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%8]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 03:46:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: Add NXP i.MX93 parallel
 display format configuration
Date: Sat, 28 Jan 2023 11:47:12 +0800
Message-Id: <20230128034713.1530218-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230128034713.1530218-1-victor.liu@nxp.com>
References: <20230128034713.1530218-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 6796b644-cfce-4b43-9770-08db00e23ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: davjLr7ycX7Or5/U38X4xTqsDIJAl6Ygl4+3E75NkewljJo27GnOjcaPWjie8GMk2GT8oG/3eUeXe90NWZcQahJrTrVefkD6NVu5CX41oEiXwADSmdUnrQ3LId4DoiRmIqQbi5lvNvzm92d/vPKcUkZkusf+oQSbu0Y48oeN929Sf6fTYuqUYEkCRrVF4hPg0W2NoXFvmO+LAmvzzG3NgWqedeTka1EvsooybNHUKkq5fyFP8maq+753U5Qm7KxWYRleec68pvoyGJagIN0mSSMbbprR/dyHWQIwELkezWQnr9RfrZrM/Uc4dXMnut8kZHuZzVaBONrPGn0bJArgglSP1t2XSsqKlBAb259q5mXUTYPzQJIUy/1canY1cnpIF1iygNlgpxStVovpnXDYKJ0+1GuV7HgNlsnRlq1kG4Wbmy0YHC73owl6gNnnr718PM1yjDGEww/84BppMKuOMcgc/LPeeXWIt8cx3tYdlbXb5equ1b5xkKNnv12ur5cEJlaFQFcJM6p9LdYTiCqkoBgVwxk2IAlxc1MJCP1K73vEq16nBZ7leJyEHnSk2fUWbOTJ5yfS9ACN3/ytF05aYt+PUvUJp7Zivp2FdUTA9IOs/aFzuCq/68KoejT37b+afQHFlyL201YHCkDvNAsa8CdSyNFHiBDKrPzqEf0OHO3C/DHy26JN0uqqZutXgk6iH+BbdjiBFb23/bcGHTJZwLhm33JoWNPD3rO4EAPJ1Yq8Zwe3adGiOepq6RPBH9+qB70YHBYCFxzaZWJ7l3hFHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(186003)(36756003)(6506007)(1076003)(6512007)(26005)(38350700002)(5660300002)(7416002)(38100700002)(2906002)(6486002)(966005)(6666004)(52116002)(86362001)(2616005)(4326008)(66946007)(478600001)(66476007)(66556008)(316002)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B9MiiMoxerW6RAdQViz3aCuM90fs15RZFar1evodRSSZtXRoKiRFI9N25WGq?=
 =?us-ascii?Q?DxHuYcxymbqj8pfXBhf0qDRItBjNDG4OWgztohm959YlNg+tY4Ssz4KGYsXT?=
 =?us-ascii?Q?3fGwMptpGTlaDOAD1u46BZPRiB6pA4+r/n1AJVnLQkLy3qSxMHQjxJ0gpUg3?=
 =?us-ascii?Q?btVCSYLBeGXOnYEZg5gQcDBesZTO64K9ysfD9j8pPVIc4t0hjN6mO0FGFbqV?=
 =?us-ascii?Q?CcIvR6uR3BfIHCFIhF9VmfWdgPsalbnHCVsM07Ha1ZXT8MvuoUqq7jvLCTZl?=
 =?us-ascii?Q?dnnZ30V/5W3UMhLkluvYD8DUeKsywDLKu67PszdDtBhTPqRRGNAvZ7rj+44C?=
 =?us-ascii?Q?cIUnzS8hbgfXPhartYVchHr0F4Tmcm10YLcGlS2Euil07sKavy5ZGxDmjyyY?=
 =?us-ascii?Q?T+FnIvB4WImYLkCdfLzaTuifOTu+xLqehqhExbCfEtDnmu5RCUsKl9uto6vn?=
 =?us-ascii?Q?H7/MRF3dTzM1sbItatQjdWFZDLGBw8uUyV1bvPIdJVaV1bWhVqcmeqX0SmLq?=
 =?us-ascii?Q?cNNIiOZXuqwYij2326usEcVS63gD1m+GAzpUMjZlLxPGuV9E/0PJgtb2Cdto?=
 =?us-ascii?Q?vcl0KMQj+nxB9QwHrFn4ErgtFeWWG2eAoVoQwDRqqI3yyqhiPuiss7evq8VG?=
 =?us-ascii?Q?kWy828sQ9NQ3Dfny6LCgoEXjKkuJ1nXrsYVJzNPD8Y3riOmceZb6LySqSNts?=
 =?us-ascii?Q?VvIMhAAfbFvVj/4HpLdE8V2umVpX1XY8n+ebb2fx8TTB/eyeG4RHnwS5PwUV?=
 =?us-ascii?Q?F1/33/2ntnGxNOBft4NKq2KjDO4BzQHB7iqE+1vne6e5tFOnaW50XA3nEsY7?=
 =?us-ascii?Q?QIdFh6LW5+ZTJ8usJjTWHGTcT4Xq6gGbsEhOygVq7c+OsiUjqvbRBqDC0iUn?=
 =?us-ascii?Q?ABgiSRAlDIRSSB43Pd4vZzaZaYb5GygAsxIHlqQP6priQZ47eC/RxnvYFei6?=
 =?us-ascii?Q?i95C6/vjuIdJLIJAFQAvzuwLA5UNMQn5o/3xNQxi2uloM+ktO2n6OWUBskj7?=
 =?us-ascii?Q?A08EVJTXCTXQ4KBVM8ZKAD3Cd1KNBrqMtk0f0JU0u+2IBUgXVjgSoU8mbNKP?=
 =?us-ascii?Q?qSdWxBmWjsVP1cagBaKfMHsFKGzoql29AeTrRIHT51Af3GJJp0Q/jSCZjp0W?=
 =?us-ascii?Q?1kDY9+b/w3YJ0IJcxGmSV9upT41AMoBo+6Uml3lgx7ldWcqFrggDQIQ5k1n7?=
 =?us-ascii?Q?//as/H1+nouRiU7V54dnNHBfkPiTcmsjhfStZNMRIuZtgnvUuhai9AAs/ifD?=
 =?us-ascii?Q?3Kg+ZqPEjbWZhycBHktoz7+y0MKQUUNMoer9w2IWWIkEQXufr/oHr2U4VTzw?=
 =?us-ascii?Q?4d22qtrvUSfhK/QKM13hMEswM3zwQKTL1biPtLLBxw6Zv1x4Xtkeoa7nsLvj?=
 =?us-ascii?Q?mpKSV3ddgsTbVm4izMW3qMaUKjkoAzqG6L3iZnjKp2IHK4nbn1vGeltIlWik?=
 =?us-ascii?Q?N7OOkLlXGtYKLz/I8281CyRItdagKSOpARdDvRWu/7wSc/12QO0mV3+gsu34?=
 =?us-ascii?Q?RAEzVqvDB3xjlyAFH2Y6JJ/tzLi+G9fsdfpZCH3roXL/gxB0dFtHA3ATTSki?=
 =?us-ascii?Q?xuqhS9Ojx4rAfNJnNjtKrEIUsjTlkbLi82JypbLB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6796b644-cfce-4b43-9770-08db00e23ca1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 03:46:28.5387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k621u7vAOKatp+9KyAJ9oh+wOHOu2edOzespN+5ls1AwrVdv5762Jyl7IRUFXO+rgonv+0pe+b/SPACLMHpquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9203
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
Cc: neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-imx@nxp.com, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, kernel@pengutronix.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add device tree bindings for the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

