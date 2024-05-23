Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A48CCE50
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FF410E1CC;
	Thu, 23 May 2024 08:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oA7xJdZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A3510E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:42:55 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso54897511fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453774; x=1717058574;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6jle9CzKb5vRoG0pfCx25HK35X6CFkw4DyQ9IrezQVQ=;
 b=oA7xJdZTLEf63lIzFPmxM3hPAtUwRklh1YS0W/jiCa0Jhf2S4pWlipz4lJTXX3gmZ7
 a7UFj13sSzT2ZZG05xTFPJa9gXVbBHONFy7w7MQsM7svZ41BBfkIAznYJcVBmrFL4ayR
 GHswysiVaP8NXHJROLZYhV5Yue7LF1kRrkHgip1U94Lx6wGD2XE0/m4f5zm+zPF7aO33
 gx0sNYbh+1z9IHjlXngP2suPBJIcuKJ04BlDPqoQpI9t0TjPs4EeWM1jwqDb0fWegI0Z
 dCxLlQjrz8B5pub7skjEu/ZVqiAKRjGaLjNTKb/MR3To9T/xRxZWCaXRJ0BDh1533hRl
 Jbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716453774; x=1717058574;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jle9CzKb5vRoG0pfCx25HK35X6CFkw4DyQ9IrezQVQ=;
 b=frsdM1XZUKiSrpCqlXDi3jQXO3wPS6HVsf5/7JidmIhkZ6CdpnUTTNWFSxGeCBP1Ql
 Rv+kXY8z/YKjdBWdsmzab5gfL6hKhGo2Bf4XfKmGslx8b+JzBcdvWsMm0uXsAVB8WKV5
 WvpCkUDXvgLXGdftthOBNv8seNaAWdx6lrB8xFSpCtJEy3EaTyiAKFVG2hSSUxTkYgEP
 L84x72xQkJVIRxxd29UoYPIRan9xfFgprh26YcyuwbFlbKCJJ1es5vh9f6JXbG+08tXG
 PKNMTBp3AqcvvJHyNoSctezpzzW+lyHGJcjVYY2kNfdkvQd4GDz3bux1+mSvLxACDrwo
 lycA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdyZxUmg60buRAHNXTvtoPBUWVISKj6FLQxXQq7BdJSvjVuXPP3kXzrpGjqzAvKeNIlp8+atGu+SKC08h/CfTism+UGMsTKTfxceiN0+WN
X-Gm-Message-State: AOJu0YxD1IeAMb5ue+zm5XuDD/PhCRLgdlpf3j67PHq//w+EZtF9pitG
 jqOEa0F9U8TH+DtlV4H11nxkP1r/kx4SVqLsdm6b7ItFssUD4PWkLu6paVm7/hY=
X-Google-Smtp-Source: AGHT+IFXDMrKCWne9lt1UGF81xaAzFH+2qMFACI5i3XwZnMCoCldQ6Z/syrf8Jw1EJzmuig6y1BlqQ==
X-Received: by 2002:a2e:b53b:0:b0:2e4:d2cd:a736 with SMTP id
 38308e7fff4ca-2e949573056mr21972231fa.23.1716453773753; 
 Thu, 23 May 2024 01:42:53 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:42:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:37 +0200
