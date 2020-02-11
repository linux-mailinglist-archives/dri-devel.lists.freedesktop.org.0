Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38A159572
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9194F6E52F;
	Tue, 11 Feb 2020 16:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B225B6E525
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 16:58:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so13314409wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Z0uAVz5TR6yDZ6Nnh0OOL9x7S73dl403hkXklnFwV1A=;
 b=Be020OqhQfQptBxEZyptoleHOar9day0vQvPPxJMPeJxHCO4oXG1EbOgeUB5fw2gFZ
 oPuMGCNfDwphcJtRPgsNNS3+8ALdfD5DVe1ufG0EkVKUg5qICt2RmB3AlRMMg1c3hYio
 5upgntrKOBkeWYeS9yn3eCiEmxcMS0IgGMEwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z0uAVz5TR6yDZ6Nnh0OOL9x7S73dl403hkXklnFwV1A=;
 b=GK7Yjdh1yWbEqzBkUVu6ipvNDe25FkJXy+Th3g/X4jRrrP3ZeLsFFdB7c+XqJ7Al22
 tBsVLQZTXktNlrtR56i5arlUFO7nGiBGLr36i4iPJhAdWwh5YAOGkzGsZbKWuEHxwGDN
 5qLOD25zJHcgEBxyWuIAxjZOscXlFmR4tDkyu0LXl12W8BsoUlCYTGU/+909YF2Xbo7H
 trJVXbnwCdh2CJolHvproVECyynbEeUfuTBPkM1F8c1J2GpmFC7ZA1/bUNojkxSqccHc
 VI48wtev86uYkx2M9bhJ7p+XzmY7tnb5qSJtmZUhCv/89/u0qKxoxaf7aKSPx2Y8Y6Zm
 U93g==
X-Gm-Message-State: APjAAAVgGgXEIAlLA5QKKruPfUa8j2N1MmxsPRZOnKncz01Hlv5oaZMc
 0jALOrblxqMoIGPR5P73IwxVkA==
X-Google-Smtp-Source: APXvYqzho+WM6NqEf+SB/n0vGOG2fmvWM1WoXkZpBUdJH6lrwppioXJcU1700eupRMVVQ1Jb+BoATw==
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr9476116wrx.109.1581440333344; 
 Tue, 11 Feb 2020 08:58:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m9sm5954794wrx.55.2020.02.11.08.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 08:58:52 -0800 (PST)
Date: Tue, 11 Feb 2020 17:58:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 1/7] drm: Include the encoder itself in possible_clones
Message-ID: <20200211165850.GK2363188@phenom.ffwll.local>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211162208.16224-2-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 06:22:02PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> The docs say possible_clones should always include the encoder itself.
> Since most drivers don't want to deal with the complexities of cloning
> let's allow them to set possible_clones=3D0 and instead we'll fix that
> up in the core.
> =

> We can't put this special case into drm_encoder_init() because drivers
> will have to fill up possible_clones after adding all the relevant
> encoders. Otherwise they wouldn't know the proper encoder indexes to
> use. So we'll just do it just before registering the device.
> =

> v2: Don't set the bit if possible_clones!=3D0 so that the
>     validation (coming soon) will WARN (Thomas)
>     Fix up the docs to allow possible_clones=3D=3D0 (Daniel)
>     .late_register() is too late, introduce drm_mode_config_validate()
>     which gets called _before_ we register the char device (Daniel)

Looks solid.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_crtc_internal.h |  1 +
>  drivers/gpu/drm/drm_drv.c           |  3 +++
>  drivers/gpu/drm/drm_mode_config.c   | 19 +++++++++++++++++++
>  include/drm/drm_encoder.h           |  4 +++-
>  4 files changed, 26 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index 16f2413403aa..ace363b4f82b 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -82,6 +82,7 @@ int drm_mode_setcrtc(struct drm_device *dev,
>  /* drm_mode_config.c */
>  int drm_modeset_register_all(struct drm_device *dev);
>  void drm_modeset_unregister_all(struct drm_device *dev);
> +void drm_mode_config_validate(struct drm_device *dev);
>  =

>  /* drm_modes.c */
>  const char *drm_get_mode_status_name(enum drm_mode_status status);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7b1a628d1f6e..65a0acb79323 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -946,6 +946,9 @@ int drm_dev_register(struct drm_device *dev, unsigned=
 long flags)
>  	struct drm_driver *driver =3D dev->driver;
>  	int ret;
>  =

> +	if (!driver->load)
> +		drm_mode_config_validate(dev);
> +
>  	if (drm_dev_needs_global_mutex(dev))
>  		mutex_lock(&drm_global_mutex);
>  =

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 08e6eff6a179..75e357c7e84d 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -532,3 +532,22 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  	drm_modeset_lock_fini(&dev->mode_config.connection_mutex);
>  }
>  EXPORT_SYMBOL(drm_mode_config_cleanup);
> +
> +/*
> + * For some reason we want the encoder itself included in
> + * possible_clones. Make life easy for drivers by allowing them
> + * to leave possible_clones unset if no cloning is possible.
> + */
> +static void fixup_encoder_possible_clones(struct drm_encoder *encoder)
> +{
> +	if (encoder->possible_clones =3D=3D 0)
> +		encoder->possible_clones =3D drm_encoder_mask(encoder);
> +}
> +
> +void drm_mode_config_validate(struct drm_device *dev)
> +{
> +	struct drm_encoder *encoder;
> +
> +	drm_for_each_encoder(encoder, dev)
> +		fixup_encoder_possible_clones(encoder);
> +}
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 5623994b6e9e..22d6cdf729f1 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -159,7 +159,9 @@ struct drm_encoder {
>  	 * encoders can be used in a cloned configuration, they both should have
>  	 * each another bits set.
>  	 *
> -	 * In reality almost every driver gets this wrong.
> +	 * As an exception to the above rule if the driver doesn't implement
> +	 * any cloning it can leave @possible_clones set to 0. The core will
> +	 * automagically fix this up by setting the bit for the encoder itself.
>  	 *
>  	 * Note that since encoder objects can't be hotplugged the assigned ind=
ices
>  	 * are stable and hence known before registering all objects.
> -- =

> 2.24.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
