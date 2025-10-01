Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF66FBB043C
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 14:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4FB10E30E;
	Wed,  1 Oct 2025 12:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j97wEFFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16910E30E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 12:01:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 687221A0FF1;
 Wed,  1 Oct 2025 12:01:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33E93606BF;
 Wed,  1 Oct 2025 12:01:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A1CA102F1A26; 
 Wed,  1 Oct 2025 14:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759320089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=f7Vs+UtggQhVD9yDZ2zXFKgdOChhKrnnWyLa/JEiQ1Y=;
 b=j97wEFFJQRX8HZEsTQLh1lgfWRaDhsDIpTSCIM0V+YklHJG/BqKEnyOQ+i3l44oX/rmL67
 EcX8uVQDGBCYjBfitIqiglbFUNxbIYqGpWI8eSkxvbyaB4L+uNwPeJCIUXGqjXXtL1gJpU
 XVlFweRQghPuhouhc54D2hG/hSD8BTV3fMLRzVZaMn4AQRxKmETYIY5zUSI/v6LjMmRpYj
 VVm9z2JsJUc0gu8COE8vuLs6Q14laLvl1Xbg5gKDBssULsirhTd0iT7RjFQ76bxEUc3dwt
 9vW1WG3hqeTOjqTr8LwstgK2PsQiblF+Oxy/jEfKQ2i71W+sGgQd8VvQMwPE9Q==
Message-ID: <31e35ddf-1a61-4ca0-aff4-f026de6e9fd7@bootlin.com>
Date: Wed, 1 Oct 2025 14:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v1 4/5] drm/vkms: Add support for writing semiplanar
 YUV/YCbCr formats
To: Robert Mader <robert.mader@collabora.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Stone <daniels@collabora.com>, Melissa Wen
 <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250813170542.331206-1-robert.mader@collabora.com>
 <20250813170542.331206-5-robert.mader@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250813170542.331206-5-robert.mader@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 13/08/2025 à 19:05, Robert Mader a écrit :
