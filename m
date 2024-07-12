Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226FC92F7DF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BAA10EC7E;
	Fri, 12 Jul 2024 09:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AmOMmu6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013011.outbound.protection.outlook.com [52.101.67.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B482C10EC7E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qubN1OMQx5wCweUtfK5LwGg9BTzhR8Pl8WSVFbQI6TFpA6B1mLPQdO4H8CjY5h9vdg7cK+CEKnz5y00R5+SRQSsdGWpor26QpMoTZnRaZhUjuVJkledygH70POxyTSVd/uTcH1ZvhErxg75VxzfwY+sefyVVgf6ssonYldxdddXal0IhIOHPoprGoaB5bdvh77RcGlkFkct9TaWV3Wuem8cR+4SNnlfZ7EvJTcdolHP8RME1KXWJ7hbFFp3SCY3fyOM8Y0gRASzZaH7hgWrzLAI6i1hZ3s6Re/iP5F3X4uHGdDhXE/WzaTkqrsMY56dWVmMsS9F5FQduwwbld8y0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTqGwmk22v8Cu38OSeyXqtZgnTvOWbo/OxP5Sbk3PWk=;
 b=pGTQi4bUIUwDeIsQfp7mbYl1w1xdPMRLjUT0LlslzABL7Pgz9jzFhwhOK+cJBUNbxY/q7fZ5/3OzFah7gt4nNGvo8KU6hq8sKtQd6XT1wRePS6Jk0Mn5fTpVUw5f2YyGLXhJ+Ivb/jnZzdPMueWr6dwc6qf/vrkGYhDWbE0VCGeVkn3+z0BHBvYPZFN9vIpakKGOXQlQApI6qZKAcNIc5H1ligKZb8YySnblAWLxG+IAOysCr+be5wWZgYGVKa2IGMYcW2mBPZrOx7xbZQ4beNf8pHNe3NTluj0coBCnWxKPoQJTRZ0u05BJambN/ibUsQ5tWlqT+gotPlcYfw/ZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTqGwmk22v8Cu38OSeyXqtZgnTvOWbo/OxP5Sbk3PWk=;
 b=AmOMmu6D/9KeLC1vQeNnHOssTxgve77bax/Z5fqOIkaN0cBDcvSPGTGZqrN0E+xN5leC5hCOsQ6wMb3Jb4FJcNX59TDEZhPiFAVaoBS15UwX4+y905+n0KhNlVxY5Dlj8uVBcelr3wA9HlTI8m8HE6nJoiOXlQ8Z3DgBGRhLaZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:25:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v2 05/16] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Fri, 12 Jul 2024 17:32:32 +0800
