Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1089B420C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0D10E59F;
	Tue, 29 Oct 2024 06:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KdepZIxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270010E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:04:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfqC4TQx8msDr0RTjGJKQwGMaPQyvPBhtSi+oiGbWOxW/HqUiJLlHc/4ZYCct/VD889qX6Ava11RNUsqgbeHjjKRcoLrXX1x9Kj14OSSEcPqN7J6wQAykzYTGhInOEhqvNLtKf9INyvknRQpTVlDYw8L5/u9MoNVM5rzHDrtHK9Mjm5WsH/m/sGM1jvUafCpTLAo3LQPQ2lur8lv731VZKF6aOKb37KgNJqC4Y4GuOUSH4Ls4/yCdIjjYEJcg7WM9Tp15S/f0gMKDs7xUeyePm/GcWN74JMjZQ2vnLBY1A+B4nEOzaCDy2q+GeQ1CYGGWu6Z5g+xyxvKwrvUN9gLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n76L3OPNHqO2xGzcIIM5DY99F3ucKEx6P6cCU+XKYg=;
 b=WPsVly+05jqU1x5dHqmuU2ino+bohfXMqB2lBZJm8Befb5uy1Gv997PnLcFVc5nb3ek3YCZ5kzOyCD6XQElU/FQC/btqadx44TDrka5DxnR2BIGd8GhfIkaLBDBRlP6veuSZizD0ABLsPHXZ5PRIyolQl1UihB6r5rJjPKKKvLKa5wp4maVKrutPkmjoYYlspacW9xftGFGQ1RjohZHEWyiL4kutz7M2qXWR8BHHvuwoRMvheJfO2WHNYf9KWCY3/+yeBm2qtZvh9kH03OMOdBKtNm4Mncw6mbXRv5bo9lx+iCgJfWs0iiqr/ENtYizfIz4epYIv7RAGVUKmg6LWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n76L3OPNHqO2xGzcIIM5DY99F3ucKEx6P6cCU+XKYg=;
 b=KdepZIxg2uGNi+D++MIZYm7Elpc9T5Ek/yo+RbsXwjV0PYTjEFPVbHZvjBzhroMzVb+9ZZajVnwjwMxNNPdoVCLLNMdB+bvMYeelBhsFXzoo60RJ8rkqvgJ6uCjOfrTRZEugl7Y5nUHcSMXNpfF4fy1hqkUkTUBJH8eJr7Vr5OIqH5YDCiRsAHqx2LtlgdMEYATpwhSmVKOqmOds7G4shqcui0v2XkDIK3unjrN0+54yidcClHpXp+yy0rDnCMbk2VAtS8+zonRgGFV75y9y0ZxGJWl0ps0DeKH9XgTlp8O7PaNSxlY9fcMtD2SbqN230DMMYd7wkB/42WRt4L7YLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:04:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:04:42 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue, 29 Oct 2024 14:02:11 +0800
