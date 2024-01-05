Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A547082553B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 15:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915AF10E621;
	Fri,  5 Jan 2024 14:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F30410E618
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 14:29:23 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-55559e26ccfso2001642a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 06:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704464962; x=1705069762; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gwwLXzrNZmjdF/D81WsC3dKKL+3yys6UXvKoANltjZw=;
 b=RsuL2omDlB3X9Hwh9zMXEYeJJThRY3UI2wuzjKgpU0nQjoOUCqjBK5CuMqcx2aOOLh
 3KQE6pQlPeTpX0mk2aiDPXIXUWHyVFrNft9ufGWQ2XMrI6JArgHlRt0DgM6cI1Sdmsce
 cetPiJnvf6EvcJnF3NxZOHjyZ0ct9K+IyXRZv4wpITQq1Ba0Bo92yONtfWeZwK9vsiNv
 LwutR+pBZ4kN4lBbTn5QZFCzKlvCKPaGL1tm3YMYrdh0Zsm1zESyjiAW8Ykyh7UP47MY
 zur+WkpCF/J3EosWR6rswlNNTp0TRIRbmzfUsW9ZH/7XGnlgukivjMUDls8ASbyueMoj
 JeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704464962; x=1705069762;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwwLXzrNZmjdF/D81WsC3dKKL+3yys6UXvKoANltjZw=;
 b=qDTJUzvh+P++JeIopaMhUFSAnFwx0lSWoUW/YrwcQmn7mI0FmR4i56BdmF+DOhmuWq
 yR9zbThNoCmDJ3e5RIYZYqS1YQH1g0fuRMcHGvgsEsou9PcFUzWPxiEqau9s0HOPH45/
 oCbzwqdinu9xZuc6ocbADcBzjrqkBf17KXBwuS9VfI/IZkHHa9DC1gYRMnZVbL6b6oBq
 rLwwVjIiWi90bimkkCo0vn6VIztpAR5XYBwga+3XkwajipDgtwrRE1OSQVQQUZ8eOtwN
 zhmh8qa5zND0hVv1HTqofCuYnJsmUwyJ/03G/UWH5OOTB7LesIjM1wZE/DQ+/oh1rzTi
 XzeA==
X-Gm-Message-State: AOJu0YwJloezLQyvgFRrZk+OZ+q6u+jiRvX+bDykKXqiPj0QqIkyyiza
 m8ly0FQ7TJ0LQibSVgJClVx9N4u6ca+YqA==
X-Google-Smtp-Source: AGHT+IF6LEHSC+BNS1qSMu0hu5MCEzCXahNkFna7P6c4dqYpMqVyE2mE2qiqtGe673b+qnnk5M4/2w==
X-Received: by 2002:a17:906:2418:b0:a26:f301:6b52 with SMTP id
 z24-20020a170906241800b00a26f3016b52mr783285eja.49.1704464961874; 
 Fri, 05 Jan 2024 06:29:21 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a1709067d0700b00a26b057df46sm927006ejo.126.2024.01.05.06.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 06:29:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jan 2024 15:29:12 +0100
Subject: [PATCH 1/3] dt-bindings: display: panel: Add Himax HX83112A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-fp4-panel-v1-1-1afbabc55276@fairphone.com>
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
In-Reply-To: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Himax HX83112A is a display driver IC used to drive LCD DSI panels.
Describe it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/himax,hx83112a.yaml     | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
new file mode 100644
index 000000000000..22f58f1da9fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83112a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83112A-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Himax HX83112A is a generic DSI Panel IC used to control
+  LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: fairphone,fp4-hx83112a-djn
+      - const: himax,hx83112a
+
+  vdd1-supply:
+    description: Digital voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+  reg: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd1-supply
+  - vsn-supply
+  - vsp-supply
+  - port
+
+unevaluatedProperties: false
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
+            compatible = "fairphone,fp4-hx83112a-djn", "himax,hx83112a";
+            reg = <0>;
+
+            backlight = <&pm6150l_wled>;
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            vdd1-supply = <&vreg_l1e>;
+            vsn-supply = <&pm6150l_lcdb_ncp>;
+            vsp-supply = <&pm6150l_lcdb_ldo>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.43.0

