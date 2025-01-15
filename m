Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3FA122C6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 12:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBCA10E61C;
	Wed, 15 Jan 2025 11:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBpV7T1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23D410E627;
 Wed, 15 Jan 2025 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736941130; x=1768477130;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/nmhWO58uk/v+smw796NHnRZKEqIMOjI2SEnJBcl8U0=;
 b=jBpV7T1x8k0MKhsGR8QTS6gZV6oW9wcunyIQfOx5EQuCoexJ2RezGQpW
 nnWeo2tRBtizIBmvIOUC+pFd3XGeBzOoJEGySigXCrTP7typY4kL4+MJq
 8gFLEUPgfWU7o+sGIJxZ+f1VvXoLaOmJmGODxrXvkC+Kob9Neu/2ohxC0
 RFZK3B93IEUkQpc7ydP/vl6jkfKG6P9tWZnkiE8lKx1+4eCdCP6xTR+rn
 uACTWlj9oZGS8VOfey+zmFdbfrqAKSg5icyzelyOC9WGMa5NIkj6+EvsG
 C2FFltw3AHJoX5h116pKbrkZQFR90VLj9fUuewH37IwDYAta/2nHcwgKQ g==;
X-CSE-ConnectionGUID: O5YXajE3TcixqXGfK02WNA==
X-CSE-MsgGUID: sZqH3v2nTUyHJLsHOOx5yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37152255"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="37152255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 03:38:49 -0800
X-CSE-ConnectionGUID: H3Xm0adlSuKofwcpzXVGZg==
X-CSE-MsgGUID: SIn1NRPMTlSABRXVaXj9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="104950046"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 03:38:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, Arunpravin
 Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, "Lin . Cao"
 <lincao12@amd.com>
Subject: Re: [PATCH v2 2/2] drm/buddy: Add a testcase to verify the
 multiroot fini
In-Reply-To: <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
 <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
Date: Wed, 15 Jan 2025 13:38:43 +0200
Message-ID: <875xmggvcs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 26 Dec 2024, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.=
com> wrote:
> - Added a testcase to verify the multiroot force merge fini.
> - Added a new field in_use to track the mm freed status.
>
> v2:(Matthew)
>   - Add kunit_fail_current_test() when WARN_ON is true.

This i.e. commit 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the
multiroot fini") fails drm-tip build for me with:

In file included from ../drivers/gpu/drm/tests/drm_buddy_test.c:15:
../drivers/gpu/drm/tests/drm_buddy_test.c: In function =E2=80=98drm_test_bu=
ddy_alloc_clear=E2=80=99:
../drivers/gpu/drm/tests/drm_buddy_test.c:264:23: error: unused variable =
=E2=80=98prng=E2=80=99 [-Werror=3Dunused-variable]
  264 |         DRM_RND_STATE(prng, random_seed);
      |                       ^~~~
../drivers/gpu/drm/tests/../lib/drm_random.h:18:26: note: in definition of =
macro =E2=80=98DRM_RND_STATE=E2=80=99
   18 |         struct rnd_state name__ =3D DRM_RND_STATE_INITIALIZER(seed_=
_)
      |                          ^~~~~~
cc1: all warnings being treated as errors


BR,
Jani.


>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>  drivers/gpu/drm/drm_buddy.c            |  6 +++++-
>  drivers/gpu/drm/tests/drm_buddy_test.c | 29 ++++++++++++++++++--------
>  2 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index ca42e6081d27..241c855f891f 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -3,6 +3,8 @@
>   * Copyright =C2=A9 2021 Intel Corporation
>   */
>=20=20
> +#include <kunit/test-bug.h>
> +
>  #include <linux/kmemleak.h>
>  #include <linux/module.h>
>  #include <linux/sizes.h>
> @@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>  		start =3D drm_buddy_block_offset(mm->roots[i]);
>  		__force_merge(mm, start, start + size, order);
>=20=20
> -		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> +		if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
> +			kunit_fail_current_test("buddy_fini() root");
> +
>  		drm_block_free(mm, mm->roots[i]);
>=20=20
>  		root_size =3D mm->chunk_size << order;
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tes=
ts/drm_buddy_test.c
> index 9662c949d0e3..4b5818f9f2a9 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -385,17 +385,28 @@ static void drm_test_buddy_alloc_clear(struct kunit=
 *test)
>  	drm_buddy_fini(&mm);
>=20=20
>  	/*
> -	 * Create a new mm with a non power-of-two size. Allocate a random size=
, free as
> -	 * cleared and then call fini. This will ensure the multi-root force me=
rge during
> -	 * fini.
> +	 * Create a new mm with a non power-of-two size. Allocate a random size=
 from each
> +	 * root, free as cleared and then call fini. This will ensure the multi=
-root
> +	 * force merge during fini.
>  	 */
> -	mm_size =3D 12 * SZ_4K;
> -	size =3D max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
> +	mm_size =3D (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
> +
>  	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> -							    size, ps, &allocated,
> -							    DRM_BUDDY_TOPDOWN_ALLOCATION),
> -				"buddy_alloc hit an error size=3D%u\n", size);
> +	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << ma=
x_order,
> +							    4 * ps, ps, &allocated,
> +							    DRM_BUDDY_RANGE_ALLOCATION),
> +				"buddy_alloc hit an error size=3D%lu\n", 4 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << ma=
x_order,
> +							    2 * ps, ps, &allocated,
> +							    DRM_BUDDY_CLEAR_ALLOCATION),
> +				"buddy_alloc hit an error size=3D%lu\n", 2 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << max_o=
rder, mm_size,
> +							    ps, ps, &allocated,
> +							    DRM_BUDDY_RANGE_ALLOCATION),
> +				"buddy_alloc hit an error size=3D%lu\n", ps);
>  	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>  	drm_buddy_fini(&mm);
>  }

--=20
Jani Nikula, Intel
