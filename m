Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B1A24135
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5F110E3BA;
	Fri, 31 Jan 2025 16:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="asLmaFXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6895E10E3B3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:57:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso1166087f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738342658; x=1738947458; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pfNeHfRMYsZ2XMQ7Tt/gdmnr9NbENuVOxKod6aka5ak=;
 b=asLmaFXSNh29q+W5CeZfHxHl46APgZtdEJAh6Z6L2Y8vYdAnMFRiTulF9lQpWrCThG
 OUptbHRaF5o50666/BaHlT2hUkksUk6TjD7BI46quuJ99eSuequfUZupydu0MO+/5UCg
 7et7XkHAh9x1CPope7oRzmzuZ2cSRYSPaVnBpwtZifMBMd34AbK+/Rnqq6OlbGzQS+vq
 Mm46Ze0NCtLYQo4kK0yDfkBgSVfcw+zgwqNXvHRt14IPSSPueSY2wqeT6ezsLzzAntA7
 ms3ubydbOytBRHMhdMhNymNQnM6C+yXINuIvnkiy/K922PUKCJitfdAPOosW/dKUjvkm
 9rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342658; x=1738947458;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfNeHfRMYsZ2XMQ7Tt/gdmnr9NbENuVOxKod6aka5ak=;
 b=fJY9FR1G/aXWRdrpePVPK63FGtzLzqIS5lL05Jp76Lm5UIwqiTefyRZoo7wt5Lb8wv
 Eayg6WCWkeqLf8pETDGqzHvRNdCLk5YlwFeqOS2iTPXe60y0G2DkIQm5ZrPPBQtS7lAD
 7FOOgoxUmIEb2bB16dunX445+hOk4GhAOnJ/fI6AOWIYcKEzBxWGX9Hk5DaDvPHm7sKw
 uT6TyPe0/AiL6GHE/ZQuDUwDTJ+lFIqEtS/CWn2Nx3bd0hGJF+pfpvKV5zPiZLhx5wLd
 M5VUKBEN/a/RPu+CI2vQ0EDNrobpMekOJSCmBNNFsKcU0nXlzj5yMi9i4fxEOv9nX8nw
 4wbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV96M2Z45MC0HlG3DofH3gv24R/OESGRHYjSIffY1RLJlMEvoyht6QwtKYNPzwVx7dbljsGqLNkgn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy36zQ5DqqU3l67jAaYYs72A8UKis3aTmzY0x+yFbH25pEGL98X
 JD/fIfxrMo+tZmkvis0extASsMuOWr7WTeHIhOoKRZByT/NBt6O/
X-Gm-Gg: ASbGncvTPJujAv+lumM8+2vERETRiD5DhCvb5cElwS2oM/J1A30duiKENS+nAa1jgru
 kW98SrPgnQs+ilh+qWcYM5sFup5ARJxIsmbfDi/u7JA2ad7mZD0uHPq671WLizokako6u/caK4j
 XOeTAkFc2QQNnIjp9CfpyZaegDAvHQV63+CveY9pNljsvh5o5ZS9gxh/2OX/TcfwMclnffpIkh4
 8MfqaP30SkDEzTWGva3O0qeJHKjpsrNs1/a6H/Jead2In9jAgQUmRt8l7ygSbumD/iKp3yqIG5S
 YS2Ysvmw9YKBFQ==
X-Google-Smtp-Source: AGHT+IGOPpZaIae4HFS1C/f6cM0C4JYSNsuInmLgJR5wt85aAr3MLOMfTcOKfMs6fffvV2/D20b9UQ==
X-Received: by 2002:a05:6000:2c5:b0:386:4a16:dad7 with SMTP id
 ffacd0b85a97d-38c519460a0mr10280008f8f.10.1738342657681; 
 Fri, 31 Jan 2025 08:57:37 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de35csm60398925e9.10.2025.01.31.08.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:57:37 -0800 (PST)
Date: Fri, 31 Jan 2025 17:57:35 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, pekka.paalanen@collabora.com,
 pekka.paalanen@haloniitty.fi, rdunlap@infradead.org,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 simona.vetter@ffwll.ch, simona@ffwll.ch,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <Z50A_0AlcLokJ4sD@fedora>
References: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <20250131084111.2903-1-jose.exposito89@gmail.com>
 <Z5zJ1pEk3v-1V5Uu@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5zJ1pEk3v-1V5Uu@louis-chauvet-laptop>
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

