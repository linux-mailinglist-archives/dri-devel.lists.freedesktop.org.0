Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CDD58A720
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A933AB1D4F;
	Fri,  5 Aug 2022 07:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB61EB2BD1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:06:34 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso7468317pjo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u10vAEHFFPV+m/GXeBz2tZsyM176ncPweeKXNtbzC90=;
 b=lpYlKFaodSrlaln8lz1dUNOI4lQWvJ+cRzzDOYyx7EI8KlAYjZuIitS6HOEUQ55W5f
 PWtVd6lpKNqO8UwhiTfFWePr3eWySMaJkxBCEYByfZwBKNfy0B1tZ1tF6vY6HRslE4bY
 smKZ+gY3X3WRx2FXUfAq/ekAOdKBFxwUleaomuQRLg6mMBQkLAeGYUi+ihaAc60ujJja
 3qnW8ixtVDSQ8kBKInU/9OJEZj1PRzkU1v+db2Tuizs6WFlkTzLHc4CuqYn3oXAYRsoE
 MdETGC8tm2553zWhLzOHMWW8CN4c0t1kiT9g2SbHHeWr/92Zyn/6Ulnm0EClXMiT7iSg
 3fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u10vAEHFFPV+m/GXeBz2tZsyM176ncPweeKXNtbzC90=;
 b=I0zJRpMXpG5lEaNQ3HpARYOHVGn5RPuznzDzKyqOHx9C+qlwdDAnh5kAu1IpVBk928
 pKJahM8UVaOdvwYxTWtmvExWmJWkqh0jGCWtJZ7nuq5JJ+M2T8bHDcMcl58VJ0Jb27Gt
 DjQ/aAizFJ/mNahoc3gvD+/4bq+adejUDsTrrTM9uYkawiSwNGM0XY01iDnGTxmuG2mx
 McOajLVowdI8w34U6uO2Kv5TTHGnyuWAzeupjxbDhDGf9L5W9ylpAncbPPkb+rORfX88
 X5MQgzjoRODdXDBBWUTipNXy31OlD0jzMIBfkZM/JW08kYkQS8DHp6hr0qPrbL/Z3Gcn
 QV8Q==
X-Gm-Message-State: ACgBeo1S5xRHSy/OfMw1Uo5H/wRcckgMJ0GiXy+AsvLrcvX+rcD/AygA
 2P1nQOZVNFQe6LlFDek3CeM=
X-Google-Smtp-Source: AA6agR6uOX2JJQosvwhOiZcfULuJgPT1rgt3CEKqJiZbC5XzNWkHdOg8QcgsZu7eNgGXLbciVCi0Iw==
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id
 q18-20020a17090311d200b001678a0f8d4bmr5573656plh.78.1659683194207; 
 Fri, 05 Aug 2022 00:06:34 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-229-62.emome-ip.hinet.net.
 [42.72.229.62]) by smtp.gmail.com with ESMTPSA id
 i5-20020a056a00224500b00525343b5047sm2191616pfu.76.2022.08.05.00.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:06:33 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
Subject: [PATCH v7 01/13] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Fri,  5 Aug 2022 15:05:58 +0800
Message-Id: <20220805070610.3516-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070610.3516-1-peterwu.pub@gmail.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
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

