Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C2B85D9FE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36010E73A;
	Wed, 21 Feb 2024 13:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gWVG0AuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF8510E5FE;
 Wed, 21 Feb 2024 13:26:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6e46dcd8feaso1828315b3a.2; 
 Wed, 21 Feb 2024 05:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521968; x=1709126768; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=7WdZMlL2NstZAHt9MPKQqrlpZNmq6hiZjAQCRu2gHes=;
 b=gWVG0AuQ7IixXOiSXEhZMOg/xqg4Wo/7omJIFKeVd84Vr+YJlAglKxRj9XKYIpN0JP
 0dGDEYWP4oXHQQ6xuNMkxv8fMaFqui0bvvK5X/JC5zpVF5S4s0aDoD/Gqjl5HKxSEX90
 b8zC4EGNbT+6qhyI24aXe5UJ/1n+efhfmmWQYUcz736k8Rktj6i8qcSwUsq7uorQxTfK
 zSjXVs/2oR7Zag+lIQhrbymuAIFpptrM8VueO2Aq8NuGJFZwR4FAyrI051GAkKLrsg0K
 DtA79E3FjUmG0Roqd9BhjAZSegD82eYgqRynF3zoMrepC9pkvU/6SPUoP4G4BIxvvh1d
 Vyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521968; x=1709126768;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WdZMlL2NstZAHt9MPKQqrlpZNmq6hiZjAQCRu2gHes=;
 b=om58jatz7f7c+ckut2T84+toWy4am6w0Th1Jr1CJ/akXY7ZeKQKpOZ/eAHkYPTAwfb
 1INz9sn0s/tgVC4+o+fA23SfQaS8RRwkG6wvVlcwiqQhMsMz+QboCbgaILAclIO+XKp5
 4F4b5vz9Fv3meqGI4mMmd3JDQ2D8AJMBQI5ZkEenSkaWC9ZIG5cLHiELg26+po9fJ9ZE
 jLcy65WaQiTAMlEeNk44cGZa6Vc8PchQPQTqQhqaRVfvLrF1pwelolCdX3Y/Xy6X/vvh
 SMX/dMcEES+4COH0+6RYUkeld/GzXLzygQE5lTMW0bXN2nyVhdQaIapIq4YKCq034ZAC
 z3fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Y10lQl5BkEJ1NOABnxqkztXwE/FbGAxkwroxbjAp9BdEDh7HMUEUnDd0+HElMZzlxiVwqA4ooWE/TXL58qV8lb0F/MzAA8zfxPTBev43kjnbvu6dHYDqmCiUmeBhCVdSVQ6GW6j+jdtA46tHRrs=
X-Gm-Message-State: AOJu0Yz1XFZUodzBtdpjBY9uCxxj9zBPUH8wy2LctmlYkxRFHStNB7YF
 s7pkmMtO5Ycd5E4l9AtG3KjJ6cWW+v6eBQWyPmOKYT2Ea7pZtXQp
X-Google-Smtp-Source: AGHT+IFgfVve7IiqOMiET8ReqBSTf0PZGpuUUSOUxAlf0ZKI7g9iOQrLpYHKBMVPCKUI2YjVR4orQA==
X-Received: by 2002:a62:e10d:0:b0:6e2:9ff2:19b1 with SMTP id
 q13-20020a62e10d000000b006e29ff219b1mr10316723pfh.13.1708521967791; 
 Wed, 21 Feb 2024 05:26:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b006e4751b964asm1599291pfx.205.2024.02.21.05.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:26:07 -0800 (PST)
Date: Wed, 21 Feb 2024 05:26:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 5/9] rtc: test: Fix invalid format specifier.
Message-ID: <11e8fe13-3d10-451e-8a31-d273c9d9ea1b@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-6-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-6-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:18PM +0800, David Gow wrote:
> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
> 
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
> 
> Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/rtc/lib_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
> index d5caf36c56cd..225c859d6da5 100644
> --- a/drivers/rtc/lib_test.c
> +++ b/drivers/rtc/lib_test.c
> @@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
>  
>  		days = div_s64(secs, 86400);
>  
> -		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
> +		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
>  			year, month, mday, yday, days
>  
>  		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
