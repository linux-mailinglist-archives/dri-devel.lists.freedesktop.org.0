Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151CF2D4B30
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 21:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CA26E192;
	Wed,  9 Dec 2020 20:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD616E192
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 20:04:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r3so3104989wrt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 12:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b2kDcOz66q22a+isxFrkiHqjdhv0NkBRTN9BgIqams0=;
 b=lOfhJjjN85Mjm8i77NEnEmddXhS2EcFp9eGYFPSy2AbS5oYprxzgTIF8mtUnSWjpI+
 5/AV0+1kXl2G4p8iqVB2HDRto22I+GG0dj0FbIfwkQlitoJt3zSODlF7bVXa1EiEv1dm
 fpMiC4djR5LF3/7Rl4bCvIEgGcaeJLI3eywfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b2kDcOz66q22a+isxFrkiHqjdhv0NkBRTN9BgIqams0=;
 b=ScsLwJATtf5Gy22teEV2kdkl+a82RDtna559VkgyYYsFr06r+vQ4cGXOUqlNIIJqAT
 SPLp/1nxh7yVN5eGZHpLYrnkqg93JATjdYW4NrXI6Sa2Fpkfsc4imP1Y7T93Kvc7TmoO
 Brtr+OO64KgoFFfdeUzwe60U8/sM0OOqVnsYR8FgGx3cqF1QuopUnJZRNhQuMzm5vGrf
 D0r9D+PuOYssA4PYb7QYCnBtwNtFZbY1FXnMSmGcNvPJrfO8LWEwlDtpVPfqgVLQ1yLb
 CacMmR1Ut6xV3PrQemG+lyazBKHKYWEUeIBjQb1O/zgFeuJ8zd5sEfqf3TvJwMPVXe/j
 UEfA==
X-Gm-Message-State: AOAM533+oMMjxoCLvLeapZJdIKQyBubOiEyb8IxKQ1X6BsiNjyu48Pvs
 Oy5Y+IGrfil+1Z8RQvQVoTDA3v6cCpHqTg==
X-Google-Smtp-Source: ABdhPJyGMmPnCBzBCgz/FD2Uk8g+QMTMD1yoEP/NGBTOG1aw7KpeD/p3GMIKTgCBy/oMOJ2uTBCU0w==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr4423501wri.233.1607544255504; 
 Wed, 09 Dec 2020 12:04:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 90sm5363142wrl.60.2020.12.09.12.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:04:14 -0800 (PST)
Date: Wed, 9 Dec 2020 21:04:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 03/19] drm/simple_kms_helper: add
 drmm_simple_encoder_alloc()
Message-ID: <20201209200412.GX401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-4-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208155451.8421-4-p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 04:54:35PM +0100, Philipp Zabel wrote:
> Add an alternative to drm_simple_encoder_init() that allocates and
> initializes a simple encoder and registers drm_encoder_cleanup() with
> drmm_add_action_or_reset().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
>  - drop drmm_simple_encoder_funcs_empty, now that encoder control
>    functions are optional
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c |  9 +++++++++
>  include/drm/drm_simple_kms_helper.h     | 24 ++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 743e57c1b44f..ccf0908eb82e 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -71,6 +72,14 @@ int drm_simple_encoder_init(struct drm_device *dev,

Please also address the FIXME in the kerneldoc for drm_simple_encoder_init
and replace it with a recommendation to use this new function you're
adding here.

>  }
>  EXPORT_SYMBOL(drm_simple_encoder_init);
>  
> +void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
> +				  size_t offset, int encoder_type)
> +{
> +	return __drmm_encoder_alloc(dev, size, offset, NULL, encoder_type,
> +				    NULL);
> +}
> +EXPORT_SYMBOL(__drmm_simple_encoder_alloc);
> +
>  static enum drm_mode_status
>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>  			       const struct drm_display_mode *mode)
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index a026375464ff..e6dbf3161c2f 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -185,4 +185,28 @@ int drm_simple_encoder_init(struct drm_device *dev,
>  			    struct drm_encoder *encoder,
>  			    int encoder_type);
>  
> +void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
> +				  size_t offset, int encoder_type);
> +
> +/**
> + * drmm_simple_encoder_alloc - Allocate and initialize an encoder with basic
> + *                             functionality.
> + * @dev: drm device
> + * @type: the type of the struct which contains struct &drm_encoder
> + * @member: the name of the &drm_encoder within @type.
> + * @encoder_type: user visible type of the encoder
> + *
> + * Allocates and initializes an encoder that has no further functionality.
> + * Settings for possible CRTC and clones are left to their initial values.
> + * Cleanup is automatically handled through registering drm_encoder_cleanup()
> + * with drmm_add_action().
> + *
> + * Returns:
> + * Pointer to new encoder, or ERR_PTR on failure.
> + */
> +#define drmm_simple_encoder_alloc(dev, type, member, encoder_type) \
> +	((type *)__drmm_simple_encoder_alloc(dev, sizeof(type), \

Same comment about container_of. Also, since this is a dummy encoder, do
we really need the subclassing support here? I guess it makes sense for
consistency at least, which is always good.

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +					     offsetof(type, member), \
> +					     encoder_type))
> +
>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
