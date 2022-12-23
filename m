Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891265507E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265A510E638;
	Fri, 23 Dec 2022 12:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE4010E638
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:40:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a17so4446077wrt.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PFkslyyCJmqQ9wRLrtJU55pDOF0+DjqqFbXUozaH1kU=;
 b=kCD2v/WjUOjZRCHqz8+c4xYkz7Bkxt7wo0VvMABiF9fNcegHSQvtMP/El4KfBwTcQj
 l1ImkJvZq+7h0oV9wwOmLSuTomy4vU8UkDI6FDznRx4xgBI1jGdkS8G9RXnFnykdks7C
 tzJpq9jema4xoLndoYpC6rOjfNH0bO3PSIUR4jE1G8SJqsGR5fYMemOYSKMnEq/Dy6TF
 bd2DPFiRVYFQvWphlg07ocL2iRlZHinEdZZ6xkzD+SZsdhWBgc+PqHlCPamyh3kwm6iJ
 6AwU+S1FGEQt4J/+k+oCS8qrsZsAhFglxiZ/3Zs7eNHMp6heqXGVlWKjp45GBsgyGjjp
 1Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFkslyyCJmqQ9wRLrtJU55pDOF0+DjqqFbXUozaH1kU=;
 b=PaszQy3Z3KBixcbGbIf6eD0lIdF8lgU1ZwilkRpHq115euU2PvgM8OOij5FQbOOwe+
 Q+dMTSm0y9nppy5vtb0y6QaLkzofHmUvg4T54TrrbPGA/0vJFLgXq9BsqdyayBzb4f04
 u77Znyn50rYZo7tr5dOBD0ZHsn3Imj00yLuAI74lnmpQtBW3l2DXchn5C1XF0kos9Jr+
 UjfpcMOLjsYd4UC1p9ieMZm3Xp+oJXtdU2uJZ3wRV7vaLNgk4GOqz3HIfoiLjo7RWvLS
 hodyWanRgLrYLySjndpzfEImNaSbSdAIxZDo+2JZ97pXkGc4KtTuZiUa0AWriHT8VhRr
 4ksA==
X-Gm-Message-State: AFqh2krY/lNLm3oYA3iilTGDFVClUamTfOl/8dNSL/eLXRCpmQfAQTkg
 plSuXAKycq7iGfkgBrweEm0=
X-Google-Smtp-Source: AMrXdXvweWq2xKhdH67BjYZb5lw8O0s9uu/sQbly3b539rZBhx68LpunEm107OoZ7wZGonyX2yET7A==
X-Received: by 2002:adf:cd01:0:b0:271:dd0c:866c with SMTP id
 w1-20020adfcd01000000b00271dd0c866cmr3741574wrm.16.1671799203971; 
 Fri, 23 Dec 2022 04:40:03 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 s1-20020a5d6a81000000b0024228b0b932sm3699389wru.27.2022.12.23.04.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:40:03 -0800 (PST)
Date: Fri, 23 Dec 2022 13:40:01 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 05/13] drm/format-helper: Type fixes in format-helper
 tests
Message-ID: <Y6WhoReJ87Zpc/I8@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-6-tzimmermann@suse.de>
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

On Tue, Dec 20, 2022 at 05:11:37PM +0100, Thomas Zimmermann wrote:
> Change the source-buffer type of le32buf_to_cpu() to __le32* to
> reflect endianness. Result buffers are converted to local endianness,
> so instantiate them from regular u8 or u32 types.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 04fe373c9d97..c2411ec808a1 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -279,7 +279,7 @@ static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_siz
>  	return dst;
>  }
>  
> -static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
> +static u32 *le32buf_to_cpu(struct kunit *test, const __le32 *buf, size_t buf_size)
>  {
>  	u32 *dst = NULL;
>  	int n;
> @@ -323,7 +323,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_gray8_result *result = &params->gray8_result;
>  	size_t dst_size;
> -	__u8 *buf = NULL;
> +	u8 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -353,7 +353,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb332_result *result = &params->rgb332_result;
>  	size_t dst_size;
> -	__u8 *buf = NULL;
> +	u8 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -419,7 +419,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb888_result *result = &params->rgb888_result;
>  	size_t dst_size;
> -	__u8 *buf = NULL;
> +	u8 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -453,7 +453,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
>  	size_t dst_size;
> -	__u32 *buf = NULL;
> +	u32 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -475,7 +475,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
>  
> -- 
> 2.39.0
> 
