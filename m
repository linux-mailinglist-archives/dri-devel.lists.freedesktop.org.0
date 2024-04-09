Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698589DAAC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99C10F89D;
	Tue,  9 Apr 2024 13:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A8JYyD21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B2110FE5B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:10 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so279968f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670129; x=1713274929;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
 b=A8JYyD21LaSmx7O6mjim2Ve1aI0UX6rSUkbECEQiFk/pgKdxHFjobiAmQ3PIpMeIZj
 yxVQ+hSOUr5xGa4NV1rL8x9aJ/Qdkz8//2sGa63c1AYuhmQwSjjsxef4zYgaFADTV/lV
 ncvjNVdP/vv5sFJAgIGl4ap1AVBlPLPjAD1vDn4LKT90AXKSCKA4cnOqyXfERy6kiXJI
 ZLMNhPSF4AaPNt5Qxs9rYRnHsEBV1KXG3rgu0FBnLrtIhE7e1PT2+kAMp7RXEwDSoZHs
 3UxOMAz/QIcAYdlfAVsIyuBnUG8t5nLHUV7/rcKkbgEGBDJP1cQ3DwN+zPmW7PdqXFS+
 VSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670129; x=1713274929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
 b=K1SZ/gJtZ1PgBKo12ic4GchX4h9WDAjmk8yS8lnkW0GSnz8nqd8mU6Q3drAZSvRNOG
 SnwUJqKy3c62C8sVHvBAWHEsE4bfjWEu0GIbtZQOl1NObPAuGh+10NqEU2+ybgtHXtV4
 FKAIlLppAEjx5s7KsgwhAZJJLaZeke2Qc/RoE5WmJ1N62PXK4k+k10UoWmmgVqeYwL2G
 o5BJaAJBoo7RQrd6gBpj18JunD0QBOGrnYpytZ+0XUF396LSad1VYelVnFVGBvYu1aiM
 WDG/4kjXOk28fwsrFNCy48TMJk+01phrM/vmdQht6JxZyoSc+m+i9vOaels0/DhjMxGO
 6xaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOrFpCZOq99ltz9smc0w7kdt6vK/rR5qLKzTAfZ9pRsVD69EWnEziFulOy2kXCw8k6Hz01hQJQWKzuMw3fiMT3T1RLXT+kYSgJw1G0fSyN
X-Gm-Message-State: AOJu0YxbDdKLXq1dOOaDI6/EsCxjJIigB25KpPiA/X88Hr2oa3ILvgVP
 ZBmMRpBsTtEMSCDz1WCWmCGqqwNzkNxLVCXNetCxtvlfc0rpfpTyRFRsSdW+axA=
X-Google-Smtp-Source: AGHT+IHs+PVJes9bcU5J+hkjaytIEisTo/t9yMkWk6trmZIfpsRZXqQx9bQrZmBp9veYPw3+BYfK+w==
X-Received: by 2002:adf:e802:0:b0:33d:fb3:9021 with SMTP id
 o2-20020adfe802000000b0033d0fb39021mr7947332wrm.54.1712670129306; 
 Tue, 09 Apr 2024 06:42:09 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:00 +0200
Subject: [PATCH v3 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-2-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=bcex9J3pUiKsSDmYMrLdaDcykBaj5YDYBra4ZvFBZJo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsk5RNDHaaRzybw5abcV5vneXW5vP8Vm6SQhmY
 0Md7TsaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURR2zD/
 9KNc4raiGk9xEnimPxYM2FegfDoBhRKHwIpxu8KF1g1GPWr+l5FFDRfIHQfZXB8Ot+wawVk7PSSlaM
 4pyNeUkltjPieiUonFHchDVseFFwJpX0UDgw2+IfosUkM4NlPdhpb9FhGaO6TlOf9rUVhJ0c8klDTy
 O4N3ZFgDsVufRwZX3ENmrao8VNuxZWn26KM5bJRscJh+K5AGRszPfo/qCWNZXjbVaFPBDyLxo7luj4
 7JVdtsY/2RGmNPbrK9ohyDF7bzI54u5tHi2vn6cqYY79YQk9OkxgR+gzQhUKw9NkVoSzrsdUjqjflc
 6EGZnw1xfAuZUoDf/VypXBwRP45T0H584H4iU4aVO3VJUz1XHV+kM/5GBR8cvoaAbYDzaI0pt7m0AV
 kc7bUqhGcg8mEawUzz1n0Ru3A5ND6NbfD8URPAAxbrwxMGn5DJvI3cktuDutx9qdRWTNb4V07j+Cz3
 Dx2ReCOH3j9HlP0W55LVvhIKVmxwjE+hIdaHq04uyG5tldw5sjVyhJvUxk7GsBPar04VfUdvrx5hUh
 cYxVhmfbMvicDTADR0JXa1L+MyjsoLZMk/CR8nBfC41xK0a6gYVFeCgQCwLHVlme8O0niJDTfzI/VR
 ebzFyQyVU+mmBRXoMqA3Zu9x4j/f7ATZhcRXhMTZZQEouCyW6g8cAggL11CA==
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
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..831c5b4665b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,99 @@
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
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          const: 2ND_I2S_BE
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
+            link-name = "2ND_I2S_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1

