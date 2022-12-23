Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EFA655096
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA5510E641;
	Fri, 23 Dec 2022 12:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7C10E641
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:48:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so3439850wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=treJaYjVO694GTrwWZHYXL4UsoZHswBLvmPxUB4vDbk=;
 b=TtonlEctmSHxxkCitT8xEXiXKwj/JLFBpAG2mrx+9bWfI8QFx8Vyc3hYkaM7BY+mA3
 MrMOUCiM3DKjQZl1ZJbHJpmvqk1DziEHdHi1jTSqTzUdO4iwRALHG1Aaf/Iyo3ACV0fE
 RSbT1bH5eWHF3SDhIICgENGYRBTA1J5pR/lqX/MYghPe1/9K/Y4cvdyA9bcDHG71VeHy
 X4sgxSgsPC9/6c9g4i8CRKQeuFqOMENCAkuBly2I8l/3U8xeFKmgysZrNANTGN3oIXzy
 xq/64SWMkagHd+wUwvM6ynrDTMN+RtulvxM6oKH4HvyLu4gayG/eVx3Dw0xkJGoWnKDz
 BnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=treJaYjVO694GTrwWZHYXL4UsoZHswBLvmPxUB4vDbk=;
 b=VfWtVwZHrcG20gSnCKmMg49Vx0WA8B/IWiKbwcfDgMankFQInlAHiPpEUbJuT57opV
 CvOnsWBLvVNcZ/NOPfUBejQSoQiw2oHLdAk86cDuH8ARfCUHW8LzWUkeAu4hIb0djEWW
 /Hfwf56Yf0WKzPDknBMHn/vyaHcFPWlZGouNk6SXBLN5R+a0LHoVnkoC90zbYXVw9YC1
 D6DCK/zQ37nuFETWOIIOcTHttXNdSssrJUIJggJvopjGL+oBRcXY5PNfNWH7/p95Qnkv
 vWS/jc5cxix1hAGCeklDVcGX9T4NClGVrxBqWMbK4mC2qzWrDw4W1TUNzzAGF7nAiKj9
 G8Lw==
X-Gm-Message-State: AFqh2kq48P1f5a0aQROxHWMJjxEh6wBnIjNq/GBFXQ105sJpjJJlwH/G
 Qg7h62S0pVsf4M4J3Sf3dOM=
X-Google-Smtp-Source: AMrXdXtLXBfIMYrSCT9W0X0qe3808VpbuOfQ40ltjDABG83mwLw71V7n9pcTKTAGJN390BjOvmt0Cg==
X-Received: by 2002:a05:600c:4999:b0:3d3:4007:9c88 with SMTP id
 h25-20020a05600c499900b003d340079c88mr7205835wmp.18.1671799696832; 
 Fri, 23 Dec 2022 04:48:16 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003cfaae07f68sm9956124wmq.17.2022.12.23.04.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:48:16 -0800 (PST)
Date: Fri, 23 Dec 2022 13:48:14 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 09/13] drm/format-helper: Add conversion from XRGB8888
 to 15-bit RGB555 formats
Message-ID: <Y6WjjlCWu+z14MsA@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-10-tzimmermann@suse.de>
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

Like in "drm/format-helper: Add conversion from XRGB8888 to ARGB8888"
sparse is printing a warning:

drm_format_helper.c:412:27: warning: incorrect type in assignment (different base types)
drm_format_helper.c:412:27:    expected unsigned short [usertype]
drm_format_helper.c:412:27:    got restricted __le16 [usertype]


On Tue, Dec 20, 2022 at 05:11:41PM +0100, Thomas Zimmermann wrote:
> Add conversion from XRGB8888 to XRGB1555, ARGB1555 and RGBA5551, which
> are the formats currently supported by the simplefb infrastructure. The
> new helpers allow the output of XRGB8888 framebuffers to firmware
> scanout buffers in one of the 15-bit formats.
> 
> v2:
> 	* test 15-bit results with local endianness (Jose)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_format_helper.c           | 164 +++++++++++++++
>  .../gpu/drm/tests/drm_format_helper_test.c    | 189 ++++++++++++++++++
>  include/drm/drm_format_helper.h               |   9 +
>  3 files changed, 362 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 3767213ba97d..1cedfe02fadf 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -396,6 +396,161 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>  
> +static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	u16 *dbuf16 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u16 val16;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		val16 = ((pix & 0x00f80000) >> 9) |
> +			((pix & 0x0000f800) >> 6) |
> +			((pix & 0x000000f8) >> 3);
> +		dbuf16[x] = cpu_to_le16(val16);

