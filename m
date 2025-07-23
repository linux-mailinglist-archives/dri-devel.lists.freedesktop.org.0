Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2FB101F7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E0B10E8A9;
	Thu, 24 Jul 2025 07:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.b="NgCz6zxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0326610E7EA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:52:35 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so10783046a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1753282354; x=1753887154;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fvfnia2CHFBiouPbufqpXi7mHD51PcZYlBOxi7dhKxg=;
 b=NgCz6zxhiEcQNk8tmCZruvdhFJAuFVJsnZBHmqEFo6Y6njZgCKjz4xGmU1e2oKfDC+
 uJ5YdHt5RO7tfbODjPxkCgUWLaOKMjQupcTdX/IlMJ57wYrKY0WVPgKrOjPRajbo/gb8
 R8C+PU5RDY8UDwvdEdcf4J8+/6NanchUz3i27rIAtDiJ4u/tmykRh7U7dbtXSkb/pKBb
 Sg2zG/Vgb9jbC7pK+Iuc8ZisobXaFFPtJQGOz1G9RaZvlqNwgu7AUDUmgQaB0Fy7JoYN
 IuoPM8xpAhxyZv0g+X1a1ybPWhS+70OMsw7qzsjLec/jCppGk1yu9tTc2/1NY3+OezT1
 oQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753282354; x=1753887154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fvfnia2CHFBiouPbufqpXi7mHD51PcZYlBOxi7dhKxg=;
 b=ntr+JPh2ZPXKcjpzPjcvrtk9k9ltfamhzLhPr4d9RMhaQokUzu51ecDoeeY5AO9ndd
 gotD9OC0LpPhDc0jCjqcp98ba5MlaguYUh3cY7JrjcO3AdvATihZIFH/+IHYzWHgozyh
 mQVDklVR80F0Rx5iRxs97T1X4A+yChdR06x0s+VwdxezNoYojd4kfZ20A5KLNKGxXAW4
 qtGekuH8GJrCbnoZppGlf+pXOvcgk5ytHGWC9Z4sVDvQp0kIqAN//UQnVHwk/juA6aR5
 RLR0cDIT2WJjPemN0M9IOYtoR6fiXX/SQTg9e+jtxmus8G8agSGVpcg9rA24+wMIFyg/
 02Ug==
X-Gm-Message-State: AOJu0YysLt3Iy7Y9tid2AXUfbPj/Xpod8GUgok3QtoFLsB9TVGFLxMox
 wq+XPVbJPVoqNHowiHMqWIU+Ie+AopWyKpuLY7y57l++Nilc6uJJg5g0MHVhZUpqvE8=
X-Gm-Gg: ASbGncv53/RuNDk1CfUASTJyANAt89qjvMlwYeKYCDDSmxTR717xdycPJiWM/LYvEUk
 NCdQtax/v+0VlC3WefKiC1ZOajndGJqUDr/kNOh2qlMVDF83mxLWpbl5V0S2+SlsU2mfdBzKkYv
 tk/i0s4jmAkGrEwtadQPOEJOuvZYkLBp3riJX+OAH7V66LeNbpqK6Xwrnde8nTXLuGm+i0xs3US
 NDi7OaWlniHzIl+dgqzMWiKhjc/CZazPYgdho4xqQpk26LA3aT0K1aFQvLyC9t1jaFE3euV2Aei
 xOR5fxyeYl3YJibpABQ3WHcP2OTCp3VsddedMrQGx+/ujmHU8ssdTbNxg7ilpdWo9wV8Kyh73oe
 9r+CmSy0QN6CUfUxupg0dDRQ+XYk8KAgrHWDG9/IFvi1qWTNrB8G7Xn1M5FGEeEC8lQ==
X-Google-Smtp-Source: AGHT+IEvpxQ+IdsGdLfLz4S4DQH4qkl51XEwv0CgbC8jzYZnEKNF3mo0VOu+/IQoalSy+Lq0YzUIPA==
X-Received: by 2002:a05:6402:42ce:b0:609:aa85:8d78 with SMTP id
 4fb4d7f45d1cf-6149b427070mr2940560a12.8.1753282354261; 
 Wed, 23 Jul 2025 07:52:34 -0700 (PDT)
Received: from tora.lan (83.22.10.6.ipv4.supernova.orange.pl. [83.22.10.6])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f33964sm8575657a12.18.2025.07.23.07.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:52:33 -0700 (PDT)
From: Alicja Michalska <alicja.michalska@9elements.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Alicja Michalska <alicja.michalska@9elements.com>
Subject: [PATCH 1/3] dt-bindings: display: panel: Add Samsung EA8076 panel
Date: Wed, 23 Jul 2025 16:52:08 +0200
Message-ID: <20250723145208.338162-2-alicja.michalska@9elements.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jul 2025 07:35:09 +0000
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

Add bindings for Samsung EA8076 LCD panel.
This panel was usually used in mid-high end smartphones manufactured by
Xiaomi in 2018 and 2019 (Mi 9 Lite and Mi Mix 3, with codenames
"xiaomi-pyxis" and "xiaomi-perseus", respectively).

Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
---
 .../display/panel/samsung,ea8076.yaml         | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
new file mode 100644
index 000000000000..7ea0c9fedfa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ea8076.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung EA8076 1080x2340 AMOLED panel
+
+description: EA8076 panel manufactured by Samsung Display. It's used in some Xiaomi smartphones from 2018 and 2019, such as xiaomi-pyxis or xiaomi-perseus.
+
+maintainers:
+  - Alicja Michalska <alicja.michalska@9elements.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ea8076
+
+  reg:
+    maxItems: 1
+
+  te-gpios: VSync GPIO pin, usually GPIO_ACTIVE_LOW.
+  reset-gpios: Reset GPIO pin, usually GPIO_ACTIVE_LOW.
+
+  port: Required on platforms using MDSS DSI (Qualcomm).
+
+  vio-supply:
+    description: IO supply, usually 3V controlled by GPIO regulator.
+
+  power-supply:
+    description: Main power supply for the panel, usually around 3.3V.
+
+required:
+  - compatible
+  - vio-supply
+  - power-supply
+  - te-gpios
+  - reset-gpios
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
+            compatible = "samsung,ea8076";
+            reg = <0>;
+            vio-supply = <&disp_3p0_en>;
+            power-supply = <&vreg_l8b_3p3>;
+            te-gpios = <&tlmm 10 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default", "sleep";
+            pinctrl-0 = <&panel_default>;
+            pinctrl-1 = <&panel_sleep>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.50.1

