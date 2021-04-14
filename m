Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EA35F0F9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D7F6E90B;
	Wed, 14 Apr 2021 09:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836056E90B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:44:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s7so19098645wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NZKzmk+wX2wiEch9Cr+5BEoEYaBMy5qe2WDaIy7OMgs=;
 b=SkGI69uzo65fubeb0tU/tnHyPuqcTZ/8d1U7OoHrW1hP8TBBkLTMMnlwDCP7WAtnaQ
 rx35hqaT6nFjpKC5Psm1a15dWYOANP70mODaoVgd6QQZw+4cZgzMQU60WMy/pOOjdL9X
 NirUxy8XkZR60PReBJkOxndy6MgizKKnA+Mv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NZKzmk+wX2wiEch9Cr+5BEoEYaBMy5qe2WDaIy7OMgs=;
 b=P4s1VBsowdtTjzqucbFNRfGncGss18dZvZV93TNf9KBgNDXBQEsNZQPOUgCJ8+Zv5i
 GW3cNKK5TMSkRFiyjZOdxCPIA9ysVodBEV4Cusi8mtfpWY5kQEqzmn44kWEXFJWFejrj
 wYYDiX3F/AB4CkzVC56vLnqD/+aXn28y79wAi6q7IIjAS3cnG/PYdDVt+aS+bkhji+aU
 KIhURj6h/kQrIxCo9VPf6YHc5mMRlmjNvtq1nX7H6RF1kgnOrBjWs+W0k3VXlx1Da1ny
 WAS2JTT9jPGcsWF9a15v6Ut6ndiZb7qIcE+G5LcSHmHXiv1Tf+bdM64yaT6vxcuSeLOi
 HiAg==
X-Gm-Message-State: AOAM531Thk7XNZN7n4nCSrltD/1kvyEAaMz34ETYEOb/g8+4AgEGINoF
 Ddxo2IPAYuLCVyyRqE1OTXWZug==
X-Google-Smtp-Source: ABdhPJyv5QQinSPomDV55Wzp32dv9adjpmS/2GE8xaCpPJiFgZp+8V9pbJ8FZoLAjDSM1+2ZoSMsuQ==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr28061809wrt.0.1618393461997; 
 Wed, 14 Apr 2021 02:44:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r5sm23325944wrx.87.2021.04.14.02.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:44:21 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:44:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v3 2/4] drm/vkms: rename cursor to plane on ops of planes
 composition
Message-ID: <YHa5c+tA6e5h5uLn@phenom.ffwll.local>
References: <cover.1618299945.git.melissa.srw@gmail.com>
 <085ed9af17e0cc45e51f6befba1cd7617a36c73a.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <085ed9af17e0cc45e51f6befba1cd7617a36c73a.1618299945.git.melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 04:53:43AM -0300, Melissa Wen wrote:
> Generalize variables and function names used for planes composition
> (from cursor to plane), since we will reuse the operations for both
> cursor and overlay types.
> 
> No functional change.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 66c6842d70db..be8f1d33c645 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -125,26 +125,26 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  	}
>  }
>  
> -static void compose_cursor(struct vkms_composer *cursor_composer,
> -			   struct vkms_composer *primary_composer,
> +static void compose_planes(struct vkms_composer *primary_composer,
> +			   struct vkms_composer *plane_composer,
>  			   void *vaddr_out)
>  {
> -	struct drm_gem_object *cursor_obj;
> -	struct drm_gem_shmem_object *cursor_shmem_obj;
> +	struct drm_gem_object *plane_obj;
> +	struct drm_gem_shmem_object *plane_shmem_obj;
>  
> -	cursor_obj = drm_gem_fb_get_obj(&cursor_composer->fb, 0);
> -	cursor_shmem_obj = to_drm_gem_shmem_obj(cursor_obj);
> +	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
> +	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
>  
> -	if (WARN_ON(!cursor_shmem_obj->vaddr))
> +	if (WARN_ON(!plane_shmem_obj->vaddr))
>  		return;
>  
> -	blend(vaddr_out, cursor_shmem_obj->vaddr,
> -	      primary_composer, cursor_composer);
> +	blend(vaddr_out, plane_shmem_obj->vaddr,
> +	      primary_composer, plane_composer);
>  }
>  
> -static int compose_planes(void **vaddr_out,
> -			  struct vkms_composer *primary_composer,
> -			  struct vkms_composer *cursor_composer)
> +static int composite(void **vaddr_out,
> +		     struct vkms_composer *primary_composer,
> +		     struct vkms_composer *cursor_composer)
>  {
>  	struct drm_framebuffer *fb = &primary_composer->fb;
>  	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
> @@ -164,7 +164,7 @@ static int compose_planes(void **vaddr_out,
>  	memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
>  
>  	if (cursor_composer)
> -		compose_cursor(cursor_composer, primary_composer, *vaddr_out);
> +		compose_planes(primary_composer, cursor_composer, *vaddr_out);
>  
>  	return 0;
>  }
> @@ -222,7 +222,7 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (wb_pending)
>  		vaddr_out = crtc_state->active_writeback;
>  
> -	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
> +	ret = composite(&vaddr_out, primary_composer, cursor_composer);
>  	if (ret) {
>  		if (ret == -EINVAL && !wb_pending)
>  			kfree(vaddr_out);
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
