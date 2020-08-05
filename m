Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360423C88C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F71389E03;
	Wed,  5 Aug 2020 09:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CE089E03
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:04:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p14so5103685wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UdCUg32B/hXTtb788WZvkFxC/f4wUkmqvnp24NK9lCw=;
 b=JUAlosu1el8TjsaKq6svNNr8AACiT5V8m25WpMsuvqHh0Y4PzKV4UKA9rvn6ezKbNt
 I2BuiPhzbZQGE/hEw58JPQL0P3eEp509pDMXgwrz8xz1rsNOMfUJwsZkpRcQ/aueqvv/
 1MuaZrAvjEtIBG4pzzQr7Cbsencmi9pV6i+nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UdCUg32B/hXTtb788WZvkFxC/f4wUkmqvnp24NK9lCw=;
 b=n+Jlf3zgEddX9hQT8ew135/bIv0XsuDqw1rk1UFYYlECdLnPiKj+Y3SlJppqHXxyPh
 iJGpDdzlJP9bPMTxlIr5M5g4uwDpOMgGs04MUpk2mbZnaaktbyjp6ModABEKmGdk+zls
 gPxgn17u91o9VCe7TUkVUj/aJLszlI+KIWBBVvVOA2KjNN9MjbtpiLTf6QMjpR29zqDg
 d69gIIvLTEfPkm+yaTNA/V7ON/oX0S7zXlmva1a73PYW5A8GtfxwcHIMwPY98oX/Ixt4
 RkmDEQWzaUALSZ5TK3Eka/+un7VbkgRkqLhaKkIcz8ubbjR2/E+vF1ao3JvdfoaNjdg+
 iOIg==
X-Gm-Message-State: AOAM530qnbztklmJGADb8c9Bj59oHAZIZ3nXHDaNUiSeZWz4lT97KUH3
 FOUPG1W4t3y4287bNktGBBu5IA==
X-Google-Smtp-Source: ABdhPJzAkRnrlDIEqosk3rBeCSbSReNiv/5Qj+4bAv8GnmskhPVIwD3K5eLVK3AX0b0QTN1378hENA==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr2318260wmb.63.1596618244284; 
 Wed, 05 Aug 2020 02:04:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j4sm1840767wmi.48.2020.08.05.02.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:04:03 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:04:01 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 56/59] drm/ttm: add a wrapper for checking if manager is
 in use
Message-ID: <20200805090401.GZ6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-57-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-57-airlied@gmail.com>
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:56:29PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This converts vmwgfx over to using an interface to set the
> in use and check the in use flag.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Hm, I think this would be a good candidate to eventually rip out once we
have full sub-classing, since it's for vmwgfx internally only. Maybe add a
todo to the kernel-doc.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c |  1 -
>  drivers/gpu/drm/ttm/ttm_bo.c          |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c   | 14 +++++++-------
>  include/drm/ttm/ttm_bo_driver.h       | 14 ++++++++++++++
>  4 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 22185a8dcfa1..38a0e4bd16f7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -240,7 +240,6 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  	ttm_mem_type_manager_init(man, size_pages);
>  	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
>  	ttm_mem_type_manager_set_used(man, true);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cda33b4af681..7d10abae9a60 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1002,7 +1002,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
>  		return ret;
>  
>  	man = ttm_manager_type(bdev, mem_type);
> -	if (!man || !man->use_type)
> +	if (!man || !ttm_mem_type_manager_used(man))
>  		return -EBUSY;
>  
>  	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 7168403fb4f8..b2f1e7a3b048 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -630,7 +630,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
>  				 TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
>  				 false, dev_priv->vram_size >> PAGE_SHIFT);
>  #endif
> -	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
> +	ttm_mem_type_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
>  	return ret;
>  }
>  
> @@ -1192,9 +1192,9 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
>  	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>  
>  	spin_lock(&dev_priv->svga_lock);
> -	if (!man->use_type) {
> +	if (!ttm_mem_type_manager_used(man)) {
>  		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
> -		man->use_type = true;
> +		ttm_mem_type_manager_set_used(man, true);
>  	}
>  	spin_unlock(&dev_priv->svga_lock);
>  }
> @@ -1223,8 +1223,8 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
>  	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>  
>  	spin_lock(&dev_priv->svga_lock);
> -	if (man->use_type) {
> -		man->use_type = false;
> +	if (ttm_mem_type_manager_used(man)) {
> +		ttm_mem_type_manager_set_used(man, false);
>  		vmw_write(dev_priv, SVGA_REG_ENABLE,
>  			  SVGA_REG_ENABLE_HIDE |
>  			  SVGA_REG_ENABLE_ENABLE);
> @@ -1257,8 +1257,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>  	vmw_kms_lost_device(dev_priv->dev);
>  	ttm_write_lock(&dev_priv->reservation_sem, false);
>  	spin_lock(&dev_priv->svga_lock);
> -	if (man->use_type) {
> -		man->use_type = false;
> +	if (ttm_mem_type_manager_used(man)) {
> +		ttm_mem_type_manager_set_used(man, false);
>  		spin_unlock(&dev_priv->svga_lock);
>  		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
>  			DRM_ERROR("Failed evicting VRAM buffers.\n");
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 300934289e64..f231fe34e744 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -678,6 +678,20 @@ static inline void ttm_mem_type_manager_set_used(struct ttm_mem_type_manager *ma
>  	man->use_type = used;
>  }
>  
> +/**
> + * ttm_mem_type_manager_used
> + *
> + * @man: Manager to get used state for
> + *
> + * Get the in use flag for a manager.
> + * Returns:
> + * true is used, false if not.
> + */
> +static inline bool ttm_mem_type_manager_used(struct ttm_mem_type_manager *man)
> +{
> +	return man->use_type;
> +}
> +
>  /**
>   * ttm_mem_type_manager_cleanup
>   *
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