- dbuf16[x] = cpu_to_le16(val16);
+ dbuf16[x] = (__force u16)cpu_to_le16(val16);

> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip buffer
> + * @dst: Array of XRGB1555 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
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
> + * Drivers can use this function for XRGB1555 devices that don't support
> + * XRGB8888 natively.
> + */
> +void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
> +		    drm_fb_xrgb8888_to_xrgb1555_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
> +
> +static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	u16 *dbuf16 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u16 val16;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		val16 = BIT(15) | /* set alpha bit */
> +			((pix & 0x00f80000) >> 9) |
> +			((pix & 0x0000f800) >> 6) |
> +			((pix & 0x000000f8) >> 3);
> +		dbuf16[x] = cpu_to_le16(val16);

- dbuf16[x] = cpu_to_le16(val16);
+ dbuf16[x] = (__force u16)cpu_to_le16(val16);

> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_argb1555 - Convert XRGB8888 to ARGB1555 clip buffer
> + * @dst: Array of ARGB1555 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
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
> + * Drivers can use this function for ARGB1555 devices that don't support
> + * XRGB8888 natively. It sets an opaque alpha channel as part of the conversion.
> + */
> +void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
> +		    drm_fb_xrgb8888_to_argb1555_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
> +
> +static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	u16 *dbuf16 = dbuf;
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u16 val16;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		val16 = ((pix & 0x00f80000) >> 8) |
> +			((pix & 0x0000f800) >> 5) |
> +			((pix & 0x000000f8) >> 2) |
> +			BIT(0); /* set alpha bit */
> +		dbuf16[x] = cpu_to_le16(val16);

