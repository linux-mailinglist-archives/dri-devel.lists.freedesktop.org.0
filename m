Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A95395BB
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E695811284C;
	Tue, 31 May 2022 17:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECF1112F03
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:20:46 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so2249680pjq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
 b=nXmORH65SpUjbhTvE2/X4vleVvzj6HP+vuXT2wdUKKV3uYzPcGvjjNbaiQXbwG8qzK
 uPv/BkQ+TkqS/c/pTyH3MEcmQTjImLnIAQwYIywCz9eE2DXVRcjWE2BFU0DaPWbtLi/6
 JIvwS/TtGLCo09S6g+UL6qkaUK2oeoCMkdiukx7QIlym1KreWmFGviLxAhPsUcZHmlSM
 OSkgJCSvXdBwmw4Gici4yb0fk/qD+ZeAOnsOxdBN99m27wOxY2bmru3yqNJ3C7pNDS41
 mUuOOYgxXC4RL+LYjsYCmgj2KzDBSJcjDqVJDm+H+8YT3Rf9D+evD4SgQIcZFSpWOpWa
 kFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sCP0jkvIeE07R1+RmlM9MygA92ez6zp1dtKYb5AvDE=;
 b=H9J+7UTe/ihoN+MrWxKaeo+BlQA+cXN7VdY5Igww1/Lo9NdwPF2T/O35//XRLYYegC
 6ZnFZ2BoI6UNH5xciREJ9yDp5AXFHEfq3zAuDvIrdGLf7rzwCC+oSkJilM1Y/ch4iseU
 wi+EOhK6niSG1v6PskdKRo6Mg8cb57rXJhv/Df1t3khPGMotBm78lxw3Iwpl7AcK5xm6
 3AUAFC1iUXU7anpVJSIARHSG0O+KYt3J56RQteLCVs9QfNcGNltW7aqNnxvcRoRMsVlB
 bA9l95SBfnHN0NJjhpijWNG9da/aaNFkJAEkgji73lcu3rKqIiH7F+bI7HfhrPhE2b8k
 Gfxw==
X-Gm-Message-State: AOAM532gbk20VjxGstvNB1uoMw2HA8+d2dUr7VXE7QcaY+ahlvpcv/gj
 sPTfI4LzhqSll95L6/5Ms2H1ofpnXsM=
X-Google-Smtp-Source: ABdhPJxJCbqOi6bcKGG2j8vTrhwclOHUg/eFfbPHJw6XvHla1B8QXbEiVn8d3/yztpo6Xy5/cUsecA==
X-Received: by 2002:a17:902:e5c4:b0:163:4c5e:5b39 with SMTP id
 u4-20020a170902e5c400b001634c5e5b39mr33395049plf.69.1653995961377; 
 Tue, 31 May 2022 04:19:21 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:21 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 02/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding
Date: Tue, 31 May 2022 19:18:48 +0800
Message-Id: <20220531111900.19422-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 17:57:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 Charger binding documentation.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 000000000000..9d5c4487ca9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq for mt6370 charger
+      - description: usb plug in irq for mt6370 charger
+      - description: mivr irq for mt6370 charger
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
+      is required.
+
+  usb-otg-vbus:
+    type: object
+    description: OTG boost regulator.
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpio:
+        maxItems: 1
+        description: |
+          Specify a valid 'enable' gpio for the regulator and it's optional
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.25.1

