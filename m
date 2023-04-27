Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D026F059A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2310EB2D;
	Thu, 27 Apr 2023 12:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18E10EB2D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 12:18:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso7374319f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682597883; x=1685189883;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B1vg4m/VO0MJixxSFQxYroHS6wmKORiBS3+pI5CUOeA=;
 b=h8aWLVXfJoVHByEfH4nDVYZAgF7pCMbFAKULlTJDAvY0i9RXCc8hqvbf1SoACMTFLi
 sGAiE3uURyayj6Q4q5y4S1FWrSwXVGFmAYz2GNFk0GwLD0dRj2EFPMWZiFXoFKbFFV+x
 9P4N5aNiE1wimcUPLnIqgCyeGBfhCvqZm2rmvvhKMVcdZTKNfD17oCoduDcdZZiZj1s0
 j+aDXbU7JtBM71oh2fvNMEw2z/kywg2XahtK/jiAHpBHr7OlyA0YfoznY+2NcrxLqN3B
 F26EQ8CGy4sL9AKzIfy5KPXxMG/Mhr/8ojo+qQpxWiTttAbzxgILJCdZd7oqQXj+Uxmm
 BdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682597883; x=1685189883;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B1vg4m/VO0MJixxSFQxYroHS6wmKORiBS3+pI5CUOeA=;
 b=S6vjuQZK/bsyxGcN8ASjNZoi5on9aTcCtR5UZGl0GB6D6LOJ5rCNjpbq+RsM2vkZyw
 lfOic8m+aRRyGIcmngIOKR7V0xkRiDfwoHB9opm+5pB9h2YTL3A2PblZkBfvsB5Flu/P
 57C3TCQ3t+G8md7CrQLSPokk6IuySOyPDib2KPJGn4l28Fyc5Q6GxNCtBVfQt9X27Otf
 xAdzU91uv5Bf0CqWK8tLtFh2sZdYg808B0pfF1ekgmNH5zGGb4UkV2OEakjGtjPRsJpm
 WkDgp4kkpQGEZIWwRd5d+FIv2BqHdAIKQOH+Vtha9qiq5S8z6zTnr7Zp0+bD6QkiS7Z0
 xN3A==
X-Gm-Message-State: AC+VfDzSmmd7z/oUl3m/7jPgR2s8BHN0dBp3FSZAfvYV/6JsnYvrRJFG
 +YJ2e/wJ12NxUNsO1150CDI=
X-Google-Smtp-Source: ACHHUZ6XSKZdEQZ82p2Ne5sQayHi/JgjrgiM+HvaVe1sFcjLXkT3Cm1pfdAlTzJEugJrw6il1B3WXQ==
X-Received: by 2002:a5d:40cd:0:b0:2ff:3a63:ed61 with SMTP id
 b13-20020a5d40cd000000b002ff3a63ed61mr1121516wrq.13.1682597882571; 
 Thu, 27 Apr 2023 05:18:02 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b002fe254f6c33sm18366680wrw.92.2023.04.27.05.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:18:01 -0700 (PDT)
Message-ID: <ba23e233-a0a2-c5e9-1a63-497d7dea4814@gmail.com>
Date: Thu, 27 Apr 2023 14:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] drm/mediatek: Add DSI support for mt8188 vdosys0
Content-Language: en-US, ca-ES, es-ES
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230427084040.3651-1-jason-jh.lin@mediatek.com>
 <20230427084040.3651-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230427084040.3651-3-jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/04/2023 10:40, Jason-JH.Lin wrote:
> Add DSI as main display output for mt8188 vdosys0.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 5 +++++
>   drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 72c57442f965..bf06ccb65652 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -48,6 +48,7 @@ int mtk_dpi_encoder_index(struct device *dev);
>   
>   void mtk_dsi_ddp_start(struct device *dev);
>   void mtk_dsi_ddp_stop(struct device *dev);
> +int mtk_dsi_encoder_index(struct device *dev);
>   
>   int mtk_gamma_clk_enable(struct device *dev);
>   void mtk_gamma_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index fe20ce26b19f..214233d36487 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -318,6 +318,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
>   static const struct mtk_ddp_comp_funcs ddp_dsi = {
>   	.start = mtk_dsi_ddp_start,
>   	.stop = mtk_dsi_ddp_stop,
> +	.encoder_index = mtk_dsi_encoder_index,
>   };
>   
>   static const struct mtk_ddp_comp_funcs ddp_gamma = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index d8c49614a107..7ea4dc87c558 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -191,8 +191,13 @@ static const unsigned int mt8188_mtk_ddp_main_routes_0[] = {
>   	DDP_COMPONENT_DP_INTF0
>   };
>   
> +static const unsigned int mt8188_mtk_ddp_main_routes_1[] = {
> +	DDP_COMPONENT_DSI0
> +};
> +
>   static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
>   	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_0), mt8188_mtk_ddp_main_routes_0},
> +	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_1), mt8188_mtk_ddp_main_routes_1},
>   };
>   
>   static const unsigned int mt8192_mtk_ddp_main[] = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 7d5250351193..f9d2d5447e2e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -865,6 +865,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>   	return ret;
>   }
>   
> +int mtk_dsi_encoder_index(struct device *dev)
> +{
> +	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +	int encoder_index = drm_encoder_index(&dsi->encoder);
> +
> +	dev_dbg(dev, "encoder index:%d", encoder_index);
> +	return encoder_index;
> +}
> +
>   static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>   {
>   	int ret;
