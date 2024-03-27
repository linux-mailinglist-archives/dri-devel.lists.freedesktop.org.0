Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B388E581
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3310EA09;
	Wed, 27 Mar 2024 14:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hrdpWX8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443A610EA09
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711549390;
 bh=eDkqykQnNmWXKP0/ZaUUZ/ia5ChXy0XErVE0t8q1nbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hrdpWX8trxWUZ8VDuyOHX+0xyGJi8+viq5ABCFmwleMQ2vUCI5NaSnkITqglRIco7
 ydXKdgNeqlsWQLS57CYJ3XrboGmsJDb9rtP92ufr9cYIrRzH+vv7IoC7A8MNNNkb2X
 KPj8uF9Gc9D1VUyCkWJFuU8VOIKmhTC0XlMnOMKcMyeDOV3DZQRIw/aX4o3usFghJN
 RMhqNqJSxhoo6dgm1llTUU+EQ/aOV8ybKkMF8J11aOXvlt1IKf0ypSirFFRXxQr1sg
 QWv4tmqTjKo3KiGQ07mVc8ouCnuhUA06+OBGcwVYp/+/uRiPG+ihuesNSlxd813OQt
 bRn/JRQTZ0mgA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 50F8B378210B;
 Wed, 27 Mar 2024 14:23:09 +0000 (UTC)
Date: Wed, 27 Mar 2024 16:23:07 +0200
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
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Message-ID: <20240327162307.4b9b6e45.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e7LaFHFZy=Po2hc=D/wn.K4";
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

--Sig_/e7LaFHFZy=Po2hc=D/wn.K4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:05 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Add support to the YUV formats bellow:
>=20
> - NV12/NV16/NV24
> - NV21/NV61/NV42
> - YUV420/YUV422/YUV444
> - YVU420/YVU422/YVU444
>=20
> The conversion from yuv to rgb is done with fixed-point arithmetic, using
> 32.32 floats and the drm_fixed helpers.

You mean fixed-point, not floating-point (floats).

>=20
> To do the conversion, a specific matrix must be used for each color range
> (DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored in
> the `conversion_matrix` struct, along with the specific y_offset needed.
> This matrix is queried only once, in `vkms_plane_atomic_update` and
> stored in a `vkms_plane_state`. Those conversion matrices of each
> encoding and range were obtained by rounding the values of the original
> conversion matrices multiplied by 2^32. This is done to avoid the use of
> floating point operations.
>=20
> The same reading function is used for YUV and YVU formats. As the only
> difference between those two category of formats is the order of field, a
> simple swap in conversion matrix columns allows using the same function.

Sounds good!

> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - Adapted Arthur's work
> - Implemented the read_line_t callbacks for yuv
> - add struct conversion_matrix
> - remove struct pixel_yuv_u8
> - update the commit message
> - Merge the modifications from Arthur]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
>  drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/vkms/vkms_formats.h |   4 +
>  drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
>  4 files changed, 473 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 23e1d247468d..f3116084de5a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_pl=
ane_state *plane, int x_st
>  				  int y_start, enum pixel_read_direction direction, int count,
>  				  struct pixel_argb_u16 out_pixel[]);
> =20
> +/**
> + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for =
conversion matrix values
> + */
> +#define CONVERSION_MATRIX_FLOAT_DEPTH 32

Fraction, not float.

> +
> +/**
> + * struct conversion_matrix - Matrix to use for a specific encoding and =
range
> + *
> + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a=
 row-major manner and is
> + * used to compute rgb values from yuv values:
> + *     [[r],[g],[b]] =3D @matrix * [[y],[u],[v]]
> + *   OR for yvu formats:
> + *     [[r],[g],[b]] =3D @matrix * [[y],[v],[u]]
> + *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOA=
T_DEPTH

Fixed float is not a thing. They are signed fixed-point values with
32-bit fractional part.

> + * @y_offest: Offset to apply on the y value.
> + */
> +struct conversion_matrix {
> +	s64 matrix[3][3];
> +	s64 y_offset;
> +};

Btw. too bad that drm_fixed.h does not use something like

	typedef struct drm_fixed {
		s64 v;
	} drm_fixed_t;

and use that in all the API where a fixed-point value is passed. It
would make the type very explicit, and the struct prevents it from
implicitly casting to/from regular integer formats.

