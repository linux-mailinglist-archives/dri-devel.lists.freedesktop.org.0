Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80219F3737
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B0910E722;
	Mon, 16 Dec 2024 17:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jpmtNMVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB82210E722;
 Mon, 16 Dec 2024 17:16:38 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844eb33827eso105726139f.2; 
 Mon, 16 Dec 2024 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734369398; x=1734974198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDT6AtCaej5iLDcBpJoiNcUJya9EiPCQcvDwSRHq2nk=;
 b=jpmtNMVM0K2Wd+vbPtPo3c7mJVGNUggWb17C1nGCs5PsZjJ+3uG2nJx9PPXALpKEh2
 LpHJkfjMfAeZGePFJUTmDMOsdQOG7iQRNYMmyAZFQSP63FHXC2/l5ebAuTKKafIZ/Uz8
 gJYMiQxzZh2WSyDIgxIJ2dvyLtSiVPFovocyuPjyVz95bmXmNTIJ10T0240O2xbs27hS
 UD67BEYHWegs/g9Wf9w2G20G2FePt3LvnQ3j/bgEY0h5Ti7odr7vcXDmWSXNlupeVVQv
 4e5jGc+U6AyllGEWfo78nUOw9opsgZAcTr90IK1PtckazRBHrpAvcuyuaRpTioCj0p48
 aL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734369398; x=1734974198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDT6AtCaej5iLDcBpJoiNcUJya9EiPCQcvDwSRHq2nk=;
 b=V22W+hYGYOKyo00qm/EwQIGZ+YSQFyNUvSthAfISw4wbUaaYYMJwVbwVoBcKpb383r
 b1zoyANQs5EE2fEJ6YWz3GXgQqCsprS5XoANKOpn/603xcL9We8FIDpMMBlZHCnclOFx
 PGKTZ7+F5WOh2I+7EmI1sfw+OSkBmKNRHaa7WFVn4xsaFOPzxjknikd60OM3NoVj7YX6
 tWsd0v7zm+T8NpwNoTc//6g/52NuJPPMDd+BuaH9aa+Ajhs0YaIHOBSYs+96do17ci6g
 QBSXrq08prWCm4Ke+m9UvzJzbjrSI45390OlJiMwvScfszSvLT0a6sliGkKYQw/l9NWi
 paDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsIDmEJLL/Rh+zABEVzh0qyWwiDH38hTEmTB7bVMWnCz3ZkP5OjTK72mWBfxUO7mPuDbrv7kfdDl4L@lists.freedesktop.org,
 AJvYcCVcJts2H+YNyVzg5rJVHufwkxsmsT0OTcNM9Xn2t5RFhqqgogBRklOYRPiVaWZFAysKm4HBVLCJ59k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy85yR0KE9OPOOjDyloMufVBmqAMKeiGpbBCTJcaiyuWU7VirgF
 8DLCDZP/N5Av4aqp538lOUNbtIDoot4/zlXb3Mwl+eHwWixn0oTSIlR6RxXtzLZZyMdwne/9OrU
 cdiitf3/DEZXXVMQ6G8Rvcz9Vw2o=
X-Gm-Gg: ASbGncv0/hDQoj+1zIMBsazelIN5DqxQwXSmFVdxo4hDBu/ghEIWLQDbpRsesMjVolv
 AS7c/QXnb9EPfVFEfTV5uJrMSRHtbb0rVlGlTDfY1yc6AqZIRBuAPe+BkPTiHSj5fJT7l
X-Google-Smtp-Source: AGHT+IHnw172+OBLMauq5RpYf5769qfvNNUBwlui0b746a3Vf7AEBohjTzzV55n6c7JeedCFyia0m4GEYxQQhs2YOLA=
X-Received: by 2002:a05:6e02:152e:b0:3a7:6c5c:9aa4 with SMTP id
 e9e14a558f8ab-3aff039a391mr146698655ab.12.1734369397606; Mon, 16 Dec 2024
 09:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <de6cfac6-84a0-4160-b279-c23e10f96872@gmail.com>
 <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
 <30fadc96-d531-4cde-a717-c5983908ea04@gmail.com>
 <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
 <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
In-Reply-To: <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Dec 2024 09:16:25 -0800
Message-ID: <CAF6AEGtvie_DCUpesjYj8ozFpGUD9f0rLtQ6JdihSOV_S_LcWA@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Antonino Maniscalco <antomani103@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
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

