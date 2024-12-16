Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D191D9F36D1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6198F10E3EE;
	Mon, 16 Dec 2024 16:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TrlabcNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F17610E3EE;
 Mon, 16 Dec 2024 16:59:02 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ef718cb473so659700a91.1; 
 Mon, 16 Dec 2024 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734368342; x=1734973142; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+YJnxqmK04Pa80TxUjlUx8bfVnXNIJ0Z7Fk3CmLaqs=;
 b=TrlabcNB5u8nLFIH8prVTDjV6Jrk8FVPwtSVa4vwRKFlsum9onIydZAC8yrrFpDu1j
 Z4gMDA4A1y05lGPggx0CKn2NSkkkxdo5qMSkxqcWsyW25ELk3Ne4Nelsm56iT1bCCG3S
 K5VfDbNSJpDwA30qSsz5nZdIFlfTYiJsSHQvmIkZTVD3pGaH0CbhV6vPCa1LbXvBcBUP
 vpWzbMZb+zZllDyHSOdvZdtOmJTutiJW3fOw8v82/r2F4SnHuHk9ERQckRnVAxwF769F
 BlMLoSwA5EVPOXl53wBkDJiVgJQjI8j66XA6uriyeeIqnEomg5z7cNRRU8wAC5w27MOD
 avTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734368342; x=1734973142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+YJnxqmK04Pa80TxUjlUx8bfVnXNIJ0Z7Fk3CmLaqs=;
 b=jeqmZRUpwbW5DZmbw16KQWVEZ+nEt1NSLROt7LtX4rNZ4Vfbbg0mM0DsKztr+UACZU
 RgboFov2P8+oatcnLsqVRAMID5mYVjeLZA5w94wNN0YjkXuPOVIgYyLGsS9xQWBC61lr
 oWm0eoQ4Zru56LyeLLYLDCYVEU110CLMfsteTSW7ONBoJcsCwmFHiBrCZThHEMdwYjyB
 MRDyqkvP+nj7itURUeLOa6UG7tlZYWTOAxY9YbsciP5U3GPGvFKGLEIlwEiJXO5QItiv
 0PDFZ3ZIqbrjrUqWRmreLBcSWIqUy72dgRX8B9CvJetRQKkK3AAP38gzMw9tW3YXF/Tw
 3MHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4n7XFLkOqfwUO+3Bt5/bnd2HdhxYhBaHE1a0Gk99xvWKM2QinDIz8U4IuhG2eT5NAPZI51ygRkB8=@lists.freedesktop.org,
 AJvYcCVlS3lCyUKz5g/cuZWZxwiZNL7PYWe5ohxgL/erkbv2wkNX0ZYJHu/awNfA+b9TFZYS/169vvbwTeAc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfpsve9VKNe+l5FkU9jLLG5AWcFatznhIL6l4f6L0laP5i/Jg7
 FTWJ9bhtfTaq8h02Kvio+griY6X9bpwrLdFi+bjxYBCSYkTL5+yX22foPhtC87OaU7Vg3rAPxSF
 KBJCl/xY6A1iO0I3O4SnqjtfCNMUaAw==
X-Gm-Gg: ASbGncthrLFqPPx8S/Y2frEe6ipZhbrqWX2TKSGdmDSvc3ngKj2b+7N9IRTyj6O9335
 n30Xw4mmxX4cxeFkF10bJonrrVUopYZckEQtXzw==
X-Google-Smtp-Source: AGHT+IFso+//RTcmJRYzalZhkuD/c0CFBeKBCX29yQOWo/dbDDaOyPZqXbDmDZ0j3QhoUOoIGBkilQy41KGWOvYRmJU=
X-Received: by 2002:a17:90b:3c51:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2f28fa4b6f6mr7199215a91.2.1734368341543; Mon, 16 Dec 2024
 08:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <de6cfac6-84a0-4160-b279-c23e10f96872@gmail.com>
 <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
 <30fadc96-d531-4cde-a717-c5983908ea04@gmail.com>
 <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
In-Reply-To: <ae351364-7590-4080-baea-80133c79c86f@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 16 Dec 2024 11:58:50 -0500
Message-ID: <CACu1E7E4Ege0VgsSmjzqPDYg7eWwRWQOjPyyCT-ty5tEYKP-bg@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
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

