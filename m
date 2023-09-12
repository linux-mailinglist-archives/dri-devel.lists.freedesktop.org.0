Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089579C843
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8BB10E3A0;
	Tue, 12 Sep 2023 07:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6813210E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:36:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3159b524c56so739294f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1694504175; x=1695108975; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+grCUostfIpNDbJCtZATyVfp717UCSAOFrm4GuSqa4=;
 b=DaLEnh0EAgsu22TEqC4CeMAjMYtYpsszshSZWYLzPo3A7iCCjSjCJg2Z+Opsu1y7ze
 CWj+6QrnMKqIWmYoU0JtquHYRmdNZcKuz55VtEpTC642iqS0v/EgorN1fG0uPCuRm2Aw
 6D53uEAxuRdDm5Gc41th2KaUzsx1Ht9KLFP1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694504175; x=1695108975;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M+grCUostfIpNDbJCtZATyVfp717UCSAOFrm4GuSqa4=;
 b=XjXVzptmKTK8nZB9rS0rJkQnQ5cer49/x7YpE9n80K44lhvaZhKZ0liTXaGPswBUZX
 9fVFBZR8gp6M0gzmwP9R32p3uGaltdxqAjOvnxO5Mnx9XAcZidfIGkFQYWCS7mLACR4h
 bjQyxk+WqS+3MPPKkelMmNSmWlQAO42S8gvN/Gk1bVMA2PpKrymbW5lDpro2Iq4FDMZ5
 foQAjcw3pTcgyva3mJch6MJk/wz6f1UWoj+EdrqP/DsV0GQ/497YPYK40dlMltwp6k5T
 jPJpQvtCF7uJZuq/A1+8b7+gdf0qjcOTuerAz5aGXaF/yzWfyoM3cDSXQGKU+xRQvG4q
 uVNQ==
X-Gm-Message-State: AOJu0YxEvBUnZXAJzyRXX75Ms8mRfoIeyCke7KHCWMMAwbfJxt8dRsue
 CVBBH/l/mtZMc9b8SlAT1YlZ0g==
X-Google-Smtp-Source: AGHT+IGxydkfPGJ6b1sjOo2veJypAVFwoUoaaZ8mu7ON6QOiYcwhv+yqb2kpDK9bW/DrJ1e3VPPNXQ==
X-Received: by 2002:a05:6000:70a:b0:31f:84c9:d75f with SMTP id
 bs10-20020a056000070a00b0031f84c9d75fmr8444826wrb.4.1694504175484; 
 Tue, 12 Sep 2023 00:36:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b00317ddccb0d1sm12118428wro.24.2023.09.12.00.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 00:36:14 -0700 (PDT)
Date: Tue, 12 Sep 2023 09:36:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/2] drm/tests: Flag slow tests as such
Message-ID: <ZQAU7Juw5WM1LAAM@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
 <20230911-kms-slow-tests-v1-2-d3800a69a1a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911-kms-slow-tests-v1-2-d3800a69a1a1@kernel.org>
X-Operating-System: Linux phenom 6.4.0-3-amd64 
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 11:51:06AM +0200, Maxime Ripard wrote:
> Kunit recently gained a speed attribute that allows to filter out slow
> tests. A slow test is defined in the documentation as a test taking more
> than a second to execute.
> 
> Let's flag the few tests that are doing so on my machine when running:
> 
> ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
> 	--cross_compile aarch64-linux-gnu- --arch arm64
> 
> Suggested-by: David Gow <davidgow@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Ugh ... not a fan.

igt has a really bad habit of making disastrously combinatorial tests with
impossible runtimes, and then just filtering these out so it's still fast.

Maybe some stress tests for overall system make sense like this, but
absolutely not for unit tests. And I did spot check some of these, they're
just combinatorial explosions with large repetition counts and some fun
stuff like going through prime numbers because surely that's a good idea.

Imo delete them all, and if that causes a real gap in coverage, ask the
authors to write some actual good unit tests for these corner cases.

Cheers, Sima
> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c |  2 +-
>  drivers/gpu/drm/tests/drm_mm_test.c    | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 09ee6f6af896..6f79cde2df55 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -742,7 +742,7 @@ static struct kunit_case drm_buddy_tests[] = {
>  	KUNIT_CASE(drm_test_buddy_alloc_range),
>  	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>  	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
> -	KUNIT_CASE(drm_test_buddy_alloc_smoke),
> +	KUNIT_CASE_SLOW(drm_test_buddy_alloc_smoke),
>  	KUNIT_CASE(drm_test_buddy_alloc_pathological),
>  	{}
>  };
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 186b28dc7038..c1e662c2a76c 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -2228,23 +2228,23 @@ module_param(max_prime, uint, 0400);
>  static struct kunit_case drm_mm_tests[] = {
>  	KUNIT_CASE(drm_test_mm_init),
>  	KUNIT_CASE(drm_test_mm_debug),
> -	KUNIT_CASE(drm_test_mm_reserve),
> -	KUNIT_CASE(drm_test_mm_insert),
> -	KUNIT_CASE(drm_test_mm_replace),
> -	KUNIT_CASE(drm_test_mm_insert_range),
> +	KUNIT_CASE_SLOW(drm_test_mm_reserve),
> +	KUNIT_CASE_SLOW(drm_test_mm_insert),
> +	KUNIT_CASE_SLOW(drm_test_mm_replace),
> +	KUNIT_CASE_SLOW(drm_test_mm_insert_range),
>  	KUNIT_CASE(drm_test_mm_frag),
>  	KUNIT_CASE(drm_test_mm_align),
>  	KUNIT_CASE(drm_test_mm_align32),
>  	KUNIT_CASE(drm_test_mm_align64),
> -	KUNIT_CASE(drm_test_mm_evict),
> +	KUNIT_CASE_SLOW(drm_test_mm_evict),
>  	KUNIT_CASE(drm_test_mm_evict_range),
>  	KUNIT_CASE(drm_test_mm_topdown),
>  	KUNIT_CASE(drm_test_mm_bottomup),
>  	KUNIT_CASE(drm_test_mm_lowest),
>  	KUNIT_CASE(drm_test_mm_highest),
>  	KUNIT_CASE(drm_test_mm_color),
> -	KUNIT_CASE(drm_test_mm_color_evict),
> -	KUNIT_CASE(drm_test_mm_color_evict_range),
> +	KUNIT_CASE_SLOW(drm_test_mm_color_evict),
> +	KUNIT_CASE_SLOW(drm_test_mm_color_evict_range),
>  	{}
>  };
>  
> 
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
