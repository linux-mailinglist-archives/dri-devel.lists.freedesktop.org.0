Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C7351D76A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7523A10FF0C;
	Fri,  6 May 2022 12:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2108.outbound.protection.outlook.com [40.92.22.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06A10FE76
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxlHSXoZruxxqJzTBEZRDJQ84Ryx3scnD0zhwhCN3kNXqP89EepLErsH+T5ucm+MPq9C+tIm3TWZaiUpkEon133g8SExC6OotLkwC5eflnFQNbOsRgFPbvMUZD2injrK2jnygArSEHWD08o+taAbImW7uaN6CT7LeJcbc+bjjZbUXlymZMb+3Vr0bbYMF6wPZdqyEI+K10s5+ICXBoNti609tFMKF1nNNVbdZNqbPpeBCECuHcIcCN1jrjciElrqB28sw98D3xP4tG/Kcj2/rdjL6EzndXlGxrQc0zkNRiNRJZkdCh1ayia1LeN9P2YKu6WNzjcoZSrYr8TbjTOdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15avOJcOetakCvrjRyD7rMWMnV03cHZoMUCNsxIeW9g=;
 b=k3GfvkFZ/ey3ws6LrDv0RHu5HoeIksmvbyoZYcAGBMzNlhDV6NS0vqNZDFq8FbCAJBSViESsZTcAa70LAZjZcH23p4+pAvvjOwdHsMrNxgI3g8dhYYxZZOqAz7SeDuVWfYIf6udbILI5M/i+Bp+JjgdqxxMa+4fdQ0hx4DGJsJP6dUEYFYjYjZiidKb+tqN92fH4ijfNfnHsiEtkUW3KLgf1xxWjCy8OemasW3tsh3Z/wSprB43dmy3OgwjZOq+vqzQwi06xUmdQ+2Q38LFwwm60J9TouclRbNGXNfSN0n0WCKo+do1qlOj2R/1oqcyNAdyTWYXNiXAlxtrjs79LGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BL0PR02MB6497.namprd02.prod.outlook.com (2603:10b6:208:1c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 12:18:08 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%7]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 12:18:08 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Date: Fri,  6 May 2022 17:47:34 +0530
Message-ID: <BY5PR02MB70099A894450D05DC7359CEAD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651835715.git.jo@jsfamily.in>
References: <cover.1651835715.git.jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ovgzSIaqjkXpJcrRK1k4T5Pd8f4aSJTo7GDGie92085MumSwg0qxwhJuYsDLHfzu]
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <cc813bbff75c6620245392fca689315ccc559ec1.1651835715.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a4df323-6135-4930-67ae-08da2f5a7b00
X-MS-TrafficTypeDiagnostic: BL0PR02MB6497:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSu8MxffbMEgLAZiQyEaPFCWPHRKeihVppvQK0N3GLxJBkR8KiF1KS0VTVO+Qa33ww42VXot/o1M6dxTg2xTLu62sEHe7Ckf52IVi0Xq9v3ixUH1bS3kRO6ewmMrP/04hR+40IOAdfaC2G3alZpJYXlEvMgtJZri5s0it2a3mj6gD3bL5zrm9oqBmReEVeenlJdiytu8l13Rs77LEu7Qxaq9usxunq0359J4DRfzCYxwb0hy7scnhs3s2bywaUW21F5os/uv8bxem9wah+gj7A7j/6s2R8Y1vkc2jlxlMEaR4X77rQ7zePsBtINr3C5Kct1wcfRtG36BxBaSj/hJDBE8WvJADuRBqPO2zgQ1RK4lnhjnxk9UH9KrNS+oxUj9iV7+WmfFv23GyEA10McW/L+v807f/+aNhN/BhzDAuG+PBWsCG6DCxgjbLviKQh8ts3GD8nkLbhfwcfm+xqzkxDfZdfufWrQWNQifVeD3c2r5HSKOgf/o44+Ci8hB/Xd7CW+PK2Vp/cdQiDqTPNjsViFoIZY8piysRt9kvd7AVvc19TQzH00CkebnNOENU1X+1V401LDIgay+yxg+4q/FctVvcrWE1lpRX3QZOPs4KfeLNR/nF9+8YJZjuUhoLgfQH78Juo7gi8yd2Qq/LtVkpak4SNLX9n7SH+yfBzL5lPw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETNr5LiFVLHxhnYXtWOVABE/wJts0K17GEqJiZXLEvUqbw2Tdt8Kbnf4/LiP?=
 =?us-ascii?Q?xmygGRz6+7AHkMPiQ4TYNyTy1Gg2xWjL61ijASu+08Ubnfcv/0pRB2g97HTP?=
 =?us-ascii?Q?Qg1pfm0es29fhFxt6N4BjbIZsPzUEhlwzr/ZzqXiJhioj1tr4zr7OWzFWmCF?=
 =?us-ascii?Q?1OpNi5AuYfK7u2PY1g61v+2P2OZNh+7UKjLA9G0x51boYN7Se2yyure0yt7+?=
 =?us-ascii?Q?gmQS7VGdjtyjaJLfB8WF5Oe1S5cE4e38DgNguOp4gDHZuhNpm6hJ6k0zDgel?=
 =?us-ascii?Q?cLe7p7HELOFxQ/cFstfLL5hsZuNeaQbv21bXhxTtDQ23u86WPWU1vG4DFnI7?=
 =?us-ascii?Q?BANiFsdnvBm8Avf3axNnPPXzopi99y1+39eOV3TUFFQPYpbtfodBc8prOIpT?=
 =?us-ascii?Q?tkyYGe6i/Zsbg0ncdb3mda1mYvMhk+mVqF15n76eBC/TVVAD7RpB+HM8oK5m?=
 =?us-ascii?Q?SHu9jFtJM+TpOoxmWrSuzXdRhVX4hGnO2wphKM5ehVXhmMuTNX6uEVKt/eFI?=
 =?us-ascii?Q?XyNCt4FJoPXyI6KzWbfXmivkzJEtnbElc9Cz/HTQvKRXKCQqm7aFGlTQ58DL?=
 =?us-ascii?Q?a47+LR68NsMJcJm0oPpGt3854m3GOjl1oR+60Zeer0yUGIfKndBEA5yJU/FW?=
 =?us-ascii?Q?DfzO6RuN1duUZQxgKz4hdQ9ssAI3VMpX6WQNigikK326W1wVkQAaxNNavV98?=
 =?us-ascii?Q?Mkf3RDml4Hbfk2BydbSc8KJ8uFXZ2S9141ai6WsOyAM85fBM9PQYEZSG/O3D?=
 =?us-ascii?Q?pmubosFNMtBJTfK2/tLkAJzMhDfqBzDUo75vaLHeC5bAFzxQ8/Md1v+CaDms?=
 =?us-ascii?Q?7dK95w9Xo+eKM8rD3XLHVX35hV1UR1kK5Rb86KjkmCmuocmZfI2Jprh3tnoe?=
 =?us-ascii?Q?pM4ao1Eyt1jB2b9gaDVPG3z4RwzQD1gkEiFT8mFCUPIs7RwIlMTr40ZzLnXy?=
 =?us-ascii?Q?4el+AovB2H1/CC/WJ+vukRTlO82dT2Y9E1H5CP9M2f4lWZUm+3n5k0XyP8i5?=
 =?us-ascii?Q?Z3oRy8zq640uqEzQyNzH/YsIV5M3nKFQKIi2lQo9DLylbIJgoJuSR4qQJ7Bs?=
 =?us-ascii?Q?0yBwYjXyW/TWGhMDlJqDNXSLD0TyiGeuJOSJPmaiZeGTezqD3/npKzbU/pRu?=
 =?us-ascii?Q?ROe3b8NVnviSbKBUo8kCJDazZrn4yv2gH0Je9x4ejrum4G2lypTLOADq4afk?=
 =?us-ascii?Q?GyEO0icUJCZCtvsCUSRYVuFcj9pkQTnMb1VdO9PeM9BfNXyMGIToi4JUoaxl?=
 =?us-ascii?Q?UaLrPHuF+Xi175r6L5N208aDlbr08Eun0/j1sptGUO4sFtyu9giBSkj1vz+Z?=
 =?us-ascii?Q?Aco0Q5U01gacyZX4SgTmUECUVYChOKdZodPU7ERYhzHb8t7eLq6NGT0sx2Py?=
 =?us-ascii?Q?sMxXo7qdELWIl3xXpu4okYP9tm5UsnaTq7Ac/yyMtbfEHHgoktSUeWGvOaXU?=
 =?us-ascii?Q?joTfH9zSrYvXvLivtkm+FP7ZfLsbGCq4OPflMejmO3vzC3mZHxyHrQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4df323-6135-4930-67ae-08da2f5a7b00
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:18:08.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6497
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the EBBG FT8719 6.18" 2246x1080 DSI video mode panel,
which can be found on some Xiaomi Poco F1 phones. The backlight is
managed through the QCOM WLED driver.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 .../bindings/display/panel/ebbg,ft8719.yaml   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
new file mode 100644
index 000000000000..fac6c9692c55
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ebbg,ft8719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EBBG FT8719 MIPI-DSI LCD panel
+
+maintainers:
+  - Joel Selvaraj <jo@jsfamily.in>
+
+description: |
+  The FT8719 panel from EBBG is a FHD+ LCD display panel with a resolution
+  of 1080x2246. It is a video mode DSI panel. The backlight is managed
+  through the QCOM WLED driver.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ebbg,ft8719
+
+  reg:
+    description: DSI virtual channel of the peripheral
+
+  reset-gpios:
+    description: phandle of gpio for reset line
+
+  vddio-supply:
+    description: phandle of the Power IC supply regulator
+
+  vddpos-supply:
+    description: phandle of the positive boost supply regulator
+
+  vddneg-supply:
+    description: phandle of the negative boost supply regulator
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+    dsi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "ebbg,ft8719";
+        reg = <0>;
+
+        vddio-supply = <&vreg_l14a_1p88>;
+        vddpos-supply = <&lab>;
+        vddneg-supply = <&ibb>;
+
+        reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+        backlight = <&pmi8998_wled>;
+
+        port {
+          ebbg_ft8719_in_0: endpoint {
+            remote-endpoint = <&dsi0_out>;
+          };
+        };
+      };
+    };
-- 
2.35.1

