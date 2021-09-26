Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5D418546
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 02:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4208C6E4B3;
	Sun, 26 Sep 2021 00:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882FF6E47A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 00:10:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y26so18505415lfa.11
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQ7XLvRIpTNyBxBWQkQCoLNOFtGjOh9e3PBhRdedrAA=;
 b=FPl8yjptljlW/qPrAwlhW1vx52iGXlpEkAxmY/9+qA9sTJiee9kQ/uapemrhC2EThb
 iWRsNXY9TmNvye7cvFzSSdB8AKepVflKkZ8Lo5TUpjYEFMokMiqYgYG8RUPwjBDBWNZA
 7xi44+ES5jlV0NiPvbEohu+bXfLq9w95hxMl1/qCxHu+E75/8h6ZlGFvPldrTA4Olyr1
 Ai0B59E5duQGNWpNbftIV64htBUEBo0spWF+G7gXrguwwXt0mItknU0UOCvk9Qet22s1
 +WM8OSw87T7a8OU/HZc7YVXH8zGaoWuYO7tOxDWroN3szTaPUMPUpKmq2N8xQ5Z2kh17
 4Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQ7XLvRIpTNyBxBWQkQCoLNOFtGjOh9e3PBhRdedrAA=;
 b=g5zCOk+ZuCRaFcWYqEO4h6aQn2yYzmuLBGa3vWPXmii72FZwHhYoTmu7PNvzs6EqNG
 EfFXGcpdYmRALtbr81h7xAu0iH5KC8qSr7ioJB5gRlF1OksafCKu8bjP4jLbDbXRujtR
 Bxqzb6dj9+7bODBqw+KcjUi/DFGllYCuQU3K8OPB7PCUl4W959060QoZnWRO8cZicfCn
 DKuZP0j+JPbjkSXAzHwc8UGwfYJjfNjjLYGmyHDeqn7rfhhfnbxUbcjQ37TsTVz1ayaT
 Q0Qu01A2ZIds91PL4zD7I3ILqb/+QjPWGy1TF1ko6+WLjPYDnn6J/pH4LDVsOkxN9nj5
 2hVw==
X-Gm-Message-State: AOAM533cScY3P+2RZzF+Q501qr5PZ9m4r8KVk/RAmPo7CtcxrcoxH3bj
 NiG+tsKKGDnMIg9BaKffL3tc2PbL2zyfwQ==
X-Google-Smtp-Source: ABdhPJyK/qBjuYuB0MaOKAp7wB6gRYUwKmiERY0RB5lt/ohJM8e4UihePx3StGWHU6yanayxOkRkLw==
X-Received: by 2002:a05:6512:2210:: with SMTP id
 h16mr16625606lfu.621.1632615013770; 
 Sat, 25 Sep 2021 17:10:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s7sm1261878lfi.130.2021.09.25.17.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 17:10:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01
 panel
Date: Sun, 26 Sep 2021 03:10:04 +0300
Message-Id: <20210926001005.3442668-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
using NT35695 driver. This panel can be found i.e. in the Dragonboard
Display Adapter bundle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/panel/sharp,ls060t1sx01.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
new file mode 100644
index 000000000000..271c097cc9a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
+
+maintainers:
+  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls060t1sx01
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the positive supply voltage
+  avee-supply:
+    description: handle of the regulator that provides the negative supply voltage
+  vddi-supply:
+    description: handle of the regulator that provides the I/O supply voltage
+  vddh-supply:
+    description: handle of the regulator that provides the analog supply voltage
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls060t1sx01";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&backlight>;
+            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
-- 
2.33.0

