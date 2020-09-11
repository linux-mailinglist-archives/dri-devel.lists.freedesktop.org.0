Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD46265B3E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732416E388;
	Fri, 11 Sep 2020 08:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642F86E36F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:14:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so10551362wrx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G0oyitWRiinDoICjGYeoh1HzR/rNf5XGFFRU5bGVxy4=;
 b=iXL8ANzgMewtHoaJE85FZJrOdBU5YSkNPFa+Fv98Ff66/79XfahbdlDLwrolTzDffr
 Op6ydZathEqGCDmSgOix35gp+AqBfsPlb6W6QpoPOZFr2NtEJoAI9k3aEPL4jr7Yklny
 5mLqt4uKaXAXdUWpqRpLXNQVlw11ppiKAsfWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G0oyitWRiinDoICjGYeoh1HzR/rNf5XGFFRU5bGVxy4=;
 b=gzLV5Hqcu5myMdEgFzp2xctBr5NySSc1bC9azhLSuJfVxNbC61fM/ikNSh33zswUtR
 P43FKbDlEdXDpOWieCZ4iMhWkcB6pF+BSCwmUrLVcMNoZ+vpg2+T1jaAzfSZgQyA7ny2
 KBxzmTFZL2h6Fn/dCf2goPrfrwVP5/biDH7ELl8Ew7omdhSzEx2zjmMaZuj5ZoHNOs3E
 CuTW5x2WCpzcm4ddov+xrUlCALF2PvHbBSTdwfT/WkJKRCOq0YFEjVRyJ0RKOFZAyEPh
 ne9Z1gV/Euj7hT6uS69RofZxHI0kfMRVI3qeABjY4lW2ZtLvwmSCgLdOHfdkyezx7AlH
 qnzA==
X-Gm-Message-State: AOAM533cOPUELOxMRfqJgTodUwB4JRj4vDB/2/2OnO7bArtLV6pFYidN
 hkbqN8Ijh1CR9ROpsIFu3ZDRNQ==
X-Google-Smtp-Source: ABdhPJzqIhhFaT3LPgJZx9vgwh0pvCV/w91YC0fj23SmIHTj66NkV5RxWhxlIGUyhl7DdZHIC94gSA==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr816975wrr.402.1599812047793; 
 Fri, 11 Sep 2020 01:14:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t202sm2804806wmt.14.2020.09.11.01.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:14:07 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:14:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
Message-ID: <20200911081405.GL438822@phenom.ffwll.local>
References: <20200911075922.19317-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911075922.19317-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 09:59:22AM +0200, Thomas Zimmermann wrote:
> VRAM helpers support ref counting for pin and vmap operations, no need
> to avoid these operations, by employing the internal kmap interface. Just
> use drm_gem_vram_vmap() and let it handle the details.
> 
> Also unexport the kmap interfaces from VRAM helpers. Vboxvideo was the
> last user of these internal functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Oh I got confused for a bit about ttm's usage of kmap. Usually that means
the per-page mapping done by the kmap() functions, might be a good idea to
rename that to vmap for consistency with dma-buf and everything outside of
ttm.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 56 +--------------------------
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++--
>  include/drm/drm_gem_vram_helper.h     |  3 --
>  3 files changed, 8 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 07447abb4134..0e3cdc40379c 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -97,8 +97,8 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>   * hardware's draing engine.
>   *
>   * To access a buffer object's memory from the DRM driver, call
> - * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
> - * space and returns the memory address. Use drm_gem_vram_kunmap() to
> + * drm_gem_vram_vmap(). It maps the buffer into kernel address
> + * space and returns the memory address. Use drm_gem_vram_vunmap() to
>   * release the mapping.
>   */
>  
> @@ -436,39 +436,6 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
>  	return kmap->virtual;
>  }
>  
> -/**
> - * drm_gem_vram_kmap() - Maps a GEM VRAM object into kernel address space
> - * @gbo:	the GEM VRAM object
> - * @map:	establish a mapping if necessary
> - * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
> -	otherwise; can be NULL
> - *
> - * This function maps the buffer object into the kernel's address space
> - * or returns the current mapping. If the parameter map is false, the
> - * function only queries the current mapping, but does not establish a
> - * new one.
> - *
> - * Returns:
> - * The buffers virtual address if mapped, or
> - * NULL if not mapped, or
> - * an ERR_PTR()-encoded error code otherwise.
> - */
> -void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
> -			bool *is_iomem)
> -{
> -	int ret;
> -	void *virtual;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
> -	if (ret)
> -		return ERR_PTR(ret);
> -	virtual = drm_gem_vram_kmap_locked(gbo, map, is_iomem);
> -	ttm_bo_unreserve(&gbo->bo);
> -
> -	return virtual;
> -}
> -EXPORT_SYMBOL(drm_gem_vram_kmap);
> -
>  static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
>  {
>  	if (WARN_ON_ONCE(!gbo->kmap_use_count))
> @@ -484,22 +451,6 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
>  	 */
>  }
>  
> -/**
> - * drm_gem_vram_kunmap() - Unmaps a GEM VRAM object
> - * @gbo:	the GEM VRAM object
> - */
> -void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
> -{
> -	int ret;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
> -	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
> -		return;
> -	drm_gem_vram_kunmap_locked(gbo);
> -	ttm_bo_unreserve(&gbo->bo);
> -}
> -EXPORT_SYMBOL(drm_gem_vram_kunmap);
> -
>  /**
>   * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
>   *                       space
> @@ -511,9 +462,6 @@ EXPORT_SYMBOL(drm_gem_vram_kunmap);
>   * permanently. Call drm_gem_vram_vunmap() with the returned address to
>   * unmap and unpin the GEM VRAM object.
>   *
> - * If you have special requirements for the pinning or mapping operations,
> - * call drm_gem_vram_pin() and drm_gem_vram_kmap() directly.
> - *
>   * Returns:
>   * The buffer's virtual address on success, or
>   * an ERR_PTR()-encoded error code otherwise.
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index d9a5af62af89..4fcc0a542b8a 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -397,11 +397,13 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  
>  	vbox_crtc->cursor_enabled = true;
>  
> -	/* pinning is done in prepare/cleanup framebuffer */
> -	src = drm_gem_vram_kmap(gbo, true, NULL);
> +	src = drm_gem_vram_vmap(gbo);
>  	if (IS_ERR(src)) {
> +		/*
> +		 * BUG: we should have pinned the BO in prepare_fb().
> +		 */
>  		mutex_unlock(&vbox->hw_mutex);
> -		DRM_WARN("Could not kmap cursor bo, skipping update\n");
> +		DRM_WARN("Could not map cursor bo, skipping update\n");
>  		return;
>  	}
>  
> @@ -414,7 +416,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  	data_size = width * height * 4 + mask_size;
>  
>  	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> -	drm_gem_vram_kunmap(gbo);
> +	drm_gem_vram_vunmap(gbo, src);
>  
>  	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>  		VBOX_MOUSE_POINTER_ALPHA;
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 035332f3723f..b34f1da89cc7 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -101,9 +101,6 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>  int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
> -void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
> -			bool *is_iomem);
> -void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
>  void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
>  void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
>  
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
