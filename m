Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB98B3DCC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFFA10F1FC;
	Fri, 26 Apr 2024 17:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JpRpfRCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70E210F1B0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:46 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a5883518135so279541866b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152165; x=1714756965;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7RgW8794hN60MILI/kljVur+gnpfRmnQ67qOV8Uh/Cg=;
 b=JpRpfRCjhs+J0ZW7S8yoRbPNyHBnNS9nWeg/My4K98AfR8XwhlaC/6HC49QR0IYBOK
 Y0PEanyZoRXsOeVUVShosscG29Y8kyRMKPQsIQSQI9XhJfkT1MloepRL8PWSYfN2H8rC
 hyHhsuVnhxKjQEhAp/ibCm72KbjL9wK4oZ+gnBJ9xjXSSSzhp3f+slMvov/A2cHbzv3f
 Dckcl9xyIPULk6Fym+DiGYZDOojXHUlb1OmUloMNmNxF2EmHuDpHZ07cAvEWnuUlRwFS
 /IpfwUz//E2L/SAhC+Dgug91yareM9dwNXO+kELbu5A9Nxf7F9ny7X2tFnq7mV2Bq7BX
 9dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152165; x=1714756965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RgW8794hN60MILI/kljVur+gnpfRmnQ67qOV8Uh/Cg=;
 b=WxD24cisqNlxryFOgFM+oFTulaYrCVFq6kTNW0g3bFvCemVRD1m27f8xvztupUw0RJ
 pDx+88y78I3Kw5qNqMth62M9aKbLSJvoR5L6T4ALfhWZYpbi6cAdc1g8gIJTW6S3qd05
 HqzhCHPGJ2cjslqwkk1t4hF7ypC2Ir4AH5r+TESpyW3yVy9cBewkTr1iavGWeZdnwcwU
 BDYHa0LHZ6JiCdGTuz2doc9uK/oRMAlxEioI4U/u6Q5KRBOVqIdL01283wQq9u6d7nl6
 +ybIc3na8ANHB4XyBsY+lNAKQK3jf6ioiSFPYY+4cZgR1G3bqzDlQkQvJVskEifkii96
 CLkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmS/XKNFfGe97yBi2Sc0ArKUnUPnBxMlVqf+p+kjA39f8TajVBoAaZCWW+Ufzj0ZE8nEzOfEGM3LG81O+jJQJbfF9sWh+sJk1yVZCf08rb
X-Gm-Message-State: AOJu0YwLs1yz1jJboB2tsl4V5LlCjmBQK+SSo/53q0sTewfmRJrnQHdF
 62ubORqO5JT98NjHk0O5GbrTSoQF6KksQWOYFv9c0ZyvHnVGj5qHsvGAMB/xNEY=
X-Google-Smtp-Source: AGHT+IGJTg6BllHqneBqq6nsjWsMfp9LBW2zggr5YJIRlFGIO495GuWcky6KYjV5PL4y1jJ2x/BRRg==
X-Received: by 2002:a17:906:6895:b0:a58:c0e2:9792 with SMTP id
 n21-20020a170906689500b00a58c0e29792mr140945ejr.61.1714152165289; 
 Fri, 26 Apr 2024 10:22:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:34 +0200
