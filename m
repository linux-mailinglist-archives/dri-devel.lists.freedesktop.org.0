Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290208674B9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404AC10F12C;
	Mon, 26 Feb 2024 12:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KFmqfP0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CFA10F12C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708950225;
 bh=jDAhdEpIbKlSXWc3tggrWyIET+6KayygFiH8Jlx4FdQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KFmqfP0ZEp9VwkGbslYkheutZpcnCyH+w7n2pXU85NgWvIcdbZfOyBcav1JM4g5LW
 tGmyxsZTYk/queDLgYvAoip8HRcbX4kYgCWLuGdh7UwNiQCKo0qWw87VaBGA165Mn3
 CIwkSVEBg8xuVKJ5jeDXrQiOYNGkCK5w3bF6Z0BjO6SvjRwtO6XSJGGKHMVtPGpGc0
 kriSFMLerP31qCy6sdcyPUB7CYBEWM6+y3GWHZ3fpQ58BxiYJBd36t43/74JD87Yg3
 8IvNN1LGKvsEnNq4ApjEtp8DZSEoe1b812iAk7QsooeSwmM4D+IuL1gmYcSHI8G5gd
 7M2d/gb84AaTg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E5F6837803EE;
 Mon, 26 Feb 2024 12:23:44 +0000 (UTC)
Date: Mon, 26 Feb 2024 14:23:43 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 7/9] drm/vkms: Add range and encoding properties to
 pixel_read function
Message-ID: <20240226142343.459f23f7.pekka.paalanen@collabora.com>
In-Reply-To: <20240223-yuv-v2-7-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-7-aa6be2827bb7@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZEoDf4cS/x3p=01Lsgfn.zi";
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

--Sig_/ZEoDf4cS/x3p=01Lsgfn.zi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Feb 2024 12:37:27 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Create range and encoding properties. This should be noop, as none of
> the conversion functions need those properties.

None of the conversion function needs this? How can one say so?
The previous patch is making use of them already, AFAICT?

How is this a noop? Is it not exposing new UAPI from VKMS?


Thanks,
pq

>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet: retained only relevant parts]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 427ca67c60ce..95dfde297377 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -228,5 +228,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_devic=
e *vkmsdev,
>  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> =20
> +	drm_plane_create_color_properties(&plane->base,
> +					  BIT(DRM_COLOR_YCBCR_BT601) |
> +					  BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +					  DRM_COLOR_YCBCR_BT601,
> +					  DRM_COLOR_YCBCR_FULL_RANGE);
> +
>  	return plane;
>  }
>=20


--Sig_/ZEoDf4cS/x3p=01Lsgfn.zi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXcgs8ACgkQI1/ltBGq
qqd0yQ/+PlsbBszx14fLcIryZU8Vr70SeP1/sr10MG/XYQgLAvcou7ushiRPDMtc
Vw7fD+bI7Egqs3s7nS4gFPhQX9Ej/iroulD7kUdejtzi9J4e2n5Z7ccS/uu5UoXQ
esCHtd3ZHMY5Sgi/FK76VUZV5EeW0WTkKAQy4rMHPaUumxi2RhueLQ+YVP8nzsIs
c9s1W8VQNAOKNKiIE7YNU0jjiA1FlqhGdghMQjpX1RYK7PB13xYmZKTZS0bUueut
oCrzvVkrAA2ASmxyRdlDaQeOmGso2/ajbc0PamCsWklQLTBbfuoy0yNnRXBXjVJG
RKUpyRlG4QI9/vGyFE818fbUT/f4CnwfN5yoeaM3Ciqv+zqH6fVnsXiqu1z1rQTm
EvzbcmCbNfzVj4+LbiVJCrrxcse8Nu0KA5HwXUlCxdyTVuW4s3ffYJnU/e6Ymicb
fgB1dGANe7d8BHUXO9JHyI4pQwIUM+7os9l3DWIEK64T9DTQCZqLPiMQeQbpDYjs
Wpd2coi52Gr37Kuauz0mX0TwRp7/ADi0+gpHBoX4Z+CtrTgPaWxhRcS9lmcyNo05
+LOovrnQMOydRPLvkMYsoDCWI/SdVhSt8XF5xiDEV6QOorm+wDLIh/qPz9me5/eb
U8vOpJuiE4KaKr8GwTCldJPr6GwR+CUEB1aUA33UEsZvtPbQoWg=
=obet
-----END PGP SIGNATURE-----

--Sig_/ZEoDf4cS/x3p=01Lsgfn.zi--
