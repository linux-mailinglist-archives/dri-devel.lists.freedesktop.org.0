Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B788D6EFA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA84410E082;
	Sat,  1 Jun 2024 08:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Ulm+rEtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717810E082
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 08:46:34 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-702555eb23bso396815b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 01:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1717231594; x=1717836394; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BWMKP5LFlkDOSxfrnz5yHlOyMbunRcU9qIKa5/oOPUc=;
 b=Ulm+rEtQfxkVQJPYE/1A7/SbS+AxLrwna2rAUgrgyquFdxVCgxLIgndkrUAycOx0x6
 X8NHmZeYmoPlb5dBioWJvXrWRiBLBEqMo8KkPsg6JG8cDtaPxamWNr+SzCXCTO/j7Vgz
 NVqzwYFFGkwVZRh6mes9TmbsNVF8JIM0/bANlndlv5Q2hNhDFrj8sZAQ7aO85Lx7wycJ
 889njxroLBIaqDMJf93yRMiNILSUHxxlud/t4B1vww57jHZzlpcApx+53xwHNVMSBEOS
 EGlPeHGADBRoFcdpu8MburRcueHZR7FYZqDfQL0i/GTGE1UbpNUE1/kIDPgvEpwA8LTs
 8tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717231594; x=1717836394;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BWMKP5LFlkDOSxfrnz5yHlOyMbunRcU9qIKa5/oOPUc=;
 b=NFGDV3TqJg0q9bh1aAhqyqHBrb4Ajex/zjf0OIvIyLiwii4fyWc1peUOYFXVE8HCNJ
 edllIvXU/soxV3DmQ1gYQcjeZRjR9kPwh9VKw14niJwB3Q+MZ2FWGjhS3mVVlCs00cm7
 IfLM3VgclL6m/3vov0/35QdJPVuJ1uQkaahMOTJEaRMs6wtQSRkgsA8xZB1dWHtyoISF
 SDrEqz/ku7JQypcSLshteCvVrSWIuPFFZU3HvMOfErOPiyt2MjS+M8R/jbO0ZgmqL6ej
 nfzlmusP4rpL+b54Al5vCoKTd8KnLcfkhjW+LXZ7jXNlQNbxQicGdXn7RidVwydqv61a
 X03g==
X-Gm-Message-State: AOJu0YzawCh/l73RKHw3/4TWzVj46gyhaf086xLb7IGTq5t8cxPSI+UT
 Ss/fvuEM2J+xPX+oITvmyktiyWhH1X7dI2hC+zj8j2t0yXHPPoY/t39Cg5JC6yY=
X-Google-Smtp-Source: AGHT+IGXPuE8dbUUxqNOYjw6L1iImTMU+Bb7Ncc2SHFeKOzPZbY2wYMNuci4TbwP5eGNNmY//5z8yg==
X-Received: by 2002:a05:6a00:2e90:b0:702:56c0:299 with SMTP id
 d2e1a72fcca58-70256c00467mr1173669b3a.20.1717231593905; 
 Sat, 01 Jun 2024 01:46:33 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-702423c7b49sm2512044b3a.37.2024.06.01.01.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 01:46:33 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Add KD101NE3-40TI support
Date: Sat,  1 Jun 2024 16:45:25 +0800
Message-Id: <20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Create a new dt-scheam for the kd101ne3-40ti.
The bias IC of this kindisplay-kd101ne3 panel is placed
on the panel side, so when the panel is powered on,
there is no need to control AVDD and AVEE in the driver.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---

Chage since V2:

-  Drop some properties that have already been defined in panel-common.
-  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it

V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com/

---
 .../panel/kingdisplay,kd101ne3-40ti.yaml      | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
new file mode 100644
index 000000000000..b0cf12bb727d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd101ne3-40ti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kingdisplay KD101NE3-40TI based MIPI-DSI panels
+
+maintainers:
+  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - kingdisplay,kd101ne3-40ti
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  pp3300-supply:
+    description: core voltage supply
+
+required:
+  - compatible
+  - reg
+  - pp3300-supply
+  - enable-gpios
+  - backlight
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: panel@0 {
+            compatible = "kingdisplay,kd101ne3-40ti";
+            reg = <0>;
+            enable-gpios = <&pio 98 0>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&panel_pins_default>;
+            pp3300-supply = <&en_pp6000_mipi_disp>;
+            backlight = <&backlight_lcd0>;
+            rotation = <90>;
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
2.17.1

