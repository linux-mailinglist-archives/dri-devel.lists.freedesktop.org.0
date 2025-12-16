Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E9CC276D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 12:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C4210E272;
	Tue, 16 Dec 2025 11:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+NtaCcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7F610E272;
 Tue, 16 Dec 2025 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765886032; x=1797422032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cjxHXFPH59AXM/xlhTfBBqZwcZxMZkbgGjhQ9pYLXPY=;
 b=Q+NtaCcZJ7Niqdw8PNX6Ouf2+eG6Gr2u2i1zLMgBOduiWB0OW91Tjw1T
 tsHe54tNsMC9++8f8lB4LE25V/Rj8OHiRtUVVxeFbfUbidILk/cwzd3oH
 rlqu2M+Ysy2dj1YaMTGR/qp8d3hGZn2kZiJ1sSvmvRpGn4bZSmOrw7upR
 wD4SWUtC1FjhmzWuwYK9PR4MibQKUQSPv+qrOjtmHGITjYC3JsXeh9j3H
 9hxXSqXFyG+ZT325BnMVlBHQbi//20MzPYSIYr3uBTFP1vBE6RqQqqHFE
 Tu4OgpEdZJk78W8mF0koS8mboOQBo0AHeqlpyWVlQoskLYcNMvWfgzEyJ w==;
X-CSE-ConnectionGUID: xk3Lw/CXRV26Fa0PdsiwnQ==
X-CSE-MsgGUID: Eaau3QEgSG+G0UvZKMsC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79256940"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="79256940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:53:52 -0800
X-CSE-ConnectionGUID: 5DjJc/5SSUO1H2EAh4qNUA==
X-CSE-MsgGUID: 1buAut2iQ46f01kcj67L4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198055770"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:53:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Intel graphics driver
 community testing & development <intel-gfx@lists.freedesktop.org>
Cc: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Norbert Lange <nolange79@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Mark dependency on CONFIG_X86_PAT
In-Reply-To: <20251216113512.153447-1-joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251216113512.153447-1-joonas.lahtinen@linux.intel.com>
Date: Tue, 16 Dec 2025 13:53:46 +0200
Message-ID: <196d00976bfdf1f47d7478bbf93bc2a1b1e5fa47@intel.com>
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

On Tue, 16 Dec 2025, Joonas Lahtinen <joonas.lahtinen@linux.intel.com> wrote:
> Building the driver without CONFIG_X86_PAT would yield in reduced
> platform/uAPI support and is not currently planned to be supported.
>
> Add a dependency in Kconfig to avoid issues with such build until
> somebody steps up to fix and validate such builds.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15410
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Reported-by: Norbert Lange <nolange79@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 5e939004b6463..a19a233239056 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_I915
>  	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
>  	depends on DRM
> -	depends on X86 && PCI
> +	depends on X86 && X86_PAT && PCI
>  	depends on !PREEMPT_RT
>  	select INTEL_GTT if X86
>  	select INTERVAL_TREE

-- 
Jani Nikula, Intel
