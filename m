Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347949E154
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC2310E187;
	Thu, 27 Jan 2022 11:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67E10E179
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:42:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c23so4248816wrb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZY+FHClB/h9JRVE090zSE+BkyR1qar6dqDb0aaRQfhI=;
 b=DElvUPl0yK3/NBPDTEnbxXzipW2zrdVJrVj2NZoyC8yKQQpHtb0C5p0Ip156ET0RMN
 1pQhHPJAmPqGFg8VK+++CyZq5WVK4XWGA6c+vgimno2fGedcye4a54wIb86qokqPzZ8h
 e/9vw2CMAstwYwgXn6n4IWsUegmWDNYBNKc74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZY+FHClB/h9JRVE090zSE+BkyR1qar6dqDb0aaRQfhI=;
 b=fBh79LD2uRuSYczBtVBil16Q+qhti7L047yiZAgz36ExLKGK85YQI70Dk4LwfIeIPT
 Oi63i2blKqzxvwmkGs22QZ/R6aoxLbW4Da4UsYqjeNwU8c4/rY4Wi9+/0kCYOwdV1fVU
 +HIXWnChaRQPmSkFFieIt3zHi9gmedz3WMpIWXhdnfVUbFWOFctTTwMr3nap49C/XLlG
 IbWKMWfLoTLBoTKjFdO00lrJwtoKz7QYVq5uiPHLNPsk/DBdOpjA8/MEoD21x8pCWVJS
 JG3Uvecx9aDfnK1H2YFJBuU9nhSElQHQSTiO2ZwwjAL/9jyetq4RYJIxLHtdOxnf3lNM
 gmaA==
X-Gm-Message-State: AOAM532GJjNIvzMTP7veVOP67bmaoCGNGu5pO+kGw7ndDdtF8JQFDhXM
 GTJtDDR9n0kujk8dL7meS6aN7A==
X-Google-Smtp-Source: ABdhPJzhwgpkHOAzDXoNNk+dOJhl96k3hcfJHkR+UpbKVclgY0tnbKIMQ07Qgwxu3/g/9MlUhPvsSw==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr2705699wrx.436.1643283778096; 
 Thu, 27 Jan 2022 03:42:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f10sm109512wmg.36.2022.01.27.03.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:42:57 -0800 (PST)
Date: Thu, 27 Jan 2022 12:42:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
Message-ID: <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
References: <20220127102621.30047-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127102621.30047-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 11:26:21AM +0100, Thomas Zimmermann wrote:
> Mark screen buffers in system memory with FB_VIRTFB. Otherwise, the
> buffers are mmap'ed as I/O memory (i.e., VM_IO). For shadow buffers,
> also set the FB_READS_FAST hint.

Maybe clarify that this only holds for the defio case, and since we have
our own shadow copy for that anyway it shouldn't matter. I'm also not sure
how much the memcpy gains us compared to just redrawing ...

What's the motivation here, or just something you spotted?
-Daniel

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ed43b987d306..f15127a32f7a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2346,6 +2346,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  	fbi->fbops = &drm_fbdev_fb_ops;
>  	fbi->screen_size = sizes->surface_height * fb->pitches[0];
>  	fbi->fix.smem_len = fbi->screen_size;
> +	fbi->flags = FBINFO_DEFAULT;
>  
>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
>  
> @@ -2353,19 +2354,21 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  		fbi->screen_buffer = vzalloc(fbi->screen_size);
>  		if (!fbi->screen_buffer)
>  			return -ENOMEM;
> +		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
>  
>  		fbi->fbdefio = &drm_fbdev_defio;
> -
>  		fb_deferred_io_init(fbi);
>  	} else {
>  		/* buffer is mapped for HW framebuffer */
>  		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
>  		if (ret)
>  			return ret;
> -		if (map.is_iomem)
> +		if (map.is_iomem) {
>  			fbi->screen_base = map.vaddr_iomem;
> -		else
> +		} else {
>  			fbi->screen_buffer = map.vaddr;
> +			fbi->flags |= FBINFO_VIRTFB;
> +		}
>  
>  		/*
>  		 * Shamelessly leak the physical address to user-space. As
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
