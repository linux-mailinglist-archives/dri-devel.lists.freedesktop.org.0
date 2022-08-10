Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74758F30C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E7990B33;
	Wed, 10 Aug 2022 19:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7E8EC81
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IX//JcdkrgOZqycBs6XCkLC14hxbQjy7W58Do3AHHr4=;
 b=bNo6ejTh28wb6w48qdvjndLox0n+iCZ51gERiqghArSg48NhiJsYrvRpRZlN4Oubv60MEvPHYbX5i
 dbQZat/NZE9YdgZpFg557H2z9p6Qv+gUhHLpJw9FzSFb3WNzgpF2uSk4pLasESxHEnlgh+FqTbHUPE
 e5Np7jshJdd9k8iZTY/v+NV4A61gXrtIrR+Q1YBwJdsF+cT7RGxyS3SU4GlgE9fAUbAdb0yDrPvh5C
 FOFwoOnbAcjxq4K7UJoA3nX2HJS5uIOTt7xgAMBmrBFTRNVnwwFKG3HwNgmZHdM2hKvw6hF4zeObnX
 zjTYTlbSfnR2qWx+ZY76jfZin5oDd/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IX//JcdkrgOZqycBs6XCkLC14hxbQjy7W58Do3AHHr4=;
 b=MHULCe8FkTij12+TAjeRG2VXBXoON5yOGXk3yqOc5jDo/vrVX0hJrpG4b0WIEz0+wIvmIWoLOApRn
 PEwqqDQBQ==
X-HalOne-Cookie: 0a1fdabb9d0abbc5267b9af2cc175d9d0b078763
X-HalOne-ID: bde75fde-18e2-11ed-a6cc-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id bde75fde-18e2-11ed-a6cc-d0431ea8a283;
 Wed, 10 Aug 2022 19:29:24 +0000 (UTC)
Date: Wed, 10 Aug 2022 21:29:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] drm/modes: Add initializer macro DRM_MODE_INIT()
Message-ID: <YvQHE51Ouj6FgfG6@ravnborg.org>
References: <20220810112053.19547-1-tzimmermann@suse.de>
 <20220810112053.19547-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810112053.19547-4-tzimmermann@suse.de>
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
Cc: david@lechnology.com, emma@anholt.net, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kamlesh.gurudasani@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 01:20:52PM +0200, Thomas Zimmermann wrote:
> The macro DRM_MODE_INIT() initializes an instance of
> struct drm_display_mode with typical parameters. Convert simpledrm
> and also update the macro DRM_SIMPLE_MODE().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

It is nice that the macros are now documented.

	Sam

> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 23 ++++++++-------------
>  include/drm/drm_modes.h          | 35 +++++++++++++++++++++++++++-----
>  2 files changed, 39 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 31d3bc6c5acf..cc509154b296 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -30,16 +30,6 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> -/*
> - * Assume a monitor resolution of 96 dpi to
> - * get a somewhat reasonable screen size.
> - */
> -#define RES_MM(d)	\
> -	(((d) * 254ul) / (96ul * 10ul))
> -
> -#define SIMPLEDRM_MODE(hd, vd)	\
> -	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
> -
>  /*
>   * Helpers for simplefb
>   */
> @@ -641,10 +631,15 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
>  static struct drm_display_mode simpledrm_mode(unsigned int width,
>  					      unsigned int height)
>  {
> -	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
> -
> -	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
> -	drm_mode_set_name(&mode);
> +	/*
> +	 * Assume a monitor resolution of 96 dpi to
> +	 * get a somewhat reasonable screen size.
> +	 */
> +	const struct drm_display_mode mode = {
> +		DRM_MODE_INIT(60, width, height,
> +			      DRM_MODE_RES_MM(width, 96ul),
> +			      DRM_MODE_RES_MM(height, 96ul))
> +	};
>  
>  	return mode;
>  }
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index a80ae9639e96..bb932806f029 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -138,6 +138,35 @@ enum drm_mode_status {
>  	.vsync_start = (vss), .vsync_end = (vse), .vtotal = (vt), \
>  	.vscan = (vs), .flags = (f)
>  
> +/**
> + * DRM_MODE_RES_MM - Calculates the display size from resolution and DPI
> + * @res: The resolution in pixel
> + * @dpi: The number of dots per inch
> + */
> +#define DRM_MODE_RES_MM(res, dpi)	\
> +	(((res) * 254ul) / ((dpi) * 10ul))
> +
> +#define __DRM_MODE_INIT(pix, hd, vd, hd_mm, vd_mm) \
> +	.type = DRM_MODE_TYPE_DRIVER, .clock = (pix), \
> +	.hdisplay = (hd), .hsync_start = (hd), .hsync_end = (hd), \
> +	.htotal = (hd), .vdisplay = (vd), .vsync_start = (vd), \
> +	.vsync_end = (vd), .vtotal = (vd), .width_mm = (hd_mm), \
> +	.height_mm = (vd_mm)
> +
> +/**
> + * DRM_SIMPLE_MODE_INIT - Initialize display mode
> + * @hz: Vertical refresh rate in Hertz
> + * @hd: Horizontal resolution, width
> + * @vd: Vertical resolution, height
> + * @hd_mm: Display width in millimeters
> + * @vd_mm: Display height in millimeters
> + *
> + * This macro initializes a &drm_display_mode that contains information about
> + * refresh rate, resolution and physical size.
> + */
> +#define DRM_MODE_INIT(hz, hd, vd, hd_mm, vd_mm) \
> +	__DRM_MODE_INIT((hd) * (vd) * (hz) / 1000 /* kHz */, hd, vd, hd_mm, vd_mm)
> +
>  /**
>   * DRM_SIMPLE_MODE - Simple display mode
>   * @hd: Horizontal resolution, width
> @@ -149,11 +178,7 @@ enum drm_mode_status {
>   * resolution and physical size.
>   */
>  #define DRM_SIMPLE_MODE(hd, vd, hd_mm, vd_mm) \
> -	.type = DRM_MODE_TYPE_DRIVER, .clock = 1 /* pass validation */, \
> -	.hdisplay = (hd), .hsync_start = (hd), .hsync_end = (hd), \
> -	.htotal = (hd), .vdisplay = (vd), .vsync_start = (vd), \
> -	.vsync_end = (vd), .vtotal = (vd), .width_mm = (hd_mm), \
> -	.height_mm = (vd_mm)
> +	__DRM_MODE_INIT(1 /* pass validation */, hd, vd, hd_mm, vd_mm)
>  
>  #define CRTC_INTERLACE_HALVE_V	(1 << 0) /* halve V values for interlacing */
>  #define CRTC_STEREO_DOUBLE	(1 << 1) /* adjust timings for stereo modes */
> -- 
> 2.37.1
