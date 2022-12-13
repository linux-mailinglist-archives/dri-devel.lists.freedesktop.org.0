Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926864B15C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 09:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0B410E1B0;
	Tue, 13 Dec 2022 08:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5BF10E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 08:42:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id co23so14839697wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 00:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKgK29do0XjvBFIa5Qu+YNQa8TUkw4hM3C6J+0E/JwI=;
 b=YgYedch20A1eKHsRF60pPQ4MyHukR1G5HNoNrwZwqGqrRpOK5JFwy8Q/ow5LAtZxhU
 kpnPtppTrK8MKNQaHoXpWUXXd7/tO+ZKUBEc8o3FZ+SMaDeUBJcwxdfRjXBfhJbKSmW2
 ioVqQY66mg0LgukTKb5/olYPmiR4CB+Nj43+9vVXUWnXuva0PPSmLb6F7JEvyCx2WeZm
 78GoyyXMVedDKxKXFmZofiPXu9XdTAg5xA+L9J4yg0nXddMN8I/QHdHBZ4gqZC4OcxzE
 /0agH/OdWQAe7F3OK1A16pAmFyZ3ZkKSPTJ199ccYZKEcQdfOzFY6+Dfr4lqjOsldLN4
 g/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKgK29do0XjvBFIa5Qu+YNQa8TUkw4hM3C6J+0E/JwI=;
 b=GXz1CJr6FJhJYn2grFb9FT/5RhnhqRG2PYF/n4D85W4CMOL6OZSQQFq4UNqOkiCr63
 sQhbVMPzIHzrLACsdrhnJw071yem5fBkMBwdcso3fZ7dDGrEfJ91/SDAPUfhbPlXfyzj
 R6EDCZKagvXXKIFZMEtGs+Jb0aYvXoye30yaD6sR1ZypfYFPhgMzrQe9H9Sa3ecQTgzD
 dhhCenCnWCHQDOS20gAMFgfxdO+zzsemp5e7dvot/bPfzQZ8De613siY1hL6yPwbfisY
 CCfcuaodYwWwoS9oofP6cNMkUgkQTjpzI0tzRjqT9niXyx1iVjtx/ZV/oBHsJZc0yrHR
 yYCQ==
X-Gm-Message-State: ANoB5plFWbTB432PvIIoI+lumPUIUq59+aGTiNs/hGYTx/h7uW9GQ5JD
 bRGLk53QEqn1zWmQRj4zimI=
X-Google-Smtp-Source: AA0mqf4lLIS+hn1OCdyn4v2Vt2KHSHteehIfQrIdoMMl5BA6GlgC6wzwyNx63t/DSryNWQHaI9SFyA==
X-Received: by 2002:adf:e710:0:b0:24c:f3b8:816d with SMTP id
 c16-20020adfe710000000b0024cf3b8816dmr7590165wrm.60.1670920932660; 
 Tue, 13 Dec 2022 00:42:12 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-bc7c-15f1-6c3b-ad74.rev.sfr.net.
 [2a02:8428:46a0:7c01:bc7c:15f1:6c3b:ad74])
 by smtp.gmail.com with ESMTPSA id
 ay2-20020a5d6f02000000b002366e3f1497sm11474037wrb.6.2022.12.13.00.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 00:42:12 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net
Subject: [PATCH 2/2] dt-bindings: display/panel: Add the focaltech gpt3
Date: Tue, 13 Dec 2022 09:42:03 +0100
Message-Id: <20221213084203.17729-2-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221213084203.17729-1-cbranchereau@gmail.com>
References: <20221213084203.17729-1-cbranchereau@gmail.com>
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

Add bindings for the focaltech gpt3, which is a 640x480 3.0" 4:3
IPS LCD Panel found in the YLM/Anbernic RG300X handheld.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 .../display/panel/focaltech,gpt3.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
new file mode 100644
index 000000000000..969f117c51ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/focaltech,gpt3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Focaltech GPT3 3.0" (640x480 pixels) IPS LCD panel
+
+maintainers:
+  - Christophe Branchereau <cbranchereau>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: focaltech,gpt3
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
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
+            compatible = "focaltech,gpt3";
+            reg = <0>;
+
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&vcc>;
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

