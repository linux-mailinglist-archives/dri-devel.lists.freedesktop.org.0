Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCEAEEEB4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 08:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446D788C4C;
	Tue,  1 Jul 2025 06:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWODA6qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6A88C4C;
 Tue,  1 Jul 2025 06:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751351310; x=1782887310;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2wxZIi4gIiYCNlqWQVBFfErN3PZGpEH+z0uZFe8pTVc=;
 b=iWODA6qagkEcamORs/vbZAbwqWXlHGeIc3Wa5dCY+y+X3ThvQL7jAAqk
 9vsPGzyh1nQo4PCR4b1PVqh0Z5lCFHUf6y2Ey+vkyzBmUZMlsTrm+57gk
 q0m2G5dYDi6Zb757HspNRtjdbTvbiJGnVHMm91dAEMn96+v4/fG+bgbUP
 c6LgACblD1t/0KXFJc3pPTmRaWr4YvPbNwK44eojQKEGzQs7apzl3jk9p
 u3V83ifZFaogNi3ie2jlYI+rQCR8CqsotMksf0HeF65Xw5pZIiB4NHS7e
 sv38H2xEBCknlA4qkKhU6D1GO12VHcx9NHybFKN2PiNgr4RCiLB8ngQP8 A==;
X-CSE-ConnectionGUID: ZmYMql9RRwa1ub5IBqiWrw==
X-CSE-MsgGUID: F9XDLxsuS2uTkCOh28Nacw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="65043608"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="65043608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 23:28:30 -0700
X-CSE-ConnectionGUID: b0z2PZPcQWiCmARapqI1rg==
X-CSE-MsgGUID: smPg3RhPTbmyJqqZ1EgBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159384160"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 23:28:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ruben Wauters <rubenru09@aol.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <arlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
In-Reply-To: <20250701025426.262129-1-rubenru09@aol.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250701025426.262129-1-rubenru09.ref@aol.com>
 <20250701025426.262129-1-rubenru09@aol.com>
Date: Tue, 01 Jul 2025 09:28:23 +0300
Message-ID: <8a3ef0b42de25db3faf384260b7abdce468cb65f@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Jul 2025, Ruben Wauters <rubenru09@aol.com> wrote:
> DRM_DEBUG_SELFTEST was replaced with DRM_KUNIT_TEST.
>
> This patch replaces the select in Kconfig.debug to use the replacement.

Why? That's the most important questions the commit messages should
answer.

BR,
Jani.

>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
>  drivers/gpu/drm/i915/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 1852e0804942..b15b1cecb3aa 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
>  	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
>  	select DRM_DEBUG_MM if DRM=y
>  	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_DEBUG_SELFTEST
> +	select DRM_KUNIT_TEST
>  	select DMABUF_SELFTESTS
>  	select SW_SYNC # signaling validation framework (igt/syncobj*)
>  	select DRM_I915_WERROR

-- 
Jani Nikula, Intel
