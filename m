Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9DC5F9ABC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 10:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7EA10E464;
	Mon, 10 Oct 2022 08:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9C210E464;
 Mon, 10 Oct 2022 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665389648; x=1696925648;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nD+TiFgre8EfP7ineZy7SVnMlN+CCTdmpGNG1FzZ/l8=;
 b=ANrguG0hoaaHVLeFwcC2oqL4LVQOaD6TbuakA99aNI1MJzSt7LmsnW3h
 KqQY+hZTRGfKkk5oD7L2Sz+RWTNYmVLCGYkAqo+ug28MfUGkJkHEEaygP
 oqdyac3curDQ3ayrWGSe+GXB4xm6quAXhwQPXhtS9tLlj4V2Xsb4R9QPB
 9mmKjG/XYRASnywBB+0suYhNFeiM0a4VNky3AIn/BpeHvVGcaxlDQjiY0
 lDPU4z8QsDgmlyBEiWMIzuQYvcS32F2ZB5vwbBb4Myo2j5SxaTxHX/exi
 X9OdfgaE82O0B2gLcjBJQTADBF6i9Ke9h3MtX1y23C1cCCUe10Lmk9UDM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="302908689"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="302908689"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 01:14:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="694544256"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="694544256"
Received: from liammurp-mobl1.ger.corp.intel.com (HELO [10.213.197.233])
 ([10.213.197.233])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 01:14:03 -0700
Message-ID: <96ba4258-4195-3a6a-e296-291f93a0b8de@linux.intel.com>
Date: Mon, 10 Oct 2022 09:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/i915/perf: remove redundant variable 'taken'
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Colin Ian King <colin.i.king@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221007195345.2749911-1-colin.i.king@gmail.com>
 <6a57b91b-8614-6596-ae0f-acce6a31d161@wanadoo.fr>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6a57b91b-8614-6596-ae0f-acce6a31d161@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/10/2022 12:55, Christophe JAILLET wrote:
> Le 07/10/2022 à 21:53, Colin Ian King a écrit :
>> The assignment to variable taken is redundant and so it can be
>> removed as well as the variable too.
>>
>> Cleans up clang-scan build warnings:
>> warning: Although the value stored to 'taken' is used in the enclosing
>> expression, the value is never actually read from 'taken'
>> [deadcode.DeadStores]
> 
> Hi,
> 
> #define OA_TAKEN(tail, head)    ((tail - head) & (OA_BUFFER_SIZE - 1))
> 
> So if the result is not used, maybe calling OA_TAKEN() can be removed as 
> well?
> It looks like a no-op in such a case.

AFAICS result is used, just the copy/local variable is not.

For the patch:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks for the cleanup, will merge.

Regards,

Tvrtko


> 
> CJ
> 
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_perf.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>> b/drivers/gpu/drm/i915/i915_perf.c
>> index 0defbb43ceea..15816df916c7 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -656,7 +656,6 @@ static int gen8_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       size_t start_offset = *offset;
>>       unsigned long flags;
>>       u32 head, tail;
>> -    u32 taken;
>>       int ret = 0;
>>       if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
>> @@ -692,7 +691,7 @@ static int gen8_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       for (/* none */;
>> -         (taken = OA_TAKEN(tail, head));
>> +         OA_TAKEN(tail, head);
>>            head = (head + report_size) & mask) {
>>           u8 *report = oa_buf_base + head;
>>           u32 *report32 = (void *)report;
>> @@ -950,7 +949,6 @@ static int gen7_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       size_t start_offset = *offset;
>>       unsigned long flags;
>>       u32 head, tail;
>> -    u32 taken;
>>       int ret = 0;
>>       if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
>> @@ -984,7 +982,7 @@ static int gen7_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       for (/* none */;
>> -         (taken = OA_TAKEN(tail, head));
>> +         OA_TAKEN(tail, head);
>>            head = (head + report_size) & mask) {
>>           u8 *report = oa_buf_base + head;
>>           u32 *report32 = (void *)report;
> 
