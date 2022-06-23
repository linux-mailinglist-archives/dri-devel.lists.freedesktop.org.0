Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41F557929
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7375110F20A;
	Thu, 23 Jun 2022 11:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862D510F20A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:11 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id d14so15116137pjs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KWYF04Kqw/g4GpFzDDseOqLX9HJqf5t7pZ43NwlDoRA=;
 b=N5Hi5lrJAUTF0QYRvC+Vqjsc/CENQ8/vU32++suooWGaiWmvY8gbq+ONwaRZCfg7ON
 TdMsw6zCQH9SzXm+hWu52Mx64xIN4XHBtJiyimH3SgCUj0lXRprJ/hTjX/2H2XyI+/He
 5OnCLnAaHoLzhxuQtr4VQC6JTIhU//UpdZFT3MQtHvq7JBIe9ik7y2gOYgy0m37/4dIJ
 9P5lhTR+Y9ZHJ0qzpzRIZHMDFCFop2d3OrRjJEbcjoXNku14JU3eyaxNgeJ/bNOiFvq4
 b/mw5lrHnUUGX7OHn6QT8rzo/sGT7I6x7GXvIX9Nd0Zv0K73yxLH9uWI3y6vfZ8OhaJ6
 7CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KWYF04Kqw/g4GpFzDDseOqLX9HJqf5t7pZ43NwlDoRA=;
 b=qCO8qxrkANdTkiWdiWi1IkYOejqI6nb+w5NkLqwmA+oWzqzYKUaUuupegeI38SXB5A
 ABN1w7GMEP3SPs2RlyInsHvu3aUDX/B9KWVP4AEVkwRwiwHq4fO8sQUzSuSpeoeHeNbA
 rWHOWDhDABOWlikFfMiL2RVpkO3+4HOhA2gNhz3Qd/KSeNUowWgumg9bwfvrIrPHPiDG
 1t6slqlTjHcwKa+8arIO+JTHw5JpaW+pyATdszuiVxIV2LWXW1HIa81uC6zpYGntGNZH
 02d52Orb21q9gxMGMTfn75NRaUD7qpMmK8U7ycql7CXv1fyVwy5R0ag7+UYDaHdRS7Id
 ayRw==
X-Gm-Message-State: AJIora8OBmDTkvdclEUnT9X3N9MF0qIac+s5uMo7VlzYCk6IfXmNQLAU
 MgxPNWTlAO01ZomQJZYuM6U=
X-Google-Smtp-Source: AGRyM1sqZrTGobn9nD9LkUqiSOOr584dAD1/Q4aTGEiE04urNhRGv1JMtSnofC8JHWzGr0UvWgloQQ==
X-Received: by 2002:a17:902:8a91:b0:168:e74b:1056 with SMTP id
 p17-20020a1709028a9100b00168e74b1056mr38061696plo.16.1655985431136; 
 Thu, 23 Jun 2022 04:57:11 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:10 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 01/14] dt-bindings: usb: Add Mediatek MT6370 TCPC
Date: Thu, 23 Jun 2022 19:56:18 +0800
Message-Id: <20220623115631.22209-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
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
index 0000000..aa083e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6370 is a multi-functional device.
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

