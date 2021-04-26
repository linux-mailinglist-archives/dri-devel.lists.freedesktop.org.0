Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1136B6C8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 18:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98D689C1F;
	Mon, 26 Apr 2021 16:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76A089C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 16:28:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h4so47498453wrt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RY+Kdpq33IDWrl2KzTyp1kTD+CiWVSdFRr8tcy5mzLk=;
 b=ZhBoglmNNHolfw07YH4dkEci/9mHkvcNPtYEwyTqYHC7N4WF0xJ8E8wR+DMsEQfbKi
 Ri9rFfQeeUr01RYK64LY7YAGgM16mTkp9UB3lk0/0gHixRZ6BRSXjhZEzcJr4hwrlUgh
 bFrQPkVMUvNp0wTYK47uNZyjnp7fsjLJXQ5n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RY+Kdpq33IDWrl2KzTyp1kTD+CiWVSdFRr8tcy5mzLk=;
 b=fXiwxq8/bbngtBlaS4H2Efe5cA4jkONTAVMvyLmDzdRJRRnB+X6WetiYNSw/wCg0WD
 G90/1RypX3P8dSYxI7fSOwX3Kzxf6S4uXc63UavXWVV/LqPRQLV3q92Nec5JFT737wHj
 s2mI/qqMr21BNWmzh1jh7btjLjMRXt/svNTs2UhE820nGUoFFGQB/JzlrXg6q7d6QmD2
 ffsbK7oUHp52tgSSoapBFyQPwlRUMVedFSMWfCngxtYdyh+r36997JtlBMJb8pXQxb/Z
 8RjNjlttglAjz/aHGz4CZxP6KO1FKoVvf4NOB+AHmilEOSJB8ilKskO+8szm02C9gIlq
 lLUg==
X-Gm-Message-State: AOAM533W4wK2xH1fmgHRa488sfWmohQ/5gRevhp5XRCxaV/ei1v5QQJ8
 Xf1ibHvZJ+N/NvUUFYq6FH2y3g==
X-Google-Smtp-Source: ABdhPJyGSix2gzwgjqO1ElRNPc+uobLf1YbLQMZq6AHiTM3revNZb3pLVoQHDosWYBtaijsb6thTsA==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr24440359wru.269.1619454490561; 
 Mon, 26 Apr 2021 09:28:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k188sm6943852wmf.18.2021.04.26.09.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:28:09 -0700 (PDT)
Date: Mon, 26 Apr 2021 18:28:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4 3/4] drm/vkms: add XRGB planes composition
Message-ID: <YIbqF5IqofybM4k8@phenom.ffwll.local>
References: <cover.1619250933.git.melissa.srw@gmail.com>
 <07bcf4643d11da9480599fe1b165e478bff58b25.1619250933.git.melissa.srw@gmail.com>
 <20210426110315.4e64d589@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426110315.4e64d589@eldfell>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 11:03:15AM +0300, Pekka Paalanen wrote:
