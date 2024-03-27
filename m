Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA2088DE70
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315CF10FB7F;
	Wed, 27 Mar 2024 12:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="wBbSp1kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3A10FB7F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711541792;
 bh=b9tUtOWP10DFFIbJ+MuzFmebXOLyEGcIhDM4C4eTcnM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wBbSp1knA475FeZv3hTfUv+NCdjpQeY+XuaImW13Zx17dvOOGAelvPD5Fduog7sNg
 bbpUBQ+Xu68AL95jLEnV533jUpNZQxMVqvLCMWo6LR5PlvNM2933dB1P7AurYCjPQ0
 O6SCQiQh9wsRRZX2gvFwgd54YXkm0DCaLgX7OjEcQHJF6UfE/EW/3O++JgJqBStxFb
 7FUpn42zsnNMypUbYAiQ1KbijkM7m78l/4Kl7+i+3Tl5SuBtR21UZg5qbmtTmwFOsK
 J9mHAp531Wbqn8z2NbqB1r8Y6wz2hNCppcbUSER9m28MC7/rQOTt8foUeUsb/lsGp/
 VA4P8XYtP88Tw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0913B37820E4;
 Wed, 27 Mar 2024 12:16:30 +0000 (UTC)
Date: Wed, 27 Mar 2024 14:16:29 +0200
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
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v5 09/16] drm/vkms: Introduce pixel_read_direction enum
Message-ID: <20240327141629.48ec16f2.pekka.paalanen@collabora.com>
In-Reply-To: <ZgLwTJVb_Z_MHuCp@localhost.localdomain>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
 <20240325151103.0a5f7112.pekka.paalanen@collabora.com>
 <ZgLwTJVb_Z_MHuCp@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y.=AXPHMl.E/Gzqgl1vI4mi";
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

--Sig_/y.=AXPHMl.E/Gzqgl1vI4mi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Mar 2024 16:57:00 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 25/03/24 - 15:11, Pekka Paalanen a =C3=A9crit :
> > On Wed, 13 Mar 2024 18:45:03 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > The pixel_read_direction enum is useful to describe the reading direc=
tion
> > > in a plane. It avoids using the rotation property of DRM, which not
> > > practical to know the direction of reading.
> > > This patch also introduce two helpers, one to compute the
> > > pixel_read_direction from the DRM rotation property, and one to compu=
te
> > > the step, in byte, between two successive pixel in a specific directi=
on.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++++++=
++++++++++
> > >  drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
> > >  drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++=
++++
> > >  3 files changed, 77 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/v=
kms/vkms_composer.c
> > > index 9254086f23ff..989bcf59f375 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > @@ -159,6 +159,42 @@ static void apply_lut(const struct vkms_crtc_sta=
te *crtc_state, struct line_buff
> > >  	}
> > >  }
> > > =20
> > > +/**
> > > + * direction_for_rotation() - Get the correct reading direction for =
a given rotation
> > > + *
> > > + * This function will use the @rotation setting of a source plane to=
 compute the reading
> > > + * direction in this plane which correspond to a "left to right writ=
ing" in the CRTC.
> > > + * For example, if the buffer is reflected on X axis, the pixel must=
 be read from right to left
> > > + * to be written from left to right on the CRTC. =20
> >=20
> > That is a well written description. =20
>=20
> Thanks
> =20
> > > + *
> > > + * @rotation: Rotation to analyze. It correspond the field @frame_in=
fo.rotation.
> > > + */
> > > +static enum pixel_read_direction direction_for_rotation(unsigned int=
 rotation)
