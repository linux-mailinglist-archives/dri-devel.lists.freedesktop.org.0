Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E14B22E8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6310EA6F;
	Fri, 11 Feb 2022 10:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0740C10EA6B;
 Fri, 11 Feb 2022 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644574486; x=1676110486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Neh1eyXjLo4+6B3nwfPNQzZhJZtNY0ywdMiX4UqARNc=;
 b=lGFKMQ9TlMWsH1LLC5ept7kkHvyrFpde8ri5dju2V4nG5CEKsI79pPe3
 G2eKpZiXijCsaYQeNHpkYyJZ54WmlRYqQp/up4TJY7VBSe+NM+pr54272
 r7msLhsUYj59m0QRfYDH8T27ULmG6HaafWIZdT1k1VBG2mXK/TKjwW5El
 Akq9I11DiFiTpQUmZmLjOgVJi4RMnqyiyvXyO0KFLb0z4ldjoEI8YkfQi
 yy1U4uepekJpFLQ0nYMnAPHdfitDPZeXSNjGK01d0CwhIlCLW4jyZ4QCi
 uyRLt8hYp2RUvSkVw0IcY5gZGRWobklPSyzO5bo2iwnEBl7CMDqtaaPZi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="336127506"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="336127506"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:14:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774203783"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:14:44 -0800
Message-ID: <55acf6bc-509a-458c-721e-fd833f0b8fcf@linux.intel.com>
Date: Fri, 11 Feb 2022 11:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v2 12/15] drm/i915/create: apply
 ALLOC_GPU_ONLY by default
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-13-matthew.auld@intel.com>
 <e4f128ad-1738-cee7-6790-fbdbb6d5698d@linux.intel.com>
 <CAM0jSHM8+KBAN2iMM7L+9HUKuTodH5u32o4XgGZbv8fvUrn67g@mail.gmail.com>
 <45a64b08-1a7e-117f-fd20-e5c4a15f8d7c@linux.intel.com>
 <CAM0jSHMrX9=MKunVqHS1kkZevW-Y9kmCNUrAPqOi=3xRmMk1AA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHMrX9=MKunVqHS1kkZevW-Y9kmCNUrAPqOi=3xRmMk1AA@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/11/22 11:00, Matthew Auld wrote:
> On Fri, 11 Feb 2022 at 09:56, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>>
>> On 2/11/22 10:52, Matthew Auld wrote:
>>> On Fri, 11 Feb 2022 at 09:49, Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>> On 2/10/22 13:13, Matthew Auld wrote:
>>>>> Starting from DG2+, when dealing with LMEM, we assume that by default
>>>>> all userspace allocations should be placed in the non-mappable portion
>>>>> of LMEM.  Note that dumb buffers are not included here, since these are
>>>>> not "GPU accelerated" and likely need CPU access.
>>>>>
>>>>> In a later patch userspace will be able to provide a hint if CPU access
>>>>> to the buffer is needed.
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
>>>>>     1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>> index 9402d4bf4ffc..cc9ddb943f96 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>> @@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>>>>>                 ext_data.n_placements = 1;
>>>>>         }
>>>>>
>>>>> +     /*
>>>>> +      * TODO: add a userspace hint to force CPU_ACCESS for the object, which
>>>>> +      * can override this.
>>>>> +      */
>>>>> +     if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
>>>>> +                           ext_data.placements[0]->type !=
>>>>> +                           INTEL_MEMORY_SYSTEM))
>>>>> +             ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
>>>>> +
>>>> WRT previous review comment here, it would be easier to follow if the bo
>>>> was marked as a GPU only buffer regardless. Then for example capture and
>>>> other functions where it actually matters can choose to take action
>>>> based on, for example, whether the BAR is restricted or not?
>>> Yeah, I completely forgot about this, sorry. Will fix now.
>> Actually you did reply, but I forgot to reply to that :).
> Hmm, should we just drop the IS_DG1() check here(that was my first
> thought), or go further and still apply even regardless of placements?
> i.e it would be set on integrated

That was my first thought as well, but yes it makes sense to also drop 
the placement checks and let the placement selection logic handle that 
later?

One alternative approach would also be to invert the thing and have a 
BO_ALLOC_CPU_REQUIRE, that is set by default on some bos and can be set 
on the others using the hint, but I figure that needs to be then set 
also on kernel-only buffer objects. Not sure what is simplest.

/Thomas


>
>> /Thomas
>>
>>
