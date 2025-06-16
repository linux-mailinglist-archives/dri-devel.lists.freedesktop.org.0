Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC4ADB8C7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 20:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C13910E154;
	Mon, 16 Jun 2025 18:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E3ZQr/qm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA2C10E154
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 18:25:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+Cxd1z2BYXpQOveR1OcsqP2/WJ4gVTkSRrW3KOqoTFRqdF3Qczy5nQDgEl8WJ7lmMAGeaGfVERahvDtE1j9j+60D9e62HcAEFmZapbwmptrrNSCIU84DH3Rq7nBauWHJZcQaII43FzDZ+y1QQj1jz/Xlm2ukSG3t32JLk7GF2hG8dCFDClz2JYkkLLstq8FwNTxoJd+N+1nqij8ZsMmUVNfTIfUfMVN0819Y6e1zar8y5h2139EjIGCxvJjdQGWkHzSq7QAujQ1pDqf/8f6nOBcvN0v4KRT21b0khff9WCxovWXvOl1ZqZTNXb0y2nfIvN9wDMC8XgHJzkp4t/KJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xyc8i2Mvrqx/KHYx7a1c850CX7/+NHzCBLlg3o11FuM=;
 b=bX75KOISlJr5vMl4Jxrtspf/+iXFEtEdASpd5r6fPEWEwXH23jrWTrrR6HFyMtGbhRpvfgnxGtoQdPK/Cdo+JZDampOVylx2BPlWk/oD/uzh920gN5MqlBrw03uftkpW+Fcp8TMMskEjfaNF+/gAPa27zQcho7EXTdyNrzdA5GIqnZs/PbbAxTbPNDs2zwYnA2klprr9yhC+v8Rwiw1Itd0L4vVPkSydBtOcCfpqMqn/jwmp4rT6NXeAvfWIiqdaiUrouTE/OKfZ2hkYwTDM4+fHRSDi/IrDo9MhF3CClkj/qzVNqERKaqJ6R+sqaxPLRt1k1yu3g4eVRUTxUoqg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xyc8i2Mvrqx/KHYx7a1c850CX7/+NHzCBLlg3o11FuM=;
 b=E3ZQr/qmiTU+vFzJLMSwfe0pIdt8BEOU8pAIwe25o0G2rSvwx4J++FOTt3NaDVOT82O/kiWJpQrDO4ZTNb3TEf4O41KjuSdf7VSPGHKSHKmklmGXEH2XiUKVThbtsDSWz0gK58ZIYFgq7WbfBriY3o7F2oFhFKD92ZBtqBS+TA+QLxAZLQ17M68j19sMT8GDwgB90sunHflpdxjYVUmcP/LOiUfQkFiVIxEw27yjPrwlcAnftWlEeUCkspfezicasciuLtw8gjAlssbrNg+pqVDQ+UbiDyfaVgnMiKQcdsZa7gN8+VdeUOBowmd1Bw4rjDiV+COiAakqwT0hywPAzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 18:24:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 18:24:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [RESEND v2 1/1] dt-bindings: display: imx: convert fsl,
 dcu.txt to yaml format