Message-Id: <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730172244.git.Sandor.yu@nxp.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 200794ef-a466-4b44-b323-08dcf7df9471
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PWvhJysa0jSM+IV2exp05m+PoWau6tkdPOKYpe5h2gMqV4k8wjimFHPFwJgG?=
 =?us-ascii?Q?L/wIfClSp0BTkhjtGqih/aGHEfM3g3CkZ9jlsmSlBvzohyV9SSz8Xci96Ysq?=
 =?us-ascii?Q?obWNUXu+Hrl7PEnMg7dFp1TUsZoRS1w2V65o4jKtW0RrIoaKn8MnEkycRzCZ?=
 =?us-ascii?Q?JvCA+mk91JgTEgFUwm0bwywns83+503R+G0AIXt3CaDsy5eLxs0nyt27W/sG?=
 =?us-ascii?Q?Nu/IFoV5AVptbLzrfMSMfURRsBKI8mMycMSz5z21o2P4g+M3N1jc5/Ojmodl?=
 =?us-ascii?Q?WJa1w6cjyzhwdG9fhEpYlAV9sctH3PkZ0t3htYHHHPvbmt9Fg951rTMmMkKl?=
 =?us-ascii?Q?dy5Hw9gJcGG1vq93YynyCjUTuAb7Qk0DOkBbiSDKvnkA2mV6LlOJ0GLQVvC0?=
 =?us-ascii?Q?r9kq/SUmr7Y0VerkaS+xvp+3ybJU8KfFqB1L942bC8we77aNA5ekT6EjIga/?=
 =?us-ascii?Q?CDvdFifxvT7SRMlaA81HH9OJo/mHKn3zWAHWFL0zIsLLDqZE4qSjXf9D0imU?=
 =?us-ascii?Q?13z61ls+0Wzxh1ie/iEj7a86QQ6bFTHz9e+GuNfDEuyccTHeeliRrxDEsXK7?=
 =?us-ascii?Q?AERL1USbhFqrKhbbImhSkSzihnR9d35UZwahpr9MGkjbDxfwPBxtyjWyz9ke?=
 =?us-ascii?Q?9Ea/+brGLOUuUhAnf3uru4KV2KxdSfqawgOrfyrFcA7DMdF7E50x/CimOp3O?=
 =?us-ascii?Q?mzF0EXLKJSzPEL/74NyXT3Z4U7gO9/+cyCwbqFaix3Yp3ol3s4YQn+KhL/Fg?=
 =?us-ascii?Q?7TDWlEeaXdQnm4864+VWzpl12mYAynPR+XM0SPW2ZcFW8HVKpU581WU9TRoZ?=
 =?us-ascii?Q?OvnGR1MEuuIet4G69mC31vrk7Q54ic5JSH4sTcmDjadTd7BUcW+azc+LxZ9n?=
 =?us-ascii?Q?515vMzStKjksb8KaagTuAWLKBJLgsfcv6m4ljsb23C5/atpUOJ0Euetlf/6B?=
 =?us-ascii?Q?E43dEUahA+9Y6W66J5+7mKnfjNF/8Pokj1pLiaV0CAkAPOLauGtgF0tKt/sF?=
 =?us-ascii?Q?2fbYew8W6PQqXWr4Uqy2UDYIjdGit7ChwBQu2qCtbRVQ/2XwMDHLlNEq41d4?=
 =?us-ascii?Q?cgDMSlXMQmUAleeSCEOqsWeVqWsaloJMnUrPBs9CkU5h1XSrtUUNmTk44/TV?=
 =?us-ascii?Q?8ojKCsQhq3ojXGQnmWRGz50uCGby06NUkuRgYNYnCRe3HCe3Z4Fa+YiUJi+1?=
 =?us-ascii?Q?kSgSmQhBYwwTVT1UfWpeSESVq01xQbdGoOmbOfFAcBqy/OG6uQScO2ka4hpB?=
 =?us-ascii?Q?RxlDiGjFpVus3ao9BM9sutuSj9kifYtGT+jAkA1jhXMQrUN+T0hzkDBYaF8+?=
 =?us-ascii?Q?KbzuNu6+ePPXG0tCTxxhLqQnHjjNtW98c0I+Tu64+HD1bQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XU2mKXiI6XnDIukK/WoJvKtqTTwiCuCgyJLAZJ4UfCVplDP8S10tNSaB3vbC?=
 =?us-ascii?Q?jD4UoeL+n5XUv7TcIrkJds2L2z5QdWDGFFlIciwqJM3lqL92mJSQsas5bVJR?=
 =?us-ascii?Q?CGfgQ7GhwFMJasVH5YigEACeCcnDNbUKzio/Nx0a8fN70JSysQez/e7TxmHK?=
 =?us-ascii?Q?i1x8aLw8zy1bPYsvpn7bFui9c9i2y0mVmnJeU29oEJXoweGV57Mupm8VMt8p?=
 =?us-ascii?Q?5cVe+YsiZ/1pbKauCSlGkXaTB2OB7UEOx2RN+PUxb5uGC7xr03CEauKFdWnn?=
 =?us-ascii?Q?xKfRbIhCAA9NLBODHl9dePLdsiY7EwWsD/++nVWd5dDtr6ly5e2Wy8GzHnWA?=
 =?us-ascii?Q?XTCfKmV7Ywnio5j8704GjTnevApbgGc5ek4RpBVMco9GFZTp0ETZxWMEGMx6?=
 =?us-ascii?Q?/RQbZj3dX/OWtd8mGjqTEfCxK/hANvdaXrb/DfST4T18jblZibBPOCxkIT0+?=
 =?us-ascii?Q?y6fzo5uR36rYwbXwGtD2su0zC4Z2JnUmb2EmFyMFrO9uWWkjA1NohnxdF98t?=
 =?us-ascii?Q?GQK5WgJhStBdJIXVk4kZv17bamr4Zbk2H5iDM8cHHU4b+qxV7xUOtODx58o3?=
 =?us-ascii?Q?SOM55ACbmlaKc3ETV19Ct/Txe282KTEclprJXdUApaa55Y9GjO4u+FeW5omj?=
 =?us-ascii?Q?THGWKDUB2HN8IwyTCeXdm9gXNvTQmi8Dga9MuvgmKO4Utn1CN/jaDVUA1HIn?=
 =?us-ascii?Q?FHZ5EJu3dK7hM67g/Zsk98eu4F8adS6VENgxYSCwiu916kcA2Sq+7x5loreZ?=
 =?us-ascii?Q?2q4yEG6m3lf2zHsHvnNBlOenyLXnpGoJiSVQRvS4f1XMffFZkN361X0v4MJO?=
 =?us-ascii?Q?uV+tmS0QvlyFFXHLZbmfUisUYWCZ8tuooUmyrbk4U241hpVaCOLDa0hIvHsQ?=
 =?us-ascii?Q?zk3GdU4W8b6cuhFO8winZg+FFdDazVb9ixvJjU9gIpEKdZjZ2OoHuGB5ZZ+T?=
 =?us-ascii?Q?EK6Dlndqths+8tlOGZEqIp6EnvOl08BsszVQCRiGPeGL2RR25cY6FysDecDI?=
 =?us-ascii?Q?DyZS24oWA+40NvE/eXYFRA/OuRcpgT60Tld2KvEOOCpubLiBUA2HTb/9LqQN?=
 =?us-ascii?Q?YU3VMGLaPE579vWhyywjvc8hW82lHd2aMkwkWTBICZknbif2FT8IvS7YtBZH?=
 =?us-ascii?Q?5DceH666xZkXN/K69He+jvCwhpXqtLBMMnqrNPge0+oW/fSEPdfdlVkCLsQr?=
 =?us-ascii?Q?e/zVBHcNY0xjGYnGh/cfiifgebphTjxXMtBfRea378uT8ULsFiUkyBEd47gp?=
 =?us-ascii?Q?jufMRN71+mWNGJqxLnIRqFXkA4rzS2S/1vipg8ldn1Oqh1GvlTVZIy11qcGU?=
 =?us-ascii?Q?76fsC8ofqAOa871sCsxmfz1fL3ZUSd8mjVcJFgAD3/dxeA/G8uRd8FXXpcuK?=
 =?us-ascii?Q?ew6nQu5EB78SAk0uApv6b2MRaKQT6wi4cPzBKNmrFmKSL/M8je68w+EjoKS3?=
 =?us-ascii?Q?yEj3WnojDFmMfW+7OhKvMPxsL9QOOFDhqjTuX72f8YXKsVFPR3BWoxTGLRYM?=
 =?us-ascii?Q?HL4wrIwn2p5zMqCZx+BqklJ2mmEjuf0fDf/IUvdqzqeDv+oKhaGYWhj5O7O0?=
 =?us-ascii?Q?wxx0H+h3jqGCMG++UvZBCpWNy40W4HUAynCW8snD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200794ef-a466-4b44-b323-08dcf7df9471
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:04:42.2565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KgQv9vkBEiXOuhJTHnBc1BiXQpRolnBxQoKB94jmsNgGU4CO+50N24GRU6sSRej6HMLo1WEC6Yij4PEU+jSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
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

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v17->v18:
- remove lane-mapping and replace it with data-lanes
- remove r-b tag as property changed.

v16->v17:
- Add lane-mapping property

v9->v16:
 *No change

 .../display/bridge/cdns,mhdp8501.yaml         | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..e4b900ecf1ac9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DP/HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  data-lanes:
+    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
+    minItems: 4
+    maxItems: 4
+    description: Lane reordering for HDMI or DisplayPort interface.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - data-lanes
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&mdhp_phy>;
+        data-lanes = <1 2 3 4>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
+    };
-- 
2.34.1

