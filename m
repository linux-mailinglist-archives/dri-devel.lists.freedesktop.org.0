Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DE35F113
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B11E6E914;
	Wed, 14 Apr 2021 09:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9246E914
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:51:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id w186so5734447wmg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M2Z7duMYsJbtehFTYyj+CYxiFEVKU0Hrh4cg52TrRoQ=;
 b=Cy+G/AcPJAWPSkcF2d7wtucpUq896eWujvTQG/OS38rtg0ayg3TwkUROQ4coLK71rr
 x9I/oxUyQGnkYl/04WBcRKRqPPZBkaKEE9i0pAZmO21+7g0DEmg+XjBu5X2lFOZZmF3s
 qwXL9cjwrAryc13hmlPtiHcKHGbccmflP2wAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M2Z7duMYsJbtehFTYyj+CYxiFEVKU0Hrh4cg52TrRoQ=;
 b=aInU6KqZxqh00ZVLI4sP/IFJRpFc0DUVHiBBLQ2TQF0oLThGQ7PQpUl6T8KBmPBHmg
 OzkfPpzgo9k9eKDGmLsHENmDYKB5zpvNZsS0DRviNmYNGtiE9DXtOdgYq1cRYtNOuXF9
 O8W+pZZTvGqSj3ALp1C2keOMG99bhSdL+BuK0ZsqwQ08QRrb6N+wVn9OzZJJLpy1SPwh
 CaYE5lPAcH8WEaYbYqYeWftbk+/txeZQhAzOBZae4sQBOCjrlwuZVUo9rKNRO0wwYuvg
 0Xk9nqOtNH01uMNFFZqTWlSFTcBvyBYXZJ5FEGnVOBL2lFTDsD+3mjzGZtbKEt5wrDZy
 yZdg==
X-Gm-Message-State: AOAM531dMzqdpHKupPvp6IaMKyoSNTMDN2xS3L3ONuRr3QkOX5RE/HRf
 dzNxQ0ipcZ2A+iZgCXV4f9qREA==
X-Google-Smtp-Source: ABdhPJynI3jwPf0ReP4zp8X4qDmtwC7wYXtC/alxqCTHaxzUgwBOQFYuC273l2SAtZwIo8sdKa7K5Q==
X-Received: by 2002:a05:600c:188d:: with SMTP id
 x13mr2108658wmp.158.1618393917349; 
 Wed, 14 Apr 2021 02:51:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d133sm4876797wmf.9.2021.04.14.02.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:51:56 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:51:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v3 3/4] drm/vkms: add XRGB planes composition
Message-ID: <YHa7Oj64u98XaNQt@phenom.ffwll.local>
References: <cover.1618299945.git.melissa.srw@gmail.com>
 <e117eb967eae9fe45589a266335f4d99860144c1.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e117eb967eae9fe45589a266335f4d99860144c1.1618299945.git.melissa.srw@gmail.com>
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

On Tue, Apr 13, 2021 at 04:54:52AM -0300, Melissa Wen wrote:
> Add support for composing XRGB888 planes in addition to the
> ARGB8888 format. In the case of an XRGB plane at the top, the
> composition consists of just copying the RGB values of a
> pixel from src to dst, without the need for alpha blending
> operations for each pixel.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 22 ++++++++++++++++++----
>  drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++++---
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index be8f1d33c645..7fe1fdb3af39 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -4,6 +4,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -76,6 +77,11 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
>  	argb_dst[3] = 0xFF;
>  }
>  
> +static void x_blending(const u8 *xrgb_src, u8 *xrgb_dst)
> +{
> +	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);

Don't we need to clear the alpha channel, or is that done already when we
allocate the buffer? Looking at the code we have I think we have a few
more bugs there to fix.

I also just realized that we don't support when the primary plane isn't
exactly matching our output size. So that's another thing to maybe fix -
with your new x_blending here what we could do is essentially blend the
primary plane onto the black background (allocated with all zeros) like we
blend the other planes.

Minimally I'd add a comment above that we rely on alpha being cleared in
the target buffer or something like that for stable crc values.

Anyway, work for another patch set.

> +}
> +
>  /**
>   * blend - blend value at vaddr_src with value at vaddr_dst
>   * @vaddr_dst: destination address
> @@ -91,7 +97,8 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
>   */
>  static void blend(void *vaddr_dst, void *vaddr_src,
>  		  struct vkms_composer *dst_composer,
> -		  struct vkms_composer *src_composer)
> +		  struct vkms_composer *src_composer,
> +		  void (*pixel_blend)(const u8 *, u8 *))
>  {
>  	int i, j, j_dst, i_dst;
>  	int offset_src, offset_dst;
> @@ -119,7 +126,7 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  
>  			pixel_src = (u8 *)(vaddr_src + offset_src);
>  			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
> -			alpha_blending(pixel_src, pixel_dst);
> +			pixel_blend(pixel_src, pixel_dst);

Since it's all one file, did you check whether gcc inlines the two
functions calls here? If we do actual function calls for each blend it's
going to be a lot slower. Maybe worth checking, and perhaps we need to
throw some ineline hints (like always_inline or something like that) on
both the blend function and the alpha_blending and x_blending helpers.

Cursor is generally tiny, but when we start "blending" the primary plane
into the black background, then performance really starts to matter.

Anyway that's all stuff for later tuning.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		}
>  		i_dst++;
>  	}
> @@ -131,6 +138,8 @@ static void compose_planes(struct vkms_composer *primary_composer,
>  {
>  	struct drm_gem_object *plane_obj;
>  	struct drm_gem_shmem_object *plane_shmem_obj;
> +	struct drm_framebuffer *fb = &plane_composer->fb;
> +	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
>  
>  	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
>  	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
> @@ -138,8 +147,13 @@ static void compose_planes(struct vkms_composer *primary_composer,
>  	if (WARN_ON(!plane_shmem_obj->vaddr))
>  		return;
>  
> -	blend(vaddr_out, plane_shmem_obj->vaddr,
> -	      primary_composer, plane_composer);
> +	if (fb->format->format == DRM_FORMAT_ARGB8888)
> +		pixel_blend = &alpha_blending;
> +	else
> +		pixel_blend = &x_blending;
> +
> +	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
> +	      plane_composer, pixel_blend);
>  }
>  
>  static int composite(void **vaddr_out,
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 135140f8e87a..da4251aff67f 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -16,8 +16,9 @@ static const u32 vkms_formats[] = {
>  	DRM_FORMAT_XRGB8888,
>  };
>  
> -static const u32 vkms_cursor_formats[] = {
> +static const u32 vkms_plane_formats[] = {
>  	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888
>  };
>  
>  static struct drm_plane_state *
> @@ -200,8 +201,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  	int nformats;
>  
>  	if (type == DRM_PLANE_TYPE_CURSOR) {
> -		formats = vkms_cursor_formats;
> -		nformats = ARRAY_SIZE(vkms_cursor_formats);
> +		formats = vkms_plane_formats;
> +		nformats = ARRAY_SIZE(vkms_plane_formats);
>  		funcs = &vkms_primary_helper_funcs;
>  	} else {
>  		formats = vkms_formats;
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
