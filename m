Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70870962349
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7F110E4E9;
	Wed, 28 Aug 2024 09:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J+WJMYlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953610E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:22:51 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42ba9b47f4eso907995e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724836969; x=1725441769; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EfpPLPQgSBuRiuoslnQqHCmedaNEg3K6zxnI4WC0qco=;
 b=J+WJMYlQ9PQrGRvOXW5KPu7JvDnU6Qjz9/dl6y0b1kpxtOEAV1Yp5zjNMxPpuXVhAl
 l6HXRRNash66Cdp7fhx/N7Y7jtR0JZtAcGnOpNF7aufebm6iBcViL4LgArEDeEJjPZ6Z
 rLTYVdof1au6p5vQ6JgxjB5Iu+riPwmn8DK+m9FXe+YiSPaFLvX8Hc0PPZ9TvO0MVoyZ
 USV12guIs6IJiX5nvV1hwz7DxwZ9uRAso3J9POYcjPeS2h1LQdvqBg0K0ZIZzUfF5F7J
 rV/G3mS51DqfXVlJoFGalc8xmEDPhYCCHyIEIr5fqNh6y0hCdRU/1lV0ZQ+qwyMF5AHn
 faPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724836969; x=1725441769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfpPLPQgSBuRiuoslnQqHCmedaNEg3K6zxnI4WC0qco=;
 b=X+2dSFdyhNDhVjL3CrQm7bOeqZvW3MROQIPKtAquGK2JuT5d8b16vsHynZ4Ok+Acf+
 aoMEXRpBD5kQG1uJtaSJwGeo5RXsrmBSNZtJEWRr+O1q1p7pxCp91Urc3obmY9jzGLpd
 +Z81U/7P7YqaOnl3i20T2S5pWxVrSOK2ktcJECD/xcR3mTerJtOzj8ns2C1Ua4J7GcZU
 ymq7HgdyplCWOfQPwFU9fouHphO1qN17899YTZ1UyL9iJYdKWccIuiJ0vs0MbshCFJA8
 lVloBfhtECu57a1RAN1r+0Rsum6moFmu0uqhPY3O/eHBPIAjTje7zUiddEz3HXEDuZwq
 +QJw==
X-Gm-Message-State: AOJu0YwgCR+VtGP60k9dAhuXZNciX22H3p11Q7ro0eEpwUEyTjea7g+P
 FeVXNpeTesFT0W6/lt+yD3Pdy7aXbiBDWM+dXFY9hLA1v52ZicCaXE+5uKG30h4=
X-Google-Smtp-Source: AGHT+IHwi+uwVs5DR+MY8eZvorejySpiOuQ/4Y3KJHIrzaamfzZd0EgHKd7i+rD5u4AI7BnsYvchYQ==
X-Received: by 2002:a05:600c:3b92:b0:42a:a749:e6 with SMTP id
 5b1f17b1804b1-42ba56b8683mr9613415e9.10.1724836968890; 
 Wed, 28 Aug 2024 02:22:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba639687csm15002435e9.8.2024.08.28.02.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:22:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 11:22:40 +0200
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document BOE
 TV101WUM-LL2 DSI Display Panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-1-0a039d064e13@linaro.org>
References: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
In-Reply-To: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Doug Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Zo7rD7LhsqXVWI1DlfMsF/Q1UaOY4RkLnQpyLGe4S4Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzuxmRsyxXpFr1oHBkhtXrTwGfnTvuk1dnEZb9tiI
 iIa3VUWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs7sZgAKCRB33NvayMhJ0XhbEA
 C94nYloVsHo1X7imNWfAntDEUWB7OUc+4Yr+KkqspgD8gDzKcHAkCjlCEIuuUAgY7B1jXXOmmQUCv2
 jBKZsOXEWAPaoyEfqLMxoJAAfsLC/iwZLvgBCELF/lxIRI+rW8nJvIrhcFa7/KgiXjK8UlhPolnWYW
 kU6wrBrnivdGnvWYfN38XokqcMrV30pfvAiIwyIQ9ws+Jfy/YcLPHaczScY5Ij5Akt/2kCVNNBHwil
 eJu6Yzqq+sgJCa2ArNQT/pVFd2+vDXM1BYQNx+HcWDvdh+25XlRZOevRIX5hXQ9WJvxBTNcC/kYv+v
 bT/KcJynKg8AcXVaLoYjlLjDcics2jfpR7R5pilYeSznL9Dg9ishKN1jipvfxl72BSxHFGtxGdByWT
 ZlDpRkIAGPgBpgh+Zxn6I8qucSzamFuTwGgXXHsHnsW1LkTkR7i/qF8J/FTj72gAIPY6EVOKecjUx3
 /4S5fbm7ceFMPLHJPTsONlDgrZRjBjZkDFR/7KBTH0ZTFlJP529+GpDH6trGqycG/9Cgwt1Nzp+G4k
 KNYvBfNCBjAHf03Ut7/hazETcSzAu/aH5nsoZmCIRGfvzwOiWp7TC7PxyfZBaHGJ6nDDM8Z0DCQxtD
 LFY5cTAxTo8kuuAIstuBb07c7ZSoZGWYstGiOP57rUKHG9KZMXNY24BwzBeg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document the 1200x1920 BOE TV101WUM-LL2 DSI Display Panel found
in the Lenovo Smart Tab M10 tablet. The controller is unknown.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/boe,tv101wum-ll2.yaml   | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
new file mode 100644
index 000000000000..dced98e1c69a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv101wum-ll2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TV101WUM-LL2 DSI Display Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,tv101wum-ll2
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  reset-gpios: true
+  vsp-supply: true
+  vsn-supply: true
+  port: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vsp-supply
+  - vsn-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,tv101wum-ll2";
+            reg = <0>;
+
+            vsn-supply = <&vsn_lcd>;
+            vsp-supply = <&vsp_lcd>;
+
+            reset-gpios = <&pio 45 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1

