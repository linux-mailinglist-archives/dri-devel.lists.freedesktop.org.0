Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3B198EDA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C1A6E2CF;
	Tue, 31 Mar 2020 08:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB9F6E2CF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:50:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 11so415930wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=boSgWRNjPVvI4ccEdVk2Bpty6+e3jphVDKSgvMfFTT8=;
 b=BHM2btid91ikaCJDeAV0c0nxTj4DFROnvSFXLx5sP0xI3LufSVqQoPLMy2J856I+5O
 bNnD4d7CjCMawypF79dYQgjHE+uum3xXcGgrWKJefzUM2X7wCMrSCwnlGa7PMEbZFamX
 KZ4FtC8BLn2FP5SxYe7hiXlKgB6YgzFnTO9y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=boSgWRNjPVvI4ccEdVk2Bpty6+e3jphVDKSgvMfFTT8=;
 b=ryVvDGQQHY+AtUqQqIDn5uMQq0s7ZFRJ9YVjrBvPRiy3OTUVjR6yHjTXnxhrfAfIVe
 DOMMebUsZaviM2+LUYXdd7/LRqZ5yj53JY8idm6AddLjimh6DuA1xkz7FP1ftJcBOVGB
 kPIKdDTA2TGNfvg8tehqi87zOuPvo9MWXConJSABh4ZVWhtExQUZH3q6DmwDyAVfuarq
 ykF5j00gKucLNQQFSmTGbUkcZ+QHrTnTju9W2Ib01uHLKdI+HW8dLxyu2boMLazOQaog
 x6idReu7nICQgt2SAOJx468niyE4e1W6u7Fh+O5kDAgocub57Xr4L0TZWsw+wG/sW7qr
 UDxw==
X-Gm-Message-State: ANhLgQ2KYpHLm/rVEYVq4yvz2/LLmpHcIQvOp6kKK7KhFGw7KNQ6NfJc
 o64YGDsxa9X9vabBCvmpCNxm1Q==
X-Google-Smtp-Source: ADFU+vuCcAUK99KAe4zbHQzWM1VQ+9wfvf6sfPtEe/jqYKCfv1J5gUVMt2PMRZG8xsk4CAtUgqW7rw==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr2300306wma.158.1585644656914; 
 Tue, 31 Mar 2020 01:50:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w67sm2972088wmb.41.2020.03.31.01.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 01:50:56 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:50:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vram-helpers: Set plane fence for display update
Message-ID: <20200331085054.GK2363188@phenom.ffwll.local>
References: <20200331081130.24600-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331081130.24600-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 10:11:30AM +0200, Thomas Zimmermann wrote:
> Calling the VRAM helper's prepare_fb() helper now sets the plane's
> fence object. The helper still has to synchronize with other users
> of the GEM object. Leave a related TODO comment in the code.
> 
> This will be useful for PRIME support. VRAM helpers don't support
> buffer sharing ATM, so there are no drivers requiring this change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b3201a70cbfcb..d4e4f80d3a6c1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -5,6 +5,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_mode.h>
> @@ -670,9 +671,9 @@ EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
>   * @plane:	a DRM plane
>   * @new_state:	the plane's new state
>   *
> - * During plane updates, this function pins the GEM VRAM
> - * objects of the plane's new framebuffer to VRAM. Call
> - * drm_gem_vram_plane_helper_cleanup_fb() to unpin them.
> + * During plane updates, this function sets the plane's fence and
> + * pins the GEM VRAM objects of the plane's new framebuffer to VRAM.
> + * Call drm_gem_vram_plane_helper_cleanup_fb() to unpin them.
>   *
>   * Returns:
>   *	0 on success, or
> @@ -689,6 +690,13 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
>  	if (!new_state->fb)
>  		return 0;
>  
> +	/*
> +	 * TODO: Synchronize with other users of the buffer. Buffers
> +	 *       cannot be pinned to VRAM while they are in use by other
> +	 *       drivers for DMA. We should probably wait for each GEM
> +	 *       object's fence before attempting to pin the buffer.
> +	 *       There are currently no users of this functionality.
> +	 */

Not sure this is warranted, we have lots of drivers with these kind of
restrictions ... It's a big can of worms, I'd just leave this all out.

>  	for (i = 0; i < ARRAY_SIZE(new_state->fb->obj); ++i) {
>  		if (!new_state->fb->obj[i])
>  			continue;
> @@ -698,6 +706,10 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
>  			goto err_drm_gem_vram_unpin;
>  	}
>  
> +	ret = drm_gem_fb_prepare_fb(plane, new_state);
> +	if (ret)
> +		goto err_drm_gem_vram_unpin;

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	return 0;
>  
>  err_drm_gem_vram_unpin:
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
