Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630F6DF090
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 11:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2072010E74C;
	Wed, 12 Apr 2023 09:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FF710E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:37:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so1930062wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 02:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681292248; x=1683884248; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yViF9HtFc2wSfRWYF/6GIfXl6DnwQwhPNankR2ni3Tg=;
 b=LMG89MudBiM6HVk/+uzfvPFaWAX7u/PPxSdfiZeC6iq+GCXZJZhPPBLxOWqf6Byriw
 fX1cFYe01A8WUQHewv/CzzXHjOLYB1z4jqLitLqasVK98W1PEcba7NpPp8H0avWMyQLy
 rV99vaOXWS8+5zdiUpnx+1oWN4M90upXXqDjRdYmMVwbhuSSZojwOzR3XvW0RKWAuLHj
 V910r+8dryvPE9vjSaV3OKet3fh65PDSlmMV7Sou+dSLiq/SnhNg8X+bvgbZAopui2JX
 8D+mRdJljHOy2Z1nxKEa976OKFqFv03sPjRZIjCog9uJUT59P8IjXsEGz0U4VkeZUWI7
 TCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681292248; x=1683884248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yViF9HtFc2wSfRWYF/6GIfXl6DnwQwhPNankR2ni3Tg=;
 b=S+p8NgTDcxjRG9zMfH4swhwygHPp0+izzNiknhLivLyBurI+0uIt4Q3t5jgrJGTiGu
 T/5+4IMVE2TyiX7Lhzq8WD8oFSmTHw9Z3p3YpcIm1F2IV7cxmbPiH6nWhSiqgleljFAL
 J1g8aCTP5Xa18s/xWdpqxG1as8PuergclcJKL6nD+7MmirQJEb9wVKQRFrka9gkkC7Gs
 a/L27YLSOegkSLBccFuUnbDYKaEBpyR3erx5dx/w6gbP859vENkbxx60fHenBhCdOBSs
 jzh7FMPQh7ttU0EmqoyaR5nywvLZ8TisoPCqZUJf57vX1nNq+vpiDcycyZ3u+XtWC5if
 0NOA==
X-Gm-Message-State: AAQBX9fon7Lvz76eNt5jrPDJMFSPH7xgL/47eTfq3mkEVWq6n/mtsTsE
 /LCYLbMYCJcB2DJkuxC3oXQlLg==
X-Google-Smtp-Source: AKy350av5HB+5Qzpnowd1xOZQXZIdGcBGClzNWNRA15VmaKIVJqwPicp7GD4mWLklqSBaldUrrSJ3w==
X-Received: by 2002:a7b:cb45:0:b0:3ed:2eb5:c2dd with SMTP id
 v5-20020a7bcb45000000b003ed2eb5c2ddmr9059600wmj.39.1681292248472; 
 Wed, 12 Apr 2023 02:37:28 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d6b85000000b002d97529b3bbsm16723969wrx.96.2023.04.12.02.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:37:28 -0700 (PDT)
Message-ID: <f95ee9f4-71a3-2f92-ed9b-037e11b8e893@baylibre.com>
Date: Wed, 12 Apr 2023 11:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/mediatek: Add ability to support dynamic
 connector selection
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230405145129.18835-1-jason-jh.lin@mediatek.com>
 <20230405145129.18835-2-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230405145129.18835-2-jason-jh.lin@mediatek.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Jonson Wang <jonson.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Can you give me the based git tree/branch for this series please ?
I want to do a non-regression test for mt8365-evk board.

Feedback below:

On 05/04/2023 16:51, Jason-JH.Lin wrote:
> 1. Move output drm connector from each ddp_path array to connector array.
> 2. Add dynamic select available connector flow in crtc create and enable.
> snip...
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..5ff20d0de29b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -60,8 +60,13 @@ struct mtk_drm_crtc {
>   	struct device			*mmsys_dev;
>   	struct device			*dma_dev;
>   	struct mtk_mutex		*mutex;
> +

Remove this extra line please.

> +	unsigned int			ddp_comp_nr_ori;
> +	unsigned int			max_ddp_comp_nr;
>   	unsigned int			ddp_comp_nr;
>   	struct mtk_ddp_comp		**ddp_comp;
> +	unsigned int			conn_route_nr;
> +	const struct mtk_drm_route	*conn_routes;
>   
>   	/* lock for display hardware access */
>   	struct mutex			hw_lock;
> @@ -649,6 +654,85 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
>   	mtk_ddp_comp_disable_vblank(comp);
>   }
>   
> +static unsigned int mtk_drm_crtc_max_num_route_comp(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	unsigned int max_num = 0;
> +	unsigned int i;
> +
> +	if (!mtk_crtc->conn_route_nr)
> +		return 0;
> +
> +	for (i = 0; i < mtk_crtc->conn_route_nr; i++)
> +		max_num = (max_num > mtk_crtc->conn_routes[i].route_len) ? max_num :
> +				mtk_crtc->conn_routes[i].route_len;

if test is true, then do "max_num = max_num"
I'm not sure the compiler will optimize that.
Also, I think it more readable like that:

if (max_num < mtk_crtc->conn_routes[i].route_len) {
	max_num = mtk_crtc->conn_routes[i].route_len;
}

> +
> +	return max_num;
> +}
> +
> +static int mtk_drm_crtc_update_output(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	int crtc_index = drm_crtc_index(crtc);
> +	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
> +	unsigned int encoder_mask = crtc_state->encoder_mask;
> +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	struct device *dev;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	const struct mtk_drm_route *conn_routes;
> +	unsigned int route_len = 0, route_index = 0;
> +	unsigned int comp_id;
> +	int i;

Can you put them in alphabetical order please ?

> +
> +	if (!mtk_crtc->conn_route_nr)
> +		return 0;
> +
> snip...
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index 3e9046993d09..96790f8f7a94 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -7,6 +7,7 @@
>   #define MTK_DRM_CRTC_H
>   
>   #include <drm/drm_crtc.h>
> +#include "mtk_drm_drv.h"

Alphabetical order please.

>   #include "mtk_drm_ddp_comp.h"
>   #include "mtk_drm_plane.h"
>   
> @@ -18,7 +19,9 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc);
>   int mtk_drm_crtc_create(struct drm_device *drm_dev,
>   			const unsigned int *path,
>   			unsigned int path_len,
> -			int priv_data_index);
> +			int priv_data_index,
> +			const struct mtk_drm_route *conn_routes,
> +			unsigned int conn_routes_num);
>   int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>   			     struct mtk_plane_state *state);
>   void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,


Regards,
Alexandre