On Mon, Dec 16, 2024 at 8:59=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Mon, Dec 16, 2024 at 11:55=E2=80=AFAM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
> >
> > On 12/13/2024 10:40 PM, Antonino Maniscalco wrote:
> > > On 12/13/24 5:50 PM, Akhil P Oommen wrote:
> > >> On 12/12/2024 9:44 PM, Antonino Maniscalco wrote:
> > >>> On 12/12/24 4:58 PM, Akhil P Oommen wrote:
> > >>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
> > >>>>> From: Rob Clark <robdclark@chromium.org>
> > >>>>>
> > >>>>> Performance counter usage falls into two categories:
> > >>>>>
> > >>>>> 1. Local usage, where the counter configuration, start, and end r=
ead
> > >>>>>      happen within (locally to) a single SUBMIT.  In this case,
> > >>>>> there is
> > >>>>>      no dependency on counter configuration or values between sub=
mits,
> > >>>>> and
> > >>>>>      in fact counters are normally cleared on context switches,
> > >>>>> making it
> > >>>>>      impossible to rely on cross-submit state.
> > >>>>>
> > >>>>> 2. Global usage, where a single privilaged daemon/process is samp=
ling
> > >>>>>      counter values across all processes for profiling.
> > >>>>>
> > >>>>> The two categories are mutually exclusive.  While you can have ma=
ny
> > >>>>> processes making local counter usage, you cannot combine global a=
nd
> > >>>>> local usage without the two stepping on each others feet (by chan=
ging
> > >>>>> counter configuration).
> > >>>>>
> > >>>>> For global counter usage, there is already a SYSPROF param (since
> > >>>>> global
> > >>>>> counter usage requires disabling counter clearing on context swit=
ch).
> > >>>>> This patch adds a REQ_CNTRS param to request local counter usage.=
  If
> > >>>>> one or more processes has requested counter usage, then a SYSPROF
> > >>>>> request will fail with -EBUSY.  And if SYSPROF is active, then
> > >>>>> REQ_CNTRS
> > >>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
> > >>>>>
> > >>>>> This is purely an advisory interface to help coordinate userspace=
.
> > >>>>> There is no real means of enforcement, but the worst that can
> > >>>>> happen if
> > >>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> > >>>>> profiling data.
> > >>>>>
> > >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >>>>> ---
> > >>>>> kgsl takes a different approach, which involves a lot more UABI f=
or
> > >>>>> assigning counters to different processes.  But I think by taking
> > >>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure th=
e
> > >>>>> counters they need in each SUBMIT, for their respective gl/vk per=
f-
> > >>>>> counter extensions, we can take this simpler approach.
> > >>>>
> > >>>> KGSL's approach is preemption and ifpc safe (also whatever HW chan=
ges
> > >>>> that will come up in future generations). How will we ensure that =
here?
> > >>>>
> > >>>> I have plans to bring up IFPC support in near future. Also, I
> > >>>> brought up
> > >>>> this point during preemption series. But from the responses, I fel=
t
> > >>>> that
> > >>>> profiling was not considered a serious usecase. Still I wonder how=
 the
> > >>>> perfcounter extensions work accurately with preemption.
> > >>>
> > >>> So back then I implemented the postamble IB to clear perf counters =
and
> > >>> that gets disabled when sysprof (so global usage) is happening. The
> > >>> kernel is oblivious to "Local isage" of profiling but in that case
> > >>> really what we want to do is disable preemption which in my
> > >>> understanding can be done from userspace with a PKT. In my understa=
nding
> > >>> this had us covered for all usecases.
> > >>
> > >> I think this wasn't mentioned at that time. Which UMD PKT in a6x+ di=
d
> > >> you mean?
> > >
> > > Ah, I thought it wasmentioned, sorry.
> > > The packet I was referring to is:
> > >     <doc> Make next dword 1 to disable preemption, 0 to re-enable it.=
 </
> > > doc>
> > >     <value name=3D"CP_PREEMPT_DISABLE" value=3D"0x6c" variants=3D"A6X=
X"/>
> >
> > Ah! Okay. I think this packet is not used by the downstream blob. IMO,
> > disabling preemption is still a suboptimal solution.
>
> Downstream doesn't expose userspace perfcounters (i.e.
> VK_KHR_performance_query) at all. My understanding is that Android
> requires you not to expose them for security reasons, but I could be
> wrong there. In any case, Qualcomm clearly hasn't really thought
> through what it would take to make everything work well with userspace
> perfcounters and hasn't implemented the necessary firmware bits for
> that, so we're left muddling through and doing what we can.

That is correct, VK_KHR_performance_query is disallowed on android.
There is an android CTS test for that.

BR,
-R

>
> Connor
>
> >
> > >
> > > BTW you mentioned wanting to look into IFPC. Since I too wanted to lo=
ok
> > > into implementing it wonder if you could let me know when you planned=
 on