On Fri, Jan 31, 2025 at 02:02:14PM +0100, Louis Chauvet wrote:
> On 31/01/25 - 09:41, José Expósito wrote:
> > Hi Louis,
> > 
> > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > > 
> > > Create KUnit tests to test the conversion between YUV and RGB. Test each
> > > conversion and range combination with some common colors.
> > > 
> > > The code used to compute the expected result can be found in comment.
> > >
> > > [Louis Chauvet:
> > > - fix minor formating issues (whitespace, double line)
> > > - change expected alpha from 0x0000 to 0xffff
> > > - adapt to the new get_conversion_matrix usage
> > > - apply the changes from Arthur
> > > - move struct pixel_yuv_u8 to the test itself]
> > > 
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> 
> [...]
> 
> > > +	/*
> > > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > > +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> > > +	 *                     in_bits = 16,
> > > +	 *                     in_legal = False,
> > > +	 *                     in_int = True,
> > > +	 *                     out_bits = 8,
> > > +	 *                     out_legal = False,
> > > +	 *                     out_int = True)
> > > +	 * Test cases for conversion between YUV BT709 full range and RGB
> > > +	 * using the ITU-R BT.709 weights.
> > > +	 */
> > > +	{
> > > +		.encoding = DRM_COLOR_YCBCR_BT709,
> > > +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> > > +		.n_colors = 4,
> > 
> > If I understood correctly, "n_colors" here indicates the number of items in
> > "colors", but there is a mismatch between both lengths.
> > 
> > It also applies to the other test cases where "n_colors = 4".
> 
> I don't know how I miss it, I am 100% sure I did the exact same comment to 
> Arthur few mounth ago, thanks!
>  
> > > +		.colors = {
> > > +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> > > +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> > > +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> > > +			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> > > +			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> > > +			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> > > +		},
> > > +	},
> > > +	/*
> 
> [...]
> 
> > > +/*
> > > + * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
> > > + * colors to ARGB colors in VKMS
> > > + *
> > > + * This test will use the functions get_conversion_matrix_to_argb_u16 and
> > > + * argb_u16_from_yuv888 to convert YUV colors (stored in
> > > + * yuv_u8_to_argb_u16_cases) into ARGB colors.
> > > + *
> > > + * The conversion between YUV and RGB is not totally reversible, so there may be
> > > + * some difference between the expected value and the result.
> > > + * In addition, there may be some rounding error as the input color is 8 bits
> > > + * and output color is 16 bits.
> > > + */
> > > +static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
> > > +{
> > > +	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
> > > +	struct pixel_argb_u16 argb;
> > > +
> > > +	for (size_t i = 0; i < param->n_colors; i++) {
> > > +		const struct format_pair *color = &param->colors[i];
> > > +		struct conversion_matrix matrix;
> > > +
> > > +		get_conversion_matrix_to_argb_u16
> > > +			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
> > > +
> > > +		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
> > 
> > Running the test on ppc64 (big endian) doesn't fail. For reference:
> > 
> >   $ sudo dnf install powerpc64-linux-gnu-gcc
> >   $ sudo dnf install qemu-system-ppc64
> >   $ ./tools/testing/kunit/kunit.py run \
> >      --kunitconfig=drivers/gpu/drm/vkms/tests \
> >      --arch=powerpc --cross_compile=powerpc64-linux-gnu- \
> >      --make_options CF=-D__CHECK_ENDIAN__ \
> >      --kconfig_add CONFIG_KASAN=y \
> >      --kconfig_add CONFIG_KASAN_VMALLOC=y
> > 
> > However, I wonder if endianness is correctly handled. I always find endianness
> > difficult to reason about, but I'll try my best to explain it.
> > 
> > On a big endian architecture, color->yuv is stored in big endian. This might not
> > be an issue, because its components (y, u and v) are u8.
> > However, I think that the return value of argb_u16_from_yuv888(), which is the
> > result of argb_u16_from_u16161616(), is returned in big endian while it should
> > be little endian.
> 
> The goal of `struct argb_u16` is to hide machine-specific issues. We want 
> to be able to do addition, multiplication... without 
> `le_from_cpu`/`cpu_to_le` everywhere.
> 
> If you look at the rest of the vkms driver, we never do bit manipulation 
> on `struct argb_u16`, only mathematical operations. 
> 
> > Since you are comparing argb.a (big endian) with color->argb.a (big endian) the
> > test succedess, but in this case it should fail because, if I remember
> > correctly, colors must be stored in little endian and therefore, the color
> > returned by argb_u16_from_yuv888() should be little endian.
> 
> The colors are stored in a specific endian only in framebuffers, but in 
> our case, this is not a framebuffer. For the `argb_u16_to_ARGB16161616`, 
> you can see we use `cpu_to_le16` to store the data in the proper order.
>  
> > If you replace this 4 KUNIT_EXPECT_LE_MSG() with KUNIT_EXPECT_MEMEQ(), all test
> > will fail, but you'll notice that the buffers printed in the error log are
> > different depending on the endianness (x86_64 vs ppc64).
> > 
> > What do you think? Did I overlook the conversion?
> 
> I think yes, but thanks to make me think about it, I will steal your 
> command line to test on powerPC :)

Well, at least the command was useful :P Thanks for the explanation.
I have been looking with more detail into get_pixel_write_function()
and what you mention makes sense now.

Thanks!

> > Have a look to the tests present in drm_format_helper_test.c. They use different
> > functions (cpubuf_to_le32, le32buf_to_cpu, etc) to make sure that colors are
> > represented in little endian and that comparing the expected and actual results
> > happens in the same endian.
> 
> Those tests are testing conversion "buffer to buffer", so yes, there is 
> some endian-dependant issues.
> 
> [...]
