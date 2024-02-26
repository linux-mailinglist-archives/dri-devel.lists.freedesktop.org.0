Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99EC867A22
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298C810E761;
	Mon, 26 Feb 2024 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ahswWrGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E4710E761
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708961142;
 bh=OfLXYlwd1oO4wKQ1ZTIm/mqhg9XdCW4z3MtpsmYjrYk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ahswWrGhEumoJYWt9q5jnDpaE200+Ca7qVvo5nVTusuaPEOHYDiXEYiXXzxHUsyJj
 9rPvXpg1gf5TbRiLOh7MWVbx/ulqtb9Vn8edz3NvvI5dh/IoCXVIMR9BrXOcD0VJPF
 i643VqCwGh0P4vTZVwTMqvN9El0xGp9xHUEIF62SWIXZWEqIkN0dPc6FoQxdhrpvZZ
 1QBybX4KdEMEXCEP/mjzXpSBP/L9gJHXTDNEQb/2IQbfLwIQNXYt6NmXHdJAIUCBxL
 m9Po9aQoB8hcgSKs+nSgn+bA8C3wwYSABfsSz2t6Ssgrk7UNoz6IKNgdVye7VHOvhO
 Yj9uptwQ8m+0Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 691D03780B5F;
 Mon, 26 Feb 2024 15:25:40 +0000 (UTC)
