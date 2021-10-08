Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C2426539
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 09:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8706E2A3;
	Fri,  8 Oct 2021 07:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304C46E2A3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 07:29:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x27so35569710lfu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lHaPZtBMFBesPrV/3VBeRXRcFCUaEYUjxehibrsF708=;
 b=hv5YxiEHast3t4SD5QcDUyOFTdnV+te7Dp78zcU1kih6yTY8MGpSl2HF373bb4sw9p
 S6gmisehA2qI+MWW9EKGjioy9/uuN0x/clgkymKKWu7pO/gctYowlBgkQ/DjgY3ykHUT
 +F8xFR8yIZs3m6p54yCpk5RNoBq1RaXucenwtT8DE+ekNHao9yrm+5BXNMUr0Is4f5AR
 MTbT0HRsDhD74wjepJHk4tbKMEeHaqwtwz89jxRlhXDn07QzbqxS9f7DPunS91JXCeJU
 5SByxFs3uCPS2l3Hvp+yXTf6Y8K047v1Dx4MEGA0obExSuiwUaAbTMbufC/ppXaxKdq3
 BuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lHaPZtBMFBesPrV/3VBeRXRcFCUaEYUjxehibrsF708=;
 b=y6tZhANtQhP+4KpNu0tHjOFPhYzqGuF0SyDgUp73wDg3ZwV1RFDfr45NNS8/X0SFA0
 ErbXRcA6VvZECGUz+Vb0IuEVKXcQ4j4AJhaWSMJZ3zPBVdFAvp6NQgqlqIOjqWMtaKJc
 YTIS7TnwMV/s4o1Kepqqf6aRbBQOoei/YV8q9Wwa+HMbCSTc5qwMsPQsiijPwfysBeLs
 8JEeUCiDggYmF2Mqz6kQrb4qFa3OvzP2fUJvzj2lGNDabNXlPyr5XlWBKt44jAoYAahg
 darWuveomDcj03KyzmN4ONfE2xTIap7b4HrszM1MsSfXP3aC/FxY8mD59yy+NbwXKgAT
 LqIA==
X-Gm-Message-State: AOAM532UpghJ9bs3KZB0wiZgRgOkQa11MxLFX4/PBlp9ya8lUfJLg6CY
 Qd1tFVl8Plvewloh5Rnc4q4=
X-Google-Smtp-Source: ABdhPJx9+UhTbagf1eMAqxd7KQ9PFhy+7hB/+VP8+RMan1LwGAbBwRRwto4PQZtA/2EsYL7sTK1Jdg==
X-Received: by 2002:ac2:5229:: with SMTP id i9mr8840197lfl.493.1633678161499; 
 Fri, 08 Oct 2021 00:29:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e3sm170633lfn.203.2021.10.08.00.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 00:29:21 -0700 (PDT)
Date: Fri, 8 Oct 2021 10:29:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Dennis Filder <d.filder@web.de>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH RFC 2/2] drm: introduce CLOSEFB IOCTL
Message-ID: <20211008102911.3bafa4f2@eldfell>
In-Reply-To: <20211007131507.149734-2-contact@emersion.fr>
References: <20211007131507.149734-1-contact@emersion.fr>
 <20211007131507.149734-2-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O+1iN=5==rES0HOd.JpCJdw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/O+1iN=5==rES0HOd.JpCJdw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 07 Oct 2021 13:15:25 +0000
Simon Ser <contact@emersion.fr> wrote:

> This new IOCTL allows callers to close a framebuffer without
> disabling planes or CRTCs. This takes inspiration from Rob Clark's
> unref_fb IOCTL [1] and DRM_MODE_FB_PERSIST [2].
>=20
> [1]: https://lore.kernel.org/dri-devel/20170509153654.23464-1-robdclark@g=
mail.com/
> [2]: https://lore.kernel.org/dri-devel/20211006151921.312714-1-contact@em=
ersion.fr/
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Dennis Filder <d.filder@web.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>  drivers/gpu/drm/drm_framebuffer.c   | 19 +++++++++++++++++++
>  drivers/gpu/drm/drm_ioctl.c         |  1 +
>  include/uapi/drm/drm.h              | 19 +++++++++++++++++++
>  4 files changed, 41 insertions(+)

