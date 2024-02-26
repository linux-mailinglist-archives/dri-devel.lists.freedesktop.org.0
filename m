Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C353867783
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187D010F1EF;
	Mon, 26 Feb 2024 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wD3XWUSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D29A10F1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-412a9457b2eso1812255e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956145; x=1709560945;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SySgkOA9ajctfeHUQUrSz/Q4p2erm6cXVxuAkOBlkZA=;
 b=wD3XWUSLvX0917FAxO1IWgrmyE73CZ1USzzFZTWhZEQltgvL1vrORvaiTbt618Y0bl
 FuqOtgXYb6XTHG0IcEXN40B4BSvbMQ56glDNwK1+cvxvLkfGBFieZX1Y6Kydo3i98XeY
 1+ab2fMuUJ/E7lKT7lCr1/qxoPww32jT4P78yxnQi3WMwAnMRaaz0gSSbUb7g0YQaeEB
 JGhk4B9OUnV8EcSvVRWbGZayuyRjGkrswILemjPtky9Pf2KNDXuUXYSRkcCCRloARa0k
 Q28CamAER+kwP85f1cOlXIZRnKM0k1QvOPVXgCApT9WsZ6gT6e480J4HFpvwT34opGMS
 BrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956145; x=1709560945;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SySgkOA9ajctfeHUQUrSz/Q4p2erm6cXVxuAkOBlkZA=;
 b=EJKX0I1OuJ791NR8jqLCy6Faeu2VpYj0XooILLV31WleM7vg9li5CgV6KFvuWomMu+
 D2Hh9wQpiRiW0kgDZKIYkKMtF6wE/0dEfugxIW0bs7kjjRYAuTbb5qJCDaE5pHSaEzY9
 G0+SqzpatUhwNvJdVKBd9EQiyeTEFGd6TKpCayStP2IubnOYoN2Dqz2d2giHAKVPTYhg
 kinZBpvPdotmeGvQw1EEGPUWyNfpLJMue+PfVhTQb9dp0+QPhNjzk6m6++tk6lxkSQQb
 Vq0/F/WLjYRBtiZIQ0MKfDuoe3TZgWEsld1xrzzlmMGzNEPrXqtGEIUNGTGCJSd997N9
 ddSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQSpOH9eoVmQeTYVVGUinbTkhjgaO/HwhiZ88p8GW0ZKkTeIDVbPq4fQrXmkeLaAk++Lcecv+AZAz37Dg0omibTgRn1HAsZ3roOBbGZzMM
X-Gm-Message-State: AOJu0YxXiaVblMNnconH852FmCtXJIkfLHS3wKHJrJZstD7wMqpFvCUI
 LLKjtJlZjKoBR7XM5Lt05bw+yLKpbfOPfze9HQaI/jYyvE0y6YiA4FsG/pG20bw=
X-Google-Smtp-Source: AGHT+IFpPbUmGpG6D2Hoin2ceyPisB2LdcV6AvfN2i4Rn5hUTug6ar6jNqO3ftEZKEadq+9sS5ybAA==
X-Received: by 2002:a05:600c:1d07:b0:412:9739:717a with SMTP id
 l7-20020a05600c1d0700b004129739717amr6883151wms.12.1708956144187; 
 Mon, 26 Feb 2024 06:02:24 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:23 -0800 (PST)
From: amergnat@baylibre.com
Date: Mon, 26 Feb 2024 15:01:50 +0100
Subject: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=94206;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=UkKAqImy7tHDkXXNV2Qr5xxBGnGpGfQViX689G2/yY0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncOx/TIszpmie7oVNYutb1QtG1fA2P8qdaJAIA
 AzMwCtyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURfQDD/
 9g9pNvLycrIqroN3B8ENWdPTLrxPvyZRjK5w/ys85XDDFKkyPPqyFkW0i3HedOtxxIjvqulOG0+n4b
 lh2WnG5a9zGLtz91CvXhXEU/0GnKtvvANd7BLnp3b6D5BitbkFJ8pepWTv12CY0nr7XdiIiPC2CV7w
 43WqojAg2nuVt9YyXMkJHHpJj9ptQKauEuwpO5+7R7/tfSOwNhJXIECzR7QfMPyZozzg0j/do41Hur
 dokivp6Qu1PKzpRi0b6PIncr5Vth64LVoPXWYGUtQCsQ2tjVnzt/cWRi3CQIC3m0wMG6FOyzoNnMF1
 ioQP5Ry6Z4Du4EhAp+fwuChj+SdeemeS1PY9rwWtRMH53Or4va3yb2xliHg1G5E17N3Wqc/j5uwXJY
 uXRdwTkyKxiItBE+LtlyrJhSqINXbZj2yYL63qQJ/KOK99OJVuoN3uz9z+ebyr4h44nE0PdtyUX7Xb
 bwKa+yuUmuxJiH4UlYJ7OaeurnHA2kQm7+J119WAybW5Lr1ETwDIHMgkfalWGsZlTM0gSal2WRL3jn
 MTnGBDAb0mDR2f9c3fY5JAYh4ccwyJm7/C3kYITs+n0ksIUvl2E2EOkYT1NG5kz7FVDFJHa5BINGgg
 8mB6pQQG2I9Cnj1099IWGIfsc9Cz5yC3mJ0V/iayH3M/AB1Ewy2QvilHHExw==
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

From: Nicolas Belin <nbelin@baylibre.com>

Add the support of MT6357 PMIC audio codec.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/codecs/Kconfig  |    7 +
 sound/soc/codecs/Makefile |    2 +
 sound/soc/codecs/mt6357.c | 1805 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6357.h |  674 +++++++++++++++++
 4 files changed, 2488 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 59f9742e9ff4..9cf2b9b70472 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -153,6 +153,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MC13783
 	imply SND_SOC_ML26124
 	imply SND_SOC_MT6351
+	imply SND_SOC_MT6357
 	imply SND_SOC_MT6358
 	imply SND_SOC_MT6359
 	imply SND_SOC_MT6660
@@ -2361,6 +2362,12 @@ config SND_SOC_ML26124
 config SND_SOC_MT6351
 	tristate "MediaTek MT6351 Codec"
 
+config SND_SOC_MT6357
+	tristate "MediaTek MT6357 Codec"
+	help
+	  Enable support for the platform which uses MT6357 as
+	  external codec device.
+
 config SND_SOC_MT6358
 	tristate "MediaTek MT6358 Codec"
 	help
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index f53baa2b9565..33e27612867e 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -169,6 +169,7 @@ snd-soc-ml26124-objs := ml26124.o
 snd-soc-msm8916-analog-objs := msm8916-wcd-analog.o
 snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
 snd-soc-mt6351-objs := mt6351.o
+snd-soc-mt6357-objs := mt6357.o
 snd-soc-mt6358-objs := mt6358.o
 snd-soc-mt6359-objs := mt6359.o
 snd-soc-mt6359-accdet-objs := mt6359-accdet.o
@@ -554,6 +555,7 @@ obj-$(CONFIG_SND_SOC_ML26124)	+= snd-soc-ml26124.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_ANALOG) +=snd-soc-msm8916-analog.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
+obj-$(CONFIG_SND_SOC_MT6357)	+= snd-soc-mt6357.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
 obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
