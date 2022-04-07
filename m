Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E44F858C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 19:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81410EC0A;
	Thu,  7 Apr 2022 17:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE4D10EBF0;
 Thu,  7 Apr 2022 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649351246; x=1680887246;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aGaIYpZ3CQiBFpOe26QeufAV/wGjSVKzW0QlcUijRg0=;
 b=XplHeY56ZaOaEc3Ud3/XQ5ZBQHCi3qkps4R4ffTvb2ZVyS9AunDYRD7S
 u/lKJ+pVS4sf6cntNU/L1Wnj7QKIdECaPDalX6HaEWOxxRY0l89HYXV8p
 xrTox/mfY/KD2lga59JJWSN67hRMy0AQUsFFe0k+sPWf8PXM1qKukzgNF
 ZWSiAKDlSHtpjZFqzRV0AmskdMi82ONnQTLghfBiZq2nLaCq4BOTTOXWQ
 o4E/0/u8ixGTkEQ1rmo1gsyzbu/cYf6iiiIYcOck4os9qG/Dvyr19NCw/
 jRgS4fj3nn/wWt1BE3BHR04y9qJEgdXSf8XGkPwh7IC5ow7vjVwMcoTHP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322075596"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="322075596"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 10:07:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="525010166"
Received: from doboyle-mobl1.ger.corp.intel.com (HELO [10.252.21.221])
 ([10.252.21.221])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 10:07:24 -0700
Message-ID: <4ce166c1-9c19-79ac-25d6-08ef559517ad@intel.com>
Date: Thu, 7 Apr 2022 18:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/i915: fix broken build
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <1a4ebf85-4447-8f1b-b8cb-2fe0ad0372a1@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1a4ebf85-4447-8f1b-b8cb-2fe0ad0372a1@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/2022 17:49, Christian König wrote:
> Am 07.04.22 um 18:45 schrieb Matthew Auld:
>> I guess this was missed in the conversion or something.
>>
>> Fixes: 7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> My best guess is that this is a rebase/merge conflict. I'm 100% sure 
> i915 was compiling fine before I pushed the patch.

That was my thinking also, but building drm-misc-next I get the same error:

drivers/gpu/drm/i915/i915_deps.c: In function ‘i915_deps_add_resv’:
drivers/gpu/drm/i915/i915_deps.c:229:46: error: implicit conversion from 
‘enum <anonymous>’ to ‘enum dma_resv_usage’ [-Werror=enum-conversion]
   229 |         dma_resv_for_each_fence(&iter, resv, true, fence) {
       |                                              ^~~~
./include/linux/dma-resv.h:297:47: note: in definition of macro 
‘dma_resv_for_each_fence’
   297 |         for (dma_resv_iter_begin(cursor, obj, usage),   \
       |                                               ^~~~~

> 
> Anyway Reviewed-by: Christian König <christian.koenig@amd.com> for the 
> series.

Thanks.

> 
> Thanks,
> Christian.
> 
>> ---
>>   drivers/gpu/drm/i915/i915_deps.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_deps.c 
>> b/drivers/gpu/drm/i915/i915_deps.c
>> index 999210b37325..297b8e4e42ee 100644
>> --- a/drivers/gpu/drm/i915/i915_deps.c
>> +++ b/drivers/gpu/drm/i915/i915_deps.c
>> @@ -226,7 +226,7 @@ int i915_deps_add_resv(struct i915_deps *deps, 
>> struct dma_resv *resv,
>>       struct dma_fence *fence;
>>       dma_resv_assert_held(resv);
>> -    dma_resv_for_each_fence(&iter, resv, true, fence) {
>> +    dma_resv_for_each_fence(&iter, resv, dma_resv_usage_rw(true), 
>> fence) {
>>           int ret = i915_deps_add_dependency(deps, fence, ctx);
>>           if (ret)
> 
