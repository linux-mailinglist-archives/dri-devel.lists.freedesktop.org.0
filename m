Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD0BB03E4
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EDB10E6B0;
	Wed,  1 Oct 2025 11:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AMEXwPHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883D10E6B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:52:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 14BC04E40E65;
 Wed,  1 Oct 2025 11:52:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DCF2B606BF;
 Wed,  1 Oct 2025 11:52:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3E25102F1A1D; 
 Wed,  1 Oct 2025 13:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759319533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=vAaKReRqj5M0mLnQXTeduILCClECEn1y+pWERMFjqrM=;
 b=AMEXwPHydFbrIQ6jFJvB9VBwde168h41+q089BK+f23DJTkWTp4V5B5HPXdPl1Gz4OXvza
 3e5PJZVpgAO494PtRsETZJzkIwoR/5saj5v/3pnb45Rl0F1Vkuehxt5Co0L8HjiNUU8+nP
 OBd+JkRFT+syNwKPThC0QVg40lWqWcH+5t0rWAWYQBvG3SYQtKPQRKXzKTs25SiKzeXvBd
 96eTFDJ7zqPiYrsejxecdr4eZvOF3PSk9gJ3pCBD4FXv9lbDkvNYmQa8dZF0AUQP5YSyCn
 CODrn/S72Nnj6Ut1NKI8mVwD0+dl1popUg+leZo/0wYNuqajyPH2gcMpaA6tmw==
Message-ID: <baf41536-6376-4f31-9729-3efdc950f600@bootlin.com>
Date: Wed, 1 Oct 2025 13:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v1 2/5] drm/vkms: Add RGB to YUV conversion matrices
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
 <20250813170542.331206-3-robert.mader@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250813170542.331206-3-robert.mader@collabora.com>
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
> In preparation for YUV/YCbCr pixel format support in the writeback
> connector. The implementation is meant to mirror the existing
> get_conversion_matrix_to_argb_u16() as close as possible.
> 
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 153 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_formats.h |   4 +
>   2 files changed, 157 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index dfb8e13cba87..560b56fbf4fb 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -787,6 +787,20 @@ static const struct conversion_matrix yuv_bt601_full = {
>   	.y_offset = 0,
>   };
>   
> +/*
> + * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> + *                                                   is_legal = False,
> + *                                                   bits = 8)) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix rgb_to_yuv_bt601_full = {
> +	.matrix = {
> +		{ 1284195222, 2521145803,  489626272 },
> +		{ -724715136, -1422768512, 2147483648 },
> +		{ 2147483648, -1798249503, -349234145 },
> +	},
> +	.y_offset = 0,
> +};
> +
>   /*
>    * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
>    *                                  is_legal = True,
> @@ -801,6 +815,20 @@ static const struct conversion_matrix yuv_bt601_limited = {
>   	.y_offset = 16,
>   };
>   
> +/*
> + * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> + *                                                   is_legal = True,
> + *                                                   bits = 8)) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix rgb_to_yuv_bt601_limited = {
> +	.matrix = {
> +		{ 1102897073, 2165219336,  420502563 },
> +		{ -636612512, -1249804497, 1886417008 },
> +		{ 1886417008, -1579638779, -306778230 },
> +	},
> +	.y_offset = 16,
> +};
> +
>   /*
>    * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
>    *                                  is_legal = False,
> @@ -815,6 +843,20 @@ static const struct conversion_matrix yuv_bt709_full = {
>   	.y_offset = 0,
>   };
>   
> +/*
> + * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> + *                                                   is_legal = False,
> + *                                                   bits = 8)) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix rgb_to_yuv_bt709_full = {
> +	.matrix = {
> +		{ 913110047,  3071760610,  310096639 },
> +		{ -492083449, -1655400199, 2147483648 },
> +		{ 2147483648, -1950571889, -196911759 },
> +	},
> +	.y_offset = 0,
> +};
> +
>   /*
>    * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
>    *                                  is_legal = True,
> @@ -829,6 +871,20 @@ static const struct conversion_matrix yuv_bt709_limited = {
>   	.y_offset = 16,
>   };
>   
> +/*
> + * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> + *                                                   is_legal = True,
> + *                                                   bits = 8)) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix rgb_to_yuv_bt709_limited = {
> +	.matrix = {
> +		{ 784200393,  2638100289,  266318290 },
> +		{ -432261539, -1454155469, 1886417008 },
> +		{ 1886417008, -1713443541, -172973467 },
> +	},
> +	.y_offset = 16,
> +};
> +
>   /*
>    * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
>    *                                  is_legal = False,
> @@ -843,6 +899,20 @@ static const struct conversion_matrix yuv_bt2020_full = {
>   	.y_offset = 0,
>   };
>   
> +/*
> + * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> + *                                                   is_legal = False,
> + *                                                   bits = 8)) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix rgb_to_yuv_bt2020_full = {
> +	.matrix = {
> +		{ 1128287909, 2911987827,  254691561 },
> +		{ -599706553, -1547777095, 2147483648 },
> +		{ 2147483648, -1974764564, -172719084 },
> +	},
> +	.y_offset = 0,
> +};
> +
>   /*
>    * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
>    *                                  is_legal = True,
> @@ -857,6 +927,20 @@ static const struct conversion_matrix yuv_bt2020_limited = {
>   	.y_offset = 16,
>   };
>   
> +/*
> + * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> + *                                                   is_legal = True,
> + *                                                   bits = 8)) * 2**32).astype(int)
> + */
> +static const struct conversion_matrix rgb_to_yuv_bt2020_limited = {
> +	.matrix = {
> +		{ 969000204,  2500883663,  218735105 },
> +		{ -526801050, -1359615958, 1886417008 },
> +		{ 1886417008, -1734695147, -151721862 },
> +	},
> +	.y_offset = 16,
> +};
> +
>   /**
>    * swap_uv_columns() - Swap u and v column of a given matrix
>    *
> @@ -869,6 +953,18 @@ static void swap_uv_columns(struct conversion_matrix *matrix)
>   	swap(matrix->matrix[2][2], matrix->matrix[2][1]);
>   }
>   
> +/**
> + * swap_uv_columns_transposed() - Swap u and v column of a given matrix
> + *
> + * @matrix: Matrix in which column are swapped
> + */

