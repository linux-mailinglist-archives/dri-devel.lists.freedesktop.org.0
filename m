Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B847155BE7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872CC6E0B8;
	Fri,  7 Feb 2020 16:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880A46E0AF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 16:36:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t23so3233522wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 08:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Xr0r1NPoghHw+wX1zbKLRQxBTFmc0m0oEomBjFuzToM=;
 b=I91Ao0MC/+Sfr+pi31770W3toz4FNxpwk1Bb5idAfibYLLF7nQ+gZjYQXHnK3UsU4r
 HIcdWvBDHlXCSEBtBhJbhFewn0ScqFyeCN8st1LUgNr41HEBX4VctJjBO6HIWlZpZ6GF
 aqghDIG/hNudginaf3QJCanL7pDqGLC4SbcGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Xr0r1NPoghHw+wX1zbKLRQxBTFmc0m0oEomBjFuzToM=;
 b=haU3Q5tPmnY112i+cCQloQg/Ispu305VveH49hUsgky4MWPBdAvBgiGwGMHRjiT1pc
 vJ/3ZD5hWyrOKyyvxD7fcz11yhQRkCGV1DmMzCU8SXTvVy9YF5ohYVMVchq63S9dDoMv
 i1MFO0M3JRiiC0wGD5is9WWdjSbka9U6MoSv5NPRKI8x3r6FPwaQS9CaGg13eTnvg6/d
 SS3u//MehYafAPPfXedxVzql3EXtp0OnMI+MOaSqAgBmLcRhwl+1wyytsDSOdGHkjJ2D
 1cqR95XxdMe+jm1jAo9WyHY93XtEuBAR80ayeKxiXbokb073T3Ou0eVnLSeiix13NU2D
 xVeQ==
X-Gm-Message-State: APjAAAX9RPNzrUMENXbinPYKJJlZqf1S2oJRSpiUUMXzwcdx7MTknYWa
 iMImJn2NAjHAopLBkVAvavmFxg==
X-Google-Smtp-Source: APXvYqzA/+lmNPvP32/zA1Dqh6EJejEjOBvyyisRjfr+1ATQ0Qj/UrFORq5VwDruZ4QHXVIx1BWUAw==
X-Received: by 2002:a05:600c:2383:: with SMTP id
 m3mr5346187wma.32.1581093376217; 
 Fri, 07 Feb 2020 08:36:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g21sm3840013wmh.17.2020.02.07.08.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:36:15 -0800 (PST)
Date: Fri, 7 Feb 2020 17:36:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/6] drm: Include the encoder itself in possible_clones
Message-ID: <20200207163613.GM43062@phenom.ffwll.local>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207135950.6655-2-ville.syrjala@linux.intel.com>
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

On Fri, Feb 07, 2020 at 03:59:45PM +0200, Ville Syrjala wrote:
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
> use. So we'll just do it just before registering the encoders.
> =

> TODO: Should we do something similar for possible_crtcs=3D=3D0?
> =

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_encoder.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index e555281f43d4..f761d9306028 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -66,11 +66,26 @@ static const struct drm_prop_enum_list drm_encoder_en=
um_list[] =3D {
>  	{ DRM_MODE_ENCODER_DPI, "DPI" },
>  };
>  =

> +/*
> + * For some reason we want the encoder itself included in
> + * possible_clones. Make life easy for drivers by allowing them
> + * to leave possible_clones unset if no cloning is possible.
> + */
> +static void fixup_possible_clones(struct drm_device *dev)
> +{
> +	struct drm_encoder *encoder;
> +
> +	drm_for_each_encoder(encoder, dev)
> +		encoder->possible_clones |=3D drm_encoder_mask(encoder);
> +}
> +
>  int drm_encoder_register_all(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
>  	int ret =3D 0;
>  =

> +	fixup_possible_clones(dev);

This is way too late, we've already registered the chardev minors at this
point. I think we need a new drm_mode_config_validate() at the top of
drm_dev_register, but which does _not_ run when the driver has a ->load
callback (which soon will be no driver at all).

Cheers, Daniel


> +
>  	drm_for_each_encoder(encoder, dev) {
>  		if (encoder->funcs->late_register)
>  			ret =3D encoder->funcs->late_register(encoder);
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
