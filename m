Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FA9F1455
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97710E249;
	Fri, 13 Dec 2024 17:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LzEc+eAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C5210E249;
 Fri, 13 Dec 2024 17:50:47 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-844e161a957so144527839f.0; 
 Fri, 13 Dec 2024 09:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734112247; x=1734717047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KoT3CdV9DzlGXKlTClGK1n+oQrqyglDEDa5xoQzVrpk=;
 b=LzEc+eAzhXHyK+Qr6H5O3BB8NTmiqK/hn+LDuJOYKDuizY/KXu7SHOsZGk9GYtsrL7
 +PhpWupdOg6kZVxZljLv5AoxsT85OLx5fgDhakhJeQmtTYHX8orejmkbaGewH5XnF91r
 7c1JpWTtfmWAU63LohzRCR4km9hsmsGEbEVwhFpRgmCZHoUh1OBBx++B3JigeeuvjeCJ
 0PaehXL2+k9qrgx2R9TRqDFj+Cy1jmxHHpIeH5QUtxB6AWKlA3N5nVCNVZegoh6xQvOm
 jQMR/pgwW5yeKYPvETPCs7H72iAM8TZzB1jXo68Ncpqs+UBuVpuxj51q245Ob0SuQRft
 8eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734112247; x=1734717047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoT3CdV9DzlGXKlTClGK1n+oQrqyglDEDa5xoQzVrpk=;
 b=qAqO6BgWEE7tvHncmCF6yuty0vKDqs18PnmmROGh7LB6pizX8HVf8pLLBW0vcmn4zj
 BKYMdfWg2UpuLQSxjcRuV+oG/gJwYS7XLwGUG2U4CtloRTTp037sK4K537KyGskWIiHj
 1D7Yt/lFeSGHaf2W52ogInoWyoEQRi/43BaiPYe/+HYu57COKj6WZMuiWqt4KjruLRmb
 VnR1RPxaeDnRPWFJ2VQTVmnMIBCMZKE4D8Cr2o6FNi5Ly6Bw6z3AoF2Ve1MM6zgY9Enb
 0cpVwEZl5UZ765iARcm6X+Q/7gjRDLcko2r3nNPTsCS9M6Urs5ASclJdX7qDc2LbtR97
 jZzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEhl/+e+4NjEl4AvcfgKwU4KrJH0qJytp/UTlLKzb5g0hFp2+qwvisLN+Bs1+h0bY61WBDJRflyUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNdALvlOZv14X/ug1nM+QmMP48udh1TjeN6fFEMK4NZoC/WvNq
 FZMnfmj0ETO9xZlZu756iTj9pU4w4gxnnR9Yrgfp0Rq7Alq60jtYvoeX7pz1Dv1Dk8e+bqdz1i/
 l3n7OnI+4k1kAB0gGYuTybsTZ/wc=
X-Gm-Gg: ASbGncuAeu+rA3sp4MlO3/R68D6VUkXaYHnKyoIR8XHu/EfymTewR5CMNjqvmGoESnE
 E4UJHa9JeO2GUcRBHUKrZuiPTjtrEZjB7JZmxrMkKdu7oYUr3qKuy/mmsKidkBA72DntT
X-Google-Smtp-Source: AGHT+IHhbgTLDzEGVC+JxMSDn13inm7KukLU1cnovvUjtiY26cjroUqNsrD7d27uvsZKQiwA1rSWnDmG+OivvDJI+lE=
X-Received: by 2002:a05:6e02:156a:b0:3a7:a3a4:2cb3 with SMTP id
 e9e14a558f8ab-3aff8c92298mr37621935ab.15.1734112246892; Fri, 13 Dec 2024
 09:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
 <CAF6AEGssTcO=qhXPVTd54=jQv8dke=JY0Qm3C96JMKDsgT3==g@mail.gmail.com>
 <7293c3f6-d1d8-4397-8f31-a456cd06c7cb@quicinc.com>
In-Reply-To: <7293c3f6-d1d8-4397-8f31-a456cd06c7cb@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 13 Dec 2024 09:50:35 -0800
Message-ID: <CAF6AEGt1u29Rorf7oYB85xPcO+TdxYzB7aYzMxsxLaYtD8Q7cA@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2024 at 8:47=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/12/2024 10:42 PM, Rob Clark wrote:
> > On Thu, Dec 12, 2024 at 9:08=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Thu, Dec 12, 2024 at 7:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>
> >>> On 12/5/2024 10:24 PM, Rob Clark wrote:
> >>>> From: Rob Clark <robdclark@chromium.org>
> >>>>
> >>>> Performance counter usage falls into two categories:
> >>>>
> >>>> 1. Local usage, where the counter configuration, start, and end read
> >>>>    happen within (locally to) a single SUBMIT.  In this case, there =
is
> >>>>    no dependency on counter configuration or values between submits,=
 and
