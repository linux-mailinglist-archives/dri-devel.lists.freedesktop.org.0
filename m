Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EEF74D150
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C92D10E1EF;
	Mon, 10 Jul 2023 09:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D98910E10D;
 Mon, 10 Jul 2023 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688981073; x=1720517073;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LHbaGguUTzNCxAZYVlGk0RMW62joSF3DwWTo7/3S68M=;
 b=QleufXYghQydOCSyFNfjNBReJct9UbakT/HdlwFhsgK+c2JEXkFVItqU
 XY14n7XzAlm4KS/Ji+mxRGqXAuTnJ1k1DZeFXhInbdzHenXLkhU/a7l68
 Mf+wnxyj/4UopKfiB9027TM5/Oszb2ZKo5MFL5zVOuZRhRcGqRSPei1B5
 COFKGl28pnLn4UGmD398HrKn7MTOlMxsctb/e51QLAR8pBAfiQYbBOUSV
 NvPqE+4LgCMqCLkqOziiNuVsAP0Yyn0eHvjgJzYSW9cW2d585H6kWBUX/
 3iNVc/89xWdgMeOnONZg7/0k1A6RWncBIxT+BvLtWiCkz5yfYMsm2xuq9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427989419"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="427989419"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="786084712"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="786084712"
Received: from ccgoode-mobl.ger.corp.intel.com (HELO [10.213.236.139])
 ([10.213.236.139])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:24:30 -0700
Message-ID: <8a704149-260f-cf3c-474f-db9c83d51ee8@linux.intel.com>
Date: Mon, 10 Jul 2023 10:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix one wrong caching mode enum
 usage
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230707125503.3965817-1-tvrtko.ursulin@linux.intel.com>
 <SJ1PR11MB6204F446D83BBB894E7D53CD812DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <SJ1PR11MB6204F446D83BBB894E7D53CD812DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
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


On 07/07/2023 14:23, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Tvrtko Ursulin
>> Sent: Friday, July 7, 2023 6:25 PM
>> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: [Intel-gfx] [PATCH] drm/i915: Fix one wrong caching mode enum
>> usage
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit a4d86249c773 ("drm/i915/gt: Provide a utility to create a scratch
>> buffer") mistakenly passed in uapi I915_CACHING_CACHED as argument to
>> i915_gem_object_set_cache_coherency(), which actually takes internal enum
>> i915_cache_level.
>>
>> No functional issue since the value matches I915_CACHE_LLC (1 == 1), which
>> is the intended caching mode, but lets clean it up nevertheless.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: a4d86249c773 ("drm/i915/gt: Provide a utility to create a scratch
>> buffer")
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index 126269a0d728..065099362a98 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -676,7 +676,7 @@ __vm_create_scratch_for_read(struct
>> i915_address_space *vm, unsigned long size)
>>   	if (IS_ERR(obj))
>>   		return ERR_CAST(obj);
>>
>> -	i915_gem_object_set_cache_coherency(obj,
>> I915_CACHING_CACHED);
>> +	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
> 
> Yes.
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Pushed, thanks for the review!

Regards,

Tvrtko

> 
>>
>>   	vma = i915_vma_instance(obj, vm, NULL);
>>   	if (IS_ERR(vma)) {
>> --
>> 2.39.2
> 
