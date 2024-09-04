Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1A96B793
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ED910E732;
	Wed,  4 Sep 2024 09:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SFjl3jC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4392510E732
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:59:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso5162175e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725443972; x=1726048772; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pwTQ9BYcyCTTu26BAM9NZqDIJJHvzPy5jR6K2qm1XMo=;
 b=SFjl3jC9K7OtJospg/O6BYjBySJpawPB/C3R3Sf6cUugIcVh1Lwc8129s6mU64s7mD
 z+S8d9h2bmZ4gJ3RjmcTGKIKvJD0yadHPz2EXOzB39PNjFP6Ba08FGcB3yiCCfoS76cr
 IpkZ9AdbL6Cr/q7IBQEKHm7jUDPOsIqjirYGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443972; x=1726048772;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwTQ9BYcyCTTu26BAM9NZqDIJJHvzPy5jR6K2qm1XMo=;
 b=jZngB+mJqlmh0EbN2yqcZh3CLz3eqWONQcjxeHQ0NMpEI81iei0WKfE7HxnaDYyKIs
 D36HxSY/Oh+OdRTLNJXeYnJwZ2WeDmigDZ/+pqb81rgF2p1fW9kr/989tfgPzg377jUE
 6B7puRmJZK/ZfhdDMeOmWDlplQotnt67PezQp9SxKJKm3C6TOij5iBIuljN3pSvgBI+j
 016oG4Q8l+iNCsoVmMb7Y71/a3LeFpO4iN5NkJxGGSw0A61k+Y7TPmwHeN60Yzz/jpHK
 mkonWGh6g+F6GgiiSMPS7EB2TgZTmwC1jjMwLt5xxc0QkVXlVipeJvQ5TnP8hFiiiVuZ
 EOJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuRlq3WHthdgEhzYrEZY7bXAjtSq2lRMvn8aU+damHO8Tr2HlsCDYfl8myAn7shjfDU789jxevRSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjDjT9usu1SHsVBy84VQ4l5PLKXkOpXAIv0NFuSnG5ufZGtgUz
 8j30kki8DkT9fMk+pvCi0zWmNmJaeM1j01qSUibIKkXEcTsmwe16NpbkvhDgJPo=
X-Google-Smtp-Source: AGHT+IHt2AJa+foJP8qwCEYMoWa4eEwqC0hPk2Fg6kzprjR/w6SYD/cFQz6J/QgqZFZ6wT29RSvgnA==
X-Received: by 2002:a05:600c:230d:b0:426:6696:9e50 with SMTP id
 5b1f17b1804b1-42c97fc2065mr2646505e9.14.1725443971437; 
 Wed, 04 Sep 2024 02:59:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42baf1b0c18sm217483955e9.37.2024.09.04.02.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:59:31 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:59:29 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, alexander.stein@ew.tq-group.com,
 linus.walleij@linaro.org, daniel@ffwll.ch, airlied@gmail.com,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/fbdev-dma: Only install deferred I/O if necessary
