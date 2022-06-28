Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0555BFA6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E9D12A9CA;
	Tue, 28 Jun 2022 08:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24812A9C2;
 Tue, 28 Jun 2022 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656406687; x=1687942687;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8ccncddsC7dzCiGIKRKLjjxcx6QDuw9ZKZ2b7p3u5fU=;
 b=cTjz10mp/poxno/V2WCDCmMxJw31i2BH570Mox6MGYI7sPV8vUlyO03i
 AKjW+uobAc1jHPiGhDR831Q3On7hKQtgskj4EQmiEz1DUzGwcRQ5YLiSF
 p8WJgsnwzovT6AV0K2iaRhCh3pMznsDBsGgCiAvl5+gSOlTpnKbp+mshv
 cTw8zP4fDnkLV5tGOmMMhotJ0SgSPkdL/OSVENq3Bri2UxEmkGXrt8ado
 OnDlcVVha7OuxPdFFLJsdpLiZL34rYz+tpaqcNPiQhXwcOk/5QZdnxStQ
 BJdlbR8zPTQ/Qfy63mGEJlLbW4RGRSLBcpr/+7Wd3DOiF9EF8AMJWN7QK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="280441284"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="280441284"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 01:58:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="587793739"
Received: from leejust1-mobl.amr.corp.intel.com (HELO [10.209.162.132])
 ([10.209.162.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 01:58:03 -0700
Message-ID: <2ce76c99-e0bc-8a96-9e1c-f9d96ece62d4@linux.intel.com>
Date: Tue, 28 Jun 2022 09:58:01 +0100
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
 <1d36da1a-9224-5750-d103-60e7cdfdf8df@linux.intel.com>
 <BN6PR11MB1633F819E6DF445769061CF092B49@BN6PR11MB1633.namprd11.prod.outlook.com>
 <1f2ce51e-4b45-c654-954a-a71899309fb5@linux.intel.com>
 <BN6PR11MB1633B73631737329161B289A92B99@BN6PR11MB1633.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BN6PR11MB1633B73631737329161B289A92B99@BN6PR11MB1633.namprd11.prod.outlook.com>
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


On 27/06/2022 19:58, Zeng, Oak wrote:
> 
> 
> Thanks,
> Oak
> 
>> -----Original Message-----
>> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Sent: June 27, 2022 4:30 AM
>> To: Zeng, Oak <oak.zeng@intel.com>; Landwerlin, Lionel G
>> <lionel.g.landwerlin@intel.com>; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>
>> Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>; intel-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Hellstrom,
>> Thomas <thomas.hellstrom@intel.com>; Wilson, Chris P
>> <chris.p.wilson@intel.com>; Vetter, Daniel <daniel.vetter@intel.com>;
>> christian.koenig@amd.com; Auld, Matthew <matthew.auld@intel.com>
>> Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
>>
>>
>> On 24/06/2022 21:23, Zeng, Oak wrote:
>>> Let's compare "tlb invalidate at vm unbind" vs "tlb invalidate at backing
>> storage":
>>>
>>> Correctness:
>>> consider this sequence of:
>>> 1. unbind va1 from pa1,
>>> 2. then bind va1 to pa2. //user space has the freedom to do this as it
>>> manages virtual address space 3. Submit shader code using va1, 4. Then
>>> retire pa1.
>>>
>>> If you don't perform tlb invalidate at step #1, in step #3, shader will use
>> stale entries in tlb and pa1 will be used for the shader. User want to use pa2.
>> So I don't think invalidate tlb at step #4 make correctness.
>>
>> Define step 3. Is it a new execbuf? If so then there will be a TLB flush there.
>> Unless the plan is to stop doing that with eb3 but I haven't picked up on that
>> anywhere so far.
> 
> In Niranjana's latest patch series, he removed the TLB flushing from vm_unbind. He also said explicitly TLB invalidation will be performed at job submission and backing storage releasing time, which is the existing behavior of the current i915 driver.
> 
> I think if we invalidate TLB on each vm_unbind, then we don't need to invalidate at submission and backing storage releasing. It doesn't make a lot of sense to me to perform a tlb invalidation at execbuf time. Maybe it is a behavior for the old implicit binding programming model. For vm_bind and eb3, we separate the binding and job submission into two APIs. It is more natural the TLB invalidation be coupled with the vm bind/unbind, not job submission. So in my opinion we should remove tlb invalidation from submission and backing storage releasing and add it to vm unbind. This is method is cleaner to me.

You can propose this model (not flushing in eb3) but I have my doubts. 
Consider the pointlessness of flushing on N unbinds for 99% of clients 
which are not infinite compute batch. And consider how you make the 
behaviour consistent on all platforms (selective vs global tlb flush).

Also note that this discussion is orthogonal to unbind vs backing store 
release.

> Regarding performance, we don't have data. In my opinion, we should make things work in a most straight forward way as the first step. Then consider performance improvement if necessary. Consider some delayed tlb invalidation at submission and backing release time without performance data support wasn't a good decision.

It is quite straightforward though. ;) It aligns with the eb2 model and 
argument can be made backing store release is (much) less frequent than 
unbind (consider softpin where client could trigger a lot of pointless 
flushes).

Regards,

Tvrtko
