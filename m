Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C485D9F8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC51410E73F;
	Wed, 21 Feb 2024 13:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MYRkGtCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E8C10E740;
 Wed, 21 Feb 2024 13:25:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1d7232dcb3eso39217495ad.2; 
 Wed, 21 Feb 2024 05:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521949; x=1709126749; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=TMD7R8y65kHdSRzvHZ0/j8HTA7EF077bxXH3c7GeV1c=;
 b=MYRkGtCwDojM/SRP5DPQttIPMHUfMNC64a2bhVskMYLV1FEn6UFvVEM0Z3c7ioHIol
 1pFwKqUCwY9UUKki8VckKvQEIXrDaGlp0KFXmJcEefCPH7Thl6cXdedZ+5rsN9vWY9Jp
 wTV7MArqg/qs/1EiT1RWPMSksmGcxvk88s5qtO5x22q+IOzcAycTjQEdjO833ko7MaQF
 Q2M5jIlyYVo/upe0FVrYy0Kj3oD/N0/KbQfVTe48Af13LjMJA/Cjg/EdpNIs2UyI2uCF
 GxV9C4NQKr3/nH3Dii4zGdrEnNfC9U6eaDIO/l/ODFwP8IwUSR9mg66TK4CmqNJ45dMT
 QngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521949; x=1709126749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMD7R8y65kHdSRzvHZ0/j8HTA7EF077bxXH3c7GeV1c=;
 b=nq3T3oxI9f5mLLnN6jAGgbNGmfAgW2PSqlIWIYlz6inDHbWGFonbJjtq6YN8Xs8R//
 QRHK/+M2At/vyAMZV8rZw/k5Tu8MUX8wOK8uPkhICAzLJMloT7cGeqeYZjqoqH89xmgA
 T0vXYLNk/Gky+HyWfnMKlbySn4I9AkDEu7Zc2DaTZ3gTzgH1mYDjq0r1aTsh7J9oGYg5
 e5JNZtvb9j4EVUD5MVKl9j/NWGMplWmFzneuWaCCbyNH/QL6vFGI3zTzH6WvK5HG6Ykc
 kSwlB0OslecE5kOoIoTCHkcjQvCM5Y4FWqIlWRP/IOPwY20i2Jrr+D1Irku+jcfwreEu
 ehkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlkiq+cLbBgMFfzB+j31wF+X0QgNvutVHPZWVL7tTVWJT0jENgWi/RYJTF2Kx/MAzSZC9b1J0OWX3m0ENoYde6eDcmYLnIPYSlte8HI1KPTwmFufCRcluVU6avno8JFbxcs6+aj2sUOXLsMz1vmKY=
X-Gm-Message-State: AOJu0YxUIpiGj9zXefCzwuS+fivfEb1wGlJQYsAXCiMQEyUGRyafZ1cu
 JLI+O3eH0ZSDQv6XFi5AepK3ZLT9Da8Khd3JkHuNRvUS0+KV6fWj
X-Google-Smtp-Source: AGHT+IHT+AIwPR32g9+RGmyDYHlQWSCNbDqxpO0hHviSSTJUGOyxwRIiompW2Pi420GKW+V2NVs8tw==
X-Received: by 2002:a17:902:d489:b0:1dc:1e7c:cd3 with SMTP id
 c9-20020a170902d48900b001dc1e7c0cd3mr4511989plg.47.1708521948937; 
 Wed, 21 Feb 2024 05:25:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a170902ebd000b001da2f9d04b0sm8077527plg.15.2024.02.21.05.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:25:48 -0800 (PST)
Date: Wed, 21 Feb 2024 05:25:47 -0800
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
Subject: Re: [PATCH 3/9] lib: memcpy_kunit: Fix an invalid format specifier
 in an assertion msg
Message-ID: <de3abf44-6ce1-4bc1-9480-a977d83aba3b@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-4-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-4-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:16PM +0800, David Gow wrote:
> The 'i' passed as an assertion message is a size_t, so should use '%zu',
> not '%d'.
> 
> This was found by annotating the _MSG() variants of KUnit's assertions
> to let gcc validate the format strings.
> 
> Fixes: bb95ebbe89a7 ("lib: Introduce CONFIG_MEMCPY_KUNIT_TEST")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  lib/memcpy_kunit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/memcpy_kunit.c b/lib/memcpy_kunit.c
> index 440aee705ccc..30e00ef0bf2e 100644
> --- a/lib/memcpy_kunit.c
> +++ b/lib/memcpy_kunit.c
> @@ -32,7 +32,7 @@ struct some_bytes {
>  	BUILD_BUG_ON(sizeof(instance.data) != 32);	\
>  	for (size_t i = 0; i < sizeof(instance.data); i++) {	\
>  		KUNIT_ASSERT_EQ_MSG(test, instance.data[i], v, \
> -			"line %d: '%s' not initialized to 0x%02x @ %d (saw 0x%02x)\n", \
> +			"line %d: '%s' not initialized to 0x%02x @ %zu (saw 0x%02x)\n", \
>  			__LINE__, #instance, v, i, instance.data[i]);	\
>  	}	\
>  } while (0)
> @@ -41,7 +41,7 @@ struct some_bytes {
>  	BUILD_BUG_ON(sizeof(one) != sizeof(two)); \
>  	for (size_t i = 0; i < sizeof(one); i++) {	\
>  		KUNIT_EXPECT_EQ_MSG(test, one.data[i], two.data[i], \
> -			"line %d: %s.data[%d] (0x%02x) != %s.data[%d] (0x%02x)\n", \
> +			"line %d: %s.data[%zu] (0x%02x) != %s.data[%zu] (0x%02x)\n", \
>  			__LINE__, #one, i, one.data[i], #two, i, two.data[i]); \
>  	}	\
>  	kunit_info(test, "ok: " TEST_OP "() " name "\n");	\
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
