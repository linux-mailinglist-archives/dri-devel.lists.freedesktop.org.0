Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFD64C841
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 12:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A09310E07A;
	Wed, 14 Dec 2022 11:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B53F89B12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 11:41:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y16so19004622wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mn0MD+1RARDIyxKGqeu2aoKtYrYvz2nkxqNXSob+WEs=;
 b=RsBqv8KfU89PIWVQLJR2lZNNkJKJd9WN9dLEkiSgUorcxwP9t2BLxAFUfep4bYXQL4
 MR0FwQPa5Z9FCjzDmhjNUJ9YPmLepSXfpaDroaJPNHumr+CGTUh6ObgMv5a7ooNbLGKP
 DDUOKq8jcZZAY1WKK9DrlHcJ1QY5TxOKsiq9ziVLamsnqNW9t5qRX9/bHCi3Te6Qwavc
 Lz1z210QnOpO2Tk19d4tu0KQAocxacWTdJtYmWHNdQ8Gi1Khd30GYiV3UaY5h4VNR1uj
 zQv+y2GNY1nDqKF5/6yhC0VhoUjnjWvPRblA7+rL2iEidl1/YUCUT1gEZChSO+1jCip4
 296Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mn0MD+1RARDIyxKGqeu2aoKtYrYvz2nkxqNXSob+WEs=;
 b=UMFxcvF8AnJicyCQA+ey1CnGiE8QMzr6SfmuocdJRy7o/Y5jSvTtjK+vHzUOKCJHvq
 8iNMdIQ7EAHyFbUFHDLfOUIAiD4Bn/cmbuUYiDP5eJuC3Db+ew7rOFeLN1aBmpw3iVD/
 NQQh/5x1gMdAiQ+EyARRcsFN/sBCx5uOWU0fdzQ1qRa5BOrRqS3DNrf8jKVvy+NnYscf
 cQdZUYYyPWCcBcWmmHoEGGIvLFmz6ctHsYpsnoS1vIcGanVmzzDmNNfy7ns0yx4hDxfq
 6oLtJjP+KETcYpn872US04BLU72GeQleJsxZ1R87pGvbN/sKg2KiAHjnuLSvGkjq2Ztc
 I/Gg==
X-Gm-Message-State: ANoB5pmnf05gdb/jCJdxYqnlJgNFiqWaGj1BYJeHRFjLKrLkzbZhHYqS
 oTEsAnZancqPL9NTq/uLEwo=
X-Google-Smtp-Source: AA0mqf5MPV404tH7abuAsdk+a/wLlTUQk8PI8K1FVWpeXk1PazEfGOELFWNhIXxitbl/pIG31Z9QjA==
X-Received: by 2002:a05:6000:137a:b0:242:4209:ea73 with SMTP id
 q26-20020a056000137a00b002424209ea73mr15426652wrz.28.1671018109528; 
 Wed, 14 Dec 2022 03:41:49 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600003c800b0024258722a7fsm2697405wrg.37.2022.12.14.03.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 03:41:49 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Wed, 14 Dec 2022 12:41:42 +0100
Message-Id: <20221214114142.204041-3-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221214114142.204041-1-cbranchereau@gmail.com>
References: <20221214114142.204041-1-cbranchereau@gmail.com>
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
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
interface.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 .../bindings/display/panel/auo,a030jtn01.yaml | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
new file mode 100644
index 000000000000..6c099eb63434
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,a030jtn01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AUO A030JTN01 3.0" (320x480 pixels) 24-bit TFT LCD panel
+
+description: |
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+  - Christophe Branchereau <cbranchereau@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: auo,a030jtn01
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
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
+            compatible = "auo,a030jtn01";
+            reg = <0>;
+
+            spi-max-frequency = <10000000>;
+
+            reset-gpios = <&gpe 4 GPIO_ACTIVE_LOW>;
+            power-supply = <&lcd_power>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
-- 
2.35.1

