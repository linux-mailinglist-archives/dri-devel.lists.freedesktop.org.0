Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD6560608
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD1E10E4F4;
	Wed, 29 Jun 2022 16:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9709610E4E3;
 Wed, 29 Jun 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656520936; x=1688056936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AFl+7j0vzpRROUQhsfMcHL37D6J1TcWS2MeAxp8CiLw=;
 b=HBH9R7kq+h/gkSxSYbhQUCj3apwM0ppQhaAOoC2JQeq4zfl1h2o9vj62
 fnBEThNpsaI2gvar4pbzYU3F4xKd5vPA3DNO9iBelC6aWKt+7sm/Y9mqz
 UQrLmJqYPRgQW3PcTNG6lnl+o9FbJS+rJSuRXniSCkJlx0M5jA1pwKEUH
 hsqV5zbX49bDYVMyNXRrzA4fGem6HdK/bsmWUdMS2vArS+LKJMcY843R7
 R+sd5+FyEUj3o3Wo9YFodx5HtYfH2xsnwgXGTnl+NPNQEgZwCYeftZEUk
 rz5eHRU+3/WVLdZQ4dsTGFBUpweXO81SvAeXkKTuTvIppWCDxgBIPVxsP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="279623535"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="279623535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:42:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="717893364"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO [10.213.202.136])
 ([10.213.202.136])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:42:13 -0700
Message-ID: <e3a0f620-62f1-4bc4-a3e2-0f46d4483c8e@intel.com>
Date: Wed, 29 Jun 2022 17:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v3 09/13] drm/i915/selftests: skip the mman tests for
 stolen
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220629121427.353800-1-matthew.auld@intel.com>
 <20220629121427.353800-10-matthew.auld@intel.com>
 <fe1fa1cc-3e2f-39b0-ea73-b9123a8b76bd@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <fe1fa1cc-3e2f-39b0-ea73-b9123a8b76bd@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/06/2022 17:22, Thomas Hellström wrote:
> 
> On 6/29/22 14:14, Matthew Auld wrote:
>> It's not supported, and just skips later anyway. With small-BAR things
>> get more complicated since all of stolen is likely not even CPU
>> accessible, hence not passing I915_BO_ALLOC_GPU_ONLY just results in the
>> object create failing.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
> 
> This reminds me,
> 
> Is there a problem for fbdev (and hence things like plymouth) if the 
> initial fbdev image ends up as a stolen memory object which in turn ends 
> up not being mappable? I remember we discussed this before but can't 
> recall what the answer was.

On discrete the initial-fb looks to be allocated directly from lmem (at 
least on the machines I've seen in CI). See 7fe7c2a679dc ("drm/i915: 
fixup the initial fb base on DGFX"). And from what I could tell the 
offset in lmem is always at the beginning somewhere, which makes sense 
given stuff like small-BAR. But yeah, the create_at() helper should 
complain if someone tried to allocate the initial-fb or similar outside 
the mappable part. IIRC the only user of stolen-lmem is fbc, but that 
doesn't seem to need CPU access.

> 
> Anyway, for this patch
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> 
> 
> 
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index 5bc93a1ce3e3..388c85b0f764 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -979,6 +979,9 @@ static int igt_mmap(void *arg)
>>           };
>>           int i;
>> +        if (mr->private)
>> +            continue;
>> +
>>           for (i = 0; i < ARRAY_SIZE(sizes); i++) {
>>               struct drm_i915_gem_object *obj;
>>               int err;
>> @@ -1435,6 +1438,9 @@ static int igt_mmap_access(void *arg)
>>           struct drm_i915_gem_object *obj;
>>           int err;
>> +        if (mr->private)
>> +            continue;
>> +
>>           obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>>           if (obj == ERR_PTR(-ENODEV))
>>               continue;
>> @@ -1580,6 +1586,9 @@ static int igt_mmap_gpu(void *arg)
>>           struct drm_i915_gem_object *obj;
>>           int err;
>> +        if (mr->private)
>> +            continue;
>> +
>>           obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>>           if (obj == ERR_PTR(-ENODEV))
>>               continue;
>> @@ -1727,6 +1736,9 @@ static int igt_mmap_revoke(void *arg)
>>           struct drm_i915_gem_object *obj;
>>           int err;
>> +        if (mr->private)
>> +            continue;
>> +
>>           obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>>           if (obj == ERR_PTR(-ENODEV))
>>               continue;
