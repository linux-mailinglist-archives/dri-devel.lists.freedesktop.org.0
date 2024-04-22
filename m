Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB98ACFDB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12C10E1A6;
	Mon, 22 Apr 2024 14:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1MQ+Tqbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9659710E1A6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713797250;
 bh=Y6uJ8OR4QHQSy1/6nKIm9u0cX+hi6Lch2omdJnSs3to=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1MQ+TqbuvMXFGdEFpWEMbhI0eFZfuyDh8RNLAXHjFji8xrO3nVvUFJQQKKTzZpBhn
 XIoW7vqZg5q2ZiKq+02PIaju9Jn+o3wTETUDi/phxiKr96/l1lw57IY1TLSxLivPz1
 xPDeOeLAUDHYGeGM2hmp4bc2ZKC+NcX+lhx6+lTRrhjesD/ZHEQkze2r9nhr5i5w4O
 Sb2MvVGbGTwYPvOF8I/8iliQz/DmlUv1maHReU3Br0UW6al+P10zdx7fXsZ8/H7DQG
 eUh4MRVv+aZl4E5BGtudLpqg697TbXOw6oNd/GCX01AYbScDZBWyJO9ddT++qCnt/5
 SAIPN0YFzLwEw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4915D3782123;
 Mon, 22 Apr 2024 14:47:29 +0000 (UTC)
Date: Mon, 22 Apr 2024 17:47:19 +0300
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
Subject: Re: [PATCH v6 12/17] drm/vkms: Add YUV support
Message-ID: <20240422174719.12f9ba2f.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-12-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-12-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yBBHk4gee2SlMKrzL2ZGVgC";
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

