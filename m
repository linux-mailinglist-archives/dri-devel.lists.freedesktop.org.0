Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B2868B40
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3802510E8B6;
	Tue, 27 Feb 2024 08:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nvO1rl9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED5010E8B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9E2BBCE1B43;
 Tue, 27 Feb 2024 08:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAD7C433F1;
 Tue, 27 Feb 2024 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709023869;
 bh=h5NrJoJ65Ldmd4pXd19Xip1fAi1vJozZnu4yB0rhOKU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nvO1rl9BFL1GF6+1O/Mg3ZGUP6T/tkB5O2/tbLx88YhryGDVBpVko+KyVsekGpuQh
 oyZMSRztl48hKmRCoF0Wm4V8gcOs3Ps7kochq/L8DJoSsxbFZidwsmBa9a5SS6alWp
 u1+ENRUTfd3dGM55QLqxCDlzxgvWYfVHs5iqLgtAc1+MBL7g/yDayqXa84DZVjEAYW
 ZAvotQIIqC8JgsLap4TmFIEZ3T5XPQj1c1BMfu1QupO41HkBfYhB4HDm+qDxZ4Nyr6
 bnxnPM1lNB76CU4KkEaiHsxOQHpSanxP2yvQkNv/ZqS0aUM/kZFJ1JIwT4rIsFj1wC
 F3o3qCki7xgfw==
Message-ID: <0a7da896-25bb-41c0-8c0c-bb28184f4bba@kernel.org>
Date: Tue, 27 Feb 2024 09:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] ASoC: mediatek: mt8365: Add platform driver
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-11-4fa1cea1667f@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240226-audio-i350-v1-11-4fa1cea1667f@baylibre.com>
Content-Type: text/plain; charset=UTF-8
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

On 26/02/2024 15:01, Alexandre Mergnat wrote:
> Add mt8365 platform driver.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

...

> +	memif->substream = substream;
> +
> +	snd_pcm_hw_constraint_step(substream->runtime, 0,
> +		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
> +
> +	snd_soc_set_runtime_hwparams(substream, mtk_afe_hardware);
> +
> +	ret = snd_pcm_hw_constraint_integer(runtime,
> +		SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0)
> +		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
> +
> +	mt8365_afe_enable_main_clk(afe);
> +	return ret;
> +}
> +
> +static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	int memif_num = snd_soc_rtd_to_cpu(rtd, 0)->id;
> +	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
> +
> +	dev_dbg(afe->dev, "%s %s\n", __func__, memif->data->name);

Drop trace-like prints. Tracing is for this. Before upstreaming driver
from vendor repository, such stuff should be cleaned.


