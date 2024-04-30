Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B098B7AA2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFC910FF83;
	Tue, 30 Apr 2024 14:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="en5MiFZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DEC10FFC9;
 Tue, 30 Apr 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714488839; x=1746024839;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Rl6HLtD+SrAESx6llv2JBjqPlhuySYPH0gh4XoWicNE=;
 b=en5MiFZAgt7OYlBYrd/s/zAceM+cMee9S0s/1I2z6SUax8n1lRYICts1
 8RisTwvWGP5HhrEkQu5rX0BvnXctzdfX5ymQum49ZbVKXeF8ktgUksPP5
 QpGWH8BZhjnCT4cGIKs5WU2XxW+rW3sC3NTtVlrK8ESeQeGR/lhdIi4ze
 9ED4G+3rh2Ur01UX6IvS92QdCiADNmmlDi5n+4gk0+E/UKarFSoLvutyo
 zVwUMDh00khH51P1zzbjHsVjTvmz/eoijb9c6vRpx/wn125YaYetIw/Fm
 VeEjvOI2PIrN13YqNw21tScQ1ECpnSdHa9mAM0Wm90D2kMPtSFkDBfAn0 Q==;
X-CSE-ConnectionGUID: HVKtNojMS9aLxG3SnLtUaA==
X-CSE-MsgGUID: hP67JdoLSD+iG/tj/7+ghQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20813919"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="20813919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:53:58 -0700
X-CSE-ConnectionGUID: t0BPq7emQSicqbUfqrBc/A==
X-CSE-MsgGUID: q2e9rP2xS+6wN+mdE15vmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26496839"
Received: from vkats-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:53:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, lyude@redhat.com,
 andrzej.hajda@intel.com, lucas.demarchi@intel.com,
 alexander.deucher@amd.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Danilo
 Krummrich <dakr@redhat.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/i915: fix missing linux/debugfs.h includes
In-Reply-To: <20240430142622.217616-1-dakr@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240430142622.217616-1-dakr@redhat.com>
Date: Tue, 30 Apr 2024 17:53:49 +0300
Message-ID: <875xvy3nr6.fsf@intel.com>
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

On Tue, 30 Apr 2024, Danilo Krummrich <dakr@redhat.com> wrote:
> After dropping linux/debugfs.h include from drm/drm_print.h the following
> files in i915 miss the linux/debugfs.h include: i915_debugfs.c,
> i915_debugfs_params.c and i915_gpu_error.c.
>
> Add the include to fix the corresponding build errors.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 33d5ae6cacf4 ("drm/print: drop include debugfs.h and include where=
 needed")
> Closes: https://lore.kernel.org/oe-kbuild-all/202404260726.nyGuvl59-lkp@i=
ntel.com/
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Thanks, but it's already fixed by commit 7fa043eafdb7 ("drm/i915: fix
build with missing debugfs includes") in drm-next.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/i915_debugfs.c        | 1 +
>  drivers/gpu/drm/i915/i915_debugfs_params.c | 1 +
>  drivers/gpu/drm/i915/i915_gpu_error.c      | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index 24c78873b3cf..b552e27cdcd5 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -26,6 +26,7 @@
>   *
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/sched/mm.h>
>  #include <linux/sort.h>
>  #include <linux/string_helpers.h>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm=
/i915/i915_debugfs_params.c
> index 8bca02025e09..295486b8ceb1 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs_params.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
> @@ -3,6 +3,7 @@
>   * Copyright =C2=A9 2019 Intel Corporation
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/kernel.h>
>=20=20
>  #include "i915_debugfs_params.h"
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915=
/i915_gpu_error.c
> index 2594eb10c559..625b3c024540 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -28,6 +28,7 @@
>   */
>=20=20
>  #include <linux/ascii85.h>
> +#include <linux/debugfs.h>
>  #include <linux/highmem.h>
>  #include <linux/nmi.h>
>  #include <linux/pagevec.h>
>
> base-commit: 4a9a567ab101e659a4fafb7a691ff6b84531a10a

--=20
Jani Nikula, Intel
