Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402FB7651ED
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 13:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA55210E569;
	Thu, 27 Jul 2023 11:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC8E10E569
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 11:03:56 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so1829201fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690455834; x=1691060634; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cZF3XtrIp2bOiTmk2h41l3lxAy20S9f02tlSc0yU7eM=;
 b=W2K8qz+7PujcvBXOJtpjKU8HGHnsNuuCRo2r+LB0U2bYRQ75DJUW6ayx11pWS84xP5
 6/CYqd4Q+USeDvQYGl4cyIRi6UXvlVghF1HK60pkqVCcYPLPKncN4G+GBoWSY9ydl77i
 LimmOT+vSvt5nwyYBWfJjsb7K/5EhNkQlqX+kOwvoShtqD4xjPnXHGmP2IHFSUVwW0Lv
 e6+C3NSA5zNkO4dWidxxwylmlTaGWoatKkuMqKlZy3Za3NDcY3psnOMxUhyx9L7NS6pe
 /bYJBbuVMqzN03BkBxERxBK6HL6eaGVCeBuGiBxRUXOQTRaHlI8YK6YdxvpI/YbkAnaN
 SQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690455834; x=1691060634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cZF3XtrIp2bOiTmk2h41l3lxAy20S9f02tlSc0yU7eM=;
 b=jWif+Tyzb7je5rjiVkwarumhErnEIH4DbAYIAfpeIFblohi4PC5lKWO/M9GAUOeL6e
 x/+og0l0/Zo9yat/wdZxorE3ih0No8h0wU8EGQpq6nFcqR2m0MJMiiTceRVpGNB+MC86
 MP8TbMfPv0VNhQNUbHdJsNSZREbD3Gcb2dZ3YONDwOiN/kvg2b5dimph+FSih4Ebz72u
 /8YJoDIcndxqJvbAIoQScSbkxvHkR7URd1qb29HVHA8iJvnAtOGw/g8WZMprIq4a5AD0
 032h0O1N70OD8jlzw54fWn/CbjaI2HvfKdP5LohFmYpMPGkm4KdM11RXkWJjjG2zGrUq
 1xIA==
X-Gm-Message-State: ABy/qLZgnn2RQqRtZJm1UYUa+dDpbCu4xm4jBLWhIVb732EAZZe1lQHW
 96lrDg12T5/Yvvatk41RcCpSzQ==
X-Google-Smtp-Source: APBJJlHK3JMIN7o6/6Mbuizxurh3A/QfIfawJ73wXqooHzlUEfbBjgXc17g25yWxQ+DfBbpe8Wk8QA==
X-Received: by 2002:a2e:804e:0:b0:2b5:7fba:18ac with SMTP id
 p14-20020a2e804e000000b002b57fba18acmr1516711ljg.48.1690455833779; 
 Thu, 27 Jul 2023 04:03:53 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a170906245800b0099bcd1fa5b0sm626339ejb.192.2023.07.27.04.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 04:03:53 -0700 (PDT)
Message-ID: <ec66e067-642e-1512-3e4b-b51065ccc75d@baylibre.com>
Date: Thu, 27 Jul 2023 13:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 09/11] drm/mediatek: gamma: Add support for
 12-bit LUT and MT8195
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-10-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo !

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Add support for 12-bit gamma lookup tables and introduce the first
> user for it: MT8195.
> While at it, also reorder the variables in mtk_gamma_set_common()
> and rename `lut_base` to `lut0_base` to improve readability.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 61 ++++++++++++++++++-----
>   1 file changed, 48 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index f1a0b18b6c1a..e0e2d2bdbf59 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -27,12 +27,20 @@
>   #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
>   #define DISP_GAMMA_BANK				0x0100
>   #define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
> +#define DISP_GAMMA_BANK_DATA_MODE			BIT(2)
>   #define DISP_GAMMA_LUT				0x0700
> +#define DISP_GAMMA_LUT1				0x0b00

Is this offset generic to all MTK SoC which support this driver ?

