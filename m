Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC666663D30
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526410E57B;
	Tue, 10 Jan 2023 09:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB2210E584;
 Tue, 10 Jan 2023 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673343957; x=1704879957;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vL6NmI6DPN+u687y8bwjoCQfUhP2lvS/jSezIJUycus=;
 b=WuXHcWKU6M4OliACX3M3uO0/+e96nOZCwQP4yXaBaK1qwxvbw/yadYmI
 FptrEK/5q7XrKNWGcduqmNrkvVG6tdkMRs2bEQywWr+OWpXKJ0RVENszj
 Q17zCiMC2HxLosRgtFUqXg8qMJIkfKFU5EcqLugR140TnFeoCdjZ2wqIs
 2YZpK7HiQlaCT2rwz4p5nVa6saYlhKkcb3qDf/aR63MN+iyY3Uxa3Ah4s
 z2BdF6DRWrlpi0bUxTG04f9lVuqyYI5HYP6eqnirKA+kR7B4sfg8Rc2Be
 ihqBR8U7jKvNMLjCKLpMI3sK81PVhNcjFdchxrNbxt0pDy3dUlAhxmj3x g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="302804969"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="302804969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 01:45:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="689362617"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="689362617"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.19])
 ([10.213.8.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 01:45:54 -0800
Message-ID: <aa55da9e-299b-0e4a-1ced-ff0330593ac5@intel.com>
Date: Tue, 10 Jan 2023 10:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/i915: Do not cover all future platforms in TLB
 invalidation
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
 <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
 <ba227180-066a-8e07-9df6-a9d4e6ec2a05@intel.com>
 <6a861c63-39b7-e5e2-b7c5-43cf9b7130f8@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6a861c63-39b7-e5e2-b7c5-43cf9b7130f8@linux.intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.01.2023 10:16, Tvrtko Ursulin wrote:
>
> On 10/01/2023 08:23, Andrzej Hajda wrote:
>>
>>
>> On 09.01.2023 13:24, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Revert to the original explicit approach and document the reasoning
>>> behind it.
>>>
>>> v2:
>>>   * DG2 needs to be covered too. (Matt)
>>>
>>> v3:
>>>   * Full version check for Gen12 to avoid catching all future 
>>> platforms.
>>>     (Matt)
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
>>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index 7eeee5a7cb33..5521fa057aab 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct 
>>> intel_gt *gt)
>>>       unsigned int num = 0;
>>>       unsigned long flags;
>>> -    if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>>> +    /*
>>> +     * New platforms should not be added with catch-all-newer (>=)
>>> +     * condition so that any later platform added triggers the 
>>> below warning
>>> +     * and in turn mandates a human cross-check of whether the 
>>> invalidation
>>> +     * flows have compatible semantics.
>>> +     *
>>> +     * For instance with the 11.00 -> 12.00 transition three out of 
>>> five
>>> +     * respective engine registers were moved to masked type. Then 
>>> after the
>>> +     * 12.00 -> 12.50 transition multi cast handling is required too.
>>> +     */
>>> +
>>> +    if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
>>> +        GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
>>>           regs = NULL;
>>>           num = ARRAY_SIZE(xehp_regs);
>>> -    } else if (GRAPHICS_VER(i915) == 12) {
>>> +    } else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
>>> +           GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
>>
>> MTL support is lost? IP_VER(12, 70)
>
> AFAIU Matt says MTL is still incomplete anyway, so that would be added 
> in an explicit patch here.

I've missed this part, sorry for the noise then :)
And as I see PVC is similar story.

>
>> And again it looks for me inconsistent, some unknown platforms are 
>> covered, for example 12.54, some not, for example 12.11.
>
> .11 and .54 as hypotheticals? You suggest this instead:
>
>     if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
>         GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
>         regs = NULL;
>         num = ARRAY_SIZE(xehp_regs);
>     } else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
>            GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
>         regs = gen12_regs;
>         num = ARRAY_SIZE(gen12_regs);
>
> ?

For me this perfectly follows the 'strict' approach :)

>
> It's fine by me if that covers all currently known platforms.

My grep in i915_pci.c agrees.

Regards
Andrzej

>
> Regards,
>
> Tvrtko

