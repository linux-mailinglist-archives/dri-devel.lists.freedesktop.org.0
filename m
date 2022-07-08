Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657256BCF2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 17:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2137310E4A6;
	Fri,  8 Jul 2022 15:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF88B10E4A6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 15:34:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso1088793wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MAqLoi+55aml5N6fFSPK1rUqMXnOHduR/XoxC2k56IQ=;
 b=aBInTkdfKEbuCecWBfZTYBsX4pUvITVCPZg6LYSP+R7TTijdbEIlhjuLniqz7iqDLT
 N9lputlg96scgD8vmFch3VKZPdBFs/4Rtus1IKiZdq3vIYYqOuH+FgGK9SGDdxSHfaMx
 tVd+lRAUvCiR9C356gGavD38VLJr+ahNtI8b4EjlHmpeL4swe+YMSW03QZzPf/6kiNCz
 Z76F1yjmN02kgpKeQiRhk6CBIIldbqJJRfvkzyrmsamXW4Qdc2KyCsov3mK3lpg8pQ8G
 zN8jifKQG265+LEqfqGKruL1+PJ5STxAxnRHHeQ+PLfPJqFxaZHc+Wr5fQKPnID194vE
 +wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MAqLoi+55aml5N6fFSPK1rUqMXnOHduR/XoxC2k56IQ=;
 b=lr5CsUOpPCe0EWjrxofbtc3TM3wv6X0XgB+lTHdTxq/ziShGvxw26SdaKyVtkcZV2i
 CAP9zAp/1F5saOuyzAOcwoEz/6dJRV1Cy2Yg/iMxRiP2qJoceIkS1w2/k/NIl+pN1ybt
 3siLpJLuLIxxyCF8RhxXX5SCJAFzH/Jdafpa5lYiL+cyhCTyUHRmhZ44usfwU2AUSfYd
 8lC1zeTWle6Y0BD9e1u6CuOCRDCtZXN0v03lUfd0T521GhkNi3Y+9Vppuazhbqhj69yg
 y5ufOIxbH7BtBlr2OakrU158HjZK3/S5d6uH0L6z36bLk79U8fO5ap7a8bMjQnETRGE+
 KTXw==
X-Gm-Message-State: AJIora8YWm43SfFJmSGAYB1SBi2a4zUrFN+lO58oq4dS2Vx81/Nge7U2
 DFkgXM5XAMnh7dS5QGJimws=
X-Google-Smtp-Source: AGRyM1vJh5BBswMOyUfeUEhKlXJeDvX61sP0BSyfepc6oJN5VGNdZqaoBvRL8zEWyyEan5Yznxgl1A==
X-Received: by 2002:a7b:cd94:0:b0:3a1:7c5c:b11d with SMTP id
 y20-20020a7bcd94000000b003a17c5cb11dmr393698wmj.87.1657294453162; 
 Fri, 08 Jul 2022 08:34:13 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfef43000000b0021bab0ba755sm42956689wrp.106.2022.07.08.08.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 08:34:11 -0700 (PDT)
Message-ID: <d1a93418-587b-a03d-ed9b-01646345deeb@gmail.com>
Date: Fri, 8 Jul 2022 17:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v24 04/10] soc: mediatek: add mtk_mmsys_update_bits API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
 <20220622130824.29143-5-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220622130824.29143-5-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/06/2022 15:08, Nancy.Lin wrote:
> Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> It is a preparation for adding support for mmsys config API.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 37 +++++++++++++-------------------
>   1 file changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a74c86197d6a..ca5bf07114fa 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -192,22 +192,27 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
>   	return -EINVAL;
>   }
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
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			reg |= routes[i].val;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
> +					      routes[i].val);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>   
> @@ -217,15 +222,11 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> @@ -234,18 +235,10 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> -	u32 reg;
>   
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> -
> -	if (assert)
> -		reg &= ~BIT(id);
> -	else
> -		reg |= BIT(id);
> -
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), assert ? 0 : BIT(id));

Let's be this a normal if (assert) else but calling mtk_mmsys_update_bits().

Other then that patch looks good.

Matthias

>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   
