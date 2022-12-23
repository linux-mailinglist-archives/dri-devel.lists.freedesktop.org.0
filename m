Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2D7655074
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773C710E637;
	Fri, 23 Dec 2022 12:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886AA10E637
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:39:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z10so4448107wrh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0sxwSXYfxkRBN9Plqnj5vPwo0EPfiaL9CGmFgchPkCc=;
 b=BezCasPNwm6P8NUp8qil3aVDbOz+OlSsn+f2oLbxFhTEU77jOCrQTeNU1yZFZHK0F+
 bEJFUwgWGjJSCDWmWGsqXtyVy+jORXLnqQ34U8tirpVq+8t0DUAbeC3IdmVPyu/K5nID
 BIUS+adouTt0WBdP4h8jEk6rvFgqHgUgav3nStt/hDxUFxkHLWYOwLzcSYi6BVZCDiF8
 3F4DuRoa5qzrh2LIddJ4h8kVKJhq8FpEG8eRq6kiUAYxbXTYSuaJXUl1SC0OoZigsID/
 hF2pa3DyvCNPgWwEByFXmgu/xq512BBR5gRMdz9caYdIAKilDu4SVWvtEMrR7Hb7CXmD
 tI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0sxwSXYfxkRBN9Plqnj5vPwo0EPfiaL9CGmFgchPkCc=;
 b=idrpk+I+bZdlcTjYARk1k22SsMAwIY/ZuTU5Y0NaHqkbxs/C4MuPDi5H2B2Enw2wRm
 31fM4KccmoWvySKr/JowDvUogmiKESjYNoIQJxkZRZPgDaf3HHXNHEZMhaW1V9VjdANH
 tWX/nTCoLPfrebo3Gufpu9512GShM+jOLC7XBq6fWb6qecsX7FNUwvYSRq082uX5ay53
 9LwkU286uomT50g4fmfJJ8QE2vuB96oOOxySXmdA0kltXGgWpbwaevUOIABs4OPk7Qn0
 QnVWcY81PSyWPuEVuNo1OxO94GCseQGT1a6neY9aDbVVCdXmPjUX9/i20YzyXBfmBXmf
 ax5g==
X-Gm-Message-State: AFqh2kpTRZar1OGm17QTyuqlo8Pj4fOK4p7NNfSy/82Wa7Op1/TxwTBo
 Fsy7Lp45ZB8QJ6ZPhzc1cxg=
X-Google-Smtp-Source: AMrXdXue9zb5sypPT5z3XHPy+KAgSny/2F5sWoEKmZ6HU7aSSn2PmnSvAGYqt1nlmoNqZvW62vjF9w==
X-Received: by 2002:a5d:4908:0:b0:242:187f:ed44 with SMTP id
 x8-20020a5d4908000000b00242187fed44mr6444588wrq.68.1671799156875; 
 Fri, 23 Dec 2022 04:39:16 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d4dcf000000b002368a6deaf8sm3010208wru.57.2022.12.23.04.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:39:16 -0800 (PST)
Date: Fri, 23 Dec 2022 13:39:14 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/13] drm/format-helper: Store RGB565 in
 little-endian order
Message-ID: <Y6Whcu6IQ/elrBLA@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-5-tzimmermann@suse.de>
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

On Tue, Dec 20, 2022 at 05:11:36PM +0100, Thomas Zimmermann wrote:
> Fix to-RGB565 conversion helpers to store the result in little-
> endian byte order. Update test cases as well.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/drm_format_helper.c           |  9 +++++----
>  .../gpu/drm/tests/drm_format_helper_test.c    | 20 ++++++++++++++++++-
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b98bd7c5caee..f3f3b3809a3e 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -322,7 +322,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>  
>  static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> -	u16 *dbuf16 = dbuf;
> +	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
>  	unsigned int x;
>  	u16 val16;
> @@ -333,14 +333,15 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
>  		val16 = ((pix & 0x00F80000) >> 8) |
>  			((pix & 0x0000FC00) >> 5) |
>  			((pix & 0x000000F8) >> 3);
> -		dbuf16[x] = val16;
> +		dbuf16[x] = cpu_to_le16(val16);
>  	}
>  }
>  
> +/* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
>  static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>  						unsigned int pixels)
>  {
> -	u16 *dbuf16 = dbuf;
> +	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
>  	unsigned int x;
>  	u16 val16;
> @@ -351,7 +352,7 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>  		val16 = ((pix & 0x00F80000) >> 8) |
>  			((pix & 0x0000FC00) >> 5) |
>  			((pix & 0x000000F8) >> 3);
> -		dbuf16[x] = swab16(val16);
> +		dbuf16[x] = cpu_to_le16(swab16(val16));
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index e7c49e6d3f6d..04fe373c9d97 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -264,6 +264,21 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
>  	return dst_pitch * drm_rect_height(clip);
>  }
>  
> +static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_size)
> +{
> +	u16 *dst = NULL;
> +	int n;
> +
> +	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> +	if (!dst)
> +		return NULL;
> +
> +	for (n = 0; n < buf_size; n++)
> +		dst[n] = le16_to_cpu(buf[n]);
> +
> +	return dst;
> +}
> +
>  static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
>  {
>  	u32 *dst = NULL;
> @@ -368,7 +383,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb565_result *result = &params->rgb565_result;
>  	size_t dst_size;
> -	__u16 *buf = NULL;
> +	u16 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -390,9 +405,12 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
>  	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  
> +	buf = dst.vaddr; /* restore original value of buf */
>  	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
>  }
>  
> -- 
> 2.39.0
> 
