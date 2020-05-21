Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF61DE04E
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641806E31A;
	Fri, 22 May 2020 06:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9C0688503
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 07:00:31 +0000 (UTC)
Received: by ajax-webmail-mail-app4 (Coremail) ; Thu, 21 May 2020 15:00:14
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.77.158]
Date: Thu, 21 May 2020 15:00:14 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Steven Price" <steven.price@arm.com>
Subject: Re: Re: [PATCH] drm/panfrost: fix runtime pm imbalance on error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <73a1dc37-f862-f908-4c9f-64e256283857@arm.com>
References: <20200520110504.24388-1-dinghao.liu@zju.edu.cn>
 <73a1dc37-f862-f908-4c9f-64e256283857@arm.com>
MIME-Version: 1.0
Message-ID: <1986c141.ba6f5.172360851d6.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgCXPxz+JsZex6XoAQ--.30247W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgMHBlZdtOPIGAABsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXvS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
 CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
 j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
 AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r4j6F4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r4xMIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
 xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
 FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
 AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
 0EY4v20xvaj40_Wr1j6rW3Jr1lV2xY6IIF0xvEx4A2jsIE14v26r4j6F4UMIAIbVCI42IY
 6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:06 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,

There are two bailing out points in panfrost_job_hw_submit(): one is 
the error path beginning from pm_runtime_get_sync(), the other one is 
the error path beginning from WARN_ON() in the if statement. The pm 
imbalance fixed in this patch is between these two paths. I think the 
caller of panfrost_job_hw_submit() cannot distinguish this imbalance 
outside this function. 

panfrost_job_timedout() calls pm_runtime_put_noidle() for every job it 
finds, but all jobs are added to the pfdev->jobs just before calling
panfrost_job_hw_submit(). Therefore I think the imbalance still exists.
But I'm not very sure if we should add pm_runtime_put on the error path
after pm_runtime_get_sync(), or remove pm_runtime_put one the error path
after WARN_ON(). 

As for the problem about panfrost_devfreq_record_busy(), this may be a 
new bug and requires independent patch to fix it.

Regards,
Dinghao


> On 20/05/2020 12:05, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > the call returns an error code. Thus a pairing decrement is needed
> > on the error handling path to keep the counter balanced.
> > 
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> 
> Actually I think we have the opposite problem. To be honest we don't 
> handle this situation very well. By the time panfrost_job_hw_submit() is 
> called the job has already been added to the pfdev->jobs array, so it's 
> considered submitted even if it never actually lands on the hardware. So 
> in the case of this function bailing out early we will then (eventually) 
> hit a timeout and trigger a GPU reset.
> 
> panfrost_job_timedout() iterates through the pfdev->jobs array and calls 
> pm_runtime_put_noidle() for each job it finds. So there's no inbalance 
> here that I can see.
> 
> Have you actually observed the situation where pm_runtime_get_sync() 
> returns a failure?
> 
> HOWEVER, it appears that by bailing out early the call to 
> panfrost_devfreq_record_busy() is never made, which as far as I can see 
> means that there may be an extra call to panfrost_devfreq_record_idle() 
> when the jobs have timed out. Which could underflow the counter.
> 
> But equally looking at panfrost_job_timedout(), we only call 
> panfrost_devfreq_record_idle() *once* even though multiple jobs might be 
> processed.
> 
> There's a completely untested patch below which in theory should fix that...
> 
> Steve
> 
> ----8<---
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c 
> b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7914b1570841..f9519afca29d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -145,6 +145,8 @@ static void panfrost_job_hw_submit(struct 
> panfrost_job *job, int js)
>   	u64 jc_head = job->jc;
>   	int ret;
> 
> +	panfrost_devfreq_record_busy(pfdev);
> +
>   	ret = pm_runtime_get_sync(pfdev->dev);
>   	if (ret < 0)
>   		return;
> @@ -155,7 +157,6 @@ static void panfrost_job_hw_submit(struct 
> panfrost_job *job, int js)
>   	}
> 
>   	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
> -	panfrost_devfreq_record_busy(pfdev);
> 
>   	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
>   	job_write(pfdev, JS_HEAD_NEXT_HI(js), jc_head >> 32);
> @@ -410,12 +411,12 @@ static void panfrost_job_timedout(struct 
> drm_sched_job *sched_job)
>   	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>   		if (pfdev->jobs[i]) {
>   			pm_runtime_put_noidle(pfdev->dev);
> +			panfrost_devfreq_record_idle(pfdev);
>   			pfdev->jobs[i] = NULL;
>   		}
>   	}
>   	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
> 
> -	panfrost_devfreq_record_idle(pfdev);
>   	panfrost_device_reset(pfdev);
> 
>   	for (i = 0; i < NUM_JOB_SLOTS; i++)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
