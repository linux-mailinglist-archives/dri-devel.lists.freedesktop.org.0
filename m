Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6F6AA5ED
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 00:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747A10E78D;
	Fri,  3 Mar 2023 23:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1010E78B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 23:53:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d30so16720121eda.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 15:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gnDZ9x2blH5V8YINfT6XOEOEFytwM5xt/JuAKzXCEWU=;
 b=CysvhjzJrWfpzLbmZMuln5F1LZXgBzBu4oR3PEjQqN/OQMt+Zh8GTxeYL9ZXR3QmSE
 tyHKB8gKDZRKXHxB0zBebHIXxH0FX3fNke1AHBevQacjZXOEyvedakh+rWEEdRE4HHAe
 D4Ci9kbvYC4wulP/eArIu7vNgMtZjjWcZG0OxuRi2gIxsqyFVj0ZZQobqXhgjoKFfcct
 dCLOTpYmzE01SHLQTatMXTNpuCNlej00nsQS+PVyBCgfb2manXjYDA12QXhAEfjSWtW+
 MqITV/TCHiEoJQJ3W9K4EGzf/rysfbK1CP/4eeauBSBf8P4A9s0zp9pktLwVtUGIyWIk
 +JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gnDZ9x2blH5V8YINfT6XOEOEFytwM5xt/JuAKzXCEWU=;
 b=hRM7pUh+86q2tMeUtU/3fnUY2sfPWY6cwlkFd1HqY5GjJTW4dp43s3aCIxvSM8/X4G
 3D9TNmAEFbqgtx6M+MdjJcaqVyYkA7EonSy7LnJ5J8k/6WZ8pg2RHUgrr6Smj6Yl1Isi
 NEu/fBquEmtvb28oLEhQjoitqSihzGodUo9t20bSqk1hl/HLed/i9hpGh/+a0kJEMRwJ
 b4uJI/sZTkydzua9jLLtnktkdROTnaK9ZyyBX7pFcz+aeeCuwjU2/wzMVV7xeZSGD9Xp
 j4SWmyJZ9HlBPrWsLnPBQvxbVMEDCzHhBjZfGSQ+Zd/L55WfrqCEGCsY6PYU5jfjPczG
 0lZA==
X-Gm-Message-State: AO0yUKU7D05T1QUPAFGT5/jezkDLRtx1Kbof/ih+FRYyEln8Hf1vc1K2
 5tz2vw02GQ8jzdju/m1XKN0XNw==
X-Google-Smtp-Source: AK7set9JmLUWJX+fB3FtuG1918iXvCOsgAoXJ70x5Nw9+h8/nbjmxtRgVk16QJDub3WUOofqGBZIpQ==
X-Received: by 2002:a17:907:70e:b0:878:955e:b4a4 with SMTP id
 xb14-20020a170907070e00b00878955eb4a4mr4595666ejb.33.1677887610406; 
 Fri, 03 Mar 2023 15:53:30 -0800 (PST)
Received: from [10.203.3.194] ([185.202.34.81])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a17090634d100b008ee5356801dsm1463032ejb.187.2023.03.03.15.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 15:53:30 -0800 (PST)
Message-ID: <b9a5778c-0eae-28c1-1806-33550345e619@linaro.org>
Date: Sat, 4 Mar 2023 01:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 12/15] drm/msm: Add deadline based boost support
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-13-robdclark@gmail.com>
 <a5249009-0bec-61a5-4dd2-5728ee3017e3@linaro.org>
 <CAF6AEGtmQu-8LEdm68vXJJSpssXq2AShEdexqTGVW0WO5VmtDQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGtmQu-8LEdm68vXJJSpssXq2AShEdexqTGVW0WO5VmtDQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <ppaalanen@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2023 19:03, Rob Clark wrote:
> On Fri, Mar 3, 2023 at 2:10 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 03/03/2023 01:53, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Track the nearest deadline on a fence timeline and set a timer to expire
>>> shortly before to trigger boost if the fence has not yet been signaled.
>>>
>>> v2: rebase
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_fence.c | 74 +++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/msm/msm_fence.h | 20 +++++++++
>>>    2 files changed, 94 insertions(+)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> A small question: do we boost to fit into the deadline or to miss the
>> deadline for as little as possible? If the former is the case, we might
>> need to adjust 3ms depending on the workload.
> 
> The goal is as much to run with higher clock on the next frame as it
> is to not miss a deadline.  Ie. we don't want devfreq to come to the
> conclusion that running at <50% clks is best due to the amount of
> utilization caused by missing ever other vblank.

Ack, thanks for the explanation.

