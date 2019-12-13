Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C811E1A5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC7C6E30D;
	Fri, 13 Dec 2019 10:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0352A6E30D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:08:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so6038927wrq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UW6D1jIy99eZZV/EuRfHxEBTGGvIfoBXatPaTBRLxRM=;
 b=Fyj4210IUuG3w3k2X5cu1ztanOd5czzWULPRxMVY7PI7aEwr4pkTzUGPegnYUZiqsI
 tlR419chuJfzzzngFMPRs1YLCj794aZTRhBZxDpUtPXM5MHkdAALpntTfWyw7dq/G0Ij
 X5HMFnX3OpCdq/2cysvU4n+d30pKg8qqLzN1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UW6D1jIy99eZZV/EuRfHxEBTGGvIfoBXatPaTBRLxRM=;
 b=MZ+K2E5JgCFMNAu8KMXnZPrc5+Z+7IeSa2ypIxP0Vf9J1Dlz3zrsdiceyIxxbgoyVQ
 36HfsVDAaczD1QsdxxjxBFEzpz4wyipNhAM0hpG0W+bqnQ3lEp+13FklLqL3ZThBnLjC
 PFuPTMtYWNXktOMj5FrWHsCazPcBC71EHFW0kQMAP+o3MxvRUQyH1lXv2y0qYipZ51O+
 EllwbPo2GI8i3nL1ThDZ4SKAcANMcNTxaRvvKY0i/UBXqZ7haVNJucaPithis1TIK86H
 2tFah0ua/u9Uj2qcqr5lnnYRGje8YJgDEnmkKHJrEI/G3wufeFAMpI45bpLk1fyUH1ky
 XsTw==
X-Gm-Message-State: APjAAAX+CgtV7A8YMyPeo+mRPnEnWQFSEXI9yAVBQ5OS6GwTZLE0UlSM
 s820MN7gL5Vb2mcTsE+uqIrtgOPnyNc=
X-Google-Smtp-Source: APXvYqzx+9Z8WLnQlGOvG8nls0PMZgPcMYkeKy7OJ/VPcHdfXm9keDe54sjKR9g4afywEDkcg/+7tg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr4472133wrt.339.1576231711548; 
 Fri, 13 Dec 2019 02:08:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id 2sm9423750wrq.31.2019.12.13.02.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:08:30 -0800 (PST)
Date: Fri, 13 Dec 2019 11:08:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/vram-helper: Remove BO device from public
 interface
Message-ID: <20191213100828.GC624164@phenom.ffwll.local>
References: <20191211180832.7159-1-tzimmermann@suse.de>
 <20191211180832.7159-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211180832.7159-3-tzimmermann@suse.de>
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

On Wed, Dec 11, 2019 at 07:08:31PM +0100, Thomas Zimmermann wrote:
> TTM is an implementation detail of the VRAM helpers and therefore
> shouldn't be exposed to the callers. There's only one correct value
> for the BO device anyway, which is the one stored in the DRM device.
> 
> So remove struct ttm_bo_device from the VRAM-helper interface and
> use the device's VRAM manager unconditionally. The GEM initializer
> function fails if the VRAM manager has not been initialized.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

