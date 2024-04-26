Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37228B3DD8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9110ECC4;
	Fri, 26 Apr 2024 17:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XL3sjFn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0467F10ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:23:04 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a55911bff66so312502866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152183; x=1714756983;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
 b=XL3sjFn6usHots4S2rsNDXg5uUx5UrBDw5p8YenQESAB4lYTlC798LCUQn60lSOaP3
 6kFewQCLyehwi+WTFbSF1aFFF6zyw2ILA8fVbWAmW4R3HiPosNu7uXSgPMPORDgUafAz
 Rtdmwx/LcPtx29zvwBF3fodF9fmTErftzrZT8XnjWx3CJMfKN2Chyv+uNBSDHR1GXWnc
 C4rmOY70fcE2SYWEvCTWeE1nklCRrmVUMZy5wjBvS/0JwGl+7k/jNUZ8lx6QZN0V9FgC
 sJH0fqRc9nE9mazbZaPKRsnE0Fg3hfWFBVvrahiRA+ZNUm1Cvo721zqAkL9v7KcTg1ZQ
 gB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152183; x=1714756983;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
 b=XEK97AJoRvTkAL6YUqo6k9chS9ObmVWDbyHildjLEhZcGzQU8BaGLfrrBiMf5DAr/M
 H5S/lrQtjlxC1WHNnVa9HfWFvs4a0pqgNyb6ZejOC3KjzgXPG1O7Na2mQsBJ/DWthrwG
 My4EmkOL42eS1yQeuJRpnzy3WNm/NC9DxHVpMk55fXHdpTm9f2Wj2uoXPdFVCoFhtHOq
 o2XquMLpG2FZHEiZ7wmLcAVO+fB6W0lQu6ofan24Rua6/sf/2Y0O1tY/sO1Ze8/r78Mn
 5flbfx8fikW3hrwBEpTJK7QXK/VM5s66rZTAq6SuHmzUMpIIdmLTBVaGTO35fZe/WkSa
 yx2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdL7FF1lgT2xQVZYFTWwkbeY/a+UoI59kWxnoHUtiOM0sjsAg7Vx8tqOjfLApZStxMK5aZ/5/U3k3SGeXjJX6UX1sIbfKqAGyepD8/FCTz
X-Gm-Message-State: AOJu0Yy7/hbvOnUdGFddt8DAcf2oa9WLfAyHEKOPPOY+xsEcSH93GKUc
 Ot2gPfjYHaoeZpuinUmIB2vRJ25ImjLhbJ2wz+/Itg6XYamtg3S3yaVIk5uK5u8=
X-Google-Smtp-Source: AGHT+IHHf2XIxcORUWzjtLX1VaD207j1YSFJervSBcjnJPk8N+OEALIdFKf7g6Y8lzNaper92rOirg==
X-Received: by 2002:a17:906:4a83:b0:a55:5e89:a158 with SMTP id
 x3-20020a1709064a8300b00a555e89a158mr109798eju.68.1714152183470; 
 Fri, 26 Apr 2024 10:23:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:23:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:44 +0200
Subject: [PATCH v4 15/16] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v4-15-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaFSju2HTEJJUlWwHPPq7cLwG3TIXZFwziZS9e
 4Ndyr3yJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURepjD/
 97NUzCvItOp1IP3I06MoHhHvjQUV16QIZ462zo18PKYz6IOSU0Q53W0KrB4Awgr5T3o5wwwQi1w6cZ
 OUV0dR6H58erDJR16xRZk+YWtdSs67XXC72rmHb41qYDwoyHXemShR8E279guAnE7Tbx4ZPo8ACYMc
 3JmtdNg+M+d9Cxjokjl9k3zJ//9MnyNIVzrxwJO12N+Yo6mKuUfDjBVoEPhEi/yeOXcgea8dNL7KHQ
 ZDZhqi7u/iK5mawCxqIVbf72ly2fB7Dt1heFWlYc3qP7IJuTjU6D0vrr1LLOc5SuUV8Rqga7gVXAIo
 mYO9qXOd5JFk2I7y+F2LvL6xYqTgKCjWAc30pH1eBO0Nqab7RjEUh4EJBdnIoa1rbSrt5uF/5S+uC+
 Cwn3Bb1jofzgvU3ty+c7gNN5GTf+j+CQF99el4eZk2IUs9wP+ackEu25Ox/4I+CijWimgylznvh+yz
 A01xh3kn9MI03Y9HebFSM2lHe7iVkz+pfZo/jxAMNifMZsc2OuFTM0//JCutoMpbtfYUSfK59b8e8x
 FvWKt2Q+1DWnz/jz9jVBLrbzrJVhwgF7u4t9TKhZtzqhcDohsrXMw+mkEAMTrSAB4RHtZu8CsH0MR9
 KN+57ulLLxu4t92OP7ZWl3tq8A2QrY96atz2Olvugu76QClJPWJ2XX28O/pA==
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

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 ++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0051d5613bcb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -2,9 +2,11 @@
 /*
  * (C) 2018 MediaTek Inc.
  * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,43 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>;
+			#sound-dai-cells = <0>;
+			clocks = <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_SEL>,
+				 <&topckgen CLK_TOP_AUD_I2S0_M>,
+				 <&topckgen CLK_TOP_AUD_I2S1_M>,
+				 <&topckgen CLK_TOP_AUD_I2S2_M>,
+				 <&topckgen CLK_TOP_AUD_I2S3_M>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+				 <&topckgen CLK_TOP_AUD_1_SEL>,
+				 <&topckgen CLK_TOP_AUD_2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+			clock-names = "top_clk26m_clk",
+				      "top_audio_sel",
+				      "audio_i2s0_m",
+				      "audio_i2s1_m",
+				      "audio_i2s2_m",
+				      "audio_i2s3_m",
+				      "engen1",
+				      "engen2",
+				      "aud1",
+				      "aud2",
+				      "i2s0_m_sel",
+				      "i2s1_m_sel",
+				      "i2s2_m_sel",
+				      "i2s3_m_sel";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1

