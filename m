Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C890F4F187D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D5110E49A;
	Mon,  4 Apr 2022 15:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12410E48D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OnBCkMmBPPOBtIWh/Duqp5NItm2NKh26ZhP/uoq2yR4=; b=EvfhXNVxdGLMWTwUQw07fQOoGH
 N6B2YrEAEi3UMOlIMjh+LGbYwQ1P2XziGkhoLi0k0V2on+uKNmeSG1yazyid0Oe2vKSyStPa5MAYp
 jrnL0kBGT2L5rIoFkWWrrRBzSp0Pi7G1mMh8UspnVGGAGgpc5CoZ2yUBxeGjeI3/MaKWZb6i6Rf+B
 k7Udy0LzpGwdrgG2lNvj4OLa+pMpeyThIehoDJDWjxwI0ZZ7FnAhw0QxhnfkkF/X62aPbA3JJqYTd
 0TY2TUI7GoQRf7diDEeb0P+gC2pC4ZoKzxOafVpCp4vaVSQd29Xw+EEPTrwO6P+sAi3ecwdqlGb76
 7zkEgQwg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbOhg-001ZyH-TY; Mon, 04 Apr 2022 15:33:17 +0000
Message-ID: <db007d26-95d0-ff59-788a-0339d119224e@infradead.org>
Date: Mon, 4 Apr 2022 08:33:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, linux-kernel@vger.kernel.org
References: <20220404042509.13455-1-rdunlap@infradead.org>
 <6f89be90-50fe-729c-028c-978044e6840a@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6f89be90-50fe-729c-028c-978044e6840a@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Jiawei Gu <Jiawei.Gu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/22 07:34, Andrey Grodzovsky wrote:
> On 2022-04-04 00:25, Randy Dunlap wrote:
>> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
>>
>> Quashes these warnings:
>>
>> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'
> 
> Looks good to me except one point is that I already commited a fix for the above warning to drm-misc-next.
> 

OK. Do I need to send a v2 without the header file fix?

thanks.

> 
>> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>>   * struct drm_sched_backend_ops
>> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>>   * struct drm_gpu_scheduler
>>
>> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
>> drivers/gpu/drm/scheduler/sched_main.c:201: warning: missing initial short description on line:
>>   * drm_sched_dependency_optimized
>> drivers/gpu/drm/scheduler/sched_main.c:995: warning: Function parameter or member 'dev' not described in 'drm_sched_init'
>>
>> Fixes: 2d33948e4e00 ("drm/scheduler: add documentation")
>> Fixes: 8ab62eda177b ("drm/sched: Add device pointer to drm_gpu_scheduler")
>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>> Feel free to make changes or suggest changes...
>>
>>   drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>>   include/drm/gpu_scheduler.h            |   10 ++++++----
>>   2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> --- linux-next-20220401.orig/drivers/gpu/drm/scheduler/sched_main.c
>> +++ linux-next-20220401/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -198,7 +198,7 @@ static void drm_sched_job_done_cb(struct
>>   }
>>     /**
>> - * drm_sched_dependency_optimized
>> + * drm_sched_dependency_optimized - test if the dependency can be optimized
>>    *
>>    * @fence: the dependency fence
>>    * @entity: the entity which depends on the above fence
>> @@ -984,6 +984,7 @@ static int drm_sched_main(void *param)
>>    *        used
>>    * @score: optional score atomic shared with other schedulers
>>    * @name: name used for debugging
>> + * @dev: target &struct device
>>    *
>>    * Return 0 on success, otherwise error code.
>>    */
>> --- linux-next-20220401.orig/include/drm/gpu_scheduler.h
>> +++ linux-next-20220401/include/drm/gpu_scheduler.h
>> @@ -270,6 +270,7 @@ struct drm_sched_fence *to_drm_sched_fen
>>    * @sched: the scheduler instance on which this job is scheduled.
>>    * @s_fence: contains the fences for the scheduling of job.
>>    * @finish_cb: the callback for the finished fence.
>> + * @work: scheduler work queue
>>    * @id: a unique id assigned to each job scheduled on the scheduler.
>>    * @karma: increment on every hang caused by this job. If this exceeds the hang
>>    *         limit of the scheduler then the job is marked guilty and will not
>> @@ -328,10 +329,10 @@ enum drm_gpu_sched_stat {
>>   };
>>     /**
>> - * struct drm_sched_backend_ops
>> + * struct drm_sched_backend_ops - Define the backend operations
>> + *    called by the scheduler
>>    *
>> - * Define the backend operations called by the scheduler,
>> - * these functions should be implemented in driver side.
>> + * These functions should be implemented in the driver side.
>>    */
>>   struct drm_sched_backend_ops {
>>       /**
>> @@ -408,7 +409,7 @@ struct drm_sched_backend_ops {
>>   };
>>     /**
>> - * struct drm_gpu_scheduler
>> + * struct drm_gpu_scheduler - scheduler instance-specific data
>>    *
>>    * @ops: backend operations provided by the driver.
>>    * @hw_submission_limit: the max size of the hardware queue.
>> @@ -434,6 +435,7 @@ struct drm_sched_backend_ops {
>>    * @_score: score used when the driver doesn't provide one
>>    * @ready: marks if the underlying HW is ready to work
>>    * @free_guilty: A hit to time out handler to free the guilty job.
>> + * @dev: system &struct device
>>    *
>>    * One scheduler is implemented for each hardware ring.
>>    */

-- 
~Randy
