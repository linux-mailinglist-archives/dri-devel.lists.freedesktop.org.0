Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD59D6D07
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 09:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4225B10E2A4;
	Sun, 24 Nov 2024 08:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="frDubxfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A152F10E198
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 08:03:13 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2eb1433958dso1563839a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 00:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732435393; x=1733040193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyN3lb5o5xZdLZFjo/taUmbi+nBHaQ8I8tpHgqQH4t0=;
 b=frDubxfHuCc4fEt70w8XKguZOdMMz14lT3n/bbIR/e/Kab19JURQLzK/TPISI8AEpj
 qqi3J8GEqwhq1thT4JRtR8PhigN4hSvXbrEGD1foulirDvD4fAiI+FhkASB0W4l79vF6
 Uep7k10Zwtz634yh2T34NyHgSexLhYmr82pBeVjmUSnqtGQVbBaK2/KY5/zODH3oS5Ei
 chTy2Ru3K7VIVV6e/fhWJ9AcsGGp94pMR4Q0N0ReWVibFlecf8K7asJ+VRkXsHBSyihV
 spyROKZS86OkWlLwzFVhj+Wv/aNzcD+QUejn7L+43oIlZLhgtXUmygWEjpekR1Fyz21i
 5A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732435393; x=1733040193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iyN3lb5o5xZdLZFjo/taUmbi+nBHaQ8I8tpHgqQH4t0=;
 b=YfhWOw40nPFwcOYTEo2jc1HYI0Vc8UvrqmzOuBogu3n/IiSrVdfiDUe7UJUPZUMABe
 c6iBElMHwjybSmUBfKatDYvd6lbFbhhsd8bfJtbx8e5XyYZRydIq06f7q8g466hfxjjQ
 TP7EYBn2I/kE5zWou7r8DFt39qU3BY8lmAMzfyLhN65Qoci8AOM/equTyeOoYnBhsrqL
 0xUjpXWZ2CdEREF7qPrgn2DCYHiCWTJzi2YgobEKvZdIGjnGqD6TE6WY/titPJRwWJ6A
 X9mrR4wZK3kGRQNNvfV+3jEgvoBmKK5GbJn5RbO6KoU6TRhSUJOOT7man1baaWDqExeg
 ntSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTchTDu8NpWVn5XDN0gnMuuyEkXQ1GIJOdgod5eKcOFqhg99GqN//9qLXvS4E+oB3bTVcKgn8eKDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAioL+/5svOu2PPU3KjlTS0y4IKK0Nuyxw358KKHL7kanO19rp
 HghSIra7IKN2wsNvSFUrAwIXFAzXXlfm9pGiUvi3Ro8RKu43SOVp
X-Gm-Gg: ASbGncumb/nGwhNQwZW7fagm+8RM/S6zz/0hvGhwDy9IUkUlFn/yfP8b6AosTtTDgNu
 AMJEb+u5Ut9Kclp7z0Uqsl28xcA1xCc1OHwlzfUWS33vPUwwlymcbQ7Mskk6M8fAUwu35LDGZXG
 PyuIq9yKVTaKAto4p7FTUP2gTzD/fvsD+Tw3AHSFk4QI7cBamk1jet6SflY/FdAhkG9xz+NvjyL
 QVyh4/6AspVsp6XIw8TST4JDlyBEzZtTCWLhB6l4csPlJs9RUpCdXx14uPBr5k=
X-Google-Smtp-Source: AGHT+IHm7fTQFFW7HR2+//ajs5yB9voo7Vxd8MOCqrw1gY2F4ee0ZrKdNLDFYAHMj9ASYYKS7Gb1JQ==
X-Received: by 2002:a17:90b:17c8:b0:2ea:8e42:c46 with SMTP id
 98e67ed59e1d1-2eb0d50eb9dmr12049101a91.0.1732435393155; 
 Sun, 24 Nov 2024 00:03:13 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead03de6f6sm7956708a91.34.2024.11.24.00.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 00:03:12 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: display: panel: Add a panel for RG40XX series
Date: Sun, 24 Nov 2024 17:02:14 +0900
Message-ID: <20241124080220.1657238-4-kikuchan98@gmail.com>
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

This is a display panel used in the Anbernic RG40XX series (H and V),
a handheld gaming device from Anbernic. It is 4.00 inches in size
(diagonally) with a resolution of 640x480.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../display/panel/anbernic,rg40xx-panel.yaml  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rg40xx-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg40xx-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rg40xx-panel.yaml
new file mode 100644
index 00000000000..bec5363e1d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg40xx-panel.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,rg40xx-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic RG40XX series (YLM-LBV0400001X-V1) 4.00" 640x480 24-bit IPS LCD panel
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
+    const: anbernic,rg40xx-panel
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
+            compatible = "anbernic,rg40xx-panel";
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