Subject: [PATCH v4 05/16] SoC: mediatek: mt8365: support audio clock
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15161;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=QPkoelXm9AubLbrSKR0yXXVmXp9ic4MwuyG0tg4fC30=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+Las65x6Cj98N6celvxNRPWSqVWhCNsmU2Nloin
 hBtc+/mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURSdFEA
 CxHdeGKfeWg57UktXwet0g7dJP8DC9Amr3nymvW7hGNfNUZ8cQqWTUm7VZXxLemnLHyt4rs+5i/eJ0
 Q65iKRv/JM/JTOaHHzmpjqUOpXepX1p/HbCUlDBn/hbGW1Y9+EjnNBi60g9ClEH4tHiLvQCdWVbytP
 9+sAJrDI9xTmkf8Bt5F8dGwBsbLEacnIPMCIuQLfLEjZ5qNVpkH15JzHqZyDN+lQMDUM6IIphRX7rH
 nT1+GAuktlKn39DQXhO3sQiaqMwK1WLK30+3N8AohM09tAYZXTRfHMUe/p/B4f1eYuRo3tMv0vwnQO
 a3TmYvZuTUzjUL8orBM9gAgQXlZYpoqKTxiqHaem4utnmmhnVvBClRmSBP37UdNgME0qNsmD7Rv8KR
 IkAOU7GEHBFwDMszE8wGntqDbCN6JmT9K+CSB7JEvQ6ezf1t26YpVDEb0eaPHIYPxtQfe+Gpu0xFk6
 4UNzlW/0udoylFD5+fDgjefzvT/vQkAJtkii/FJRcfVyCj70CjnzjNLb2grEDmFvpAWdtbty7dlP92
 YF43xdxFoDItT9PCk/VEFeUuXDBHMeeu/w1Scn3JE5q35ig/h5J6pasEvct0ya/OgCyDPmV/h0gVQ5
 jgQnIBPwTAFIgaFSTJ06Fs3y6eKRBXp9QrN+sIRVLYT1h4nlJuwR+TYQzSXg==
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

Add audio clock wrapper and audio tuner control.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 443 +++++++++++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h |  49 ++++
 2 files changed, 492 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
