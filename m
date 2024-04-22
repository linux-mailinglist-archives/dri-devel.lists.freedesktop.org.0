Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A848ACC24
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 13:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9718D112A14;
	Mon, 22 Apr 2024 11:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tqPyZf7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8E112A19
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713785961;
 bh=Hp/ANEzuImA8TwMZWvs03D/XFWAnQgyA0k2jqzI41Hg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tqPyZf7fsyDTcyMRrXcsk5NJwuyfWg5R6k6fScJLsA5zCM4cnJCDRi1E63951p9rT
 GvvGvQTKwFamQP6s21r3MUVyCbkTDEHrGq2OGKeFrivIDUgNwti/6d8xfZbp2wDnWX
 QUg8TUQp4s/M79qXsrXd0y+FNT01zumB2rnNFOdz3qkIaJqItBYJas6VISPz6NtApQ
 8QdjP3aKohCnA3K+0pHyA/FyL6CkTtDVv+5BMgK9eG2dlaUs8ICKJkLkVDzRfwyhF5
 OnIG6oop1HlLmSSDTwAx/lfxuczDzQ8T/DUuy4TlQNxnI+lzs2uVbzaNJWh80zFvTz
 Y90dejG7xKxwA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C021C3782009;
 Mon, 22 Apr 2024 11:39:19 +0000 (UTC)
Date: Mon, 22 Apr 2024 14:39:18 +0300
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
Subject: Re: [PATCH v6 09/17] drm/vkms: Introduce pixel_read_direction enum
Message-ID: <20240422143918.098d3d09.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-9-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-9-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m6tnJaadGIC+IIT7maAs7c5";
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

