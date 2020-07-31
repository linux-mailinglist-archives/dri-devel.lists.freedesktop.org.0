Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9C2343C2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C52A6EA52;
	Fri, 31 Jul 2020 09:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900E56EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:55:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r4so24468182wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/PeJHLLMqdtuuWUBP3V+ccOjuM+sLts1bvbJOt3rChI=;
 b=Hb9amC3Bci+QPEnWkhkRzg2HFL+YI8A55t693nUuWlmiTE+2jjPRN/n/JZIOAbW+yA
 NIDhhm+xWQemaelO568nQupiPzk6Y49t2U41ip7kWx/wwi1ItTOQi5MO8plFI6wFfTP5
 Lsq3Wh6a34930wBkdCpQoaGqmZRopfOoEPsVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/PeJHLLMqdtuuWUBP3V+ccOjuM+sLts1bvbJOt3rChI=;
 b=ucrWq2DpjXEXYjY+k6UMzxzxzOavMd56U5dWen/7+DTwCjMXl09BM9Q+uEM0nCkK0X
 qSi5DI6ZwPMKKlgKRZ9qoYmY90Bhn895Zoi8zyuirYqOXhm9nbR/7DdQCwe6qHvSq18Q
 h02YRL/6SzhwyiPKGVt9+iO2BNjhuhGxHi4f7l2a1c+zPIjO70KlYziq2EOYNR6U2KQ8
 LTj1AvrEVWl0XTmJ6IomadtuBUq1jrGAESwUxS5H7jEysjnqIkVVqa7GJFFmNzoSKRvw
 d9E0o7cW7qN6lUnrapbr7TYYcHkdou4VMW2rVds+GE3kY2NQbTwn7dLxKekmJ9x3WfjW
 sMOA==
X-Gm-Message-State: AOAM5309Yphi39CbO7E0gYo7OBMNhxfMK0i58CjvGaTb7abDAHLySeLR
 MyZifzO2TaYDwZW5VbG5wmfTmQ==
X-Google-Smtp-Source: ABdhPJyazzIdcDZtPHuhLyctTHMH8zlMyxIFOspxI6wCwkKhDcLKmDg09GN06WOF1DsWuFs7bZtXPg==
X-Received: by 2002:adf:9ec1:: with SMTP id b1mr2733778wrf.171.1596189331204; 
 Fri, 31 Jul 2020 02:55:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x11sm12505896wrl.28.2020.07.31.02.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:55:30 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:55:28 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 47/49] drm/ttm: drop list of memory managers from device.
Message-ID: <20200731095528.GC6419@phenom.ffwll.local>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-48-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731040520.3701599-48-airlied@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: kraxel@redhat.com, sroland@vmware.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 02:05:18PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> The driver now controls these, the core just controls the system
> memory one.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 2 --
>  include/drm/ttm/ttm_bo_driver.h | 6 ++++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f2b41c4d7d51..f35548ff17e8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1608,8 +1608,6 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
>  
>  	bdev->driver = driver;
>  
> -	memset(bdev->man_priv, 0, sizeof(bdev->man_priv));
> -
>  	ttm_bo_init_sysman(bdev);
>  
>  	bdev->vma_manager = vma_manager;
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index bfc549782775..b2ffeaed94e7 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -414,7 +414,7 @@ struct ttm_bo_device {
>  	/*
>  	 * access via ttm_manager_type.
>  	 */
> -	struct ttm_mem_type_manager man_priv[TTM_NUM_MEM_TYPES];
> +	struct ttm_mem_type_manager sysman; /* move to global */

Not sure we want to move this to global. With the shrinker rework ideas I
discussed with Christian somewhere (I think) we could easily do a
per-device shrinker. And then global kinda completely disappears (minus
maybe a drm-global limit on how much crap you can permanently pin in
system memory for scanout, but that's a different thing I think).
-Daniel

>  	struct ttm_mem_type_manager *man_drv[TTM_NUM_MEM_TYPES];
>  	/*
>  	 * Protected by internal locks.
> @@ -446,9 +446,11 @@ struct ttm_bo_device {
>  static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
>  							    int mem_type)
>  {
> +	if (mem_type == TTM_PL_SYSTEM)
> +		return &bdev->sysman;
>  	if (bdev->man_drv[mem_type])
>  		return bdev->man_drv[mem_type];
> -	return &bdev->man_priv[mem_type];
> +	return NULL;
>  }
>  
>  static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