>   
> +/* For 10 bit LUT layout, R/G/B are in the same register */
>   #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
>   #define DISP_GAMMA_LUT_10BIT_G			GENMASK(19, 10)
>   #define DISP_GAMMA_LUT_10BIT_B			GENMASK(9, 0)
>   
> +/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */

As I understood from the application processor registers (v0.4), R/G are 
in LUT, B is in LUT1 for 10bit and 12bit for MT8195. Can you check 
please to be sure ?

> +#define DISP_GAMMA_LUT_12BIT_R			GENMASK(11, 0)
> +#define DISP_GAMMA_LUT_12BIT_G			GENMASK(23, 12)
> +#define DISP_GAMMA_LUT_12BIT_B			GENMASK(11, 0)
> +
>   #define LUT_10BIT_MASK				0x03ff
>   #define LUT_BITS_DEFAULT			10
>   #define LUT_SIZE_DEFAULT			512
> @@ -83,14 +91,15 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
>   {
>   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> -	unsigned int i;
> +	void __iomem *lut0_base = regs + DISP_GAMMA_LUT;
> +	void __iomem *lut1_base = regs + DISP_GAMMA_LUT1;
> +	u32 cfg_val, data_mode, lbank_val, word[2];
> +	int cur_bank, num_lut_banks;
> +	u16 lut_bank_size, lut_size;
>   	struct drm_color_lut *lut;
> -	void __iomem *lut_base;
> +	unsigned int i;
>   	bool lut_diff;
> -	u16 lut_bank_size, lut_size;
>   	u8 lut_bits;
> -	u32 cfg_val, lbank_val, word;
> -	int cur_bank, num_lut_banks;
>   
>   	/* If there's no gamma lut there's nothing to do here. */
>   	if (!state->gamma_lut)
> @@ -110,14 +119,17 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
>   	num_lut_banks = lut_size / lut_bank_size;
>   
>   	cfg_val = readl(regs + DISP_GAMMA_CFG);
> -	lut_base = regs + DISP_GAMMA_LUT;
>   	lut = (struct drm_color_lut *)state->gamma_lut->data;
>   
> +	/* Switch to 12 bits data mode if supported */
> +	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
> +
>   	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
>   
>   		/* Switch gamma bank and set data mode before writing LUT */
>   		if (num_lut_banks > 1) {
>   			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
> +			lbank_val |= data_mode;
>   			writel(lbank_val, regs + DISP_GAMMA_BANK);
>   		}
>   
> @@ -130,9 +142,15 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
>   			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
>   
>   			if (!lut_diff || (i % 2 == 0)) {
> -				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
> -				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
> -				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
> +				if (lut_bits == 12) {
> +					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
> +					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
> +					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
> +				} else {
> +					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
> +					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
> +					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
> +				}
>   			} else {
>   				diff.red = lut[n].red - lut[n - 1].red;
>   				diff.red = drm_color_lut_extract(diff.red, lut_bits);
> @@ -143,11 +161,19 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
>   				diff.blue = lut[n].blue - lut[n - 1].blue;
>   				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
>   
> -				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
> -				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
> -				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
> +				if (lut_bits == 12) {
> +					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
> +					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
> +					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
> +				} else {
> +					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
> +					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
> +					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
> +				}
>   			}
> -			writel(word, (lut_base + i * 4));
> +			writel(word[0], (lut0_base + i * 4));
> +			if (lut_bits == 12)
> +				writel(word[1], (lut1_base + i * 4));

ditto

>   		}
>   	}
>   
> @@ -271,11 +297,20 @@ static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
>   	.lut_size = 512,
>   };
>   
> +static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
> +	.lut_bank_size = 256,
> +	.lut_bits = 12,

If I'm right, ".lut_bits = 10" will not work properly.

> +	.lut_diff = true,
> +	.lut_size = 1024,
> +};
> +
>   static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt8173-disp-gamma",
>   	  .data = &mt8173_gamma_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-gamma",
>   	  .data = &mt8183_gamma_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-gamma",
> +	  .data = &mt8195_gamma_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);

-- 
Regards,
Alexandre
