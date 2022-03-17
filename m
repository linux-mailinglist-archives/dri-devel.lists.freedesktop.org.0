Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353164DCF66
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 21:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0730E10E0FE;
	Thu, 17 Mar 2022 20:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DFD10E0FE;
 Thu, 17 Mar 2022 20:34:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r6so8965562wrr.2;
 Thu, 17 Mar 2022 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oAJskbyEigMdhBrsDXA46H1CUC1pPQdTRwKfHPvXIas=;
 b=oEuQwf0ZJEDJhu8J1bZy27VFNh9RTbpoxCpXlLqPKAKn3B15kctg+ZElkzMvVNBO/G
 jmk1g9sEzQzLPFBeeHRtC+MLHsCsONYHw8KxMsxbw/qY9mwHI7Q/5RVrf2OeST4xfhag
 wrlEDUVW0IEWEnx/QLYdTzBzlCzzM9nOOKgnSVZuI32zuH1S88VOgiqgAfCB1gWIWbXV
 Dd2t5WHRu0OVM98lu12IpylTrtWrm23fZctxUrZ/MlRNg+8X96UkK8R3FgTaNGg6iHzd
 0XdTRSNq2ltJoZ+Rqh+TDQLhbfu2W4l9A3nFnQ1LprPdLMABczJYh4f5wcdegRfsYCxj
 NwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oAJskbyEigMdhBrsDXA46H1CUC1pPQdTRwKfHPvXIas=;
 b=2zxbbw/Qkds7BYoqSxZxxqN70O6X0OH2V4PjkF4QoEy4QZj8e0UrGxNolfHW5NGWse
 mnhYENno8cGF1xTkS3KF7aDP+UWKBKOx4hLSN68WKVgNYr+Bn0ecQi4DPIWUPsk632PM
 MS23rI6GE00IOWgcBP7yJF5/a9hcUWlNEb6xG3nWank7RBkQaAYCz6yhcVkFyntE9Urp
 4sC5FqAoNMjoyWjyIbujyLcufdNpCr4aHREiqixFMS1GDeoIMmRa8mafxhh9s7ia5Nqu
 sajW+oHrMH9N9Vg7+uLifZpizBISrSZ+AzKdjdWF1wYrDxNIA7KS/Om6mVn+RXZZLVxh
 YSoA==
X-Gm-Message-State: AOAM532gm9+Q81vOGe32XlCYBUlEVdxWzr39X4AUcMYwmcyiGndHtZzx
 1kWsNSEYvSjEOkvkNJuAJgSrwFOM8K4uncFcQlI=
X-Google-Smtp-Source: ABdhPJwz5D+6OUjG940PblL2Vpl7ISgIXGVQbVtLxJ7YGpXTqYORj6Uj/qjxIpnX1B77gaN0lujSYyp7JNozZoY/KaY=
X-Received: by 2002:a05:6000:170c:b0:203:df21:742c with SMTP id
 n12-20020a056000170c00b00203df21742cmr5544567wrc.574.1647549282639; Thu, 17
 Mar 2022 13:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
 <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
 <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
In-Reply-To: <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 13:35:24 -0700
Message-ID: <CAF6AEGuw45gi4f+mVs7cVyjCHY9O4N1O8OfuGHv-wAkzP3UpMA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 12:50 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2022-03-17 14:25, Rob Clark wrote:
> > On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >> On 2022-03-17 13:35, Rob Clark wrote:
> >>> On Thu, Mar 17, 2022 at 9:45 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
> >>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
> >>>>>>> [SNIP]
> >>>>>>> userspace frozen !=3D kthread frozen .. that is what this patch i=
s
> >>>>>>> trying to address, so we aren't racing between shutting down the =
hw
> >>>>>>> and the scheduler shoveling more jobs at us.
> >>>>>> Well exactly that's the problem. The scheduler is supposed to shov=
eling
> >>>>>> more jobs at us until it is empty.
> >>>>>>
> >>>>>> Thinking more about it we will then keep some dma_fence instance
> >>>>>> unsignaled and that is and extremely bad idea since it can lead to
> >>>>>> deadlocks during suspend.
> >>>>> Hmm, perhaps that is true if you need to migrate things out of vram=
?
> >>>>> It is at least not a problem when vram is not involved.
> >>>> No, it's much wider than that.
> >>>>
> >>>> See what can happen is that the memory management shrinkers want to =
wait
> >>>> for a dma_fence during suspend.
> >>> we don't wait on fences in shrinker, only purging or evicting things
> >>> that are already ready.  Actually, waiting on fences in shrinker path
> >>> sounds like a pretty bad idea.
> >>>
> >>>> And if you stop the scheduler they will just wait forever.
> >>>>
> >>>> What you need to do instead is to drain the scheduler, e.g. call
> >>>> drm_sched_entity_flush() with a proper timeout for each entity you h=
ave
> >>>> created.
> >>> yeah, it would work to drain the scheduler.. I guess that might be th=
e
> >>> more portable approach as far as generic solution for suspend.
> >>>
> >>> BR,
> >>> -R
> >>
> >> I am not sure how this drains the scheduler ? Suppose we done the
> >> waiting in drm_sched_entity_flush,
> >> what prevents someone to push right away another job into the same
> >> entity's queue  right after that ?
> >> Shouldn't we first disable further pushing of jobs into entity before =
we
> >> wait for  sched->job_scheduled ?
> >>
> > In the system suspend path, userspace processes will have already been
> > frozen, so there should be no way to push more jobs to the scheduler,
> > unless they are pushed from the kernel itself.
>
>
> It was my suspicion but I wasn't sure about it.
>
>
> > We don't do that in
> > drm/msm, but maybe you need to to move things btwn vram and system
> > memory?
>
>
> Exactly, that was my main concern - if we use this method we have to use
> it in a point in
> suspend sequence when all the in kernel job submissions activity already
> suspended
>
> > But even in that case, if the # of jobs you push is bounded I
> > guess that is ok?
>
> Submissions to scheduler entities are using unbounded queue, the bounded
> part is when
> you extract next job from entity to submit to HW ring and it rejects if
> submission limit reached (drm_sched_ready)
>
> In general - It looks to me at least that what we what we want her is
> more of a drain operation then flush (i.e.
> we first want to disable any further job submission to entity's queue
> and then flush all in flight ones). As example
> for this i was looking at  flush_workqueue vs. drain_workqueue

Would it be possible for amdgpu to, in the system suspend task,

1) first queue up all the jobs needed to migrate bos out of vram, and
whatever other housekeeping jobs are needed
2) then drain gpu scheduler's queues
3) and then finally wait for jobs executing on GPU to complete

BR,
-R

> Andrey
>
>
> >
> > BR,
> > -R
