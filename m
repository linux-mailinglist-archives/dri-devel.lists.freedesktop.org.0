Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7282BC3D31
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FAD10E70A;
	Wed,  8 Oct 2025 08:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="go+WOI79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A24D10E17A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57b7c83cc78so721592e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912119; x=1760516919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OifoNvdWUvVz1qHCNeTwOsRbnki2weR8++KzH+uzE4Q=;
 b=go+WOI796iIyflnrrJqsjKTMWjzJe08Y9Zxslk1lzqB/rwJ/bZw90pk4tWwpVrcI9Z
 GdAcLTJ1bNndiyE6h0FcReqkxHpdkNMPIJxfHyDh+ifbQV60zrBzEsfsSjiRC4KdM0yG
 cuX0mR3k8cHDDghV8k/CfhtyQMZ9220cQngGp5E1JeultseVG4C2e2PKpZaXdTrHEXn1
 2HwPMvb2STJnnL2cSxr14bcZ9haKQIictPU/qVq3EJRKCiLxz/SjA5tf6hdKsBoj5qE+
 hmd8gmo8xLupZaX3VAYVKvt34LsYCBGmHW0s/7AO3Hh4kqWbQcjTKIuKWcRL+Z0c629D
 Okxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912119; x=1760516919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OifoNvdWUvVz1qHCNeTwOsRbnki2weR8++KzH+uzE4Q=;
 b=h5uGIRUTLM1qURNWfX+K/YuWvc3nkH6GSDvTOdX0UU4zrzEkd8zjPQDm+9V2GjAEQM
 D7dWaNofz4/K4kUcuAsuJjYcFR62FxGCSGMgqs6mMy/MLnSVXRopOMWYaQNkMiJ7rQkp
 pqkvFZUFAjviDD1ZCkDc3L0Guy2+FFpMcnKNZFEgtfQi5KSOITea6t1rCVjqty8mJ1Wq
 BC0Yokq8JC1vvnIDfHqCFoVD3Ny9jPSpeNAZk6xtQyjMm7y7f2aSIA1+ontT2rDhDZFN
 dL9f6nNu3epYN0h0tQFSga6LxK8Qd8+2o4QkJbQgA+P+furVX5vS6FFOU8JYDjMO4Vl8
 hd+A==
X-Gm-Message-State: AOJu0YxebHtLSOv56spIhYfh22ulWj9o3yCo1NE5/uzCH/ly7QXVXdB6
 2N+ga+o9fgq96Q5Tk5miOL2XEzBZbGcuKuLUsFgV3vMHKwr3+6Q6Fo91
X-Gm-Gg: ASbGnctS86Lm+cJChHYkmbY2BqHGml5V9vubuoRbLNIxzbEhKrP4raU2wJaOZueKW5T
 /K1y1zC/yLwB9D8O1s29BsH90pkOhdjsusBsy/TnfmnyH856e3fCACOCggTYd86gwRaYFSxv/h4
 nprFdzZJnVaQBP+kdv/bucPCCtFaw68yTVA9p92AeAR5yGl48tC4nTTJhW5zNPIsxihX8HX6iZF
 nr/EPT5SFLaYXvRFWhHEAI23+sd3TbDqZ3qVSL1/7pxBQt8vZVjz9lzxqsWcMoz2c28nCzEU4Kd
 v5u8LDs0hK4TxsU1Oqjcb1b/xijOiqVsYIjudWOdiyTgrIwOnfjSDjZFOjwoZRSPAAS3JOQTFls
 lyo7A9EkuCuQXE+W2h+YN4/ltw1+LhfzZnXNHFHMXC1uKBWUP
X-Google-Smtp-Source: AGHT+IHfIjb+vp+D8iidYlh2VgbHqf5szlozN2l0NR3ftIsB0ghBzmQUoPOzH+DwkkgGa53YEvsiXQ==
X-Received: by 2002:a05:6512:31c3:b0:583:9860:1405 with SMTP id
 2adb3069b0e04-5905e1d2d85mr1863965e87.4.1759912118491; 
 Wed, 08 Oct 2025 01:28:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Date: Wed,  8 Oct 2025 11:27:53 +0300
Message-ID: <20251008082800.67718-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
clearly is not. Address this by adding the proper schema for this panel.

There is only one user of this panel binding in the mainline Linux kernel,
which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway since
it cannot initialize properly if the bootloader does not leave a
pre-initialized panel. It also cannot suspend or re-initialize properly,
since no DSI configuration is set and it has a loose regulator which
relies on an always-on property rather than being hooked to the panel
where it belongs.

Tegra Note 7 device tree is adjusted as a part of this series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
 .../display/panel/panel-simple-dsi.yaml       |  2 -
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
new file mode 100644
index 000000000000..0a82cf311452
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Corporation 7" WXGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,ld070wx3-sl01
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vcc-supply: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vcc-supply
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
+            compatible = "lg,ld070wx3-sl01";
+            reg = <0>;
+
+            vdd-supply = <&vdd_3v3_lcd>;
+            vcc-supply = <&vcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791cc..f9f1e76a810c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -42,8 +42,6 @@ properties:
       - kingdisplay,kd097d04
         # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
       - lg,acx467akm-7
-        # LG Corporation 7" WXGA TFT LCD panel
-      - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
-- 
2.48.1

