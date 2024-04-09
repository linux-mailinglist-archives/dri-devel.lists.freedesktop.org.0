Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84D89D680
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1689112C6B;
	Tue,  9 Apr 2024 10:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eZL3vjuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5281310F9D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:13:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-416511f13aaso16858525e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657623; x=1713262423;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
 b=eZL3vjuwkizbZCb7cOXeHrm3mlgpnBSNYJzHtovbfvOxi/hFOXYxYRCIrMp5XyU0pz
 C/vTcOuxDs4C05xLmArEzIg7nfeB07voui9gfvSL4GXo7IG68IKIcgSzYhzGnM/x+b2X
 VWRGh/s0P+MxxDAvRid07Rc0S+J13WwkbTlFEESQcvhRWRTXexSCIrla9dFsqFW6aQt6
 ZZXx1zqVmgLTBN0QtFunU6xS+gB39skj4hFV3pwOKdRnNwsiD2w2BXQPXP3dL30kg+YI
 hSVpqajsKzi2V2nqt8Bq4XxFlfbflGyT/PA1LryzCOaszSoc7t+yyQynu3X8oBjOX8I4
 tH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657623; x=1713262423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
 b=DSriPmI0wGmb5ijUWLN3GfWTLPWKFa2n8EeJ1YBPMihjt8GR+0jvUaNZBhQIcO/cut
 QGc53hfB2rkv1hbeiA0DN28K1AhLYsy7fmODuJ2M22ZH6weOWH6sXSbsh079wxNWYghJ
 3B/wwY4rJW5+L04BiIs/UityvQF2TSb+dGEEOfac38kc+Jz/xinaheu9S0iBIKHqxnYq
 lUpqGt94TLiaDdx6UZLgzAD1dKRqBSJGD/hE3iuIeSPhOt5CunuRa++lPwGxAsJ5m+Am
 Um50ClFz5SYrhauzndUVVeyZGMCzmBQfNFr5lV9TWXMWce4UHw3Cw9U5uBxbu4xUWqhG
 9/xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxARv8aEZ6mE5k60gRIJvbyN8jKbhrw62Ye2A6/JGx215cT//r1IO85v05N0TJL3NVVF8lPZVx1TB+X7Bq8hv8wCZwPuKmbk20emCXfcdO
X-Gm-Message-State: AOJu0YxY7jpDxhv1InATJHfjBosOXsxCvJNmPapFZ27ShS3fdHndfIhN
 vchMYVQw5vdyMhLpYpwikxkrrb1rlnssfbyEoPubvuU4vB0Du3EmWaObgQP2+/Y=
X-Google-Smtp-Source: AGHT+IGzfaK4n2/g8axda9rEW09xuGb8tQgLRNvycpCGtQ33o2AX8GkVbCTGFTgBOJIHcyo7EAPzsg==
X-Received: by 2002:a05:600c:3592:b0:416:8152:8a70 with SMTP id
 p18-20020a05600c359200b0041681528a70mr2710612wmq.33.1712657623706; 
 Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:23 +0200
Subject: [PATCH v2 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-2-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTZEodaz6gWD8MRUgu0ITSSraVYxIjQYi8MKb6
 nkjJEj+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURXk0D/
 4/ZJ3u2KfDNF648wt0JHA6iCjSPOuj6vLD588gTo+Re1qpqu68/joP8w3rhRELxW6/iHZ4xt/QFj8C
 oO+X6o8CASS6dbwjDvRmkR4BJ2/Ku0pnYzNrm2kshLM4OEV/b7fix7ed8oFLJUjubS6BiwPy3GJs60
 vu6anJhjf4YaUnISMBRimlkMamBn2UsSVJtwEuvVHaiovp553a9iKTHBIDeBXNkHDffAJzI1aL4tRn
 iUDVy96b4ShE8+MENftXo3FISeURWuizKpXkQ1bmd9yv3v+51HHQWpxHFchIeONrJrZ7k9Zep2WTG4
 UkS2JXJ55Ywr5w8Iltjkqq31cuicllUklzPCrDNBdlsoPdW3vykmolaDVPYK6sYc9/4eGkPGrPh3BU
 vaWjrfhqvUgiDDYI77J9ugPtdzZXrF38VpIAW9GgDqYEFh4P9gwVnoAq17S5JCEUaNGPRgdAPi32hw
 tqpTZfZ4GsC1trFbNq8ObvZg0RD0l2LrM2w25Xf+Vs+46aDVTOS7cL2fE9O1YQo4Sgrb3KxV+OBtCE
 HOZNSh3te3PjB3b2DSruFSi503sxBNQse4BHacJIli3TwHCCtcAcd0gz5kFogwXoOyqd2H1WffjR4S
 j0+fk+qLCPqeqeFydlpoWD+tYzmV2IaYX3dmPQ4E85uI8m9PSKEiJ/+9oENQ==
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