> >>>>    in fact counters are normally cleared on context switches, making=
 it
> >>>>    impossible to rely on cross-submit state.
> >>>>
> >>>> 2. Global usage, where a single privilaged daemon/process is samplin=
g
> >>>>    counter values across all processes for profiling.
> >>>>
> >>>> The two categories are mutually exclusive.  While you can have many
> >>>> processes making local counter usage, you cannot combine global and
> >>>> local usage without the two stepping on each others feet (by changin=
g
> >>>> counter configuration).
>
> As such the HW doesn't have any limitation, unless you run out of
> counters in a group. We just need an arbitration between processes (UMD
> or KMD based).

True.. but is this actually needed?  Are there real-life use-cases?
Or is it just something that someone wrote down in a requirements
document because they could?

An app _can_ query the counters itself, although in isolation they
aren't super useful.  What a user/developer would actually find useful
are the derived counters that the global/system profiler provides.
The local counters are useful to get per-shader cycle counts, but I've
never found myself looking at that _and_ global/system profiler at the
same time.  Getting accurate local counter values involves inserting
extra WFI's breaking the GPU pipelining, making global profiling kinda
useless.

> Also, KGSL exposes an ioctl to directly read the counter with a fixed
> minimal latency. Because inline reads via submission may have huge
> latency spikes based on workload especially when compute shaders are
> involved. Isn't a low latency counter reads desirable in a fullfledged
> system profiler?

For system profiler, we read back the counters from the cpu[1].
Although we might need to revisit that for android.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/perf=
cntrs/freedreno_dt.c?ref_type=3Dheads#L223

> >>>>
> >>>> For global counter usage, there is already a SYSPROF param (since gl=
obal
> >>>> counter usage requires disabling counter clearing on context switch)=
.
> >>>> This patch adds a REQ_CNTRS param to request local counter usage.  I=
f
> >>>> one or more processes has requested counter usage, then a SYSPROF
> >>>> request will fail with -EBUSY.  And if SYSPROF is active, then REQ_C=
NTRS
> >>>> will fail with -EBUSY, maintaining the mutual exclusivity.
> >>>>
> >>>> This is purely an advisory interface to help coordinate userspace.
> >>>> There is no real means of enforcement, but the worst that can happen=
 if
> >>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> >>>> profiling data.
> >>>>
> >>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>> ---
> >>>> kgsl takes a different approach, which involves a lot more UABI for
> >>>> assigning counters to different processes.  But I think by taking
> >>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
> >>>> counters they need in each SUBMIT, for their respective gl/vk perf-
> >>>> counter extensions, we can take this simpler approach.
> >>>
> >>> KGSL's approach is preemption and ifpc safe (also whatever HW changes
> >>> that will come up in future generations). How will we ensure that her=
e?
> >>>
> >>> I have plans to bring up IFPC support in near future. Also, I brought=
 up
> >>> this point during preemption series. But from the responses, I felt t=
hat
> >>> profiling was not considered a serious usecase. Still I wonder how th=
e
> >>> perfcounter extensions work accurately with preemption.
> >>
> >> Re: IFPC, I think initially we have to inhibit IFPC when SYSPROF is ac=
tive
> >>
> >> Longer term, I think we want to just save and restore all of the SEL
> >> regs as well as the counters themselves on preemption.  AFAIU
> >> currently only the counters themselves are saved/restored.  But there
> >> is only one 32b SEL reg for each 64b counter, so I'm not sure that you
> >> save that many cycles by not just saving/restoring the SEL regs as
> >> well.  (And of course with REQ_CNTRS the kernel knows which processes
> >> need counter save/restore and which do not, so you are only taking the
> >> extra context switch overhead if a process is actually using the
> >> perfcntrs.)
> >
> > Actually I'm maybe blending two different, but similar cases.
> > PREAMBLE/POSTAMBLE, I think, cover us for preemption
> >
> > For IFPC, we'd need a way to tell GMU that SYSPROF is active, so it
> > could save/restore all the counters and selectors  (IFPC shouldn't
> > matter for local profiling / REQ_CNTRS case, since you wouldn't go
> > into IFPC mid-submit.)
> >
> > BR,
> > -R
> >
> >> Alternatively, I think we could just declare this as a userspace
> >> problem, and solve it with CP_SET_AMBLE PREAMBLE/POSTAMBLE?
> >>
> >> Just for background, rendernode UABI is exposed to all processes that
> >> can use the GPU, ie. basically everything.  Which makes it an
> >> attractive attack surface.  This is why I prefer minimalism when it
> >> comes to UABI, and not adding new ioctls and complexity in the kernel
> >> when it is not essential ;-)
>
> I fully agree with you about maintaining minimalism in KMD. Here all we
> need is a way for UMD to ask "give me a counter offset with 'x'
> countable from 'y' group". And let KMD do the arbitration of counters
> between userspace processes and also within KMD. And we can cut down on
> some of the related things present in kgsl which are unnecessary at the
> moment.

