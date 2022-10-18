Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062B6030F6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 18:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BE310E2A1;
	Tue, 18 Oct 2022 16:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9AF10E420
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 16:45:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l32so11149865wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+orLHdjN22tP869vCnaab3e5mhNvntEtV9jpkeSTRtw=;
 b=S6dvHcLhvq0gyDjYHLftknwwXLAGEmhHTtaYQfFpeTBoqo8p56p6xiDIqySooNZomx
 YxJJrJQuRywSPrB82azwjh/OJo9/vqIe8iTLEJbVBSN5dy2IEi4L3QewHM/h+of4i81K
 DK8VKsPBPYQ80RGi7Pjg7b/hv9A1ozHZfRGtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+orLHdjN22tP869vCnaab3e5mhNvntEtV9jpkeSTRtw=;
 b=AlCZy2iO4uoktbv1j6zXRrAd8e1XovSJJmU/95a+6oYbbapWt0S2qLHg5e8nRsmTuG
 VMM52IaFG6RfdZLUazURq2XlV2NHOoHiRDUvnkaCJJXi0njtLb05qFbL6DeTM4m2U6rk
 oEm6N+XZA++uUqyyq04VC49Ehq+mCJ44aHkifoaLYJ2USUfSVAN4EMe4dCvWoGQHcgHx
 mr7MmNkoLA/kzzMJJdpGmnI0wjhrslExpFs1FcYxzt5ZvUvOoG4KvAE3t72C2xMryZ1o
 CRSHTYLLa78e/KofVhcNnd9ZCXvKsvwGAGhq10+OOLXbYhViOuZG1vNa1VQHdVIUOSC0
 SX4A==
X-Gm-Message-State: ACrzQf0808VZiA8isIXkxhY2Plc0VIhCF7OLGg2cegktwNVbI53d1lim
 AdXGhkU6NZkPiuRUwzn7OGUJHA==
X-Google-Smtp-Source: AMsMyM5pnkks/HND10mWToRhl+UCf2Z9hxQ1obs63ep+oxFuntY0Pg679ulh4Iz5SoE8EuPgz/8UNw==
X-Received: by 2002:a05:600c:4e06:b0:3c6:ce02:ece4 with SMTP id
 b6-20020a05600c4e0600b003c6ce02ece4mr2582171wmq.58.1666111551336; 
 Tue, 18 Oct 2022 09:45:51 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station
 (net-188-217-54-207.cust.vodafonedsl.it. [188.217.54.207])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c4b9a00b003a5537bb2besm13545592wmp.25.2022.10.18.09.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:45:50 -0700 (PDT)
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: tommaso.merciai@amarulasolutions.com
Subject: [PATCH 1/2] dt-bindings: add binding for tft displays based on ilitek, ili9488
Date: Tue, 18 Oct 2022 18:45:25 +0200
Message-Id: <20221018164532.1705215-2-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
References: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, michael@amarulasolutions.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linuxfancy@googlegroups.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 kamlesh.gurudasani@gmail.com, linux-amarula@amarulasolutions.com,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This binding is for the tft displays based on ilitek,ili9488.
waveshare,waveshare,pico-rt-lcd-35 (waveshare pico-restouch-lcd-3.5)

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 .../bindings/display/ilitek,ili9488.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
new file mode 100644
index 0000000000000..879ecc42c350c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 display panels device tree bindings
+
+maintainers:
+  - Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
+  - Michael Trimarchi <michael@amarulasolutions.com>
+  - Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
+
+description:
+  This binding is for display panels using an Ilitek ILI9488 controller in SPI
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # Waveshare 3.5" 320x480 Color TFT LCD
+          - "waveshare,pico-rt-lcd-35"
+      - const: ilitek,ili9488
+
+  spi-max-frequency:
+    maximum: 20000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  backlight: true
+  reg: true
+  reset-gpios: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+
+            display@0{
+                    compatible = "waveshare,pico-rt-lcd-35", "ilitek,ili9488";
+                    reg = <0>;
+                    spi-max-frequency = <20000000>;
+                    dc-gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+                    backlight = <&backlight>;
+            };
+    };
+
+...
-- 
2.25.1

