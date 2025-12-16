Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F78CC53B2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 22:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61D910E5DE;
	Tue, 16 Dec 2025 21:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwaeYJXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818410E999;
 Tue, 16 Dec 2025 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765921139; x=1797457139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f5okGcgCBI7Z3LuHIlyHhvtXv4kK+JFCDH3wKCj/fjU=;
 b=JwaeYJXEaEflDhYzObbGLDH//B7Mw4jG5XK7P2Oio74tOj3eXxXvvOfP
 /ryzA3KrU4miahCdwNS3lRWLQPJGtDuH+IoVc1C3M2tYCYFXBubeRDX8Y
 yeCuSrz80U6PtYpV44wjdNh/lz9+QYQD6dFi40KFrwTOEgAwcQtq/i2e3
 uLBkZHtmwebrSS+TBIWwdMkMl5o0IHmNOP160wR+8M9dluEjBVBn8+e4U
 kR3faQBWnu9UNDvP4TlvqMTkCE59+qPjNnXP9IaCqqxltAduYnnVfQ8pw
 CM0Z/u4/UsiQ7sU4O+KRj7jZSeOLlJU1A8hYL8dYwQCgKsVVp0G/0uAHH w==;
X-CSE-ConnectionGUID: hCNXOz8CTZmh87v920KIIw==
X-CSE-MsgGUID: O5yC8htPRyed+BJZEKGSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93325609"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="93325609"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:38:59 -0800
X-CSE-ConnectionGUID: yNSgv3W8SKe51o2zhHtqow==
X-CSE-MsgGUID: I6FkcQaMQnCAOTeWiOvX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="197228070"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.14])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:38:57 -0800
Date: Tue, 16 Dec 2025 23:38:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>, 
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Norbert Lange <nolange79@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Mark dependency on CONFIG_X86_PAT
Message-ID: <aUHRbTRd0NQ4GbXc@intel.com>
References: <20251216113512.153447-1-joonas.lahtinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216113512.153447-1-joonas.lahtinen@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Dec 16, 2025 at 01:35:12PM +0200, Joonas Lahtinen wrote:
> Building the driver without CONFIG_X86_PAT would yield in reduced
> platform/uAPI support and is not currently planned to be supported.
> 
> Add a dependency in Kconfig to avoid issues with such build until
> somebody steps up to fix and validate such builds.

The driver works just fine w/o PAT on older GPUs at least. Otherwise
it wouldn't work at all on any P3 class CPU as the kernel completely
disables PAT support on those even if the kernel is built with
X86_PAT=y. You can also disable PAT on the command line with "nopat".

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15410
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Reported-by: Norbert Lange <nolange79@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
> -- 
> 2.52.0

-- 
Ville Syrjälä
Intel
