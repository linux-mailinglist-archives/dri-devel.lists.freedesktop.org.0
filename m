Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BCA5385E0
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 18:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B310E4C8;
	Mon, 30 May 2022 16:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2094.outbound.protection.outlook.com [40.92.18.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455EF10E4C8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 16:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG2dlKB7oIY+/S2gXQkdgnxFT4DyqiPCwBHaxer3yJsUeuFpQI204r0QEN4ttSOfqFRg1MMq85KTgCnBDolPP2WRaXTxSkMWqCPzlYv/M/YQ1LCwfbjsuuZJ8TvxgoyFrZa/LduW/Wb+FfgzLZPyFELkw82a3IzaDnmg/svpR6+JxYSdllCLeZcN1QJYQ3T6dJnbsN/U+WonZjz5Up12JaqLWawCnmEjDVh3YKuRgYaUoy44R3tq/1LuUr2PrnBiGHh0f4Aysio3nmReLVZVTCLJkQZLb51PLnGO6PcqShAxbUhq/bA2PV9OjuxSBBpbQm4ZHxjrGyEQRSxB4v1M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAhCxglhjETDo1dxAJqXbFmX9hh34CCjHj2E6dHtQC0=;
 b=kddZlrvaDQrypFZxIxP9Pv+61cfme21tO5x9pwE1bc4fIQBpakdRz29jQnAh3c1dxw+1rFh/IL0lWIdYU/Sdak6+FWbFm7vfMSLOQhr8aHRgAOa77o9A66NhVJnLgwuG0oi3XODmRLud4iSBCC55uYTDLXnO0Ae4r1TYfHq8LOvq2lBL9cGNSMDDb7MNtF1wD4al9FLhDJlvZPBVsWHw0lnrMMoC399BKEQm0W5PG05Q7RrTm5jny4TGrBAfomlrA8mf605EVj07NmeALt6FhWply+S7/NfIhrZeA/dt4Dcl6NbjRSUXi97f97VxcZWTS4WFTiCmN3frAin/xzIsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BYAPR02MB5880.namprd02.prod.outlook.com (2603:10b6:a03:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 16:08:32 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%8]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:08:32 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v3 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Date: Mon, 30 May 2022 21:37:52 +0530
Message-ID: <BY5PR02MB70097E8FFA8EC5DCEC7D3F82D9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530160753.100892-1-jo@jsfamily.in>
References: <20220530160753.100892-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [dh6s4TSs+XdShftpNZdThKVXXZiso04sVCu516u8wHs3heQ+5ZAfzapxZhSMGOTa]
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220530160753.100892-3-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a192b9-62a8-4ced-3093-08da4256a4b7
X-MS-TrafficTypeDiagnostic: BYAPR02MB5880:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3/Dcxht78Pa+bi4ysGdeadgmvWHauNmL6qYk8DLyVfi09gcofuOAJ1tK4HM+NJjvmUh623HKtQTKXHwE6b67urq3UtXPNVPInbbT9qc1aUTwamzJVozaMx/qCrYWpa7BpEaDNTf5bpdh5t2lyrknQ6XpuA+6R8W09+APw6HMSll15l8IKy+MLLYlCjRWFjjbyZFtftZbKhSYcb0xcZ6B7f0kEJ1ZKAb+nbQYjPMZjmhBvgrtilSlzYC2pICDKsblTyWokd6pEZ4iJwo21QtspN0gSQX/gadrpcsKGUQ5j89R/Guv6Y3QIoz7kMTydUuNi/uo1oFHiDMT6mVXTHorGwlxDYXgmMQ4RGtBVcvASEvhRYTZBMvEtDRYPUuuk4VayXA2TlBckRURYjEkXfNK+F0kaYxGzwixJ6CKZFAdATfMr1v7vzMjOn5o9+bNc/tihIN2gtH68J9VCCrdF7OGqvUokNjjae2YWkcuRmZBxuQjJ0c/NhAryAYK8tkkuGx7l8gLQvAqGtlbHwcDnLPFRZlF/7+TBnMNteJZBe3mxMrSOWlEgxnevMt62OzZnikno8M8c/7kG9MegbrLz4s9EumH0qsUxcVZxATiVVlcf1VcprNaBTud3d9Qxo4oZ3n
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CY+8chK03Adt39b61cJz2GjfIVKm8Zay/a901RQUGajqhtLkdWTOlxtEmfUt?=
 =?us-ascii?Q?R1tCpzQueULKN7RsHyxpT6QQkuapb4OtX/oSdqWYIvOZlRkG5rwCSHGSOdo/?=
 =?us-ascii?Q?QGSwnHyO68TFBIOtpKQLrxTiqMPBT2g6/C+HK4G0m8b2cKUd9KbUG3Fnztee?=
 =?us-ascii?Q?jkKEEOZOmopj/ATUsoMUNG6nIrV/rq/I1tqnXJOYiiKWvyZblSzOTp8uCOFI?=
 =?us-ascii?Q?khteopyRjLwyWadLjawzhmzWKIJSBb/HtK51qIqsLkjaKT3xVLObewnpKJcx?=
 =?us-ascii?Q?k77WVro4wwO28Vva1yJgzYwHSW5HrTMfuWBONdmpgihSbU5WQDaa7r7G7sTs?=
 =?us-ascii?Q?e6VGzroGolsugAi9aK2uB1ZixtldMX+iJzfR4ERb/roa6cWjGIYE1B8DtQyp?=
 =?us-ascii?Q?tN5J4BIXOKx9oQI9KpX5Dso6mpuejVRGHR5DtxCP11epLP/lFzG5PbUChQng?=
 =?us-ascii?Q?ETAmCHzJ8I7se/zMZ/8eyGQDJM1ZFLrVBhGqueZAEdlfEqr6kYEvVuJ7UESj?=
 =?us-ascii?Q?KXmVV1HIQZZa9sE4ukWIJUjbUOri36t3xmZ1MKVMibDkRRm3779quJGCyrKC?=
 =?us-ascii?Q?flzDxHKToPFjgjKqdhJ1lyU/AJLG536mGA2yjx54adD8Ehdn4SawFs2ldjP2?=
 =?us-ascii?Q?dPWwHbIJvykstXIRJzI65MsMGdEX9lWPwvyLBZuFP42/0HpNRj9xC3r4y4tV?=
 =?us-ascii?Q?luTFwVKHlPicGsE8bdeUi90HBkezaOth8eNoQ9jNwQG5xamFXFDj9VlzqyQF?=
 =?us-ascii?Q?lhPF8iWKA3UCKy9Gcz8NQSu5KgQAuJSc/HOgBn8jKWt99h2eu6QGvv0ssKrC?=
 =?us-ascii?Q?10NbUkIOLPBJEN+U0sboMs0aRkmHBsHMax0N9zrhDxWmY26fv/dAnx05MgLJ?=
 =?us-ascii?Q?u3zmrLgbJzKMnSOJ74tgrwrvXdAoTuuf14DxHylhIVr7jm/tS9YaUg6mlsj6?=
 =?us-ascii?Q?HqJ6Wc5k8DDmZVsewHSepx59afiW3REl2MIp4yPBnSPshvKGXAdFbbKSjK7m?=
 =?us-ascii?Q?Dh+I/+aT6pEpHEYkgR9kHbEXjdW0U+XqBiFZNSwyXVnueDZdZSguGFtakdCT?=
 =?us-ascii?Q?iyloSw8QZXckI0hBmDjjnvgpWpR57anKhX2+PYvQDAbIh3Qgdc6mf4P2uVdA?=
 =?us-ascii?Q?Dlgtf0awZ7fsQksPfHAGy7d+EiRKLGfXkiGNr/aN12U+UivlPmhD5dzhT5vh?=
 =?us-ascii?Q?xD6LlYSoN60VtEwISEdia3ZUKATsOeoMTlu5HhjeM/FWaINI+b0UWICCnNgC?=
 =?us-ascii?Q?TgMlRd9S+WLE2XP99ZdWVU5wpOytvWgOrGnU0uY+NsHk/f8Zsi3hA3ilbkug?=
 =?us-ascii?Q?YRjU9LMdicTQKJ6f3LMBS7w1X/WDgT648/++G0KHvgj8d2fKoAoh25RdZMDO?=
 =?us-ascii?Q?Cl3Pd9jaoIKMNmTRNkcJ/i/qCsiCqpXkxBUBHmgTJylgeOUH85Hm9r5FATGX?=
 =?us-ascii?Q?5W9iS63Q91LUQBGk7if57m9L5OpzPMr8lt+TGAoj/fvICgB0VWccEg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a192b9-62a8-4ced-3093-08da4256a4b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:08:32.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5880
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

