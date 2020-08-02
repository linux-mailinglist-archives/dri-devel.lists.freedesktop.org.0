Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285102356B7
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A5A89C96;
	Sun,  2 Aug 2020 11:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDD189C96;
 Sun,  2 Aug 2020 11:40:51 +0000 (UTC)
IronPort-SDR: +vZxP5qq/ipmYYS9nCz4JlIndGS7vjJWP5cxKPu7WiVxYhMZNh3kzcoxhvNUBHPCro6jubjihP
 OK1+833IU7NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9700"; a="153201992"
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="153201992"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 04:40:50 -0700
IronPort-SDR: zTmAvTqRF5Q/d8MAJQczFCPyOgqePoEIe4gpsyHTg45B1dHmF8LJdjZvJFUotZCyOJbim2Oxxp
 KUn8qpeVMTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="366035580"
Received: from cahanley-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.10.182])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2020 04:40:45 -0700
Date: Sun, 2 Aug 2020 14:40:44 +0300
From: Andi Shyti <andi.shyti@intel.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH] drm/i915: Fix wrong return value
Message-ID: <20200802114044.GD4705@intel.intel>
References: <20200802111534.5155-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802111534.5155-1-tianjia.zhang@linux.alibaba.com>
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
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@intel.com, airlied@linux.ie,
 mika.kuoppala@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, chris@chris-wilson.co.uk,
 tianjia.zhang@alibaba.com, matthew.auld@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tianjia,

> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index d960d0be5bd2..cc017e3cc9c5 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -758,7 +758,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
>  	intel_engine_mask_t tmp, mask = engine->mask;
>  	struct llist_node *first = NULL, *last = NULL;
>  	struct intel_gt *gt = engine->gt;
> -	int err;
> +	int err = 0;

you don't need the initialization here.

Thanks,
Andi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