Message-ID: <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
Date: Mon, 26 Feb 2024 16:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 26/02/24 15:01, amergnat@baylibre.com ha scritto:
> From: Nicolas Belin <nbelin@baylibre.com>
> 
> Add the support of MT6357 PMIC audio codec.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/codecs/Kconfig  |    7 +
>   sound/soc/codecs/Makefile |    2 +
>   sound/soc/codecs/mt6357.c | 1805 +++++++++++++++++++++++++++++++++++++++++++++
>   sound/soc/codecs/mt6357.h |  674 +++++++++++++++++
>   4 files changed, 2488 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 59f9742e9ff4..9cf2b9b70472 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -153,6 +153,7 @@ config SND_SOC_ALL_CODECS
>   	imply SND_SOC_MC13783
>   	imply SND_SOC_ML26124
>   	imply SND_SOC_MT6351
> +	imply SND_SOC_MT6357
>   	imply SND_SOC_MT6358
>   	imply SND_SOC_MT6359
>   	imply SND_SOC_MT6660
> @@ -2361,6 +2362,12 @@ config SND_SOC_ML26124
>   config SND_SOC_MT6351
>   	tristate "MediaTek MT6351 Codec"
>   
> +config SND_SOC_MT6357
> +	tristate "MediaTek MT6357 Codec"
> +	help
> +	  Enable support for the platform which uses MT6357 as
> +	  external codec device.
> +
>   config SND_SOC_MT6358
>   	tristate "MediaTek MT6358 Codec"
>   	help
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index f53baa2b9565..33e27612867e 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -169,6 +169,7 @@ snd-soc-ml26124-objs := ml26124.o
>   snd-soc-msm8916-analog-objs := msm8916-wcd-analog.o
>   snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
>   snd-soc-mt6351-objs := mt6351.o
> +snd-soc-mt6357-objs := mt6357.o
>   snd-soc-mt6358-objs := mt6358.o
>   snd-soc-mt6359-objs := mt6359.o
>   snd-soc-mt6359-accdet-objs := mt6359-accdet.o
> @@ -554,6 +555,7 @@ obj-$(CONFIG_SND_SOC_ML26124)	+= snd-soc-ml26124.o
>   obj-$(CONFIG_SND_SOC_MSM8916_WCD_ANALOG) +=snd-soc-msm8916-analog.o
>   obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
>   obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
> +obj-$(CONFIG_SND_SOC_MT6357)	+= snd-soc-mt6357.o
>   obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
>   obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
>   obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
> new file mode 100644
> index 000000000000..13e95c227114
> --- /dev/null
> +++ b/sound/soc/codecs/mt6357.c
> @@ -0,0 +1,1805 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MT6357 ALSA SoC audio codec driver
> + *
> + * Copyright (c) 2024 Baylibre
> + * Author: Nicolas Belin <nbelin@baylibre.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include "mt6357.h"
> +
> +static void set_playback_gpio(struct mt6357_priv *priv, bool enable)
> +{

you're anyway always doing CLEAR_ALL, so you can do it outside of the if branch.


regmap_write( ... CLEAR_ALL);

if (enable) {
...
} else {
...
}


> +	if (enable) {
> +		/* set gpio mosi mode */
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, GPIO8_MODE_SET_AUD_CLK_MOSI |
> +								  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
> +								  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
> +								  GPIO11_MODE_SET_AUD_SYNC_MOSI);

Are you sure that you need to write to MODE2_SET *and* to MODE2?!

> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2, GPIO8_MODE_AUD_CLK_MOSI |
> +							      GPIO9_MODE_AUD_DAT_MOSI0 |
> +							      GPIO10_MODE_AUD_DAT_MOSI1 |
> +							      GPIO11_MODE_AUD_SYNC_MOSI);
> +	} else {
> +		/* set pad_aud_*_mosi to GPIO mode and dir input
> +		 * reason:
> +		 * pad_aud_dat_mosi*, because the pin is used as boot strap
> +		 */
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2, GPIO8_MODE_GPIO |
> +							      GPIO9_MODE_GPIO |
> +							      GPIO10_MODE_GPIO |
> +							      GPIO11_MODE_GPIO);
> +		regmap_update_bits(priv->regmap, MT6357_GPIO_DIR0, GPIO8_DIR_MASK |
> +								   GPIO9_DIR_MASK |
> +								   GPIO10_DIR_MASK |
> +								   GPIO11_DIR_MASK,
> +								   GPIO8_DIR_INPUT |
> +								   GPIO9_DIR_INPUT |
> +								   GPIO10_DIR_INPUT |
> +								   GPIO11_DIR_INPUT);
> +	}
> +}
> +
> +static void set_capture_gpio(struct mt6357_priv *priv, bool enable)
> +{

same comment applies here.

> +	if (enable) {
> +		/* set gpio miso mode */
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE3_CLR, GPIO_MODE3_CLEAR_ALL);
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE3_SET, GPIO12_MODE_SET_AUD_CLK_MISO |
> +								  GPIO13_MODE_SET_AUD_DAT_MISO0 |
> +								  GPIO14_MODE_SET_AUD_DAT_MISO1 |
> +								  GPIO15_MODE_SET_AUD_SYNC_MISO);
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE3, GPIO12_MODE_AUD_CLK_MISO |
> +							      GPIO13_MODE_AUD_DAT_MISO0 |
> +							      GPIO14_MODE_AUD_DAT_MISO1 |
> +							      GPIO15_MODE_AUD_SYNC_MISO);
> +	} else {
> +		/* set pad_aud_*_miso to GPIO mode and dir input
> +		 * reason:
> +		 * pad_aud_clk_miso, because when playback only the miso_clk
> +		 * will also have 26m, so will have power leak
> +		 * pad_aud_dat_miso*, because the pin is used as boot strap
> +		 */
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE3_CLR, GPIO_MODE3_CLEAR_ALL);
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE3, GPIO12_MODE_GPIO |
> +							      GPIO13_MODE_GPIO |
> +							      GPIO14_MODE_GPIO |
> +							      GPIO15_MODE_GPIO);
> +		regmap_update_bits(priv->regmap, MT6357_GPIO_DIR0, GPIO12_DIR_MASK |
> +								   GPIO13_DIR_MASK |
> +								   GPIO14_DIR_MASK |
> +								   GPIO15_DIR_MASK,
> +								   GPIO12_DIR_INPUT |
> +								   GPIO13_DIR_INPUT |
> +								   GPIO14_DIR_INPUT |
> +								   GPIO15_DIR_INPUT);
> +	}
> +}
> +
> +static void hp_main_output_ramp(struct mt6357_priv *priv, bool up)
> +{
> +	int i = 0, stage = 0;
> +	int target = 7;
> +	/* Enable/Reduce HPL/R main output stage step by step */
> +	for (i = 0; i <= target; i++) {

double 'i` initialization.

> +		stage = up ? i : target - i;
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
> +				   HPLOUT_STG_CTRL_VAUDP15_MASK,
> +				   stage << HPLOUT_STG_CTRL_VAUDP15_SFT);
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON1,
> +				   HPROUT_STG_CTRL_VAUDP15_MASK,
> +				   stage << HPROUT_STG_CTRL_VAUDP15_SFT);
> +		usleep_range(600, 700);
> +	}
> +}
> +
> +static void hp_aux_feedback_loop_gain_ramp(struct mt6357_priv *priv, bool up)
> +{
> +	int i = 0, stage = 0;
> +	/* Reduce HP aux feedback loop gain step by step */
> +	for (i = 0; i <= 0xf; i++) {

same

> +		stage = up ? i : 0xf - i;
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON6,
> +				   HP_AUX_LOOP_GAIN_MASK, stage << HP_AUX_LOOP_GAIN_SFT);
> +		usleep_range(600, 700);
> +	}
> +}
> +
> +static void hp_pull_down(struct mt6357_priv *priv, bool enable)
> +{
> +	if (enable)
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON2,
> +				   HPP_SHORT_2VCM_VAUDP15_MASK, HPP_SHORT_2VCM_VAUDP15_ENABLE);
> +	else
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON2,
> +				   HPP_SHORT_2VCM_VAUDP15_MASK, HPP_SHORT_2VCM_VAUDP15_DISABLE);
> +}
> +
> +static bool is_valid_hp_pga_idx(int reg_idx)
> +{
> +	return (reg_idx >= DL_GAIN_8DB && reg_idx <= DL_GAIN_N_12DB) || reg_idx == DL_GAIN_N_40DB;
> +}
> +
> +static void volume_ramp(struct mt6357_priv *priv, int lfrom, int lto,
> +			int rfrom, int rto, unsigned int reg_addr)
> +{
> +	int lcount, rcount, sleep = 0;
> +
> +	if (!is_valid_hp_pga_idx(lfrom) || !is_valid_hp_pga_idx(lto))
> +		pr_debug("%s(), invalid left volume index, from %d, to %d\n",
> +			 __func__, lfrom, lto);
> +
> +	if (!is_valid_hp_pga_idx(rfrom) || !is_valid_hp_pga_idx(rto))
> +		pr_debug("%s(), invalid right volume index, from %d, to %d\n",
> +			 __func__, rfrom, rto);
> +
> +	if (lto > lfrom)
> +		lcount = 1;
> +	else
> +		lcount = -1;
> +
> +	if (rto > rfrom)
> +		rcount = 1;
> +	else
> +		rcount = -1;
> +
> +	while ((lto != lfrom) || (rto != rfrom)) {
> +		if (lto != lfrom) {
> +			lfrom += lcount;
> +			if (is_valid_hp_pga_idx(lfrom)) {
> +				regmap_update_bits(priv->regmap, reg_addr, DL_GAIN_REG_LEFT_MASK,
> +						   lfrom << DL_GAIN_REG_LEFT_SHIFT);
> +				sleep = 1;
> +			}
> +		}
> +		if (rto != rfrom) {
> +			rfrom += rcount;
> +			if (is_valid_hp_pga_idx(rfrom)) {
> +				regmap_update_bits(priv->regmap, reg_addr, DL_GAIN_REG_RIGHT_MASK,
> +						   rfrom << DL_GAIN_REG_RIGHT_SHIFT);
> +				sleep = 1;
> +			}
> +		}
> +		if (sleep)
> +			usleep_range(200, 300);
> +	}
> +}
> +
> +static void lo_volume_ramp(struct mt6357_priv *priv, int lfrom, int lto, int rfrom, int rto)
> +{
> +	volume_ramp(priv, lfrom, lto, rfrom, rto, MT6357_ZCD_CON1);
> +}
> +
> +static void hp_volume_ramp(struct mt6357_priv *priv, int lfrom, int lto, int rfrom, int rto)
> +{
> +	volume_ramp(priv, lfrom, lto, rfrom, rto, MT6357_ZCD_CON2);
> +}
> +
> +static void hs_volume_ramp(struct mt6357_priv *priv, int from, int to)
> +{
> +	volume_ramp(priv, from, to, 0, 0, MT6357_ZCD_CON3);
> +}
> +
> +static int mt6357_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
> +	if (ret < 0)
> +		return ret;
> +

