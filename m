Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31465201B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296310E3B8;
	Tue, 20 Dec 2022 12:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428A310E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:01:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so8575170wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GccDBeJZjaH9XCmg3AAu3a9rt4MbZnC2S1dc4W7SU5o=;
 b=Fk5ZJdVFnJ7r2G0RFverr6ublZxy8NcXwcgNGsXo1b9n8bpZhcR4c2itnoxmq9ci/M
 mS82N1AUGIzKdToiR6D9eeSalfgBYVUBxPYUq4M3r3/E/AokqIDyVPfsloY0rcY1Z4+s
 4Ot9cwW8Kt/Sz+HqnJ5bCTUFguLFAJEn9lDUrooMZDpYLM0E55ZILwp1RFhl7yMM6+JP
 dDB2GgNQL5o2IOrcfy9KeKpki+RdqB8owi/khENc3kKGOgBsagGBPxhP4/JGAh3L3WYX
 KJyqbBua9QdrNSKRluP17z/BLHd78TDcZYTZxpA02bTr7g8HkFOyWe4cDkC8XFcdklJT
 cM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GccDBeJZjaH9XCmg3AAu3a9rt4MbZnC2S1dc4W7SU5o=;
 b=jw4rka4AGgjQQJkOWugfb/TTc3sPSw5e3VISmQeXnUL0ydFgu1ApPUBzVwmHd8ls85
 o8tMExQLcbuUdaD9J7G5vI/ULcnl7f7mBoeCN+lt67SxMtJ9MOcJdXP2/lx5Dnlo7Wcx
 eZvkxG4rM8LPjsl+OVyqBPMms0+8jpGTsO2z4jpvA87sAVlJ5c1H3ngAFfts59yo10hM
 lGV7exd+QjfIyiFTlbKs+4OvlPhQjcep8zyiS9eJ0l5cywxE0HfywtvsbSxawlQnKADD
 sI/zLn/YgpxSH52XFEgopmWqUd2gNZIW1jv9b2pJxaHcjnLgWxA1OtF2+mUYDGDZJKBq
 xYtA==
X-Gm-Message-State: ANoB5pmyNuiaQX1q6GLE1Zf3bBsCoZAWt+6PE00jlf/p6TD1WhXO4DsO
 hS2xaWp86aScWleiQHdU9rI=
X-Google-Smtp-Source: AA0mqf6qCxOt/snVy2o1Qpdg+T6cqG4NvfpldAZS0aFU2zO0U/4UPj7DnHR8IayPG4+Mh+7wc1Q87A==
X-Received: by 2002:a05:600c:22ca:b0:3d1:ee97:980 with SMTP id
 10-20020a05600c22ca00b003d1ee970980mr46536595wmg.7.1671537676543; 
 Tue, 20 Dec 2022 04:01:16 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1c4301000000b003d04e4ed873sm22843188wma.22.2022.12.20.04.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:01:16 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Tue, 20 Dec 2022 13:01:08 +0100
Message-Id: <20221220120108.481554-3-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220120108.481554-1-cbranchereau@gmail.com>
References: <20221220120108.481554-1-cbranchereau@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
interface.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/auo,a030jtn01.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
new file mode 100644
index 000000000000..0d1e6b45b0f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD panel
+
+description: |
+  Delta RGB 8-bit panel found in some Retrogame handhelds
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+  - Christophe Branchereau <cbranchereau@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: auo,a030jtn01
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel@0 {
+      compatible = "auo,a030jtn01";
+      reg = <0>;
+
+      spi-max-frequency = <10000000>;
+
+      reset-gpios = <&gpe 4 GPIO_ACTIVE_LOW>;
+      power-supply = <&lcd_power>;
+
+      backlight = <&backlight>;
+
+      port {
+        panel_input: endpoint {
+          remote-endpoint = <&panel_output>;
+        };
+      };
+    };
-- 
2.35.1

