Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3E65137E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 20:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4A410E2E7;
	Mon, 19 Dec 2022 19:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E68310E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 19:52:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id ja17so7206286wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUjNXOEHX/W7UdMi+yl/0srY4t86/SAHQJknziXKrxk=;
 b=Qa3yO1IUvlwrZwmTA94ThEFY8nXr2xWUB4xDqQ0RiMeiuecs29u56KqlZL2naorOtA
 u5x3N9vKsFo1lUjgpMAyOgjm8+oTyMDoOFhlSuFkyRIeOPf/Po/Z+zijbE5it0gUeqFt
 LjAz1MivurnQ1T8Ullg1KgrsTzLF2XKZYRPNiBwqx26v6NGN1BeaqXpVR2OF/HGw/eJE
 t6acX2iCr94SSxIHJOI0exfWqD9ntz/OyDtrIdGWnxN4AEVXSpcjfUuLwqYnRxDbggek
 qFiWetl4pR0h/ycywx3Msakh65eeUi0FaE/yzQPDeLDrqAIYTneun9KE36j2JUh6FkgV
 kaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUjNXOEHX/W7UdMi+yl/0srY4t86/SAHQJknziXKrxk=;
 b=atqKZRA5eJzsaD8nftQZ727M+68dK9IFeMlBc+J94NmkZ5TczvWOEWqYMnxGJpbQh3
 2ycdmluLDN+lSjlV7d789c+VxgyKnPyx5AF2SxswdC8hP0WrcgG8ZrU9p+743Q/pRB7Q
 Xm017VtEq9Msx0ShluQ22Wjk4nw8c482HR493/7cBPtaTpR5kgDcxjnwBJd5xshwEDro
 zrQBgq+HIAav9F7wzBmI0xPkOchGIEyC2zIQXMB4I4D8JpZj4hM9BcjWPaU/U55/XPw4
 qO3+/Fqo0Iz/tAb0P4dhVXioCv4NVBjlG6QNbwb/ukL84Wh4s5Q1hO3AwzAlRgrxiran
 ucwg==
X-Gm-Message-State: ANoB5pmvGGwBlI/JbM/9C9HC+9XEDdWDV/mDAmz+JS/edLDCIeBI05df
 bZK5YhjO/kjBDj5Cm7liSJY=
X-Google-Smtp-Source: AA0mqf5VEegnXDQ7niTrm/FLhoL6PT3TL2mNd04sa3vR9sCNVCf3Ace4V9IQdHttNZH11V8DlYF0lQ==
X-Received: by 2002:a05:600c:1d83:b0:3c7:a5:610c with SMTP id
 p3-20020a05600c1d8300b003c700a5610cmr33042429wms.16.1671479560562; 
 Mon, 19 Dec 2022 11:52:40 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003b47e75b401sm24469142wmb.37.2022.12.19.11.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 11:52:40 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net,
 linus.walleij@linaro.org
Subject: [PATCH v3 2/2] dt-bindings: display/panel: Add the Focaltech gpt3
Date: Mon, 19 Dec 2022 20:52:33 +0100
Message-Id: <20221219195233.375637-3-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221219195233.375637-1-cbranchereau@gmail.com>
References: <20221219195233.375637-1-cbranchereau@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the Forcaltech gpt3, which is a 640x480 3.0" 4:3
IPS LCD Panel found in the YLM/Anbernic RG300X handheld.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/focaltech,gpt3.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
new file mode 100644
index 000000000000..d54e96b2a9e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/focaltech,gpt3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Focaltech GPT3 3.0" (640x480 pixels) IPS LCD panel
+
+maintainers:
+  - Christophe Branchereau <cbranchereau@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: focaltech,gpt3
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

