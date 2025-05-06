Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E00AABF6F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 11:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B076310E614;
	Tue,  6 May 2025 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJS2LSID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A8310E614
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 09:27:33 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5fb7717b02dso1193925a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746523652; x=1747128452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxclTCAeGds8LLW1NM4RM1oKe/mjBCeJiTDF+lZAFTg=;
 b=QJS2LSIDijvglg0IxCC0Cv1d2UUBqUdXSR8wMZm+YJxLUX3yd7jmHFvVaO6cPsQ3OL
 fnnTgg/JNVoIZn53zyAfLo/eJEnPxUgRXX9RmEr8L1kz+o/ZEcxhn8FDGIq98xc8rkXD
 YiWfog5xVZtVGf1Mq5d6QQ8b2qiWCe2Sqv6CUhZPqJPR4krZbshqsv8Ni5Z3to9OMBn0
 urA72CX9YAdRxkQ3iwdrajHgRC20RRe32AC1dLLo7QdaQZ5a2to/APeSdLyYBYC+/4Uo
 fLzMjoV4UbByNv28mlY1o68UkmoDKtdVbIwE9riYdObEfJJkQanvFet61ZdeLG2mJshZ
 Mubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746523652; x=1747128452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxclTCAeGds8LLW1NM4RM1oKe/mjBCeJiTDF+lZAFTg=;
 b=gwzUJcRJdSMTUprVhK09FR92JuNlEOxRfWftR7iZM+v7ZY8FiYgbOwvfK3CPuM/eCj
 T7QOYsbS73JUxDJUpJKwavcav7sBCvfjmuZV21H0cXgR7Oj/ElDaYTiFZYw6YVJ3Pe9J
 LYX23N9GoRC0Wd1JLGsRrQYtZmftrALPQyX17TOp0s5k+iUXCcNzzRhYIlDImYjtpvoU
 4bp1ZmBJ1ydbxs8sP3ynBP5KD6Y9rAUbXdDzJeCdi8Ua3D0ViZxvtdH0wf46+AXLC63c
 nLoiQ7/WpecPIhfzJXuRjOnB9HfWbr4psHmCAlj7rWkZbwypsuCqu7Hz/I5TVPJA6YhO
 RadQ==
X-Gm-Message-State: AOJu0YxtuqmYrF2mN3vvKZNW6mgvjtThFfLcCuDT9F+yo+y5ymsunJjy
 69M+UVriiVuONYF91C7gWp8foqqkzqHJWlggX+DMz8SYSKme9NbX
X-Gm-Gg: ASbGnctXim5KiFxA/+2vdFD0hK93fW6dqXoLY/M2UuoNQ1a0tw5D3kpCpbsnjHIMlbb
 3l2NZxWmdvT39yihTq7l7KsI9mU8ZSCBvPUo8hXP0pkQCySsUnOHUO6YW5x+6/thDzCNL1eIgMO
 g/mNnT6CE88yWVd7nt1ubMCA1EsuM9P+sCKb0AWmBUakSUjj+YFCZv/cnaP6U/8haPxPywxarEw
 cXmFQQPwIacyo338WbiRNdOO3pKrFlCa7RVw3ZPMyShBNfcxFrUL1yAhlB4vx/oCKt0qx0AvYsw
 8v0SYSW/m02zN75ZytCy59O7buv/90WJ
X-Google-Smtp-Source: AGHT+IEFa1KPCMcGzEyD/hRk7PS2SrHoUwG+ZO38xq62Xc1q1Y49IyeCT37K18iht/eL0s/iJUhdTg==
X-Received: by 2002:a05:6402:90a:b0:5fa:9222:e875 with SMTP id
 4fb4d7f45d1cf-5fb700a2da1mr2080108a12.18.1746523651743; 
 Tue, 06 May 2025 02:27:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:27:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: display: panel: Document Renesas R69328
 based DSI panel
Date: Tue,  6 May 2025 12:27:17 +0300
Message-ID: <20250506092718.106088-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

R69328 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r69328.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
new file mode 100644
index 000000000000..1cd219b510ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R69328 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R69328 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # JDI DX12D100VM0EAA 4.7" WXGA TFT LCD panel
+          - jdi,dx12d100vm0eaa
+      - const: renesas,r69328
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for main power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+  - backlight
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
+        panel@1 {
+            compatible = "jdi,dx12d100vm0eaa", "renesas,r69328";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.48.1

