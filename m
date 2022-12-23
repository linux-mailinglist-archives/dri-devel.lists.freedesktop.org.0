Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE6655073
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC9C10E1B0;
	Fri, 23 Dec 2022 12:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9D510E1B0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:38:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso803001wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yMcD43qKrDLu6Lrhe+KKhUNK9CMpAAwDSnRGJeAqSXI=;
 b=a7JLR6TCvSALrBsJLMH9kLw3Cp3DfY4ONym0GChLDUry9RFydl1spcQIlihgIgHmQD
 tsNYhI9fgIQDJphpHKbX9MzcWB+tWVuYYQ8PeY4DlWd8EC21DXmjwS/Z8HaNuqKhj/ln
 RHhFlfo77RMkhC5KtBdmXghqeEc5ZcnwcY03nu7lTm3DGKS2hTsscW4IP+rXKX+eiWeN
 Qc7Hmyb0tb1/3MydBskCMx9ZaD7oIfBk/GvWNBR7FsSs5KMiqCxrLVe5tiO9FDI8E6w1
 e5WxbquC2cssCieRT8Cdfee28DoDYmpUV+YMkS2e3UkRJdJrwVlITrjI95m3G9e9RPuN
 c0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yMcD43qKrDLu6Lrhe+KKhUNK9CMpAAwDSnRGJeAqSXI=;
 b=WRbt9L6geVSTf6Vl5AbW4rOIV337wTbfxBgLBai1Y9JBwQbvhEhiJNfdUYo44XsdNE
 NwjJuAhhRu5GNPgLP882/BN5jKFdhBG1LBSGO0qYjPeuE8Sf0EiISgD4RYH5hhrbsiLU
 BL5vD7rxpy7PwaJAQ8wGuL4+TkEJ6TwWQHzWeN/k8ab109m1Z8U3GqF7fiH2vl9YoeUe
 3FmRGyIeuzOBqjJWuYRqcX9rRQ6JNw+wwSK3hPe4aMqsoHi/gjgJtOnf1KcBMLuQ6Zuo
 79A17AvqJGx9ZO1uO6pcs/KyQxXrne3WZVod9jUvym5laQKg05VWPtPMwRlRfQkTMQkW
 LiEg==
X-Gm-Message-State: AFqh2kq+az3bxI8VZoCg4t8iHys4C67VX4GcKbB9J55e9ZegyLKz/g4x
 l3ng0RkjMStwVBGB8ZzQ2vM=
X-Google-Smtp-Source: AMrXdXuqmbncI22lSdP6zDhDI0T8AhTMxwhkENQPddp0gzHt920h+2+ceCccl2p1s9G/q5QAsJZQHg==
X-Received: by 2002:a05:600c:5022:b0:3d3:5893:f4f8 with SMTP id
 n34-20020a05600c502200b003d35893f4f8mr7043223wmr.23.1671799105677; 
 Fri, 23 Dec 2022 04:38:25 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 dn10-20020a05600c654a00b003d069fc7372sm4403043wmb.1.2022.12.23.04.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:38:25 -0800 (PST)
Date: Fri, 23 Dec 2022 13:38:23 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] drm/format-helper: Fix test-input format
 conversion
Message-ID: <Y6WhP2+pGh4fDFEh@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-4-tzimmermann@suse.de>
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

On Tue, Dec 20, 2022 at 05:11:35PM +0100, Thomas Zimmermann wrote:
> Convert test input for format helpers from host byte order to
> little-endian order. The current code does it the other way around,
> but there's no effective difference to the result.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  .../gpu/drm/tests/drm_format_helper_test.c    | 35 +++++++++++++------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index cd1d7da3483c..e7c49e6d3f6d 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -279,6 +279,21 @@ static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
>  	return dst;
>  }
>  
> +static __le32 *cpubuf_to_le32(struct kunit *test, const u32 *buf, size_t buf_size)
> +{
> +	__le32 *dst = NULL;
> +	int n;
> +
> +	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> +	if (!dst)
> +		return NULL;
> +
> +	for (n = 0; n < buf_size; n++)
> +		dst[n] = cpu_to_le32(buf[n]);
> +
> +	return dst;
> +}
> +
>  static void convert_xrgb8888_case_desc(struct convert_xrgb8888_case *t,
>  				       char *desc)
>  {
> @@ -294,7 +309,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	const struct convert_to_gray8_result *result = &params->gray8_result;
>  	size_t dst_size;
>  	__u8 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -310,7 +325,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -324,7 +339,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	const struct convert_to_rgb332_result *result = &params->rgb332_result;
>  	size_t dst_size;
>  	__u8 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -340,7 +355,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -354,7 +369,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	const struct convert_to_rgb565_result *result = &params->rgb565_result;
>  	size_t dst_size;
>  	__u16 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -370,7 +385,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -387,7 +402,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	const struct convert_to_rgb888_result *result = &params->rgb888_result;
>  	size_t dst_size;
>  	__u8 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -403,7 +418,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -421,7 +436,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
>  	size_t dst_size;
>  	__u32 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -437,7 +452,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> -- 
> 2.39.0
> 
