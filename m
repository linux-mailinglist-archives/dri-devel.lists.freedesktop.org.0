Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424B85DA08
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D6E10E738;
	Wed, 21 Feb 2024 13:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OXuj9QzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6885410E738;
 Wed, 21 Feb 2024 13:26:26 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so454262a12.1; 
 Wed, 21 Feb 2024 05:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521986; x=1709126786; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=XoFhc6w6Or2jWzWThz9jNXXxehcO/WwM1R0QsjeWJp0=;
 b=OXuj9QzCxE7n493UMWZAyEZOzaVxEAP7Hi49qc5oA9qY35PB5Ub2021RnHMigVPkkp
 ZzAOMLyajnhjWytHjcSIYlvYmKWyGeN3GvHlsTPfHIr1vdT/LAuKMf7XDHeq2ao1veM4
 TdwLyHSRdC/7cUFnfX8shKru1tTgJn0IzAbq4rYLPKb+EKFjUDYgPnj1LQlj5SEOShqT
 Z3PF5syVpRG9gTN0TFpqUqixwrjbUoOj07X9BMrERBJLT2rXBZuWgzsG491qo3P3Wl11
 Bv4K1IHu921XTms7utV/uzRs0ZGfJ0/9vrapcHPyWeFDBNCRemyMwxMXcMTOVsxbGR+1
 J73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521986; x=1709126786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XoFhc6w6Or2jWzWThz9jNXXxehcO/WwM1R0QsjeWJp0=;
 b=JkoqM7BqFIaOqISKAEFeR0wPIDIPooGzZR+u9dmACM4j1BjeTLx1tl5Sf5eMHR7i+U
 YqtxZU8NMHSCrzhHwALbI+PgluYljw4w41Y3OzsszAJ2Uvb73MrQrXHc0ofuUcs6DlOF
 G3ZqDMyp3RVjK2OIi9Xzh8ptYKh9+ywgKzl9GvNrSfMpp5d29aC57CNZh5wt2D0jefX8
 8h0TlubYFDilh9vRc2urvnNp/3xvDJjvpxNZ7Cl37d5N9MVnnYNoF5kMMHrYJhrdqZ6z
 IGqMDAaC9O+QG+2mA+r0sUogwZHrElug0O3fkMtFKlQ+TNy7cd1FIwmxRnWJrzn2gRfl
 /f8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlKfQBPoHsJwXjtplfAw2AJSs+VdRW9eYBovZ9WbbHDqWwKhYy7Zbhgxh2K1bned9ft/A6mo4dnNelfie64wF/ItlLY0gAELdGL8e5yyl4S+ahEmAl+QXkjxKTEcpTRLEnIlhMppHK9cRm5pJXmig=
X-Gm-Message-State: AOJu0YwBYAdzAG6lAp+s1yfvY3lBmntY+P8NcxsE84AZ6DqgSHZtMcm4
 KbzYGNHnC0tvJyvoW5+IQjLWZtrkdAaGKtLVYq/Jx7mVsbwPkE3e
X-Google-Smtp-Source: AGHT+IGILlX3H7ZZb/bgbEfnuywE1wmEzFeRcz3TrJiMVYakeY0hkv1MYe96t08ALc/iXo0i73KEAg==
X-Received: by 2002:a05:6a21:3409:b0:19e:4ed7:127a with SMTP id
 yn9-20020a056a21340900b0019e4ed7127amr22674991pzb.46.1708521985850; 
 Wed, 21 Feb 2024 05:26:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a62b409000000b006e448fa3d93sm6999855pfn.174.2024.02.21.05.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:26:25 -0800 (PST)
Date: Wed, 21 Feb 2024 05:26:24 -0800
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
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
Message-ID: <efda07ba-69e0-4544-9432-485036fce165@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-8-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:20PM +0800, David Gow wrote:
> The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
> which was then updated to be an 'unsigned long' to avoid 64-bit
> multiplication division helpers.
> 
> However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
> '%d' or '%llu' format specifiers, the former of which is always wrong,
> and the latter is no longer correct now that ps is no longer a u64. Fix
> these to all use '%lu'.
> 
> Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
> message. gcc warns if a printf format string is empty (apparently), so
> give these some more detailed error messages, which should be more
> useful anyway.
> 
> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
>  drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 8a464f7f4c61..3dbfa3078449 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  		KUNIT_ASSERT_FALSE_MSG(test,
>  				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							      ps, ps, list, 0),
> -				       "buddy_alloc hit an error size=%d\n",
> +				       "buddy_alloc hit an error size=%lu\n",
>  				       ps);
>  	} while (++i < n_pages);
>  
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  
>  	drm_buddy_free_list(&mm, &middle);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   2 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
>  
>  	drm_buddy_free_list(&mm, &right);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  	/*
>  	 * At this point we should have enough contiguous space for 2 blocks,
>  	 * however they are never buddies (since we freed middle and right) so
> @@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							    2 * ps, ps, &allocated,
>  							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
>  
>  	drm_buddy_free_list(&mm, &left);
>  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							    3 * ps, ps, &allocated,
>  							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 3 * ps);
>  
>  	total = 0;
>  	list_for_each_entry(block, &allocated, link)
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 1eb0c304f960..f37c0d765865 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
>  
>  	/* After creation, it should all be one massive hole */
>  	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm not one hole on creation");
>  		goto out;
>  	}
>  
> @@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
>  
>  	/* After filling the range entirely, there should be no holes */
>  	if (!assert_no_holes(test, &mm)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm has holes when filled");
>  		goto out;
>  	}
>  
>  	/* And then after emptying it again, the massive hole should be back */
>  	drm_mm_remove_node(&tmp);
>  	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm does not have single hole after emptying");
>  		goto out;
>  	}
>  
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
