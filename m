Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE9655091
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA2910E643;
	Fri, 23 Dec 2022 12:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584210E643
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:44:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id co23so4485313wrb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9W36LKlGXwFUVUByxPnEJI/HuynJFCbtFyqWXrQq4Pc=;
 b=GVDZqtoeUEdgkMLjKsBtW89iVLMt1HfGjn6JW2NLjT2+wEe/Nl/o/E9/Mbxn4tTIXi
 3sSPOtg4w7WWb3erou1bIVzkx71oYPR790E2xXa6zAbzPLsa9RQOsTIV26Egd2bd1LyV
 UHvJUJZIbr1FEes2/Smgbjby/eNx4K+sgQAAmxJgaweYlZcFD1Fg3s/bl195awZlugja
 ukUVG5EuE3TVCM2X/jy4xo8Z+fxXNgoN+6UwgcnkW4nTX6ZmWxZQABNaOZM5uL2vKhVN
 STseph2B3xth1/xjWjuhVzZiTUWvgOSBqw+X0Mnc3BtBF9TiRglMp8vM9ovRa1yd/Ufg
 2+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9W36LKlGXwFUVUByxPnEJI/HuynJFCbtFyqWXrQq4Pc=;
 b=oD3WvLr62iZWVNpDziDPbl9xb5dV5vnO2OYEGC4DK3DpbfyuKhZKuK0PTyctS30OnC
 TwdCV0hq6Wo4l0LcW6b2jj+vkPnpxThwbnO/cYOIorOJzQGEGOy5ZVpEFKrmxcHHTSIw
 7qHhcPV+q+mIRIEt+7Vt7IhGdvS/4Ob48XxUrvzqDyTDCLVZoMGQNxc6TAaVi62hDYJL
 UKAty/KArn0DuaFzCgtqXOEZ4k7dcF1RJyBFHm71Ukg92QlMnq+nltMc9DbYoZ0BqE+a
 mAY991UOQvUVJ2tRir/MOj7I5f/QZovoJHIkO9J0Rk5CzpI5M8XakQbf9eAOqwgM1V2i
 khzw==
X-Gm-Message-State: AFqh2kr/1NSeShkrKAenqr4i7QEhpFTwfiZ3w+0KnzPq6SA28YXbY+lO
 sHUT3gZivenRld1bzmiKo04=
X-Google-Smtp-Source: AMrXdXsL7uqLORz+Rc6+Lhf7lPnEEqeWijAGWE47CWflf4I5x6Zoyc7VuWMmNPDhlBO5ockykkbHhg==
X-Received: by 2002:adf:a50c:0:b0:241:faf0:17ec with SMTP id
 i12-20020adfa50c000000b00241faf017ecmr6660447wrb.4.1671799486376; 
 Fri, 23 Dec 2022 04:44:46 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 j1-20020adfff81000000b0024cb961b6aesm2857822wrr.104.2022.12.23.04.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:44:45 -0800 (PST)
Date: Fri, 23 Dec 2022 13:44:43 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 07/13] drm/format-helper: Add conversion from XRGB8888
 to ARGB8888
Message-ID: <Y6Wiu8ZXS5FzkBkT@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-8-tzimmermann@suse.de>
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
Cc: javierm@redhat.com, mairacanal@riseup.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Compiling this patch with sparse enabled (you can do it from the KUnit
tests adding "--make_options C=2") throws a warning:

drm_format_helper.c:614:27: warning: incorrect type in assignment (different base types)
drm_format_helper.c:614:27:    expected unsigned int [usertype]
drm_format_helper.c:614:27:    got restricted __le32 [usertype]

You might want to silence the warning with...

On Tue, Dec 20, 2022 at 05:11:39PM +0100, Thomas Zimmermann wrote:
> Add dedicated helper to convert from XRGB8888 to ARGB8888. Sets
> all alpha bits to make pixels fully opaque.
> 
> v2:
> 	* use cpubuf_to_le32()
> 	* type fixes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_format_helper.c           | 53 +++++++++++++++-
>  .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
>  include/drm/drm_format_helper.h               |  3 +
>  3 files changed, 117 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 36d2ca9d0f01..23837b202988 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -446,6 +446,54 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>  
> +static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	u32 *dbuf32 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		pix |= GENMASK(31, 24); /* fill alpha bits */
> +		dbuf32[x] = cpu_to_le32(pix);

- dbuf32[x] = cpu_to_le32(pix);
+ dbuf32[x] = (__force u32)cpu_to_le32(pix);

