Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4887970B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C406D10EAB5;
	Tue, 12 Mar 2024 15:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rf5HwYc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB9110EAB5;
 Tue, 12 Mar 2024 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710255777;
 bh=sNhOAl6WiJ8OT+RamoCeEoHzS3CmYfdvSaDISHJFlG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rf5HwYc9xQ8CbQrhAnDq+2BWsDsSQq+E3EorkFWzEO56RcLdeBx7HVsLnI2CD58P7
 7CsupAGx5MkhYkkSs9CMyJMsxE4XdNtfb0G38wGqPcebrskCtSeo4tKdM+DKvxir47
 TZ+eh77z4k6F6NaX0B8Dqvd7dbq2tyCD48G3Y8bM4p/IW8RZiG31KOhDqhfcx1IjVu
 DIzue8BK0W+9pXjVI9dBr1YK5tf/df7aEM4maWDdK74BljSXg1WA6oQz7RxfgyqPGb
 T/NAv94raRs4Uwde3Yng0fIukAKx6jXxZj5Ei0NniTKp5n2ACzBqoz1EoLxDjdL7/q
 sJFV7OwuMyJlg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C38E237809D0;
 Tue, 12 Mar 2024 15:02:56 +0000 (UTC)
Date: Tue, 12 Mar 2024 17:02:47 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 10/42] drm/colorop: Add TYPE property
Message-ID: <20240312170247.326b1c6e.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-11-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-11-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0jeQ+i6HaG7wBAwlzJwNm1U";
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

--Sig_/0jeQ+i6HaG7wBAwlzJwNm1U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:24 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Add a read-only TYPE property. The TYPE specifies the colorop
> type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
> etc.
>=20
> v4:
>  - Use enum property for TYPE (Pekka)
>=20
> v3:
>  - Make TYPE a range property
>  - Move enum drm_colorop_type to uapi header
>  - Fix drm_get_colorop_type_name description
>=20
> For now we're only introducing an enumerated 1D LUT type to
> illustrate the concept.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  4 +--
>  drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++-
>  drivers/gpu/drm/drm_colorop.c     | 44 ++++++++++++++++++++++++++++++-
>  include/drm/drm_colorop.h         | 17 +++++++++++-
>  include/uapi/drm/drm_mode.h       |  4 +++
>  5 files changed, 72 insertions(+), 5 deletions(-)

...

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index a295ab96aee1..3a07a8fe2842 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -32,12 +32,17 @@
> =20
>  /* TODO big colorop doc, including properties, etc. */
> =20
> +static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D {
> +	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +};
> +
>  /* Init Helpers */
> =20
>  int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> -		     struct drm_plane *plane)
> +		     struct drm_plane *plane, enum drm_colorop_type type)
>  {
>  	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_property *prop;
>  	int ret =3D 0;
> =20
>  	ret =3D drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLORO=
P);
> @@ -46,12 +51,29 @@ int drm_colorop_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> =20
>  	colorop->base.properties =3D &colorop->properties;
>  	colorop->dev =3D dev;
> +	colorop->type =3D type;
>  	colorop->plane =3D plane;
> =20
>  	list_add_tail(&colorop->head, &config->colorop_list);
>  	colorop->index =3D config->num_colorop++;
> =20
>  	/* add properties */
> +
> +	/* type */
> +	prop =3D drm_property_create_enum(dev,
> +					DRM_MODE_PROP_IMMUTABLE,
> +					"TYPE", drm_colorop_type_enum_list,
> +					ARRAY_SIZE(drm_colorop_type_enum_list));

This list here is the list of all values the enum could take, right?
Should it not be just the one value it's going to have? It'll never
change, and it can never be changed.

> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->type_property =3D prop;
> +
> +	drm_object_attach_property(&colorop->base,
> +				   colorop->type_property,
> +				   colorop->type);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_colorop_init);

Thanks,
pq

--Sig_/0jeQ+i6HaG7wBAwlzJwNm1U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXwbpgACgkQI1/ltBGq
qqd58BAAj2zfJHrEz85/Y8VU2XXhVx6m4QZLCjUhsnFkq7Ktq5dTGu6sCuX01s6F
sdDLSXfmKoYrFfBlGaO6rJVxt+0otWN9LCFCsGmguJZPKCqX6FSW8KANxptzfp0Q
gT3x300BKcTTTA8acjvCjJpCba9o/Gh8cTxs+Sv8syLn8qxDX1rDVdr+NKSrPkVo
Zdl6m286r5Ied+qNQ23A1ANCL999XTVmcJ+5gTXiFhhjBLHk/v+edgsxSVoLyQ5D
HU33QqMe9zlLc2aauhDa5bmju6CtNixMSFXJkdX2Wljd1sGCsJH0Ah6T4kMLg47y
R5WdQZtFVAKZ/WwJmozPtkDh6AimysVw0zUquL4melQcapjPENkHIo2vaY1TkDj7
Mr7ANrAV+zgmZD6dC60My9zfZ8IiToKmQ+1SXwYA1QuY8o6cEHdNybAjYQ6vjDfI
72arPNS1wk/4+lnJGEnNWRcM/3sdjYDXXo7CY6A7ULe5Y6JwqpaAf0T8EP8ay4PI
fkJEWq2UTJrlMiSSIgiX9LzODXTXpDPFIYktDhoRBe5nrr6TCTm2CIdokIN5ak1c
a4Mhw+0027gyixdaW/dJG94i4MsOERxsgoYT4DaYGdk8TmhdsaACDdUrK0XCEiGa
gQ+FUkRFv/SD9WZ8L/Py0o0dbwkGpXlyAjBKa6fXi/lLOng2ArY=
=FS0A
-----END PGP SIGNATURE-----

--Sig_/0jeQ+i6HaG7wBAwlzJwNm1U--
