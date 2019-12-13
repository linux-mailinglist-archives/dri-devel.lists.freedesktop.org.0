Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C9B11E197
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E24D6E30C;
	Fri, 13 Dec 2019 10:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8E56E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:05:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j42so5938417wrj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=asrFlco2BsEWomCygyWjHLuDy9WzU7d1Mltamcx7c0w=;
 b=az+xynCZnau93Gy8GiYBasz069992kqcBAFRFsSpEX4dYjNiU0wMw3+X++lesQijU/
 /IxjPZTZpJ7V91uhsii/zROWo/pyc+18u/gzKLiSk0OoYv/yQ2ofh1EymwJs54zApfNs
 onyHSObXx+tWZmxzoX/s1cIJnXRxu4QNHMvgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=asrFlco2BsEWomCygyWjHLuDy9WzU7d1Mltamcx7c0w=;
 b=YCNLu9B/UBQV5wvi61w+sRSYP+xVMaqLR+apI11LBnVz1XX3gWPGF4UNPhXu0F1Grz
 GD93x/A6QZVaGV/zkXmt7JVMBWsppaNQpydZhS2FufrPy7m6a01BEfJ60zOE6nmSNHt9
 4d2yhQ6vSzPdK+WCOcAC6n2olcm31CSpxEm/zJNVXqZAWuLybzL7kZ20H9kkhRC7nyY9
 P89q6IPXLJwb6ugbCfmh1hZZNO1C0lprzvKqTVubENQxn/+sCrC6YOIXM/6epLprKKOi
 Fkb4WYvhzINfiqmVKhyaPUM/gB2YQewerqILhOApu/03GApuMHeE9WHu/rpIxBweVoyc
 6mVw==
X-Gm-Message-State: APjAAAUivBkkWRePaMR+DZaHEvfe+KYqQiI1gvamckLRqT7hKNYHMlct
 y9O+OyZy9+ZWx6LB7C5CwOt1Ag==
X-Google-Smtp-Source: APXvYqyH9UzDt97urflOxzjvXro2SyUYTcq1IrglujeqNXqks3K9ZPG09ZQuHFZiSS0/PkQbUTYr3A==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr11706985wrt.41.1576231539322; 
 Fri, 13 Dec 2019 02:05:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id 5sm9541240wrh.5.2019.12.13.02.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:05:38 -0800 (PST)
Date: Fri, 13 Dec 2019 11:05:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/vram-helper: Remove interruptible flag from
 public interface
Message-ID: <20191213100536.GB624164@phenom.ffwll.local>
References: <20191211180832.7159-1-tzimmermann@suse.de>
 <20191211180832.7159-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211180832.7159-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com,
 zourongrong@gmail.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 07:08:30PM +0100, Thomas Zimmermann wrote:
> The flag 'interruptible', which is passed to various functions,
> is always set to be false. Remove it and hard-code the value.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>

Yeah generally we try to make everything interruptible when we except that
we might stall waiting for hw. So display flip code, or when you have an
actual render engine.

For vram helpers I don't see a need for this, everything here should
completely briskly.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Maybe throw a doc patch on top to explain this with a sentence or so?
-Daniel