Date: Mon, 16 Jun 2025 14:24:38 -0400
Message-Id: <20250616182439.1989840-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd53c41-c50f-4f6d-5810-08ddad03178f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4mh6WqSDEwFd9r62nLTiUI/IvvIVbxmrYBNrq543VhaPo9Au2sYIxNjncKLY?=
 =?us-ascii?Q?GmLuDFlwktAncOHYfL1H+5ugdHu5rCKZTP+GzroIONt310cCP/ujN3hSO+JH?=
 =?us-ascii?Q?amXAh+k3pE+qZnv0+ppU/pEaZGfBjUBaGmmsXbGhteJpis7qllgzHQqgoa5b?=
 =?us-ascii?Q?K+sqbzRzFxroXsRIzBQ5MgOiT9GdLJlu9UkcIsc47FvgTHSDv/+SDDHWu3AE?=
 =?us-ascii?Q?SaCdWYLiDKxodIKgScC6ixOPJnv15nzSvQGaOaY9neC85thS0r8coNhbFFAz?=
 =?us-ascii?Q?EtNP1c6PrXlFKgXcgU71KjPsxyN85TeOcRnW6ekjEYnQqeXaL2A0n27xAPxK?=
 =?us-ascii?Q?Ea4bptH/CvO/ApMlWy9jIb9mevVPiGulzefdVwJWzCQJbcgnGo4OBMWkmSK4?=
 =?us-ascii?Q?pHvwtcIVm7W2vthlB1IoxGptwaInaky4YEgmd/WDwW+HoWGWzNAHrzMVj5oP?=
 =?us-ascii?Q?QwnkBlt8s19f6yrlcfjfoCNpLB778MGtorr2Vqn/wiwSUZLXbJ9wq9OPq+20?=
 =?us-ascii?Q?fZ5peJKWQrPJF+WPbyNkyrKjH3MD5p023icZp2GlpsjfECwHLz5k5GYuNUhc?=
 =?us-ascii?Q?Bpa2iJkReKSRG/qt0A1YPuj4MdaPZENc5RcgR02NjLxMuPXSJVAeWD2Q70MS?=
 =?us-ascii?Q?Uh7+SeQzgX06MdDv/iPyMYjBtiyPpbL/FAMOXLRWpR2mjPXdh918LcBmMuTE?=
 =?us-ascii?Q?Mzz7JxEre79l3r+Yx3oW8d6vgXDip6OkCMZ7fq7+llYka7embMyPjuH/FN8u?=
 =?us-ascii?Q?gZYk3Nvo8ae8IGABGzWBRtWTE/HZMYOHEwb6TJGDSA80jHjZ5mam5H6FbTsL?=
 =?us-ascii?Q?5/tbgLfikRQnBNyXFDVxk/ifDrYctlVRAAh9aKb7O1WXMHIYYGjkSPlZQTe5?=
 =?us-ascii?Q?Et8fkUOpqB84YdnlgIfEDcrI66HLYR0dbg3z7mekq77jolTFwnE5Hy5MCpc6?=
 =?us-ascii?Q?VxepfCmIqR+KDO3e936D9Oe9/89c5f4P+sfFZX9umuoR7X/87oNXNeY1YJag?=
 =?us-ascii?Q?HdjLbqu7QkX0bf2qPm19yCLMYBHJuoRCVoI3pDoHih90NwkwnO8uD+SEQGr8?=
 =?us-ascii?Q?ymH1Ogtsj/p/mVjwxZ4dwz5DVZZTGscDtO90NL02HJKQh1oDZDQyt198K+KK?=
 =?us-ascii?Q?zVDzDBRwh5nTQhjigH3gQAwmiUK8cbtUQN74I685dk/LABOFSxeq16Zx2mtH?=
 =?us-ascii?Q?nd8BM60eeL9+LC7PHuyqwXMcO6yuBt2l2JTDqQKXOBHA2EfE3ubDGUYsGQkN?=
 =?us-ascii?Q?VkvZWK4q5BD3mZ3kTS2RnZOnW+TFjVJ7pOzw5u6AszZvFouKt5OtuKvXElBL?=
 =?us-ascii?Q?osuhpxzEuTdPUhqUvTGE9eCOedU3q8860uZ9QMBGz73CkpjaCKuHQEqTURhg?=
 =?us-ascii?Q?pb7H6gG7g/gj5DgjsAAJ/kdlkMTxe6zZIkpLn7pRBdLIFzb0PNoXkRuxyIwO?=
 =?us-ascii?Q?GdffLVN+XTGpImpzDL1F6X6Kv4/6rQ/E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DzPoeqcPj9VEZkwYajZXod2y/ILwU6DAhq4j3PjyPPCs6N5S65RpbQgL61Gd?=
 =?us-ascii?Q?ThqI8/LFG2WT5RP3COGMwmPqiTZzEjcO+fAuY53NaHrub1KJO1Tbsu4ENRAR?=
 =?us-ascii?Q?RVkgkC8lXpO2xeyITdzatXf/HKClDGQwzTPZ2PIzfjpK6lUwLAXj+xw7x2uX?=
 =?us-ascii?Q?MsQbvwKQYdTLHtWlpD/Vwzyo5C5aSvndxUH24Q1Qucoznpy1j+idopbfjmKg?=
 =?us-ascii?Q?ywM4hApo/YaM6gCE1z8ewtTTfHTj/XxKSkhYqNBPK/Xumi24RVv10XC2v7c6?=
 =?us-ascii?Q?Kamg54qwxIgw3ZqEMdeJ8w/6NAptuFDZpyJ6lN47W7Dd2bNyEItrjj8i8EC1?=
 =?us-ascii?Q?O+m5vKXDrfQfTDqxvvQfluiem6go+GZf1WSRP4ZXrmH9KBlYL1jULIvtu99Q?=
 =?us-ascii?Q?c2jP1jCxdxv2KyHoQZUZRhpbLh+LIVXDjg9nMH7OG9+xt58X5QBqLlJifSWU?=
 =?us-ascii?Q?REHvPhHMHUb24a3WLXddcFRlA6WoQqTMEuFHvWPQ3vx806iG8kAKZCoA78dj?=
 =?us-ascii?Q?CEx3bB4xGWUE5oiU0+0khOUiTX3rdr77D/5Yiuv0eKjQ3wHOaChK48aDFWPw?=
 =?us-ascii?Q?3PKUKKOwQ2jNCT8MeJ82x0COKGDA3X8q6nDQ4+Z1Y7XRLizAQatpVSAKtwsC?=
 =?us-ascii?Q?l9QwO7HcX4xb20iVsa4bGqaZSn4LTGH+RYJ7ZRPkXKWddTlUI7rTDeyV6I8j?=
 =?us-ascii?Q?Z5E2SbQOzcbV0tGiBYl32RCxs4kFDaaGPL9nIjemnpLZATUUwCxPalPgYHyI?=
 =?us-ascii?Q?dt3yAGcDcEK8IVqphFojhIXTsft9iHRRA7xfLzgSY1L3VhtPrbRfAhwcdWeA?=
 =?us-ascii?Q?oSPqWM8KHgY2//+UsAb/zS7o5FU8cHDUUUDURnZcPnGMzHVtSd+jT6N6mhcJ?=
 =?us-ascii?Q?GEhUm0WFjDoBsL9kM65NOGnhkLwtJX+U9UCHiPVPi2nc2Tk8NekyGvwtWfkH?=
 =?us-ascii?Q?CAIGWYLNmgf31eU3+MP9hCQnocNKUb/XZW6RqGL5hHJWZoC0HIg0L7xaUczZ?=
 =?us-ascii?Q?XIVPZrRFt7w6/Fk1MMwzctCo1vGOsQP9fHQjhCGrRODW5dGNKQDVBHRauPp3?=
 =?us-ascii?Q?M+SQVyXgKNMBwmHfkVjcfMTHmS/gASKY1bRpo+ET0kCn8N8JPkjw3jG8VA7J?=
 =?us-ascii?Q?bNj9k5rm6wVgeWozTVRTSh7OKJ4z/1whgBXN39apgga8Nw8tBC2Fbq9bvS7l?=
 =?us-ascii?Q?UP34apxr6uLYxYy6GrQki6Ff/eBPqHsIEl7D9iupOV1LhDH5XF5Jg0oNPXlA?=
 =?us-ascii?Q?i2+Wz5PtoNTQJhXLpx8rn6kjav/Zg5WcIocLTj5EjFBwFtypqVeJQRlfRt+n?=
 =?us-ascii?Q?Gp/m8DhecxajwI+GGoG989bitU6TVCAc2NUBLTGiqv7laUeT1gD5A24lVXqC?=
 =?us-ascii?Q?RyEF3ibLZJWkOdi1pmelhVDOvVOCu7fs52nuUOnYW01hgVhwbGZXm6p+Glxj?=
 =?us-ascii?Q?SwXy2JOe2K8gGw2N3mpQQdTr30A28Wp/uWyfYR5bUaU5Nm7g5yZDtrci/IDI?=
 =?us-ascii?Q?le/84X9f7AmACTSHE4tA0ZsCUnV2BqkoBee3fLArQg1LrKKfN4dmP9sbsf/d?=
 =?us-ascii?Q?GrHKv+w2IY60+PYwIZbfJHFwTaF/9U8cBTCAWE0b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd53c41-c50f-4f6d-5810-08ddad03178f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:24:55.0490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlKXiJIAq1+x/oCNJu7fP5hI20Q6vq1q3ipfQota2PoD0M6iWhdf8/hZNzU+ZQEu39AQHdcHJadKRZINvvbS2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271
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

