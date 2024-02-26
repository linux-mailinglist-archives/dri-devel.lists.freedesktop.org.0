Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E6867781
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D08910F1F1;
	Mon, 26 Feb 2024 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iy5RcJdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9151410F1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4129ed6f514so11405875e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956139; x=1709560939;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RKZ18lBh1OnYQ3TyOPJzfLNre2iMelEjg2dX28Xj+Jw=;
 b=iy5RcJddq5tT1Za2nES/kj7sUCEXuIMZordHOoEnB/G4cTL3gE5kH16I+OOYx5QZ20
 GRIJxZmd4wJ69ZwXVmbVIJmG2XCLvpLUxnuaizjvwbZOtKfr2dlZXoNT6IT/Fho8Idfe
 kCumqDBfyrfFKZLLI2bFuHZkEGbSeGTtDLYGR0R07v/8xWu+/Br6TiSiw+vKSx3dhQdw
 tVzRt/UE1/Uwj8ovgaj4xgQkGIgmlOxthM77XTQPDogOUN4Sbw7KLGBx0N9CuRRD7lbp
 n2qWcFDBO9xRKtwqSD1rTUxxquINM+O/Q9LEmWQPO1Lbted4GXe48lpb7bOxtD1Bn17U
 d+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956139; x=1709560939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKZ18lBh1OnYQ3TyOPJzfLNre2iMelEjg2dX28Xj+Jw=;
 b=mYjK6WUMITUk1Rd0e8sMtvoO+WsiGUuq3R3lEmudMNE9WmLfNtSfNcyrOLXtkUmrkh
 oVoI7jMKXoqY+DCFX1rmY9jCsML/riMT2lRi8EPpC4ucWNe8m9vn1VOjIva8f79+jYPO
 FyH8exnS5T1sXlkM6V4fncurH9VfigVOCQuwyGQJiJpxfS7kYaHZmcf7z9vlqv1JJW/y
 XjVKVwEaShjhxCLfUhieYRYFpbwTe7SdLWxZE7GNQm2K2UgdnHc7qmNySNnd6I03Aq2G
 rNVyzte3m69jHRrJKa1UOkV2P5xtxzezjVbBt7c3sraePZMvxShDKGEM9mLWflWtdKvO
 LOIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTJl7i04ipkKfavT3LjFCrvwrS+l8HuZe6UURp32Mpe9a1VqL5XiiNKl1qWLoqYDuRE3Gtr1SoROZ5sH7T4PngBqaXpMi7VBdycpxMnuyx
X-Gm-Message-State: AOJu0YzvW9rvEVTpCnud9AYJMIiv/ypguSQe1yQnEd2P4Jz6XTo4M98X
 NRshvc+9Zp6qlh98bddlmLP1yjwd7WygSfkwyy8B7x4GB4cWvDpgytZwM/O5dEU=
X-Google-Smtp-Source: AGHT+IFYicg4bzNhih8j+7WUKcW85bRUXiYGXRoj2/rhkpW98Ex9kfqJG6uFOs4oxvH5U1F7iqJ8/w==
X-Received: by 2002:a05:600c:3ba6:b0:412:9694:71a9 with SMTP id
 n38-20020a05600c3ba600b00412969471a9mr4216263wms.10.1708956138677; 
 Mon, 26 Feb 2024 06:02:18 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:46 +0100
