Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC18A4131
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 10:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C574310E49A;
	Sun, 14 Apr 2024 08:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tjhxku4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DC610E49A;
 Sun, 14 Apr 2024 08:26:41 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.17.157]) by smtp.orange.fr with ESMTPA
 id vvC8ry1nx2EKwvvC8r61FO; Sun, 14 Apr 2024 10:26:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1713083199;
 bh=N6kt4K4X39o6KWEFDhgyAlxfWwd6wjsL+csvpVS017g=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=tjhxku4aCpQd8TAr+IdcjNdqD4iVTDQ/Q8lB+Jy8XNu/oMLoUMZk0TNWubY5O1ypz
 KRj9vhTckLtq2u/Ve7a1zHMaGoAD0dazRl/5oTk6k/Me04gStigPK+uN85ASj9mwjC
 PyYHr36ZAh+YuVGgVkD2j+rjhDNqJAmbuBWhRPQD79XykVrZCGM+aCZHEbjoye5DxY
 /LtRtP4ooYOiuZrnQ/rXqrlQc7v5xcGdJ+Oa4cxAN3lkzsH6YjXEqPrZYGb0HYjmGN
 Sd1oRdvBaUMPbb0XbDWWAb+6AyPk4EvN0nY5GSUZeWaD5hj7ofTI+ZNop9Qb6052bK
 nZ6yMFbai/DLg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Apr 2024 10:26:39 +0200
X-ME-IP: 86.243.17.157
Message-ID: <a788ee2e-ee51-476f-8aee-aa344f221f9c@wanadoo.fr>
Date: Sun, 14 Apr 2024 10:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Remove usage of the deprecated
 ida_simple_xx() API
To: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <7108c1871c6cb08d403c4fa6534bc7e6de4cb23d.1705245316.git.christophe.jaillet@wanadoo.fr>
 <ZbGlqD6zyyp4DsmH@DUT025-TGLU.fm.intel.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZbGlqD6zyyp4DsmH@DUT025-TGLU.fm.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 25/01/2024 à 01:04, Matthew Brost a écrit :
> On Sun, Jan 14, 2024 at 04:15:34PM +0100, Christophe JAILLET wrote:
>> ida_alloc() and ida_free() should be preferred to the deprecated
>> ida_simple_get() and ida_simple_remove().
>>
>> Note that the upper limit of ida_simple_get() is exclusive, but the one of
>> ida_alloc_range() is inclusive. So a -1 has been added when needed.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Hi,

polite reminder ;-)

CJ

> 
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index a259f1118c5a..73ce21ddf682 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2156,11 +2156,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>   					      order_base_2(ce->parallel.number_children
>>   							   + 1));
>>   	else
>> -		ret = ida_simple_get(&guc->submission_state.guc_ids,
>> -				     NUMBER_MULTI_LRC_GUC_ID(guc),
>> -				     guc->submission_state.num_guc_ids,
>> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
>> -				     __GFP_NOWARN);
>> +		ret = ida_alloc_range(&guc->submission_state.guc_ids,
>> +				      NUMBER_MULTI_LRC_GUC_ID(guc),
>> +				      guc->submission_state.num_guc_ids - 1,
>> +				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>   	if (unlikely(ret < 0))
>>   		return ret;
>>   
>> @@ -2183,8 +2182,8 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>   							   + 1));
>>   		} else {
>>   			--guc->submission_state.guc_ids_in_use;
>> -			ida_simple_remove(&guc->submission_state.guc_ids,
>> -					  ce->guc_id.id);
>> +			ida_free(&guc->submission_state.guc_ids,
>> +				 ce->guc_id.id);
>>   		}
>>   		clr_ctx_id_mapping(guc, ce->guc_id.id);
>>   		set_context_guc_id_invalid(ce);
>> -- 
>> 2.43.0
>>
> 
> 