Other than that:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_argb8888 - Convert XRGB8888 to ARGB8888 clip buffer
> + * @dst: Array of ARGB8888 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. The parameters @dst, @dst_pitch and @src refer
> + * to arrays. Each array must have at least as many entries as there are planes in
> + * @fb's format. Each entry stores the value for the format's respective color plane
> + * at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for ARGB8888 devices that don't support XRGB8888
> + * natively. It sets an opaque alpha channel as part of the conversion.
> + */
> +void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
> +		    drm_fb_xrgb8888_to_argb8888_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
> +
>  static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le32 *dbuf32 = dbuf;
> @@ -646,8 +694,6 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  	/* treat alpha channel like filler bits */
>  	if (fb_format == DRM_FORMAT_ARGB8888)
>  		fb_format = DRM_FORMAT_XRGB8888;
> -	if (dst_format == DRM_FORMAT_ARGB8888)
> -		dst_format = DRM_FORMAT_XRGB8888;
>  	if (fb_format == DRM_FORMAT_ARGB2101010)
>  		fb_format = DRM_FORMAT_XRGB2101010;
>  	if (dst_format == DRM_FORMAT_ARGB2101010)
> @@ -669,6 +715,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		} else if (dst_format == DRM_FORMAT_RGB888) {
>  			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
>  			return 0;
> +		} else if (dst_format == DRM_FORMAT_ARGB8888) {
> +			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip);
> +			return 0;
>  		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
>  			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
>  			return 0;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index c2411ec808a1..bc969413a412 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -37,6 +37,11 @@ struct convert_to_rgb888_result {
>  	const u8 expected[TEST_BUF_SIZE];
>  };
>  
> +struct convert_to_argb8888_result {
> +	unsigned int dst_pitch;
> +	const u32 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_to_xrgb2101010_result {
>  	unsigned int dst_pitch;
>  	const u32 expected[TEST_BUF_SIZE];
> @@ -51,6 +56,7 @@ struct convert_xrgb8888_case {
>  	struct convert_to_rgb332_result rgb332_result;
>  	struct convert_to_rgb565_result rgb565_result;
>  	struct convert_to_rgb888_result rgb888_result;
> +	struct convert_to_argb8888_result argb8888_result;
>  	struct convert_to_xrgb2101010_result xrgb2101010_result;
>  };
>  
> @@ -77,6 +83,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.dst_pitch = 0,
>  			.expected = { 0x00, 0x00, 0xFF },
>  		},
> +		.argb8888_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xFFFF0000 },
> +		},
>  		.xrgb2101010_result = {
>  			.dst_pitch = 0,
>  			.expected = { 0x3FF00000 },
> @@ -107,6 +117,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.dst_pitch = 0,
>  			.expected = { 0x00, 0x00, 0xFF },
>  		},
> +		.argb8888_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xFFFF0000 },
> +		},
>  		.xrgb2101010_result = {
>  			.dst_pitch = 0,
>  			.expected = { 0x3FF00000 },
> @@ -169,6 +183,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
>  			},
>  		},
> +		.argb8888_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0xFFFFFFFF, 0xFF000000,
> +				0xFFFF0000, 0xFF00FF00,
> +				0xFF0000FF, 0xFFFF00FF,
> +				0xFFFFFF00, 0xFF00FFFF,
> +			},
> +		},
>  		.xrgb2101010_result = {
>  			.dst_pitch = 0,
>  			.expected = {
> @@ -229,6 +252,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>  			},
>  		},
> +		.argb8888_result = {
> +			.dst_pitch = 20,
> +			.expected = {
> +				0xFF0E449C, 0xFF114D05, 0xFFA80303, 0x00000000, 0x00000000,
> +				0xFF6C7073, 0xFF0E449C, 0xFF114D05, 0x00000000, 0x00000000,
> +				0xFFA80303, 0xFF6C7073, 0xFF0E449C, 0x00000000, 0x00000000,
> +			},
> +		},
>  		.xrgb2101010_result = {
>  			.dst_pitch = 20,
>  			.expected = {
> @@ -448,6 +479,37 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
>  
> +static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_argb8888_result *result = &params->argb8888_result;
> +	size_t dst_size;
> +	u32 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_ARGB8888,
> +				       result->dst_pitch, &params->clip);
> +	KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +	iosys_map_set_vaddr(&dst, buf);
> +
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
>  static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  {
>  	const struct convert_xrgb8888_case *params = test->param_value;
> @@ -484,6 +546,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
>  	{}
>  };
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index eb5c98cf82b8..3ce8129dfe43 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -33,6 +33,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				    const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip);
> -- 
> 2.39.0
> 
