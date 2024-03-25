Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003F88A111
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EAB10E07D;
	Mon, 25 Mar 2024 13:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e0M1/4s0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624F10E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711372265;
 bh=3q9cgpYnnI8lrkn+Or4lnTKjwL/UU9xOBmE7kuGVDL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e0M1/4s0w7Mymmeg+w7KYYJV8QjXFcnQ1cep1iVTNVncy4JNDq6uVx3uea9NiAB/I
 tqTv5keLQGQWjQ+Mnz1pXMAIg58uZzdUxoLe1MSLYnCubAFuobP5G7XbTsA4I84+4+
 u92qm34NmyOpZ0zFz+ZQkkuiLjAODAxqUBU4D0HB/gAqDPsyV2ycfNLThtiS2LAOSK
 QPvp/j9cKnZXOJE7lBuGyHD2U6QRMlE6DENGye1I5d82g4X4a6OnzKedqIiB29/TQb
 uvWoHy3GfANBfKiPZ2mMfyYswVOyOYaM7h80qDKFuuGZwindPI9+veclZEizpFaALZ
 mQtvIeBP5Nd9A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 98AAE37809D0;
 Mon, 25 Mar 2024 13:11:04 +0000 (UTC)
Date: Mon, 25 Mar 2024 15:11:03 +0200
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
Message-ID: <20240325151103.0a5f7112.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pOcUB5TKgO05bc1fdT4reYt";
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

--Sig_/pOcUB5TKgO05bc1fdT4reYt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:03 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> The pixel_read_direction enum is useful to describe the reading direction
> in a plane. It avoids using the rotation property of DRM, which not
> practical to know the direction of reading.
> This patch also introduce two helpers, one to compute the
> pixel_read_direction from the DRM rotation property, and one to compute
> the step, in byte, between two successive pixel in a specific direction.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 9254086f23ff..989bcf59f375 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,6 +159,42 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +/**
> + * direction_for_rotation() - Get the correct reading direction for a gi=
ven rotation
> + *
> + * This function will use the @rotation setting of a source plane to com=
pute the reading
> + * direction in this plane which correspond to a "left to right writing"=
 in the CRTC.
> + * For example, if the buffer is reflected on X axis, the pixel must be =
read from right to left
> + * to be written from left to right on the CRTC.

That is a well written description.

> + *
> + * @rotation: Rotation to analyze. It correspond the field @frame_info.r=
otation.
> + */
> +static enum pixel_read_direction direction_for_rotation(unsigned int rot=
ation)
> +{
> +	if (rotation & DRM_MODE_ROTATE_0) {
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			return READ_RIGHT_TO_LEFT;
> +		else
> +			return READ_LEFT_TO_RIGHT;
> +	} else if (rotation & DRM_MODE_ROTATE_90) {
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			return READ_BOTTOM_TO_TOP;
> +		else
> +			return READ_TOP_TO_BOTTOM;
> +	} else if (rotation & DRM_MODE_ROTATE_180) {
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			return READ_LEFT_TO_RIGHT;
> +		else
> +			return READ_RIGHT_TO_LEFT;
> +	} else if (rotation & DRM_MODE_ROTATE_270) {
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			return READ_TOP_TO_BOTTOM;
> +		else
> +			return READ_BOTTOM_TO_TOP;
> +	}
> +	return READ_LEFT_TO_RIGHT;

I'm a little worried seeing REFLECT_X is supported only for some
rotations, and REFLECT_Y for other rotations. Why is an analysis of all
combinations not necessary?

I hope IGT uses FB patterns instead of solid color in its tests of
rotation to be able to detect the difference.

The return values do seem correct to me, assuming I have guessed
correctly what "X" and "Y" refer to when combined with rotation. I did
not find good documentation about that.

Btw. if there are already functions that are able to transform
coordinates based on the rotation bitfield, you could alternatively use
them. Transform CRTC point (0, 0) to A, and (1, 0) to B. Now A and B
are in plane coordinate system, and vector B - A gives you the
direction. The reason I'm mentioning this is that then you don't have
to implement yet another copy of the rotation bitfield semantics from
scratch.


> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 3ead8b39af4a..985e7a92b7bc 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -69,6 +69,17 @@ struct vkms_writeback_job {
>  	pixel_write_t pixel_write;
>  };
> =20
> +/**
> + * enum pixel_read_direction - Enum used internaly by VKMS to represent =
a reading direction in a
> + * plane.
> + */
> +enum pixel_read_direction {
> +	READ_BOTTOM_TO_TOP,
> +	READ_TOP_TO_BOTTOM,
> +	READ_RIGHT_TO_LEFT,
> +	READ_LEFT_TO_RIGHT
> +};
> +
>  /**
>   * typedef pixel_read_t - These functions are used to read a pixel in th=
e source frame,
>   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 649d75d05b1f..743b6fd06db5 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_frame=
_info *frame_info,
>  	*addr =3D (u8 *)frame_info->map[0].vaddr + offset;
>  }
> =20
> +/**
> + * get_step_next_block() - Common helper to compute the correct step val=
ue between each pixel block
> + * to read in a certain direction.
> + *
> + * As the returned offset is the number of bytes between two consecutive=
 blocks in a direction,
> + * the caller may have to read multiple pixel before using the next one =
(for example, to read from
> + * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels,=
 so the step must be used
> + * only every 8 pixels.
> + *
> + * @fb: Framebuffer to iter on
> + * @direction: Direction of the reading
> + * @plane_index: Plane to get the step from
> + */
> +static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_re=
ad_direction direction,
> +			       int plane_index)
> +{

I would have called this something like get_block_step_bytes() for
example. That makes it clear it returns bytes (not e.g. pixels). "next"
implies to me that I tell the function the current block, and then it
gets me the next one. It does not do that, so I'd not use "next".

> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +		return fb->format->char_per_block[plane_index];
> +	case READ_RIGHT_TO_LEFT:
> +		return -fb->format->char_per_block[plane_index];
> +	case READ_TOP_TO_BOTTOM:
> +		return (int)fb->pitches[plane_index];
> +	case READ_BOTTOM_TO_TOP:
> +		return -(int)fb->pitches[plane_index];
> +	}
> +
> +	return 0;
> +}

