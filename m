Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22FE519D7D
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D83F10E286;
	Wed,  4 May 2022 10:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1D310E286
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:58:52 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a21so1274369edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=X5wC/y8l3phzvrxUj5g6Q/bU6cd0GrNgtke4GEPDYJA=;
 b=j6UtRjbIBuPRag8NUVR1g+vsc1IRIjHiP/quPZKZ+CNUClMzeYRLSoTiU6sUL6tMbh
 Ch+JDUZAINX+5lvGFdJ55Z14C3ED7UgQ9rYGgiqFnQiw7H7vVNCtaCbpOzcTjXnW5Qik
 5H1x+DRmxmcvYtfkYGS1kgUy7v5guMdLC0S6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=X5wC/y8l3phzvrxUj5g6Q/bU6cd0GrNgtke4GEPDYJA=;
 b=L7RJiOuJ9zU5ZEm/bNqte5oQP0arIH92N/lhmjVEIw/kBvZC2Je0QVWqvZRtu9i/T+
 InzyfhDEJYNh9dkYc+u0GimQCyBLcCJ5pOcTgbNiUby0jFx2AC0ANa0c+GkEsIBrfEha
 XcEafrwdFdT9ujk8/OAFnnbDBVdu4/+jV05fclQSujfmRXGo6saUpAyFGMIvUxWbZc/3
 uxQ1REvVyIFnBeBcyMpqjJ1Qv4/T/pP5ue1PLITt0AJH9Cla7/kqG1l4KLuU9CtYJPB8
 pG33kPGrHJGdD5gVSgYzAV1+E2MJHqXH37kdYGMsnUE8RYrovXYsIkriGRrSxII69og7
 vN2A==
X-Gm-Message-State: AOAM531KdVq06+f2rZSRKHlKzVeq38z1sPHgJRt4xY76EYcqO4SOwfm8
 s9jG/nNwbFFRGyGQoxrDVffKlJHTf3jaWg==
X-Google-Smtp-Source: ABdhPJwscxkAohHovF4FMJCxbrKKrlnGE8Vcg8WcnudkpdOe8bMqhcqJaZWO8XXMOpSukPeZNH4/6Q==
X-Received: by 2002:a50:ee11:0:b0:425:b5b3:a48d with SMTP id
 g17-20020a50ee11000000b00425b5b3a48dmr22842334eds.246.1651661931124; 
 Wed, 04 May 2022 03:58:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 dq9-20020a170907734900b006f3ef214de3sm5590177ejc.73.2022.05.04.03.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 03:58:50 -0700 (PDT)
Date: Wed, 4 May 2022 12:58:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Message-ID: <YnJcaaDcIsJKhSwQ@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503071540.471667-4-javierm@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 03, 2022 at 09:15:40AM +0200, Javier Martinez Canillas wrote:
> Indicate to fbdev subsystem that the registered framebuffer is provided by
> the system firmware, so that it can handle accordingly. For example, would
> unregister the FB devices if asked to remove the conflicting framebuffers.
> 
> Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
> Drivers can use this to indicate the FB helper initialization that the FB
> registered is provided by the firmware, so it can be configured as such.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Changes in v3:
> - Drop the firmware local variable (Laurent Pinchart).
> - Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).

Just for the record what I brought up on irc already:

FBINFO_MISC_FIRMWARE is purely an internal flag with no uapi impact, and
it's only to control whether we nuke this from
remove_conflicting_framebuffer or not. Since simpledrm only ever binds
against sysfb I think it'd be cleaner to only rely on that, and relegate
that entire FBINFO_MISC_FIRMWARE misc hack to the fbdev dungeons and let
it quietly wither away there.

Also I'm not a huge fan of these midlayer flags in general :-)
-Daniel

> 
>  drivers/gpu/drm/drm_fb_helper.c  |  8 ++++++++
>  drivers/gpu/drm/tiny/simpledrm.c |  2 +-
>  include/drm/drm_fb_helper.h      | 10 ++++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 52042ba1e4cf..28b21858b726 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
>  		/* don't leak any physical addresses to userspace */
>  		info->flags |= FBINFO_HIDE_SMEM_START;
>  
> +	/* Indicate that the framebuffer is provided by the firmware */
> +	if (fb_helper->firmware)
> +		info->flags |= FBINFO_MISC_FIRMWARE;
> +
>  	/* Need to drop locks to avoid recursive deadlock in
>  	 * register_framebuffer. This is ok because the only thing left to do is
>  	 * register the fbdev emulation instance in kernel_fb_helper_list. */
> @@ -2512,6 +2516,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>   *
>   * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>   *   @dev->mode_config.preferred_depth is used instead.
> + * * DRM_FB_FW: if the framebuffer for the device is provided by the
> + *   system firmware.
>   *
>   * This function sets up generic fbdev emulation for drivers that supports
>   * dumb buffers with a virtual address and that can be mmap'ed.
> @@ -2569,6 +2575,8 @@ void drm_fbdev_generic_setup(struct drm_device *dev, const unsigned int options)
>  	if (!fb_helper->preferred_bpp)
>  		fb_helper->preferred_bpp = 32;
>  
> +	fb_helper->firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);
> +
>  	ret = drm_fbdev_client_hotplug(&fb_helper->client);
>  	if (ret)
>  		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index f5b8e864a5cd..f6f1c5e108b2 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -901,7 +901,7 @@ static int simpledrm_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	drm_fbdev_generic_setup(dev, 0);
> +	drm_fbdev_generic_setup(dev, DRM_FB_OPTION(DRM_FB_FW, 1));
>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 5fc41cf0c987..5a17af423944 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -44,6 +44,7 @@ enum mode_set_atomic {
>  };
>  
>  #define DRM_FB_BPP_MASK GENMASK(7, 0)
> +#define DRM_FB_FW_MASK GENMASK(8, 8)
>  
>  /* Using the GNU statement expression extension */
>  #define DRM_FB_OPTION(option, value)				\
> @@ -197,6 +198,15 @@ struct drm_fb_helper {
>  	 * See also: @deferred_setup
>  	 */
>  	int preferred_bpp;
> +
> +	/**
> +	 * @firmware:
> +	 *
> +	 * Set if the driver indicates to the FB helper initialization that the
> +	 * framebuffer for the device being registered is provided by firmware,
> +	 * so that it can pass this on when registering the framebuffer device.
> +	 */
> +	bool firmware;
>  };
>  
>  static inline struct drm_fb_helper *
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