> +
> +	memif->substream = NULL;
> +
> +	mt8365_afe_disable_main_clk(afe);
> +}
> +
> +static int mt8365_afe_fe_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	int dai_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
> +	struct mt8365_control_data *ctrl_data = &afe_priv->ctrl_data;
> +	struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
> +	struct mt8365_fe_dai_data *fe_data = &afe_priv->fe_data[dai_id];
> +	const size_t request_size = params_buffer_bytes(params);
> +	unsigned int channels = params_channels(params);
> +	unsigned int rate = params_rate(params);
> +	int ret, fs = 0;
> +	unsigned int base_end_offset = 8;
> +
> +	dev_info(afe->dev,
> +		"%s %s period = %d rate = %d channels = %d\n",
> +		__func__, memif->data->name, params_period_size(params),
> +		rate, channels);
> +
> +	if (dai_id == MT8365_AFE_MEMIF_VUL2) {
> +		if (!ctrl_data->bypass_cm1)
> +			/* configure cm1 */
> +			mt8365_afe_configure_cm(afe,
> +				MT8365_CM1, channels, rate);
> +		else
> +			regmap_update_bits(afe->regmap, AFE_CM1_CON0,
> +				CM_AFE_CM1_VUL_SEL, CM_AFE_CM1_VUL_SEL);
> +	} else if (dai_id == MT8365_AFE_MEMIF_TDM_IN) {
> +		if (!ctrl_data->bypass_cm2)
> +			/* configure cm2 */
> +			mt8365_afe_configure_cm(afe,
> +				MT8365_CM2, channels, rate);
> +		else
> +			regmap_update_bits(afe->regmap, AFE_CM2_CON0,
> +				CM_AFE_CM2_TDM_SEL, ~CM_AFE_CM2_TDM_SEL);
> +
> +		base_end_offset = 4;
> +	}
> +
> +	if (request_size > fe_data->sram_size) {
> +		ret = snd_pcm_lib_malloc_pages(substream, request_size);
> +		if (ret < 0) {
> +			dev_err(afe->dev,
> +				"%s %s malloc pages %zu bytes failed %d\n",
> +				__func__, memif->data->name, request_size, ret);
> +			return ret;
> +		}
> +
> +		fe_data->use_sram = false;
> +
> +		mt8365_afe_emi_clk_on(afe);
> +	} else {
> +		struct snd_dma_buffer *dma_buf = &substream->dma_buffer;
> +
> +		dma_buf->dev.type = SNDRV_DMA_TYPE_DEV;
> +		dma_buf->dev.dev = substream->pcm->card->dev;
> +		dma_buf->area = (unsigned char *)fe_data->sram_vir_addr;
> +		dma_buf->addr = fe_data->sram_phy_addr;
> +		dma_buf->bytes = request_size;
> +		snd_pcm_set_runtime_buffer(substream, dma_buf);
> +
> +		fe_data->use_sram = true;
> +	}
> +
> +	memif->phys_buf_addr = lower_32_bits(substream->runtime->dma_addr);
> +	memif->buffer_size = substream->runtime->dma_bytes;
> +
> +	/* start */
> +	regmap_write(afe->regmap, memif->data->reg_ofs_base,
> +		memif->phys_buf_addr);
> +	/* end */
> +	regmap_write(afe->regmap,
> +		memif->data->reg_ofs_base + base_end_offset,
> +		memif->phys_buf_addr + memif->buffer_size - 1);
> +
> +	/* set channel */
> +	if (memif->data->mono_shift >= 0) {
> +		unsigned int mono = (params_channels(params) == 1) ? 1 : 0;
> +
> +		if (memif->data->mono_reg < 0)
> +			dev_info(afe->dev, "%s mono_reg is NULL\n", __func__);
> +		else
> +			regmap_update_bits(afe->regmap, memif->data->mono_reg,
> +				1 << memif->data->mono_shift,
> +				mono << memif->data->mono_shift);
> +	}
> +
> +	/* set rate */
> +	if (memif->data->fs_shift < 0)
> +		return 0;
> +
> +	fs = afe->memif_fs(substream, params_rate(params));
> +
> +	if (fs < 0)
> +		return -EINVAL;
> +
> +	if (memif->data->fs_reg < 0)
> +		dev_info(afe->dev, "%s fs_reg is NULL\n", __func__);
> +	else
> +		regmap_update_bits(afe->regmap, memif->data->fs_reg,
> +			memif->data->fs_maskbit << memif->data->fs_shift,
> +			fs << memif->data->fs_shift);
> +
> +	return 0;
> +}
> +
> +static int mt8365_afe_fe_hw_free(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	int dai_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
> +	struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
> +	struct mt8365_fe_dai_data *fe_data = &afe_priv->fe_data[dai_id];
> +	int ret = 0;
> +
> +	dev_dbg(afe->dev, "%s %s\n", __func__, memif->data->name);

Drop

> +
> +	if (fe_data->use_sram) {
> +		snd_pcm_set_runtime_buffer(substream, NULL);
> +	} else {
> +		ret = snd_pcm_lib_free_pages(substream);
> +
> +		mt8365_afe_emi_clk_off(afe);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mt8365_afe_fe_prepare(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	int dai_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
> +	struct mtk_base_afe_memif *memif = &afe->memif[dai_id];
> +
> +	/* set format */
> +	if (memif->data->hd_reg >= 0) {
> +		switch (substream->runtime->format) {
> +		case SNDRV_PCM_FORMAT_S16_LE:
> +			regmap_update_bits(afe->regmap, memif->data->hd_reg,
> +				3 << memif->data->hd_shift,
> +				0 << memif->data->hd_shift);
> +			break;
> +		case SNDRV_PCM_FORMAT_S32_LE:
> +			regmap_update_bits(afe->regmap, memif->data->hd_reg,
> +				3 << memif->data->hd_shift,
> +				3 << memif->data->hd_shift);
> +
> +			if (dai_id == MT8365_AFE_MEMIF_TDM_IN) {
> +				regmap_update_bits(afe->regmap,
> +					memif->data->hd_reg,
> +					3 << memif->data->hd_shift,
> +					1 << memif->data->hd_shift);
> +				regmap_update_bits(afe->regmap,
> +					memif->data->hd_reg,
> +					1 << memif->data->hd_align_mshift,
> +					1 << memif->data->hd_align_mshift);
> +			}
> +			break;
> +		case SNDRV_PCM_FORMAT_S24_LE:
> +			regmap_update_bits(afe->regmap, memif->data->hd_reg,
> +				3 << memif->data->hd_shift,
> +				1 << memif->data->hd_shift);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	mt8365_afe_irq_direction_enable(afe,
> +		memif->irq_usage,
> +		MT8365_AFE_IRQ_DIR_MCU);
> +
> +	return 0;
> +}
> +
> +int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	int dai_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
> +	struct mt8365_control_data *ctrl_data = &afe_priv->ctrl_data;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		/* enable channel merge */
> +		if (dai_id == MT8365_AFE_MEMIF_VUL2 &&
> +		    !ctrl_data->bypass_cm1) {
> +			regmap_update_bits(afe->regmap,
> +				AFE_CM1_CON0,
> +				CM_AFE_CM_ON, CM_AFE_CM_ON);
> +		} else if (dai_id == MT8365_AFE_MEMIF_TDM_IN &&
> +			   !ctrl_data->bypass_cm2) {
> +			regmap_update_bits(afe->regmap,
> +				AFE_CM2_CON0,
> +				CM_AFE_CM_ON, CM_AFE_CM_ON);
> +		}
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +		/* disable channel merge */
> +		if (dai_id == MT8365_AFE_MEMIF_VUL2 &&
> +		    !ctrl_data->bypass_cm1) {
> +			regmap_update_bits(afe->regmap,
> +				AFE_CM1_CON0,
> +				CM_AFE_CM_ON, ~CM_AFE_CM_ON);
> +		} else if (dai_id == MT8365_AFE_MEMIF_TDM_IN &&
> +			   !ctrl_data->bypass_cm2) {
> +			regmap_update_bits(afe->regmap,
> +				AFE_CM2_CON0,
> +				CM_AFE_CM_ON, ~CM_AFE_CM_ON);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return mtk_afe_fe_trigger(substream, cmd, dai);
> +}
> +
> +static int mt8365_afe_hw_gain1_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +
> +	mt8365_afe_enable_main_clk(afe);
> +	return 0;
> +}
> +
> +static void mt8365_afe_hw_gain1_shutdown(struct snd_pcm_substream *substream,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_be_dai_data *be =
> +		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
> +
> +	const unsigned int stream = substream->stream;

Why do you const local scalars? What is the point of this variable anyway?

> +
> +	if (be->prepared[stream]) {
> +		regmap_update_bits(afe->regmap, AFE_GAIN1_CON0,
> +			AFE_GAIN1_CON0_EN_MASK, 0);
> +		be->prepared[stream] = false;
> +	}
> +	mt8365_afe_disable_main_clk(afe);
> +}
> +
> +static int mt8365_afe_hw_gain1_prepare(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_pcm_runtime * const runtime = substream->runtime;
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_be_dai_data *be =
> +		&afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
> +
> +	const unsigned int rate = runtime->rate;
> +	const unsigned int stream = substream->stream;

So this const is everywhere? How does it change it from code safety? No
one expects to overwrite such variables anyway, so there is no increase
in readability, either.

> +	int fs;
> +	unsigned int val1 = 0, val2 = 0;
> +
> +	if (be->prepared[stream]) {
> +		dev_info(afe->dev, "%s prepared already\n", __func__);
> +		return 0;
> +	}
> +
> +	fs = mt8365_afe_fs_timing(rate);
> +	regmap_update_bits(afe->regmap, AFE_GAIN1_CON0,
> +		AFE_GAIN1_CON0_MODE_MASK, (unsigned int)fs<<4);
> +
> +	regmap_read(afe->regmap, AFE_GAIN1_CON1, &val1);
> +	regmap_read(afe->regmap, AFE_GAIN1_CUR, &val2);
> +	if ((val1 & AFE_GAIN1_CON1_MASK) != (val2 & AFE_GAIN1_CUR_MASK))
> +		regmap_update_bits(afe->regmap, AFE_GAIN1_CUR,
> +		AFE_GAIN1_CUR_MASK, val1);
> +
> +	regmap_update_bits(afe->regmap, AFE_GAIN1_CON0,
> +		AFE_GAIN1_CON0_EN_MASK, 1);
> +	be->prepared[stream] = true;
> +
> +	return 0;
> +}
> +
> +static const struct snd_pcm_hardware mt8365_hostless_hardware = {
> +	.info = (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
> +		 SNDRV_PCM_INFO_MMAP_VALID),
> +	.period_bytes_min = 256,
> +	.period_bytes_max = 4 * 48 * 1024,
> +	.periods_min = 2,
> +	.periods_max = 256,
> +	.buffer_bytes_max = 8 * 48 * 1024,
> +	.fifo_size = 0,
> +};
> +
> +/* dai ops */
> +static int mtk_dai_hostless_startup(struct snd_pcm_substream *substream,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	int ret;
> +
> +	snd_soc_set_runtime_hwparams(substream, &mt8365_hostless_hardware);
> +
> +	ret = snd_pcm_hw_constraint_integer(runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0)
> +		dev_info(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
> +	return ret;
> +}
> +
> +/* FE DAIs */
> +static const struct snd_soc_dai_ops mt8365_afe_fe_dai_ops = {
> +	.startup	= mt8365_afe_fe_startup,
> +	.shutdown	= mt8365_afe_fe_shutdown,
> +	.hw_params	= mt8365_afe_fe_hw_params,
> +	.hw_free	= mt8365_afe_fe_hw_free,
> +	.prepare	= mt8365_afe_fe_prepare,
> +	.trigger	= mt8365_afe_fe_trigger,
> +};
> +
> +static const struct snd_soc_dai_ops mt8365_dai_hostless_ops = {
> +	.startup = mtk_dai_hostless_startup,
> +};
> +

...

> +static int mt8365_afe_cm2_io_input_mux_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	ucontrol->value.integer.value[0] = mCM2Input;
> +
> +	return 0;
> +}
> +
> +static int mt8365_afe_cm2_io_input_mux_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)

Run checkpatch --strict

> +{
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(comp);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
> +
> +	mCM2Input = ucontrol->value.enumerated.item[0];
> +
> +	afe_priv->cm2_mux_input = mCM2Input;
> +	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> +
> +	return ret;
> +}
> +

...

> +
> +static const struct regmap_config mt8365_afe_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = MAX_REGISTER,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static irqreturn_t mt8365_afe_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_base_afe *afe = dev_id;
> +	unsigned int reg_value;
> +	unsigned int mcu_irq_mask;
> +	int i, ret;
> +
> +	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_STATUS, &reg_value);
> +	if (ret) {
> +		dev_err(afe->dev, "%s irq status err\n", __func__);

I can imagine happy user seeing flooded dmesg on each IRQ with these
messages...

> +		reg_value = AFE_IRQ_STATUS_BITS;
> +		goto err_irq;
> +	}
> +
> +	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &mcu_irq_mask);
> +	if (ret) {
> +		dev_err(afe->dev, "%s irq mcu_en err\n", __func__);
> +		reg_value = AFE_IRQ_STATUS_BITS;
> +		goto err_irq;
> +	}
> +
> +	/* only clr cpu irq */
> +	reg_value &= mcu_irq_mask;
> +
> +	for (i = 0; i < MT8365_AFE_MEMIF_NUM; i++) {
> +		struct mtk_base_afe_memif *memif = &afe->memif[i];
> +		struct mtk_base_afe_irq *mcu_irq;
> +
> +		if (memif->irq_usage < 0)
> +			continue;
> +
> +		mcu_irq = &afe->irqs[memif->irq_usage];
> +
> +		if (!(reg_value & (1 << mcu_irq->irq_data->irq_clr_shift)))
> +			continue;
> +
> +		snd_pcm_period_elapsed(memif->substream);
> +	}
> +
> +err_irq:
> +	/* clear irq */
> +	regmap_write(afe->regmap, AFE_IRQ_MCU_CLR,
> +		reg_value & AFE_IRQ_STATUS_BITS);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int __maybe_unused mt8365_afe_runtime_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int mt8365_afe_runtime_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int __maybe_unused mt8365_afe_suspend(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +	struct regmap *regmap = afe->regmap;
> +	int i;
> +
> +	mt8365_afe_enable_main_clk(afe);
> +
> +	if (!afe->reg_back_up)
> +		afe->reg_back_up =
> +			devm_kcalloc(dev, afe->reg_back_up_list_num,
> +				     sizeof(unsigned int), GFP_KERNEL);
> +
> +	for (i = 0; i < afe->reg_back_up_list_num; i++)
> +		regmap_read(regmap, afe->reg_back_up_list[i],
> +			    &afe->reg_back_up[i]);
> +
> +	mt8365_afe_disable_main_clk(afe);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mt8365_afe_resume(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +	struct regmap *regmap = afe->regmap;
> +	int i = 0;
> +
> +	if (!afe->reg_back_up) {
> +		dev_dbg(dev, "%s no reg_backup\n", __func__);
> +		return 0;
> +	}
> +
> +	mt8365_afe_enable_main_clk(afe);
> +
> +	for (i = 0; i < afe->reg_back_up_list_num; i++)
> +		regmap_write(regmap, afe->reg_back_up_list[i],
> +				 afe->reg_back_up[i]);
> +
> +	mt8365_afe_disable_main_clk(afe);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mt8365_afe_dev_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +
> +	dev_dbg(afe->dev, "%s suspend %d %d >>\n", __func__,
> +		pm_runtime_status_suspended(dev), afe->suspended);

Drop silly trace-like prints. Tracing is for this.

> +
> +	if (pm_runtime_status_suspended(dev) || afe->suspended)
> +		return 0;
> +
> +	mt8365_afe_suspend(dev);
> +
> +	afe->suspended = true;
> +
> +	dev_dbg(afe->dev, "%s <<\n", __func__);

Drop silly trace-like prints. Tracing is for this.

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mt8365_afe_dev_runtime_resume(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +
> +	dev_dbg(afe->dev, "%s suspend %d %d >>\n", __func__,
> +		pm_runtime_status_suspended(dev), afe->suspended);

Drop silly trace-like prints. Tracing is for this.

> +
> +	if (pm_runtime_status_suspended(dev) || !afe->suspended)
> +		return 0;
> +
> +	mt8365_afe_resume(dev);
> +
> +	afe->suspended = false;
> +
> +	dev_dbg(afe->dev, "%s <<\n", __func__);

Drop silly trace-like prints. Tracing is for this.

> +
> +	return 0;
> +}
> +
> +static int mt8365_afe_init_registers(struct mtk_base_afe *afe)
> +{
> +	size_t i;
> +
> +	static struct {
> +		unsigned int reg;
> +		unsigned int mask;
> +		unsigned int val;
> +	} init_regs[] = {
> +		{ AFE_CONN_24BIT, GENMASK(31, 0), GENMASK(31, 0) },
> +		{ AFE_CONN_24BIT_1, GENMASK(21, 0), GENMASK(21, 0) },
> +	};
> +
> +	mt8365_afe_enable_main_clk(afe);
> +
> +	for (i = 0; i < ARRAY_SIZE(init_regs); i++)
> +		regmap_update_bits(afe->regmap, init_regs[i].reg,
> +				   init_regs[i].mask, init_regs[i].val);
> +
> +	mt8365_afe_disable_main_clk(afe);
> +
> +	return 0;
> +}
> +
> +static int mt8365_afe_component_probe(struct snd_soc_component *component)
> +{
> +	return mtk_afe_add_sub_dai_control(component);
> +}
> +
> +static const struct snd_soc_component_driver mt8365_afe_component = {
> +	.name		= AFE_PCM_NAME,
> +	.probe		= mt8365_afe_component_probe,
> +	.pointer	= mtk_afe_pcm_pointer,
> +	.pcm_construct	= mtk_afe_pcm_new,
> +};
> +
> +static const struct snd_soc_component_driver mt8365_afe_pcm_component = {
> +	.name = "mt8365-afe-pcm-dai",
> +};
> +
> +static int mt8365_dai_memif_register(struct mtk_base_afe *afe)
> +{
> +	struct mtk_base_afe_dai *dai;
> +
> +	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +	if (!dai)
> +		return -ENOMEM;
> +
> +	list_add(&dai->list, &afe->sub_dais);
> +
> +	dai->dai_drivers = mt8365_memif_dai_driver;
> +	dai->num_dai_drivers = ARRAY_SIZE(mt8365_memif_dai_driver);
> +
> +	dai->dapm_widgets = mt8365_memif_widgets;
> +	dai->num_dapm_widgets = ARRAY_SIZE(mt8365_memif_widgets);
> +	dai->dapm_routes = mt8365_memif_routes;
> +	dai->num_dapm_routes = ARRAY_SIZE(mt8365_memif_routes);
> +	return 0;
> +}
> +
> +typedef int (*dai_register_cb)(struct mtk_base_afe *);
> +static const dai_register_cb dai_register_cbs[] = {
> +	mt8365_dai_pcm_register,
> +	mt8365_dai_i2s_register,
> +	mt8365_dai_adda_register,
> +	mt8365_dai_dmic_register,
> +	mt8365_dai_memif_register,
> +};
> +
> +static int mt8365_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct mtk_base_afe *afe;
> +	struct mt8365_afe_private *afe_priv;
> +	struct device *dev;
> +	int ret, i, sel_irq;
> +	unsigned int irq_id;
> +	struct resource *res;
> +
> +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, afe);
> +
> +	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
> +					  GFP_KERNEL);
> +	if (!afe->platform_priv)
> +		return -ENOMEM;
> +
> +	afe_priv = afe->platform_priv;
> +	afe->dev = &pdev->dev;
> +	dev = afe->dev;
> +
> +	spin_lock_init(&afe_priv->afe_ctrl_lock);
> +	mutex_init(&afe_priv->afe_clk_mutex);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);

