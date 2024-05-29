Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F152A8D31C6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43D110E2C6;
	Wed, 29 May 2024 08:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSXRYAym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8310E106;
 Wed, 29 May 2024 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716972135; x=1748508135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v9qTfQQNVSHKFQJvGsalKNH/EXP4hSDPKzkYoVZxIYQ=;
 b=ZSXRYAymRwxOjlw1Is4UZ7yxQ0hc58ckOR1WppjrHa31Hrn6vSsVjX6P
 GGh5OZPaYK92bxgkccIaUGYOHGTR8y0E9nQzIVnk+87aUVzwXkzno2d3o
 wZRANPuFn1Iuh3tXgbb4a4q2JrVOyKR0N03cAlfPiUe0NT07WzJpVRU/p
 JWcsPbDkgxTST0bkE1QAUjdUq6d0+J3WCDeRyO12yMaQs+OhtHtVPOqa2
 N/5sjCw+9Ms5aQ36A8ijh7bxJwnEOgVEPCl4lk5LUG1T2kyLosjoXJfja
 7oe3QlbK80oEnTnlvsCBWxCfzme3Z4CUzYvckuLdN9ExiMAeDozuZgnYT Q==;
X-CSE-ConnectionGUID: mKlfgrfNRAKyMwdlhgFMmw==
X-CSE-MsgGUID: XKFhlkxFQ3iT7FxFL/qMbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17153647"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="17153647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:42:14 -0700
X-CSE-ConnectionGUID: EK72pWMqRV6KqEDw2+CxEw==
X-CSE-MsgGUID: ujxQzvadSCebdWqFr8DPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35290243"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.33.194])
 ([10.246.33.194])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:42:11 -0700
Message-ID: <f2c2f983-6e75-4cc6-b793-5ff928b5605d@linux.intel.com>
Date: Wed, 29 May 2024 10:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915: Increase FLR timeout from 3s to 9s
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240523235853.171796-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240523235853.171796-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 5/24/2024 1:58 AM, Andi Shyti wrote:
> Following the guidelines it takes 3 seconds to perform an FLR
> reset. Let's give it a bit more slack because this time can
> change depending on the platform and on the firmware
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> Hi,
>
> In this second version I removed patch 2 that was ignoring the
> FLR reset timeouts, until we develop a proper patch.
>
> This first patch is basically the same as v1. Thanks Nirmoy for
> your review.
>
> Andi
>
>   drivers/gpu/drm/i915/intel_uncore.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 729409a4bada..2eba289d88ad 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2614,11 +2614,18 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>   static void driver_initiated_flr(struct intel_uncore *uncore)
>   {
>   	struct drm_i915_private *i915 = uncore->i915;
> -	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> +	unsigned int flr_timeout_ms;
>   	int ret;
>   
>   	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
>   
> +	/*
> +	 * The specification recommends a 3 seconds FLR reset timeout. To be
> +	 * cautious, we will extend this to 9 seconds, three times the specified
> +	 * timeout.
> +	 */
> +	flr_timeout_ms = 9000;
> +
>   	/*
>   	 * Make sure any pending FLR requests have cleared by waiting for the
>   	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
