Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1D397746
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 17:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9399F6E81F;
	Tue,  1 Jun 2021 15:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C846E81F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 15:54:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h12-20020a05600c350cb029019fae7a26cdso164348wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WqUgAHrpDOUpUOXO/CHtnZe/20C1L3Tz7SUmh5uKdic=;
 b=SxNumUnPY4IKba355+/kIgE6CFqG1Es7zT37mTIOq/eyv1lIGuhkg8FVrq3smr+URi
 5xsvO7Wzx0zvf2j3d4Hq05GME8N1aL4E7BI37ziX+UqgF5rkdb81qikzEfaL2JucifaF
 Sex4i9CgwjWyBFaqFyfDNNZrSM4IkoeJekLJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WqUgAHrpDOUpUOXO/CHtnZe/20C1L3Tz7SUmh5uKdic=;
 b=i0dpiaiI5OR9YO2EMx4P9bI9etfwxzf3JtH0TxnekjGr07BUGcG/nj4PmwZ5T6mgwc
 nCi+8ZEwgP1jNpKLe46pj6BTdUos/p0rOdnvlxKAoZqNZGRcIEDZ9xCksV6o8n5Vb/37
 PPg7C84DmGyOl6aEhFZOxpFaht2lWavBNywNAbs3+xa7TnH0qIfVN/fr5bHuonhfw8lD
 AXZc6ELPevAh20tG+xxU47SdmnpsPbTSYEYDHMnUrD4QZN+Frz+6boJJBSCQeT6gE68C
 Kx6nJy59AtdbdWlo4DIYh5jqKQ2ul3QB/wdBk8iLl1vHPfNHs4suOcBqQ179/LBPRWov
 mDtg==
X-Gm-Message-State: AOAM530wLZ6VPW8MzPPtXlqN0ls0HijIHkvaEcPb+spPHAiyZVt24dbV
 1RLuwDbqbupei1srmGRKWHj1sw==
X-Google-Smtp-Source: ABdhPJw7uj9RFGQr4Tfil+TMNBSjkGRPILTdrqCQ6nejOSzrsHlWlbvEWmUuzyDKYOrzsXlycbH4KQ==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr566126wmk.147.1622562846945; 
 Tue, 01 Jun 2021 08:54:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm3680020wrt.6.2021.06.01.08.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:54:06 -0700 (PDT)
Date: Tue, 1 Jun 2021 17:54:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] drm/ingenic: Add doublescan feature
Message-ID: <YLZYHCFyJvVWui3l@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, list@opendingux.net,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20210527232104.152577-1-paul@crapouillou.net>
 <20210527232206.152771-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527232206.152771-1-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 12:22:05AM +0100, Paul Cercueil wrote:
