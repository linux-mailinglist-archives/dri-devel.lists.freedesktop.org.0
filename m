Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8D8C9B33
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DD210E46D;
	Mon, 20 May 2024 10:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fnTq0/S0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCDC10E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716200838;
 bh=tS5sYB0+7Gk8B9F2jsELOxkdskf8VobS16Mob4/nSy4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fnTq0/S0Qo4fxxC2jqy5Jg+4Edj/97MWNMWRddW3wne8dCLXWjWkofMhAZ1SC4YHP
 6YcT2JIo1trbM1+E8SCX1V1+MSR0Hh97jWhp6VLeS6RqwHYHq6574iBZa3JfELuK3C
 znBP5w0fj3MkZubbMVrQS4KIn9f5GeaZf42XrG1JE+Yw5X0zOjN0dRu79+7m6FDKFa
 Asv7rZQwFTx8gVXgyiuaMqwFy3VJqAgxWVKM/+qnQoUCYp7r6MbPOylA++uqUiSsoT
 BvxoZpMm7JjrqYjcNn201biH+Qn0mZPc+qPQCBY930zN86xeSl9Lx/x7zJkEI6BHh3
 EzL5Uqm/7Fkfg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A0CD93782199;
 Mon, 20 May 2024 10:27:16 +0000 (UTC)
Message-ID: <4f4bf793-f7b2-411e-a8bd-fc2a21223c55@collabora.com>
Date: Mon, 20 May 2024 12:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/16] ASoC: mediatek: mt8365: Add I2S DAI support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-6-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-6-082b22186d4c@baylibre.com>
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

