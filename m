Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BA9D994A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE85710E8BA;
	Tue, 26 Nov 2024 14:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lqqmic42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013059.outbound.protection.outlook.com
 [40.107.162.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D150010E8BA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 14:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNQpaxOYBgfgSAodGVFyzO2/0B7vQx6YwIIiDypV3LDKJA07cV4oNmEXBxvn2NV6rSG6SKXVih6xX48lpxS1SHuLARgE9eTuXXMZJgLyfYDyAVFiJmPY7k/lajqjJPK26kYS/xulrP9Iz09Uee1gFZ2ayu6EGSeJS7WglRzTTbRkHh9pcm+epRK8onGDS+n0kJbYP+AfyiR38er7CJVSNSTIiB+UouV7AZKPTKXLLRCiiGYOnKptXuH054XUlWe+PnNKW7hbEHBtmbv0If+jt6idDwh1cSTZm4J8wIUX4eIOBH5+ZBIE1xuOU57tkh2Fso6vxsBYKN6HSOhk6Bv5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqGH6nNgXCMqb8J/PU91yPFrtivDzgiF1IhpCMJlknY=;
 b=bom3I3CfwvCktaH9AtZ0Scappu8vqKnGCMUfZn3OiZLQhrafBcJsHkne70NaGDBw1RSSzLWiTW+iqGvtIkWCMIisLBm36SiQNpJm64ZQnLSVjZqQIGWdaNOrinzqUgY+2wuvudlUJ8WfgqfX785PcmnIygrvLiE/U09TFr8q9uFUFkjyfuYQBLmeBrg6cDkXP4FL2lss2faYhIPgLWeXJFsRIDMW4fEfBPwhaJrBfJsW70UcT2Xa0UpW5qOVyyRtSEMg6lZosMsJN9/JzHvlGc8x9HL0asS07Q3OdUVWRc9JMNwPig0Jp6ljwFwff6/tN2a4UHtVsVZL7yCW5Ykrnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqGH6nNgXCMqb8J/PU91yPFrtivDzgiF1IhpCMJlknY=;
 b=lqqmic42ACHyOPvW/KmCxOTk8Kqjr8j3tT1LNI5bSnYKMSMwUoLPT4cnQRPqeBS0OJeP+zEDf8CP7vosi+aI6BTLtAWyQZnFU0TfwDl1zufr4aungYmZronGj8pREuujo2nbbSUGYAQqN17vO7m8bUZuJJPCzfdMEvBljS4Zht0dspvPvilV9LgQcbjl1OTQ5J4dpuiVMBBhyAHvCIRIJZ0qDr+IW47IfsaJOQrb9nhkXTsE0IKdwcJznC/1o2RdV8GZb7mRwY6g2PTBYrquZUu1nYklpJFlZRy+h8OQNdI6kr68qYKNqqEIXnZr+W2g3X9Ip7+2GkySf/XfFr58yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8894.eurprd04.prod.outlook.com (2603:10a6:102:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 14:13:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:13:26 +0000
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
Subject: [PATCH v19 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue, 26 Nov 2024 22:11:48 +0800
Message-Id: <e495a40a0add052d4f8cdeb4a81ea7408cdccaf6.1732627815.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732627815.git.Sandor.yu@nxp.com>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0cab07-a14b-48f2-60f4-08dd0e247e90
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UqiB9KkPwd0A81bp8rBzh2EFjqDQ0IInNnE1ApBQ4Z4oHfLGHbj5eRMotdlV?=
 =?us-ascii?Q?f9B1JjSc2sdEnCPvUQdozXk4C5CV6Un8xf7CglqTAU9vFOZBTIx8DNuaNZVI?=
 =?us-ascii?Q?kAMdPAtPTMIQU2+vmJsZfwYm+LKOWU+1nw823yhrGAKZaC2vWxN3LiaR1BTg?=
 =?us-ascii?Q?If1LNiX3ilZ3uItdwNlYbRP8re+ObjRv5m18IA1qMgumD8P8iTvhmIEXEpgB?=
 =?us-ascii?Q?oHZrCil9oN7NdMnNCaj/5zbTqqEh+nbBGljJr8BdZCB+KoH78rn8zedoAAMs?=
 =?us-ascii?Q?oUsnP0vIqbXZbPquhlb2d3hI4cAojbPwIQAPJbErUJokZbUZtAZl8iW4s2XU?=
 =?us-ascii?Q?37nB81RBb9ck0XMlfhRfn25CRedxcv2PquzqxdMIpxpxZZpjZUC+Gle+luuw?=
 =?us-ascii?Q?vfXa2IuWWBuEewIvNmWNqV8+aJs4nRPwXupUQcPFs0PdnFJMO+jxaj4x/eJa?=
 =?us-ascii?Q?ouqBRabrVOT3xmsf/fAZBaNv/hijjkiLeUJkjw3TyJRTQ+wilGSO0tQlwfTq?=
 =?us-ascii?Q?6CxhJBWaaQu1cvt2N+mq4KUdLBNJIkXZYCYU6GTMeqVzzQgq/GpB0bUGKwnM?=
 =?us-ascii?Q?nP5KqvF5Zm+LcjCXA2rYi1qTEVooVaowid4ZHqGJUuwJQUpoECYsJjUpu1pj?=
 =?us-ascii?Q?QbLvtJMsV1ymmHDjkzJ1FjXMwwRA+i9x/Of4ZRZNyC2ACbdt3RXsf//UFC4/?=
 =?us-ascii?Q?gBfJxV+9BvtzT4NNBd60j5/Vr5HdeQtA3AqK2nCGWZnE6nIUuYNxdS+B+vpw?=
 =?us-ascii?Q?74+KsJHJAS2v+9EHsoYJjU3ydXQUkBblV2xeBK1CJTpPDTNYoRNudrQFhpOM?=
 =?us-ascii?Q?RxtRO7npohgyifC3X2uNWMI1vZ6+55iCx0ruZU0B/x09oYO0bqaF5K8uLSE0?=
 =?us-ascii?Q?i0A+7N//caKOz9tM6H3ksOQmlCzUt2Jc86dpfeVb7ZuSRdObHk6P7Yaa5mW/?=
 =?us-ascii?Q?8sTIvJGc8iKpc2VbTElnTxgOrdeXdt4glcrxEUlzs3/ae12PeUOOi0bERIPX?=
 =?us-ascii?Q?QsW6FnPuhPKEAjFj2IgHoa1BtAyL5BaAeocdYtcR8nE23bJG9GixY72r7cGH?=
 =?us-ascii?Q?PtUc5O9JclxnuL3MKvhk4Qx9z19rxb2+tbnqP09pEkr/RGAdLj/isYmQmGI6?=
 =?us-ascii?Q?et+vfcM0GpCVwTdQu3ZaGtebzXwjlr/I7YHLdZn9JVD8uM4Dl7ZbEvzljjG5?=
 =?us-ascii?Q?popAHLP2MHuhhdsliG6mmWzYtKf97Y9JxKJcj953fEfgHL4cdROTXYtzhL+f?=
 =?us-ascii?Q?AiL+GLo5b/GdryOvicwQXK6tMoPdosYeN9jN0WyEXtyVq5qagvjonNV24rwL?=
 =?us-ascii?Q?AHKJX5fDy/SAeXMCD8D3W3gxresgMZYhEZQrrSAOM8tOcREEVnaKz2GnT9uL?=
 =?us-ascii?Q?4YlZtiZHctUH7vB0EnHS8gsptVPY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xfPjLZ0AQlK329AyuHo+qZSXa/60SZD0SPJ00C13lHhN7BO/MMGtNWKZNIjs?=
 =?us-ascii?Q?N7/U0wchE/r7Rn0IJM/kUGySFyFUhBg/hE419dDrhSuyhc21EJFSbZR9uzKP?=
 =?us-ascii?Q?/edl59wMl4n9GmTNtpC9eNCiFDw2Vi6JHCjrCJ0SNRmvZq7PDvDl/b6w1yoh?=
 =?us-ascii?Q?rVCeHCAc5evaQIsjaTBcaSolVRiwg7Sd0K1H2zj6h6P3YYNwoXRzBGm0Pn0k?=
 =?us-ascii?Q?dGxWb4TqrAgXC6agIPorGTkdINUDzaBhQKKABwg2K1AWwqiy2isfwSMS+SXn?=
 =?us-ascii?Q?dQaMhZ4cuG/Wqnct/mmzNgNwSruhr1rfVhVbPLiOIA/FmluOe9TAki5nwm/V?=
 =?us-ascii?Q?kRoOx1vyIDXWZBYPXQwPJMRMPxlNdmr8JjA8CUnrxyggKYX3aMAvvWcScQKO?=
 =?us-ascii?Q?J6reVy9mScdVGQ9iZWr9tfNlqEypzRzpc64zgeXU1Zzg4SGNBfVvemr3YJya?=
 =?us-ascii?Q?l2VwW9XuUqFV0CLDVqRy8Wpf5KDpG+6JpnudWXuWHu+g1WHGnXnO3lg5hbPv?=
 =?us-ascii?Q?J1CAxfdJnJ/AQmB1nY/fjy6bXINBT2t0STkTvz4Jjo42MB8jBbZEVUuBzotz?=
 =?us-ascii?Q?HtEri9/jI0fHUeXvgnwWM/w7rQLGqrRR4UX1CEsVSMTtVatavxj2Qcd/KsFs?=
 =?us-ascii?Q?SVaqL/UFu6xy6johR4cTs6p0qoQlXRYV0Lm2rPdqZmIxDq3Azt5pMJPYGA/0?=
 =?us-ascii?Q?A6B70BiQzrRg+lq2eVlzGpUMDW0QhFF8DnFXaZaJBNiIyWE1gb48uNfrecJW?=
 =?us-ascii?Q?Ue2HgOU7bZsua354g62W7SuHUutKl6JArFNwlo25j7qlBHoyPzOsbHi9laYb?=
 =?us-ascii?Q?PZmANVYq0ueAoH9fsJNx673C+uAyHZ8R985cFE/UjTFo+GiYxXQCizznHXWZ?=
 =?us-ascii?Q?orIzHr0Blo53e7nDnSQRmc35J3uuNndmYnrvRuObfFxZ4NXbRgqxGtT/ndH1?=
 =?us-ascii?Q?+etzC8yyFenyhJsuwrvPBC19uM8Tb4kdz0XLpfY8l1NlRkOs1P1Ce7zbKPU7?=
 =?us-ascii?Q?GMRlPHFzTIReRWiMZfoUFNNWKfiwXvc4NFhsWDFldjn8YVgGpAIZQDqZaKcb?=
 =?us-ascii?Q?qTLjjZ9g0+CvHHrVtdyG+luTdTixvFDDjxNFmE7O4D9HTK1MnympmrprYY54?=
 =?us-ascii?Q?ZTR/tebfbuQ3zYbdz+FF0MJyRMh9XsbtJtQYksn7Irf2VOxQcpVkt3Uxofyp?=
 =?us-ascii?Q?VxD9efbZI7g06jpjipQmNkUwrlcvlZl3uJGbEfzlSzV7LdeFK7+tX7JKpw3Z?=
 =?us-ascii?Q?tLPgodyhfTDuS1c/c+ckLv+tZG5YcED6LhHLMgPecntgK9yVXA6y9TFyIhzx?=
 =?us-ascii?Q?DtMftg2G79VTr1OTcgHPFs7Z6Ih/NEexnmhTu7IIa5QTxJs5PnrerGefTFmg?=
 =?us-ascii?Q?1sJvM/ZR7czA1iaMG+1Lay3zNebbokEda3YAjBs0TCiBp9HsTMTtq6gfpmHf?=
 =?us-ascii?Q?voJLCPBJFy/3h4lHm1KXkvm77VtB27T1as8gEpe+UECO65M2Sg/K9JxvFHy2?=
 =?us-ascii?Q?vZCZR9N9kpRblbn+sk2mR4r0HklVp9iI98ik2BUTXWRG6ToAImAkz0rkfJ4n?=
 =?us-ascii?Q?gcASnJY9s2+ufHTQFORdipVEfhhuS5Kr/Jt0Gvmd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0cab07-a14b-48f2-60f4-08dd0e247e90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 14:13:26.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NOVuUokBhvvnxFwn0lCKYuUWy0V/Tba7SyA41aKvS0xqieGGLQbf3I5zJ5VgRUuWBXTirtzF68zoMEINq68/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8894
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
v18->v19:
- move data-lanes property to endpoint of port@1

v17->v18:
- remove lane-mapping and replace it with data-lanes
- remove r-b tag as property changed.

v16->v17:
- Add lane-mapping property

v9->v16:
 *No change

 .../display/bridge/cdns,mhdp8501.yaml         | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..24abd8447a28c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,120 @@
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
+                minItems: 4
+                maxItems: 4
+                description: Lane reordering for HDMI or DisplayPort interface.
+            required:
+              - data-lanes
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
+                    data-lanes = <2 1 0 3>;
+                };
+            };
+        };
+    };
-- 
2.34.1

