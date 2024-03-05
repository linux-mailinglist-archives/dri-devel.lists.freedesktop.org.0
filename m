Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EF28719F1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828711218F;
	Tue,  5 Mar 2024 09:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BDd36TWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232DC11218F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709632217;
 bh=QlVWu0FHKqLe2nd73wbmRIwRCysZqY2M6BIRgLAYnZ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BDd36TWIKwIJxpECtJQfLORGGe/31Ihz6wRzqNouFnPKYlH3SmI5eD9a3AFfeWJFd
 2ObU59iWVL/whIpnxHxEHVsMiRO3KIpfnYccyhwnNtg5XtbKHfkTa0uEAE6bbMVAgf
 d9kO2eZNIgkfNviOackFpbkOgZxDf8pMjWUzRpW/yCP6UInPQeaQ+AcnKMDQCH2uGF
 kwtSZzvo8tOedleUzLPToPTMJKk2vvs7zks2DFLvqLl+EtYtJU9xvOR6gOVMQ4/5vL
 O1SphRDHpaOrXAYzwwpYMPsZeYYGRlJYhK3sfo3oxkw2POHZxFNp3nCJ+IR6sGG7o3
 y9uSHUwq/7W8Q==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0BD03378045F;
 Tue,  5 Mar 2024 09:50:15 +0000 (UTC)
Date: Tue, 5 Mar 2024 11:50:07 +0200
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
Subject: Re: [PATCH v2 3/9] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <20240305115007.0d0d49ef.pekka.paalanen@collabora.com>
In-Reply-To: <ZeXonl-jZq4xHnBK@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-3-aa6be2827bb7@bootlin.com>
 <20240226133700.3fef91d9.pekka.paalanen@collabora.com>
 <Zd35cimh8BLICUuY@localhost.localdomain>
 <20240229104833.2a404d6b.pekka.paalanen@collabora.com>
 <ZeXonl-jZq4xHnBK@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ABiKPnAn/I3xGHmKgaCEo_S";
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