Subject: [PATCH 08/18] ASoC: mediatek: mt8365: Add DMIC DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-8-4fa1cea1667f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14289;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=WhYTUc5nyLor7cp1cySzYWqCVaRGz/+mjJw6xD9dCo0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncI9fvx+/egkjArf7CY8inuUTtBgKzEp47N8ZO
 3IPFHNCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURSV/D/
 0chIIqI6FUHeI7rRyihvR4ao/+dJLrwRvRzV1gWduyCMyDnOnG9QMAxzkX83YhMAt7d+r+HlnAR61G
 TpbHsY7gZjSLhmfmRqeoQzZjWtlU05XmVKei9kqXU5DHUqCssQKgF7xcKqY+Fc5RIbvpNAu2Uriu6P
 PtA74cu9Uec9CzGpzv/RpzqZN5tTNw1YoVCxMlH7TqL2WcLw00vHeXrjsUOdVTSKzTnMfZSoT46dVy
 RibkVryYVmmTHlirWYr26IXaJ4qXjQxJAOuTFgY4tQ9bYA17Fw8P9Glo+aR8Aa2eoUWAmsWy6YvLPI
 5KTPJc2dNcXcVe7qNzNi2Tb0+CInKcQkvCHoo37+48fIdUrF1ZCTMBwOu+x2bFvHsIPJK9Ijv+wDXK
 j23azVQnMnqT5//fRCBcFvZkF3j9XwROqh0h1BvDNMTlSfqmQRzzBLQQrJyNpIs+30CSMudqAHzlS8
 Ud+z0CIRayTz++KjLE0d8zZU4THFoLJ8fstDuK0ZheuTJjS/6XQUn3NRgq77t8Ws523/Mtbra70MvU
 Xl7QKbp+q6kRqCb/9FKWPpMS8sUAXAENgXdjhfFbNJjCDgJ3lVXsJxCvn5p4dX4F7C8Mz81Xtb1caU
 7wFCOam22CxUM1+2Sts1vWXfpjOFUQBHIQwGJMhRcFHK0Q7JfR13ehzBxXqw==
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
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 475 ++++++++++++++++++++++++++++
 1 file changed, 475 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
