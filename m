Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057283EEE0E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69FD891B9;
	Tue, 17 Aug 2021 14:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEC2891B9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:05:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gt38so17718956ejc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RnxKc8QhITN+pN9JJAVqTbABzaeSj3yYTOoBLXV3Jgw=;
 b=BAdFmI3N7UtomeMdvN0Ex/D8ujkVtHBEWc80V/XRyqAu69dZGQ9v2xb1p4gYAp+WPs
 7Qh/a43htf96ZeNhsPnXFY9KyLL87d0TzNOG353VS7Kcz3+XBZKlUBy4HIJGNHpBftBh
 R9Q6gKltH6j2u5y6hEGiQU27IwYNusJcgt5rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RnxKc8QhITN+pN9JJAVqTbABzaeSj3yYTOoBLXV3Jgw=;
 b=BNguNTPFY52kBDhJ/pszXkpRCy/xUxaSPZAxfcRZBZLulonlOkVNfiJW1MhAwICwPw
 +xGfKH6N8F89tpvvgeoirFeT9IL0ZJvLAXV7goJs+7xRTdq0A6pSd+UamcHTPVVy3Cug
 iV8AKq2ARCSOGUZmRv0EMkiwcSFT/CJuENZohKFyqjPJubD/CjPSAQOw25C3WpPNDlC9
 KPfN/9iCYW+QwMiLCmj1pzK0EsQ0HpKZtvSwygvPUKDoONYpAjPFeZx9BaSMphWbryx7
 71Uf8Wmrdqac58Ppl8heP4N+ftZLzAVC834S3/ZF0SZO1/CNP0sw+xnNr4SFAkauS/vg
 i0Iw==
X-Gm-Message-State: AOAM5301ye5R9ODOc6/yF2D1IPJmIiCWRrOr1WzGlMyEGM1zLxvmXdVD
 ogz/2gOSOTyyb9m02Wc3I0BFbQ==
X-Google-Smtp-Source: ABdhPJwGHVfirNxEmi0rIWxY8fOYUffo6ZjCeYS+lqAq7pmzCUfdSh04/uN6npHqCMAFHZeVblDSxg==
X-Received: by 2002:a17:907:785a:: with SMTP id
 lb26mr4227316ejc.77.1629209131887; 
 Tue, 17 Aug 2021 07:05:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j11sm813992ejy.112.2021.08.17.07.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 07:05:31 -0700 (PDT)
Date: Tue, 17 Aug 2021 16:05:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se,
 linus.walleij@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/7] drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
Message-ID: <YRvCKTMDxbPWD3eH@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817122917.49929-4-noralf@tronnes.org>
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

On Tue, Aug 17, 2021 at 02:29:13PM +0200, Noralf Trønnes wrote:
> Add XRGB8888 emulation support for devices that can only do RGB888.
> 
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 38 +++++++++++++++++++++++++++++
>  include/drm/drm_format_helper.h     |  2 ++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 53b426da7467..c42d50315123 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -297,6 +297,44 @@ static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
>  	}
>  }
>  
> +/**
> + * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
> + * @dst: RGB888 destination buffer
> + * @src: XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + *
> + * Drivers can use this function for RGB888 devices that don't natively
> + * support XRGB8888.
> + *
> + * This function does not apply clipping on dst, i.e. the destination
> + * is a small buffer containing the clip rect only.
> + */
> +void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
> +			       struct drm_rect *clip)

I do wonder whether we really need all the combinations here. E.g. if we
allow dst_pitch == 0 and just automatically pick this one here, and then
paper over the __iomem differences with dma_buf_map we wouldn't need two
different functions.

Just an idea.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
> +		drm_fb_xrgb8888_to_rgb888_line(dst, sbuf, width);
> +		src += fb->pitches[0];
> +		dst += width * 3;
> +	}
> +
> +	kfree(sbuf);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
> +
>  /**
>   * drm_fb_xrgb8888_to_rgb888_dstclip - Convert XRGB8888 to RGB888 clip buffer
>   * @dst: RGB565 destination buffer (iomem)
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index d0809aff5cf8..e86925cf07b9 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -24,6 +24,8 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
>  void drm_fb_xrgb8888_to_rgb565_dstclip(void __iomem *dst, unsigned int dst_pitch,
>  				       void *vaddr, struct drm_framebuffer *fb,
>  				       struct drm_rect *clip, bool swab);
> +void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
> +			       struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch,
>  				       void *vaddr, struct drm_framebuffer *fb,
>  				       struct drm_rect *clip);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
