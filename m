Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6668CCE4D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0B510E09E;
	Thu, 23 May 2024 08:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q5m2k9rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6152910E18D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:42:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-420180b58c3so53612735e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453771; x=1717058571;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K/gefuaMlUgPWxDe2ySPdE18e+JWuRujfXyPEZ2WsjY=;
 b=q5m2k9rw4V7FOBME1do4hOGzR0DWsC6GSFHivK+/Hv2d1EJ81cVl/RpTQfVfboW7ys
 y7e4N9/hHGTHspB9M97PHxf2489jSP3XnsNl6eMEhr/FMLdx6zsOqEXP+diMFG5Mdyhp
 xt6wCPVrD896pafpU1ED/ZltRc3k4oq2Y9t7YsbW7Bdlvy06VUvKjzcfmWoeOTOX6gQR
 UABOaGQCCoEAf9rXRjKqzGpTopBhmASAJ1cEh8eOMZqolcJxwQ4jxfbB0o/s6Yq8Q+FA
 t32AyI6uNiwVUpBv6cFQKjp8VJ9XhuvhwoFgONKU4a1Djcmg2ZHlEQqeZ+Jw1YpQJogZ
 Nthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716453771; x=1717058571;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/gefuaMlUgPWxDe2ySPdE18e+JWuRujfXyPEZ2WsjY=;
 b=BzuU8BCLBSTHuYQ2+KvlG92q6ViCIePZ84sH2QpAeXgRCZGR1Wh6hsgr0CjU0XTM2m
 Ni7xllWBjUi19SGkfzSnm6md4DMAkO3ZZz905HEKbYFaTT18ezF6V/9bF1y9Clux6T0N
 4IkUo4bAsT/et5Su1BPGNbqHJu6CHE7o8KJPMTEDvK6YUOnjWbIMUSUbtG5CILJggl9k
 /qrwzx1T9fHFvD0GJ4YpbmOou/dpCTWgwFmlQJBcLyLPbZ1+rUlVnUg/3nRyw0tGfF/9
 nmpc87NneuMHkoYXKH/68NRLJ9hJs8T+sQdolpyEdSV+nRTo7LpAFRreU2QSoHlN/U8V
 zMzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk9bXGjU+sZWgs+21b0kyNnWwhgZpRWjpESsP9Gt10JLAGMK5jg/UCLDNqHhezW+XdfaQTV8KBQSnicA83NN3WwoPwBP+rXG62Zu+dNYAv
X-Gm-Message-State: AOJu0Yxz6fDORycjXlrEljk5BN8RHVXk30ngowSdfgF7bcIq3ocmI9Cm
 lKPCOtmhw4r55FlSR/ht5g5xnpop92AMVRVn79gMPK632ycq+Mvjn8ZApFc/hnM=
X-Google-Smtp-Source: AGHT+IEz/IPHFgi8FQNgAuTmfreCda2jeMXngxqDrKhN4sll/Y1dySKDMbd0xtQM2lvPbFj87FYISw==
X-Received: by 2002:a05:600c:21a:b0:41b:edf4:4077 with SMTP id
 5b1f17b1804b1-420fd365a9fmr40348875e9.36.1716453770649; 
 Thu, 23 May 2024 01:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 01:42:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:35 +0200
Subject: [PATCH v5 06/16] ASoC: mediatek: mt8365: Add I2S DAI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-6-e7e2569df481@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=28255;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=X8+VoZAv9+lmK13+oDNEEPOL+eO9Db5+GAapFHrJ8+s=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/HW8E7ZfBfspi3XH1dWEQHnvlcBIjuJs/YLtO
 LK3+/PyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURQJhD/
 0bzKjBz50ev1B282QBhtLm8KQUPW705L0Px1WHCkXCwQtZlD5Nh8sGSQYAd1WVfW7HT32Vy+/MsdRI
 Az+IFN4i5mnTnFBTE6VosIb6m7kn5zoA8KlKIq8LD5QQ8TsEzoFw3poDdRd11tq1k7CsxT4Z+7evC7
 VAoZhyfYaZBXlf9TkfKMkT4B3M9dov7yXoXSnmjM2IniJwgnG6ktJajUgGGFaoi2Sz9ftbOdSQiZnQ
 ruyyR3qTTPYbFbh1c+UuL23Qt7HtuLs4OiZkhfDHdWKXtYAV3n9mOAcrMEe6FML4reBQ1ucFFGxVfR
 tBIfzFTFbyB83jA5/EUy6E4YkJgFL/V+bXc+YIbbeAJ3229HB1fXjr5GtOV/GvlpnP+sU23aCUxqHp
 onXnvZ1lQo8qPrhEXgrhJW5eMf11o+w5xbO6kVM5qjP23FWWkZzNlSxkyf1V6ASR3459R15fNr3IR5
 xHyim69Iz4cRArINZqP4cTL4rHGN7A5mAhSx1OSX6OVXMZyfkinANeA3XHIrJ881OmKPUJjtpMMGyE
 MIruDH0kPMEWePBfrplouLAkGoeAxtQww2z+NacIqCfXPL+Bo8e9l/l2u4FjtCQKehejE72/MVgz7a
 5OC67gdloJ5gLi2pc8UIkQVNlXqjuwKf9hd6cv5mrSa89hDZ2PEy8dpNMF5g==
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

