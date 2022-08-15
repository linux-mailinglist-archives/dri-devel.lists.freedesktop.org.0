Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4068592B17
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24061B4B13;
	Mon, 15 Aug 2022 09:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B03E8F72E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:01:56 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d20so6177531pfq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/AE193goh4VtzXK5TNjfSKGI7YjyV9LcV+9UPyLd22g=;
 b=m5nWpIjJy7EJXW2a3685SfBViFzjpPmuFNoLVZeuBhLckuAxfYC3KLiH/IS/xFsspm
 G6MhQQdWKvBrU16JNQm8cXdWldKneUEX1W1SvjZkeH671KqURCk2tL+c3M95GU7Vt8fJ
 0XSTxwMZPL95TfH9xk+U9VWpiQDhC1pu8/hnAURWjhzQSnfTY4D0NQI1AYZVHH/3WgUA
 wnCZDZcsaDYDm4SbjregxrzvXuFCPZ2cneemdylqwDhjhXtp9N+kq1Hg46CjX5JsS+mN
 E7QHCHQLLcJ7CV8ke6e/VXuVT3nZMj/Y6f7qoE9Oz9hUdxo/BNMwb1ZqlhSl2x3BZqrT
 KdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/AE193goh4VtzXK5TNjfSKGI7YjyV9LcV+9UPyLd22g=;
 b=p1aAHUS/+xltwa72fvLq5WaotQ1vctQV3Mz2cGNmybGDsF91luohV/znh74ZM5HNNO
 zOb/4LUrLfjpfrBqK1L/Nk4xfcQneUzX5LvLRwVQs+YaS0s95CDYgTkRTgITUrfmCix9
 n8x4zZnioHNsv5CL22Fp0DRyUxkGOGwEI3NZvbDswte595hEw63lSh555ecg1MXGa/z+
 bpKrzsag/OY3dhkJGZOvwimZuW/MAMO2hTh8pi8vLsxgrRREojFIttLqSth6JsSccfLi
 t7ab2WKgyvMynjpK5w3kGbEm9jEzEYxYcUMa4pWqrqJiRr8c9ZZPq1GJg3MS5dEQXJ/t
 rcww==
X-Gm-Message-State: ACgBeo1ORuNG7yXUqceg94WHuTU/7beDMO1jJ0Sqc7N/uP22rsrCrrQE
 BCzT725U4/lN8gag9oJ3qTs=
X-Google-Smtp-Source: AA6agR43tHlpMRGGkUjVoW0kAMt7dFn9LThfuhRLB9MLhSatBpqsbe/zBNS6osCLbVogDPmJ1T7tNg==
X-Received: by 2002:a62:ab01:0:b0:52d:ca30:f362 with SMTP id
 p1-20020a62ab01000000b0052dca30f362mr15297462pff.85.1660554116171; 
 Mon, 15 Aug 2022 02:01:56 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:01:55 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [RESEND PATCH v8 01/12] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Mon, 15 Aug 2022 17:01:14 +0800
Message-Id: <20220815090125.27705-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
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

Add MediaTek MT6370 TCPC binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..72f56cc88457
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
2.34.1

