Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2965094E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 10:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C2C8995F;
	Mon, 19 Dec 2022 09:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6CD10E101
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:24:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id bg10so5957964wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 01:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O7qL1nQlX8YqSUZepVYZ40NbJyzGvEnLkfsgMbWCrGE=;
 b=iifZd5/Jk/Dn7swrDHSNujxAe7EgcK+vkX8VLyDn3kRFrdJboKmA1VpCDWgsZYYZRT
 VzBJGL63MyQ3qO7kPg07g3y+vNbIUHgm9t0wiCjbT0yQN1hseiU3JyJTHIdFRiTiJboA
 dGoXppk0ukV2x+JQCYpV2uCxXeoQ+gya/ixTfJLEInSHL2xPrciPOXtKOhxql6HYeHEL
 bKc3favP3kHetqPrsrahA3hzyx/rIdyCP+VfRNTzFla+BD6TbTl0lUFfBwSsXwpy1Pkf
 4xhyrlS/4jsQLhlgQutiYura/DakXVyRWSHKy482GrFjDyV3eHo/AjS7xB6AO3bHauPx
 qSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O7qL1nQlX8YqSUZepVYZ40NbJyzGvEnLkfsgMbWCrGE=;
 b=HCliGEp8m5mK4ezgBgrpRUOma6umjqlNeSI8zo7JzK9uHHe7VWCq9NNdTcfURmV1wD
 Z/5eTdmqD7coLKdsi9Kuck/8RAZihzfWLQub/gQhNpAkQCzN8bF5ME+oVVkShIaYqEQY
 4T17wKRyWxCmKGZ8MQJGY2VpJDlMJeMeZsoKXmVxoBfEKTyC/EglUo6yibJl7VU+28po
 SPk3OwmaK22rwP0eOFZklTH4HazJtWjdASpE3rwFuTWn1kYKnHGY5N7Acjwt1CPqers8
 GdyDKNGrhLHu2YqU2e672HiNq+yjVM0hOdF1lubW+lweJv5qt6QMWFZ/l9O9EjakzaRG
 cUTw==
X-Gm-Message-State: ANoB5pkAqcY4NYECAGZJXGX27kZC4/mOBFjO17BPx2gp2rECHvcym256
 SoNlXoi9XhIx5be5dUXWFYw=
X-Google-Smtp-Source: AA0mqf4gAL/Q4DTOSE5RxuLrxq8o6eifhiRA4NrA6Cq2t01dD4zRcxJsJuePfA4l0/fQKLrufl8l8Q==
X-Received: by 2002:a05:600c:c8:b0:3d2:cb3:2e2a with SMTP id
 u8-20020a05600c00c800b003d20cb32e2amr39733253wmm.10.1671441839196; 
 Mon, 19 Dec 2022 01:23:59 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 o31-20020a05600c511f00b003cf71b1f66csm12624079wms.0.2022.12.19.01.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:23:58 -0800 (PST)
Date: Mon, 19 Dec 2022 10:23:55 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/9] drm/format-helper: Add conversion from XRGB8888 to
 15-bit RGB555 formats
Message-ID: <Y6Atq4ioWPMRDxH1@fedora>
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221213201233.9341-6-tzimmermann@suse.de>
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

Thanks for CCing me.

There are some issues with this helpers on big endian architectures, you can
run the test on big endian with this command:

 $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
   --arch=powerpc --cross_compile=powerpc64-linux-gnu- drm_format_helper_test

The problem is in the drm_fb_xrgb8888_to_*_line() functions, see the fixes
inlined:

On Tue, Dec 13, 2022 at 09:12:29PM +0100, Thomas Zimmermann wrote:
> Add conversion from XRGB8888 to XRGB1555, ARGB1555 and RGBA5551, which
> are the formats currently supported by the simplefb infrastructure. The
> new helpers allow the output of XRGB8888 framebuffers to firmware
> scanout buffers in one of the 15-bit formats.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c           | 164 +++++++++++++++
>  .../gpu/drm/tests/drm_format_helper_test.c    | 186 ++++++++++++++++++
>  include/drm/drm_format_helper.h               |   9 +
>  3 files changed, 359 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index e562a3cefb89..aa6138756458 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -395,6 +395,161 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
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

You don't need the extra cpu_to_le16() here:

 - dbuf16[x] = cpu_to_le16(val16);
 + dbuf16[x] = val16;

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

The same here:

 - dbuf16[x] = cpu_to_le16(val16);
 + dbuf16[x] = val16;

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

And this is the last fix:

 - dbuf16[x] = cpu_to_le16(val16);
 + dbuf16[x] = val16;


Other than that, this patch looks good:

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Best wishes,
Jose

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
> @@ -761,6 +916,15 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
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
> index b15dc7c1eb96..e01695c70bb6 100644
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
> @@ -443,6 +536,96 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
>  }
>  
> +static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_xrgb1555_result *result = &params->xrgb1555_result;
> +	size_t dst_size;
> +	__u16 *buf = NULL;
> +	__u32 *xrgb8888 = NULL;
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
> +	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
> +static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_argb1555_result *result = &params->argb1555_result;
> +	size_t dst_size;
> +	__u16 *buf = NULL;
> +	__u32 *xrgb8888 = NULL;
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
> +	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
> +static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_rgba5551_result *result = &params->rgba5551_result;
> +	size_t dst_size;
> +	__u16 *buf = NULL;
> +	__u32 *xrgb8888 = NULL;
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
> +	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
> +}
> +
>  static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  {
>  	const struct convert_xrgb8888_case *params = test->param_value;
> @@ -570,6 +753,9 @@ static struct kunit_case drm_format_helper_test_cases[] = {
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
> 2.38.1
> 
