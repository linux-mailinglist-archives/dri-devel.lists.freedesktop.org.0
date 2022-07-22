Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C455557DF65
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753993337;
	Fri, 22 Jul 2022 10:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AD893337
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:24:27 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id w205so775840pfc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
 b=K/1y14MlRObPJ1LqAyB3L2LzpyCt8ulro5fYuTn2JfjbaSDxMPq+onPJsBu1oxo9Q9
 TxRl7TcnukFuuxiyZ2ebjuamw7IvnJn31YM2M/lST/StCcpCQKdmEnXFxKNnTU/E7TAP
 e2mGFLSobfVEJEttgHujCsQ8ILYu8gvhjb+jh0RRMoxbUcumQNQU+wNHeum3ejbPBkqx
 tGaz/ywyX9eVGNyuIZkD94Opve92tu2Wl3uz4RYpMZ5jqNvUiNCM7sKAx7llEk7rOB3T
 3LbP3PCf64FJoTPLJdW+hzmBKpix18zSgsyW52vspd9hSfCRV7tDP+2qbqicrMPuZ/w+
 l68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
 b=VFcMBn5VwsubBEncocYBemj0V0ZwJ/pt1V8/8he2g4C1gF8Dm0wwz1gFjyAvRdPJoz
 YcgyOwRMmATPMXgG939pXabM666/NrLr50OhTi1fjtKWB4fp/khsEgS3qrsAzG9cXR8i
 3oI+t5/M+wYTGAWXHOyIUostYUPp5Xa0XuUKNe+YG8pfHV5FKj7NRJ0uNF/jQG7p4Q/2
 xbZWyeA/CjVNDAhQgEIixbTBJ1HoZKIsZalA4z/aSVbnmdzLUd39WOHo5wKcbFri5hzW
 c65GddH9e5kXOdAHRO6GA+WIdv547EjJB/vaoGL3+x+gvugn3baYodFZhnNCe1LUjKG+
 d5yA==
X-Gm-Message-State: AJIora/0FWZExNQKF8ttZNlQcKcQBXw7DV8hdFWsbKoiI/Is7lyCgyEf
 khAL9K4X7KQUqAESvP0r93o=
X-Google-Smtp-Source: AGRyM1ujmkE7H/dKSC5luM05BdbGMVEn2CHVXsGjcX1E72ht3gAGdKv1Y45YEKH3Tv5yp/zCff0Hng==
X-Received: by 2002:a63:8b43:0:b0:41a:668b:399a with SMTP id
 j64-20020a638b43000000b0041a668b399amr2571892pge.554.1658485466445; 
 Fri, 22 Jul 2022 03:24:26 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net.
 [42.73.82.239]) by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:24:26 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v6 01/13] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Fri, 22 Jul 2022 18:23:55 +0800
Message-Id: <20220722102407.2205-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
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

