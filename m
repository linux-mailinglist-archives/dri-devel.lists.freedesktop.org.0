Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECE2AF6E2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 17:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8186E086;
	Wed, 11 Nov 2020 16:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562266E086
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 16:48:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so3187672wrt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 08:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HB2l8TV0D9ugazGegWCjwMY9NcRR8f0Gu6GVTxWgxzo=;
 b=K2BhgEmh3TeEgPp3w9x/VuQ99DxO87eTOlvGMSjfnN0TO6Dw88gYYCFyNs/YEC9d+F
 KTqEQ+0ItdPY1Y7g5E3QEKHtYBb45xWmoSinjsbG57I3hOKneEN5Iw404oYZdt66NLHz
 FjToYyVexb8ILovVJiLPypIRTVMcFcJnVS7+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HB2l8TV0D9ugazGegWCjwMY9NcRR8f0Gu6GVTxWgxzo=;
 b=YEk5sDElkliIVEoMryqeaQTuRHhu2NdOUh0PC+FA5SGjsZXniynuOPOw3qyL25gYv7
 GL/rq1QWVufcYDx84W6dZkV8cp8zkT5QmifbsJ0+LqCO3mQ2izWZe2bxJEbLqWPmkayB
 TIJy4GYBP1inTr4NKZdszNmv9Ppat2zWWhaDMYzSG3M66ivJG+XtaQjkXTfRuNgL5nDN
 BBnuljgkDQUIRIzaOz3I/KexUJHoIY5dThhtS7U0MeLoMoXxHAXvyOSJ5H7Ghu88vh9w
 ZwWdSLuOebw6VltvatUuzlTVV8qJloZ/Ot/v730sdnVRtCqiGSCZhyu9qTjbSNgqaOvN
 zjcA==
X-Gm-Message-State: AOAM530LURrz6gs6qqMVPyB6F0g6P6PC+Hw2Oxf3Xzs8PBimkktZ+CUJ
 z9oRiq45HzL2G9eb9Fzy85pzGBwwM72v/Q==
X-Google-Smtp-Source: ABdhPJxVgcGYCimPNfOA+aOvpKKRT15G8+D/gUQSB/ayu3AFaigkP59zPIjO3027W4TuAqaPGt3Oyw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr29850916wrs.377.1605113337013; 
 Wed, 11 Nov 2020 08:48:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j127sm3503128wma.31.2020.11.11.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:48:56 -0800 (PST)
Date: Wed, 11 Nov 2020 17:48:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] drm: add debug logs for drm_mode_atomic_ioctl
 errors
Message-ID: <20201111164853.GQ401619@phenom.ffwll.local>
References: <AVFi5ZzKwRVLtY8AQyxvqgIbcUfVgNebOtGVwSNMKvs@cp4-web-038.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AVFi5ZzKwRVLtY8AQyxvqgIbcUfVgNebOtGVwSNMKvs@cp4-web-038.plabs.ch>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 09:07:39AM +0000, Simon Ser wrote:
> Be nice to user-space and log what happened when returning EINVAL in
> drm_mode_atomic_ioctl.
> 
> v2:
> 
> - Migrate to drm_dbg_atomic (Sam)
> - Add debug log for arg->reserved (Ville)
> - Drop redundant "atomic" word in log messages (Ville)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>

Submission bikeshed: Patch 1&2 aren't threaded. I thought git send-email
gets that right by default nowadays ...

Anyway, on both patches: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index efab3d518891..9df7f2a170e3 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1330,22 +1330,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	 * though this may be a bit overkill, since legacy userspace
>  	 * wouldn't know how to call this ioctl)
>  	 */
> -	if (!file_priv->atomic)
> +	if (!file_priv->atomic) {
> +		drm_dbg_atomic(dev,
> +			       "commit failed: atomic cap not enabled\n");
>  		return -EINVAL;
> +	}
>  
> -	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS)
> +	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
> +		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
>  		return -EINVAL;
> +	}
>  
> -	if (arg->reserved)
> +	if (arg->reserved) {
> +		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
>  		return -EINVAL;
> +	}
>  
> -	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)
> +	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
> +		drm_dbg_atomic(dev,
> +			       "commit failed: invalid flag DRM_MODE_PAGE_FLIP_ASYNC\n");
>  		return -EINVAL;
> +	}
>  
>  	/* can't test and expect an event at the same time. */
>  	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
> -			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
> +			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
> +		drm_dbg_atomic(dev,
> +			       "commit failed: page-flip event requested with test-only commit\n");
>  		return -EINVAL;
> +	}
>  
>  	state = drm_atomic_state_alloc(dev);
>  	if (!state)
> -- 
> 2.29.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
