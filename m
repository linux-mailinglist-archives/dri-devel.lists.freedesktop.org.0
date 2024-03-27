Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263388E157
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE83C10E87E;
	Wed, 27 Mar 2024 12:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EOcOp85j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA8E10E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711544359;
 bh=KuIKkEx2FN2gJJ0JnEltYYk/kEe8H+S/yJvDKKOeFU8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EOcOp85jf6rE2+8kld3RSHYY3MypF1Cj87X/jiNuA8IMP7B+e6dVu8V6GfpoVKb9E
 vM4QRpy0ldrH1VumFe03WXRERLdnRkE0dBLanmra69rPfvo8KT9wkKS4ieBDEIJnjH
 8g0vh3IGQPXmjp3/YTWDDOrqDVSYuKTt4p0vs37EyAyERx7MJYbZbfIvfj7IU09fkm
 ay3CQX9qdde2TYjK2EZsRzb/6PyFoNXQJjMfr1xZBWxbv/lb/SnWBMVFGCDN8ACN4i
 hD59+VKkT5dBORhuVys1BG1ZRExemFUz0ljkuAwbT0tMhBMAD8MghgDJKDiiJmyYs7
 rG2JmAvlkDq+w==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2EB7B37811CD;
 Wed, 27 Mar 2024 12:59:18 +0000 (UTC)
Date: Wed, 27 Mar 2024 14:59:16 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Message-ID: <20240327145916.6a9d9998.pekka.paalanen@collabora.com>
In-Reply-To: <ZgLwT2Kkax8cJEhz@localhost.localdomain>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
 <e5d8297f-3e1f-459f-bef2-3a91f2caf94f@igalia.com>
 <ZgLwT2Kkax8cJEhz@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3F4ZuOcBoEqlm+d7_/Z5vFu";
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

