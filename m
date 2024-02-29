Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468B86C926
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CAC10E147;
	Thu, 29 Feb 2024 12:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jJtylRnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89CB10E147
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709209468;
 bh=WVJjUmqwSs0zHzDuQ7kxu0V6KK/JG5zakTpPNxqRQT8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jJtylRnJWya2iGcxS101Ea2GDKznb3HCoC83fPA/1fB88nTpvRnRncN2Wl6G4gt1z
 Sr61mxQqKrdU8+ZHx+4KAW3ZRPCWBsq/BiznMRY06Twul/2xPY5Kme/l3H2a0NYS1E
 BtQyRaSzDLEg2YCtzFWrT8gf93PuSnhyFjHiqvDA/SMIDrOcie2lFsoSd84sW4eB+d
 ZRn6sH5lXqvD43Oz4x3nEL8zfpWO1B2XPDzv7CiEbfo1gH+DjxQyB+yF2zlTvDqPsZ
 vpJAJfUt6x6U/9/z+5xVnVS2939NVYZQpLPP83jHkAVouU2mzuWDAgGlsNlyAOJZBe
 a4f/QhHEYw7fg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7484E3782089;
 Thu, 29 Feb 2024 12:24:27 +0000 (UTC)
Date: Thu, 29 Feb 2024 14:24:26 +0200
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
Message-ID: <20240229142426.274ae199.pekka.paalanen@collabora.com>
In-Reply-To: <Zd35cpAID3ea8AFO@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-7-aa6be2827bb7@bootlin.com>
 <20240226142343.459f23f7.pekka.paalanen@collabora.com>
 <Zd35cpAID3ea8AFO@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljQln9QAxq5Lg3l3VqhE1oZ";
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

--Sig_/ljQln9QAxq5Lg3l3VqhE1oZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 16:02:10 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> (same as for PATCHv2 6/9, I took the patch from Arthur with no=20
> modifications)
>=20
> Le 26/02/24 - 14:23, Pekka Paalanen a =C3=A9crit :
> > On Fri, 23 Feb 2024 12:37:27 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > >=20
> > > Create range and encoding properties. This should be noop, as none of
> > > the conversion functions need those properties. =20
> >=20
> > None of the conversion function needs this? How can one say so?
> > The previous patch is making use of them already, AFAICT? =20
>=20
> It's my fault, I mixed the commits (in Arthur's series, "Add range..." wa=
s=20
> before "Add YUV support"), but for me it makes no sens to have the color=
=20
> property without the support in the driver.

Ah, so if there was no YUV support, these properties would never affect
anything. Ok, I see where that is coming from.

>=20
> Maybe it's better just to merge "Add range..." with "Add YUV support"?
>=20
> > How is this a noop? Is it not exposing new UAPI from VKMS? =20
>=20
> It's not a no-op from userspace, but from the driver side, yes.

If it all is already hooked up and handled in the driver, then say just
that?

"Now that the driver internally handles these quantization ranges and YUV
encoding matrices, expose the UAPI for setting them."

And fix the commit summary line too, nothing "pixel_read" here.


Thanks,
pq

>=20
> Kind regards,
> Louis Chauvet
>=20
> > Thanks,
> > pq
> >  =20
> > >=20
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > [Louis Chauvet: retained only relevant parts]
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms=
/vkms_plane.c
> > > index 427ca67c60ce..95dfde297377 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -228,5 +228,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_d=
evice *vkmsdev,
> > >  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
> > >  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> > > =20
> > > +	drm_plane_create_color_properties(&plane->base,
> > > +					  BIT(DRM_COLOR_YCBCR_BT601) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > +					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> > > +					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> > > +					  DRM_COLOR_YCBCR_BT601,
> > > +					  DRM_COLOR_YCBCR_FULL_RANGE);
> > > +
> > >  	return plane;
> > >  }
> > >  =20
> >  =20
>=20
>=20
>=20


--Sig_/ljQln9QAxq5Lg3l3VqhE1oZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXgd3oACgkQI1/ltBGq
qqesIA//SDMTOE8sWnysIBZUdRItd5TZ91ZmqNqtS+ii91KVr/D8x2O4rcBSnSUz
V7Mvp8wbg/SB+t8wQkTHray5MPOrZG15c57GcmjcCQlXkE5DnfsERW+COscvjJ/R
KjKN1iI+7xiK4ryAfZ9sSYlcmI5n3hbRu7+WtKtfdL6kAbwBSoJxZq7eCf+l4XrD
0opqh+xsubyLm12HKAMO4igf/CGu5MDwqzBgHDlj0pF4mOwuwGlni5ckV3EUXYLq
jkXlvXy/SKqikfJUQTnGagAug7lZN3Zgk8CnrZyd/L1bV0wAUA7flx9Shbzn/2Ot
hAy1XVNmKdw2Wj0NuSXXxnkOrm0CQKadOwH5OEEHj+BdlElncKFuNoPjrR7hBNBB
6U+q8hY0WHqQwJ5SQqGvf8Oim8LTXrka3lyAQ2H1hIqxJPtRx5bEsu+rmPOFzdge
7pWSOLi5sf6XlzcBuKwZsZgQJVdXW6FFyB+iQ4GLQ/0++DY04xbcmWRsK5hl4qdt
VrR5QXFVI5vF59fQraPeMyFdZPaaiqMVZsdpU68GUgUXNNqyndufxq9yvE1L8KNB
EBUIGoy6p/R+W2bd9H5iF3ZHFHU/qcumz4lZA6OxGqAtigRyKa53qzFfSnic2I08
L49A7+kTN6iHXzGrm5/wbEnQsOgt14c42mvApmlVrjC5kyfWGjg=
=TZsZ
-----END PGP SIGNATURE-----

--Sig_/ljQln9QAxq5Lg3l3VqhE1oZ--