> On Sat, 24 Apr 2021 05:25:31 -0300
> Melissa Wen <melissa.srw@gmail.com> wrote:
> 
> > Add support for composing XRGB888 planes in addition to the ARGB8888
> > format. In the case of an XRGB plane at the top, the composition consists
> > of copying the RGB values of a pixel from src to dst and clearing alpha
> > channel, without the need for alpha blending operations for each pixel.
> > 
> > Blend equations assume a completely opaque background, i.e., primary plane
> > is not cleared before pixel blending but alpha channel is explicitly
> > opaque (a = 0xff). Also, there is room for performance evaluation in
> > switching pixel blend operation according to the plane format.
> > 
> > v4:
> > - clear alpha channel (0xff) after blend color values by pixel
> > - improve comments on blend ops to reflect the current state
> > - describe in the commit message future improvements for plane composition
> > 
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 56 ++++++++++++++++++++++------
> >  drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++--
> >  2 files changed, 48 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 02642801735d..7e01bc39d2a1 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -4,6 +4,7 @@
> >  
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> >  #include <drm/drm_gem_shmem_helper.h>
> >  #include <drm/drm_vblank.h>
> > @@ -64,7 +65,17 @@ static u8 blend_channel(u8 src, u8 dst, u8 alpha)
> >  	return new_color;
> >  }
> >  
> > -static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
> > +/**
> > + * alpha_blend - alpha blending equation
> > + * @argb_src: src pixel on premultiplied alpha mode
> > + * @argb_dst: dst pixel completely opaque
> > + *
> > + * blend pixels using premultiplied blend formula. The current DRM assumption
> > + * is that pixel color values have been already pre-multiplied with the alpha
> > + * channel values. See more drm_plane_create_blend_mode_property(). Also, this
> > + * formula assumes a completely opaque background.
> > + */
> > +static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
> >  {
> >  	u8 alpha;
> >  
> > @@ -72,8 +83,16 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
> >  	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
> >  	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
> >  	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
> > -	/* Opaque primary */
> > -	argb_dst[3] = 0xFF;
> > +}
> > +
> > +/**
> > + * x_blend - blending equation that ignores the pixel alpha
> > + *
> > + * overwrites RGB color value from src pixel to dst pixel.
> > + */
> > +static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
> > +{
> > +	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
> 
> Hi,
> 
> this function very clearly assumes a very specific pixel format on both
> source and destination. I think it would be good if the code comments
> called out exactly which DRM_FORMAT_* they assume. This would be good
> to do on almost every function that makes such assumptions. I believe that
> would help code readability, and also point out explicitly which things
> need to be fixed when you add support for even more pixel formats.
> 
> "xrgb" and "argb" are IMO too vague. You might be referring to
> DRM_FORMAT_XRGB* and DRM_FORMAT_ARGB*, or maybe you are referring to any
> pixel format that happens to have or not have an alpha channel in
> addition to the three RGB channels in some order and width.
> 
> Being explicit that these refer to specific DRM_FORMAT_* should also
> help understanding how things work on big-endian CPUs. My current
> understanding is that this memcpy is correct also on big-endian, given
> DRM_FORMAT_XRGB8888.
> 
> Hmm, or rather, is this particular function intended to be general in
> the sense that the order of RGB channels does not matter as long as it's
> the same in both source and destination? Which would mean I had a wrong
> assumption from the start.

Atm all vkms supports is X/ARGB8888, and even there we throw around random
limits. Add support for more pixel formats is definitely on the list, and
then all the blend/compose stuff needs to be quite drastically
rearchitected.

I think until we're there documenting what's already documented in the
todo list feels like overkill.
-Daniel

> 
> >  }
> >  
> >  /**
> > @@ -82,16 +101,20 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
> >   * @vaddr_src: source address
> >   * @dst_composer: destination framebuffer's metadata
> >   * @src_composer: source framebuffer's metadata
> > + * @pixel_blend: blending equation based on plane format
> >   *
> > - * Blend the vaddr_src value with the vaddr_dst value using the pre-multiplied
> > - * alpha blending equation, since DRM currently assumes that the pixel color
> > - * values have already been pre-multiplied with the alpha channel values. See
> > - * more drm_plane_create_blend_mode_property(). This function uses buffer's
> > - * metadata to locate the new composite values at vaddr_dst.
> > + * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
> > + * equation according to the plane format and clearing alpha channel to an
> > + * completely opaque background. This function uses buffer's metadata to locate
> > + * the new composite values at vaddr_dst.
> > + *
> > + * TODO: completely clear the primary plane (a = 0xff) before starting to blend
> > + * pixel color values
> >   */
> >  static void blend(void *vaddr_dst, void *vaddr_src,
> >  		  struct vkms_composer *dst_composer,
> > -		  struct vkms_composer *src_composer)
> > +		  struct vkms_composer *src_composer,
> > +		  void (*pixel_blend)(const u8 *, u8 *))
> >  {
> >  	int i, j, j_dst, i_dst;
> >  	int offset_src, offset_dst;
> > @@ -119,7 +142,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> >  
> >  			pixel_src = (u8 *)(vaddr_src + offset_src);
> >  			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
> > -			alpha_blending(pixel_src, pixel_dst);
> > +			pixel_blend(pixel_src, pixel_dst);
> > +			/* clearing alpha channel (0xff)*/
> > +			memset(vaddr_dst + offset_dst + 3, 0xff, 1);
> 
> A one byte memset?
> 
> Wouldn't pixel_dst[3] = 0xff; be more clear?
> 
> 
> Thanks,
> pq
> 
> >  		}
> >  		i_dst++;
> >  	}
> > @@ -131,6 +156,8 @@ static void compose_plane(struct vkms_composer *primary_composer,
> >  {
> >  	struct drm_gem_object *plane_obj;
> >  	struct drm_gem_shmem_object *plane_shmem_obj;
> > +	struct drm_framebuffer *fb = &plane_composer->fb;
> > +	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> >  
> >  	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
> >  	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
> > @@ -138,8 +165,13 @@ static void compose_plane(struct vkms_composer *primary_composer,
> >  	if (WARN_ON(!plane_shmem_obj->vaddr))
> >  		return;
> >  
> > -	blend(vaddr_out, plane_shmem_obj->vaddr,
> > -	      primary_composer, plane_composer);
> > +	if (fb->format->format == DRM_FORMAT_ARGB8888)
> > +		pixel_blend = &alpha_blend;
> > +	else
> > +		pixel_blend = &x_blend;
> > +
> > +	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
> > +	      plane_composer, pixel_blend);
> >  }
> >  
> >  static int compose_active_planes(void **vaddr_out,
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 135140f8e87a..da4251aff67f 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -16,8 +16,9 @@ static const u32 vkms_formats[] = {
> >  	DRM_FORMAT_XRGB8888,
> >  };
> >  
> > -static const u32 vkms_cursor_formats[] = {
> > +static const u32 vkms_plane_formats[] = {
> >  	DRM_FORMAT_ARGB8888,
> > +	DRM_FORMAT_XRGB8888
> >  };
> >  
> >  static struct drm_plane_state *
> > @@ -200,8 +201,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> >  	int nformats;
> >  
> >  	if (type == DRM_PLANE_TYPE_CURSOR) {
> > -		formats = vkms_cursor_formats;
> > -		nformats = ARRAY_SIZE(vkms_cursor_formats);
> > +		formats = vkms_plane_formats;
> > +		nformats = ARRAY_SIZE(vkms_plane_formats);
> >  		funcs = &vkms_primary_helper_funcs;
> >  	} else {
> >  		formats = vkms_formats;
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
