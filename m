Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443386C47D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D0410E3A9;
	Thu, 29 Feb 2024 09:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LTSWiM7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0FD10E3A9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709197660;
 bh=rQGrKj7VtVEMbE8kCBG2tmWTgbHiWPidO4c0rHGUVY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LTSWiM7qjEy/RVB233XvWdaKkZIdtOMR18xAyi5bX2QyBx12SssDOAX0Wlw9k/awZ
 fZnooxi14OdOI32kbAsegkf7gLnUr4TEwjIVE7tVku+Ie20eOtGKYENuhXHaRCu+Px
 i6Zp13SzfD61IQFibZHSzKqjpVz3ylBMnFOKGNbuqyqwsYcr6XlfLN/0TTk2Ahpu9e
 xmXTZdL2zs8lejfHvNTYMrgWU8nOHuNh06wBNiZO9ekDf3x3ZAM6UGNqb5HoGyVq8s
 KgGa3rm0kUYqKxZND/ChjcgFDK4b3mHhN6YwD7aEwjZZM0inO4fY5oycWLP4v6jl7q
 4O9uQ2uJ3Bv4w==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 002713780F7F;
 Thu, 29 Feb 2024 09:07:38 +0000 (UTC)
Date: Thu, 29 Feb 2024 11:07:37 +0200
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
Subject: Re: [PATCH v2 4/9] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <20240229110737.27f03450.pekka.paalanen@collabora.com>
In-Reply-To: <Zd35ddrlHduMq3_Y@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-4-aa6be2827bb7@bootlin.com>
 <20240226133646.174d3fb2.pekka.paalanen@collabora.com>
 <Zd35ddrlHduMq3_Y@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6DRCQ7wMWaURkVZ0DIjl8Y";
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

--Sig_/E6DRCQ7wMWaURkVZ0DIjl8Y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 16:02:13 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 26/02/24 - 13:36, Pekka Paalanen a =C3=A9crit :
> > On Fri, 23 Feb 2024 12:37:24 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> > > compiler to check if the passed functions take the correct arguments.
> > > Such typedefs will help ensuring consistency across the code base in
> > > case of update of these prototypes.
> > >=20
> > > Introduce a check around the get_pixel_*_functions to avoid using a
> > > nullptr as a function.
> > >=20
> > > Document for those typedefs.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_drv.h       | 23 +++++++++++++++++++++--
> > >  drivers/gpu/drm/vkms/vkms_formats.c   |  8 ++++----
> > >  drivers/gpu/drm/vkms/vkms_formats.h   |  4 ++--
> > >  drivers/gpu/drm/vkms/vkms_plane.c     |  9 ++++++++-
> > >  drivers/gpu/drm/vkms/vkms_writeback.c |  9 ++++++++-
> > >  5 files changed, 43 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/v=
kms_drv.h
> > > index 18086423a3a7..886c885c8cf5 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > @@ -53,12 +53,31 @@ struct line_buffer {
> > >  	struct pixel_argb_u16 *pixels;
> > >  };
> > > =20
> > > +/**
> > > + * typedef pixel_write_t - These functions are used to read a pixel =
from a
> > > + * `struct pixel_argb_u16*`, convert it in a specific format and wri=
te it in the @dst_pixels
> > > + * buffer.
> > > + *
> > > + * @dst_pixel: destination address to write the pixel
> > > + * @in_pixel: pixel to write
> > > + */
> > > +typedef void (*pixel_write_t)(u8 *dst_pixels, struct pixel_argb_u16 =
*in_pixel); =20
> >=20
> > There are some inconsistencies in pixel_write_t and pixel_read_t. At
> > this point of the series they still operate on a single pixel, but you
> > use dst_pixels and src_pixels, plural. Yet the documentation correctly
> > talks about processing a single pixel. =20
>=20
> I will fix this for v4.
> =20
> > I would also expect the source to be always const, but that's a whole
> > another patch to change. =20
>=20
> The v4 will contains a new patch "drm/vkms: Use const pointer for=20
> pixel_read and pixel_write functions"

Sounds good!