> ---
>  drivers/gpu/drm/ast/ast_mode.c              |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c       | 17 ++++++-----------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c    |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c       |  2 +-
>  include/drm/drm_gem_vram_helper.h           |  4 +---
>  6 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index b879bd666e35..26336642dd59 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1145,7 +1145,7 @@ static int ast_cursor_init(struct drm_device *dev)
>  
>  	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
>  		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
> -					  size, 0, false);
> +					  size, 0);
>  		if (IS_ERR(gbo)) {
>  			ret = PTR_ERR(gbo);
>  			goto err_drm_gem_vram_put;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 666cb4c22bb9..4908f1281002 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -94,8 +94,7 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
>  static int drm_gem_vram_init(struct drm_device *dev,
>  			     struct ttm_bo_device *bdev,
>  			     struct drm_gem_vram_object *gbo,
> -			     size_t size, unsigned long pg_align,
> -			     bool interruptible)
> +			     size_t size, unsigned long pg_align)
>  {
>  	int ret;
>  	size_t acc_size;
> @@ -112,7 +111,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
>  	drm_gem_vram_placement(gbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
>  
>  	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
> -			  &gbo->placement, pg_align, interruptible, acc_size,
> +			  &gbo->placement, pg_align, false, acc_size,
>  			  NULL, NULL, ttm_buffer_object_destroy);
>  	if (ret)
>  		goto err_drm_gem_object_release;
> @@ -130,7 +129,6 @@ static int drm_gem_vram_init(struct drm_device *dev,
>   * @bdev:		the TTM BO device backing the object
>   * @size:		the buffer size in bytes
>   * @pg_align:		the buffer's alignment in multiples of the page size
> - * @interruptible:	sleep interruptible if waiting for memory
>   *
>   * Returns:
>   * A new instance of &struct drm_gem_vram_object on success, or
> @@ -139,8 +137,7 @@ static int drm_gem_vram_init(struct drm_device *dev,
>  struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  						struct ttm_bo_device *bdev,
>  						size_t size,
> -						unsigned long pg_align,
> -						bool interruptible)
> +						unsigned long pg_align)
>  {
>  	struct drm_gem_vram_object *gbo;
>  	int ret;
> @@ -149,7 +146,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  	if (!gbo)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align, interruptible);
> +	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align);
>  	if (ret < 0)
>  		goto err_kfree;
>  
> @@ -485,7 +482,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
>   * @dev:		the DRM device
>   * @bdev:		the TTM BO device managing the buffer object
>   * @pg_align:		the buffer's alignment in multiples of the page size
> - * @interruptible:	sleep interruptible if waiting for memory
>   * @args:		the arguments as provided to \
>  				&struct drm_driver.dumb_create
>   *
> @@ -502,7 +498,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  				  struct drm_device *dev,
>  				  struct ttm_bo_device *bdev,
>  				  unsigned long pg_align,
> -				  bool interruptible,
>  				  struct drm_mode_create_dumb *args)
>  {
>  	size_t pitch, size;
> @@ -517,7 +512,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  	if (!size)
>  		return -EINVAL;
>  
> -	gbo = drm_gem_vram_create(dev, bdev, size, pg_align, interruptible);
> +	gbo = drm_gem_vram_create(dev, bdev, size, pg_align);
>  	if (IS_ERR(gbo))
>  		return PTR_ERR(gbo);
>  
> @@ -613,7 +608,7 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
>  		return -EINVAL;
>  
>  	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev, 0,
> -					     false, args);
> +					     args);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> index 21b684eab5c9..16f5cd2c1b3b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -58,7 +58,7 @@ int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
>  	if (size == 0)
>  		return -EINVAL;
>  
> -	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0, false);
> +	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0);
>  	if (IS_ERR(gbo)) {
>  		ret = PTR_ERR(gbo);
>  		if (ret != -ERESTARTSYS)
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> index 5444cf1573a3..dd54fd507e13 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -209,7 +209,7 @@ int mgag200_cursor_init(struct mga_device *mdev)
>  
>  	for (i = 0; i < ncursors; ++i) {
>  		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
> -					  size, 0, false);
> +					  size, 0);
>  		if (IS_ERR(gbo)) {
>  			ret = PTR_ERR(gbo);
>  			goto err_drm_gem_vram_put;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 9f4f5f071add..dc125838f5d1 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -121,7 +121,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
>  		pg_align = PFN_UP(mdev->mc.vram_size);
>  
>  	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
> -					     pg_align, false, args);
> +					     pg_align, args);
>  }
>  
>  static struct drm_driver driver = {
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 08adaf3695ea..90736427285e 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -95,8 +95,7 @@ static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
>  struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  						struct ttm_bo_device *bdev,
>  						size_t size,
> -						unsigned long pg_align,
> -						bool interruptible);
> +						unsigned long pg_align);
>  void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
>  u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
> @@ -112,7 +111,6 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  				  struct drm_device *dev,
>  				  struct ttm_bo_device *bdev,
>  				  unsigned long pg_align,
> -				  bool interruptible,
>  				  struct drm_mode_create_dumb *args);
>  
>  /*
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
