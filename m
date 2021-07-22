Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A823D1FEF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5576E94A;
	Thu, 22 Jul 2021 08:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71D16E8CE;
 Thu, 22 Jul 2021 08:42:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l7so5014329wrv.7;
 Thu, 22 Jul 2021 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Nu+z5QFs0Fm8/O70BmZv+YFuIofij4u2XkNCungi3Mk=;
 b=BVwnLSA9xIYql+xgfXToAJ3jjM30a/FiE0+Eb41L4A2H4W2A1w5Us55fFcft8gLMvU
 Wn+S39z2Aw2pZxYFMZhkr2L8FooqejcvJY43bIAbs6Sq5nmowgp9u056SDju60ajqZk+
 brD5X1/pO9biHszZXGx8NDodTFHzFewJCN5ze/YsI4kqJw/lGuT2tJ1Yp7K/LA+UIRzN
 HVO3AqCvk4G4JHK7UW/qlB5X4d8wH73KCX9QJEb7GwxfThToVHhQSLtCL7+lXrRfEW+R
 1nbQevO1EXodx5Wh+QXrLsvkPXKkyJK0WZrIYGk8QhqhHS/L2LGlc0afyCBG5Hb+2JrH
 jMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nu+z5QFs0Fm8/O70BmZv+YFuIofij4u2XkNCungi3Mk=;
 b=PkMuAfG9sgdShsMkPZsctGGJTkbWMZ3i/tRD3eQ/FbzmxsjMR7JRTJKCsPVgH/E+8y
 peLHAJRrO4tK1MRR3VNnf4ra8i26SOpBrNUVLFWxLFTNmAp7JIwr7fOXYKNs33octyWP
 5sgKvsqyXixIIo9XCNe0PZvwr/sHjji5juu3cY+4G2qs4MSTRKYKDTZwR9oCGZANsBQr
 NEp4UVis1ICyEt4yZ2SPIf1OX0+ioBHxOTTw1tVzmdcWehRArLwHo0OC3SODgTViREYU
 NuCvyznm3wjnc9ncztV3TqefZfWFossfNeWrcnJtNx7pwIoCtrWSD+Evnqrq6+iWXyM0
 eaew==
X-Gm-Message-State: AOAM530tiJhunnpGytYCrkt3xrhfnfhCh/2CJPP/yXI6Ni88WCaZozOE
 rASlL2GvuQiOMrcpWb/LWOw=
X-Google-Smtp-Source: ABdhPJyqe981e+qZ55+DC8CEtC6YUqose6SaJjnH7rf+ZE+VaalwVAVdaOllMkd3SKLHhH5tWUt9ow==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr48016388wrx.268.1626943347365; 
 Thu, 22 Jul 2021 01:42:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b706:b115:9c6f:aeee?
 ([2a02:908:1252:fb60:b706:b115:9c6f:aeee])
 by smtp.gmail.com with ESMTPSA id i15sm31536406wro.3.2021.07.22.01.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 01:42:26 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
Date: Thu, 22 Jul 2021 10:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPhvein5e8do2AR+@phenom.ffwll.local>
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

