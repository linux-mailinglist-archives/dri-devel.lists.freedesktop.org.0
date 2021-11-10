Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D344BF05
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C406E943;
	Wed, 10 Nov 2021 10:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A3D6E928
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:46:52 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v11so8678838edc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CJ8BKvr5XUSO/Vo4sS7QvREYUZiUN+4dM8bteUPX/YU=;
 b=a5PDaYRSHhLE0B/0FQ+MlW7rePX4lX8rMFt04k9jy714oeV6rCydngg+4chiEab4BB
 0et1lR5054ugeHjiqzoRhGkDg1UoJWAzmwRFvIlBA+ugUkN39qs5cm5is5LIv5WH2xEf
 oEhqQbxoFXx4fNzwMrzHIsDeA0puwKDSYP3nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CJ8BKvr5XUSO/Vo4sS7QvREYUZiUN+4dM8bteUPX/YU=;
 b=lRYmh7z8Nh14rjAMwDost83XLAoIXRdPw5hupVzaHQoeKDmiL+hCF8RSkvoVQv3QLs
 gwKizZHYf9Nq2RI2MBTvBx67vl/mNI2QQkf79xA0/YJJiGkoZvgHd9Vm/8T7HZG9HTQM
 x3vvnqtoAxa7tz2Agd7hsaXIJfCACjymsHSi0fZ/Fe5W5NAPvnrISggHuc8xiVkyAvQd
 WcBEkhds5avjldYEl9YSodDzevK+viBq+HfawbDzPZNsnorEFQC4F6271vAiuX+XJHT2
 iiMny2G5e3h5XauVuWJTBEAV0EBaAkXpqi5o8iRALG9JzUPPkUqsqCUKeb3oAcEUS9sf
 oWgg==
X-Gm-Message-State: AOAM5325M2kR/WBYlPhiDCz/alxMZvYWBfv5n/aOeYiy2KLxSCFcLy0w
 cRk0TqbLEWHUU6YZFolzFmw6Eg==
X-Google-Smtp-Source: ABdhPJzex3EJLJxKesbpcXVhuXhXz8mKsgkAvORtmUcskNu2IAPYg8LWXRVSpkQDC+igoNaKseVJbA==
X-Received: by 2002:aa7:d546:: with SMTP id u6mr20545346edr.311.1636541210512; 
 Wed, 10 Nov 2021 02:46:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm14094307edd.12.2021.11.10.02.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:46:50 -0800 (PST)
Date: Wed, 10 Nov 2021 11:46:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm: Update documentation and TODO of gem_prime_mmap
 hook
Message-ID: <YYujGLFf+spiXMil@phenom.ffwll.local>
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108102846.309-4-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, sw0312.kim@samsung.com,
 oleksandr_andrushchenko@epam.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 11:28:46AM +0100, Thomas Zimmermann wrote:
> The hook gem_prime_mmap in struct drm_driver is deprecated. Document
> the new requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 11 -----------
>  include/drm/drm_drv.h      | 11 +++++++----
>  2 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 60d1d7ee0719..6593c4c4006e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -268,17 +268,6 @@ Contact: Daniel Vetter
>  
>  Level: Intermediate
>  
> -Clean up mmap forwarding
> -------------------------
> -
> -A lot of drivers forward gem mmap calls to dma-buf mmap for imported buffers.
> -And also a lot of them forward dma-buf mmap to the gem mmap implementations.
> -There's drm_gem_prime_mmap() for this now, but still needs to be rolled out.
> -
> -Contact: Daniel Vetter
> -
> -Level: Intermediate
> -
>  Generic fbdev defio support
>  ---------------------------
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 0cd95953cdf5..a84eb4028e5b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -345,11 +345,14 @@ struct drm_driver {
>  	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
>  	 * PRIME helpers.
>  	 *
> -	 * FIXME: There's way too much duplication going on here, and also moved
> -	 * to &drm_gem_object_funcs.
> +	 * This hook only exists for historical reasons. Drivers must use
> +	 * drm_gem_prime_mmap() to implement it.
> +	 *
> +	 * FIXME: Convert all drivers to implement mmap in struct
> +	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
> +	 * its callers. This hook should be removed afterwards.

I think at least i915 has different semantics between dma-buf mmap and gem
mmap in some cases, so this might be tricky to achieve. But I think
everywhere else this should be solid.
-Daniel

>  	 */
> -	int (*gem_prime_mmap)(struct drm_gem_object *obj,
> -				struct vm_area_struct *vma);
> +	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  
>  	/**
>  	 * @dumb_create:
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
