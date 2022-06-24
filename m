Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CD559579
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401A2112CBA;
	Fri, 24 Jun 2022 08:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4FD112CB5;
 Fri, 24 Jun 2022 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656059530; x=1687595530;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WunH/GL2HkxFEFwyyoLIK3zQHPDrYrHNLEqmjkJSQjc=;
 b=nXvHieJ3woDNvtkTYQTNgbVRFC8NlIa8EXS71Q23DHYGQQNEUmd7jgH2
 ma19zUtG+grbvwy+N4xxQser9yYD1qbonxgkNl/11TXLU4TobYaf5kEuW
 0/g35V3lxXBDILRHZFN0zzEpmajUTOkfNewm6WBaOqw2RYjs6mZJ4toYf
 H+FIPoC4O7jdkdlZ5C/YsqyjGw3E7jxSYOVGCRJ7Tm/Aj42GObf3Ex1tt
 B9cZduMv3q+0LyOAyIj0EqXsIcNTRWAB5iKLo93YuzWETSdO3a49YIMvu
 x/CZQFfz9L8MlRbk3pCJaeMHzwBkeQRKayOlNiVLTi+q52FNy4sP0DjAH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="260770906"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="260770906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:32:10 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="915595800"
Received: from acamigob-mobl.amr.corp.intel.com (HELO [10.212.103.132])
 ([10.212.103.132])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:32:08 -0700
Message-ID: <1d36da1a-9224-5750-d103-60e7cdfdf8df@linux.intel.com>
Date: Fri, 24 Jun 2022 09:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
 <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
 <BN6PR11MB1633C90D1B2E40359F1F168F92B59@BN6PR11MB1633.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BN6PR11MB1633C90D1B2E40359F1F168F92B59@BN6PR11MB1633.namprd11.prod.outlook.com>
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/06/2022 22:05, Zeng, Oak wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Tvrtko
>> Ursulin
>> Sent: June 23, 2022 7:06 AM
>> To: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>; Vishwanathapura,
>> Niranjana <niranjana.vishwanathapura@intel.com>
>> Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>; intel-gfx@lists.freedesktop.org;
>> dri-devel@lists.freedesktop.org; Hellstrom, Thomas <thomas.hellstrom@intel.com>;
>> Wilson, Chris P <chris.p.wilson@intel.com>; Vetter, Daniel
>> <daniel.vetter@intel.com>; christian.koenig@amd.com; Auld, Matthew
>> <matthew.auld@intel.com>
>> Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
>>
>>
>> On 23/06/2022 09:57, Lionel Landwerlin wrote:
>>> On 23/06/2022 11:27, Tvrtko Ursulin wrote:
>>>>>
>>>>> After a vm_unbind, UMD can re-bind to same VA range against an active
>>>>> VM.
>>>>> Though I am not sue with Mesa usecase if that new mapping is required
>>>>> for
>>>>> running GPU job or it will be for the next submission. But ensuring the
>>>>> tlb flush upon unbind, KMD can ensure correctness.
>>>>
>>>> Isn't that their problem? If they re-bind for submitting _new_ work
>>>> then they get the flush as part of batch buffer pre-amble.
>>>
>>> In the non sparse case, if a VA range is unbound, it is invalid to use
>>> that range for anything until it has been rebound by something else.
>>>
>>> We'll take the fence provided by vm_bind and put it as a wait fence on
>>> the next execbuffer.
>>>
>>> It might be safer in case of memory over fetching?
>>>
>>>
>>> TLB flush will have to happen at some point right?
>>>
>>> What's the alternative to do it in unbind?
>>
>> Currently TLB flush happens from the ring before every BB_START and also
>> when i915 returns the backing store pages to the system.
> 
> 
> Can you explain more why tlb flush when i915 retire the backing storage? I never figured that out when I looked at the codes. As I understand it, tlb caches the gpu page tables which map a va to a pa. So it is straight forward to me that we perform a tlb flush when we change the page table (either at vm bind time or unbind time. Better at unbind time for performance reason).

I don't know what performs better - someone can measure the two 
approaches? Certainly on platforms where we only have global TLB 
flushing the cost is quite high so my thinking was to allow i915 to 
control when it will be done and not guarantee it in the uapi if it 
isn't needed for security reasons.

> But it is rather tricky to me to flush tlb when we retire a backing storage. I don't see how backing storage can be connected to page table. Let's say user unbind va1 from pa1, then bind va1 to pa2. Then retire pa1. Submit shader code using va1. If we don't tlb flush after unbind va1, the new shader code which is supposed to use pa2 will still use pa1 due to the stale entries in tlb, right? The point is, tlb cached is tagged with virtual address, not physical address. so after we unbind va1 from pa1, regardless we retire pa1 or not, va1 can be bound to another pa2.

When you say "retire pa1" I will assume you meant release backing 
storage for pa1. At this point i915 currently does do the TLB flush and 
that ensures no PTE can point to pa1.

This approach deals with security of the system as a whole. Client may 
still cause rendering corruption or a GPU hang for itself but that 
should be completely isolated. (This is the part where you say 
"regardless if we retire pa1 or not" I think.)

But I think those are advanced use cases where userspace wants to 
manipulate PTEs while something is running on the GPU in parallel. AFAIK 
limited to compute "infinite batch" so my thinking is to avoid adding a 
performance penalty to the common case. Especially on platforms which 
only have global flush.

But.. to circle back on the measuring angle. Until someone invests time 
and effort to benchmark the two approaches (flush on unbind vs flush on 
backing store release) we don't really know. All I know is the perf hit 
with the current solution was significant, AFAIR up to teen digits on 
some games. And considering the flushes were driven only by the shrinker 
activity, my thinking was they would be less frequent than the unbinds, 
therefore have the potential for a smaller perf hit.

Regards,

Tvrtko
