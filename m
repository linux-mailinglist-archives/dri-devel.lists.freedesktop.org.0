Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579AF849872
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 12:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A039B10F7FD;
	Mon,  5 Feb 2024 11:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Lyo4KJId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4D410F7DB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707131283; x=1738667283;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7mWEWnxAauLCFNk47f49pAB6QNSuMAx+Qk1dfenkHL8=;
 b=Lyo4KJIdsqwoSo3CLNZOm3yBMClo/2mtF5KYGUOVKPFfNpNke7UV59wP
 iaDx6KOKYcisPXnhssVrHm2wwhb2M1MXbz0K0UJHhMQQsXk9rI3+My5Oh
 WR/ob6udnpt3Xal402CZHfRd5o6XDgJmKQ8NJKBr2B6uDLHQs2tT+Cry1
 9ArGgrQCeIf7FIKHrvE4BHZJy1M3iswYp/thECjM+O8IHCgfhK8L1Kp3k
 E2B9MEd8QpNIfQTJMRxF8dKmWqWnWI4r+Nh30HWidycYWp7jpmKMRl8Sn
 Rrsx/ZAU1wDutbU7hH7M4Ur487yAPH5EppBZzhNO0jMYPTKlxCMxQMrml A==;
X-CSE-ConnectionGUID: tvnljXD9ScO2Biw+t+1Jqg==
X-CSE-MsgGUID: uOaGY4zKTEaXsI2/T8fQgg==
X-IronPort-AV: E=Sophos;i="6.05,245,1701154800"; d="scan'208";a="17124179"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Feb 2024 04:07:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 04:06:35 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 04:06:24 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <dharma.b@microchip.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <geert+renesas@glider.be>, <arnd@arndb.de>,
 <hari.prasathge@microchip.com>, <Jason@zx2c4.com>, <rientjes@google.com>,
 <rdunlap@infradead.org>, <vbabka@suse.cz>, <manikandan.m@microchip.com>
Subject: [linux][PATCH v2 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Date: Mon, 5 Feb 2024 16:36:06 +0530
Message-ID: <20240205110609.217022-2-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240205110609.217022-1-dharma.b@microchip.com>
References: <20240205110609.217022-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add the 'sam9x75-lvds' compatible binding, which describes the Low Voltage
Differential Signaling (LVDS) Controller found on some Microchip's sam9x7
series System-on-Chip (SoC) devices. This binding will be used to define
the properties and configuration for the LVDS Controller in DT.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changelog
v1 -> v2
- Remove '|' in description, as there is no formatting to preserve.
- Remove 'gclk' from clock-names as there is only one clock(pclk).
- Remove the unused headers and include only used ones.
- Change the compatible name specific to SoC (sam9x75) instead of entire series.
- Change file name to match the compatible name.
---
 .../bridge/microchip,sam9x75-lvds.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
new file mode 100644
index 000000000000..862ef441ac9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip SAM9X75 LVDS Controller
+
+maintainers:
+  - Dharma Balasubiramani <dharma.b@microchip.com>
+
+description:
+  The Low Voltage Differential Signaling Controller (LVDSC) manages data
+  format conversion from the LCD Controller internal DPI bus to OpenLDI
+  LVDS output signals. LVDSC functions include bit mapping, balanced mode
+  management, and serializer.
+
+properties:
+  compatible:
+    const: microchip,sam9x75-lvds
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral Bus Clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    lvds-controller@f8060000 {
+      compatible = "microchip,sam9x75-lvds";
+      reg = <0xf8060000 0x100>;
+      interrupts = <56 IRQ_TYPE_LEVEL_HIGH 0>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
+      clock-names = "pclk";
+    };
-- 
2.25.1

