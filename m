Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED4863D3AF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 11:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0E610E442;
	Wed, 30 Nov 2022 10:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA6A10E442
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:43:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g12so26370822wrs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGPlL9lZ5xvH+B3mVmAc8JvO5zer6RowH0S3PzS9r9U=;
 b=lGx7StVF6qQsTDaKmvZp1gvL21/xrmMNCXvQCyuBtp8eB26CGM1s1CyQUOXlCtsWu2
 LITUGy35uTtfdtsLvH3Y9gQCe9YK3oEMsCWdZEejvtuz4KD40BeCevLY8D+pOe23TonI
 Xf9c1QuM/kypVlj5DMeqPKfePUBqzqNEx/u9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZGPlL9lZ5xvH+B3mVmAc8JvO5zer6RowH0S3PzS9r9U=;
 b=MVLt/FQrkUOqN6SyQ4A39Uczy2Tn0NwHxQHzTqCBEUbGboXLPFMPmWA3LEZ9JSi11f
 0eTMoT2hkd+GJie9wzJqH5Fhn/r6DrR38e2BiG9BiNmv1s1OVcQqbdmSwIwcwLIQ82xn
 7G5f8+6p8TEKbA9551JAFz7yL9OS9ATtszkYN4Fwqz4t2EZeP7EixIj5ZZLauFKmeJea
 k/pVERO6AI7nflBBy47BwV/IjWfxgGIblz/+ZA5u5bxmDCpPib+cs6sldDXv4dZWghUj
 ++wo3QU1gktLyg+9w1F04i7yvMnVm1pkI4E2bRqD6Na3bbxbt6oOth5T651hYL3UI/r8
 bazQ==
X-Gm-Message-State: ANoB5pmf0trLLpXnpjCMjFfekkFxuvNLC6qXM/uHiAI3aIhbnQaiUcp5
 KAYg1GGjEPWaWsT3Jh/hs7FYiw==
X-Google-Smtp-Source: AA0mqf5PE/wnU0Q+X6aw1n886cna9WKQ3FZBAb/LMVn5jwenWpq7cUhFELwzoBfWPFlUu5dm72yMWQ==
X-Received: by 2002:a5d:4441:0:b0:242:2b6b:da5 with SMTP id
 x1-20020a5d4441000000b002422b6b0da5mr1353255wrr.535.1669805007024; 
 Wed, 30 Nov 2022 02:43:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c512500b003cf5ec79bf9sm1683349wms.40.2022.11.30.02.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 02:43:26 -0800 (PST)
Date: Wed, 30 Nov 2022 11:43:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH] drm/mediatek: Add checks for devm_kcalloc
Message-ID: <Y4czzLVPKsdKZCN8@phenom.ffwll.local>
References: <20221125014123.121268-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125014123.121268-1-yuancan@huawei.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, stu.hsieh@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022 at 01:41:23AM +0000, Yuan Can wrote:
> As the devm_kcalloc may return NULL, the return value needs to be checked
> to avoid NULL poineter dereference.
> 
> Fixes: 66b2cf9623fa ("drm/mediatek: use layer_nr function to get layer number to init plane")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 112615817dcb..5071f1263216 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -945,6 +945,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  
>  	mtk_crtc->planes = devm_kcalloc(dev, num_comp_planes,
>  					sizeof(struct drm_plane), GFP_KERNEL);
> +	if (!mtk_crtc->planes)
> +		return -ENOMEM;

These (= drm object allocations like drm_planes, drm_crtc) should all be
moved over to drmm_, since devm_ has the wrong lifetimes.

Just in case you want to spend a pile of time in here, the error handling
needs to be fixed either way.
-Daniel

>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
