Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C66A5950
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633A10E69D;
	Tue, 28 Feb 2023 12:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D0C10E69D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:45:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f18so13016198lfa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 04:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677588321;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ICTa9Ut92TlxZlb/0np7yaf58ljductmsf0l8Djg/dQ=;
 b=YkJoXMMD4AybrpZArpQU3gZg2Cw/s+xxIqOkoLpR8COVUW5ZdQgZvYA2kNBvDthORT
 lZMLg1a3KdGEgQ9/hsgXFrjFNV3gZI+inenXtHAJnZTgJsXm+Zz9X4JcUMMRaaclIYl+
 BngYpWSiF/eQdLI70ZjjUthvLy7uOQ1DnH4Ugoi2zH5L/avd2w3BZvcVfSM9R+T0521R
 KV9aL2o7tIXH6H5qzKtaXnCt2hQX1+B3E1Un0wsRIMr0bHBQJsCMdFJXHHmMyhTTKiEs
 PXaviZAxzLwc0sHhMFpBHSp3qvnG/EoRgNAVo8cEOhtlYcAQuHOsLS2D1toKg/NmMzGA
 +bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677588321;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ICTa9Ut92TlxZlb/0np7yaf58ljductmsf0l8Djg/dQ=;
 b=5NqIDkAG8QOBgebrhpwAtBEf+TJLlW/U8dXSELSkOHVxmIopcygwq9AjTjupEtxEjS
 nH2P+jHSeuuONEI04yMDB7EbzdOBcYOi4uWsjYCVZMiAb1r//xOQXQX6GL1pCEps/e9l
 ++r6OfkvhRONyyTtnFjmT6Vey+Xovqp4QPog3PSt0wPrYSFP7DwfSyJZlvz/N5ECI2mm
 J4zdOtvZ+AQGCEhjTaQpGwNyrfbokbUGBW/VwLv+nRi+m+jNGZX2TiLktRToWbU/DDbZ
 gFtozRl3q/SEncAIx5UFaJ50L5ZNRPngxaCUCm4NTvp7MULPF5+kQ2pyJw/yQH2/zpX3
 /ong==
X-Gm-Message-State: AO0yUKUCzfFqZm0kO1d0JTVlLqs5ZkCD4Wip4jwQMVdm+G6I/M2hpOFE
 tLWfk2OxE7t5CiPWZdjGWOQ=
X-Google-Smtp-Source: AK7set/erUDL9pjFcPxQD8gY5LVrci1+amiH3a3RY/d4LqOcXcBC/ij5GVBQuQjrKL90mrfYytYzdQ==
X-Received: by 2002:a05:6512:20d:b0:4da:8838:31d9 with SMTP id
 a13-20020a056512020d00b004da883831d9mr749420lfo.8.1677588320938; 
 Tue, 28 Feb 2023 04:45:20 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m15-20020a056512014f00b004d5ae3f5e9bsm1313085lfo.130.2023.02.28.04.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:45:20 -0800 (PST)
Date: Tue, 28 Feb 2023 14:45:16 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document connector margin properties
Message-ID: <20230228144516.6931d1d3@eldfell>
In-Reply-To: <20230228123156.175973-1-contact@emersion.fr>
References: <20230228123156.175973-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jSrVL/Ug1ApTm=FBp.Kdm4n";
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
Cc: dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jSrVL/Ug1ApTm=FBp.Kdm4n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Feb 2023 12:32:04 +0000
Simon Ser <contact@emersion.fr> wrote:

> Add docs for "{left,right,top,bottom} margin" properties.
>=20
> v2:
> - Mention the purpose: mitigate underscan on TVs
> - Move out of analog TV section into standard props (Pekka)
> - Mention HDMI AVI InfoFrames (Pekka, Ville)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ffd65eddce42..a180f541736a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1446,6 +1446,20 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	a firmware handled hotkey. Therefor userspace must not include the
>   *	privacy-screen sw-state in an atomic commit unless it wants to change
>   *	its value.
> + *
> + * left margin, right margin, top margin, bottom margin:
> + *	Add margins to the connector's viewport. This is typically used to
> + *	mitigate underscan on TVs.

I think it's overscan: scanning over and beyond the phosphor grid.

> + *
> + *	The value is the size in pixels of the black border which will be
> + *	added. The attached CRTC's content will be scaled to fill the whole
> + *	area inside the margin.
> + *
> + *	The margins configuration might be sent to the sink, e.g. via HDMI AVI
> + *	InfoFrames.
> + *
> + *	Drivers can set up these properties by calling
> + *	drm_mode_create_tv_margin_properties().
>   */
> =20
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> @@ -1590,10 +1604,6 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
> =20
>  /*
>   * TODO: Document the properties:
> - *   - left margin
> - *   - right margin
> - *   - top margin
> - *   - bottom margin
>   *   - brightness
>   *   - contrast
>   *   - flicker reduction

With that one typo'ish fixed:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/jSrVL/Ug1ApTm=FBp.Kdm4n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP991wACgkQI1/ltBGq
qqfxOBAAjCw3iB4GS+O8NHULXiRVZAC6RJc7203JglTpOmM+b5IXcAxhExXvg6DE
omUo2uIuqGXiA6iRcNG60SxoyPWJoA3uS9vKI25NsKfQc3wizb0Y7ygwQSclaT91
HCXE3URIFib+HjOKS9Gythez/m1o3r4QthKK3ssg/vaUu2jwbXSE4e5HOTQ0Qffw
2Ip6sM6cp8ru0QvHkv7c2XyCR9LW2z3GNYlazVSdrWcOA4IzDvBI6iOAb1EFRxrP
kVFPikiFPgv4lp/ueWKGQDZ2wN8hbDzA3ZMNSq8EJTa2ZPFwm0YmV/H2anym0RwH
YyaslkSnJjyOaJc3GlAFClvmp2kkhWHgxPcBG4uMM3txi34y8360nz675TG4ZOz3
rVGZPu8XSi9Fql4xuAA2gtMqQlKKEpOqfGXa9UXxFwIjJorYhzFF7OivMmBxlwhM
W1QhbI1vVoqHnd9BWCEJlztMkoObSKLF0mbpxebpJOL4vLZ5Ji95b2LvU0aNRjey
F4MxyFayMB0qhW//6mj53pBdFrYhdnkkmd7spxXqxKZA58bM6hTSGSq4IMznudY8
Nq0+FK8wBa8hkAPeSFVMyuUKv06eFGAhwN0W8g8u0TIdpyuPEwHlwVZ1vXxNvZdw
/gUGoBo4li2nBZRTDzgV3eprnr32QXqEyS6y8MgraBrsnGAyI1E=
=slLo
-----END PGP SIGNATURE-----

--Sig_/jSrVL/Ug1ApTm=FBp.Kdm4n--