regmap_read(priv->regmap, mc->reg, &reg)
switch (mc->reg) {
...
};

return 0;

> +	switch (mc->reg) {
> +	case MT6357_ZCD_CON2:
> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
> +		break;
> +	case MT6357_ZCD_CON1:
> +		regmap_read(priv->regmap, MT6357_ZCD_CON1, &reg);
> +		priv->ana_gain[ANALOG_VOLUME_LINEOUTL] =
> +			(reg & AUD_LOL_GAIN_MASK) >> AUD_LOL_GAIN_SFT;
> +		priv->ana_gain[ANALOG_VOLUME_LINEOUTR] =
> +			(reg & AUD_LOR_GAIN_MASK) >> AUD_LOR_GAIN_SFT;
> +		break;
> +	case MT6357_ZCD_CON3:
> +		regmap_read(priv->regmap, MT6357_ZCD_CON3, &reg);
> +		priv->ana_gain[ANALOG_VOLUME_HSOUT] =
> +			(reg & AUD_HS_GAIN_MASK) >> AUD_HS_GAIN_SFT;
> +		break;
> +	case MT6357_AUDENC_ANA_CON0:
> +	case MT6357_AUDENC_ANA_CON1:
> +		regmap_read(priv->regmap, MT6357_AUDENC_ANA_CON0, &reg);
> +		priv->ana_gain[ANALOG_VOLUME_MIC1] =
> +			(reg & AUDPREAMPLGAIN_MASK) >> AUDPREAMPLGAIN_SFT;
> +		regmap_read(priv->regmap, MT6357_AUDENC_ANA_CON1, &reg);
> +		priv->ana_gain[ANALOG_VOLUME_MIC2] =
> +			(reg & AUDPREAMPRGAIN_MASK) >> AUDPREAMPRGAIN_SFT;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +

..snip..

> +
> +static int adc_enable_event(struct snd_soc_dapm_widget *w,
> +			    struct snd_kcontrol *kcontrol,
> +			    int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> +
> +	dev_dbg(priv->dev, "%s(), event = 0x%x\n", __func__, event);
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		/* enable aud_pad TX fifos */
> +		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
> +				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
> +				   AUD_PAD_TX_FIFO_NORMAL_PATH_ENABLE);
> +		/* UL turn on */
> +		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
> +				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_ENABLE);
> +		/* Wait to avoid any pop noises */
> +		msleep(100);
> +		//set the mic gains to the stored values

