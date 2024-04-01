Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE08947F9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 01:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECB210F69A;
	Mon,  1 Apr 2024 23:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WPNh7rmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944C10F65D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 23:51:16 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5157af37806so4927298e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712015475; x=1712620275; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+eEH0u79NHtVDKA13PPuTSc6hJlgwppuYqct0Olpnw0=;
 b=WPNh7rmS1XUZyen8mWLQK5faYJ6ekdsJ2yH/n6U2emSpYzeWKFZ53idvU0gFMPqsZg
 keaWqQh4y8s2odVeFCyIzihRAhAASspWyNChUuJlKsePmhqTVNBnV8WDrYUdg1jqkAqJ
 3QRedaFtN/mQaADUb7qSQx5DM0SBt47p7WovFlEvuqJDdPS5HtCMAS/M1Scot0bvHBSp
 R9aRt5QH1SDuZMF4U3zKaNRw71MNcgHVwYYGkWZDxpvYIL6/k8zgXAU/rSHTRcHscGwo
 bdZ/39XlfLhYqwGhfOnr57pf4n2pkxOnD9yXWQgAqzJQfxfzEzfxdCaZ1s0PSYCinXSv
 8YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712015475; x=1712620275;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eEH0u79NHtVDKA13PPuTSc6hJlgwppuYqct0Olpnw0=;
 b=Cic8NuzNa0KTBZ9ngLxpClrGpcNIy2vS3OgjrW5tYC6w6tUpnakmB5z3rP7u3tlSpT
 +KBUEg/4I4Z0swSPvF/x0EUVwe/m12Dgf7jFKUAucUbdCXxPykag4BcCD+TsS4tvA19x
 QZjujDL3FD6JGwKQOY0PMk/rYq0oeTV+vi5AJ1efv1u5NDUu2AgNtROWIKHSSNKoMi0z
 N8BuBp915XyMRAxu9cWtRZ+1iXlVAWtDfswPj47HMz62kl6LeRCMGq954ozqVEPSS2nE
 4sVhZ33GHQTjTWSY0j0vy7lZDAaKMrtP15bfv8J8BQ0RzV8/XrqSicC79+GuidpPaVSA
 eu1Q==
X-Gm-Message-State: AOJu0Yw1rCyBjpSTJvPt8aD25j3A1cuFSEvwHzOHC8ORaWCSJ1FeJ3oY
 B3pemHiNLpYLqczfCkQG9oswTqlS9vKXZeHHNxMseS8mffizVpuvNAEJvzL/DfI=
X-Google-Smtp-Source: AGHT+IGTCwDowGTdalqVrCQ0Eu46a7Gmg5+5Tr1UPwFjEX8KSGSLgiPW2uINmMR67uy9bjuZ6puTAA==
X-Received: by 2002:a05:6512:3688:b0:515:d4c7:d23 with SMTP id
 d8-20020a056512368800b00515d4c70d23mr5121851lfs.67.1712015474994; 
 Mon, 01 Apr 2024 16:51:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 g28-20020a0565123b9c00b00515d127a399sm1176135lfv.58.2024.04.01.16.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 16:51:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 02:51:12 +0300
Subject: [PATCH v3 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-lg-sw43408-panel-v3-1-144f17a11a56@linaro.org>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
In-Reply-To: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC0hwBbAPFoe4VO+0i+xUCjCnUrwhXAUz8gChl
 BvoLM78kO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtIcAAKCRCLPIo+Aiko
 1SReCACowHvqNUvZGrCCOaGMgmIDhg8ZmYUdtAAvvyl2y4/6Oo664vzHuoX8LODxS80H/VENCRC
 uJiG08iJrDMUDE5HgSuGA+fqiKmfNF5Qe4zcUPTvr/Rs1mWiNsWy8NEOcoh5GRPTM7mZ/H5Tw5C
 kLO/KI7SZRV6H2dBX4NFa27DPEuPdFswYpTxjUWxIhNyUG2Fvue9WXDgluiS1cvHw8ZAkC9LKNQ
 Z7Bv7MJ/AQnRfvNF9G8nHN4jEE7MX7fUE7mAFflg1OBvDWtJh3++Ph8aHgtPSLvj+gwD3q9E1uN
 anNOwBmd6YkWQQe3zt2s2trXJGsp95RfTO3b8VFJs8zPYIu3
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

