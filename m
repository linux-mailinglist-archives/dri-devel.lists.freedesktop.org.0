Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BFA673EDC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5610E9B2;
	Thu, 19 Jan 2023 16:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381C10E9B2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:32:07 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y11so3458684edd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YE4kxjCoA8g22WKPVKZXkJ+ZWFhCgt4Gpj2pAo7Vofg=;
 b=pINpCCbJuokFvEfsZ52A6K7wsjl18I2oknNeiQJ3ynhH3vOP35dZ86H2EQk+jZLamm
 uSi0+B4zjimfQTbOUGOrr1sxlCrj7SdzFa90u0J3qz6kdV0yN0iCk27WhipVl7S66LW4
 qQl+HvzQTcG4DcML//YwR1b0nW1FyOggmPkYm9uqtQ7u+HLE5N/4rI1rZkCk92OgPSTi
 ncIl89IWWMOoizVO/b7W8dH1YqoW5H231eow9nIOEthNHwM1W6ftRUfT2N+228kpfHrb
 4L+oeUVMx4nv9PGaDpZyJZg3ARr4a3y0tKOUOTTGE1YRyqM3mOoxo1MbaXVlqhQ4CXIj
 YImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YE4kxjCoA8g22WKPVKZXkJ+ZWFhCgt4Gpj2pAo7Vofg=;
 b=xoY+nROWrKo2vddJsOMgoaZCeKI+fn/EmADVfGTPa6SUn0NZycbgeHhQxUhRH61Q3h
 B269qI8tFoeCwiAoU8CDnM8PtSWC+ONQb+hgMSXcEWu8/jPQgQPtmJ4z0dUFX8Vw9Af7
 4uoBST9Q+dmQ3sYwZ+LQfdlfhz448LWRmVVEPdza/+m/Vm5fiic4ylR++JCnXMr+2Zqw
 la0ceQ53YZR1nkKGbQpzywaAJWI0Kix01UGdOpG3IyuEdcOdqTW6rYPQnBuCJoqYQsd7
 K4mzp1Y67jn8rku/8XJvswi1p0P36KD5PpWAN2BViyxtgtiPOSYE2nB7/XfxcDZ+RD2C
 V7ew==
X-Gm-Message-State: AFqh2koAJA5jbrsC7DppKX4uZRl0nAlYDJ9gpx5krwPFd2Cx1yMPjkYM
 5msWIADFPspKTCCJlMxLQeA6Dg==
X-Google-Smtp-Source: AMrXdXv0JD7ArwgvLKwUjKMA3A7LLoYNY+CcCHNC2j9dwsvXlVKHekCHCKeXSxiUkSXs/UeW80N1lQ==
X-Received: by 2002:a05:6402:1ad1:b0:460:5706:d1fa with SMTP id
 ba17-20020a0564021ad100b004605706d1famr12010299edb.18.1674145926252; 
 Thu, 19 Jan 2023 08:32:06 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 fg11-20020a056402548b00b004873927780bsm15669466edb.20.2023.01.19.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:32:05 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 1/2] dt-bindings: display/panel: Add Sony Tama TD4353 JDI
 display panel
Date: Thu, 19 Jan 2023 17:31:59 +0100
Message-Id: <20230119163201.580858-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
Compact smartphones.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3 -> v4:
- Pick up rb

Link to v3:
https://lore.kernel.org/lkml/20220930180812.32210-1-konrad.dybcio@somainline.org/

 .../display/panel/sony,td4353-jdi.yaml        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
new file mode 100644
index 000000000000..b6b885b4c22d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,td4353-jdi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony TD4353 JDI 5 / 5.7" 2160x1080 MIPI-DSI Panel
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |
+  The Sony TD4353 JDI is a 5 (XZ2c) / 5.7 (XZ2) inch 2160x1080
+  MIPI-DSI panel, used in Xperia XZ2 and XZ2 Compact smartphones.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sony,td4353-jdi-tama
+
+  reg: true
+
+  backlight: true
+
+  vddio-supply:
+    description: VDDIO 1.8V supply
+
+  vsp-supply:
+    description: Positive 5.5V supply
+
+  vsn-supply:
+    description: Negative 5.5V supply
+
+  panel-reset-gpios:
+    description: Display panel reset pin
+
+  touch-reset-gpios:
+    description: Touch panel reset pin
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vsp-supply
+  - vsn-supply
+  - panel-reset-gpios
+  - touch-reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel: panel@0 {
+            compatible = "sony,td4353-jdi-tama";
+            reg = <0>;
+
+            backlight = <&pmi8998_wled>;
+            vddio-supply = <&vreg_l14a_1p8>;
+            vsp-supply = <&lab>;
+            vsn-supply = <&ibb>;
+            panel-reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            touch-reset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.39.1

