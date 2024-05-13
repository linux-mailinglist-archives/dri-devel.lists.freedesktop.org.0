Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBC8C3F94
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 13:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864410E652;
	Mon, 13 May 2024 11:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YRq/UkVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54B510E652
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715598900;
 bh=7iUwfobNnT2nxOvxAP5Xkuao5iOl4azg6uUFMsPAI3U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YRq/UkVolqToE0Zlrc+rL7szh0o3Mmcpdfa+NnBhXsC30vub2FeUMwrM8yn5EjDGL
 V+PfcEEKojXLPVlMlxk1OW5grEeA/hJe5C1K48msL6ZnZ5LG+MypjGgaLy1OmTg3Ws
 MMAtX2eudEklJUbfqoCuMpxVociOK8AIDWpUKWb9mw74T6qq8SbccupIFvyu8gtuG0
 5bpoFcBE8xowQHlzh7fEC6Et2A3h8yWm5KK+4C6h6hgqJa/1f6SBJI51/eRP0PyI9V
 1mFT4svPol6d82/CoPqkzvHYEYOut3r8VANa1zrQQyGpdiHQUz4b1hGQzgX9e1mMML
 tIBDM3UXiDa+Q==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B764378212E;
 Mon, 13 May 2024 11:14:58 +0000 (UTC)
Date: Mon, 13 May 2024 14:14:49 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 07/17] drm/vkms: Update pixels accessor to support
 packed and multi-plane formats.
Message-ID: <20240513141449.662ea39d.pekka.paalanen@collabora.com>
In-Reply-To: <ZkG-AYWvyA1QOLHZ@localhost.localdomain>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-7-de1c5728fd70@bootlin.com>
 <20240422140757.576e363b.pekka.paalanen@collabora.com>
 <ZkG-AYWvyA1QOLHZ@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+HtRlSbEj54KW42m5d4eUu+";
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

--Sig_/+HtRlSbEj54KW42m5d4eUu+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 May 2024 09:15:13 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 22/04/24 - 14:07, Pekka Paalanen a =C3=A9crit :
> > On Tue, 09 Apr 2024 15:25:25 +0200
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > Introduce the usage of block_h/block_w to compute the offset and the
> > > pointer of a pixel. The previous implementation was specialized for
> > > planes with block_h =3D=3D block_w =3D=3D 1. To avoid confusion and a=
llow easier
> > > implementation of tiled formats. It also remove the usage of the
> > > deprecated format field `cpp`.
> > >=20
> > > Introduce the plane_index parameter to get an offset/pointer on a
> > > different plane.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_formats.c | 110 ++++++++++++++++++++++++++=
++--------
> > >  1 file changed, 87 insertions(+), 23 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vk=
ms/vkms_formats.c
> > > index 69cf9733fec5..9a1400ad4db6 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > @@ -10,22 +10,43 @@
> > >  #include "vkms_formats.h"
> > > =20
> > >  /**
> > > - * pixel_offset() - Get the offset of the pixel at coordinates x/y i=
n the first plane
> > > + * packed_pixels_offset() - Get the offset of the block containing t=
he pixel at coordinates x/y
> > >   *
> > >   * @frame_info: Buffer metadata
> > >   * @x: The x coordinate of the wanted pixel in the buffer
> > >   * @y: The y coordinate of the wanted pixel in the buffer
> > > + * @plane_index: The index of the plane to use
> > > + * @offset: The returned offset inside the buffer of the block
> > > + * @rem_x,@rem_y: The returned coordinate of the requested pixel in =
the block
> > >   *
> > > - * The caller must ensure that the framebuffer associated with this =
request uses a pixel format
> > > - * where block_h =3D=3D block_w =3D=3D 1.
> > > - * If this requirement is not fulfilled, the resulting offset can po=
int to an other pixel or
> > > - * outside of the buffer.
> > > + * As some pixel formats store multiple pixels in a block (DRM_FORMA=
T_R* for example), some
> > > + * pixels are not individually addressable. This function return 3 v=
alues: the offset of the
> > > + * whole block, and the coordinate of the requested pixel inside thi=
s block.
> > > + * For example, if the format is DRM_FORMAT_R1 and the requested coo=
rdinate is 13,5, the offset
> > > + * will point to the byte 5*pitches + 13/8 (second byte of the 5th l=
ine), and the rem_x/rem_y
> > > + * coordinates will be (13 % 8, 5 % 1) =3D (5, 0)
> > > + *
> > > + * With this function, the caller just have to extract the correct p=
ixel from the block.
> > >   */
> > > -static size_t pixel_offset(const struct vkms_frame_info *frame_info,=
 int x, int y)
