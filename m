Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37089DAB0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0E0112D30;
	Tue,  9 Apr 2024 13:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jZ8j3CP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754B210F89D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:12 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-343d1003106so3379967f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670131; x=1713274931;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HbAnGW67+sD3j4bFEEGXSjEWjYNqBQKOwwBoksUT1QI=;
 b=jZ8j3CP8l5+mBoyN6XVx4dPS1EI9KXmmxhQeHKinApvDfzM6WuXvk0gtd2WeQ68BfU
 rJhSp0/jierXcSbmyczqZP5nhFRNFWu8cvIkTEAq6cKaEYAX8pc987E4DNURLYFPH+rw
 QFNWtBrUZRYOtvORvvkhhBv+JqXSQ4wNgmK06zu2EUIU/0xApjwo4c7HgEf0uJvDp4OO
 OVRGVsY62H8+Mcaa34q05/FS03d8uuthnuAtawoOyk+g7hjcG2BEQ4g7JlmkUpkyaynF
 v3DNurhOWwUlTH+2wzgcy+rfNZg5ies+Is+v5wggnUJ5Q+uvg/HFHChcXNwsfDdcZlH6
 n4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670131; x=1713274931;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HbAnGW67+sD3j4bFEEGXSjEWjYNqBQKOwwBoksUT1QI=;
 b=n653WX5cMy6j2x2qd8Rx+FyTSUO2/AeuwT/W6YK1TG3w9GDpvUnsJntCB3FJCeucwM
 WtH6c5Gp8oB7R9D1e2GmTVtw68egEPr9JjWyCdy7Z1lauUE/6cXm+JYCLKjMp/0IJPf+
 b6VlOc2FqpyZ2lh+Ui4rmtssJ4QM480bziikc2Suafk1OAfDyAsOXWqNYDcUTHtfSY61
 Gn1YZwb3D9CsOXXeYhhtjGh+grS4O8nm9N8iC+GfHq/nBPomZkOGC6Rc14k3ftKTZz5I
 EuBBgwdUTy1YI2HVO/Gx5JTi1NH+/jLxZ+55t0aamRFBt4JvB6XnsOrzQAHVr+uKDfK5
 q5dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7QM1mw7uwkVvuZaZ2EZpiqZKfEENJMtufFWNeBaVfmOh4wz4vq3DjUogP1DiZmX3Uo1jxm568hQ1F58V9TPx/iZH0M9NKIXdhiXE0Y7Cb
X-Gm-Message-State: AOJu0YxJKpqL4ahsvXLb7mPhnTiDt2lEaWiiJwO458NJI3p1NFk1doEJ
 F7yRIkoX6wjCMrd8kDd+MByuYLpFmwBaEktvK4pOMW4xT+09gdE1a8wYIYAFQzA=
X-Google-Smtp-Source: AGHT+IEr8v0i04KdyN5kSzY25bHZCPhvpFxoitJRr7PKl1+ZyCicgPra8W9fa1HFKCRN0ubVImW6Bw==
X-Received: by 2002:adf:e90b:0:b0:343:e824:f0f2 with SMTP id
 f11-20020adfe90b000000b00343e824f0f2mr10011102wrm.13.1712670130725; 
 Tue, 09 Apr 2024 06:42:10 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:10 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:01 +0200
Subject: [PATCH v3 03/18] ASoC: dt-bindings: mt6357: Add audio codec document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-3-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=/vOu9XkDF1ivIMFF9y8dssFF9iYAfa06zhwEkg41bTE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsCUPB67ZFEADN+f8GNfytWS4dS0PC0CimAp9l
 6g24vd2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURT50D/
 9vl4WxfBFWz3OI9VU5akS6nHUTHE/5H8g6UD5AKWoJj81wXmTOdfSs3SgtdxKtmsmb89fCM04dVot/
 PzcjN687mp1aKo8TzcQpM8yCtMkWDC6XU5vGDgw6LjbbZyvHIdpWkPx+z/Wf3On3fBmtihvKZ17ebL
 ornI4fLUSKQfOSo3UMemleu+ZCucJ/t84hQHFTdZ13nqu79BWTExfYKSe3ZblY2t1X3noYSu4XYew2
 lBf4tr08WA/kJNb8Kpe6hm3G6zCv65J5cPxIJk0H8vZEKtngAtPXIDnFveZgZHRBifYea8wWtFDaqv
 3f6tXlJYYSmBXtzRhOmyYaZ5vKHIRD8pQK+pDtT6O+7ozklGIWbWpeA/k681LHYCDaDqstw353AnX+
 MZZyJaVIwBviGpI+jym6Ei6RWTLrC+mJ13D4qA2Sj24TUlt/lT9N7/5vjgvVaDvpYtQxcWqGa47IMk
 Bdq7mMJyiMEJ6VLYvj00J8fLFAO/ka1WnVFK0YI/PrB7mXZYgrC1OG92m7b73NKNbJgP/Yhhw08MuK
 ZtqtQj899QN9V4dDO8LMSkBeuWh02vmZFbxPhB2l6mC6SHQ39F6rqnHYCqLy06FEdEyIJ85gFtEgTV
 j751Pi2ZGvH15ILCqOWmbKGm5qDr2rXN4iTqlgnTxQsjqHbUHVAYZVMBSzkA==
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

Add MT8365 audio codec bindings to set required
and optional voltage properties between the codec and the board.
The properties are:
- phandle of the requiered power supply.
- Setup of microphone bias voltage.
- Setup of the speaker pin pull-down.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6357.yaml b/Documentation/devicetree/bindings/sound/mt6357.yaml
new file mode 100644
index 000000000000..381cb71b959f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6357.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6357 Codec
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  This is the required and optional voltage properties for this subdevice.
+  The communication between MT6357 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to
+      the audio reference ground.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: Selects MIC Bias 0 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,micbias1-microvolt:
+    description: Selects MIC Bias 1 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,vaud28-supply:
+    description: 2.8 volt supply phandle for the audio codec
+
+required:
+  - mediatek,vaud28-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        mediatek,micbias0-microvolt = <1900000>;
+        mediatek,micbias1-microvolt = <1700000>;
+        mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
+    };
+
+...

-- 
2.25.1

