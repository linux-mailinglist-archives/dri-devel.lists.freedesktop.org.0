Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9E4570B2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 15:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CED6EA17;
	Fri, 19 Nov 2021 14:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4E96EA17
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:31:36 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b40so44365425lfv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 06:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dDvGW7yOUmNhWv7aHYxkPpMlBqmr1ooDYGvoS1X3RcE=;
 b=RnbiiRDwaMV07e6T4nwmJxegN+JzK1P9wOLXY38Yczblut4Ql3Zc4yB/GKzz73ixU2
 3nl+7V7nMzvOH5TYa/sbUJ5iGEF8ox4HhyIFbEAAAzi6XW8p1gh7tgk4QxgdgNnOiujU
 I9hIjcTOfctVHvf1qFNMkcOX0WmyN2jdANNUYL/PmaeY9ssSw0fSNLWoTXz3P+pXVfHm
 FiKz8SuJBUbFw514Y5Fq82TPRp7Z9gVJ0gPEpgv+T6DTqJdoCoicfipcb5kmi8brdDGA
 rcMxHyrNnGKpLt3ZY50ltGVDh92dHaPXhKfJcatPy2d+q4+3mK21MhMVCu1vF0MmHDM1
 sDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dDvGW7yOUmNhWv7aHYxkPpMlBqmr1ooDYGvoS1X3RcE=;
 b=k2pPAGBKm86ITr3ZGRq6ul90gWIXFS26fipGmXDlJJ4DKqLTPui2KcaOokfjr0KE0n
 t+ds+TR9VAF2zUZ7LH7jprMCYp/uqDWPmnA34nigUR+SMtu/YVkmbxErZw7R90T1BxC/
 7vZ064JtT7sundJAS//nj69yvos6lNLAsQuX4WfR7lk/W2x7GIer9L8qDubLgD9aQaEk
 SPlFXsbONY8ewa+neIIMTJu74yv4uRr44UaCGNXeihMDlpsNPgOATvol8IyIY24sf6+i
 Oy3c1Gg8FXVprZWMHSPr/+FzLyH0UhKwiDFupXgiV9Tn7i183UiH5L135eTJXk1eB9IL
 l2yQ==
X-Gm-Message-State: AOAM530xkm509YWn6cYGg8ZObbt1Fh17ZIeOnkGv2E3LEer3Uz0jfCoJ
 BSOjBaJ2egfBlVRVXKAJkLo=
X-Google-Smtp-Source: ABdhPJwbCnUjk+AXfSMkwCr00p4pV+nZPZ1eFU4dQrRPgoy3icu5l2vqo22nBSRiHx/geeEYEbqrOw==
X-Received: by 2002:a05:6512:31d1:: with SMTP id
 j17mr32414061lfe.395.1637332294950; 
 Fri, 19 Nov 2021 06:31:34 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f14sm423352lfv.180.2021.11.19.06.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:31:34 -0800 (PST)