Il 26/04/24 19:22, Alexandre Mergnat ha scritto:
> Add I2S Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 854 +++++++++++++++++++++++++++++
>   1 file changed, 854 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> new file mode 100644
> index 000000000000..c12d75dfe215
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> @@ -0,0 +1,854 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek 8365 ALSA SoC Audio DAI I2S Control
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt8365-afe-clk.h"
> +#include "mt8365-afe-common.h"
> +
> +struct mtk_afe_i2s_priv {
> +	bool adda_link;
> +	int i2s_out_on_ref_cnt;
> +	int id;
> +	int low_jitter_en;
> +	int mclk_id;
> +	int share_i2s_id;
> +	unsigned int clk_id_in;
> +	unsigned int clk_id_in_m_sel;
> +	unsigned int clk_id_out;
> +	unsigned int clk_id_out_m_sel;
> +	unsigned int clk_in_mult;
> +	unsigned int clk_out_mult;
> +	unsigned int config_val_in;
> +	unsigned int config_val_out;
> +	unsigned int dynamic_bck;
> +	unsigned int reg_off_in;
> +	unsigned int reg_off_out;
> +};
> +
> +/* This enum is merely for mtk_afe_i2s_priv declare */
> +enum {
> +	DAI_I2S0 = 0,
> +	DAI_I2S3,
> +	DAI_I2S_NUM,
> +};
> +
> +static const struct mtk_afe_i2s_priv mt8365_i2s_priv[DAI_I2S_NUM] = {
> +	[DAI_I2S0] = {
> +		.id = MT8365_AFE_IO_I2S,
> +		.mclk_id = MT8365_I2S0_MCK,
> +		.share_i2s_id = -1,
> +		.clk_id_in = MT8365_CLK_AUD_I2S2_M,
> +		.clk_id_out = MT8365_CLK_AUD_I2S1_M,
> +		.clk_id_in_m_sel = MT8365_CLK_I2S2_M_SEL,
> +		.clk_id_out_m_sel = MT8365_CLK_I2S1_M_SEL,
> +		.clk_in_mult = 256,
> +		.clk_out_mult = 256,
> +		.adda_link = true,
> +		.config_val_out = AFE_I2S_CON1_I2S2_TO_PAD,
> +		.reg_off_in = AFE_I2S_CON2,
> +		.reg_off_out = AFE_I2S_CON1,
> +	},
> +	[DAI_I2S3] = {
> +		.id = MT8365_AFE_IO_2ND_I2S,
> +		.mclk_id = MT8365_I2S3_MCK,
> +		.share_i2s_id = -1,
> +		.clk_id_in = MT8365_CLK_AUD_I2S0_M,
> +		.clk_id_out = MT8365_CLK_AUD_I2S3_M,
> +		.clk_id_in_m_sel = MT8365_CLK_I2S0_M_SEL,
> +		.clk_id_out_m_sel = MT8365_CLK_I2S3_M_SEL,
> +		.clk_in_mult = 256,
> +		.clk_out_mult = 256,
> +		.adda_link = false,
> +		.config_val_in = AFE_I2S_CON_FROM_IO_MUX,
> +		.reg_off_in = AFE_I2S_CON,
> +		.reg_off_out = AFE_I2S_CON3,
> +	},
> +};
> +
> +static const u32 *get_iir_coef(unsigned int input_fs,
> +			       unsigned int output_fs, unsigned int *count)
> +{
> +#define RATIOVER 9
> +#define INV_COEF 10
> +#define NO_NEED 11

Can you please move those definitions to the top?
In that case, you should also rename those as IIR_RATIOVER IIR_INV_COEF IIR_NO_NEED

> +
> +	static const u32 IIR_COEF_48_TO_44p1[30] = {
> +		0x061fb0, 0x0bd256, 0x061fb0, 0xe3a3e6, 0xf0a300, 0x000003,
> +		0x0e416d, 0x1bb577, 0x0e416d, 0xe59178, 0xf23637, 0x000003,
> +		0x0c7d72, 0x189060, 0x0c7d72, 0xe96f09, 0xf505b2, 0x000003,
> +		0x126054, 0x249143, 0x126054, 0xe1fc0c, 0xf4b20a, 0x000002,
> +		0x000000, 0x323c85, 0x323c85, 0xf76d4e, 0x000000, 0x000002,
> +	};
> +
> +	static const u32 IIR_COEF_44p1_TO_32[42] = {
> +		0x0a6074, 0x0d237a, 0x0a6074, 0xdd8d6c, 0xe0b3f6, 0x000002,
> +		0x0e41f8, 0x128d48, 0x0e41f8, 0xefc14e, 0xf12d7a, 0x000003,
> +		0x0cfa60, 0x11e89c, 0x0cfa60, 0xf1b09e, 0xf27205, 0x000003,
> +		0x15b69c, 0x20e7e4, 0x15b69c, 0xea799a, 0xe9314a, 0x000002,
> +		0x0f79e2, 0x1a7064, 0x0f79e2, 0xf65e4a, 0xf03d8e, 0x000002,
> +		0x10c34f, 0x1ffe4b, 0x10c34f, 0x0bbecb, 0xf2bc4b, 0x000001,
> +		0x000000, 0x23b063, 0x23b063, 0x07335f, 0x000000, 0x000002,
> +	};
> +
> +	static const u32 IIR_COEF_48_TO_32[42] = {
> +		0x0a2a9b, 0x0a2f05, 0x0a2a9b, 0xe73873, 0xe0c525, 0x000002,
> +		0x0dd4ad, 0x0e765a, 0x0dd4ad, 0xf49808, 0xf14844, 0x000003,
> +		0x18a8cd, 0x1c40d0, 0x18a8cd, 0xed2aab, 0xe542ec, 0x000002,
> +		0x13e044, 0x1a47c4, 0x13e044, 0xf44aed, 0xe9acc7, 0x000002,
> +		0x1abd9c, 0x2a5429, 0x1abd9c, 0xff3441, 0xe0fc5f, 0x000001,
> +		0x0d86db, 0x193e2e, 0x0d86db, 0x1a6f15, 0xf14507, 0x000001,
> +		0x000000, 0x1f820c, 0x1f820c, 0x0a1b1f, 0x000000, 0x000002,
> +	};
> +
> +	static const u32 IIR_COEF_32_TO_16[48] = {
> +		0x122893, 0xffadd4, 0x122893, 0x0bc205, 0xc0ee1c, 0x000001,
> +		0x1bab8a, 0x00750d, 0x1bab8a, 0x06a983, 0xe18a5c, 0x000002,
> +		0x18f68e, 0x02706f, 0x18f68e, 0x0886a9, 0xe31bcb, 0x000002,
> +		0x149c05, 0x054487, 0x149c05, 0x0bec31, 0xe5973e, 0x000002,
> +		0x0ea303, 0x07f24a, 0x0ea303, 0x115ff9, 0xe967b6, 0x000002,
> +		0x0823fd, 0x085531, 0x0823fd, 0x18d5b4, 0xee8d21, 0x000002,
> +		0x06888e, 0x0acbbb, 0x06888e, 0x40b55c, 0xe76dce, 0x000001,
> +		0x000000, 0x2d31a9, 0x2d31a9, 0x23ba4f, 0x000000, 0x000001,
> +	};
> +
> +	static const u32 IIR_COEF_96_TO_44p1[48] = {
> +		0x08b543, 0xfd80f4, 0x08b543, 0x0e2332, 0xe06ed0, 0x000002,
> +		0x1b6038, 0xf90e7e, 0x1b6038, 0x0ec1ac, 0xe16f66, 0x000002,
> +		0x188478, 0xfbb921, 0x188478, 0x105859, 0xe2e596, 0x000002,
> +		0x13eff3, 0xffa707, 0x13eff3, 0x13455c, 0xe533b7, 0x000002,
> +		0x0dc239, 0x03d458, 0x0dc239, 0x17f120, 0xe8b617, 0x000002,
> +		0x0745f1, 0x05d790, 0x0745f1, 0x1e3d75, 0xed5f18, 0x000002,
> +		0x05641f, 0x085e2b, 0x05641f, 0x48efd0, 0xe3e9c8, 0x000001,
> +		0x000000, 0x28f632, 0x28f632, 0x273905, 0x000000, 0x000001,
> +	};
> +
> +	static const u32 IIR_COEF_44p1_TO_16[48] = {
> +		0x0998fb, 0xf7f925, 0x0998fb, 0x1e54a0, 0xe06605, 0x000002,
> +		0x0d828e, 0xf50f97, 0x0d828e, 0x0f41b5, 0xf0a999, 0x000003,
> +		0x17ebeb, 0xee30d8, 0x17ebeb, 0x1f48ca, 0xe2ae88, 0x000002,
> +		0x12fab5, 0xf46ddc, 0x12fab5, 0x20cc51, 0xe4d068, 0x000002,
> +		0x0c7ac6, 0xfbd00e, 0x0c7ac6, 0x2337da, 0xe8028c, 0x000002,
> +		0x060ddc, 0x015b3e, 0x060ddc, 0x266754, 0xec21b6, 0x000002,
> +		0x0407b5, 0x04f827, 0x0407b5, 0x52e3d0, 0xe0149f, 0x000001,
> +		0x000000, 0x1f9521, 0x1f9521, 0x2ac116, 0x000000, 0x000001,
> +	};
> +
> +	static const u32 IIR_COEF_48_TO_16[48] = {
> +		0x0955ff, 0xf6544a, 0x0955ff, 0x2474e5, 0xe062e6, 0x000002,
> +		0x0d4180, 0xf297f4, 0x0d4180, 0x12415b, 0xf0a3b0, 0x000003,
> +		0x0ba079, 0xf4f0b0, 0x0ba079, 0x1285d3, 0xf1488b, 0x000003,
> +		0x12247c, 0xf1033c, 0x12247c, 0x2625be, 0xe48e0d, 0x000002,
> +		0x0b98e0, 0xf96d1a, 0x0b98e0, 0x27e79c, 0xe7798a, 0x000002,
> +		0x055e3b, 0xffed09, 0x055e3b, 0x2a2e2d, 0xeb2854, 0x000002,
> +		0x01a934, 0x01ca03, 0x01a934, 0x2c4fea, 0xee93ab, 0x000002,
> +		0x000000, 0x1c46c5, 0x1c46c5, 0x2d37dc, 0x000000, 0x000001,
> +	};
> +
> +	static const u32 IIR_COEF_96_TO_16[48] = {
> +		0x0805a1, 0xf21ae3, 0x0805a1, 0x3840bb, 0xe02a2e, 0x000002,
> +		0x0d5dd8, 0xe8f259, 0x0d5dd8, 0x1c0af6, 0xf04700, 0x000003,
> +		0x0bb422, 0xec08d9, 0x0bb422, 0x1bfccc, 0xf09216, 0x000003,
> +		0x08fde6, 0xf108be, 0x08fde6, 0x1bf096, 0xf10ae0, 0x000003,
> +		0x0ae311, 0xeeeda3, 0x0ae311, 0x37c646, 0xe385f5, 0x000002,
> +		0x044089, 0xfa7242, 0x044089, 0x37a785, 0xe56526, 0x000002,
> +		0x00c75c, 0xffb947, 0x00c75c, 0x378ba3, 0xe72c5f, 0x000002,
> +		0x000000, 0x0ef76e, 0x0ef76e, 0x377fda, 0x000000, 0x000001,
> +	};
> +
> +	static const struct {
> +		const u32 *coef;
> +		unsigned int cnt;
> +	} iir_coef_tbl_list[8] = {
> +		/* 0: 0.9188 */
> +		{ IIR_COEF_48_TO_44p1, ARRAY_SIZE(IIR_COEF_48_TO_44p1) },
> +		/* 1: 0.7256 */
> +		{ IIR_COEF_44p1_TO_32, ARRAY_SIZE(IIR_COEF_44p1_TO_32) },
> +		/* 2: 0.6667 */
> +		{ IIR_COEF_48_TO_32, ARRAY_SIZE(IIR_COEF_48_TO_32) },
> +		/* 3: 0.5 */
> +		{ IIR_COEF_32_TO_16, ARRAY_SIZE(IIR_COEF_32_TO_16) },
> +		/* 4: 0.4594 */
> +		{ IIR_COEF_96_TO_44p1, ARRAY_SIZE(IIR_COEF_96_TO_44p1) },
> +		/* 5: 0.3628 */
> +		{ IIR_COEF_44p1_TO_16, ARRAY_SIZE(IIR_COEF_44p1_TO_16) },
> +		/* 6: 0.3333 */
> +		{ IIR_COEF_48_TO_16, ARRAY_SIZE(IIR_COEF_48_TO_16) },
> +		/* 7: 0.1667 */
> +		{ IIR_COEF_96_TO_16, ARRAY_SIZE(IIR_COEF_96_TO_16) },
> +	};
> +
> +	static const u32 freq_new_index[16] = {
> +		0, 1, 2, 99, 3, 4, 5, 99, 6, 7, 8, 9, 10, 11, 12, 99
> +	};
> +
> +	static const u32 iir_coef_tbl_matrix[13][13] = {
> +		{/*0*/
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*1*/
> +			1, NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*2*/
> +			2, 0, NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*3*/
> +			3, INV_COEF, INV_COEF, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*4*/
> +			5, 3, INV_COEF, 2, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*5*/
> +			6, 4, 3, 2, 0, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED
> +		},
> +		{/*6*/
> +			INV_COEF, INV_COEF, INV_COEF, 3, INV_COEF,
> +			INV_COEF, NO_NEED, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*7*/
> +			INV_COEF, INV_COEF, INV_COEF, 5, 3,
> +			INV_COEF, 1, NO_NEED, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*8*/
> +			7, INV_COEF, INV_COEF, 6, 4, 3, 2, 0, NO_NEED,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*9*/
> +			INV_COEF, INV_COEF, INV_COEF, INV_COEF,
> +			INV_COEF, INV_COEF, 5, 3, INV_COEF,
> +			NO_NEED, NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{/*10*/
> +			INV_COEF, INV_COEF, INV_COEF, 7, INV_COEF,
> +			INV_COEF, 6, 4, 3, 0,
> +			NO_NEED, NO_NEED, NO_NEED
> +		},
> +		{ /*11*/
> +			RATIOVER, INV_COEF, INV_COEF, INV_COEF,
> +			INV_COEF, INV_COEF, INV_COEF, INV_COEF,
> +			INV_COEF, 3, INV_COEF, NO_NEED, NO_NEED
> +		},
> +		{/*12*/
> +			RATIOVER, RATIOVER, INV_COEF, INV_COEF,
> +			INV_COEF, INV_COEF, 7, INV_COEF,
> +			INV_COEF, 4, 3, 0, NO_NEED
> +		},
> +	};
> +
> +	const u32 *coef = NULL;
> +	unsigned int cnt = 0;
> +	u32 i = freq_new_index[input_fs];
> +	u32 j = freq_new_index[output_fs];
> +
> +	if (i >= 13 || j >= 13) {
> +	} else {

if (i < 13 && j < 13) {
u32 k ...
}

> +		u32 k = iir_coef_tbl_matrix[i][j];
> +
> +		if (k >= NO_NEED) {
> +		} else if (k == RATIOVER) {
> +		} else if (k == INV_COEF) {
> +		} else {
> +			coef = iir_coef_tbl_list[k].coef;
> +			cnt = iir_coef_tbl_list[k].cnt;
> +		}
> +	}
> +	*count = cnt;
> +	return coef;
> +}
> +
> +static int mt8365_dai_set_config(struct mtk_base_afe *afe,
> +				 struct mtk_afe_i2s_priv *i2s_data,
> +				 bool is_input, unsigned int rate,
> +				 int bit_width)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_be_dai_data *be =
> +	&afe_priv->be_data[i2s_data->id - MT8365_AFE_BACKEND_BASE];
> +	unsigned int val, reg_off;
> +	int fs = mt8365_afe_fs_timing(rate);
> +
> +	if (fs < 0)
> +		return -EINVAL;
> +
> +	val = AFE_I2S_CON_LOW_JITTER_CLK |
> +	      FIELD_PREP(AFE_I2S_CON_RATE_MASK, fs) |
> +	      AFE_I2S_CON_FORMAT_I2S;

val = AFE_I2S_CON_LOW_JITTER_CLK | AFE_I2S_CON_FORMAT_I2S;
val |= FIELD_PREP(AFE_I2S_CON_RATE_MASK, fs);

looks a bit more readable to me, but no strong opinions.

> +
> +	if (is_input) {
> +		reg_off = i2s_data->reg_off_in;
> +		if (i2s_data->adda_link)
> +			val |= i2s_data->config_val_in;
> +	} else {
> +		reg_off = i2s_data->reg_off_out;
> +		val |= i2s_data->config_val_in;
> +	}
> +
> +	/* 1:bck=32lrck(16bit) or bck=64lrck(32bit) 0:fix bck=64lrck */
> +	if (i2s_data->dynamic_bck) {
> +		if (bit_width > 16)
> +			val |= AFE_I2S_CON_WLEN_32BIT;
> +		else
> +			val &= ~(u32)AFE_I2S_CON_WLEN_32BIT;
> +	} else {
> +		val |= AFE_I2S_CON_WLEN_32BIT;
> +	}
> +
> +	if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
> +	    SND_SOC_DAIFMT_CBM_CFM) {
> +		val |= AFE_I2S_CON_SRC_SLAVE;
> +		val &= ~(u32)AFE_I2S_CON_FROM_IO_MUX;//from consys
> +	}
> +
> +	regmap_update_bits(afe->regmap, reg_off, ~(u32)AFE_I2S_CON_EN, val);
> +
> +	if (i2s_data->adda_link && is_input)
> +		regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, 0x1, 0x1);
> +
> +	return 0;
> +}
> +

..snip..

> +
> +static int mt8365_afe_2nd_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_be_dai_data *be = &afe_priv->be_data[dai->id - MT8365_AFE_BACKEND_BASE];
> +
> +	be->fmt_mode = 0;
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		be->fmt_mode |= SND_SOC_DAIFMT_I2S;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		be->fmt_mode |= SND_SOC_DAIFMT_LEFT_J;
> +		break;
> +	default:
> +		dev_info(afe->dev, "invalid audio format for 2nd i2s!\n");

This is an error: dev_err()

> +		return -EINVAL;
> +	}
> +

Everything else looks good.

Cheers,
Angelo