--Sig_/3F4ZuOcBoEqlm+d7_/Z5vFu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Mar 2024 16:57:03 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 25/03/24 - 11:26, Ma=C3=ADra Canal a =C3=A9crit :
> > On 3/13/24 14:45, Louis Chauvet wrote: =20
> > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > >=20
> > > Add support to the YUV formats bellow:
> > >=20
> > > - NV12/NV16/NV24
> > > - NV21/NV61/NV42
> > > - YUV420/YUV422/YUV444
> > > - YVU420/YVU422/YVU444
> > >=20
> > > The conversion from yuv to rgb is done with fixed-point arithmetic, u=
sing
> > > 32.32 floats and the drm_fixed helpers.
> > >=20
> > > To do the conversion, a specific matrix must be used for each color r=
ange
> > > (DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored=
 in
> > > the `conversion_matrix` struct, along with the specific y_offset need=
ed.
> > > This matrix is queried only once, in `vkms_plane_atomic_update` and
> > > stored in a `vkms_plane_state`. Those conversion matrices of each
> > > encoding and range were obtained by rounding the values of the origin=
al
> > > conversion matrices multiplied by 2^32. This is done to avoid the use=
 of
> > > floating point operations.
> > >=20
> > > The same reading function is used for YUV and YVU formats. As the only
> > > difference between those two category of formats is the order of fiel=
d, a
> > > simple swap in conversion matrix columns allows using the same functi=
on.
> > >=20
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > [Louis Chauvet:
> > > - Adapted Arthur's work
> > > - Implemented the read_line_t callbacks for yuv
> > > - add struct conversion_matrix
> > > - remove struct pixel_yuv_u8
> > > - update the commit message
> > > - Merge the modifications from Arthur] =20
> >=20
> > A Co-developed-by tag would be more appropriate. =20
>=20
> I am not the main author of this part, I only applied a few simple=20
> suggestions, the complex part was done by Arthur.
>=20
> I will wait for Arthur's confirmation to change it to Co-developed by if
> he agrees.

Co-developed-by is an additional tag, and does not replace S-o-b. To my
understanding, the kernel rules and Developers' Certificate of Origin
require S-o-b to be added by anyone who has taken a patch and
re-submitted it, regardless of who the original author is, and
especially if the patch was modified.

Personally I also like to keep the list of changes like Louis added, to
credit people better.

> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >   drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
> > >   drivers/gpu/drm/vkms/vkms_formats.c | 431 +++++++++++++++++++++++++=
+++++++++++
> > >   drivers/gpu/drm/vkms/vkms_formats.h |   4 +
> > >   drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
> > >   4 files changed, 473 insertions(+), 1 deletion(-)
> > >=20

...

> > >   };
> > >  =20
> > >   static struct drm_plane_state *
> > > @@ -117,12 +129,15 @@ static void vkms_plane_atomic_update(struct drm=
_plane *plane,
> > >   	drm_framebuffer_get(frame_info->fb);
> > >   	frame_info->rotation =3D drm_rotation_simplify(new_state->rotation=
, DRM_MODE_ROTATE_0 |
> > >   									  DRM_MODE_ROTATE_90 |
> > > +									  DRM_MODE_ROTATE_180 | =20
> >=20
> > Why do we need to add DRM_MODE_ROTATE_180 here? Isn't the same as
> > reflecting both along the X and Y axis? =20
>=20
> Oops, I had no intention of putting that change here. I will move it to=20
> another patch.
>=20
> I don't understand why DRM_MODE_ROTATE_180 isn't in this list. If I read=
=20
> the drm_rotation_simplify documentation, it explains that this argument=20
> should contain all supported rotations and reflections, and ROT_180 is=20
> supported by VKMS. Perhaps this call is unnecessary because all=20
> combinations are supported by vkms?

If you truly handle all bit patterns that the rotation bitfield can
have, then yes, the call seems unnecessary.

However, as documented, the bitfield contains redundancy: the same
orientation can be expressed in more than one bit pattern. One example
is that ROTATE_180 is equivalent to REFLECT_X | REFLECT_Y.

Since it's a bitmask, userspace can give you funny values like
ROTATE_0 | ROTATE_90 | ROTATE_180. That is a valid orientation of
270-degree rotation (according to UAPI doc), but it is very awkwardly
expressed, hence the need to normalise it into a minimal bit pattern.

It does not look like drm_rotation_simplify() actually does this
minimisation!

I was not able to tell if DRM common code actually stops userspace from
combining multiple ROTATE bits in the same value. I suspect it must
stop them, or perhaps all code dealing with rotation is actually broken.

drm_rotation_simplify() is useful for cases where your hardware does
not have exactly the same flexibility. Maybe it cannot do REFLECT_Y but
it can do everything else? Then drm_rotation_simplify() gives you a bit
pattern that you can use directly, or fails if the orientation is not
representable with what your hardware can do.

At least, that's my understanding of quickly glancing over it.

IOW, if you wanted to never have to deal with REFLECT_Y bit, you could
leave it out here. Or, if you never want to deal with ROTATE_180, leave
that out - you will get REFLECT_X | REFLECT_Y instead. In theory.


Thanks,
pq

--Sig_/3F4ZuOcBoEqlm+d7_/Z5vFu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYEGCQACgkQI1/ltBGq
qqeHVw/+LAnSqO/H67KZLln0BM4bxFm/xL3LxsplHKSYvq/8eyVj+wNcEcYMWL1a
Ua7UppRcOEReIac3euHFMJVM2WS8aEUyKQYlypA9FV44czxGdzW40/lev7Zxvbib
pOipcoKOI3XK1SbUHRa48PcdaTfG4zWcxeRoJVAuRmDtXLMdjo55codKjrRlsJ0s
gDO2ZlhkBrXBuzPxy1tLF99gwPXF6U7tcScA8AvSdwlq2Wo728Yy9pAl4Y/PPRYF
QHUi5r1TBThqmvsTW6/Jd3Vldx3gSiSfsMe8wamLiK+2twRB9A+SLTi1L32JjUZh
DAflyGuxIyeQrFPAGcHKytob6KbXTrvauvOALr39KnokoNRjOlldW4o1iPGvWwdm
KpW+71gRr20BcLcX565rtspIjshVJ7iwAUCAE4XME9o05Fl6/hby1ef6v7AvQdd8
x94wwt4zOhK+Yr0rxfFYijTveRbWUSVDy0mxejXsYYG4ACATToq6khWthPa61Me6
u6XTnFQOKTnao/jt9dnHHFO0cKwTFZwct31e0JT5bmfWIhRBcWvDpxFIvULxO90F
vt3a7rxKjZ5jZ7XQezFEr7D/cLz9BxdlUwAjpjDEM7lmiiMr+wskzQdhoBLBqDlS
5jGItXeZtf7rqGqEXAmd2kTOJRKvQRnMAZw2IaP3mjPnrctvpCo=
=HnCy
-----END PGP SIGNATURE-----

--Sig_/3F4ZuOcBoEqlm+d7_/Z5vFu--