Date: Fri, 19 Nov 2021 16:31:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
Message-ID: <20211119163124.14db6063@eldfell>
In-Reply-To: <20211117140900.313181-2-maxime@cerno.tech>
References: <20211117140900.313181-1-maxime@cerno.tech>
 <20211117140900.313181-2-maxime@cerno.tech>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/71Na4Y=nv6tI1zneyzST.HT";
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/71Na4Y=nv6tI1zneyzST.HT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Nov 2021 15:08:58 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> Adds a format that is 3 10bit YUV 4:2:0 samples packed into
> a 32bit work (with 2 spare bits).
>=20
> Supported on Broadcom BCM2711 chips.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_fourcc.c  |  3 +++
>  include/uapi/drm/drm_fourcc.h | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 25837b1d6639..07741b678798 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -269,6 +269,9 @@ const struct drm_format_info *__drm_format_info(u32 f=
ormat)
>  		  .num_planes =3D 3, .char_per_block =3D { 2, 2, 2 },
>  		  .block_w =3D { 1, 1, 1 }, .block_h =3D { 1, 1, 1 }, .hsub =3D 0,
>  		  .vsub =3D 0, .is_yuv =3D true },
> +		{ .format =3D DRM_FORMAT_P030,            .depth =3D 0,  .num_planes =
=3D 2,
> +		  .char_per_block =3D { 4, 8, 0 }, .block_w =3D { 3, 3, 0 }, .block_h =
=3D { 1, 1, 0 },
> +		  .hsub =3D 2, .vsub =3D 2, .is_yuv =3D true},
>  	};
> =20
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 7f652c96845b..2e6d2ecae45f 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -330,6 +330,13 @@ extern "C" {
>   */
>  #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
> =20
> +/*
> + * 2 plane YCbCr MSB aligned, 3 pixels packed into 4 bytes.

Hi,

what does "MSB aligned" mean? How widely used term is that?

> + * index 0 =3D Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian

Because if I had to say, this looks like LSB aligned?

> + * index 1 =3D Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:=
10:2:10:10:10] little endian

And this is not really either, I guess.


Thanks,
pq

> + */
> +#define DRM_FORMAT_P030		fourcc_code('P', '0', '3', '0') /* 2x2 subsampl=
ed Cr:Cb plane 10 bits per channel packed */
> +
>  /*
>   * 3 plane YCbCr
>   * index 0: Y plane, [7:0] Y
> @@ -854,6 +861,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modi=
fier)
>   * and UV.  Some SAND-using hardware stores UV in a separate tiled
>   * image from Y to reduce the column height, which is not supported
>   * with these modifiers.
> + *
> + * The DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT modifier is also
> + * supported for DRM_FORMAT_P030 where the columns remain as 128 bytes
> + * wide, but as this is a 10 bpp format that translates to 96 pixels.
>   */
> =20
>  #define DRM_FORMAT_MOD_BROADCOM_SAND32_COL_HEIGHT(v) \


--Sig_/71Na4Y=nv6tI1zneyzST.HT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGXtTwACgkQI1/ltBGq
qqd8YRAAk9WAVAUl4CxZr6QYq6Mxn0YZeYljHxqE7HZYPM5U5mT5tW60dbvflwTD
yDYBiezen0pDOtVAJ7yxi21UeFoVRE9pfawAGU2yCGijU8oMc01AUvKCnG2I0jHE
pVgtfLmpTLrdPOu0f4Pmzw4/ow0uAL0t5t2sBtqMEhtrrl+2hE833BT0FNH3JnuS
Kra0WBEt1K+m7rpNcVzAAJ/9n1YDvjYDEAlUaf0/m7Hc5YckhhUeqwcsK3EuFcLu
uibI5XjqHjqVm5HNhzUUNOsRp0NQKIJKSOwfWyD/UG19OGjfJtfui2uxVBw/zyNy
/khEkyrwBVVkdUUmmwsaqKqi9/NHKHzWIosH+Mav9wuPB5my2YWjXgQLgykYQqah
61cpPB0sY4fP1Pr7lyEf/o13oQC/P9A3u0qVNm+HnkYeFO3EFRcdGRU5IFs9wXfI
Zo/8iIClBY6v3mAmEu03vD2KB+8cXkviak50kEjapbyYKzLAqH2sB9xeDgwW9FdT
JkXfuotEhKMAziafEg3lmJQz1NRnkEr4p31kbdjQnLHIRun+wm2VQVlgP6c7JeiW
uomXtgtBdtmKRJYeGAok1m61Hp3v1+LTZQQGvo+8TPj5JA3nRxqVnEjPSBY+NBWH
OZeCEeMNL+qSdfY6EuJKCXR66twPQBLDw/Rmsa5Cv35CfMzUl7M=
=0gfe
-----END PGP SIGNATURE-----

--Sig_/71Na4Y=nv6tI1zneyzST.HT--
