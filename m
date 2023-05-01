Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A686F3646
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0173910E26D;
	Mon,  1 May 2023 18:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2899010E0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 18:51:14 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so3708355a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682967072; x=1685559072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYiX1kIaDSc0tISjTp3CF+Qs2kF5135CE7l+f2phEaA=;
 b=aZlEm1MUUd0y46ppigHOw/ChK7rnbaoRpn+nynKdJWDXN75+qRS2iogzUdK6WEsH1s
 A9MY66RcO3hZxrfBwFiCz0Tf/AhrvCUHT6aAVYw+KYFd+3pCjAYX8evPI07fUX0IiGPg
 Dgkr25/qIfZumVG5oopGBVfLiPn9G8OyqWYbtgt2WC7BDoRLDmci2SZlrCkWfRVLf0R4
 yfi6pO1RQWxgEbBXz/bRreSwRTXMrqP1a425/Mi+wH4LWonfa62NwU+onPosdVBWbwV8
 wafMJB7gxfcscYxywKGlRLn4tsg4v3Y663EEqGcdzITIlXj4fSPjCQ/1+wlbmJYB0CpA
 PgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682967072; x=1685559072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYiX1kIaDSc0tISjTp3CF+Qs2kF5135CE7l+f2phEaA=;
 b=HpJEiSI1uDkyKiEfoH7ZqFNfuUUdWMmqPKIG3Ws0ytALBS9tgnxYHkDsy19e87hku8
 zzz+0wi0LI9JFGQQMjHKHu9m8PkM9swhPXmQWvYa3sVYc+u5WrsAr4RitLKjiPJcmM8D
 ec206WS2Iiie0no8Vr4KviKewguVe4uXzSQNpvNDYLvWyb9M7//URbGWf5rt/ipirhis
 fXOSN7ZejmSECoKBa4lwWyT+BMscQk5i9urTLxAPhL0EEUB/cmszgtt7aVCgd/RxbFta
 NjpY+GkchoYnf8dyOCURxWBBO748pNN/r0jtQJi1vYr0xYlcUPzU5uipO6u9YYshx8PP
 dk2A==
X-Gm-Message-State: AC+VfDxpnabjydkqXJYFj69aLWWu3sJcnaAgXeZBUvtKvTiTvxt89Kil
 W3BZJ4fRhFgJtfpI/owJWrg=
X-Google-Smtp-Source: ACHHUZ7JKuFFRMBI7s0DooN1jTc7B1Nlu4lwgQB5ev6TA6Q7ajR1hJkv1WtGCogARxhFZKxjtCWoAg==
X-Received: by 2002:a50:ef0e:0:b0:4fe:97a2:4b86 with SMTP id
 m14-20020a50ef0e000000b004fe97a24b86mr6841785eds.8.1682967072203; 
 Mon, 01 May 2023 11:51:12 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 g10-20020a170906594a00b008cecb8f374asm15028335ejr.0.2023.05.01.11.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:51:11 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0 LCD
 panel controller
Date: Mon,  1 May 2023 20:51:01 +0200
Message-Id: <20230501185103.25939-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501185103.25939-1-aweber.kernel@gmail.com>
References: <20230501185103.25939-1-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the S6D7AA0 LCD panel controller, including the
S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
of tablets, and the S6D7AA0-LSL080AL03 and S6D7AA0-LTL101AT01 panels
used in the Samsung Galaxy Tab A 8.0 and 9.7 2015.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changed in v2:
 - Updated commit message
 - Applied suggestions from Krzysztof Kozlowski
Changed in v3:
 - Correctly applied suggestions
Changed in v4:
 - Added LSL080AL03, LTL101AT01 compatibles
 - Added description to reset-gpios
 - Added vmipi-supply, renamed enable-supply to power-supply
---
 .../display/panel/samsung,s6d7aa0.yaml        | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
new file mode 100644
index 000000000000..918f62a78ecd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6D7AA0 MIPI-DSI LCD panel controller
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      # 1280x800 LSL080AL02 panel
+      - samsung,s6d7aa0-lsl080al02
+      # 1024x768 LSL080AL03 panel
+      - samsung,s6d7aa0-lsl080al03
+      # 1024x768 LTL101AT01 panel
+      - samsung,s6d7aa0-ltl101at01
+
+  reg: true
+
+  backlight:
+    description: |
+      Backlight to use for the panel. If this property is set on panels
+      that have DSI-based backlight control (LSL080AL03 and LTL101AT01),
+      it overrides the DSI-based backlight.
+
+  reset-gpios:
+    description: Reset GPIO pin, usually GPIO_ACTIVE_LOW.
+
+  power-supply:
+    description: |
+      Main power supply for the panel; the exact voltage differs between
+      panels, and is usually somewhere around 3.3-5v.
+
+  vmipi-supply:
+    description: VMIPI supply, usually 1.8v.
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
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
+            compatible = "samsung,s6d7aa0-lsl080al02";
+            reg = <0>;
+            power-supply = <&display_3v3_supply>;
+            reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.40.1

