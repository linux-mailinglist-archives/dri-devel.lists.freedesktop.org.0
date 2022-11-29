Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AFF63C66F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7A310E0F5;
	Tue, 29 Nov 2022 17:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB78F10E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:29:20 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so9570287otb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udm6nw1ZDjvFU6fzxBUSlncrdZ0RFybOK/j61va2T24=;
 b=nvWL9pwomvK8xrnPXbJX8fRHcQXgI9500QQwdFVUnOfMvcRx9M6mqyJQkZIQNnvJrg
 j8dJx3g13FyIv/eUlzX9YSc7qOhQMGM9e4rGDBMjDrX6TeN6FXU+PeGjPZUfuSf/VEq7
 qF0JT95CMpYdbCw2+yH/WH6ijy7F7mLjzh6RPYmex3TKLGHs5iSjbOkORdelyoxO0ID/
 jYH0VwKk7XsrNkKqs9g36GHWn5syqepcEMHTJcccJskguR59A/GV9hyGjU+3eayiSg0r
 DyR1Ph/9cU6d1O32U4Khpgt9SHF4Y9qggvFEqzvheYxI1anrF6MCcZv270rkb6wyLr8P
 6e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udm6nw1ZDjvFU6fzxBUSlncrdZ0RFybOK/j61va2T24=;
 b=ocd8gpjeFYG9xv6RLGfc4lMsgNwBEhdHkdbjwPRPeVcdE3Us/BN8UXvVwwJEs0yzDb
 0nBIYteWlojfEziTDDVowaFq8W3cZtg0R1aMdLaDxwfQU31PIVBNoOFkRLYoxoRFZIwa
 PCQuNT13C02kH6rezDbn+rmEvPsFJvyztQl8AfB6fH34iw76XuMcuRmEjiA9SD+CFtqu
 d9ysBjPwPKVrDqB+XaAJm8aJB+LnNc8dWpALY71RjPrhsHP0J/PtcduTEONMCRAxTHRt
 2RW+UbhRP+p8IRuSKkZT7H0Yx9RYB7DmjBvZhn7nB6ZXgOiRwUxzWVsGX2jbJOEvkxde
 uTcA==
X-Gm-Message-State: ANoB5pkfPoqx1RWWCC2StlSxd3go8v+AvsIoSoWmbXvOvPBGmrJbmDH1
 sayaRe6O7vyOVow2JNtwzLk=
X-Google-Smtp-Source: AA0mqf7f5CKAnvu+qFZ6za7Y3ODRll+oNHf2qMqp45z8JYf7KKFwqWCfhpvN8iCCVN1l0vyyYi0+3w==
X-Received: by 2002:a9d:2961:0:b0:66c:4e7a:a316 with SMTP id
 d88-20020a9d2961000000b0066c4e7aa316mr29565998otb.329.1669742959943; 
 Tue, 29 Nov 2022 09:29:19 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a9d709a000000b00661b46cc26bsm6224546otj.9.2022.11.29.09.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 09:29:19 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 1/3] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Tue, 29 Nov 2022 11:29:10 -0600
Message-Id: <20221129172912.9576-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129172912.9576-1-macroalpha82@gmail.com>
References: <20221129172912.9576-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for the Samsung AMS495QA01 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../display/panel/samsung,ams495qa01.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
new file mode 100644
index 000000000000..dd4b9b626fb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS495QA01 4.95in 960x544 DSI/SPI panel
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams495qa01
+
+  reg: true
+  reset-gpios: true
+  elvdd-supply:
+    description: regulator that supplies voltage to the panel display
+  enable-gpios: true
+  port: true
+  vdd-supply:
+    description: regulator that supplies voltage to panel logic
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            enable-gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_lcd0_n>;
+
+            port {
+                mipi_in_panel: endpoint {
+                  remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