Message-Id: <20240712093243.2108456-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb801ba-b6aa-4696-c033-08dca2548817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UL1/XHT3e6+XNfEP9gdJUALvShPrSdD5+seHVUV52by9vOQdA448FYTDNV/x?=
 =?us-ascii?Q?u9FT50qILg7HEPM9ssJ4joO3H+mqHtd4uLjeJYkdeIZdylBaoOuY840YUyn1?=
 =?us-ascii?Q?Hqow0RazLhJWYl6sSmMIKNDAuo4Upfu27NetMOGjK46B3OZlj1uuv/xRcjnr?=
 =?us-ascii?Q?o0zt+Iry2zvp/gbXXnsrrB0HzFQeKyvWzl8OpCxP7Hj+aYpya8Yv1qPhUXwh?=
 =?us-ascii?Q?Pj5v/iLZcE0g11L/QDPt4HKV2JrveKFVTmIm3K222AkjEP9GIlpu2ZDPuYco?=
 =?us-ascii?Q?a1SmGR20wYNzyiW+VnF/68xAzGs6GCrTuIX+2gJn+DvfsSolHN7eMedHMj5m?=
 =?us-ascii?Q?k5OjLCuXm9NZCaKz44gpvW4p5FE/O9rPIPlsQIDe1fBj8r1wJbIUThTKNKpv?=
 =?us-ascii?Q?o6VDhEEQ/Fda8G8s3//y2vsrTOEmDnYD1JNkI+woVgcF6dQ63gM9tW/G0YYw?=
 =?us-ascii?Q?+NDiQ2n8/JX/53guYUiv6be7N9vfCQETKmtBsjplnXyU9dPiBupPld86bx7e?=
 =?us-ascii?Q?a0Sy7gC6YufVWKnFTnUyEztQcT2tF8VehuWbeKLsU4vhxGMjwexO9GJfE6tk?=
 =?us-ascii?Q?2KBE74lyAU582877T1+193oeGN5ZfZPUDSYkm0mKiBWlwh4O9ccF8mOxkDVf?=
 =?us-ascii?Q?EjVJuC1pxZD1g+Shd6oMK0tqbGQnfDmGk4Cry1IB6pDlxe82YamHDG4ZheIK?=
 =?us-ascii?Q?go8pB0DNSpHbUXyx60bVFLrrXozu7aSejoCN9oKqIt+Hi2nMZrrYrsa6A7VS?=
 =?us-ascii?Q?d6UZifdj7b5j7zUn49Dg8n0oRBkJatn4l39aPfx2h1JosJXcL0Is7+05+OqQ?=
 =?us-ascii?Q?zlRKIhJNKxIQXzwtd3394iuaAtCW5R8AYlxipwYd24cu6U+L/iiddfBmW857?=
 =?us-ascii?Q?8SsfyB/uMgD19HcpsKkPrhpx13yhO1RsQT3U+4RUpcZe5edM06SKPWN/x3DB?=
 =?us-ascii?Q?MveJzjQ0vJvEmrpyhU2s7NkRrQROOY5LWah6gXZPltSM6oaThmA3GMuooXae?=
 =?us-ascii?Q?G9hUbvIKpB/BTxHlQJ07DxtSpZxjkINFUcZkoW4mRxHqxfnVgwSB/cP+x7b7?=
 =?us-ascii?Q?XM0GdUILNOFFEjDw1rqiylL2/w/xx0Y1bpJtd2ZyykeLlkB9dIIW9JUmzQ6X?=
 =?us-ascii?Q?3PqdM9VXKHaaQxI1+1FDJY7e05RgBZ4FUW7IKtpYCzl4nq9L5/psFyiqsAbU?=
 =?us-ascii?Q?tVrdMAIjgGrwqxmndnGmoF/JF89cKDNrLLD1v/ydnhMngIzqN2ZUbzsgjrtB?=
 =?us-ascii?Q?CQZ7l1QSzAep9c1azLFye+ISuypInOpwkgwxUthsvCQv+362buF+Aef0CjRz?=
 =?us-ascii?Q?4oo5KjTO7iuys8m+fsZnud17kzI3wy+O9I7jH9TFB30org=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5rNKXuwr4knA/zEXPbF4YVHSbFOLPGrzXQLGpPwUZZIhSwCkFjeblsjj6RE?=
 =?us-ascii?Q?89IJYh1kr7n0a874yajolhVLdBorOMZ/IXb4BaoKVUh2uJ8g6URDP1OA6Jv7?=
 =?us-ascii?Q?wyqOjplKlrFWG6w1pAP44T8D/lqMdt9a/46O4G/+2/PY0YgR60HvNnvG1Jtf?=
 =?us-ascii?Q?E4y3uGoGZ/5OjTZDC/i8XtMw2bbySFSP4uAAn5HKPR7E8FBCMThqyYz3Z4uZ?=
 =?us-ascii?Q?MGXeUqpixsy2Swx/HtrLLBLPgpwGC+uBnClSsiuqZJEx1ki08OkYqUIQMi+2?=
 =?us-ascii?Q?HEaVxFdn5qe0S7g/sWXovoY2te8nTloiv0X8Cd6xraShFPOPsmpU0VTU5rZG?=
 =?us-ascii?Q?an2h0VEf8hZv2Jjop0z/d0WvG7AW8GjAXiTLru4pEnZjILHDsQLjWKNBSmUA?=
 =?us-ascii?Q?sKEjrgGpKbQ4893lsTISok8l1Elrd5eTmfUPLDRbWNZx459VsGrh/l0ZIqkO?=
 =?us-ascii?Q?IcNiBPgCn8dEEbvtUZfAzWr2ebxlmzu3zWG1olj+akKUZayTWerlraVXDrRh?=
 =?us-ascii?Q?0XRO+CwiSp6byzJTR1t07olP0Tzz6/9P9k8thufK7D47G6ql236eTTb3dpMd?=
 =?us-ascii?Q?0g2CilCVihkO/RrPS25qZTpKPvTDuIeinO2fOsuYV3sBJDBp1pQ5h5TDDFmt?=
 =?us-ascii?Q?HbEc9t+4qpXxVe6DpaeI0JLDCB0BUEpBYBaHDvijuPJ7XnysTxtzP9Pmfqut?=
 =?us-ascii?Q?sQHxtWiDHO7kyQ8H8zEvABi1/84kCnF1KNICoftHinoIJyPqlpRLdrWE8tUJ?=
 =?us-ascii?Q?quapsYe0z+w3gRp3OJZ4wPQKEdfxzisq19BwzAgxTr7FG4TDB5I8wWm2opki?=
 =?us-ascii?Q?1gKpj4g1qVcxWo7ltyIq3Dd7EaXPRPsC2BQuMv6zBhuduAeeLSVptFI5m34l?=
 =?us-ascii?Q?U5Wzgloa5TuODrmLHpxOZknW46pQhzQGCWgUD8rtSC1IGdAHxrvh8sG30QHK?=
 =?us-ascii?Q?xc34WPlsrGaAfGW2Dh1njX/Op6WB4tIYU9losBp6QV5Ftzyuz9vfKu/q0jsk?=
 =?us-ascii?Q?/vlBEji3uB+VbGo6ssC+yQwTf2igzqCmktGxaMvDyjJou4pdlnjdPOdPwcDG?=
 =?us-ascii?Q?BScio6LYoPfvC4v8nRT88ErJk1nybxzXOYY5jjfJn8Rdt6SaYD/1vdLw/htm?=
 =?us-ascii?Q?Uiiyn8dtHEbfzfqR9sbGR7cUDSH9JiXxQajwgeFhMQ1+h1bXNT4ulfMPxnUz?=
 =?us-ascii?Q?EH/+JeV2HgfWrTuDbuF3j33VgEy36XLTi7YnfE22Fnba3L8ar77wHdNEYMGY?=
 =?us-ascii?Q?WF6gQ1GhAevMHO6ao11a2ptjP84Oz/5K4LuoE9NghphTUyAQ2ht2e4qbtHeD?=
 =?us-ascii?Q?YOR6kqprfNoKm9PqVA2cQraY3Mana0fecfOKf7kPEnfKfHcNRUKy8WOqsNcv?=
 =?us-ascii?Q?UjZMvCfEr/orWqfLWliM2eaZrl7FrgeyOvX4B0IEz3CSpkY85Zb8za3gapyx?=
 =?us-ascii?Q?Uh1a8mqghSu/AqOQvhDZWGFSUS8Kh2+MfpKTRHb7neT2YYovZ6AI+PK5PKtW?=
 =?us-ascii?Q?dHmsiMW2s/liOmlmww4xeF2N9cUWkVPDY6tOt+sDZ1p5xmaaAvEHJlMr0LvQ?=
 =?us-ascii?Q?k7G63L97ETL6xubCKiw77Prq2uTHTo2eokYwUHCs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb801ba-b6aa-4696-c033-08dca2548817
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:12.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbFEBpPBCx4eG5hn/gx9BJy/GCcwl3f86Pc2mhs9i2o2X/Cb592KVKegHlyUzB2LwJkZiFgNrKMIxrJsAli7Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10289
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Use generic pmu pattern property. (Krzysztof)

 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
