Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597E6A871D5
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 13:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9AA10E1EC;
	Sun, 13 Apr 2025 11:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fNqmmNVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633310E1B6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 11:24:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so4340983a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744543454; x=1745148254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6Ds/WXwwOXS2LxRjboUIBqHnuT7BDVjPy/vBn9692k=;
 b=fNqmmNVMPqhLhAR6Y7KlNTCJyPm5XIboHAaVKmpqjGzP3uoIVRCrpHIPSPh27dQKdk
 AxdZqrVnwZRFW3VuV32cw+tMMJtDEayzGRBZRTmC8jWITx4abG0IpalslmunNvGjh6ak
 9gRjdjEN0/AFsgP7kN5siaohhzomMLTl+ESBO5MpmVoue6HrvXOQffNFFR/JwuI0dhYD
 9EIgD20lAs+B4+ESqQnZJE6B0k+Fvv1IJLg6L+HS+nqqYQAcBlEN2utct1y/uq3uKMA4
 7gYxibtxg7ETDvfnwYPTEvr+IKqcqWYkJ9NqNIuFRi+Zp2XaL2Y3aVUYWddAFpqqK1tF
 FEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744543454; x=1745148254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6Ds/WXwwOXS2LxRjboUIBqHnuT7BDVjPy/vBn9692k=;
 b=A1rfufJoml8hrkwFrLFH2Z6znZH1BVjJ/CWhcdc3Y6UlbAzWkkmQbO62sfnMHN8bJ9
 mwHzl2Iz2PodXKYpX+gAxij5ea12rXXcGEsxSf4kuCzModyMayc6sTPkgBw27d11TWj+
 fnWjPpRHOnMl1U6Geib3lMIk+vxh7btfvyfflk2zhkDkI/ubzOgL4wLx+8pjgGSQBday
 MXJj/FYzlc69bahQFQO/dOt0qOWwvSDjsABsN5urETHN00t6vZ7r9vmkfkeOX5OG9f/h
 9Wi5gDhYdHv2Be20oCCwTsYofIqGscbGJU6A48hY+zfeNLer7yoe9QmImHYzhTYpa1hl
 99pQ==
X-Gm-Message-State: AOJu0Yzi0ZSzmJxhkeV8CteldE4HRApxVGdLKFh0EGZGBIz7fD2ln+9H
 f1WfiqQPDQOBf/Z/nRqJT/0hzQ7I1iS4rds4dVE+yzBnhWh6iQyF
X-Gm-Gg: ASbGncui3kUh09N99Av853lMN5CWoF/QfdJw6kBbyps+e8PgSo/dHcK7HDXTCgQfEYh
 +a246wSE27+I0X81e10IAjhDknXpm8Uk3B8lTgYtKR4sC5qhSMbUgQNVNnBG0HFRDN1G/Pvq+U8
 pzz9QMV7WDEzIpgBhHvOVfFtELQSAvBkab7xtNyofjHgOBmKCAj6QGna1icbDurZjx0Pe8AR0bU
 Q9T5wpije0n6cxnoUIlDKe1WDbtw/Cv4J7S4WLg3xAjdkZZeHgKzmp8x5F+U1yb7dMO+KEfZjCl
 5TPzbG7UOWsfkUyfGgLkqZXAjMQwG35g
X-Google-Smtp-Source: AGHT+IEciaIr06kOGR0nnPGbDPXpYxMvoKnc/ismTVRije+f6q0ejAbezKsUQPswyctMJNJNmBjphw==
X-Received: by 2002:a17:907:7245:b0:ac2:84db:5916 with SMTP id
 a640c23a62f3a-acad34d88b2mr697806766b.31.1744543453888; 
 Sun, 13 Apr 2025 04:24:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4110sm733529766b.91.2025.04.13.04.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 04:24:13 -0700 (PDT)
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
Subject: [PATCH v1 3/4] dt-bindings: display: panel: Document Renesas R69328
 based DSI panel
Date: Sun, 13 Apr 2025 14:24:00 +0300
Message-ID: <20250413112401.12543-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413112401.12543-1-clamor95@gmail.com>
References: <20250413112401.12543-1-clamor95@gmail.com>
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
 .../display/panel/renesas,r69328.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
new file mode 100644
index 000000000000..1c1ce5ed6f2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -0,0 +1,72 @@
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
+    enum:
+        # JDI DX12D100VM0EAA 4.7" WXGA TFT LCD panel
+      - jdi,dx12d100vm0eaa
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
+            compatible = "jdi,dx12d100vm0eaa";
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
+
+...
-- 
2.43.0

