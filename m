Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCEB604E9E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6510E197;
	Wed, 19 Oct 2022 17:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAD410E197
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 17:29:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id t4so13345018wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 10:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SjI4Z5co0jP+dS3DaFSz22T5OkUEoxSjseAK5lz7j2I=;
 b=qEGEnfPvhrallYxSGId63ucJ5syeGHO24jd/sGBVIAk6xnp+BnJOvWTmTCX7cPCAxU
 o0L4YvNOiNrB2/+bmgnUN/KgJUcNgtxplL+1DDLsCFz/HhExm6XZW3PI49Gs68WQDafj
 wMosHixYsk5oEoE3wqikKipk5XDHBE1MtZs/hp8TDaNCq5wt0mQBLNMOgtcMb12x3HVs
 Pi0IQ/ykdGBKI91ntCHbdYvrSZBl7qWF8lnz1xvULeo9lvFMpj+OYalKZnYLjIDb536h
 SXnpDppeR2BivNvRfI3D+NlRBpkWmMRvQLqafn/5N9sdnnJ6+srWH92eX1Oa/xHJ+g59
 YFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SjI4Z5co0jP+dS3DaFSz22T5OkUEoxSjseAK5lz7j2I=;
 b=RYuAMG5cM5d6I3vHoJzyJ45ZzdwbS+ynznXjyuS8Oo1UABo6t0MxSUY8YZk5a+fRZ8
 4n06UTCN2BaGD3LneOuahIGoIVjJyyOmEytOZKBWNdJgK1nQ6Ti5GTFKlOqTRKgr0BhH
 qn+1eKDMJ4bB5skDYzQJpsxO2BppFtw/9SyfZMXR9K27FLA7P9fLnPhmfecLFrVTVYWc
 oOk8oV1GAopsgKPayc43iPgoaKcoMhvNKnu+Hu0HEtqXHvSR3OtMxbZ6emKkK1jDF6Qb
 tZiWfo2yH+kpKYNhKRDH4POZo9yzy3YERKsSI8HBaHgviecOz5jfVexu0EIKUGLiUIMC
 GzTQ==
X-Gm-Message-State: ACrzQf2IjF1ZTH9YvBNcTkubuHg+G4GE6WvasZQsTMZDhTQHRjFFZ4Xb
 Fl5c0n/jpfmM6nh/nUCMExg=
X-Google-Smtp-Source: AMsMyM7ZQa2DiMhpN26ZGtW7L/xi7tJf2RX90DMZQvdqVwq0bPLH7ZNTlZ150wdhkXoNgXWjcPoMjA==
X-Received: by 2002:a7b:cbc4:0:b0:3b4:fd67:d70d with SMTP id
 n4-20020a7bcbc4000000b003b4fd67d70dmr27546343wmi.98.1666200568163; 
 Wed, 19 Oct 2022 10:29:28 -0700 (PDT)
Received: from elementary ([94.73.35.102]) by smtp.gmail.com with ESMTPSA id
 m1-20020a1c2601000000b003c452678025sm603453wmm.4.2022.10.19.10.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 10:29:27 -0700 (PDT)
Date: Wed, 19 Oct 2022 19:29:19 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
Message-ID: <20221019172919.GA5336@elementary>
References: <20221019073239.3779180-1-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019073239.3779180-1-davidgow@google.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Functional Testing <lkft@linaro.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 03:32:40PM +0800, David Gow wrote:
> The xrgb2101010 format conversion test (unlike for other formats) does
> an endianness conversion on the results. However, it always converts
> TEST_BUF_SIZE 32-bit integers, which results in reading from (and
> writing to) more memory than in present in the result buffer. Instead,
> use the buffer size, divided by sizeof(u32).
> 
> The issue could be reproduced with KASAN:
> ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/tests \
> 	--kconfig_add CONFIG_KASAN=y --kconfig_add CONFIG_KASAN_VMALLOC=y \
> 	--kconfig_add CONFIG_KASAN_KUNIT_TEST=y \
> 	drm_format_helper_test.*xrgb2101010
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> Signed-off-by: David Gow <davidgow@google.com>
> ---
> 
> This is a fix for the issue reported here:
> https://lore.kernel.org/dri-devel/CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com/
> 
> Note that it may conflict with the KUNIT_EXPECT_MEMEQ() series here:
> https://lore.kernel.org/linux-kselftest/20221018190541.189780-1-mairacanal@riseup.net/
> 
> Cheers,
> -- David
> 
> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 8d86c250c2ec..2191e57f2297 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -438,7 +438,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> -	buf = le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
> +	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }

Thanks a lot for fixing this bug David, I just tested it and
worked as expected.

Do you think that we should update the other calls to
le32buf_to_cpu() to follow a similar approach?

Regardless of a possible follow up patch:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Jose

>  
> -- 
> 2.38.0.413.g74048e4d9e-goog
> 
