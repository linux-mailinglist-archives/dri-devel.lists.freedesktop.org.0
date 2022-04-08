Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D24F90D7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451E710F0D5;
	Fri,  8 Apr 2022 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF3D10F0D3;
 Fri,  8 Apr 2022 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649406736; x=1680942736;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/LgYqTlnKcchwTNADAwEegeOat2UUCkUTMqrDGUnhvY=;
 b=KAbV+hmpOy4u7R2REbPuiEKX2tCbPQWcukGnGUICtM/EBDr0AbDRXHDC
 cuAw8nqtvIiHQW3REQZ/Kr41jNboNYTo2gKRY7f7VI2J/o1ojSFSJKjGc
 ZXfsCKwmz5rfwgV+EZ76KgzLJ6ihsqxIXUtDkdgdEbyiik1iNdm+MSchY
 p0+xLmvOv4AmGfw+m7Hm2Pnwe7lRJiMpFnIxKDRTS+vhpGwcwImPgg7Qh
 ZIlN+aEObDaz0KBzLQ+ADFwZvni4gzL7r5BrVv4aWYtOq3nU5q4yo2N3c
 Pg2FZphi/A7ZKp7gHAqiimOpfyIEX7OSHFbr4TmDdigjuzhsRShsyuBwy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261538161"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261538161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:32:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="723312874"
Received: from ajomalle-mobl.ger.corp.intel.com (HELO [10.252.1.141])
 ([10.252.1.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:32:14 -0700
Message-ID: <f5862ea0-908e-def3-df79-db3d06bc389e@intel.com>
Date: Fri, 8 Apr 2022 09:32:12 +0100
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
> 
> Anyway Reviewed-by: Christian König <christian.koenig@amd.com> for the 
> series.

Christian, could you merge the first patch? I need to re-spin the second 
patch it seems.

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
