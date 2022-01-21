Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4813495E97
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 12:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD76910EB2F;
	Fri, 21 Jan 2022 11:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DEE10EABC;
 Fri, 21 Jan 2022 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642765856; x=1674301856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RBz1KpHBR7i9NORrhCYsoGcp2r5iPMQs4z1UoIb3jlo=;
 b=k9XGbGdSobzoUHS7ZF8NGblHkqs4t3Aa+8GVg5KJGs3I9CN1ffuzMv+h
 zG38kWEEHOQlPdhyg9bQ9aBi9Fr3cDn0G7qsw//rgx3VmDCJPX3V5MbpI
 pnfJGKJ51fMnFKX5dTBqdIzy8Vz2qmVSmxC5CdKj3s0PuttnQ4JAmVeKa
 p88yPZc8jcaN4r3d+mmAbH+O3e5sUO/TrSxhPlBQ4kUR8yufxQnlc4cV0
 FaipYv30fz5dzlfl8f8w2IyImOk9HD06LOR4U71AbE/8/z4ASt85HAfQU
 lLDxrbmhlPVn1G/Yyr6jXj0+NldBGA5fOi6CL5hL78s8m8ViSEsfuSP8H Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="308965633"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="308965633"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 03:50:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533245037"
Received: from pflinter-mobl1.ger.corp.intel.com (HELO [10.213.207.239])
 ([10.213.207.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 03:50:53 -0800
Message-ID: <423c8ff1-3a4b-3e69-8561-3056c7d2d20f@linux.intel.com>
Date: Fri, 21 Jan 2022 11:50:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH 6/7] drm: Document fdinfo format specification
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
 <YegpiY3MU15RsEfk@phenom.ffwll.local>
 <CAF6AEGs58S7U=1nso=0BAURUuobeUam4V0j1W7ZsrK5W7MqRvw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGs58S7U=1nso=0BAURUuobeUam4V0j1W7ZsrK5W7MqRvw@mail.gmail.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/01/2022 16:44, Rob Clark wrote:
> On Wed, Jan 19, 2022 at 7:09 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Thu, Jan 06, 2022 at 04:55:35PM +0000, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Proposal to standardise the fdinfo text format as optionally output by DRM
>>> drivers.
>>>
>>> Idea is that a simple but, well defined, spec will enable generic
>>> userspace tools to be written while at the same time avoiding a more heavy
>>> handed approach of adding a mid-layer to DRM.
>>>
>>> i915 implements a subset of the spec, everything apart from the memory
>>> stats currently, and a matching intel_gpu_top tool exists.
>>>
>>> Open is to see if AMD can migrate to using the proposed GPU utilisation
>>> key-value pairs, or if they are not workable to see whether to go
>>> vendor specific, or if a standardised  alternative can be found which is
>>> workable for both drivers.
>>>
>>> Same for the memory utilisation key-value pairs proposal.
>>>
>>> v2:
>>>   * Update for removal of name and pid.
>>>
>>> v3:
>>>   * 'Drm-driver' tag will be obtained from struct drm_driver.name. (Daniel)
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: David M Nieto <David.Nieto@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Daniel Stone <daniel@fooishbar.org>
>>> Cc: Chris Healy <cphealy@gmail.com>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>
>> I'm assuming this ack here and later on is a "amdgpu plans to use this
>> too" kind of affair. Especially also in the lights of eventually using
>> matching semantics for cgroups and everything else tied to gpu execution
>> resource management.
>>
>> If not I'm mildly worried that we're creating fake-standard stuff here
>> which cannot actually be used by anything resembling driver-agnostic
>> userspace.
> 
> I think I could implement something like this for drm/msm.  I am a bit
> uncertain about the memory stats (ie. how are we intended to account
> for imported/exported/shared bo's)?  But we already track cycles+time
> per submit for devfreq, it would be pretty easy to add per drm_file
> counters to accumulate the per-submit results.  We could even track
> per-context (submitqueue) for processes that have more than a single
> context, although not sure if that is useful.

Interesting tidbit is that the whole i915 work started from a customer 
request to expose just that (per context) in a form akin to 
getrusage(2). I think this kind of introspection capability is 
interesting but as it is driver specific territory it's only anecdotal 
for what this thread is concerned.

> And I think there is probably some room for shared helper to print
> parts other than the per-engine stats (and maybe memory stats,
> although even that could be a shared implementation for some
> drivers).. with a driver callback for the non-generic parts, ie.
> something like:
> 
>     drm_driver::show_client_stats(struct drm_file *, struct drm_printer *)
> 
> but that can come later.
> 
> If there is a tool somewhere that displays this info, that would be
> useful for testing my implementation.

I have a patch to Intel specific intel_gpu_top (see 
https://patchwork.freedesktop.org/patch/468491/?series=98555&rev=1). 
I'll have a look to see how much work would it be to extract common bits 
into a library and write a quick agnostic tool using it.

Regards,

Tvrtko
