Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948CAFC461
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C069210E5AF;
	Tue,  8 Jul 2025 07:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OLQ0AFKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C0510E5AF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:41:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so32504755e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1751960509; x=1752565309; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nLXLpWrN0RrjvzjS9bZYXIrunV11kVzsxvUhFkoafL4=;
 b=OLQ0AFKlF5YmoYTl5dUXJTp0ORF9I5aEMJp3VBZy8kQZNwdDP0HDU6zQoy9FBVLBSg
 NNeItHWp5hL4cIky2CqyTliko1o8oOLyBhwdtaJgJl4xomXNFNBrOUwVLUX3GCQ3fkSl
 WAVtDT3QSGHX4clwxUz+I1KsozUg6skPW2kSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960509; x=1752565309;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLXLpWrN0RrjvzjS9bZYXIrunV11kVzsxvUhFkoafL4=;
 b=vK1evU2WIOrD97+YWXH4VO8u33fHSJ3xIjXiws8zJ0C+BOM38Oz+HlaYogkM2zj2D5
 eYZpR41PyNxr0aGFVATT8dOZHPrUTzc5bNAKq0a3ZXoD3/WlxSsCOXGh6qdt5cCIr/ZV
 a0FpYkTzZ5qPfKrwVuh4wPhhQohWj+TEmH0XwMy4ZXLyer6P1SezHRGZrvOzIU7N2eka
 UiLyE+cceUX3VrZy4ku7yAFM6Jjw3QMs9o/tggJ/gxOPvMKU18iRinwFhANNPc0ObnGG
 EypgaLSB6GsJaCDn2BX2ZCBkmBG29onUp6Nt5dSBsttUXwwirNYC1NK5aM5Q8/Z4mU0O
 vIwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXR5mc4YRImrJ9AOoKC7CXYexE2v6h4hRBvtlrIKuuGEdl6AmORE5Yydwfv9f6vDgIO0MK2gG1SnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8qM9iDpSaQwMg8CsLJ1yrsN5C8uAsEGnqHLJ7tf2faLPmHwvm
 RzkZ600NxkHgfiXdmvXfTvFy9dxyNuRdJi1Y3g7Y1kdNgDAIyjCIKXGZspm56cmYLsA=
X-Gm-Gg: ASbGncvSBiszMTrlJmgRBVqZ7Hf5VXktwp/liYOecqYxY9iN8K2B38pdOWHrQCuw/Jq
 tc+kFDGScJVEb6ZP/6iOMxPO5x4X6rIJe56x9la3CpQYsnxaHNbu8p7uY1P6LVgYz3sTZGOeM1h
 7cfisvikrwnJn5K6Ofarim+QE4CjuSBr2GhMcEnfN7oIBKJDpkK3JD9fUHsnxhKZgpboGYMdC+U
 GWlyGuad4Bb9xHvL0UoZPv4tIUr6r23tlq1ll0B6OVKimBghzB8Ru26HyrpSRP6dOy9X4W6lMuk
 LFxM4K5NRGTXFSK69GulCGoTY3A7UJD5rt1UG6gQpqQEL3kiKdsB4AyK7RyGjKoo/vra3lgkOw=
 =
X-Google-Smtp-Source: AGHT+IFDYYh+YQVkLMo6VtvD9z1aU3v2ebhZ3f3RUOuyw4wPvIZHoVbSHZ7xWZtnTf0OIsFwsLRcQQ==
X-Received: by 2002:a05:600c:a3a5:b0:453:5a04:b60e with SMTP id
 5b1f17b1804b1-454b3ab9b26mr100685635e9.26.1751960508889; 
 Tue, 08 Jul 2025 00:41:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0ae0sm12458327f8f.33.2025.07.08.00.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:41:48 -0700 (PDT)
Date: Tue, 8 Jul 2025 09:41:46 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 3/8] drm/sched: Make timeout KUnit tests faster
Message-ID: <aGzLujIwHJNIHRs8@phenom.ffwll.local>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
 <20250707-sched-skip-reset-v4-3-036c0f0f584f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707-sched-skip-reset-v4-3-036c0f0f584f@igalia.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Mon, Jul 07, 2025 at 11:46:32AM -0300, Maíra Canal wrote:
> As more KUnit tests are introduced to evaluate the basic capabilities of
> the `timedout_job()` hook, the test suite will continue to increase in
> duration. To reduce the overall running time of the test suite, decrease
> the scheduler's timeout for the timeout tests.
> 
> Before this commit:
> 
> [15:42:26] Elapsed time: 15.637s total, 0.002s configuring, 10.387s building, 5.229s running
> 
> After this commit:
> 
> [15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s building, 4.037s running
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Acked-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/tests/tests_basic.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 7230057e0594c6246f02608f07fcb1f8d738ac75..41c648782f4548e202bd8711b45d28eead9bd0b2 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -5,6 +5,8 @@
>  
>  #include "sched_tests.h"
>  
> +#define MOCK_TIMEOUT (HZ / 5)

Eventually I think we want a test interface to immediately time out jobs
by rescheduling their timer to immediately (and handling all the trickery
of making sure it's scheduled first). That could also help with testcases
that want to exercise specific timing.

But for now this seems good enough.
-Sima

> +
>  /*
>   * DRM scheduler basic tests should check the basic functional correctness of
>   * the scheduler, including some very light smoke testing. More targeted tests,
> @@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit *test)
>  
>  static int drm_sched_timeout_init(struct kunit *test)
>  {
> -	test->priv = drm_mock_sched_new(test, HZ);
> +	test->priv = drm_mock_sched_new(test, MOCK_TIMEOUT);
>  
>  	return 0;
>  }
> @@ -227,14 +229,14 @@ static void drm_sched_basic_timeout(struct kunit *test)
>  	done = drm_mock_sched_job_wait_scheduled(job, HZ);
>  	KUNIT_ASSERT_TRUE(test, done);
>  
> -	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT / 2);
>  	KUNIT_ASSERT_FALSE(test, done);
>  
>  	KUNIT_ASSERT_EQ(test,
>  			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>  			0);
>  
> -	done = drm_mock_sched_job_wait_finished(job, HZ);
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
>  	KUNIT_ASSERT_FALSE(test, done);
>  
>  	KUNIT_ASSERT_EQ(test,
> 
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
