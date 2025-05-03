Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE033AA7FB3
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323710E380;
	Sat,  3 May 2025 09:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjoF1/10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D310E0B1
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:42:09 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1c6ff8so4644090a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265328; x=1746870128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZ5+vrBCZf3qnHzGM1XFaeuPMPVV5JXl/VDzCLGAaZ4=;
 b=FjoF1/10U6v+ERI7bbEIlIpyc7ddvbCLCqMkDS40xaYbh/SHtLEKzO3A2g+UgrYrGK
 bZOLTe+miWJTq0VH7Eq0ZblyE3LMFc2to6lMs6m2VEqkUyo8SsYS3hhS6uLl0aBsvsC8
 9e53bwMD37A5ZWR8qvok/cUHDsSHoaQ7Th3+JatcumJOgGE11KH/w7eloU8xKPtJF14F
 3tf6j5DsnG+tPdSEEtrZsS7WWPFr4rFZAEdnVDHYvcSh/lsa8E4lMO4N1FqaIlIlk2g0
 X/WPKhRl2B0DZUKFb1YEv+sLi0xLLKnUlmk6uk0K8Uifq3bE47pegmQSjnD4fpwxMTla
 kWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265328; x=1746870128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZ5+vrBCZf3qnHzGM1XFaeuPMPVV5JXl/VDzCLGAaZ4=;
 b=b2eX3XkG+XTs8JlFZF0qMnIaqzQ79TfQNqACG+LlhRTfC/2h3aGf+WmC1Ockx3SBgy
 e4Hp76jD4A4S4W2TXCOOUvx2adwoN8Y5KZwZvr6I5/toG22uupMs2ZieNjMrgCfs/Hwl
 9YJcbJK9F+Y2mpoGpXAglYG05ORK1r4mw7XmRpc6ys3yuEaBZWvRQvCEGzVh4To9qeNF
 tzLPxTsJ+BtPs9GmCUZZOSf0BlxiiQkjV7juywSoe2AkcFJCVyqK79TJGP1K8IBS57or
 ykcQGXr7H1mOi+KWqA5iD2aSt42AyeCVefK09y/v4XsXkZr30iVRq+CnIKnLaMco0M0K
 v8hg==
X-Gm-Message-State: AOJu0Yw8eYTM2rjyyOhO7ROB826PRXWdnYHanmCxc5Kc1n0tJBR1XvVS
 xTD9lYrgG73upqGK1PDOvFORZTbk0lD3L+ILKAbf8l5oDOgow1LWRGBsYg==
X-Gm-Gg: ASbGncuCjlich584/6x7CD0DJ5l93r+v2Ht2maKGq+e6gkw6RJp9ysQuK+eIeuInzc8
 KufXM/B6GZK9nuUr0TVO3aHdPoCeYkLM5bkADbEVVjRp3ZH3xQCx/i5rU8cqnm0trUGTmLpIDM4
 euCgFIEnbyVax+nylSLNTV4B5+cHSc2XThamHzlySVNB7Xuey0yhKDEEVq4Ailio4opeIaNCCpu
 uxnPC4QvB//yzbsAKH2qlFiljiY6LmOULokXFxKUX+4bAg6rPMiEUpROfJMfFHqbY3x4JM2/4yk
 NVokY6M/Ka29NmvgwX05GInVSepDbH+8
X-Google-Smtp-Source: AGHT+IHOzKPlJItoJ2PZSsnElU1LHSxd4nGGa24z7iLVS4zGmCRUu3tnn13Jw0QCR3K5wa17W6B1rA==
X-Received: by 2002:a17:907:948c:b0:ad1:7858:a775 with SMTP id
 a640c23a62f3a-ad1a49afcdbmr37783766b.28.1746265327414; 
 Sat, 03 May 2025 02:42:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 02:42:07 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Document Renesas R61307
 based DSI panel
Date: Sat,  3 May 2025 12:41:46 +0300
Message-ID: <20250503094149.29201-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094149.29201-1-clamor95@gmail.com>
References: <20250503094149.29201-1-clamor95@gmail.com>
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

R61307 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r61307.yaml         | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
new file mode 100644
index 000000000000..7673decb71dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R61307 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R61307 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
+          - hit,tx13d100vm0eaa
+          - koe,tx13d100vm0eaa
+      - const: renesas,r61307
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator for main power supply.
+
+  iovcc-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+
+  renesas,gamma:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      0 - disabled
+      1-3 - gamma setting A presets
+    enum: [0, 1, 2, 3]
+
+  renesas,column-inversion:
+    type: boolean
+    description: switch between line and column inversion. The line
+      inversion is set by default.
+
+  renesas,contrast:
+    type: boolean
+    description: digital contrast adjustment
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
+            compatible = "koe,tx13d100vm0eaa", "renesas,r61307";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            renesas,gamma = <3>;
+            renesas,column-inversion;
+            renesas,contrast;
+
+            vcc-supply = <&vcc_3v0_lcd>;
+            iovcc-supply = <&iovcc_1v8_lcd>;
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
2.48.1

