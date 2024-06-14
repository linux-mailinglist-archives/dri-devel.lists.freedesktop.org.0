Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75419084DC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9546610EC73;
	Fri, 14 Jun 2024 07:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CU/9zKoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1372E10EC69
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:23 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so1707695f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350101; x=1718954901;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
 b=CU/9zKoAfEwTJaVXjXdQ+3jgiXun6wvygXdxqfZ5W3043Dn1hX/2jXNQAWKgqCjSvx
 /hVyY8iGViR7MznRcW+ui2tAWQHMk6DnU5LO9GXwOwHuv3avsFv8hZU8AEGzplhIUTRa
 04fLE7Pwd2fRhfmKJi52j8cNAVd8b6C1IHf8KM4aslSKm2ZUJa5LfO52d7+ls85z1SnG
 HGGmdkuClK88Xtk5itgZ1UIDjZ230o7wqob8SRdn80GpedkU6TAzi1n1oLXkVnFKrfOc
 jDz+z8++Ib1filbjPCH+c2AAbXPYpmplQC7oTnOvwgqZMowE9Mn7LV5Uvg4qSkRMT7Xd
 gTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350101; x=1718954901;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
 b=tZIzBQuvSWoNchlvmu6B3O08ZAq2dvMIRchZWG/m4fOJ3/DUyehmjKt6UWMizq2AFs
 cpqSXShozWTexaAEveE2MJRbopHqdL9slRkPXh4Xj3E+qpv0CCcCGa6p0E2hIMERAi2t
 ufXKQ0tc1RvCnX4Z4QlPwSH/NqSndORf8lgOwThqeOEZLWFaRn/gGcxkaDEOhmTAPn0J
 XblS7BaXHiRFdurRzPwE9++WGuWCgGcBSqw1Ysr/JjmEpOaL5e5cuOkdpN4FM6T/m4+8
 Idz15AhOxVeLOPHJRnqPPsHptxSAeg0sAVZK9V7S9qwuy6GWo5IfxmF5+toxRMGu4sI/
 TvWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGKHxV3Chrc+U8KOzve/wBJwwbEYZhUSqQIt71pUfwRj/ZboMPaHzlcfkHCKpvO7BgrjZvftmORhn1CvnxdPcRKkUuRciW6D5NU71N8tM7
X-Gm-Message-State: AOJu0YySbP+LkTaR8ETVgdjxiCKjbBtkr94DkvNgHfIAYK2F0D72V1Ij
 ttvzMDYiSY6qCXqrw3aCGTnKr6Ut8WelmmrqF8CFJUk4PfoM3ZoLwRiOAZB5iI4=
X-Google-Smtp-Source: AGHT+IHpHTOl5QY00tqzxh9OhoCQurXEk9QIL2u7zQNMO52wgT/TSDNb/CU/N+DsMPE6NNLY7yq2jQ==
X-Received: by 2002:a5d:58f1:0:b0:360:7a19:4bb with SMTP id
 ffacd0b85a97d-3607a78237cmr1161501f8f.51.1718350101288; 
 Fri, 14 Jun 2024 00:28:21 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:56 +0200
Subject: [PATCH RESEND v5 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-13-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/PHaUW2bvmY9tCiVjihESjYpsC4I7oQKoqwB3
 mHC8l7eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURbUpEA
 CqbFqWc7ZVeRe0gmWB+Yo6vl14789DYula2eT5S04/NlyciCaGMqNlxwJyxvuDRv1Hjl6NISBksh4c
 pD9tKX6C1RlEy1NP+fsqXkUGXpLp1KJoyaDRhwGr7fo3Xdo8yo+AXmTydOnxaDqksESf92YAtgH8Vv
 ag+9kzYhtIfZN9d3nO+MnJBNhCXET+Din9J8EWqe1Wc+phmLXUBF5CwpsBny9fw5+5JkdJ55iqnQ8l
 NVJDLcmmDD2ErJWdZ7rDaoFLMWmuHfL3OuWvjsYl5j5K593cGaPhLRxCDfmKM3nqGM+mo4MOmDXlk6
 orlvUwUehIxEo4pdlSU0oZ8VdoBLJ67jFlt7Hg+59Ziw1y6tdRlUg4DqmhzarAPMA9PvSCYG7ynbBf
 Uys2U/0V6Qbiw1bmveh8ogCKlDV9lQyYgZQ14QqEgkCX2amkoq1GiIMvcBBoW3PZCvVuS/D8kT4zIW
 5yHt6P0LzRJNNT0REWz4Oq0rdlcsn5lRw/ciN+x/aR2hQQNmWWOSR58YhLGUOKn1dtyQDZm+wXraxs
 j3wGYPF+M0fX3Ktlx77mRdkMeQcnhIcgUWcjjSrzlKKDzDwDBgIRcXPxhMNDHa+tqc1X8M0Qgm5p6a
 qCe5OjUo70Shs8K1eV0v9l8cyyxv3wWJvSJSKo/J0MjWS8trl7OEMDIt4coA==
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