new file mode 100644
index 000000000000..13e95c227114
--- /dev/null
+++ b/sound/soc/codecs/mt6357.c
@@ -0,0 +1,1805 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MT6357 ALSA SoC audio codec driver
+ *
+ * Copyright (c) 2024 Baylibre
+ * Author: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/regulator/consumer.h>
+
+#include "mt6357.h"
+
+static void set_playback_gpio(struct mt6357_priv *priv, bool enable)
+{
+	if (enable) {
+		/* set gpio mosi mode */
+		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
+		regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, GPIO8_MODE_SET_AUD_CLK_MOSI |
+								  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
+								  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
+								  GPIO11_MODE_SET_AUD_SYNC_MOSI);
+		regmap_write(priv->regmap, MT6357_GPIO_MODE2, GPIO8_MODE_AUD_CLK_MOSI |
+							      GPIO9_MODE_AUD_DAT_MOSI0 |
+							      GPIO10_MODE_AUD_DAT_MOSI1 |
+							      GPIO11_MODE_AUD_SYNC_MOSI);
+	} else {
+		/* set pad_aud_*_mosi to GPIO mode and dir input
+		 * reason:
+		 * pad_aud_dat_mosi*, because the pin is used as boot strap
+		 */
+		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
+		regmap_write(priv->regmap, MT6357_GPIO_MODE2, GPIO8_MODE_GPIO |
+							      GPIO9_MODE_GPIO |
+							      GPIO10_MODE_GPIO |
+							      GPIO11_MODE_GPIO);
+		regmap_update_bits(priv->regmap, MT6357_GPIO_DIR0, GPIO8_DIR_MASK |
+								   GPIO9_DIR_MASK |
+								   GPIO10_DIR_MASK |
+								   GPIO11_DIR_MASK,
+								   GPIO8_DIR_INPUT |
+								   GPIO9_DIR_INPUT |
+								   GPIO10_DIR_INPUT |
+								   GPIO11_DIR_INPUT);
+	}
+}
+
+static void set_capture_gpio(struct mt6357_priv *priv, bool enable)
+{
+	if (enable) {
+		/* set gpio miso mode */
+		regmap_write(priv->regmap, MT6357_GPIO_MODE3_CLR, GPIO_MODE3_CLEAR_ALL);
+		regmap_write(priv->regmap, MT6357_GPIO_MODE3_SET, GPIO12_MODE_SET_AUD_CLK_MISO |
+								  GPIO13_MODE_SET_AUD_DAT_MISO0 |
+								  GPIO14_MODE_SET_AUD_DAT_MISO1 |
+								  GPIO15_MODE_SET_AUD_SYNC_MISO);
+		regmap_write(priv->regmap, MT6357_GPIO_MODE3, GPIO12_MODE_AUD_CLK_MISO |
+							      GPIO13_MODE_AUD_DAT_MISO0 |
+							      GPIO14_MODE_AUD_DAT_MISO1 |
+							      GPIO15_MODE_AUD_SYNC_MISO);
+	} else {
+		/* set pad_aud_*_miso to GPIO mode and dir input
+		 * reason:
+		 * pad_aud_clk_miso, because when playback only the miso_clk
+		 * will also have 26m, so will have power leak
+		 * pad_aud_dat_miso*, because the pin is used as boot strap
+		 */
+		regmap_write(priv->regmap, MT6357_GPIO_MODE3_CLR, GPIO_MODE3_CLEAR_ALL);
+		regmap_write(priv->regmap, MT6357_GPIO_MODE3, GPIO12_MODE_GPIO |
+							      GPIO13_MODE_GPIO |
+							      GPIO14_MODE_GPIO |
+							      GPIO15_MODE_GPIO);
+		regmap_update_bits(priv->regmap, MT6357_GPIO_DIR0, GPIO12_DIR_MASK |
+								   GPIO13_DIR_MASK |
+								   GPIO14_DIR_MASK |
+								   GPIO15_DIR_MASK,
+								   GPIO12_DIR_INPUT |
+								   GPIO13_DIR_INPUT |
+								   GPIO14_DIR_INPUT |
+								   GPIO15_DIR_INPUT);
+	}
+}
+
+static void hp_main_output_ramp(struct mt6357_priv *priv, bool up)
+{
+	int i = 0, stage = 0;
+	int target = 7;
+	/* Enable/Reduce HPL/R main output stage step by step */
+	for (i = 0; i <= target; i++) {
+		stage = up ? i : target - i;
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPLOUT_STG_CTRL_VAUDP15_MASK,
+				   stage << HPLOUT_STG_CTRL_VAUDP15_SFT);
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_STG_CTRL_VAUDP15_MASK,
+				   stage << HPROUT_STG_CTRL_VAUDP15_SFT);
+		usleep_range(600, 700);
+	}
+}
+
+static void hp_aux_feedback_loop_gain_ramp(struct mt6357_priv *priv, bool up)
+{
+	int i = 0, stage = 0;
+	/* Reduce HP aux feedback loop gain step by step */
+	for (i = 0; i <= 0xf; i++) {
+		stage = up ? i : 0xf - i;
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HP_AUX_LOOP_GAIN_MASK, stage << HP_AUX_LOOP_GAIN_SFT);
+		usleep_range(600, 700);
+	}
+}
+
+static void hp_pull_down(struct mt6357_priv *priv, bool enable)
+{
+	if (enable)
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON2,
+				   HPP_SHORT_2VCM_VAUDP15_MASK, HPP_SHORT_2VCM_VAUDP15_ENABLE);
+	else
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON2,
+				   HPP_SHORT_2VCM_VAUDP15_MASK, HPP_SHORT_2VCM_VAUDP15_DISABLE);
+}
+
+static bool is_valid_hp_pga_idx(int reg_idx)
+{
+	return (reg_idx >= DL_GAIN_8DB && reg_idx <= DL_GAIN_N_12DB) || reg_idx == DL_GAIN_N_40DB;
+}
+
+static void volume_ramp(struct mt6357_priv *priv, int lfrom, int lto,
+			int rfrom, int rto, unsigned int reg_addr)
+{
+	int lcount, rcount, sleep = 0;
+
+	if (!is_valid_hp_pga_idx(lfrom) || !is_valid_hp_pga_idx(lto))
+		pr_debug("%s(), invalid left volume index, from %d, to %d\n",
+			 __func__, lfrom, lto);
+
+	if (!is_valid_hp_pga_idx(rfrom) || !is_valid_hp_pga_idx(rto))
+		pr_debug("%s(), invalid right volume index, from %d, to %d\n",
+			 __func__, rfrom, rto);
+
+	if (lto > lfrom)
+		lcount = 1;
+	else
+		lcount = -1;
+
+	if (rto > rfrom)
+		rcount = 1;
+	else
+		rcount = -1;
+
+	while ((lto != lfrom) || (rto != rfrom)) {
+		if (lto != lfrom) {
+			lfrom += lcount;
+			if (is_valid_hp_pga_idx(lfrom)) {
+				regmap_update_bits(priv->regmap, reg_addr, DL_GAIN_REG_LEFT_MASK,
+						   lfrom << DL_GAIN_REG_LEFT_SHIFT);
+				sleep = 1;
+			}
+		}
+		if (rto != rfrom) {
+			rfrom += rcount;
+			if (is_valid_hp_pga_idx(rfrom)) {
+				regmap_update_bits(priv->regmap, reg_addr, DL_GAIN_REG_RIGHT_MASK,
+						   rfrom << DL_GAIN_REG_RIGHT_SHIFT);
+				sleep = 1;
+			}
+		}
+		if (sleep)
+			usleep_range(200, 300);
+	}
+}
+
+static void lo_volume_ramp(struct mt6357_priv *priv, int lfrom, int lto, int rfrom, int rto)
+{
+	volume_ramp(priv, lfrom, lto, rfrom, rto, MT6357_ZCD_CON1);
+}
+
+static void hp_volume_ramp(struct mt6357_priv *priv, int lfrom, int lto, int rfrom, int rto)
+{
+	volume_ramp(priv, lfrom, lto, rfrom, rto, MT6357_ZCD_CON2);
+}
+
+static void hs_volume_ramp(struct mt6357_priv *priv, int from, int to)
+{
+	volume_ramp(priv, from, to, 0, 0, MT6357_ZCD_CON3);
+}
+
+static int mt6357_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int reg;
+	int ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	if (ret < 0)
+		return ret;
+
+	switch (mc->reg) {
+	case MT6357_ZCD_CON2:
+		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
+		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
+			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
+		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
+			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
+		break;
+	case MT6357_ZCD_CON1:
+		regmap_read(priv->regmap, MT6357_ZCD_CON1, &reg);
+		priv->ana_gain[ANALOG_VOLUME_LINEOUTL] =
+			(reg & AUD_LOL_GAIN_MASK) >> AUD_LOL_GAIN_SFT;
+		priv->ana_gain[ANALOG_VOLUME_LINEOUTR] =
+			(reg & AUD_LOR_GAIN_MASK) >> AUD_LOR_GAIN_SFT;
+		break;
+	case MT6357_ZCD_CON3:
+		regmap_read(priv->regmap, MT6357_ZCD_CON3, &reg);
+		priv->ana_gain[ANALOG_VOLUME_HSOUT] =
+			(reg & AUD_HS_GAIN_MASK) >> AUD_HS_GAIN_SFT;
+		break;
+	case MT6357_AUDENC_ANA_CON0:
+	case MT6357_AUDENC_ANA_CON1:
+		regmap_read(priv->regmap, MT6357_AUDENC_ANA_CON0, &reg);
+		priv->ana_gain[ANALOG_VOLUME_MIC1] =
+			(reg & AUDPREAMPLGAIN_MASK) >> AUDPREAMPLGAIN_SFT;
+		regmap_read(priv->regmap, MT6357_AUDENC_ANA_CON1, &reg);
+		priv->ana_gain[ANALOG_VOLUME_MIC2] =
+			(reg & AUDPREAMPRGAIN_MASK) >> AUDPREAMPRGAIN_SFT;
+		break;
+	}
+
+	return ret;
+}
+
+/* Volume and channel swap controls */
+static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
+static const DECLARE_TLV_DB_SCALE(capture_tlv, 0, 600, 0);
+static const DECLARE_TLV_DB_SCALE(hp_degain_tlv, -1200, 1200, 0);
+
+static const struct snd_kcontrol_new mt6357_controls[] = {
+	/* dl pga gain */
+	SOC_DOUBLE_EXT_TLV("Headphone Volume",
+			   MT6357_ZCD_CON2, AUD_HPL_GAIN_SFT, AUD_HPR_GAIN_SFT, AUD_HP_GAIN_MAX, 1,
+			   snd_soc_get_volsw, mt6357_put_volsw, playback_tlv),
+	SOC_SINGLE_EXT_TLV("Headphone Vin Volume",
+			   MT6357_AUDDEC_ANA_CON7, HP_IVBUF_DEGAIN_SFT, HP_IVBUF_DEGAIN_MAX, 1,
+			   snd_soc_get_volsw, mt6357_put_volsw, hp_degain_tlv),
+	SOC_DOUBLE_EXT_TLV("Lineout Volume",
+			   MT6357_ZCD_CON1, AUD_LOL_GAIN_SFT, AUD_LOR_GAIN_SFT, AUD_LO_GAIN_MAX, 1,
+			   snd_soc_get_volsw, mt6357_put_volsw, playback_tlv),
+	SOC_SINGLE_EXT_TLV("Handset Volume",
+			   MT6357_ZCD_CON3, AUD_HS_GAIN_SFT, AUD_HS_GAIN_MAX, 1,
+			   snd_soc_get_volsw, mt6357_put_volsw, playback_tlv),
+	/* ul pga gain */
+	SOC_DOUBLE_R_EXT_TLV("Mic Volume",
+			     MT6357_AUDENC_ANA_CON0, MT6357_AUDENC_ANA_CON1,
+			     AUDPREAMPLGAIN_SFT, AUDPREAMPLGAIN_MAX, 0,
+			     snd_soc_get_volsw, mt6357_put_volsw, capture_tlv),
+	/* ul channel swap */
+	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
+};
+
+/* Uplink controls */
+#define IS_DCC_BASE(type) ((type) == MIC_TYPE_MUX_DCC || \
+			(type) == MIC_TYPE_MUX_DCC_ECM_DIFF || \
+			(type) == MIC_TYPE_MUX_DCC_ECM_SINGLE)
+
+static const char * const mic_type_mux_map[] = {
+	"Idle",
+	"ACC",
+	"DMIC",
+	"DCC",
+	"DCC_ECM_DIFF",
+	"DCC_ECM_SINGLE",
+	"Loopback",
+	"Sine Generator",
+};
+
+enum {
+	MIC_TYPE_MUX_IDLE = 0,
+	MIC_TYPE_MUX_ACC,
+	MIC_TYPE_MUX_DMIC,
+	MIC_TYPE_MUX_DCC,
+	MIC_TYPE_MUX_DCC_ECM_DIFF,
+	MIC_TYPE_MUX_DCC_ECM_SINGLE,
+	MIC_TYPE_MUX_LPBK,
+	MIC_TYPE_MUX_SGEN,
+	MIC_TYPE_MUX_MASK = 0x7,
+};
+
+static int mic_type_mux_map_value[] = {
+	MIC_TYPE_MUX_IDLE,
+	MIC_TYPE_MUX_ACC,
+	MIC_TYPE_MUX_DMIC,
+	MIC_TYPE_MUX_DCC,
+	MIC_TYPE_MUX_DCC_ECM_DIFF,
+	MIC_TYPE_MUX_DCC_ECM_SINGLE,
+	MIC_TYPE_MUX_LPBK,
+	MIC_TYPE_MUX_SGEN,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(mic_type_mux_map_enum, SND_SOC_NOPM, 0, MIC_TYPE_MUX_MASK,
+				  mic_type_mux_map, mic_type_mux_map_value);
+
+static const struct snd_kcontrol_new mic_type_mux_control =
+	SOC_DAPM_ENUM("Mic Type Select", mic_type_mux_map_enum);
+
+enum {
+	PGA_MUX_NONE = 0,
+	PGA_MUX_AIN0,
+	PGA_MUX_AIN1,
+	PGA_MUX_AIN2,
+	PGA_MUX_MASK = 0x3,
+};
+
+static const char * const pga_mux_map[] = {
+	"None", "AIN0", "AIN1", "AIN2"
+};
+
+static int pga_mux_map_value[] = {
+	PGA_MUX_NONE,
+	PGA_MUX_AIN0,
+	PGA_MUX_AIN1,
+	PGA_MUX_AIN2,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(pga_left_mux_map_enum,
+				  MT6357_AUDENC_ANA_CON0,
+				  AUDPREAMPLINPUTSEL_SFT, AUDPREAMPLINPUTSEL_MASK_NOSFT,
+				  pga_mux_map, pga_mux_map_value);
+
+static const struct snd_kcontrol_new pga_left_mux_control =
+	SOC_DAPM_ENUM("PGA L Select", pga_left_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(pga_right_mux_map_enum,
+				  MT6357_AUDENC_ANA_CON1,
+				  AUDPREAMPRINPUTSEL_SFT, AUDPREAMPRINPUTSEL_MASK_NOSFT,
+				  pga_mux_map, pga_mux_map_value);
+
+static const struct snd_kcontrol_new pga_right_mux_control =
+	SOC_DAPM_ENUM("PGA R Select", pga_right_mux_map_enum);
+
+/* Downlink controls */
+static const char * const hslo_mux_map[] = {
+	"Open", "DACR", "Playback", "Test mode"
+};
+
+static int hslo_mux_map_value[] = {
+	0x0, 0x1, 0x2, 0x3,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(lo_mux_map_enum,
+				  MT6357_AUDDEC_ANA_CON4,
+				  AUD_LOL_MUX_INPUT_VAUDP15_SFT,
+				  AUD_LOL_MUX_INPUT_VAUDP15_MASK_NOSFT,
+				  hslo_mux_map, hslo_mux_map_value);
+
+static const struct snd_kcontrol_new lo_mux_control =
+	SOC_DAPM_ENUM("Line out source", lo_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hs_mux_map_enum, MT6357_AUDDEC_ANA_CON3,
+				  AUD_HS_MUX_INPUT_VAUDP15_SFT,
+				  AUD_HS_MUX_INPUT_VAUDP15_MASK_NOSFT,
+				  hslo_mux_map, hslo_mux_map_value);
+
+static const struct snd_kcontrol_new hs_mux_control =
+	SOC_DAPM_ENUM("Handset source", hs_mux_map_enum);
+
+static const char * const hplr_mux_map[] = {
+	"Open", "Line Out", "DAC", "Handset"
+};
+
+static int hplr_mux_map_value[] = {
+	0x0, 0x1, 0x2, 0x3,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hpr_mux_map_enum, MT6357_AUDDEC_ANA_CON0,
+				  AUD_HPR_MUX_INPUT_VAUDP15_SFT,
+				  AUD_HPR_MUX_INPUT_VAUDP15_MASK_NOSFT,
+				  hplr_mux_map, hplr_mux_map_value);
+
+static const struct snd_kcontrol_new hpr_mux_control =
+	SOC_DAPM_ENUM("Headphone Right source", hpr_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hpl_mux_map_enum, MT6357_AUDDEC_ANA_CON0,
+				  AUD_HPL_MUX_INPUT_VAUDP15_SFT,
+				  AUD_HPL_MUX_INPUT_VAUDP15_MASK_NOSFT,
+				  hplr_mux_map, hplr_mux_map_value);
+
+static const struct snd_kcontrol_new hpl_mux_control =
+	SOC_DAPM_ENUM("Headphone Left source", hpl_mux_map_enum);
+
+static const char * const dac_mux_map[] = {
+	"Normal Path", "Sine Generator"
+};
+
+static int dac_mux_map_value[] = {
+	0x0, 0x1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dac_mux_map_enum,
+				  MT6357_AFE_TOP_CON0, DL_SINE_ON_SFT, DL_SINE_ON_MASK,
+				  dac_mux_map, dac_mux_map_value);
+
+static const struct snd_kcontrol_new dac_mux_control =
+	SOC_DAPM_ENUM("DAC Select", dac_mux_map_enum);
+
+static int mt6357_set_dmic(struct mt6357_priv *priv, bool enable)
+{
+	if (enable) {
+		/* DMIC enable */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON7,
+				   AUDDIGMICBIAS_MASK | AUDDIGMICEN_MASK,
+				   AUDDIGMICBIAS_DEFAULT_VALUE | AUDDIGMICEN_ENABLE);
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_ENABLE);
+		/* UL dmic setting: dual mode */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_H,
+				   C_TWO_DIGITAL_MIC_CTL_MASK, C_TWO_DIGITAL_MIC_ENABLE);
+		/* UL turn on SDM 3 level mode */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SDM_3_LEVEL_CTL_MASK, UL_SDM_3_LEVEL_SELECT);
+		/* UL turn on */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_ENABLE);
+		/* Wait to avoid any pop noises */
+		msleep(100);
+	} else {
+		/* UL turn off */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_DISABLE);
+		/* UL turn on SDM 3 level mode */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SDM_3_LEVEL_CTL_MASK, UL_SDM_3_LEVEL_DESELECT);
+		/* disable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_DISABLE);
+		/* UL dmic setting: dual mode */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_H,
+				   C_TWO_DIGITAL_MIC_CTL_MASK, C_TWO_DIGITAL_MIC_DISABLE);
+		/* DMIC disable */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON7,
+				   AUDDIGMICBIAS_MASK | AUDDIGMICEN_MASK,
+				   AUDDIGMICBIAS_OFF | AUDDIGMICEN_DISABLE);
+	}
+	return 0;
+}
+
+static int mt6357_set_amic(struct mt6357_priv *priv, bool enable, unsigned int mic_type)
+{
+	dev_dbg(priv->dev, "%s(), mic %u\n", __func__, mic_type);
+	if (enable) {
+		if (IS_DCC_BASE(mic_type)) {
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG0,
+					   DCCLK_DIV_MASK, DCCLK_DIV_RUN_VALUE);
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG0,
+					   DCCLK_PDN_MASK, DCCLK_OUTPUT);
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG0,
+					   DCCLK_GEN_ON_MASK, DCCLK_GEN_ON);
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG1,
+					   DCCLK_RESYNC_BYPASS_MASK, DCCLK_RESYNC_BYPASS);
+
+			/* mic bias 0: set the correct DC couple*/
+			switch (mic_type) {
+			case MIC_TYPE_MUX_DCC_ECM_DIFF:
+				regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON8,
+						   AUD_MICBIAS0_DC_MASK,
+						   AUD_MICBIAS0_DC_ENABLE_ALL);
+				break;
+			case MIC_TYPE_MUX_DCC_ECM_SINGLE:
+				regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON8,
+						   AUD_MICBIAS0_DC_MASK,
+						   AUD_MICBIAS0_DC_ENABLE_P1);
+				break;
+			default:
+				regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON8,
+						   AUD_MICBIAS0_DC_MASK,
+						   AUD_MICBIAS0_DC_DISABLE_ALL);
+				break;
+			}
+
+			/* mic bias 1: set the correct DC couple */
+			if (mic_type == MIC_TYPE_MUX_DCC_ECM_SINGLE)
+				regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON9,
+						   AUD_MICBIAS1_DCSW1P_EN_MASK,
+						   AUD_MICBIAS1_DCSW1P_ENABLE);
+
+			/* Audio L/R preamplifier DCC precharge */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+					   AUDPREAMPLDCPRECHARGE_MASK,
+					   AUDPREAMPLDCPRECHARGE_ENABLE);
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+					   AUDPREAMPRDCPRECHARGE_MASK,
+					   AUDPREAMPRDCPRECHARGE_ENABLE);
+			/* L preamplifier DCCEN */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+					   AUDPREAMPLDCCEN_MASK,
+					   AUDPREAMPLDCCEN_DC);
+			/* R preamplifier DCCEN */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+					   AUDPREAMPRDCCEN_MASK,
+					   AUDPREAMPRDCCEN_DC);
+		} else {
+			/* Audio L preamplifier DCC precharge disable */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+					   AUDPREAMPLDCPRECHARGE_MASK,
+					   AUDPREAMPLDCPRECHARGE_DISABLE);
+			/* L preamplifier ACC */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+					   AUDPREAMPLDCCEN_MASK,
+					   AUDPREAMPLDCCEN_AC);
+			/* Audio R preamplifier DCC precharge disable */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+					   AUDPREAMPRDCPRECHARGE_MASK,
+					   AUDPREAMPRDCPRECHARGE_DISABLE);
+			/* R preamplifier ACC */
+			regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+					   AUDPREAMPRDCCEN_MASK,
+					   AUDPREAMPRDCCEN_AC);
+		}
+	} else {
+		/* disable any Mic Bias 0 DC couple */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON8,
+				   AUD_MICBIAS0_DC_MASK, AUD_MICBIAS0_DC_DISABLE_ALL);
+		/* disable any Mic Bias 1 DC couple */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON9,
+				   AUD_MICBIAS1_DCSW1P_EN_MASK, AUD_MICBIAS1_DCSW1P_DISABLE);
+		if (IS_DCC_BASE(mic_type)) {
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG0,
+					   DCCLK_GEN_ON_MASK, DCCLK_GEN_OFF);
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG0,
+					   DCCLK_PDN_MASK, DCCLK_PDN);
+			regmap_update_bits(priv->regmap, MT6357_AFE_DCCLK_CFG0,
+					   DCCLK_DIV_MASK, DCCLK_DIV_STOP_VALUE);
+		}
+	}
+
+	return 0;
+}
+
+static int mt6357_set_loopback(struct mt6357_priv *priv, bool enable)
+{
+	if (enable) {
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_ENABLE);
+		/* enable aud_pad lpk TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_LPBK_MASK, AUD_PAD_TX_FIFO_LPBK_ENABLE);
+		/* Set UL Part: enable new lpbk 2 */
+		regmap_update_bits(priv->regmap, MT6357_AFE_ADDA_MTKAIF_CFG0,
+				   ADDA_MTKAIF_LPBK_CTL_MASK, ADDA_MTKAIF_LPBK_ENABLE);
+		/* UL turn on */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_ENABLE);
+	} else {
+		/* UL turn off */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_DISABLE);
+		/* disable new lpbk 2 */
+		regmap_update_bits(priv->regmap, MT6357_AFE_ADDA_MTKAIF_CFG0,
+				   ADDA_MTKAIF_LPBK_CTL_MASK, ADDA_MTKAIF_LPBK_DISABLE);
+		/* disable aud_pad lpbk TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_LPBK_MASK, AUD_PAD_TX_FIFO_LPBK_DISABLE);
+		/* disable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_DISABLE);
+	}
+
+	return 0;
+}
+
+static int mt6357_set_ul_sine_gen(struct mt6357_priv *priv, bool enable)
+{
+	if (enable) {
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_ENABLE);
+		/* UL turn on */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_ENABLE);
+	} else {
+		/* UL turn off */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_DISABLE);
+		/* disable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_DISABLE);
+	}
+
+	return 0;
+}
+
+static int mt_aif_out_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		set_capture_gpio(priv, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		set_capture_gpio(priv, false);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_adc_supply_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol,
+			       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Enable audio ADC CLKGEN  */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON11,
+				   RSTB_ENCODER_VA28_MASK, RSTB_ENCODER_VA28_ENABLE);
+		/* Enable  LCLDO_ENC 2P8V */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON12,
+				   LCLDO_ENC_EN_VA28_MASK, LCLDO_ENC_EN_VA28_ENABLE);
+		/* LCLDO_ENC remote sense */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON12,
+				   VA28REFGEN_EN_VA28_MASK | LCLDO_ENC_REMOTE_SENSE_VA28_MASK,
+				   VA28REFGEN_EN_VA28_ENABLE | LCLDO_ENC_REMOTE_SENSE_VA28_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* LCLDO_ENC remote sense off */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON12,
+				   VA28REFGEN_EN_VA28_MASK | LCLDO_ENC_REMOTE_SENSE_VA28_MASK,
+				   VA28REFGEN_EN_VA28_DISABLE |
+				   LCLDO_ENC_REMOTE_SENSE_VA28_DISABLE);
+		/* disable LCLDO_ENC 2P8V */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON12,
+				   LCLDO_ENC_EN_VA28_MASK, LCLDO_ENC_EN_VA28_DISABLE);
+		/* disable audio ADC CLKGEN  */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON11,
+				   RSTB_ENCODER_VA28_MASK, RSTB_ENCODER_VA28_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_mic_type_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mic_type = dapm_kcontrol_get_value(w->kcontrols[0]);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x, mic_type %u\n", __func__, event, mic_type);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch (mic_type) {
+		case MIC_TYPE_MUX_DMIC:
+			mt6357_set_dmic(priv, true);
+			break;
+		case MIC_TYPE_MUX_LPBK:
+			mt6357_set_loopback(priv, true);
+			break;
+		case MIC_TYPE_MUX_SGEN:
+			mt6357_set_ul_sine_gen(priv, true);
+			break;
+		default:
+			mt6357_set_amic(priv, true, mic_type);
+			break;
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		switch (mic_type) {
+		case MIC_TYPE_MUX_DMIC:
+			mt6357_set_dmic(priv, false);
+			break;
+		case MIC_TYPE_MUX_LPBK:
+			mt6357_set_loopback(priv, false);
+			break;
+		case MIC_TYPE_MUX_SGEN:
+			mt6357_set_ul_sine_gen(priv, false);
+			break;
+		default:
+			mt6357_set_amic(priv, false, mic_type);
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_pga_left_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* L preamplifier enable */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDPREAMPLON_MASK, AUDPREAMPLON_ENABLE);
+		/* L ADC input sel : L PGA. Enable audio L ADC */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, AUDADCLINPUTSEL_MASK,
+				   AUDADCLINPUTSEL_PREAMPLIFIER);
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDADCLPWRUP_MASK, AUDADCLPWRUP);
+		/* Audio L preamplifier DCC precharge off */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDPREAMPLDCPRECHARGE_MASK, AUDPREAMPLDCPRECHARGE_DISABLE);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Audio L ADC input sel : off, disable audio L ADC */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDADCLPWRUP_MASK, AUDADCLPWRDOWN);
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, AUDADCLINPUTSEL_MASK,
+				   AUDADCLINPUTSEL_IDLE);
+		/* L PGA 0 dB gain */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, AUDPREAMPLGAIN_MASK,
+				   UL_GAIN_0DB << AUDPREAMPLGAIN_SFT);
+		/* L preamplifier ACC */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDPREAMPLDCCEN_MASK, AUDPREAMPLDCCEN_AC);
+		/* L preamplifier disable */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDPREAMPLON_MASK, AUDPREAMPLON_DISABLE);
+		/* disable Audio L preamplifier DCC precharge */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0,
+				   AUDPREAMPLDCPRECHARGE_MASK, AUDPREAMPLDCPRECHARGE_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_pga_right_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* R preamplifier enable */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDPREAMPRON_MASK, AUDPREAMPRON_ENABLE);
+		/* R ADC input sel : R PGA. Enable audio R ADC */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, AUDADCRINPUTSEL_MASK,
+				   AUDADCRINPUTSEL_PREAMPLIFIER);
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDADCRPWRUP_MASK, AUDADCRPWRUP);
+		/* Audio R preamplifier DCC precharge off */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDPREAMPRDCPRECHARGE_MASK, AUDPREAMPRDCPRECHARGE_DISABLE);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Audio R ADC input sel : off, disable audio R ADC */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDADCRPWRUP_MASK, AUDADCRPWRDOWN);
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, AUDADCRINPUTSEL_MASK,
+				   AUDADCRINPUTSEL_IDLE);
+		/* R PGA 0 dB gain */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, AUDPREAMPRGAIN_MASK,
+				   UL_GAIN_0DB << AUDPREAMPRGAIN_SFT);
+		/* R preamplifier ACC */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDPREAMPRDCCEN_MASK, AUDPREAMPRDCCEN_AC);
+		/* R preamplifier disable */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDPREAMPRON_MASK, AUDPREAMPRON_DISABLE);
+		/* disable Audio R preamplifier DCC precharge */
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1,
+				   AUDPREAMPRDCPRECHARGE_MASK, AUDPREAMPRDCPRECHARGE_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int adc_enable_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* enable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_ENABLE);
+		/* UL turn on */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_ENABLE);
+		/* Wait to avoid any pop noises */
+		msleep(100);
+		//set the mic gains to the stored values
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, AUDPREAMPLGAIN_MASK,
+				   priv->ana_gain[ANALOG_VOLUME_MIC1] << AUDPREAMPLGAIN_SFT);
+		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, AUDPREAMPRGAIN_MASK,
+				   priv->ana_gain[ANALOG_VOLUME_MIC2] << AUDPREAMPRGAIN_SFT);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* UL turn off */
+		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
+				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_DISABLE);
+		/* disable aud_pad TX fifos */
+		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
+				   AUD_PAD_TX_FIFO_NORMAL_PATH_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void configure_downlinks(struct mt6357_priv *priv, bool enable)
+{
+	if (enable) {
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ELR_0,
+				   AUD_HP_TRIM_EN_VAUDP15_MASK, AUD_HP_TRIM_EN_VAUDP15_ENABLE);
+		/* Disable headphone short-circuit protection */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_HPR_SC_VAUDP15_MASK | AUD_HPL_SC_VAUDP15_MASK,
+				   AUD_HPR_SC_VAUDP15_DISABLE | AUD_HPL_SC_VAUDP15_DISABLE);
+		/* Disable handset short-circuit protection */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HS_SC_VAUDP15_MASK, AUD_HS_SC_VAUDP15_DISABLE);
+		/* Disable lineout short-circuit protection */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOL_SC_VAUDP15_MASK, AUD_LOL_SC_VAUDP15_DISABLE);
+		/* Reduce ESD resistance of AU_REFN */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON2,
+				   AUD_REFN_DERES_VAUDP15_MASK, AUD_REFN_DERES_VAUDP15_ENABLE);
+		/* Set HPR/HPL gain as minimum (~ -40dB) */
+		regmap_write(priv->regmap, MT6357_ZCD_CON2, DL_GAIN_N_40DB_REG);
+		/* Set LOL gain as minimum (~ -40dB) */
+		regmap_write(priv->regmap, MT6357_ZCD_CON1, DL_GAIN_N_40DB_REG);
+		/* Set HS gain as minimum (~ -40dB) */
+		regmap_write(priv->regmap, MT6357_ZCD_CON3, DL_GAIN_N_40DB);
+		/* Turn on DA_600K_NCP_VA18 */
+		regmap_write(priv->regmap, MT6357_AUDNCP_CLKDIV_CON1, DIVCKS_ON);
+		/* Set NCP clock as 604kHz // 26MHz/43 = 604KHz */
+		regmap_write(priv->regmap, MT6357_AUDNCP_CLKDIV_CON2, 0x002c);
+		/* Toggle DIVCKS_CHG */
+		regmap_write(priv->regmap, MT6357_AUDNCP_CLKDIV_CON0, DIVCKS_CHG);
+		/* Set NCP soft start mode as default mode: 150us */
+		regmap_write(priv->regmap, MT6357_AUDNCP_CLKDIV_CON4, DIVCKS_PWD_NCP_ST_150US);
+		/* Enable NCP */
+		regmap_write(priv->regmap, MT6357_AUDNCP_CLKDIV_CON3, DIVCKS_PWD_NCP_ENABLE);
+		usleep_range(250, 270);
+		/* Enable cap-less LDOs (1.5V) */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON12,
+				   VA33REFGEN_EN_VA18_MASK |
+				   LCLDO_REMOTE_SENSE_VA18_MASK | LCLDO_EN_VA18_MASK |
+				   HCLDO_REMOTE_SENSE_VA18_MASK | HCLDO_EN_VA18_MASK,
+				   VA33REFGEN_EN_VA18_ENABLE |
+				   LCLDO_REMOTE_SENSE_VA18_ENABLE | LCLDO_EN_VA18_ENABLE |
+				   HCLDO_REMOTE_SENSE_VA18_ENABLE | HCLDO_EN_VA18_ENABLE);
+		/* Enable NV regulator (-1.2V) */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON13,
+				   NVREG_EN_VAUDP15_MASK, NVREG_EN_VAUDP15_ENABLE);
+		usleep_range(100, 120);
+		/* Enable IBIST */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON10,
+				   AUD_IBIAS_PWRDN_VAUDP15_MASK, AUD_IBIAS_PWRDN_VAUDP15_ENABLE);
+		/* Enable AUD_CLK */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON11,
+				   RSTB_DECODER_VA28_MASK, RSTB_DECODER_VA28_ENABLE);
+		/* Enable low-noise mode of DAC */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   DAC_LOW_NOISE_MODE_MASK, DAC_LOW_NOISE_MODE_ENABLE);
+		usleep_range(100, 120);
+	} else {
+		/* Disable low-noise mode of DAC */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   DAC_LOW_NOISE_MODE_MASK, DAC_LOW_NOISE_MODE_DISABLE);
+		/* Disable AUD_CLK */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON11,
+				   RSTB_DECODER_VA28_MASK, RSTB_DECODER_VA28_DISABLE);
+		/* Enable linout short-circuit protection */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOL_SC_VAUDP15_MASK, AUD_LOL_SC_VAUDP15_ENABLE);
+		/* Enable handset short-circuit protection */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HS_SC_VAUDP15_MASK, AUD_HS_SC_VAUDP15_ENABLE);
+		/* Enable headphone short-circuit protection */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_HPR_SC_VAUDP15_MASK | AUD_HPL_SC_VAUDP15_MASK,
+				   AUD_HPR_SC_VAUDP15_ENABLE | AUD_HPL_SC_VAUDP15_ENABLE);
+		/* Disable IBIST */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON10,
+				   AUD_IBIAS_PWRDN_VAUDP15_MASK, AUD_IBIAS_PWRDN_VAUDP15_DISABLE);
+		/* Disable NV regulator (-1.2V) */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON13,
+				   NVREG_EN_VAUDP15_MASK, NVREG_EN_VAUDP15_DISABLE);
+		/* Disable cap-less LDOs (1.5V) */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON12,
+				   VA33REFGEN_EN_VA18_MASK |
+				   LCLDO_REMOTE_SENSE_VA18_MASK | LCLDO_EN_VA18_MASK |
+				   HCLDO_REMOTE_SENSE_VA18_MASK | HCLDO_EN_VA18_MASK,
+				   VA33REFGEN_EN_VA18_DISABLE |
+				   LCLDO_REMOTE_SENSE_VA18_DISABLE | LCLDO_EN_VA18_DISABLE |
+				   HCLDO_REMOTE_SENSE_VA18_DISABLE | HCLDO_EN_VA18_DISABLE);
+		/* Disable NCP */
+		regmap_update_bits(priv->regmap, MT6357_AUDNCP_CLKDIV_CON3, DIVCKS_PWD_NCP_MASK,
+				   DIVCKS_PWD_NCP_DISABLE);
+	}
+}
+
+static int mt_audio_in_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		set_playback_gpio(priv, true);
+
+		/* Pull-down HPL/R to AVSS28_AUD */
+		if (priv->pull_down_needed)
+			hp_pull_down(priv, true);
+
+		/* Disable HP main CMFB Switch */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HPRL_MAIN_CMFB_LOOP_MASK, HPRL_MAIN_CMFB_LOOP_DISABLE);
+		/* Audio system digital clock power down release */
+		regmap_write(priv->regmap, MT6357_AFUNC_AUD_CON2, CCI_AUDIO_FIFO_DISABLE |
+								  CCI_ACD_MODE_NORMAL_PATH |
+								  CCI_AFIFO_CLK_PWDB_ON |
+								  CCI_ACD_FUNC_RSTB_RESET);
+		/* sdm audio fifo clock power on */
+		regmap_write(priv->regmap, MT6357_AFUNC_AUD_CON0, CCI_AUD_ANACK_INVERT |
+								  (4 << CCI_AUDIO_FIFO_WPTR_SFT) |
+								  CCI_SCRAMBLER_CG_ENABLE |
+								  CCI_RAND_ENABLE |
+								  CCI_SPLT_SCRMB_CLK_ON |
+								  CCI_SPLT_SCRMB_ON |
+								  CCI_ZERO_PADDING_DISABLE |
+								  CCI_SCRAMBLER_ENABLE);
+		/* scrambler clock on enable */
+		regmap_write(priv->regmap, MT6357_AFUNC_AUD_CON2, CCI_AUDIO_FIFO_DISABLE |
+								  CCI_ACD_MODE_TEST_PATH |
+								  CCI_AFIFO_CLK_PWDB_ON |
+								  CCI_ACD_FUNC_RSTB_RELEASE);
+		/* sdm power on */
+		regmap_write(priv->regmap, MT6357_AFUNC_AUD_CON2, CCI_AUDIO_FIFO_ENABLE |
+								  CCI_ACD_MODE_TEST_PATH |
+								  CCI_AFIFO_CLK_PWDB_ON |
+								  CCI_ACD_FUNC_RSTB_RELEASE);
+
+		configure_downlinks(priv, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		configure_downlinks(priv, false);
+		/* DL scrambler disabling sequence */
+		regmap_write(priv->regmap, MT6357_AFUNC_AUD_CON2, CCI_AUDIO_FIFO_DISABLE |
+								  CCI_ACD_MODE_TEST_PATH |
+								  CCI_AFIFO_CLK_PWDB_DOWN |
+								  CCI_ACD_FUNC_RSTB_RESET);
+		regmap_write(priv->regmap, MT6357_AFUNC_AUD_CON0, CCI_AUD_ANACK_INVERT |
+								  (4 << CCI_AUDIO_FIFO_WPTR_SFT) |
+								  CCI_SCRAMBLER_CG_ENABLE |
+								  CCI_RAND_ENABLE |
+								  CCI_SPLT_SCRMB_CLK_ON |
+								  CCI_SPLT_SCRMB_ON |
+								  CCI_ZERO_PADDING_DISABLE |
+								  CCI_SCRAMBLER_DISABLE);
+
+		set_playback_gpio(priv, false);
+
+		/* disable Pull-down HPL/R to AVSS28_AUD */
+		if (priv->pull_down_needed)
+			hp_pull_down(priv, false);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt_delay_250_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(250, 270);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		usleep_range(250, 270);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int lol_mux_event(struct snd_soc_dapm_widget *w,
+			 struct snd_kcontrol *kcontrol,
+			 int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* Set LO STB enhance circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOLOUT_STB_ENH_VAUDP15_MASK,
+				   AUD_LOLOUT_STB_ENH_VAUDP15_ENABLE);
+		/* Enable LO driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOL_PWRUP_BIAS_VAUDP15_MASK,
+				   AUD_LOL_PWRUP_BIAS_VAUDP15_ENABLE);
+		/* Enable LO driver core circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOL_PWRUP_VAUDP15_MASK, AUD_LOL_PWRUP_VAUDP15_ENABLE);
+		/* Set LOL gain to normal gain step by step */
+		lo_volume_ramp(priv, DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_LINEOUTL],
+			       DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_LINEOUTR]);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+
+		/* decrease LOL gain to minimum gain step by step */
+		lo_volume_ramp(priv, priv->ana_gain[ANALOG_VOLUME_LINEOUTL], DL_GAIN_N_40DB,
+			       priv->ana_gain[ANALOG_VOLUME_LINEOUTR], DL_GAIN_N_40DB);
+		/* Disable LO driver core circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOL_PWRUP_VAUDP15_MASK, AUD_LOL_PWRUP_VAUDP15_DISABLE);
+		/* Disable LO driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOL_PWRUP_BIAS_VAUDP15_MASK,
+				   AUD_LOL_PWRUP_BIAS_VAUDP15_DISABLE);
+		/* Clear LO STB enhance circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+				   AUD_LOLOUT_STB_ENH_VAUDP15_MASK,
+				   AUD_LOLOUT_STB_ENH_VAUDP15_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int hs_mux_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+
+		/* Set HS STB enhance circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HSOUT_STB_ENH_VAUDP15_MASK,
+				   AUD_HSOUT_STB_ENH_VAUDP15_ENABLE);
+		/* Enable HS driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HS_PWRUP_BIAS_VAUDP15_MASK,
+				   AUD_HS_PWRUP_BIAS_VAUDP15_ENABLE);
+		/* Enable HS driver core circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HS_PWRUP_VAUDP15_MASK, AUD_HS_PWRUP_VAUDP15_ENABLE);
+		/* Set HS gain to normal gain step by step */
+		hs_volume_ramp(priv, DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_HSOUT]);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+
+		/* decrease HS gain to minimum gain step by step */
+		hs_volume_ramp(priv,  priv->ana_gain[ANALOG_VOLUME_HSOUT], DL_GAIN_N_40DB);
+		/* Disable HS driver core circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HS_PWRUP_VAUDP15_MASK, AUD_HS_PWRUP_VAUDP15_DISABLE);
+		/* Disable HS driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HS_PWRUP_BIAS_VAUDP15_MASK,
+				   AUD_HS_PWRUP_BIAS_VAUDP15_ENABLE);
+		/* Clear HS STB enhance circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+				   AUD_HSOUT_STB_ENH_VAUDP15_MASK,
+				   AUD_HSOUT_STB_ENH_VAUDP15_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int hp_main_mux_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		priv->hp_channel_number++;
+		if (priv->hp_channel_number > 1)
+			break;
+		/* Set HPP/N STB enhance circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON2,
+				   HPROUT_STB_ENH_VAUDP15_MASK | HPLOUT_STB_ENH_VAUDP15_MASK,
+				   HPROUT_STB_ENH_VAUDP15_N470_P250 |
+				   HPLOUT_STB_ENH_VAUDP15_N470_P250);
+		/* Enable HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_AUX_PWRUP_VAUDP15_MASK | HPLOUT_AUX_PWRUP_VAUDP15_MASK,
+				   HPROUT_AUX_PWRUP_VAUDP15_ENABLE |
+				   HPLOUT_AUX_PWRUP_VAUDP15_ENABLE);
+		/* Enable HP aux feedback loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_AUX_FBRSW_VAUDP15_MASK | HPL_AUX_FBRSW_VAUDP15_MASK,
+				   HPR_AUX_FBRSW_VAUDP15_ENABLE | HPL_AUX_FBRSW_VAUDP15_ENABLE);
+		/* Enable HP aux CMFB loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HP_CMFB_RST_MASK |
+				   HPL_AUX_CMFB_LOOP_MASK | HPR_AUX_CMFB_LOOP_MASK,
+				   HP_CMFB_RST_NORMAL |
+				   HPL_AUX_CMFB_LOOP_ENABLE | HPR_AUX_CMFB_LOOP_ENABLE);
+		/* Enable HP driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_HPR_BIAS_VAUDP15_MASK | AUD_HPL_BIAS_VAUDP15_MASK,
+				   AUD_HPR_BIAS_VAUDP15_ENABLE | AUD_HPL_BIAS_VAUDP15_ENABLE);
+		/* Enable HP driver core circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_HPR_PWRUP_VAUDP15_MASK | AUD_HPL_PWRUP_VAUDP15_MASK,
+				   AUD_HPR_PWRUP_VAUDP15_ENABLE | AUD_HPL_PWRUP_VAUDP15_ENABLE);
+		/* Short HP main output to HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_SHORT2HPR_AUX_VAUDP15_MASK | HPL_SHORT2HPR_AUX_VAUDP15_MASK,
+				   HPR_SHORT2HPR_AUX_VAUDP15_ENABLE |
+				   HPL_SHORT2HPR_AUX_VAUDP15_ENABLE);
+		/* Enable HP main CMFB loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HPRL_MAIN_CMFB_LOOP_MASK, HPRL_MAIN_CMFB_LOOP_ENABLE);
+		/* Disable HP aux CMFB loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HPR_AUX_CMFB_LOOP_MASK | HPL_AUX_CMFB_LOOP_MASK,
+				   HPR_AUX_CMFB_LOOP_DISABLE | HPL_AUX_CMFB_LOOP_DISABLE);
+		/* Enable HP main output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_PWRUP_VAUDP15_MASK | HPLOUT_PWRUP_VAUDP15_MASK,
+				   HPROUT_PWRUP_VAUDP15_ENABLE | HPLOUT_PWRUP_VAUDP15_ENABLE);
+		/* Enable HPR/L main output stage step by step */
+		hp_main_output_ramp(priv, true);
+		usleep_range(1000, 1200);
+		/* Reduce HP aux feedback loop gain */
+		hp_aux_feedback_loop_gain_ramp(priv, true);
+		/* Disable HP aux feedback loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_AUX_FBRSW_VAUDP15_MASK | HPL_AUX_FBRSW_VAUDP15_MASK,
+				   HPR_AUX_FBRSW_VAUDP15_DISABLE | HPL_AUX_FBRSW_VAUDP15_DISABLE);
+		/* apply volume setting */
+		hp_volume_ramp(priv, DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_HPOUTL],
+			       DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_HPOUTR]);
+		/* Disable HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_AUX_PWRUP_VAUDP15_MASK | HPLOUT_AUX_PWRUP_VAUDP15_MASK,
+				   HPROUT_AUX_PWRUP_VAUDP15_DISABLE |
+				   HPLOUT_AUX_PWRUP_VAUDP15_DISABLE);
+		/* Unshort HP main output to HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_SHORT2HPR_AUX_VAUDP15_MASK | HPL_SHORT2HPR_AUX_VAUDP15_MASK,
+				   HPR_SHORT2HPR_AUX_VAUDP15_DISABLE |
+				   HPL_SHORT2HPR_AUX_VAUDP15_DISABLE);
+		usleep_range(100, 120);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		priv->hp_channel_number--;
+		if (priv->hp_channel_number > 0)
+			break;
+		/* Short HP main output to HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_SHORT2HPR_AUX_VAUDP15_MASK | HPL_SHORT2HPR_AUX_VAUDP15_MASK,
+				   HPR_SHORT2HPR_AUX_VAUDP15_ENABLE |
+				   HPL_SHORT2HPR_AUX_VAUDP15_ENABLE);
+		/* Enable HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_AUX_PWRUP_VAUDP15_MASK | HPLOUT_AUX_PWRUP_VAUDP15_MASK,
+				   HPROUT_AUX_PWRUP_VAUDP15_ENABLE |
+				   HPLOUT_AUX_PWRUP_VAUDP15_ENABLE);
+		/* decrease HPL/R gain to normal gain step by step */
+		hp_volume_ramp(priv, priv->ana_gain[ANALOG_VOLUME_HPOUTL], DL_GAIN_N_40DB,
+			       priv->ana_gain[ANALOG_VOLUME_HPOUTR], DL_GAIN_N_40DB);
+		/* Enable HP aux feedback loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_AUX_FBRSW_VAUDP15_MASK | HPL_AUX_FBRSW_VAUDP15_MASK,
+				   HPR_AUX_FBRSW_VAUDP15_ENABLE | HPL_AUX_FBRSW_VAUDP15_ENABLE);
+		/* Reduce HP aux feedback loop gain */
+		hp_aux_feedback_loop_gain_ramp(priv, false);
+		/* decrease HPR/L main output stage step by step */
+		hp_main_output_ramp(priv, false);
+		/* Disable HP main output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_PWRUP_VAUDP15_MASK | HPLOUT_PWRUP_VAUDP15_MASK,
+				   HPROUT_PWRUP_VAUDP15_DISABLE | HPLOUT_PWRUP_VAUDP15_DISABLE);
+		/* Enable HP aux CMFB loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HP_CMFB_RST_MASK |
+				   HPL_AUX_CMFB_LOOP_MASK | HPR_AUX_CMFB_LOOP_MASK,
+				   HP_CMFB_RST_RESET |
+				   HPL_AUX_CMFB_LOOP_ENABLE | HPR_AUX_CMFB_LOOP_ENABLE);
+		/* Disable HP main CMFB loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HPRL_MAIN_CMFB_LOOP_MASK, HPRL_MAIN_CMFB_LOOP_DISABLE);
+		/* Unshort HP main output to HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_SHORT2HPR_AUX_VAUDP15_MASK | HPL_SHORT2HPR_AUX_VAUDP15_MASK,
+				   HPR_SHORT2HPR_AUX_VAUDP15_DISABLE |
+				   HPL_SHORT2HPR_AUX_VAUDP15_DISABLE);
+		/* Disable HP driver core circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_HPR_PWRUP_VAUDP15_MASK | AUD_HPL_PWRUP_VAUDP15_MASK,
+				   AUD_HPR_PWRUP_VAUDP15_DISABLE | AUD_HPL_PWRUP_VAUDP15_DISABLE);
+		/* Disable HP driver bias circuits */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_HPR_BIAS_VAUDP15_MASK | AUD_HPL_BIAS_VAUDP15_MASK,
+				   AUD_HPR_BIAS_VAUDP15_DISABLE | AUD_HPL_BIAS_VAUDP15_DISABLE);
+		/* Disable HP aux CMFB loop,
+		 * Enable HP main CMFB for HP off state
+		 */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
+				   HPRL_MAIN_CMFB_LOOP_MASK |
+				   HPR_AUX_CMFB_LOOP_MASK | HPL_AUX_CMFB_LOOP_MASK,
+				   HPRL_MAIN_CMFB_LOOP_ENABLE |
+				   HPR_AUX_CMFB_LOOP_DISABLE | HPL_AUX_CMFB_LOOP_DISABLE);
+		/* Disable HP aux feedback loop */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPR_AUX_FBRSW_VAUDP15_MASK | HPL_AUX_FBRSW_VAUDP15_MASK,
+				   HPR_AUX_FBRSW_VAUDP15_DISABLE | HPL_AUX_FBRSW_VAUDP15_DISABLE);
+		/* Disable HP aux output stage */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
+				   HPROUT_AUX_PWRUP_VAUDP15_MASK | HPLOUT_AUX_PWRUP_VAUDP15_MASK,
+				   HPROUT_AUX_PWRUP_VAUDP15_DISABLE |
+				   HPLOUT_AUX_PWRUP_VAUDP15_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int right_dac_event(struct snd_soc_dapm_widget *w,
+			   struct snd_kcontrol *kcontrol,
+			   int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Enable Audio DAC and control audio bias gen */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_DACR_PWRUP_VA28_MASK | AUD_DACR_PWRUP_VAUDP15_MASK,
+				   AUD_DACR_PWRUP_VA28_ENABLE | AUD_DACR_PWRUP_VAUDP15_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* disable Pull-down HPL/R to AVSS28_AUD */
+		if (priv->pull_down_needed)
+			hp_pull_down(priv, false);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Pull-down HPL/R to AVSS28_AUD */
+		if (priv->pull_down_needed)
+			hp_pull_down(priv, true);
+		/* Disable Audio DAC and control audio bias gen  */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_DACR_PWRUP_VA28_MASK | AUD_DACR_PWRUP_VAUDP15_MASK,
+				   AUD_DACR_PWRUP_VA28_DISABLE | AUD_DACR_PWRUP_VAUDP15_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int left_dac_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Enable Audio DAC and control audio bias gen  */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_DACL_PWRUP_VA28_MASK | AUD_DACL_PWRUP_VAUDP15_MASK,
+				   AUD_DACL_PWRUP_VA28_ENABLE | AUD_DACL_PWRUP_VAUDP15_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* disable Pull-down HPL/R to AVSS28_AUD */
+		if (priv->pull_down_needed)
+			hp_pull_down(priv, false);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Pull-down HPL/R to AVSS28_AUD */
+		if (priv->pull_down_needed)
+			hp_pull_down(priv, true);
+		/* Disable Audio DAC and control audio bias gen  */
+		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+				   AUD_DACL_PWRUP_VA28_MASK | AUD_DACL_PWRUP_VAUDP15_MASK,
+				   AUD_DACL_PWRUP_VA28_DISABLE | AUD_DACL_PWRUP_VAUDP15_DISABLE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/* Supply widgets subsequence */
+enum {
+	/* common */
+	SUPPLY_SEQ_CLK_BUF,
+	SUPPLY_SEQ_AUD_GLB,
+	SUPPLY_SEQ_CLKSQ,
+	SUPPLY_SEQ_VOW_AUD_LPW,
+	SUPPLY_SEQ_AUD_VOW,
+	SUPPLY_SEQ_VOW_CLK,
+	SUPPLY_SEQ_VOW_LDO,
+	SUPPLY_SEQ_TOP_CK,
+	SUPPLY_SEQ_TOP_CK_LAST,
+	SUPPLY_SEQ_AUD_TOP,
+	SUPPLY_SEQ_AUD_TOP_LAST,
+	SUPPLY_SEQ_AFE,
+	/* capture */
+	SUPPLY_SEQ_ADC_SUPPLY,
+};
+
+/* DAPM Widgets */
+static const struct snd_soc_dapm_widget mt6357_dapm_widgets[] = {
+	/* Analog Clocks */
+	SND_SOC_DAPM_SUPPLY_S("CLK_BUF", SUPPLY_SEQ_CLK_BUF,
+			      MT6357_DCXO_CW14,
+			      XO_AUDIO_EN_M_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
+			      MT6357_AUDDEC_ANA_CON11,
+			      AUDGLB_PWRDN_VA28_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("CLKSQ Audio", SUPPLY_SEQ_CLKSQ,
+			      MT6357_AUDENC_ANA_CON6,
+			      CLKSQ_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDNCP_CK", SUPPLY_SEQ_TOP_CK,
+			      MT6357_AUD_TOP_CKPDN_CON0,
+			      AUDNCP_CK_PDN_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("ZCD13M_CK", SUPPLY_SEQ_TOP_CK,
+			      MT6357_AUD_TOP_CKPDN_CON0,
+			      ZCD13M_CK_PDN_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUD_CK", SUPPLY_SEQ_TOP_CK_LAST,
+			      MT6357_AUD_TOP_CKPDN_CON0,
+			      AUD_CK_PDN_SFT, 1,
+			      mt_delay_250_event,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY_S("AUDIF_CK", SUPPLY_SEQ_TOP_CK,
+			      MT6357_AUD_TOP_CKPDN_CON0,
+			      AUDIF_CK_PDN_SFT, 1, NULL, 0),
+
+	/* Digital Clocks */
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_AFE_CTL", SUPPLY_SEQ_AUD_TOP_LAST,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_AFE_CTL_SFT, 1,
+			      mt_delay_250_event,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_DAC_CTL", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_DAC_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_ADC_CTL", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_ADC_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_I2S_DL", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_I2S_DL_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_PWR_CLK", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PWR_CLK_DIS_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_PDN_AFE_TESTMODEL", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_AFE_TESTMODEL_CTL_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_PDN_RESERVED", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_RESERVED_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_LPBK", SUPPLY_SEQ_AUD_TOP,
+			      MT6357_AUDIO_TOP_CON0,
+			      PDN_LPBK_CTL_SFT, 1, NULL, 0),
+
+	/* General */
+	SND_SOC_DAPM_SUPPLY_S("AFE_ON", SUPPLY_SEQ_AFE,
+			      MT6357_AFE_UL_DL_CON0, AFE_ON_SFT, 0,
+			      NULL, 0),
+
+	/* Uplinks */
+	SND_SOC_DAPM_AIF_OUT_E("AIF1TX", "MT6357 Capture", 0,
+			       SND_SOC_NOPM, 0, 0,
+			       mt_aif_out_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S("ADC Supply", SUPPLY_SEQ_ADC_SUPPLY,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_adc_supply_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC", NULL, SND_SOC_NOPM, 0, 0, adc_enable_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("PGA L Mux", SND_SOC_NOPM, 0, 0,
+			   &pga_left_mux_control,
+			   mt_pga_left_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX_E("PGA R Mux", SND_SOC_NOPM, 0, 0,
+			   &pga_right_mux_control,
+			   mt_pga_right_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_PGA("PGA L", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA R", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MUX_E("Mic Type Mux", SND_SOC_NOPM, 0, 0,
+			   &mic_type_mux_control,
+			   mt_mic_type_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MICBIAS0", MT6357_AUDENC_ANA_CON8, AUD_MICBIAS0_PWD_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MICBIAS1", MT6357_AUDENC_ANA_CON9, AUD_MICBIAS1_PWD_SFT, 0, NULL, 0),
+
+	/* UL inputs */
+	SND_SOC_DAPM_INPUT("AIN0"),
+	SND_SOC_DAPM_INPUT("AIN1"),
+	SND_SOC_DAPM_INPUT("AIN2"),
+	SND_SOC_DAPM_INPUT("LPBK"),
+	SND_SOC_DAPM_INPUT("SGEN UL"),
+
+	/* Downlinks */
+	SND_SOC_DAPM_AIF_IN_E("AIF_RX", "MT6357 Playback", 0,
+			      SND_SOC_NOPM, 0, 0,
+			      mt_audio_in_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_INPUT("SGEN DL"),
+	SND_SOC_DAPM_MUX("DAC Mux", SND_SOC_NOPM, 0, 0, &dac_mux_control),
+
+	SND_SOC_DAPM_DAC_E("DACR", NULL, SND_SOC_NOPM, 0, 0, right_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC_E("DACL", NULL, SND_SOC_NOPM, 0, 0, left_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_SUPPLY("DL Digital Supply", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DL Analog Supply", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DL SRC", MT6357_AFE_DL_SRC2_CON0_L,
+			    DL_2_SRC_ON_TMP_CTL_PRE_SFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX_E("Line Out Source", SND_SOC_NOPM, 0, 0, &lo_mux_control,
+			   lol_mux_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MUX_E("Handset Source", SND_SOC_NOPM, 0, 0, &hs_mux_control,
+			   hs_mux_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MUX_E("Headphone Right Source", SND_SOC_NOPM, 0, 0, &hpr_mux_control,
+			   hp_main_mux_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MUX_E("Headphone Left Source", SND_SOC_NOPM, 0, 0, &hpl_mux_control,
+			   hp_main_mux_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	/* DL outputs */
+	SND_SOC_DAPM_OUTPUT("Headphones"),
+	SND_SOC_DAPM_OUTPUT("Hansdet"),
+	SND_SOC_DAPM_OUTPUT("Line out"),
+
+	/* Sine generator */
+	SND_SOC_DAPM_SUPPLY("SGEN UL Enable",
+			    MT6357_AFE_TOP_CON0, UL_SINE_ON_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SGEN Enable",
+			    MT6357_AFE_SGEN_CFG0,
+			    SGEN_DAC_EN_CTL_SFT, 0, mt_audio_in_event,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("SGEN MUTE",
+			    MT6357_AFE_SGEN_CFG0,
+			    SGEN_MUTE_SW_CTL_SFT, 1, NULL, 0)
+};
+
+static const struct snd_soc_dapm_route mt6357_dapm_routes[] = {
+	/* Capture */
+	{"AIF1TX", NULL, "Mic Type Mux"},
+	{"AIF1TX", NULL, "CLK_BUF"},
+	{"AIF1TX", NULL, "AUDGLB"},
+	{"AIF1TX", NULL, "CLKSQ Audio"},
+	{"AIF1TX", NULL, "AUD_CK"},
+	{"AIF1TX", NULL, "AUDIF_CK"},
+
+	{"AIF1TX", NULL, "AUDIO_TOP_AFE_CTL"},
+	{"AIF1TX", NULL, "AUDIO_TOP_ADC_CTL"},
+	{"AIF1TX", NULL, "AUDIO_TOP_PWR_CLK"},
+	{"AIF1TX", NULL, "AUDIO_TOP_PDN_RESERVED"},
+	{"AIF1TX", NULL, "AUDIO_TOP_I2S_DL"},
+	{"AIF1TX", NULL, "AFE_ON"},
+
+	{"Mic Type Mux", "ACC", "ADC"},
+	{"Mic Type Mux", "DCC", "ADC"},
+	{"Mic Type Mux", "DCC_ECM_DIFF", "ADC"},
+	{"Mic Type Mux", "DCC_ECM_SINGLE", "ADC"},
+	{"Mic Type Mux", "DMIC", "AIN0"},
+	{"Mic Type Mux", "DMIC", "AIN2"},
+	{"Mic Type Mux", "Loopback", "LPBK"},
+	{"Mic Type Mux", "Sine Generator", "SGEN UL"},
+
+	{"SGEN UL", NULL, "AUDIO_TOP_PDN_AFE_TESTMODEL"},
+	{"SGEN UL", NULL, "SGEN UL Enable"},
+	{"SGEN UL", NULL, "SGEN MUTE"},
+	{"SGEN UL", NULL, "SGEN Enable"},
+
+	{"ADC", NULL, "PGA L Mux"},
+	{"ADC", NULL, "PGA R Mux"},
+	{"ADC", NULL, "ADC Supply"},
+
+	{"PGA L Mux", "AIN0", "AIN0"},
+	{"PGA L Mux", "AIN1", "AIN1"},
+	{"PGA L Mux", "AIN2", "AIN2"},
+
+	{"PGA R Mux", "AIN0", "AIN0"},
+	{"PGA R Mux", "AIN1", "AIN1"},
+	{"PGA R Mux", "AIN2", "AIN2"},
+
+	{"AIN0", NULL, "MICBIAS0"},
+	{"AIN1", NULL, "MICBIAS1"},
+	{"AIN2", NULL, "MICBIAS0"},
+	{"LPBK", NULL, "AUDIO_TOP_LPBK"},
+
+	/* Playback */
+	{"DAC Mux", "Normal Path", "AIF_RX"},
+	{"DAC Mux", "Sine Generator", "SGEN DL"},
+
+	{"AIF_RX", NULL, "DL SRC"},
+
+	{"SGEN DL", NULL, "DL SRC"},
+	{"SGEN DL", NULL, "SGEN MUTE"},
+	{"SGEN DL", NULL, "SGEN Enable"},
+	{"SGEN DL", NULL, "DL Digital Supply"},
+	{"SGEN DL", NULL, "AUDIO_TOP_PDN_AFE_TESTMODEL"},
+
+	{"DACL", NULL, "DAC Mux"},
+	{"DACR", NULL, "DAC Mux"},
+
+	{"DL Analog Supply", NULL, "CLK_BUF"},
+	{"DL Analog Supply", NULL, "AUDGLB"},
+	{"DL Analog Supply", NULL, "CLKSQ Audio"},
+	{"DL Analog Supply", NULL, "AUDNCP_CK"},
+	{"DL Analog Supply", NULL, "ZCD13M_CK"},
+	{"DL Analog Supply", NULL, "AUD_CK"},
+	{"DL Analog Supply", NULL, "AUDIF_CK"},
+
+	{"DL Digital Supply", NULL, "AUDIO_TOP_AFE_CTL"},
+	{"DL Digital Supply", NULL, "AUDIO_TOP_DAC_CTL"},
+	{"DL Digital Supply", NULL, "AUDIO_TOP_PWR_CLK"},
+	{"DL Digital Supply", NULL, "AFE_ON"},
+
+	{"DACR", NULL, "DL Digital Supply"},
+	{"DACR", NULL, "DL Analog Supply"},
+	{"DACL", NULL, "DL Digital Supply"},
+	{"DACL", NULL, "DL Analog Supply"},
+
+	{"Line Out Source", "DACR", "DACR"},
+	{"Line Out Source", "Playback", "DACL"},
+	{"Line Out Source", "Test mode", "DACL"},
+
+	{"Handset Source", "DACR", "DACR"},
+	{"Handset Source", "Playback", "DACL"},
+	{"Handset Source", "Test mode", "DACL"},
+
+	{"Headphone Right Source", "DAC", "DACR"},
+	{"Headphone Right Source", "Line Out", "Line Out Source"},
+	{"Headphone Right Source", "Handset", "Handset Source"},
+
+	{"Headphone Left Source", "DAC", "DACL"},
+	{"Headphone Left Source", "Line Out", "Line Out Source"},
+	{"Headphone Left Source", "Handset", "Handset Source"},
+
+	{"Line out", NULL, "Line Out Source"},
+	{"Hansdet", NULL, "Handset Source"},
+
+	{"Headphones", NULL, "Headphone Right Source"},
+	{"Headphones", NULL, "Headphone Left Source"},
+};
+
+static struct snd_soc_dai_driver mtk_6357_dai_codecs[] = {
+	{
+		.name = "mt6357-snd-codec-aif1",
+		.playback = {
+			.stream_name = "MT6357 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SND_SOC_ADV_MT_FMTS,
+			},
+		.capture = {
+			.stream_name = "MT6357 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SOC_HIGH_USE_RATE,
+			.formats = SND_SOC_ADV_MT_FMTS,
+			},
+	},
+};
+
+static void mt6357_codec_init(struct mt6357_priv *priv)
+{
+	/* Enable audio part */
+	regmap_update_bits(priv->regmap, MT6357_DCXO_CW14,
+			   XO_AUDIO_EN_M_MASK, XO_AUDIO_EN_M_ENABLE);
+	/* Disable HeadphoneL/HeadphoneR short circuit protection */
+	regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON0,
+			   AUD_HPR_SC_VAUDP15_MASK | AUD_HPL_SC_VAUDP15_MASK,
+			   AUD_HPR_SC_VAUDP15_DISABLE | AUD_HPL_SC_VAUDP15_DISABLE);
+	/* Disable voice short circuit protection */
+	regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
+			   AUD_HS_SC_VAUDP15_MASK, AUD_HS_SC_VAUDP15_DISABLE);
+	/* disable LO buffer left short circuit protection */
+	regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
+			   AUD_LOL_SC_VAUDP15_MASK, AUD_LOL_SC_VAUDP15_DISABLE);
+	/* set gpio */
+	set_playback_gpio(priv, false);
+	set_capture_gpio(priv, false);
+	/* Disable audio part */
+	regmap_update_bits(priv->regmap, MT6357_DCXO_CW14,
+			   XO_AUDIO_EN_M_MASK, XO_AUDIO_EN_M_DISABLE);
+
+	/* gain default values*/
+	priv->ana_gain[ANALOG_VOLUME_MIC1] = UL_GAIN_0DB;
+	priv->ana_gain[ANALOG_VOLUME_MIC2] = UL_GAIN_0DB;
+	priv->ana_gain[ANALOG_VOLUME_HPOUTR] = DL_GAIN_0DB;
+	priv->ana_gain[ANALOG_VOLUME_HSOUT] = DL_GAIN_0DB;
+}
+
+static int mt6357_codec_probe(struct snd_soc_component *codec)
+{
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
+
+	mt6357_codec_init(priv);
+	return 0;
+}
+
+static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
+{
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
+	unsigned int val;
+
+	pr_debug("%s() reg = 0x%x", __func__, reg);
+	regmap_read(priv->regmap, reg, &val);
+	return val;
+}
+
+static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
+{
+	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
+
+	pr_debug("%s() reg = 0x%x  value= 0x%x\n", __func__, reg, value);
+	regmap_update_bits(priv->regmap, reg, 0xffff, value);
+	return 0;
+}
+
+static const struct snd_soc_component_driver mt6357_soc_component_driver = {
+	.probe = mt6357_codec_probe,
+	.read = mt6357_read,
+	.write = mt6357_write,
+	.controls = mt6357_controls,
+	.num_controls = ARRAY_SIZE(mt6357_controls),
+	.dapm_widgets = mt6357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt6357_dapm_widgets),
+	.dapm_routes = mt6357_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt6357_dapm_routes),
+};
+
+static void mt6357_parse_dt(struct mt6357_priv *priv)
+{
+	int ret, voltage_index;
+	u32 micbias_voltage_index = 0;
+	struct device *dev = priv->dev;
+
+	priv->pull_down_needed = false;
+	if (of_property_read_bool(dev->of_node, "mediatek,hp-pull-down"))
+		priv->pull_down_needed =  true;
+
+	micbias_voltage_index = MT6357_MICBIAS0_DEFAULT_VOLTAGE_INDEX;
+	ret = of_property_read_u32(dev->of_node, "mediatek,micbias0-microvolt",  &voltage_index);
+	if (!ret)
+		micbias_voltage_index = voltage_index;
+
+	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON8, AUD_MICBIAS0_VREF_MASK,
+			   micbias_voltage_index << AUD_MICBIAS0_VREF_SFT);
+
+	micbias_voltage_index = MT6357_MICBIAS1_DEFAULT_VOLTAGE_INDEX;
+	ret = of_property_read_u32(dev->of_node, "mediatek,micbias1-microvolt",  &voltage_index);
+	if (!ret)
+		micbias_voltage_index = voltage_index;
+
+	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON9, AUD_MICBIAS1_VREF_MASK,
+			   micbias_voltage_index << AUD_MICBIAS1_VREF_SFT);
+}
+
+static int mt6357_platform_driver_probe(struct platform_device *pdev)
+{
+	struct mt6357_priv *priv;
+	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
+	int ret;
+
+	ret = devm_regulator_get_enable(&pdev->dev, "vaud28");
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to enable vaud28 regulator\n");
+
+	priv = devm_kzalloc(&pdev->dev,
+			    sizeof(struct mt6357_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, priv);
+	priv->dev = &pdev->dev;
+
+	priv->regmap = mt6397->regmap;
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	mt6357_parse_dt(priv);
+
+	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
+	if (!pdev->dev.dma_mask)
+		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
+
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &mt6357_soc_component_driver,
+					       mtk_6357_dai_codecs,
+					       ARRAY_SIZE(mtk_6357_dai_codecs));
+}
+
+static const struct of_device_id mt6357_of_match[] = {
+	{.compatible = "mediatek,mt6357-sound",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6357_of_match);
+
+static struct platform_driver mt6357_platform_driver = {
+	.driver = {
+		   .name = "mt6357-sound",
+		   .of_match_table = mt6357_of_match,
+		   },
+	.probe = mt6357_platform_driver_probe,
+};
+
+module_platform_driver(mt6357_platform_driver)
+
+MODULE_DESCRIPTION("MT6357 ALSA SoC codec driver");
+MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/mt6357.h b/sound/soc/codecs/mt6357.h
new file mode 100644
index 000000000000..9d55f2f97a1d
--- /dev/null
+++ b/sound/soc/codecs/mt6357.h
@@ -0,0 +1,674 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt6357.h  --  mt6357 ALSA SoC audio codec driver
+ *
+ * Copyright (c) 2024 Baylibre
+ * Author: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#ifndef __MT6357_H__
+#define __MT6357_H__
+
+#include <linux/types.h>
+
+/* Reg bit defines */
+/* MT6357_GPIO_DIR0 */
+#define GPIO8_DIR_MASK				BIT(8)
+#define GPIO8_DIR_INPUT				0
+#define GPIO8_DIR_OUTPUT			BIT(8)
+#define GPIO9_DIR_MASK				BIT(9)
+#define GPIO9_DIR_INPUT				0
+#define GPIO9_DIR_OUTPUT			BIT(9)
+#define GPIO10_DIR_MASK				BIT(10)
+#define GPIO10_DIR_INPUT			0
+#define GPIO10_DIR_OUTPUT			BIT(10)
+#define GPIO11_DIR_MASK				BIT(11)
+#define GPIO11_DIR_INPUT			0
+#define GPIO11_DIR_OUTPUT			BIT(11)
+#define GPIO12_DIR_MASK				BIT(12)
+#define GPIO12_DIR_INPUT			0
+#define GPIO12_DIR_OUTPUT			BIT(12)
+#define GPIO13_DIR_MASK				BIT(13)
+#define GPIO13_DIR_INPUT			0
+#define GPIO13_DIR_OUTPUT			BIT(13)
+#define GPIO14_DIR_MASK				BIT(14)
+#define GPIO14_DIR_INPUT			0
+#define GPIO14_DIR_OUTPUT			BIT(14)
+#define GPIO15_DIR_MASK				BIT(15)
+#define GPIO15_DIR_INPUT			0
+#define GPIO15_DIR_OUTPUT			BIT(15)
+
+/* MT6357_GPIO_MODE2 */
+#define GPIO8_MODE_MASK				GENMASK(2, 0)
+#define GPIO8_MODE_AUD_CLK_MOSI			BIT(0)
+#define GPIO8_MODE_GPIO				0
+#define GPIO9_MODE_MASK				GENMASK(5, 3)
+#define GPIO9_MODE_AUD_DAT_MOSI0		BIT(3)
+#define GPIO9_MODE_GPIO				0
+#define GPIO10_MODE_MASK			GENMASK(8, 6)
+#define GPIO10_MODE_AUD_DAT_MOSI1		BIT(6)
+#define GPIO10_MODE_GPIO			0
+#define GPIO11_MODE_MASK			GENMASK(11, 9)
+#define GPIO11_MODE_AUD_SYNC_MOSI		BIT(9)
+#define GPIO11_MODE_GPIO			0
+
+/* MT6357_GPIO_MODE2_SET */
+#define GPIO8_MODE_SET_MASK			GENMASK(2, 0)
+#define GPIO8_MODE_SET_AUD_CLK_MOSI		BIT(0)
+#define GPIO9_MODE_SET_MASK			GENMASK(5, 3)
+#define GPIO9_MODE_SET_AUD_DAT_MOSI0		BIT(3)
+#define GPIO10_MODE_SET_MASK			GENMASK(8, 6)
+#define GPIO10_MODE_SET_AUD_DAT_MOSI1		BIT(6)
+#define GPIO11_MODE_SET_MASK			GENMASK(11, 9)
+#define GPIO11_MODE_SET_AUD_SYNC_MOSI		BIT(9)
+
+/* MT6357_GPIO_MODE2_CLR */
+#define GPIO_MODE2_CLEAR_ALL			GENMASK(15, 0)
+
+/* MT6357_GPIO_MODE3 */
+#define GPIO12_MODE_MASK			GENMASK(2, 0)
+#define GPIO12_MODE_AUD_CLK_MISO		BIT(0)
+#define GPIO12_MODE_GPIO			0
+#define GPIO13_MODE_MASK			GENMASK(5, 3)
+#define GPIO13_MODE_AUD_DAT_MISO0		BIT(3)
+#define GPIO13_MODE_GPIO			0
+#define GPIO14_MODE_MASK			GENMASK(8, 6)
+#define GPIO14_MODE_AUD_DAT_MISO1		BIT(6)
+#define GPIO14_MODE_GPIO			0
+#define GPIO15_MODE_MASK			GENMASK(11, 9)
+#define GPIO15_MODE_AUD_SYNC_MISO		BIT(9)
+#define GPIO15_MODE_GPIO			0
+
+/* MT6357_GPIO_MODE3_SET */
+#define GPIO12_MODE_SET_MASK			GENMASK(2, 0)
+#define GPIO12_MODE_SET_AUD_CLK_MISO		BIT(0)
+#define GPIO13_MODE_SET_MASK			GENMASK(5, 3)
+#define GPIO13_MODE_SET_AUD_DAT_MISO0		BIT(3)
+#define GPIO14_MODE_SET_MASK			GENMASK(8, 6)
+#define GPIO14_MODE_SET_AUD_DAT_MISO1		BIT(6)
+#define GPIO15_MODE_SET_MASK			GENMASK(11, 9)
+#define GPIO15_MODE_SET_AUD_SYNC_MISO		BIT(9)
+
+/* MT6357_GPIO_MODE3_CLR */
+#define GPIO_MODE3_CLEAR_ALL			GENMASK(15, 0)
+
+/* MT6357_DCXO_CW14 */
+#define XO_AUDIO_EN_M_SFT			13
+#define XO_AUDIO_EN_M_MASK			BIT(13)
+#define XO_AUDIO_EN_M_ENABLE			BIT(13)
+#define XO_AUDIO_EN_M_DISABLE			0
+
+/* MT6357_AUD_TOP_CKPDN_CON0 */
+#define AUDNCP_CK_PDN_SFT			6
+#define ZCD13M_CK_PDN_SFT			5
+#define AUDIF_CK_PDN_SFT			2
+#define AUD_CK_PDN_SFT				1
+
+/* MT6357_AUDNCP_CLKDIV_CON0 */
+#define DIVCKS_CHG				BIT(0)
+
+/* MT6357_AUDNCP_CLKDIV_CON1 */
+#define DIVCKS_ON				BIT(0)
+
+/* MT6357_AUDNCP_CLKDIV_CON3 */
+#define DIVCKS_PWD_NCP_MASK			BIT(0)
+#define DIVCKS_PWD_NCP_DISABLE			BIT(0)
+#define DIVCKS_PWD_NCP_ENABLE			0
+
+/* MT6357_AUDNCP_CLKDIV_CON4 */
+#define DIVCKS_PWD_NCP_ST_SEL_MASK		GENMASK(1, 0)
+#define DIVCKS_PWD_NCP_ST_50US			0
+#define DIVCKS_PWD_NCP_ST_100US			1
+#define DIVCKS_PWD_NCP_ST_150US			2
+#define DIVCKS_PWD_NCP_ST_200US			3
+
+/* MT6357_AFE_UL_DL_CON0 */
+#define AFE_UL_LR_SWAP_SFT			15
+#define AFE_ON_SFT				0
+
+/* MT6357_AFE_DL_SRC2_CON0_L */
+#define DL_2_SRC_ON_TMP_CTL_PRE_SFT		0
+
+/* MT6357_AFE_UL_SRC_CON0_H */
+#define C_TWO_DIGITAL_MIC_CTL_MASK		BIT(7)
+#define C_TWO_DIGITAL_MIC_ENABLE		BIT(7)
+#define C_TWO_DIGITAL_MIC_DISABLE		0
+
+/* MT6357_AFE_UL_SRC_CON0_L */
+#define UL_SDM_3_LEVEL_CTL_MASK			BIT(1)
+#define UL_SDM_3_LEVEL_SELECT			BIT(1)
+#define UL_SDM_3_LEVEL_DESELECT			0
+#define UL_SRC_ON_TMP_CTL_MASK			BIT(0)
+#define UL_SRC_ENABLE				BIT(0)
+#define UL_SRC_DISABLE				0
+
+/* MT6357_AFE_TOP_CON0 */
+#define UL_SINE_ON_SFT				1
+#define UL_SINE_ON_MASK				BIT(1)
+#define DL_SINE_ON_SFT				0
+#define DL_SINE_ON_MASK				BIT(0)
+
+/* MT6357_AUDIO_TOP_CON0 */
+#define PDN_LPBK_CTL_SFT			15
+#define PDN_AFE_CTL_SFT				7
+#define PDN_DAC_CTL_SFT				6
+#define PDN_ADC_CTL_SFT				5
+#define PDN_I2S_DL_CTL_SFT			3
+#define PWR_CLK_DIS_CTL_SFT			2
+#define PDN_AFE_TESTMODEL_CTL_SFT		1
+#define PDN_RESERVED_SFT			0
+
+/* MT6357_AFUNC_AUD_CON0 */
+#define CCI_AUD_ANACK_INVERT			BIT(15)
+#define CCI_AUD_ANACK_NORMAL			0
+#define CCI_AUDIO_FIFO_WPTR_SFT			12
+#define CCI_SCRAMBLER_CG_ENABLE			BIT(11)
+#define CCI_SCRAMBLER_CG_DISABLE		0
+#define CCI_LCK_INV_OUT_OF_PHASE		BIT(10)
+#define CCI_LCK_INV_IN_PHASE			0
+#define CCI_RAND_ENABLE				BIT(9)
+#define CCI_RAND_DISABLE			0
+#define CCI_SPLT_SCRMB_CLK_ON			BIT(8)
+#define CCI_SPLT_SCRMB_CLK_OFF			0
+#define CCI_SPLT_SCRMB_ON			BIT(7)
+#define CCI_SPLT_SCRMB_OFF			0
+#define CCI_AUD_IDAC_TEST_EN_FROM_TEST_IN	BIT(6)
+#define CCI_AUD_IDAC_TEST_EN_NORMAL_PATH	0
+#define CCI_ZERO_PADDING_DISABLE		BIT(5)
+#define CCI_ZERO_PADDING_ENABLE			0
+#define CCI_AUD_SPLIT_TEST_EN_FROM_TEST_IN	BIT(4)
+#define CCI_AUD_SPLIT_TEST_EN_NORMAL_PATH	0
+#define CCI_AUD_SDM_MUTE_L_REG_CTL		BIT(3)
+#define CCI_AUD_SDM_MUTE_L_NO_CTL		0
+#define CCI_AUD_SDM_MUTE_R_REG_CTL		BIT(2)
+#define CCI_AUD_SDM_MUTE_R_NO_CTL		0
+#define CCI_AUD_SDM_7BIT_FROM_SPLITTER3		BIT(1)
+#define CCI_AUD_SDM_7BIT_FROM_SPLITTER1		0
+#define CCI_SCRAMBLER_ENABLE			BIT(0)
+#define CCI_SCRAMBLER_DISABLE			0
+
+/* MT6357_AFUNC_AUD_CON2 */
+#define CCI_AUDIO_FIFO_ENABLE			BIT(3)
+#define CCI_AUDIO_FIFO_DISABLE			0
+#define CCI_ACD_MODE_NORMAL_PATH		BIT(2)
+#define CCI_ACD_MODE_TEST_PATH			0
+#define CCI_AFIFO_CLK_PWDB_ON			BIT(1)
+#define CCI_AFIFO_CLK_PWDB_DOWN			0
+#define CCI_ACD_FUNC_RSTB_RELEASE		BIT(0)
+#define CCI_ACD_FUNC_RSTB_RESET			0
+
+/* MT6357_AFE_ADDA_MTKAIF_CFG0 */
+#define ADDA_MTKAIF_LPBK_CTL_MASK		BIT(1)
+#define ADDA_MTKAIF_LPBK_ENABLE			BIT(1)
+#define ADDA_MTKAIF_LPBK_DISABLE		0
+
+/* MT6357_AFE_SGEN_CFG0 */
+#define SGEN_DAC_EN_CTL_SFT			7
+#define SGEN_DAC_ENABLE				BIT(7)
+#define SGEN_MUTE_SW_CTL_SFT			6
+#define SGEN_MUTE_SW_DISABLE			0
+
+/* MT6357_AFE_DCCLK_CFG0 */
+#define DCCLK_DIV_MASK				GENMASK(15, 5)
+#define DCCLK_DIV_SFT				5
+#define DCCLK_DIV_RUN_VALUE			(32 << DCCLK_DIV_SFT)
+#define DCCLK_DIV_STOP_VALUE			(259 << DCCLK_DIV_SFT)
+#define DCCLK_PDN_MASK				BIT(1)
+#define DCCLK_PDN				BIT(1)
+#define DCCLK_OUTPUT				0
+#define DCCLK_GEN_ON_MASK			BIT(0)
+#define DCCLK_GEN_ON				BIT(0)
+#define DCCLK_GEN_OFF				0
+
+/* MT6357_AFE_DCCLK_CFG1 */
+#define DCCLK_RESYNC_BYPASS_MASK		BIT(8)
+#define DCCLK_RESYNC_BYPASS			BIT(8)
+
+/* MT6357_AFE_AUD_PAD_TOP */
+#define AUD_PAD_TX_FIFO_NORMAL_PATH_MASK	GENMASK(15, 8)
+#define AUD_PAD_TX_FIFO_NORMAL_PATH_ENABLE	(BIT(13) | BIT(12) | BIT(8))
+#define AUD_PAD_TX_FIFO_NORMAL_PATH_DISABLE	(BIT(13) | BIT(12))
+#define AUD_PAD_TX_FIFO_LPBK_MASK		GENMASK(7, 0)
+#define AUD_PAD_TX_FIFO_LPBK_ENABLE		(BIT(5) | BIT(4) | BIT(0))
+#define AUD_PAD_TX_FIFO_LPBK_DISABLE		0
+
+/* MT6357_AUDENC_ANA_CON0 */
+#define AUDADCLINPUTSEL_MASK			GENMASK(14, 13)
+#define AUDADCLINPUTSEL_PREAMPLIFIER		BIT(14)
+#define AUDADCLINPUTSEL_IDLE			0
+#define AUDADCLPWRUP_SFT			12
+#define AUDADCLPWRUP_MASK			BIT(12)
+#define AUDADCLPWRUP				BIT(12)
+#define AUDADCLPWRDOWN				0
+#define AUDPREAMPLGAIN_SFT			8
+#define AUDPREAMPLGAIN_MASK			GENMASK(10, 8)
+#define AUDPREAMPLGAIN_MAX			4
+#define AUDPREAMPLINPUTSEL_SFT			6
+#define AUDPREAMPLINPUTSEL_MASK_NOSFT		GENMASK(1, 0)
+#define AUDPREAMPLDCPRECHARGE_MASK		BIT(2)
+#define AUDPREAMPLDCPRECHARGE_ENABLE		BIT(2)
+#define AUDPREAMPLDCPRECHARGE_DISABLE		0
+#define AUDPREAMPLDCCEN_MASK			BIT(1)
+#define AUDPREAMPLDCCEN_DC			BIT(1)
+#define AUDPREAMPLDCCEN_AC			0
+#define AUDPREAMPLON_MASK			BIT(0)
+#define AUDPREAMPLON_ENABLE			BIT(0)
+#define AUDPREAMPLON_DISABLE			0
+
+/* MT6357_AUDENC_ANA_CON1 */
+#define AUDADCRINPUTSEL_MASK			GENMASK(14, 13)
+#define AUDADCRINPUTSEL_PREAMPLIFIER		BIT(14)
+#define AUDADCRINPUTSEL_IDLE			0
+#define AUDADCRPWRUP_SFT			12
+#define AUDADCRPWRUP_MASK			BIT(12)
+#define AUDADCRPWRUP				BIT(12)
+#define AUDADCRPWRDOWN				0
+#define AUDPREAMPRGAIN_SFT			8
+#define AUDPREAMPRGAIN_MASK			GENMASK(10, 8)
+#define AUDPREAMPRGAIN_MAX			4
+#define AUDPREAMPRINPUTSEL_SFT			6
+#define AUDPREAMPRINPUTSEL_MASK_NOSFT		GENMASK(1, 0)
+#define AUDPREAMPRDCPRECHARGE_MASK		BIT(2)
+#define AUDPREAMPRDCPRECHARGE_ENABLE		BIT(2)
+#define AUDPREAMPRDCPRECHARGE_DISABLE		0
+#define AUDPREAMPRDCCEN_MASK			BIT(1)
+#define AUDPREAMPRDCCEN_DC			BIT(1)
+#define AUDPREAMPRDCCEN_AC			0
+#define AUDPREAMPRON_MASK			BIT(0)
+#define AUDPREAMPRON_ENABLE			BIT(0)
+#define AUDPREAMPRON_DISABLE			0
+
+/* MT6357_AUDENC_ANA_CON6 */
+#define CLKSQ_EN_SFT				0
+
+/* MT6357_AUDENC_ANA_CON7 */
+#define AUDDIGMICBIAS_MASK			GENMASK(2, 1)
+#define AUDDIGMICBIAS_DEFAULT_VALUE		BIT(2)
+#define AUDDIGMICBIAS_OFF			0
+#define AUDDIGMICEN_MASK			BIT(0)
+#define AUDDIGMICEN_ENABLE			BIT(0)
+#define AUDDIGMICEN_DISABLE			0
+
+/* MT6357_AUDENC_ANA_CON8 */
+#define AUD_MICBIAS0_DCSW2N_EN_MASK		BIT(14)
+#define AUD_MICBIAS0_DCSW2N_ENABLE		BIT(14)
+#define AUD_MICBIAS0_DCSW2N_DISABLE		0
+#define AUD_MICBIAS0_DCSW2P2_EN_MASK		BIT(13)
+#define AUD_MICBIAS0_DCSW2P2_ENABLE		BIT(13)
+#define AUD_MICBIAS0_DCSW2P2_DISABLE		0
+#define AUD_MICBIAS0_DCSW2P1_EN_MASK		BIT(12)
+#define AUD_MICBIAS0_DCSW2P1_ENABLE		BIT(12)
+#define AUD_MICBIAS0_DCSW2P1_DISABLE		0
+#define AUD_MICBIAS0_DCSW0N_EN_MASK		BIT(10)
+#define AUD_MICBIAS0_DCSW0N_ENABLE		BIT(10)
+#define AUD_MICBIAS0_DCSWN_DISABLE		0
+#define AUD_MICBIAS0_DCSW0P2_EN_MASK		BIT(9)
+#define AUD_MICBIAS0_DCSW0P2_ENABLE		BIT(9)
+#define AUD_MICBIAS0_DCSW0P2_DISABLE		0
+#define AUD_MICBIAS0_DCSW0P1_EN_MASK		BIT(8)
+#define AUD_MICBIAS0_DCSW0P1_ENABLE		BIT(8)
+#define AUD_MICBIAS0_DCSW0P1_DISABLE		0
+#define AUD_MICBIAS0_VREF_MASK			GENMASK(6, 4)
+#define AUD_MICBIAS0_VREF_SFT			4
+#define AUD_MICBIAS0_PWD_SFT			0
+
+#define AUD_MICBIAS0_DC_MASK			(AUD_MICBIAS0_DCSW2N_EN_MASK | \
+						 AUD_MICBIAS0_DCSW2P2_EN_MASK | \
+						 AUD_MICBIAS0_DCSW2P1_EN_MASK | \
+						 AUD_MICBIAS0_DCSW0N_EN_MASK | \
+						 AUD_MICBIAS0_DCSW0P2_EN_MASK | \
+						 AUD_MICBIAS0_DCSW0P1_EN_MASK)
+
+#define AUD_MICBIAS0_DC_ENABLE_ALL		(AUD_MICBIAS0_DCSW2N_ENABLE | \
+						 AUD_MICBIAS0_DCSW2P2_ENABLE | \
+						 AUD_MICBIAS0_DCSW2P1_ENABLE | \
+						 AUD_MICBIAS0_DCSW0N_ENABLE | \
+						 AUD_MICBIAS0_DCSW0P2_ENABLE | \
+						 AUD_MICBIAS0_DCSW0P1_ENABLE)
+
+#define AUD_MICBIAS0_DC_ENABLE_P1		(AUD_MICBIAS0_DCSW2P1_ENABLE | \
+						 AUD_MICBIAS0_DCSW0P1_ENABLE)
+
+#define AUD_MICBIAS0_DC_DISABLE_ALL		0
+
+/* MT6357_AUDENC_ANA_CON9 */
+#define AUD_MICBIAS1_DCSW1P_EN_MASK		BIT(8)
+#define AUD_MICBIAS1_DCSW1P_ENABLE		BIT(8)
+#define AUD_MICBIAS1_DCSW1P_DISABLE		0
+#define AUD_MICBIAS1_VREF_MASK			GENMASK(6, 4)
+#define AUD_MICBIAS1_VREF_SFT			4
+#define AUD_MICBIAS1_PWD_SFT			0
+
+/* MT6357_AUDDEC_ANA_CON0 */
+#define AUD_HPR_SC_VAUDP15_MASK			BIT(13)
+#define AUD_HPR_SC_VAUDP15_DISABLE		BIT(13)
+#define AUD_HPR_SC_VAUDP15_ENABLE		0
+#define AUD_HPL_SC_VAUDP15_MASK			BIT(12)
+#define AUD_HPL_SC_VAUDP15_DISABLE		BIT(12)
+#define AUD_HPL_SC_VAUDP15_ENABLE		0
+#define AUD_HPR_MUX_INPUT_VAUDP15_MASK_NOSFT	GENMASK(1, 0)
+#define AUD_HPR_MUX_INPUT_VAUDP15_SFT		10
+#define AUD_HPL_MUX_INPUT_VAUDP15_MASK_NOSFT	GENMASK(1, 0)
+#define AUD_HPL_MUX_INPUT_VAUDP15_SFT		8
+#define AUD_HPR_BIAS_VAUDP15_MASK		BIT(7)
+#define AUD_HPR_BIAS_VAUDP15_ENABLE		BIT(7)
+#define AUD_HPR_BIAS_VAUDP15_DISABLE		0
+#define AUD_HPL_BIAS_VAUDP15_MASK		BIT(6)
+#define AUD_HPL_BIAS_VAUDP15_ENABLE		BIT(6)
+#define AUD_HPL_BIAS_VAUDP15_DISABLE		0
+#define AUD_HPR_PWRUP_VAUDP15_MASK		BIT(5)
+#define AUD_HPR_PWRUP_VAUDP15_ENABLE		BIT(5)
+#define AUD_HPR_PWRUP_VAUDP15_DISABLE		0
+#define AUD_HPL_PWRUP_VAUDP15_MASK		BIT(4)
+#define AUD_HPL_PWRUP_VAUDP15_ENABLE		BIT(4)
+#define AUD_HPL_PWRUP_VAUDP15_DISABLE		0
+#define AUD_DACL_PWRUP_VA28_MASK		BIT(3)
+#define AUD_DACL_PWRUP_VA28_ENABLE		BIT(3)
+#define AUD_DACL_PWRUP_VA28_DISABLE		0
+#define AUD_DACR_PWRUP_VA28_MASK		BIT(2)
+#define AUD_DACR_PWRUP_VA28_ENABLE		BIT(2)
+#define AUD_DACR_PWRUP_VA28_DISABLE		0
+#define AUD_DACR_PWRUP_VAUDP15_MASK		BIT(1)
+#define AUD_DACR_PWRUP_VAUDP15_ENABLE		BIT(1)
+#define AUD_DACR_PWRUP_VAUDP15_DISABLE		0
+#define AUD_DACL_PWRUP_VAUDP15_MASK		BIT(0)
+#define AUD_DACL_PWRUP_VAUDP15_ENABLE		BIT(0)
+#define AUD_DACL_PWRUP_VAUDP15_DISABLE		0
+
+/* MT6357_AUDDEC_ANA_CON1 */
+#define HPROUT_STG_CTRL_VAUDP15_MASK		GENMASK(14, 12)
+#define HPROUT_STG_CTRL_VAUDP15_SFT		12
+#define HPLOUT_STG_CTRL_VAUDP15_MASK		GENMASK(10, 8)
+#define HPLOUT_STG_CTRL_VAUDP15_SFT		8
+#define HPR_SHORT2HPR_AUX_VAUDP15_MASK		BIT(7)
+#define HPR_SHORT2HPR_AUX_VAUDP15_ENABLE	BIT(7)
+#define HPR_SHORT2HPR_AUX_VAUDP15_DISABLE	0
+#define HPL_SHORT2HPR_AUX_VAUDP15_MASK		BIT(6)
+#define HPL_SHORT2HPR_AUX_VAUDP15_ENABLE	BIT(6)
+#define HPL_SHORT2HPR_AUX_VAUDP15_DISABLE	0
+#define HPR_AUX_FBRSW_VAUDP15_MASK		BIT(5)
+#define HPR_AUX_FBRSW_VAUDP15_ENABLE		BIT(5)
+#define HPR_AUX_FBRSW_VAUDP15_DISABLE		0
+#define HPL_AUX_FBRSW_VAUDP15_MASK		BIT(4)
+#define HPL_AUX_FBRSW_VAUDP15_ENABLE		BIT(4)
+#define HPL_AUX_FBRSW_VAUDP15_DISABLE		0
+#define HPROUT_AUX_PWRUP_VAUDP15_MASK		BIT(3)
+#define HPROUT_AUX_PWRUP_VAUDP15_ENABLE		BIT(3)
+#define HPROUT_AUX_PWRUP_VAUDP15_DISABLE	0
+#define HPLOUT_AUX_PWRUP_VAUDP15_MASK		BIT(2)
+#define HPLOUT_AUX_PWRUP_VAUDP15_ENABLE		BIT(2)
+#define HPLOUT_AUX_PWRUP_VAUDP15_DISABLE	0
+#define HPROUT_PWRUP_VAUDP15_MASK		BIT(1)
+#define HPROUT_PWRUP_VAUDP15_ENABLE		BIT(1)
+#define HPROUT_PWRUP_VAUDP15_DISABLE		0
+#define HPLOUT_PWRUP_VAUDP15_MASK		BIT(0)
+#define HPLOUT_PWRUP_VAUDP15_ENABLE		BIT(0)
+#define HPLOUT_PWRUP_VAUDP15_DISABLE		0
+
+/* MT6357_AUDDEC_ANA_CON2 */
+#define HPP_SHORT_2VCM_VAUDP15_MASK		BIT(10)
+#define HPP_SHORT_2VCM_VAUDP15_ENABLE		BIT(10)
+#define HPP_SHORT_2VCM_VAUDP15_DISABLE		0
+#define AUD_REFN_DERES_VAUDP15_MASK		BIT(9)
+#define AUD_REFN_DERES_VAUDP15_ENABLE		BIT(9)
+#define AUD_REFN_DERES_VAUDP15_DISABLE		0
+#define HPROUT_STB_ENH_VAUDP15_MASK		GENMASK(6, 4)
+#define HPROUT_STB_ENH_VAUDP15_OPEN		0
+#define HPROUT_STB_ENH_VAUDP15_NOPEN_P250	BIT(4)
+#define HPROUT_STB_ENH_VAUDP15_N470_POPEN	BIT(5)
+#define HPROUT_STB_ENH_VAUDP15_N470_P250	(BIT(4) | BIT(5))
+#define HPROUT_STB_ENH_VAUDP15_NOPEN_P470	(BIT(4) | BIT(6))
+#define HPROUT_STB_ENH_VAUDP15_N470_P470	(BIT(4) | BIT(5) | BIT(6))
+#define HPLOUT_STB_ENH_VAUDP15_MASK		GENMASK(2, 0)
+#define HPLOUT_STB_ENH_VAUDP15_OPEN		0
+#define HPLOUT_STB_ENH_VAUDP15_NOPEN_P250	BIT(0)
+#define HPLOUT_STB_ENH_VAUDP15_N470_POPEN	BIT(1)
+#define HPLOUT_STB_ENH_VAUDP15_N470_P250	(BIT(0) | BIT(1))
+#define HPLOUT_STB_ENH_VAUDP15_NOPEN_P470	(BIT(0) | BIT(2))
+#define HPLOUT_STB_ENH_VAUDP15_N470_P470	(BIT(0) | BIT(1) | BIT(2))
+
+/* MT6357_AUDDEC_ANA_CON3 */
+#define AUD_HSOUT_STB_ENH_VAUDP15_MASK		BIT(7)
+#define AUD_HSOUT_STB_ENH_VAUDP15_ENABLE	BIT(7)
+#define AUD_HSOUT_STB_ENH_VAUDP15_DISABLE	0
+#define AUD_HS_SC_VAUDP15_MASK			BIT(4)
+#define AUD_HS_SC_VAUDP15_DISABLE		BIT(4)
+#define AUD_HS_SC_VAUDP15_ENABLE		0
+#define AUD_HS_MUX_INPUT_VAUDP15_MASK_NOSFT	GENMASK(1, 0)
+#define AUD_HS_MUX_INPUT_VAUDP15_SFT		2
+#define AUD_HS_PWRUP_BIAS_VAUDP15_MASK		BIT(1)
+#define AUD_HS_PWRUP_BIAS_VAUDP15_ENABLE	BIT(1)
+#define AUD_HS_PWRUP_BIAS_VAUDP15_DISABLE	0
+#define AUD_HS_PWRUP_VAUDP15_MASK		BIT(0)
+#define AUD_HS_PWRUP_VAUDP15_ENABLE		BIT(0)
+#define AUD_HS_PWRUP_VAUDP15_DISABLE		0
+
+/* MT6357_AUDDEC_ANA_CON4 */
+#define AUD_LOLOUT_STB_ENH_VAUDP15_MASK		BIT(8)
+#define AUD_LOLOUT_STB_ENH_VAUDP15_ENABLE	BIT(8)
+#define AUD_LOLOUT_STB_ENH_VAUDP15_DISABLE	0
+#define AUD_LOL_SC_VAUDP15_MASK			BIT(4)
+#define AUD_LOL_SC_VAUDP15_DISABLE		BIT(4)
+#define AUD_LOL_SC_VAUDP15_ENABLE		0
+#define AUD_LOL_MUX_INPUT_VAUDP15_MASK_NOSFT	GENMASK(1, 0)
+#define AUD_LOL_MUX_INPUT_VAUDP15_SFT		2
+#define AUD_LOL_PWRUP_BIAS_VAUDP15_MASK		BIT(1)
+#define AUD_LOL_PWRUP_BIAS_VAUDP15_ENABLE	BIT(1)
+#define AUD_LOL_PWRUP_BIAS_VAUDP15_DISABLE	0
+#define AUD_LOL_PWRUP_VAUDP15_MASK		BIT(0)
+#define AUD_LOL_PWRUP_VAUDP15_ENABLE		BIT(0)
+#define AUD_LOL_PWRUP_VAUDP15_DISABLE		0
+
+/* MT6357_AUDDEC_ANA_CON6 */
+#define HP_AUX_LOOP_GAIN_MASK			GENMASK(15, 12)
+#define HP_AUX_LOOP_GAIN_SFT			12
+#define HPR_AUX_CMFB_LOOP_MASK			BIT(11)
+#define HPR_AUX_CMFB_LOOP_ENABLE		BIT(11)
+#define HPR_AUX_CMFB_LOOP_DISABLE		0
+#define HPL_AUX_CMFB_LOOP_MASK			BIT(10)
+#define HPL_AUX_CMFB_LOOP_ENABLE		BIT(10)
+#define HPL_AUX_CMFB_LOOP_DISABLE		0
+#define HPRL_MAIN_CMFB_LOOP_MASK		BIT(9)
+#define HPRL_MAIN_CMFB_LOOP_ENABLE		BIT(9)
+#define HPRL_MAIN_CMFB_LOOP_DISABLE		0
+#define HP_CMFB_RST_MASK			BIT(7)
+#define HP_CMFB_RST_NORMAL			BIT(7)
+#define HP_CMFB_RST_RESET			0
+#define DAC_LOW_NOISE_MODE_MASK			BIT(0)
+#define DAC_LOW_NOISE_MODE_ENABLE		BIT(0)
+#define DAC_LOW_NOISE_MODE_DISABLE		0
+
+/* MT6357_AUDDEC_ANA_CON7 */
+#define HP_IVBUF_DEGAIN_SFT			2
+#define HP_IVBUF_DEGAIN_MAX			1
+
+/* MT6357_AUDDEC_ANA_CON10 */
+#define AUD_IBIAS_PWRDN_VAUDP15_MASK		BIT(8)
+#define AUD_IBIAS_PWRDN_VAUDP15_DISABLE		BIT(8)
+#define AUD_IBIAS_PWRDN_VAUDP15_ENABLE		0
+
+/* MT6357_AUDDEC_ANA_CON11 */
+#define RSTB_ENCODER_VA28_MASK			BIT(5)
+#define RSTB_ENCODER_VA28_ENABLE		BIT(5)
+#define RSTB_ENCODER_VA28_DISABLE		0
+#define AUDGLB_PWRDN_VA28_SFT			4
+#define RSTB_DECODER_VA28_MASK			BIT(0)
+#define RSTB_DECODER_VA28_ENABLE		BIT(0)
+#define RSTB_DECODER_VA28_DISABLE		0
+
+/* MT6357_AUDDEC_ANA_CON12 */
+#define VA28REFGEN_EN_VA28_MASK			BIT(13)
+#define VA28REFGEN_EN_VA28_ENABLE		BIT(13)
+#define VA28REFGEN_EN_VA28_DISABLE		0
+#define VA33REFGEN_EN_VA18_MASK			BIT(12)
+#define VA33REFGEN_EN_VA18_ENABLE		BIT(12)
+#define VA33REFGEN_EN_VA18_DISABLE		0
+#define LCLDO_ENC_REMOTE_SENSE_VA28_MASK	BIT(10)
+#define LCLDO_ENC_REMOTE_SENSE_VA28_ENABLE	BIT(10)
+#define LCLDO_ENC_REMOTE_SENSE_VA28_DISABLE	0
+#define LCLDO_ENC_EN_VA28_MASK			BIT(8)
+#define LCLDO_ENC_EN_VA28_ENABLE		BIT(8)
+#define LCLDO_ENC_EN_VA28_DISABLE		0
+#define LCLDO_REMOTE_SENSE_VA18_MASK		BIT(6)
+#define LCLDO_REMOTE_SENSE_VA18_ENABLE		BIT(6)
+#define LCLDO_REMOTE_SENSE_VA18_DISABLE		0
+#define LCLDO_EN_VA18_MASK			BIT(4)
+#define LCLDO_EN_VA18_ENABLE			BIT(4)
+#define LCLDO_EN_VA18_DISABLE			0
+#define HCLDO_REMOTE_SENSE_VA18_MASK		BIT(2)
+#define HCLDO_REMOTE_SENSE_VA18_ENABLE		BIT(2)
+#define HCLDO_REMOTE_SENSE_VA18_DISABLE		0
+#define HCLDO_EN_VA18_MASK			BIT(0)
+#define HCLDO_EN_VA18_ENABLE			BIT(0)
+#define HCLDO_EN_VA18_DISABLE			0
+
+/* MT6357_AUDDEC_ANA_CON13 */
+#define NVREG_EN_VAUDP15_MASK			BIT(0)
+#define NVREG_EN_VAUDP15_ENABLE			BIT(0)
+#define NVREG_EN_VAUDP15_DISABLE		0
+
+/* MT6357_AUDDEC_ELR_0 */
+#define AUD_HP_TRIM_EN_VAUDP15_MASK		BIT(12)
+#define AUD_HP_TRIM_EN_VAUDP15_ENABLE		BIT(12)
+#define AUD_HP_TRIM_EN_VAUDP15_DISABLE		0
+
+/* MT6357_ZCD_CON1 */
+#define AUD_LOL_GAIN_MASK			GENMASK(4, 0)
+#define AUD_LOL_GAIN_SFT			0
+#define AUD_LOR_GAIN_MASK			GENMASK(11, 7)
+#define AUD_LOR_GAIN_SFT			7
+#define AUD_LO_GAIN_MAX				0x12
+
+/* MT6357_ZCD_CON2 */
+#define AUD_HPL_GAIN_MASK			GENMASK(4, 0)
+#define AUD_HPL_GAIN_SFT			0
+#define AUD_HPR_GAIN_MASK			GENMASK(11, 7)
+#define AUD_HPR_GAIN_SFT			7
+#define AUD_HP_GAIN_MAX				0x12
+
+/* MT6357_ZCD_CON3 */
+#define AUD_HS_GAIN_MASK			GENMASK(4, 0)
+#define AUD_HS_GAIN_SFT				0
+#define AUD_HS_GAIN_MAX				0x12
+
+/* Registers list */
+/* gpio direction */
+#define MT6357_GPIO_DIR0			0x0088
+/* mosi */
+#define MT6357_GPIO_MODE2			0x00B6
+#define MT6357_GPIO_MODE2_SET			0x00B8
+#define MT6357_GPIO_MODE2_CLR			0x00BA
+/* miso */
+#define MT6357_GPIO_MODE3			0x00BC
+#define MT6357_GPIO_MODE3_SET			0x00BE
+#define MT6357_GPIO_MODE3_CLR			0x00C0
+
+#define MT6357_DCXO_CW14			0x07AC
+
+#define MT6357_AUD_TOP_CKPDN_CON0		0x208C
+#define MT6357_AUDNCP_CLKDIV_CON0		0x20B4
+#define MT6357_AUDNCP_CLKDIV_CON1		0x20B6
+#define MT6357_AUDNCP_CLKDIV_CON2		0x20B8
+#define MT6357_AUDNCP_CLKDIV_CON3		0x20BA
+#define MT6357_AUDNCP_CLKDIV_CON4		0x20BC
+#define MT6357_AFE_UL_DL_CON0			0x2108
+#define MT6357_AFE_DL_SRC2_CON0_L		0x210A
+#define MT6357_AFE_UL_SRC_CON0_H		0x210C
+#define MT6357_AFE_UL_SRC_CON0_L		0x210E
+#define MT6357_AFE_TOP_CON0			0x2110
+#define MT6357_AUDIO_TOP_CON0			0x2112
+#define MT6357_AFUNC_AUD_CON0			0x2116
+#define MT6357_AFUNC_AUD_CON2			0x211A
+#define MT6357_AFE_ADDA_MTKAIF_CFG0		0x2134
+#define MT6357_AFE_SGEN_CFG0			0x2140
+#define MT6357_AFE_DCCLK_CFG0			0x2146
+#define MT6357_AFE_DCCLK_CFG1			0x2148
+#define MT6357_AFE_AUD_PAD_TOP			0x214C
+#define MT6357_AUDENC_ANA_CON0			0x2188
+#define MT6357_AUDENC_ANA_CON1			0x218A
+#define MT6357_AUDENC_ANA_CON6			0x2194
+#define MT6357_AUDENC_ANA_CON7			0x2196
+#define MT6357_AUDENC_ANA_CON8			0x2198
+#define MT6357_AUDENC_ANA_CON9			0x219A
+#define MT6357_AUDDEC_ANA_CON0			0x2208
+#define MT6357_AUDDEC_ANA_CON1			0x220A
+#define MT6357_AUDDEC_ANA_CON2			0x220C
+#define MT6357_AUDDEC_ANA_CON3			0x220E
+#define MT6357_AUDDEC_ANA_CON4			0x2210
+#define MT6357_AUDDEC_ANA_CON6			0x2214
+#define MT6357_AUDDEC_ANA_CON7			0x2216
+#define MT6357_AUDDEC_ANA_CON10			0x221C
+#define MT6357_AUDDEC_ANA_CON11			0x221E
+#define MT6357_AUDDEC_ANA_CON12			0x2220
+#define MT6357_AUDDEC_ANA_CON13			0x2222
+#define MT6357_AUDDEC_ELR_0			0x2226
+#define MT6357_ZCD_CON1				0x228A
+#define MT6357_ZCD_CON2				0x228C
+#define MT6357_ZCD_CON3				0x228E
+
+/* enums and other defines */
+enum analog_volume_type {
+	ANALOG_VOLUME_HSOUT = 0,
+	ANALOG_VOLUME_HPOUTL,
+	ANALOG_VOLUME_HPOUTR,
+	ANALOG_VOLUME_LINEOUTL,
+	ANALOG_VOLUME_LINEOUTR,
+	ANALOG_VOLUME_MIC1,
+	ANALOG_VOLUME_MIC2,
+	ANALOG_VOLUME_TYPE_MAX
+};
+
+enum {
+	DL_GAIN_8DB = 0,
+	DL_GAIN_0DB = 8,
+	DL_GAIN_N_1DB = 9,
+	DL_GAIN_N_10DB = 18,
+	DL_GAIN_N_12DB = 20,
+	DL_GAIN_N_40DB = 0x1f,
+};
+
+enum {
+	UL_GAIN_0DB = 0,
+	UL_GAIN_6DB,
+	UL_GAIN_12DB,
+	UL_GAIN_18DB,
+	UL_GAIN_24DB,
+};
+
+#define DL_GAIN_N_40DB_REG			(DL_GAIN_N_40DB << 7 | DL_GAIN_N_40DB)
+#define DL_GAIN_REG_LEFT_MASK			0x001f
+#define DL_GAIN_REG_LEFT_SHIFT			0
+#define DL_GAIN_REG_RIGHT_MASK			0x0f80
+#define DL_GAIN_REG_RIGHT_SHIFT			7
+#define DL_GAIN_REG_MASK			0x0f9f
+
+#define SND_SOC_ADV_MT_FMTS (\
+				SNDRV_PCM_FMTBIT_S16_LE |\
+				SNDRV_PCM_FMTBIT_S16_BE |\
+				SNDRV_PCM_FMTBIT_U16_LE |\
+				SNDRV_PCM_FMTBIT_U16_BE |\
+				SNDRV_PCM_FMTBIT_S24_LE |\
+				SNDRV_PCM_FMTBIT_S24_BE |\
+				SNDRV_PCM_FMTBIT_U24_LE |\
+				SNDRV_PCM_FMTBIT_U24_BE |\
+				SNDRV_PCM_FMTBIT_S32_LE |\
+				SNDRV_PCM_FMTBIT_S32_BE |\
+				SNDRV_PCM_FMTBIT_U32_LE |\
+				SNDRV_PCM_FMTBIT_U32_BE)
+
+#define SOC_HIGH_USE_RATE (\
+				SNDRV_PCM_RATE_CONTINUOUS |\
+				SNDRV_PCM_RATE_8000_192000)
+
+#define MT6357_MICBIAS0_DEFAULT_VOLTAGE_INDEX	2 /* 1.9 Volt */
+#define MT6357_MICBIAS1_DEFAULT_VOLTAGE_INDEX	0 /* 1.7 Volt */
+
+/* codec private structure */
+struct mt6357_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	int ana_gain[ANALOG_VOLUME_TYPE_MAX];
+	bool pull_down_needed;
+	int hp_channel_number;
+};
+#endif

-- 
2.25.1

