Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE712E4DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DCF6E02E;
	Thu,  2 Jan 2020 10:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108DA6E02E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 10:17:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j26so40186798ljc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MTGfQ5E4qXZEXmnJB6mzgCLib+I9ktBweyOlqsK414=;
 b=eppuZLmdBzgS1sTX+Z5gG2LbjSZHE0h8K2JwE4c0PqZDJWeJdX1YMQI3woI/PAuo+n
 u+lJ2sSYLySZ0r/ZhJTCRoc64sVbh0/SV37x3s8a5gikfD1t+ELaKAYZHqYx/eJkLsOC
 SKJxsb8PCV2F/AQuZY/v0BhSf0p2IJl4KGEvH6PeD2UYts4IRUwbkPHp3/SC/IulJ0TM
 rNxWUYBw6U2c0sNVtI0LjBhrDP0sequC3sGoAjrf+CXQ2sMfrDzzm/VmBeeAgQkiyq7r
 h9ufnOAgg9Xj81D7PlvBzL+OWhqGDYpK6Y1SCFueXcE61zL89dKirUoLtpEPx96tED3y
 Mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/MTGfQ5E4qXZEXmnJB6mzgCLib+I9ktBweyOlqsK414=;
 b=uJWRfneZSewRW9z+dECnWkydRV5mqoqHqKKl97VsId193XjVYUTb3uE+Bs1qsbZ4vX
 /fBbIOXxwz/EH7nUoVYBEwJiNjRD5+NG+0IpHJk9a1fJo+XB6eOuyVeXjmItTiv6io9/
 8lQONFWbvW+l3wka9EE2wZvtRpWRtlExtPBWoKkXCBkCQPRVscDDyG8zhaaZVRiEogeV
 771m0Y9eUnnmwugjjIHka4QJ4ddgINQPAmz32psSjr4PiJ6q5ua/QQ1MTV1+ixUibG6f
 4/xSJEuOzQil+uNa+wd90rE4o0TDvBD0vKhAQ03MUOtdfleNyvpjda0xyE0TRPeCXvcd
 b79Q==
X-Gm-Message-State: APjAAAV6AzAZ9xU0tnIGtEFXoJwaLT4UsbmEK0VGYmiM09v1/L525OP1
 gFVYF1J88oYLLUyeclIbAWg=
X-Google-Smtp-Source: APXvYqw90yIr0mEonCawBbDO69XetCFU+e3nr8JEvztOZBWzJeqKzqPQd9/z6lkfvHUud7GbKNy1aw==
X-Received: by 2002:a2e:7405:: with SMTP id p5mr48847794ljc.34.1577960245226; 
 Thu, 02 Jan 2020 02:17:25 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m21sm23025892lfh.53.2020.01.02.02.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:17:24 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: one binding file for all simple panels
Date: Thu,  2 Jan 2020 11:17:11 +0100
Message-Id: <20200102101712.5085-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102101712.5085-1-sam@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is an increasing number of new simple panels.
Common for many of these simple panels are that they have one
mandatory power-supply and some of them have backlight and / or
an enable gpio.

The binding file to describe these panels adds overhead
that really do not add value.
The binding are known and there is nothing gained from a
dedicated binding file nor for any dedicated example.

The following patch introduces a single panel-simple.yaml
and converts two ampire bindings over to the new file.

The conversion - if applied will have following effects:

- The maintainer for the individual file will change
    There is no need for many different maintainers for a simple binding.
    We have the same situation with the panel-simple driver in the kernel.

- The license will change to (GPL-2.0-only OR BSD-2-Clause)
    There is usually only a single line copied from the original
    file, a line that is often copied from a datasheet.
    This license change should be acceptable considered what little
    is copied.
    If the license change is not OK we can use a dedicated binding
    file in these cases.

This is a follow-up on Rob's big patch converting a lot of panel bindings
to individual files:

"dt-bindings: display: Convert a bunch of panels to DT schema"
https://patchwork.ozlabs.org/patch/1197683/

The objectives with one file for the relevant simple panels are:
- Make it simpler to add bindings for simple panels
- Keep the number of bindings file lower and thus easier to find a
  relevant file to copy from when adding new panels.
- Keep the binding documentation for simple panels more consistent
- Make it simpler to add support for new panels

v2:
  - spelling fixes (imirkin via irc, Rob)
  - updated description (Rob)
  - list properires in alphabetical order
  - added power-supply to example (Rob)
  - updated title
  - reworded changelog a little

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
 .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 -------------
 .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
 .../bindings/display/panel/panel-simple.yaml  | 59 +++++++++++++++++++
 3 files changed, 59 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
deleted file mode 100644
index c6e33e7f36d0..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
+++ /dev/null
@@ -1,42 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/ampire,am-480272h3tmqw-t01h.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
-
-maintainers:
-  - Yannick Fertre <yannick.fertre@st.com>
-  - Thierry Reding <treding@nvidia.com>
-
-allOf:
-  - $ref: panel-common.yaml#
-
-properties:
-  compatible:
-    const: ampire,am-480272h3tmqw-t01h
-
-  power-supply: true
-  enable-gpios: true
-  backlight: true
-  port: true
-
-required:
-  - compatible
-
-additionalProperties: false
-
-examples:
-  - |
-    panel_rgb: panel {
-      compatible = "ampire,am-480272h3tmqw-t01h";
-      enable-gpios = <&gpioa 8 1>;
-      port {
-        panel_in_rgb: endpoint {
-          remote-endpoint = <&controller_out_rgb>;
-        };
-      };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
deleted file mode 100644
index 83e2cae1cc1b..000000000000
--- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "ampire,am800480r3tmqwa1h"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
new file mode 100644
index 000000000000..51ca50201182
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple panels with one power supply
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  This binding file is a collection of the simple (dumb) panels that
+  requires only a single power-supply.
+  There are optionally a backlight and an enable GPIO.
+  The panel may use an OF graph binding for the association to the display,
+  or it may be a direct child node of the display.
+
+  If the panel is more advanced a dedicated binding file is required. 
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+    # compatible must be listed in alphabetical order, ordered by compatible.
+    # The description in the comment is mandatory for each compatible.
+
+    # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
+    - ampire,am-480272h3tmqw-t01h
+    # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
+    - ampire,am800480r3tmqwa1h
+
+  backlight: true
+  enable-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+examples:
+  - |
+    panel_rgb: panel-rgb {
+      compatible = "ampire,am-480272h3tmqw-t01h";
+      power-supply = <&vcc_lcd_reg>;
+
+      port {
+        panel_in_rgb: endpoint {
+          remote-endpoint = <&ltdc_out_rgb>;
+        };
+      };
+    };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
