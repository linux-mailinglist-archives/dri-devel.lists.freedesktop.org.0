Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2120F65F008
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653510E004;
	Thu,  5 Jan 2023 15:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2CE10E004
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:26:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id x22so90787898ejs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=61kUINIwujyE9MinnD2ZyJ3jDFT/8a9+n0pjbYnlqio=;
 b=YkY0SWGFzBrJu2WInwg7myKrjjLSFNj6TMEJsbdC26doN9KAdrkobkQAoEHVzgHZKu
 JzIf9E+B9JXIBqPcOX3KtglXaQwtyop4UIa5xljldRp5IEfDyO+KQLfhTIkauWk4UsAv
 8fJ6U9+2GJ11HEkcZPrJ3lIgLLUhbb9ugvOFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61kUINIwujyE9MinnD2ZyJ3jDFT/8a9+n0pjbYnlqio=;
 b=78SzQd3zmuWriXxmtkgRodQhiWyF4d9dXyUB/dgQsIZztUVr8pWDJWdfPo8tkZwGb1
 68TT8+2vHg4dtBRP49cb/T64wexDJ29HF8LsKCLwAJ7wbkt0bLTsyZTDRolht3l9Vwu3
 NITptAcpsambk6ZH+9lmeB9UksT/F0XVwCfBKTOHBlSHWNQ1GLKxamajmiU1JmJ6FSVO
 1vBfUCiFRiIJMfAkqjwAVnLxbPWjlJveIQ6f3puLQoeJzYH0M7AZYdJMg9m1f/yMkPzk
 meYgHUnKNL7Ah4FDd9PX7kCNBojr5oazVhfLMJi3AovOpX73K8SE8c+a0HItvE8OyDtF
 CkaQ==
X-Gm-Message-State: AFqh2kqDKCLTqIH9JSzr/X9pvpeifcXo+k/ZJJEt8ttqDfyCMBW23neZ
 rWCDo/25NjFeXLPEd4Azl9FAloa0aIqrNYqf
X-Google-Smtp-Source: AMrXdXufWuuIM2QC3BqmItRDVvPc2DK9jn8pEwKPM1KccQWTec7dIptS5BOy8ocKJ0a7E7pkY8TlXg==
X-Received: by 2002:a17:906:700f:b0:7c0:b79c:7d5f with SMTP id
 n15-20020a170906700f00b007c0b79c7d5fmr57726218ejj.68.1672932395324; 
 Thu, 05 Jan 2023 07:26:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a1709061ba900b0084cd08e5cb5sm4340779ejg.159.2023.01.05.07.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:26:34 -0800 (PST)
Date: Thu, 5 Jan 2023 16:26:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <Y7bsKFCIOgauVbII@phenom.ffwll.local>
References: <20230103125322.855089-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103125322.855089-1-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 03, 2023 at 09:53:23AM -0300, Maíra Canal wrote:
> Currently, drm_gem_fb_create() doesn't check if the pixel format is
> supported, which can lead to the acceptance of invalid pixel formats
> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> valid formats on drm_gem_fb_create().
> 
> Moreover, note that this check is only valid for atomic drivers,
> because, for non-atomic drivers, checking drm_any_plane_has_format() is
> not possible since the format list for the primary plane is fake, and
> we'd therefor reject valid formats.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think to really make sure we have consensus it'd be good to extend this
to a series which removes all the callers to drm_any_plane_has_format()
from the various drivers, and then unexports that helper. That way your
series here will have more eyes on it :-)
-Daniel

> ---
>  Documentation/gpu/todo.rst                   | 7 ++-----
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 +++++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 1f8a5ebe188e..68bdafa0284f 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -276,11 +276,8 @@ Various hold-ups:
>  - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
>    setup code can't be deleted.
>  
> -- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> -  atomic drivers we could check for valid formats by calling
> -  drm_plane_check_pixel_format() against all planes, and pass if any plane
> -  supports the format. For non-atomic that's not possible since like the format
> -  list for the primary plane is fake and we'd therefor reject valid formats.
> +- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
> +  valid formats for atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
>    version of the varios drm_gem_fb_create functions. Maybe called
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index e93533b86037..b8a615a138cd 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  
>  #include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem.h>
> @@ -164,6 +165,14 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> +	if (drm_drv_uses_atomic_modeset(dev) &&
> +	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +				      mode_cmd->modifier[0])) {
> +		drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
> +		return -EINVAL;
> +	}
> +
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
>  		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
