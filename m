Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E715B629F07
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AF710E422;
	Tue, 15 Nov 2022 16:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB9E10E41A;
 Tue, 15 Nov 2022 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668529684; x=1700065684;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tuUKZEEjG41bajlA9ZREi4bujpfrPB1anew3wUwMhi4=;
 b=Zx+xfx4y9DesgWOOsdYdBpcV4zJi/N6ZmQ/EHx931SQKe1oVumrZpVCo
 mx5FtYKwiRr40RMD0yGnRZfhs/46KV55alVjRvO2DuSoXHJh4pg7en94/
 D/Qo+hqVQg8KrMG4sFIvs3Jxd4coayF1fEF7Mw0pLcq1nqxU6o0Ts9Iv6
 eJcT+WLk6eRK29GMW+RzWahD22clq4elkK/MEineY9wDKGHPvcxICSC70
 ys840MYNEuqbKc7iNt/dv1WcbSfEe+/PYsI0373emcmvpu4nqxOm1kGaL
 /swhKP5CTlSAVq1CeDY92XjDfQHRpBz3/Q+zdFvBLm4daPLddggYPm0PD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="299820025"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="299820025"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 08:28:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="763970600"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="763970600"
Received: from rainikit-mobl1.ger.corp.intel.com (HELO [10.213.198.207])
 ([10.213.198.207])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 08:28:02 -0800
Message-ID: <adb80c4d-f76d-c1c6-d531-2604f82988b5@linux.intel.com>
Date: Tue, 15 Nov 2022 16:28:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix vma allocator debug
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221115101730.394880-1-tvrtko.ursulin@linux.intel.com>
 <60b1a6aa-f3f4-06c0-01af-409fa378c747@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <60b1a6aa-f3f4-06c0-01af-409fa378c747@intel.com>
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


On 15/11/2022 10:46, Andrzej Hajda wrote:
> On 15.11.2022 11:17, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Add a missing colon which I accidentally removed in the recent logging
>> changes.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: a10234fda466 ("drm/i915: Partial abandonment of legacy DRM 
>> logging macros")
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks, pushed!

Regards,

Tvrtko

> Regards
> Andrzej
> 
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>> b/drivers/gpu/drm/i915/i915_vma.c
>> index 3b969d679c1e..947fde68e5f5 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -73,7 +73,7 @@ static void vma_print_allocator(struct i915_vma 
>> *vma, const char *reason)
>>       char buf[512];
>>       if (!vma->node.stack) {
>> -        drm_dbg(&to_i915(vma->obj->base.dev)->drm
>> +        drm_dbg(&to_i915(vma->obj->base.dev)->drm,
>>               "vma.node [%08llx + %08llx] %s: unknown owner\n",
>>               vma->node.start, vma->node.size, reason);
>>           return;
> 
