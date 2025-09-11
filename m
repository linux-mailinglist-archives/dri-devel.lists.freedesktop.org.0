Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09826B537E7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CE110E110;
	Thu, 11 Sep 2025 15:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="c9j41Xue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 11 Sep 2025 15:35:05 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331FB10E110
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1757604905; x=1789140905;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vPI8d+Ewn3tGtC66dDnYrvhtUwCZSoHr3JQkHahYKWs=;
 b=c9j41XueEulQyiRKEPpHbfnOniQuc6jxqhwUTLKZGIKni3Q571HG/0Pt
 ggPl83SBpqRLaUepRedHyAmN5MK2oaMrFaFhnFVpjaHbkwIUlq3M+S2LZ
 mfdr5hrEHcVOrbQKzRDTGGMcOcnouNwLnaZkmOwhajBeCJzMK/x/D0lbn
 Dk2cV3ZZ50MhsPju8QgKa89KWJiINK4iDcjZ+X3a+YR3Moyndw3j1cBPe
 6ZuEkRrwe9KFjBSoNdTmuNjNIgnPDlGg/OLp0dp9TOLWx/USJx64w6NZk
 kSsWcOKr0hH/XqBI8KXE9MRy42yqqOunA/q9GhlVhZFAW9RvvqUq8IBAE A==;
X-CSE-ConnectionGUID: GfrnwuRcTGGvDy+5ZTnmUQ==
X-CSE-MsgGUID: mleIvvMGQdmn2L4xn2amqA==
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="277761655"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2025 08:27:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 11 Sep 2025 08:27:44 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 11 Sep 2025 08:27:41 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 11 Sep 2025 17:26:25 +0200
Subject: [PATCH 1/5] dt-bindings: gpu: add bindings for the Microchip GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-cpitchen-mainline_gfx2d-v1-1-d7fab1a381ee@microchip.com>
References: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
In-Reply-To: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=vPI8d+Ewn3tGtC66dDnYrvhtUwCZSoHr3JQkHahYKWs=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8ahV+mhj7ms1RXWHHLc7+u6KW72C9Mv29e84n9xblrpI
 /aFRkendJSyMIhxMciKKbIcerO1N/P4q8d2r0SlYOawMoEMYeDiFICJVEgx/DN5MDcj3pWhbzGv
 b0RvasW9MqeDv17Kdt7Zv2B7xo/0R8qMDC/3uTTFt/OYNZu93G+sdXWf3skTFx/e2qtrf/vSuRK
 dPh4A
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
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

The Microchip GFX2D GPU is embedded in the SAM9X60 and SAM9X7 SoC family.
Describe how the GFX2D GPU is integrated in these SoCs, including
register space, interrupt and clock.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 .../devicetree/bindings/gpu/microchip,gfx2d.yaml   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml b/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e416e13bc6627a0fef3c70625a6a3e2d91636ffc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/microchip,gfx2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip GFX2D GPU
+
+maintainers:
+  - Cyrille Pitchen <cyrille.pitchen@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,sam9x60-gfx2d
+      - microchip,sam9x7-gfx2d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      const: periph_clk
+    maxItems: 1
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
+    gfx2d@f0018000 {
+      compatible = "microchip,sam9x60-gfx2d";
+      reg = <0xf0018000 0x4000>;
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+      clock-names = "periph_clk";
+    };
+
+...

-- 
2.48.1