I think this swap lines, not columns. Can you clarify how you use the 
matrix in conversion_matrix documentation? The documentation only 
explain how to use the matrix for yuv->rgb, not rgb->yuv.

> +static void swap_uv_columns_transposed(struct conversion_matrix *matrix)
> +{
> +	swap(matrix->matrix[1][0], matrix->matrix[2][0]);
> +	swap(matrix->matrix[1][1], matrix->matrix[2][1]);
> +	swap(matrix->matrix[1][2], matrix->matrix[2][2]);
> +}
> +
>   /**
>    * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
>    * given encoding and range.
> @@ -935,6 +1031,63 @@ void get_conversion_matrix_to_argb_u16(u32 format,
>   }
>   EXPORT_SYMBOL(get_conversion_matrix_to_argb_u16);
>
Can you add documentation here to explain that it will be a matrix to do 
rgb->yuv?

> +void get_conversion_matrix_from_argb_u16(u32 format,
> +					 enum drm_color_encoding encoding,
> +					 enum drm_color_range range,
> +					 struct conversion_matrix *matrix)
> +{
> +	const struct conversion_matrix *matrix_to_copy;
> +	bool limited_range;
> +
> +	switch (range) {
> +	case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +		limited_range = true;
> +		break;
> +	case DRM_COLOR_YCBCR_FULL_RANGE:
> +		limited_range = false;
> +		break;
> +	case DRM_COLOR_RANGE_MAX:
> +		limited_range = false;
> +		WARN_ONCE(true, "The requested range is not supported.");
> +		break;
> +	}
> +
> +	switch (encoding) {
> +	case DRM_COLOR_YCBCR_BT601:
> +		matrix_to_copy = limited_range ? &rgb_to_yuv_bt601_limited :
> +						 &rgb_to_yuv_bt601_full;
> +		break;
> +	case DRM_COLOR_YCBCR_BT709:
> +		matrix_to_copy = limited_range ? &rgb_to_yuv_bt709_limited :
> +						 &rgb_to_yuv_bt709_full;
> +		break;
> +	case DRM_COLOR_YCBCR_BT2020:
> +		matrix_to_copy = limited_range ? &rgb_to_yuv_bt2020_limited :
> +						 &rgb_to_yuv_bt2020_full;
> +		break;
> +	case DRM_COLOR_ENCODING_MAX:
> +		matrix_to_copy = &no_operation;
> +		WARN_ONCE(true, "The requested encoding is not supported.");
> +		break;
> +	}
> +
> +	memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
> +
> +	switch (format) {
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		swap_uv_columns_transposed(matrix);
> +		break;

(I also like the idea to have a "is_uv_swap" function)

> +	default:
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL(get_conversion_matrix_from_argb_u16);
> +
>   /**
>    * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
>    * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index eeb208cdd6b1..9367672b6b43 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -13,6 +13,10 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
>   				       enum drm_color_range range,
>   				       struct conversion_matrix *matrix);
>   
> +void get_conversion_matrix_from_argb_u16(u32 format, enum drm_color_encoding encoding,
> +					 enum drm_color_range range,
> +					 struct conversion_matrix *matrix);
> +
>   #if IS_ENABLED(CONFIG_KUNIT)
>   struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
>   					      u16 y, u16 channel_1, u16 channel_2);

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