> > > +{
> > > +	if (rotation & DRM_MODE_ROTATE_0) {
> > > +		if (rotation & DRM_MODE_REFLECT_X)
> > > +			return READ_RIGHT_TO_LEFT;
> > > +		else
> > > +			return READ_LEFT_TO_RIGHT;
> > > +	} else if (rotation & DRM_MODE_ROTATE_90) {
> > > +		if (rotation & DRM_MODE_REFLECT_Y)
> > > +			return READ_BOTTOM_TO_TOP;
> > > +		else
> > > +			return READ_TOP_TO_BOTTOM;
> > > +	} else if (rotation & DRM_MODE_ROTATE_180) {
> > > +		if (rotation & DRM_MODE_REFLECT_X)
> > > +			return READ_LEFT_TO_RIGHT;
> > > +		else
> > > +			return READ_RIGHT_TO_LEFT;
> > > +	} else if (rotation & DRM_MODE_ROTATE_270) {
> > > +		if (rotation & DRM_MODE_REFLECT_Y)
> > > +			return READ_TOP_TO_BOTTOM;
> > > +		else
> > > +			return READ_BOTTOM_TO_TOP;
> > > +	}
> > > +	return READ_LEFT_TO_RIGHT; =20
> >=20
> > I'm a little worried seeing REFLECT_X is supported only for some
> > rotations, and REFLECT_Y for other rotations. Why is an analysis of all
> > combinations not necessary? =20
>=20
> I don't need to manage all the combination because this is only about=20
> the "horizontal writing".
>=20
> So, if you want to write a line in the CRTC, with:
> - ROT_0 || REF_X =3D> You need to read the source line from right to left
> - ROT_0 =3D> You need to read source buffer from left to right
> - ROT_0 || REF_Y =3D> You need to read the source line from left to right

That is true, indeed.

> In this case, REF_Y only have an effect on the "column reading". It is no=
t=20
> needed here because the new version of the blend function will use the=20
> drm_rect_* helpers to compute the correct y coordinate.
>=20
> If you think it's clearer, I can create a big switch(rotation) like this:
>=20
> 	switch (rotation) {
> 	case ROT_0:
> 	case ROT_0 || REF_X:
> 		return L2R;
> 	case ROT_0 || REF_Y:
> 		return R2L;
> 	case ROT_90:
> 	case ROT_90 || REF_X:
> 		return T2B;
> 	[...]
> 	}
>=20
> So all cases are clearly covered?

I think that would suit my personal taste better. It would not raise
questions nor need a comment. It does become a long function, but I
tend to favour long and clear more than short and needs thinking to
figure out if it works, everything else being equivalent.

I wonder how DRM maintainers feel.

> > I hope IGT uses FB patterns instead of solid color in its tests of
> > rotation to be able to detect the difference. =20
>=20
> They use solid colors, and even my new rotation test [3] use solid colors.

That will completely fail to detect rotation and reflection bugs then.
E.g. userspace asks for 180-degree rotation, and the driver does not
rotate at all. Or rotate-180 getting confused with one reflection.

> It is mainly for yuv formats with subsampling: if you have formats with=20
> subsampling, a "software rotated buffer" and a "hardware rotated buffer"=
=20
> will not apply the same subsampling, so the colors will be slightly=20
> different.

Why would they not use the same subsampling?

The framebuffer contents are defined in its natural orientation, and
the subsampling applies in the natural orientation. If such a FB
is on a rotated plane, one must account for subsampling first, and
rotate second. 90-degree rotation does not change the encoded color.

Getting the subsampling exactly right is going to be necessary sooner
or later. There is no UAPI for setting chroma siting yet, but ideally
there should be.

> > The return values do seem correct to me, assuming I have guessed
> > correctly what "X" and "Y" refer to when combined with rotation. I did
> > not find good documentation about that. =20
>=20
> Yes, it is difficult to understand how rotation and reflexion should=20
> works in drm. I spend half a day testing all the combination in drm_rect_=
*=20
> helpers to understand how this works. According to the code:
> - If only rotation or only reflexion, easy as expected
> - If reflexion and rotation are mixed, the source buffer is first=20
>   reflected and then rotated.

Now that you know, you could send a documentation patch. :-)

For me as a userspace developer, the important place is
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-plane-proper=
ties

> =20
> > Btw. if there are already functions that are able to transform
> > coordinates based on the rotation bitfield, you could alternatively use
> > them. Transform CRTC point (0, 0) to A, and (1, 0) to B. Now A and B
> > are in plane coordinate system, and vector B - A gives you the
> > direction. The reason I'm mentioning this is that then you don't have
> > to implement yet another copy of the rotation bitfield semantics from
> > scratch. =20
>=20
> You are totaly right. I will try this elegant method. Yes, there are some=
=20
> helpers (drm_rect_rotate_inv), so I will try to do something.


Cool, thanks,
pq

