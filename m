Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE278BFEE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BBB10E178;
	Tue, 29 Aug 2023 08:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16D10E027;
 Tue, 29 Aug 2023 08:10:12 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so60497271fa.2; 
 Tue, 29 Aug 2023 01:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693296610; x=1693901410;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=v4mC9KYKkQXQDiZEbLbQSAIp6lc85QhEw4RvIjClzpU=;
 b=Pj6FASlTlX3l4PisP5ZpRbEya65eqoRinHgFnl1vkHR/WPdyaY0mfgk6eSDxKzyUyx
 FsJzHTzikQ3139OVGG+vTlBTFQztNE7Vxdg4JyvTB39sgWWSiRcQlQhEcmp+Utqey4lu
 oOQ14vRjGwav3iNFIrTHx6mg80tTopG6HJbJJU9McXW1bQkK/gy2nAPD3XAPESRzQocb
 DYVa5CqqjgDm9K841Nb21/BawJ73gghj49vNq05Ve/l3pwoS+6E47JNsXm+Vyy/SukkZ
 9rjApIAL6fLnf5b2X29Y6BEH4FJEAetGI+zu4YMY6MNYpZKSOdbDxujLa64r+9Xznrc0
 cs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693296610; x=1693901410;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4mC9KYKkQXQDiZEbLbQSAIp6lc85QhEw4RvIjClzpU=;
 b=bhc4ACKX7hHs6BWcOJkFxaACye2CmcU1ds45O+d9ViSwa/9Z2N9rouebha19ijUj6P
 tnSbqxt9LwYFoXTmTPhgDulLs0PH1pk6AmKHnnEwii53MIIGovJ+AQmI2NgDcfwOBPs2
 UrM8/TyMjtpop70l3QheYvh06SdSybML47MKijZoa89RjlSzHHdAvu5UKeaXOHwZ+6rl
 mKgh1PpbS9ExUp32oLaP9BacvAAziOQzkc8rxmQY47sw/Cf9e3Z66bDxfz7oEyu6MXZi
 OzQj9BEeqmfO6/0YB0qRqb2MakbvPmNOVsdf3awRUNYhbyf/KNzairkUovaERx7DgZUe
 Tu6g==
X-Gm-Message-State: AOJu0Yxj1sDXPYp9KRkqi9hxOiOqUoh5eKB5s0eblVWVMk0eoZy1VCV9
 mEvB6qo/ob51ajSwEDoixkw=
X-Google-Smtp-Source: AGHT+IGXPuRW3MQGAlACbyOnXXAhlU3tssV5YGnrQVQgtb/RMpBl2U7Y+awGMUWAhS5caRIY2CWjZQ==
X-Received: by 2002:a2e:380a:0:b0:2b6:d13a:8e34 with SMTP id
 f10-20020a2e380a000000b002b6d13a8e34mr19594076lja.46.1693296609195; 
 Tue, 29 Aug 2023 01:10:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h17-20020a2e3a11000000b002b9b90474c7sm2074300lja.129.2023.08.29.01.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 01:10:08 -0700 (PDT)
Date: Tue, 29 Aug 2023 11:10:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 02/10] drm: Introduce solid fill DRM plane property
Message-ID: <20230829111006.69cab33e@eldfell>
In-Reply-To: <20230828-solid-fill-v6-2-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-2-a820efcce852@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tx9fmnSVUoZ_ajb1c3JK4ZY";
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Tx9fmnSVUoZ_ajb1c3JK4ZY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023 17:05:08 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
>=20
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
>=20
> struct drm_mode_solid_fill {
> 	u32 r, g, b;
> };
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 26 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 36 +++++++++++++++++++++++++=
++++++
>  include/uapi/drm/drm_mode.h               | 24 +++++++++++++++++++++
>  6 files changed, 126 insertions(+)

...

> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index c3c57bae06b7..273021cc21c8 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -200,6 +200,10 @@
>   *	"FB":
>   *		Framebuffer source set by the "FB_ID" property.
>   *
> + * solid_fill:
> + *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
> + *	contains pixel data that drivers can use to fill a plane.
> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).

...

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 43691058d28f..1fd92886d66c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>  	char name[DRM_DISPLAY_MODE_LEN];
>  };
> =20
> +/**
> + * struct drm_mode_solid_fill - User info for solid fill planes
> + *
> + * This is the userspace API solid fill information structure.
> + *
> + * Userspace can enable solid fill planes by assigning the plane "solid_=
fill"
> + * property to a blob containing a single drm_mode_solid_fill struct pop=
ulated with an RGB323232
> + * color and setting the pixel source to "SOLID_FILL".
> + *
> + * For information on the plane property, see drm_plane_create_solid_fil=
l_property()
> + *
> + * @r: Red color value of single pixel
> + * @g: Green color value of single pixel
> + * @b: Blue color value of single pixel
> + * @pad: padding

Document that padding must be zero, and ensure userspace obeys that. If
there is ever need to re-purpose the pad field, requiring it to be zero
today makes re-purposing possible.

Alternatively, if it is likely that it might be used as alpha if
alpha-ful format is added, then it would make more sense to require it
to be 0xffffffff instead of zero. Then the kernel could internally
interpret it as alpha always without special-casing zero. Or, it could
be straight out called "alpha" to begin with, but document and verify
that it must be set to 0xffffffff which means opaque.

> + */
> +struct drm_mode_solid_fill {
> +	__u32 r;
> +	__u32 g;
> +	__u32 b;
> +	__u32 pad;
> +};
> +
> +
>  struct drm_mode_card_res {
>  	__u64 fb_id_ptr;
>  	__u64 crtc_id_ptr;
>=20

Looking good.


Thanks,
pq

--Sig_/Tx9fmnSVUoZ_ajb1c3JK4ZY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTtp94ACgkQI1/ltBGq
qqc5JxAAplJnS6jraS8LqXWheo+3tbrSW2HwSRw7IqbQOJMfYTRdwDYMJ8oymOcX
KFiKavBCkh87z9wGHImDqmNbdL3+ROB8YiSRm0wtRbhmx5gQC+1f1a2dG7izzTvK
0gOOKmQxVPNLB1iZ1DqxaJtq7yluDWAdAsg6Pg15+Cfet+I50O+Ot4TuteRcuM5T
oac1pOHX7VMRMHs1gX0+/shWA7nLDiVXwIyBEdt1jH1xIKVoAE7c+KQ5ouDrB9zY
vn0CbdOoH8/ANkZ1LGMI6+DMW80o1Zw+JlkT95g42+Mshu2x/QHh3mPu11shTHm0
fZcfUNAXGqY9HmKQeQgwY/houpQAB+Vc8xpVws3m3CPFhkwIV8XtW7G9fmLPWqh3
EVNg5x7eWpKov0XVEz+Vi/2rTAtQkB06817VEVoEi+zfsB2mifiSznpI7xdl4dxx
rf9PjT/Q6fA/tsqux3Bw8YgStR7UGFhdUytntU4ZsoD/A4nsfNJ+UpzQUWp9OmT2
kcus0eeab8PPE5nLqAc0uv66TY5SujcCs5sLyhIuQUTsjn2SxBD2K4U7c9MSWQIv
lCrGuAFb6OTEOCTPKfRjD9tgLMHfZJmlNv1X2FF7eCBq2tFMBsC7tWvw2OTKU+3n
sQpa8SjOXaQxz8n7YekBz+sbtvzwGAuIVZO9oLbL/Ba19VTa3Dg=
=GM1/
-----END PGP SIGNATURE-----

--Sig_/Tx9fmnSVUoZ_ajb1c3JK4ZY--