- dbuf16[x] = cpu_to_le16(val16);
+ dbuf16[x] = (__force u16)cpu_to_le16(val16);

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> +	}
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_rgba5551 - Convert XRGB8888 to RGBA5551 clip buffer
> + * @dst: Array of RGBA5551 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
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
> + * Drivers can use this function for RGBA5551 devices that don't support
> + * XRGB8888 natively. It sets an opaque alpha channel as part of the conversion.
> + */
> +void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
> +		    drm_fb_xrgb8888_to_rgba5551_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
> +
>  static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	u8 *dbuf8 = dbuf;
> @@ -763,6 +918,15 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		if (dst_format == DRM_FORMAT_RGB565) {
>  			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
>  			return 0;
> +		} else if (dst_format == DRM_FORMAT_XRGB1555) {
> +			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip);
> +			return 0;
> +		} else if (dst_format == DRM_FORMAT_ARGB1555) {
> +			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip);
> +			return 0;
> +		} else if (dst_format == DRM_FORMAT_RGBA5551) {
> +			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip);
> +			return 0;
>  		} else if (dst_format == DRM_FORMAT_RGB888) {
>  			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
>  			return 0;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index de3aa252e8eb..f71dc0fe08a1 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -32,6 +32,21 @@ struct convert_to_rgb565_result {
>  	const u16 expected_swab[TEST_BUF_SIZE];
>  };
>  
> +struct convert_to_xrgb1555_result {
> +	unsigned int dst_pitch;
> +	const u16 expected[TEST_BUF_SIZE];
> +};
> +
> +struct convert_to_argb1555_result {
> +	unsigned int dst_pitch;
> +	const u16 expected[TEST_BUF_SIZE];
> +};
> +
> +struct convert_to_rgba5551_result {
> +	unsigned int dst_pitch;
> +	const u16 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_to_rgb888_result {
>  	unsigned int dst_pitch;
>  	const u8 expected[TEST_BUF_SIZE];
> @@ -60,6 +75,9 @@ struct convert_xrgb8888_case {
>  	struct convert_to_gray8_result gray8_result;
>  	struct convert_to_rgb332_result rgb332_result;
>  	struct convert_to_rgb565_result rgb565_result;
> +	struct convert_to_xrgb1555_result xrgb1555_result;
> +	struct convert_to_argb1555_result argb1555_result;
> +	struct convert_to_rgba5551_result rgba5551_result;
>  	struct convert_to_rgb888_result rgb888_result;
>  	struct convert_to_argb8888_result argb8888_result;
>  	struct convert_to_xrgb2101010_result xrgb2101010_result;
> @@ -85,6 +103,18 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.expected = { 0xF800 },
>  			.expected_swab = { 0x00F8 },
>  		},
> +		.xrgb1555_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0x7C00 },
> +		},
> +		.argb1555_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xFC00 },
> +		},
> +		.rgba5551_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xF801 },
> +		},
>  		.rgb888_result = {
>  			.dst_pitch = 0,
>  			.expected = { 0x00, 0x00, 0xFF },
> @@ -123,6 +153,18 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.expected = { 0xF800 },
>  			.expected_swab = { 0x00F8 },
>  		},
> +		.xrgb1555_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0x7C00 },
> +		},
> +		.argb1555_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xFC00 },
> +		},
> +		.rgba5551_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0xF801 },
> +		},
>  		.rgb888_result = {
>  			.dst_pitch = 0,
>  			.expected = { 0x00, 0x00, 0xFF },
> @@ -188,6 +230,33 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0xE0FF, 0xFF07,
>  			},
>  		},
> +		.xrgb1555_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0x7FFF, 0x0000,
> +				0x7C00, 0x03E0,
> +				0x001F, 0x7C1F,
> +				0x7FE0, 0x03FF,
> +			},
> +		},
> +		.argb1555_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0xFFFF, 0x8000,
> +				0xFC00, 0x83E0,
> +				0x801F, 0xFC1F,
> +				0xFFE0, 0x83FF,
> +			},
> +		},
> +		.rgba5551_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0xFFFF, 0x0001,
> +				0xF801, 0x07C1,
> +				0x003F, 0xF83F,
> +				0xFFC1, 0x07FF,
> +			},
> +		},
>  		.rgb888_result = {
>  			.dst_pitch = 0,
>  			.expected = {
> @@ -264,6 +333,30 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
>  			},
>  		},
> +		.xrgb1555_result = {
> +			.dst_pitch = 10,
> +			.expected = {
> +				0x0513, 0x0920, 0x5400, 0x0000, 0x0000,
> +				0x35CE, 0x0513, 0x0920, 0x0000, 0x0000,
> +				0x5400, 0x35CE, 0x0513, 0x0000, 0x0000,
> +			},
> +		},
> +		.argb1555_result = {
> +			.dst_pitch = 10,
> +			.expected = {
> +				0x8513, 0x8920, 0xD400, 0x0000, 0x0000,
> +				0xB5CE, 0x8513, 0x8920, 0x0000, 0x0000,
> +				0xD400, 0xB5CE, 0x8513, 0x0000, 0x0000,
> +			},
> +		},
> +		.rgba5551_result = {
> +			.dst_pitch = 10,
> +			.expected = {
> +				0x0A27, 0x1241, 0xA801, 0x0000, 0x0000,
> +				0x6B9D, 0x0A27, 0x1241, 0x0000, 0x0000,
> +				0xA801, 0x6B9D, 0x0A27, 0x0000, 0x0000,
> +			},
> +		},
>  		.rgb888_result = {
>  			.dst_pitch = 15,
>  			.expected = {
> @@ -476,6 +569,99 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
>  }
>  
> +static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_xrgb1555_result *result = &params->xrgb1555_result;
> +	size_t dst_size;
> +	u16 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_XRGB1555, result->dst_pitch,
> +				       &params->clip);
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
> +	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
> +static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_argb1555_result *result = &params->argb1555_result;
> +	size_t dst_size;
> +	u16 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_ARGB1555, result->dst_pitch,
> +				       &params->clip);
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
> +	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
> +static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_rgba5551_result *result = &params->rgba5551_result;
> +	size_t dst_size;
> +	u16 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_RGBA5551, result->dst_pitch,
> +				       &params->clip);
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
> +	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
>  static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  {
>  	const struct convert_xrgb8888_case *params = test->param_value;
> @@ -607,6 +793,9 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb1555, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 10b2d19cdb66..2d04f5863722 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -30,6 +30,15 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
>  void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip, bool swab);
> +void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
> -- 
> 2.39.0
> 
