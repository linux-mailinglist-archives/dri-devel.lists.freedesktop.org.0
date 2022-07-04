Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F0565B93
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337AB10E611;
	Mon,  4 Jul 2022 16:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D223010E041
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:39:46 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 68so7969219pgb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 22:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oAIuQm2COlWkK+/Z8BqCJPN5NppYOkaJmMDk8pvQT/U=;
 b=EaSKmdfnWVJ+MEpeWqtg1O0K3ULAhPBZDu4y0J5yHyWuHGxf6rPYMVoveDSCrlTjR9
 TFnf+toKwQdO2ceOqWxkRj+OW2XjezFBJEHyvgRge+bPiCAOhow8MLv60v31u0rXXeV2
 ZjnVQu5QusuAatAcEzgnr6JoiiFWDP7dwXs72jp2mI0Hk7Nq3P4rJRfNcz0HDHPc8Yhh
 dIocVDAVZKBFCPD4y0OyYzLiUsFhTzgXxm+hFjDiZclY7X0LOG/G5870oDbQR+i3x8XI
 A46KXgDjsQFhKpsdYYRe53sfrWe0HN12AxU1k0KCpxf+VUs3YJOzJ4YZhxd+ARoZ6BtY
 dERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oAIuQm2COlWkK+/Z8BqCJPN5NppYOkaJmMDk8pvQT/U=;
 b=2GMgK0+wJR98/6w9vNBi4mMjO+Xw1S6QrHcof4PKLUQpTSFvJ6eCn8toKDyDMnqOk7
 YbinJZ2II79qGq5vQwbWixNOKTPo0xfgfX13ltmK64BUJ1ej90tfnLe8/vEPEMuZayOS
 YhIfjohp+JGcy0E7ArnYyxC31Kkqb0G1z/XYzq3IjBWbny/vJHhBNw5ih1Wajb+KK6a7
 l6L411XrE4Sv7rJ+qFJHtoV0vpOlB6MYTGIdApVlxwR5Y3GRKvu24A+EEqaI2RfKQNUn
 3BAtXc2Cig2XlpraYgMexFpe8CS0189oh6Ecn2kG/MdOpNWaRmGC8SOKhOZiSCk6kyBL
 aBNA==
X-Gm-Message-State: AJIora9Fxw7F81KiZOtkymvv+3OEfFA7I7DvFY9HcnlYpIQaGnhE/s3B
 KzO70UM+DwAsAUltf7mu/sg=
X-Google-Smtp-Source: AGRyM1sQccU+fvMq/w6AhPUj9pevtapjlIxEFCp01xKjETVAPCINpFYH0R4xwRYW8OPqboB13jMtDw==
X-Received: by 2002:a63:86c7:0:b0:40d:af99:608 with SMTP id
 x190-20020a6386c7000000b0040daf990608mr24095540pgd.515.1656913186411; 
 Sun, 03 Jul 2022 22:39:46 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net.
 [42.72.4.255]) by smtp.gmail.com with ESMTPSA id
 h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:39:45 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v4 03/13] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Date: Mon,  4 Jul 2022 13:38:51 +0800
Message-Id: <20220704053901.728-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek mt6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..45030f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4

