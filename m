Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0029B0268E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 23:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C23D10EACD;
	Fri, 11 Jul 2025 21:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="adF3LSdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4359B10EAC8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 21:55:17 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so14281755e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752270916; x=1752875716; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yyBh1I5vy5tt0ZKz6oShXqbef1WBhdPiFsB6mhFInkk=;
 b=adF3LSdPlPsZayfKcaCDyBwDLd3bJptIs8CfXmmD5p7Ay4eW/nLF8mPOiLOPmMuBrs
 vKU28hQ9MPHY4XaqaPGraGZzVrMrgsU6R2UeU6o+f9LeQ6XuJm7NPwO7HYW8UXGwMdYf
 2LMQHGBGnB9l6dCeux20UMRJka1jM5fILSrmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752270916; x=1752875716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyBh1I5vy5tt0ZKz6oShXqbef1WBhdPiFsB6mhFInkk=;
 b=bKs1wMTXgB97cFEn/VsFrrpxwbyTF9sVqn8dYrwBxEgz/HTDO/LmS7XACtpExAtwLy
 FnZySmiDJmkhe385vKcp4nzClukNF3P9tE3vfrqVOGm98mqnUwV40qqeaS3WpZ3rRgDT
 qfcSVRtTqgpKXMugKvz3io0DHUs749BIFXk8jxjYhS4etbJkdp83kwr6ywOGPrEg4a8R
 KoLwAHpFuGBoDbJwRHob2ln3OG9TuO+uVLd3gMv6mNdnjt2nVBDO91KvcoNmy0XqUiEh
 0MHcJrOD7uMgUpqNKtk8p/g0ZoiRTL+P4b2O8cKPU3oVyVnbDGhENZRjOs2gDLyAiME5
 Ktvw==
X-Gm-Message-State: AOJu0YzgcYrGNfahKU9EE824XFMcdkmjhwPKX2IGqNjGoRB+ra31G+9P
 mqUmtuznkfwPI0lJeheQ2StAwluHTXFJKSftyUV5YNPgugJ4SDe1Jx9AcEPiShEXzuk=
X-Gm-Gg: ASbGncu88cxw4u5aF8El+DlNzDJG5fD1j/g/SWpGTIqwFrT558+XnGq7gRLrINLjHGm
 BUdyvH+fRHKJWorDCql+x3hxQxoOp+Grzs+MTjmZkpXvDfrfkWhVnpe7VFf8aq8PZyCmUmyilPb
 AIhxzYW+Jt+riGpWWcL06YxCHKqhnqUKrRhuJ1uYLZiY2la5Yw2W3Fdz/EUij6VeqQnKWOdfqBh
 I0YK8WgfL2eTQAYkwMBdDMKEBKgTS6UkZhZNz7rpmA1R2vFiIiKHp+kfCjOjJX0O1x5XarTRZTh
 n4Q6HDNyROngJHa8IjNbvMPbkMsfg8uZ/cuYhSAnJfksgtqe4IqK9ladfSp7ZdepwJ69L9FLbR3
 H3/XcRhxey7EjzHKwjoa8QP9m7OR26ujAGQ==
X-Google-Smtp-Source: AGHT+IFVs9BLpoqClkWEYd637ADszG9Ph6j36JZaQ0L9RXNY6UZcGvlzE99+lNhXcPHO7obVNxDCYw==
X-Received: by 2002:a05:600c:c11c:b0:453:66f:b96e with SMTP id
 5b1f17b1804b1-454ec146a71mr34301565e9.11.1752270915616; 
 Fri, 11 Jul 2025 14:55:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f6794a00sm15305675e9.37.2025.07.11.14.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 14:55:14 -0700 (PDT)
Date: Fri, 11 Jul 2025 23:55:12 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Francis <David.Francis@amd.com>
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@igalia.com,
 Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, Christian.Koenig@amd.com,
 dcostantino@meta.com, sruffell@meta.com, simona@ffwll.ch,
 mripard@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH 2/2] drm: Move drm_gem ioctl kerneldoc to uapi file
