Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E4750BBA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868FC10E560;
	Wed, 12 Jul 2023 15:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2437110E561
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689174290; x=1720710290;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aiwddmkP4PvW8dS8z+RC6OFpPF11mDhvLdw3CU4YY8s=;
 b=TRDcCIW65v7KGOz+n0IyDjkdzhvWLvTb4IvwEulvGffD4zdBWd3oVSlb
 bWl6dqlDy2TrGijXpX6gJFOzJmMwvl6fx9Hw2gvLoEjc7dXHc42rSsQyA
 uQnlmFhsvxLj2/rObfBz9sbYMdtH7TOlk8fmCQfI9lF1lhZLmWbW6+PJa
 /xtmlYTdQp3po/TXA4/X9vWwIo4okGMbJQ+4SbsOuMAmhg2soIFgyu3JO
 V9+FIrKRDg/aUzxE2nslbH20SpobYFBwayZVU7+ekQpAgEHooPeKN41M1
 kbL4YmhWuJMQpjhefayhlN9lrILMzrORDVm2Gyj4EXeRXWB43UAkHfIlc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="354824304"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="354824304"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 08:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="751192661"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="751192661"
Received: from pmessina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.186])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 08:03:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit
 test
In-Reply-To: <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1689171160.git.mchehab@kernel.org>
 <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
Date: Wed, 12 Jul 2023 18:03:00 +0300
Message-ID: <87cz0xgokb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kselftest@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kees Cook <keescook@chromium.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 Rae Moar <rmoar@google.com>, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 09ee6f6af896..dd6c5afd6cd6 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite *suite)
>  	return 0;
>  }
>  
> +/**
> + * KTEST_SUITE: set of tests for drm buddy alloc
> + * Scope: drm subsystem
> + * Mega feature: drm
> + * Feature: buddy_alloc
> + *
> + * KTEST_TEST: drm_test_buddy_alloc_%s
> + * Description: Run DRM buddy allocation %arg[1] test
> + *
> + * arg[1].values: limit, range, optimistic, smoke, pathological
> + */
> +

"/**" indicates a kernel-doc comment, and this is not a kernel-doc
comment.

$ scripts/kernel-doc -none drivers/gpu/drm/tests/drm_buddy_test.c 
drivers/gpu/drm/tests/drm_buddy_test.c:752: warning: cannot understand
function prototype: 'struct kunit_case drm_buddy_tests[] = '

Nowadays kernel-doc is part of W=1 builds.


BR,
Jani.


>  static struct kunit_case drm_buddy_tests[] = {
>  	KUNIT_CASE(drm_test_buddy_alloc_limit),
>  	KUNIT_CASE(drm_test_buddy_alloc_range),

-- 
Jani Nikula, Intel Open Source Graphics Center
