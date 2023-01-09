Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DE266208A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7977510E383;
	Mon,  9 Jan 2023 08:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EE810E380
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:49:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk16so7369408wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V6pYLeV8ft+/6v9rIuv+K6mJ3K2zLutxNoFJngUlRoU=;
 b=Gc3kJ7GOoJIlt+95aZM+RVvNjVZEAnLdrxxAsRyaU6kOORyfTXGWsrXAbZ+vy6GJfV
 VTfHPOOkxhWLCCIxt0NWs59LZSkCgTAQm1goyoj+2iWaYtVO42DTF1980uDhAA6pQvS2
 JG/KUBbnC/K36auRBWTG0Ln2SRJDSkA2WSUGsGq0W9BbpIAu9ZEmyfAVjHq/j8eR5Lzr
 MYRlb2DTYHLVUw+xUsGwSMXfGpEQY7A4bVfQCbvoDN4NzJBbJQid9rjS0GeAdug3oCLY
 LaML8etsX4dOYqCPLpjmbrTA6IPAugsY2Wz8EQs0xNKYzNRkLpaa83w61FKtPZFIAMv5
 A0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6pYLeV8ft+/6v9rIuv+K6mJ3K2zLutxNoFJngUlRoU=;
 b=6V8T+H/daFXORGajfQc8i2mVPcd/XG/o+X8ic0n1tWAlDEfEeTTE44gvVYUAklfy4K
 lB/4Kyrr0+gOcXvJz0pHQiR1CHtKFsxyy7Q1ah0JymvJhMLJM/zUuvCXDveTH0vWjCMA
 T4QhfXBE4msnYm6liPn19XOdJ7+aiYIYNNqR6ecUZa8/Hh5ifnevhIAB4hheloDGZjZ6
 azQ7fN4DB9Ep7BBbdpqU/ivhRteM8eGze7zsXRbSSuaszx/SX9J6Kxj05nCTFGSohxnY
 SAp3aO9qh9oxsBdRkT39otLOCQwRZ/tAlNfZUQPpxXdFY5y2nzNwwhw7he3WE+KKuOfF
 Bwig==
X-Gm-Message-State: AFqh2koQYPH5CnaAx6xAUz/ZCTnokbRX9pIawmHwKTU/CcGe2nmZXhVj
 4LI8qmHjCylj6IVIxs339Ib4kw==
X-Google-Smtp-Source: AMrXdXv9Wgk4GPjPzq+gS8KbdtipvpmsekLvOY9Xqbr8eISL+KMJYpw3ydoH7rzzQoiW3rt8et1wDA==
X-Received: by 2002:a05:6000:24a:b0:26c:bc17:f3ba with SMTP id
 m10-20020a056000024a00b0026cbc17f3bamr42085441wrz.61.1673254175704; 
 Mon, 09 Jan 2023 00:49:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm15039619wmb.14.2023.01.09.00.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:49:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 09:49:29 +0100
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-1-dd6200f47a76@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.11.1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/visionox,vtdr6130.yaml  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
new file mode 100644
index 000000000000..49e2fd4b4e99
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,vtdr6130.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox VTDR6130 AMOLED DSI Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,vtdr6130
+
+  vddio-supply: true
+  vci-supply: true
+  vdd-supply: true
+  port: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - vddio-supply
+  - vci-supply
+  - vdd-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    panel {
+        compatible = "visionox,vtdr6130";
+
+        vddio-supply = <&vreg_l12b_1p8>;
+        vci-supply = <&vreg_l13b_3p0>;
+        vdd-supply = <&vreg_l11b_1p2>;
+
+        reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+        port {
+            panel0_in: endpoint {
+                remote-endpoint = <&dsi0_out>;
+            };
+        };
+    };
+...

-- 
2.34.1