Message-ID: <ZtgvgUT-ZvLIMeIb@phenom.ffwll.local>
References: <20240904093140.15203-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904093140.15203-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Sep 04, 2024 at 11:31:23AM +0200, Thomas Zimmermann wrote:
> Deferred I/O requires struct page for framebuffer memory, which is
> not guaranteed for all DMA ranges. We thus only install deferred I/O
> if we have a framebuffer that requires it.
> 
> A reported bug affected the ipu-v3 and pl111 drivers, which have video
> memory in either Normal or HighMem zones
> 
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
> [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
> 
> where deferred I/O only works correctly with HighMem. See the Closes
> tags for bug reports.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferred I/O")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/all/23636953.6Emhk5qWAg@steina-w/
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com/
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>

I guess yet another reason we should look into vma-interception using
mkwrite and read-only ptes, but that's a lot of typing and I think this
should work interim at least.

> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 71 ++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 7ef5a48c8029..455dc48d17a7 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -36,20 +36,11 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
>  	return 0;
>  }
>  
> -FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
> -				   drm_fb_helper_damage_range,
> -				   drm_fb_helper_damage_area);
> -
>  static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  {
>  	struct drm_fb_helper *fb_helper = info->par;
> -	struct drm_framebuffer *fb = fb_helper->fb;
> -	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
>  
> -	if (!dma->map_noncoherent)
> -		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> -
> -	return fb_deferred_io_mmap(info, vma);
> +	return drm_gem_prime_mmap(fb_helper->buffer->gem, vma);
>  }
>  
>  static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
> @@ -70,13 +61,40 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>  }
>  
>  static const struct fb_ops drm_fbdev_dma_fb_ops = {
> +	.owner = THIS_MODULE,
> +	.fb_open = drm_fbdev_dma_fb_open,
> +	.fb_release = drm_fbdev_dma_fb_release,
> +	__FB_DEFAULT_DMAMEM_OPS_RDWR,
> +	DRM_FB_HELPER_DEFAULT_OPS,
> +	__FB_DEFAULT_DMAMEM_OPS_DRAW,
> +	.fb_mmap = drm_fbdev_dma_fb_mmap,
> +	.fb_destroy = drm_fbdev_dma_fb_destroy,
> +};
> +
> +FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
> +				   drm_fb_helper_damage_range,
> +				   drm_fb_helper_damage_area);
> +
> +static int drm_fbdev_dma_deferred_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_framebuffer *fb = fb_helper->fb;
> +	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	if (!dma->map_noncoherent)
> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> +
> +	return fb_deferred_io_mmap(info, vma);
> +}
> +
> +static const struct fb_ops drm_fbdev_dma_deferred_fb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_open = drm_fbdev_dma_fb_open,
>  	.fb_release = drm_fbdev_dma_fb_release,
>  	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_dma),
>  	DRM_FB_HELPER_DEFAULT_OPS,
>  	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_dma),
> -	.fb_mmap = drm_fbdev_dma_fb_mmap,
> +	.fb_mmap = drm_fbdev_dma_deferred_fb_mmap,
>  	.fb_destroy = drm_fbdev_dma_fb_destroy,
>  };
>  
> @@ -89,6 +107,7 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
>  	struct drm_device *dev = fb_helper->dev;
> +	bool use_deferred_io = false;
>  	struct drm_client_buffer *buffer;
>  	struct drm_gem_dma_object *dma_obj;
>  	struct drm_framebuffer *fb;
> @@ -111,6 +130,15 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  
>  	fb = buffer->fb;
>  
> +	/*
> +	 * Deferred I/O requires struct page for framebuffer memory,
> +	 * which is not guaranteed for all DMA ranges. We thus only
> +	 * install deferred I/O if we have a framebuffer that requires
> +	 * it.
> +	 */
> +	if (fb->funcs->dirty)
> +		use_deferred_io = true;
> +
>  	ret = drm_client_buffer_vmap(buffer, &map);
>  	if (ret) {
>  		goto err_drm_client_buffer_delete;
> @@ -130,7 +158,10 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  
>  	drm_fb_helper_fill_info(info, fb_helper, sizes);
>  
> -	info->fbops = &drm_fbdev_dma_fb_ops;
> +	if (use_deferred_io)
> +		info->fbops = &drm_fbdev_dma_deferred_fb_ops;
> +	else
> +		info->fbops = &drm_fbdev_dma_fb_ops;
>  
>  	/* screen */
>  	info->flags |= FBINFO_VIRTFB; /* system memory */
> @@ -145,13 +176,15 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  	info->fix.smem_len = info->screen_size;
>  
>  	/* deferred I/O */
> -	fb_helper->fbdefio.delay = HZ / 20;
> -	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> -
> -	info->fbdefio = &fb_helper->fbdefio;
> -	ret = fb_deferred_io_init(info);
> -	if (ret)
> -		goto err_drm_fb_helper_release_info;
> +	if (use_deferred_io) {

I think a check here that roughly matches what fb_deferred_io_get_page
does would be good. Specifically this part

	if (is_vmalloc_addr(screen_buffer + offs))
		page = vmalloc_to_page(screen_buffer + offs);
	else if (info->fix.smem_start)
		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);

So maybe something like:

	if (!is_vmalloc_addr(screen_buffer))
		if (WARN_ON(!pfn_to_page())))
			use_deferred_io = false;

With maye a comment that we assume buffers aren't a hiliarious mix? 

I worry about drivers that a) are on very special platforms where our dma
memory might not be page backed and b) use manual upload like over i2c or
spi. That sounds like a rather like embedded use-case combo ...

With something like that added:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
> +		fb_helper->fbdefio.delay = HZ / 20;
> +		fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> +
> +		info->fbdefio = &fb_helper->fbdefio;
> +		ret = fb_deferred_io_init(info);
> +		if (ret)
> +			goto err_drm_fb_helper_release_info;
> +	}
>  
>  	return 0;
>  
> -- 
> 2.46.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
