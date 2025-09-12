Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EADB5431B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99F210EBAA;
	Fri, 12 Sep 2025 06:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJa9Q27z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315210EBAA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:43:21 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55f720ffe34so1887747e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 23:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757659400; x=1758264200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nN89bcFCx4v1Pxsb1bcoAge9Deec1dGBruVjoVQpQco=;
 b=JJa9Q27zjvHHnqk7KcVl/sH39XlE3+pAXgpqh45IoyO5fPcGWRpBcUu5ClY7eL2b8N
 WsFkXlHnDJdGw9Ldr5Giovh6IOiKVviB4tMpLGq6ze4YruHaOoXSGyEqdhBgnFsBL85D
 WEVxs5qkLSTdfTlyXla52/aWTnF5aI0VPzueTnA/2XPDUXv4f1QPIDa9cwt451CqL1HL
 qKWpJ4DgtB/0FHZYOwveNb1PwgjLAXSzW8oY1bba0PMyA7niyCtx8TCO/e7o0I7Q2hNU
 QMjS3GDuzrRb9F+LLhSVQbniswuMr6rRfPnxzIMMdO57So5c4O/YixhQebxVJqy0ICMR
 pHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757659400; x=1758264200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nN89bcFCx4v1Pxsb1bcoAge9Deec1dGBruVjoVQpQco=;
 b=MdexhGPdTwR4DBsul5OoFeoRG7hyYVXBMwVnxMXDXWKGQothQJBeHsdT3vs0wOfAJq
 EK9adGQcO8zf+20Vu+EMuI/0eypMCMvqGEK/pUcRK9rQLEHM01QSfgAt7DNrp/d03q+G
 KzX8OLoM5cG3JbI+w1hGHhno7TNp3D6Ul5g7R2vWKxHzXw2j5HEDWFXssojSBAMIP8+Z
 K2YWNqk6ChWh5YPT5h/FfhhGt1PUcFlwe5xXWEfZTA2bclNu6Y5TQDgYbvDnpjC0EidK
 NcPKxaQo005iz9TxZSR7yk+gjRkqnvtt9omzqS4OF4DxqwXTm7JTd+xB1LF5wSZm8BEc
 sFPA==
X-Gm-Message-State: AOJu0YzIH0ppxTrbemtqgAhzX2vzMLmOioaf+08LSD7hW9GjC4B8dLgx
 x0h5DVDgxPlM8wAsjxNgYogOcipb7GucjbGNaud6+Xi1JdVN+eB9rnys
X-Gm-Gg: ASbGncvoS8gPHd1ba9lmdm8qXnJgZkq5FsVy38MNx7gHwJhzb/NmWPNDl96BpewKjc0
 MG7aWCD/7sPlHQW96JuSzcPqitZGDhEUqy/rQgWMpe+MduJpol8r1roat9Y6Vo9QU+JvAIgV1N8
 25TsqdnI1+ai276TWygzSGMkRgiFCzAtCkv4tPAOMw1k3oxjbId+1nE2SKQV1v4VNiduK7kCuGi
 Pzc2avKiXpqk5mv8dJonTELdYB7opObotBl430rmobP/0Mw1ByEppHB4QlkP+JIvN7yeDSR/xf+
 Y935hXQHeNIVLlrFaVOyHL6MMH4oKY63naSuThGjzXuM1O8niTqBHLKOu3ZtVS8yR1WGfFHnMN9
 EAz0imxYvn+Ykba5QOSKJ2k4r
X-Google-Smtp-Source: AGHT+IGmhrlM+wuGin0oxlClzG6X+S6fBnECkDrMAoDVE+lAyQ7VTk7EelsJsJx33vrlPfBtJzvpWQ==
X-Received: by 2002:a19:6a15:0:b0:570:a8d4:a79c with SMTP id
 2adb3069b0e04-570a8d4a962mr411565e87.0.1757659399292; 
 Thu, 11 Sep 2025 23:43:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e64bd15e6sm917403e87.116.2025.09.11.23.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 23:43:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
Date: Fri, 12 Sep 2025 09:42:52 +0300
Message-ID: <20250912064253.26346-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250912064253.26346-1-clamor95@gmail.com>
References: <20250912064253.26346-1-clamor95@gmail.com>
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

Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/sharp,lq079l1sx01.yaml      | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
new file mode 100644
index 000000000000..08a35ebbbb3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 7.9" WQXGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: >
+  This panel requires a dual-channel DSI host to operate and it supports
+  only left-right split mode, where each channel drives the left or right
+  half of the screen and only video mode.
+
+  Each of the DSI channels controls a separate DSI peripheral.
+  The peripheral driven by the first link (DSI-LINK1), left one, is
+  considered the primary peripheral and controls the device.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: sharp,lq079l1sx01
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: regulator that supplies the analog voltage
+
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  vsp-supply:
+    description: positive boost supply regulator
+
+  vsn-supply:
+    description: negative boost supply regulator
+
+  reset-gpios:
+    maxItems: 1
+
+  backlight: true
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - vddio-supply
+  - ports
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
+            compatible = "sharp,lq079l1sx01";
+            reg = <0>;
+
+            reset-gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&avdd_lcd>;
+            vddio-supply = <&vdd_lcd_io>;
+            vsp-supply = <&vsp_5v5_lcd>;
+            vsn-supply = <&vsn_5v5_lcd>;
+
+            backlight = <&backlight>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.48.1