> Analogous to the existing pixel_read_line_t and vkms_plane_state
> implementation.
> 
> Note that the chroma siting is implecitely set ITU-T Rec.H.273
> Chroma420SampleLocType 2, which should match the existing plane code
> and the corresponding Mesa shader paths.
> 
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>   drivers/gpu/drm/vkms/tests/vkms_format_test.c |  51 ++++--
>   drivers/gpu/drm/vkms/vkms_drv.h               |  36 +++-
>   drivers/gpu/drm/vkms/vkms_formats.c           | 172 ++++++++++++++++--
>   drivers/gpu/drm/vkms/vkms_formats.h           |   3 +
>   4 files changed, 225 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> index a7788fbc45dc..68b070160dca 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -13,19 +13,6 @@
>   
>   MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
>   
> -/**
> - * struct pixel_yuv_u16 - Internal representation of a pixel color.
> - * @y: Luma value, stored in 16 bits, without padding, using
> - *     machine endianness
> - * @u: Blue difference chroma value, stored in 16 bits, without padding, using
> - *     machine endianness
> - * @v: Red difference chroma value, stored in 16 bits, without padding, using
> - *     machine endianness
> - */
> -struct pixel_yuv_u16 {
> -	u16 y, u, v;
> -};
> -
>   /*
>    * struct yuv_u16_to_argb_u16_case - Reference values to test the color
>    * conversions in VKMS between YUV to ARGB
> @@ -252,6 +239,43 @@ static void vkms_format_test_yuv_u16_to_argb_u16(struct kunit *test)
>   	}
>   }
>   
> +/*
> + * vkms_format_test_yuv_u16_to_argb_u16 - Testing the conversion between ARGB
> + * colors to YUV colors in VKMS
> + *
> + * This test will use the functions get_conversion_matrix_from_argb_u16 and
> + * yuv161616_from_argb_u16 to convert ARGB colors (stored in
> + * yuv_u16_to_argb_u16_cases) into YUV colors.
> + *
> + * The conversion between YUV and RGB is not totally reversible, so there may be
> + * some difference between the expected value and the result.
> + */
> +static void vkms_format_test_argb_u16_to_yuv_u16(struct kunit *test)
> +{
> +	const struct yuv_u16_to_argb_u16_case *param = test->param_value;
> +	struct pixel_yuv_u16 yuv;
> +
> +	for (size_t i = 0; i < param->n_colors; i++) {
> +		const struct format_pair *color = &param->colors[i];
> +		struct conversion_matrix matrix;
> +
> +		get_conversion_matrix_from_argb_u16
> +			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
> +
> +		yuv = yuv161616_from_argb_u16(&matrix, &color->argb);
> +
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(color->yuv.y, yuv.y), 0x1ff,
> +				    "On the Y channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->yuv.y, yuv.y);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(color->yuv.u, yuv.u), 0x1ff,
> +				    "On the U channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->yuv.u, yuv.u);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(color->yuv.v, yuv.v), 0x1ff,
> +				    "On the V channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->yuv.v, yuv.v);
> +	}
> +}
> +
>   static void vkms_format_test_yuv_u16_to_argb_u16_case_desc(struct yuv_u16_to_argb_u16_case *t,
>   							   char *desc)
>   {
> @@ -265,6 +289,7 @@ KUNIT_ARRAY_PARAM(yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_cases,
>   
>   static struct kunit_case vkms_format_test_cases[] = {
>   	KUNIT_CASE_PARAM(vkms_format_test_yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_gen_params),
> +	KUNIT_CASE_PARAM(vkms_format_test_argb_u16_to_yuv_u16, yuv_u16_to_argb_u16_gen_params),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 7fa58e17c286..29dddc973ef6 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -66,21 +66,24 @@ struct pixel_argb_u16 {
>   	u16 a, r, g, b;
>   };
>   
> +/**
> + * struct pixel_yuv_u16 - Internal representation of a pixel color.
> + * @y: Luma value, stored in 16 bits, without padding, using
> + *     machine endianness
> + * @u: Blue difference chroma value, stored in 16 bits, without padding, using
> + *     machine endianness
> + * @v: Red difference chroma value, stored in 16 bits, without padding, using
> + *     machine endianness
> + */
> +struct pixel_yuv_u16 {
> +	u16 y, u, v;
> +};
> +
>   struct line_buffer {
>   	size_t n_pixels;
>   	struct pixel_argb_u16 *pixels;
>   };
>   
> -/**
> - * typedef pixel_write_t - These functions are used to read a pixel from a
> - * &struct pixel_argb_u16, convert it in a specific format and write it in the @out_pixel
> - * buffer.
> - *
> - * @out_pixel: destination address to write the pixel
> - * @in_pixel: pixel to write
> - */
> -typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
> -
>   /**
>    * struct conversion_matrix - Matrix to use for a specific encoding and range
>    *
> @@ -97,6 +100,19 @@ struct conversion_matrix {
>   	int y_offset;
>   };
>   
> +/**
> + * typedef pixel_write_t - These functions are used to read a pixel from a
> + * &struct pixel_argb_u16, convert it in a specific format and write it in the @out_pixel
> + * buffer.
> + *

Can you document the new parameters?

> + * @out_pixel: destination address to write the pixel
> + * @in_pixel: pixel to write
> + */
> +typedef void (*pixel_write_t)(const struct conversion_matrix *matrix,
> +			      u8 *out_pixel, u8 *out_pixel_plane_2,
> +			      u8 *out_pixel_plane_3,
> +			      const struct pixel_argb_u16 *in_pixel);
> +
>   struct vkms_writeback_job {
>   	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>   	struct vkms_frame_info wb_frame_info;
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 560b56fbf4fb..048268304c27 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -585,7 +585,9 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
>    * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
>    * the writeback buffer.
>    */
> -static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_ARGB8888(const struct conversion_matrix *matrix,
> +				 u8 *out_pixel, u8 *out_pixel_plane_2, u8 *out_pixel_plane_3,
> +				 const struct pixel_argb_u16 *in_pixel)
>   {
>   	/*
>   	 * This sequence below is important because the format's byte order is
> @@ -603,7 +605,10 @@ static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_
>   	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
>   }
>   
> -static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_XRGB8888(const struct conversion_matrix *matrix,
> +				 u8 *out_pixel, u8 *out_pixel_plane_2,
> +				 u8 *out_pixel_plane_3,
> +				 const struct pixel_argb_u16 *in_pixel)
>   {
>   	out_pixel[3] = 0xff;
>   	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> @@ -611,7 +616,10 @@ static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_
>   	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
>   }
>   
> -static void argb_u16_to_ABGR8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_ABGR8888(const struct conversion_matrix *matrix,
> +				 u8 *out_pixel, u8 *out_pixel_plane_2,
> +				 u8 *out_pixel_plane_3,
> +				 const struct pixel_argb_u16 *in_pixel)
>   {
>   	out_pixel[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
>   	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> @@ -619,7 +627,10 @@ static void argb_u16_to_ABGR8888(u8 *out_pixel, const struct pixel_argb_u16 *in_
>   	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
>   }
>   
> -static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_ARGB16161616(const struct conversion_matrix *matrix,
> +				     u8 *out_pixel, u8 *out_pixel_plane_2,
> +				     u8 *out_pixel_plane_3,
> +				     const struct pixel_argb_u16 *in_pixel)
>   {
>   	__le16 *pixel = (__le16 *)out_pixel;
>   
> @@ -629,7 +640,10 @@ static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_argb_u16
>   	pixel[0] = cpu_to_le16(in_pixel->b);
>   }
>   
> -static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_XRGB16161616(const struct conversion_matrix *matrix,
> +				     u8 *out_pixel, u8 *out_pixel_plane_2,
> +				     u8 *out_pixel_plane_3,
> +				     const struct pixel_argb_u16 *in_pixel)
>   {
>   	__le16 *pixel = (__le16 *)out_pixel;
>   
> @@ -639,7 +653,10 @@ static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_argb_u16
>   	pixel[0] = cpu_to_le16(in_pixel->b);
>   }
>   
> -static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_RGB565(const struct conversion_matrix *matrix,
> +			       u8 *out_pixel, u8 *out_pixel_plane_2,
> +			       u8 *out_pixel_plane_3,
> +			       const struct pixel_argb_u16 *in_pixel)
>   {
>   	__le16 *pixel = (__le16 *)out_pixel;
>   
> @@ -657,6 +674,96 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
>   	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
>   }
>   
> +VISIBLE_IF_KUNIT
> +struct pixel_yuv_u16 yuv161616_from_argb_u16(const struct conversion_matrix *matrix,
> +					     const struct pixel_argb_u16 *in_pixel)
> +{
> +	struct pixel_yuv_u16 out_pixel;
> +	s64 fp_r, fp_g, fp_b;
> +	s64 fp_y, fp_channel_1, fp_channel_2;
> +
> +	fp_r = drm_int2fixp((int)in_pixel->r * 257);
> +	fp_g = drm_int2fixp((int)in_pixel->g * 257);
> +	fp_b = drm_int2fixp((int)in_pixel->b * 257);
> +
> +	fp_y = drm_fixp_mul(matrix->matrix[0][0], fp_r) +
> +	       drm_fixp_mul(matrix->matrix[0][1], fp_g) +
> +	       drm_fixp_mul(matrix->matrix[0][2], fp_b);
> +	fp_channel_1 = drm_fixp_mul(matrix->matrix[1][0], fp_r) +
> +		       drm_fixp_mul(matrix->matrix[1][1], fp_g) +
> +		       drm_fixp_mul(matrix->matrix[1][2], fp_b);
> +	fp_channel_2 = drm_fixp_mul(matrix->matrix[2][0], fp_r) +
> +		       drm_fixp_mul(matrix->matrix[2][1], fp_g) +
> +		       drm_fixp_mul(matrix->matrix[2][2], fp_b);
> +
> +	fp_y = drm_fixp2int_round(fp_y);
> +	fp_channel_1 = drm_fixp2int_round(fp_channel_1);
> +	fp_channel_2 = drm_fixp2int_round(fp_channel_2);
> +
> +	fp_y = DIV_ROUND_CLOSEST(fp_y, 257);
> +	fp_channel_1 = DIV_ROUND_CLOSEST(fp_channel_1, 257);
> +	fp_channel_2 = DIV_ROUND_CLOSEST(fp_channel_2, 257);
> +
> +	fp_y += matrix->y_offset * 257;
> +	fp_channel_1 += 128 * 257;
> +	fp_channel_2 += 128 * 257;
> +
> +	out_pixel.y = clamp(fp_y, 0, 0xffff);
> +	out_pixel.u = clamp(fp_channel_1, 0, 0xffff);
> +	out_pixel.v = clamp(fp_channel_2, 0, 0xffff);
> +
> +	return out_pixel;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(yuv161616_from_argb_u16);
> +
> +static void argb_u16_to_YUV888_semiplanar_2plane(const struct conversion_matrix *matrix,
> +						 u8 *out_pixel,
> +						 u8 *out_pixel_plane_2,
> +						 u8 *out_pixel_plane_3,
> +						 const struct pixel_argb_u16 *in_pixel)
> +{
> +	struct pixel_yuv_u16 yuv;
> +
> +	yuv = yuv161616_from_argb_u16(matrix, in_pixel);
> +
> +	out_pixel[0] = DIV_ROUND_CLOSEST(yuv.y, 257);
> +	out_pixel_plane_2[0] = DIV_ROUND_CLOSEST(yuv.u, 257);
> +	out_pixel_plane_2[1] = DIV_ROUND_CLOSEST(yuv.v, 257);
> +}
> +
> +static void argb_u16_to_YUV161616_semiplanar_2plane(const struct conversion_matrix *matrix,
> +						    u8 *out_pixel,
> +						    u8 *out_pixel_plane_2,
> +						    u8 *out_pixel_plane_3,
> +						    const struct pixel_argb_u16 *in_pixel)
> +{
> +	struct pixel_yuv_u16 yuv;
> +
> +	yuv = yuv161616_from_argb_u16(matrix, in_pixel);
> +
> +	out_pixel[0] = yuv.y & 0xff;
> +	out_pixel[1] = yuv.y >> 8;
> +	out_pixel_plane_2[0] = yuv.u & 0xff;
> +	out_pixel_plane_2[1] = yuv.u >> 8;
> +	out_pixel_plane_2[2] = yuv.v & 0xff;
> +	out_pixel_plane_2[3] = yuv.v >> 8;
> +}
> +
> +static void argb_u16_to_YUV888_semiplanar_3plane(const struct conversion_matrix *matrix,
> +						 u8 *out_pixel,
> +						 u8 *out_pixel_plane_2,
> +						 u8 *out_pixel_plane_3,
> +						 const struct pixel_argb_u16 *in_pixel)
> +{
> +	struct pixel_yuv_u16 yuv;
> +
> +	yuv = yuv161616_from_argb_u16(matrix, in_pixel);
> +
> +	out_pixel[0] = DIV_ROUND_CLOSEST(yuv.y, 257);
> +	out_pixel_plane_2[0] = DIV_ROUND_CLOSEST(yuv.u, 257);
> +	out_pixel_plane_3[0] = DIV_ROUND_CLOSEST(yuv.v, 257);
> +}
> +
>   /**
>    * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
>    * after the blending to write a line in the writeback buffer.
> @@ -669,16 +776,35 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   			const struct line_buffer *src_buffer, int y)
>   {
>   	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
> -	int x_dst = frame_info->dst.x1;
> -	u8 *dst_pixels;
> -	int rem_x, rem_y;
> -
> -	packed_pixels_addr(frame_info, x_dst, y, 0, &dst_pixels, &rem_x, &rem_y);
> +	const struct drm_format_info *format = frame_info->fb->format;
>   	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
> +	int x_limit;
> +
> +	x_limit= min_t(size_t, drm_rect_width(&frame_info->dst),
> +		       src_buffer->n_pixels);
> +
> +	for (size_t x = 0; x < x_limit; x++) {
> +		u8 *plane_1;
> +		u8 *plane_2 = NULL;
> +		u8 *plane_3 = NULL;
> +
> +		packed_pixels_addr_1x1(frame_info, x, y, 0, &plane_1);
> +		if (format->num_planes > 1) {
> +			packed_pixels_addr_1x1(frame_info,
> +					       x / frame_info->fb->format->hsub,
> +					       y / frame_info->fb->format->vsub, 1,
> +					       &plane_2);
> +		}
> +		if (format->num_planes > 2) {
> +			packed_pixels_addr_1x1(frame_info,
> +					       x / frame_info->fb->format->hsub,
> +					       y / frame_info->fb->format->vsub, 2,
> +					       &plane_3);
> +		}

To avoid performance issue, can you compute the base address of 
plane1/plane2/plane3 before the loop and only update the offset inside 
the loop, like planar_yuv_read_line.

>   
> -	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->fb->format->cpp[0])
> -		wb->pixel_write(dst_pixels, &in_pixels[x]);
> +		wb->pixel_write(&wb->conversion_matrix, plane_1, plane_2,
> +				plane_3, &in_pixels[x]);
> +	}
>   }
>   
>   /**
> @@ -1110,6 +1236,24 @@ pixel_write_t get_pixel_write_function(u32 format)
>   		return &argb_u16_to_XRGB16161616;
>   	case DRM_FORMAT_RGB565:
>   		return &argb_u16_to_RGB565;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		return &argb_u16_to_YUV888_semiplanar_2plane;
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		return &argb_u16_to_YUV161616_semiplanar_2plane;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +		return &argb_u16_to_YUV888_semiplanar_3plane;
>   	default:
>   		/*
>   		 * This is a bug in vkms_writeback_atomic_check. All the supported
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 9367672b6b43..bf317c3c058a 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -20,6 +20,9 @@ void get_conversion_matrix_from_argb_u16(u32 format, enum drm_color_encoding enc
>   #if IS_ENABLED(CONFIG_KUNIT)
>   struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
>   					      u16 y, u16 channel_1, u16 channel_2);
> +
> +struct pixel_yuv_u16 yuv161616_from_argb_u16(const struct conversion_matrix *matrix,
> +					     const struct pixel_argb_u16 *in_pixel);
>   #endif
>   
>   #endif /* _VKMS_FORMATS_H_ */

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


