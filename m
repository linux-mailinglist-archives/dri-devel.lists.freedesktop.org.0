Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB58749E8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7553210FB6F;
	Thu,  7 Mar 2024 08:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hIaGTcnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D434C10FB6F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709800925;
 bh=USUiqAvoGE7+o32wLO4tteQywvAAkmi4uCjZ933thpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hIaGTcnAXu2fNJovHDNfdIqUYvHUrZdK53yYmGa8Vuyz9o92DcK6AnN+avS0VEamv
 YlecSnAJ1TYYZeWUBw9kOL8UgXu7PO5zt4Dq5B2NO/x839ghanCJigMBWlafPBbPyN
 TfS3zQVNK2jEqJDurWSgjym+1JUSiSRRi/d9mQj5KMAcEwdTXQ5Haq2CEB8csckHGz
 kBYQKeRUIo+faEDpnWdZiSX0yurjio4tpQ/Z2dvwa5oqfkdzHipcYWrjnNcZvETlOs
 0O0iwGhOHOIEAMzD1hYABbi93gDSq8FoWT72OLiAQsU0D70T07p/3egNntmVhl4pRU
 dEAPF0SDfQEtw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7D0C43781FDF;
 Thu,  7 Mar 2024 08:42:04 +0000 (UTC)
Date: Thu, 7 Mar 2024 10:42:03 +0200
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
Message-ID: <20240307104203.72855d2a.pekka.paalanen@collabora.com>
In-Reply-To: <ZeioEcyCo4XKHHX8@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-3-aa6be2827bb7@bootlin.com>
 <20240226133700.3fef91d9.pekka.paalanen@collabora.com>
 <Zd35cimh8BLICUuY@localhost.localdomain>
 <20240229104833.2a404d6b.pekka.paalanen@collabora.com>
 <ZeXonl-jZq4xHnBK@localhost.localdomain>
 <20240305115007.0d0d49ef.pekka.paalanen@collabora.com>
 <ZeioEcyCo4XKHHX8@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nkji33S6ZRTzPKMkx=bO7ep";
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

