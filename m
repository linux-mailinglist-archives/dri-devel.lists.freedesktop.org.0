Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D675A97322
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35E210E5E7;
	Tue, 22 Apr 2025 16:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0B10E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:54:13 +0000 (UTC)
Message-ID: <68966ea6-3170-4ee5-ae9c-779845743ba3@lankhorst.se>
Date: Tue, 22 Apr 2025 18:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: fix the warning for hit_low and evict_low
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250421111902.698287-1-sunil.khatri@amd.com>
 <91f82c7b-26d7-44b3-8c11-1341c020c022@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <91f82c7b-26d7-44b3-8c11-1341c020c022@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,
This looks good.

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

On 2025-04-21 13:23, Khatri, Sunil wrote:
> @Lankhorst
> Does the comment sounds correct or could you please share what should be the right comment to add
> 
> Regards
> Sunil Khatri
> 
> On 4/21/2025 4:49 PM, Sunil Khatri wrote:
>> fix the below warning messages:
>> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
>> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'
>>
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 95b86003c50d..5bf3c969907c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1093,7 +1093,8 @@ struct ttm_bo_swapout_walk {
>>       struct ttm_lru_walk walk;
>>       /** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
>>       gfp_t gfp_flags;
>> -
>> +    /** @hit_low: Whether we should attempt to swap BO's with low watermark threshold */
>> +    /** @evict_low: If we cannot swap a bo when @try_low is false (first pass) */
>>       bool hit_low, evict_low;
>>   };
>>   

