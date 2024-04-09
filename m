Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34389DAC4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0501124DF;
	Tue,  9 Apr 2024 13:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PNeiW4YT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54F8112DC5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:42:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so3272461f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670159; x=1713274959;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
 b=PNeiW4YTuIzRTJZ1718EkwQScSnAh+9Gc5TcoUNUwZ9gmu3a4ZnSrbrN3aPpbFYFzH
 euvy/qqfqnKhCytcmeqSb/iuckS1XiLU4mhBKLWrl1G88DGUdSBnk+Sce0YT/xXIOzbd
 s5E34qSmGKuqOsn4dJbSjP0DHWHJ/E6NBQbk/1bfFFyAh9oOykG5yEm9ATxU/7bfQl+i
 NNdusLADW+P1Aece9Z2/QzKzioEMKHI0zO8qoot8lchNhkpdTzPq7zXk1eT5TG9nc3tT
 LBgyQEctX7CcJ1nXON6eEHttnD5bYp4SIJcFtavzjFGTxd9gFj+RPH/+aq4AQ5YtDwNj
 7FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670159; x=1713274959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
 b=I/DQegyzu2GvH/+D8+YbQoJs6LBbhnXuzcqpO/j54R5QG6A0NestQHCzhqe1mLa+0v
 4sh62EKTfnjye4aY+Kx8PuY/wBmgAt4T/DQxshiSmYrsqn39R0qFz7a2ZN7GZOHtGDO6
 eNa6jauoU5/ujUwUqgrTnFQe5Q32p77nNFyYY0YPtZLpOQJ5ES0ko3iayiJUDrj7BMQv
 tgMknV4en0/Vx/C9Jtp4EY8+0tvDECvoX6YakCXrUs+iD4+Uz56lIzKsyVcSsdPHsB3q
 Wyh2tsqwtViSM+EJ59Xe9A7V+BYSSVneIDM/pKyg65eJGHOPyzWFAlZw+fB24RXcJhEQ
 0u3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNPEd1ZkWj6VbYPl1BU4tZI/n9T5FiWgjLn/1Vny1RAnPHeiWwcvmi6o2PNsWl+ZGheUh9LCkzeKnlVE6PqKXzqSVKOqSJ1fEdChIdFFk7
X-Gm-Message-State: AOJu0Yz029e4jixdNvQr5LGKLBmjG1+tKzItXufsVtFnQ9Naljw2/QjU
 aVdU99XS2IWufIp7zodToo/I0B5BHVY7DMFaZy23Y01UDQ3pvYR+ZQYFUhPyO4I=
X-Google-Smtp-Source: AGHT+IFT/jYxzX0p468amfP5nHBXtig4/DVxbRQhBUZKhrK9R/PHxxzjV5SIG2lyyGfyPgKh/QvY7g==
X-Received: by 2002:adf:e802:0:b0:33b:87fb:7106 with SMTP id
 o2-20020adfe802000000b0033b87fb7106mr8234539wrm.55.1712670158897; 
 Tue, 09 Apr 2024 06:42:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:42:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:15 +0200
Subject: [PATCH v3 17/18] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v3-17-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs9eiR7ZWjiZTdx2007n+FBL0uclOGOm0NNV6o
 UmMlzmqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURcNJEA
 Chxjlb3n+vLAZHqid/+3vD4M6xojFtFRmtMlb9M3yrCHnN8JVfMP+TGc3A9pRZ8iAiuVxTGH0Fc5EE
 iTKV5EcFxZvI2XNRHyFqw7wfe9AIDeSnQ4DAYMErxwACqtmh+kWARRdb12VCL3UZ0apiKLg9xOGAuD
 zqY4xkqyVORgH9vEUDvly8X5bI3HcUw+eGhQ9TsPMgcvKoWaaDh38u4Pg2Hp7ZA0o1Ic+znbXasD7J
 OOJfMrJgXZGkZSgqj57Lxg+JOy6Y4VGCYhQ1Ba/QYbECouEIGxzTTvAhboStntir320jN36L0JPfOd
 5EEGAZAkbRxN6OmUPgXJeNk84zN/zu+sO70shVEIRyS5eQiQrk9ADfuDu+3IorKfo5feipMhYTtUHf
 ykQs/ols7b7AogN3UGBJIQujcVGEGCQK85CaDcFgqy8fYwM4lw9y3D+ZL0gCpG8t4/SfX7Z62X45nN
 nktnf6cuF761LyJbDs/cw1KsqdkdAwurmQZvIiVisn39D/UNsmikAqDRlA0AB/DA+kXOb/0I7nlH91
 Eal2NiCwHeGP/evsHQx6Ma1Hrze+kXJxky2ouqnAjD/pOIG6cCD7KD0WLQ8ZpOACrPwCtxnzeFm2os
 SI/p8jCbTY7ISiOc77/bqm27NYWja6L0CwoKdXwfiJSN+RUH8OWW7XpeJ5tA==
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0bb6f6388bb8 100644
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
@@ -813,6 +815,44 @@ apu: syscon@19020000 {
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
+			mediatek,topckgen = <&topckgen>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1

