Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4BE5B9F80
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5E910E1FE;
	Thu, 15 Sep 2022 16:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5F10E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 16:18:00 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id d1so2521111eje.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=04xgqSaRrD4Mt6bAKc6OPHCEttCSurLeTnJ0LfF3Y88=;
 b=W54LxCJxwzgcE/KxC7g2c70doyePGWlRwMOoJ7shqyflKt1q2SNQ2oI4JUsVBCn/u3
 WcKpZyFTEG+tc36gNQLIWOFL0lwecmoDWy+fcY/2FxpNXh4SWmX4dX92zLC0l0RCBugb
 0XM5QXZNULWoCzS3ShxXykAwqE/DNVuZ0P11pVcfHjU+Xoad5WXAPZTa1iAHWgGlCMBI
 SocOlS1dOkIK3c9giGxc7xYSjf8w2oBYb4eVHqkf8cb73T3MLwQJRr9lhMLdC7XHe8X+
 QfTpiFXLVgMaZPFAwXCoMcQ/GJ26dZkjwDnaM3vv7KFo6iIzJEHoduCHklX3HhlS0UD0
 F/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=04xgqSaRrD4Mt6bAKc6OPHCEttCSurLeTnJ0LfF3Y88=;
 b=tyJnm0n/LBO0l8FRE8ZxYdKSKKdFV21S01g0NarwZhWj2syjtpJt1acmKngEOBVhN9
 ErKI8/vdeDRNDY+Jnu2SM1nzQBkchrapkmhDDKvAmILMymh7MYt42oAFs6ZhBiN3rR88
 84F+BOreKuFoInoxs638XlPYVFttOCCU+cbfOHOQRZX2zGF5SCLNR3t7x5ToTZbjqazG
 i4r1/xYidAvADx+NSIDm0yPA6h6k3zUzreYTDEO5e+acanG2BgC06amWnnc+FItie1wT
 ZgB13ym8oH7OMCfnXNuijbgcVJVZ9Q+qo2uFmxRE552duVIe/S1CJ4NudsHPnoQlpLfD
 KAAQ==
X-Gm-Message-State: ACrzQf3+x13P9Jum+e+UMlZLfvqz1RV9B5477XUGORU3RlRlGWIZmfUw
 y00/T17vyi/cXr0+YiGPsGI=
X-Google-Smtp-Source: AMsMyM6XCP2noM5ZoDO/SViV5bWU2rlo6M0rExAmhVAYI7gIgJk31zTRWDw+hwu9Bq2Bu4B1NRJ2GQ==
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr521284ejc.324.1663258678460; 
 Thu, 15 Sep 2022 09:17:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709066b8a00b00773dbdd8205sm9228718ejr.168.2022.09.15.09.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 09:17:57 -0700 (PDT)
Message-ID: <671a971e-1d5d-f420-25e1-2a83130d070e@gmail.com>
Date: Thu, 15 Sep 2022 18:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6,1/3] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, jason-jh.lin@mediatek.com,
 rex-bc.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
 <1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/09/2022 15:21, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Nís F. R. A. Prado <nfraprado@collabora.com>

Applied, thanks!


> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    |  6 ++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 20 ++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  2 ++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..09b1ccbc0093 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,12 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +/* Values for DPI configuration in MMSYS address space */
> +#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
> +#define DPI_FORMAT_MASK					0x1
> +#define DPI_RGB888_DDR_CON				BIT(0)
> +#define DPI_RGB565_SDR_CON				BIT(1)
> +
>   #define MT8186_MMSYS_OVL_CON			0xF04
>   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 06d8e83a2cb5..2e20b24da363 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -227,6 +227,26 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
> +{
> +	if (val)
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
> +	else
> +		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
> +				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
> +
>   static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
>   				  bool assert)
>   {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 59117d970daf..d2b02bb43768 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -65,4 +65,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   			      enum mtk_ddp_comp_id cur,
>   			      enum mtk_ddp_comp_id next);
>   
> +void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
> +
>   #endif /* __MTK_MMSYS_H */
