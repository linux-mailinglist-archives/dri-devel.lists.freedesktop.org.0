Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27089575FFF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B79614BF7A;
	Fri, 15 Jul 2022 11:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2E914BF76
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:26:28 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id bf13so4128025pgb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
 b=dM2vJA4m5tndM2YqWNChQvV612aceWv+sz8S5PyiJ4Y5aoTV6LOkaJQWmzUP/xg6ta
 qCYtaPPtLJeMJ0nVjU0teMHZf0hNcD6E3WCpSyk83tUqWoOBINoWz8XUkEGdT66AS4L6
 QXlWza3ewY9p7byKmLDYj/TBoSPbUbX/mIm/OSCEJTlTLDvOfXtvw/j4ABRsY4hVSaWC
 lk2n8k2vG492/R5d2w9R1jLn0KprrlC7YPhxdnDJKjeTqjnUQ6w/ERzXb82a+Kj7h9sx
 b+eDRz6hlDAmmJjkQeq5gytTxbfE0dDujNUpoc9zbwe3YYgZcUThwLqdBYIFaUUwunAe
 LwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
 b=mdrT2j71tpnDYTEskr2ruX5nbSwT2/X2C5cleJ7kO2f7piCiWkWuiDwxn5bx0zoeav
 IvvBLc1H5Hera9MWvy84o2CMm19G59OChIw8MrzE6NSrj9+Ad6l5QAbjr5ZHyE79mTSF
 MKbt1UyBRBdMekJ4NVBtxn8y2vIi5Eo3zksALRyTeP70Hx0l1ArPwxON3IMqqmCY3vGT
 l4ha38oJNQOfPnXFpO6Amzxw+VRW8Ujn76Kro57s43epf5e7UswJP/kUvNV91HCa3JlD
 vqVA4GL5jfySwi+09uanBDFsWQcH70/4MwVHVNgfFww0R2h/jbK5tHa9knHk465Zd0DJ
 iTkA==
X-Gm-Message-State: AJIora94ruUe5RVHzqr58uZIzEbtiXCHcsPMhScGob65LrJmYyJ5jIyH
 jY2R1QXtanO7v0jFSoY97OM=
X-Google-Smtp-Source: AGRyM1tpynyvAvekOW3RZZP9tybhRUVpPyV/kx5yxMHMHgxsvvYgAcZ4Bsjsnpz63WdQnjk7NScSIg==
X-Received: by 2002:a63:8649:0:b0:419:be28:bc36 with SMTP id
 x70-20020a638649000000b00419be28bc36mr5791024pgd.549.1657884388311; 
 Fri, 15 Jul 2022 04:26:28 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:26:27 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 01/13] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Fri, 15 Jul 2022 19:25:55 +0800
Message-Id: <20220715112607.591-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
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