Why not using helper combining these two?

> +	if (IS_ERR(afe->base_addr))
> +		return PTR_ERR(afe->base_addr);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (res) {
> +		afe_priv->afe_sram_vir_addr =
> +			devm_ioremap_resource(&pdev->dev, res);
> +		if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
> +			afe_priv->afe_sram_phy_addr = res->start;
> +			afe_priv->afe_sram_size = resource_size(res);
> +		}
> +	}
> +
> +	/* initial audio related clock */
> +	ret = mt8365_afe_init_audio_clk(afe);
> +	if (ret) {
> +		dev_err(afe->dev, "mt8365_afe_init_audio_clk fail\n");

return dev_err_probe()

> +		return ret;
> +	}
> +
> +	afe->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "top_audio_sel",
> +		afe->base_addr,	&mt8365_afe_regmap_config);
> +	if (IS_ERR(afe->regmap))
> +		return PTR_ERR(afe->regmap);
> +
> +	/* memif % irq initialize*/
> +	afe->memif_size = MT8365_AFE_MEMIF_NUM;
> +	afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
> +				  sizeof(*afe->memif), GFP_KERNEL);
> +	if (!afe->memif)
> +		return -ENOMEM;
> +
> +	afe->irqs_size = MT8365_AFE_IRQ_NUM;
> +	afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
> +				 sizeof(*afe->irqs), GFP_KERNEL);
> +	if (!afe->irqs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < afe->irqs_size; i++)
> +		afe->irqs[i].irq_data = &irq_data[i];
> +
> +	irq_id = platform_get_irq(pdev, 0);
> +	if (!irq_id) {

That does not look correct. 0 is valid. Look at help of this function.

> +		dev_err(afe->dev, "np %s no irq\n", afe->dev->of_node->name);

return dev_err_probe()

> +		return -ENXIO;
> +	}
> +	ret = devm_request_irq(afe->dev, irq_id, mt8365_afe_irq_handler,
> +			       0, "Afe_ISR_Handle", (void *)afe);
> +	if (ret) {
> +		dev_err(afe->dev, "could not request_irq\n");

return dev_err_probe()

> +		return ret;
> +	}
> +
> +	/* init sub_dais */
> +	INIT_LIST_HEAD(&afe->sub_dais);
> +
> +	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
> +		ret = dai_register_cbs[i](afe);
> +		if (ret) {
> +			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
> +				 i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* init dai_driver and component_driver */
> +	ret = mtk_afe_combine_sub_dai(afe);
> +	if (ret) {
> +		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
> +			 ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < afe->memif_size; i++) {
> +		afe->memif[i].data = &memif_data[i];
> +		sel_irq = memif_specified_irqs[i];
> +		if (sel_irq >= 0) {
> +			afe->memif[i].irq_usage = sel_irq;
> +			afe->memif[i].const_irq = 1;
> +			afe->irqs[sel_irq].irq_occupyed = true;
> +		} else {
> +			afe->memif[i].irq_usage = -1;
> +		}
> +	}
> +
> +	afe->mtk_afe_hardware = &mt8365_afe_hardware;
> +	afe->memif_fs = mt8365_memif_fs;
> +	afe->irq_fs = mt8365_irq_fs;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +	afe->reg_back_up_list = mt8365_afe_backup_list;
> +	afe->reg_back_up_list_num = ARRAY_SIZE(mt8365_afe_backup_list);
> +	afe->runtime_resume = mt8365_afe_runtime_resume;
> +	afe->runtime_suspend = mt8365_afe_runtime_suspend;
> +
> +	/* open afe pdn for dapm read/write audio register */
> +	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_AFE);
> +
> +	/* Set 26m parent clk */
> +	mt8365_afe_set_clk_parent(afe,
> +		afe_priv->clocks[MT8365_CLK_TOP_AUD_SEL],
> +		afe_priv->clocks[MT8365_CLK_CLK26M]);
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mt8365_afe_component, NULL, 0);
> +	if (ret) {
> +		dev_warn(dev, "err_platform\n");
> +		return ret;
> +	}
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mt8365_afe_pcm_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret) {
> +		dev_warn(dev, "err_dai_component\n");
> +		return ret;
> +	}
> +
> +	mt8365_afe_init_registers(afe);
> +
> +	dev_info(&pdev->dev, "MT8365 AFE driver initialized.\n");

Drop simple probe success messages everywhere. They are not needed and
they don't bring useful information.

Best regards,
Krzysztof

