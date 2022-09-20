Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7565BDFB0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A11A10E392;
	Tue, 20 Sep 2022 08:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523BB10E392;
 Tue, 20 Sep 2022 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663661947; x=1695197947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XsLK0rUD3KK3Xm/Wda0NghIGHbyZGZps+l+d5v4b5Bk=;
 b=GJj+Mp5ajNqloYUPQ+HYtQKpyUAqYKt21NxweR+49kQowc2+bWLDrcmN
 TEF6Wj4PGMsPFeIqSlLCc5Hs0uHf5C+YMzqnCqU+lTn+I/uyxmJQQIsF/
 GjkAwzfnqzj99Dyc5VMqOPhWpGavClPizV6k/ilLIiWMMRtoXHSjJf/FS
 q5SPC4le6OrCY/3mT0TSZ+Sv4FODU2mcnAFOrzZnp16DTn0XL+hFTioGA
 wRreenbaPp2jFh6oROSp4b0bMFo+napNuuxikKuuAroKkkLFN9Dg21QHq
 zv+UOL8HdOmpgJNf3ybTFsrRjFvpd5W5cnfkV/0TgGawfa8aP+sBtGOxB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299622550"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="299622550"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 01:19:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="744433857"
Received: from thrakatuluk.fi.intel.com (HELO
 platvala-desk.ger.corp.intel.com) ([10.237.72.90])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 01:19:02 -0700
Date: Tue, 20 Sep 2022 11:18:25 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Isabella Basso <isabbasso@riseup.net>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] tests: DRM selftests: switch to
 KUnit
Message-ID: <Yyl3UXvLd3Jyr9uP@platvala-desk.ger.corp.intel.com>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-5-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829000920.38185-5-isabbasso@riseup.net>
X-Patchwork-Hint: comment
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
Cc: linux-kselftest@vger.kernel.org, magalilemes00@gmail.com,
 maira.canal@usp.br, dlatypov@google.com, tales.aparecida@gmail.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, n@nfraprado.net, davidgow@google.com,
 skhan@linuxfoundation.org, andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 28, 2022 at 09:09:20PM -0300, Isabella Basso wrote:
> As the DRM selftests are now using KUnit [1], update IGT tests as well.
> 
> [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/
> 
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> ---
>  tests/drm_buddy.c    |  7 ++++---
>  tests/drm_mm.c       |  7 ++++---
>  tests/kms_selftest.c | 12 +++++++++---
>  3 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> index 06876e0c..74c06dce 100644
> --- a/tests/drm_buddy.c
> +++ b/tests/drm_buddy.c
> @@ -6,9 +6,10 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
>  
> -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
> +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct \
> +		      drm_buddy) using KUnit");
>  
> -igt_main
> +igt_simple_main
>  {
> -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +	igt_kunit("drm_buddy_test", NULL);
>  }

With kselftests we had the ability to only run a specified set of
tests, and with or without selection, we had sub-results for each
through dynamic subtests. Does kunit have that possibility? I mean I
know kunit itself does but what about igt_kunit()?

Orthogonal to that question, drm_mm and test-drm_modeset are _now_
using kunit but in LTS kernels they're not, and we'd like to be able
to keep testing those. That means having both launchers here and just
letting the "incorrect" one produce a 'skip'.


-- 
Petri Latvala


> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 2052b115..75fc6682 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -24,9 +24,10 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
>  
> -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
> +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)\
> +		     using KUnit");
>  
> -igt_main
> +igt_simple_main
>  {
> -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> +	igt_kunit("drm_mm_test", NULL);
>  }
> diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
> index abc4bfe9..bbf24c2b 100644
> --- a/tests/kms_selftest.c
> +++ b/tests/kms_selftest.c
> @@ -24,9 +24,15 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
>  
> -IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
> +IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests using KUnit");
>  
> -igt_main
> +igt_simple_main
>  {
> -	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
> +	igt_kunit("drm_cmdline_parser_test", NULL);
> +	igt_kunit("drm_damage_helper_test", NULL);
> +	igt_kunit("drm_dp_mst_helper_test", NULL);
> +	igt_kunit("drm_format_helper_test", NULL);
> +	igt_kunit("drm_format_test", NULL);
> +	igt_kunit("drm_framebuffer_test", NULL);
> +	igt_kunit("drm_plane_helper_test", NULL);
>  }
> -- 
> 2.37.2
> 
