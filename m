Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50F8719F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186151129A7;
	Tue,  5 Mar 2024 09:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MCkTNXZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E273E1129A6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709632245;
 bh=KMFx+KOIRHdTvgRE1rFdl6MU1S8WN4skua3ZQBDIpgA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MCkTNXZJwKhAPLx5/eakSNnh0n2u+JyyJ5jxBO4a4rpjUkyoaj0+7xVHWtGXudfC1
 YRSER57tIh/4vlrCbs1H6D3uF4q0AUqEE9BeZvdFW5VaHB3Joom3epk49sFkO9ixP4
 EiyZcZq3gTNu92csFUbt04Yzl2BLKmD2MBVFADepzXcet+4YkHMOdkTyQ7Yy2jr2cB
 V+smfcUegDJwfCc3NYxj9SUySLQr0aK3LKBQwcORXh429vc1sZnWOuVT0XfclG9pHc
 ubfxLdx8xn9tmigOY887bTZByO2BFay2Et5n7IsU8sQUVt+klh2N0Vn+wI1yfpDuO0
 5EGDOtYivtDcg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C39CD378045F;
 Tue,  5 Mar 2024 09:50:44 +0000 (UTC)
Date: Tue, 5 Mar 2024 11:50:43 +0200
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
Message-ID: <20240305115043.37c621ac.pekka.paalanen@collabora.com>
In-Reply-To: <ZeXooEmBN2HHxcCC@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-4-aa6be2827bb7@bootlin.com>
 <20240226133646.174d3fb2.pekka.paalanen@collabora.com>
 <Zd35ddrlHduMq3_Y@localhost.localdomain>
 <20240229110737.27f03450.pekka.paalanen@collabora.com>
 <ZeXooEmBN2HHxcCC@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YpRVZZea_YZU6dU44i_lQeq";
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

--Sig_/YpRVZZea_YZU6dU44i_lQeq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Mar 2024 16:28:32 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 29/02/24 - 11:07, Pekka Paalanen a =C3=A9crit :
> > On Tue, 27 Feb 2024 16:02:13 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > Le 26/02/24 - 13:36, Pekka Paalanen a =C3=A9crit : =20
> > > > On Fri, 23 Feb 2024 12:37:24 +0100
> > > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > >    =20
> > > > > Introduce two typedefs: pixel_read_t and pixel_write_t. It allows=
 the
> > > > > compiler to check if the passed functions take the correct argume=
nts.
> > > > > Such typedefs will help ensuring consistency across the code base=
 in
> > > > > case of update of these prototypes.
> > > > >=20
> > > > > Introduce a check around the get_pixel_*_functions to avoid using=
 a
