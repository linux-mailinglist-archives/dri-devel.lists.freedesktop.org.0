Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8B8CCE55
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD3B10E24E;
	Thu, 23 May 2024 08:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CLW0rZu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC6B10E165
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:43:06 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso54898971fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 01:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453785; x=1717058585;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
 b=CLW0rZu1gVxmTwvca4iL3CJ8iTjP0S/mqzpUsM4fU0fzhZRMl+ouYp1YH0WfprZPUt
 94t4KpmDc7T3q+8VIApyA+26QInFpE8LXwbOw2D0g9H2ysWrIrVH0HNC+hq+5g8G5iSO
 DRzQFMFVpAqHCspfEHzEAToV8MaZeKylL/MrJCKPCOkznoPXcqDZMH9M+2yTmxXRGBhY
 C0M3n22OK6DGp2i7rNvEmZaCmdsdJlrDVAEZiO303Tfi2iwoHaAU6mcEj3OWcwJ97dsS
 d58UI05edFkjT50Fy5PCr3qw+xZ3B23jZ1HizMcgiZbq4Wx8bel6IHikZcSS1x08xRdM
 uUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716453785; x=1717058585;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
 b=bf8fmTSicxCWBJTk5hHJBCqMZ49mReee5UOPUqN9Uof1ANouHdYu9Egh5cvU4yliQl
 Vomjc0vZfjjDKkHhkfy0C5JwYNJm4D18Y7isj4dFljxbK5OHnMRd6JQNP2ystxu1OVNg
 NyRTYgu/KJ7rSsPy9zp0hD2UcGo4IC1Mva3Q4+koFMvUDWcUv008Ht7jG/bekt11Rmjy
 WCS8sSKZ50rHyLtacRdV6At+cMQ5qbTKSiVIIS32tJ52JLGVDYbw575TfoQfR82bSVml
 wOYTv65oZwb5VDEPgdXqJJNurphwMruaOYyKwc284I3qYQupu/i0NNvZ1WOh9NQzcwmS
 9s0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAFMthaIWifP8gsZKXbfyVxAySmzyN2L4QEJ2EumQ62/xJ5yGAZ1z1fLB8R7XnJ7D2VZ9jBbcErv0o2kSr4ovvToEGK5Ywc6kLF5+dC1b9
X-Gm-Message-State: AOJu0YyxeZYvaFKCs6OGnMyiKTKAR26mFFuWvGmAOHXFgBZqEG6yREfv
 /CELFkRte4b5DWbz+xSw9B2fbtNm8Dc6VIUICM194RdHB4V61TIcQco3iGO1niM=
X-Google-Smtp-Source: AGHT+IEC8A0HHPj75NGAeP//54dk/2jVLa5uX488Ev2piYWlbCHwXQw4FvShK6FEUUJOadzfj0zTTQ==
X-Received: by 2002:a2e:9e8e:0:b0:2dc:d2c5:ee9 with SMTP id
 38308e7fff4ca-2e9495022d1mr25227941fa.2.1716453785194; 
 Thu, 23 May 2024 01:43:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:43:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:44 +0200
Subject: [PATCH v5 15/16] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-15-e7e2569df481@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGAc9/Ge7o5DXtFdzw8pFfAbUOoXwPsn9Na27uP
 1jtKDmiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURVhgEA
 DGnMGpkKmQMoej6HMPV795SB24cmQfeb3v9qbkuOFXsVg8Aiu95kwy+f/ezJ1B8ILYuHC5OE9kmpgl
 9/fn0zECIn0xOivhVfxwvZZDULtsR80G4LXm2EuZZAXoC8GkdsnZCZ4PQ0IQ68eLfQ4N9rFP/pfqZR
 GrcimFwxFrH6Y9A2Pq3RAiTyNDpIf6qvTLHqelmm4fa2n67UozjZdWN1iZ9TXaVKijfEa1whxl1McJ
 2jDpItBbjUXfU3ZIfgXkBjNc999wZJWRGt/PpAcKRXB00Zly3TxA9FzV76WVH2a9WS3UW52K6hVBxU
 SVRZBNCdQFIofWoFJosPtcV3EhBuv1t9zQP+bpwR9WQtaYGASWQg+04m3/4smtR63vWWkkcfVICtal
 A/75ahpKxtnDr2+fS7Bj8ZlQiO3y1sJ0KQN2MTkLxR/BqXz8HlER3UReX8HHhCKXG3Qevs5RIlCX2Q
 zFiwXwesYCxfD+R3WXk6GLPuc0TvGDq2hlWPm4IgLLfryBat+/rcLJ1+7BdPukxFMlkYtbxnd4va6B
 ty79KRZeFeyLiyGv/jV+UTWiiXKWxzYSz2x/Q8i9dYRYTkhGlp8Gt3N5Ke0JKYRboFDteQmcBhJ0Dk
 reBFU0Cotj4ggjTE5PhVDafEpxHq4x+4w10YK0LE2kBafEaKYhpum9VarC0w==
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

