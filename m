Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68289D66B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE06B112C61;
	Tue,  9 Apr 2024 10:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q8G4By10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8F112C5F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:13:52 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so27489011fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657630; x=1713262430;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=21BTyaio76kOOk8VEFY4ZI/reev7qiH2wYfycvrN1Hk=;
 b=q8G4By10dwQpr5jnUMMZ45sYyNLh2hB1Am9THQSZrdAb+Ejhn3bOmK9CPmj18ecNks
 ccrm70IxbaGqNYigYjuTt7vMnPmkZV4EDNvDmwgsp0v12gZrbcdFqNbkvdGTeRW3PNKZ
 ycfdAtbC/DyqLZCn24pWEHeHHyXQ+Cwv3HHjcIGd/rJhijfGOm8p/2MYzTPzbw7BAwaL
 cKNkQ2eV7wG1FmAOjIdVeq7fLUqqyL85BaUIYVRo2xIF/oUQpor+XSgdFpTj08WkYW0A
 NSxEbOqM98WeAhoN/9NDEcUDNAG3+Bp8wv24bpfABhDr/VtGJHofaO56ZE1YE2KZvTIx
 xWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657630; x=1713262430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21BTyaio76kOOk8VEFY4ZI/reev7qiH2wYfycvrN1Hk=;
 b=l0WfimjDhirtwuz2AQB1DnCI5WZywRD+CVWodBhI7DCRyyc1BQsfIHbwynV/XpN4u+
 V4z+RT79awbzVJGdsi2iTFLda/aBx9qTh7UuY9ni9O01MecLVWjhYSlcWxWgbypzS/la
 sjoHafhS02gHuIE4cb/vX6u6FwFpzHMwu5jSK0xP466a+w3vq0UNS83eITljEChOwDy5
 PDS3b5jDIFRk7a/JulEIcMspm75TUce9cUmEBwa0MwlBmAbXNiUMx2vohUbjOpRPcb5P
 jIWPc5yW+x6A33CMK7+Q5em6TrA2qHXUynmhj2mqanqOmiq53xPxstCPBd2Zdbe5lC0r
 oOYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbw42fVm4aeBky/RccroTUHuKsJ54XfOtQ9p24tCOMMhutEFKG9MMouXEjFwPN3lBnWnTp0OsGthJMnjG9BI/3WHHTZmt9jce14ay5HXRZ
X-Gm-Message-State: AOJu0Yy8AqCXTM/yI2kI8g5m2CdXoCxUZS90UDWK/4hYhcVcPQ98Cfgt
 3H06oLpSCxVayMTqJbykESeoYCTbjQvYLhXjb1pI2l2dKvreMrI3Cg+JHfuZgkw=
X-Google-Smtp-Source: AGHT+IGyb0H1ugZ7DtYUlHTEnteimlCeXou1CaSAURG09wE1ZVSxpa0z0nhvQq/5KOqgKDBqHmy/LQ==
X-Received: by 2002:a2e:980a:0:b0:2d8:3bef:129 with SMTP id
 a10-20020a2e980a000000b002d83bef0129mr8217438ljj.10.1712657630397; 
 Tue, 09 Apr 2024 03:13:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:13:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:27 +0200
Subject: [PATCH v2 06/18] SoC: mediatek: mt8365: support audio clock
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-6-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15471;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=lwYOVG65leUtoV18tIfogfn4DUoTcuiRExyqRBEzavk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT4ts9Cp47u+U0Qg/EiFZ2JiCrG4z7oVeOdZ4t
 E96UAK2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURQKuD/
 4gE8bJsO3omsRu0Unx3kKDLQKQK6utYPI/f1a2iaWVr309Z3uTdH0qv9BvGhrrPBO9FNjx8vvxn6pI
 he0SVUu35nnKFz90oo0s6/LYIVZaJeQ9O+dla1sSRq6iw3Q3dM+EEV32pxiPnQliP2iSTBf5jZHwZu
 WJ95z+iEyqvToN3JY8SPdxAysDm3l7SF6E4KaXlm5muQp8SNXupfpRrvvwZC2aGPkHiGUDWBkSxVBn
 fgjY9a/r/sUrYbw2HmgFFwqDuKmnSyy+tz7KcjJOKOQrJwLOHKa8oty2iNaJfE5qcEEU39G0H9Tpuj
 CpO7ual5P9BbT2yDGR/FgrIO8PmFeMk75phbeIeAXKpgCrApMHvo5LWhzU0OQlTg5Z85mJmpsfJSSE
 hRf2mDTMI/LRNxecdaHgRnjvfOQApCAK7smy2q3nO5TfgcYU09WgiilAn2AGp6GbrmIf8uO3DLfa/P
 o725HkD4UziLrEUV3LU9jFUcthO5t63t/6xX48Hx1LYcpnEDpxIhCIpXK2D/5TpgErAwN95w+tfLAs
 9pQV3ytr6WIPVrFLbRinasTxFvYWxvPOehnwbpNTJMI0K0bvSAisc0i1YmdBKG0O5GUyRTo05CVwfn
 ZHuj2OJq8Qug1afmhtKGmvaJ1MZIM9OscNI0y+neb9gkfvFSE038eXndlOvA==
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
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 451 +++++++++++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h |  49 ++++
 2 files changed, 500 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
new file mode 100644
index 000000000000..c87f8dd91978
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -0,0 +1,451 @@
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
+
+	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							     "mediatek,topckgen");
+	if (IS_ERR(afe_priv->topckgen)) {
+		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
+			__func__, PTR_ERR(afe_priv->topckgen));
+		return PTR_ERR(afe_priv->topckgen);
+	}
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