> > > working on it.
> >
> > I have few patches in progress. Nothing final yet and need verification
> > on the hw side. Also, I need to do some housekeeping here to debug gmu
> > issues since IFPC increases the probability of those a lot.
> >
> > I will try to send out the patches very soon.
> >
> > -Akhil.
> >
> > >
> > >>
> > >> -Akhil.
> > >>
> > >>>
> > >>> So what would you expect instead we should do kernel side to make
> > >>> profiling preemption safe?
> > >>>
> > >>>>
> > >>>> -Akhil
> > >>>>
> > >>>>>
> > >>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> > >>>>>    drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> > >>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> > >>>>>    drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> > >>>>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 52 +++++++++++++++++=
++
> > >>>>> +++++-
> > >>>>>    include/uapi/drm/msm_drm.h              |  1 +
> > >>>>>    6 files changed, 85 insertions(+), 5 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gp=
u/
> > >>>>> drm/msm/adreno/adreno_gpu.c
> > >>>>> index 31bbf2c83de4..f688e37059b8 100644
> > >>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > >>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > >>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, str=
uct
> > >>>>> msm_file_private *ctx,
> > >>>>>            if (!capable(CAP_SYS_ADMIN))
> > >>>>>                return UERR(EPERM, drm, "invalid permissions");
> > >>>>>            return msm_file_private_set_sysprof(ctx, gpu, value);
> > >>>>> +    case MSM_PARAM_REQ_CNTRS:
> > >>>>> +        return msm_file_private_request_counters(ctx, gpu, value=
);
> > >>>>>        default:
> > >>>>>            return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-
> > >>>>>> name, param);
> > >>>>>        }
> > >>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/
> > >>>>> msm_drv.c
> > >>>>> index 6416d2cb4efc..bf8314ff4a25 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> > >>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device
> > >>>>> *dev, struct drm_file *file)
> > >>>>>         * It is not possible to set sysprof param to non-zero if =
gpu
> > >>>>>         * is not initialized:
> > >>>>>         */
> > >>>>> -    if (priv->gpu)
> > >>>>> +    if (ctx->sysprof)
> > >>>>>            msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> > >>>>>    +    if (ctx->counters_requested)
> > >>>>> +        msm_file_private_request_counters(ctx, priv->gpu, 0);
> > >>>>> +
> > >>>>>        context_close(ctx);
> > >>>>>    }
> > >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/m=
sm/
> > >>>>> msm_gpu.c
> > >>>>> index 82f204f3bb8f..013b59ca3bb1 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > >>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, stru=
ct
> > >>>>> platform_device *pdev,
> > >>>>>        gpu->nr_rings =3D nr_rings;
> > >>>>>          refcount_set(&gpu->sysprof_active, 1);
> > >>>>> +    refcount_set(&gpu->local_counters_active, 1);
> > >>>>>          return 0;
> > >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/m=
sm/
> > >>>>> msm_gpu.h
> > >>>>> index e25009150579..83c61e523b1b 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > >>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
> > >>>>>        int nr_rings;
> > >>>>>          /**
> > >>>>> -     * sysprof_active:
> > >>>>> +     * @sysprof_active:
> > >>>>>         *
> > >>>>> -     * The count of contexts that have enabled system profiling.
> > >>>>> +     * The count of contexts that have enabled system profiling =
plus
> > >>>>> one.
> > >>>>> +     *
> > >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want=
 to
> > >>>>> keep
> > >>>>> +     * the under/overflow checks that refcount_t provides, but a=
llow
> > >>>>> +     * multiple on/off transitions so we track the logical value
> > >>>>> plus one.)
> > >>>>>         */
> > >>>>>        refcount_t sysprof_active;
> > >>>>>    +    /**
> > >>>>> +     * @local_counters_active:
> > >>>>> +     *
> > >>>>> +     * The count of contexts that have requested local (intra-su=
bmit)
> > >>>>> +     * performance counter usage plus one.
> > >>>>> +     *
> > >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want=
 to
> > >>>>> keep
> > >>>>> +     * the under/overflow checks that refcount_t provides, but a=
llow
> > >>>>> +     * multiple on/off transitions so we track the logical value
> > >>>>> plus one.)
> > >>>>> +     */
> > >>>>> +    refcount_t local_counters_active;
> > >>>>> +
> > >>>>>        /**
> > >>>>>         * lock:
> > >>>>>         *
> > >>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
> > >>>>>         */
> > >>>>>        int sysprof;
> > >>>>>    +    /**
> > >>>>> +     * @counters_requested:
> > >>>>> +     *
> > >>>>> +     * Has the context requested local perfcntr usage.
> > >>>>> +     */
> > >>>>> +    bool counters_requested;
> > >>>>> +
> > >>>>>        /**
> > >>>>>         * comm: Overridden task comm, see MSM_PARAM_COMM
> > >>>>>         *
> > >>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kre=
f);
> > >>>>>      int msm_file_private_set_sysprof(struct msm_file_private *ct=
x,
> > >>>>>                     struct msm_gpu *gpu, int sysprof);
> > >>>>> +int msm_file_private_request_counters(struct msm_file_private *c=
tx,
> > >>>>> +                      struct msm_gpu *gpu, int reqcntrs);
> > >>>>>    void __msm_file_private_destroy(struct kref *kref);
> > >>>>>      static inline void msm_file_private_put(struct msm_file_priv=
ate
> > >>>>> *ctx)
> > >>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/=
drm/
> > >>>>> msm/msm_submitqueue.c
> > >>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
> > >>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > >>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > >>>>> @@ -10,6 +10,15 @@
> > >>>>>    int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> > >>>>>                     struct msm_gpu *gpu, int sysprof)
> > >>>>>    {
> > >>>>> +    int ret =3D 0;
> > >>>>> +
> > >>>>> +    mutex_lock(&gpu->lock);
> > >>>>> +
> > >>>>> +    if (sysprof && (refcount_read(&gpu->local_counters_active) >
> > >>>>> 1)) {
> > >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "Local counter usage activ=
e");
> > >>>>> +        goto out_unlock;
> > >>>>> +    }
> > >>>>> +
> > >>>>>        /*
> > >>>>>         * Since pm_runtime and sysprof_active are both refcounts,=
 we
> > >>>>>         * call apply the new value first, and then unwind the pre=
vious
> > >>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct
> > >>>>> msm_file_private *ctx,
> > >>>>>          switch (sysprof) {
> > >>>>>        default:
> > >>>>> -        return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d",
> > >>>>> sysprof);
> > >>>>> +        ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sy=
sprof);
> > >>>>> +        goto out_unlock;
> > >>>>>        case 2:
> > >>>>>            pm_runtime_get_sync(&gpu->pdev->dev);
> > >>>>>            fallthrough;
> > >>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct
> > >>>>> msm_file_private *ctx,
> > >>>>>          ctx->sysprof =3D sysprof;
> > >>>>>    -    return 0;
> > >>>>> +out_unlock:
> > >>>>> +    mutex_unlock(&gpu->lock);
> > >>>>> +
> > >>>>> +    return ret;
> > >>>>> +}
> > >>>>> +
> > >>>>> +int msm_file_private_request_counters(struct msm_file_private *c=
tx,
> > >>>>> +                      struct msm_gpu *gpu, int reqctrs)
> > >>>>> +{
> > >>>>> +    int ret =3D 0;
> > >>>>> +
> > >>>>> +    mutex_lock(&gpu->lock);
> > >>>>> +
> > >>>>> +    if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> > >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "System profiling active")=
;
> > >>>>> +        goto out_unlock;
> > >>>>> +    }
> > >>>>> +
> > >>>>> +    if (reqctrs) {
> > >>>>> +        if (ctx->counters_requested) {
> > >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Already requested");
> > >>>>> +            goto out_unlock;
> > >>>>> +        }
> > >>>>> +
> > >>>>> +        ctx->counters_requested =3D true;
> > >>>>> +        refcount_inc(&gpu->local_counters_active);
> > >>>>> +    } else {
> > >>>>> +        if (!ctx->counters_requested) {
> > >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Not requested");
> > >>>>> +            goto out_unlock;
> > >>>>> +        }
> > >>>>> +        refcount_dec(&gpu->local_counters_active);
> > >>>>> +        ctx->counters_requested =3D false;
> > >>>>> +    }
> > >>>>> +
> > >>>>> +out_unlock:
> > >>>>> +    mutex_unlock(&gpu->lock);
> > >>>>> +
> > >>>>> +    return ret;
> > >>>>>    }
> > >>>>>      void __msm_file_private_destroy(struct kref *kref)
> > >>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_dr=
m.h
> > >>>>> index 2342cb90857e..ae7fb355e4a1 100644
> > >>>>> --- a/include/uapi/drm/msm_drm.h
> > >>>>> +++ b/include/uapi/drm/msm_drm.h
> > >>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> > >>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> > >>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> > >>>>>    #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > >>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-
> > >>>>> submit) perfcntr usage  */
> > >>>>>      /* For backwards compat.  The original support for preemptio=
n was
> > >>>>> based on
> > >>>>>     * a single ring per priority level so # of priority levels eq=
uals
> > >>>>> the #
> > >>>>
> > >>>
> > >>>
> > >>> Best regards,
> > >>
> > >
> > >
> > > Best regards,
> >
