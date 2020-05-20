Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879921DB3CA
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484FA89C29;
	Wed, 20 May 2020 12:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4E589C29
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:39:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f13so2384373wmc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mTnCfjWo7S/mrhhjyoQku8DZ/jGHipKT8HFvbizFzKM=;
 b=cE1wJveHtdsh8+tl8B6uL9h6AGp6eXqSLAcJjVrPHWHWqcDPLNrQW8xncYZj/TzpJJ
 6QeVDe50+7fOWA2DANi8mcQT+u+ilvWe+fXlQ0C8HG9drxk0VjXG1mSv8zzKQWClj/yx
 FprWDFyFpGD1LjkIUYQfFH85Qwq4U2gy8rsMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mTnCfjWo7S/mrhhjyoQku8DZ/jGHipKT8HFvbizFzKM=;
 b=ih9XMuMuFZTyW9rbRkAAzkz7kVals6uVHjeIPqK6oHxQsgXgip9fMd4t5oqpIOCY84
 nWX2B3RZTBtAOig86mttQl5+RDebVI2KtKh3h6tMm7etpPpnOu8g67FC15/SX5sFeNMi
 8V2tCAdcQBXzw/ggKfKAwvPiOY+5I2DzIec6CTCUZP+VY41qnqY3BaPhN72YdHq9n+To
 0+S8mr7rR+QpN7ix6Vsjua4pf9Py+gsNbHtWtHpvWjlCmWVhwlQPaFjxlDu3hspkenQk
 O0Qpf71FqX43Sd7D6iebeWbxcle4Bmb+HyUJ5auulhwX/j1rIbsjS5xvi5bya2pWAWEM
 v4HQ==
X-Gm-Message-State: AOAM5312OZWiePcqGs47kTAIl7ZjmyOLLQp9CHpzXApDyBOck5oxHv0a
 s4yjtLWDDYegfTuf3VHduqOv1MvXUnY=
X-Google-Smtp-Source: ABdhPJwH5Vj3dbsx3LX6Y0XnvNOuJ3EtXxWTvUvbRja8S/ZZpLt7zNR1yuTAY5D6q+Wr3JM2/ubpPw==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr4421381wmk.168.1589978397426; 
 Wed, 20 May 2020 05:39:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f5sm2761921wrp.70.2020.05.20.05.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:39:56 -0700 (PDT)
Date: Wed, 20 May 2020 14:39:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm: add docs for standard CRTC properties
Message-ID: <20200520123955.GW206103@phenom.ffwll.local>
References: <FFaYYfloz0zbXJxx2uxoPluNTicf8VUdrLHL7DBuruShcow3aqIQUZui6VL3RNhFu6HlXvm-1jxmw1N3mKX-K9dr73osz_XQ77CaJ9W5zKI=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FFaYYfloz0zbXJxx2uxoPluNTicf8VUdrLHL7DBuruShcow3aqIQUZui6VL3RNhFu6HlXvm-1jxmw1N3mKX-K9dr73osz_XQ77CaJ9W5zKI=@emersion.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 02:22:47PM +0000, Simon Ser wrote:
> This patch adds docs for the ACTIVE and MODE_ID CRTC properties.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Michel D=E4nzer <michel@daenzer.net>
> ---
> =

> Let me know if you think of other things to add.
> =

> Should we refer to ALLOW_MODESET in the MODE_ID docs?
> =

>  Documentation/gpu/drm-kms.rst |  5 +++++
>  drivers/gpu/drm/drm_crtc.c    | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
> =

> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 397314d08f77..4289b7205696 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -460,6 +460,11 @@ HDMI Specific Connector Properties
>  .. kernel-doc:: drivers/gpu/drm/drm_connector.c
>     :doc: HDMI connector properties
>  =

> +Standard CRTC Properties

Missing the =

--------------------------
line here so this reanders neatly as a title and works with the sidebar
toc. Please check the output to make sure that all looks good.


> +
> +.. kernel-doc:: drivers/gpu/drm/drm_crtc.c
> +   :doc: standard CRTC properties
> +
>  Plane Composition Properties
>  ----------------------------
>  =

> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 4936e1080e41..c28e662c1e93 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -204,6 +204,22 @@ struct dma_fence *drm_crtc_create_fence(struct drm_c=
rtc *crtc)
>  	return fence;
>  }
>  =

> +/**
> + * DOC: standard CRTC properties
> + *
> + * DRM CRTCs have a few standardized properties:
> + *
> + * ACTIVE:
> + * 	Atomic property for setting the power state of the CRTC. When set to=
 1 the
> + * 	CRTC will actively display content. When set to 0 the CRTC will be p=
owered
> + * 	off. There is no expectation that user-space will reset CRTC resourc=
es like
> + * 	the mode and planes when setting ACTIVE to 0.

Maybe add "Note that the legacy DPMS property on connectors is internally
routed to control this property for atomic drivers."


Also I think we should add the dpms guarantee here.

"Userspace can rely on an change to ACTIVE always suceeding as long as no
other property has changed. If a change to ACTIVE only fails an atomic
test, this is a driver bug."

Kinda important part of the uapi here :-) Also the dpms emulation relies
on this.

> + * MODE_ID:
> + * 	Atomic property for setting the CRTC display timings. The value is t=
he ID
> + * 	of a blob containing the DRM mode info. To disable the CRTC, user-sp=
ace
> + * 	must set this property to 0.

Maybe we should add: "Note that only disabling by setting MODE_ID to 0
will release all internal resources (like reserved memory bandwidth or
clock generators). Only setting ACTIVE to 0 does not release reserved
resources, but only shuts down the hardware."

With these clarifications all added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for doing this, I think really important we start properly
documenting these uapi details at least somewhere!

Cheers, Daniel

> + */
> +
>  /**
>   * drm_crtc_init_with_planes - Initialise a new CRTC object with
>   *    specified primary and cursor planes.
> -- =

> 2.26.2
> =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
