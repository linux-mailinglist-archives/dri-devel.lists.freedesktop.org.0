Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C8590F103
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E3E10ECE6;
	Wed, 19 Jun 2024 14:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vfApY9Dk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753AB10ECE7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:46:49 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so1040682266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808407; x=1719413207;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
 b=vfApY9DkuniW7mGcKIw6MDoek2swgwwwQhNspQsMbApNpcQmHei9yQNofLz2z6a/8z
 ufQzXVaHSOT15gBnx1WI4W/3nAiaXgDSzhON7VqitoX+6Q1PNmN/iits0BZswYshdxG/
 gpcQBAqRxrT0LSlWufTwC6rvJJ0DIIMHtmJbpMrDYZlGAxYCU/Vbr7tVeVnqLt/xHFyc
 LCHp1XEDGFR+b/NJ7oCSFPP0frX0boB5qtsQgEQXg858IryAgYWynNdeeZJ20p5l5INZ
 4qHYzWn7HrnSVA+Zl9e3zxZeq5IH83cL/QIoSVTNL6+3jPGM++di/YIYSBMjvcaKCnfH
 4JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808407; x=1719413207;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+Cj7XwFFzAC2R+vJ+C1jfJoPbZ6EO8weZS6/aNxaN8=;
 b=ptee4ntq762UjOXWoXvh1CiVm1tJynib6rkCW+k20P97L6NLo2zf1Wf+UxbfEOMB5V
 dfBKJmVHJmHpRLg9ZHrPO9o4tXYPo8AYNPM8/OObcMnMcu6mBM3VZGfLaUwAiM2foIRy
 p0Blk/TdyPef49X/lXeRbzwpE0IEKPiuI9b3guba1CCxCdtukxjohWfwULNnIpvKm58d
 NeJ1Fr34L2ACI8sD/AHOz1OzvJEQN+H82HVbPyVE+z+yFK6t1eVthqmar+ZykL+Ch9Fe
 hozrz0KphPsOImllbo9ubBVUOti6D5oaZc48p2ih2RrNeE3Qwlfq8fxn4s39VTda55ua
 SUvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzUsvet+QJanNZA1HUD289SQ3n32cl5H42FGP4ArnYVazpFAb0xF8fB5WZHe5vsZg7P5mZwEowDgr7YwEp0jKQGQ1XLNcDraLu1y6y/i6e
X-Gm-Message-State: AOJu0Yy/EhAFBk1C8WBpVUzo50HMwJA8wZEWVy1ImrWmIvzm3zmR7WzO
 xCqKOkUA8zVYxoFk7rxFtw6krVkWS4Ah7qspQAjO4BigY9Dckyf/ERPfgbnX/Hk=
X-Google-Smtp-Source: AGHT+IHcCmx7Ff8tzRoEcvYhXCGLLgXDhdg9nu2xhwYLgjSrSDM8l07iQA9nCSrJZspZpj+ivPtIBQ==
X-Received: by 2002:a17:907:d30e:b0:a6f:ad2c:af7 with SMTP id
 a640c23a62f3a-a6fad2c0b2emr133975466b.2.1718808407460; 
 Wed, 19 Jun 2024 07:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:46:47 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:38 +0200
Subject: [PATCH v6 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-2-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3413; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=7RiTz7/DbEcpnGh40/G/GiZJyYiXWSGAGW7k/Ludygk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Q9mYV/1gwD0pQWXgPg9ZCCRvxvauWGrJdzOCY
 y5vA3fmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURQSnD/
 94gbG0RfwOzk2vV/DQ2Mi4eaIlctK9Ci7QgWmylYBzMF0+zC2iwidba/XQrrgwSFmDuZURHpT1BIy7
 LVH98riHY/GqlWi5W8wX6Q3k+gleAi2QZMN3rX/M6kNVJo+mIqHHmAZih60nlBO/tE0ger7D99TRIL
 jiv9Ne2ogeBTfazyPGE+O4EsAXtV8Jd9k7zK3dnIfj8hu/10Ws8d+74N+Ju9KLSi7q+utZjrWMkrk4
 5LilLfcR9V+9ISirGv7VGX43Gc1bRm4F0+p8mdIrroIc0bYgph+zCEQkaApbofS9m2aAnGvBwwPfCa
 i+JvY69OA3yXVlyRpRb9s3LJnbm6F4sGVNLTZAGp26LC57lUo9VGOU98K+POtbebxtFE1iD6yp/dMs
 X2YIRBBtUvtJuGv6C2jmHa888JFy4oqgd3JTztsw2+PyIie/u/alyC5jDrfqCdjHwtuBnamjyVjCu9
 /YkcZ+9PqDIim1RpYWZ0SDA586Qs+CPPfRQuxfgbKa5EjR8HryaL6FpFL+lRkpuYGUVuGYGJaV51yF
 U6I4XwRqeZlsQpuV7B2GD8Zh+o0O9gBBDKwB0Qgeb+92mAaYR+H62ZUIZNIP08xqjIlq7YDSbcNJL3
 ZdsSeT5KhRcVCmEtIR4AB+MzztsprHemSgHEuXmkW1QESmP44XupmymOCpkQ==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..ff9ebb63a05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8365 ASoC sound card
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