new file mode 100644
index 000000000000..3a525dae857c
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 AFE clock control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+#include "mt8365-reg.h"
+#include "../common/mtk-base-afe.h"
+#include <linux/device.h>
+#include <linux/mfd/syscon.h>
+
+static const char *aud_clks[MT8365_CLK_NUM] = {
+	[MT8365_CLK_TOP_AUD_SEL] = "top_audio_sel",
+	[MT8365_CLK_AUD_I2S0_M] = "audio_i2s0_m",
+	[MT8365_CLK_AUD_I2S1_M] = "audio_i2s1_m",
+	[MT8365_CLK_AUD_I2S2_M] = "audio_i2s2_m",
+	[MT8365_CLK_AUD_I2S3_M] = "audio_i2s3_m",
+	[MT8365_CLK_ENGEN1] = "engen1",
+	[MT8365_CLK_ENGEN2] = "engen2",
+	[MT8365_CLK_AUD1] = "aud1",
+	[MT8365_CLK_AUD2] = "aud2",
+	[MT8365_CLK_I2S0_M_SEL] = "i2s0_m_sel",
+	[MT8365_CLK_I2S1_M_SEL] = "i2s1_m_sel",
+	[MT8365_CLK_I2S2_M_SEL] = "i2s2_m_sel",
+	[MT8365_CLK_I2S3_M_SEL] = "i2s3_m_sel",
+	[MT8365_CLK_CLK26M] = "top_clk26m_clk",
+};
+
+int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe)
+{
+	size_t i;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
+		afe_priv->clocks[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clocks[i])) {
+			dev_err(afe->dev, "%s devm_clk_get %s fail\n",
+				__func__, aud_clks[i]);
+			return PTR_ERR(afe_priv->clocks[i]);
+		}
+	}
+	return 0;
+}
+
+int mt8365_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_err(afe->dev, "Failed to enable clk\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+}
+
+int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+			    unsigned int rate)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_set_rate(clk, rate);
+		if (ret) {
+			dev_err(afe->dev, "Failed to set rate\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+int mt8365_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+			      struct clk *parent)
+{
+	int ret;
+
+	if (clk && parent) {
+		ret = clk_set_parent(clk, parent);
+		if (ret) {
+			dev_err(afe->dev, "Failed to set parent\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static unsigned int get_top_cg_reg(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8365_TOP_CG_AFE:
+	case MT8365_TOP_CG_I2S_IN:
+	case MT8365_TOP_CG_22M:
+	case MT8365_TOP_CG_24M:
+	case MT8365_TOP_CG_INTDIR_CK:
+	case MT8365_TOP_CG_APLL2_TUNER:
+	case MT8365_TOP_CG_APLL_TUNER:
+	case MT8365_TOP_CG_SPDIF:
+	case MT8365_TOP_CG_TDM_OUT:
+	case MT8365_TOP_CG_TDM_IN:
+	case MT8365_TOP_CG_ADC:
+	case MT8365_TOP_CG_DAC:
+	case MT8365_TOP_CG_DAC_PREDIS:
+	case MT8365_TOP_CG_TML:
+		return AUDIO_TOP_CON0;
+	case MT8365_TOP_CG_I2S1_BCLK:
+	case MT8365_TOP_CG_I2S2_BCLK:
+	case MT8365_TOP_CG_I2S3_BCLK:
+	case MT8365_TOP_CG_I2S4_BCLK:
+	case MT8365_TOP_CG_DMIC0_ADC:
+	case MT8365_TOP_CG_DMIC1_ADC:
+	case MT8365_TOP_CG_DMIC2_ADC:
+	case MT8365_TOP_CG_DMIC3_ADC:
+	case MT8365_TOP_CG_CONNSYS_I2S_ASRC:
+	case MT8365_TOP_CG_GENERAL1_ASRC:
+	case MT8365_TOP_CG_GENERAL2_ASRC:
+	case MT8365_TOP_CG_TDM_ASRC:
+		return AUDIO_TOP_CON1;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_mask(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8365_TOP_CG_AFE:
+		return AUD_TCON0_PDN_AFE;
+	case MT8365_TOP_CG_I2S_IN:
+		return AUD_TCON0_PDN_I2S_IN;
+	case MT8365_TOP_CG_22M:
+		return AUD_TCON0_PDN_22M;
+	case MT8365_TOP_CG_24M:
+		return AUD_TCON0_PDN_24M;
+	case MT8365_TOP_CG_INTDIR_CK:
+		return AUD_TCON0_PDN_INTDIR;
+	case MT8365_TOP_CG_APLL2_TUNER:
+		return AUD_TCON0_PDN_APLL2_TUNER;
+	case MT8365_TOP_CG_APLL_TUNER:
+		return AUD_TCON0_PDN_APLL_TUNER;
+	case MT8365_TOP_CG_SPDIF:
+		return AUD_TCON0_PDN_SPDIF;
+	case MT8365_TOP_CG_TDM_OUT:
+		return AUD_TCON0_PDN_TDM_OUT;
+	case MT8365_TOP_CG_TDM_IN:
+		return AUD_TCON0_PDN_TDM_IN;
+	case MT8365_TOP_CG_ADC:
+		return AUD_TCON0_PDN_ADC;
+	case MT8365_TOP_CG_DAC:
+		return AUD_TCON0_PDN_DAC;
+	case MT8365_TOP_CG_DAC_PREDIS:
+		return AUD_TCON0_PDN_DAC_PREDIS;
+	case MT8365_TOP_CG_TML:
+		return AUD_TCON0_PDN_TML;
+	case MT8365_TOP_CG_I2S1_BCLK:
+		return AUD_TCON1_PDN_I2S1_BCLK;
+	case MT8365_TOP_CG_I2S2_BCLK:
+		return AUD_TCON1_PDN_I2S2_BCLK;
+	case MT8365_TOP_CG_I2S3_BCLK:
+		return AUD_TCON1_PDN_I2S3_BCLK;
+	case MT8365_TOP_CG_I2S4_BCLK:
+		return AUD_TCON1_PDN_I2S4_BCLK;
+	case MT8365_TOP_CG_DMIC0_ADC:
+		return AUD_TCON1_PDN_DMIC0_ADC;
+	case MT8365_TOP_CG_DMIC1_ADC:
+		return AUD_TCON1_PDN_DMIC1_ADC;
+	case MT8365_TOP_CG_DMIC2_ADC:
+		return AUD_TCON1_PDN_DMIC2_ADC;
+	case MT8365_TOP_CG_DMIC3_ADC:
+		return AUD_TCON1_PDN_DMIC3_ADC;
+	case MT8365_TOP_CG_CONNSYS_I2S_ASRC:
+		return AUD_TCON1_PDN_CONNSYS_I2S_ASRC;
+	case MT8365_TOP_CG_GENERAL1_ASRC:
+		return AUD_TCON1_PDN_GENERAL1_ASRC;
+	case MT8365_TOP_CG_GENERAL2_ASRC:
+		return AUD_TCON1_PDN_GENERAL2_ASRC;
+	case MT8365_TOP_CG_TDM_ASRC:
+		return AUD_TCON1_PDN_TDM_ASRC;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_on_val(unsigned int cg_type)
+{
+	return 0;
+}
+
+static unsigned int get_top_cg_off_val(unsigned int cg_type)
+{
+	return get_top_cg_mask(cg_type);
+}
+
+int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->top_cg_ref_cnt[cg_type]++;
+	if (afe_priv->top_cg_ref_cnt[cg_type] == 1)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->top_cg_ref_cnt[cg_type]--;
+	if (afe_priv->top_cg_ref_cnt[cg_type] == 0)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+	else if (afe_priv->top_cg_ref_cnt[cg_type] < 0)
+		afe_priv->top_cg_ref_cnt[cg_type] = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_enable_main_clk(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mt8365_afe_enable_clk(afe, afe_priv->clocks[MT8365_CLK_TOP_AUD_SEL]);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_AFE);
+	mt8365_afe_enable_afe_on(afe);
+
+	return 0;
+}
+
+int mt8365_afe_disable_main_clk(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mt8365_afe_disable_afe_on(afe);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_AFE);
+	mt8365_afe_disable_clk(afe, afe_priv->clocks[MT8365_CLK_TOP_AUD_SEL]);
+
+	return 0;
+}
+
+int mt8365_afe_emi_clk_on(struct mtk_base_afe *afe)
+{
+	return 0;
+}
+
+int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe)
+{
+	return 0;
+}
+
+int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->afe_on_ref_cnt++;
+	if (afe_priv->afe_on_ref_cnt == 1)
+		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->afe_on_ref_cnt--;
+	if (afe_priv->afe_on_ref_cnt == 0)
+		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
+	else if (afe_priv->afe_on_ref_cnt < 0)
+		afe_priv->afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	return 0;
+}
+
+int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
+{
+	if (apll1)
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+				   AFE_22M_PLL_EN, AFE_22M_PLL_EN);
+	else
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+				   AFE_24M_PLL_EN, AFE_24M_PLL_EN);
+
+	return 0;
+}
+
+int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
+{
+	if (apll1)
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+				   AFE_22M_PLL_EN, ~AFE_22M_PLL_EN);
+	else
+		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
+				   AFE_24M_PLL_EN, ~AFE_24M_PLL_EN);
+
+	return 0;
+}
+
+int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mutex_lock(&afe_priv->afe_clk_mutex);
+
+	afe_priv->apll_tuner_ref_cnt[apll]++;
+	if (afe_priv->apll_tuner_ref_cnt[apll] != 1) {
+		mutex_unlock(&afe_priv->afe_clk_mutex);
+		return 0;
+	}
+
+	if (apll == MT8365_AFE_APLL1) {
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
+				   AFE_APLL_TUNER_CFG_MASK, 0x432);
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
+				   AFE_APLL_TUNER_CFG_EN_MASK, 0x1);
+	} else {
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
+				   AFE_APLL_TUNER_CFG1_MASK, 0x434);
+		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
+				   AFE_APLL_TUNER_CFG1_EN_MASK, 0x1);
+	}
+
+	mutex_unlock(&afe_priv->afe_clk_mutex);
+	return 0;
+}
+
+int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe,	unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	mutex_lock(&afe_priv->afe_clk_mutex);
+
+	afe_priv->apll_tuner_ref_cnt[apll]--;
+	if (afe_priv->apll_tuner_ref_cnt[apll] == 0) {
+		if (apll == MT8365_AFE_APLL1)
+			regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
+					   AFE_APLL_TUNER_CFG_EN_MASK, 0x0);
+		else
+			regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
+					   AFE_APLL_TUNER_CFG1_EN_MASK, 0x0);
+
+	} else if (afe_priv->apll_tuner_ref_cnt[apll] < 0) {
+		afe_priv->apll_tuner_ref_cnt[apll] = 0;
+	}
+
+	mutex_unlock(&afe_priv->afe_clk_mutex);
+	return 0;
+}
+
+int mt8365_afe_enable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	if (apll == MT8365_AFE_APLL1) {
+		if (clk_prepare_enable(afe_priv->clocks[MT8365_CLK_ENGEN1])) {
+			dev_info(afe->dev, "%s Failed to enable ENGEN1 clk\n",
+				 __func__);
+			return 0;
+		}
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_22M);
+		mt8365_afe_hd_engen_enable(afe, true);
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_APLL_TUNER);
+		mt8365_afe_enable_apll_tuner_cfg(afe, MT8365_AFE_APLL1);
+#endif
+	} else {
+		if (clk_prepare_enable(afe_priv->clocks[MT8365_CLK_ENGEN2])) {
+			dev_info(afe->dev, "%s Failed to enable ENGEN2 clk\n",
+				 __func__);
+			return 0;
+		}
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_24M);
+		mt8365_afe_hd_engen_enable(afe, false);
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_APLL2_TUNER);
+		mt8365_afe_enable_apll_tuner_cfg(afe, MT8365_AFE_APLL2);
+#endif
+	}
+
+	return 0;
+}
+
+int mt8365_afe_disable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	if (apll == MT8365_AFE_APLL1) {
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_disable_apll_tuner_cfg(afe, MT8365_AFE_APLL1);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_APLL_TUNER);
+#endif
+		mt8365_afe_hd_engen_disable(afe, true);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_22M);
+		clk_disable_unprepare(afe_priv->clocks[MT8365_CLK_ENGEN1]);
+	} else {
+#ifdef ENABLE_AFE_APLL_TUNER
+		mt8365_afe_disable_apll_tuner_cfg(afe, MT8365_AFE_APLL2);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_APLL2_TUNER);
+#endif
+		mt8365_afe_hd_engen_disable(afe, false);
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_24M);
+		clk_disable_unprepare(afe_priv->clocks[MT8365_CLK_ENGEN2]);
+	}
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.h b/sound/soc/mediatek/mt8365/mt8365-afe-clk.h
new file mode 100644
index 000000000000..14fca6ae2641
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Mediatek 8365 AFE clock control definitions
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#ifndef _MT8365_AFE_UTILS_H_
+#define _MT8365_AFE_UTILS_H_
+
+struct mtk_base_afe;
+struct clk;
+
+int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe);
+
+int mt8365_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
+
+void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
+
+int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk, unsigned int rate);
+
+int mt8365_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk, struct clk *parent);
+
+int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
+
+int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
+
+int mt8365_afe_enable_main_clk(struct mtk_base_afe *afe);
+
+int mt8365_afe_disable_main_clk(struct mtk_base_afe *afe);
+
+int mt8365_afe_emi_clk_on(struct mtk_base_afe *afe);
+
+int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe);
+
+int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe);
+
+int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe);
+
+int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll);
+
+int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll);
+
+int mt8365_afe_enable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll);
+
+int mt8365_afe_disable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll);
+#endif

-- 
2.25.1

