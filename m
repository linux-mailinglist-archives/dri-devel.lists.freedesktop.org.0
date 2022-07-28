Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B350E58397D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3DE10E199;
	Thu, 28 Jul 2022 07:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361B910E612
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:26:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 2-20020a1c0202000000b003a3a22178beso489869wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 00:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6jXyox9CMZw1Uh3/DzaLPDbI0DbQu1TVSdfnXCR3CiQ=;
 b=Y25A2dZ3peDYSJaq8Lh8E7uUmF8oIAyeZ73Eot2meLEwM1AlWiXNAq0llleQOkuSLv
 JuCZXqs1IAOCJzeq5+9R3gijlqM+/Di0YbRg0pbQ+iftVcMStNSwwo7/pbHyQN1z31ml
 7pzoThUY977QfJNCufBUms1L0vyQNAcTnQg/oc4sHXn1koKkn4pPLPPKGLf26MlPZIIQ
 neTEOp6HqXuw0jw0dK4FM4A9fNzFIk/R0vGo7dIVr+9KK3s7SbVwm93ZIDoVBDR0bpag
 NbFL8eXyZScl4UKy7CAMBB6sBn5xW/ABASF6RB+SzgQg+rR3JtO6DhHurTF5TbSHgKKy
 49nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6jXyox9CMZw1Uh3/DzaLPDbI0DbQu1TVSdfnXCR3CiQ=;
 b=oAHgoDEZxoP1qVEKBh4A9uWeH1BLAPq3nMzK+uFq0v9YC3nC3wCKM46rnR1qhEmczy
 xbZUguwtRfIXotXDkOaLh4rhduE1qBb1TxCXj0GusR77Sjaz1jyHiQ5kOgEMlJYz/Uus
 l9WC7o5F50VMRYYGhVQ3SMA+jy9FzAqXY3jS2Gd+7oyw6H0r1zH30f7S3iTiArDgfeoa
 tOy61m9oLnaF4862x4jSnGB2xhnzfwoGbRts8WbHPHGKGoovHsCiQWR4r9q14V2TXbeL
 eszeQ3+Q6NsNnfTyBetZnu+hpjqInVYTCNxFG5WUSx5JgGI/iBMJAk4qbfABRBq4yrHx
 PhBw==
X-Gm-Message-State: AJIora/I0+ipyaa8lxyh9t+ixtVLv57lEPXIQhz85nVgyiiMalQIJap+
 YDnJlVZRJ6ZA+Qum5WhC32I=
X-Google-Smtp-Source: AGRyM1uEuSIzcwZU3eQ+FRIzak9+SYWR+aOOYemX/mkDkxSM9WDeNEoAt8W8wP/1nD/e88a3glYoaw==
X-Received: by 2002:a05:600c:3d93:b0:3a3:3a93:fb16 with SMTP id
 bi19-20020a05600c3d9300b003a33a93fb16mr5711807wmb.190.1658993194219; 
 Thu, 28 Jul 2022 00:26:34 -0700 (PDT)
Received: from elementary ([94.73.33.57]) by smtp.gmail.com with ESMTPSA id
 i18-20020adfaad2000000b0021d70a871cbsm158488wrc.32.2022.07.28.00.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 00:26:33 -0700 (PDT)
Date: Thu, 28 Jul 2022 09:26:30 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/12] drm/format-helper: Move destination-buffer
 handling into internal helper
