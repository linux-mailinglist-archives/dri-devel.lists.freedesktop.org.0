Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB98ABE36
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 03:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBA610FCC2;
	Sun, 21 Apr 2024 01:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="ols9oq1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA48E10FC8A
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 01:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713661915; x=1745197915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbO5rAvrQSJWbWQBjrLFv/aoQtaQpow7bmVOVv2wkmM=;
 b=ols9oq1/jE8nSukIMFH5Q3F9Q+wfkCi5uxYwzQVIoN70hA4EejzqUDRh
 YitK58TlvCFEMJOn3ecgg01rf5jk5VZ2iBPRNxIB4NJjtBARPunYKmAlr
 f5zy3fJ3PF4Gr94xEag0SJLx5dkooqqKJHK3RrG0ENfkuYMl8+jfnnxhN
 mgGb32QhvzympOGzgJGDo3NuPFQvSOHzVKc9c4Yl9pZoGMGW1a+SaLft7
 ORmnlBdxbdNXQIqzGWod2/fdOu0nMR0CJjyLy6DOiJJvAxkDwtDwrhdcw
 LrJONTPJgzG8+DFI1cmajOMsYY48erRMuSnfFznXCmBbrRrbCjn/XcAtD g==;
X-CSE-ConnectionGUID: Z31Mwg63QjairJeGchYeZw==
X-CSE-MsgGUID: 9SNeaMcHSHG7FRnrHhMVCw==
X-IronPort-AV: E=Sophos;i="6.07,217,1708412400"; d="scan'208";a="24025073"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2024 18:11:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 20 Apr 2024 18:11:38 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sat, 20 Apr 2024 18:11:24 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>,
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, "neil . armstrong
 @ linaro . org" <neil.armstrong@linaro.org>, "rfoss @ kernel . org"
 <rfoss@kernel.org>, "Laurent . pinchart @ ideasonboard . com"
 <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, "maarten .
 lankhorst @ linux . intel . com" <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>, "tzimmermann @ suse . de"
 <tzimmermann@suse.de>, "airlied @ gmail . com" <airlied@gmail.com>, "daniel @
 ffwll . ch" <daniel@ffwll.ch>, "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt @ kernel . org"
 <conor+dt@kernel.org>, "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, "alexandre
 . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, "claudiu . beznea
 @ tuxon . dev" <claudiu.beznea@tuxon.dev>, "Manikandan . M @ microchip . com"
 <Manikandan.M@microchip.com>, "arnd @ arndb . de" <arnd@arndb.de>,
 "geert+renesas @ glider . be" <geert+renesas@glider.be>, "Jason @ zx2c4 .
 com" <Jason@zx2c4.com>, "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>, "rdunlap @ infradead . org"
 <rdunlap@infradead.org>, "vbabka @ suse . cz" <vbabka@suse.cz>, "dri-devel @
 lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, "devicetree @
 vger . kernel . org" <devicetree@vger.kernel.org>, "linux-kernel @ vger .
 kernel . org" <linux-kernel@vger.kernel.org>, "oe-kbuild-all @ lists . linux
 . dev" <oe-kbuild-all@lists.linux.dev>, "Hari . PrasathGE @ microchip . com"
 <Hari.PrasathGE@microchip.com>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, Rob Herring
 <robh@kernel.org>
Subject: [PATCH v8 1/4] dt-bindings: display: bridge: add sam9x75-lvds binding
Date: Sun, 21 Apr 2024 06:40:47 +0530
Message-ID: <20240421011050.43265-2-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240421011050.43265-1-dharma.b@microchip.com>
References: <20240421011050.43265-1-dharma.b@microchip.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changelog
v7 -> v8
v6 -> v7
v5 -> v6
v4 -> v5
- No changes.
v3 -> v4
- Rephrase the commit subject.
v2 -> v3
- No changes.
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

