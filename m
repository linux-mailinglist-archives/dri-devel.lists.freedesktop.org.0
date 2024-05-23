Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09CB8CCE4A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB34510E1D2;
	Thu, 23 May 2024 08:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AQKOcxsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830E310E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:42:46 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso108548151fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453764; x=1717058564;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
 b=AQKOcxsKfCxi+7NZv7oxdYFswBL/BwHCKct9o3ImoqbW6yyznCD2u7Xcqx4nnFnIG3
 v3n7ZilQkGWM7Kb5mGLqCqQovmYIRlnVCvQJtSWnYWv6z1VtTrcIrkfcbWuC+o9GMnoK
 G9WFqhMgyL2ILlcp8zAZQt009XmpK8+2HricqZmAuQ1DeZyWpEX/YIrgbv0DGgCy7iNS
 Xld7DAe/sSRDdf7BPQYI4CVZKOvuEfpGJrFYoJ8Df5PJsFW6DfDD7FqHbW2mO8o5dOT8
 FI1ylcuVluswU5ckLb5DCyE11qHb6wXvJrRyvXGHNAFqAE8mRrqXwapIJPauFRxXtqrD
 Ba7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716453764; x=1717058564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
 b=MO91SDJhp8c7RTvCxf4S6vHrRXgTofLdJzeT174/iM78hjLu3IP//6YGPoBezPoB68
 weUZrcoplui6ZMsm2t9nx9757STiLe6O0yuGNWJpU7bJZfqxzswvpvBQINNcM+LKp1WO
 43UuU1T9bXoZfyNl/nkfmL3eVFDtGjb5DK0uaI+6WVSr27m+2S4k2eppmusKj9kS2/Zg
 HqzRAmGEfFEk6mjdns1YBY8Y+2rOWo84sVaGvxbCibczQNS538zeUW1Wqp5ubtEb/WyJ
 1v4vct9qBZTJHgLpNj1QBXYXyhPVBv9IsjXig+KWjq7VVFn7byXjZ1KWn3AuDc4GV9Nt
 LWkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGWRuiLnxeMZstiCUVnn5zdp4yUsPmyzLQIwmAKv2vdRh74qYJNnj6lxE0fO4LF2dWI33EuT0Jl0s1AjBNH2OdQgsy78dx0deqz21RdeFe
X-Gm-Message-State: AOJu0Yz48z4tZdzsTfV10jJQacANp5hLnodjiOOMLFhgidMeXAih6AAa
 O2SuMt//8gdt12WLwSDq0ITYH9o0zBj5zMLgdfuV6vfufKMfwoU7MfQDXtAUAoI=
X-Google-Smtp-Source: AGHT+IEF/TTFTiR8UOUieBnUMUsXefV3/YfLojRO+um6UtDO0dolyj55eyvbEErNS+I+XuekyqRGOA==
X-Received: by 2002:a2e:87d4:0:b0:2e6:cbe9:db03 with SMTP id
 38308e7fff4ca-2e949467182mr33408181fa.19.1716453764511; 
 Thu, 23 May 2024 01:42:44 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:42:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:31 +0200
Subject: [PATCH v5 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-2-e7e2569df481@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=cKEFvnur0r9wK70qRsiyMlYMUWCy0Z2MhPoP9t2s+R8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/7MDnaVUkfVFGkCqmjiZZKFGhUKoPOo7uUr9J
 5+gLSCOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURZB7EA
 DF+VAzrCNU4SA1jP5OoT93Ob2M6JWQsrtCMl6dfh99+00v8/WFqKoF9X2a9OMftw+B5WF/nfgK6ScX
 hAZEEGqYtytopg9fg6+pd6g1L8ddwHyheJG5Ld6DlXP4shdFhR33lqLI+x11mwPfdSwBkg1etvXcDd
 b6aaE4z5jQFm2imwg+OaSOjYcHNs7gDK7R1oIcGYCYYIlK7IzBlNsxCV1JoUu0rf1xF2/VIDsaNtO9
 pwHOVgRuVrMoVTuC23oavB7agQg5kwsEupJHCGU/2z5tbOYvazAtTNAzohmXWMe9Qa67o9wRbj50kJ
 fhu0gAbTwHIuN6tjJdHY/i51GaQa37McjR8SUHhQN0ngmpu+B1bcpC4Lgzf9y/ZFMtEDoPYxvuw68S
 FyAHIH1zOH9t/ACHjyCrIbtyOTJICgx6UjLiosvtanxQjLuOEly8wVDY0cn6UlrxIoCb58GNpdOuZo
 +EL30aDE5zxG/Pjor5LMj3+cYll7s4epePNLwyu0f8EUSHDxFHl/vgzNCjFXgsqUVnHBxUrdGnKhLO
 YHR1l2j+hBdaW2on0UCqngf1Jiu0DxVpi8B8hQgSOaT5v+8EwU19PZYpIomLjoFB6IjVSdEPASV3V1
 B9LiiPXM0xIHI1S1yWLl4/aYF5baP88XgARVIfPeHsty9idELtpALs/4HymA==
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

