Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557D89D667
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D720D10E617;
	Tue,  9 Apr 2024 10:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YOQb+Skz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5023D10F9D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:13:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41663330f9dso13870795e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657626; x=1713262426;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=;
 b=YOQb+Skzfh/rER25ArGWfToreVgTe381x+al8AvD5EP0RApgrwed0X8s13Gv4tpTgN
 rPDVqVF1v6oPZun7SXf0yaT55gBQRGyF0tv8DCuA0ua5dddF4yJuuWEOncW+iIo3/2I3
 bj7wdsjh5+bb2IVqAI448uV80dStev/8ZkGzlgQxFGS6lUWBooIEA4qepMvIgoAI7uxB
 mKcV4KPNV40zesvJgfC9fPdwfxsSFP1Q5CCKCmckBJBvzrm2eyAfvDYXjcdTNx9mQ4sI
 r8EIQm+PkWc8qZfUWl1nzPA5Ph/3aWPs5VYtZN+Ea4WWPV8fyJpuGuLojHQGFSxYDEZL
 k15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657626; x=1713262426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=;
 b=WZr0pbfAFyIqMvUGk9GjG9ECOCw+/I6Dgi8lT8pqgwtpHCCabpUjkFvgzG7L8GzAVR
 lmwj+55U5Lxuq010Q1sWI+iyugRLa52HZ143xkc1jcbMGiV8ZP4/ANHIXysbMQHQS5dW
 f/79CGPl4Pa8iCwjKoHMKLbcMjM+SvPN3v0RH3pzWpkpZsBQ98B/Ilo6nJ6NzHVqWICf
 WW1Ig11O9e2LIWiE2xCXqYKLEvY+xOiK0XhYnNOGGSbw4vrW1cn55hOOUnQ+Qgf2dpuJ
 HjjX6mcwa9xFYW41m3i74vAYK0oCGXKWg5aFvFvNZPbQTaxOP+YYQXHlWKhUsHV4F+ih
 FaXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOFNRIXUf7Jm1DTvC3/KyulAnat6gxUG10j3XTcFct79NvarGMtFPx33v5TILvo1Tk2sqKUvxWyivztVIxvZfz6i62q9fxp49ZH6tyFIhY
X-Gm-Message-State: AOJu0Yw4DBfZQCziR0uBwCJirjPk8SK6YX/k5TsD9YtqvEr8/jYschjN
 OwzNx6L10r93wiE6oHDZRVK4U2cNiHWhAQbs0ckcl0+TgE50sLI8eDCVbNgBzS8=
X-Google-Smtp-Source: AGHT+IEsJPu/054QzozXEcR3cAKbGmgbpg6X8FhQfUnUAHkjL52ZMV/yQQbc2f2sdvpHT1vGB9wzLA==
X-Received: by 2002:a05:600c:350c:b0:416:667d:4691 with SMTP id
 h12-20020a05600c350c00b00416667d4691mr4530196wmq.25.1712657626644; 
 Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:25 +0200
Subject: [PATCH v2 04/18] ASoC: dt-bindings: mt6357: Add audio codec document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ufC03TRzyDk5YR8DEBKesMFjVbHSKso6JjQ31AKWDaQ=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTFKmit1LRHBjD3sVBNy1AD+EFSPxUwuPh5hBL
 llo/QJCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURRLrD/
 0UItyg9zwrmDQpm/gbTeRtQNNsOjxAl8PQIWG8EqnsHgcHKNZrT5vEhV+q6JscmsLBfKi1MnE3f3HX
 t2UyIjSKZTzyYdGRsCJEqMicDSryyY7IckznV0K7tVh8PNPNcCAtcS5y0BswhRRY/MsqEscAGm4X9Q
 0xfJfWpCXqVnfEz35io+YGQYh1pNdw+Sua5QmPXzWAJrd2ZMadxK6f6rjLEVPTjIrq16VYfEJuIlq3
 PPr/0cJx5AYi/70kI6NW1qds/TkjhJHMhcyVzG0yI6f2QGmhlru4byON2sRKKnoy/SKeqI7UJxW2bd
 ssbzSx4dxbtlzGwy0bFGjL9X5m3EN4oYAP5UTd5xR8pyG16Orv+/tLJaLX4dFEzkqtdCZXgnlY9Gki
 B4ohzq/yeLtxcLfZQwiIegbQWxTVOAxHIP+Q4uPLxCYD+FR/ZHVlVEbJ6QCmpK+sOGRzqiBv0kqY1C
 MUT1f6xaRnTvjkx3EfDKaXGUUV1sv71+gHTlrMz7q3gKyVaRHH6zYSWfIRD2PrzRfiZ66J5SU7IMxc
 FyKZHs9k/OWQ0E5jN0npkOcn0mqcrZ6iFWA1qK6xhyHu+61Xa6DKEkM6YcMLUQYwtP3/6o+JsQYnuN
 8a4gQu4guSBQODpZf9+jzZFOd1nf7gCoacIRWppbgdHhnfS9tvBXBVOcVI/A==
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
index 000000000000..f532a9e7dff5
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
+  vaud28-supply:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: 2.8 volt supply for the audio codec
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
+required:
+  - vaud28-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        vaud28-supply = <&mt6357_vaud28_reg>;
+        mediatek,micbias0-microvolt = <1900000>;
+        mediatek,micbias1-microvolt = <1700000>;
+    };
+
+...

-- 
2.25.1

