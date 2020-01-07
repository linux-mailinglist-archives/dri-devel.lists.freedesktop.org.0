Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DD9132147
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA54B6E7EA;
	Tue,  7 Jan 2020 08:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jan 2020 08:21:51 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97A86E7EA;
 Tue,  7 Jan 2020 08:21:51 +0000 (UTC)
Received: from [192.168.242.100] ([93.200.87.82]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MV5KC-1jEcLT1mFC-00SAsV; Tue, 07 Jan 2020 09:16:45 +0100
Subject: Re: [PATCH] drm/lima: use drm_sched_fault for error task handling
To: Vasily Khoruzhick <anarsoul@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>
References: <20200101103831.22429-1-yuq825@gmail.com>
 <CA+E=qVfhNeHqSYrxD_v5pQ-kZZvM0xZp+5Tue_VOpn6yAhu7BQ@mail.gmail.com>
From: Andreas Baierl <list@imkreisrum.de>
Message-ID: <df5a905a-71e3-5553-f654-687ab6b3b146@imkreisrum.de>
Date: Tue, 7 Jan 2020 09:16:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CA+E=qVfhNeHqSYrxD_v5pQ-kZZvM0xZp+5Tue_VOpn6yAhu7BQ@mail.gmail.com>
X-Provags-ID: V03:K1:fLR6/q0S4jaO4TY2EnuCzxoTojy41A+Ii1ddrIqiSU8bhEsSEVm
 YOj/cqWWn+BWJ0k8lVXCZik9Pcqs0ONNiU4y+xwblreTcjVN6RD4v7JZQxDzsKAuPUg/zta
 tryYhlJUmYmrLhCssWeZ0V6DcHnASmN3oePKo5y2xBHC8L9BMp7cqsL0Q6s+fnbYnQ+YSCK
 4uYK93PmaO+Re0oI2HGCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CQn2LybBVs8=:gVxiyavXtMijBmXfyXLBPq
 KN2aUodh56BBwTw29FycyV4umhNes3jqtAAY0qljOf7/w70/Af36Pu7jY9a4nH2FVUTGPJcyL
 wX/2oj66ARVfJ8uKkLOe0fPYt3rSQaYsbyg7/79QfGLueBnTAIH9MAPihBcz1YeumkVs5Q5Hc
 dM7PoVqwY7X1fWaqUR5v32eKvQ0F4LeycfF1w4zrt+L88SUF+iyXBvjmcKUHixOVwnUfMm5hv
 pA6sOvSVUpsviG+PlEXODBJmwYZB56LEP4wAQoiBggQGEC1fGua++8M8ZFzPWyQ1yVJwa9OH4
 p1RplzdQPzZrIQ6NAB+FQcIRwUYuk+hHht2OYjhKalxZaRC1N0qzvVM/qhNBRzHwQURf88CKT
 N63bxT1yCoWNPBfDu/T64NVtQavHeO10shQH7RUaeIQk/Q5v+qCh1Ak5Y4aivq69TiUfm5N8K
 M6N5JAsjNf6LU9mEG3n7kHt7jRwAYeJ+6vgXV+x7SeWY+lBJCgbr2djyotZSs5LXIxUGyJh81
 OUBGmEI6iQF6HADWy2lWGLdiGoC2fK0RMZchorbzjWc411djLw+55A4FtSwfPL3RzoChrfp0S
 feGZSsZ1kIvLgbK/SLDHJCEMYmpOkdBfTIYWerqWILyWxeMEPYS07r1TPFVNLu5yHVFuUIovS
 EYOZp74iscHFgQS6kEZGtOagUw2cMcKeXr8JzXa3D4oHghQyTjyrzDdfEnffY0wkQZq0J02dF
 3xhi16J6BZA4EFub5UbgKNnoTl9UjO/wvYEEYDJ6AKDG1StravCPGNU93Ui0ZOOloGiZCSow9
 WH4l9Ypom0/6VpEcv+mocAKUy2zQuKg2yJ16LgeZBfSoZQOAjm6vT3FRDgXCLkOiVeVr0A/Fg
 hynEbEHxSAva25/aCDY1wOAaB9N4Z7mzLthHjRrbY=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.01.2020 um 06:46 schrieb Vasily Khoruzhick:
> On Wed, Jan 1, 2020 at 2:39 AM Qiang Yu <yuq825@gmail.com> wrote:
>> drm_sched_job_timedout works with drm_sched_stop as a pair,
>> so we'd better use the drm_sched_fault helper to make the
>> error and timeout handling go the same path.
>>
>> This also fixes application hang when task error.
>>
>> Signed-off-by: Qiang Yu <yuq825@gmail.com>
> LGTM in general.
>
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
>
> Erico, Andreas, could you test this patch on actual hardware? I'll
> have pretty limited access to the hardware for next few weeks, so I
> won't be able to test it myself.
I've tested that one on top of a recent kernel (3a562aee727a) on a 
Mali450/ Allwinner H5 device with deqp and got no regressions and kernel 
issues.
So...

Tested-by: Andreas Baierl <ichgeh@imkreisrum.de>
>> ---
>>   drivers/gpu/drm/lima/lima_sched.c | 35 ++++++++-----------------------
>>   drivers/gpu/drm/lima/lima_sched.h |  2 --
>>   2 files changed, 9 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>> index f522c5f99729..a31a90c380b6 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -255,13 +255,17 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
>>          return task->fence;
>>   }
>>
>> -static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
>> -                                        struct lima_sched_task *task)
>> +static void lima_sched_timedout_job(struct drm_sched_job *job)
>>   {
>> +       struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
>> +       struct lima_sched_task *task = to_lima_task(job);
>> +
>> +       if (!pipe->error)
>> +               DRM_ERROR("lima job timeout\n");
>> +
>>          drm_sched_stop(&pipe->base, &task->base);
>>
>> -       if (task)
>> -               drm_sched_increase_karma(&task->base);
>> +       drm_sched_increase_karma(&task->base);
>>
>>          pipe->task_error(pipe);
>>
>> @@ -284,16 +288,6 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
>>          drm_sched_start(&pipe->base, true);
>>   }
>>
>> -static void lima_sched_timedout_job(struct drm_sched_job *job)
>> -{
>> -       struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
>> -       struct lima_sched_task *task = to_lima_task(job);
>> -
>> -       DRM_ERROR("lima job timeout\n");
>> -
>> -       lima_sched_handle_error_task(pipe, task);
>> -}
>> -
>>   static void lima_sched_free_job(struct drm_sched_job *job)
>>   {
>>          struct lima_sched_task *task = to_lima_task(job);
>> @@ -318,15 +312,6 @@ static const struct drm_sched_backend_ops lima_sched_ops = {
>>          .free_job = lima_sched_free_job,
>>   };
>>
>> -static void lima_sched_error_work(struct work_struct *work)
>> -{
>> -       struct lima_sched_pipe *pipe =
>> -               container_of(work, struct lima_sched_pipe, error_work);
>> -       struct lima_sched_task *task = pipe->current_task;
>> -
>> -       lima_sched_handle_error_task(pipe, task);
>> -}
>> -
>>   int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>   {
>>          unsigned int timeout = lima_sched_timeout_ms > 0 ?
>> @@ -335,8 +320,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>          pipe->fence_context = dma_fence_context_alloc(1);
>>          spin_lock_init(&pipe->fence_lock);
>>
>> -       INIT_WORK(&pipe->error_work, lima_sched_error_work);
>> -
>>          return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
>>                                msecs_to_jiffies(timeout), name);
>>   }
>> @@ -349,7 +332,7 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
>>   void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
>>   {
>>          if (pipe->error)
>> -               schedule_work(&pipe->error_work);
>> +               drm_sched_fault(&pipe->base);
>>          else {
>>                  struct lima_sched_task *task = pipe->current_task;
>>
>> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
>> index 928af91c1118..1d814fecbcc0 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.h
>> +++ b/drivers/gpu/drm/lima/lima_sched.h
>> @@ -68,8 +68,6 @@ struct lima_sched_pipe {
>>          void (*task_fini)(struct lima_sched_pipe *pipe);
>>          void (*task_error)(struct lima_sched_pipe *pipe);
>>          void (*task_mmu_error)(struct lima_sched_pipe *pipe);
>> -
>> -       struct work_struct error_work;
>>   };
>>
>>   int lima_sched_task_init(struct lima_sched_task *task,
>> --
>> 2.17.1
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
