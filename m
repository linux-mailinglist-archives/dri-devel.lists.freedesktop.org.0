Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E224A9114
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 00:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61810E239;
	Thu,  3 Feb 2022 23:19:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A4A10E1E2;
 Thu,  3 Feb 2022 23:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643930359; x=1675466359;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9BiRDEv+Ni1oIs3Zk0AuSYnV2AQ7SpcI6nCel8eCezg=;
 b=Cmqz51yduUto6cF7QTeqyhYADDIRLinI4sxxYRamW8ZWkKQMnFIAxeRD
 emqxod3excXXepnd3Z1wVJNZ9gwiex3/wYYEq5MvLjEebd355/pfWCeSh
 j55OG/TTY9ZIpoDidMEhY3gvlDN4t9wJjLPIt8IeOp/0sTAPow/DvZbBi
 aDtIPeDuiXvuiAeckE2D4Zxtc9Y/BBE2Ijfwq8S5e1sD83tskxLjJP6V/
 UXGHG9A30xv37DDm3clV8rTnZiz2aLD7th/cQjv05d+hkbLVvgg7pPAYZ
 xsL3Pz4vsZ6tauafOXet4b9pZP22JwggwDvPL2kfWcxTU4r5szh7UrGw7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="245869247"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="245869247"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 15:19:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="631525254"
Received: from jmlaforg-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.212.225.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 15:19:18 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: John.C.Harrison@Intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/uapi: Add query for
 hwconfig table
In-Reply-To: <87r18orepz.fsf@jljusten-skl>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
 <87r18orepz.fsf@jljusten-skl>
Date: Thu, 03 Feb 2022 15:19:17 -0800
Message-ID: <87bkznr11m.fsf@jljusten-skl>
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
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jordan Justen <jordan.l.justen@intel.com> writes:

> John, Rodrigo,
>
> It is now clear to me just how dependent i915 is going to be on the
> closed source guc software, and that's just a fact of life for our
> graphics stack going forward.
>
> In that context, it seems kind of pointless for me to make a big deal
> out of this peripheral "query item" commit message. I still think
> something as simple and to the point as:
>
> "In this interface i915 is returning a blob of data which it receives
> from the guc software. This blob provides some useful data about the
> hardware for drivers. The format of this blob will be documented in the
> Programmer Reference Manuals when released."

As I said on the internal email thread, *if you use my commit message
suggestion*, then, begrudgingly, you can add my:

Acked-by: Jordan Justen <jordan.l.justen@intel.com>

to the patch.

Regardless of the commit message, I think you can add:

Tested-by: Jordan Justen <jordan.l.justen@intel.com>

In truth, I've only tested this via the "prelim" i915 Linux uapi fork on
an internal kernel tree, but I think that probably is close enough.

In case you find it helpful, maybe:

Ref: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14511

-Jordan

>
> ... would be better, but obviously this is really just down in the noise
> in terms of concerns about the greater issue. So, feel free (to
> continue) to ignore my suggestion.
>
> Sorry for having wasted your time,
>
> -Jordan
>
> John.C.Harrison@Intel.com writes:
>
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> GuC contains a consolidated table with a bunch of information about the
>> current device.
>>
>> Previously, this information was spread and hardcoded to all the components
>> including GuC, i915 and various UMDs. The goal here is to consolidate
>> the data into GuC in a way that all interested components can grab the
>> very latest and synchronized information using a simple query.
>>
>> As per most of the other queries, this one can be called twice.
>> Once with item.length=0 to determine the exact buffer size, then
>> allocate the user memory and call it again for to retrieve the
>> table data. For example:
>>   struct drm_i915_query_item item = {
>>     .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>>   };
>>   query.items_ptr = (int64_t) &item;
>>   query.num_items = 1;
>>
>>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>   if (item.length <= 0)
>>     return -ENOENT;
>>
>>   data = malloc(item.length);
>>   item.data_ptr = (int64_t) &data;
>>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>   // Parse the data as appropriate...
>>
>> The returned array is a simple and flexible KLV (Key/Length/Value)
>> formatted table. For example, it could be just:
>>   enum device_attr {
>>      ATTR_SOME_VALUE = 0,
>>      ATTR_SOME_MASK  = 1,
>>   };
>>
>>   static const u32 hwconfig[] = {
>>       ATTR_SOME_VALUE,
>>       1,             // Value Length in DWords
>>       8,             // Value
>>
>>       ATTR_SOME_MASK,
>>       3,
>>       0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>>   };
>>
>> The attribute ids are defined in a hardware spec.
>>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
>>  include/uapi/drm/i915_drm.h       |  1 +
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 2dfbc22857a3..609e64d5f395 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
>>  	return total_length;
>>  }
>>  
>> +static int query_hwconfig_table(struct drm_i915_private *i915,
>> +				struct drm_i915_query_item *query_item)
>> +{
>> +	struct intel_gt *gt = to_gt(i915);
>> +	struct intel_guc_hwconfig *hwconfig = &gt->uc.guc.hwconfig;
>> +
>> +	if (!hwconfig->size || !hwconfig->ptr)
>> +		return -ENODEV;
>> +
>> +	if (query_item->length == 0)
>> +		return hwconfig->size;
>> +
>> +	if (query_item->length < hwconfig->size)
>> +		return -EINVAL;
>> +
>> +	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
>> +			 hwconfig->ptr, hwconfig->size))
>> +		return -EFAULT;
>> +
>> +	return hwconfig->size;
>> +}
>> +
>>  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>  					struct drm_i915_query_item *query_item) = {
>>  	query_topology_info,
>>  	query_engine_info,
>>  	query_perf_config,
>>  	query_memregion_info,
>> +	query_hwconfig_table,
>>  };
>>  
>>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 914ebd9290e5..132515199f27 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
>>  #define DRM_I915_QUERY_ENGINE_INFO	2
>>  #define DRM_I915_QUERY_PERF_CONFIG      3
>>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
>> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5
>>  /* Must be kept compact -- no holes and well documented */
>>  
>>  	/**
>> -- 
>> 2.25.1
