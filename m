Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ED38C818F
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 09:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E46810EE12;
	Fri, 17 May 2024 07:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMuDVIS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB0F10EE10;
 Fri, 17 May 2024 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931562; x=1747467562;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bnCTXHWEkDQPHFHbQcPbiHSrmYPXAkSjLnnflBJI6kg=;
 b=nMuDVIS0/QY3VZ6tI8GMqD1DGz6RAw50NfId79Ca8AnmbB4S8Z7fnsic
 MrDAKRW3S9L2DOuNhudmBCxOlZq9hrz70hXlaCRMKXkrsmfBYdCBsfZ00
 BPVVx0x7GuqdbF833soaqgXKVGhw0A+d5vygSjY+AosuqAI7vi7fKOaI3
 Ougczt456MzIQGKmMGBO2LGGHVbKz4F5E+McrqbeF3LZixoRYtre7RwXL
 f3fNvZVWxLyJs93b02FONM3VSFxrw+pQ2yaZfvPH3rBBhSCNnD+feMbnb
 hg30/mFol4UotOBhbzuK45imTlp+RW6wY5I48TmG9PLlkRcuxofw0JoeU w==;
X-CSE-ConnectionGUID: zTeypYoTRUuUKAye2fhh2Q==
X-CSE-MsgGUID: WsrD3C6iTRWBRKyMa0clmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12202378"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12202378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:39:22 -0700
X-CSE-ConnectionGUID: OYnVtnQnRHmMiz3CJA68Ng==
X-CSE-MsgGUID: 5h7Gt5XWTFen0Rmdg4bK6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="69162344"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:39:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>, Andi
 Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Set always_coherent to false when
 reading from CPU
In-Reply-To: <20240516151403.2875-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240516151403.2875-1-nirmoy.das@intel.com>
Date: Fri, 17 May 2024 10:39:14 +0300
Message-ID: <87bk54c2fx.fsf@intel.com>
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

On Thu, 16 May 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
> The previous commit 'commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick

"previous commit" is a fairly vague reference once this gets
committed. It's not going to be "previous" in any meaningful sense.

Please just start with:

Commit 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")
was not complete...

And probably add:

Fixes: 8d4ba9fc1c6c ("drm/i915/selftests: Pick correct caching mode.")

BR,
Jani.

> correct caching mode.")' was not complete as for non LLC  sharing platforms
> cpu read can happen from LLC which probably doesn't have the latest
> changes made by GPU.
>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 65a931ea80e9..3527b8f446fe 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -196,7 +196,7 @@ static int verify_access(struct drm_i915_private *i915,
>  	if (err)
>  		goto out_file;
>  
> -	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, true);
> +	mode = intel_gt_coherent_map_type(to_gt(i915), native_obj, false);
>  	vaddr = i915_gem_object_pin_map_unlocked(native_obj, mode);
>  	if (IS_ERR(vaddr)) {
>  		err = PTR_ERR(vaddr);

-- 
Jani Nikula, Intel
