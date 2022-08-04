Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE5589FF6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B025CA22CE;
	Thu,  4 Aug 2022 17:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216D9A2050;
 Thu,  4 Aug 2022 17:32:50 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id v185so194205ioe.11;
 Thu, 04 Aug 2022 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZQf4XnBOCJB+vfAUnlzSwte/cUU8bNUatf6/Q8jOgEg=;
 b=jpJNn4uLeRXOgYq2sOuJhfouM6NXGvrYP/ciqu+C1dEv8Ch9RTeh8d36GTYbPmery4
 YPHeKo3EBsBL8wYh6OU1klWoV6E2JHKHqkj9MY32X4tnZjm9yDPqYpcl/bm9XTxH/RKY
 9H+1RyOckouKnvkStdM+hA8mVWt6KY8oFYHH5lOMoLg8V8eSFtBIv1i5ntmYfKKD6Kif
 ctmsJpuoPRiS5GnZnO7uil5A32DiFAWEUN1DRp5TyaSInoFyDT68uz2TpPtEfFub8wqn
 qCovJNGdPNUPHJN1zvaEB+vRABBMQr7pQXhXW+iKugKjiPfiYAoF1k+IxBInGDKboBZm
 Exxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZQf4XnBOCJB+vfAUnlzSwte/cUU8bNUatf6/Q8jOgEg=;
 b=aHWYwTMDCslNJFTvZ2e9/XbMgb1YIlMcOsWUX7fQvSrQK2vtHXUmyt3EgAYWx95Lgv
 7d3oYNnlizLCjG/9yjgwf815jUSWpHELtgULrm+PsuoGRjXNylpMwBJr7fcwWAWQs3K8
 uvEDuqVTCf8ZzAn9TeWumUr9xPUPvklK07qTZvHK6b7NzPpIponhBzeuO/tPryXa77mV
 PM/FFls6xG0w9bJaVA0VUds2lcXdw7CRCroTbb2XlJQLkJsu/yZ6886if8Rx13CIRB5Q
 2FIWttTfohERloKdI8fcGHI/SiRbGSVEemyL7ieRnDqE+vSDYYgn0T8AAwWmudm86VTL
 hdqQ==
X-Gm-Message-State: ACgBeo2C0/vBWg/7Dg56HW7jebYLEF6LgFpXOAqC6Thy6DYvVYCGig00
 lYss2dqiyUEZ6BAHxt3YTZXHfrTBC4XKUK+sAZs=
X-Google-Smtp-Source: AA6agR7l+0CbFrUgBA7wD4UHjdEAojTPkkSEOy0SRKRZdOZG7J7o6ZyxuIxXmVlYDjjCoFMxBCQ95tMMlKSldAZtRrE=
X-Received: by 2002:a02:9622:0:b0:342:86af:7506 with SMTP id
 c31-20020a029622000000b0034286af7506mr1287121jai.311.1659634369569; Thu, 04
 Aug 2022 10:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220803172302.1976981-1-robdclark@gmail.com>
 <c80d70b6-a7ad-5900-ea7a-f0f2157e4a40@quicinc.com>
 <CAF6AEGuDajmv=bnQ9hNgCbkB8ubpFhhoFZVL4881O=2B9xh+_Q@mail.gmail.com>
 <7f7bd85a-2444-1939-4ac8-dbf2685eaf24@quicinc.com>
In-Reply-To: <7f7bd85a-2444-1939-4ac8-dbf2685eaf24@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Aug 2022 10:33:16 -0700
Message-ID: <CAF6AEGv8sYG=72ne4wMx_OQwWOUkx88fYdKM2EEszdmYzOrg1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Move hangcheck timer restart
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 12:53 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 8/4/2022 1:59 AM, Rob Clark wrote:
> > On Wed, Aug 3, 2022 at 12:52 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >> On 8/3/2022 10:53 PM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Don't directly restart the hangcheck timer from the timer handler, but
> >>> instead start it after the recover_worker replays remaining jobs.
> >>>
> >>> If the kthread is blocked for other reasons, there is no point to
> >>> immediately restart the timer.  Fixes a random symptom of the problem
> >>> fixed in the next patch.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/msm_gpu.c | 14 +++++++++-----
> >>>    1 file changed, 9 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> >>> index fba85f894314..8f9c48eabf7d 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>> @@ -328,6 +328,7 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
> >>>    }
> >>>
> >>>    static void retire_submits(struct msm_gpu *gpu);
> >>> +static void hangcheck_timer_reset(struct msm_gpu *gpu);
> >>>
> >>>    static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
> >>>    {
> >>> @@ -420,6 +421,8 @@ static void recover_worker(struct kthread_work *work)
> >>>        }
> >>>
> >>>        if (msm_gpu_active(gpu)) {
> >>> +             bool restart_hangcheck = false;
> >>> +
> >>>                /* retire completed submits, plus the one that hung: */
> >>>                retire_submits(gpu);
> >>>
> >>> @@ -436,10 +439,15 @@ static void recover_worker(struct kthread_work *work)
> >>>                        unsigned long flags;
> >>>
> >>>                        spin_lock_irqsave(&ring->submit_lock, flags);
> >>> -                     list_for_each_entry(submit, &ring->submits, node)
> >>> +                     list_for_each_entry(submit, &ring->submits, node) {
> >>>                                gpu->funcs->submit(gpu, submit);
> >>> +                             restart_hangcheck = true;
> >>> +                     }
> >>>                        spin_unlock_irqrestore(&ring->submit_lock, flags);
> >>>                }
> >>> +
> >>> +             if (restart_hangcheck)
> >>> +                     hangcheck_timer_reset(gpu);
> >>>        }
> >>>
> >>>        mutex_unlock(&gpu->lock);
> >>> @@ -515,10 +523,6 @@ static void hangcheck_handler(struct timer_list *t)
> >>>                kthread_queue_work(gpu->worker, &gpu->recover_work);
> >>>        }
> >>>
> >>> -     /* if still more pending work, reset the hangcheck timer: */
> >> In the scenario mentioned here, shouldn't we restart the timer?
> > yeah, actually the case where we don't want to restart the timer is
> > *only* when we schedule recover_work..
> >
> > BR,
> > -R
> Not sure if your codebase is different but based on msm-next branch,
> when "if (fence != ring->hangcheck_fence)" is true, we now skip
> rescheduling the timer. I don't think that is what we want. There should
> be a hangcheck timer running as long as there is an active submit,
> unless we have scheduled a recover_work here.
>

right, v2 will change that to only skip rescheduling the timer in the
recover path

BR,
-R

> -Akhil.
> >
> >> -Akhil.
> >>> -     if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
> >>> -             hangcheck_timer_reset(gpu);
> >>> -
> >>>        /* workaround for missing irq: */
> >>>        msm_gpu_retire(gpu);
> >>>    }
> >>>
>
