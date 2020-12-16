Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED042DC215
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EAE6E1BC;
	Wed, 16 Dec 2020 14:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E2F6E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:23:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c5so19703726wrp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1P4lrH2XNOP2mlPTBX6EVPSksFXAGxwJDHfh8XBTXAg=;
 b=XLoO8zxxs05SrNhEuYHx29fNhRQfVRi8yn9Dyk4ztQxG9++M/zAo8OGnO8bHyirH7G
 afynd7h257vx44S9PxDt51dSEbD0puMfEfpZ+2nhMoIJvyzwf3ymdAU95r9HU+7A9Ax3
 O+XoGiBzHQ7Yi6wSNf2z6vTfxcNBop3zTNOWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1P4lrH2XNOP2mlPTBX6EVPSksFXAGxwJDHfh8XBTXAg=;
 b=MeyZr2Ko9XBxfMKDC/7h0R+KrN/BSjrWhMqVF+k/g83HdJLjjjPKUb2OA59vi9nPsO
 97ylv4gkcfEqq0yBxulUVWct422nvC/5Ld/TUowUHQw/OhClkf6XaZQAAT/x8lQF3d6G
 a54jl8aHBFqkWrOzxlVieoAKvlKVFERVKcDd9jzHq5KU4QjXWCjJ24VR2Nu7OzgK/tL+
 4QIgrwg3upHqSVv+Dve26zJ6wbycHBYUlzZx/lPrewFezUmJaxzY13dy9/5xLKp+e/kl
 ioR3dFgASNaWsvGFtpSpupUhQHseWB93edRzzJ1xtealcu8ab35HHXhh6OQmr+FYIehz
 lKJQ==
X-Gm-Message-State: AOAM532eeZK9FmGQs2/zrjfbL3aWT3A7xK1Rh6uUlw8fsjRMykr+rtah
 LubBBOxIZlEsR/02KQua7u3Hew==
X-Google-Smtp-Source: ABdhPJxuQueg0YBYwjIkzbMstCxTaGfaYoXQrypIsZzExBWI0iAUZ4UnlRdTFvbNu7xLpE/9IvssGg==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr38855292wrn.300.1608128633202; 
 Wed, 16 Dec 2020 06:23:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm3539146wrv.44.2020.12.16.06.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:23:52 -0800 (PST)
Date: Wed, 16 Dec 2020 15:23:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: Don't export the drm_gem_dumb_destroy() function
Message-ID: <X9oYdqZevGPKyUvZ@phenom.ffwll.local>
References: <20201215195147.4039-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215195147.4039-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 09:51:47PM +0200, Laurent Pinchart wrote:
> The drm_gem_dumb_destroy() isn't used in drivers, don't export it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Again I'm assuming you'll apply this somewhere.
-Daniel

> ---
> Changes since v1:
> 
> - Move function prototype from drm_gem.h to drm_internal.h
> - Drop function documentation
> - Replace uint32_t with u32
> ---
>  drivers/gpu/drm/drm_dumb_buffers.c |  8 +++++---
>  drivers/gpu/drm/drm_gem.c          | 12 +-----------
>  drivers/gpu/drm/drm_internal.h     |  3 +++
>  include/drm/drm_gem.h              |  3 ---
>  4 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index d18a740fe0f1..ad17fa21cebb 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_mode.h>
>  
>  #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
>  
>  /**
>   * DOC: overview
> @@ -46,9 +47,10 @@
>   * KMS frame buffers.
>   *
>   * To support dumb objects drivers must implement the &drm_driver.dumb_create
> - * operation. &drm_driver.dumb_destroy defaults to drm_gem_dumb_destroy() if
> - * not set and &drm_driver.dumb_map_offset defaults to
> - * drm_gem_dumb_map_offset(). See the callbacks for further details.
> + * and &drm_driver.dumb_map_offset operations (the latter defaults to
> + * drm_gem_dumb_map_offset() if not set). Drivers that don't use GEM handles
> + * additionally need to implement the &drm_driver.dumb_destroy operation. See
> + * the callbacks for further details.
>   *
>   * Note that dumb objects may not be used for gpu acceleration, as has been
>   * attempted on some ARM embedded platforms. Such drivers really must have
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 92f89cee213e..34b2f111c01c 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -335,22 +335,12 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_dumb_map_offset);
>  
> -/**
> - * drm_gem_dumb_destroy - dumb fb callback helper for gem based drivers
> - * @file: drm file-private structure to remove the dumb handle from
> - * @dev: corresponding drm_device
> - * @handle: the dumb handle to remove
> - *
> - * This implements the &drm_driver.dumb_destroy kms driver callback for drivers
> - * which use gem to manage their backing storage.
> - */
>  int drm_gem_dumb_destroy(struct drm_file *file,
>  			 struct drm_device *dev,
> -			 uint32_t handle)
> +			 u32 handle)
>  {
>  	return drm_gem_handle_delete(file, handle);
>  }
> -EXPORT_SYMBOL(drm_gem_dumb_destroy);
>  
>  /**
>   * drm_gem_handle_create_tail - internal functions to create a handle
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 81d386b5b92a..fad2249ee67b 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -191,6 +191,9 @@ void drm_gem_unpin(struct drm_gem_object *obj);
>  int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
> +int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
> +			 u32 handle);
> +
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 5e6daa1c982f..240049566592 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -416,8 +416,5 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>  				     bool write);
>  int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>  			    u32 handle, u64 *offset);
> -int drm_gem_dumb_destroy(struct drm_file *file,
> -			 struct drm_device *dev,
> -			 uint32_t handle);
>  
>  #endif /* __DRM_GEM_H__ */
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