--Sig_/nkji33S6ZRTzPKMkx=bO7ep
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Mar 2024 18:29:53 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> [...]
>=20
> > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > > > > @@ -9,6 +9,17 @@
> > > > > > > =20
> > > > > > >  #include "vkms_formats.h"
> > > > > > > =20
> > > > > > > +/**
> > > > > > > + * packed_pixels_offset() - Get the offset of the block cont=
aining the pixel at coordinates x/y
> > > > > > > + * in the first plane
> > > > > > > + *
> > > > > > > + * @frame_info: Buffer metadata
> > > > > > > + * @x: The x coordinate of the wanted pixel in the buffer
> > > > > > > + * @y: The y coordinate of the wanted pixel in the buffer
> > > > > > > + *
> > > > > > > + * The caller must be aware that this offset is not always a=
 pointer to a pixel. If individual
> > > > > > > + * pixel values are needed, they have to be extracted from t=
he resulting block.     =20
> > > > > >=20
> > > > > > Just wondering how the caller will be able to extract the right=
 pixel
> > > > > > from the block without re-using the knowledge already used in t=
his
> > > > > > function. I'd also expect the function to round down x,y to be
> > > > > > divisible by block dimensions, but that's not visible in this e=
mail.
> > > > > > Then the caller needs the remainder from the round-down, too?  =
   =20
> > > > >=20
> > > > > You are right, the current implementation is only working when bl=
ock_h =3D=3D=20
> > > > > block_w =3D=3D 1. I think I wrote the documentation for PATCHv2 5=
/9, but when=20
> > > > > backporting this comment for PATCHv2 3/9 I forgot to update it.
> > > > > The new comment will be:
> > > > >=20
> > > > >  * pixels_offset() - Get the offset of a given pixel data at coor=
dinate=20
> > > > >  * x/y in the first plane
> > > > >    [...]
> > > > >  * The caller must ensure that the framebuffer associated with th=
is=20
> > > > >  * request uses a pixel format where block_h =3D=3D block_w =3D=
=3D 1.
> > > > >  * If this requirement is not fulfilled, the resulting offset can=
 be=20
> > > > >  * completly wrong.   =20
> > > >=20
> > > > Hi Louis,   =20
> > >=20
> > > Hi Pekka,
> > >  =20
> > > > if there is no plan for how non-1x1 blocks would work yet, then I t=
hink
> > > > the above wording is fine. In my mind, the below wording would
> > > > encourage callers to seek out and try arbitrary tricks to make thin=
gs
> > > > work for non-1x1 without rewriting the function to actually work.
> > > >
> > > > I believe something would need to change in the function signature =
to
> > > > make it properly usable for non-1x1 blocks, but I too cannot suggest
> > > > anything off-hand.   =20
> > >=20
> > > I already made the change to support non-1x1 blocks in Patchv2 5/9=20
> > > (I will extract this modification in "drm/vkms: Update pixels accesso=
r to=20
> > > support packed and multi-plane formats"), this function is now able=20
> > > to extract the pointer to the start of a block. But as stated in the=
=20
> > > comment, the caller must manually extract the correct pixel values (i=
f the=20
> > > format is 2x2, the pointer will point to the first byte of this block=
, the=20
> > > caller must do some computation to access the bottom-right value). =20
> >=20
> > Patchv2 5/9 is not enough.
> >=20
> > "Manually extract the correct pixels" is the thing I have a problem
> > with here. The caller should not need to re-do any semantic
> > calculations this function already did. Most likely this function
> > should return the remainders from the x,y coordinate division, so that
> > the caller can extract the right pixels from the block, or something
> > else equivalent.
> >=20
> > That same semantic division should not be done in two different places.
> > It is too easy for someone later to come and change one site while
> > missing the other. =20
>=20
> I did not notice this, and I agree, thanks for this feedback. For the v5 =
I=20
> will change it and update the function signature to:
>=20
> static void packed_pixels_offset(const struct vkms_frame_info *frame_info=
, int x, int y,
> 				 size_t plane_index, size_t *offset, size_t *rem_x, size_t *rem_y)
>=20
> where rem_x and rem_y are those reminder.

Ok, that's a start.

Why size_t? It's unsigned. You'll probably be mixing signed and
unsigned variables in computations again.

> > I have a hard time finding in "[PATCH v2 6/9] drm/vkms: Add YUV
> > support" how you actually handle blocks bigger than 1x1. I see
> > get_subsampling() which returns format->{hsub,vsub}, and I see
> > get_subsampling_offset() which combined with remainder-division gates U
> > and V plane pixel pointer increments.
> >=20
> > However, I do not see you ever using
> > drm_format_info_block_{width,height}() anywhere else. That makes me
> > think you have no code to actually handle non-1x1 block formats, which
> > means that you cannot get the function signature of
> > packed_pixels_offset() right in this series either. It would be better
> > to not even pretend the function works for non-1x1 blocks until you
> > have code handling at least one such format.
> >=20
> > All of the YUV formats that patch 6 adds support for use 1x1 blocks all
> > all their planes. =20
>=20
> Yes, none of the supported format have block_h !=3D block_w !=3D 1, so th=
ere=20
> is no need to drm_format_info_block*() helpers.
>=20
> I wrote the code for DRM_FORMAT_R*. They are packed, with block_w !=3D 1.=
 I=20
> will add this patch in the next revision. I also wrote the IGT test for=20
> DRM_FORMAT_R1 [1].

Excellent!

> Everything will be in the v5 (I will send it when you have the=20
> time to review the v4).

I'm too busy this week, I think. Maybe next.

Why should I review v4 when I already know you will be changing things
again? I'd probably flag the same things I've already said.


Thanks,
pq

> For information, I also have a series ready for adding more RGB variants
> (I introduced a macro to make it easier and avoid copy/pasting the same
> loop). I don't send them yet, because I realy want this series merged=20
> first. I also have the work for the writeback "line-by-line" algorithm=20
> ready (I just need to rebase it, but it will be fast).
>=20
> [1]: https://lore.kernel.org/igt-dev/20240306-b4-kms_tests-v1-0-8fe451efd=
2ac@bootlin.com
>=20
> Kind regards,
> Louis Chauvet
>=20
> [...]
>=20


--Sig_/nkji33S6ZRTzPKMkx=bO7ep
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXpfdsACgkQI1/ltBGq
qqdiCA//R0EDhfyntzvtK1HCEb2lMdMVQMtVu0twsiUfLRYWnxwmVtTnoBC4C1oX
VW1hAXvdhnVgXP97Uilb2jl5OW6OSetYnDEWb/HXhquitJkbwBCVieKWJQwnHUe3
dVIJEYoUPqW4UAMtYRHrC22bN0aW0SAUGvnnIzIpX17Zh+hVNjfqOw8gCfAq3PyA
27ycXSUzmf9AZ0orOnBdemaGRsyynJLPChEnidfwlH4kTE3Cco1GB+sbjusJd+Mh
LmLxyTy0AOJlXVeDQCu4Rqtznm1g8yhv0QfmUl+N3fUKwccn7W/ytuQR9Arjku38
idDLqzSQEKU0dts8EBO6BuOhVSvp5IBTOp9cudR37QjI2F2s1DjGbMnhe+If+v8Y
2hAu3Kq8i7EWjiR66gC6hb4v+m2up0BPPIwvjSEi3t6vlgkkNOSCwghYUcxqQPot
k6tCnGzBTnfPu/jUQd0S7YwTSpFYVnLLgU3rpSQ5Aat3yqYXP0fbR6n0uvaUQidh
NS98joH/XT5UKPrgOXIGHiOuUk3SYGQOqvRrSFmDp9Mdh/P1kX9UWypTfJTZXAEd
EQxhGPXiAGtCC8F3i9oqBt3kGbSFMCMFHvNeWNDZGhptlt6YZETSSKHigDoa9QSv
Fn9gdFQg0UgSzB9Xev5vKHk+ivXH/F3H26Afh7HEMv9jzQEcnE0=
=hf3I
-----END PGP SIGNATURE-----

--Sig_/nkji33S6ZRTzPKMkx=bO7ep--
