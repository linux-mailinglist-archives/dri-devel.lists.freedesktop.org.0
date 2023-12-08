Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EFD80A389
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 13:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E348B10E279;
	Fri,  8 Dec 2023 12:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C69410E279;
 Fri,  8 Dec 2023 12:39:48 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9fbb846b7so22562121fa.2; 
 Fri, 08 Dec 2023 04:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702039186; x=1702643986; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GlvLT6f+Goel0ug9HZOIcpWYkowXBjXc5rrvYtF3ODw=;
 b=clewRj3pyTqyYHvUEY9CA/BZPE11NXP3rlfQ2GaTWZ0Yw7bHWd8YSfvyuubwVEjE3P
 sOg/gL1O0M7gpQ/0YJTTyELhTIAZaRf/pweWu2pgUrUWVYSwZ7MDqePH2GVUD4vhiYm5
 2qFX4vKtJblY+zLowd9+DPwtv1rzsvpow2MSTPeUTMAz13+sIpefnyNlrCOeESeUPUZW
 dOy0JclTLaDjQPxVs6862IXg22bphrmZGg5mR2s51uljx7En6g50eq/crjTV1D/ex3a1
 LRgwLBngU8BK5VO0ZN2uthKtoxKLxy4pM8wmZ9pwMXPxb4DJelY9dPlii1FvHhlButHf
 t3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702039186; x=1702643986;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlvLT6f+Goel0ug9HZOIcpWYkowXBjXc5rrvYtF3ODw=;
 b=bUB5hdk2RvQ5zSaeoTkMR5Ke34GWMaU6hDOIfC78VRW/zywOQElHIpQVvfNL2JZjSC
 GctCTEjaaYFhgFTQxSlI5E7ihNkFA8dexiuhB3B5uBqUchgNED3wEW10FL1fY46NyFKX
 oI86sUv+rwsV373eJrmtdDoNWPar8K2+KC/VsHvO2y3X1wufoeDUVcuDB6VEdsc0UN9R
 8ENwkMUAoZe7Hv1YiVgO9F7a1LqpP9uoV3UC4JPYlshOL2i965Kz5J7jO5FR/yewVzAI
 U5nUTXME5vyB+qcmLFHh/LukHE4067PeSQdbuV2DiFOMGt0HW+1ihXLno8MJ3C17ndaP
 OA8w==
X-Gm-Message-State: AOJu0YxH9CNIEcmt3PheqfxYp+4P51JHnX4ceSDlbWek6ucEr+XVY3WP
 UPPNjK/qXu3/8jqMlc6FDPU=
X-Google-Smtp-Source: AGHT+IHkOZ1X/+IccYVlV2A4O9k/b/giCdnNiTA4rRJRdWr8GLv14H1jKm7FN8kF0ttJwusblHcl5g==
X-Received: by 2002:a2e:910f:0:b0:2ca:3c4:3415 with SMTP id
 m15-20020a2e910f000000b002ca03c43415mr2256047ljg.5.1702039186136; 
 Fri, 08 Dec 2023 04:39:46 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g26-20020a2ea4ba000000b002c9f58169a8sm217067ljm.120.2023.12.08.04.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 04:39:45 -0800 (PST)
Date: Fri, 8 Dec 2023 14:39:41 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 18/23] drm/colorop: Add 3x4 CTM type
Message-ID: <20231208143941.433cfe61@eldfell>
In-Reply-To: <20231108163647.106853-19-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-19-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4E0kctWp5/2_j0wTWEp9ZMV";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/4E0kctWp5/2_j0wTWEp9ZMV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:37 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This type is used to support a 3x4 matrix in colorops. A 3x4
> matrix uses the last column as a "bias" column. Some HW exposes
> support for 3x4. The calculation looks like:
>=20
>  out   matrix    in
>  |R|   |0  1  2  3 |   | R |
>  |G| =3D |4  5  6  7 | x | G |
>  |B|   |8  9  10 12|   | B |
>                        |1.0|
>=20

The bottom-right element should be 11, not 12.

> This is also the first colorop where we need a blob property to
> program the property. For that we'll introduce a new DATA
> property that can be used by all colorop TYPEs requiring a
> blob. The way a DATA blob is read depends on the TYPE of
> the colorop.
>=20
> We only create the DATA property for property types that
> need it.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++++
>  include/drm/drm_colorop.h         | 19 +++++++++++++++++++
>  include/uapi/drm/drm_mode.h       | 19 ++++++++++++++++++-
>  4 files changed, 83 insertions(+), 1 deletion(-)

...

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 0ebf0f480dc8..b5d4dd5660d9 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -847,6 +847,22 @@ struct drm_color_ctm {
>  	__u64 matrix[9];
>  };
> =20
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 *
> +	 * TODO what's the format?
> +	 *
> +	 * out   matrix          in
> +	 * |R|   |0  1  2  3 |   | R |
> +	 * |G| =3D |4  5  6  7 | x | G |
> +	 * |B|   |8  9  10 12|   | B |
> +	 *                       |1.0|
> +	 */

Again 11, not 12.


Thanks,
pq

> +	__u64 matrix[12];
> +};
> +
>  struct drm_color_lut {
>  	/*
>  	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 =3D=3D 0.0 a=
nd
> @@ -859,7 +875,8 @@ struct drm_color_lut {
>  };
> =20
>  enum drm_colorop_type {
> -	DRM_COLOROP_1D_CURVE
> +	DRM_COLOROP_1D_CURVE,
> +	DRM_COLOROP_CTM_3X4,
>  };
> =20
>  /**


--Sig_/4E0kctWp5/2_j0wTWEp9ZMV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzDo0ACgkQI1/ltBGq
qqcLbRAArebn06V8h658w5kxLdvsoQEnNhyx2sJfhCI6e6y2ZEC8RNpk2A5I0qt9
JYuxWOPfG+t+0GUVbX934qfHf8uRx0Ejla2v9u6hEp7p16vBcHSJUZbokjYOfcDJ
xSo1S60xYhj70anqnFBLQ3pUTelZ5e63zwbIbTal0YJ/wab36L9zZY7iNDZxg8iL
hjwF4kv6xNkRQBMkXUYGKaV/cx8BaEDZFyDlf8U2woLLAAehpG2zfEgC8s26zHDf
BrKxc87NCj9oFK8QoEfcAJIfTLOjAjQNZx69Q8MfMKFCSIRwCj3pbLSBvCry4fu/
6Rt65MSzElCQIXfZKwON7Vlf1fVBxh2cImfNSbzcdEiEwmI8XxPh/0rokbWijmQF
lC+Zt4lIQ7cORzoAtOU/lZ/m762Gk1XpvFnaXwna7ogD7/kiS+LRsx1YIv/mq/7H
62AjJnQ0KBQ12tAuJt4TqtckwSLg9NvZYFyCmZTPWmCWKMQ6cKMxdeUjtStDhhF3
MNUezwO46KDvl2kNCVQMwjyODuLzQWD/PLz7SKbCL1Nbgwl1ws2BAcWEd4beKQww
Klgw//bYIh9r9O9898+VNQCPa3Avlut5+nU5Pjw40oS4Z6Vmq6mn4lmxaq/k6bQh
Uy8u81Ma+8HsQZAjHjsVizOydNmceRmq75T6w1X+AwD60NXiUB8=
=NzsM
-----END PGP SIGNATURE-----

--Sig_/4E0kctWp5/2_j0wTWEp9ZMV--