Message-ID: <20220728072630.GB56421@elementary>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-13-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Wed, Jul 27, 2022 at 01:33:12PM +0200, Thomas Zimmermann wrote:
> The format-convertion helpers handle several cases for different
> values of destination buffer and pitch. Move that code into the
> internal helper drm_fb_xfrm() and avoid quite a bit of duplucation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 169 +++++++++++-----------------
>  1 file changed, 64 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index d296d181659d..35aebdb90165 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -41,11 +41,11 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
>  }
>  EXPORT_SYMBOL(drm_fb_clip_offset);
>  
> -/* TODO: Make this functon work with multi-plane formats. */
> -static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> -		       const void *vaddr, const struct drm_framebuffer *fb,
> -		       const struct drm_rect *clip, bool vaddr_cached_hint,
> -		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> +/* TODO: Make this function work with multi-plane formats. */
> +static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> +			 const void *vaddr, const struct drm_framebuffer *fb,
> +			 const struct drm_rect *clip, bool vaddr_cached_hint,
> +			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
>  {
>  	unsigned long linepixels = drm_rect_width(clip);
>  	unsigned long lines = drm_rect_height(clip);
> @@ -84,11 +84,11 @@ static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pix
>  	return 0;
>  }
>  
> -/* TODO: Make this functon work with multi-plane formats. */
> -static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> -			    const void *vaddr, const struct drm_framebuffer *fb,
> -			    const struct drm_rect *clip, bool vaddr_cached_hint,
> -			    void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> +/* TODO: Make this function work with multi-plane formats. */
> +static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> +			      const void *vaddr, const struct drm_framebuffer *fb,
> +			      const struct drm_rect *clip, bool vaddr_cached_hint,
> +			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
>  {
>  	unsigned long linepixels = drm_rect_width(clip);
>  	unsigned long lines = drm_rect_height(clip);
> @@ -129,6 +129,29 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
>  	return 0;
>  }
>  
> +/* TODO: Make this function work with multi-plane formats. */
> +static int drm_fb_xfrm(struct iosys_map *dst,
> +		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
> +		       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +		       const struct drm_rect *clip, bool vaddr_cached_hint,
> +		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> +{
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
> +					  vmap[0].vaddr, fb, clip, false, xfrm_line);
> +	else
> +		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
> +				     vmap[0].vaddr, fb, clip, false, xfrm_line);
> +}
> +
> +

Nit: Extra blank line

>  /**
>   * drm_fb_memcpy - Copy clip buffer
>   * @dst: Array of destination buffers
> @@ -213,14 +236,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  		 const struct drm_rect *clip, bool cached)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> -	};
>  	const struct drm_format_info *format = fb->format;
> -	u8 cpp = format->cpp[0];
>  	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
>  
> -	switch (cpp) {
> +	switch (format->cpp[0]) {
>  	case 4:
>  		swab_line = drm_fb_swab32_line;
>  		break;
> @@ -230,21 +249,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  	default:
>  		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
>  			      &format->format);
> -		swab_line = NULL;
> -		break;
> -	}
> -	if (!swab_line)
>  		return;
> +	}
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst->is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], cpp,
> -				 vmap[0].vaddr, fb, clip, cached, swab_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], cpp, vmap[0].vaddr, fb,
> -			    clip, cached, swab_line);
> +	drm_fb_xfrm(dst, dst_pitch, format->cpp, vmap, fb, clip, cached, swab_line);
>  }
>  EXPORT_SYMBOL(drm_fb_swab);
>  
> @@ -277,19 +285,12 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		1,
>  	};

Could "dst_pixsize" be obtained from "drm_format_info->cpp"? (in all
conversion functions, not only in this one).

I think they are similar structures, so we might be able to reuse that
information.

>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> -				 false, drm_fb_xrgb8888_to_rgb332_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> -			    false, drm_fb_xrgb8888_to_rgb332_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_rgb332_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>  
> @@ -344,9 +345,10 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip, bool swab)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
>  	};
> +
>  	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
>  
>  	if (swab)
> @@ -354,15 +356,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  	else
>  		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> -				 false, xfrm_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> -			    false, xfrm_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false, xfrm_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>  
> @@ -396,19 +390,12 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		3,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 3, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_xrgb8888_to_rgb888_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 3, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_xrgb8888_to_rgb888_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_rgb888_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>  
> @@ -435,19 +422,12 @@ static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int
>  				      const struct drm_framebuffer *fb,
>  				      const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_rgb565_to_xrgb8888_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_rgb565_to_xrgb8888_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_rgb565_to_xrgb8888_line);
>  }
>  
>  static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -470,19 +450,12 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
>  				      const struct drm_framebuffer *fb,
>  				      const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_rgb888_to_xrgb8888_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_rgb888_to_xrgb8888_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_rgb888_to_xrgb8888_line);
>  }
>  
>  static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -518,19 +491,12 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
>  				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_xrgb2101010_line);
>  }
>  
>  static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -571,19 +537,12 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
>  			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			      const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		1,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_xrgb8888_to_gray8_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_xrgb8888_to_gray8_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_gray8_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>  
> -- 
> 2.37.1
> 
