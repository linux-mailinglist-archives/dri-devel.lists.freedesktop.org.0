Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B48595773
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B35712A7D7;
	Tue, 16 Aug 2022 10:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61410E80E;
 Tue, 16 Aug 2022 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660644211; x=1692180211;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QbCT1sLbylKU8NArDQzZ1P96rD3BVMmOXRpXN7woAJk=;
 b=Ttf4fZXYx6lCXT+as6b+EzypjZXxPUzY9pBdLuVsXT34CdvVpCjKkywV
 JLZpCHyAiQOz5JIqrf3odUKo8DAehJ/fwUoyz4ySbQqxvrG4UcFWY9aCZ
 yPfOLy2gdHmesiiHtJy96m/i0hnwmO5uG4BnJXhYCzQ/K+/wmGvePZ/r2
 m5Xu7pl6Hhsbb1KQyQ7UGy1a+CNYmGrToJKAlxnrELeKKIJ4eOOCNiju6
 Tgg70VbECzjbFQhQvZOwVOoixZ0Su7z6085s9nsFF4M5ArA1VohZr5GoJ
 c/y8SaH6B/GLsqNBS05rSyjdVp0mvpAgSV5a/eq7Ff6yfuyyZmJy9TFMs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292175033"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="292175033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 03:03:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="667044414"
Received: from kinzelba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.194])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 03:03:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Denis Arefev <arefev@swemel.ru>
Subject: Re: [PATCH 3/3] i915-pmu: Add extra check NULL
In-Reply-To: <20220816092525.37670-1-arefev@swemel.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220816092525.37670-1-arefev@swemel.ru>
Date: Tue, 16 Aug 2022 13:03:24 +0300
Message-ID: <878rnoqzdf.fsf@intel.com>
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
Cc: ldv-project@linuxtesting.org, trufanov@swemel.ru,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, vfh@swemel.ru,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Aug 2022, Denis Arefev <arefev@swemel.ru> wrote:
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

The subject prefix should be something along the lines of
"drm/i915/pmu".

The subject is misleading; there are no functional changes here, just
whitespace changes. I'm guessing you intended to send something else?

Finally, the commit message is primarily for describing why the change
is being made, not to advertize organizations or tools.


BR,
Jani.


>
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 34a7f0ef1f67..33db49ffac3d 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -704,8 +704,7 @@ static void i915_pmu_disable(struct perf_event *event)
>  		 * Decrement the reference count and clear the enabled
>  		 * bitmask when the last listener on an event goes away.
>  		 */
> -		if(engine != NULL)
> -		{
> +		if (engine != NULL) {
>  		        if (--engine->pmu.enable_count[sample] == 0)
>  			        engine->pmu.enable &= ~BIT(sample);
>  		}

-- 
Jani Nikula, Intel Open Source Graphics Center