new file mode 100644
index 000000000000..0a72f9f0b5fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller
+
+description: |
+  The Freescale i.MX8qxp Display Controller(DC) is comprised of three main
+  components that include a blit engine for 2D graphics accelerations, display
+  controller for display output processing, as well as a command sequencer.
+
+                                  Display buffers              Source buffers
+                                 (AXI read master)            (AXI read master)
+                                  | .......... |                  | | |
+      +---------------------------+------------+------------------+-+-+------+
+      | Display Controller (DC)   | .......... |                  | | |      |
+      |                           |            |                  | | |      |
+      |   @@@@@@@@@@@  +----------+------------+------------+     | | |      |
+  A   |  | Command   | |          V            V            |     | | |      |
+  X <-+->| Sequencer | |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |     V V V      |
+  I   |  | (AXI CLK) | |   |                            |   |   @@@@@@@@@@   |
+      |   @@@@@@@@@@@  |   |       Pixel Engine         |   |  |          |  |
+      |       |        |   |         (AXI CLK)          |   |  |          |  |
+      |       V        |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |  |          |  |
+  A   |   ***********  |       |   |            |   |       |  |   Blit   |  |
+  H <-+->| Configure | |       V   V            V   V       |  |  Engine  |  |
+  B   |  | (CFG CLK) | |    00000000000      11111111111    |  | (AXI CLK)|  |
+      |   ***********  |   |  Display  |    |  Display  |   |  |          |  |
+      |                |   |  Engine   |    |  Engine   |   |  |          |  |
+      |                |   | (Disp CLK)|    | (Disp CLK)|   |  |          |  |
+      |   @@@@@@@@@@@  |    00000000000      11111111111    |   @@@@@@@@@@   |
+  I   |  |  Common   | |         |                |         |       |        |
+  R <-+--|  Control  | |         |    Display     |         |       |        |
+  Q   |  | (AXI CLK) | |         |   Controller   |         |       |        |
+      |   @@@@@@@@@@@  +------------------------------------+       |        |
+      |                          |                |       ^         |        |
+      +--------------------------+----------------+-------+---------+--------+
+              ^                  |                |       |         |
+              |                  V                V       |         V
+       Clocks & Resets        Display          Display  Panic   Destination
+                              Output0          Output1 Control    buffer
+                                                              (AXI write master)
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: axi
+      - const: cfg
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^command-sequencer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-command-sequencer
+
+  "^display-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-display-engine
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-intc
+
+  "^pixel-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-pixel-engine
+
+  "^pmu@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-axi-performance-counter
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-controller@56180000 {
+        compatible = "fsl,imx8qxp-dc";
+        reg = <0x56180000 0x40000>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@56180040 {
+            compatible = "fsl,imx8qxp-dc-intc";
+            reg = <0x56180040 0x60>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            interrupt-controller;
+            interrupt-parent = <&dc0_irqsteer>;
+            #interrupt-cells = <1>;
+            interrupts = <448>, <449>, <450>,  <64>,
+                          <65>,  <66>,  <67>,  <68>,
+                          <69>,  <70>, <193>, <194>,
+                         <195>, <196>, <197>,  <72>,
+                          <73>,  <74>,  <75>,  <76>,
+                          <77>,  <78>,  <79>,  <80>,
+                          <81>, <199>, <200>, <201>,
+                         <202>, <203>, <204>, <205>,
+                         <206>, <207>, <208>,   <5>,
+                           <0>,   <1>,   <2>,   <3>,
+                           <4>,  <82>,  <83>,  <84>,
+                          <85>, <209>, <210>, <211>,
+                         <212>;
+            interrupt-names = "store9_shdload",
+                              "store9_framecomplete",
+                              "store9_seqcomplete",
+                              "extdst0_shdload",
+                              "extdst0_framecomplete",
+                              "extdst0_seqcomplete",
+                              "extdst4_shdload",
+                              "extdst4_framecomplete",
+                              "extdst4_seqcomplete",
+                              "extdst1_shdload",
+                              "extdst1_framecomplete",
+                              "extdst1_seqcomplete",
+                              "extdst5_shdload",
+                              "extdst5_framecomplete",
+                              "extdst5_seqcomplete",
+                              "disengcfg_shdload0",
+                              "disengcfg_framecomplete0",
+                              "disengcfg_seqcomplete0",
+                              "framegen0_int0",
+                              "framegen0_int1",
+                              "framegen0_int2",
+                              "framegen0_int3",
+                              "sig0_shdload",
+                              "sig0_valid",
+                              "sig0_error",
+                              "disengcfg_shdload1",
+                              "disengcfg_framecomplete1",
+                              "disengcfg_seqcomplete1",
+                              "framegen1_int0",
+                              "framegen1_int1",
+                              "framegen1_int2",
+                              "framegen1_int3",
+                              "sig1_shdload",
+                              "sig1_valid",
+                              "sig1_error",
+                              "reserved",
+                              "cmdseq_error",
+                              "comctrl_sw0",
+                              "comctrl_sw1",
+                              "comctrl_sw2",
+                              "comctrl_sw3",
+                              "framegen0_primsync_on",
+                              "framegen0_primsync_off",
+                              "framegen0_secsync_on",
+                              "framegen0_secsync_off",
+                              "framegen1_primsync_on",
+                              "framegen1_primsync_off",
+                              "framegen1_secsync_on",
+                              "framegen1_secsync_off";
+        };
+
+        pixel-engine@56180800 {
+            compatible = "fsl,imx8qxp-dc-pixel-engine";
+            reg = <0x56180800 0xac00>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+
+        display-engine@5618b400 {
+            compatible = "fsl,imx8qxp-dc-display-engine";
+            reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+            reg-names = "top", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <15>, <16>, <17>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+    };
-- 
2.34.1