> A lot of devices with an Ingenic SoC have a weird LCD panel attached,
> where the pixels are not square. For instance, the AUO A030JTN01 and
> Innolux EJ030NA panels have a resolution of 320x480 with a 4:3 aspect
> ratio.
> 
> All userspace applications are built with the assumption that the
> pixels are square. To be able to support these devices without too
> much effort, add a doublescan feature, which allows the f0 and f1
> planes to be used with only half of the screen's vertical resolution,
> where each line of the input is displayed twice.
> 
> This is done using a chained list of DMA descriptors, one descriptor
> per output line.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 93 +++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 2761478b16e8..01d8490393d1 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -66,6 +66,8 @@ struct jz_soc_info {
>  
>  struct ingenic_gem_object {
>  	struct drm_gem_cma_object base;
> +	struct ingenic_dma_hwdesc *hwdescs;
> +	dma_addr_t hwdescs_phys;
>  };
>  
>  struct ingenic_drm_private_state {
> @@ -73,6 +75,23 @@ struct ingenic_drm_private_state {
>  
>  	bool no_vblank;
>  	bool use_palette;
> +
> +	/*
> +	 * A lot of devices with an Ingenic SoC have a weird LCD panel attached,
> +	 * where the pixels are not square. For instance, the AUO A030JTN01 and
> +	 * Innolux EJ030NA panels have a resolution of 320x480 with a 4:3 aspect
> +	 * ratio.
> +	 *
> +	 * All userspace applications are built with the assumption that the
> +	 * pixels are square. To be able to support these devices without too
> +	 * much effort, add a doublescan feature, which allows the f0 and f1
> +	 * planes to be used with only half of the screen's vertical resolution,
> +	 * where each line of the input is displayed twice.
> +	 *
> +	 * This is done using a chained list of DMA descriptors, one descriptor
> +	 * per output line.
> +	 */
> +	bool doublescan;
>  };
>  
>  struct ingenic_drm {
> @@ -465,7 +484,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>  		return PTR_ERR(priv_state);
>  
>  	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> -						  DRM_PLANE_HELPER_NO_SCALING,
> +						  0x8000,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  priv->soc_info->has_osd,
>  						  true);
> @@ -482,6 +501,17 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>  	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
>  		return -EINVAL;
>  
> +	/* Enable doublescan if the CRTC_H is twice the SRC_H. */
> +	priv_state->doublescan = (new_plane_state->src_h >> 16) * 2 == new_plane_state->crtc_h;
> +
> +	/* Otherwise, fail if CRTC_H != SRC_H */
> +	if (!priv_state->doublescan && (new_plane_state->src_h >> 16) != new_plane_state->crtc_h)
> +		return -EINVAL;
> +
> +	/* Fail if CRTC_W != SRC_W */
> +	if ((new_plane_state->src_w >> 16) != new_plane_state->crtc_w)
> +		return -EINVAL;
> +
>  	priv_state->use_palette = new_plane_state->fb &&
>  		new_plane_state->fb->format->format == DRM_FORMAT_C8;
>  
> @@ -647,7 +677,9 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  	struct ingenic_drm_private_state *priv_state;
>  	struct drm_crtc_state *crtc_state;
>  	struct ingenic_dma_hwdesc *hwdesc;
> -	unsigned int width, height, cpp;
> +	unsigned int width, height, cpp, i;
> +	struct drm_gem_object *gem_obj;
> +	struct ingenic_gem_object *obj;
>  	dma_addr_t addr, next_addr;
>  	bool use_f1;
>  	u32 fourcc;
> @@ -664,17 +696,39 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  		height = newstate->src_h >> 16;
>  		cpp = newstate->fb->format->cpp[0];
>  
> +		gem_obj = drm_gem_fb_get_obj(newstate->fb, 0);
> +		obj = to_ingenic_gem_obj(gem_obj);
> +
>  		priv_state = ingenic_drm_get_new_priv_state(priv, state);
>  		if (priv_state && priv_state->use_palette)
>  			next_addr = dma_hwdesc_pal_addr(priv);
>  		else
>  			next_addr = dma_hwdesc_addr(priv, use_f1);
>  
> -		hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
> +		if (priv_state->doublescan) {
> +			hwdesc = &obj->hwdescs[0];
> +			/*
> +			 * Use one DMA descriptor per output line, and display
> +			 * each input line twice.
> +			 */
> +			for (i = 0; i < newstate->crtc_h; i++) {
> +				hwdesc[i].next = obj->hwdescs_phys
> +					+ (i + 1) * sizeof(*hwdesc);
> +				hwdesc[i].addr = addr + (i / 2) * newstate->fb->pitches[0];
> +				hwdesc[i].cmd = newstate->fb->pitches[0] / 4;
> +			}
>  
> -		hwdesc->addr = addr;
> -		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
> -		hwdesc->next = next_addr;
> +			/* We want the EOF IRQ only on the very last transfer */
> +			hwdesc[newstate->crtc_h - 1].cmd |= JZ_LCD_CMD_EOF_IRQ;
> +			hwdesc[newstate->crtc_h - 1].next = next_addr;
> +			priv->dma_hwdescs->hwdesc[use_f1] = *hwdesc;
> +		} else {
> +			/* Use one DMA descriptor for the whole frame. */
> +			hwdesc = &priv->dma_hwdescs->hwdesc[use_f1];
> +			hwdesc->addr = addr;
> +			hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
> +			hwdesc->next = next_addr;
> +		}
>  
>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  			fourcc = newstate->fb->format->format;
> @@ -848,6 +902,13 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
>  
>  static void ingenic_drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  {
> +	struct ingenic_drm *priv = drm_device_get_priv(fb->dev);
> +	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
> +	struct ingenic_gem_object *obj = to_ingenic_gem_obj(gem_obj);
> +
> +	dma_free_coherent(priv->dev,
> +			  sizeof(*obj->hwdescs) * fb->height,
> +			  obj->hwdescs, obj->hwdescs_phys);

You can have multiple fb pointing at the same gem bo. I think with that
this blows up pretty badly.

I think right call is to just move the doublescan mapping to the fb object
entirely, and not have a subclassed gem bo. Userspace shouldn't recreate
fb objects just for fun, so caching at the gem bo level shouldn't be
needed. But if you do need it then you need to refcount it so multiple fb
objects all work out (and they can have different modes even used for
them).

Another option is attaching this to the drm_plane state and setting it up
in prepare_plane/cleanup_plane. But then you probably need some caching at
the obj level (but a simple single slot/last hit cache should be good
enough here). I think this would be the cleanest since doing very
expensive things attached to fb might cause issues, userspace can
create/destroy quite a few of them as part of atomic_test (which skips the
prepare/cleanup_plane part). So this would be the right option if setting
up this dma mapping for doublescan is a more expensive thing to do.
-Daniel

>  	drm_gem_fb_destroy(fb);
>  }
>  
> @@ -868,6 +929,8 @@ ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
>  {
>  	struct ingenic_drm *priv = drm_device_get_priv(drm);
>  	const struct drm_framebuffer_funcs *fb_funcs;
> +	struct drm_gem_object *gem_obj;
> +	struct ingenic_gem_object *obj;
>  	struct drm_framebuffer *fb;
>  
>  	if (priv->soc_info->map_noncoherent)
> @@ -876,6 +939,24 @@ ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
>  		fb_funcs = &ingenic_drm_gem_fb_funcs;
>  
>  	fb = drm_gem_fb_create_with_funcs(drm, file, mode_cmd, fb_funcs);
> +	if (IS_ERR(fb))
> +		return fb;
> +
> +	gem_obj = drm_gem_fb_get_obj(fb, 0);
> +	obj = to_ingenic_gem_obj(gem_obj);
> +
> +	/*
> +	 * Create (fb->height * 2) DMA descriptors, in case we want to use the
> +	 * doublescan feature.
> +	 */
> +	obj->hwdescs = dma_alloc_coherent(priv->dev,
> +					  sizeof(*obj->hwdescs) * fb->height * 2,
> +					  &obj->hwdescs_phys,
> +					  GFP_KERNEL);
> +	if (!obj->hwdescs) {
> +		drm_gem_fb_destroy(fb);
> +		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	return fb;
>  }
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
