Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18062D73A6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CE46ED23;
	Fri, 11 Dec 2020 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2CA6ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:14:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d3so7060305wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tFibnX3/+2uQLJigmsH9b8s5hxcI5Nnzsyfczlow2uY=;
 b=dGhq32YMkTjWI/ie2Hq+RdFI2qUl+7/r+2hNI1hmc7rqmjb1bUxt3I38/+V1gaz4Bi
 tpO9bNBaMSzFzrAzfieUISFFy1nzZP5xUTiHgEVpnG8Edk2NmeOVM06D8pAO9yjnKpZu
 f+AcH6sPBkStWxgnvgOfJo3dI+Mu2HsWk3EYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tFibnX3/+2uQLJigmsH9b8s5hxcI5Nnzsyfczlow2uY=;
 b=ARjvXiSstix+cMY9fzLT8bbN1LGUx8t2fIRDjTBB1YoQZH6uyueAk335qIEikuGXtD
 MWhaOXtfvgQa4/AsZ2rak1P72F+c4y+hDGtn+ercb0ZCUai74BhrCBd1lrgrC5PDI2qh
 VJMRANSIZVQarVn4TboiNhzCyDHgT3HDpyDERIKK24nNArZfvcL/JxcyNvXWAoS3yzlx
 zuCxSjOPcYHxYdgj8mAPuUJvT+zeLbkorhz4e5HzB/1BNtjoDaJLmKaBRLj9h8WivZVI
 C+VvL96RNTf+lyBV1AlWRA5gJMZA7DARJKD+wK1uj5nlYJecIqgZwpgS5cMYv68znvlJ
 1t5w==
X-Gm-Message-State: AOAM533KZ5zYVO3dU1IrgaEjdFmPrzD72hs6DkEFWR4Th3AXThubk1vl
 PeeB84D0Zh0Gq4It8ktaHdMzUA==
X-Google-Smtp-Source: ABdhPJyVgqHgjlCiunOK9t3N8S0FIge5kEeCAE3w010OLYNrBIfSd131FdYBTILVWy8GablsJBC0KA==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr12989334wmk.14.1607681687220; 
 Fri, 11 Dec 2020 02:14:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13440927wma.6.2020.12.11.02.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 02:14:46 -0800 (PST)
Date: Fri, 11 Dec 2020 11:14:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/8] drm/ast: Don't pin cursor source BO explicitly
 during update
Message-ID: <20201211101444.GP401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209142527.26415-2-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 03:25:20PM +0100, Thomas Zimmermann wrote:
> Vmapping the cursor source BO contains an implicit pin operation,
> so there's no need to do this manually.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ast/ast_cursor.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 742d43a7edf4..68bf3d33f1ed 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -180,12 +180,9 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  
>  	gbo = drm_gem_vram_of_gem(fb->obj[0]);
>  
> -	ret = drm_gem_vram_pin(gbo, 0);
> -	if (ret)
> -		return ret;
>  	ret = drm_gem_vram_vmap(gbo, &map);
>  	if (ret)
> -		goto err_drm_gem_vram_unpin;
> +		return ret;
>  	src = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
> @@ -194,13 +191,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  	update_cursor_image(dst, src, fb->width, fb->height);
>  
>  	drm_gem_vram_vunmap(gbo, &map);
> -	drm_gem_vram_unpin(gbo);
>  
>  	return 0;
> -
> -err_drm_gem_vram_unpin:
> -	drm_gem_vram_unpin(gbo);
> -	return ret;
>  }
>  
>  static void ast_cursor_set_base(struct ast_private *ast, u64 address)
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
