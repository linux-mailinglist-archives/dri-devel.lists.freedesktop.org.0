Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D200D86D937
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 02:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEFE10E849;
	Fri,  1 Mar 2024 01:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn
 [139.219.146.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C4F10E855
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 01:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt/X4djuyGUbP1ZWoMDfYQWz8TXHyAoa/03G9plBTqRNcSde2JfcWBtD1vzl19O8wq1KlZYnWMDuTQMHYZ9YoHOUBpBUgpljWU/GXe5Th/iG9fdGLHU4Sb+ljsEzrdNz7WVLucpeW0N9f0hdlnm1XYAFRTiYhyfxbc9AeyWyRt5cTR0NjNte7FgdIcu4y9QZ6z0UYt59lPtYQw6ka0PfEhWVdqHjFP3VzSeTjiD3YRp/cjD1+H2yllAMDawi0U+Ai9nzjU655vdC6WYtWeuv6FZ3g6pEy0qY2p/eQcdMD3zZmZ6HAAUHrOwnG09hutuW2wje8M0kyurHxN7iMUvM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CsItaiRtcDrr5m+mPBBE6xQE7X2FghlT3x++laDxxQ=;
 b=mfLXOSgKK48od7w1V66UvG4KDroeWTiBkgO5I05c0ShQeQrEwN5IwrcgXTu5aim3Ve5XhoUcKYPWwjdtDenjtPPp3oonoPQLlS8weXvqGJJXBvtWLVM2p9AyaL6sPGYgcFj+8u2rl/rAdnopISn3poLHUnbachRuK9Miww/W8pzKQeqafL29CDa3oMaul38MAKSUGb5LExJVHbfTcqxmgAgX6ISohIpxwN2jMCe3H5hvR9e8HNojwdIowCszDH33jEBCg7JM6xcwgvax7rIJUlj1U+JnoYJeyfay3CVB3L7E/6z2TSBM9VK9uUQJKs8ztPeO8p1alXbDqy0YMzN5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Fri, 1 Mar
 2024 01:52:43 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::db9a:cc7:56ae:de5a]) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::db9a:cc7:56ae:de5a%3]) with mapi id 15.20.7316.037; Fri, 1 Mar 2024
 01:52:43 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, aford173@gmail.com,
 agx@sigxcpu.org, rdunlap@infradead.org, u.kleine-koenig@pengutronix.de,
 sam@ravnborg.org, steven.price@arm.com, bbrezillon@kernel.org,
 changhuang.liang@starfivetech.com, keith.zhao@starfivetech.com,
 shengyang.chen@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: cdns: Add display bridge
 support for dsi on StarFive JH7110 SoC
