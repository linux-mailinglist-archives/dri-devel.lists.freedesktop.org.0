Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDAB3EEDD6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 15:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C5D6E197;
	Tue, 17 Aug 2021 13:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673486E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 13:56:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g21so17868453edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=keP0AkrMa/UFxHBh455OJrPKVa/rgaDSisI3KrlMkUY=;
 b=ek/Zjvr6g6qnxN6R7xxGO2izW/RrXV37jJvrqLQvZjmP6QitkmDI0CFmm6hl6WC84U
 5t57bvvQ3Y3w9KXizsCpldSn9qmPEcI3VNWjxHahuSmMWyypCo4pN/4kD/34gWTT88Yi
 WBaHm53VHtozM+7p/ctYK/J7fu/4SIfJiUTVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=keP0AkrMa/UFxHBh455OJrPKVa/rgaDSisI3KrlMkUY=;
 b=dEDVPKhKOyEFnRyhyCNH4Qpt57WHpPlSUXZof2ni/zA79k7oMKmfWpTc42wsT3u2gL
 tsoLbJn0i2eFI5A/03xCku4mu3idsGy1R3QcwLkJluPYoojSCrMATTTyqje5/7bh609w
 lZVqR+0hzQiFRnreAJ/PVwOAZ0t0p/DOg4y15nPe4HyRkMsNh0tw1UKEYmkt/twxQDi8
 3TohIScyIiQQN6P14LBBIG4geR9v3I6oS5tbUTXQ5D5spFnxVpsxBfmPlVXh8v/o+7CU
 APGv570d7+veL6PNHbzAS9G+rnYBQeLMHm9j35FIlYaHIGmNw+yeIhq84KnlQuf4a2Gl
 Z7UA==
X-Gm-Message-State: AOAM533v1gSguQzp4IfYQof9UB1OIJN3sCs1yeQNbND0R1FvAtHhsSDU
 ZFZJ9zRV8gkxkiWTEvD1pgAv4g==
X-Google-Smtp-Source: ABdhPJyPfdOh0el5f5iFuy3cMWzh8bb5iaOwUaz4zbohDsd+c+E6xXqwkyxKzGHcUCOmQ2Nw8xXiOQ==
X-Received: by 2002:aa7:d319:: with SMTP id p25mr4368173edq.197.1629208572917; 
 Tue, 17 Aug 2021 06:56:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c28sm793741ejc.102.2021.08.17.06.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 06:56:12 -0700 (PDT)
Date: Tue, 17 Aug 2021 15:56:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se,
 linus.walleij@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
Message-ID: <YRu/+nEX4A5i4sfl@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817122917.49929-3-noralf@tronnes.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 02:29:12PM +0200, Noralf Trønnes wrote:
> Add XRGB8888 emulation support for devices that can only do RGB332.
> 
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 47 +++++++++++++++++++++++++++++
>  include/drm/drm_format_helper.h     |  2 ++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 5231104b1498..53b426da7467 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -135,6 +135,53 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL(drm_fb_swab);
>  
> +static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, u32 *sbuf, unsigned int pixels)
> +{
> +	unsigned int x;
> +
> +	for (x = 0; x < pixels; x++)
> +		dbuf[x] = ((sbuf[x] & 0x00e00000) >> 16) |

I think for 2/3 bits correct rounding would be useful, not just masking.
i.e. before you shift add 0x00100000 here, and similar below.

Also I just realized we've totally ignored endianess on these, which is
not great, because strictly speaking all the drm_fourcc codes should be
little endian. But I'm also not sure that's worth fixing ...

Either way, lgtm:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +			  ((sbuf[x] & 0x0000e000) >> 11) |
> +			  ((sbuf[x] & 0x000000c0) >> 6);
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
> + * @dst: RGB332 destination buffer
> + * @src: XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + *
> + * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
> + *
> + * This function does not apply clipping on dst, i.e. the destination is a small buffer
> + * containing the clip rect only.
> + */
> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
> +			       struct drm_rect *clip)
> +{
> +	size_t width = drm_rect_width(clip);
> +	size_t src_len = width * sizeof(u32);
> +	unsigned int y;
> +	void *sbuf;
> +
> +	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
> +	sbuf = kmalloc(src_len, GFP_KERNEL);
> +	if (!sbuf)
> +		return;
> +
> +	src += clip_offset(clip, fb->pitches[0], sizeof(u32));
> +	for (y = 0; y < drm_rect_height(clip); y++) {
> +		memcpy(sbuf, src, src_len);
> +		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
> +		src += fb->pitches[0];
> +		dst += width;
> +	}
> +
> +	kfree(sbuf);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
> +
>  static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
>  					   unsigned int pixels,
>  					   bool swab)
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 4e0258a61311..d0809aff5cf8 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -16,6 +16,8 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vadd
>  			   struct drm_rect *clip);
>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>  		 struct drm_rect *clip, bool cached);
> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
> +			       struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
>  			       struct drm_framebuffer *fb,
>  			       struct drm_rect *clip, bool swab);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
