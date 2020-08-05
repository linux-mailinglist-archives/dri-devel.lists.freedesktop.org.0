Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792623C90A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC967892BB;
	Wed,  5 Aug 2020 09:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A8D892BB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:22:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f18so3970008wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EMHpHL97BRykPpV5xAF76MuuHnD3sEXyWX5wLaJtr2k=;
 b=WjxE9AUYwe/312W/QLAoEtrDVUgmE4qPmAVNkVhJQZjMivK0Io//B7Dj5HJ4GZ7odd
 0i3LC4M8LFZdh33+HYcvd8whgOVahw6ggL92erZeUxfXSaA20V2LBQ2NpdPrG8MnwGyD
 xSTGM8lflarHkS90gGMAe4UhyVHoDVgzi/veo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EMHpHL97BRykPpV5xAF76MuuHnD3sEXyWX5wLaJtr2k=;
 b=dALfEDj9j7B78Wmxh0yjm9JB3uzWPriCx5p1rCzNFwFRoYDq/WzcoyyKf4PypzRwHn
 V4zYHybBQgUggyacMCyCO1kc8u1TpzgsPojTjg5q52ebySs8arJUApad2zAqdVjzGi6P
 +vXnnWvKnvvfIs5qtiLZ6kCyoXt8NEQHse3TVkCEgWw6sl6arjZGAa6aTLvwgYrdFrib
 4TTWNJ96QRj2TE5lby1eHtjBMD3cPv+8HXFY3LeoxlfJ0mp4064MtK1iUAIEGHgagXGR
 F5XTfEKEskxTO5XNqKKODPHwrzscCnm+4DilOGnvAaedi27QQShihDLnaIw7M1oDBMWG
 FYJA==
X-Gm-Message-State: AOAM531j5iohNJbJOR6EZ1FogolnPutd9san/mAbJn8M0isW4amxf62+
 ZlxuYNGlZTyMhD0owpp85KPSdA==
X-Google-Smtp-Source: ABdhPJwmTBtqgp6npdl3YbcuVOQjjyO/QiSEQB9WJTHHPJOwQspouXgZ6nTrVq0RISmAFLaLY0mxEw==
X-Received: by 2002:a1c:23c4:: with SMTP id j187mr2477999wmj.58.1596619361389; 
 Wed, 05 Aug 2020 02:22:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o125sm2164068wma.27.2020.08.05.02.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:22:40 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:22:39 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 42/59] drm/vmwgfx/ttm: use wrapper to access memory manager
Message-ID: <20200805092239.GC6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-43-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-43-airlied@gmail.com>
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

On Tue, Aug 04, 2020 at 12:56:15PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 23 +++++++++++--------
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  4 ++--
>  3 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index f368a9cc0c2a..6ed92f38b54b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -634,7 +634,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
>  	ret = ttm_range_man_init(&dev_priv->bdev, man,
>  				 dev_priv->vram_size >> PAGE_SHIFT);
>  #endif
> -	dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
> +	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
>  	return ret;
>  }
>  
> @@ -644,7 +644,7 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
>  	vmw_thp_fini(dev_priv);
>  #else
>  	ttm_bo_man_fini(&dev_priv->bdev,
> -			    &dev_priv->bdev.man[TTM_PL_VRAM]);
> +			ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM));
>  #endif
>  }
>  
> @@ -887,7 +887,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>  		DRM_ERROR("Failed initializing TTM buffer object driver.\n");
>  		goto out_no_bdev;
>  	}
> -	dev_priv->bdev.man[TTM_PL_SYSTEM].available_caching =
> +	ttm_manager_type(&dev_priv->bdev, TTM_PL_SYSTEM)->available_caching =
>  		TTM_PL_FLAG_CACHED;
>  
>  	/*
> @@ -1194,10 +1194,12 @@ static void vmw_master_drop(struct drm_device *dev,
>   */
>  static void __vmw_svga_enable(struct vmw_private *dev_priv)
>  {
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
> +
>  	spin_lock(&dev_priv->svga_lock);
> -	if (!dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
> +	if (!man->use_type) {
>  		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
> -		dev_priv->bdev.man[TTM_PL_VRAM].use_type = true;
> +		man->use_type = true;
>  	}
>  	spin_unlock(&dev_priv->svga_lock);
>  }
> @@ -1223,9 +1225,11 @@ void vmw_svga_enable(struct vmw_private *dev_priv)
>   */
>  static void __vmw_svga_disable(struct vmw_private *dev_priv)
>  {
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
> +
>  	spin_lock(&dev_priv->svga_lock);
> -	if (dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
> -		dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
> +	if (man->use_type) {
> +		man->use_type = false;
>  		vmw_write(dev_priv, SVGA_REG_ENABLE,
>  			  SVGA_REG_ENABLE_HIDE |
>  			  SVGA_REG_ENABLE_ENABLE);
> @@ -1242,6 +1246,7 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
>   */
>  void vmw_svga_disable(struct vmw_private *dev_priv)
>  {
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>  	/*
>  	 * Disabling SVGA will turn off device modesetting capabilities, so
>  	 * notify KMS about that so that it doesn't cache atomic state that
> @@ -1257,8 +1262,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>  	vmw_kms_lost_device(dev_priv->dev);
>  	ttm_write_lock(&dev_priv->reservation_sem, false);
>  	spin_lock(&dev_priv->svga_lock);
> -	if (dev_priv->bdev.man[TTM_PL_VRAM].use_type) {
> -		dev_priv->bdev.man[TTM_PL_VRAM].use_type = false;
> +	if (man->use_type) {
> +		man->use_type = false;
>  		spin_unlock(&dev_priv->svga_lock);
>  		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
>  			DRM_ERROR("Failed evicting VRAM buffers.\n");
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index ec1b5bb01a93..54c85a59dd8b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -98,7 +98,7 @@ static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
>  
>  int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  {
> -	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
>  	struct vmwgfx_gmrid_man *gman =
>  		kzalloc(sizeof(*gman), GFP_KERNEL);
>  
> @@ -135,7 +135,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  
>  void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
>  {
> -	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
>  	struct vmwgfx_gmrid_man *gman =
>  		(struct vmwgfx_gmrid_man *)man->priv;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 548f152b9963..720a24214c74 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -117,7 +117,7 @@ static void vmw_thp_put_node(struct ttm_mem_type_manager *man,
>  
>  int vmw_thp_init(struct vmw_private *dev_priv)
>  {
> -	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>  	struct vmw_thp_manager *rman;
>  	man->available_caching = TTM_PL_FLAG_CACHED;
>  	man->default_caching = TTM_PL_FLAG_CACHED;
> @@ -137,7 +137,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>  
>  void vmw_thp_fini(struct vmw_private *dev_priv)
>  {
> -	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>  	struct vmw_thp_manager *rman = (struct vmw_thp_manager *) man->priv;
>  	struct drm_mm *mm = &rman->mm;
>  	int ret;
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
