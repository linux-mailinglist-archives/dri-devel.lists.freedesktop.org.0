Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0363620FCE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F2810E403;
	Tue,  8 Nov 2022 12:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA0F10E412;
 Tue,  8 Nov 2022 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667909135; x=1699445135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QBjtp+8pTKX4iwjttpm7peq0flzZU2J9CE+YtcftRQk=;
 b=mGjwTRKrDjmNXzpnSWv0XVGGsIS1p+1Y871FF24nU8RRaV3Iov8oOFo2
 xpcoOs1j/pIiiGZsjodkk79iw39Fbz3NpLVy2m2Po9nfK4JV1GzbWoDWF
 keorXOjFWQdYlu3uh+aRnj1kdL2apiVvJffUQH/iQ3ASk6t2BnkfUuL5U
 8JFfG4vWoi7vkf8l71f1tnIymsKH927WUavY65Rs42j1CmBkxFZEL6/4c
 S9Xjy3gckAtuCCoMocpzOvTbJA3UHFlMCfqxVX6aekGOt0wPO35fetqVp
 /MdVuULgGQfSNYuD0d0lalwFPFYYZbXUpRG4UKqZsSuV1yqfdZRtLyDx0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290395830"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="290395830"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:05:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614258770"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="614258770"
Received: from shylandx-mobl2.ger.corp.intel.com (HELO [10.213.210.50])
 ([10.213.210.50])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:05:18 -0800
Message-ID: <5a2405ac-253e-18fb-0a1d-1ad7996a52be@linux.intel.com>
Date: Tue, 8 Nov 2022 12:05:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/i915: Partial abandonment of legacy DRM logging macros
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org
References: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
 <87r0yd8xjr.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87r0yd8xjr.fsf@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/11/2022 12:01, Jani Nikula wrote:
> On Tue, 08 Nov 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Convert some usages of legacy DRM logging macros into versions which tell
>> us on which device have the events occurred.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 23 ++++++----
>>   .../drm/i915/gt/intel_execlists_submission.c  | 13 +++---
>>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++--
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |  6 ++-
>>   drivers/gpu/drm/i915/gt/intel_workarounds.c   | 43 +++++++++++--------
>>   .../gpu/drm/i915/gt/intel_workarounds_types.h |  4 ++
>>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>>   drivers/gpu/drm/i915/i915_debugfs.c           |  4 +-
>>   drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>>   drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
>>   drivers/gpu/drm/i915/i915_irq.c               | 12 +++---
>>   drivers/gpu/drm/i915/i915_perf.c              | 14 +++---
>>   drivers/gpu/drm/i915/i915_query.c             | 12 +++---
>>   drivers/gpu/drm/i915/i915_sysfs.c             |  3 +-
>>   drivers/gpu/drm/i915/i915_vma.c               | 16 ++++---
>>   drivers/gpu/drm/i915/intel_uncore.c           | 21 +++++----
>>   19 files changed, 116 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index 01402f3c58f6..7f2831efc798 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -546,7 +546,7 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>>   	}
>>   
>>   	if (intel_engine_uses_guc(master)) {
>> -		DRM_DEBUG("bonding extension not supported with GuC submission");
>> +		drm_dbg(&i915->drm, "bonding extension not supported with GuC submission");
>>   		return -ENODEV;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 1160723c9d2d..1eb7b66191b2 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -2148,7 +2148,8 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>   	return err;
>>   }
>>   
>> -static int i915_gem_check_execbuffer(struct drm_i915_gem_execbuffer2 *exec)
>> +static int i915_gem_check_execbuffer(struct drm_i915_private *i915,
>> +				     struct drm_i915_gem_execbuffer2 *exec)
>>   {
>>   	if (exec->flags & __I915_EXEC_ILLEGAL_FLAGS)
>>   		return -EINVAL;
>> @@ -2161,7 +2162,7 @@ static int i915_gem_check_execbuffer(struct drm_i915_gem_execbuffer2 *exec)
>>   	}
>>   
>>   	if (exec->DR4 == 0xffffffff) {
>> -		DRM_DEBUG("UXA submitting garbage DR4, fixing up\n");
>> +		drm_dbg(&i915->drm, "UXA submitting garbage DR4, fixing up\n");
>>   		exec->DR4 = 0;
>>   	}
>>   	if (exec->DR1 || exec->DR4)
>> @@ -2744,6 +2745,7 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>>   			 const struct drm_i915_gem_execbuffer_ext_timeline_fences *timeline_fences)
>>   {
>>   	struct drm_i915_gem_exec_fence __user *user_fences;
>> +	struct drm_device *drm = &eb->i915->drm;
> 
> Elsewhere we've been pretty strict about not adding struct drm_device as
> a local variable, just struct drm_i915_private *i915. We don't want to
> have both, and in general it's more likely i915 is needed than
> drm_device, if not now then in the future. Even if it means having to
> use &i915->drm here.

Yeah it smelled bad while I was typing it.. will change.

Regards,

Tvrtko