Add I2S Device Audio Interface support for MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 850 +++++++++++++++++++++++++++++
 1 file changed, 850 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
new file mode 100644
index 000000000000..9cc1e5e75b64
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -0,0 +1,850 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek 8365 ALSA SoC Audio DAI I2S Control
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
+#define IIR_RATIOVER 9
+#define IIR_INV_COEF 10
+#define IIR_NO_NEED 11
+
+struct mtk_afe_i2s_priv {
+	bool adda_link;
+	int i2s_out_on_ref_cnt;
+	int id;
+	int low_jitter_en;
+	int mclk_id;
+	int share_i2s_id;
+	unsigned int clk_id_in;
+	unsigned int clk_id_in_m_sel;
+	unsigned int clk_id_out;
+	unsigned int clk_id_out_m_sel;
+	unsigned int clk_in_mult;
+	unsigned int clk_out_mult;
+	unsigned int config_val_in;
+	unsigned int config_val_out;
+	unsigned int dynamic_bck;
+	unsigned int reg_off_in;
+	unsigned int reg_off_out;
+};
+
+/* This enum is merely for mtk_afe_i2s_priv declare */
+enum {
+	DAI_I2S0 = 0,
+	DAI_I2S3,
+	DAI_I2S_NUM,
+};
+
+static const struct mtk_afe_i2s_priv mt8365_i2s_priv[DAI_I2S_NUM] = {
+	[DAI_I2S0] = {
+		.id = MT8365_AFE_IO_I2S,
+		.mclk_id = MT8365_I2S0_MCK,
+		.share_i2s_id = -1,
+		.clk_id_in = MT8365_CLK_AUD_I2S2_M,
+		.clk_id_out = MT8365_CLK_AUD_I2S1_M,
+		.clk_id_in_m_sel = MT8365_CLK_I2S2_M_SEL,
+		.clk_id_out_m_sel = MT8365_CLK_I2S1_M_SEL,
+		.clk_in_mult = 256,
+		.clk_out_mult = 256,
+		.adda_link = true,
+		.config_val_out = AFE_I2S_CON1_I2S2_TO_PAD,
+		.reg_off_in = AFE_I2S_CON2,
+		.reg_off_out = AFE_I2S_CON1,
+	},
+	[DAI_I2S3] = {
+		.id = MT8365_AFE_IO_2ND_I2S,
+		.mclk_id = MT8365_I2S3_MCK,
+		.share_i2s_id = -1,
+		.clk_id_in = MT8365_CLK_AUD_I2S0_M,
+		.clk_id_out = MT8365_CLK_AUD_I2S3_M,
+		.clk_id_in_m_sel = MT8365_CLK_I2S0_M_SEL,
+		.clk_id_out_m_sel = MT8365_CLK_I2S3_M_SEL,
+		.clk_in_mult = 256,
+		.clk_out_mult = 256,
+		.adda_link = false,
+		.config_val_in = AFE_I2S_CON_FROM_IO_MUX,
+		.reg_off_in = AFE_I2S_CON,
+		.reg_off_out = AFE_I2S_CON3,
+	},
+};
+
+static const u32 *get_iir_coef(unsigned int input_fs,
+			       unsigned int output_fs, unsigned int *count)
+{
+	static const u32 IIR_COEF_48_TO_44p1[30] = {
+		0x061fb0, 0x0bd256, 0x061fb0, 0xe3a3e6, 0xf0a300, 0x000003,
+		0x0e416d, 0x1bb577, 0x0e416d, 0xe59178, 0xf23637, 0x000003,
+		0x0c7d72, 0x189060, 0x0c7d72, 0xe96f09, 0xf505b2, 0x000003,
+		0x126054, 0x249143, 0x126054, 0xe1fc0c, 0xf4b20a, 0x000002,
+		0x000000, 0x323c85, 0x323c85, 0xf76d4e, 0x000000, 0x000002,
+	};
+
+	static const u32 IIR_COEF_44p1_TO_32[42] = {
+		0x0a6074, 0x0d237a, 0x0a6074, 0xdd8d6c, 0xe0b3f6, 0x000002,
+		0x0e41f8, 0x128d48, 0x0e41f8, 0xefc14e, 0xf12d7a, 0x000003,
+		0x0cfa60, 0x11e89c, 0x0cfa60, 0xf1b09e, 0xf27205, 0x000003,
+		0x15b69c, 0x20e7e4, 0x15b69c, 0xea799a, 0xe9314a, 0x000002,
+		0x0f79e2, 0x1a7064, 0x0f79e2, 0xf65e4a, 0xf03d8e, 0x000002,
+		0x10c34f, 0x1ffe4b, 0x10c34f, 0x0bbecb, 0xf2bc4b, 0x000001,
+		0x000000, 0x23b063, 0x23b063, 0x07335f, 0x000000, 0x000002,
+	};
+
+	static const u32 IIR_COEF_48_TO_32[42] = {
+		0x0a2a9b, 0x0a2f05, 0x0a2a9b, 0xe73873, 0xe0c525, 0x000002,
+		0x0dd4ad, 0x0e765a, 0x0dd4ad, 0xf49808, 0xf14844, 0x000003,
+		0x18a8cd, 0x1c40d0, 0x18a8cd, 0xed2aab, 0xe542ec, 0x000002,
+		0x13e044, 0x1a47c4, 0x13e044, 0xf44aed, 0xe9acc7, 0x000002,
+		0x1abd9c, 0x2a5429, 0x1abd9c, 0xff3441, 0xe0fc5f, 0x000001,
+		0x0d86db, 0x193e2e, 0x0d86db, 0x1a6f15, 0xf14507, 0x000001,
+		0x000000, 0x1f820c, 0x1f820c, 0x0a1b1f, 0x000000, 0x000002,
+	};
+
+	static const u32 IIR_COEF_32_TO_16[48] = {
+		0x122893, 0xffadd4, 0x122893, 0x0bc205, 0xc0ee1c, 0x000001,
+		0x1bab8a, 0x00750d, 0x1bab8a, 0x06a983, 0xe18a5c, 0x000002,
+		0x18f68e, 0x02706f, 0x18f68e, 0x0886a9, 0xe31bcb, 0x000002,
+		0x149c05, 0x054487, 0x149c05, 0x0bec31, 0xe5973e, 0x000002,
+		0x0ea303, 0x07f24a, 0x0ea303, 0x115ff9, 0xe967b6, 0x000002,
+		0x0823fd, 0x085531, 0x0823fd, 0x18d5b4, 0xee8d21, 0x000002,
+		0x06888e, 0x0acbbb, 0x06888e, 0x40b55c, 0xe76dce, 0x000001,
+		0x000000, 0x2d31a9, 0x2d31a9, 0x23ba4f, 0x000000, 0x000001,
+	};
+
+	static const u32 IIR_COEF_96_TO_44p1[48] = {
+		0x08b543, 0xfd80f4, 0x08b543, 0x0e2332, 0xe06ed0, 0x000002,
+		0x1b6038, 0xf90e7e, 0x1b6038, 0x0ec1ac, 0xe16f66, 0x000002,
+		0x188478, 0xfbb921, 0x188478, 0x105859, 0xe2e596, 0x000002,
+		0x13eff3, 0xffa707, 0x13eff3, 0x13455c, 0xe533b7, 0x000002,
+		0x0dc239, 0x03d458, 0x0dc239, 0x17f120, 0xe8b617, 0x000002,
+		0x0745f1, 0x05d790, 0x0745f1, 0x1e3d75, 0xed5f18, 0x000002,
+		0x05641f, 0x085e2b, 0x05641f, 0x48efd0, 0xe3e9c8, 0x000001,
+		0x000000, 0x28f632, 0x28f632, 0x273905, 0x000000, 0x000001,
+	};
+
+	static const u32 IIR_COEF_44p1_TO_16[48] = {
+		0x0998fb, 0xf7f925, 0x0998fb, 0x1e54a0, 0xe06605, 0x000002,
+		0x0d828e, 0xf50f97, 0x0d828e, 0x0f41b5, 0xf0a999, 0x000003,
+		0x17ebeb, 0xee30d8, 0x17ebeb, 0x1f48ca, 0xe2ae88, 0x000002,
+		0x12fab5, 0xf46ddc, 0x12fab5, 0x20cc51, 0xe4d068, 0x000002,
+		0x0c7ac6, 0xfbd00e, 0x0c7ac6, 0x2337da, 0xe8028c, 0x000002,
+		0x060ddc, 0x015b3e, 0x060ddc, 0x266754, 0xec21b6, 0x000002,
+		0x0407b5, 0x04f827, 0x0407b5, 0x52e3d0, 0xe0149f, 0x000001,
+		0x000000, 0x1f9521, 0x1f9521, 0x2ac116, 0x000000, 0x000001,
+	};
+
+	static const u32 IIR_COEF_48_TO_16[48] = {
+		0x0955ff, 0xf6544a, 0x0955ff, 0x2474e5, 0xe062e6, 0x000002,
+		0x0d4180, 0xf297f4, 0x0d4180, 0x12415b, 0xf0a3b0, 0x000003,
+		0x0ba079, 0xf4f0b0, 0x0ba079, 0x1285d3, 0xf1488b, 0x000003,
+		0x12247c, 0xf1033c, 0x12247c, 0x2625be, 0xe48e0d, 0x000002,
+		0x0b98e0, 0xf96d1a, 0x0b98e0, 0x27e79c, 0xe7798a, 0x000002,
+		0x055e3b, 0xffed09, 0x055e3b, 0x2a2e2d, 0xeb2854, 0x000002,
+		0x01a934, 0x01ca03, 0x01a934, 0x2c4fea, 0xee93ab, 0x000002,
+		0x000000, 0x1c46c5, 0x1c46c5, 0x2d37dc, 0x000000, 0x000001,
+	};
+
+	static const u32 IIR_COEF_96_TO_16[48] = {
+		0x0805a1, 0xf21ae3, 0x0805a1, 0x3840bb, 0xe02a2e, 0x000002,
+		0x0d5dd8, 0xe8f259, 0x0d5dd8, 0x1c0af6, 0xf04700, 0x000003,
+		0x0bb422, 0xec08d9, 0x0bb422, 0x1bfccc, 0xf09216, 0x000003,
+		0x08fde6, 0xf108be, 0x08fde6, 0x1bf096, 0xf10ae0, 0x000003,
+		0x0ae311, 0xeeeda3, 0x0ae311, 0x37c646, 0xe385f5, 0x000002,
+		0x044089, 0xfa7242, 0x044089, 0x37a785, 0xe56526, 0x000002,
+		0x00c75c, 0xffb947, 0x00c75c, 0x378ba3, 0xe72c5f, 0x000002,
+		0x000000, 0x0ef76e, 0x0ef76e, 0x377fda, 0x000000, 0x000001,
+	};
+
+	static const struct {
+		const u32 *coef;
+		unsigned int cnt;
+	} iir_coef_tbl_list[8] = {
+		/* 0: 0.9188 */
+		{ IIR_COEF_48_TO_44p1, ARRAY_SIZE(IIR_COEF_48_TO_44p1) },
+		/* 1: 0.7256 */
+		{ IIR_COEF_44p1_TO_32, ARRAY_SIZE(IIR_COEF_44p1_TO_32) },
+		/* 2: 0.6667 */
+		{ IIR_COEF_48_TO_32, ARRAY_SIZE(IIR_COEF_48_TO_32) },
+		/* 3: 0.5 */
+		{ IIR_COEF_32_TO_16, ARRAY_SIZE(IIR_COEF_32_TO_16) },
+		/* 4: 0.4594 */
+		{ IIR_COEF_96_TO_44p1, ARRAY_SIZE(IIR_COEF_96_TO_44p1) },
+		/* 5: 0.3628 */
+		{ IIR_COEF_44p1_TO_16, ARRAY_SIZE(IIR_COEF_44p1_TO_16) },
+		/* 6: 0.3333 */
+		{ IIR_COEF_48_TO_16, ARRAY_SIZE(IIR_COEF_48_TO_16) },
+		/* 7: 0.1667 */
+		{ IIR_COEF_96_TO_16, ARRAY_SIZE(IIR_COEF_96_TO_16) },
+	};
+
+	static const u32 freq_new_index[16] = {
+		0, 1, 2, 99, 3, 4, 5, 99, 6, 7, 8, 9, 10, 11, 12, 99
+	};
+
+	static const u32 iir_coef_tbl_matrix[13][13] = {
+		{/*0*/
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*1*/
+			1, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*2*/
+			2, 0, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*3*/
+			3, IIR_INV_COEF, IIR_INV_COEF, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*4*/
+			5, 3, IIR_INV_COEF, 2, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*5*/
+			6, 4, 3, 2, 0, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*6*/
+			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, 3, IIR_INV_COEF,
+			IIR_INV_COEF, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*7*/
+			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, 5, 3,
+			IIR_INV_COEF, 1, IIR_NO_NEED, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*8*/
+			7, IIR_INV_COEF, IIR_INV_COEF, 6, 4, 3, 2, 0, IIR_NO_NEED,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*9*/
+			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF,
+			IIR_INV_COEF, IIR_INV_COEF, 5, 3, IIR_INV_COEF,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*10*/
+			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, 7, IIR_INV_COEF,
+			IIR_INV_COEF, 6, 4, 3, 0,
+			IIR_NO_NEED, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{ /*11*/
+			IIR_RATIOVER, IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF,
+			IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF, IIR_INV_COEF,
+			IIR_INV_COEF, 3, IIR_INV_COEF, IIR_NO_NEED, IIR_NO_NEED
+		},
+		{/*12*/
+			IIR_RATIOVER, IIR_RATIOVER, IIR_INV_COEF, IIR_INV_COEF,
+			IIR_INV_COEF, IIR_INV_COEF, 7, IIR_INV_COEF,
+			IIR_INV_COEF, 4, 3, 0, IIR_NO_NEED
+		},
+	};
+
+	const u32 *coef = NULL;
+	unsigned int cnt = 0;
+	u32 i = freq_new_index[input_fs];
+	u32 j = freq_new_index[output_fs];
+
+	if (i < 13 && j < 13) {
+		u32 k = iir_coef_tbl_matrix[i][j];
+
+		if (k >= IIR_NO_NEED) {
+		} else if (k == IIR_RATIOVER) {
+		} else if (k == IIR_INV_COEF) {
+		} else {
+			coef = iir_coef_tbl_list[k].coef;
+			cnt = iir_coef_tbl_list[k].cnt;
+		}
+	}
+	*count = cnt;
+	return coef;
+}
+
+static int mt8365_dai_set_config(struct mtk_base_afe *afe,
+				 struct mtk_afe_i2s_priv *i2s_data,
+				 bool is_input, unsigned int rate,
+				 int bit_width)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be =
+	&afe_priv->be_data[i2s_data->id - MT8365_AFE_BACKEND_BASE];
+	unsigned int val, reg_off;
+	int fs = mt8365_afe_fs_timing(rate);
+
+	if (fs < 0)
+		return -EINVAL;
+
+	val = AFE_I2S_CON_LOW_JITTER_CLK | AFE_I2S_CON_FORMAT_I2S;
+	val |= FIELD_PREP(AFE_I2S_CON_RATE_MASK, fs);
+
+	if (is_input) {
+		reg_off = i2s_data->reg_off_in;
+		if (i2s_data->adda_link)
+			val |= i2s_data->config_val_in;
+	} else {
+		reg_off = i2s_data->reg_off_out;
+		val |= i2s_data->config_val_in;
+	}
+
+	/* 1:bck=32lrck(16bit) or bck=64lrck(32bit) 0:fix bck=64lrck */
+	if (i2s_data->dynamic_bck) {
+		if (bit_width > 16)
+			val |= AFE_I2S_CON_WLEN_32BIT;
+		else
+			val &= ~(u32)AFE_I2S_CON_WLEN_32BIT;
+	} else {
+		val |= AFE_I2S_CON_WLEN_32BIT;
+	}
+
+	if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
+	    SND_SOC_DAIFMT_CBM_CFM) {
+		val |= AFE_I2S_CON_SRC_SLAVE;
+		val &= ~(u32)AFE_I2S_CON_FROM_IO_MUX;//from consys
+	}
+
+	regmap_update_bits(afe->regmap, reg_off, ~(u32)AFE_I2S_CON_EN, val);
+
+	if (i2s_data->adda_link && is_input)
+		regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, 0x1, 0x1);
+
+	return 0;
+}
+
+int mt8365_afe_set_i2s_out(struct mtk_base_afe *afe,
+			   unsigned int rate, int bit_width)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_data =
+		afe_priv->dai_priv[MT8365_AFE_IO_I2S];
+
+	return mt8365_dai_set_config(afe, i2s_data, false, rate, bit_width);
+}
+
+static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
+				       unsigned int rate_in,
+				       unsigned int rate_out,
+				       unsigned int width,
+				       unsigned int mono,
+				       int o16bit, int tracking)
+{
+	int ifs, ofs = 0;
+	unsigned int val = 0;
+	unsigned int mask = 0;
+	const u32 *coef;
+	u32 iir_stage;
+	unsigned int coef_count = 0;
+
+	ifs = mt8365_afe_fs_timing(rate_in);
+
+	if (ifs < 0)
+		return -EINVAL;
+
+	ofs = mt8365_afe_fs_timing(rate_out);
+
+	if (ofs < 0)
+		return -EINVAL;
+
+	val = FIELD_PREP(O16BIT, o16bit) | FIELD_PREP(IS_MONO, mono);
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
+			   O16BIT | IS_MONO, val);
+
+	coef = get_iir_coef(ifs, ofs, &coef_count);
+	iir_stage = ((u32)coef_count / 6) - 1;
+
+	if (coef) {
+		unsigned int i;
+
+		/* CPU control IIR coeff SRAM */
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
+				   COEFF_SRAM_CTRL, COEFF_SRAM_CTRL);
+
+		/* set to 0, IIR coeff SRAM addr */
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON13,
+				   0xffffffff, 0x0);
+
+		for (i = 0; i < coef_count; ++i)
+			regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON12,
+					   0xffffffff, coef[i]);
+
+		/* disable IIR coeff SRAM access */
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
+				   COEFF_SRAM_CTRL,
+				   (unsigned long)~COEFF_SRAM_CTRL);
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
+				   CLR_IIR_HISTORY | IIR_EN | IIR_STAGE_MASK,
+				   CLR_IIR_HISTORY | IIR_EN |
+				   FIELD_PREP(IIR_STAGE_MASK, iir_stage));
+	} else {
+		/* disable IIR */
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
+				   IIR_EN, (unsigned long)~IIR_EN);
+	}
+
+	/* CON3 setting (RX OFS) */
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON3,
+			   0x00FFFFFF, rx_frequency_palette(ofs));
+	/* CON4 setting (RX IFS) */
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON4,
+			   0x00FFFFFF, rx_frequency_palette(ifs));
+
+	/* CON5 setting */
+	if (tracking) {
+		val = CALI_64_CYCLE |
+		      CALI_AUTORST |
+		      AUTO_TUNE_FREQ5 |
+		      COMP_FREQ_RES |
+		      CALI_BP_DGL |
+		      CALI_AUTO_RESTART |
+		      CALI_USE_FREQ_OUT |
+		      CALI_SEL_01;
+
+		mask = CALI_CYCLE_MASK |
+		       CALI_AUTORST |
+		       AUTO_TUNE_FREQ5 |
+		       COMP_FREQ_RES |
+		       CALI_SEL_MASK |
+		       CALI_BP_DGL |
+		       AUTO_TUNE_FREQ4 |
+		       CALI_AUTO_RESTART |
+		       CALI_USE_FREQ_OUT |
+		       CALI_ON;
+
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON5,
+				   mask, val);
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON5,
+				   CALI_ON, CALI_ON);
+	} else {
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON5,
+				   0xffffffff, 0x0);
+	}
+	/* CON6 setting fix 8125 */
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON6,
+			   0x0000ffff, 0x1FBD);
+	/* CON9 setting (RX IFS) */
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON9,
+			   0x000fffff, AutoRstThHi(ifs));
+	/* CON10 setting (RX IFS) */
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON10,
+			   0x000fffff, AutoRstThLo(ifs));
+	regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
+			   CHSET_STR_CLR, CHSET_STR_CLR);
+
+	return 0;
+}
+
+static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
+					      bool enable)
+{
+	if (enable)
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
+				   ASM_ON, ASM_ON);
+	else
+		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
+				   ASM_ON, (unsigned long)~ASM_ON);
+	return 0;
+}
+
+void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
+{
+	int i;
+	unsigned long flags;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_data;
+
+	for (i = 0; i < DAI_I2S_NUM; i++) {
+		if (mt8365_i2s_priv[i].adda_link)
+			i2s_data = afe_priv->dai_priv[mt8365_i2s_priv[i].id];
+	}
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	if (enable) {
+		i2s_data->i2s_out_on_ref_cnt++;
+		if (i2s_data->i2s_out_on_ref_cnt == 1)
+			regmap_update_bits(afe->regmap, AFE_I2S_CON1,
+					   0x1, enable);
+	} else {
+		i2s_data->i2s_out_on_ref_cnt--;
+		if (i2s_data->i2s_out_on_ref_cnt == 0)
+			regmap_update_bits(afe->regmap, AFE_I2S_CON1,
+					   0x1, enable);
+		else if (i2s_data->i2s_out_on_ref_cnt < 0)
+			i2s_data->i2s_out_on_ref_cnt = 0;
+	}
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+}
+
+static void mt8365_dai_set_enable(struct mtk_base_afe *afe,
+				  struct mtk_afe_i2s_priv *i2s_data,
+				  bool is_input, bool enable)
+{
+	unsigned int reg_off;
+
+	if (is_input) {
+		reg_off = i2s_data->reg_off_in;
+	} else {
+		if (i2s_data->adda_link) {
+			mt8365_afe_set_i2s_out_enable(afe, enable);
+			return;
+		}
+		reg_off = i2s_data->reg_off_out;
+	}
+	regmap_update_bits(afe->regmap, reg_off,
+			   0x1, enable);
+}
+
+static int mt8365_dai_i2s_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_data = afe_priv->dai_priv[dai->id];
+	struct mt8365_be_dai_data *be = &afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	bool i2s_in_slave =
+		(substream->stream == SNDRV_PCM_STREAM_CAPTURE) &&
+		((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
+		SND_SOC_DAIFMT_CBM_CFM);
+
+	mt8365_afe_enable_main_clk(afe);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		clk_prepare_enable(afe_priv->clocks[i2s_data->clk_id_out]);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE && !i2s_in_slave)
+		clk_prepare_enable(afe_priv->clocks[i2s_data->clk_id_in]);
+
+	if (i2s_in_slave)
+		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_I2S_IN);
+
+	return 0;
+}
+
+static void mt8365_dai_i2s_shutdown(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_data = afe_priv->dai_priv[dai->id];
+	struct mt8365_be_dai_data *be = &afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	bool reset_i2s_out_change = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool reset_i2s_in_change = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	bool i2s_in_slave =
+		(substream->stream == SNDRV_PCM_STREAM_CAPTURE) &&
+		((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
+		SND_SOC_DAIFMT_CBM_CFM);
+
+	if (be->prepared[substream->stream]) {
+		if (reset_i2s_out_change)
+			mt8365_dai_set_enable(afe, i2s_data, false, false);
+
+		if (reset_i2s_in_change)
+			mt8365_dai_set_enable(afe, i2s_data, true, false);
+
+		if (substream->runtime->rate % 8000)
+			mt8365_afe_disable_apll_associated_cfg(afe, MT8365_AFE_APLL1);
+		else
+			mt8365_afe_disable_apll_associated_cfg(afe, MT8365_AFE_APLL2);
+
+		if (reset_i2s_out_change)
+			be->prepared[SNDRV_PCM_STREAM_PLAYBACK] = false;
+
+		if (reset_i2s_in_change)
+			be->prepared[SNDRV_PCM_STREAM_CAPTURE] = false;
+	}
+
+	if (reset_i2s_out_change)
+		mt8365_afe_disable_clk(afe,
+				       afe_priv->clocks[i2s_data->clk_id_out]);
+
+	if (reset_i2s_in_change && !i2s_in_slave)
+		mt8365_afe_disable_clk(afe,
+				       afe_priv->clocks[i2s_data->clk_id_in]);
+
+	if (i2s_in_slave)
+		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_I2S_IN);
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_i2s_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_data = afe_priv->dai_priv[dai->id];
+	struct mt8365_be_dai_data *be = &afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+	bool apply_i2s_out_change = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool apply_i2s_in_change = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	unsigned int rate = substream->runtime->rate;
+	int bit_width = snd_pcm_format_width(substream->runtime->format);
+	int ret;
+
+	if (be->prepared[substream->stream]) {
+		dev_info(afe->dev, "%s '%s' prepared already\n",
+			 __func__, snd_pcm_stream_str(substream));
+		return 0;
+	}
+
+	if (apply_i2s_out_change) {
+		ret = mt8365_dai_set_config(afe, i2s_data, false, rate, bit_width);
+		if (ret)
+			return ret;
+	}
+
+	if (apply_i2s_in_change) {
+		if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK)
+		    == SND_SOC_DAIFMT_CBM_CFM) {
+			ret = mt8365_afe_set_2nd_i2s_asrc(afe, 32000, rate,
+							  (unsigned int)bit_width,
+							  0, 0, 1);
+			if (ret < 0)
+				return ret;
+		}
+		ret = mt8365_dai_set_config(afe, i2s_data, true, rate, bit_width);
+		if (ret)
+			return ret;
+	}
+
+	if (rate % 8000)
+		mt8365_afe_enable_apll_associated_cfg(afe, MT8365_AFE_APLL1);
+	else
+		mt8365_afe_enable_apll_associated_cfg(afe, MT8365_AFE_APLL2);
+
+	if (apply_i2s_out_change) {
+		mt8365_afe_set_clk_parent(afe,
+					  afe_priv->clocks[i2s_data->clk_id_out_m_sel],
+					  ((rate % 8000) ?
+					  afe_priv->clocks[MT8365_CLK_AUD1] :
+					  afe_priv->clocks[MT8365_CLK_AUD2]));
+
+		mt8365_afe_set_clk_rate(afe,
+					afe_priv->clocks[i2s_data->clk_id_out],
+					rate * i2s_data->clk_out_mult);
+
+		mt8365_dai_set_enable(afe, i2s_data, false, true);
+		be->prepared[SNDRV_PCM_STREAM_PLAYBACK] = true;
+	}
+
+	if (apply_i2s_in_change) {
+		mt8365_afe_set_clk_parent(afe,
+					  afe_priv->clocks[i2s_data->clk_id_in_m_sel],
+					  ((rate % 8000) ?
+					  afe_priv->clocks[MT8365_CLK_AUD1] :
+					  afe_priv->clocks[MT8365_CLK_AUD2]));
+
+		mt8365_afe_set_clk_rate(afe,
+					afe_priv->clocks[i2s_data->clk_id_in],
+					rate * i2s_data->clk_in_mult);
+
+		mt8365_dai_set_enable(afe, i2s_data, true, true);
+
+		if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK)
+		    == SND_SOC_DAIFMT_CBM_CFM)
+			mt8365_afe_set_2nd_i2s_asrc_enable(afe, true);
+
+		be->prepared[SNDRV_PCM_STREAM_CAPTURE] = true;
+	}
+	return 0;
+}
+
+static int mt8365_afe_2nd_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params,
+					struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int width_val = params_width(params) > 16 ?
+		(AFE_CONN_24BIT_O00 | AFE_CONN_24BIT_O01) : 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		regmap_update_bits(afe->regmap, AFE_CONN_24BIT,
+				   AFE_CONN_24BIT_O00 | AFE_CONN_24BIT_O01, width_val);
+
+	return 0;
+}
+
+static int mt8365_afe_2nd_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_be_dai_data *be = &afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
+
+	be->fmt_mode = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		be->fmt_mode |= SND_SOC_DAIFMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		be->fmt_mode |= SND_SOC_DAIFMT_LEFT_J;
+		break;
+	default:
+		dev_err(afe->dev, "invalid audio format for 2nd i2s!\n");
+		return -EINVAL;
+	}
+
+	if (((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_NB_NF) &&
+	    ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_NB_IF) &&
+	    ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_IB_NF) &&
+	    ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_IB_IF)) {
+		dev_err(afe->dev, "invalid audio format for 2nd i2s!\n");
+		return -EINVAL;
+	}
+
+	be->fmt_mode |= (fmt & SND_SOC_DAIFMT_INV_MASK);
+
+	if (((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBM_CFM))
+		be->fmt_mode |= (fmt & SND_SOC_DAIFMT_MASTER_MASK);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_afe_i2s_ops = {
+	.startup	= mt8365_dai_i2s_startup,
+	.shutdown	= mt8365_dai_i2s_shutdown,
+	.prepare	= mt8365_dai_i2s_prepare,
+};
+
+static const struct snd_soc_dai_ops mt8365_afe_2nd_i2s_ops = {
+	.startup	= mt8365_dai_i2s_startup,
+	.shutdown	= mt8365_dai_i2s_shutdown,
+	.hw_params	= mt8365_afe_2nd_i2s_hw_params,
+	.prepare	= mt8365_dai_i2s_prepare,
+	.set_fmt	= mt8365_afe_2nd_i2s_set_fmt,
+};
+
+static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
+	{
+		.name = "I2S",
+		.id = MT8365_AFE_IO_I2S,
+		.playback = {
+			.stream_name = "I2S Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "I2S Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_i2s_ops,
+	}, {
+		.name = "2ND I2S",
+		.id = MT8365_AFE_IO_2ND_I2S,
+		.playback = {
+			.stream_name = "2ND I2S Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "2ND I2S Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_2nd_i2s_ops,
+	}
+};
+
+/* low jitter control */
+static const char * const mt8365_i2s_hd_str[] = {
+	"Normal", "Low_Jitter"
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(mt8365_i2s_enum, mt8365_i2s_hd_str);
+
+static const char * const fmi2sin_text[] = {
+	"OPEN", "FM_2ND_I2S_IN"
+};
+
+static SOC_ENUM_SINGLE_VIRT_DECL(fmi2sin_enum, fmi2sin_text);
+
+static const struct snd_kcontrol_new fmi2sin_mux =
+	SOC_DAPM_ENUM("FM 2ND I2S Source", fmi2sin_enum);
+
+static const struct snd_kcontrol_new i2s_o03_o04_enable_ctl =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+
+static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
+	SND_SOC_DAPM_SWITCH("I2S O03_O04", SND_SOC_NOPM, 0, 0,
+			    &i2s_o03_o04_enable_ctl),
+	SND_SOC_DAPM_MUX("FM 2ND I2S Mux", SND_SOC_NOPM, 0, 0, &fmi2sin_mux),
+	SND_SOC_DAPM_INPUT("2ND I2S In"),
+};
+
+static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
+	{"I2S O03_O04", "Switch", "O03"},
+	{"I2S O03_O04", "Switch", "O04"},
+	{"I2S Playback", NULL, "I2S O03_O04"},
+	{"2ND I2S Playback", NULL, "O00"},
+	{"2ND I2S Playback", NULL, "O01"},
+	{"2ND I2S Capture", NULL, "2ND I2S In"},
+	{"FM 2ND I2S Mux", "FM_2ND_I2S_IN", "2ND I2S Capture"},
+};
+
+static int mt8365_dai_i2s_set_priv(struct mtk_base_afe *afe)
+{
+	int i, ret;
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+
+	for (i = 0; i < DAI_I2S_NUM; i++) {
+		ret = mt8365_dai_set_priv(afe, mt8365_i2s_priv[i].id,
+					  sizeof(*afe_priv),
+					  &mt8365_i2s_priv[i]);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+int mt8365_dai_i2s_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_i2s_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_i2s_driver);
+	dai->dapm_widgets = mtk_dai_i2s_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_i2s_widgets);
+	dai->dapm_routes = mtk_dai_i2s_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_i2s_routes);
+
+	/* set all dai i2s private data */
+	return mt8365_dai_i2s_set_priv(afe);
+}

-- 
2.25.1