--Sig_/yBBHk4gee2SlMKrzL2ZGVgC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:30 +0200
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
> 32.32 fixed-point numbers and the drm_fixed helpers.
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
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - Adapted Arthur's work
> - Implemented the read_line_t callbacks for yuv
> - add struct conversion_matrix
> - store the whole conversion_matrix in the plane state
> - remove struct pixel_yuv_u8
> - update the commit message
> - Merge the modifications from Arthur]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  18 ++
>  drivers/gpu/drm/vkms/vkms_formats.c | 356 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/vkms/vkms_formats.h |   4 +
>  drivers/gpu/drm/vkms/vkms_plane.c   |  16 +-
>  4 files changed, 393 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index a62a11e67ab1..831454325d9d 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,17 +99,35 @@ typedef void (*pixel_read_line_t)(const struct vkms_p=
lane_state *plane, int x_st
>  				  int y_start, enum pixel_read_direction direction, int count,
>  				  struct pixel_argb_u16 out_pixel[]);
> =20
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
> + *  The values of the matrix are signed fixed-point values with 32 bits =
fractional part.
> + * @y_offset: Offset to apply on the y value.
> + */
> +struct conversion_matrix {
> +	s64 matrix[3][3];
> +	int y_offset;
> +};
> +
>  /**
>   * struct vkms_plane_state - Driver specific plane state
>   * @base: base plane state
>   * @frame_info: data required for composing computation
>   * @pixel_read_line: function to read a pixel line in this plane. The cr=
eator of a vkms_plane_state
>   * must ensure that this pointer is valid
> + * @conversion_matrix: matrix used for yuv formats to convert to rgb
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
>  	pixel_read_line_t pixel_read_line;
> +	struct conversion_matrix conversion_matrix;
>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 302c7f3ea54c..2d7445a3de93 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -134,6 +134,51 @@ static void packed_pixels_addr_1x1(const struct vkms=
_frame_info *frame_info,
>  	*addr =3D (u8 *)frame_info->map[0].vaddr + offset;
>  }
> =20
> +/**
> + * get_subsampling() - Get the subsampling divisor value on a specific d=
irection
> + *
> + * @format: format to extarct the subsampling from
> + * @direction: direction of the subsampling requested
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
> + *
> + * @direction: direction of the reading to properly compute this offset
> + * @x_start: x coordinate of the starting point of the readed line
> + * @y_start: y coordinate of the starting point of the readed line
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
>   * The following functions take pixel data (a, r, g, b, pixel, ...) and =
convert them to
>   * &struct pixel_argb_u16
> @@ -190,6 +235,38 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(co=
nst u16 *pixel)
>  	return out_pixel;
>  }
> =20
> +static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8=
 channel_2,
> +						  const struct conversion_matrix *matrix)
> +{
> +	u8 r, g, b;
> +	s64 fp_y, fp_channel_1, fp_channel_2;
> +	s64 fp_r, fp_g, fp_b;
> +
> +	fp_y =3D drm_int2fixp(((int)y - matrix->y_offset) * 257);
> +	fp_channel_1 =3D drm_int2fixp(((int)channel_1 - 128) * 257);
> +	fp_channel_2 =3D drm_int2fixp(((int)channel_2 - 128) * 257);
> +
> +	fp_r =3D drm_fixp_mul(matrix->matrix[0][0], fp_y) +
> +	       drm_fixp_mul(matrix->matrix[0][1], fp_channel_1) +
> +	       drm_fixp_mul(matrix->matrix[0][2], fp_channel_2);
> +	fp_g =3D drm_fixp_mul(matrix->matrix[1][0], fp_y) +
> +	       drm_fixp_mul(matrix->matrix[1][1], fp_channel_1) +
> +	       drm_fixp_mul(matrix->matrix[1][2], fp_channel_2);
> +	fp_b =3D drm_fixp_mul(matrix->matrix[2][0], fp_y) +
> +	       drm_fixp_mul(matrix->matrix[2][1], fp_channel_1) +
> +	       drm_fixp_mul(matrix->matrix[2][2], fp_channel_2);
> +
> +	fp_r =3D drm_fixp2int_round(fp_r);
> +	fp_g =3D drm_fixp2int_round(fp_g);
> +	fp_b =3D drm_fixp2int_round(fp_b);

Technically they are not fixed-point after fixp2int anymore.

Except there is a second level of the 16-bit encoding, that is, the 0 -
0xffff range that you convert to with the 257 multiplier. But that's
ok, the final result needs that, and the matrix is given in proper
fixed-point, so that all works out.

> +
> +	r =3D clamp(fp_r, 0, 0xffff);
> +	g =3D clamp(fp_g, 0, 0xffff);
> +	b =3D clamp(fp_b, 0, 0xffff);

You've declared r, g, b as u8, how does this work? Oh, you have that
fixed in the next patch.

Otherwise excellent.

I did come to think if it would make sense to have a

static u16
dot_product_clamp_u16(const s64 row[3], s64 fp_y, s64 fp_channel_1, s64 fp_=
channel_2)
{
	s64 v;

	v =3D drm_fixp_mul(row[0], fp_y) +
	    drm_fixp_mul(row[1], fp_channel_1) +
	    drm_fixp_mul(row[2], fp_channel_2);

	return clamp(drm_fixp2int_round(v), 0, 0xffff);
}

and then call that three times with different matrix rows, but I don't
know if that makes it any more readable than it already is.

> +
> +	return argb_u16_from_u16161616(0xffff, r, g, b);
> +}
> +
>  /*
>   * The following functions are read_line function for each pixel format =
supported by VKMS.
>   *
> @@ -318,6 +395,92 @@ static void RGB565_read_line(const struct vkms_plane=
_state *plane, int x_start,
>  	}
>  }
> =20
> +/*
> + * This callback can be used for YUV format where each color component is
> + * stored in a different plane (often called planar formats). It will

This function handles two planes, not three.

> + * handle correctly subsampling.

I vaguely remember us having a discussion about sub-sampling handling
not being fully correct sometimes, for vertical reading direction was
it? Or divisor greater than 2? I couldn't find that discussion again.
Does it apply here?

> + *
> + * The conversion matrix stored in the @plane is used to:
> + * - Apply the correct color range and encoding
> + * - Convert YUV and YVU with the same function (a simple column swap is
> + *   needed)

...a column swap is needed when setting up plane->conversion_matrix)

Otherwise one may wonder what swap where.

> + */
> +static void semi_planar_yuv_read_line(const struct vkms_plane_state *pla=
ne, int x_start,
> +				      int y_start, enum pixel_read_direction direction, int count,
> +				      struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane;
> +	u8 *uv_plane;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
> +			       &y_plane);
> +	packed_pixels_addr_1x1(plane->frame_info,
> +			       x_start / plane->frame_info->fb->format->hsub,
> +			       y_start / plane->frame_info->fb->format->vsub, 1,
> +			       &uv_plane);
> +	int step_y =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
> +	int step_uv =3D get_block_step_byte(plane->frame_info->fb, direction, 1=
);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(direction, x_start, y=
_start);
> +	const struct conversion_matrix *conversion_matrix =3D &plane->conversio=
n_matrix;
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
> + * This callback can be used for YUV formats where U and V values are
> + * stored in the same plane (often called semi-planar formats). It will

