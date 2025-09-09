Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40CB4A3DA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EEA10E63D;
	Tue,  9 Sep 2025 07:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J168oce6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9025510E63D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:38:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-560888dc903so3224236e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403524; x=1758008324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lfcXfQwIS1q2h0Snb3/3x5fJy2fTu1tfuelexkpbAQ=;
 b=J168oce6yGraNHSyvVbes1/92ixCUGZScf8grKOdQuvVJ8ceqSDjrvnWAZu9OFGO4O
 qUrkZm7MIMZWs7qzQVqZNLghus4a8XrRo5tNvU1zpFXkinx9KguWQud/n3Pkg1FXh2od
 Kwm5qhrCFGRl64hbNykEyXTWiNWjGw/6hioLCAPD3VFsFtkVRYqiJ+ebJFts1g2KRpx+
 2uCG3avRIGRALdZ26KklDd4344wg+s8FEzuVPOx+RKClb+WLk1Ebm7s4TA/tkziNkHY5
 fDw6LTt8q1kO4+bvEQBgwOeQkwwk5k1L3dxXhhbBkas+jcbEvBeL8qXaEghw1JM8ZYhq
 EO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403524; x=1758008324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lfcXfQwIS1q2h0Snb3/3x5fJy2fTu1tfuelexkpbAQ=;
 b=hduY4RAIFejK0JoDPHSG629ZvFy9bKpmB3ks5h+Q183+/EOHHj5IHtKw3I8oFP6+0X
 xgmMb2HChJjCcdsIc0q2cUSRTzeV6hIawafLLYM1TZNvGzyKSLvcHPzA6KAile9WBOC2
 LD7DIblGeptsF+W+dUEUlk8vgiiEPffuE3Kvmf3BM8D7eBcwiG9xmFdi5auIEV36j91k
 OHC4Kd4hpfQwB1xgt9unGewpie72yNaU7hJAqBGEcyibkhFQvby3NLqPnoTl06BB8lSu
 HKJYiQXacPMY9Hb04YVWc5tSCiOaYIeV5MBGgC3nwT8viTeELgXRI8OWxhefCPUSwaFv
 aOtw==
X-Gm-Message-State: AOJu0YxZpDSIevQ33uNDoEe+p95k+sTsj3w5vJhXUZvK1c0Q0dyIA4AU
 g/l1NiFem2JV2uybV6DX0WDUoL+gjnBZohZdxsQnUmHBBr6Fz6ycWTFT
X-Gm-Gg: ASbGncsrAOp1ARW/i/0eprR0oC+z4jE5w8kTSNLFTN09Sm8OmC7GyAYzy2riC84Lx9H
 xW4+oJjtcR0sTk3rQr5Kux3GyQbZAFtWpwim6eM/1g13ZYg0q/JbPXVXuUbu0Zogk9yQD8QuBlu
 hB8IgmPPRP0G+1tK/l+elnp1gdviyDMiqAa97JKxR+MknwxyaVJYtABXB+50hRAerUtiSwOChAV
 9tN6E62Tzw6lW+iZ1k4eV21bJZS67ObpsvA+d4L4+kbJEIZlhINXBJNzGneTUcYWHgTezXQajOz
 odv2OEHBoAdFI9GYt5K5KsHNP/681O4NRwuatsZE2p1Uvbc76zdr/ZyJKQGyQqs1lzYEBA/Mv25
 wTkBEu3Zgwfv46A==
X-Google-Smtp-Source: AGHT+IEaVfapd5iBYsDenlEZ5XVTtYiiiy3FO4SXIJNtmFVMalV0u1BpsRCN0qcks6PSEkDajV97zA==
X-Received: by 2002:a05:6512:3d27:b0:55f:4efe:42d0 with SMTP id
 2adb3069b0e04-56264167ac9mr2795515e87.41.1757403522236; 
 Tue, 09 Sep 2025 00:38:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cfe2496sm342580e87.61.2025.09.09.00.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:38:41 -0700 (PDT)
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
Subject: [PATCH v1 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
Date: Tue,  9 Sep 2025 10:38:30 +0300
Message-ID: <20250909073831.91881-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909073831.91881-1-clamor95@gmail.com>
References: <20250909073831.91881-1-clamor95@gmail.com>
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
index 000000000000..1dbb4a4bb772
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
+description:
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
+    dsi0 {
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

