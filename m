Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D041867789
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF1710F1F5;
	Mon, 26 Feb 2024 14:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tzADOwGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B410F1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-412a3901eaaso8557845e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956150; x=1709560950;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=;
 b=tzADOwGzXFbhlaS2P4twynzOUUaWSBMXBUR7FT0clwRr+3VZlzTsnjdg+Kj9XYVhyi
 JIxikBU3RmDCIA8okAKRqO7w1JF/P+tX2sN9n4c5kFgL5p39/0g9MG7a/MD+cB/MamSx
 AY7ZAxvB2p07GlGInzip04YnEvUTXQE2eptjk3dwb5KcGuLtj1IBdMdJsl12q85KJZPd
 /Q7gflPiv6dCMT2/jiHa2Ikb0dUPJpsMBVYVXpitvnHQHcm4tgLM6X/pC7x2pm1aXcz7
 khA5hxI1cEzWLyt3TqvxHyBjHpzEZG0JyNFRs/khlO/XtjiQg/uUdrKPmoIxsGKjyTpg
 IQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956150; x=1709560950;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=;
 b=geBT0rkGDCfaBwO9vBBFXl6N+bWrMiz+kP2afqb9Hsns1655qfa6x6cX1zGaUlW841
 Y/zUSnTgy+GZBtAu8tuz3TNNPfmVM+8mcMMz+8/iCDZQWTwExQNk00LGW/fib2Vjdjwl
 TAf5hgR10h/mXZ+WoUhW9Y1uadxM1O2BgB83ryaMhYLkhi+eZcu8HYdG6c0F99ucVuyj
 oo8d1sydnVjs3wR/SlHJ7fA2+J5n0R+t41n1OSkk0Xjk1uYN5p9UOSftPB9uDEiLLNZc
 AjTeYp0hTmE41swsvJhZbp4a9EhzP5MPcqMkFfxJaLfjOixxucfxEDkEuQRz+WiohhrS
 1DYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNEZ7klGpcMlCThmYLwD2qzN8Bnj/u5sj6nEktBUiIbgm4pdVoNxH1GttjGUvKmpEN59fMiHPgVcF5YV8gjreqiybStYZQ0UjLN/G70M5b
X-Gm-Message-State: AOJu0YyNGjcFsRdia9T5QYyjbbXJRwK+rDUUuFM9cfWu0czZ7E9BfRfF
 zZUA12aP+KRv/FWiSw59S5+ib0TqSKbl0eycrFSJaaYrE6T3BkkFzELwd5frrxc=
X-Google-Smtp-Source: AGHT+IHscKedkQ0b/ug4V8wD/SHcqJqmEUf1to81tnkJ5MmC7hJV2OxNQvlYaWfsvt7J++chxx9drQ==
X-Received: by 2002:a05:600c:4712:b0:412:a1c6:ecd with SMTP id
 v18-20020a05600c471200b00412a1c60ecdmr2618588wmo.30.1708956150455; 
 Mon, 26 Feb 2024 06:02:30 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:29 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:55 +0100
Subject: [PATCH 17/18] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v1-17-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=xG6Nj+SE5fOs36aPHS6J8P8h9OIISvMcqRKMRAq4LYM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndiuFBdHmvYSuhV3YrAB4ZgAGaQLk95FRZXpfT
 wtQhZmaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURXRbEA
 CB9zjhs3sNHEteUCvQ7PrQLUoBwpi65oTqrtSHIx+d2xsx9LuHXmpU/xqe38wf+OtnmZOOJXZzKrpY
 i0XGXZ/6LpLMRhDtX3j8bre7wiZCd7P/u4QlKd1wEe308TC58uug9S5heRGPAG1FkkBAeRjMY96U9t
 pUZ2vFGYevyYNZ3hhdImBX8Eiyxum8nLgcwRTvy1GKYk8x1tNBNpvcIj2mDXX5vzTmwzYBZDSBILkD
 48ugwynpcguHwd+liyeNx752fp//0e2p1mo5uvO3SgAVjaRCLtujqhfaU1PIpis7Bj2oWMuF2dIouh
 cKX1zee+YOUH2t4EzgOIU+EFVz0P4NTEaQJnm/cHhlDcM+iFsYFqjrWSmhUOOeutQ7/Zohp27vtSTV
 +k07l7G5eQJ/fWDCLNpr5Um3MUer6A0GPYc+oD/n1N1IwUTUfkqSVYpIjIWGbetyn1Kl5y0aqEDPpL
 a9XAD58F/z9THIwcEtj5QIg5QwlfyjjanLxk4UEJq4MLstDl7/N84yXPN5F+WGYnmsMldbGRbGh1aV
 ZXUdVCS6iGy4MG65GdrHOZvVANbQ+8AD/4Oyqm3g8qDxWqUvTcvZugmTVO+S3yPP6WU8lV0bvZ+IuK
 ovAQgS57irkAK2DYyA2a6OjucJzc4Bof15oIZvsaabiHCsMnhhLk60UlZPLQ==
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..13cd1298832b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * (C) 2018 MediaTek Inc.
- * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (C) 2024 BayLibre SAS
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,45 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>,
+			      <0 0x11221000 0 0xA000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			mediatek,topckgen = <&topckgen>;
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
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1

