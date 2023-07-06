Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67B749A16
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6864710E4D9;
	Thu,  6 Jul 2023 10:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E9B10E4D9;
 Thu,  6 Jul 2023 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688641134; x=1720177134;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MgpQu2YpWw8zmTMQT+ZnA3T6OoirYfmnywEr3nMLhx8=;
 b=YWdA4je+h5JjSr2B8qV44CO6SkO99NotFDcGadQQDFu2Y74M40T5KNp3
 gbm/LwVrYTpX5XgwZjF5mo0mkHMsUieo+LShdQboGuogf3dEA8tGcJX+3
 aMkrkMsEMIRTnLn+gR0rYflrwCAcKrvhMIZ7cghaZJlvzK8U52hR2+6iM
 CdmG1IeI1yVHgmz4t1ekhDITq8dVZ6nSLzZDlXrLtE6rMUpcz3dQwSZfP
 mXimdewFnl+d190q1R/9iMC7YHkziXmOMKsRhDmDsI4dYteaabuIkJTVy
 jxe05YhvFvLrweRFlfey5yHkRa+6OLFFGflwHHrDnQvxqjaP0ebBgEQK6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427252286"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="427252286"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 03:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="722753442"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722753442"
Received: from dnatta1-mobl1.ger.corp.intel.com (HELO [10.213.201.247])
 ([10.213.201.247])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 03:58:51 -0700
Message-ID: <0f29877f-f21b-3854-e9c0-06cbd26d20ed@linux.intel.com>
Date: Thu, 6 Jul 2023 11:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: Remove some dead "code"
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230705095518.3690951-1-tvrtko.ursulin@linux.intel.com>
 <87r0pmzhky.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87r0pmzhky.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/07/2023 13:08, Jani Nikula wrote:
> On Wed, 05 Jul 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit 2caffbf11762 ("drm/i915: Revoke mmaps and prevent access to fence
>> registers across reset") removed the temporary implementation of a reset
>> under stop machine but forgot to remove this one commented out define.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks, pushed!

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index 6916eba3bd33..cdbc08dad7ae 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -35,9 +35,6 @@
>>   
>>   #define RESET_MAX_RETRIES 3
>>   
>> -/* XXX How to handle concurrent GGTT updates using tiling registers? */
>> -#define RESET_UNDER_STOP_MACHINE 0
>> -
>>   static void client_mark_guilty(struct i915_gem_context *ctx, bool banned)
>>   {
>>   	struct drm_i915_file_private *file_priv = ctx->file_priv;
> 
