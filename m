Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4DD709D29
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3182710E5AD;
	Fri, 19 May 2023 17:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C69010E591
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-510b56724caso2121816a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684515843; x=1687107843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMbfgZNtYeRwD9smgGxKkhNix43UFfi2sTWJFSMwRx0=;
 b=P4xVhmOOzmp4vBNC/eDpPzNpBkI7hhNpQEDfnWtU7yM3gMpNfpZHU8JcOOzqUyrig1
 lb1stbTLqOeeVbFDPQwMfKCKJMSLcUsSWHSGznckf3/eXD2brfFmt2cuFucD0w3kdPHO
 nF7XQ8MS7ZjZTzpVtG4sNBuzAAlOuHRjeLZDBmn1GBEvtA56Rm2eq6FVP24jn2kFKb4j
 S4oAuJb24IkACLDtLOw+DGL4afM1QkRctlTt9rlOfcUPxFru6KZouAT+nTNqrHvWspQs
 sE2FOuoo9AoKorvldkWNE4qIDKopllcrgQQ9a4jd6Wdvoi8ccLV3Ay9edGJhxLCXshCE
 BcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515843; x=1687107843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tMbfgZNtYeRwD9smgGxKkhNix43UFfi2sTWJFSMwRx0=;
 b=cp8rRpoLmwAttGByo8PUXJeyNplZWo/fLOK+XeevZVb59APt5Ia0Q0Y07nEau5cbdd
 euAtZXZjOdckQv2UzIrIEwnL4cd8QpGsGRrpK2isfis+sWNTJ8xYyiJPxtmWuSHoraQy
 uAN3upgUN24C05cvpnd2gNSMBdQrq7SJbIFeeVj8CplgVhzZC/aIlVVFdTZUtvZYTOqu
 0If3K4mryslEPF5PKRwoV1lyC7qDreUPT0PrmUvlcdumCcgLRTn4Eb/T0PO1We+McVZr
 9m19rk/xmBOOtyfHkSv3tlhu3SCrGkgVgshrGPv8FtUd6Hzad0KG7JGEOKU1gantL5GV
 qH0w==
X-Gm-Message-State: AC+VfDzhPg9Ayuoll0E3e+emWAw/R1e8D63zO0uKMXlj+e5qBOfPLGgS
 C9pBiPrDxo2JJqzA5zN29nA=
X-Google-Smtp-Source: ACHHUZ4kGmVmCGrd+bXfst09wD0FQoK/I6kxSeXm7KDAEPwXQJc939EXnwfTfV8PBLtqAtuhCcQh8A==
X-Received: by 2002:a17:907:961c:b0:967:4bc7:38c0 with SMTP id
 gb28-20020a170907961c00b009674bc738c0mr2641931ejc.9.1684515843333; 
 Fri, 19 May 2023 10:04:03 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 mf13-20020a170906cb8d00b00965ffb8407asm2489988ejb.87.2023.05.19.10.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:02 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0 LCD
 panel controller
Date: Fri, 19 May 2023 19:03:52 +0200
Message-Id: <20230519170354.29610-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519170354.29610-1-aweber.kernel@gmail.com>
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>, Artur Weber <aweber.kernel@gmail.com>
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
 - Added reg to required properties
 - Reordered required properties
Changed in v3:
 - Fixed patch that didn't apply
Changed in v4:
 - Added LSL080AL03, LTL101AT01 compatibles
 - Added description to reset-gpios
 - Added vmipi-supply, renamed enable-supply to power-supply
Changed in v5:
 - Changed compatibles to avoid concatenating multiple model numbers
 - Removed '|' from multiline descriptions
 - Fixed license
---
 .../display/panel/samsung,s6d7aa0.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
new file mode 100644
index 000000000000..45a236d2cc70
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    items:
+      - enum:
+          # 1280x800 LSL080AL02 panel
+          - samsung,lsl080al02
+          # 1024x768 LSL080AL03 panel
+          - samsung,lsl080al03
+          # 1024x768 LTL101AT01 panel
+          - samsung,ltl101at01
+      - const: samsung,s6d7aa0
+
+  reg: true
+
+  backlight:
+    description:
+      Backlight to use for the panel. If this property is set on panels
+      that have DSI-based backlight control (LSL080AL03 and LTL101AT01),
+      it overrides the DSI-based backlight.
+
+  reset-gpios:
+    description: Reset GPIO pin, usually GPIO_ACTIVE_LOW.
+
+  power-supply:
+    description:
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
+            compatible = "samsung,lsl080al02", "samsung,s6d7aa0";
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

