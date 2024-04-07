Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2089B4C0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 01:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0327010FDF2;
	Sun,  7 Apr 2024 23:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gnX2y8+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3AB10FDEF
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 23:53:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d886f17740so6997881fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712534033; x=1713138833; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
 b=gnX2y8+KZaz8fnvdvHwCNo2FMGztlVX1DJRlzCnfBGNRx3SGY4Bhf/LDIUfSfOMxx8
 aX/NYxKUAOJ0n57oyL8+p5LPJBmgjPe+djrVU/0jJhe5l8vOFxFjs0yQ7b2dUW1Jrw0r
 IYuGxv4CVOOZWDloTLKf+cA8WIYJk06AYeVjeOrETv+0RTBUOiZw48D20jiv+vP041r2
 +MR63B/cZVCI73jiZZrHswjN6waDaBki4KGJQnwsreekgydItPrGkJieCgb5KOYpeVU/
 nWGd7UzmPpZwLhweMWh+x6xiB9hzzy3MULieaqtgnjHi1a64BsMIsaDV6DsoPfp9Rw2o
 rRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712534033; x=1713138833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
 b=sqIehuaHixXKDuT7FFasZwqQI4kNicFaeloX03WJ2OLEMy5eTxCO/QGHn100lM9OIc
 haaZYbIqservIjL5kPK1r9hc+8/+qgQgAbZ24xyXMie+571zr1mTu3wMt2nVHBsWQ++D
 zgEcGA34F8Kr0xObLJDPHbIKnhriSNXZSuIsEUgdR8590aUvRvv0XkotPBBwo/S/iuM0
 X7/ZpkYfLVFKu/kc0QbPAc0Ky6r1Getp00K9+LsCIfi/AJNL1gWRWhReq2JIqZcmhHnL
 lJTGJQQJWdgG/3yKJNAN8yDfwQZF2/ZFjZ0WfvuLavDmUI1HmlfALHORN3C9vumzWooz
 VnQg==
X-Gm-Message-State: AOJu0YxpNtE24/KXAboMRs+pUvIJrtmO6H2m3MbKLUfuazFhoILIwi6G
 hVZ/hT6mp2zFJJYJWtV/eprm0U6cyGIwgYb1FeLqOz+VuaHjm23kzGQSBO7vjik=
X-Google-Smtp-Source: AGHT+IGD0r3TWDMnfJz85tZs40iCQ3bJgYJGGYfvxWOghAuoLrX29Zx8JuwsRwlnBsTyog5reBPcXQ==
X-Received: by 2002:ac2:44d9:0:b0:514:b624:5d36 with SMTP id
 d25-20020ac244d9000000b00514b6245d36mr2217144lfm.32.1712534032652; 
 Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 t27-20020ac2549b000000b00516b07fdc26sm965696lfk.109.2024.04.07.16.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 02:53:50 +0300
Subject: [PATCH v5 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-lg-sw43408-panel-v5-1-4e092da22991@linaro.org>
References: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
In-Reply-To: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
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
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GwVgZdE26NDUHVKCdQIs4DldqMTJkpU3Pk/WgyxXJjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzIOsWZE0K6uxILhzHgEr/EN647OWFab82UmR
 AyrlutwlYCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhMyDgAKCRCLPIo+Aiko
 1cfEB/9qTNSpJTLxEWDO34OifP37mWXh2knrveFUXkNPOwZnHoUWkEILGgPqYqazzTe3OuH6umb
 pydAY9tIgE+K9P8+dnKNxHOoL4glYzY3UBc3Y9mnbYmMC8avnPvzmZUYGmEuVlM5DtEC9zNJfdQ
 ap/+i87+GYqE+zyPmK1vKsuFf+ez2Z/LSmgt2jbCSEHkQ1wKhNMwCEYBzvmORhHWosl824MEOCO
 wU/NYpatsxsPS+B1K4xt+wjROTH9iU1buyX99DKQX2Bn6GyQ8GBo4Y/j/V31WQuPghZW0SNYPQv
 z1z+v6cYP/a6OxQ04iIpiW7Hl55SUgtCEj/tR4Ba4gobAJg8
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

