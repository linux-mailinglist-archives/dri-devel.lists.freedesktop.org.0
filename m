Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5B423954
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 10:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727A36ECF9;
	Wed,  6 Oct 2021 08:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF86E50B;
 Wed,  6 Oct 2021 08:02:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225887435"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="225887435"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:02:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="714699944"
Received: from jpferrer-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:02:42 -0700
Message-ID: <2310ad7d-7edf-c012-389e-4201072c65ee@linux.intel.com>
Date: Wed, 6 Oct 2021 10:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 3/8] drm/i915/gtt: drop unneeded make_unshrinkable
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211005182405.915100-1-matthew.auld@intel.com>
 <20211005182405.915100-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211005182405.915100-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/5/21 20:24, Matthew Auld wrote:
> We already do this when mapping the pages.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 1 -
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



>
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index 890191f286e3..baea9770200a 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -185,7 +185,6 @@ static void gen6_alloc_va_range(struct i915_address_space *vm,
>   
>   			pt = stash->pt[0];
>   			__i915_gem_object_pin_pages(pt->base);
> -			i915_gem_object_make_unshrinkable(pt->base);
>   
>   			fill32_px(pt, vm->scratch[0]->encode);
>   
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 037a9a6e4889..8af2f709571c 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -301,7 +301,6 @@ static void __gen8_ppgtt_alloc(struct i915_address_space * const vm,
>   
>   			pt = stash->pt[!!lvl];
>   			__i915_gem_object_pin_pages(pt->base);
> -			i915_gem_object_make_unshrinkable(pt->base);
>   
>   			fill_px(pt, vm->scratch[lvl]->encode);
>   