Then you could use drm_fixed_t instead of s64 and it would be obvious
how the values must be handled and which API is appropriate.

> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -110,6 +131,7 @@ struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
>  	pixel_read_line_t pixel_read_line;
> +	struct conversion_matrix *conversion_matrix;

If the matrix was embedded as a copy instead of a pointer to (const!)
matrix, you would not need to manually hardcode YVU variant of the
matrices, but you could simply swap the columns of the YUV matrix while
copying them into this field.


>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 1449a0e6c706..edbf4b321b91 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -105,6 +105,44 @@ static int get_step_next_block(struct drm_framebuffe=
r *fb, enum pixel_read_direc
>  	return 0;
>  }
> =20
> +/**
> + * get_subsampling() - Get the subsampling divisor value on a specific d=
irection
> + */
> +static int get_subsampling(const struct drm_format_info *format,
> +			   enum pixel_read_direction direction)
> +{
> +	switch (direction) {
> +	case READ_BOTTOM_TO_TOP:
> +	case READ_TOP_TO_BOTTOM:
> +		return format->vsub;
> +	case READ_RIGHT_TO_LEFT:
> +	case READ_LEFT_TO_RIGHT:
> +		return format->hsub;
> +	}
> +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> +	return 1;
> +}
> +
> +/**
> + * get_subsampling_offset() - An offset for keeping the chroma siting co=
nsistent regardless of
> + * x_start and y_start values
> + */
> +static int get_subsampling_offset(enum pixel_read_direction direction, i=
nt x_start, int y_start)
> +{
> +	switch (direction) {
> +	case READ_BOTTOM_TO_TOP:
> +		return -y_start - 1;
> +	case READ_TOP_TO_BOTTOM:
> +		return y_start;
> +	case READ_RIGHT_TO_LEFT:
> +		return -x_start - 1;
> +	case READ_LEFT_TO_RIGHT:
> +		return x_start;
> +	}
> +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> +	return 0;
> +}
> +
>  /*
>   * The following  functions take pixel data (a, r, g, b, pixel, ...), co=
nvert them to the format
>   * ARGB16161616 in out_pixel.
> @@ -161,6 +199,42 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(co=
nst u16 *pixel)
>  	return out_pixel;
>  }
> =20
> +static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> +						  struct conversion_matrix *matrix)

If you are using the "swap the matrix columns" trick, then you cannot
call these cb, cr nor even u,v, because they might be the opposite.
They are simply the first and second chroma channel, and their meaning
depends on the given matrix.

> +{
> +	u8 r, g, b;
> +	s64 fp_y, fp_cb, fp_cr;
> +	s64 fp_r, fp_g, fp_b;
> +
> +	fp_y =3D y - matrix->y_offset;
> +	fp_cb =3D cb - 128;
> +	fp_cr =3D cr - 128;

This looks like an incorrect way to convert u8 to fixed-point, but...

> +
> +	fp_y =3D drm_int2fixp(fp_y);
> +	fp_cb =3D drm_int2fixp(fp_cb);
> +	fp_cr =3D drm_int2fixp(fp_cr);

I find it confusing to re-purpose variables like this.

I'd do just

	fp_c1 =3D drm_int2fixp((int)c1 - 128);

If the function arguments were int to begin with, then the cast would
be obviously unnecessary.

So, what you have in fp variables at this point is fractional numbers
in the 8-bit integer scale. However, because the target format is
16-bit, you should not show the extra precision away here. Instead,
multiply by 257 to bring the values to 16-bit scale, and do the RGB
clamping to 16-bit, not 8-bit.

> +
> +	fp_r =3D drm_fixp_mul(matrix->matrix[0][0], fp_y) +
> +	       drm_fixp_mul(matrix->matrix[0][1], fp_cb) +
> +	       drm_fixp_mul(matrix->matrix[0][2], fp_cr);
> +	fp_g =3D drm_fixp_mul(matrix->matrix[1][0], fp_y) +
> +	       drm_fixp_mul(matrix->matrix[1][1], fp_cb) +
> +	       drm_fixp_mul(matrix->matrix[1][2], fp_cr);
> +	fp_b =3D drm_fixp_mul(matrix->matrix[2][0], fp_y) +
> +	       drm_fixp_mul(matrix->matrix[2][1], fp_cb) +
> +	       drm_fixp_mul(matrix->matrix[2][2], fp_cr);
> +
> +	fp_r =3D drm_fixp2int_round(fp_r);
> +	fp_g =3D drm_fixp2int_round(fp_g);
> +	fp_b =3D drm_fixp2int_round(fp_b);
> +
> +	r =3D clamp(fp_r, 0, 0xff);
> +	g =3D clamp(fp_g, 0, 0xff);
> +	b =3D clamp(fp_b, 0, 0xff);
> +
> +	return argb_u16_from_u8888(255, r, g, b);

Going through argb_u16_from_u8888() will throw away precision.

> +}
> +
>  /*
>   * The following functions are read_line function for each pixel format =
supported by VKMS.
>   *
> @@ -293,6 +367,79 @@ static void RGB565_read_line(const struct vkms_plane=
_state *plane, int x_start,
>  	}
>  }
> =20
> +/*
> + * This callback can be used for yuv and yvu formats, given a properly m=
odified conversion matrix
> + * (column inversion)

Would be nice to explain what semi_planar_yuv means, so that the
documentation for these functions would show how they differ rather
than all saying exactly the same thing.

> + */
> +static void semi_planar_yuv_read_line(const struct vkms_plane_state *pla=
ne, int x_start,
> +				      int y_start, enum pixel_read_direction direction, int count,
> +				      struct pixel_argb_u16 out_pixel[])
> +{
> +	int rem_x, rem_y;
> +	u8 *y_plane;
> +	u8 *uv_plane;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &y_plane, &r=
em_x, &rem_y);