--Sig_/m6tnJaadGIC+IIT7maAs7c5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:27 +0200
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
>  drivers/gpu/drm/vkms/vkms_composer.c | 42 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 11 ++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 45b111c74884..7c2e328c9510 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,6 +159,48 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +/**
> + * direction_for_rotation() - Get the correct reading direction for a gi=
ven rotation
> + *
> + * @rotation: Rotation to analyze. It correspond the field @frame_info.r=
otation.
> + *
> + * This function will use the @rotation setting of a source plane to com=
pute the reading
> + * direction in this plane which correspond to a "left to right writing"=
 in the CRTC.
> + * For example, if the buffer is reflected on X axis, the pixel must be =
read from right to left
> + * to be written from left to right on the CRTC.
> + */
> +static enum pixel_read_direction direction_for_rotation(unsigned int rot=
ation)
> +{
> +	struct drm_rect tmp_a, tmp_b;
> +	int x, y;
> +
> +	/*
> +	 * The direction is computed by rotating the vector AB (top-left to top=
-right) in a
> +	 * 1x1 square.

Points A and B are depicted as zero-size rectangles on the CRTC.
The CRTC writing direction is from A to B. The plane reading direction
is discovered by inverse-transforming A and B.

(If you want, you can add that to the comment.)

> +	 */
> +
> +	tmp_a =3D DRM_RECT_INIT(0, 0, 0, 0);
> +	tmp_b =3D DRM_RECT_INIT(1, 0, 0, 0);
> +	drm_rect_rotate_inv(&tmp_a, 1, 1, rotation);
> +	drm_rect_rotate_inv(&tmp_b, 1, 1, rotation);
> +
> +	x =3D tmp_b.x1 - tmp_a.x1;
> +	y =3D tmp_b.y1 - tmp_a.y1;
> +
> +	if (x =3D=3D 1)
> +		return READ_LEFT_TO_RIGHT;
> +	else if (x =3D=3D -1)
> +		return READ_RIGHT_TO_LEFT;
> +	else if (y =3D=3D 1)
> +		return READ_TOP_TO_BOTTOM;
> +	else if (y =3D=3D -1)
> +		return READ_BOTTOM_TO_TOP;

I find this code practically obvious. Excellent!

If you want to be more strict, each condition could also require the
other component to be zero.

> +
> +
> +	WARN_ONCE(true, "The inverse of the rotation gives an incorrect directi=
on.");
> +	return READ_LEFT_TO_RIGHT;
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 2e1a1b824a3c..16317b063c20 100644
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
> index 9a1400ad4db6..f76944874fe7 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_frame=
_info *frame_info,
>  	*addr =3D (u8 *)frame_info->map[0].vaddr + offset;
>  }
> =20
> +/**
> + * get_block_step_byte() - Common helper to compute the correct step val=
ue between each pixel block

This should be called get_block_step_bytes(). "Byte" sounds like it
returns a single byte.

> + * to read in a certain direction.
> + *
> + * @fb: Framebuffer to iter on
> + * @direction: Direction of the reading
> + * @plane_index: Plane to get the step from
> + *
> + * As the returned offset is the number of bytes between two consecutive=
 blocks in a direction,

I'd call it "returned count" rather than "returned offset".

> + * the caller may have to read multiple pixel before using the next one =
(for example, to read from

...multiple pixels before using the next block

> + * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels,=
 so the step must be used
> + * only every 8 pixels.

Close parenthesis.

> + */
> +static int get_block_step_byte(struct drm_framebuffer *fb, enum pixel_re=
ad_direction direction,
> +			       int plane_index)
> +{
> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +		return fb->format->char_per_block[plane_index];
> +	case READ_RIGHT_TO_LEFT:
> +		return -fb->format->char_per_block[plane_index];
> +	case READ_TOP_TO_BOTTOM:
> +		return (int)fb->pitches[plane_index];
> +	case READ_BOTTOM_TO_TOP:
> +		return -(int)fb->pitches[plane_index];

I'm not sure if this is correct for formats with block_h > 1.

If a pitch is the theoretical count of bytes per line, then this should
return block_h * pitch. But I'm not exactly sure what is correct here.

Aside from this problem, looks good.


Thanks,
pq

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * packed_pixels_addr_1x1() - Get the pointer to the block containing th=
e pixel at the given
>   * coordinates
>=20


--Sig_/m6tnJaadGIC+IIT7maAs7c5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYmTGYACgkQI1/ltBGq
qqdo2RAAn0oVPSPewVYPsJP5wtT2c126Msn1TFzaji4GEJMwliys/smlTbqaacfb
LOPUKZvRGKwa5Flby8XTs/bqU8BiVjozCpKBwxeVWSqsKdw6iCT0Yuwobopvp8Ah
Z3kWUYsmMg2MQqiBRMVz/6txipnr9kn+ck0hL5xfOGkQO/Nt0VpjSjSEnZ8hzeXa
EOLVyk3z91jvE/ECS5+2CVU+pY+xn1IuAuZKgRiFrx7KmgOW+wolMMHNoPWF7wsc
D660D0B4ZAWlAkcjIrRGC0lE12yYMAzKfMNJEv4hHxWxoY3C+oWRFm6PLChrZnAD
aBYOwj4QRoEiiMfd0O8XBwoibs7LVL91i2mEO4QhrLLdHelkIGW1iN98/X1lRLTK
8XT4sZWqWWS16uVsDUHd97+9CPBBULvzgnUPvKedpe7ZzCfwo8N7oSqLl8Kf0QKw
2niIlll4/jo4UQJ4kLRmwrYmwZWvFUoP87q2jD3LALdX83fqao+et5Ft4dXfTuzN
5Q1hSV1FfCraMZRRDM5KKAp9mJYxDASLZwDKiBfuV9FvToCmqCRV1rhtnhbteaO/
6hMT5I6upCL7Y0hDT7FXxvQ7sBZrhLmFEbtDcgZ+uMa2yjd9pP1V/y4lirreD8bI
1xrKyPgWhhqDa7brI2HwjfBCb7ywTDysdXb9od80A87We3YWrSU=
=w9F+
-----END PGP SIGNATURE-----

--Sig_/m6tnJaadGIC+IIT7maAs7c5--
