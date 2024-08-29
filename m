Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE34964BCD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB6110E664;
	Thu, 29 Aug 2024 16:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwtMe1ZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62010E73D;
 Thu, 29 Aug 2024 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724949497; x=1756485497;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8ECC19f7mP9IVu+SQ2hfFfUpwDcFE4fVvV0UmBQ8W7U=;
 b=bwtMe1ZH5iVH4HKUuGH9HfGekYtch1I/+AiMVm14heuAx3zU9bCCRVh3
 oY3Ge7n3kLe/cSPOtp8ts2LFXMxC4Ujy4orevceqH7WmHarn4ecqhsWzt
 UsCjNRGJCysj0AsyU0hikcWBYbENzjSibmpkHX7cMvPGp0r9gcMXVwTcY
 bpGuu2v+SMlv3DN31bvlBgPCBWuvwsGQ2KkwKAN6jXk4/RblUPkd+/e68
 UPlFVP+VuT1dsIpjuoRcQieNqngYoHq9Lpbg+oV6C16+CvWcOzNFTYfs7
 1qjnLpSSaRBB8omAvm6+DSTDHEbl7OcNblXtnc+c64TyRRPsvpbbtSH4j g==;
X-CSE-ConnectionGUID: NkvtbTnwTmqPaAZ+pbI2Eg==
X-CSE-MsgGUID: 3efSW4eoRc+U9hJcBSmC6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34173325"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34173325"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:38:16 -0700
X-CSE-ConnectionGUID: Ch6AQZiFSK6fqQtfOpDAEw==
X-CSE-MsgGUID: /RG5O2MmSzGvUkcQqX1yJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63593983"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:38:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
In-Reply-To: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 29 Aug 2024 19:38:08 +0300
Message-ID: <87cylrwahb.fsf@intel.com>
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

On Thu, 29 Aug 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> With CONFIG_WERROR=y and `make W=1` build fails on my x86_64 machine.
> This is due to some unused functions. Hence these quick fixes.

Since when have we been getting the warnings for static inlines?

BR,
Jani.


>
> Andy Shevchenko (2):
>   drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
>   drm/i915/fence: Mark debug_fence_free() with __maybe_unused
>
>  drivers/gpu/drm/i915/i915_sw_fence.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

-- 
Jani Nikula, Intel