Am 21.07.21 um 21:03 schrieb Daniel Vetter:
> On Wed, Jul 21, 2021 at 09:34:43AM -0700, Rob Clark wrote:
>> On Wed, Jul 21, 2021 at 12:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrote:
>>>> On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>> On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wrote:
>>>>>> On Tue, Jul 20, 2021 at 11:03 AM Christian König
>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>> Hi Rob,
>>>>>>>
>>>>>>> Am 20.07.21 um 17:07 schrieb Rob Clark:
>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>
>>>>>>>> Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
>>>>>>>> one noticed.  Oops.
>>>>>>>
>>>>>>> I'm not sure if that is a good idea.
>>>>>>>
>>>>>>> The dma_fence->wait() callback is pretty much deprecated and should not
>>>>>>> be used any more.
>>>>>>>
>>>>>>> What exactly do you need that for?
>>>>>> Well, the alternative is to track the set of fences which have
>>>>>> signalling enabled, and then figure out which ones to signal, which
>>>>>> seems like a lot more work, vs just re-purposing the wait
>>>>>> implementation we already have for non-dma_fence cases ;-)
>>>>>>
>>>>>> Why is the ->wait() callback (pretty much) deprecated?
>>>>> Because if you need it that means for your driver dma_fence_add_cb is
>>>>> broken, which means a _lot_ of things don't work. Like dma_buf poll
>>>>> (compositors have patches to start using that), and I think
>>>>> drm/scheduler also becomes rather unhappy.
>>>> I'm starting to page back in how this works.. fence cb's aren't broken
>>>> (which is also why dma_fence_wait() was not completely broken),
>>>> because in retire_submits() we call
>>>> dma_fence_is_signaled(submit->hw_fence).
>>>>
>>>> But the reason that the custom wait function cleans up a tiny bit of
>>>> jank is that the wait_queue_head_t gets signaled earlier, before we
>>>> start iterating the submits and doing all that retire_submit() stuff
>>>> (unpin/unref bo's, etc).  I suppose I could just split things up to
>>>> call dma_fence_signal() earlier, and *then* do the retire_submits()
>>>> stuff.
>>> Yeah reducing the latency there sounds like a good idea.
>>> -Daniel
>>>
>> Hmm, no, turns out that isn't the problem.. or, well, it is probably a
>> good idea to call drm_fence_signal() earlier.  But it seems like
>> waking up from wait_event_* is faster than wake_up_state(wait->task,
>> TASK_NORMAL).  I suppose the wake_up_state() approach still needs for
>> the scheduler to get around to schedule the runnable task.

As far as I know wake_up_state() tries to run the thread on the CPU it 
was scheduled last, while wait_event_* makes the thread run on the CPU 
who issues the wake by default.

And yes I've also noticed this already and it was one of the reason why 
I suggested to use a wait_queue instead of the hand wired dma_fence_wait 
implementation.

>>
>> So for now, I'm going back to my own wait function (plus earlier
>> drm_fence_signal())
>>
>> Before removing dma_fence_opps::wait(), I guess we want to re-think
>> dma_fence_default_wait().. but I think that would require a
>> dma_fence_context base class (rather than just a raw integer).
> Uh that's not great ... can't we fix this instead of papering over it in
> drivers? Aside from maybe different wakeup flags it all is supposed to
> work exactly the same underneath, and whether using a wait queue or not
> really shouldn't matter.

Well it would have been nicer if we used the existing infrastructure 
instead of re-inventing stuff for dma_fence, but that chance is long gone.

And you don't need a dma_fence_context base class, but rather just a 
flag in the dma_fence_ops if you want to change the behavior.

Regards,
Christian.