Subject: [PATCH v5 08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-8-e7e2569df481@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10393;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=FkqoRaZS9CBsyXO4bbCwEio14eVUz9malYSup81CLNw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/vVn7rxnoXmdZccwrp3mtllsNl/WF/l0xRbJI
 2NzjKSKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURRFaEA
 CHrWquu4zYYtr//IUTJlvx3Crz4GUblUmCRUBoYlB5Wr095MouI7Yu34USFvDcGBmRT7rOZHzG1p6U
 N2WJ+BZY6L5G6hNtQpt6pGGGkbgnFZX8Z3Ao/PcbGktlqHOkmMOYfK2nQpabGy3hEXEkxFqnBGAmGe
 dwMv9vqfHhKtskcacFJbmomTC1rGV9OuT/mXG0s6EYrP4vuLfs5GbI4zaPjwKEf4twmQU1yCZDcXyE
 PEpT/CjKLKE3jOwGrY+bmAGRYdltGM9OfrkZwFHjssltC+iBW7jVqtWjlMMYtICBbOp9LO/dsHolcV
 IEsbXGF1t5KM9nuEd4Kblt5b9EEiQqtdydjx3KA3O7Ze3NmYfEAqrIt3wbLRF79zO6vFkeTpSYtnxv
 8F8fXT+Po3lzEyPfy52BnwNe+rDtyL+o/UHyv/5QkVsTD53hnWD/IitjyvmDZ0JvlZqeQ3cGksdaR3
 ZJtgRXKjIWM8fPHtkngKg0hBEIw/rW8byr8uhYpbIqDxx3zyKCT3DmUfwHmFvBX/jTjRLL07stUQ3f
 nbhrbJs1VKlmT4ILyk2rdKNesyJJmH1bNTEZ+T/JksIbL1UBt2qOuvgfOTsmS83Mkd+Y7w34rNZl0y
 cBAXWm76yJwhQMR3RjSphhLv/xTx4s0kf/binEww66PaDbYnP7qw2j3wi0JQ==
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

Add Digital Micro Device Audio Interface support for MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 340 ++++++++++++++++++++++++++++
 1 file changed, 340 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
new file mode 100644
index 000000000000..d5a4c2fd88ea
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 ALSA SoC Audio DAI DMIC Control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+
+struct mt8365_dmic_data {
+	bool two_wire_mode;
+	unsigned int clk_phase_sel_ch1;
+	unsigned int clk_phase_sel_ch2;
+	bool iir_on;
+	unsigned int irr_mode;
+	unsigned int dmic_mode;
+	unsigned int dmic_channel;
+};
+
+static int get_chan_reg(unsigned int channel)
+{
+	switch (channel) {
+	case 8:
+		fallthrough;
+	case 7:
+		return AFE_DMIC3_UL_SRC_CON0;
+	case 6:
+		fallthrough;
+	case 5:
+		return AFE_DMIC2_UL_SRC_CON0;
+	case 4:
+		fallthrough;
+	case 3:
+		return AFE_DMIC1_UL_SRC_CON0;
+	case 2:
+		fallthrough;
+	case 1:
+		return AFE_DMIC0_UL_SRC_CON0;
+	default:
+		return -EINVAL;
+	}
+}
+
+/* DAI Drivers */
+
+static void audio_dmic_adda_enable(struct mtk_base_afe *afe)
+{
+	mt8365_dai_enable_adda_on(afe);
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
+			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
+}
+
+static void audio_dmic_adda_disable(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
+			   ~AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
+	mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_enable_dmic(struct mtk_base_afe *afe,
+				   struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	unsigned int val_mask;
+	int reg = get_chan_reg(dmic_data->dmic_channel);
+
+	if (reg < 0)
+		return;
+
+	/* val and mask will be always same to enable */
+	val_mask = DMIC_TOP_CON_CH1_ON |
+		   DMIC_TOP_CON_CH2_ON |
+		   DMIC_TOP_CON_SRC_ON;
+
+	regmap_update_bits(afe->regmap, reg, val_mask, val_mask);
+}
+
+static void mt8365_dai_disable_dmic(struct mtk_base_afe *afe,
+				    struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	unsigned int mask;
+	int reg = get_chan_reg(dmic_data->dmic_channel);
+
+	if (reg < 0)
+		return;
+
+	dev_dbg(afe->dev, "%s dmic_channel %d\n", __func__, dmic_data->dmic_channel);
+
+	mask = DMIC_TOP_CON_CH1_ON |
+	       DMIC_TOP_CON_CH2_ON |
+	       DMIC_TOP_CON_SRC_ON |
+	       DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	/* Set all masked values to 0 */
+	regmap_update_bits(afe->regmap, reg, mask, 0);
+}
+
+static const struct reg_sequence mt8365_dmic_iir_coeff[] = {
+	{ AFE_DMIC0_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC0_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC0_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC0_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC0_IIR_COEF_10_09, 0x0000C048 },
+	{ AFE_DMIC1_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC1_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC1_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC1_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC1_IIR_COEF_10_09, 0x0000C048 },
+	{ AFE_DMIC2_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC2_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC2_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC2_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC2_IIR_COEF_10_09, 0x0000C048 },
+	{ AFE_DMIC3_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC3_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC3_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC3_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC3_IIR_COEF_10_09, 0x0000C048 },
+};
+
+static int mt8365_dai_load_dmic_iir_coeff_table(struct mtk_base_afe *afe)
+{
+	return regmap_multi_reg_write(afe->regmap,
+				      mt8365_dmic_iir_coeff,
+				      ARRAY_SIZE(mt8365_dmic_iir_coeff));
+}
+
+static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
+				     struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	bool two_wire_mode = dmic_data->two_wire_mode;
+	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
+	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
+	unsigned int val = 0;
+	unsigned int rate = dai->rate;
+	int reg = get_chan_reg(dai->channels);
+
+	if (reg < 0)
+		return -EINVAL;
+
+	dmic_data->dmic_channel = dai->channels;
+
+	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	if (two_wire_mode) {
+		val |= DMIC_TOP_CON_TWO_WIRE_MODE;
+	} else {
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1,
+				  clk_phase_sel_ch1);
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH2,
+				  clk_phase_sel_ch2);
+	}
+
+	switch (rate) {
+	case 48000:
+		val |= DMIC_TOP_CON_VOICE_MODE_48K;
+		break;
+	case 32000:
+		val |= DMIC_TOP_CON_VOICE_MODE_32K;
+		break;
+	case 16000:
+		val |= DMIC_TOP_CON_VOICE_MODE_16K;
+		break;
+	case 8000:
+		val |= DMIC_TOP_CON_VOICE_MODE_8K;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(afe->regmap, reg, DMIC_TOP_CON_CONFIG_MASK, val);
+
+	return 0;
+}
+
+static int mt8365_dai_dmic_startup(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_afe_enable_main_clk(afe);
+
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC0_ADC);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC1_ADC);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC2_ADC);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC3_ADC);
+
+	audio_dmic_adda_enable(afe);
+
+	return 0;
+}
+
+static void mt8365_dai_dmic_shutdown(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_dai_disable_dmic(afe, substream, dai);
+	audio_dmic_adda_disable(afe);
+	/* HW Request delay 125us before CG off */
+	usleep_range(125, 300);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC3_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC2_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC1_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC0_ADC);
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_dmic_prepare(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_dai_configure_dmic(afe, substream, dai);
+	mt8365_dai_enable_dmic(afe, substream, dai);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_afe_dmic_ops = {
+	.startup	= mt8365_dai_dmic_startup,
+	.shutdown	= mt8365_dai_dmic_shutdown,
+	.prepare	= mt8365_dai_dmic_prepare,
+};
+
+static struct snd_soc_dai_driver mtk_dai_dmic_driver[] = {
+	{
+		.name = "DMIC",
+		.id = MT8365_AFE_IO_DMIC,
+		.capture = {
+			.stream_name = "DMIC Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_dmic_ops,
+	}
+};
+
+/* DAI Controls */
+
+/* Values for 48kHz mode */
+static const char * const iir_mode_src[] = {
+	"SW custom", "5Hz", "10Hz", "25Hz", "50Hz", "65Hz"
+};
+
+static SOC_ENUM_SINGLE_DECL(iir_mode, AFE_DMIC0_UL_SRC_CON0, 7, iir_mode_src);
+
+static const struct snd_kcontrol_new mtk_dai_dmic_controls[] = {
+	SOC_SINGLE("DMIC IIR Switch", AFE_DMIC0_UL_SRC_CON0, DMIC_TOP_CON_IIR_ON, 1, 0),
+	SOC_ENUM("DMIC IIR Mode", iir_mode),
+};
+
+/* DAI widget */
+
+static const struct snd_soc_dapm_widget mtk_dai_dmic_widgets[] = {
+	SND_SOC_DAPM_INPUT("DMIC In"),
+};
+
+/* DAI route */
+
+static const struct snd_soc_dapm_route mtk_dai_dmic_routes[] = {
+	{"I14", NULL, "DMIC Capture"},
+	{"I15", NULL, "DMIC Capture"},
+	{"I16", NULL, "DMIC Capture"},
+	{"I17", NULL, "DMIC Capture"},
+	{"I18", NULL, "DMIC Capture"},
+	{"I19", NULL, "DMIC Capture"},
+	{"I20", NULL, "DMIC Capture"},
+	{"I21", NULL, "DMIC Capture"},
+	{"DMIC Capture", NULL, "DMIC In"},
+};
+
+static int init_dmic_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_priv;
+	struct device_node *np = afe->dev->of_node;
+	unsigned int temps[4];
+	int ret;
+
+	dmic_priv = devm_kzalloc(afe->dev, sizeof(*dmic_priv), GFP_KERNEL);
+	if (!dmic_priv)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "mediatek,dmic-mode",
+					 &temps[0],
+					 1);
+	if (ret == 0)
+		dmic_priv->two_wire_mode = !!temps[0];
+
+	if (!dmic_priv->two_wire_mode) {
+		dmic_priv->clk_phase_sel_ch1 = 0;
+		dmic_priv->clk_phase_sel_ch2 = 4;
+	}
+
+	afe_priv->dai_priv[MT8365_AFE_IO_DMIC] = dmic_priv;
+	return 0;
+}
+
+int mt8365_dai_dmic_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+	dai->dai_drivers = mtk_dai_dmic_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_dmic_driver);
+	dai->controls = mtk_dai_dmic_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_dmic_controls);
+	dai->dapm_widgets = mtk_dai_dmic_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_dmic_widgets);
+	dai->dapm_routes = mtk_dai_dmic_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_dmic_routes);
+	return init_dmic_priv_data(afe);
+}

-- 
2.25.1

