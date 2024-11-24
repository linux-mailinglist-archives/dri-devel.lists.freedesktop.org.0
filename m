Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AFB9D6D0B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 09:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E2410E198;
	Sun, 24 Nov 2024 08:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V652W+PV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E627F10E198
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 08:03:21 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-724f1004c79so768096b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 00:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732435401; x=1733040201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BH34sqlSKOe9iOZou+43GhfbA7c8h+EbLyzmlovlj4=;
 b=V652W+PVm+Jbv7XRzqWP/+9uKp3H1XT9l5svMWRH/yfv1znVUopz8EiAFu0MzgOBTL
 gmzsZwrdRMez4OXojJOGNwKke/QNaa28SdqVslM2UzJIWwbDraXUmuKZdnflhwegt2BU
 r8j/xX1kSE6hfMHAcoF2ahA1gMoEo8P1je4RM5klvy+FhM3wkUfpZxE02lDHA/jQ05fz
 uGrSE5CvOs46jisQV3WSuDMwBos8jOzT4VSQG2/GPkvh5LZmhdeRO9yT+/mFIX8hYFbm
 IDipx6PUTooeHrioKMRY4imLJfkHQ1mcE5ppqyexCxgst3JveRgUGvDr48ClDIy9v7rz
 E3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732435401; x=1733040201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BH34sqlSKOe9iOZou+43GhfbA7c8h+EbLyzmlovlj4=;
 b=NQy8uGMB6mpy8L5lJunnyyCVlybM5asQgRMr8RTzqRjkuXt3HsfB0+ghGHJxZrYKJm
 TZelDqg4KxmT0tycChiyVCjzH+ds9NDSL4ZUikkQnrRK9bLW8lcHAKcLs0MSMe1BQISL
 TiYzHyyJ6ZURR5gY97pPhZVei3/gU0ortWL5szcXkpkQ5H8HSL5laksJEVOG4Kvlu153
 2kv9bHENJiaViA8dbxbjy92TJ0E2XVRPDnod6AqRX7GsYglrDmh+ED0nBQdips7v2diL
 HPUD2xDhVWUBp534gD/ktVXKHTahrHcqQ2SUqBBoc283JB9SzRBch4sVTmjfbv2i3s0w
 QpzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc8/0usYP/UfW4uqE0YO1MxwMaRACYdWbo5ER75IuVleDceE70+MattRI/CRzcmgpfLwX5sH9lD9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzbdqeYIYYS8oM02T/uUXN9A541XO2VOFTxYsJaOmWj6bxvqKC
 3ugsa6n7euOodbbic5j5tigifkHnOAzMpDwtNT5w7ULopJfQTAzt
X-Gm-Gg: ASbGncuvAiut6imsYzBTbpR3dB2CjedunFQTQEE9ecXpspxlx4NC/6B1i8C1zUA7IUO
 KqkdIyK/y7WTDk0QrBQBBSg2v1CByNBziLyXFKH5r7YygOXP9gQlp2dEBM+AaDl2NYxrK8AX0tR
 YjHm84lDgj6LK7lMdUh27rRo5kvuLkcoGhqxXQKeUMIzQ9XJLH9b7qLkQC2CxOEkBZsF6fG3RKA
 FgQ6ZDP8HAgkN/mrL8XH9eI/GEIbHY4QCzX3aWUI5xHe8+g1C/eblTeDp5hcoA=
X-Google-Smtp-Source: AGHT+IGhvZ9kwy0Xr/geb5tz16xfptX1YZTk6nh2OmyjAzk03SO8bAiB+Y9rTFNC9wmMHaz163RmGw==
X-Received: by 2002:a17:90b:17cd:b0:2ea:7368:3359 with SMTP id
 98e67ed59e1d1-2eb0e126a6cmr10208596a91.5.1732435401445; 
 Sun, 24 Nov 2024 00:03:21 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead03de6f6sm7956708a91.34.2024.11.24.00.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 00:03:20 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: display: panel: Add a panel for RG CubeXX
Date: Sun, 24 Nov 2024 17:02:16 +0900
Message-ID: <20241124080220.1657238-6-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124080220.1657238-1-kikuchan98@gmail.com>
References: <20241124080220.1657238-1-kikuchan98@gmail.com>
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

This is a display panel used in the Anbernic RG CubeXX, a handheld
gaming device from Anbernic. It is 3.95 inches in size (diagonally)
with a resolution of 720x720.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../panel/anbernic,rgcubexx-panel.yaml        | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rgcubexx-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rgcubexx-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rgcubexx-panel.yaml
new file mode 100644
index 00000000000..47c5174fad2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,rgcubexx-panel.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,rgcubexx-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic RG CubeXX (YLM-LBN0395004H-V1) 3.95" 720x720 24-bit IPS LCD panel
+
+maintainers:
+  - Hironori KIKUCHI <kikuchan98@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: anbernic,rgcubexx-panel
+
+  reg:
+    maxItems: 1
+
+  spi-3wire: true
+
+required:
+  - compatible
+  - reg
+  - port
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "anbernic,rgcubexx-panel";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+            backlight = <&backlight>;
+            power-supply = <&reg_lcd>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&tcon_lcd0_out_lcd>;
+                };
+            };
+        };
+    };
-- 
2.47.0