>=20
> [...]
>=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms=
/vkms_plane.c
> > > index d5203f531d96..f68b1b03d632 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -106,6 +106,13 @@ static void vkms_plane_atomic_update(struct drm_=
plane *plane,
> > >  		return;
> > > =20
> > >  	fmt =3D fb->format->format;
> > > +	pixel_read_t pixel_read =3D get_pixel_read_function(fmt);
> > > +
> > > +	if (!pixel_read) {
> > > +		DRM_WARN("Pixel format is not supported by VKMS planes. State is i=
nchanged\n"); =20
> >=20
> > DRM_WARN() is the kernel equivalent to userspace assert(), right? =20
>=20
> For the DRM_WARN it is just a standard prinkt(KERN_WARN, ...) (hidden=20
> behind drm internal macros).

My concern here is that does hitting this cause additional breakage of
the UAPI contract? For example, the UAPI contract expects that the old
FB is unreffed and the new FB is reffed by the plane in question. If
this early return causes that FB swap to be skipped, it could cause
secondary unexpected failures or misbehaviour for userspace later. That
could mislead debugging to think that there is a userspace bug.

Even if you cannot actually read FB due to an internal bug, it would be
good to still apply all the state changes that the UAPI contract
mandates.

Unless, this is a kernel bug kind of thing which explodes very
verbosely, but DRM_WARN is not that.

> > In that failing the check means an internal invariant was violated,
> > which means a code bug in kernel?
> >
> > Maybe this could be more specific about what invariant was violated?
> > E.g. atomic check should have rejected this attempt already. =20
>=20
> I'm not an expert (yet) in DRM, so please correct me:
> When atomic_update is called, the new state is always validated by=20
> atomic_check before? There is no way to pass something not validated by=20
> atomic_check to atomic_update? If this is the case, yes, it should be an=
=20
> ERROR and not a WARN as an invalid format passed the atomic_check=20
> verification.

I only know about the UAPI, I'm not familiar with kernel internals.

We see that atomic_update returns void, so I think it simply cannot
return errors. To my understanding, atomic_check needs to ensure that
atomic_update cannot fail. There is even UAPI to exercise atomic_check
alone: the atomic commit TEST_ONLY flag. Userspace trusts that flag, and
will not expect an identical atomic commit to fail without TEST_ONLY
when it succeeded with TEST_ONLY.

> If so, is this better?
>=20
> 	if (!pixel_read) {
> 		/*
> 		 * This is a bug as the vkms_plane_atomic_check must forbid all unsuppo=
rted formats.
> 		 */
> 		DRM_ERROR("Pixel format %4cc is not supported by VKMS planes.\n", fmt);
> 		return;
> 	}
>=20
> I will put the same code in vkms_writeback.c.

Maybe maintainers can comment whether even DRM_ERROR is strong enough.

As for the message, what you wrote in the comment is the most important
part that I'd put in the log. It explains what's going on, while that
"format not supported" is a detail without context.


Thanks,
pq

--Sig_/E6DRCQ7wMWaURkVZ0DIjl8Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXgSVkACgkQI1/ltBGq
qqeIVA//UGJudMXFMPhcLKZWaMMfBQ4bIYbGVI/9jlO7pVV9LDJHYnKo6lhpF3bT
L3X3y+yGHcBgHtKp7UdV57srJEkDVqarIh3af/VQJp5cC/cyTr92kdzhf9EoSuwk
kNpxRHMgH5pTqs+6Z8o1PwC0kDdmGqjDefQYPt1VtNZlmZCSaLwK11LbxtaF9iqH
iHOA2z3fdv7Mzm138oZHpeVfMRBuEHJPUk7fVLG55cuyQ6U2pQYi/tjGo7oThKCT
5abXpgBVPyb5YIY5lyYqPQlZGw5lEN/S5DNwz6kHjNLikNBV3aLm5QQap0fzBc4/
Wmai8HP/+o7KBt/2TeLQGljHAdsRQwU3mJBe9qtBzAw59lBMvmf7Y+m3jUK4IlqC
9HUHckaivdtiTw0c004o9i/9MC5HSgnHlhkR+YNGR1P22G0NZaXxFjTRMAcm98Io
gZt2/Qh5S4mJh6nifpjTLcWS45usoaOZbeETzNJKfDpsQcCWVypcHrSq8O+RaSnv
VBQbOXBbdH2K1AtGTTGBnPgAheTWLqPiA4+jEpRGzAQE7ZxwSTLL+oo13ov+AxfP
iOQ6oYdSY5ApM9qxzzJrY6D9LrvIRxVsxwpjuOiBr9t04b1+Gs7c95q0m7u88PN8
H6/Wk70cKfDLGbFKWfjJmOGvypT9L07ZoOWm68DUBR2QaUevqWc=
=xARe
-----END PGP SIGNATURE-----

--Sig_/E6DRCQ7wMWaURkVZ0DIjl8Y--
