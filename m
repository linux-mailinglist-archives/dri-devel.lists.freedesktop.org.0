Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A45500823
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07110F21B;
	Thu, 14 Apr 2022 08:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C486610F21B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 08:19:29 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id t4so4186947pgc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SSywtdZUMxkCBI/xEk1bUiLN2t69WD4r/p615M6+ZCA=;
 b=vgBISCRmMtcc6je3mf41/eoFijY/e66ExSqB70Xd8xivGACiHeL4dvR3YDgMVAN/95
 EqijJScDyIkc4ojblWztN+TKdFijp+04CBNy1UAGvMMSH7XV5U/KFvtKMF/DeZOut+D4
 Za3B7xBV7DZDf4EmVmwSCmHORKyflKz0xbd2T6+ViE/X3CbBpaNW5im6B/hnqz4hMDeX
 cxi9ki32zgAMrDhWgLPJPWIW+14YGK2OUJGcNxkhlPnet9sng7CO4U69hOYrIh2F7yMY
 m9LmzUL9qSkNnzaLSdNiiQhx3k331OUon5dGiCI+uf0QWURzmpsBTPHUqv7YKJlNSwUy
 bXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SSywtdZUMxkCBI/xEk1bUiLN2t69WD4r/p615M6+ZCA=;
 b=V2it0pn2ItYRvr0OdsaSFUQYLMmblCHd7aAS+6WicvoOB8eaAeokjItTG3ucJD8QA/
 6xzIU/Jy75s/j0DiHbe2sxPQ2RUN+pxY8pJH6ENVV9z+2/5T1hLyJPlW2MlzuHyZZWXJ
 ezgXZ3mJjefnIjwxDxX4HC94uJBqvpL0zyQ+HpC/cKESBZfXrd2AsOYDVr3yeEmuLuoX
 p0Ocys2EsaRLSAUAYt5FAxhknKWMEIXKwtLZG4KFArZ7vHfnwzcRhdM/EWDLxx3N4hM7
 4KaQO7seiNN+ig4B0rdUl7UWAG9N1uH0PyMXmr7KqIWJ+ctRc3N2Vnsn2UMhJRX78NWl
 ujMg==
X-Gm-Message-State: AOAM533cgykhkWAUF0caYecl0UNNvevwLf9essv6C3rSQ6huljWuQBPF
 bJ0Mjc55Fuy8+l6xmFR3umfvOL10a1U8rw==
X-Google-Smtp-Source: ABdhPJw4fCPHEUNZa/x7vkhc1oMIXUbOOzV3GlqSYTDLhsZ1g28DioXPjDSm4ncis3PlhZ/DHCjRhw==
X-Received: by 2002:a65:5b88:0:b0:39c:c84f:b0a4 with SMTP id
 i8-20020a655b88000000b0039cc84fb0a4mr1400824pgr.65.1649924369447; 
 Thu, 14 Apr 2022 01:19:29 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j9-20020aa78009000000b004fde2dd78b0sm1304394pfi.109.2022.04.14.01.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:19:29 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND v2 2/2] dt-bindings: display: Add STARRY 2081101QFH032011-53G
Date: Thu, 14 Apr 2022 16:19:16 +0800
Message-Id: <20220414081916.11766-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220414081916.11766-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20220414081916.11766-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
QFH032011-53G.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/innolux,himax8279d.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
new file mode 100644
index 000000000000..fdcea3870dfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: INNOLUX HIMAX8279D DSI Display Panel
+
+maintainers:
+  - xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
+      - starry,2081101qfh032011-53g
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp1800-supply
+  - avdd-supply
+  - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "starry,2081101qfh032011-53g";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
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

