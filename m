Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF41595EF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 18:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0980B6E107;
	Tue, 11 Feb 2020 17:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4DC6E049
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 17:05:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so4536937wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 09:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NZYdrP0qmq2maOAyC8puhD7WuaepezKmNtZG061e7uQ=;
 b=N7GAAn7aQO3CER4BDpI9SluUByTz5VRfMi/LRh4RuSXMcuaphmuTZZKq59Ec3QGK8h
 aOgKcI8D9YiB9Ywtab2+ndiQvJpV+0kUeH1KC0gfjZej0Ic7HMFV6ClyhYKN0BAXdBcg
 yJuFE+X/bmZqf1uhF3Dp3Uzcz5defGPpHz9Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NZYdrP0qmq2maOAyC8puhD7WuaepezKmNtZG061e7uQ=;
 b=pr05rUg2Xy3/V6dLGagGxIFT5vWmnlvl7vB8u7YNCVWbFnBWNAIzNh89nMuVqDKaVH
 /rHRUC6MdxDYp/ijjFQjC/mUQ9NBtVtmU5BLeYfWfqk/H8mO5t/5wo4pBAFxzbNS+ZQb
 e6XyQxl3Ah6i9UNn8ALpKMqM8Vt7Vnf9Qjt4XwCxtkucf1BC96Na5NTweC33l/I5UaBO
 9MwVTwz5PyuIjCZk+RxTCoUc0eZoUArEfo/OAT/b52L0Q/tgC9dwGyE1jTeqCPdSZJVm
 ragCcIQ2MYx+5XL4t6nnbAlhnnOhYH2ZgVc5750kaMS2obbyNqk6AoXudKPZ1d32/X6J
 WCBQ==
X-Gm-Message-State: APjAAAVDkBqP/PNI7gKAFTraATm3fR/iCgpP7fVq3CBwst0Nrk+VMbxh
 GYe3zz8ho8GrhAY0yC/ctRaxeQ==
X-Google-Smtp-Source: APXvYqyn8/S8Los4acJTOMFhvkYFgcEDt9zKiyyaUSeZ0iViaBr71XiNAzMyzDruuwwopRwblt+AEQ==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr6388118wma.94.1581440748419; 
 Tue, 11 Feb 2020 09:05:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm4233141wmk.31.2020.02.11.09.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:05:47 -0800 (PST)
Date: Tue, 11 Feb 2020 18:05:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 7/7] drm: Allow drivers to leave
 encoder->possible_crtcs==0
Message-ID: <20200211170545.GN2363188@phenom.ffwll.local>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
 <20200211162208.16224-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211162208.16224-8-ville.syrjala@linux.intel.com>
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

On Tue, Feb 11, 2020 at 06:22:08PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Let's simplify life of driver by allowing them to leave
> encoder->possible_crtcs unset if they have no restrictions
> in crtc<->encoder linkage. We'll just populate possible_crtcs
> with the full crtc mask when registering the encoder so that
> userspace doesn't have to deal with drivers not populating
> this correctly.
> =

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
> We might not actually need/want this, but included it here for
> future reference if that assumption turns out to be wrong.

I think this one is most definitely needed. _Lots_ of drivers get this
toally wrong and just leave the value blank. It's encoded as official
fallback in most userspace compositors.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 15 ++++++++++++++-
>  include/drm/drm_encoder.h         |  4 ++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 4c1b350ddb95..ce18c3dd0bde 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -592,6 +592,17 @@ static u32 full_crtc_mask(struct drm_device *dev)
>  	return crtc_mask;
>  }
>  =

> +/*
> + * Make life easy for drivers by allowing them to leave
> + * possible_crtcs unset if there are not crtc<->encoder
> + * restrictions.
> + */
> +static void fixup_encoder_possible_crtcs(struct drm_encoder *encoder)
> +{
> +	if (encoder->possible_crtcs =3D=3D 0)
> +		encoder->possible_crtcs =3D full_crtc_mask(encoder->dev);
> +}
> +
>  static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
>  {
>  	u32 crtc_mask =3D full_crtc_mask(encoder->dev);
> @@ -608,8 +619,10 @@ void drm_mode_config_validate(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
>  =

> -	drm_for_each_encoder(encoder, dev)
> +	drm_for_each_encoder(encoder, dev) {
>  		fixup_encoder_possible_clones(encoder);
> +		fixup_encoder_possible_crtcs(encoder);
> +	}
>  =

>  	drm_for_each_encoder(encoder, dev) {
>  		validate_encoder_possible_clones(encoder);
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index b236269f41ac..bd033c5618bf 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -142,6 +142,10 @@ struct drm_encoder {
>  	 * the bits for all &drm_crtc objects this encoder can be connected to
>  	 * before calling drm_dev_register().
>  	 *
> +	 * As an exception to the above rule if any crtc can be connected to
> +	 * the encoder the driver can leave @possible_crtcs set to 0. The core
> +	 * will automagically fix this up by setting the bit for every crtc.
> +	 *
>  	 * You will get a WARN if you get this wrong in the driver.
>  	 *
>  	 * Note that since CRTC objects can't be hotplugged the assigned indices
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
