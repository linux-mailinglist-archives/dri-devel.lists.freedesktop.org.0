Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2C8B3DDD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05067113706;
	Fri, 26 Apr 2024 17:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hihAWTzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFAE10ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:23:01 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-571bddddbc2so2982562a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152180; x=1714756980;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
 b=hihAWTzLYw/eO1KYSXelGHGdoc0JznW0k0pDOZuUSYf8nEnqdvfjCWfUs6YDZd0aNk
 W0RooC/2UKy8JigxWm3XsPYRoPaeB7Dr67567qifITh9nDpWGwFdC1pwSLamNemCiWLo
 sIaUF8eTzs46stpEJAUHWEckMUEW6m/Fp0I/MwYO+cp7vKcBMuv2n9RkwA0MiXgNP69S
 ywtB8+/PLt9nxNudM9T3pXHy2ysLCh4VzZ++nLzZ2VOago0sWdXI9hQnBEKaoMVgk9lG
 KWE7xVS5JJ0oogiN4Cc9ttkuyjJCuQxw+BV+2/dmmjcaSe5OJs1BjkKHQf+p9cFpzLmk
 hclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152180; x=1714756980;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
 b=cLexb539FnrnMtcN830hYKDdZW2PTHS3Y2lpfg+XtJrAdYjFRBI8LkGwoLeKr0spI7
 w8TvNuuVc18nwwi+qz2HuModC/RGnUxmtcuCT8OplTYG8P6WooUu1s+lhFnhTFwqaOWc
 0kSTrJJAlGOLmhYB5zQczuvlM5BXoel9Xq8MQpvoi2agcafxKL6ds4EVvDf5jNsVCjAW
 Rt/yrDUA1wOedIY7RMF4VVbDupxEaQ/GdeTodtFheBaFDkNtVp/PtT0U04TL+XBh7qa5
 b20brE401Xnxd0pSuEfVNCoE9fS7rQeTuGjeEEyrO1oLXXYbEPAzv1tdYOd4minuw8j0
 3Fhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUULZ+2Z1QJjNo1yv24q5uJ2R1ZoZrBXlr4EBjQztAwOPQs2XVh8yJtGbAVtuVH9anCkOijMDnsOVvIJEv5SQRRjOvCe5XM4HkeyjuKA/0d
X-Gm-Message-State: AOJu0YwCdAZbtvoseJfMGq6EsT2QW+32/IYhTFpGQ1aeZY5Kql5S9cYH
 WD0w227VcgWzOBS0u4Kb0yCq9V9I5CKIJ6oImq70+FsDUe7f+rED7VUO3SrWpG0=
X-Google-Smtp-Source: AGHT+IHbc56Ak+iiZKc6UM6Y4436Jjedt2ZE6Lfg8rDGrCH/hYHwl421b4ny1eWhX3iqzBHxLgcC0Q==
X-Received: by 2002:a17:907:20d6:b0:a58:828b:554e with SMTP id
 qq22-20020a17090720d600b00a58828b554emr2613172ejb.71.1714152179855; 
 Fri, 26 Apr 2024 10:22:59 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:59 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:42 +0200
Subject: [PATCH v4 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-13-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+La2MbhNuLjWxwp2m2IbEOSPve0e5649hcdKnUy
 eFfF2Z2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURVS9D/
 9wJyopXYFZ8sHNU/hOFop7d7AhUUMqWMTq6ghx4GKwXdqRxY+U+1R1ozjFG51w0l2XrMFJTEZp5NNq
 /R4N1hJo3MUpx0LwK+xh1AgS9m1BGfZeGvy870ANxleqrn2Th5OzVYYub6CvHmSTwazS/OCu/LW8vU
 ngh8zEeFys9AcCIoqgEjBdF5vCzsRGJ7n9PINqZqOFiPxm+gf7ZYexa/TNOZjjm/nabcgXvyFXdsou
 9LCMWY5YxWbSNYnzpemqgVdjdDLPjz9yn1w0uCOuQvbJsBLh4I1EcLHyRBkSwELYE2F92zhHHFoFxP
 nddG05Yu+XTwsO/xDxzn4sj5+EA/Y7gKilUEvQiPECyAD+ANWhSY3DDE/nuIclOYFuvRFA4DI3Ya8Q
 SNwNWtpdIQSeMMotCEoCKHgatqCKzTP8BUiaoCkoIJwhfFFxKHjkOqnvaMXoSDKZjzu1Zlxx3ftWZR
 HTGGofaOk+LOade2EywQL7K1X6pwIX6uSW/T0XkT7dA9HSVee2ne4Z2gojbAW6saTNssOTHihVQlqa
 6WsFMzHqNmh4J+Te9JsysGF8q2RU5jmV8iyDnhBb58KNGPKTaQjScWYIw5aqRjObOwoiYj5y+GSCB3
 RubdN5kTRddimfOUPsFzSFR/lvjy3GHo247bkweyYeUh/PXbZ9014W5fGMiA==
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

- Add specific config to enable:
  - MT8365 sound support
  - MT6357 audio codec support
- Add the mt8365 directory and all drivers under it.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..c1c86ecc0601 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for Mediatek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Mediatek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for Mediatek MT8365
+	  boards with the MT6357 codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 3938e7f75c2e..4b55434f2168 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
 obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
+obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
diff --git a/sound/soc/mediatek/mt8365/Makefile b/sound/soc/mediatek/mt8365/Makefile
new file mode 100644
index 000000000000..52ba45a8498a
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# MTK Platform driver
+snd-soc-mt8365-pcm-objs := \
+	mt8365-afe-clk.o \
+	mt8365-afe-pcm.o \
+	mt8365-dai-adda.o \
+	mt8365-dai-dmic.o \
+	mt8365-dai-i2s.o \
+	mt8365-dai-pcm.o
+
+obj-$(CONFIG_SND_SOC_MT8365) += snd-soc-mt8365-pcm.o
+
+# Machine driver
+obj-$(CONFIG_SND_SOC_MT8365_MT6357) += mt8365-mt6357.o

-- 
2.25.1