> >  =20
> > > +}
> > > +
> > >  /**
> > >   * blend - blend the pixels from all planes and compute crc
> > >   * @wb: The writeback frame buffer metadata
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/v=
kms_drv.h
> > > index 3ead8b39af4a..985e7a92b7bc 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > @@ -69,6 +69,17 @@ struct vkms_writeback_job {
> > >  	pixel_write_t pixel_write;
> > >  };
> > > =20
> > > +/**
> > > + * enum pixel_read_direction - Enum used internaly by VKMS to repres=
ent a reading direction in a
> > > + * plane.
> > > + */
> > > +enum pixel_read_direction {
> > > +	READ_BOTTOM_TO_TOP,
> > > +	READ_TOP_TO_BOTTOM,
> > > +	READ_RIGHT_TO_LEFT,
> > > +	READ_LEFT_TO_RIGHT
> > > +};
> > > +
> > >  /**
> > >   * typedef pixel_read_t - These functions are used to read a pixel i=
n the source frame,
> > >   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vk=
ms/vkms_formats.c
> > > index 649d75d05b1f..743b6fd06db5 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > @@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_f=
rame_info *frame_info,
> > >  	*addr =3D (u8 *)frame_info->map[0].vaddr + offset;
> > >  }
> > > =20
> > > +/**
> > > + * get_step_next_block() - Common helper to compute the correct step=
 value between each pixel block
> > > + * to read in a certain direction.
> > > + *
> > > + * As the returned offset is the number of bytes between two consecu=
tive blocks in a direction,
> > > + * the caller may have to read multiple pixel before using the next =
one (for example, to read from
> > > + * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pix=
els, so the step must be used
> > > + * only every 8 pixels.
> > > + *
> > > + * @fb: Framebuffer to iter on
> > > + * @direction: Direction of the reading
> > > + * @plane_index: Plane to get the step from
> > > + */
> > > +static int get_step_next_block(struct drm_framebuffer *fb, enum pixe=
l_read_direction direction,
> > > +			       int plane_index)
> > > +{ =20
> >=20
> > I would have called this something like get_block_step_bytes() for
> > example. That makes it clear it returns bytes (not e.g. pixels). "next"
> > implies to me that I tell the function the current block, and then it
> > gets me the next one. It does not do that, so I'd not use "next". =20
>=20
> Nice name, I will took it for the v6.
>=20
> Thanks,
> Louis Chauvet
>=20
> > > +	switch (direction) {
> > > +	case READ_LEFT_TO_RIGHT:
> > > +		return fb->format->char_per_block[plane_index];
> > > +	case READ_RIGHT_TO_LEFT:
> > > +		return -fb->format->char_per_block[plane_index];
> > > +	case READ_TOP_TO_BOTTOM:
> > > +		return (int)fb->pitches[plane_index];
> > > +	case READ_BOTTOM_TO_TOP:
> > > +		return -(int)fb->pitches[plane_index];
> > > +	}
> > > +
> > > +	return 0;
> > > +} =20
> >=20
> > Looks good.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> > > +
> > >  static void *get_packed_src_addr(const struct vkms_frame_info *frame=
_info, int y,
> > >  				 int plane_index)
> > >  {
> > >  =20
> >  =20
>=20
>=20
>=20


--Sig_/y.=AXPHMl.E/Gzqgl1vI4mi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYEDh0ACgkQI1/ltBGq
qqfB6w/9Fvj0WL682AJMB4wyA3F5IndRdmI8UMgQkxmIhfHqmnZXE8Y96Fm/mDHU
t47JTxeeN3D+bKbs9SVV+ElsCHK784V91fJPcgI3MqIQkWam9XjL8jpJEpEu0TxQ
4BXn6P2E2d3qEV0J9xC8i1lQx9eeqI0BAJnKNnelF2Pid7OK5z7NpNCz/0MaSt8c
89wbPogxoPepIajcEexecOFNLvCsfeAzE8lTy9GunXFa1SLYJJJxiwB72mkGiKmz
0ueClnOa0uqhqPh71dDpMwChekNUi/ZY1m6fMc/Hu6K5F65PB1uXbxS7QWE5sOmZ
fEsyCvc8VywYvh9T0HZ6W3vCFCEFKhzTiPLuVoQufZikrnm/0lpSStZMC1i9kUlo
kveorXK9VEACsNZh7ME23A7fRPpfkQvZXMFixZdm9VL/Rzkcwajg/h3raUfbtf8U
A/OKcMEiyDAxpi5P8hC7Blx+cqSS6anJpZNBQPLSemU3ad5S3cEw3WfLp+cK3VdS
SscZdnyvBLop97Dvr+NyQkIckH50DQX0zGne5OVRlR+5FVvl0jGvSxp2DPWdESH9
9z6HYVKkKSKKfpGJPjTRj2h1kUCztd+9UfUnpy+8OCF5rOSv8gonQDngow4w/TAp
COtNAbhJMxdWFb9v/Jc4eC7iNH1sT8cmmvPsZBRLrLQZ7cFYrDE=
=i7TS
-----END PGP SIGNATURE-----

--Sig_/y.=AXPHMl.E/Gzqgl1vI4mi--
