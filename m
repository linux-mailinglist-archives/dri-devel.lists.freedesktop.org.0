Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D168984F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AF010E777;
	Fri,  3 Feb 2023 12:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D51610E777;
 Fri,  3 Feb 2023 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675426250; x=1706962250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GUd5ghcV4B849P0Jv1saFNNxJOa82j5PkQ3L6yuJxrc=;
 b=WzPkxMw7usBor6ETq5EqmokGsc3bwJ3qsJANK1RDNq5cgcD83OWQJB65
 oAqyC/GtlKKaXw8r0xjxkOgsPN4MZp/fgftqRzh6iKwFjuGEV8j0FooAG
 3rskrqAnmnEaZOb1Ef/VchjvTKaGb7Uw1+kydWr6kGoZonAbh/LSdC5fT
 Py5FLKmzbzBCKwfJUDS/WUANBCVQ3J5x3XDHQTcvk5X8op1QejX+C4Zar
 x1fXuxkRuS70hWTimSCWulBBm6NuAjHkHEC9fqx2WTZ2QHqLPROMQfdaI
 pTRT+uhqPmi1raJwWpOfMG8MMd6UhJEKs0Ml5YK3w+5Mh6424XQT22oCO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312388969"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="312388969"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:10:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="615695421"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="615695421"
Received: from lhime-mobl1.ger.corp.intel.com (HELO [10.213.220.100])
 ([10.213.220.100])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 04:10:48 -0800
Message-ID: <30fec9fc-8d67-519e-b2e8-25af7187b3df@linux.intel.com>
Date: Fri, 3 Feb 2023 12:10:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] Initialize the obj flags for shmem objects
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03/02/2023 11:57, Aravind Iddamsetty wrote:
> Obj flags for shmem objects is not being set correctly.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Could even be:

Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on acquire")
Cc: <stable@vger.kernel.org> # v5.15+

?

Regards,

Tvrtko

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
