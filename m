Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473953CFB88
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52EC89FC0;
	Tue, 20 Jul 2021 14:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79389FC0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:03:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1600705wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y4gSvQBEj9KQ+XjWmOcAM0WFfh/axCIK0H/Z96eLWwI=;
 b=jrh/MuvCk2x6gUwV0XAPsHOu7mWpZ6G2QzXpNVjcirC00gOlDZ6G12ccoxx0xMbOeM
 ouls+7dDi3dPIj37C/1C5VOPtiGG0l4x2sPs7OwAs+Fiu2mAaoe94Ft9q/mudo4LnpcP
 5UtZ1jt66tKmjofHHTGgcBKHQT9fYYKxC5YqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y4gSvQBEj9KQ+XjWmOcAM0WFfh/axCIK0H/Z96eLWwI=;
 b=QxpI1OLZbnAhicVn7+WDio/E7YytElkTdM+/BqdxI5spjwxpXF8pI1bI3eJk47laJ2
 /cWtErAOwMYabqbL5vb5uOPC06JiqFymX+QWknoGI7mbzfZoASLdCaj5DtOp07NKhMgz
 fgi4VZaShldXOdqRLJs8DabaRdn2BkiqIKmgkoulXVLuMmcXROQL1vzEwspi53nZZVfz
 otGhVssZPZdN1lK8e1E24XZcZlO5OWdf6AIDogoKRMxIiHZs8sWObaUfVi8D84tVlIDz
 GzAtAS7eZbsBGs8xC3bcUj4bDlM8n2pDlnViR3fKT7BkMTUP4doRCfl3WZzLaNeWkvuI
 QM2A==
X-Gm-Message-State: AOAM530jD5SukjFArzcFBn35picF1B6MOkiM8d98WQy5KGAAaf0fmb83
 l7XSH6c73TOoi0IljKcVuGIbeQ==
X-Google-Smtp-Source: ABdhPJwNetJsgturCatC8nskb13AJmuTX3tF4KgWwHWkPk0zNMK6x95AHwptgNLpkhMtz37bgwHQJw==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr38808121wmf.36.1626789787449; 
 Tue, 20 Jul 2021 07:03:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m187sm24092718wmm.16.2021.07.20.07.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:03:06 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:03:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/7] drm/mipi-dbi: Use framebuffer dma-buf helpers
Message-ID: <YPbXmDGDhCo9M0Rd@phenom.ffwll.local>
References: <20210716140801.1215-1-tzimmermann@suse.de>
 <20210716140801.1215-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716140801.1215-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: david@lechnology.com, airlied@linux.ie, hdegoede@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 04:07:57PM +0200, Thomas Zimmermann wrote:
> Replace dma_buf_begin_cpu_access() with drm_gem_fb_begin_cpu_access();
> same for _end_cpu_access(). Remove some boiler-plate code. No functional
> changes.
> 
> There's one left-over reference to the imported attachment that we
> keep. GEM BOs with imported attachment are considered uncached and
> enables special handling within the drm_fb_swab().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 10b4e59384ae..71b646c4131f 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -7,7 +7,6 @@
>  
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> -#include <linux/dma-buf.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
> @@ -202,21 +201,17 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  {
>  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
>  	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
> -	struct dma_buf_attachment *import_attach = gem->import_attach;
>  	void *src = cma_obj->vaddr;
> -	int ret = 0;
> +	int ret;
>  
> -	if (import_attach) {
> -		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
> -					       DMA_FROM_DEVICE);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
>  
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_RGB565:
>  		if (swap)
> -			drm_fb_swab(dst, src, fb, clip, !import_attach);
> +			drm_fb_swab(dst, src, fb, clip, !gem->import_attach);

I freaked out about this because for dma-buf WC vs WB is undefined, but
it's purely a perf optimization. So it's fine. Plus we're not even
bothering with the iomem vs normal memory distinction here.

Anyway, that aside, all looks good. On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		else
>  			drm_fb_memcpy(dst, src, fb, clip);
>  		break;
> @@ -229,9 +224,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  		return -EINVAL;
>  	}
>  
> -	if (import_attach)
> -		ret = dma_buf_end_cpu_access(import_attach->dmabuf,
> -					     DMA_FROM_DEVICE);
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(mipi_dbi_buf_copy);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
