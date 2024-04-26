Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AF38B3DC9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F4E113B62;
	Fri, 26 Apr 2024 17:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U0ZFvSZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4B510EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a58c89bda70so138967466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152158; x=1714756958;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I46Ibjxmnn5yy081gSXZ9cudlQC/VlKWW3WhTJhSrbw=;
 b=U0ZFvSZLB7s2IGMVUB0gkhKdh9kaCC7ItFXF5A/7x/fSG0qOBdWQEL1NfBSpc4+Xpf
 K5qxXnWOieciGgkxg/7+Kh81Ml4N0ay0ioBteK9rhRu+8QDMQLng0zsuHv4td3b8ubUi
 95EduHO+hqO2dy+y+3+SJ0Tj3/wrTQOtzlQ0bRY6qYqzsWZNYaBJmKIs5WlSUDuCDdx3
 zLrQ4zDzMyY31pXgASU/knzfS4qLhBapJjA8BL0vWlyQbEtalLAiXhgBhxY/zhJ9nBoO
 T9HuS6LdBXKmBSZE1ITJ1loYBauV0Rn+T74cI9JTUlwS675NgHM9nNMLF0aNZC1KbgC1
 QnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152158; x=1714756958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I46Ibjxmnn5yy081gSXZ9cudlQC/VlKWW3WhTJhSrbw=;
 b=TLM5MGzfy/D5BIRBCkOwpV8YF8WbmZYNUIW9KbQvVDPGeDqDtQ1cOoaZpYb9J1hp98
 myUinh83xXu8ouHoIEzOv2Ml+ovYgqjyBJZfN36rSMsLvGWGe2aGZx+SmDK+Gt2pB68t
 myoWdQhA1IgdohWT1US/iQ8x8AECdqCJUsKcZpcXKabp2E51c30bifKy9bV6ij4Emfmb
 lJzfGTmF7R/rrzbOrRWPABBFFPXPbQoehCe3yPAYi2YbOTaMTU4Y4aJbzQtmtaNvbbKV
 QJ5dwDfpmIWy8xQefspCaEPLT/9ITGWStoqRdCQjCstnQ2S32l545WQlDkfiYdu0/iNe
 VZkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY60wjX7G01Emp5Ee8N8O2hBSNLfKapE5yBZ5mgLfMN1vdpTKVKLITycfmLVi5kMsZdcAULxV1tZWrdokGTXwsERjXsY2AQM8XrtI9UChi
X-Gm-Message-State: AOJu0Yxlwy9Pt4ssafuvbcoUGt8QfKov04GAyNIUF3ARN7c+i20w9ot/
 lLH/F6YcbF1HwZyoW1zPJNESuRvnK6AtrshJvcQVlZFlN+QbH3SjVZ2VPsK19gI=
X-Google-Smtp-Source: AGHT+IGUaKJ2bisa2YXm3HzCKI+QdDP+ZC4VvfOSJA6Lakp7bBabcfb0LXePJJPgP2PFAKWrz8G/yA==
X-Received: by 2002:a17:906:6899:b0:a58:dcc3:f4b0 with SMTP id
 n25-20020a170906689900b00a58dcc3f4b0mr580280ejr.61.1714152158342; 
 Fri, 26 Apr 2024 10:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:30 +0200
Subject: [PATCH v4 01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-1-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4568; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=XK/yaNy7n8mlOsrCzgcSHm0w5LeFndFZXd+EBLOo2Z0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaW9P90pKeXd7l0uFbxmJvFZ+dwyCWlzTbC45l
 x0lgcF6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURVvVD/
 4jEt2v5XKDN/IjGKFFuvIq6pNGahsS7ZaCjB/2lN8OHrRy2UjymVNP3DyzTCvPidzuU8W70lRgMc9C
 yzaalBkExgjofRIrsj68u/deILcEPJPdsTDI/zvxVa5gJwniDWdvbQI1nt+2nP+OsNDm4Z+0LHkHrh
 DJxwDRXbVfajNT99ZCUGvU/pwvv4NYQjzbZFOlSpcwqJpaQ6dA19Q1GtjVBF/UYBgM7tilY6qMpshZ
 NqnoNktnCWyjP7o3wiq0HEAuxdf497NnfUtm6L7vEO9hPmfVCShMlbUGGiK/m99rVcbhlsksRRgAV1
 i+lrUcB6gVXT1ZEuJTRvZWmSr8Fs5YnAZHJyHysRsGrOAjSZWTv53rfUDs4e9H7XxOiGEcaLx8uiEB
 xQBsREGu8uiffWcapfGZuP3ex17ptsLSqgTMgXfFCakTPXK2XciSh4AwUMMgbAgqQeVgQstL0bv+Dp
 1/QOs47jAwCSHx6BUb4xXxdjGZyMRoPaWzf8rmNgzd2hs4pH6kYyE7sqEpAHqYfnFZS/vTn/158G1H
 W/AZhb9UmDgrAxwrFbCGwtz781w2XI32H5tdVpG2KJPmv6v2tmk2hnLU7+Ah8WWfIZiUqWT9DyLvth
 RqBSA+8CCZIew6/xjw6F+xmAWJsbojdBIh86RPIYlZBr/Vp/ufiri5OU3y6Q==
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