Ah, this doc belongs to the earlier function, and the doc there belongs
here.

> + * correctly handle subsampling.
> + *
> + * The conversion matrix stored in the @plane is used to:
> + * - Apply the correct color range and encoding
> + * - Convert YUV and YVU with the same function (a simple column swap is
> + *   needed)
> + */
> +static void planar_yuv_read_line(const struct vkms_plane_state *plane, i=
nt x_start,
> +				 int y_start, enum pixel_read_direction direction, int count,
> +				 struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane;
> +	u8 *channel_1_plane;
> +	u8 *channel_2_plane;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
> +			       &y_plane);
> +	packed_pixels_addr_1x1(plane->frame_info,
> +			       x_start / plane->frame_info->fb->format->hsub,
> +			       y_start / plane->frame_info->fb->format->vsub, 1,
> +			       &channel_1_plane);
> +	packed_pixels_addr_1x1(plane->frame_info,
> +			       x_start / plane->frame_info->fb->format->hsub,
> +			       y_start / plane->frame_info->fb->format->vsub, 2,
> +			       &channel_2_plane);
> +	int step_y =3D get_block_step_byte(plane->frame_info->fb, direction, 0);
> +	int step_channel_1 =3D get_block_step_byte(plane->frame_info->fb, direc=
tion, 1);
> +	int step_channel_2 =3D get_block_step_byte(plane->frame_info->fb, direc=
tion, 2);
> +	int subsampling =3D get_subsampling(plane->frame_info->fb->format, dire=
ction);
> +	int subsampling_offset =3D get_subsampling_offset(direction, x_start, y=
_start);
> +	const struct conversion_matrix *conversion_matrix =3D &plane->conversio=
n_matrix;
> +
> +	for (int i =3D 0; i < count; i++) {
> +		*out_pixel =3D argb_u16_from_yuv888(*y_plane, *channel_1_plane, *chann=
el_2_plane,
> +						  conversion_matrix);
> +		out_pixel +=3D 1;
> +		y_plane +=3D step_y;
> +		if ((i + subsampling_offset + 1) % subsampling =3D=3D 0) {
> +			channel_1_plane +=3D step_channel_1;
> +			channel_2_plane +=3D step_channel_2;
> +		}
> +	}
> +}
> +
>  /*
>   * The following functions take one &struct pixel_argb_u16 and convert i=
t to a specific format.
>   * The result is stored in @out_pixel.
> @@ -445,6 +608,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 f=
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
>  		 * This is a bug in vkms_plane_atomic_check(). All the supported
> @@ -462,6 +639,185 @@ pixel_read_line_t get_pixel_read_line_function(u32 =
format)
>  	}
>  }
> =20
> +/*
> + * Those matrices were generated using the colour python framework
> + *
> + * Below are the function calls used to generate each matrix, go to
> + * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbC=
r.html
> + * for more info:
> + *
> + * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.6=
01"],
> + *                                  is_legal =3D False,
> + *                                  bits =3D 8) * 2**32).astype(int)
> + */
> +static struct conversion_matrix no_operation =3D {

const

> +	.matrix =3D {
> +		{ 4294967296, 0,          0, },
> +		{ 0,          4294967296, 0, },
> +		{ 0,          0,          4294967296, },
> +	},
> +	.y_offset =3D 0,
> +};
> +
> +static const struct conversion_matrix yuv_bt601_full =3D {
> +	.matrix =3D {
> +		{ 4294967296, 0,           6021544149 },
> +		{ 4294967296, -1478054095, -3067191994 },
> +		{ 4294967296, 7610682049,  0 },
> +	},
> +	.y_offset =3D 0,
> +};
> +
> +/*
> + * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.6=
01"],
> + *                                  is_legal =3D True,
> + *                                  bits =3D 8) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix yuv_bt601_limited =3D {
> +	.matrix =3D {
> +		{ 5020601039, 0,           6881764740 },
> +		{ 5020601039, -1689204679, -3505362278 },
> +		{ 5020601039, 8697922339,  0 },
> +	},
> +	.y_offset =3D 16,
> +};
> +
> +/*
> + * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.7=
09"],
> + *                                  is_legal =3D False,
> + *                                  bits =3D 8) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix yuv_bt709_full =3D {
> +	.matrix =3D {
> +		{ 4294967296, 0,          6763714498 },
> +		{ 4294967296, -804551626, -2010578443 },
> +		{ 4294967296, 7969741314, 0 },
> +	},
> +	.y_offset =3D 0,
> +};
> +
> +/*
> + * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.7=
09"],
> + *                                  is_legal =3D True,
> + *                                  bits =3D 8) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix yuv_bt709_limited =3D {
> +	.matrix =3D {
> +		{ 5020601039, 0,          7729959424 },
> +		{ 5020601039, -919487572, -2297803934 },
> +		{ 5020601039, 9108275786, 0 },
> +	},
> +	.y_offset =3D 16,
> +};
> +
> +/*
> + * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.2=
020"],
> + *                                  is_legal =3D False,
> + *                                  bits =3D 8) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix yuv_bt2020_full =3D {
> +	.matrix =3D {
> +		{ 4294967296, 0,          6333358775 },
> +		{ 4294967296, -706750298, -2453942994 },
> +		{ 4294967296, 8080551471, 0 },
> +	},
> +	.y_offset =3D 0,
> +};
> +
> +/*
> + * numpy.around(colour.matrix_YCbCr(K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.2=
020"],
> + *                                  is_legal =3D True,
> + *                                  bits =3D 8) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix yuv_bt2020_limited =3D {
> +	.matrix =3D {
> +		{ 5020601039, 0,          7238124312 },
> +		{ 5020601039, -807714626, -2804506279 },
> +		{ 5020601039, 9234915964, 0 },
> +	},
> +	.y_offset =3D 16,
> +};
> +
> +/**
> + * swap_uv_columns() - Swap u and v column of a given matrix
> + *
> + * @matrix: Matrix in which column are swapped
> + */
> +static void swap_uv_columns(struct conversion_matrix *matrix)
> +{
> +	swap(matrix->matrix[0][2], matrix->matrix[0][1]);
> +	swap(matrix->matrix[1][2], matrix->matrix[1][1]);
> +	swap(matrix->matrix[2][2], matrix->matrix[2][1]);
> +}
> +
> +/**
> + * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb=
 conversion matrix for a
> + * given encoding and range.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
> + * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
> + * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matr=
ix
> + * @matrix: Pointer to store the value into
> + */
> +void get_conversion_matrix_to_argb_u16(u32 format,
> +				       enum drm_color_encoding encoding,
> +				       enum drm_color_range range,
> +				       struct conversion_matrix *matrix)
> +{
> +	const struct conversion_matrix *matrix_to_copy;
> +	bool limited_range;
> +
> +	switch (range) {
> +	case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +		limited_range =3D true;
> +		break;
> +	case DRM_COLOR_YCBCR_FULL_RANGE:
> +		limited_range =3D false;
> +		break;
> +	case DRM_COLOR_RANGE_MAX:
> +		limited_range =3D false;
> +		WARN_ONCE(true, "The requested range is not supported.");
> +		break;
> +	}
> +
> +	switch (encoding) {
> +	case DRM_COLOR_YCBCR_BT601:
> +		matrix_to_copy =3D limited_range ? &yuv_bt601_limited :
> +						 &yuv_bt601_full;
> +		break;
> +	case DRM_COLOR_YCBCR_BT709:
> +		matrix_to_copy =3D limited_range ? &yuv_bt709_limited :
> +						 &yuv_bt709_full;
> +		break;
> +	case DRM_COLOR_YCBCR_BT2020:
> +		matrix_to_copy =3D limited_range ? &yuv_bt2020_limited :
> +						 &yuv_bt2020_full;
> +		break;
> +	case DRM_COLOR_ENCODING_MAX:
> +		matrix_to_copy =3D &no_operation;
> +		WARN_ONCE(true, "The requested encoding is not supported.");
> +		break;
> +	}
> +
> +	memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
> +
> +	/*
> +	 * Breaking in this switch means that the color format + encoding + ran=
ge is not supported
> +	 */

Stale comment?

> +	switch (format) {
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		swap_uv_columns(matrix);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  /**
>   * get_pixel_write_function() - Retrieve the correct write_pixel functio=
n for a specific format.
>   * If the format is not supported by VKMS a warning is emitted and a dum=
my "don't do anything"
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index 8d2bef95ff79..d583855cb320 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format=
);
> =20
>  pixel_write_t get_pixel_write_function(u32 format);
> =20
> +void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encodi=
ng encoding,
> +				       enum drm_color_range range,
> +				       struct conversion_matrix *matrix);
> +
>  #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 5a028ee96c91..d4e375913122 100644
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
> +	DRM_FORMAT_YVU444,
>  };
> =20
>  static struct drm_plane_state *
> @@ -118,6 +130,8 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	frame_info->rotation =3D new_state->rotation;
> =20
>  	vkms_plane_state->pixel_read_line =3D get_pixel_read_line_function(fmt);
> +	get_conversion_matrix_to_argb_u16(fmt, new_state->color_encoding, new_s=
tate->color_range,
> +					  &vkms_plane_state->conversion_matrix);
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
>=20

Some comments, but nothing big, mostly cosmetic.


Thanks,
pq

--Sig_/yBBHk4gee2SlMKrzL2ZGVgC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYmeHcACgkQI1/ltBGq
qqea/BAAi78M8Co1CZOoXYoWbaY4dj6tcsCmD4Dq2waz6z/EB74CoOw3AqegNhrR
guKYdOg5WlkSDP/Ex+j/4aiVX7LgQWdHvaTVppcR418+XvI+ey+BHu/pTQpfFTnm
50ju52elerBvxyXT7ontw1vFPLK/Gy+AyLeeluIBQkXpkPuE6atI4l+473nC0D4V
/y4G2Xh1H/3yxWuecNPDxzFmp395gLA+00q80s5K44lYHIJo57/VlnW1bC281lYj
5rngpgTZCZIQWrZvzupAlQFIofwKUc9OH67R5LZ+K7UkSq0deS/4+Kc5ed2+bcpy
/0Kb0FPxj1h9LIbnJkwljear++o4ekmPe/wFZCeLOcknRsio0cKN1Bwe4v04Xa47
5/OQj1c7hu4KMiE9zzDAKtrUlgvmIrF0atyrWgxV/7fjEqE8VRfYxd6C7ktzuzug
5v82u/X1b9fuasXpa1pYv5aTAmmyuOPQxYe9UHihQEVc3AAdf1tM8V3NK8/H5VGD
yFnksLSjHNkGmr3u/5yNJB4hwmWZh3ryVuOHRhSUqArDovIETtatu1IwKWf8Za2C
HBRA9vmhGtuWF2OZc0QJbUUtomgnb3cu1hgFNFaYwhtcln7uU+2vAidbbz2/j+ce
b/97v9x2urpbG0VE0v/UwL+Zb6K8tGz38wr/CsnkM2QF8X32jc0=
=2RNS
-----END PGP SIGNATURE-----

--Sig_/yBBHk4gee2SlMKrzL2ZGVgC--
