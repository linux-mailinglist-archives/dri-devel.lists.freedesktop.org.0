Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F3751CAF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880B510E644;
	Thu, 13 Jul 2023 09:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841710E644
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:07:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-98e011f45ffso68767366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689239257; x=1691831257; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8Ye7/VW9cCinL56beHP9cBXIlGvn2H6A5gltzFR9xZA=;
 b=fWiwwbxu2tZ/kId5fwzzZGDAKUkBpJD54BFOz4Y5FvfS7va+VQho01ZEaCog9vYDLO
 iMExqgohH4XqmqSSMtaoH4fwFgyz6PCIK21FYGs/IM2r4NKawCy+rcNp0UQsIYeNjTci
 5rSEReuA5FVjX8Q0ArJlSnRnFM7vtX8Ui4INJMP/ntQ4znxTd5xbgSv84cvou2UgBHL+
 tHAlJQ3dcl1E1LqxuWp61YlNabpg7PN3LE+5ZGD6XrE5PwrO2bK2t27NGUZScesXXa58
 KqmhsoFlaSAswcWnHT0MZzQRsJvRgkH8HvMEXahTfCCcwGdqR1EJ2usjoWucarcUNwC7
 F3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239257; x=1691831257;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ye7/VW9cCinL56beHP9cBXIlGvn2H6A5gltzFR9xZA=;
 b=FXbTop1xW/5TdE7r1Vzu74HiCj2TWJ6Xlx49WP4u3+Glv5PtkSUvdPnc5d7y1MsnNn
 1ftZ4U7sTT8WXB4jPl3CzNCJvEdU4bqxNTSmTOU/3RhMuCIuqUWhhMZlcYoIWuGMUaBN
 V8P6n40dqot6KBGHvEZkD+PH/XrM+fb3ArFFH6LuuZSutDzYJCpI4mt9o8cVAUnU6/1G
 YqDuOxfDjYhiNK2mOf6Mb2r73ff396vzuyGoc+JIPBykck+fUGVb0lFQfn+yaWOjijCU
 UonarCF36+aoVNQLZbZfrOuKJ1A8qaGKR9ucf2kcAvhf2Jn3jrs2f6FdNZReFirc3kz9
 psaw==
X-Gm-Message-State: ABy/qLZje4sisXGNaaPVlzJb7IgkHoJK9HfBcpiDuxcFp8XgvZ/QXLCK
 kB7o0f/5GmDNRqDFLnuD/mcflw==
X-Google-Smtp-Source: APBJJlE4RWnu8UySeR+I/AnNMVTMcejh9JKrDElN0JzKyETRe5T2FP4ozbQk5XNxWaEvbyhRscqEPg==
X-Received: by 2002:a17:906:30d3:b0:982:82aa:86b1 with SMTP id
 b19-20020a17090630d300b0098282aa86b1mr726658ejb.43.1689239257081; 
 Thu, 13 Jul 2023 02:07:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 p18-20020a1709060dd200b00982d0563b11sm3707352eji.197.2023.07.13.02.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 02:07:36 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 13 Jul 2023 11:07:33 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: panel: add startek
 kd070fhfid015 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-startek_display-v2-1-87bc7bdec6e9@baylibre.com>
References: <20230711-startek_display-v2-0-87bc7bdec6e9@baylibre.com>
In-Reply-To: <20230711-startek_display-v2-0-87bc7bdec6e9@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=602in0caqHCjA6zQgFgfTHmUoHJFTSnnwXSt1PAlxS0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkr77WZ01MReGvODiP68t92SzPhhTQdaCvcjNlnSPb
 u3M9RI2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZK++1gAKCRArRkmdfjHURQ9hD/
 4+x3Yzdw7Yq66K/FsTF6eEF9ZVve4NbbN8bp6Moh35esqNZ6T6tErXTZHif+nIn16rzDxqdHfGoP9L
 m2vEMUKQMaKfoIxqKmG345Se92JawH/Rj0KJkaBXUs+p0xR4Z5tEhiHpx5DRLRKCmvA8yF7aHRPFVy
 CocZcVs044MRcJ9UQMTLDWKOAvrwPfkyQOO+3UaPMRG3MNpet1nXbDw/UsMQ9EAgztelmxKb626fmE
 7/4dOBXhpmNH0Nty3gM1jxDX+Huy0B5NOC110kQGBr3cUdKlz0DLc022Fc1rkcyoyEDBmvFY28O3dM
 78go+FAwdBH9Qkd95fVXzDEU89z7KRgF6UZmZs2FVF1exFJtcUPDdKXisBCCSms6I53BF9Y55F+R28
 plyBnZmBsv4TgNNgfSr8rx1xIpFaLKN5HBfVMwGnikvRkzX2PWrArPaaR0SCP+CltrZDy76cXdaqzF
 CPIkJjICGJPOwKHHxrrGb7Ew8k0CJaw85WtWvpw8FevYymR1/sAE8c/fV14kUB32we3tkOA2RSxZxD
 sXUxleJMcEMgA1eTEEI+AUg6CupqpU9RFjx3PnVN8OiRXvwDy2qRHRmEWQh+cDOsaFLYnD2Jf0oeVw
 RS53/G607awTAhSQSx11xeR8JVRG4Vbw/sb8i7CSTQVqVi7JnKz8CQF4Hjgw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Startek KD070FHFID015 is a 7-inch TFT LCD display with a resolution
of 1024 x 600 pixels.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../display/panel/startek,kd070fhfid015.yaml       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
new file mode 100644
index 000000000000..d817f998cddc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,kd070fhfid015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. kd070fhfid015 7 inch TFT LCD panel
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: startek,kd070fhfid015
+
+  enable-gpios: true
+
+  iovcc-supply:
+    description: Reference to the regulator powering the panel IO pins.
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  port: true
+
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - enable-gpios
+  - iovcc-supply
+  - reg
+  - reset-gpios
+  - port
+  - power-supply
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "startek,kd070fhfid015";
+            reg = <0>;
+            enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+            iovcc-supply = <&mt6357_vsim1_reg>;
+            power-supply = <&vsys_lcm_reg>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.25.1

