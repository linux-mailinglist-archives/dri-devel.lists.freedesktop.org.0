Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7BB8B3DC8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBFB11252D;
	Fri, 26 Apr 2024 17:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LKQwoqsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0238E10EF50
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:41 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a58c09e2187so218575966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152160; x=1714756960;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4TU43dOQH6UMfjQS6G859NG2HaMeSGxyH5T3QTnjRnY=;
 b=LKQwoqsv/kgfroR7ezwGwveWwfyQmIuQ7qprJDV8y0YMH7mRa6Oa3uHFj8hYPj+GMk
 AH/5P9CMaEe8lVluIUkbpDSmIEtqMNb+z2S9315JaGZoB2TKCu7dQxbPQ+MSIpdghzXz
 oLgi7e7g2AmF/6ez9JACW6pEgz8S7Lom9ODehxs0MbVSU3VZALRCSGldIHYqGbVVYxaT
 lr7HH6/gNzEn7VwZBjET+qMyR2TO9Jhuaygfmc6bCHnOiWwmm0ysa8iFFyBHveljgo3j
 zyWncg8jEDBAReRvImP58+v7bPDCaZ9FDeh3pgyipEnjRKCnJp2OO76O6jKQ+4dyhsf9
 tO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152160; x=1714756960;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TU43dOQH6UMfjQS6G859NG2HaMeSGxyH5T3QTnjRnY=;
 b=PRPeiQIz1sM/UXk/zYPmZniPdMYzQ5qbsHNC+fX0xSKKm2jXBjGVM6+TqZI/M2EV0J
 EU+6oTtqpFZkyMqVjZVD/mofBCIMXAWlU9wSJ9msmimWdAjfxPEIT+FaNgQ79jCj0Bne
 apCtDRG8FcTElbRDDolTCxC7uliG+hVevSRyIhgBJMYGE1beFxpE68+FE9012bCqn9Pw
 sjTuEaaDacjpK4+2K6uP6VHJr5UXF+1X14efBVMVssSIzbPM0nEW9jKCKphqiVuVAvG/
 p+35Kr94DuRJ4719r4N/XzJxhLI0SLFv+Z2ue+UaJUchoKi5mCGnoYai12IubdkXUyWd
 W8EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkPPbDGYcBNubY749Tn0w2+aW6vcBpOFKfUwCZBz8biGcyUfZ9V/xOC/cn4RfRAFPB+gnPWrnyrWOnZGKqYFplGYedRYeuYjC3caBxluX8
X-Gm-Message-State: AOJu0Yzxj9mc9CxHLasIwSOX0ygxKA/HBUMDfWR6mtSTFm9uWdO3fZmh
 lo8Se3FHYRKUL98TKvvR3RQF2ZI5XHlWjmTa7ygCY8HWaUrPOVQx3o4d1kgK0sI=
X-Google-Smtp-Source: AGHT+IHcBmX2GHh34oFPQvGPIaePMc8392KtBItCgcwB4NvhhucWlDZ3EAw/bb4ovkR1+MLNq0adww==
X-Received: by 2002:a17:906:c288:b0:a58:7283:f587 with SMTP id
 r8-20020a170906c28800b00a587283f587mr2140675ejz.33.1714152159933; 
 Fri, 26 Apr 2024 10:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:31 +0200
Subject: [PATCH v4 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-2-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3263; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=RfcGWh4J4Ru+vCmoaCssck50D44laU1fHfw1FIxcYyA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaS/TeL9lgDhsOUZkB6fGKdDfM1W9MWsbPfEMi
 JmdJbfKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURUymEA
 CNNp4DesNUeM0GUuDt/1G0pbD4jz4uHrL7JeY0bqC+GS59MxGwPSYDsmHoHACfSv4Auy7Mr6AI/lCZ
 eeXcrfAg3jGsLq5nDOLFW2YyqcKs2qvOvG9RpMGF1E/wmT67od51GEjhsbpTb36vjAi0fxcm3BKCm+
 DpW18Cq1LhI9Y9ZU66I3WaBcrXlVHRnkEIZeB5yop2GKPBii9g335yPsuoh22bIBH0raZGWiSiqAwd
 hKwCfsgHJtLO5wzTELCojIwEEn4N06TOk5GNSaihM875N7w1zaVYNte+wgcnALZJdRDXkbHL9aeQ19
 zJ8793FsDW8jCjldeIdQO2LKbFejGNT7FUSJU3pKTZUh0M9pQjxi/9mk3OeBTVdCy1+fiauYHLWcwl
 xDZzjUtyxaykzBuf3jD1/VWlOGLa2gj6Ks5F7CzvMRM58kzZIgqlxPEG0+3hlaHXLSguDTThAfAxdb
 /JzwzQRxVhd4RyTRjGlFjWaati4BOFMtSpzeTn4wWF8y0xig/3+US5yuIVRD3c73+AxRGQ1dWmsXH1
 nRIIcapVKL3KCjh+OlxcOV5kON4yPMVq0Dm2sPXnyhlWYq8I5oBQ8pM9zMSDrRXbSpiw0XvKYR73M3
 FnWVbmFMca+bUJ5NXumQ/E9Edev7275CsD60sYOS7BYPnfZ/wvs1w8kOqAzg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..f68883da1bb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 ASoC sound card
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-mt6357
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: dmic
+      - const: miso_off
+      - const: miso_on
+      - const: mosi_off
+      - const: mosi_on
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8365 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      codec:
+        type: object
+        description: Holds subnode which indicates codec dai.
+
+        properties:
+          sound-dai:
+            maxItems: 1
+            description: phandle of the codec DAI
+
+        additionalProperties: false
+
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum:
+          - I2S_IN_BE
+          - I2S_OUT_BE
+          - PCM1_BE
+          - PDM1_BE
+          - PDM2_BE
+          - PDM3_BE
+          - PDM4_BE
+          - SPDIF_IN_BE
+          - SPDIF_OUT_BE
+          - TDM_IN_BE
+          - TDM_OUT_BE
+
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    required:
+      - link-name
+      - sound-dai
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - pinctrl-names
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8365-mt6357";
+        pinctrl-names = "default",
+                        "dmic",
+                        "miso_off",
+                        "miso_on",
+                        "mosi_off",
+                        "mosi_on";
+        pinctrl-0 = <&aud_default_pins>;
+        pinctrl-1 = <&aud_dmic_pins>;
+        pinctrl-2 = <&aud_miso_off_pins>;
+        pinctrl-3 = <&aud_miso_on_pins>;
+        pinctrl-4 = <&aud_mosi_off_pins>;
+        pinctrl-5 = <&aud_mosi_on_pins>;
+        mediatek,platform = <&afe>;
+
+        /* hdmi interface */
+        dai-link-0 {
+            link-name = "I2S_OUT_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1