...

> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 8b8744dcf691..545762bc16d0 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -670,6 +670,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB, drm_mode_addfb_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ADDFB2, drm_mode_addfb2_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_RMFB, drm_mode_rmfb_ioctl, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CLOSEFB, drm_mode_closefb_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_PAGE_FLIP, drm_mode_page_flip_ioctl, DRM_M=
ASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DIRTYFB, drm_mode_dirtyfb_ioctl, DRM_MASTE=
R),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_DUMB, drm_mode_create_dumb_ioctl, 0=
),
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 3b810b53ba8b..8726f003f382 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1097,6 +1097,25 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
> =20
>  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
> +/**
> + * DRM_IOCTL_MODE_CLOSEFB - Close a framebuffer.
> + *
> + * This closes a framebuffer previously added via ADDFB/ADDFB2. The IOCTL
> + * argument is a framebuffer object ID.
> + *
> + * This IOCTL is similar to &DRM_IOCTL_MODE_RMFB, except it doesn't disa=
ble
> + * planes and CRTCs. As long as the framebuffer is used by a plane, it's=
 kept
> + * alive. When the plane no longer uses the framebuffer (because the
> + * framebuffer is replaced with another one, or the plane is disabled), =
the
> + * framebuffer is cleaned up.
> + *
> + * This is useful to implement flicker-free transitions between two proc=
esses.
> + *
> + * Depending on the threat model, user-space may want to ensure that the
> + * framebuffer doesn't expose any sensitive user information: closed
> + * framebuffers attached to a plane can be read back by the next DRM mas=
ter.
> + */

LGTM!

Semantics
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

> +#define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xCF, unsigned int)

Should it have a structure with 'flags' for future-proofing?

ISTR some rule of thumb that everything new must have 'flags' field
enforced to be zero just in case. I only now saw that RMFB cannot have
flags.


Thanks,
pq

> =20
>  /*
>   * Device specific ioctls should only be in their respective headers


--Sig_/O+1iN=5==rES0HOd.JpCJdw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFf80cACgkQI1/ltBGq
qqeIzQ//TyG9UCu7AyOMj0ASg7Nr3FbeG9EfIoDSoOTD2+mxIv7vmnnqF7W//B4H
ZTysMneYVh50VLozRde7F1ALGWqg+fhreY6K5h8XwlHAypYLL6sSvCLPEKzgBr2f
nZZGDRDzUT5ZdRmrwFGdXg7YUVBv3bKNPH7b1QfoCMD1od5cLchHDo/4rGS7h8tN
J3IlYvhKJtDPXUD6apHKnngDuNCczQlNOaMSwvpXuE+tFAkAEs+G7ItsrhDoebpZ
LEwzYPm3NX9/LwoMNZL4mBfb1v23g9HpVMbtcT80Lly7fGyw6gYJA5MVq9SqO6va
HWMlKJ48VKHuSX+XMCpTw8igKTl18m7KGBNHMmwVd+mVyaS0NdmtjP6TBb6GUYJZ
85OixXAZIu9qWMhViD+ZIQ1HXnCAga87kvafWDKCdQTeVu65nkg/d7mqAVO9EF4E
KsdiY7aFhzXoOp1HmEylkYyvRwnS4vjq3A9D9skZPBEnSkDebrF+bsisUsJlJNPF
7zIRxUnN87XHVV9N6nL8aQVKcxnwJu1NMZv2mL+tXzl14ZUzvEzo9Pw2nZB17ZFO
neTxWRSSmDjRdzATgxM5tCe7EmNxbsit0A5VezeAxDJwqFZDcL8F+Uiea6xeVLt1
RQvNAUE1rCWZFVwVmSq2LNaCthl37o/ymwyhReknbAl1MTQez2I=
=D7oL
-----END PGP SIGNATURE-----

--Sig_/O+1iN=5==rES0HOd.JpCJdw--
