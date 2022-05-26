Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8D534951
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 05:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CCA10E859;
	Thu, 26 May 2022 03:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B21E10E859;
 Thu, 26 May 2022 03:37:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e2so568308wrc.1;
 Wed, 25 May 2022 20:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jC2VSU9zXkGEFuh8r73Q3Ivw+kwZ8g9v3xCeKOhr24Y=;
 b=ebIGEiLNFDuQgi88XYOfm8Wtebsd2FCkAlmj2OjmfHbZiAPU8gHUOcb3K0KX/8dQar
 KSqFSlb+XoqVKUlH97u9miY4LPLQPM1Qtjusv8LfASU7q2mNbTElIVM6aOL5HsrK69MQ
 xqHipXQQQ5BoN61jBFWbi/umNH2Pr8gH/phKCQbDgR9gGGLO2d203hEcMXlXtmIe/Z3e
 EJlfaSWVH/t3T5AhBMvM0H3FRWBWHumA+d+lZ0CXdJquuwXpN70PrTppQ//z9bOg9gnP
 2i2e9sUHklzlBpgcomYk44NGiB0V+VThaBvo86sMyHkX/8ANHOFT5yu1jhdQY5+LATnK
 coaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jC2VSU9zXkGEFuh8r73Q3Ivw+kwZ8g9v3xCeKOhr24Y=;
 b=Wj6pQI3jKoHBaP7l1hFKfXrjntaQ/dKdvB4i1YrtLLHCZ/B/cwg5hJ7Dfsm+dDdWIY
 W9yiE4mY7Cik1Q1RlIyoTPIQgyX2LMHa+jzNMvEzr8NrH/QwKgsd4uqO/no4Q2z71QgV
 mKyDYOfIM5sscUpBU1NqmcwQF+k5LOCJbNHsyoKb5hhHCtJjijoyTpJISHd+xXuQ8Kse
 EPmDQYuam3CmpPUVf1Yt8hfZXWOGnRBeJDpLLZXqOTevtRXG9of+Yutgwo/eblYFzlm/
 80Vj//1krD9NDWW1BUVXiYdbB0o618i0vvwTJCOgG7huLsKziE9opgZ7LHlCtvr6yr/U
 QqWQ==
X-Gm-Message-State: AOAM530Sh9CnIg2EojS7/uo9SQ1VEnBM8bw1owaKizVH21cAg2WzVY1m
 kiRsDyIBEZOSkCmogb+QSfMlhUvbi3XmRP9qxVQ=
X-Google-Smtp-Source: ABdhPJyJ9gdeTDk7SjVsG8UUGtu6A0tUkYXUKX3JaRXB6ZJR3RBhBnerFejeMQFCxWdyyUoxKBnLKhL/b8HteRYU93c=
X-Received: by 2002:adf:fb0d:0:b0:20d:97e:17ce with SMTP id
 c13-20020adffb0d000000b0020d097e17cemr30260195wrr.585.1653536269648; Wed, 25
 May 2022 20:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
 <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com>
 <CAF6AEGs_+mhY9x1HG=jHmpwGU6jUS1G4mF6bJCd3yN0JRhocsQ@mail.gmail.com>
 <046f2d0f-5e61-7d24-1b40-006f2377c974@linux.intel.com>
