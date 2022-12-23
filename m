Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21963655071
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710ED10E194;
	Fri, 23 Dec 2022 12:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2A910E194
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:37:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id ja17so3525678wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iQrNXWODEQsqzoTZ2Z6sdrsQT4BUqATY9fJ6Vkfd4DI=;
 b=K5vdxMG8oBU0K49nFesHvEwkDBJjOi5eQHyKkxeIipeGLVQsq6/KVhNQPAA0VQjdR5
 V+XB4TkPYGgeTzRg2s/Xqi/ESLozAfOZnRK4+B8o0ivVIrfZod8dc6vm/Wselkup4wqn
 45jkATMRk3sNRhJMG0riO6neF5r4Rct11X2sqYfLhirZg41wvGXPfHMWLuetuapt1GPv
 ou43/szPT24sKXj6ksjaA2HAHV1IyfbM/X9ZuDVwi27Hgbi6gRug8fhKA8SfWvQNjD6W
 S/B5hO23Ck0eSaAxnuVa7URaDzm1mm3JoJd57tyx/lSZaQWq2zYrnsAXbYmchPDr15pb
 vvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQrNXWODEQsqzoTZ2Z6sdrsQT4BUqATY9fJ6Vkfd4DI=;
 b=ZZruXlqZ2qnDrkPFTNuh94lHy6wzdaAP6suVrFqX9CHHfb5w6yX80SKQKEgckauQQZ
 lXqr3SPhmj8z+sWzRWaAMjOCFiypcgeTsaXhP/zsYMJmgxy9IuhGKIsahz0DLqLHP6F5
 AtWxaRulcsv3BAdkggFUkpfCJYyvWBMptQYpazD82EG7qtnCPFJeJ3cmUUcV0rw6ww9S
 Lc9N4Yd5/4yFAFMt7PSN/r9ffNohy/e7q1SS7Q8740Tp9Wv7v2OoYkGeF9zr9bJgMPvR
 nIwNQTtF4ekRjuADqzNubC68Z7l6bP0BLLMuRGoIopjy2rw6yI7zmTxXK1wFy74f9icP
 GGYA==
X-Gm-Message-State: AFqh2kpBGMkmsuWsQNac2lpH2XkYCKfcF65egWTaV+sC1fDa81zu4ab7
 8nppluw7dmfv/fPKx6rl9Uk=
X-Google-Smtp-Source: AMrXdXvLymMAn897jaPnDlMXIbAk52nIouEXWMPBlVJtbnUyb4s9D+xfQh4zDfNFV0OYCxv0a/wImw==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id
 m9-20020a7bcb89000000b003d221011f54mr7199824wmi.4.1671799078089; 
 Fri, 23 Dec 2022 04:37:58 -0800 (PST)
Received: from fedora ([94.73.32.212]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c161600b003cfa622a18asm8585088wmn.3.2022.12.23.04.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 04:37:57 -0800 (PST)
Date: Fri, 23 Dec 2022 13:37:55 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/13] drm/format-helper: Comment on RGB888 byte order
Message-ID: <Y6WhIxqUn1ibz8Mk@fedora>
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220161145.27568-3-tzimmermann@suse.de>
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

On Tue, Dec 20, 2022 at 05:11:34PM +0100, Thomas Zimmermann wrote:
> RGB888 is different than the other formats as most of its pixels are
> unaligned and therefore helper functions do not use endianness conversion
> helpers. Comment on this in the source code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/drm_format_helper.c            | 1 +
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 74ff33c2ddaa..b98bd7c5caee 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -404,6 +404,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
>  
>  	for (x = 0; x < pixels; x++) {
>  		pix = le32_to_cpu(sbuf32[x]);
> +		/* write blue-green-red to output in little endianness */
>  		*dbuf8++ = (pix & 0x000000FF) >>  0;
>  		*dbuf8++ = (pix & 0x0000FF00) >>  8;
>  		*dbuf8++ = (pix & 0x00FF0000) >> 16;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 2191e57f2297..cd1d7da3483c 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -407,6 +407,10 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> +	/*
> +	 * RGB888 expected results are already in little-endian
> +	 * order, so there's no need to convert the test output.
> +	 */
>  	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
> -- 
> 2.39.0
> 
