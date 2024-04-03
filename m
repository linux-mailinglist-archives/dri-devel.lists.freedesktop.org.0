Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF94896324
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 05:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCC210F755;
	Wed,  3 Apr 2024 03:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eXq5wCU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A78010F004
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 03:44:00 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-515ac73c516so471958e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 20:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712115838; x=1712720638; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
 b=eXq5wCU/jJXMuQpNz64G36NsmdXTG0MiIJvcUY3ofvsANHWhz3Hq1eREBZ/lsJzy7a
 mqZRLz7278mh9LL7vL+anNYqFIhSyweEg7GkwEC4d3et6AjvWMp9c90xvbps+jLXrjb7
 n8T/DLV7iUD9X2tUEm/d+j08SLmfw9AleGcr4ciuMUphWnlgxhzlFXJ6EonN2ulBQ6Qq
 iRUTSlkB4O6HyWdyLbu5TYZ1CnqcBLjJxzL23MLHjJqRjtR9lPfPw5ze/Ld9EpasBpJt
 lEvC5SBuMx1KSrKA/jw4MjSZ/5Qeu+ZQHj5FRJAJnWTzT21D7bOpuDCUBVKo12PFtLct
 jdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712115838; x=1712720638;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
 b=Ay9R2NfP7IXGEJlv57cqiXeGfmA6ubr6Bp1LbukC5l5QnhU9AkrJsxcdOEZ1+DkD8j
 x98GosxuWc73qBrjoRqU4ApwmATvQeyFXif8t1gbI7w0eFDZBMr1KiomkxnIQH+9Mv+J
 6XrxjZemaTpuuHYXZLy2gInXhLGUhUczJkUVOfPzYNk3tdP3qdyzN2eYSRGmz7KpOWJH
 FVZ8vpgBvO3VAIJS84Zr9MwgaSaZQA2fy+BV6vbvWOOtTw6bZqZY9yO0Here4RmrcIkJ
 HDNlUyoh51zeAT1srczmbCF2g4Z871zs5WGmEHTGUfd3w0lQ3nLMFvRoDrWnxqV5J6KD
 Mvng==
X-Gm-Message-State: AOJu0Yx5ACyQzC9RarVYJYFtJEnB5xxFqjc0aEmp30Ooc7fOdOdiHCuN
 xxIZpL7aiV+QzuGBU3xpVXDNpAPkdKDhsm768KdwbYjWzNdznF9fmyofC7WUfSyBHQBr1df5c5F
 3
X-Google-Smtp-Source: AGHT+IFdp6MlJx8Q86tmUkW4rWuR7xllrv3RX4DfJ/SDa8Jrr3PQWwHeU5veK8Heu+WrR0BggbwFAw==
X-Received: by 2002:a19:9144:0:b0:516:57d:e4f5 with SMTP id
 y4-20020a199144000000b00516057de4f5mr428324lfj.16.1712115838113; 
 Tue, 02 Apr 2024 20:43:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 20:43:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:55 +0300
Subject: [PATCH v4 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-1-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7ss42XbFQ/Rh0+k3rxq0P6Jbz3+FOfUfiD
 DVWcLzhqb2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1UYIB/49YPYpkZtCCB7WnsVhlqTzEQjHe5iJJj1W9/Qwq0FgmL+5+K5z/b8IcGre5ssYS09Td7F
 vG6sNUB+Y/7uAcrbPSjOeWvHI8AwjgfKNs6+U9wU/VUWcKMyx4xPVVrH3m7yJhhMjWo0+x6FPW8
 IzJaJXaJk4LbyaoGMmAF1zPW0d6AXcHfntRdAbK4gy1vIt/DY8BkfU0nmFtVCh7Pp1vGpzg6aDa
 dikDTmV1S7EXpqXMwb+JdcjaEbNAc4fsbXBYzqBSFnyAGp+TZ5jeGlPNfFPXr62uiXZJbsgAZj4
 Q6wNTbIrbltQwaK89UARj2T2D064XYnLcQFJc6+WTcBvvQyQ
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

