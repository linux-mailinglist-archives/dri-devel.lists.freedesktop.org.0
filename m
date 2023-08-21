Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E8782B30
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8986B10E26E;
	Mon, 21 Aug 2023 14:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0510E26C;
 Mon, 21 Aug 2023 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692626996; x=1724162996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vl/iB9e3YJjMLmUFh8K+TnFsMKGI4oNQZH9zI9Q08NY=;
 b=gOQOd+/BZFCpqugUhofUm4gbWbag7pO/x1pJn7O1lEoROucIPsPKtlnt
 Hn9EXp2K/mXbr2tNwJ0caxHZ4yrbyTEmcEsPBoMSWxHogo9Gjx/j0p6ON
 Y5GrJUDuom3cp1TD+jeQidNcaa4pQq+az8M1jbQGaW3vBmfr4f5LKbGvF
 1HcHRO20Q3bCVYcXmUVHqemznBBifDVrsFPvCnhk3aiM1+yfcZaKEqdHE
 yip6aQO2FzoBfOZNBnz9WTL61y8kzbrxGxWu4A/ztJu+/oAnZpbkQ6qoi
 4Y16E7Xo+aza+zHa+lh2R5idSPTTFTpNfO3KVlnc1omhVCs2DiR4INxGT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376348419"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376348419"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="770963020"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="770963020"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.180.108])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 07:09:54 -0700
Date: Mon, 21 Aug 2023 16:09:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when
 flush delayed work on gt reset
Message-ID: <ZONwL4mCwIlxne/X@ashyti-mobl2.lan>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811182011.546026-1-zhanjun.dong@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhanjun,

On Fri, Aug 11, 2023 at 11:20:11AM -0700, Zhanjun Dong wrote:
> This attempts to avoid circular locking dependency between flush delayed
> work and intel_gt_reset.
> When intel_gt_reset was called, task will hold a lock.
> To cacel delayed work here, the _sync version will also acquire a lock,

/cacel/cancel

> which might trigger the possible cirular locking dependency warning.
> When intel_gt_reset called, reset_in_progress flag will be set, add code
> to check the flag, call async verion if reset is in progress.

/verion/version/

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---

There is no changelog here :/

Can you please add the changelog after the '---' section?

The commit log has changed and...

>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..600388c849f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>  
>  static void guc_cancel_busyness_worker(struct intel_guc *guc)
>  {
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	/*
> +	 * When intel_gt_reset was called, task will hold a lock.
> +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
> +	 * trigger the possible cirular locking dependency warning.
> +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
> +	 */
> +	if (guc_to_gt(guc)->uc.reset_in_progress)
> +		cancel_delayed_work(&guc->timestamp.work);
> +	else
> +		cancel_delayed_work_sync(&guc->timestamp.work);

... now you are checking out of reset_in_progress.

Normally the convention here is to have the *_locked() version of
the function. But I'm OK with this, as well... John, any opinion?

Anyway, comparing with your previous patch the decision is made
out of different elements and only __reset_guc_busyness_stats()
needed this change.

Andi

>  }
>  
>  static void __reset_guc_busyness_stats(struct intel_guc *guc)
> -- 
> 2.34.1