Keep the comments style consistent please.

> +		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, AUDPREAMPLGAIN_MASK,
> +				   priv->ana_gain[ANALOG_VOLUME_MIC1] << AUDPREAMPLGAIN_SFT);
> +		regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, AUDPREAMPRGAIN_MASK,
> +				   priv->ana_gain[ANALOG_VOLUME_MIC2] << AUDPREAMPRGAIN_SFT);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		/* UL turn off */
> +		regmap_update_bits(priv->regmap, MT6357_AFE_UL_SRC_CON0_L,
> +				   UL_SRC_ON_TMP_CTL_MASK, UL_SRC_DISABLE);
> +		/* disable aud_pad TX fifos */
> +		regmap_update_bits(priv->regmap, MT6357_AFE_AUD_PAD_TOP,
> +				   AUD_PAD_TX_FIFO_NORMAL_PATH_MASK,
> +				   AUD_PAD_TX_FIFO_NORMAL_PATH_DISABLE);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

..snip..

> +
> +static int lol_mux_event(struct snd_soc_dapm_widget *w,
> +			 struct snd_kcontrol *kcontrol,
> +			 int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> +
> +	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		/* Set LO STB enhance circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
> +				   AUD_LOLOUT_STB_ENH_VAUDP15_MASK,
> +				   AUD_LOLOUT_STB_ENH_VAUDP15_ENABLE);
> +		/* Enable LO driver bias circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
> +				   AUD_LOL_PWRUP_BIAS_VAUDP15_MASK,
> +				   AUD_LOL_PWRUP_BIAS_VAUDP15_ENABLE);
> +		/* Enable LO driver core circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
> +				   AUD_LOL_PWRUP_VAUDP15_MASK, AUD_LOL_PWRUP_VAUDP15_ENABLE);
> +		/* Set LOL gain to normal gain step by step */
> +		lo_volume_ramp(priv, DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_LINEOUTL],
> +			       DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_LINEOUTR]);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +

