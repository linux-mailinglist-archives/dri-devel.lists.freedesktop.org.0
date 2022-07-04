Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E6565BD4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127A910F6A5;
	Mon,  4 Jul 2022 16:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D552610E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:39:34 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id n10so7690845plp.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 22:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMf6387TzLyGm9Upw3MxkT28i0dsxKm8/fENYW9fSbo=;
 b=adkv0LxmsMCQz497yrD/djwooNWwdvKUuQir3Cfxo39vfk5chMyirhlT5Ra2CnAT5c
 BjeUwdSUpHqOQn32XvsFlSVvlSQLF0tfoQi7jINKCJr7Kli0zbT9gC4Evt6X++aIdwGb
 Hr05itlCxPH/C2P9li1poC42ArKWGeegNNkletbnO/4gqpoRSku4oAL8LTH8sxGHF+7s
 EJgbAAiMakRblWilON5A1w5zm9iIiVwo4Q9ylv98pL1zLjuVVpQ7EwrfnD9UAyfg2Nva
 BzxKjJP6GZf90ZtA5QlPkynSEFUfqXzGIC2oYH5KhK0sUyehKdZOocJ+DRHs48OZebqx
 bFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMf6387TzLyGm9Upw3MxkT28i0dsxKm8/fENYW9fSbo=;
 b=pq6YS04P7caQE0uK9c+Ua77xJ0LuFvxhJPwj9yFAXxf7/7YWvtIpcV8KmL4D7YRhPj
 ZXAgKKHe02ngZAP/8VteNFjUnZ8zUc9jO/7507ZQx0nM9AP70tutElCE34LX2AmgVgFa
 vNSzemMV8POLbAitWOZgZuBAGdGKAZ4IRSyuJDwyV73XyXRSozXylOBYRF3y37soKA+x
 GEcDxdcsI6YIHNM5mBLIMTve21eFVsBzDePl8M1yGJrLNxlXlR2xo/+FbXQUarXgTaoY
 OI7kp+eD5EWDfJZuRbZrBko0D5MIrPX1VkA5cZWmuWsqc9qiH/HRij5D4VOTq7v353q6
 zfcw==
X-Gm-Message-State: AJIora8rAyRJ3WarJvsYkgMtN2HG1KC92L9lTGFa4+b9oue1/GAhqafS
 M4g7BlTRi2XXY1F58CkVELk=
X-Google-Smtp-Source: AGRyM1vkpwmG4HnIy/K45K/pN2YgROkZdEN4R9it8eT+Bwn27bLRum8y8Du7d9QNxDwqQhDgf1+Wow==
X-Received: by 2002:a17:90b:4c48:b0:1ec:a20e:a9bf with SMTP id
 np8-20020a17090b4c4800b001eca20ea9bfmr33144872pjb.209.1656913174438; 
 Sun, 03 Jul 2022 22:39:34 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net.
 [42.72.4.255]) by smtp.gmail.com with ESMTPSA id
 h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:39:33 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v4 01/13] dt-bindings: usb: Add Mediatek MT6370 TCPC
Date: Mon,  4 Jul 2022 13:38:49 +0800
Message-Id: <20220704053901.728-2-peterwu.pub@gmail.com>
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

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml         | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 0000000..72f56cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediatTek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MediaTek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.7.4