Looks good.


Thanks,
pq

> +
>  static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y,
>  				 int plane_index)
>  {
>=20


--Sig_/pOcUB5TKgO05bc1fdT4reYt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBd+cACgkQI1/ltBGq
qqfarg//Q+qvT9aL8AZvOG15t7LfHydp088OlP6y0I621RTKlpMf3u9o4uV6vM+n
8CW/h0xeXteJAt0/xBX/ZMziac8FLC1iQ9tKz4qoBd5EywoPwc69L6iANQvKsXuv
vvoF7SN/nv0iP/VDlrXuI1TIwGquIcs0Sf+tqhPOoYyg8LTM4RihmEeS3xgzaCO6
0fWhZbdnkTqOGXY/aPAtPC8xRvlG6rN1gLvNMaDxN/OXIJzhCSd/3Juau2+USqLL
6KzkmSoRsu/V+Uqnji4WlsPj0fLt+5BkvQcLfXkigv8x19RXAYB65HMAWuy42kwC
nxGsrvaDGKKxU0ltFb0uxzanEpi7mydfhGkTM75EeQFV77++SSsnYpZt48TkhM/7
WX8E9pOLtRfLvKfZrF5Wt2CS0LZ0M8E/UUyv97zf+HgU/0a7Tr66Ee4DPm0rvGL2
EhyPXzyhEfT/KqriaaiI54+KcQeOuOycoNikzfxj8XdyYp20b6vIGPSWVwNntKnO
SyrO3rx2oU21TdSkWHNNlGb8YY2rVtZGz0/jF93juipKcLraUnCy3pxRiB8+IO1y
x7BxEEMrozMz1/fvcIiU95CqbClMdraof5I96Avrx/Hh38iXfI1z4T3iFMMTtg3V
25KIJul1oqV8d23+PD8JMQhVm2wiCnQqjIfF9ynU1P7EwCsyIvk=
=F3pF
-----END PGP SIGNATURE-----

--Sig_/pOcUB5TKgO05bc1fdT4reYt--