> > > > > nullptr as a function.
> > > > >=20
> > > > > Document for those typedefs.
> > > > >=20
> > > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_drv.h       | 23 +++++++++++++++++++++=
--
> > > > >  drivers/gpu/drm/vkms/vkms_formats.c   |  8 ++++----
> > > > >  drivers/gpu/drm/vkms/vkms_formats.h   |  4 ++--
> > > > >  drivers/gpu/drm/vkms/vkms_plane.c     |  9 ++++++++-
> > > > >  drivers/gpu/drm/vkms/vkms_writeback.c |  9 ++++++++-
> > > > >  5 files changed, 43 insertions(+), 10 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vk=
ms/vkms_drv.h
> > > > > index 18086423a3a7..886c885c8cf5 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > > @@ -53,12 +53,31 @@ struct line_buffer {
> > > > >  	struct pixel_argb_u16 *pixels;
> > > > >  };
> > > > > =20
> > > > > +/**
> > > > > + * typedef pixel_write_t - These functions are used to read a pi=
xel from a
> > > > > + * `struct pixel_argb_u16*`, convert it in a specific format and=
 write it in the @dst_pixels
> > > > > + * buffer.
> > > > > + *
> > > > > + * @dst_pixel: destination address to write the pixel
> > > > > + * @in_pixel: pixel to write
> > > > > + */
> > > > > +typedef void (*pixel_write_t)(u8 *dst_pixels, struct pixel_argb_=
u16 *in_pixel);   =20
> > > >=20
> > > > There are some inconsistencies in pixel_write_t and pixel_read_t. At
> > > > this point of the series they still operate on a single pixel, but =
you
> > > > use dst_pixels and src_pixels, plural. Yet the documentation correc=
tly
> > > > talks about processing a single pixel.   =20
> > >=20
> > > I will fix this for v4.
> > >   =20
> > > > I would also expect the source to be always const, but that's a who=
le
> > > > another patch to change.   =20
> > >=20
> > > The v4 will contains a new patch "drm/vkms: Use const pointer for=20
> > > pixel_read and pixel_write functions" =20
> >=20
> > Sounds good!
> >  =20
> > >=20
> > > [...]
> > >  =20
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/=
vkms/vkms_plane.c
> > > > > index d5203f531d96..f68b1b03d632 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > > @@ -106,6 +106,13 @@ static void vkms_plane_atomic_update(struct =
drm_plane *plane,
> > > > >  		return;
> > > > > =20
> > > > >  	fmt =3D fb->format->format;
> > > > > +	pixel_read_t pixel_read =3D get_pixel_read_function(fmt);
> > > > > +
> > > > > +	if (!pixel_read) {
> > > > > +		DRM_WARN("Pixel format is not supported by VKMS planes. State =
is inchanged\n");   =20
> > > >=20
> > > > DRM_WARN() is the kernel equivalent to userspace assert(), right?  =
 =20
> > >=20
> > > For the DRM_WARN it is just a standard prinkt(KERN_WARN, ...) (hidden=
=20
> > > behind drm internal macros). =20
> >=20
> > My concern here is that does hitting this cause additional breakage of
> > the UAPI contract? For example, the UAPI contract expects that the old
> > FB is unreffed and the new FB is reffed by the plane in question. If
> > this early return causes that FB swap to be skipped, it could cause
> > secondary unexpected failures or misbehaviour for userspace later. That
> > could mislead debugging to think that there is a userspace bug.
> >
> > Even if you cannot actually read FB due to an internal bug, it would be
> > good to still apply all the state changes that the UAPI contract
> > mandates.
> >=20
> > Unless, this is a kernel bug kind of thing which explodes very
> > verbosely, but DRM_WARN is not that. =20
>=20
> You are right. In this case I maybe can just create a dummy=20
> "pixel_read" which always return black? (The v4 will have it so you can=20
> see how it look)
>=20
> This way, I can:
> - keep the check and avoid null function pointers (and OOPS);
> - log (WARN, DRM_WARN, DRM_ERROR or whatever suggested by DRM maintainers=
=20
> to warn very loudly);
> - Apply the requested change from userspace (and don't break the UAPI=20
> contract).
>=20
> The resulting behavior will be "the virtual plane is black", which is, I
> think, not very important. As the primary usage of VKMS is testing, it
> will just broke all the tests, and a quick look at the kernel logs will
> show this bug.

That's fine by me. After all, atomic check should have already
prevented this, and this can only happen due to a kernel bug AFAIU.


> > > > In that failing the check means an internal invariant was violated,
> > > > which means a code bug in kernel?
> > > >
> > > > Maybe this could be more specific about what invariant was violated?
> > > > E.g. atomic check should have rejected this attempt already.   =20
> > >=20
> > > I'm not an expert (yet) in DRM, so please correct me:
> > > When atomic_update is called, the new state is always validated by=20
> > > atomic_check before? There is no way to pass something not validated =
by=20
> > > atomic_check to atomic_update? If this is the case, yes, it should be=
 an=20
> > > ERROR and not a WARN as an invalid format passed the atomic_check=20
> > > verification. =20
> >=20
> > I only know about the UAPI, I'm not familiar with kernel internals.
> >=20
> > We see that atomic_update returns void, so I think it simply cannot
> > return errors. To my understanding, atomic_check needs to ensure that
> > atomic_update cannot fail. There is even UAPI to exercise atomic_check
> > alone: the atomic commit TEST_ONLY flag. Userspace trusts that flag, and
> > will not expect an identical atomic commit to fail without TEST_ONLY
> > when it succeeded with TEST_ONLY. =20
>=20
> That my understanding of the UAPI/DRM internals too, is my suggestion=20
> above sufficient? It will always succeed, no kernel OOPS.
>=20
> > > If so, is this better?
> > >=20
> > > 	if (!pixel_read) {
> > > 		/*
> > > 		 * This is a bug as the vkms_plane_atomic_check must forbid all uns=
upported formats.
> > > 		 */
> > > 		DRM_ERROR("Pixel format %4cc is not supported by VKMS planes.\n", f=
mt);
> > > 		return;
> > > 	}
> > >=20
> > > I will put the same code in vkms_writeback.c. =20
> >=20
> > Maybe maintainers can comment whether even DRM_ERROR is strong enough.
> >=20
> > As for the message, what you wrote in the comment is the most important
> > part that I'd put in the log. It explains what's going on, while that
> > "format not supported" is a detail without context.
> >  =20
>=20
> Is something like this better?
>=20
> 	/*
> 	 * This is a bug in vkms_plane_atomic_check. All the supported=20
> 	 * format must:
> 	 * - Be listed in vkms_formats
> 	 * - Have a pixel_read_line callback
> 	 */
> 	WARN(true, "Pixel format %4cc is not supported by VKMS planes. This is a=
 kernel bug. Atomic check must forbid this configuration.\n", fmt)
>=20

Sure.


Thanks,
pq

--Sig_/YpRVZZea_YZU6dU44i_lQeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXm6vMACgkQI1/ltBGq
qqd3/Q//Yd9AS7sYeVmgNrGGCqPWJJyneQIf3ozGpA7hl2Qga8bb/q6WXhtgZ9dk
F98TMwLx8RmvEvSndojPROvNKeXu4nXCQcKKCF6flrfNBMNcB4rRtxRMYF2mZHfF
iyarkFI1iZ4lXxRzE7fKcQwj4oKTR5ZOWai+IGuYyzBfRs/IdshE1ikrNqqtzmE5
XQ44sd5dEOc6T50fvhhbo5cxZHZP6MqlRtV8aLLCf4rXan8qrrIhlqyJNrCHpZAB
rep9rWx9CBIf7vSdiwy/WqChauGKUtxeqXkFtBlKdl/seM4u0OIg+GIA2AnDVfK2
t9DvklSe+eYavPNy4aN8nwGR0vLDBkOOVflXZpqR4lKY6VD4iL7WSF7jtTDprnfk
OVy2XNnyIgkFY+w+zCnOBRhdYw7JdCNY390XHEgxrhjTYv7SrZfG0W7Nn/3HT64F
lCNlqTthKgfYpNMsB5ajNAVqIcDXHVvjQXK3k65E88nzrFw3LvgMbEY/tB5uJY6W
TQrvvWAn6YsxVCMzqBnFxdfBerSje2WccTorubbXqpGN8/sLmhrzFPj1VDtd/t5a
1G/uorVPw1w+7b7V8n/KsgMvqESxMxA5da6aHA6weavnjT01aaPDaUNdfSLMWilJ
WCpT3+W6nLqc+rmKHIEMQpCMxMDtYVPEcGAlu1pQHOE2YJPoIqc=
=ELaR
-----END PGP SIGNATURE-----

--Sig_/YpRVZZea_YZU6dU44i_lQeq--
