Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309824A4B4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 19:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916596E55C;
	Wed, 19 Aug 2020 17:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811FF6E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 17:14:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a5so22282568wrm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uxW4P/9c5owj5TbqeeSJhimozsZ/ts6TLrVEcdoDcKc=;
 b=oFBXmglFqppJ5H90JX7k9hVq8siJfn73/Uhkmym4cndlhhgXjw4iDjKyVkO8F42dui
 dEbp2PPwm99BpwM07gh7iv6zAyTreBFl2zIdvbvU+uieLrbSW3w6DM1km47en0+Bizfe
 8AKRsx+fg1XsTpvJuGOTZWK2KQ7gpM8avVsrNwBjaC730kj4ckvcJ3CJfhVYhJNBIi3r
 jCWrYD0yGziZ6ueN0FREoyhaitcwrI7Q18FXL/5hgm09WF59Ri5Ipe4IRXnjU6UtswGc
 4hwH/CVPBKpDUPfuT9HFbA/0Rm2U14iAHLyPHFmdawomBqNr9ZMIWU+0Eo4Gh/p7acp2
 d/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uxW4P/9c5owj5TbqeeSJhimozsZ/ts6TLrVEcdoDcKc=;
 b=L5T85EE6RLro8S0bT5tViQBbedbNp12yPfWtw8v86wBqGBhT0P2RdpoOiWBxFX9r9G
 NjixkVyULSqx/xDlA/Xebp7fzvCdggQ6fNzsy5ntaTLJ7KeeSW10nFKv5izBm4ZK3RBY
 xsj8u2r/FQf7E66/hiGxM+6um/nR9lKnlF39aOOn65h1S9MQ0tydYHwUu7wvif4Paj8K
 kWagDuVI4FZCU1LVYEUPKBlPNv4XkivIZK3aTZ2b3OLaVQxn8LO7SRtVQu2IEwYOWPyb
 SvGiFqwjUe+mcOtQ/v1Mp9YHHPW2FRfsDjQ+iocSz+OsE4K3sqjBbXGfS8w1Gb5RoFe4
 2Ejw==
X-Gm-Message-State: AOAM5310xu5+xWENzU3b3I/xUYxV3VKCN/gFpz5teDe7KunU6y/S8WeI
 NAr1MMGIM63B/90sBz6llQA=
X-Google-Smtp-Source: ABdhPJxuglAF/P70gnxyfeZB51uIoA+nGJl5R01Hf8f8HnZsYxB4igMuLgNDVozV2tn4SOsRThTh5w==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr25966574wrw.155.1597857262147; 
 Wed, 19 Aug 2020 10:14:22 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
 by smtp.gmail.com with ESMTPSA id f17sm6742926wru.13.2020.08.19.10.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 10:14:21 -0700 (PDT)
Subject: Re: [PATCH v5 5/7] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-6-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4812f750-5f85-61bb-fb68-4eec99285e77@gmail.com>
Date: Wed, 19 Aug 2020 19:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819081752.4805-6-linux@fw-web.de>
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/08/2020 10:17, Frank Wunderlich wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> For current mediatek dsi encoder, its possible crtc is fixed in crtc
> 0, and mediatek dpi encoder's possible crtc is fixed in crtc 1. In
> some SoC the possible crtc is not fixed in this case, so call
> mtk_drm_find_possible_crtc_by_comp() to find out the correct possible
> crtc.
> 

Hm, shouldn't we stash this int 4/7, otherwise we will have not used functions 
in 4/7.

Regards,
Matthias

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 3 ++-
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index d4f0fb7ad312..e43977015843 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -608,7 +608,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
>   
>   	/* Currently DPI0 is fixed to be driven by OVL1 */
> -	dpi->encoder.possible_crtcs = BIT(1);
> +	dpi->encoder.possible_crtcs =
> +		mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
>   
>   	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 16fd99dcdacf..c9f4ad029cb1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -974,7 +974,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>   	 * Currently display data paths are statically assigned to a crtc each.
>   	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
>   	 */
> -	dsi->encoder.possible_crtcs = 1;
> +	dsi->encoder.possible_crtcs =
> +		mtk_drm_find_possible_crtc_by_comp(drm, dsi->ddp_comp);
>   
>   	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