> -Daniel
>
>> BR,
>> -R
>>
>>>> BR,
>>>> -R
>>>>
>>>>> It essentially exists only for old drivers where ->enable_signalling
>>>>> is unreliable and we paper over that with a retry loop in ->wait and
>>>>> pray no one notices that it's too butchered. The proper fix is to have
>>>>> a driver thread to guarantee that ->enable_signalling works reliable,
>>>>> so you don't need a ->wait.
>>>>>
>>>>> Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
>>>>> this in please?
>>>>> -Daniel
>>>>>
>>>>>> BR,
>>>>>> -R
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Note that this removes the !timeout case, which has not been used in
>>>>>>>> a long time.
>>>>>>>
>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++--------------
>>>>>>>>    1 file changed, 34 insertions(+), 25 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
>>>>>>>> index cd59a5918038..8ee96b90ded6 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/msm_fence.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_fence.c
>>>>>>>> @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
>>>>>>>>        return (int32_t)(fctx->completed_fence - fence) >= 0;
>>>>>>>>    }
>>>>>>>>
>>>>>>>> -/* legacy path for WAIT_FENCE ioctl: */
>>>>>>>> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>>>>>>>> -             ktime_t *timeout, bool interruptible)
>>>>>>>> +static signed long wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>>>>>>>> +             signed long remaining_jiffies, bool interruptible)
>>>>>>>>    {
>>>>>>>> -     int ret;
>>>>>>>> +     signed long ret;
>>>>>>>>
>>>>>>>>        if (fence > fctx->last_fence) {
>>>>>>>>                DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
>>>>>>>> @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>>>>>>>>                return -EINVAL;
>>>>>>>>        }
>>>>>>>>
>>>>>>>> -     if (!timeout) {
>>>>>>>> -             /* no-wait: */
>>>>>>>> -             ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
>>>>>>>> +     if (interruptible) {
>>>>>>>> +             ret = wait_event_interruptible_timeout(fctx->event,
>>>>>>>> +                     fence_completed(fctx, fence),
>>>>>>>> +                     remaining_jiffies);
>>>>>>>>        } else {
>>>>>>>> -             unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
>>>>>>>> -
>>>>>>>> -             if (interruptible)
>>>>>>>> -                     ret = wait_event_interruptible_timeout(fctx->event,
>>>>>>>> -                             fence_completed(fctx, fence),
>>>>>>>> -                             remaining_jiffies);
>>>>>>>> -             else
>>>>>>>> -                     ret = wait_event_timeout(fctx->event,
>>>>>>>> -                             fence_completed(fctx, fence),
>>>>>>>> -                             remaining_jiffies);
>>>>>>>> -
>>>>>>>> -             if (ret == 0) {
>>>>>>>> -                     DBG("timeout waiting for fence: %u (completed: %u)",
>>>>>>>> -                                     fence, fctx->completed_fence);
>>>>>>>> -                     ret = -ETIMEDOUT;
>>>>>>>> -             } else if (ret != -ERESTARTSYS) {
>>>>>>>> -                     ret = 0;
>>>>>>>> -             }
>>>>>>>> +             ret = wait_event_timeout(fctx->event,
>>>>>>>> +                     fence_completed(fctx, fence),
>>>>>>>> +                     remaining_jiffies);
>>>>>>>> +     }
>>>>>>>> +
>>>>>>>> +     if (ret == 0) {
>>>>>>>> +             DBG("timeout waiting for fence: %u (completed: %u)",
>>>>>>>> +                             fence, fctx->completed_fence);
>>>>>>>> +             ret = -ETIMEDOUT;
>>>>>>>> +     } else if (ret != -ERESTARTSYS) {
>>>>>>>> +             ret = 0;
>>>>>>>>        }
>>>>>>>>
>>>>>>>>        return ret;
>>>>>>>>    }
>>>>>>>>
>>>>>>>> +/* legacy path for WAIT_FENCE ioctl: */
>>>>>>>> +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>>>>>>>> +             ktime_t *timeout, bool interruptible)
>>>>>>>> +{
>>>>>>>> +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout), interruptible);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    /* called from workqueue */
>>>>>>>>    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>>>>>>>>    {
>>>>>>>> @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence *fence)
>>>>>>>>        return fence_completed(f->fctx, f->base.seqno);
>>>>>>>>    }
>>>>>>>>
>>>>>>>> +static signed long msm_fence_wait(struct dma_fence *fence, bool intr,
>>>>>>>> +             signed long timeout)
>>>>>>>> +{
>>>>>>>> +     struct msm_fence *f = to_msm_fence(fence);
>>>>>>>> +
>>>>>>>> +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    static const struct dma_fence_ops msm_fence_ops = {
>>>>>>>>        .get_driver_name = msm_fence_get_driver_name,
>>>>>>>>        .get_timeline_name = msm_fence_get_timeline_name,
>>>>>>>>        .signaled = msm_fence_signaled,
>>>>>>>> +     .wait = msm_fence_wait,
>>>>>>>>    };
>>>>>>>>
>>>>>>>>    struct dma_fence *
>>>>>
>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> http://blog.ffwll.ch
>>>
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch

