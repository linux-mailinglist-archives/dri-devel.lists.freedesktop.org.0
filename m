Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA612A23997
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 07:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D57410EA1B;
	Fri, 31 Jan 2025 06:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KhWvy5aA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA1410EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 06:44:30 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2f441904a42so2846194a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 22:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738305870; x=1738910670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1vbTosznX/93FTUwC4S9oeX4Wcs8MPx5CjhjQszTJM=;
 b=KhWvy5aA1qYkO/0Oe2gpjDsDqx/KG+2+ZWNfvpcgzefpdknzadWrPfUU8eW6378zfH
 riOihWVWgSDW51LIrfPcaSSVZEIIpnfYDGDVLuW80iUN0H89jzbsuhNg1zXtEacgXAh6
 LbQrbeiFzLa6rwhL8bVfMJChV2QwiycR7okb/kMi9+So4bPDjohYkcHnr+SDzypFNF/s
 UbrGoPB5YJy3/p1gt4gzfhkUxaXyPcWYAuBQd+49sgG/H/hu/e3L8U0pG2HsqldGfm+t
 EuH3UmT6WZYnRw8AfZfzMYL9Ar+B76llm9AQvl5iTHW5EPO71VC5ZnwOT8BHfNDnIKGT
 +Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738305870; x=1738910670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1vbTosznX/93FTUwC4S9oeX4Wcs8MPx5CjhjQszTJM=;
 b=Jc8qSiqReCGt0YiGHZSgWnpTMALD2/CLGseeM3xGsjumxJBDM4epmlOvc9cFcJY7mh
 7PQsswf7IPhFSDnniG8xwKAjsjUlzYmxC8Yffo5dlFdMfgLSGAaxnH9JibeKWz+81i5J
 G/ZknlX3tfQhxDIddRQ+iXXotPt7gdOSeWT0WezYoFufABJYGf15UZKsWt5CqKc4sHOK
 2HXv2vWsFtf3mCti2Apwuu7UMWIp9pZnrvzA7VGeC2LmabtcgIpOdTDrPFPZS55Lc/gs
 N1tiFboCHL3BHMN9CV4o4evM+R/zy/IU4DPpPjigPfXaItwTNcP+nUVyXilGwvteGjsG
 aPuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYdnJzmYR3slqAYxy8DWa++VBHDbh1Ve+ZAel64+MLKsKKYRp8kkBjsgTMgy23xHut/xRFwcMk8F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx5qqHVCFwm4k1W7QpiMiM4EmcjBrgHuE/ht4gOyZDs3AUm2fR
 madkJrblWz95B4mBuQaQRAehkWG4T5pBZquL6FsE6fi9IBL9L1RI
X-Gm-Gg: ASbGncsUwP30zq2smaTkKsh3YaLkyckyornBT6w6YnFUzAijlBi5ugEkuUbkNTwmxrY
 cCWaegCZBHXY/ard/NSrhmoamPAXPfYRCRTkP4q3pwlQl4YDQvZj8q1MpeyE9Ucn5h4aqkXJ++1
 c9hYssuI3WdFLO72gbHgh78don3/X4rbmb4Rm8yOYGOZJ/qt6Mxq07+EczdVTUrBun5L1C77qz7
 8+nr8/BYT+1+zzS3GGVEeskYnZA10UzyVQOmbMQMURmZtu2TiBVWcShd/EliKF0tOz3yR/s2/F+
 0tod9KLUn44f7UpYS8C+wqGSi6Q=
X-Google-Smtp-Source: AGHT+IHGxUlsGhp7wUUYra3XimaYEg10mWNL1Fr0GHj4XpVFVFx3iKAmpTXnQfZxrOWWPh9zbbR/KA==
X-Received: by 2002:a17:90b:3a08:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-2f83aa7c6bemr18833079a91.0.1738305870147; 
 Thu, 30 Jan 2025 22:44:30 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bfc0ddbsm5098947a91.45.2025.01.30.22.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 22:44:29 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add generic MIPI-DSI/DPI
 panels
Date: Fri, 31 Jan 2025 15:43:53 +0900
Message-ID: <20250131064354.4163579-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131064354.4163579-1-kikuchan98@gmail.com>
References: <20250131064354.4163579-1-kikuchan98@gmail.com>
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

This is a binding for generic MIPI-DSI/DPI panels that require
initialization with a simple command sequence before use.

Although the `panel-simple` binding exists for generic panels, it is not
suitable for panels that require initialization via their communication
bus, as such panels cannot be considered "simple".

While many dedicated bindings exist for such panels, the generic panels
are not complex enough to warrant a dedicated binding because they only
require a "simple" initialization before use.

This binding addresses that gap.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../bindings/display/panel/panel-mipi.yaml    | 244 ++++++++++++++++++
 1 file changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
new file mode 100644
index 00000000000..681614333d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
@@ -0,0 +1,244 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MIPI-DSI/DPI Panels Requiring Initialization
+
+maintainers:
+  - Hironori KIKUCHI <kikuchan98@gmail.com>
+
+description:
+  This is a binding for generic MIPI-DSI/DPI panels that require
+  initialization with a simple command sequence before use.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - panel-mipi-dsi
+          - panel-mipi-dpi-spi
+      - items:
+          - {}
+          - enum:
+              - panel-mipi-dsi
+              - panel-mipi-dpi-spi
+
+  reg:
+    description: DSI / SPI channel used by that screen
+    maxItems: 1
+
+  power-supply: true
+
+  io-supply:
+    description: I/O system regulator.
+      No need to set if this is the same as polwer-supply.
+
+  dc-gpios:
+    maxItems: 1
+    description: Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
+      Disallowed for DSI.
+
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+  display-timings: true
+
+  reset-delay:
+    description: Delay (in ms) after the reset command
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  init-delay:
+    description: Delay (in ms) for sending the initial command sequence
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  sleep-delay:
+    description: Delay (in ms) after the sleep command
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  backlight-delay:
+    description: Delay (in ms) for enabling the backlight
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  port: true
+  reset-gpios: true
+  rotation: true
+
+  backlight: true
+
+  init-sequence:
+    description: Encoded initial command sequence.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
+  firmware-name:
+    maxItems: 1
+
+  dsi-mode-video:
+    description: Enable MIPI_DSI_MODE_VIDEO.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-burst:
+    description: Enable MIPI_DSI_MODE_VIDEO_BURST.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-sync-pulse:
+    description: Enable MIPI_DSI_MODE_VIDEO_SYNC_PULSE.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-auto-vert:
+    description: Enable MIPI_DSI_MODE_VIDEO_AUTO_VERT.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-hse:
+    description: Enable MIPI_DSI_MODE_VIDEO_HSE.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-no-hfp:
+    description: Enable MIPI_DSI_MODE_VIDEO_NO_HFP.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-no-hbp:
+    description: Enable MIPI_DSI_MODE_VIDEO_NO_HBP.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-video-no-hsa:
+    description: Enable MIPI_DSI_MODE_VIDEO_NO_HSA.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-vsync-flush:
+    description: Enable MIPI_DSI_MODE_VSYNC_FLUSH.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-no-eot-packet:
+    description: Enable MIPI_DSI_MODE_NO_EOT_PACKET.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-clock-non-continuous:
+    description: Enable MIPI_DSI_CLOCK_NON_CONTINUOUS.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-mode-lpm:
+    description: Enable MIPI_DSI_MODE_LPM.
+      Disallowed for SPI.
+    type: boolean
+
+  dsi-hs-pkt-end-aligned:
+    description: Enable MIPI_DSI_HS_PKT_END_ALIGNED.
+      Disallowed for SPI.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - panel-mipi-dpi-spi
+    then:
+      # SPI mode
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+      properties:
+        dsi-mode-video: false
+        dsi-mode-video-burst: false
+        dsi-mode-video-sync-pulse: false
+        dsi-mode-video-auto-vert: false
+        dsi-mode-video-hse: false
+        dsi-mode-video-no-hfp: false
+        dsi-mode-video-no-hbp: false
+        dsi-mode-video-no-hsa: false
+        dsi-mode-vsync-flush: false
+        dsi-mode-no-eot-packet: false
+        dsi-clock-non-continuous: false
+        dsi-mode-lpm: false
+        dsi-hs-pkt-end-aligned: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - panel-mipi-dsi
+    then:
+      # DSI mode
+      properties:
+        dc-gpios: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "vendor,some-panel", "panel-mipi-dsi";
+            reg = <0>;
+
+            port {
+                mipi_in_panel: endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0{
+            compatible = "panel-mipi-dpi-spi";
+            reg = <0>;
+
+            spi-max-frequency = <40000000>;
+
+            dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+
+            backlight = <&backlight>;
+
+            init-sequence = [
+              01 11
+              00
+              04 b1 01 2c 2d
+              01 29
+              80 00 00 00
+            ];
+
+            width-mm = <35>;
+            height-mm = <28>;
+
+            panel-timing {
+                hactive = <160>;
+                vactive = <128>;
+                hback-porch = <0>;
+                vback-porch = <0>;
+                clock-frequency = <0>;
+                hfront-porch = <0>;
+                hsync-len = <0>;
+                vfront-porch = <0>;
+                vsync-len = <0>;
+            };
+        };
+    };
-- 
2.48.1