On Mon, Dec 16, 2024 at 11:55=E2=80=AFAM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 12/13/2024 10:40 PM, Antonino Maniscalco wrote:
> > On 12/13/24 5:50 PM, Akhil P Oommen wrote:
> >> On 12/12/2024 9:44 PM, Antonino Maniscalco wrote:
> >>> On 12/12/24 4:58 PM, Akhil P Oommen wrote:
> >>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Performance counter usage falls into two categories:
> >>>>>
> >>>>> 1. Local usage, where the counter configuration, start, and end rea=
d
> >>>>>      happen within (locally to) a single SUBMIT.  In this case,
> >>>>> there is
> >>>>>      no dependency on counter configuration or values between submi=
ts,
> >>>>> and
> >>>>>      in fact counters are normally cleared on context switches,
> >>>>> making it
> >>>>>      impossible to rely on cross-submit state.
> >>>>>
> >>>>> 2. Global usage, where a single privilaged daemon/process is sampli=
ng
> >>>>>      counter values across all processes for profiling.
> >>>>>
> >>>>> The two categories are mutually exclusive.  While you can have many
> >>>>> processes making local counter usage, you cannot combine global and
> >>>>> local usage without the two stepping on each others feet (by changi=
ng
> >>>>> counter configuration).
> >>>>>
> >>>>> For global counter usage, there is already a SYSPROF param (since
> >>>>> global
> >>>>> counter usage requires disabling counter clearing on context switch=
).
> >>>>> This patch adds a REQ_CNTRS param to request local counter usage.  =
If
> >>>>> one or more processes has requested counter usage, then a SYSPROF
> >>>>> request will fail with -EBUSY.  And if SYSPROF is active, then
> >>>>> REQ_CNTRS
> >>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
> >>>>>
> >>>>> This is purely an advisory interface to help coordinate userspace.
> >>>>> There is no real means of enforcement, but the worst that can
> >>>>> happen if
> >>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> >>>>> profiling data.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>> kgsl takes a different approach, which involves a lot more UABI for
> >>>>> assigning counters to different processes.  But I think by taking
> >>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
> >>>>> counters they need in each SUBMIT, for their respective gl/vk perf-
> >>>>> counter extensions, we can take this simpler approach.
> >>>>
> >>>> KGSL's approach is preemption and ifpc safe (also whatever HW change=
s
> >>>> that will come up in future generations). How will we ensure that he=
re?
> >>>>
> >>>> I have plans to bring up IFPC support in near future. Also, I
> >>>> brought up
> >>>> this point during preemption series. But from the responses, I felt
> >>>> that
> >>>> profiling was not considered a serious usecase. Still I wonder how t=
he
> >>>> perfcounter extensions work accurately with preemption.
> >>>
> >>> So back then I implemented the postamble IB to clear perf counters an=
d
> >>> that gets disabled when sysprof (so global usage) is happening. The
> >>> kernel is oblivious to "Local isage" of profiling but in that case
> >>> really what we want to do is disable preemption which in my
> >>> understanding can be done from userspace with a PKT. In my understand=
ing
> >>> this had us covered for all usecases.
> >>
> >> I think this wasn't mentioned at that time. Which UMD PKT in a6x+ did
> >> you mean?
> >
> > Ah, I thought it wasmentioned, sorry.
> > The packet I was referring to is:
> >     <doc> Make next dword 1 to disable preemption, 0 to re-enable it. <=
/
> > doc>
> >     <value name=3D"CP_PREEMPT_DISABLE" value=3D"0x6c" variants=3D"A6XX"=
/>
>
> Ah! Okay. I think this packet is not used by the downstream blob. IMO,
> disabling preemption is still a suboptimal solution.

Downstream doesn't expose userspace perfcounters (i.e.
VK_KHR_performance_query) at all. My understanding is that Android
requires you not to expose them for security reasons, but I could be
wrong there. In any case, Qualcomm clearly hasn't really thought
through what it would take to make everything work well with userspace
perfcounters and hasn't implemented the necessary firmware bits for
that, so we're left muddling through and doing what we can.

Connor

