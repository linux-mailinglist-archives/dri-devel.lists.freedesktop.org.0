Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947B1A2152
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 14:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7882B6EA49;
	Wed,  8 Apr 2020 12:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01646EA49
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:07:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a25so7550740wrd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=04au/APisT4u3ZJd0QGSjFIKoPfTw5pesO0fdtrLymc=;
 b=kJEFQeSnI1uVfFX6eyEXnFmr59bbMNp9Kq8p6qdur6HnMwJfRykaYZqrKCOyxIqS4l
 gRa1TLDbpgRZVEwdO1gwW5zCoMcHogN3Rrrmy4HM7ZRH6tsX8NvFbTCYnwpwy6ZlLWGt
 0PSS5z8Q+MJtPOKTk/V0DC4gdkje1IzxCxzSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=04au/APisT4u3ZJd0QGSjFIKoPfTw5pesO0fdtrLymc=;
 b=kAgqtJgX1Q/K1b36bRwv64SYeH9p+kIsw9cAjSZyGr5it09+p6kCts1De/k0O6fYpn
 mOMulC7sw+Nv6hvTz4vnzG7uuqDi2Yw0hRSKVk5GHKVZ0c4+yCJvHs/H1tjDNC6BE+dS
 8Qd4cE/mAsPmVOmqw9f/y0pO5GrL1IaybQ56AMLxAh5EZBS9B2mcvobcjXPGNLWktjTM
 GdRdHWfqAu69uXBnCSNoMihL5WUmCa8+15drrzicUVQ0170vGYFD2N2W5bEqxvrHB083
 4un3Y/fpGv+o38aqIbYZ/ZI1IVVQVMApJfIbdzRn5oZA4Xh+FUs8xreQmBqbKF+nhvi5
 s2jw==
X-Gm-Message-State: AGi0PualYrjLVu+3nWJO00T7i1LCYc1m78ZeDwFL5qUwbbYCpEL6w6Wm
 0wkgu9djK5RHlhCmD9p875+Ciw==
X-Google-Smtp-Source: APiQypIw1uVDCJzq54weB3MKg/1sOyfu5lDNKgL29rpnZAQ1e/t2RVvpNhAWEBamcNKLB2zMkKbiqw==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr8031430wru.35.1586347621345; 
 Wed, 08 Apr 2020 05:07:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 91sm30402064wrf.79.2020.04.08.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 05:07:00 -0700 (PDT)
Date: Wed, 8 Apr 2020 14:06:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/3] gpu/drm: ingenic: Add option to mmap GEM buffers
 cached
Message-ID: <20200408120658.GK3456981@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200226043041.289764-1-paul@crapouillou.net>
 <20200226043041.289764-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226043041.289764-3-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 01:30:41AM -0300, Paul Cercueil wrote:
> Ingenic SoCs are most notably used in cheap chinese handheld gaming
> consoles. There, the games and applications generally render in software
> directly in the emulated framebuffer using SDL1.
> 
> Since the emulated framebuffer is mapped as write-combine by default,
> these applications start to run really slow as soon as alpha-blending is
> used.
> 
> Add a 'cached_gem_buffers' option to the ingenic-drm driver to mmap the
> GEM buffers as fully cached to address this issue.
> 
> v2: Use standard noncoherent DMA APIs
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Dumb buffers don't have any cache flushing controls, so without a ->dirty
callback I'm not sure how this exactly works. I think you need a pile more
here.

Also there's a prefere_shadow bit that you're supposed to set in this
case, and which userspace is supposed to obey.

Also kinda surprised that fbdev userspace is this bad, since generally all
of fbdev is wc. Traditionally at least.
-Daniel

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 35 +++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 3f8cc98d41fe..e51ac8d62d27 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -6,6 +6,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-noncoherent.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -30,6 +32,11 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> +static bool ingenic_drm_cached_gem_buf;
> +module_param_named(cached_gem_buffers, ingenic_drm_cached_gem_buf, bool, 0400);
> +MODULE_PARM_DESC(cached_gem_buffers,
> +		 "Enable fully cached GEM buffers [default=false]");
> +
>  #define JZ_REG_LCD_CFG				0x00
>  #define JZ_REG_LCD_VSYNC			0x04
>  #define JZ_REG_LCD_HSYNC			0x08
> @@ -379,15 +386,23 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  	struct drm_plane_state *state = plane->state;
>  	unsigned int width, height, cpp;
>  	dma_addr_t addr;
> +	uint32_t len;
>  
>  	if (state && state->fb) {
>  		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
> +
>  		width = state->src_w >> 16;
>  		height = state->src_h >> 16;
>  		cpp = state->fb->format->cpp[plane->index];
> +		len = width * height * cpp;
> +
> +		if (ingenic_drm_cached_gem_buf) {
> +			dma_cache_sync(priv->dev, phys_to_virt(addr),
> +				       len, DMA_TO_DEVICE);
> +		}
>  
>  		priv->dma_hwdesc->addr = addr;
> -		priv->dma_hwdesc->cmd = width * height * cpp / 4;
> +		priv->dma_hwdesc->cmd = len / 4;
>  		priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
>  	}
>  }
> @@ -532,6 +547,22 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
>  
>  DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>  
> +static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
> +				struct vm_area_struct *vma)
> +{
> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	struct ingenic_drm *priv = drm_device_get_priv(obj->dev);
> +	unsigned long attrs = DMA_ATTR_NON_CONSISTENT;
> +
> +	if (!ingenic_drm_cached_gem_buf)
> +		return drm_gem_cma_prime_mmap(obj, vma);
> +
> +	vma->vm_page_prot = dma_pgprot(priv->dev, vma->vm_page_prot, attrs);
> +
> +	return dma_mmap_attrs(priv->dev, vma, cma_obj->vaddr, cma_obj->paddr,
> +			      vma->vm_end - vma->vm_start, attrs);
> +}
> +
>  static struct drm_driver ingenic_drm_driver_data = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name			= "ingenic-drm",
> @@ -553,7 +584,7 @@ static struct drm_driver ingenic_drm_driver_data = {
>  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
>  	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
>  	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> +	.gem_prime_mmap		= ingenic_drm_gem_mmap,
>  
>  	.irq_handler		= ingenic_drm_irq_handler,
>  	.release		= ingenic_drm_release,
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
