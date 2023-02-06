Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62D68B8FC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4510E348;
	Mon,  6 Feb 2023 09:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CB210E348;
 Mon,  6 Feb 2023 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675677076; x=1707213076;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ckeg6Faup2JNbftnJawOm9JyTMthGurgdsMcSMe7AAA=;
 b=aMFFfkevHMQxsfb+CHgW1vebZavRg01dwT83nT3qoa34rJsmstgk0HTD
 N61rRK73UmOjTlpq8rKlw0eP5ehNSkVWWZp3fRxLUm3RaDwL+hHOV0trh
 1Fb7C6pen/qEFtdrK2ENA+blhq5/V75GE/gg6Y0ocJwjVS3jpur4a72SZ
 PBhz+qSoTdUogoJD5q9f2f2jSi5upNeyptp8jSQU0P3PN4KzhXLbwgbYY
 rxUM2qi1Cgg3L58t/6hyNZKorj9758NjPTUTnDqmwiQt3mWA49qlO6lZE
 rbKo9j6dOv8jxdtNek9zFAaD8+L5TMUCA0UIjX1z9UpCSeL42C8colYEh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312822565"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="312822565"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:51:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790386854"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="790386854"
Received: from kgurski-mobl3.ger.corp.intel.com (HELO [10.213.203.226])
 ([10.213.203.226])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 01:51:13 -0800
Message-ID: <f761df58-fd0d-4f08-649f-365e55b41f7b@linux.intel.com>
Date: Mon, 6 Feb 2023 09:51:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Initialize the obj flags for
 shmem objects
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230203135205.4051149-1-aravind.iddamsetty@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230203135205.4051149-1-aravind.iddamsetty@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03/02/2023 13:52, Aravind Iddamsetty wrote:
> Obj flags for shmem objects is not being set correctly. Fixes in setting
> BO_ALLOC_USER flag which applies to shmem objs as well.
> 
> Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on acquire")
> Cc: <stable@vger.kernel.org> # v5.15+

These tags should have been grouped with the ones below in one block.

I have tidied this while pushing, thanks for the fix and review!

Regards,

Tvrtko

> v2: Add fixes tag (Tvrtko, Matt A)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 114443096841..37d1efcd3ca6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -596,7 +596,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
>   	mapping_set_gfp_mask(mapping, mask);
>   	GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
>   
> -	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
> +	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
>   	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>   	obj->write_domain = I915_GEM_DOMAIN_CPU;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU;