> > > +static void packed_pixels_offset(const struct vkms_frame_info *frame=
_info, int x, int y,
> > > +				 int plane_index, int *offset, int *rem_x, int *rem_y)
> > >  {
> > >  	struct drm_framebuffer *fb =3D frame_info->fb;
> > > +	const struct drm_format_info *format =3D frame_info->fb->format;
> > > +	/* Directly using x and y to multiply pitches and format->ccp is no=
t sufficient because
> > > +	 * in some formats a block can represent multiple pixels.
> > > +	 *
> > > +	 * Dividing x and y by the block size allows to extract the correct=
 offset of the block
> > > +	 * containing the pixel.
> > > +	 */
> > > =20
> > > -	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp=
[0]);
> > > +	int block_x =3D x / drm_format_info_block_width(format, plane_index=
);
> > > +	int block_y =3D y / drm_format_info_block_height(format, plane_inde=
x);
> > > +	*rem_x =3D x % drm_format_info_block_width(format, plane_index);
> > > +	*rem_y =3D y % drm_format_info_block_height(format, plane_index);
> > > +	*offset =3D fb->offsets[plane_index] +
> > > +		  block_y * fb->pitches[plane_index] +
> > > +		  block_x * format->char_per_block[plane_index]; =20
> >=20
> > I started thinking... is
> >=20
> > +		  block_y * fb->pitches[plane_index] +
> >=20
> > correct, or should it be
> >=20
> > +		  y * fb->pitches[plane_index] +
> >=20
> > ? =20
>=20
> The documentation is not very clear about that:
>=20
>        	 * @pitches: Line stride per buffer. For userspace created object=
 this
>        	 * is copied from drm_mode_fb_cmd2.
>=20
> If I look at the drm_mode_fb_cmd2, there is this documentation:
>=20
>        	/** @pitches: Pitch (aka. stride) in bytes, one per plane. */
>=20
> For me, I interpret "stride" as it is used in matrix calculation, where it
> means "the number of bytes between two number adjacent verticaly"
> (&matrix[x,y] + stride =3D=3D &matrix[x,y+1]).
>=20
> So in a graphic context, I interpret a stride as the number of byte to
> reach the next line of blocks (as pixels can not always be accessed
> individually).
>=20
> So, for me, buffer_size_in_byte >=3D stride * number_of_lines.

This is the definition, yes. Even for blocky formats, it is still
number of 1-pixel-high lines, even though one cannot address a line as
such. For blocky formats it is a theoretical value, and computing with
it only makes sense when your number of lines is a multiple of block
height.

That's my recollection. This has been hashed in issues like
https://gitlab.freedesktop.org/wayland/weston/-/issues/896

> > I'm looking at drm_format_info_min_pitch() which sounds like it should
> > be the latter? Because of
> >
> >         return DIV_ROUND_UP_ULL((u64)buffer_width * info->char_per_bloc=
k[plane],
> >                             drm_format_info_block_width(info, plane) *
> >                             drm_format_info_block_height(info, plane));
> >
> > in drm_format_info_min_pitch(). =20
>=20
> This function doesn't make sense to me. I can't understand how it could
> work.
>=20
> If I consider the X0L2 format, with block_h =3D=3D block_w =3D=3D 2,
> char_per_block =3D 8, and a framebuffer of 1 * 10 pixels, the result of
> drm_format_info_min_pitch is 2.

If buffer_width is 1, then buffer_width / block_w is 1 because of
rounding up. Cannot have images with partial blocks. That is a
block-row of one block. That block takes char_per_block bytes, that is,
8 bytes here. But block height is 2, and stride is computed for
1-pixel-high line, so we divide by block_h, and the result is stride =3D
4 bytes.

