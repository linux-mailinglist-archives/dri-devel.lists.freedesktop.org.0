Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B18C892BAA
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 16:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8AB10E895;
	Sat, 30 Mar 2024 15:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XmTW8VJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624110E895
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 15:00:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-515c50dc2afso3036950e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711810849; x=1712415649; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+eEH0u79NHtVDKA13PPuTSc6hJlgwppuYqct0Olpnw0=;
 b=XmTW8VJoOaxWjFSt5rL54axzQheUuXTuq8cwyx7uZVhJaPyCMz9x1gqL0bliyYLRCS
 jSMGWSo4oYL/RtRNvjJQ23zeWC8u7LBWkpzzOeppCniv/pee0CyLPw2qCURz/yRUO/UZ
 vrD+7wzJ04FrJvGtYglfydVZiOZbW2oPJ/uyJ6eg/sy2hkSmwGMFb8Tkk1Ui9R0tdJ5c
 21FTf7M+sito1NT71mrJsBIHxSgpDoZEeBqCp8Q/6xL6Np9pQcVVIuq7IUUIL4L1aFzI
 IIgo8oryz1KTj6ZXLc8y4D0P6cGnUBOsrO0ypsrLqbqvAwSiUXF5umn3vm1TKHDPjUzE
 VtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711810849; x=1712415649;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eEH0u79NHtVDKA13PPuTSc6hJlgwppuYqct0Olpnw0=;
 b=vWNdH3MJXx+4JASqRopz4rY9bVRR68O26Yq/9cHYqiWUpXWVPhONDq0aqLQKM570O4
 ca3QWDU0Q6aMYJ6PN7NTdNXv6AdeDXS2GjD0VINjuy62/LgXs1ANUUJCMJnmj/ElY5+F
 bxFovalxX9pVZ9jw43CKzLpE9FSDGta6GRxUZNmcdd3zobzOMADdA0yP6RpCXLORK1Rn
 qi4BH6xpiMXJ+S0qdbwp5/mL1ZPkY/kJXsFvUIPQTF+UdHmYBRiISHa8vDmtKIPCaZWO
 7DsKqEqf+Tbxfv4aiCkc9McZ3omnFscOtiW/XTUD2n48VOVQYsN0Y3Yx4LN+YV7j2Tmd
 qifw==
X-Gm-Message-State: AOJu0YzyJBkT22Lp7UBRf8BHL0RN9q5ckGrq4huxuXu4xwiOwIpn5hdm
 DNxGWowZNpk+aEWA/gw8tsF3h8sqV5dIOw1eMzt7DnOJOrbE5qbgvW6PKMyRdJE=
X-Google-Smtp-Source: AGHT+IH4Tqjo7n+gZfDWHfbp4pn41LKNbDyjcyYgbbfVlJT7z8EA4U+nfZQJN3EKM1ToKIW0H6Fz6g==
X-Received: by 2002:a05:6512:31c1:b0:513:cf75:2ccc with SMTP id
 j1-20020a05651231c100b00513cf752cccmr4944654lfe.0.1711810848812; 
 Sat, 30 Mar 2024 08:00:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j5-20020a056512344500b00515d205a6f0sm496199lfr.29.2024.03.30.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 08:00:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 17:00:46 +0200
Subject: [PATCH v2 1/3] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-lg-sw43408-panel-v2-1-293a58717b38@linaro.org>
References: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
In-Reply-To: <20240330-lg-sw43408-panel-v2-0-293a58717b38@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=12rUl+2HnN8d7afCUpo5jilPDeMfLdH1F3n7T397uIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCCke8taj0wJ8X25rcsRC2l4+1FyzH+0L4pQEl
 PR5XN45bp6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZggpHgAKCRCLPIo+Aiko
 1dgUB/9Cy9Youl9yPUldBL810Zn8CCZQKNyF9iQbeAOAtEWQ0mzurRp1QWj3JhIgeIEtsvoMTZz
 ZpDFHdscoQzHkbDfoNYE94D1ikHhhPGT23yTeruJMAGLITZncwrk1BUngFD1tjDpgfQOl9+SkbD
 X4uBi6Q+IXETGPTWmrn2w95UozYHKavRJFhJEgiSTO474Ffssaay9XvQ6Peq3we1Jk47/cBdL5D
 uRG1QNXjc1gA8I1kYTR5Z2ExDqlxea/kCr/AiuZb+qEx6o1Vc8FIJq0CY+9ghyypA5tW4k8GcvV
 8mDQAHBf5LvJITEFgHGyotsJEB+DGuZan6fpP9Cj7Di3P7RJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
phones.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[caleb: convert to yaml]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/panel/lg,sw43408.yaml         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
new file mode 100644
index 000000000000..1e08648f5bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43408 1080x2160 DSI panel
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description:
+  This panel is used on the Pixel 3, it is a 60hz OLED panel which
+  required DSC (Display Stream Compression) and has rounded corners.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw43408
+
+  reg: true
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
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
+            compatible = "lg,sw43408";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p88>;
+            vpnl-supply = <&vreg_l28a_3p0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.39.2

