Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488CB555ED
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F307610E009;
	Fri, 12 Sep 2025 18:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jdTY/+9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013021.outbound.protection.outlook.com
 [52.101.83.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D4B10E009
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdT7Iaji9ParmzUMpimmqtQk9LdaYu+l8FGchH0FUkK+0TYqWcZO7MwXBllYTJ87R5tt9X97YWn0P17pFjhODKWZGTv5dcj9QRCfiIZIy7cOHvGCGuaDUOCs4uxGL4nHgNr1UyuuHKsdxAYE5HODlMCW9pah3aWdv9A2sbJVIQPZygNDGRJI2+pj2jXCGleWNZLjCnfbdYqK4Zr4WivBFpyWL/lZF9tjy0zesTsNMAu/MoDoomJdIoKlaA7HUDIvNcEE0fjzDl2evMyTMmbksgMEeVSnZBTka0mYYZPZ6iu/03fpdMLzksQf1f2zBj8HJTYn2eU9VvIFeEvzO8/L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViDZmyzJ570XYbET9vt1oQ0HRzsovTUPp7YA+ycOq0c=;
 b=CAAxJKxAP5Q0tUmcAtk5ISDwQtJQVSYRDnP0PppGa7vACAXwKlmj8o/tv6adjo+A9/1PQTyZciAdXMu/TElUzN4g5KupVoFF/uXGpU+YniLbnkegD0aFSwAU6FdF8jlL+ddBSb08Kt6QPPNsLnL2n8/VqanLFxYTDNFFGL+0SRHL8MHM2A2Ui0Q4O/vJ6rCDNjEUBJ2xFFVwyMC9zvpx2mozp9bRWUvFKD+e0dAM8K989dxIyoRdLWeX80HhPt6dVwOMX6NSVU4ZCMbNYaf6RAneM2Ry1ock9Dif1VMZXI4sAt5cmUM4tzqx8SOasQozRNhIAkT1ogvP+133oxfz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViDZmyzJ570XYbET9vt1oQ0HRzsovTUPp7YA+ycOq0c=;
 b=jdTY/+9V2+66mv0mzqP6h72blavQzDEhoHGHCoX7UsgcrLptFkbu7XSFIl1CdCXr0BsNMf3tCE/UqpDUAgm04UMlBX+BX5M5mxOnd/YF4La6WY5zKW+30/ZF/IMH3iR6/7U45EtHYPjc1dcrygHTNM9xUmML6jlEP3cyaCeU08pEIuxv/8Zsr/e9gmjVmIUllpcWD2xytIOQ1iL7VrSDF6T6Iepo2qKZC+BL1ajhwVnXEPb0tIe/k/lbP5sm0AHCtChDgToo6FOY3MmERgOPiUmOhFiiO2RYWEWbC+IlEZfsDfi+fYhQICIWO/Yf81gN3jnlLvVw9OQ3Vf+diYFd4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Fri, 12 Sep
 2025 18:14:38 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 18:14:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: bridge: convert
 megachips-stdpxxxx-ge-b850v3-fw.txt to yaml
Date: Fri, 12 Sep 2025 14:14:18 -0400
Message-Id: <20250912181419.1114695-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: e48a7356-2240-441e-3495-08ddf2283c18
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7FtR3OIo124kjg3Cjh/nz/dtckURAPTLoVm4GioT97FI7tK63VTqpzlsG3Es?=
 =?us-ascii?Q?6yqsWDy4gimkVTnXWqKzy9cJiIszIbjjnLZleTiRPPbkI83iXXPBYgfMHJ8T?=
 =?us-ascii?Q?Hue++eXDwofyRt/1eL5u72z2qAkCy2O8I8WNviFmrqePgY7eVgnnMYVuhyKh?=
 =?us-ascii?Q?hUXxoWLO3ys5iQJlJZsJ61OLxp7UikEr1dIhc0AqjLWyQHGJ+WGAi3rX2Tyd?=
 =?us-ascii?Q?uflxlgJM+5EoeHLRwXL+wrw2GMQVkJBRLWqceo575aQTBJXw9skeS2SHeQuq?=
 =?us-ascii?Q?0RaeueXi748lmVUwO2ULI7AXefV+OVBdj8ahBMhQEJe116jWT521EOTKgXRk?=
 =?us-ascii?Q?iM48SixyHZGz6YTF5QpYz/yRTyWs+HPAitKB0djTgysrmkVkU90NbT98nsNh?=
 =?us-ascii?Q?0NhVPtvbOh3iaPfNZIG7AddDX3wPsEQvt/LnSLpPh+5MmGXGEhOhiAGPKkF2?=
 =?us-ascii?Q?//LTdv59l51FHQqpS1Vcv5CDX2hnMGELLQIrdnAVPG/1GIrdlSiay+qnjmBh?=
 =?us-ascii?Q?CGdrIyYt7jd8MVBjBMy/XSvWXyiu6LPuilSdXw4CWOHX9flZArlL7NEaycct?=
 =?us-ascii?Q?B7nTxj/u0C7DnnQJ8vjD9lYpqNyGw6bx2tdO96rCpraw9qeZt/DKPaYn9avP?=
 =?us-ascii?Q?wKkjpUkmKlCNjTL6qREzKOW+wYa9qiCr48r3r5BdXSY5DWbUHIJrt36qDDzC?=
 =?us-ascii?Q?NuLXK8+3PZ4Oma8ysJqCA95i+TB8zZfnFfNRwxffMlsb0Dmph4MJsGI781LO?=
 =?us-ascii?Q?vDU8FU4svBuJ38k2CoZOuPvYCHF/w8qw5JDH48cTrqEqkL15n2NIDJTUAV9r?=
 =?us-ascii?Q?581dYfgaPrc7gYhMImazUXP0EHzMrP5raFguBoiQL6cGFhKWkz3MXZuESaYa?=
 =?us-ascii?Q?SPY7IZO87vi7IwEVfHwKxH74x1LpgzKFzPIZeqEHoX6qPLOXTQ4pw9dFSv0W?=
 =?us-ascii?Q?RFnG7XZohcvuhvsa6ON0pRdfrxwo0BQr4xf82bP6JE/d6lFIB/T5ukJAdiRn?=
 =?us-ascii?Q?bHTiZREMcASiXxbgpjrP50riuDTToBGuK9L+SuxrVxmg1K4UA2Btek7uV21r?=
 =?us-ascii?Q?JbYsrMIchSbJ8kpTFbwcDQn5n066mI+lvgCX12wE1fkQ/exleMAHtOsoEfAn?=
 =?us-ascii?Q?9MvW68n2HP94Hk+Tl4Edut3bd+TorxdvTfOGS1kdJsexBk7tMzY931KccUFq?=
 =?us-ascii?Q?K/Eg3TOmOGmTNud8gXY4gOKO27lcpwosGaXZQQVw/1tgI1+dk1iocXbnvFpK?=
 =?us-ascii?Q?F0UN1cijVb28BZ8658cSuhymPMsE/tIYp8AzeugzGCr9gVz15C8K1uN7XAp9?=
 =?us-ascii?Q?JxTmLaihORul2/UgkzfmxBHH5172qbIHuhXVh8CDipc2F+FBPFBLWBHxJHIK?=
 =?us-ascii?Q?7Lkju45xmxMrHzTgB99Og/ywnKhc/7nP+NtYI5vuOc/XYlwXnCeu0kKxn6XE?=
 =?us-ascii?Q?Hcv+Dh4wiTtBGwPH5A0elcg+xKg5ctnk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9CWCywAJRPJwwKSBSWvAzg5bSgOwPmQCaT35g2leiusXMQ0iog7PPs6P6Pf?=
 =?us-ascii?Q?zWJlRxZJiNZktkVC4S7pnMrWaxW5zOUCswaN3RhcFFFMgXLcnCzwLpW3EE/c?=
 =?us-ascii?Q?V0HkSDKoo2Jfm2UHMLvo3+KoqtjQCoQGFHhAdJ1I4+pZyqNvKB6tGLQNhOIg?=
 =?us-ascii?Q?DvjayVhR8MrBHGPkW/j9y0t9iMXBa1C5gGYYKSMMx75mUXq4JvL9AU1lZZK1?=
 =?us-ascii?Q?eCgkka2yHJ8NEUKzNZUHUHK9luoNyctlKz8mBYHnj9Muj5hdVvmtvMLG7LgB?=
 =?us-ascii?Q?nj9tHXelNuJYI6BGL1jMAEdCqc4CuQm3WGUUysmXNfzhk6LPZ1GpGfTSLu+0?=
 =?us-ascii?Q?2KrfXWwFzDcdsf+4ow0VBzS4A+pFfDTIOhcGwwP/bQapkcJWjiHFXs7OsIoq?=
 =?us-ascii?Q?JYfPVDlBiFFTyZo1OwNZJ+mzXe9slFwYVCctk2/1pKuBXLq/CMhw6dsXt7qf?=
 =?us-ascii?Q?8js3SOxVes5cdXZEDZvCuPQKGhj6C/jDqhuaBmEkjg4dWsZKXyERelmEqOsR?=
 =?us-ascii?Q?wpaTItpNkG20VJ6G+FcldH65JbVZ/cKMjHBase9hPcSsQaDI0mLWf9LbSurY?=
 =?us-ascii?Q?0C6if/xOhvIlCROEleROQE335omsC3BwFV/+WzWYE38q02sj2wZQDcm1CYJJ?=
 =?us-ascii?Q?AO88qK76angJF57UIdUB6+cFVgXIkjZIAy5faEKl3N+vzl9ayZSLtlAfey68?=
 =?us-ascii?Q?1cOQkc2sPd2xGYBuMFqp1ECEAw4BXWBBHSILCMiz8ccD27Lbz9f1z3ZCuD4t?=
 =?us-ascii?Q?QC/JLNQrhqJhMmcbGlrb65z8twhEW1Fw7WvyIKBG80cevrk/W7Ox8pL+OxSx?=
 =?us-ascii?Q?V/qRdTaFGy+Aw16mXOrvwJH1MgxHTAkNGNF8jMPBCqcQ8+IXonorWaRQCoC2?=
 =?us-ascii?Q?pjF7P3541OAVXBnai31Q548RiSNW4PQw+DuLlY0u6R27gHmWfoooz9qrCgwx?=
 =?us-ascii?Q?3USqapIWH/yMAky78a7dOK1mb+/Sm/ua/zdIBHB9PysgW6lS01EKut01IBZQ?=
 =?us-ascii?Q?jiyl30s9Ok0/kFlvPqNQSRZVYWu+Qp6dFKF2Q3ci+CGPq/mo1hSFmkUJPOWx?=
 =?us-ascii?Q?X5CsVxjsuoI1hzFOzDkikGJthCe8hL8kk+H79C1R/KmHiMcHnSGwZyRl38Ye?=
 =?us-ascii?Q?wSbTUPcVPpTGNRnF9x00hlTbvtrRPoejWZDHuYw35EHzmO9aSDqRimXNB8CZ?=
 =?us-ascii?Q?XLd+VSMkeApwGSoKYgEhtR+I68zLhdbkjLdVI1DT5Kbu+srEIRx19b5hi4PE?=
 =?us-ascii?Q?4S9b5CfwGS+l6eiQGDZIS0cAx6b+G+vtNPSFbLx079GTLPIXS15kd+0t9ZOG?=
 =?us-ascii?Q?rq1/TDbFwZGnn5UiOo//ck+ggi/Ddn8SiiVMZYue+/7Pc+M2ehYpVmxwfm+F?=
 =?us-ascii?Q?C3X+vfeeKqRxxTxswcDz+Yof9Ea1Zh4g09odwi2euSRvUjEtI/xCKJbQNJLT?=
 =?us-ascii?Q?DJbq4LJQHOUQaeInW5slDcbVP0npF5/DrvC9G3I4wAEqlX8zYuahyLR3+rl5?=
 =?us-ascii?Q?hkgVBwNqpT42uxZ9yoMXOJTerNB/yMn/TYTBuU4Eeg8OzAOQqCn1R5Uv0Ta3?=
 =?us-ascii?Q?LBhSq31MtTIOVxLyuW1788Vcu444n+XrdHCI7rGA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48a7356-2240-441e-3495-08ddf2283c18
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 18:14:38.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTDMYxe38GEOcZQXFd6OgNCt65zGZnD5rwZZvGiLheDlPOFb3RLy8uJ+cShIc89Ufh+sznPIvxgczNGnQgnigg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951
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

Convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml format.

Additional changes:
- Only keep one example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../megachips,stdp2690-ge-b850v3-fw.yaml      | 105 ++++++++++++++++++
 .../megachips-stdpxxxx-ge-b850v3-fw.txt       |  91 ---------------
 2 files changed, 105 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
new file mode 100644
index 0000000000000..6b5cfc41f7414
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GE B850v3 video bridge
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
+   STDP2690-ge-b850v3-fw bridges (DP-DP++)
+
+   The video processing pipeline on the second output on the GE B850v3:
+
+   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
+
+   Each bridge has a dedicated flash containing firmware for supporting the custom
+   design. The result is that, in this design, neither the STDP4028 nor the
+   STDP2690 behave as the stock bridges would. The compatible strings include the
+   suffix "-ge-b850v3-fw" to make it clear that the driver is for the bridges with
+   the firmware specific for the GE B850v3.
+
+   The hardware do not provide control over the video processing pipeline, as the
+   two bridges behaves as a single one. The only interfaces exposed by the
+   hardware are EDID, HPD, and interrupts.
+
+properties:
+  compatible:
+    enum:
+      - megachips,stdp4028-ge-b850v3-fw
+      - megachips,stdp2690-ge-b850v3-fw
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: megachips,stdp4028-ge-b850v3-fw
+    then:
+      required:
+        - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@73 {
+            compatible = "megachips,stdp4028-ge-b850v3-fw";
+            reg = <0x73>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&lvds0_out>;
+                    };
+
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&stdp2690_in>;
+                    };
+               };
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt b/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
deleted file mode 100644
index 09e0a21f705ef..0000000000000
--- a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-Drivers for the second video output of the GE B850v3:
-   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
-   STDP2690-ge-b850v3-fw bridges (DP-DP++)
-
-The video processing pipeline on the second output on the GE B850v3:
-
-   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
-
-Each bridge has a dedicated flash containing firmware for supporting the custom
-design. The result is that, in this design, neither the STDP4028 nor the
-STDP2690 behave as the stock bridges would. The compatible strings include the
-suffix "-ge-b850v3-fw" to make it clear that the driver is for the bridges with
-the firmware specific for the GE B850v3.
-
-The hardware do not provide control over the video processing pipeline, as the
-two bridges behaves as a single one. The only interfaces exposed by the
-hardware are EDID, HPD, and interrupts.
-
-stdp4028-ge-b850v3-fw required properties:
-  - compatible : "megachips,stdp4028-ge-b850v3-fw"
-  - reg : I2C bus address
-  - interrupts : one interrupt should be described here, as in
-    <0 IRQ_TYPE_LEVEL_HIGH>
-  - ports : One input port(reg = <0>) and one output port(reg = <1>)
-
-stdp2690-ge-b850v3-fw required properties:
-    compatible : "megachips,stdp2690-ge-b850v3-fw"
-  - reg : I2C bus address
-  - ports : One input port(reg = <0>) and one output port(reg = <1>)
-
-Example:
-
-&mux2_i2c2 {
-	clock-frequency = <100000>;
-
-	stdp4028@73 {
-		compatible = "megachips,stdp4028-ge-b850v3-fw";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg = <0x73>;
-
-		interrupt-parent = <&gpio2>;
-		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				stdp4028_in: endpoint {
-					remote-endpoint = <&lvds0_out>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				stdp4028_out: endpoint {
-					remote-endpoint = <&stdp2690_in>;
-				};
-			};
-		};
-	};
-
-	stdp2690@72 {
-		compatible = "megachips,stdp2690-ge-b850v3-fw";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg = <0x72>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				stdp2690_in: endpoint {
-					remote-endpoint = <&stdp4028_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				stdp2690_out: endpoint {
-					/* Connector for external display */
-				};
-			};
-		};
-	};
-};
-- 
2.34.1

