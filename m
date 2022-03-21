Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD154E2754
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636AE10E29B;
	Mon, 21 Mar 2022 13:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5685410E29B;
 Mon, 21 Mar 2022 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647868604; x=1679404604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PdgFb3ljsiYixh1Ge3PiEXAMmaOtjDjNLFoIzdeUCfE=;
 b=gui2txTTsLNLz7GpEMhOIJX08Asl7uasRTo6KnHwn3MOy2XK4C8SIrB/
 0stOw8vj+msqXgqKP++mqv7+mcCyhQe23HXCOXfmFiQ5BqrsQgm+pqBys
 JlZV1F3l8mKXRTKCSJHcOMh0HBpQOZA6uBb80IH8Np5LhIkhtiHEHJ8Ks
 j72H093s7UKmgXFUcgxx4/eA8SF1E79dR9Q3DTMQMBt/tiGfHK85aQsTg
 qaFORKzinH2hhi+a0kpNEBXFywhz9swnq9PucfkDonIsXb6NX2hFy/3Kn
 oI0JVJpv7LzHnXGYgiKJseM79oZNvRQEbwi6ZeGqPzrouL/Of/ZwPaV7H A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="238153031"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="238153031"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:12:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="559864553"
Received: from atnordon-mobl1.ger.corp.intel.com (HELO [10.213.230.67])
 ([10.213.230.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:12:50 -0700
Message-ID: <210af2db-37ec-2cff-f6a6-7ea0263e135b@linux.intel.com>
Date: Mon, 21 Mar 2022 13:12:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
 <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
 <abdc3b07-a05e-f67d-2135-a30421cb9d12@linux.intel.com>
 <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <29bde7b0e680e503fbf483a560616e2ce22cdd79.camel@linux.intel.com>
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/03/2022 12:33, Thomas Hellström wrote:
> On Mon, 2022-03-21 at 12:22 +0000, Tvrtko Ursulin wrote:
>>
>> On 21/03/2022 11:03, Thomas Hellström wrote:
>>> Hi, Tvrtko.
>>>
>>> On 3/21/22 11:27, Tvrtko Ursulin wrote:
>>>>
>>>> On 19/03/2022 19:42, Michael Cheng wrote:
>>>>> To align with the discussion in [1][2], this patch series drops
>>>>> all
>>>>> usage of
>>>>> wbvind_on_all_cpus within i915 by either replacing the call
>>>>> with certain
>>>>> drm clflush helpers, or reverting to a previous logic.
>>>>
>>>> AFAIU, complaint from [1] was that it is wrong to provide non x86
>>>> implementations under the wbinvd_on_all_cpus name. Instead an
>>>> arch
>>>> agnostic helper which achieves the same effect could be created.
>>>> Does
>>>> Arm have such concept?
>>>
>>> I also understand Linus' email like we shouldn't leak incoherent IO
>>> to
>>> other architectures, meaning any remaining wbinvd()s should be X86
>>> only.
>>
>> The last part is completely obvious since it is a x86 instruction
>> name.
> 
> Yeah, I meant the function implementing wbinvd() semantics.
> 
>>
>> But I think we can't pick a solution until we know how the concept
>> maps
>> to Arm and that will also include seeing how the drm_clflush_sg for
>> Arm
>> would look. Is there a range based solution, or just a big hammer
>> there.
>> If the latter, then it is no good to churn all these reverts but
>> instead
>> an arch agnostic wrapper, with a generic name, would be the way to
>> go.
> 
> But my impression was that ARM would not need the range-based interface
> either, because ARM is only for discrete and with discrete we're always
> coherent.

Not sure what you mean here - what about flushing system memory objects 
on discrete? Those still need flushing on paths like suspend which this 
series touches. Am I missing something?

If I am not, then that means we either keep the current, presumably 
optimised (wasn't personally involved so I don't know), flush once code 
paths and add a wrapper i915_flush_caches/whatever, or convert all those 
back into piece-meal flushes so range flushing can be done. Assuming Arm 
does range flushing. That's why I asked what does Arm have here.

> So in essence it all would become:
> 
> 1) Any cache flushing intended for incoherent IO is x86 only.
> 2) Prefer range-based flushing if possible and any implications sorted
> out.

Yes, the question is how to do it.

Regards,

Tvrtko