Convert fsl,dcu.txt to yaml format.

Additional changes:
- remove label in example.
- change node to display-controller in example.
- use 32bit address in example.
- add interrupts property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
Change from v1 to v2
- add Reviewed-by: Stefan Agner <stefan@agner.ch> review tag
- add interrupt
---
 .../devicetree/bindings/display/fsl,dcu.txt   | 34 ---------
 .../bindings/display/fsl,ls1021a-dcu.yaml     | 71 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 72 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
 create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
deleted file mode 100644
index 63ec2a624aa94..0000000000000
--- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Device Tree bindings for Freescale DCU DRM Driver
-
-Required properties:
-- compatible:		Should be one of
-	* "fsl,ls1021a-dcu".
-	* "fsl,vf610-dcu".
-
-- reg:			Address and length of the register set for dcu.
-- clocks:		Handle to "dcu" and "pix" clock (in the order below)
-			This can be the same clock (e.g. LS1021a)
-			See ../clocks/clock-bindings.txt for details.
-- clock-names:		Should be "dcu" and "pix"
-			See ../clocks/clock-bindings.txt for details.
-- big-endian		Boolean property, LS1021A DCU registers are big-endian.
-- port			Video port for the panel output
-
-Optional properties:
-- fsl,tcon:		The phandle to the timing controller node.
-
-Examples:
-dcu: dcu@2ce0000 {
-	compatible = "fsl,ls1021a-dcu";
-	reg = <0x0 0x2ce0000 0x0 0x10000>;
-	clocks = <&platform_clk 0>, <&platform_clk 0>;
-	clock-names = "dcu", "pix";
-	big-endian;
-	fsl,tcon = <&tcon>;
-
-	port {
-		dcu_out: endpoint {
-			remote-endpoint = <&panel_out>;
-	     };
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
new file mode 100644
index 0000000000000..72d14babe993a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale DCU DRM Driver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1021a-dcu
+      - fsl,vf610-dcu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: dcu
+      - const: pix
+
+  big-endian: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: Video port for the panel output
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  fsl,tcon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the timing controller node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@2ce0000 {
+        compatible = "fsl,ls1021a-dcu";
+        reg = <0x2ce0000 0x10000>;
+        clocks = <&platform_clk 0>, <&platform_clk 0>;
+        clock-names = "dcu", "pix";
+        big-endian;
+        fsl,tcon = <&tcon>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&panel_out>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c2b570ed5f2f2..dcea56016c656 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8048,7 +8048,7 @@ M:	Alison Wang <alison.wang@nxp.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
+F:	Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
 F:	Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
 F:	drivers/gpu/drm/fsl-dcu/
 
-- 
2.34.1

