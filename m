Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560AA1C8330
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A126E952;
	Thu,  7 May 2020 07:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2108.outbound.protection.outlook.com [40.107.237.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117C6E287
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:04:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6xGXJKuO6tWizAfnDx6nGPfB87+TXtqbAdSk206pHMiUaq46wiToET9hW9wB5XRGhOCm57sdWrE6tkkupp0rYYM3yYvOqhG/Yj8Nm4d9bAjxs6YRReVxcvQLpSVZCLm5utAyCYPb37AoVTQITwvpp3HkNBLPs57Xvko4fom8M/zIB4vdH5L35ZGHJYoSDb7a503rZb0mwKvepI+M4VW2d3UDeHYOe+wZ/xS6xTyqQ/+6QfJ2/xhAm8IxFksopCLtweU39NlXa/xnHSBu/M3H22vqCEgO9rteys8WqtL/z3gp2ihp4FXp0JLo8A5yJbDDZ6j4oBfQeUB/p0E5Wjgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGMZbczxRpmr3QTkwGKR6R14Wm7TKdHr/7k6sHlzySk=;
 b=No0vXlP8z9ms7aZvg/viza/AI9WYDTcuuQmVW1XG3vw+pp2QE3RmDzeYw1hUSdbSOpzu6XV8UNxGFvijWt6CqlfvWOC31e0rPFTEQILS8xWpMxFqs6kDyaaK0etoXq4rJ+6qZlGuIqJk7XTGLNPSPPRECXzjGBstQo8+Lx/DwOjQqQEj2udP+O52iR1j5Ehe8jWR0CgaBKzW7Q/yJPYUCG4CymlSOIQfYa5qdul3vklGOitvx6wjhnpP9KHeHnCT3EYFAufxvclS9+ffWteUl4ZIailzYEIasv+JkcybO21eWNeBpvrRrzpFUJN9/jhzil9pFpP5Ou4oRdNM03UHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGMZbczxRpmr3QTkwGKR6R14Wm7TKdHr/7k6sHlzySk=;
 b=1CFght9U45GCQNA/EztzVIsUJUNJteMs5XN+EjxIv/v+HVVer6Wz2TQeBscUypR7+ralvzzVv6tFYoxQYVOKNLpgeVC4xgf6Ml8VL5dilHFffQPY+Ta+XpiDsvfDPOzKv/I70EhO+3SGtfiX2gJZmQFaG8rkK2xGvNj9RDLw64A=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6755.namprd04.prod.outlook.com (2603:10b6:a03:22d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 6 May
 2020 07:04:26 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 07:04:26 +0000
Date: Wed, 6 May 2020 15:04:20 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <b720f7d2c5338813d31b7f715f59ca68c367d5a8.1588747998.git.xji@analogixsemi.com>
References: <cover.1588747998.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1588747998.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR02CA0201.apcprd02.prod.outlook.com (2603:1096:201:20::13) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2979.26 via Frontend Transport; Wed, 6 May 2020 07:04:25 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ef78c33-8af3-429a-1a34-08d7f18bb6a4
X-MS-TrafficTypeDiagnostic: BY5PR04MB6755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6755430579225B2EA07216A2C7A40@BY5PR04MB6755.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6jcKE6hL0dEp9H4Ljhvz6hHUsZvGogHpiEx6HdpJ1LGgh1v4vi6NvF/yvdf+qzN96b524zyQkEftv+wXRCpyLU7AWJ8lbrXfOKilXemeih+TcwsEmU865UH4/xuVPhaNcrb9ozHM1TVhPvOf+5LDb5+qvmrVh8QEbZd1SsLFfJAO2fsOdHdQwK8zkVPrU7P8/MHqOiFberkMRXowQD7jD5VxbXfTzUM6IG9eDXqldMAz/0pHqqV5VlCPf2GzuWe2NGlqcdGRciLAYwuczqmDtRvtnsNXWKikpoN+k0NIs6xpzz/f1CS3kAghMLp3MvDW79aWhwqk/41uwLOOpHeHHruajOyyOtV1M+0kM5kKn2OVuyyqN4Vk8A+1Zcw4BLTTzmWfo8e3viocsl9qeY2f+f+OiVm5iacpcDxQzrlcVzHxZzl1DEe2OyOsDUEsMcp9yEoc/gzIuzOPZpk3WOdxgRY16rk6YKWENoiowAge1Li/XKYPc1n1xjcKJm7Ocyt2PynhuMFyOr742yct3syPspbtDFaAvhkkBNGBesMNJTvct/VjSiOM6d412FNgz8WDe3sR98sQHfv9mQ5bpKnwB1TCA8r42z4DYKjzxUHw+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(39840400004)(136003)(376002)(366004)(33430700001)(7416002)(186003)(5660300002)(36756003)(478600001)(16526019)(8676002)(33440700001)(66946007)(66476007)(316002)(66556008)(4326008)(54906003)(110136005)(52116002)(956004)(2616005)(86362001)(6666004)(8936002)(6486002)(6496006)(107886003)(26005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: tDQ+fRwZi2+K/3WuSV9RVaMXqYIe7M24mIbwMLvbWIj1fqP1UE3kWwc8otXbZv1JTZsDv4MUNF3urnVkFncheqNdt3lghE04VwTvoW+Y8Cij2bvfJvKsgioe8B46tc+2PYFH4TpG33a6Hr3IoK3TKCZTt/hF94WZKz36v0G4tIpLWkJQHYFldhWfp/6DYKi/Y1mIYH1Dv38u9xeyOO94UUyeVDRMROzA3Hezb2RNjxo+FPx4kNx4yKq+Lv9nFOiuvrupJ1YtUZcXPG9BE9KLdLe4vswoxw7Jh5w4h2jZ1cvPuH87ZkkI/y4jDV+yM25ziNC7269jFjMcroO3JJajy1vwzLBU8jHN5frdLKUzzX8TL5dPYBfkmpRGxTzVI0UML83BJt1Wdxn9X1AFD/IkFi9J9Ux+etc8mjjjlG+Os9PdwmMCjbNo9Qv3TBsvVlykfLz6c3678PbcsPIiHHy353rXXsnsj7F0fKiZuYLh9XASjHyRnc0SsrnHsUEzhWCkjsAyE2+SXjt3Z5H0kvshHSzFkxOvNK8Vxy62hhYJKfbdUj4szYnFDkX7vQ0YD20LFfkqcF0POdPDZOs55qhws9e6+mf73yl1AB5e8IPErfkhrMycyLgFJQvZFH7pT1e3094Jn/f+HVGfcVWvvM0C5/3D/UGpFwaBfGdOsHdcpTgTegwu6wnOMZXMUuJaLkIYsyJU5mufCi3hM0MiH3jwozTWA5+IssfpgzO7u+xohaO0Hxj9vi3Lbmhwumf/huTMm5raqksvwBMiNLqJrgAvgSLmYNBOv7AXIdGWd2M6H7pAioKQLFEq2WtE/PqJRP6c
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef78c33-8af3-429a-1a34-08d7f18bb6a4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 07:04:26.6257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tpBcdxI7oXerdCvZXaFIoMvLu3Ox/Ee78U1+dmdQ/xcA0cq7NzukzIrtSBAwwuREEUtAHCPqAJKIsPfoXAC6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6755
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
for portable device. It converts MIPI to DisplayPort 1.3 4K.

You can add support to your board with binding.

Example:
	anx7625_bridge: encoder@58 {
		compatible = "analogix,anx7625";
		reg = <0x58>;
		status = "okay";
		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			mipi2dp_bridge_in: port@0 {
				reg = <0>;
				anx7625_in: endpoint {
					remote-endpoint = <&mipi_dsi>;
				};
			};

			mipi2dp_bridge_out: port@1 {
				reg = <1>;
				anx7625_out: endpoint {
					remote-endpoint = <&panel_in>;
				};
			};
		};
	};

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
new file mode 100644
index 0000000..6e54176
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Analogix Semiconductor, Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
+
+maintainers:
+  - Xin Ji <xji@analogixsemi.com>
+
+description: |
+  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
+  designed for portable devices.
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: analogix,anx7625
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: used for interrupt pin B8.
+    maxItems: 1
+
+  enable-gpios:
+    description: used for power on chip control, POWER_EN pin D2.
+    maxItems: 1
+
+  reset-gpios:
+    description: used for reset chip control, RESET_N pin B7.
+    maxItems: 1
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description:
+          Video port for MIPI DSI input.
+
+      port@1:
+        type: object
+        description:
+          Video port for panel or connector.
+
+    required:
+        - port@0
+        - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        anx7625_bridge: encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                mipi2dp_bridge_in: port@0 {
+                    reg = <0>;
+                    anx7625_in: endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                    };
+                };
+
+                mipi2dp_bridge_out: port@1 {
+                    reg = <1>;
+                    anx7625_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