Date: Fri,  1 Mar 2024 09:52:21 +0800
Message-Id: <20240301015222.93114-2-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
References: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::13) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1102:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb63d4e-82ea-4036-75c8-08dc399248cc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: na6sNGayxUZ2bOIuRThxFbkVl6BGOyZChfG0eFfbvP8P1jzbkU6HmD4iNAZZGnCVr1M9kZggN7QroUh9BOR6FhwVTL/3+fjyjOusmoWs6JwYg7kpx0Dgfcg9HC/asdHHpAXQZa2I3IGjfnpPnb+gbsL+r1GdRSnDmERi2hmONYgcA132hh+Jiq0Sdi9jCNbccbh03HrrB0vqdNyBp+SWsc/xfgw2c8H7VtrIkjoA0M5Mw2tuwVvvRg+PMA19hGgsiuT4DjqAUMYOsp4z4J513clTg+7FmvERkwO1QQ+GvS1bGQFPu5PTSkgXiAdWTU9Wltqwn5owClO/gBQjLybUukSXYUTQNCpYPAL8gd1WSFX7njYQd4hBbVkj4MfgFNeM2ikgl+J8TW/oVnZdxYYkc8zsjJB3fljwz8p5EtHE4lz13BJ7MdjS+bu8CzwriSj67xkkkH86kH78zNE7K8+FXhGYaZ6a4aqTChJI3SBpM7aJJALON4FvMVv8ZwahR0BQPgqfViUpu2BYFGhTb23ELq+Ysrv8SwRVhYpSsvvfXyULq64++RmhZ/aPybRc5eOWXd1eyyY4e6xXthTPIovin4/8z65KMsWa6HHCfMmmv4AvpT4JUDnC7w7VFuP71I25
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(41320700004)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QBsNW+krTaFGTyYjPK3sVTigaIrX9YdjL/uX7V3gLlq4YisPPwFHnf4BKztJ?=
 =?us-ascii?Q?QdzthWWjzhg6nuAHrk+tlNzoKe97BnuEK4gLTKxMXK6rRzjH/W65KL37vEHw?=
 =?us-ascii?Q?twDjkEVJefWGHQ4DyDRGEnGfpEmX9Dlo4D0XRw3S5e0MpuV0ktDv7whuOFg0?=
 =?us-ascii?Q?hk/Qrri7bjALEVKHN7ygSVN961MMVW9jnzpZI/Mf/k7/g19FxY1SGRyEdcnt?=
 =?us-ascii?Q?xH2WuUqZqTguTZYHVw3w6l9HX2TnmZSL3KJdsLGKW6+RnidTFE81lJz/5sFy?=
 =?us-ascii?Q?fXdFlTIOWVqXQzCNNWHGYNv2l+QRl5pmpp3xGUGvNHKKzHQMzPccmeJ4UoOV?=
 =?us-ascii?Q?LlOgwBFtdw5WAybAy5Q4hd6CrVPrNQeK2/2xVilUdIONQvdRaKFa0Rej+Lus?=
 =?us-ascii?Q?ro6OXjHAzcT15R3SSijPTPY/ISyplhzqLCzx2orozMoDYpv5v4El1xa6rsCz?=
 =?us-ascii?Q?Zr/At7IFutbED360vy2nGDIrHRQPDjnY1xPIAf5Ni5OGZz8xjboh5oN9vG+s?=
 =?us-ascii?Q?ZT/SPP2bznIrWsy677fSm7spdW8DHRTi5KYtTBjQ8+JKCT0rKB1ua5KIoSVa?=
 =?us-ascii?Q?3ZGLrECWq8GloF2xZWHNPWy8QicfOlfG7u4vnR9Y+ViuOA0pCgmaKflEH5Lm?=
 =?us-ascii?Q?UiCp3itOJlX7XK99xHJNZXVXGhu7DSt6uDA0Z6YbK5iSz/e+34SgAI0ltAhS?=
 =?us-ascii?Q?OZ9qIPj8PTL9IaERJgD7qnKCsNC9pbReY8KfQuesLMOTVzGGEeDfNGQxNyiW?=
 =?us-ascii?Q?OwOp0pnwGor3u2c4q7PfNWhgRRnhTdR9x9tjambMKmWXoWrJtA1ifYjrnRQQ?=
 =?us-ascii?Q?x2MBdiSW6lwqj+QtkxQ9sTI2zBuXHZ2tDBah3vVPk6Bc4Tmt+Aqur3oHIjBG?=
 =?us-ascii?Q?bhllPuXHFrMQI5Gm63TMwbTWMdptPKij/6RCQCT4tHv/BVk9tEUa0FeKi4yj?=
 =?us-ascii?Q?lwBe6ICKqNAUa2F/Kk1KMkMRV4/MP9y+jZuQR4H1bGU8HxkuiqkRNSdri9ax?=
 =?us-ascii?Q?yEsFVbkFLhLK0jgIfrxPVdo3GkushLeI/nX8BsR0AvdVnc8t4soEOVQHMzqg?=
 =?us-ascii?Q?W2HYXH01/OQiSGcLO6MAceicg9dL0IHIbhwGB7e9T+LuCuVc/uWw+UXa1Ifz?=
 =?us-ascii?Q?gIgWurVk6+kmjiOyrNAhRUzzYAUI+yh0Yokm3p8LA3R9Qdpy+kMkOkMN+cCe?=
 =?us-ascii?Q?NrruQLFV+CnMiq1XvjOMOHXiAUqsOwGjmIniLdv/ryHvpXEWbdxpLBY0SmzJ?=
 =?us-ascii?Q?zoUYolw7LFTUfibetwhC4vSPXt81KeZ8jA6wOkqYag0xNSjgsjVRIXy/fG7M?=
 =?us-ascii?Q?I5fXRrlydrPuqFK7BwA+2gdLbwRW2l8n15gRTE2JMqSSB3PuTBj9WsOAfGWy?=
 =?us-ascii?Q?cRURsejSdPYma6oy4s/JxvOqpphBhuRFICUxumukNJRH6MMjJIzMUTe+umiy?=
 =?us-ascii?Q?+AlkFtsGnGvZZxFD0bNKWCpCrTf83s01LVYEGHLKAT4Yz9X9jbVFPl2mPqqp?=
 =?us-ascii?Q?3Mvv46VkDwQ57u6YzdKowzOJiSx2qAZz5v8zrM05Ybwsjk9JM/OJ2TqSh+p2?=
 =?us-ascii?Q?EIqfUxEB2Wsw84qnCiPQDyeOcz84ll2abWSvFYM+0gf3ZzYnovJ2Ojzd2Uyn?=
 =?us-ascii?Q?KlYMJwDaSHkDNSZGfXPw0KM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb63d4e-82ea-4036-75c8-08dc399248cc
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 01:52:43.0719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWJy/IrJLn7176XrOgvnuBCPVjOuSnC3SJnke+V/tn/dRDpjM66PpknflMfFYjUISRFhgdFMa+UybUq87uaO/xDAMPgBKR15rxhi1A+dvug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1102
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

From: Keith Zhao <keith.zhao@starfivetech.com>

Add compatible to support dsi bridge on StarFive JH7110 SoC

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/bridge/cdns,dsi.yaml     | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
index 23060324d16e..4ad0ecaacaae 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - cdns,dsi
+      - starfive,jh7110-dsi
       - ti,j721e-dsi
 
   reg:
@@ -27,14 +28,20 @@ properties:
           Register block for wrapper settings registers in case of TI J7 SoCs.
 
   clocks:
+    minItems: 2
     items:
       - description: PSM clock, used by the IP
       - description: sys clock, used by the IP
+      - description: dpi clock, used by the IP
+      - description: txesc clock, used by the IP
 
   clock-names:
+    minItems: 2
     items:
       - const: dsi_p_clk
       - const: dsi_sys_clk
+      - const: dpi
+      - const: txesc
 
   phys:
     maxItems: 1
@@ -46,10 +53,22 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: apb reset, associated to dsi_p_clk
+      - description: sys reset, associated to sys clock
+      - description: dpi reset, associated to dpi clock
+      - description: txesc reset, associated to txesc clock
+      - description: txbytehs reset, associated to txbytehs clock
 
   reset-names:
-    const: dsi_p_rst
+    minItems: 1
+    items:
+      - const: dsi_p_rst
+      - const: sys
+      - const: dpi
+      - const: txesc
+      - const: txbytehs
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -90,6 +109,39 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-dsi
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          minItems: 4
+          maxItems: 4
+        resets:
+          minItems: 5
+          maxItems: 5
+        reset-names:
+          minItems: 5
+          maxItems: 5
+      required:
+        - resets
+        - reset-names
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.17.1

