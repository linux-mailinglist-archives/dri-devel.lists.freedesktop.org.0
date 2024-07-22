Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6193892F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD9210E38B;
	Mon, 22 Jul 2024 06:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PaLjzXNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07D10E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:54:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a1c496335aso1514492a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631247; x=1722236047;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
 b=PaLjzXNFCgMV5JiEmfeGxyNAadEBzbIlRIJw8IpLTxlvKyMwO6DFgpX4lIRGdPNuun
 DATjlehYnoalzyflybga3BMdQe0/1/xP0x7MLWI264D1YV0YTMqm6s1AQ1E0T24zwraN
 7pN7XgwKkHT2pj1xVO2pYVrZMYchwjJ9V1cN0WJZ0HAk1uXMmo1NaGytTkQaUel4eDey
 eDF5Fi5A8wP5bsufk0OEQ0PjKpgSHxpCmRHslNHy2BldzZBPx6gHKhfV2dz6MPrAh/Q7
 UoraHv7gE4iEZXKp/V4G6mlpLMVPaNL+dTukVdyG7YHoIJw4ZphHlDIP+dyoFPLr8EUq
 D0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631247; x=1722236047;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
 b=sWzlIl4OK4RiKo78BbEZ3BD8HBXh59Gafw9TKfOPpoerZlOKYqC4nywPwgBxKoPBbS
 DMuf/EfEFWq2KFa9BYgOMLC47xAr+otUYCj8ENLa8rldQcm5LEofbvM0EbrzFBmWp9Th
 +cFA5ogrHov6QheMRD2ZETDQRpgJsKawk2wpI3NznU6+zBd0Um2v6kIiZCC/Ui0s015n
 USuZzax/wQ0ix9mJqDoVaOEkSJKs3YGE97rs2WMCqXisor+sZYGjGnjHBGq2KNgyYFYI
 xEgmPLQbfn34MKX9MkMkeqQYVH2R7qHW9By/NYUnrgIxhxJxtjppzBH4mEKQXvFZCOCG
 LJSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMo+OkGZi7b8KBE/zr9qoNjdo2sd4GjnPzasjM4g/UXWrz0KN7ve9sZz+loGyMERLL/Ijyi8E/OXM1/7y8B7yTFrvaT/eGfMDERIr1oSuz
X-Gm-Message-State: AOJu0YwzJlzOfseyKGhuT4bP2PjwYI4xkYIDgtn3niMp/PdReXChG5MM
 67kIe/wtqd9qK2jsq7QOSnigBw9ENqmqa4v7a3vRugz3B+UcTLrMwgMlqNtuIiE=
X-Google-Smtp-Source: AGHT+IFbwYRzzUmRf/OoPJE+V2otzxTtur4mA5CfELlQGEzRRvmmijhQKr10TxEyvnGIljPrOtFCEA==
X-Received: by 2002:a50:d713:0:b0:5a1:4f76:1a1b with SMTP id
 4fb4d7f45d1cf-5a47996fdb2mr4097864a12.15.1721631247621; 
 Sun, 21 Jul 2024 23:54:07 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 23:54:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:42 +0200
Subject: [PATCH v7 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-13-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxLhHwx66j1rggHVESaKaFcYr3S1EhfXZdoGR6
 Rje7IXqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURZUhD/
 94ddsu8PR09DqcBVj41J3lBi/flpiU7BnukO+LFefq9P8A/V0ybcL+/l3vy2J8Fr0PK7h9p4tTMOE+
 j1zsP3RErNYgP7Q2+L+0LMrg7Te8Ai/xFx164rRqHYwxf71gxCWi9YG8yNzsDIkdW1bl8Bea1sxE3g
 /SIgZKsXyw1IKNjdj7somThkysldLNB/zACUS00m2sAjG0tlnKqGeB2JHhsA4nbNRSJE2aFwvyDgKC
 W2N8LPXQD/WMNqIafA9d0zsw7459q1bgUConXMUZqW6MlIOpTIUfNwnt/xGIGjgAcBfvYxRvcPJSIU
 e67LH9WdVjsLjNlFNSqZjkbwbcqmRMssvRSxA+e9oS2MIFM+BNQFJlCgZMytwsgCM3GXZb3sLFskCN
 vQArUtPx+ICBnOGpiMQouk+Q654mNDX8yXoPw0V32Kk4VoZFaaO8fba3BGzVwOkHbvJRpPYk5TPwTp
 p560UcHJoMWJaiIHNHqCEl8BiXReWOxgMF2dgEUFuWWJtrhE+lY+lO6Ct8qVpAJbm/R+DSmYcDEvC/
 N/O4ELUTJ+89rMER+930ldJ20FzHOkeedGw5ne3p0nWwWAl6gCtsuZxFpuEYmKsUDrOV9ZqWFlnx/I
 /KRMDy6+A9IAbMjHF59JlZJJbh7B53Au/+Jcjeuo3cWnF1sh5oNIfRAPbemA==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..e6f7a5a49794 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for MediaTek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for MediaTek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for MediaTek MT8365
+	  boards with the MT6357 PMIC codec.
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