However, 1 * 8 / (2 * 2) =3D 2. I think the code is bugged, and the
round-up happens at a wrong point. The correct form would be

div_round_up(div_round_up(buffer_width, block_w) * char_per_block, block_h)

in my opinion. There must always be an integer number of blocks on a
block-row. If a block-row has multiple blocks, doing a
div_round_up(char_per_block, block_h) would over-estimate the per-block
bytes and add the extra for each block rather than averaging it out.
So, multiplying by char_per_block before dividing by block_h gives a
stricter minimum stride.

The condition buffer_size_bytes >=3D buffer_height * stride is necessary
but not always sufficient, because the buffer must hold an integer
number of block-rows.

> However, for this format and this framebuffer, I think the stride should
> be at least 8 bytes (the buffer is "1 block width").

I believe the stride is 4 bytes, because stride for a 1-pixel-high line
on average, rounded up.

Stride allows for unused blocks per block-row, but its use for buffer
size checking with buffer_height is incomplete, I believe. For the
question "is buffer_size enough?" it may produce false-positives, but
it cannot produce false-negatives.


Thanks,
pq


> If pitch equals 2 (as suggested by the test), it implies that
> height * pitch is not valid for calculating the minimum size of the buffer
> (in our case, 10 * 2 =3D 20 bytes, but the minimum framebuffer size should
> be 5 blocks * 8 bytes_per_block =3D 40 bytes). And I don't understand what
> the 2 represents in this context.
> Is it the number of pixels on a line (which is strange, because pitch=20
> should be in byte)? The width in byte of the first line, but by using the=
=20
> "byte per pixel" value (which make no sense when using block formats)?
>=20
> If pitch equals 8 (as I would expect), height * pitch is not optimal (but
> at least sufficient to contain the entire framebuffer), and height * pitch
> / block_h is optimal (which is logical, because height/block_h is the=20
> number of block per columns).
>=20
> > Btw. maybe this should check that the result is not negative (e.g. due
> > to overflow)? Or does that even work since signed overflow is undefined
> > behavior (UB) and compilers may assume UB does not happen, causing the
> > check to be eliminated as dead code?
> >
> > Otherwise this patch looks ok to me.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
>=20
> [...]
>=20
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


--Sig_/+HtRlSbEj54KW42m5d4eUu+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmZB9ioACgkQI1/ltBGq
qqcUJA/+IdlwBdr+FJmO3CcHiS+nrrHFGN++uZ9PuwM5Lgej732L7EpemDQfTiUH
wOm+QjnvbS+RxHlKDyCqD1fmHyH+nf0i1cuo6UtqeobUmaPzsKlNYdliB5nMO/ux
czIQuObrdhSiEXeEgM8SHrY5iuKnMCwpYm9nQ4jBXCDZrzMUYgEHQXLvwRYvzVsf
Koeoo0LMnsKzA6gDwWJpqV559x5GTFX0io2fYDHUsb6oND22fOOkPQtVE21wYjyg
3dM58JGblCUJeP5XMrGayfCOFgB96D6p9ldjnhoXV8tAdpZnv+Xi8goDzs8gTtZV
dINLToRWldysnAD6O7QfEPAyycp4bMupkMSZY7tyB8lHr1n/HflJndAczZwq6uza
XeRzn88hZ0j/JA/lOvHq7kG1Bwyo3FLCmFeb5jdpiqYLvSB1EbFqonZMTjjr91YB
bThcslH1m7mrbePXGnDMbHN2gAmRTH96uncMYCL3vZ2KPK6kxekq3FQVpclcz/1i
qJ9H0ngeEZaTJGJTbrl6GKvGj0kxKctPVNm+v5iTzabo560gdLQPbJeD/cy2nN3J
tMc3qKc00en9U3xCkZQyUAtcvpiOIRiQsJiuyuauA6l4DmEiIARIc8xRSjhGIDdm
ASvVvGuGd1JON7tZHRS8BlJ1yrlg8RRZWaTIzmk1RVQ9INsndTk=
=gM+J
-----END PGP SIGNATURE-----

--Sig_/+HtRlSbEj54KW42m5d4eUu+--
