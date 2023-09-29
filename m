Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715737B32DE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 14:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736A10E70C;
	Fri, 29 Sep 2023 12:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65110E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 12:54:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso1899207866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695992068; x=1696596868; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fJRnOC1uVFTy9wWN09XVjV1SBIhNc3zqk8m17zK48I4=;
 b=GTMgq7tXnzVhVDVCuH2fH5H0b2sM8auWJRFS0U1tyWlzxNKmi9NQR0M0nop2OSv4qK
 sFOjU8XyjBW22ap0iRb08KfSOI6Hd8LYXD3qT/rxCodoVpgFTqjcsZfHvJx6rJPlKllN
 Qwbm21CjT2TNKExanj05z/1vd+ox+ZOm6slRAOnQrBI0zYkRC4+1K0gQ8dF/Y9cdgQ7/
 X3ufsvYYX+6xwADcp9LLBoXxoA7hq8QYhd5KQqknSf1wveNmZbC/BaNDmLlRPGbyAF3D
 dpiphkwsdNQn8CXBOxpV2tJ+i1Yia6LgIxVkM3zzyOM/hl7PJG0BszoegrfqGgNkjedu
 oxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695992068; x=1696596868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJRnOC1uVFTy9wWN09XVjV1SBIhNc3zqk8m17zK48I4=;
 b=HODSFP8yZ8+Nswk4ew3UCtu25V3BUhLq4fWgsdkTmbPr2BtD/aafcoy29GtMqVbGIi
 f8YN6KbCDbnLJFEqKkb9DD5b5FAqSB6FiI6v5H0ESsiLVjhMSmZKzk02NM6irH5cVAKN
 i8LE6FOy4v26zkRNaZlYi9cThoE5XHy+lHLGRt0lgQXPcfp+Mz5VEhsSvkUAROCoMIDC
 +Emz6MnZ/26hgLHllZr9bUKmWqZwz4PsVqnZRTkdXz/waRKUciagJIfwoBW541LK40BU
 8Ury0kl1ATpzt+jFFZPBkZGG7xmQ8k46FxuXdBSLTJcVuiyVjMjGZO2nxmhZ7gEGo6DD
 4rcQ==
X-Gm-Message-State: AOJu0Yw/KgE7eZNoJE5yJsMhshNAW1uZ6ORU3R+4dfL3/j2xaKaZfDVD
 68YYh3Oy9/VXdf28BbWE6pCORQ==
X-Google-Smtp-Source: AGHT+IHlfDyfdppYdfWPSEvGU1WK5j1KreCcUFNSlRJmHZyBRqXcnqIwdbLcwU6AMeSWtGRaTxH+Zw==
X-Received: by 2002:a17:907:7786:b0:9ae:695a:fed0 with SMTP id
 ky6-20020a170907778600b009ae695afed0mr3976275ejc.11.1695992067908; 
 Fri, 29 Sep 2023 05:54:27 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a170906831a00b0099bc8bd9066sm12380376ejx.150.2023.09.29.05.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 05:54:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 29 Sep 2023 14:54:20 +0200
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Raydium RM692E5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-topic-fp5_disp-v2-1-7b5e1d1662a6@linaro.org>
References: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
In-Reply-To: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695992063; l=2259;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9potHV92k4LaUbwEIxQbafFOD7jGDkkwV6NtioaJszc=;
 b=Osq3muYbMdMz9+o2MgDamp+nm0liT3RTNziSm/EWgr4xMlCD22SMwj3pcDFiziAW1l0rYKbd3
 FCtyY1Sr4a4AkSN2HKnGAxDCZ+FZEBGkO/CWX73soG+oq9Kraejc3hP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Raydium RM692E5 is a display driver IC used to drive AMOLED DSI panels.
Describe it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/panel/raydium,rm692e5.yaml    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
new file mode 100644
index 000000000000..f436ba6738ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm692e5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM692E5 based DSI display panels
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description:
+  The Raydium RM692E5 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: fairphone,fp5-rm692e5-boe
+      - const: raydium,rm692e5
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  reg: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - dvdd-supply
+  - vci-supply
+  - vddio-supply
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
+            compatible = "fairphone,fp5-rm692e5-boe", "raydium,rm692e5";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+            dvdd-supply = <&vreg_oled_vci>;
+            vci-supply = <&vreg_l12c>;
+            vddio-supply = <&vreg_oled_dvdd>;
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
2.42.0

