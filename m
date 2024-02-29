Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CB86C7DF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE2310E415;
	Thu, 29 Feb 2024 11:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YFT0LjCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D9E10E455
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:17:51 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2cd3aea2621so968681fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709205470; x=1709810270; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=78AnTbBWHtQwBp97+2baWlG2WunBP4Oun4wT7Ff4jMk=;
 b=YFT0LjCxbzgUqjShWrP+dxZcqdNTtkc2roCMpPEyxw/w7cJ6Td57crvPMmI7/I35Y2
 ng3ZgUpiR4FXMV4FckjndUb2+JRBYiHF4DEhPkfYQxzM0jeFKHxqQPTulI+YSsSIwztC
 GY4j+tSFeVOLqg8fTmn+xh7lnBIxIj695DG5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709205470; x=1709810270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78AnTbBWHtQwBp97+2baWlG2WunBP4Oun4wT7Ff4jMk=;
 b=S3YJdPeyAbK7kD6RTCzejF5o4Ti44LkgkWuR+17YWik9Ftkjg14amZx1/vobKVY51I
 oXaJS5vRFb1V9frJBNdaLHTP1BoMX/LI95xOUv9+6lKRmHIjf+XOX1t6FOiFkoD4jpXC
 ox9W507Bs1cVHWHEOvJzE4JHuyxV93gzIdiq9XFSeyerj+2hT0kTBRQ/oJzARkHi99yO
 WJUp9A38MOx5kmhA2XKLvMASsfoni4SOOQUVwUufewZ/jEaaoCOuuoo5uEBpwtSZ4TdK
 +rKH6DTW/a9fZTtLLKmXKYba8cW850eIqD+QzuAV26Jo9BsewLCVxCg4eiiWd7sCTU8P
 +jWQ==
X-Gm-Message-State: AOJu0YyS5xi5Y7Kc4t+CJunBvHC6+XHtnWNmdbdYM+6v9LYe7KpxeIna
 bYDGaNSs65usRPczEc7y+iHrbiZh9NpKPc0vVyeBEPFkO06lrmDAags4YO6fGrQ=
X-Google-Smtp-Source: AGHT+IESeRcf2HwOD98mIWSOvHJJ5K6mySi1f0HR+VQq5FQ4lX4Uw/mh32xJpmpETMHusgUCotpsYg==
X-Received: by 2002:a2e:9ad4:0:b0:2d2:3d37:c9e1 with SMTP id
 p20-20020a2e9ad4000000b002d23d37c9e1mr1007174ljj.4.1709205469331; 
 Thu, 29 Feb 2024 03:17:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b00412bb8d0c9esm1789573wms.37.2024.02.29.03.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 03:17:48 -0800 (PST)
Date: Thu, 29 Feb 2024 12:17:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org, gpiccoli@igalia.com
Subject: Re: [PATCH v8 5/8] drm/simpledrm: Add drm_panic support
Message-ID: <ZeBn2sJmmQzY3Nxu@phenom.ffwll.local>
References: <20240227100459.194478-1-jfalempe@redhat.com>
 <20240227100459.194478-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227100459.194478-6-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Feb 27, 2024 at 11:04:16AM +0100, Jocelyn Falempe wrote:
> Add support for the drm_panic module, which displays a user-friendly
> message to the screen when a kernel panic occurs.
> 
> v8:
>  * Replace get_scanout_buffer() with drm_panic_set_buffer()
>    (Thomas Zimmermann)
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 7ce1c4617675..a2190995354a 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #define DRIVER_NAME	"simpledrm"
> @@ -735,6 +736,20 @@ static const struct drm_connector_funcs simpledrm_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> +static void simpledrm_init_panic_buffer(struct drm_plane *plane)
> +{
> +	struct simpledrm_device *sdev = simpledrm_device_of_dev(plane->dev);
> +	struct drm_framebuffer fb;
> +
> +	/* Fake framebuffer struct for drm_panic_set_buffer */
> +	fb.width = sdev->mode.hdisplay;
> +	fb.height = sdev->mode.vdisplay;
> +	fb.format = sdev->format;
> +	fb.pitches[0] = sdev->pitch;
> +
> +	drm_panic_set_buffer(plane->panic_scanout, &fb, &sdev->screen_base);
> +}
> +
>  static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
>  	.fb_create = drm_gem_fb_create_with_dirty,
>  	.atomic_check = drm_atomic_helper_check,
> @@ -945,6 +960,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>  		return ERR_PTR(ret);
>  	drm_plane_helper_add(primary_plane, &simpledrm_primary_plane_helper_funcs);
>  	drm_plane_enable_fb_damage_clips(primary_plane);
> +	drm_panic_register(primary_plane);

Just a quick comment on this:

This does not work, the driver is not ready to handle panic calls at this
stage. Instead we need to automatically register all planes that support
panic handling in drm_dev_register(), and we need to remove them all again
in drm_dev_unregister(). Outside of these functions it is not safe to call
into driver code.

At that point it might be simpler to only register one panic notifier per
drm_device, and push the loop into the panic handler again.

Cheers, Sima

> +	simpledrm_init_panic_buffer(primary_plane);
>  
>  	/* CRTC */
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
