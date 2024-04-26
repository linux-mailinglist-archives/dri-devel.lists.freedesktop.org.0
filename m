Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624688B3DC7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDA8113A1C;
	Fri, 26 Apr 2024 17:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o+QGx49x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515F511252E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so3010541a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152161; x=1714756961;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M5h1cKb9Wd4tygVd4523MaRapeEHkSuSBrFUYOzLXOs=;
 b=o+QGx49xB1PG89LiPdvrfdoIpRodGIxut1uExUcqipT0OEQpXqmqnx9TdvR+Iqy9Rt
 xhAkT2VF4UCfOR2fYy327YkZki5S52NB1KqQESzUp1RvLLO37XFNf/pZkjCQJO0eL1QP
 1AEREZsjJK+msTNDIAPPwvhzW8OhN0o+mVDjs9+yDBn1LHrSxu6pO+yzm9XpidT1lnom
 pKjmNbzM2W4OrUIvt9JkSohPmUy02labF1jsyt6E20oXzijfcR/9RT2vqKwCdPSIRY2q
 fx5j2+YUdtJvVUnbUO6E+4hvTyO0elxuNsETx6wNQKFpWZP3RvQ93W6gUZosyleEwACT
 9tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152161; x=1714756961;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5h1cKb9Wd4tygVd4523MaRapeEHkSuSBrFUYOzLXOs=;
 b=jHvvSxQC6viUrj3NVoFDZSphJIvQxQrvzTzk/Tl2WoosXa1UwePdhH3ayVBnSIppcP
 I5H2Ya1tY7qvse8tltsfU/QF3W8CCe0ktFVA9HnbYxKebnLEEKmsU6vTJGUCv+oG5GkP
 3pmHcLJuEO7E1OFlcQKlikkNrQknjnQwu7MkjwlhpdksrLOlq9RGpB7SI1wQl1ODHmoi
 5RNnxXHy73BytWQfOarZOmzvrUzo2pVsq602Hln0SGZXd+9j4MtEq3gZhFzQRiNZJb2q
 w0uGbpRx7coxtwWBgmwtNQ0gKvKfux4GEtjuYB7Di/Gp6uIM49F8y6+3/QY5cRZ7gd/m
 dDLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsED9ugOqK2Szfi+1KD9NRGlhclE8lXThbos7d29sHpzoAPYBgynulovAw0aQdMIX9U+URmSx1b1brWa+HhEZeMYDrtlN8st/NSXHDz0cM
X-Gm-Message-State: AOJu0YwmgQ0nXi3p7ubdkJSnPv6XnmMb6PxU5B5MVmTBYqwuX1wjK8wt
 AkMmWAJreI1EsVWz2n2vkULBBdzXiKS/SUn4hCdytZwf4ZpXGfbAvm8QJnNVtb8=
X-Google-Smtp-Source: AGHT+IEn/eMoitApgBUgg8pUEzJGdQivGCLI6Ph+rcC2EpA3138fG0ZSzfIhKnaXEIqhtSXOiOuDMg==
X-Received: by 2002:a17:906:dc91:b0:a52:2e08:207e with SMTP id
 cs17-20020a170906dc9100b00a522e08207emr3002872ejc.77.1714152161629; 
 Fri, 26 Apr 2024 10:22:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:32 +0200
Subject: [PATCH v4 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-3-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=hb4Sc+m6+KqrDRmnsqru9xwwm6vpFvEeTj8R76uZXcI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaLpQM5c95jo6O7Mo+/ZZ15lOssjMuNjGmsrwq
 VNAKjCOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURUkqD/
 9szNNvPScpI+ZPCLaKq2JhlSvxl7NubkybaxFDnbZZN5rZuWJjf3Io2EMZp7xgPg9qvwuCSnjf0O3t
 t6KJTT62Cv8K2HaAZEKUmTxf94dY9Mb/mpJm99n5WWjRIOt/aUxqpILst9spy3IDLNJZoX2wLyDUaG
 Ss8Uz+FKMTtzzZ8tK9/7ZXmGWjbHGLeUGXz34zmBWK5+rIuudOEwNNX/9xhxv77tVzD56pVjb7ubcl
 baF6fdn+n7IIQUccQVCnNHxAMrqCQuz4jzLWBYbhAD+EoIoe0y36ZCQwPsV2v5vDXwm92uhpAhic3X
 6oV/VYIluV6Ygg8FzWGuC08vXaJ5hASpczPT2S6ch3wLq4ExegtWFXHv79MIyW8N2griJ0/iSwCNZU
 2eeDx7Y3gqi/wHeQ5n8tIMIHIsVZsDRdIWXnT4VtYIpMyrbzj7QsETPB9zYm1xZgzxu/ElYmitgrtp
 ZoJMP9sj+fAVVZBWeucdazDEgK8G2IgL9s49TRsF+PXDGL1lePzQd5/9qynOZY1lUdzQxXqYgumIgd
 jwTnvGuoD9VvOwCwzYdLWm9d0YyigwuzHOxDI6Lk3CTQCcyc6kMBbNKEdnLW2PjT389M+pivjq9YYR
 l7TvJ7oZDeI74NRSKU4Az7sXeN0HebsBq8sfnBReTVZqRJGxs0bWpZWik0Tg==
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

Add the audio codec sub-device. This sub-device is used to set required
and optional voltage needed according to the hardware.
The properties are:
  - phandle of the required power supply.
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..30234f13a810 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,34 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  audio-codec:
+    type: object
+    properties:
+      vaud28-supply:
+        description: 2.8 volt supply phandle for the audio codec
+
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    required:
+      - vaud28-supply
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -83,6 +111,12 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
 
+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+                vaud28-supply = <&mt6357_vaud28_reg>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1

