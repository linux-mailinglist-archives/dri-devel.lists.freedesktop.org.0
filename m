Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11699557A86
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 14:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C922D10E4D5;
	Thu, 23 Jun 2022 12:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B5C10E2A1;
 Thu, 23 Jun 2022 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655988095; x=1687524095;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VWzSbdROyvJm1bdHtCrZV3I6oXerAkRCM6dICVytbfU=;
 b=AF+CIUSbd56V77agGqbTQzj9t18uggzXLdS501PusEA6A05qPMDXKAxY
 DQJneYMI/oLS+c+Gio8JJiQMwrWL8ua21ovUZsNMJzN0F9b7rGl9mESEG
 t46iByGcXcxN7j8W9wpYdGTZc3MURSXmYulxPW5ILLh3iIjwnlhD/LD+F
 71mZy/Kd/bvtJ5muTYScira1T3Rfkg9VTqCkNnRUu0u6Wvsij1dS1ouaJ
 zEEt7Sg9SAxvzHvWyzb8VXaRiprwpxqf43H/Yt7blmD2bpVaTn0qDr8Z4
 57dNaoAqoXnf9c9QYepcaJZigmu/XOBlFgukl959Cqr3/yx4Zy3Y1fY5q g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280754077"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="280754077"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 05:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="644720054"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 23 Jun 2022 05:41:34 -0700
Received: from [10.249.130.158] (unknown [10.249.130.158])
 by linux.intel.com (Postfix) with ESMTP id F27B35808AB;
 Thu, 23 Jun 2022 05:41:31 -0700 (PDT)
Message-ID: <9ed6180a-70e3-311b-f530-8de10b8ac663@intel.com>
Date: Thu, 23 Jun 2022 15:41:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
 <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2022 14:05, Tvrtko Ursulin wrote:
>
> On 23/06/2022 09:57, Lionel Landwerlin wrote:
>> On 23/06/2022 11:27, Tvrtko Ursulin wrote:
>>>>
>>>> After a vm_unbind, UMD can re-bind to same VA range against an 
>>>> active VM.
>>>> Though I am not sue with Mesa usecase if that new mapping is 
>>>> required for
>>>> running GPU job or it will be for the next submission. But ensuring 
>>>> the
>>>> tlb flush upon unbind, KMD can ensure correctness.
>>>
>>> Isn't that their problem? If they re-bind for submitting _new_ work 
>>> then they get the flush as part of batch buffer pre-amble. 
>>
>> In the non sparse case, if a VA range is unbound, it is invalid to 
>> use that range for anything until it has been rebound by something else.
>>
>> We'll take the fence provided by vm_bind and put it as a wait fence 
>> on the next execbuffer.
>>
>> It might be safer in case of memory over fetching?
>>
>>
>> TLB flush will have to happen at some point right?
>>
>> What's the alternative to do it in unbind?
>
> Currently TLB flush happens from the ring before every BB_START and 
> also when i915 returns the backing store pages to the system.
>
> For the former, I haven't seen any mention that for execbuf3 there are 
> plans to stop doing it? Anyway, as long as this is kept and sequence 
> of bind[1..N]+execbuf is safe and correctly sees all the preceding binds.
> Hence about the alternative to doing it in unbind - first I think lets 
> state the problem that is trying to solve.
>
> For instance is it just for the compute "append work to the running 
> batch" use case? I honestly don't remember how was that supposed to 
> work so maybe the tlb flush on bind was supposed to deal with that 
> scenario?
>
> Or you see a problem even for Mesa with the current model?
>
> Regards,
>
> Tvrtko


As far as I can tell, all the binds should have completed before execbuf 
starts if you follow the vulkan sparse binding rules.

For non-sparse, the UMD will take care of it.

I think we're fine.


-Lionel