>
> >
> > BTW you mentioned wanting to look into IFPC. Since I too wanted to look
> > into implementing it wonder if you could let me know when you planned o=
n
> > working on it.
>
> I have few patches in progress. Nothing final yet and need verification
> on the hw side. Also, I need to do some housekeeping here to debug gmu
> issues since IFPC increases the probability of those a lot.
>
> I will try to send out the patches very soon.
>
> -Akhil.
>
> >
> >>
> >> -Akhil.
> >>
> >>>
> >>> So what would you expect instead we should do kernel side to make
> >>> profiling preemption safe?
> >>>
> >>>>
> >>>> -Akhil
> >>>>
> >>>>>
> >>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> >>>>>    drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> >>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> >>>>>    drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> >>>>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 52 +++++++++++++++++++
> >>>>> +++++-
> >>>>>    include/uapi/drm/msm_drm.h              |  1 +
> >>>>>    6 files changed, 85 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/
> >>>>> drm/msm/adreno/adreno_gpu.c
> >>>>> index 31bbf2c83de4..f688e37059b8 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struc=
t
> >>>>> msm_file_private *ctx,
> >>>>>            if (!capable(CAP_SYS_ADMIN))
> >>>>>                return UERR(EPERM, drm, "invalid permissions");
> >>>>>            return msm_file_private_set_sysprof(ctx, gpu, value);
> >>>>> +    case MSM_PARAM_REQ_CNTRS:
> >>>>> +        return msm_file_private_request_counters(ctx, gpu, value);
> >>>>>        default:
> >>>>>            return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-
> >>>>>> name, param);
> >>>>>        }
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/
> >>>>> msm_drv.c
> >>>>> index 6416d2cb4efc..bf8314ff4a25 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device
> >>>>> *dev, struct drm_file *file)
> >>>>>         * It is not possible to set sysprof param to non-zero if gp=
u
> >>>>>         * is not initialized:
> >>>>>         */
> >>>>> -    if (priv->gpu)
> >>>>> +    if (ctx->sysprof)
> >>>>>            msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> >>>>>    +    if (ctx->counters_requested)
> >>>>> +        msm_file_private_request_counters(ctx, priv->gpu, 0);
> >>>>> +
> >>>>>        context_close(ctx);
> >>>>>    }
> >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm=
/
> >>>>> msm_gpu.c
> >>>>> index 82f204f3bb8f..013b59ca3bb1 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct
> >>>>> platform_device *pdev,
> >>>>>        gpu->nr_rings =3D nr_rings;
> >>>>>          refcount_set(&gpu->sysprof_active, 1);
> >>>>> +    refcount_set(&gpu->local_counters_active, 1);
> >>>>>          return 0;
> >>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm=
/
> >>>>> msm_gpu.h
> >>>>> index e25009150579..83c61e523b1b 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
> >>>>>        int nr_rings;
> >>>>>          /**
> >>>>> -     * sysprof_active:
> >>>>> +     * @sysprof_active:
> >>>>>         *
> >>>>> -     * The count of contexts that have enabled system profiling.
> >>>>> +     * The count of contexts that have enabled system profiling pl=
us
> >>>>> one.
> >>>>> +     *
> >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want t=
o
> >>>>> keep
> >>>>> +     * the under/overflow checks that refcount_t provides, but all=
ow
> >>>>> +     * multiple on/off transitions so we track the logical value
> >>>>> plus one.)
> >>>>>         */
> >>>>>        refcount_t sysprof_active;
> >>>>>    +    /**
> >>>>> +     * @local_counters_active:
> >>>>> +     *
> >>>>> +     * The count of contexts that have requested local (intra-subm=
it)
> >>>>> +     * performance counter usage plus one.
> >>>>> +     *
> >>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want t=
o
> >>>>> keep
> >>>>> +     * the under/overflow checks that refcount_t provides, but all=
ow
> >>>>> +     * multiple on/off transitions so we track the logical value
> >>>>> plus one.)
> >>>>> +     */
> >>>>> +    refcount_t local_counters_active;
> >>>>> +
> >>>>>        /**
> >>>>>         * lock:
> >>>>>         *
> >>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
> >>>>>         */
> >>>>>        int sysprof;
> >>>>>    +    /**
> >>>>> +     * @counters_requested:
> >>>>> +     *
> >>>>> +     * Has the context requested local perfcntr usage.
> >>>>> +     */
> >>>>> +    bool counters_requested;
> >>>>> +
> >>>>>        /**
> >>>>>         * comm: Overridden task comm, see MSM_PARAM_COMM
> >>>>>         *
> >>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref)=
;
> >>>>>      int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>>                     struct msm_gpu *gpu, int sysprof);
> >>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx=
,
> >>>>> +                      struct msm_gpu *gpu, int reqcntrs);
> >>>>>    void __msm_file_private_destroy(struct kref *kref);
> >>>>>      static inline void msm_file_private_put(struct msm_file_privat=
e
> >>>>> *ctx)
> >>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/dr=
m/
> >>>>> msm/msm_submitqueue.c
> >>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
> >>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> >>>>> @@ -10,6 +10,15 @@
> >>>>>    int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >>>>>                     struct msm_gpu *gpu, int sysprof)
> >>>>>    {
> >>>>> +    int ret =3D 0;
> >>>>> +
> >>>>> +    mutex_lock(&gpu->lock);
> >>>>> +
> >>>>> +    if (sysprof && (refcount_read(&gpu->local_counters_active) >
> >>>>> 1)) {
> >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "Local counter usage active"=
);
> >>>>> +        goto out_unlock;
> >>>>> +    }
> >>>>> +
> >>>>>        /*
> >>>>>         * Since pm_runtime and sysprof_active are both refcounts, w=
e
> >>>>>         * call apply the new value first, and then unwind the previ=
ous
> >>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct
> >>>>> msm_file_private *ctx,
> >>>>>          switch (sysprof) {
> >>>>>        default:
> >>>>> -        return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d",
> >>>>> sysprof);
> >>>>> +        ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysp=
rof);
> >>>>> +        goto out_unlock;
> >>>>>        case 2:
> >>>>>            pm_runtime_get_sync(&gpu->pdev->dev);
> >>>>>            fallthrough;
> >>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct
> >>>>> msm_file_private *ctx,
> >>>>>          ctx->sysprof =3D sysprof;
> >>>>>    -    return 0;
> >>>>> +out_unlock:
> >>>>> +    mutex_unlock(&gpu->lock);
> >>>>> +
> >>>>> +    return ret;
> >>>>> +}
> >>>>> +
> >>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx=
,
> >>>>> +                      struct msm_gpu *gpu, int reqctrs)
> >>>>> +{
> >>>>> +    int ret =3D 0;
> >>>>> +
> >>>>> +    mutex_lock(&gpu->lock);
> >>>>> +
> >>>>> +    if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> >>>>> +        ret =3D UERR(EBUSY, gpu->dev, "System profiling active");
> >>>>> +        goto out_unlock;
> >>>>> +    }
> >>>>> +
> >>>>> +    if (reqctrs) {
> >>>>> +        if (ctx->counters_requested) {
> >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Already requested");
> >>>>> +            goto out_unlock;
> >>>>> +        }
> >>>>> +
> >>>>> +        ctx->counters_requested =3D true;
> >>>>> +        refcount_inc(&gpu->local_counters_active);
> >>>>> +    } else {
> >>>>> +        if (!ctx->counters_requested) {
> >>>>> +            ret =3D UERR(EINVAL, gpu->dev, "Not requested");
> >>>>> +            goto out_unlock;
> >>>>> +        }
> >>>>> +        refcount_dec(&gpu->local_counters_active);
> >>>>> +        ctx->counters_requested =3D false;
> >>>>> +    }
> >>>>> +
> >>>>> +out_unlock:
> >>>>> +    mutex_unlock(&gpu->lock);
> >>>>> +
> >>>>> +    return ret;
> >>>>>    }
> >>>>>      void __msm_file_private_destroy(struct kref *kref)
> >>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.=
h
> >>>>> index 2342cb90857e..ae7fb355e4a1 100644
> >>>>> --- a/include/uapi/drm/msm_drm.h
> >>>>> +++ b/include/uapi/drm/msm_drm.h
> >>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> >>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> >>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> >>>>>    #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> >>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-
> >>>>> submit) perfcntr usage  */
> >>>>>      /* For backwards compat.  The original support for preemption =
was
> >>>>> based on
> >>>>>     * a single ring per priority level so # of priority levels equa=
ls
> >>>>> the #
> >>>>
> >>>
> >>>
> >>> Best regards,
> >>
> >
> >
> > Best regards,
>
