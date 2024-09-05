Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA396D9CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035DF10E896;
	Thu,  5 Sep 2024 13:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COWRd9fH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBF810E896;
 Thu,  5 Sep 2024 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725541572; x=1757077572;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=g1SQN7j55UMlCekE8jx808qYJxlM2mhzf/HdquuSpmo=;
 b=COWRd9fHsatP0RB8An2KCS10qPw01qS2za4GuVcHpsPe/dk/FdKEIVEx
 JtJyKuouQ8Skk56lpdMMb6atFFK1xME7I+axH7CnYGrxWaVFh5Iyts2T0
 GytZvWbI11M7Fr84rIngt5Mm2lama+KjoybyF89IH2ZLNOzfQU7zX0qg4
 wir3NPv2Kg+1eFdTtWjkCrQySBAVm07PhVoNYjfdM77VCXj/DU/bnn8NN
 5CE2GGm88yjw8TslevA0zOqCjqng0lFslvvA/CVU1NVaHj8F/cZzRwMTS
 z7zAsa1tFrrMwSvZaLbR9GXpaCHj6+AZGjU2ZrplB2XAhRCfs5EDqT6Bo g==;
X-CSE-ConnectionGUID: gmLvwtXNQn6ETNvGQnXf4Q==
X-CSE-MsgGUID: w9bYeZPVRp+MXuT5Nf0f0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27177038"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="27177038"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:06:12 -0700
X-CSE-ConnectionGUID: D6YR5lCgSHyhMajcqYWpcQ==
X-CSE-MsgGUID: ARXOi5PXRXiTHFtQOtIKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70210401"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:06:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/18] drm/i915/selftests: Include <linux/prandom.h>
 instead of <linux/random.h>
In-Reply-To: <20240905122020.872466-3-ubizjak@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905122020.872466-1-ubizjak@gmail.com>
 <20240905122020.872466-3-ubizjak@gmail.com>
Date: Thu, 05 Sep 2024 16:06:06 +0300
Message-ID: <871q1yqmgx.fsf@intel.com>
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

On Thu, 05 Sep 2024, Uros Bizjak <ubizjak@gmail.com> wrote:
> Usage of pseudo-random functions requires inclusion of
> <linux/prandom.h> header instead of <linux/random.h>.
>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

LGTM,

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree suits you best.

> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c    | 2 +-
>  drivers/gpu/drm/i915/selftests/i915_random.h | 2 +-
>  drivers/gpu/drm/i915/selftests/scatterlist.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/=
i915/selftests/i915_gem.c
> index 61da4ed9d521..0727492576be 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -4,7 +4,7 @@
>   * Copyright =C2=A9 2018 Intel Corporation
>   */
>=20=20
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>=20=20
>  #include "gem/i915_gem_internal.h"
>  #include "gem/i915_gem_pm.h"
> diff --git a/drivers/gpu/drm/i915/selftests/i915_random.h b/drivers/gpu/d=
rm/i915/selftests/i915_random.h
> index 05364eca20f7..70330a2e80f2 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_random.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_random.h
> @@ -26,7 +26,7 @@
>  #define __I915_SELFTESTS_RANDOM_H__
>=20=20
>  #include <linux/math64.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>=20=20
>  #include "../i915_selftest.h"
>=20=20
> diff --git a/drivers/gpu/drm/i915/selftests/scatterlist.c b/drivers/gpu/d=
rm/i915/selftests/scatterlist.c
> index 805c4bfb85fe..7e59591bbed6 100644
> --- a/drivers/gpu/drm/i915/selftests/scatterlist.c
> +++ b/drivers/gpu/drm/i915/selftests/scatterlist.c
> @@ -22,7 +22,7 @@
>   */
>=20=20
>  #include <linux/prime_numbers.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>=20=20
>  #include "i915_selftest.h"
>  #include "i915_utils.h"

--=20
Jani Nikula, Intel
