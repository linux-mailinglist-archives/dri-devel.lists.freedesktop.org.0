Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D720CD60
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 10:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108C06E42F;
	Mon, 29 Jun 2020 08:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6606E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:47:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r12so15610634wrj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s2KK1O0+ZlNOTK1zGrgvdQZb9jA5WF7jGJLm6pA+IQg=;
 b=TATL4fLQWVHw3rBu34XmxY02YbEjo1+r32i2auo6r3L7dSMmyeaLVi2VjZO8Ux3mYm
 WCC0pVpC/Le2hYN+Dcd5Rt24F9yUXUkRif8ey+D1t6y1W1X6i+3lrO2ZazKOds7eANu8
 JJZfZgrF9TSeMNfFnbEemM9UAHsQZHfMIDZH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s2KK1O0+ZlNOTK1zGrgvdQZb9jA5WF7jGJLm6pA+IQg=;
 b=VKsv6OqkLjHCscj1CET8G7nbwESXQxQXf9UKJ1AaXquZk6+0NmwwF2DB3y68AqNtjA
 vkook2aprCe8CrIKd7nTXM9+HsR55LnV6UFED60nt1CdeKVhB7eMc67NYCuwgQGnCuE6
 ixxC3/wOULwEz57Ox6dBWRTE51YAxa1q33t//z/8hgTYkq9Szzl6f8fMfb9a3wXDeO3F
 1HijfjN7IEj/YvgNF9KlhEf/YC33MFuKw3NBIW3m4sUbyLX2Uf3EqjYPNlj1LPzf20Et
 jDrn7d2PiA/nXbW5zjmV8bZvnfmMfx5cXDiIGuNjw+z7tGP1Ns8Qln+NvxNO1ipNn0J6
 TqGw==
X-Gm-Message-State: AOAM530rsxN9DmOasimj+l6cLFHaUPLdQmO+snmYwW71mQRGRRoxuSsB
 4ohfMazBiDzI9O82sg9/eiLXTw==
X-Google-Smtp-Source: ABdhPJxTJ8BdH6kN5hnT1Mtp84R7x+9D18j73J7dfR7wE0MvFrtOpiLqcdjqOAC1nRZBAKHpgJc22g==
X-Received: by 2002:adf:de12:: with SMTP id b18mr17146672wrm.390.1593420421012; 
 Mon, 29 Jun 2020 01:47:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm43949053wrm.64.2020.06.29.01.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:47:00 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:46:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/9] drm/format-helper: Add blitter functions
Message-ID: <20200629084658.GM3278063@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625120011.16168-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 02:00:04PM +0200, Thomas Zimmermann wrote:
> The blitter functions copy a framebuffer to I/O memory using one of
> the existing conversion functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm I guess reason for adding dst_pitch in the previous patch is so that
there wouldn't be a special case here. Makes sense.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_format_helper.c | 87 +++++++++++++++++++++++++++++
>  include/drm/drm_format_helper.h     |  8 +++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 8d5a683afea7..0e885cd34107 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -344,3 +344,90 @@ void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>  
> +/**
> + * drm_fb_blit_rect_dstclip - Copy parts of a framebuffer to display memory
> + * @dst:	The display memory to copy to
> + * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
> + * @dst_format:	FOURCC code of the display's color format
> + * @vmap:	The framebuffer memory to copy from
> + * @fb:		The framebuffer to copy from
> + * @clip:	Clip rectangle area to copy
> + *
> + * This function copies parts of a framebuffer to display memory. If the
> + * formats of the display and the framebuffer mismatch, the blit function
> + * will attempt to convert between them.
> + *
> + * Use drm_fb_blit_dstclip() to copy the full framebuffer.
> + *
> + * Returns:
> + * 0 on success, or
> + * -EINVAL if the color-format conversion failed, or
> + * a negative error code otherwise.
> + */
> +int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
> +			     uint32_t dst_format, void *vmap,
> +			     struct drm_framebuffer *fb,
> +			     struct drm_rect *clip)
> +{
> +	uint32_t fb_format = fb->format->format;
> +
> +	/* treat alpha channel like filler bits */
> +	if (fb_format == DRM_FORMAT_ARGB8888)
> +		fb_format = DRM_FORMAT_XRGB8888;
> +	if (dst_format == DRM_FORMAT_ARGB8888)
> +		dst_format = DRM_FORMAT_XRGB8888;
> +
> +	if (dst_format == fb_format) {
> +		drm_fb_memcpy_dstclip(dst, dst_pitch, vmap, fb, clip);
> +		return 0;
> +
> +	} else if (dst_format == DRM_FORMAT_RGB565) {
> +		if (fb_format == DRM_FORMAT_XRGB8888) {
> +			drm_fb_xrgb8888_to_rgb565_dstclip(dst, dst_pitch,
> +							  vmap, fb, clip,
> +							  false);
> +			return 0;
> +		}
> +	} else if (dst_format == DRM_FORMAT_RGB888) {
> +		if (fb_format == DRM_FORMAT_XRGB8888) {
> +			drm_fb_xrgb8888_to_rgb888_dstclip(dst, dst_pitch,
> +							  vmap, fb, clip);
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_fb_blit_rect_dstclip);
> +
> +/**
> + * drm_fb_blit_dstclip - Copy framebuffer to display memory
> + * @dst:	The display memory to copy to
> + * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
> + * @dst_format:	FOURCC code of the display's color format
> + * @vmap:	The framebuffer memory to copy from
> + * @fb:		The framebuffer to copy from
> + *
> + * This function copies a full framebuffer to display memory. If the formats
> + * of the display and the framebuffer mismatch, the copy function will
> + * attempt to convert between them.
> + *
> + * See drm_fb_blit_rect_dstclip() for more inforamtion.
> + *
> + * Returns:
> + * 0 on success, or a negative error code otherwise.
> + */
> +int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
> +			uint32_t dst_format, void *vmap,
> +			struct drm_framebuffer *fb)

I do wonder whether we shouldn't have to some safety checks for this
stuff, like maybe something like:

struct dst_info {
	void __iomem *dst;
	unsigned int size;
	unsigned int dst_pitch;
	uint32_t dst_format;
};

And then the helpers would splat a WARNING if a driver ever gets this
wrong. Thinking about this because syzkaller has found tons of little
off-by-a-bit bugs in the vt/fbcon/fbdev code, and maybe we should try to
be better :-)

But that's material for another patch, and maybe once we have a few more
helpers in this library we can figure out a nice struct to package up
these long&confusing argument lists a bit.

Cheers, Daniel

> +{
> +	struct drm_rect fullscreen = {
> +		.x1 = 0,
> +		.x2 = fb->width,
> +		.y1 = 0,
> +		.y2 = fb->height,
> +	};
> +	return drm_fb_blit_rect_dstclip(dst, dst_pitch, dst_format, vmap, fb,
> +					&fullscreen);
> +}
> +EXPORT_SYMBOL(drm_fb_blit_dstclip);
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 2b5036a5fbe7..4e0258a61311 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -28,4 +28,12 @@ void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch
>  void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
>  			      struct drm_rect *clip);
>  
> +int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
> +			     uint32_t dst_format, void *vmap,
> +			     struct drm_framebuffer *fb,
> +			     struct drm_rect *rect);
> +int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
> +			uint32_t dst_format, void *vmap,
> +			struct drm_framebuffer *fb);
> +
>  #endif /* __LINUX_DRM_FORMAT_HELPER_H */
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
