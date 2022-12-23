Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF97655092
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D8510E1A6;
	Fri, 23 Dec 2022 12:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5243F10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:45:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so3434878wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u9+2ryN45bGOFwXNK+qeRumAGi4yvld0sZTdJeDtDhw=;
 b=aWXjOBnRqIYBcMkcmrqt3Mh42sPqTS7kFrYcttpfmzyacaGCU2fx1NzGUOoT4vAz9T
 89Pso9zCKBu4PyPdIR4ayOwTKV2iO+CDaiGZealdGi94vjoW44faXmXWATnB/8ksZBuj
 LnMX9//PMR6XjR082JI1OgBFWOSLXpm6sOQ1peWLq2MK9WqUz+q/WhqFQGlQeb3xYwwG
 i9paplDn2N76b/kvIp1tQ5UYZi6SuVr2jCuqvx3gYUvsgvs7m6OTrY7XtgIy5zkhc14h
 AKks+gw0dR9p/WEBjpTnt7Jbh77dDx4vQhqnwH7qAY+oo5qnb1bsDETvc0YbIvqN9SGA
 mflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9+2ryN45bGOFwXNK+qeRumAGi4yvld0sZTdJeDtDhw=;
 b=tLU7flod8yQ/vCvlM2JkNJIlxrNxmFm7t09yHTmFcEhuUbKNmg3dcthee3bRq8TMvz
 NSdd5VPJ9/LoN6YzXk/UxO6s/lQXeiacSCT9zimieI4GkskuRbsvpJLCw+S1wFZkfKJA
 hksc26J9kYT9M45JOR8+a8a2mBcyyKaY2kZtESaOCdOr3voc47cq5xtiJQ5pQBYcUNGu
 L0CWkBSdB/a2iq6nMiFbjHvqZpsS/7W+vJnsu1N5oybroQxVqjnDR4nD3aSWu582inG1
 ThH3DO1yJlmkiBOO5r5Nc8Zg8sek9qch5fC2W44SzozPDi5SL9VD+KwVcAWaFv4VeubV
 F7bg==
X-Gm-Message-State: AFqh2kr+esGsl03YkIr8oY+OjPgSnabG0A0TnkyiqMTc0T3cOXyqG2Nm
 0ccc9ooIgvQB3agdt4ivCSY=
X-Google-Smtp-Source: AMrXdXsJvdQRmNmNILvB3/ZgrjoXvEGiEykMR9RaQYoJCz0TPj5dSb/FhNkLJwn1CO6YQugMpt11Gw==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id
 l3-20020a05600c1d0300b003d34aa64fe6mr7050237wms.3.1671799507765; 
 Fri, 23 Dec 2022 04:45:07 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003c6f3f6675bsm10170337wmq.26.2022.12.23.04.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:45:07 -0800 (PST)
Date: Fri, 23 Dec 2022 13:45:05 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 08/13] drm/format-helper: Add conversion from XRGB8888
 to ARGB2101010
Message-ID: <Y6Wi0TxpqH+mW2ed@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-9-tzimmermann@suse.de>
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

