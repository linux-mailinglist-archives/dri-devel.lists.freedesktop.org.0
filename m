Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DB8B3DD9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE4311252E;
	Fri, 26 Apr 2024 17:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yOZxZyQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292610EF50
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:52 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a58989cd1f8so314686066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152171; x=1714756971;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HRoWVbb+97QwHrxPYSUdLG6n9gcD28au02QPhJHqhYE=;
 b=yOZxZyQiHnIz1HNfuMihqRXLzHnMhOhRFcYcXblDLC31tark/7Ee3+AcpFMfyi4TH9
 hf3fCpd2aauMEa0zu8S+vIN/m6xkaFxsy1tQTgxcB8H7Aw/oQHAtP2cGmPeX/N4RFDyO
 ZXZr9jhXiWNwg7n9QtIbiBor2/h/XroGzXoTEqj+C98MOea5Kjc47aCwzkMWAwozUj23
 AQDpGe7YULCjN3VRADvNTY2oTNAp1zudCDjIlRpZHLs5/WMTN9YJq1QO/Srq1EEN0bwd
 cJHi5fzknVyCv5xDFXs45hzWcXiao3Ps6RDo0d1PF2kvL2fczlxZnaZlGKrwZi+PYhvg
 BA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152171; x=1714756971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRoWVbb+97QwHrxPYSUdLG6n9gcD28au02QPhJHqhYE=;
 b=wZP1db6mVYlQa29SZjOnIeQYAuIvfUxegJH2j8daXhKRl/Yjuj0s890Y+IrAZ2YSxH
 FuLP2/9RWVtPnh7roaYUUMQ++Ym/Naig3oa24sDtgd1/q93q/xDPwjWe1DcoR6Y/vaX1
 s+5ikvhgDOtukhskiDugGj4Duq3MEesksrPN/cFe1SxF8E3zD7qRvqPeI2NpAv9Cyp+C
 dxIEsIZD9akew2dsntHsFUNXBjaqw+n5YCLcBrFCXHrZn/ckK0+ak2jPZjD8JnXzcIs1
 DPPp39kkA6KhREohJtD5uLXEEeAhPvcg0ok314lOWvy8rplBay0D+Quwy0Msl/lFmaPK
 Z4qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFWM1cboK6NwxERNNpia9VaR67EONyW+y4VrGrkrYEIcSFb/ob/2TXzgPBdIBcvZyK2Rzrk7yN8aGc7BUn22fkHYx8uRmCqvC1EWmgKo0U
X-Gm-Message-State: AOJu0YwclJCnUX8kcmaO3feWi3bdhAr/A+Hwdc9+fdt9judPWR+jl7Dc
 ML6+Eb8s3zxvADl6AZORDDIV0g7ZO21xsbWJYPYOKJyRipskueaCeOr27LFV/q1eqm5Gff/Ahl/
 e24Y=
X-Google-Smtp-Source: AGHT+IHXGhRsF05KEI9rSFyobyZeQNjkPgaiZbJ/Gg5SCUJ8/lhsG9no5TytbJqKAAbZTzh0C9tdQA==
X-Received: by 2002:a17:906:1d12:b0:a55:5541:7484 with SMTP id
 n18-20020a1709061d1200b00a5555417484mr134733ejh.33.1714152170742; 
 Fri, 26 Apr 2024 10:22:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:37 +0200
Subject: [PATCH v4 08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-8-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10633;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=ikaRpZ9zp5N+GSVqpBpZ6Q+x32qpr9yZKVqFLm31Mf4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+La39p7NVeCECOvhepzHpq9tL3ak5hblHmrxbFg
 T2gmIvmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURV6rD/
 9yiMjfzB9mS9O6DUJZR6kGkvxWtBvZ2fb8K8Ad3J0yXeb5gfz4/ByRZ9wmcXO/WQ/09AT0ViK4YgET
 hdG1aO9UIM+mFA4eKiSMDo8t2CXw2RTD6GppJ9+nrB7TVpYaAtGGX6HDLm1/MjxxbTcxpuw9qlTsEo
 RKRT54gNw6BU1XvPc99V6aEu8/V0X2VJgKG0AJdnAuN+/6mIwJ/r6ARV31JLZ3O39jxlbwCi7WGwO/
 xFGcOMwjcSRSxui9jGgGa7ZZ1ue+FtbJp/G8bwbWUnJu4ejUD91H5rWgM+cNGAgDt1MJ0BAyWoh1qJ
 vOGiSgfVOPaq2e5RKh1A5lud53JoYeWt0sUAzFtnEu/FADfg27/0KMbiE+TEg0cTTPfvrtC9sSHSco
 QOqtTGRPnVGVCK7SF53guG+nqOcp36sVlW0FPz62she9duZZPWkf5yXNjxv3pI1ol/98oNG2ofUwkw
 iewHlTbTc8YFpeS2cmhJpTRcRNzh2OW3juFvT0NDECWm8fy0NuL98bNOCao/2CDvaksreu1IPXGOfA
 KGYPYHP+3stxnQSCG9UiuUjBdlIF/de2U9sw232YDf0pQxw+t8J6OgsEl2aO+FatGYI0J68Aa2nfbK
 3xlIhlx6bhVmPRFn8c0/yLmQQao+z6ao+vwjGIt8Bt56Ym1VtudiCQksbcbQ==
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
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 347 ++++++++++++++++++++++++++++
 1 file changed, 347 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
new file mode 100644
index 000000000000..0dd606274d8e
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -0,0 +1,347 @@
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
+	dev_info(afe->dev, "%s dmic_channel %d\n",
+		 __func__, dmic_data->dmic_channel);
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
+	unsigned int mask = 0;
+	unsigned int rate = dai->rate;
+	int reg = get_chan_reg(dai->channels);
+
+	if (reg < 0)
+		return -EINVAL;
+
+	dmic_data->dmic_channel = dai->channels;
+
+	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
+	mask |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	if (two_wire_mode) {
+		val |= DMIC_TOP_CON_TWO_WIRE_MODE;
+		mask |= DMIC_TOP_CON_TWO_WIRE_MODE;
+	} else {
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1,
+				  clk_phase_sel_ch1);
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH2,
+				  clk_phase_sel_ch2);
+		mask |= DMIC_TOP_CON_CK_PHASE_SEL_CH1;
+		mask |= DMIC_TOP_CON_CK_PHASE_SEL_CH2;
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
+	mask |= DMIC_TOP_CON_VOICE_MODE_MASK;
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

