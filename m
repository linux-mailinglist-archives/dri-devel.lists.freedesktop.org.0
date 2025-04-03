Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07D2A7A0E5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226C10E992;
	Thu,  3 Apr 2025 10:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YOMpwmEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F9010E992
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743675682;
 bh=0oE4lMdKbjGPtKZ/zki1hCNZrfNg91tWfdphSD8J1Nw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YOMpwmEH6WLl5/kP+yXKdKE0c29/hieX44XzQ4RsIYxxu3SwsDQ17jv6szsAdzoyE
 oABAy3C2DKTNPlg6FuaPa8CUQS7tcRNpzBN5byRJGF2KC9Mi+IQ+grVNxdoYfqm/HR
 dUhT/adw6a5M3thbMccMxadccDn/EdlBz5hVJsx63TexyCB8X0y1m3ruccKaKcutg5
 qxFBTlQlL7AihMPBkxV59weTtantbf6BM5CtJY4kwnZBfg6RvDt27QLJXuib/SqaC5
 CUjCJ1IlnaRwnIthCpnLv+6+2JFEyXplP1Al2+CT0Pah8v1LP8qVUiY1p8kM6S/aY/
 Pl6DhKuIpPfQw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C28C817E0F47;
 Thu,  3 Apr 2025 12:21:21 +0200 (CEST)
Message-ID: <568517cc-7108-4e38-b208-43d4e305f663@collabora.com>
Date: Thu, 3 Apr 2025 12:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Replace custom compare_dev with
 component_compare_of
To: shao.mingyin@zte.com.cn, chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, tang.dongxing@zte.com.cn
References: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
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

Il 03/04/25 09:54, shao.mingyin@zte.com.cn ha scritto:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index fa0e95dd29a0..fe97bb97e004 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -492,11 +492,6 @@ static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
>   	{ /* sentinel */ }
>   };
> 
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>   static int ovl_adaptor_of_get_ddp_comp_type(struct device_node *node,
>   					    enum mtk_ovl_adaptor_comp_type *ctype)
>   {
> @@ -567,7 +562,7 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
> 
>   		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
> 
> -		drm_of_component_match_add(dev, match, compare_of, node);
> +		drm_of_component_match_add(dev, match, component_compare_of, node);
>   		dev_dbg(dev, "Adding component match for %pOF\n", node);
>   	}
> 