I'm not completely ruling it out.. just trying to figure out if we
actually need it.  Maybe android forces us to switch to something
other than devmem for reading counters?  That is the most plausible
reason I could think of to add UABI for this.

(OTOH we could alternatively just give privileged userspace a way to
mmap the mmio for percntrs via drm instead of devmem)

> More importantly, I am not sure if we should really fight hard against
> something that is basically an architectur spec. Future HW evolution
> happens based on this architecture. So is it really wise to build things
> in the opposite direction. FYI, all other GPU KMD drivers which Qcom
> uses are aligned on this.

Sure, but future hw is going to need future userspace.  It isn't
really problematic to introduce a new UABI for future hw, because
there is no "new kernel + old userspace" scenario.

BR,
-R

> -Akhil
>
> >>
> >> BR,
> >> -R
> >>
> >>> -Akhil
> >>>
> >>>>
> >>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> >>>>  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> >>>>  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> >>>>  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> >>>>  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++=
++-
> >>>>  include/uapi/drm/msm_drm.h              |  1 +
> >>>>  6 files changed, 85 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/d=
rm/msm/adreno/adreno_gpu.c
> >>>> index 31bbf2c83de4..f688e37059b8 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct=
 msm_file_private *ctx,
> >>>>               if (!capable(CAP_SYS_ADMIN))
> >>>>                       return UERR(EPERM, drm, "invalid permissions")=
;
> >>>>               return msm_file_private_set_sysprof(ctx, gpu, value);
> >>>> +     case MSM_PARAM_REQ_CNTRS:
> >>>> +             return msm_file_private_request_counters(ctx, gpu, val=
ue);
> >>>>       default:
> >>>>               return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-=
>name, param);
> >>>>       }
> >>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm=
_drv.c
> >>>> index 6416d2cb4efc..bf8314ff4a25 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *de=
v, struct drm_file *file)
> >>>>        * It is not possible to set sysprof param to non-zero if gpu
> >>>>        * is not initialized:
> >>>>        */
> >>>> -     if (priv->gpu)
> >>>> +     if (ctx->sysprof)
> >>>>               msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> >>>>
> >>>> +     if (ctx->counters_requested)
> >>>> +             msm_file_private_request_counters(ctx, priv->gpu, 0);
> >>>> +
> >>>>       context_close(ctx);
> >>>>  }
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm=
_gpu.c
> >>>> index 82f204f3bb8f..013b59ca3bb1 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct =
platform_device *pdev,
> >>>>       gpu->nr_rings =3D nr_rings;
> >>>>
> >>>>       refcount_set(&gpu->sysprof_active, 1);
> >>>> +     refcount_set(&gpu->local_counters_active, 1);
> >>>>
> >>>>       return 0;
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm=
_gpu.h
> >>>> index e25009150579..83c61e523b1b 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>> @@ -195,12 +195,28 @@ struct msm_gpu {
> >>>>       int nr_rings;
> >>>>
> >>>>       /**
> >>>> -      * sysprof_active:
> >>>> +      * @sysprof_active:
> >>>>        *
> >>>> -      * The count of contexts that have enabled system profiling.
> >>>> +      * The count of contexts that have enabled system profiling pl=
us one.
> >>>> +      *
> >>>> +      * Note: refcount_t does not like 0->1 transitions.. we want t=
o keep
> >>>> +      * the under/overflow checks that refcount_t provides, but all=
ow
> >>>> +      * multiple on/off transitions so we track the logical value p=
lus one.)
> >>>>        */
> >>>>       refcount_t sysprof_active;
> >>>>
> >>>> +     /**
> >>>> +      * @local_counters_active:
> >>>> +      *
> >>>> +      * The count of contexts that have requested local (intra-subm=
it)
> >>>> +      * performance counter usage plus one.
> >>>> +      *
> >>>> +      * Note: refcount_t does not like 0->1 transitions.. we want t=
o keep
> >>>> +      * the under/overflow checks that refcount_t provides, but all=
ow
> >>>> +      * multiple on/off transitions so we track the logical value p=
lus one.)
> >>>> +      */
> >>>> +     refcount_t local_counters_active;
> >>>> +
> >>>>       /**
> >>>>        * lock:
> >>>>        *
> >>>> @@ -383,6 +399,13 @@ struct msm_file_private {
> >>>>        */
> >>>>       int sysprof;
> >>>>
> >>>> +     /**
> >>>> +      * @counters_requested:
> >>>> +      *
> >>>> +      * Has the context requested local perfcntr usage.
> >>>> +      */
> >>>> +     bool counters_requested;
> >>>> +
> >>>>       /**
> >>>>        * comm: Overridden task comm, see MSM_PARAM_COMM
> >>>>        *
> >>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
> >>>>
> >>>>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>                                struct msm_gpu *gpu, int sysprof);
> >>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
> >>>> +                                   struct msm_gpu *gpu, int reqcntr=
s);
> >>>>  void __msm_file_private_destroy(struct kref *kref);
> >>>>
> >>>>  static inline void msm_file_private_put(struct msm_file_private *ct=
x)
> >>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm=
/msm/msm_submitqueue.c
> >>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>> @@ -10,6 +10,15 @@
> >>>>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>                                struct msm_gpu *gpu, int sysprof)
> >>>>  {
> >>>> +     int ret =3D 0;
> >>>> +
> >>>> +     mutex_lock(&gpu->lock);
> >>>> +
> >>>> +     if (sysprof && (refcount_read(&gpu->local_counters_active) > 1=
)) {
> >>>> +             ret =3D UERR(EBUSY, gpu->dev, "Local counter usage act=
ive");
> >>>> +             goto out_unlock;
> >>>> +     }
> >>>> +
> >>>>       /*
> >>>>        * Since pm_runtime and sysprof_active are both refcounts, we
> >>>>        * call apply the new value first, and then unwind the previou=
s
> >>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_p=
rivate *ctx,
> >>>>
> >>>>       switch (sysprof) {
> >>>>       default:
> >>>> -             return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", s=
ysprof);
> >>>> +             ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", =
sysprof);
> >>>> +             goto out_unlock;
> >>>>       case 2:
> >>>>               pm_runtime_get_sync(&gpu->pdev->dev);
> >>>>               fallthrough;
> >>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_=
private *ctx,
> >>>>
> >>>>       ctx->sysprof =3D sysprof;
> >>>>
> >>>> -     return 0;
> >>>> +out_unlock:
> >>>> +     mutex_unlock(&gpu->lock);
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> >>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
> >>>> +                                   struct msm_gpu *gpu, int reqctrs=
)
> >>>> +{
> >>>> +     int ret =3D 0;
> >>>> +
> >>>> +     mutex_lock(&gpu->lock);
> >>>> +
> >>>> +     if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> >>>> +             ret =3D UERR(EBUSY, gpu->dev, "System profiling active=
");
> >>>> +             goto out_unlock;
> >>>> +     }
> >>>> +
> >>>> +     if (reqctrs) {
> >>>> +             if (ctx->counters_requested) {
> >>>> +                     ret =3D UERR(EINVAL, gpu->dev, "Already reques=
ted");
> >>>> +                     goto out_unlock;
> >>>> +             }
> >>>> +
> >>>> +             ctx->counters_requested =3D true;
> >>>> +             refcount_inc(&gpu->local_counters_active);
> >>>> +     } else {
> >>>> +             if (!ctx->counters_requested) {
> >>>> +                     ret =3D UERR(EINVAL, gpu->dev, "Not requested"=
);
> >>>> +                     goto out_unlock;
> >>>> +             }
> >>>> +             refcount_dec(&gpu->local_counters_active);
> >>>> +             ctx->counters_requested =3D false;
> >>>> +     }
> >>>> +
> >>>> +out_unlock:
> >>>> +     mutex_unlock(&gpu->lock);
> >>>> +
> >>>> +     return ret;
> >>>>  }
> >>>>
> >>>>  void __msm_file_private_destroy(struct kref *kref)
> >>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> >>>> index 2342cb90857e..ae7fb355e4a1 100644
> >>>> --- a/include/uapi/drm/msm_drm.h
> >>>> +++ b/include/uapi/drm/msm_drm.h
> >>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> >>>>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> >>>>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> >>>>  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> >>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-sub=
mit) perfcntr usage  */
> >>>>
> >>>>  /* For backwards compat.  The original support for preemption was b=
ased on
> >>>>   * a single ring per priority level so # of priority levels equals =
the #
> >>>
>