If/when someone is really bored I think might be really nice to create
something like drm_device.gem (or .mm) like we have for
drm_device.mode_config ... drm_device is an unwieldy monster.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ast/ast_mode.c              |  3 +--
>  drivers/gpu/drm/drm_gem_vram_helper.c       | 21 +++++++++------------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c    |  3 +--
>  drivers/gpu/drm/mgag200/mgag200_drv.c       |  3 +--
>  include/drm/drm_gem_vram_helper.h           |  2 --
>  6 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 26336642dd59..f4fbdab29bb7 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1144,8 +1144,7 @@ static int ast_cursor_init(struct drm_device *dev)
>  	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>  
>  	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
> -		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
> -					  size, 0);
> +		gbo = drm_gem_vram_create(dev, size, 0);
>  		if (IS_ERR(gbo)) {
>  			ret = PTR_ERR(gbo);
>  			goto err_drm_gem_vram_put;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 4908f1281002..b760fd27f3c0 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -92,13 +92,18 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
>  }
>  
>  static int drm_gem_vram_init(struct drm_device *dev,
> -			     struct ttm_bo_device *bdev,
>  			     struct drm_gem_vram_object *gbo,
>  			     size_t size, unsigned long pg_align)
>  {
> +	struct drm_vram_mm *vmm = dev->vram_mm;
> +	struct ttm_bo_device *bdev;
>  	int ret;
>  	size_t acc_size;
>  
> +	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
> +		return -EINVAL;
> +	bdev = &vmm->bdev;
> +
>  	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
>  
>  	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
> @@ -126,7 +131,6 @@ static int drm_gem_vram_init(struct drm_device *dev,
>  /**
>   * drm_gem_vram_create() - Creates a VRAM-backed GEM object
>   * @dev:		the DRM device
> - * @bdev:		the TTM BO device backing the object
>   * @size:		the buffer size in bytes
>   * @pg_align:		the buffer's alignment in multiples of the page size
>   *
> @@ -135,7 +139,6 @@ static int drm_gem_vram_init(struct drm_device *dev,
>   * an ERR_PTR()-encoded error code otherwise.
>   */
>  struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
> -						struct ttm_bo_device *bdev,
>  						size_t size,
>  						unsigned long pg_align)
>  {
> @@ -146,7 +149,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  	if (!gbo)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = drm_gem_vram_init(dev, bdev, gbo, size, pg_align);
> +	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
>  	if (ret < 0)
>  		goto err_kfree;
>  
> @@ -480,7 +483,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
>  	Helper for implementing &struct drm_driver.dumb_create
>   * @file:		the DRM file
>   * @dev:		the DRM device
> - * @bdev:		the TTM BO device managing the buffer object
>   * @pg_align:		the buffer's alignment in multiples of the page size
>   * @args:		the arguments as provided to \
>  				&struct drm_driver.dumb_create
> @@ -496,7 +498,6 @@ EXPORT_SYMBOL(drm_gem_vram_vunmap);
>   */
>  int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  				  struct drm_device *dev,
> -				  struct ttm_bo_device *bdev,
>  				  unsigned long pg_align,
>  				  struct drm_mode_create_dumb *args)
>  {
> @@ -512,7 +513,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  	if (!size)
>  		return -EINVAL;
>  
> -	gbo = drm_gem_vram_create(dev, bdev, size, pg_align);
> +	gbo = drm_gem_vram_create(dev, size, pg_align);
>  	if (IS_ERR(gbo))
>  		return PTR_ERR(gbo);
>  
> @@ -604,11 +605,7 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
>  				    struct drm_device *dev,
>  				    struct drm_mode_create_dumb *args)
>  {
> -	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
> -		return -EINVAL;
> -
> -	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev, 0,
> -					     args);
> +	return drm_gem_vram_fill_create_dumb(file, dev, 0, args);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> index 16f5cd2c1b3b..4a5bde80045a 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
> @@ -58,7 +58,7 @@ int hibmc_gem_create(struct drm_device *dev, u32 size, bool iskernel,
>  	if (size == 0)
>  		return -EINVAL;
>  
> -	gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev, size, 0);
> +	gbo = drm_gem_vram_create(dev, size, 0);
>  	if (IS_ERR(gbo)) {
>  		ret = PTR_ERR(gbo);
>  		if (ret != -ERESTARTSYS)
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> index dd54fd507e13..d491edd317ff 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> @@ -208,8 +208,7 @@ int mgag200_cursor_init(struct mga_device *mdev)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < ncursors; ++i) {
> -		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
> -					  size, 0);
> +		gbo = drm_gem_vram_create(dev, size, 0);
>  		if (IS_ERR(gbo)) {
>  			ret = PTR_ERR(gbo);
>  			goto err_drm_gem_vram_put;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index dc125838f5d1..1b5b60da2e62 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -120,8 +120,7 @@ int mgag200_driver_dumb_create(struct drm_file *file,
>  	if (mgag200_pin_bo_at_0(mdev))
>  		pg_align = PFN_UP(mdev->mc.vram_size);
>  
> -	return drm_gem_vram_fill_create_dumb(file, dev, &dev->vram_mm->bdev,
> -					     pg_align, args);
> +	return drm_gem_vram_fill_create_dumb(file, dev, pg_align, args);
>  }
>  
>  static struct drm_driver driver = {
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 90736427285e..9341f54383b3 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -93,7 +93,6 @@ static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
>  }
>  
>  struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
> -						struct ttm_bo_device *bdev,
>  						size_t size,
>  						unsigned long pg_align);
>  void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
> @@ -109,7 +108,6 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
>  
>  int drm_gem_vram_fill_create_dumb(struct drm_file *file,
>  				  struct drm_device *dev,
> -				  struct ttm_bo_device *bdev,
>  				  unsigned long pg_align,
>  				  struct drm_mode_create_dumb *args);
>  
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
