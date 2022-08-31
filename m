Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563055A85B5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 20:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C910E4E6;
	Wed, 31 Aug 2022 18:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D152F10E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=qXmrCnpitzVik2ZwdtpGRAJ60eJb5DPfzzZ5ouE/xSM=; b=F1HPRY50KyFQ1m4Fm249FFJryG
 HdFlbL6Subz/RRlIK6Sn8ZJlMTVBHCcULdA/W9QKh5LDaNqtOI7yWHEM4E+fiPmtK9QL0fBO3doAa
 UeBy/73QQ9C5vYDWaTCYyL90q2EakS/dJqkY6OTB9Yk19OkgigiXManT588KhsjrNPcwyc/mv+FMv
 ebVIoMZft/Zyo0mzE7KnDoqaixblffjcBxlgGx+5RhSaaDjr/Zlq3UaTKEVgUcwfEpxPMFIIY5PT5
 y0tDH/Q8msYyuT5BTmqO6Xj67zWnmiCL/jyYS+L3HWaS5TKwlHf4YTjmZ1HsLMjoH/XKNAS0U7UmZ
 9oVVDGSA==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTSYD-007csW-Ts; Wed, 31 Aug 2022 18:34:57 +0000
Message-ID: <e61a6903-550d-df70-6297-f49cc2750244@infradead.org>
Date: Wed, 31 Aug 2022 11:34:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] drm/scheduler: quieten kernel-doc warnings
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, linux-kernel@vger.kernel.org
References: <20220404213040.12912-1-rdunlap@infradead.org>
 <68961bab-6448-9a98-8916-9c3cb0c5d020@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <68961bab-6448-9a98-8916-9c3cb0c5d020@amd.com>
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

ping?

On 4/4/22 14:58, Andrey Grodzovsky wrote:
> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Andrey
> 
> On 2022-04-04 17:30, Randy Dunlap wrote:
>> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
>>
>> Quashes these warnings:
>>
>> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>>   * struct drm_sched_backend_ops
>> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>>   * struct drm_gpu_scheduler
>> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
>>
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
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>> Feel free to make changes or suggest changes...
>>
>> v2: drop @work description (already done by Andrey)
>>
>>   drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>>   include/drm/gpu_scheduler.h            |    9 +++++----
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> --- linux-next-20220404.orig/drivers/gpu/drm/scheduler/sched_main.c
>> +++ linux-next-20220404/drivers/gpu/drm/scheduler/sched_main.c
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
>> --- linux-next-20220404.orig/include/drm/gpu_scheduler.h
>> +++ linux-next-20220404/include/drm/gpu_scheduler.h
>> @@ -328,10 +328,10 @@ enum drm_gpu_sched_stat {
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
>> @@ -408,7 +408,7 @@ struct drm_sched_backend_ops {
>>   };
>>     /**
>> - * struct drm_gpu_scheduler
>> + * struct drm_gpu_scheduler - scheduler instance-specific data
>>    *
>>    * @ops: backend operations provided by the driver.
>>    * @hw_submission_limit: the max size of the hardware queue.
>> @@ -434,6 +434,7 @@ struct drm_sched_backend_ops {
>>    * @_score: score used when the driver doesn't provide one
>>    * @ready: marks if the underlying HW is ready to work
>>    * @free_guilty: A hit to time out handler to free the guilty job.
>> + * @dev: system &struct device
>>    *
>>    * One scheduler is implemented for each hardware ring.
>>    */

-- 
~Randy
