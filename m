Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87858557935
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCBC10F406;
	Thu, 23 Jun 2022 11:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B6910F406
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:30 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 p3-20020a17090a428300b001ec865eb4a2so2336003pjg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7HWR+XrxeM7/sjAiAZKDHqat2vkGa8jaXAxlWVZnC0=;
 b=V+78teS62SASXdOfx7TZewVrd1ivQP7w33yLDNP9CtG8d7wYoepRejnElm/F1Aotlx
 FWfyPFiSR6EIRJzroGdrNhSCHlZ+bwiIM8Qi2dA2Hl/cDVUQ3smD7bghNfZht3mFKpN/
 PacdhwHAvzWrg9uFXN/BjJks6N0Ry3wWXbEiPvnOxQUZ3mzg+OIxHy6mBsvNkCpAEfNd
 83nmGJSbFzkNXraC7YiDrSpfdhENH+XWFqtuYf3eqxmi4V4sALj2HI9qjv79m0wlYqEG
 KINu1F9SLWcflzZSj5Ctw0vewxGzAEgP37r56U/SVQ93rPsO+Hy6yMIDDeHwWw2gnhuV
 cOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7HWR+XrxeM7/sjAiAZKDHqat2vkGa8jaXAxlWVZnC0=;
 b=LSy61njqwYg2Pw0DgI1nNo5fBKvJc7BSkdrG879tlrzYfuuOoDjcrirWBhDB30cIR1
 11DNIOYyn/FASeK8KMeyew6q0EefaYkke7/VEFElPZAVP5Pcaq0CE9mxd7xNQuZ+usD2
 8J4SG7pHRPpiVhDy7OGvycDrAkFi9WAyrB3bUAp8Oa3zWveFFZNhyYl2niDlhffa/qRu
 wqRbgdM66GBUCaJRHnEl4T1GHxDvWxMubE7wGMKtOsbveJPhoHnCCrsJMr0DEu/2CWda
 Q/MI059YDJjG2Cg6aFxPKtNmuyLo0z36VnLDmG+QFqWZdGFsdF8yrexzCQnZbXbR3tfd
 5YxQ==
X-Gm-Message-State: AJIora/kP63WRxJ/TqWeubOnbhsdBfz1US4NwVjz7+/rYO5V2KqV5LX4
 tBQuUsiCOBs5QiRDiJaLJ97kvAUzAvo=
X-Google-Smtp-Source: AGRyM1uxQ7dI2z4dyCllfu8yMXjcF4cxOxSDFWef/L9zfYb81WNkJaw0YO3RFllbFfTRoD4s7yXzBQ==
X-Received: by 2002:a17:90a:66c1:b0:1e8:43ae:f7c0 with SMTP id
 z1-20020a17090a66c100b001e843aef7c0mr3621574pjl.245.1655985449724; 
 Thu, 23 Jun 2022 04:57:29 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:29 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date: Thu, 23 Jun 2022 19:56:21 +0800
Message-Id: <20220623115631.22209-5-peterwu.pub@gmail.com>
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
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---

v3
- Remove the description of enum.
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