Drop extra blank line.

> +		/* decrease LOL gain to minimum gain step by step */
> +		lo_volume_ramp(priv, priv->ana_gain[ANALOG_VOLUME_LINEOUTL], DL_GAIN_N_40DB,
> +			       priv->ana_gain[ANALOG_VOLUME_LINEOUTR], DL_GAIN_N_40DB);
> +		/* Disable LO driver core circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
> +				   AUD_LOL_PWRUP_VAUDP15_MASK, AUD_LOL_PWRUP_VAUDP15_DISABLE);
> +		/* Disable LO driver bias circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
> +				   AUD_LOL_PWRUP_BIAS_VAUDP15_MASK,
> +				   AUD_LOL_PWRUP_BIAS_VAUDP15_DISABLE);
> +		/* Clear LO STB enhance circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON4,
> +				   AUD_LOLOUT_STB_ENH_VAUDP15_MASK,
> +				   AUD_LOLOUT_STB_ENH_VAUDP15_DISABLE);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hs_mux_event(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *kcontrol,
> +			int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> +
> +	dev_dbg(priv->dev, "%s(), event 0x%x\n", __func__, event);
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +
> +		/* Set HS STB enhance circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
> +				   AUD_HSOUT_STB_ENH_VAUDP15_MASK,
> +				   AUD_HSOUT_STB_ENH_VAUDP15_ENABLE);
> +		/* Enable HS driver bias circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
> +				   AUD_HS_PWRUP_BIAS_VAUDP15_MASK,
> +				   AUD_HS_PWRUP_BIAS_VAUDP15_ENABLE);
> +		/* Enable HS driver core circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
> +				   AUD_HS_PWRUP_VAUDP15_MASK, AUD_HS_PWRUP_VAUDP15_ENABLE);
> +		/* Set HS gain to normal gain step by step */
> +		hs_volume_ramp(priv, DL_GAIN_N_40DB, priv->ana_gain[ANALOG_VOLUME_HSOUT]);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +

same

> +		/* decrease HS gain to minimum gain step by step */
> +		hs_volume_ramp(priv,  priv->ana_gain[ANALOG_VOLUME_HSOUT], DL_GAIN_N_40DB);
> +		/* Disable HS driver core circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
> +				   AUD_HS_PWRUP_VAUDP15_MASK, AUD_HS_PWRUP_VAUDP15_DISABLE);
> +		/* Disable HS driver bias circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
> +				   AUD_HS_PWRUP_BIAS_VAUDP15_MASK,
> +				   AUD_HS_PWRUP_BIAS_VAUDP15_ENABLE);
> +		/* Clear HS STB enhance circuits */
> +		regmap_update_bits(priv->regmap, MT6357_AUDDEC_ANA_CON3,
> +				   AUD_HSOUT_STB_ENH_VAUDP15_MASK,
> +				   AUD_HSOUT_STB_ENH_VAUDP15_DISABLE);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

..snip..

> +
> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +	unsigned int val;
> +
> +	pr_debug("%s() reg = 0x%x", __func__, reg);