Message-ID: <aHGIQNEuDM-MgmnZ@phenom.ffwll.local>
References: <20250711145342.89720-1-David.Francis@amd.com>
 <20250711145342.89720-3-David.Francis@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711145342.89720-3-David.Francis@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jul 11, 2025 at 10:53:42AM -0400, David Francis wrote:
> The drm_gem ioctls were documented in internal file drm_gem.c
> instead of uapi header drm.h. Move them there and change to
> appropriate kerneldoc formatting.
> 
> Signed-off-by: David Francis <David.Francis@amd.com>

Thanks a lot for taking care of this!

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I'll leave review for the first patch to folks who care about criu, but it
looked good to me too.
-Sima

> ---
>  drivers/gpu/drm/drm_gem.c | 30 -----------------------------
>  include/uapi/drm/drm.h    | 40 +++++++++++++++++++++++++++------------
>  2 files changed, 28 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 3166230d0119..08778a15eefb 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -820,14 +820,6 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>  }
>  EXPORT_SYMBOL(drm_gem_dma_resv_wait);
>  
> -/**
> - * drm_gem_close_ioctl - implementation of the GEM_CLOSE ioctl
> - * @dev: drm_device
> - * @data: ioctl data
> - * @file_priv: drm file-private structure
> - *
> - * Releases the handle to an mm object.
> - */
>  int
>  drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  		    struct drm_file *file_priv)
> @@ -843,17 +835,6 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -/**
> - * drm_gem_flink_ioctl - implementation of the GEM_FLINK ioctl
> - * @dev: drm_device
> - * @data: ioctl data
> - * @file_priv: drm file-private structure
> - *
> - * Create a global name for an object, returning the name.
> - *
> - * Note that the name does not hold a reference; when the object
> - * is freed, the name goes away.
> - */
>  int
>  drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  		    struct drm_file *file_priv)
> @@ -893,17 +874,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -/**
> - * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
> - * @dev: drm_device
> - * @data: ioctl data
> - * @file_priv: drm file-private structure
> - *
> - * Open an object using the global name, returning a handle and the size.
> - *
> - * This handle (of course) holds a reference to the object, so the object
> - * will not go away until the handle is deleted.
> - */
>  int
>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		   struct drm_file *file_priv)
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index e3940b657e16..e512da8f3baf 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -597,31 +597,47 @@ struct drm_set_version {
>  	int drm_dd_minor;
>  };
>  
> -/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
> +/**
> + * struct drm_gem_close - Argument for &DRM_IOCTL_GEM_CLOSE ioctl.
> + * @handle: Handle of the object to be closed.
> + * @pad: Padding.
> + *
> + * Releases the handle to an mm object.
> + */
>  struct drm_gem_close {
> -	/** Handle of the object to be closed. */
>  	__u32 handle;
>  	__u32 pad;
>  };
>  
> -/* DRM_IOCTL_GEM_FLINK ioctl argument type */
> +/**
> + * struct drm_gem_flink - Argument for &DRM_IOCTL_GEM_FLINK ioctl.
> + * @handle: Handle for the object being named.
> + * @name: Returned global name.
> + *
> + * Create a global name for an object, returning the name.
> + *
> + * Note that the name does not hold a reference; when the object
> + * is freed, the name goes away.
> + */
>  struct drm_gem_flink {
> -	/** Handle for the object being named */
>  	__u32 handle;
> -
> -	/** Returned global name */
>  	__u32 name;
>  };
>  
> -/* DRM_IOCTL_GEM_OPEN ioctl argument type */
> +/**
> + * struct drm_gem_open - Argument for &DRM_IOCTL_GEM_OPEN ioctl.
> + * @name: Name of object being opened.
> + * @handle: Returned handle for the object.
> + * @size: Returned size of the object
> + *
> + * Open an object using the global name, returning a handle and the size.
> + *
> + * This handle (of course) holds a reference to the object, so the object
> + * will not go away until the handle is deleted.
> + */
>  struct drm_gem_open {
> -	/** Name of object being opened */
>  	__u32 name;
> -
> -	/** Returned handle for the object */
>  	__u32 handle;
> -
> -	/** Returned size of the object */
>  	__u64 size;
>  };
>  
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