new file mode 100644
index 000000000000..1e59f456b7c9
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -0,0 +1,475 @@
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
+/* DAI Drivers */
+
+static void audio_dmic_adda_enable(struct mtk_base_afe *afe)
+{
+	mt8365_dai_enable_adda_on(afe);
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+		AFE_ADDA_UL_DL_DMIC_CLKDIV_ON, AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
+}
+
+static void audio_dmic_adda_disable(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+		AFE_ADDA_UL_DL_DMIC_CLKDIV_ON, ~AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
+	mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_enable_dmic(struct mtk_base_afe *afe,
+	struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	unsigned int val_mask;
+
+	/* val and mask will be always same to enable */
+	val_mask = DMIC_TOP_CON_CH1_ON |
+		   DMIC_TOP_CON_CH2_ON |
+		   DMIC_TOP_CON_SRC_ON;
+
+	switch (dmic_data->dmic_channel) {
+	case 8:
+		fallthrough;
+	case 7:
+		regmap_update_bits(afe->regmap, AFE_DMIC3_UL_SRC_CON0,
+			val_mask, val_mask);
+		fallthrough;
+	case 6:
+		fallthrough;
+	case 5:
+		regmap_update_bits(afe->regmap, AFE_DMIC2_UL_SRC_CON0,
+			val_mask, val_mask);
+		fallthrough;
+	case 4:
+		fallthrough;
+	case 3:
+		regmap_update_bits(afe->regmap, AFE_DMIC1_UL_SRC_CON0,
+			val_mask, val_mask);
+		fallthrough;
+	case 2:
+		fallthrough;
+	case 1:
+		regmap_update_bits(afe->regmap, AFE_DMIC0_UL_SRC_CON0,
+			val_mask, val_mask);
+		break;
+	default:
+		break;
+	}
+}
+
+static void mt8365_dai_disable_dmic(struct mtk_base_afe *afe,
+	struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	unsigned int val, mask;
+
+	dev_info(afe->dev, "%s dmic_channel %d\n",
+		__func__, dmic_data->dmic_channel);
+
+	mask = DMIC_TOP_CON_CH1_ON |
+	       DMIC_TOP_CON_CH2_ON |
+	       DMIC_TOP_CON_SRC_ON |
+	       DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	/* CH1, CH1 and ARC = 0 */
+	val = DMIC_TOP_CON_SDM3_DE_SELECT;
+
+	switch (dmic_data->dmic_channel) {
+	case 8:
+		fallthrough;
+	case 7:
+		regmap_update_bits(afe->regmap, AFE_DMIC3_UL_SRC_CON0,
+			mask, val);
+
+		fallthrough;
+	case 6:
+		fallthrough;
+	case 5:
+		regmap_update_bits(afe->regmap, AFE_DMIC2_UL_SRC_CON0,
+			mask, val);
+		fallthrough;
+	case 4:
+	case 3:
+		regmap_update_bits(afe->regmap, AFE_DMIC1_UL_SRC_CON0,
+			mask, val);
+		fallthrough;
+	case 2:
+		fallthrough;
+	case 1:
+		regmap_update_bits(afe->regmap, AFE_DMIC0_UL_SRC_CON0,
+			mask, val);
+		regmap_update_bits(afe->regmap, AFE_DMIC0_UL_SRC_CON0,
+			DMIC_TOP_CON_CH2_ON, 0);
+		regmap_update_bits(afe->regmap, AFE_DMIC0_UL_SRC_CON0,
+			DMIC_TOP_CON_SRC_ON, 0);
+		regmap_update_bits(afe->regmap, AFE_DMIC0_UL_SRC_CON0,
+			DMIC_TOP_CON_SDM3_LEVEL_MODE,
+			DMIC_TOP_CON_SDM3_DE_SELECT);
+		break;
+	default:
+		break;
+	}
+}
+
+static const struct reg_sequence mt8365_afe_dmic_iir_coeff_reg_defaults[] = {
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
+			mt8365_afe_dmic_iir_coeff_reg_defaults,
+			ARRAY_SIZE(mt8365_afe_dmic_iir_coeff_reg_defaults));
+}
+
+static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
+	struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	bool two_wire_mode = dmic_data->two_wire_mode;
+	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
+	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
+	bool iir_on = dmic_data->iir_on;
+	unsigned int irr_mode = dmic_data->irr_mode;
+	unsigned int dmic_mode = dmic_data->dmic_mode;
+	unsigned int val = 0;
+	unsigned int channels = dai->channels;
+	unsigned int rate = dai->rate;
+
+	dmic_data->dmic_channel = channels;
+
+	dev_info(afe->dev, "%s dmic_channel %d dmic_rate %d dmic_mode %d\n",
+		__func__, dmic_data->dmic_channel, rate, dmic_mode);
+
+	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	if (dmic_mode > DMIC_MODE_1P625M)
+		val |= DMIC_TOP_CON_LOW_POWER_MODE(dmic_mode);
+	else {
+		val |= DMIC_TOP_CON_LOW_POWER_MODE(0) |
+		       FIELD_PREP(DMIC_TOP_CON_INPUT_MODE, dmic_mode);
+	}
+
+	if (two_wire_mode) {
+		val |= DMIC_TOP_CON_TWO_WIRE_MODE;
+	} else {
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1, clk_phase_sel_ch1);
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH2, clk_phase_sel_ch2);
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
+	if (iir_on) {
+		if (irr_mode == IIR_MODE0)
+			mt8365_dai_load_dmic_iir_coeff_table(afe); /* SW mode */
+		val |= FIELD_PREP(DMIC_TOP_CON_IIR_MODE, irr_mode);
+		val |= DMIC_TOP_CON_IIR_ON;
+	}
+
+	switch (dmic_data->dmic_channel) {
+	case 8:
+		fallthrough;
+	case 7:
+		regmap_update_bits(afe->regmap, AFE_DMIC3_UL_SRC_CON0,
+			DMIC_TOP_CON_CONFIG_MASK, val);
+		fallthrough;
+	case 6:
+		fallthrough;
+	case 5:
+		regmap_update_bits(afe->regmap, AFE_DMIC2_UL_SRC_CON0,
+			DMIC_TOP_CON_CONFIG_MASK, val);
+		fallthrough;
+	case 4:
+		fallthrough;
+	case 3:
+		regmap_update_bits(afe->regmap, AFE_DMIC1_UL_SRC_CON0,
+			DMIC_TOP_CON_CONFIG_MASK, val);
+		fallthrough;
+	case 2:
+		fallthrough;
+	case 1:
+		regmap_update_bits(afe->regmap, AFE_DMIC0_UL_SRC_CON0,
+			DMIC_TOP_CON_CONFIG_MASK, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mt8365_dai_dmic_startup(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
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
+	struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_dai_disable_dmic(afe, substream, dai);
+	audio_dmic_adda_disable(afe);
+	/* HW Request delay 125ms before CG off */
+	udelay(125);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC3_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC2_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC1_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC0_ADC);
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_dmic_prepare(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
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
+			.rates = SNDRV_PCM_RATE_8000 |
+				 SNDRV_PCM_RATE_16000 |
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
+static int mt8365_afe_dmic_mode_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+
+	ucontrol->value.integer.value[0] = dmic_data->dmic_mode;
+
+	return 0;
+}
+
+static int mt8365_afe_dmic_mode_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+
+	unsigned int val = ucontrol->value.integer.value[0];
+
+	if (dmic_data->dmic_mode == val)
+		return 0;
+
+	dmic_data->dmic_mode = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static const char *const dmic_mode_func[] = {
+	ENUM_TO_STR(DMIC_MODE_3P25M),
+	ENUM_TO_STR(DMIC_MODE_1P625M),
+	ENUM_TO_STR(DMIC_MODE_812P5K),
+	ENUM_TO_STR(DMIC_MODE_406P25K),
+};
+
+static const struct soc_enum mt8365_afe_soc_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(dmic_mode_func), dmic_mode_func);
+
+static const struct snd_kcontrol_new mtk_dai_dmic_controls[] = {
+	SOC_ENUM_EXT("DMIC_Mode_Select",
+		     mt8365_afe_soc_enum,
+		     mt8365_afe_dmic_mode_get,
+		     mt8365_afe_dmic_mode_put),
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
+
+static int init_dmic_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_priv;
+	struct device_node *np = afe->dev->of_node;
+	unsigned int temps[4];
+	int ret;
+
+	dmic_priv = devm_kzalloc(afe->dev, sizeof(struct mt8365_dmic_data),
+				  GFP_KERNEL);
+	if (!dmic_priv)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "mediatek,dmic-mode",
+					 &temps[0],
+					 1);
+	if (ret == 0)
+		dmic_priv->dmic_mode = temps[0];
+
+	dmic_priv->two_wire_mode = of_property_read_bool(np,
+					"mediatek,dmic-two-wire-mode");
+
+	ret = of_property_read_u32_array(np, "mediatek,dmic-clk-phases",
+					 &temps[0],
+					 2);
+	if (ret == 0) {
+		dmic_priv->clk_phase_sel_ch1 = temps[0];
+		dmic_priv->clk_phase_sel_ch2 = temps[1];
+	} else if (!dmic_priv->two_wire_mode) {
+		dmic_priv->clk_phase_sel_ch1 = 0;
+		dmic_priv->clk_phase_sel_ch2 = 4;
+	}
+
+	dmic_priv->iir_on = of_property_read_bool(np,
+		"mediatek,dmic-iir-on");
+
+	if (dmic_priv->iir_on) {
+		ret = of_property_read_u32_array(np, "mediatek,dmic-irr-mode",
+						 &temps[0],
+						 1);
+		if (ret == 0)
+			dmic_priv->irr_mode = temps[0];
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
+	dev_dbg(afe->dev, "%s()\n", __func__);
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_dmic_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_dmic_driver);
+	dai->controls = mtk_dai_dmic_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_dmic_controls);
+	dai->dapm_widgets = mtk_dai_dmic_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_dmic_widgets);
+	dai->dapm_routes = mtk_dai_dmic_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_dmic_routes);
+
+	return init_dmic_priv_data(afe);
+}

-- 
2.25.1