Assert rem_x, rem_y are zero, or block is 1x1.

> +	packed_pixels_addr(plane->frame_info,
> +			   x_start / plane->frame_info->fb->format->hsub,
> +			   y_start / plane->frame_info->fb->format->vsub,
> +			   1, &uv_plane, &rem_x, &rem_y);

Assert rem_x, rem_y are zero, or block is 1x1.

Actually, this is so common, that maybe there should be a wrapper for
packed_pixels_addr() or another variant of it, that asserts that the
block size is 1x1 and does not return rem_x, rem_y at all.

> +	int step_y =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +	int step_uv =3D get_step_next_block(plane->frame_info->fb, direction, 1=
);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(direction, x_start, y=
_start);
> +	struct conversion_matrix *conversion_matrix =3D plane->conversion_matri=
x;
> +
> +	for (int i =3D 0; i < count; i++) {
> +		*out_pixel =3D argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[=
1],
> +						  conversion_matrix);
> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0)
> +			uv_plane +=3D step_uv;
> +	}
> +}
> +
> +/*
> + * This callback can be used for yuv and yvu formats, given a properly m=
odified conversion matrix
> + * (column inversion)
> + */
> +static void planar_yuv_read_line(const struct vkms_plane_state *plane, i=
nt x_start,
> +				 int y_start, enum pixel_read_direction direction, int count,
> +				 struct pixel_argb_u16 out_pixel[])
> +{
> +	int rem_x, rem_y;
> +	u8 *y_plane;
> +	u8 *u_plane;
> +	u8 *v_plane;
> +
> +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &y_plane, &r=
em_x, &rem_y);
> +	packed_pixels_addr(plane->frame_info,
> +			   x_start / plane->frame_info->fb->format->hsub,
> +			   y_start / plane->frame_info->fb->format->vsub,
> +			   1, &u_plane, &rem_x, &rem_y);
> +	packed_pixels_addr(plane->frame_info,
> +			   x_start / plane->frame_info->fb->format->hsub,
> +			   y_start / plane->frame_info->fb->format->vsub,
> +			   2, &v_plane, &rem_x, &rem_y);
> +	int step_y =3D get_step_next_block(plane->frame_info->fb, direction, 0);
> +	int step_u =3D get_step_next_block(plane->frame_info->fb, direction, 1);
> +	int step_v =3D get_step_next_block(plane->frame_info->fb, direction, 2);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(direction, x_start, y=
_start);
> +	struct conversion_matrix *conversion_matrix =3D plane->conversion_matri=
x;
> +
> +	for (int i =3D 0; i < count; i++) {
> +		*out_pixel =3D argb_u16_from_yuv888(*y_plane, *u_plane, *v_plane, conv=
ersion_matrix);
> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0) {
> +			u_plane +=3D step_u;
> +			v_plane +=3D step_v;
> +		}
> +	}
> +}
> +
>  /*
>   * The following functions take one argb_u16 pixel and convert it to a s=
pecific format. The
>   * result is stored in @out_pixel.
> @@ -418,6 +565,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 f=
ormat)
>  		return &XRGB16161616_read_line;
>  	case DRM_FORMAT_RGB565:
>  		return &RGB565_read_line;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		return &semi_planar_yuv_read_line;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +		return &planar_yuv_read_line;
>  	default:
>  		/*
>  		 * This is a bug in vkms_plane_atomic_check. All the supported
> @@ -435,6 +596,276 @@ pixel_read_line_t get_pixel_read_line_function(u32 =
format)
>  	}
>  }
> =20
> +/**
> + * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb=
 conversion matrix for a
> + * given encoding and range.
> + *
> + * If the matrix is not found, return a null pointer. In all other cases=
, it return a simple
> + * diagonal matrix, which act as a "no-op".

This comment about NULL seems bogus.

> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
> + * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
> + * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matr=
ix
> + */
> +struct conversion_matrix *
> +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding en=
coding,
> +				  enum drm_color_range range)
> +{
> +	static struct conversion_matrix no_operation =3D {

Every matrix here should be 'static const' rather than only 'static'.

> +		.matrix =3D {
> +			{ 4294967296, 0,          0, },
> +			{ 0,          4294967296, 0, },
> +			{ 0,          0,          4294967296, },
> +		},
> +		.y_offset =3D 0,
> +	};
> +
> +	/*
> +	 * Those matrixies were generated using the colour python framework
> +	 *
> +	 * Below are the function calls used to generate eac matrix, go to
> +	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCb=
Cr.html
> +	 * for more info:
> +	 *
> +	 * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.=
601"],
> +	 *                                  is_legal =3D False,

Ugh, colour.matrix_YCbCr documentation is confusing. This is the first
time I've heard of "legal range", so I had to look it up. Of course,
the doc does not explain it.

Reading
https://kb.pomfort.com/livegrade/advanced-grading-features/legal-and-extend=
ed-sdi-signals-and-luts-in-livegrade/
it sounds like extended range in 8-bit is 1-254, not 0-255 that
we use in computer graphics. This matches what I've read before
elsewhere in ITU or SMPTE specs.

SDI signals reserve the 8-bit code points 0 and 255 for
synchronization, making them invalid as data. It scales to higher bit
depths, so 10-bit code points 0-3 and 1020-1023 inclusive are reserved
for synchronization.

IOW, there are two different "full range" quantizations: extended and full.

Does is_legal=3DFalse refer to extended or full? The documentation
does not say.

However, given that changing 'bits' value with is_legal=3DFalse does not
change the result, and with is_legal=3DTrue it does change the result, I
suspect is_legal=3DFalse means full range, not extended range.

So I think the python snippet is correct.

> +	 *                                  bits =3D 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt601_full =3D {
> +		.matrix =3D {
> +			{ 4294967296, 0,           6021544149 },
> +			{ 4294967296, -1478054095, -3067191994 },
> +			{ 4294967296, 7610682049,  0 },
> +		},
> +		.y_offset =3D 0,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.=
601"],
> +	 *                                  is_legal =3D True,
> +	 *                                  bits =3D 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt601_limited =3D {
> +		.matrix =3D {
> +			{ 5020601039, 0,           6881764740 },
> +			{ 5020601039, -1689204679, -3505362278 },
> +			{ 5020601039, 8697922339,  0 },
> +		},
> +		.y_offset =3D 16,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.=
709"],
> +	 *                                  is_legal =3D False,
> +	 *                                  bits =3D 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt709_full =3D {
> +		.matrix =3D {
> +			{ 4294967296, 0,          6763714498 },
> +			{ 4294967296, -804551626, -2010578443 },
> +			{ 4294967296, 7969741314, 0 },
> +		},
> +		.y_offset =3D 0,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.=
709"],
> +	 *                                  is_legal =3D True,
> +	 *                                  bits =3D 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt709_limited =3D {
> +		.matrix =3D {
> +			{ 5020601039, 0,          7729959424 },
> +			{ 5020601039, -919487572, -2297803934 },
> +			{ 5020601039, 9108275786, 0 },
> +		},
> +		.y_offset =3D 16,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.=
2020"],
> +	 *                                  is_legal =3D False,
> +	 *                                  bits =3D 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt2020_full =3D {
> +		.matrix =3D {
> +			{ 4294967296, 0,          6333358775 },
> +			{ 4294967296, -706750298, -2453942994 },
> +			{ 4294967296, 8080551471, 0 },
> +		},
> +		.y_offset =3D 0,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.=
2020"],
> +	 *                                  is_legal =3D True,
> +	 *                                  bits =3D 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt2020_limited =3D {
> +		.matrix =3D {
> +			{ 5020601039, 0,          7238124312 },
> +			{ 5020601039, -807714626, -2804506279 },
> +			{ 5020601039, 9234915964, 0 },
> +		},
> +		.y_offset =3D 16,
> +	};
> +
> +	/*
> +	 * The next matrices are just the previous ones, but with the first and
> +	 * second columns swapped

As I mentioned earlier, you could derive those below from the above
matrices in code, so you don't need all these open-coded.

You also would not need twice the switch-ladders below, you'd only need
a 'bool need_to_swap_columns' from the pixel format.

You could also have a 'bool limited_range', and do

	case DRM_COLOR_YCBCR_BT601:
		return limited_range ? &yuv_bt601_limited : &yuv_bt601_full;


> +	 */
> +	static struct conversion_matrix yvu_bt601_full =3D {
> +		.matrix =3D {
> +			{ 4294967296, 6021544149,  0 },
> +			{ 4294967296, -3067191994, -1478054095 },
> +			{ 4294967296, 0,           7610682049 },
> +		},
> +		.y_offset =3D 0,
> +	};
> +	static struct conversion_matrix yvu_bt601_limited =3D {
> +		.matrix =3D {
> +			{ 5020601039, 6881764740,  0 },
> +			{ 5020601039, -3505362278, -1689204679 },
> +			{ 5020601039, 0,           8697922339 },
> +		},
> +		.y_offset =3D 16,
> +	};
> +	static struct conversion_matrix yvu_bt709_full =3D {
> +		.matrix =3D {
> +			{ 4294967296, 6763714498,  0 },
> +			{ 4294967296, -2010578443, -804551626 },
> +			{ 4294967296, 0,           7969741314 },
> +		},
> +		.y_offset =3D 0,
> +	};
> +	static struct conversion_matrix yvu_bt709_limited =3D {
> +		.matrix =3D {
> +			{ 5020601039, 7729959424,  0 },
> +			{ 5020601039, -2297803934, -919487572 },
> +			{ 5020601039, 0,           9108275786 },
> +		},
> +		.y_offset =3D 16,
> +	};
> +	static struct conversion_matrix yvu_bt2020_full =3D {
> +		.matrix =3D {
> +			{ 4294967296, 6333358775,  0 },
> +			{ 4294967296, -2453942994, -706750298 },
> +			{ 4294967296, 0,           8080551471 },
> +		},
> +		.y_offset =3D 0,
> +	};
> +	static struct conversion_matrix yvu_bt2020_limited =3D {
> +		.matrix =3D {
> +			{ 5020601039, 7238124312,  0 },
> +			{ 5020601039, -2804506279, -807714626 },
> +			{ 5020601039, 0,           9234915964 },
> +		},
> +		.y_offset =3D 16,
> +	};
> +
> +	/* Breaking in this switch means that the color format+encoding+range i=
s not supported */
> +	switch (format) {
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +		switch (encoding) {
> +		case DRM_COLOR_YCBCR_BT601:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yuv_bt601_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yuv_bt601_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT709:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yuv_bt709_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yuv_bt709_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT2020:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yuv_bt2020_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yuv_bt2020_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_ENCODING_MAX:
> +			break;
> +		}
> +		break;
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		switch (encoding) {
> +		case DRM_COLOR_YCBCR_BT601:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yvu_bt601_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yvu_bt601_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT709:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yvu_bt709_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yvu_bt709_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT2020:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yvu_bt2020_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yvu_bt2020_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_ENCODING_MAX:
> +			break;
> +		}
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB16161616:
> +	case DRM_FORMAT_XRGB16161616:
> +	case DRM_FORMAT_RGB565:
> +		/*
> +		 * Those formats are supported, but they don't need a conversion matri=
x. Return
> +		 * a valid pointer to avoid kernel panic in case this matrix is used/c=
hecked
> +		 * somewhere.
> +		 */
> +		return &no_operation;
> +	default:
> +		break;
> +	}
> +	WARN(true, "Unsupported encoding (%d), range (%d) and format (%p4cc) co=
mbination\n",
> +	     encoding, range, &format);
> +	return &no_operation;
> +}
> +
>  /**
>   * Retrieve the correct write_pixel function for a specific format.
>   * If the format is not supported by VKMS a warn is emitted and a dummy =
"don't do anything"
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index 8d2bef95ff79..e1d324764b17 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format=
);
> =20
>  pixel_write_t get_pixel_write_function(u32 format);
> =20
> +struct conversion_matrix *
> +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding en=
coding,
> +				  enum drm_color_range range);
> +
>  #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 8875bed76410..987dd2b686a8 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -17,7 +17,19 @@ static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_XRGB16161616,
>  	DRM_FORMAT_ARGB16161616,
> -	DRM_FORMAT_RGB565
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV24,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_NV42,
> +	DRM_FORMAT_YUV420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YVU444
>  };
> =20
>  static struct drm_plane_state *
> @@ -117,12 +129,15 @@ static void vkms_plane_atomic_update(struct drm_pla=
ne *plane,
>  	drm_framebuffer_get(frame_info->fb);
>  	frame_info->rotation =3D drm_rotation_simplify(new_state->rotation, DRM=
_MODE_ROTATE_0 |
>  									  DRM_MODE_ROTATE_90 |
> +									  DRM_MODE_ROTATE_180 |
>  									  DRM_MODE_ROTATE_270 |
>  									  DRM_MODE_REFLECT_X |
>  									  DRM_MODE_REFLECT_Y);
> =20
> =20
>  	vkms_plane_state->pixel_read_line =3D get_pixel_read_line_function(fmt);
> +	vkms_plane_state->conversion_matrix =3D get_conversion_matrix_to_argb_u=
16
> +		(fmt, new_state->color_encoding, new_state->color_range);
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
>=20

I couldn't pinpoint what would need to be fixed so that rotation would
not change chroma siting, but I also cannot say that chroma siting is
definitely correct already.


Thanks,
pq

--Sig_/e7LaFHFZy=Po2hc=D/wn.K4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYEK8sACgkQI1/ltBGq
qqdDqw//eWbnn2J85Ggr5eRsqWsKAmZWrOvOd6rwDsTvlCpK98soddMIYwJmTgfL
8N6yz8TshsPOkwbFEcNVuPV0A6QHSp/EH/zKvQZxHepgkGYEjkBxKxKksgnvPwcS
Y5XRtAZGQfaZABbxfJyNgmTkZI3F9D9lqfxRDbBdVo7Pmo39EpP/6D5mw0eFSkdQ
zYIpHStC2+SW33lSfaRR05CtTi6QHoIuvrRIIPI3BmcOeeoz0VC6EcMxsSQVbDPl
gCbXqy60vfqS8+0LmASiuvjetLvmFvMPWEN3bf4h8/0UK1xhIx5o0+0GhL2X3fCv
NWcLZJFBaV6UWuJy+EFz3atxE9oUgOAC9Ik9gQZSTnldSnwMID4ff2jhXIxHX0cj
vJ450dDK2fIYGwmbutkhJ072h51LP24/9mkulsX9iKlTl3IucVZHK8lh9E8dnnfl
+UugspS4XejAjorSHjyNlTVpwP3vo2rwI7T2x9IGtWtGKqv7TWzKyt5Qqw0RMavm
l65gVHZe0es88zqC9fW3IfGuw3B7K0xUJwMF17qSOKknhhsKSIOA/dBalc7vw2MY
ybjMN+1rqmpeXH6ZYx5Gc1ZKPcro8/Y+gpZd+IvCdCjwjka+fg0daM+Ve6Pbpoat
Oik0jdIDK7lKQ0mQm6GmK2FOEkpxbpP/HLClPhEQrWWJ76C6Yow=
=Cn6g
-----END PGP SIGNATURE-----

--Sig_/e7LaFHFZy=Po2hc=D/wn.K4--