On Tue, Dec 20, 2022 at 05:11:40PM +0100, Thomas Zimmermann wrote:
> Add dedicated helper to convert from XRGB8888 to ARGB2101010. Sets
> all alpha bits to make pixels fully opaque.
> 
> v2:
> 	* set correct format in struct drm_framebuffer (Javier)
> 	* use cpubuf_to_le32()
> 	* type fixes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/drm_format_helper.c           | 58 ++++++++++++++++-
>  .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
>  include/drm/drm_format_helper.h               |  3 +
>  3 files changed, 122 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 23837b202988..3767213ba97d 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -605,6 +605,59 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
>  
> +static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	__le32 *dbuf32 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u32 val32;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		val32 = ((pix & 0x000000ff) << 2) |
> +			((pix & 0x0000ff00) << 4) |
> +			((pix & 0x00ff0000) << 6);
> +		pix = GENMASK(31, 30) | /* set alpha bits */
> +		      val32 | ((val32 >> 8) & 0x00300c03);
> +		*dbuf32++ = cpu_to_le32(pix);
> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_argb2101010 - Convert XRGB8888 to ARGB2101010 clip buffer
> + * @dst: Array of ARGB2101010 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffers
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + *
> + * This function copies parts of a framebuffer to display memory and converts
> + * the color format during the process. The parameters @dst, @dst_pitch and
> + * @src refer to arrays. Each array must have at least as many entries as
> + * there are planes in @fb's format. Each entry stores the value for the
> + * format's respective color plane at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for ARGB2101010 devices that don't support XRGB8888
> + * natively.
> + */
> +void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				    const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				    const struct drm_rect *clip)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
> +		    drm_fb_xrgb8888_to_argb2101010_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010);
> +
>  static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	u8 *dbuf8 = dbuf;
> @@ -696,8 +749,6 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		fb_format = DRM_FORMAT_XRGB8888;
>  	if (fb_format == DRM_FORMAT_ARGB2101010)
>  		fb_format = DRM_FORMAT_XRGB2101010;
> -	if (dst_format == DRM_FORMAT_ARGB2101010)
> -		dst_format = DRM_FORMAT_XRGB2101010;
>  
>  	if (fb_format == dst_format) {
>  		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
> @@ -721,6 +772,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
>  			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
>  			return 0;
> +		} else if (dst_format == DRM_FORMAT_ARGB2101010) {
> +			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip);
> +			return 0;
>  		} else if (dst_format == DRM_FORMAT_BGRX8888) {
>  			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
>  			return 0;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index bc969413a412..de3aa252e8eb 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -47,6 +47,11 @@ struct convert_to_xrgb2101010_result {
>  	const u32 expected[TEST_BUF_SIZE];
>  };
>  
> +struct convert_to_argb2101010_result {
> +	unsigned int dst_pitch;
> +	const u32 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>  	const char *name;
>  	unsigned int pitch;
> @@ -58,6 +63,7 @@ struct convert_xrgb8888_case {
>  	struct convert_to_rgb888_result rgb888_result;
>  	struct convert_to_argb8888_result argb8888_result;
>  	struct convert_to_xrgb2101010_result xrgb2101010_result;
> +	struct convert_to_argb2101010_result argb2101010_result;
>  };
>  
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
> @@ -91,6 +97,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.dst_pitch = 0,
>  			.expected = { 0x3FF00000 },
>  		},
> +		.argb2101010_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xFFF00000 },
> +		},
>  	},
>  	{
>  		.name = "single_pixel_clip_rectangle",
> @@ -125,6 +135,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.dst_pitch = 0,
>  			.expected = { 0x3FF00000 },
>  		},
> +		.argb2101010_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xFFF00000 },
> +		},
>  	},
>  	{
>  		/* Well known colors: White, black, red, green, blue, magenta,
> @@ -201,6 +215,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0x3FFFFC00, 0x000FFFFF,
>  			},
>  		},
> +		.argb2101010_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0xFFFFFFFF, 0xC0000000,
> +				0xFFF00000, 0xC00FFC00,
> +				0xC00003FF, 0xFFF003FF,
> +				0xFFFFFC00, 0xC00FFFFF,
> +			},
> +		},
>  	},
>  	{
>  		/* Randomly picked colors. Full buffer within the clip area. */
> @@ -268,6 +291,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
>  			},
>  		},
> +		.argb2101010_result = {
> +			.dst_pitch = 20,
> +			.expected = {
> +				0xC3844672, 0xC444D414, 0xEA20300C, 0x00000000, 0x00000000,
> +				0xDB1705CD, 0xC3844672, 0xC444D414, 0x00000000, 0x00000000,
> +				0xEA20300C, 0xDB1705CD, 0xC3844672, 0x00000000, 0x00000000,
> +			},
> +		},
>  	},
>  };
>  
> @@ -541,6 +572,37 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
>  
> +static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_argb2101010_result *result = &params->argb2101010_result;
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
> +	dst_size = conversion_buf_size(DRM_FORMAT_ARGB2101010,
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
> +	drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
>  static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
> @@ -548,6 +610,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
>  	{}
>  };
>  
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 3ce8129dfe43..10b2d19cdb66 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -39,6 +39,9 @@ void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_
>  void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				    const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				    const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				    const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			      const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			      const struct drm_rect *clip);
> -- 
> 2.39.0
> 
