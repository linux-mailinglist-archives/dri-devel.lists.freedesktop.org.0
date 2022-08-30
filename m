Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565F5A5A36
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAE810E9CD;
	Tue, 30 Aug 2022 03:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC9E10E9CD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 03:41:59 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m2so9879663pls.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
 b=kC8ejgxBHW4BvKEvMuzbJ1b7vMRdrhYLsB+0dVMOcni16inBeQb9PK+Uy1jwvm/SYV
 8ldjsDxnSq+lQiOLdlADmDYA/GFYN5MBipfGf4w+TAyqewCDjTsepQ8S2jvZv1nDFVju
 fSRr5pmIy28/XEL91D0CILqJ8guDmAL54TnK8xXqkApiKByjq7PXUmXHjTuWHU6MDk+w
 zKdjyIQSbpb78KZHgdTEC2ieq82K/HokmOsqXUs3eBayOFk5FguDrbgf0Qt2YIAb+LjQ
 Wpta/W0OnEdxtJZhNXKvhXuueNzcPLMKpnlpiulpfF++7H91FWLZIbTuqJOdpZi2V2pr
 FPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CX/0guoh/DjN4wN8JJoOSTPFmeqM5+Xm+kwBd/9d3Ho=;
 b=MOFqESiiPo7JcCCIYEQp796uNO/mW2QEAOGtdh1TsWbdv1KVefpx7o3sQA5JnsJVAc
 CzK1ofdNcoExi1AQQyJJbzpNbHAE6sahsns0wMKhab33E44Ci/FFIgJ+b0JXjVwQs/7Z
 PWwutFJpG1VAZdK4l+wkE7r52FIk5nYQNvX1YoC9Hn+V4uKPq3HAQFebarU5DpR4iDHn
 OA6bVVagJ1EZHjAA5Fm+jAvA+p3YGxPZSVjzdCUvt+5N3cjf/CmoKS5LakcZM5xLT+YJ
 FjdMm1TUeei+w771HJIwx/e2SceUHraBgAxO8+0x4TbTDjTvlw8Oe1h3vuW1512DAEUT
 /I9A==
X-Gm-Message-State: ACgBeo0kIuQhdVq8kMFEXruDJDmMKm3dMLH5yNccxuLIgDhWge3BkjvK
 grgugaEQmFV9P9mraLtjpWU=
X-Google-Smtp-Source: AA6agR51dE7ptDcuLrufetVtj+iEdfE6N9pp0vDnAfNSISu8pYX+GFkZu4hpsqWd6ml8H3VuqulzMw==
X-Received: by 2002:a17:902:74c9:b0:174:e7dc:1dfb with SMTP id
 f9-20020a17090274c900b00174e7dc1dfbmr5407565plt.1.1661830918558; 
 Mon, 29 Aug 2022 20:41:58 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net.
 [42.77.88.242]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 20:41:57 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, mazziesaccount@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [PATCH v9 03/10] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Tue, 30 Aug 2022 11:40:35 +0800
Message-Id: <20220830034042.9354-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, cy_huang@richtek.com,
 andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4

