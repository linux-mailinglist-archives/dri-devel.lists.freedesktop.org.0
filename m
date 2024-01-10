Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4AF829D3E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE03610E61D;
	Wed, 10 Jan 2024 15:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28DE10E5FD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:14:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-40e43e489e4so47907415e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704899657; x=1705504457; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5Sy3lixVdO+ssOCBS2YWjdDhiY4KhMhsBIz9dLLKsi4=;
 b=mvnM2PHFdZwk+CBCFKutFWUR4ZjVrjzXNtvhl4i+501uu8MYMMm9xi+viFBpAs4YT1
 6tcGE6b0n2WkT7dh9nsu9gigAFPk8+sD9bG65Bk88kTmv3HFooAFQN3C9olpEqBvnmom
 t6Nbl16zMhwNA72X6VCbEgUJ3aPICYgYhldBdYdYJGSGPJiDrjC4/7616bfp4U+iuyon
 fBZimiLWdUP1B/nlIYIvtsMXxN8gA8CIQwBzzN1eUHzYZWscs7BGnyLMVMqZ/W/TpBAz
 bSGKdRhKnge5hHj1MK7KXA/PmJ7b2sdu3PykyOX3+4CU+PJZt5pt4kx5W6QFBHnDQLZ+
 GB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704899657; x=1705504457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Sy3lixVdO+ssOCBS2YWjdDhiY4KhMhsBIz9dLLKsi4=;
 b=V79mU18Nky1q2at70sIAKSga7KlVmNOO4+0suTk6iU3hp9RPhka0oeBEm/50qqQCm7
 tI5ASb4E4+ktGxHbziX/08xjX10lUx7AR/e5NXqEYx6h99UhIZ11msX2dPx1iWNIEU4z
 ssPvcoGzIQIAcjOhPfmWTIkE+Y3HnLxPnAx6iezFhzWVhgV/8mEj/CgbrSGuajPVzMtA
 jeLz/oQkprzk8MjUO8M/2xtpDCHTpv5d1JdIVMAaHWxWrg7dswqcOkMruk1+du/FBQof
 8bucPAVrp4lmRzIsLKlpj4MW0W/pet2g5QVD8v9IZNz91vXUA+s7VJPm+JekHZNMybiu
 plsQ==
X-Gm-Message-State: AOJu0YyJoD+OydIzoglIQuLM/GyKr21tB3728cQZWE7OKP2ETw5wAhTD
 iokkUwNLZ9ODG6/3hdgagPadYXrOidynq9diz2BC6Tt4LRCjjhJG
X-Google-Smtp-Source: AGHT+IGVu1Xwg6HHebOGdxAq74eDIEF0T/L/qFlmD5lnH0vOca8XN01eTTuA9zLK7Yh+9y4To+F4xA==
X-Received: by 2002:a05:600c:310f:b0:40e:3ab9:102d with SMTP id
 g15-20020a05600c310f00b0040e3ab9102dmr661174wmo.181.1704899657574; 
 Wed, 10 Jan 2024 07:14:17 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 jx22-20020a170906ca5600b00a27a25afaf2sm2174517ejb.98.2024.01.10.07.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:14:17 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Jan 2024 16:14:08 +0100
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Add Himax HX83112A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-fp4-panel-v2-1-8ad11174f65b@fairphone.com>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
In-Reply-To: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
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
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Himax HX83112A is a display driver IC used to drive LCD DSI panels.
Describe it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