> 
> But 3ms is mostly just "seems like a good compromise" value.  It might change.
> 
> BR,
> -R
> 
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
>>> index 56641408ea74..51b461f32103 100644
>>> --- a/drivers/gpu/drm/msm/msm_fence.c
>>> +++ b/drivers/gpu/drm/msm/msm_fence.c
>>> @@ -8,6 +8,35 @@
>>>
>>>    #include "msm_drv.h"
>>>    #include "msm_fence.h"
>>> +#include "msm_gpu.h"
>>> +
>>> +static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
>>> +{
>>> +     struct msm_drm_private *priv = fctx->dev->dev_private;
>>> +     return priv->gpu;
>>> +}
>>> +
>>> +static enum hrtimer_restart deadline_timer(struct hrtimer *t)
>>> +{
>>> +     struct msm_fence_context *fctx = container_of(t,
>>> +                     struct msm_fence_context, deadline_timer);
>>> +
>>> +     kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
>>> +
>>> +     return HRTIMER_NORESTART;
>>> +}
>>> +
>>> +static void deadline_work(struct kthread_work *work)
>>> +{
>>> +     struct msm_fence_context *fctx = container_of(work,
>>> +                     struct msm_fence_context, deadline_work);
>>> +
>>> +     /* If deadline fence has already passed, nothing to do: */
>>> +     if (msm_fence_completed(fctx, fctx->next_deadline_fence))
>>> +             return;
>>> +
>>> +     msm_devfreq_boost(fctx2gpu(fctx), 2);
>>> +}
>>>
>>>
>>>    struct msm_fence_context *
>>> @@ -36,6 +65,13 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>>>        fctx->completed_fence = fctx->last_fence;
>>>        *fctx->fenceptr = fctx->last_fence;
>>>
>>> +     hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
>>> +     fctx->deadline_timer.function = deadline_timer;
>>> +
>>> +     kthread_init_work(&fctx->deadline_work, deadline_work);
>>> +
>>> +     fctx->next_deadline = ktime_get();
>>> +
>>>        return fctx;
>>>    }
>>>
>>> @@ -62,6 +98,8 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>>>        spin_lock_irqsave(&fctx->spinlock, flags);
>>>        if (fence_after(fence, fctx->completed_fence))
>>>                fctx->completed_fence = fence;
>>> +     if (msm_fence_completed(fctx, fctx->next_deadline_fence))
>>> +             hrtimer_cancel(&fctx->deadline_timer);
>>>        spin_unlock_irqrestore(&fctx->spinlock, flags);
>>>    }
>>>
>>> @@ -92,10 +130,46 @@ static bool msm_fence_signaled(struct dma_fence *fence)
>>>        return msm_fence_completed(f->fctx, f->base.seqno);
>>>    }
>>>
>>> +static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>> +{
>>> +     struct msm_fence *f = to_msm_fence(fence);
>>> +     struct msm_fence_context *fctx = f->fctx;
>>> +     unsigned long flags;
>>> +     ktime_t now;
>>> +
>>> +     spin_lock_irqsave(&fctx->spinlock, flags);
>>> +     now = ktime_get();
>>> +
>>> +     if (ktime_after(now, fctx->next_deadline) ||
>>> +                     ktime_before(deadline, fctx->next_deadline)) {
>>> +             fctx->next_deadline = deadline;
>>> +             fctx->next_deadline_fence =
>>> +                     max(fctx->next_deadline_fence, (uint32_t)fence->seqno);
>>> +
>>> +             /*
>>> +              * Set timer to trigger boost 3ms before deadline, or
>>> +              * if we are already less than 3ms before the deadline
>>> +              * schedule boost work immediately.
>>> +              */
>>> +             deadline = ktime_sub(deadline, ms_to_ktime(3));
>>> +
>>> +             if (ktime_after(now, deadline)) {
>>> +                     kthread_queue_work(fctx2gpu(fctx)->worker,
>>> +                                     &fctx->deadline_work);
>>> +             } else {
>>> +                     hrtimer_start(&fctx->deadline_timer, deadline,
>>> +                                     HRTIMER_MODE_ABS);
>>> +             }
>>> +     }
>>> +
>>> +     spin_unlock_irqrestore(&fctx->spinlock, flags);
>>> +}
>>> +
>>>    static const struct dma_fence_ops msm_fence_ops = {
>>>        .get_driver_name = msm_fence_get_driver_name,
>>>        .get_timeline_name = msm_fence_get_timeline_name,
>>>        .signaled = msm_fence_signaled,
>>> +     .set_deadline = msm_fence_set_deadline,
>>>    };
>>>
>>>    struct dma_fence *
>>> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
>>> index 7f1798c54cd1..cdaebfb94f5c 100644
>>> --- a/drivers/gpu/drm/msm/msm_fence.h
>>> +++ b/drivers/gpu/drm/msm/msm_fence.h
>>> @@ -52,6 +52,26 @@ struct msm_fence_context {
>>>        volatile uint32_t *fenceptr;
>>>
>>>        spinlock_t spinlock;
>>> +
>>> +     /*
>>> +      * TODO this doesn't really deal with multiple deadlines, like
>>> +      * if userspace got multiple frames ahead.. OTOH atomic updates
>>> +      * don't queue, so maybe that is ok
>>> +      */
>>> +
>>> +     /** next_deadline: Time of next deadline */
>>> +     ktime_t next_deadline;
>>> +
>>> +     /**
>>> +      * next_deadline_fence:
>>> +      *
>>> +      * Fence value for next pending deadline.  The deadline timer is
>>> +      * canceled when this fence is signaled.
>>> +      */
>>> +     uint32_t next_deadline_fence;
>>> +
>>> +     struct hrtimer deadline_timer;
>>> +     struct kthread_work deadline_work;
>>>    };
>>>
>>>    struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
>>
>> --
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

