Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E472DBA9896
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB08C10E432;
	Mon, 29 Sep 2025 14:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HkTUqbjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FB110E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:21 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so41558911fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155920; x=1759760720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSQFvg/0Op4ijZhmcHNRkV3VuLRSkHnJiSZzYGsOKnU=;
 b=HkTUqbjxT5GWLnmpZ3qsn1PccbJz9v1kn3I0pc06r/iplp7kGT9v9MFJ9vqxtOG/jO
 Y/nRM0Se3AB6bnaromVwis7Ap0rhoKUmLWGsEPjHln+3quPrNqzsEJFSRIvml/+i+jkK
 mXJjjz2rYHbOGMkweWfXA1tHvYJ7CN8z4RgV3L340ayvvfOSiSHesgQ8FAtoHcdETvwq
 uIplqbzB2t0mHJvco2IoqYWzZWyxDS+YFRL/vOrr5Luqc4VqmkihTDa35xnAT/z/3EMd
 Ti98HwmkH5ZJSEs2BjrPObmxKiKhMtklxXrpv4jF5tF8mz3rfsmd5TGc98P8vfWi54kG
 xAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155920; x=1759760720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSQFvg/0Op4ijZhmcHNRkV3VuLRSkHnJiSZzYGsOKnU=;
 b=XwJrO1k3qiH0hhvW5P3DE13AeE9Z3zFGYrNnavLN+E7VKbTim1haE+2ruLU7yGaN/g
 Z75SSFlkg7zQx9YWPc1/i62vc1nKK7eAeJngpcOwj2aVkiF8YK50jXXLoyDK/b2g7TMF
 6tj6XWhZCRXX+8vSXQUgdXhxSgUlvXS1GC7T/UqYohfRYI1GM+KMz0WgUHXfz2iVqaL/
 RBgu9kfIfxRo019HXQ2i+pR3vAVLBRBnGonQakdIc1Af7uRc7h0oHP7lkyJgtRbWhusM
 WfBgJ2eK7nN4nzOAqm1m+A6+zgJxnEvn4TRLrXZPIkvL8/XsnkY2gAI4YJqiOVjyGTdz
 dOgQ==
X-Gm-Message-State: AOJu0Ywaa+nxIpD+ELxaOxIsCedj0tHVV5tCiT05ogtx5UPQqlVYXBhj
 Vz1yU9UKfGV16J2zbmTr0cC9y2YDcQ5+W9dT8L3lj1K1ReRUHec4H4TW
X-Gm-Gg: ASbGncuQ9xY2ucsZCtW+buRyyNE4caxQKcYdXd29SCV38798+AM5OIvZaY7iU1ev2tW
 6UE71cj2pNNG+cLbT8stDG8jYvbNHFISvjWFEPW7RKvdeTdc2ccPINl3ooare/QTuMS2XIEgbtP
 66UcbLoFDsPI7TaohBZPnVyjntIpjRc6xZvBGdk+RdUizJHmBF3lvWB82oOG4DC5R8oZ38bFCCu
 X3L6B7m/BvfI8h+X/MZWhY7aE8jlBLfzYXXcxmm6EA0c4ZmLwC9VhieRfGkA8XZso1zJbevmpzQ
 BEafIPfJHUnpXQwJtmySmODtbVwkfhn+HVlJyfHzKrabGyYXP/gvUhHEqU34B9vmfRIVveC1IJB
 zTYGPM8RbVUdcAA==
X-Google-Smtp-Source: AGHT+IEibrCwJezr+A8wOo2gVwCb6lK72bDzFcB4eV9MZWICPRGwz5lX+FlGpBMGd5346Nlox3jBSw==
X-Received: by 2002:a2e:a10b:0:b0:372:8ca0:15af with SMTP id
 38308e7fff4ca-3728ca01b01mr21960021fa.35.1759155919667; 
 Mon, 29 Sep 2025 07:25:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 07:25:19 -0700 (PDT)
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
Subject: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Date: Mon, 29 Sep 2025 17:24:47 +0300
Message-ID: <20250929142455.24883-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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

