Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20E32E3A5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A60A6E213;
	Fri,  5 Mar 2021 08:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E326EB10
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 08:28:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b1so2213552lfb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 00:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Cgwnfykp8Cd0duYtkAGliP6yzxd51juu69cjrE5EFKA=;
 b=gc8wdZy2BhwTjedZQvonlSoFkt1psMWYmWyLRmOiDh9Z6e5k8WaxPe5g2Kv5imnhT5
 69BXd8jDKrsuuJCJM8olY1wlzNoET/r53uqDyCUvjMqNYjurw+UX2QnjA3XZmthrcum8
 onvkDOkTEh/iwf01ErzQTZsnDrmPWWYkRaSa90Apy3qCJDzBJnbkhxYHrd4AZWBde0JW
 yOHD2I+tREKiPtoTBOpbBMz05OoFv9V6qYmvKXAzGQtgYk+Zye1UIEVcKlIyQ0/KlUee
 FbTiOuEftKv7Lh3Zuhgz5EAwjKPRenRiZiJwUBSqJ2NnFOgPtXPAJkSS4IXt3qayD2av
 2eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Cgwnfykp8Cd0duYtkAGliP6yzxd51juu69cjrE5EFKA=;
 b=SrvOo3VD1VzKof/VYTS7u0NZiC2oqhMsH4jjSMp/IMGl8Ie6p2T3iAhmAfyVGHGeFM
 TaHFqTYI3Ba1dTBgB6Uom/75mx8QebgRDLMwumvwHkecpAdIa73u+0XHXWEtA0YSgsoj
 TlqYNTHRZojYz8Ijr+7x8B9/BTEr+fxvKpm++V3ECOzRY27f/PTlBAHZZa5vs++5AsoL
 dIFd9SidBotWE2k3mYvsFLjZ0O2vLYOl4AwKraZSZ5AbIt8DzXPohoxm5vbH5av9UeW5
 w6E1A5KzI4zfo3vcJ8IEWp4lG/xPMzZJeFDDd+Es6vJfNOdPdnQSe70hhuOqGYvnB0My
 Seng==
X-Gm-Message-State: AOAM533wAJpsKxjIG7UKGoZsGX0gshMAa8s/s6I3guFQxT723gHSmqXz
 roZcpKj0YtWMm5hQrP8mGv4=
X-Google-Smtp-Source: ABdhPJzpc2TfIicpGbeym5lVMQOxIKy6g2JijRn2DQ5Df59Bw010CBZcT7BRtZmu3U2k3P8VxxmAZQ==
X-Received: by 2002:a05:6512:33c9:: with SMTP id
 d9mr4605083lfg.630.1614932933921; 
 Fri, 05 Mar 2021 00:28:53 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m3sm219550lfo.190.2021.03.05.00.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 00:28:53 -0800 (PST)
Date: Fri, 5 Mar 2021 10:28:50 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/uapi: document kernel capabilities
Message-ID: <20210305102850.769bf34d@eldfell>
In-Reply-To: <20210304221057.657146-1-contact@emersion.fr>
References: <20210304221057.657146-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0452617234=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0452617234==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Zn4/MW6Amc.cxLqqrgH.ijd"; protocol="application/pgp-signature"

--Sig_/Zn4/MW6Amc.cxLqqrgH.ijd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu,  4 Mar 2021 23:10:57 +0100
Simon Ser <contact@emersion.fr> wrote:

> Document all of the DRM_CAP_* defines.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 100 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 96 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 0827037c5484..4ef07f505725 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,30 +625,122 @@ struct drm_gem_open {
>  	__u64 size;
>  };
> =20
> +/**
> + * DRM_CAP_DUMB_BUFFER
> + *
> + * If set to 1, the driver supports creating dumb buffers via the
> + * &DRM_IOCTL_MODE_CREATE_DUMB ioctl.
> + */
>  #define DRM_CAP_DUMB_BUFFER		0x1
> +/**
> + * DRM_CAP_VBLANK_HIGH_CRTC
> + *
> + * If set to 1, the kernel supports specifying a CRTC index in the high =
bits of
> + * &drm_wait_vblank_request.type.
> + */
>  #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
> +/**
> + * DRM_CAP_DUMB_PREFERRED_DEPTH
> + *
> + * The preferred depth (in bits) for dumb buffers.

Hi,

this is literally depth, not bits per pixel, right?

> + */
>  #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
> +/**
> + * DRM_CAP_DUMB_PREFER_SHADOW
> + *
> + * If set to 1, the driver prefers userspace to render to a shadow buffer
> + * instead of directly rendering to a dumb buffer.

Maybe add something like:

For best speed, userspace should do streaming ordered memory copies
into the dumb buffer and never read from it.

Isn't that correct?

> + */
>  #define DRM_CAP_DUMB_PREFER_SHADOW	0x4
> +/**
> + * DRM_CAP_PRIME
> + *
> + * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_=
IMPORT
> + * and &DRM_PRIME_CAP_EXPORT.
> + */
>  #define DRM_CAP_PRIME			0x5
> +/**
> + * DRM_PRIME_CAP_IMPORT
> + *
> + * If this bit is set in &DRM_CAP_PRIME, the driver supports importing P=
RIME
> + * buffers.

What are PRIME buffers?

> + */
>  #define  DRM_PRIME_CAP_IMPORT		0x1
> +/**
> + * DRM_PRIME_CAP_EXPORT
> + *
> + * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting P=
RIME
> + * buffers.

What's the export API? HandleToFD()?

> + */
>  #define  DRM_PRIME_CAP_EXPORT		0x2
> +/**
> + * DRM_CAP_TIMESTAMP_MONOTONIC
> + *
> + * If set to 0, the kernel will report timestamps with the realtime cloc=
k in
> + * struct drm_event_vblank. If set to 1, the kernel will report timestam=
ps with
> + * the monotonic clock.

I think it would be more explicit to say CLOCK_REALTIME and
CLOCK_MONOTONIC, because there are things like CLOCK_MONOTONIC_RAW
which is different. Mention clock_gettime()?

> + */
>  #define DRM_CAP_TIMESTAMP_MONOTONIC	0x6
> +/**
> + * DRM_CAP_ASYNC_PAGE_FLIP
> + *
> + * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.

Does this apply equally to both legacy and atomic KMS API?

> + */
>  #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
> -/*
> - * The CURSOR_WIDTH and CURSOR_HEIGHT capabilities return a valid widthx=
height
> - * combination for the hardware cursor. The intention is that a hardware
> - * agnostic userspace can query a cursor plane size to use.
> +/**
> + * DRM_CAP_CURSOR_WIDTH
> + *
> + * The ``CURSOR_WIDTH`` and ``CURSOR_HEIGHT`` capabilities return a valid
> + * width x height combination for the hardware cursor. The intention is =
that a
> + * hardware agnostic userspace can query a cursor plane size to use.
>   *
>   * Note that the cross-driver contract is to merely return a valid size;
>   * drivers are free to attach another meaning on top, eg. i915 returns t=
he
>   * maximum plane size.
>   */
>  #define DRM_CAP_CURSOR_WIDTH		0x8
> +/**
> + * DRM_CAP_CURSOR_HEIGHT
> + *
> + * See &DRM_CAP_CURSOR_WIDTH.
> + */
>  #define DRM_CAP_CURSOR_HEIGHT		0x9
> +/**
> + * DRM_CAP_ADDFB2_MODIFIERS
> + *
> + * If set to 1, the driver supports supplying modifiers in the
> + * &DRM_IOCTL_MODE_ADDFB2 ioctl.
> + */
>  #define DRM_CAP_ADDFB2_MODIFIERS	0x10
> +/**
> + * DRM_CAP_PAGE_FLIP_TARGET
> + *
> + * If set to 1, the driver supports the &DRM_MODE_PAGE_FLIP_TARGET_ABSOL=
UTE and
> + * &DRM_MODE_PAGE_FLIP_TARGET_RELATIVE flags in
> + * &drm_mode_crtc_page_flip_target.flags for the &DRM_IOCTL_MODE_PAGE_FL=
IP
> + * ioctl.
> + */
>  #define DRM_CAP_PAGE_FLIP_TARGET	0x11
> +/**
> + * DRM_CAP_CRTC_IN_VBLANK_EVENT
> + *
> + * If set to 1, the kernel supports reporting the CRTC ID in
> + * &drm_event_vblank.crtc_id.

Does this not apply also to the pageflip / atomic completion event?

> + */
>  #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
> +/**
> + * DRM_CAP_SYNCOBJ
> + *
> + * If set to 1, the driver supports sync objects. See
> + * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + */
>  #define DRM_CAP_SYNCOBJ		0x13
> +/**
> + * DRM_CAP_SYNCOBJ_TIMELINE
> + *
> + * If set to 1, the driver supports timeline operations on sync objects.=
 See
> + * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + */
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> =20
>  /* DRM_IOCTL_GET_CAP ioctl argument type */

I'm so happy seeing this doc appear! :-)
Sorry for trolling you into it. ;-)


Thanks,
pq

--Sig_/Zn4/MW6Amc.cxLqqrgH.ijd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBB68IACgkQI1/ltBGq
qqebJhAApPaD5xS+4RZRhrOQBx2vlz8TDRqcdrq/4AjOFHrrrvWDztU4M7mMS8R1
b0YrrXNzazojnkkcUMCjM+OE8YBwciEwdNldm/ZsjeliY3I/qBuFbZTeU3iQ7UI7
U/HBoiga71Te+hhAZyTMDUgMl2OhAYKnCnMLMQfudjCeHXai9bBMB3kLwDu9FrRz
AI+dDTRoIDaFlF++7kW/RhD4g01VrgCuL7jp7QPTj2G6+rBX7QdUekC8HsJZ13+Z
4AJSKnENRWY6qC3GChSG627B4cSVbmagnyBnTTu2YVhX2nr16AJ0h3MP3y4QE7Me
rr9eT7gWHXOVpQ6+1JyB2kZs+ThgLj2XcqCujRmHw284isGTj/Jfi3HO6CNEjO8o
KP1F8VXPZuuOTvGlKBlXP0mDm2hyaapQ/6990eHUHt9ID/2wolOxrw2SX8Kficln
p7vzXonVA+f2M05vU9sCsVH/xI1coVzFARwRvPcq2e9HDT2JLD5/rtt+CRuT0Unz
pYwfRldvYrw9r4aKxvEvIq0fDDd3VRMIG1cT03c8I6otjmb/mOXsiommi9rZn2JY
/JJz0O7JDa23EsG/8qrcpuEX+XbemUZpspbPsdpjaQxQbpeLyrKHJcbaZI61m8j0
HoBqgIm5XxwY4clIzzEhltN73O+1dCFrgBC7JaButHKFRAyiNYs=
=/VI5
-----END PGP SIGNATURE-----

--Sig_/Zn4/MW6Amc.cxLqqrgH.ijd--

--===============0452617234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0452617234==--
