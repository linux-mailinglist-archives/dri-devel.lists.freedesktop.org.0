Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF694E71AF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 11:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FCA10EB55;
	Fri, 25 Mar 2022 10:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0AF10EB4E;
 Fri, 25 Mar 2022 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648205768; x=1679741768;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=27UgVpdcrqaGQ3WocipXOzwtqNzZRjxThVDn13QxF+4=;
 b=EnkYQ5DkDAqgOFimQApI0Fq6RhU66LNIQJCrky7GTRsQo4b93OD3H3eT
 g2s3maa/bgSQm7KXqQE6LNYzxde4I6UrrSz1SbcYh5ZeDDNQQnn+EU2XG
 mNnQL3mJTO5YCXWK90q9+5sRlYe0CQDQnRpQnvWyTjHZK8chLsHxjzRsv
 TWHvjKLZfwtMGb/uWtG39dzAXDc1wkDu37hCB7Gw9Djn7u/RRAjA35/Ua
 3BIES1cTd4VXNul6dmQ51ClLD0RxwJ3lAnaE/qM53QWyXAII7im0QVrw7
 w5HzHr44SbnVgm76JLfzav0mXGrn/4draq4O7vT7Uyp77G8MSldXA1tRX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258325972"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258325972"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 03:56:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="561791550"
Received: from cfmcclea-mobl.ger.corp.intel.com (HELO [10.213.232.142])
 ([10.213.232.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 03:56:05 -0700
Message-ID: <aad940f2-c064-a623-6c15-27171d268476@linux.intel.com>
Date: Fri, 25 Mar 2022 10:56:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/uapi: Document DRM_I915_QUERY_HWCONFIG_BLOB
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220325094916.2186367-1-tvrtko.ursulin@linux.intel.com>
 <Yj2RMTTkQxC/vzre@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yj2RMTTkQxC/vzre@phenom.ffwll.local>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jon Ewins <jon.ewins@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/03/2022 09:53, Daniel Vetter wrote:
> On Fri, Mar 25, 2022 at 09:49:16AM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> UAPI with absolutely no documentation should not have been added -
>> clarify blob format and content will be described externally.
>>
>> Fixes: 78e1fb3112c0 ("drm/i915/uapi: Add query for hwconfig blob")
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Co-developed-by: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Jon Ewins <jon.ewins@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   include/uapi/drm/i915_drm.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 071ffd9d51f1..8d0719bee8fc 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2683,6 +2683,9 @@ struct drm_i915_perf_oa_config {
>>    *
>>    * The behaviour is determined by the @query_id. Note that exactly what
>>    * @data_ptr is also depends on the specific @query_id.
>> + *
>> + * For specific queries see:
>> + *  * `GuC HWCONFIG blob uAPI`_
> 
> I'd put this into the @query_id section, and then make it an item list
> with the #define as the label, so that it becomes tidy and can neatly
> iterate them all.
> 
> Anyway we can bikeshed this all more in a follow-up.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks, yes I wanted to do the minimal thing to close the gap.
>>    */
>>   struct drm_i915_query_item {
>>   	/** @query_id: The id for this query */
>> @@ -3135,6 +3138,16 @@ struct drm_i915_query_memory_regions {
>>   	struct drm_i915_memory_region_info regions[];
>>   };
>>   
>> +/**
>> + * DOC: GuC HWCONFIG blob uAPI
>> + *
>> + * The GuC produces a blob with information about the current device.
>> + * i915 reads this blob from GuC and makes it available via this uAPI.
>> + *
>> + * The format and meading of the blob content are documented in the

Meading? I will fix that up while merging.

Regards,

Tvrtko

>> + * Programmer's Reference Manual.
>> + */
>> +
>>   /**
>>    * struct drm_i915_gem_create_ext - Existing gem_create behaviour, with added
>>    * extension support using struct i915_user_extension.
>> -- 
>> 2.32.0
>>
> 