--Sig_/ABiKPnAn/I3xGHmKgaCEo_S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Mar 2024 16:28:30 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 29/02/24 - 10:48, Pekka Paalanen a =C3=A9crit :
> > On Tue, 27 Feb 2024 16:02:10 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > [...]
> > >  =20
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/dr=
m/vkms/vkms_formats.c
> > > > > index 172830a3936a..cb7a49b7c8e7 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > > @@ -9,6 +9,17 @@
> > > > > =20
> > > > >  #include "vkms_formats.h"
> > > > > =20
> > > > > +/**
> > > > > + * packed_pixels_offset() - Get the offset of the block containi=
ng the pixel at coordinates x/y
> > > > > + * in the first plane
> > > > > + *
> > > > > + * @frame_info: Buffer metadata
> > > > > + * @x: The x coordinate of the wanted pixel in the buffer
> > > > > + * @y: The y coordinate of the wanted pixel in the buffer
> > > > > + *
> > > > > + * The caller must be aware that this offset is not always a poi=
nter to a pixel. If individual
> > > > > + * pixel values are needed, they have to be extracted from the r=
esulting block.   =20
> > > >=20
> > > > Just wondering how the caller will be able to extract the right pix=
el
> > > > from the block without re-using the knowledge already used in this
> > > > function. I'd also expect the function to round down x,y to be
> > > > divisible by block dimensions, but that's not visible in this email.
> > > > Then the caller needs the remainder from the round-down, too?   =20
> > >=20
> > > You are right, the current implementation is only working when block_=
h =3D=3D=20
> > > block_w =3D=3D 1. I think I wrote the documentation for PATCHv2 5/9, =
but when=20
> > > backporting this comment for PATCHv2 3/9 I forgot to update it.
> > > The new comment will be:
> > >=20
> > >  * pixels_offset() - Get the offset of a given pixel data at coordina=
te=20
> > >  * x/y in the first plane
> > >    [...]
> > >  * The caller must ensure that the framebuffer associated with this=20
> > >  * request uses a pixel format where block_h =3D=3D block_w =3D=3D 1.
> > >  * If this requirement is not fulfilled, the resulting offset can be=
=20
> > >  * completly wrong. =20
> >=20
> > Hi Louis, =20
>=20
> Hi Pekka,
>=20
> > if there is no plan for how non-1x1 blocks would work yet, then I think
> > the above wording is fine. In my mind, the below wording would
> > encourage callers to seek out and try arbitrary tricks to make things
> > work for non-1x1 without rewriting the function to actually work.
> >
> > I believe something would need to change in the function signature to
> > make it properly usable for non-1x1 blocks, but I too cannot suggest
> > anything off-hand. =20
>=20
> I already made the change to support non-1x1 blocks in Patchv2 5/9=20
> (I will extract this modification in "drm/vkms: Update pixels accessor to=
=20
> support packed and multi-plane formats"), this function is now able=20
> to extract the pointer to the start of a block. But as stated in the=20
> comment, the caller must manually extract the correct pixel values (if th=
e=20
> format is 2x2, the pointer will point to the first byte of this block, th=
e=20
> caller must do some computation to access the bottom-right value).

Patchv2 5/9 is not enough.

"Manually extract the correct pixels" is the thing I have a problem
with here. The caller should not need to re-do any semantic
calculations this function already did. Most likely this function
should return the remainders from the x,y coordinate division, so that
the caller can extract the right pixels from the block, or something
else equivalent.

That same semantic division should not be done in two different places.
It is too easy for someone later to come and change one site while
missing the other.

I have a hard time finding in "[PATCH v2 6/9] drm/vkms: Add YUV
support" how you actually handle blocks bigger than 1x1. I see
get_subsampling() which returns format->{hsub,vsub}, and I see
get_subsampling_offset() which combined with remainder-division gates U
and V plane pixel pointer increments.

However, I do not see you ever using
drm_format_info_block_{width,height}() anywhere else. That makes me
think you have no code to actually handle non-1x1 block formats, which
means that you cannot get the function signature of
packed_pixels_offset() right in this series either. It would be better
to not even pretend the function works for non-1x1 blocks until you
have code handling at least one such format.

All of the YUV formats that patch 6 adds support for use 1x1 blocks all
all their planes.


Thanks,
pq

> > >=20
> > > And yes, even after PATCHv2 5/9 it is not clear what is the offset. I=
s=20
> > > this better to replace the last sentence? (I will do the same update =
for=20
> > > the last sentence of packed_pixels_addr)
> > >=20
> > >    [...]
> > >  * The returned offset correspond to the offset of the block containi=
ng the pixel at coordinates=20
> > >  * x/y.
> > >  * The caller must use this offset with care, as for formats with blo=
ck_h !=3D 1 or block_w !=3D 1=20
> > >  * the requested pixel value may have to be extracted from the block,=
 even if they are=20
> > >  * individually adressable.
> > >   =20
> > > > > + */
> > > > >  static size_t pixel_offset(const struct vkms_frame_info *frame_i=
nfo, int x, int y)
> > > > >  {
> > > > >  	struct drm_framebuffer *fb =3D frame_info->fb;
> > > > > @@ -17,12 +28,13 @@ static size_t pixel_offset(const struct vkms_=
frame_info *frame_info, int x, int
> > > > >  			      + (x * fb->format->cpp[0]);
> > > > >  }
> > > > >     =20

--Sig_/ABiKPnAn/I3xGHmKgaCEo_S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXm6s8ACgkQI1/ltBGq
qqeJ6A//X5c4O/gvq713sAEFROqjwbtVYg2hZh17JIPjUEhwrIK6cv/8byGu15Rq
La5oQTh61QfErIGIJR7u6bC+jgtXnq34zz1YnU9EMLu2tBx7nCT+5J1W5RalRpBq
purZwl48g72JhgoAr/irZnRee3+wA9uDAPOp0O+RavzypeS2YcGTQYTADUeQB/7Y
Ndp+cOmAIjk57En0ybCUK1ZxY0uKL6gOVt3azum0o85/rhFcunU6MGBvZisdiXUD
/Cc0+7lYUZSdO1SsV7HUvKQXiXsdzLch1XWgVubAp7Ib28EbQIBpuT1EMt4vKOCa
xSW/bHVbBzYDY4gNc+MxIFwdubAxzJfzMQOSsnVgiQlMMqSOS3PUeE8PIfMiozym
B98hX22IEsCFAIO0rwEyy/Ar/LJLLsxEoy3L598j4sNs3V/WOSAUbdaj/9BTabRJ
H9SKj1ZPrWEBKmN7JNV6/Jhqnl7JrcjV6ry/oOeuaHwAMkNVNW0HA2NkX4R1KHaR
UIuKUmr8b9H7qaH59tiJQ/UzVLuLazo9GkhxAp5RuxXQNWzvv0+zTBzznCWE8Pf3
ilc+XjS/Ok5nDeRrO6iqA8K6v1ub4gnkp7eBw4JLJlUs11i6EB4mk963FEJwV1HL
4RK8ojl2CwzrxtJ+aB20VOkcGlrxwpIZG2G2Ah5NMgo62IQkV5Y=
=79mw
-----END PGP SIGNATURE-----

--Sig_/ABiKPnAn/I3xGHmKgaCEo_S--