In-Reply-To: <046f2d0f-5e61-7d24-1b40-006f2377c974@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 25 May 2022 20:37:47 -0700
Message-ID: <CAF6AEGtcZ=rcVeFCRdj2gF0=4OV0B4EJ51FuZY0sge3EEgSgzg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 9:22 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 25/05/2022 14:41, Rob Clark wrote:
> > On Wed, May 25, 2022 at 2:46 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 24/05/2022 15:50, Rob Clark wrote:
> >>> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>> On 23/05/2022 23:53, Rob Clark wrote:
> >>>>> On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
> >>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> Hi Rob,
> >>>>>>
> >>>>>> On 28/07/2021 02:06, Rob Clark wrote:
> >>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>
> >>>>>>> The drm/scheduler provides additional prioritization on top of th=
at
> >>>>>>> provided by however many number of ringbuffers (each with their o=
wn
> >>>>>>> priority level) is supported on a given generation.  Expose the
> >>>>>>> additional levels of priority to userspace and map the userspace
> >>>>>>> priority back to ring (first level of priority) and schedular pri=
ority
> >>>>>>> (additional priority levels within the ring).
> >>>>>>>
> >>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
> >>>>>>>      drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
> >>>>>>>      drivers/gpu/drm/msm/msm_gpu.h           | 58 +++++++++++++++=
+++++++++-
> >>>>>>>      drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
> >>>>>>>      include/uapi/drm/msm_drm.h              | 14 +++++-
> >>>>>>>      5 files changed, 88 insertions(+), 27 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gp=
u/drm/msm/adreno/adreno_gpu.c
> >>>>>>> index bad4809b68ef..748665232d29 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>>>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uin=
t32_t param, uint64_t *value)
> >>>>>>>                          return ret;
> >>>>>>>                  }
> >>>>>>>                  return -EINVAL;
> >>>>>>> -     case MSM_PARAM_NR_RINGS:
> >>>>>>> -             *value =3D gpu->nr_rings;
> >>>>>>> +     case MSM_PARAM_PRIORITIES:
> >>>>>>> +             *value =3D gpu->nr_rings * NR_SCHED_PRIORITIES;
> >>>>>>>                  return 0;
> >>>>>>>          case MSM_PARAM_PP_PGTABLE:
> >>>>>>>                  *value =3D 0;
> >>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/d=
rm/msm/msm_gem_submit.c
> >>>>>>> index 450efe59abb5..c2ecec5b11c4 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> >>>>>>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(str=
uct drm_device *dev,
> >>>>>>>          submit->gpu =3D gpu;
> >>>>>>>          submit->cmd =3D (void *)&submit->bos[nr_bos];
> >>>>>>>          submit->queue =3D queue;
> >>>>>>> -     submit->ring =3D gpu->rb[queue->prio];
> >>>>>>> +     submit->ring =3D gpu->rb[queue->ring_nr];
> >>>>>>>          submit->fault_dumped =3D false;
> >>>>>>>
> >>>>>>>          INIT_LIST_HEAD(&submit->node);
> >>>>>>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *d=
ev, void *data,
> >>>>>>>          /* Get a unique identifier for the submission for loggin=
g purposes */
> >>>>>>>          submitid =3D atomic_inc_return(&ident) - 1;
> >>>>>>>
> >>>>>>> -     ring =3D gpu->rb[queue->prio];
> >>>>>>> +     ring =3D gpu->rb[queue->ring_nr];
> >>>>>>>          trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
> >>>>>>>                  args->nr_bos, args->nr_cmds);
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/=
msm_gpu.h
> >>>>>>> index b912cacaecc0..0e4b45bff2e6 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>>>>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
> >>>>>>>          const char *name;
> >>>>>>>      };
> >>>>>>>
> >>>>>>> +/*
> >>>>>>> + * The number of priority levels provided by drm gpu scheduler. =
 The
> >>>>>>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially=
 in some
> >>>>>>> + * cases, so we don't use it (no need for kernel generated jobs)=
.
> >>>>>>> + */
> >>>>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_S=
CHED_PRIORITY_MIN)
> >>>>>>> +
> >>>>>>> +/**
> >>>>>>> + * msm_gpu_convert_priority - Map userspace priority to ring # a=
nd sched priority
> >>>>>>> + *
> >>>>>>> + * @gpu:        the gpu instance
> >>>>>>> + * @prio:       the userspace priority level
> >>>>>>> + * @ring_nr:    [out] the ringbuffer the userspace priority maps=
 to
> >>>>>>> + * @sched_prio: [out] the gpu scheduler priority level which the=
 userspace
> >>>>>>> + *              priority maps to
> >>>>>>> + *
> >>>>>>> + * With drm/scheduler providing it's own level of prioritization=
, our total
> >>>>>>> + * number of available priority levels is (nr_rings * NR_SCHED_P=
RIORITIES).
> >>>>>>> + * Each ring is associated with it's own scheduler instance.  Ho=
wever, our
> >>>>>>> + * UABI is that lower numerical values are higher priority.  So =
mapping the
> >>>>>>> + * single userspace priority level into ring_nr and sched_prio t=
akes some
> >>>>>>> + * care.  The userspace provided priority (when a submitqueue is=
 created)
> >>>>>>> + * is mapped to ring nr and scheduler priority as such:
> >>>>>>> + *
> >>>>>>> + *   ring_nr    =3D userspace_prio / NR_SCHED_PRIORITIES
> >>>>>>> + *   sched_prio =3D NR_SCHED_PRIORITIES -
> >>>>>>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
> >>>>>>> + *
> >>>>>>> + * This allows generations without preemption (nr_rings=3D=3D1) =
to have some
> >>>>>>> + * amount of prioritization, and provides more priority levels f=
or gens
> >>>>>>> + * that do have preemption.
> >>>>>>
> >>>>>> I am exploring how different drivers handle priority levels and th=
is
> >>>>>> caught my eye.
> >>>>>>
> >>>>>> Is the implication of the last paragraphs that on hw with nr_rings=
 > 1,
> >>>>>> ring + 1 preempts ring?
> >>>>>
> >>>>> Other way around, at least from the uabi standpoint.  Ie. ring[0]
> >>>>> preempts ring[1]
> >>>>
> >>>> Ah yes, I figure it out from the comments but then confused myself w=
hen
> >>>> writing the email.
> >>>>
> >>>>>> If so I am wondering does the "spreading" of
> >>>>>> user visible priorities by NR_SCHED_PRIORITIES creates a non-preem=
ptable
> >>>>>> levels within every "bucket" or how does that work?
> >>>>>
> >>>>> So, preemption is possible between any priority level before run_jo=
b()
> >>>>> gets called, which writes the job into the ringbuffer.  After that
> >>>>
> >>>> Hmm how? Before run_job() the jobs are not runnable, sitting in the
> >>>> scheduler queues, right?
> >>>
> >>> I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A on
> >>> prio[1] could be executed after submit B on prio[2] provided that
> >>> run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
> >>> preemption because the submit hasn't started running on the GPU yet.
> >>> But rather just scheduling according to priority.
> >>>
> >>>>> point, you only have "bucket" level preemption, because
> >>>>> NR_SCHED_PRIORITIES levels of priority get mapped to a single FIFO
> >>>>> ringbuffer.
> >>>>
> >>>> Right, and you have one GPU with four rings, which means you expose =
12
> >>>> priority levels to userspace, did I get that right?
> >>>
> >>> Correct
> >>>
> >>>> If so how do you convey in the ABI that not all there priority level=
s
> >>>> are equal? Like userspace can submit at prio 4 and expect prio 3 to
> >>>> preempt, as would prio 2 preempt prio 3. While actual behaviour will=
 not
> >>>> match - 3 will not preempt 4.
> >>>
> >>> It isn't really exposed to userspace, but perhaps it should be..
> >>> Userspace just knows that, to the extent possible, the kernel will tr=
y
> >>> to execute prio 3 before prio 4.
> >>>
> >>>> Also, does your userspace stack (EGL/Vulkan) use the priorities? I h=
ad a
> >>>> quick peek in Mesa but did not spot it - although I am not really at
> >>>> home there yet so maybe I missed it.
> >>>
> >>> Yes, there is an EGL extension:
> >>>
> >>> https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_p=
riority.txt
> >>>
> >>> It is pretty limited, it only exposes three priority levels.
> >>
> >> Right, is that wired up on msm? And if it is, or could be, how do/woul=
d
> >> you map the three priority levels for GPUs which expose 3 priority
> >> levels versus the one which exposes 12?
> >
> > We don't yet, but probably should, expose a cap to indicate to
> > userspace the # of hw rings vs # of levels of sched priority
>
> What bothers me is the question of whether this setup provides a
> consistent benefit. Why would userspace use other than "real" (hardware)
> priority levels on chips where they are available?

yeah, perhaps we could decide that userspace doesn't really need more
than 3 prio levels, and that on generations which have better
preemption than what drm/sched provides, *only* expose those priority
levels.  I've avoided that so far because it seems wrong for the
kernel to assume that a single EGL extension is all there is when it
comes to userspace context priority.. the other option is to expose
more information to userspace and let it decide.

Honestly, the combination of the fact that a6xx is the first gen
shipping in consumer products with upstream driver (using drm/sched),
and not having had time yet to implement hw preemption for a6xx yet,
means not a whole lot of thought has gone into the current arrangement
;-)

> For instance if you exposed 4 instead of 12 on a respective platform,
> would that be better or worse? Yes you could only map three directly
> drm/sched and one would have to be "fake". Like:
>
> hw prio 0 -> drm/sched 2
> hw prio 1 -> drm/sched 1
> hw prio 2 -> drm/sched 0
> hw prio 3 -> drm/sched 0
>
> Not saying that's nice either. Perhaps the answer is that drm/sched
> needs more flexibility for instance if it wants to be widely used.

I'm not sure what I'd add to drm/sched.. once it calls run_job()
things are out of its hands, so really all it can do is re-order
things prior to calling run_job() according to it's internal priority
levels.  And that is still better than no re-ordering so it adds some
value, even if not complete.

> For instance in i915 uapi we have priority as int -1023 - +1023. And
> matching implementation on some platforms, until the new ones which are
> GuC firmware based, where we need to squash that to low/normal/high.

hmm, that is a more awkward problem, since it sounds like you are
mapping many more priority levels into a much smaller set of hw
priority levels.  Do you have separate drm_sched instances per hw
priority level?  If so you can do the same thing of using drm_sched
priority levels to multiply # of hw priority levels, but ofc that is
not perfect (and won't get you to 2k).

But is there anything that actually *uses* that many levels of priority?

BR,
-R

> So thinking was drm/sched happens to align with GuC. But then we have
> your hw where it doesn't seem to.
>
> Regards,
>
> Tvrtko
>
> >> Is it doable properly without leaking the fact drm/sched internal
> >> implementation detail of three priority levels? Or if you went the oth=
er
> >> way and only exposed up to max 3 levels, then you lose one priority
> >> level your hardware suppose which is also not good.
> >>
> >> It is all quite interesting because your hardware is completely
> >> different from ours in this respect. In our case i915 decides when to
> >> preempt, hardware has no concept of priority (*).
> >
> > It is really pretty much all in firmware.. a6xx is the first gen that
> > could do actual (non-cooperative) preemption (but that isn't
> > implemented yet in upstream driver)
> >
> > BR,
> > -R
> >
> >> Regards,
> >>
> >> Tvrtko
> >>
> >> (*) Almost no concept of priority in hardware - we do have it on new
> >> GPUs and only on a subset of engine classes where render and compute
> >> share the EUs. But I think it's way different from Ardenos.