I'm not sure that you really need that pr_debug()....

> +	regmap_read(priv->regmap, reg, &val);
> +	return val;
> +}
> +
> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	pr_debug("%s() reg = 0x%x  value= 0x%x\n", __func__, reg, value);

...nor this one.

> +	regmap_update_bits(priv->regmap, reg, 0xffff, value);
> +	return 0;

return regmap_update_bits(...);

> +}
> +
> +static const struct snd_soc_component_driver mt6357_soc_component_driver = {
> +	.probe = mt6357_codec_probe,
> +	.read = mt6357_read,
> +	.write = mt6357_write,
> +	.controls = mt6357_controls,
> +	.num_controls = ARRAY_SIZE(mt6357_controls),
> +	.dapm_widgets = mt6357_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(mt6357_dapm_widgets),
> +	.dapm_routes = mt6357_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(mt6357_dapm_routes),
> +};
> +
> +static void mt6357_parse_dt(struct mt6357_priv *priv)
> +{
> +	int ret, voltage_index;
> +	u32 micbias_voltage_index = 0;
> +	struct device *dev = priv->dev;
> +
> +	priv->pull_down_needed = false;
> +	if (of_property_read_bool(dev->of_node, "mediatek,hp-pull-down"))
> +		priv->pull_down_needed =  true;
> +
> +	micbias_voltage_index = MT6357_MICBIAS0_DEFAULT_VOLTAGE_INDEX;
> +	ret = of_property_read_u32(dev->of_node, "mediatek,micbias0-microvolt",  &voltage_index);
> +	if (!ret)
> +		micbias_voltage_index = voltage_index;
> +
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON8, AUD_MICBIAS0_VREF_MASK,
> +			   micbias_voltage_index << AUD_MICBIAS0_VREF_SFT);
> +
> +	micbias_voltage_index = MT6357_MICBIAS1_DEFAULT_VOLTAGE_INDEX;
> +	ret = of_property_read_u32(dev->of_node, "mediatek,micbias1-microvolt",  &voltage_index);
> +	if (!ret)
> +		micbias_voltage_index = voltage_index;
> +
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON9, AUD_MICBIAS1_VREF_MASK,
> +			   micbias_voltage_index << AUD_MICBIAS1_VREF_SFT);
> +}
> +
> +static int mt6357_platform_driver_probe(struct platform_device *pdev)
> +{
> +	struct mt6357_priv *priv;
> +	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);

	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
	struct mt6357_priv *priv;
	int ret;

looks better :-)


> +	int ret;
> +
> +	ret = devm_regulator_get_enable(&pdev->dev, "vaud28");
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to enable vaud28 regulator\n");
> +
> +	priv = devm_kzalloc(&pdev->dev,
> +			    sizeof(struct mt6357_priv),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&pdev->dev, priv);
> +	priv->dev = &pdev->dev;
> +
> +	priv->regmap = mt6397->regmap;
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	mt6357_parse_dt(priv);
> +
> +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> +
> +	return devm_snd_soc_register_component(&pdev->dev,
> +					       &mt6357_soc_component_driver,
> +					       mtk_6357_dai_codecs,
> +					       ARRAY_SIZE(mtk_6357_dai_codecs));
> +}
> +
> +static const struct of_device_id mt6357_of_match[] = {
> +	{.compatible = "mediatek,mt6357-sound",},
> +	{}

{ /* sentinel */ }

> +};
> +MODULE_DEVICE_TABLE(of, mt6357_of_match);
> +
> +static struct platform_driver mt6357_platform_driver = {
> +	.driver = {
> +		   .name = "mt6357-sound",
> +		   .of_match_table = mt6357_of_match,
> +		   },
> +	.probe = mt6357_platform_driver_probe,
> +};
> +
> +module_platform_driver(mt6357_platform_driver)
> +
> +MODULE_DESCRIPTION("MT6357 ALSA SoC codec driver");
> +MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
> +MODULE_LICENSE("GPL");


Cheers,
Angelo


