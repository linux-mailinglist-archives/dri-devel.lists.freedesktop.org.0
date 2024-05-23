Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835B98CCE45
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5260810E119;
	Thu, 23 May 2024 08:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="grpr8Ukd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61A110E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:42:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-420180b5838so36560205e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453763; x=1717058563;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
 b=grpr8UkdR/a21yzAc68xYMIkm8wAU4lMeEm6jcb5HfgTc4e3DJSUBciysvj23Ilq8k
 IYh8saBJPDXCiFHxXm6NJ506bqMrBp121jbSiK+7asBZHg26bCF54od9UtH3prf4ArfM
 2F5kASgSE/xU2dpMDF+ZwaQDu1nKRiiqtRaUtyGKdD7+S++n6VcdVrsGw3/dXeVyoJ1I
 w+koL6pGj+rpQVJraBHLExVlAvAmp9PBX81xXDH5N42+T4tdf6UE7MIjs4Iocplo68Pl
 cZ9Yj1M+3EjJisyIImi8hWBLLRazymi9VEPn1n3wiJ47a8T8mN/BTlKt8QlYbmCxqAgO
 aYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716453763; x=1717058563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
 b=BbV7QvAyDuUHqA/hUPWTv6H/W9zFLmnIllgFhEq6utbEdjz2t4YyeqolcgNb1H4Sqz
 3+Bv1rHqro3YPLWC95LwEDbSqD53nHlgV9IfX6gJ2AWgo5eU72FO1dsr0wYOtGFhjQN6
 5/Ynj9qo0V9vLyYnr98pz+Tinyxc98t2l8qpZPAfbmVw8cBDSA2CxDDPsgv9I/dbJSEA
 bLCVd+U2VeRhANxm1P87NLMoT92pM/9j2mJ12jmh0DCx68EZ3CFmTDVvmWJNFGQqSPYZ
 VqZ63XeUOihwT4sA6PnwkiE+FHK2q3hoW/cnyWCzChpWzLBFGOW27Kik+bFEl88hNrVy
 M6oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0w5gaH8hsMrK4tuV8DxAzo2CoLHy5ZT1Y9i0mQzP1kht5jz41N0tQsU9F2fL5ah9W1sMH4mejEPwaufGBwfVk5I7mUqoHmusOaFi9NEzO
X-Gm-Message-State: AOJu0YwSffku+K9GqvS4LuVhKLZNC3PhDLM6gdGhRLkKM6Pca+VRJekr
 v2lh79fNJBucL6O9IA49piWt3Oj2fDYC5hEFBVvN5w8VU6h60NZvrB34bTT/Y64=
X-Google-Smtp-Source: AGHT+IH7hyyw000WAGzijwKmdwUBDb1aNXAh4qoFcc2mlr0bQckNxtlwnkKQyoey4PnV8suD3sABYg==
X-Received: by 2002:a05:600c:5107:b0:41a:8b39:8040 with SMTP id
 5b1f17b1804b1-420fd310f00mr36829675e9.20.1716453763039; 
 Thu, 23 May 2024 01:42:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:42:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:30 +0200
Subject: [PATCH v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-1-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4635; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=wGHr7LXYjI0zdZuoQSWBZeA6hdla39Tj9ahiPZjJ+yQ=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/aurR13WZmMOpkRRgAOb0ci6xsJeF8om/A+Li
 hD2G9reJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURbqjD/
 9+1I82LSrDbs5xl7ksW8OYAkdDDnVDwHe6KyBg7nUF6flxoCldKlqO5RYVYPeB5PC60mG+I3JWl8rI
 R2iD71p22zaYPQRvJz5Sgn6yCKxRzNDbJOLNr6u0KmtlA6oCMQgW9uH3RP5NGW0shOd54J0Tkpgo+d
 deDugEB597J785L9+cj0QRU0WiInqHOPKUbdEOufWTuQFHi+0E8QBWBzAyppB1bM3vPCNapuE/R79A
 1mE8m6bTcTnpmNbG1fCcCyZ/c/MMtQ+WUJnfLAMPvaARPJ99WhFuStl5F9hlQ+KcJSsv7acI/hleFG
 /0y0w1OrDiP+wi+5Pjzevrb17ml5NtQTPdtF/gSZ5C65mJ01YXanjC8CdsX0MDzyS0ilCvb1+N/IQv
 OK09lnRn3t6vaIDwQafINht0fhxmMmQP10vJbXssXY1kHygkjU9H4A9BDuoBhInwJ5jb2xT7g/VoTp
 sJldDPn/lttwtC9Cwds0p6A7waVECp2X84h+czzXQX8Aj/6a6Bj1J249SMWYcvJ79J+MkYmOww96a6
 eAB2GVtj3QJ68sqiv0bLDCAim6GoB+bUt7JQDcdNQZ10h+ExakAkz/tHRRNaqhqhslWGpmYM4knVyd
 jb04Dnezgv1G1TnxkeKonGK3vkfDC290fpfYTgukDre6C63Dvdu6i0a8alQw==
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

Add MT8365 audio front-end bindings

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..45ad56d37234
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8365
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: 26M clock
+      - description: mux for audio clock
+      - description: audio i2s0 mck
+      - description: audio i2s1 mck
+      - description: audio i2s2 mck
+      - description: audio i2s3 mck
+      - description: engen 1 clock
+      - description: engen 2 clock
+      - description: audio 1 clock
+      - description: audio 2 clock
+      - description: mux for i2s0
+      - description: mux for i2s1
+      - description: mux for i2s2
+      - description: mux for i2s3
+
+  clock-names:
+    items:
+      - const: top_clk26m_clk
+      - const: top_audio_sel
+      - const: audio_i2s0_m
+      - const: audio_i2s1_m
+      - const: audio_i2s2_m
+      - const: audio_i2s3_m
+      - const: engen1
+      - const: engen2
+      - const: aud1
+      - const: aud2
+      - const: i2s0_m_sel
+      - const: i2s1_m_sel
+      - const: i2s2_m_sel
+      - const: i2s3_m_sel
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 1 means two wires, 0 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        audio-controller@11220000 {
+            compatible = "mediatek,mt8365-afe-pcm";
+            reg = <0 0x11220000 0 0x1000>;
+            #sound-dai-cells = <0>;
+            clocks = <&clk26m>,
+                     <&topckgen CLK_TOP_AUDIO_SEL>,
+                     <&topckgen CLK_TOP_AUD_I2S0_M>,
+                     <&topckgen CLK_TOP_AUD_I2S1_M>,
+                     <&topckgen CLK_TOP_AUD_I2S2_M>,
+                     <&topckgen CLK_TOP_AUD_I2S3_M>,
+                     <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+                     <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+                     <&topckgen CLK_TOP_AUD_1_SEL>,
+                     <&topckgen CLK_TOP_AUD_2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+            clock-names = "top_clk26m_clk",
+                          "top_audio_sel",
+                          "audio_i2s0_m",
+                          "audio_i2s1_m",
+                          "audio_i2s2_m",
+                          "audio_i2s3_m",
+                          "engen1",
+                          "engen2",
+                          "aud1",
+                          "aud2",
+                          "i2s0_m_sel",
+                          "i2s1_m_sel",
+                          "i2s2_m_sel",
+                          "i2s3_m_sel";
+            interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+            mediatek,dmic-mode = <1>;
+        };
+    };
+
+...

-- 
2.25.1

