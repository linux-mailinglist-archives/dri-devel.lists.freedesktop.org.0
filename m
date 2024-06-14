Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9E9084BC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0757410EC61;
	Fri, 14 Jun 2024 07:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aUn5ui24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D9F10EC60
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:05 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42198492353so15293215e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350084; x=1718954884;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
 b=aUn5ui24ui3et/LafSfDHZ+FnwLL25QZU3FlZT14b97ccESZX8QcMz1ZCDbSljUvGB
 skNVYHWIwPL5UCStCUjMKu2uTs9F7OT9LiBM6iSo6M777ycpicjra0iUUs4epvllZh+r
 6klkxtJBfEsPqGu2If1G7tz+CHts4kS2beWmubovLqNCrbS1QXcSNv4usMp3D5/NfOik
 nYk3WQSA24LznBWJj+bnklyKFus6RRSaNrLiSazJ6jlXTs63uqtB/l85NoEJpTPac1y+
 axHY9a87+3VPBVnYMvya3NI90lZ0NRzT84f+mL9IXl5VA3peJGzSqdCUM9dWSlln7SmK
 W4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350084; x=1718954884;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
 b=E6nLVT6W1MyGCNeJcP6wLh339upELE12+P+BibS/5OrWe7nA69Dc1HRwgj3DeUL8Vd
 hHchaV+l0k9lx+1WHIUu5jwmFWYKruayi8oEmujuG2OwgZO0hvTb7bzFyEUx9meEbtx6
 mnw0Kb0RGdiFPCpT192lzjkUssCEG1cQXF5dK8Fd74WOxfbg3I3Whbw/RlPJwazwsS/P
 Ceodezj8hGcohHCL+3TOCMYIpwGbNuwfv0WIM9Eqfu3UmP6KRZhHLMU0ZKnT8b67GXsk
 4dQEwIoUGgydwXkXTuIZ3o/FcMxyo7t05kskyyQaduUQE/ihXueJWy6d+djkSjmHD7yK
 rh5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWjPfQ5QoRaCVQzoFozffwtwdTFY6w6pdAA9eox1Xe00TlcwCTeSCWSYsPhNawgHYaVyNHQ29dfD5v5EjEKWrdgwEKiAWNg1KN+rfuoWp1
X-Gm-Message-State: AOJu0YzOqCyLHxos6aZeQzk4o+yvlYIwwe6O0vdG1r/JNmhtn6jNGFz+
 XCvOvqjBgIN1bQ0Ef+3fuLhtoFr3NaqRguiSEXyAo3KRWnexCgGfRsUL0OeRj7uLzUig71+hxSV
 EWkI=
X-Google-Smtp-Source: AGHT+IFqz1dgy+EkZ2nWMXlLo0facR7vF/K3mVFSrIkL1XoCW4xdx2J4FdrSp/oL4Wg+mDoijesP2g==
X-Received: by 2002:a5d:4d43:0:b0:360:85cd:15d2 with SMTP id
 ffacd0b85a97d-36085cd16f1mr192260f8f.10.1718350083878; 
 Fri, 14 Jun 2024 00:28:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:45 +0200
Subject: [PATCH RESEND v5 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357:
 Add audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-2-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=cKEFvnur0r9wK70qRsiyMlYMUWCy0Z2MhPoP9t2s+R8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+nYv/EDAhy7H3m6RJwWmdHTceswfrWziDe14m
 yVtbhD6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURYXjD/
 9Ieu4k836F7MKBxZp/GH6IhoeeM1ScLClCw98D55FAjs2uE++c4tkQxd7j8s6vCf7baH4Lx7C7yUBB
 +kvTzZsC/KUmj+U7LgNfIfFOrAgbRGeV9Zfi//swaATwAP2rg19KQHp0M/tAe8OYnXQrozYM2lcjsy
 rC0bOMFXSB020FkuEj6dzf97RlMhUZDrVK0a9KOLHlFyGfc2I+ZkNskoJr0c/i3T1UYGOhHc20euTF
 pMterSUcfV7Z1XsktI3FXVH98tUZe+vPQoYZiAWZ/MHSn/L4k6tIkZvmVAI4PaUv+rFpZWO/NI+Vxi
 tVccXoWKqyghEwH7h4mLxj1SisXk47uuUYuEcDUWHWEYxX61mqNXYS7W1bPm5qDcch6o0E5enT2iEe
 PJAKH79/zsAD5J8R+p0ZS8y4rNy9H8bdUInH3C5Fk959FAQyy1384QjeBPcIAzHSCpkmB/jMrsKs8H
 MMMjmvsKCu6qL/0BCAUKAS925rHQam8jkUMS5QN/KC1Ab9l9EQLlRsMntR3hf+n8Maxg1k+ih1Njzp
 7LNoVRnCYdbejWyCt2PtnGeCgNV0QxgmKRUF8NucRFlmhRgk0eJfSMGvjZjeCoj1nQK+7ZgT6ND66I
 qGm4dfthK4dlv6jg0+IgPREH/Xgc0YYQzLjdZ2BR1MxwANdORr+6obyk/a8w==
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

