Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC871522BA9
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 07:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B977010E779;
	Wed, 11 May 2022 05:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2078.outbound.protection.outlook.com [40.92.42.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C73110E779
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:28:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NazBlH9giRl6HWjXWRggmB0CJxeRtFzRbZCuYnOVVfMyaDkzoYpmvYOydJ2ic1bJ2sd0F2KBpXz61HUeE0u0V+XTr+OVxh5Dzg68wMnOn2FSk3vqFGOz+Io00ti10oeprhRsYZ6m1YNd58IbYL6+5+mNGQzury6DQA8JQJzS3FQamg13ZNrgl3xqQMdOof/dzcxPi2YKQjvwA3xDydlcAbOxVvhjoly3ZDb6uO/CSIl5GDglv88A5Wf9p2jSMyDkjLKntPmFM/ByfvD9MBAxn+3DfXaEjk57r4Q7gXuWO3dwiOK/K5ILGOYJdnjDM66VLEdNEHJBCphqFuXYbdOMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INaYrpKyRYNR/qG0Ua7keCeOwyXv3rdsOIeLw7WZnlc=;
 b=TytNyaxL57kk/24Woi2yZhUbPRSZldQWJvwA2M/czUBPXbV1bWd+dyBEmDE/yFuHPd2fygZRnsIMnGDHv27aOe4pYwdtzxCMEKJCUdH5wf5lYtkdYZPybhfXH4i/7ppfh+Bqnv60W7Qp8UxfjtydmkP3IX42lWwVo7D6n8Sa3l2cyc0ZpvuywbwW4cfrlXoxxqKya+KpYRf1PvhRrhPhCJaALMpQ6JxSAkO+XaheAF5GnLM3Qeo77/L/+qrj9m3IFwtb8NrHq7Bab7gxqKAkpapycnyKcKhZnytyigG3Dpzk7hpEoysUriAWHCPOKCUrWn7VU7gEMoMdbZXJxC48Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BN7PR02MB5313.namprd02.prod.outlook.com (2603:10b6:408:32::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 05:28:47 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 05:28:47 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v2 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Date: Wed, 11 May 2022 10:58:10 +0530
Message-ID: <BY5PR02MB7009F6D4CC6CA1C433912C56D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652245767.git.jo@jsfamily.in>
References: <cover.1652245767.git.jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [artz2p/+l8NktRQSR0XHv8QmoAAOlencgtyvj3nlVPURb9rsJL1sK/zNTWvmI3xV]
X-ClientProxiedBy: PN2PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::7) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <14e55f187087abd99a76d6c3e4909991c1a1e89f.1652245767.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a49d0ebb-a89f-4105-c51e-08da330f1f92
X-MS-TrafficTypeDiagnostic: BN7PR02MB5313:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3b+y0WL4dBGNzI5mW68W4Fc8ZsjF3HiHo7EMFiWPRnHs/BUPaW1aGn5Eab0xr4dz0qVHwjxNPSzXci4EWXOp0U78ioBftsTnv8wxQ0JbW2r9df9zQ3b7sU40tcOCDmINm0n+Csay8Xbyov2OHntVl/Fgi0yCEq6JAwyFY1qQo0JcGo4M2Wl6HoCor+Bq+5AiJgIjemSTD2OwnK9mLcUH28pVEd8aimKwm4lwsM72qCObhUiM9/OpaKEuHYDRTpOBr5lP5WqcLZx5lk924aZZ7w/8kdsXNlpAPdrdlGhYFlNrTtsXiEIIS1zMvQl0QGjwafPv6gtfEP+su4qigWgUe19wz2+Eet9N6MxHCUEXEQoYfqDTo5njqggRwUgtO37S7gTkK0sDnk9vADPLWhEf1XxB94xUeHnQ2UbK55/kT090dOU+CCEDeeH+DgyihDLah/XCL2FYzDKa7a1d2Exzk9krojoWlF3U+RL1gvhzka1sKpYsyr9JPkHzlBq8Gn2GxfGFaJ1nvcDIdC7vxliMCTvZzNqZFZ4pW0NSkvAVYJSu1bF2XXhznqXYmw6Zcezb5/2JJPNhjG5rzWqA44+AhwTBvkBhcNESqGEVvog2htE33P+/f8U0ygllefCzN3n8FrXTNTQk7KQGFg+8f+mFCHHl1DHD/ZxU4R/adlSbu0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+9FEVjxMAwszkEc4KWzjdrcx0st3cig2aWFcurwQGRbgsFDxmi+xIfgvlO/4?=
 =?us-ascii?Q?qcbwTNTXl1optJW+BJfI38ZJX0lqGrC4eADO3o44+GG2eXGAzqE1Dn4kRVDk?=
 =?us-ascii?Q?TVEtZwoIOKlF3gdNurhZ7lDkg53/jlpayWHjZmW0DDW2aZruo3x15tPBPt/9?=
 =?us-ascii?Q?DF1QfcGJsm4AiVyVlg3T4iJ7ixENjDQ8Ko4I0HxVwEjB8KlFYH1ikVhhGEbi?=
 =?us-ascii?Q?F4lge53RDHUsQzcyVRT6hhPIPYpaUCnZteD3tOaeIehjSPN5bPdtUZHnht93?=
 =?us-ascii?Q?vBGfSw/EGB8JoBh44MmkP1pB2SlKz5dXSqfuuw9HOXo6E39Pz3XSgkimr/It?=
 =?us-ascii?Q?W6PkBuKFfy2oGItRg8bEthMOWCtcXlWfSwo0THij9zGIwlo1tMORr3Tvp89h?=
 =?us-ascii?Q?phjsNoVbyP0cUzXfqeRDclhpHHQru29Dfk5uo6M/Vde03laDLiqwICwlRwvc?=
 =?us-ascii?Q?heL/ojZywylsZz+ku+Whgy9vt5hqHzsHAUSnhP7S9N+oO6z1i+SdFGwcqHZl?=
 =?us-ascii?Q?GanAYz/I4gN22sFETthsL+4cOx1vQCLNOu8l4yZFaOM4ru2Zg03iyrd5uNsG?=
 =?us-ascii?Q?GV7RF3+y7j+KrVk7uSaXaEtuNu+VEZ4X4Mr2LVkWdVr4rp87jfYqGX4MvQPV?=
 =?us-ascii?Q?h0ykxJ0Hcd99OUw1zj9ADrx/7KDOiWXMoDhqPVCBK1oApWsxVQy/kcboHx4i?=
 =?us-ascii?Q?z9BdO6AIDfIMcKrC9n4ppgx6HUNCRSRZ1ieBiIc0N6zIVr1y3Tpqq3ZRv/s/?=
 =?us-ascii?Q?Kaezl9rgLzi8Vp3EFlDbXWLv2SjuyuYyQb0HADGP/fvagCh8JVdN9XJAIJfS?=
 =?us-ascii?Q?XvkaftfJpYZaK8w/1xRqQpLRTqTwM5dPz2Je8hE1gzP+c6UJXkwmzmtK76cw?=
 =?us-ascii?Q?m6QY5x7kFjHEgjirKr+T9iXEH4TKXploP/4CaZlZPsyLXx+V2s+4DjvCEc6v?=
 =?us-ascii?Q?mG7WVwkkwFMmMcpDIYVN/XdRdxb9PVdvLyPLf64ktnc0fYSd/oIIChEjC69B?=
 =?us-ascii?Q?eu2IEklP68e51K4cprZs+gbkfmvLLRIh81IpmLanv6UAYke5CPjRq8RIZk+/?=
 =?us-ascii?Q?79KcS4Gxj93QImZElw1TWvBFXS9O1LMsYBifqPM8+DIGr36iBe9TjJToBCTB?=
 =?us-ascii?Q?5J/ZgMrFFGtBS54AS1UamqV4i6nkC3uqo2mdERv/vQw1c/HcS1IX/lPGogPQ?=
 =?us-ascii?Q?i1ShnJilkEamWEEmkv9n02BhwSUQRumrDNOvdeFSAu/6Qj8UtQB4QT1PxO6C?=
 =?us-ascii?Q?GyB/bFrowy4iVIfk7lWkYF31cd3++2t18AyID87oFEv7AvXalyfT/dnvfXZM?=
 =?us-ascii?Q?HAe9Re5ubJmnJl3o+r/0P6iIChHHeq34zfXaMC2/DI7vYUUmUbCRtRRHEG90?=
 =?us-ascii?Q?JLYhVAN8Ne9/TQgb5NsdIfg/lDx8t+XHCSgFWBr1espMsT77f4/ttykbs0t+?=
 =?us-ascii?Q?axwc+VfnBJrCO6dTCwPhwIZAKt8n0+lp77nUQ3BXGx1l4YaNTjmWNA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a49d0ebb-a89f-4105-c51e-08da330f1f92
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 05:28:47.5615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5313
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
Changes in v2: (Krzysztof Kozlowski's Suggestions)
 - Specify maxItems for reg
 - Cleanup and simplify the panel properties
 - In example change "|+" to "|' and "dsi0" to "dsi"

 .../bindings/display/panel/ebbg,ft8719.yaml   | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
new file mode 100644
index 000000000000..80deedc01c7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
@@ -0,0 +1,74 @@
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
+    maxItems: 1
+    description: DSI virtual channel of the peripheral
+
+  vddio-supply:
+    description: power IC supply regulator
+
+  vddpos-supply:
+    description: positive boost supply regulator
+
+  vddneg-supply:
+    description: negative boost supply regulator
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
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
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
2.36.1

