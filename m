Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D73F87A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CF46E82F;
	Thu, 26 Aug 2021 12:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4056E82C;
 Thu, 26 Aug 2021 12:37:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id u15so1763485wmj.1;
 Thu, 26 Aug 2021 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8yDqRXxy2k+g3CbSCL6/OTmERnMVHVbAKrWTPmLJD9Y=;
 b=QRVE0h0MH7ecCaLKK7WAmBaAno+LprMHL4z8IpVjLdi6nlJqhT63vEtBPJnSGhZOHt
 uEh4sbqrL5whizk+rFv4Q+H//U3o0DIFU5dBq+evkMxVGcsLH0kPypkelTkYOTho9zyD
 eEYPMOdYK+uvb104iUuh6cuutW5s/QfBR3x4AFEME5fsLuO4bdm33SHDBdxa9TLGP2Hj
 oGoFAqrLkVEaZn8khcQP3iq/ifLlImo/ktSzf/A3xTipk+pn6yJ79PLsE42EU6LQ6Elt
 1ltIs7jIaQDBeE1Nr5qisf4wDisKwW/4UN2J3sF1hgRoOtG3E06Hx42fIdyDxWaAdgZh
 pUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8yDqRXxy2k+g3CbSCL6/OTmERnMVHVbAKrWTPmLJD9Y=;
 b=XGumwcXOyLlP5b+ER41J+s6OawmdWrW+YTxpScUGj6Ahvdy/Q3A6crOo04OYT/y0tW
 yEJIVPmaw4PZDuL0PvseNfZTCQeeOpTHq4NnqHN6vfjZUSBR9zEWwtTscyUVClIurQN9
 CeLbRTWXbiRyeJg600i/o9bzfc5GmF+6e21vRQkhDM9jMQ2ZDERe3AzPmyuL5zKwec2O
 pKJaqrh4fU0d9ho6t7Uyp5QKiwYVPD9eM2V++AmhR1VZR8rSgzSKB5/SP2jXTUL/fGA4
 DEmt8KhetzZ4J9TdzsBOkgh87viXbP8/Ps2pGYKlyZp4Y4YOAtisRHtKIP3eEXC+6fgR
 zxWw==
X-Gm-Message-State: AOAM532piUlgVN95ZZdofSYnylHb9eu61M0ib2tfTZfYCCrF+lKpm1Vp
 Yw/PUIN9pnZNp8Li6BZAzcnxvML6+Kk=
X-Google-Smtp-Source: ABdhPJwZXh3cHx6+CoilPuZf1AgQO6zZ/pBmEPwW2z2SShHTYFFX7/DDw0mqIeLgcmeaDURxIN7i0g==
X-Received: by 2002:a1c:4cd:: with SMTP id 196mr3503848wme.10.1629981462113;
 Thu, 26 Aug 2021 05:37:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1f1e:4529:2fc9:1857?
 ([2a02:908:1252:fb60:1f1e:4529:2fc9:1857])
 by smtp.gmail.com with ESMTPSA id b18sm3035541wrr.89.2021.08.26.05.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 05:37:41 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <e000dc1a-8fe8-ea69-e16b-bf0b64d773f2@gmail.com>
 <BL1PR12MB5269107A0A927EC3D7A7B6E784C79@BL1PR12MB5269.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7ad2d73a-cabd-b85b-0483-72a2177df86e@gmail.com>
Date: Thu, 26 Aug 2021 14:37:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BL1PR12MB5269107A0A927EC3D7A7B6E784C79@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 26.08.21 um 13:55 schrieb Liu, Monk:
> [AMD Official Use Only]
>
>>> I'm not sure if the work_tdr is initialized when a maximum timeout is specified. Please double check.
> Ok, will do
>
>>> BTW: Can we please drop the "tdr" naming from the scheduler? That is just a timeout functionality and not related to recovery in any way.
> We even do not start hardware recovery in a lot of cases now (when wave kill is successfully).
>
> Umm, sounds reasonable, I can rename it to "to" with another patch

Maybe more like job_timeout or timeout_work or something into that 
direction.

Christian.

>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> Sent: Thursday, August 26, 2021 6:09 PM
> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
>
> Am 26.08.21 um 06:55 schrieb Monk Liu:
>> issue:
>> in cleanup_job the cancle_delayed_work will cancel a TO timer even the
>> its corresponding job is still running.
> Yeah, that makes a lot more sense.
>
>> fix:
>> do not cancel the timer in cleanup_job, instead do the cancelling only
>> when the heading job is signaled, and if there is a "next" job we
>> start_timeout again.
>>
>> v2:
>> further cleanup the logic, and do the TDR timer cancelling if the
>> signaled job is the last one in its scheduler.
>>
>> v3:
>> change the issue description
>> remove the cancel_delayed_work in the begining of the cleanup_job
>> recover the implement of drm_sched_job_begin.
>>
>> TODO:
>> 1)introduce pause/resume scheduler in job_timeout to serial the
>> handling of scheduler and job_timeout.
>> 2)drop the bad job's del and insert in scheduler due to above
>> serialization (no race issue anymore with the serialization)
>>
>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>> ---
>>    drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a2a9536..ecf8140 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>    {
>>    	struct drm_sched_job *job, *next;
>>    
>> -	/*
>> -	 * Don't destroy jobs while the timeout worker is running  OR thread
>> -	 * is being parked and hence assumed to not touch pending_list
>> -	 */
>> -	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>> -	    !cancel_delayed_work(&sched->work_tdr)) ||
>> -	    kthread_should_park())
>> +	if (kthread_should_park())
>>    		return NULL;
>>    
>>    	spin_lock(&sched->job_list_lock);
>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>    	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>    		/* remove job from pending_list */
>>    		list_del_init(&job->list);
>> +
>> +		/* cancel this job's TO timer */
>> +		cancel_delayed_work(&sched->work_tdr);
> I'm not sure if the work_tdr is initialized when a maximum timeout is specified. Please double check.
>
> BTW: Can we please drop the "tdr" naming from the scheduler? That is just a timeout functionality and not related to recovery in any way.
>
> We even do not start hardware recovery in a lot of cases now (when wave kill is successfully).
>
> Regards,
> Christian.
>
>>    		/* make the scheduled timestamp more accurate */
>>    		next = list_first_entry_or_null(&sched->pending_list,
>>    						typeof(*next), list);
>> -		if (next)
>> +
>> +		if (next) {
>>    			next->s_fence->scheduled.timestamp =
>>    				job->s_fence->finished.timestamp;
>> -
>> +			/* start TO timer for next job */
>> +			drm_sched_start_timeout(sched);
>> +		}
>>    	} else {
>>    		job = NULL;
>> -		/* queue timeout for next job */
>> -		drm_sched_start_timeout(sched);
>>    	}
>>    
>>    	spin_unlock(&sched->job_list_lock);
>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>    					  (entity = drm_sched_select_entity(sched))) ||
>>    					 kthread_should_stop());
>>    
>> -		if (cleanup_job) {
>> +		if (cleanup_job)
>>    			sched->ops->free_job(cleanup_job);
>> -			/* queue timeout for next job */
>> -			drm_sched_start_timeout(sched);
>> -		}
>>    
>>    		if (!entity)
>>    			continue;

