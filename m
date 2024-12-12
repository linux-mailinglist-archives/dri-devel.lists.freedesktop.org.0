Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E729EF47D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F220210E629;
	Thu, 12 Dec 2024 17:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R+5n8DVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366E810E48A;
 Thu, 12 Dec 2024 17:09:04 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a9cb667783so6885315ab.1; 
 Thu, 12 Dec 2024 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734023343; x=1734628143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh2zFlYirOEce8wHvqNzCPR9OxzcDGMsRZId2rDGIFg=;
 b=R+5n8DVgBF83BA6meE5UhhVja/o7S1anjTTTehEL144MoMnDTNjUW7aWqll9JNCeXj
 fo/4OIkF/e20i+fb9LesGvRW4cIHj+F0QeOzPRDXVIHQLNxCXkVW+b/VsPGawKWkxj/5
 RD3MUx5EvcBkVnkv09Wr1fdDO2HTpdZ7KivZZwWeSuxI2FuYN3N7VsoNTFwU+7AIzy4L
 U4vsFHnB9C9pYBjzlX7tJBiFIuKCwpap6kPedIzUvTWGKoIK1BYGDSycr7nKli/V5uN5
 TB/EWoyk30EZ5BAx8ZuIPOpSkmqP1PuoiPfPJNET/7AMNt02iu0drG0M+myGDiBGD+7u
 nnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734023343; x=1734628143;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh2zFlYirOEce8wHvqNzCPR9OxzcDGMsRZId2rDGIFg=;
 b=CsIAf71tjF5OQ9RajS3+TlEtzpWuc1pE1Vb3BWq54o3dautViZHMDD9wbqrVWZYaIb
 1niIOnTtFH90N2QevqlpdwOyxnZpE57x+kcCu+9+CxP2rV2f+Bm6SNIuB6f+KpK5wLKa
 Qg8T+G235C5YD76iFa1Xm3nkFpWWBytIBjIvzHuK+qQsidOjFheRuYyrZXACsGo0gXa7
 nxxvxSSBGmAfPj/bcBuvQ5shjIpMboVRbJnd1ukxk3v+KrV+YIuxMmxnDsbTqvHDFQwI
 T2u6c0a9sLY8ZaJnD9zTT7rxKgNeCnPfMs8g3zaT8WLVeUgpGTbYBUkEVoEDpyJK84uT
 pmAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIIFt/xHwh9/hDc8iMkCaRnu8YWl85fNvtE1uBiYzvBfVsHK0wClT4wsqzZGEZKqFWig7KiKMzfWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6w89x8HzQt7+9v/6ZYeQrONzjpGf1uydjlLgpLzompPkI1Rcn
 6C2600Eo+gBh2ho/LMNonH4VMq7w0w0WwUp8DnW7eVdw95Gw+Owmwlhx+P0+sdsXrZN1sRALmqv
 ytsX7rQJfiBQiUmPWgPKvCEcXZCM=
X-Gm-Gg: ASbGnctPyLzooZ+rV/Ef0ew1tQt0ou35IhxbxCTMEV9KusJIisdqyEa/q2z+1lNPKD8
 qokjB470EPEaT9HD4Oyr/B19gcOtxHdXXJLEO92PJLtxVbRhsqTTkCTUMAHdH+aTKkk4=
X-Google-Smtp-Source: AGHT+IHOBEcHwVM1L/KwA0czMrrqFBDeYsTizttyCsGI/gpxEaBww5BPzG3hTX5xxyfSq4+baRCj9nzL8F4tOLytWj4=
X-Received: by 2002:a05:6e02:1568:b0:3a7:e452:db4 with SMTP id
 e9e14a558f8ab-3ae57ef8300mr10030475ab.16.1734023343067; Thu, 12 Dec 2024
 09:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
In-Reply-To: <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Dec 2024 09:08:51 -0800
Message-ID: <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
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

On Thu, Dec 12, 2024 at 7:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/5/2024 10:24 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Performance counter usage falls into two categories:
> >
> > 1. Local usage, where the counter configuration, start, and end read
> >    happen within (locally to) a single SUBMIT.  In this case, there is
> >    no dependency on counter configuration or values between submits, an=
d
> >    in fact counters are normally cleared on context switches, making it
> >    impossible to rely on cross-submit state.
> >
> > 2. Global usage, where a single privilaged daemon/process is sampling
> >    counter values across all processes for profiling.
> >
> > The two categories are mutually exclusive.  While you can have many
> > processes making local counter usage, you cannot combine global and
> > local usage without the two stepping on each others feet (by changing
> > counter configuration).
> >
> > For global counter usage, there is already a SYSPROF param (since globa=
l
> > counter usage requires disabling counter clearing on context switch).
> > This patch adds a REQ_CNTRS param to request local counter usage.  If
> > one or more processes has requested counter usage, then a SYSPROF
> > request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CNTR=
S
> > will fail with -EBUSY, maintaining the mutual exclusivity.
> >
> > This is purely an advisory interface to help coordinate userspace.
> > There is no real means of enforcement, but the worst that can happen if
> > userspace ignores a REQ_CNTRS failure is that you'll get nonsense
> > profiling data.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > kgsl takes a different approach, which involves a lot more UABI for
> > assigning counters to different processes.  But I think by taking
> > advantage of the fact that mesa (freedreno+turnip) reconfigure the
> > counters they need in each SUBMIT, for their respective gl/vk perf-
> > counter extensions, we can take this simpler approach.
>
> KGSL's approach is preemption and ifpc safe (also whatever HW changes
> that will come up in future generations). How will we ensure that here?
>
> I have plans to bring up IFPC support in near future. Also, I brought up
> this point during preemption series. But from the responses, I felt that
> profiling was not considered a serious usecase. Still I wonder how the
> perfcounter extensions work accurately with preemption.

Re: IFPC, I think initially we have to inhibit IFPC when SYSPROF is active

Longer term, I think we want to just save and restore all of the SEL
regs as well as the counters themselves on preemption.  AFAIU
currently only the counters themselves are saved/restored.  But there
is only one 32b SEL reg for each 64b counter, so I'm not sure that you
save that many cycles by not just saving/restoring the SEL regs as
well.  (And of course with REQ_CNTRS the kernel knows which processes
need counter save/restore and which do not, so you are only taking the
extra context switch overhead if a process is actually using the
perfcntrs.)

Alternatively, I think we could just declare this as a userspace
problem, and solve it with CP_SET_AMBLE PREAMBLE/POSTAMBLE?

Just for background, rendernode UABI is exposed to all processes that
can use the GPU, ie. basically everything.  Which makes it an
attractive attack surface.  This is why I prefer minimalism when it
comes to UABI, and not adding new ioctls and complexity in the kernel
when it is not essential ;-)

BR,
-R

> -Akhil
>
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
> >  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
> >  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
> >  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
> >  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++++-
> >  include/uapi/drm/msm_drm.h              |  1 +
> >  6 files changed, 85 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 31bbf2c83de4..f688e37059b8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct ms=
m_file_private *ctx,
> >               if (!capable(CAP_SYS_ADMIN))
> >                       return UERR(EPERM, drm, "invalid permissions");
> >               return msm_file_private_set_sysprof(ctx, gpu, value);
> > +     case MSM_PARAM_REQ_CNTRS:
> > +             return msm_file_private_request_counters(ctx, gpu, value)=
;
> >       default:
> >               return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->na=
me, param);
> >       }
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 6416d2cb4efc..bf8314ff4a25 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *dev, =
struct drm_file *file)
> >        * It is not possible to set sysprof param to non-zero if gpu
> >        * is not initialized:
> >        */
> > -     if (priv->gpu)
> > +     if (ctx->sysprof)
> >               msm_file_private_set_sysprof(ctx, priv->gpu, 0);
> >
> > +     if (ctx->counters_requested)
> > +             msm_file_private_request_counters(ctx, priv->gpu, 0);
> > +
> >       context_close(ctx);
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 82f204f3bb8f..013b59ca3bb1 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct pla=
tform_device *pdev,
> >       gpu->nr_rings =3D nr_rings;
> >
> >       refcount_set(&gpu->sysprof_active, 1);
> > +     refcount_set(&gpu->local_counters_active, 1);
> >
> >       return 0;
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gp=
u.h
> > index e25009150579..83c61e523b1b 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -195,12 +195,28 @@ struct msm_gpu {
> >       int nr_rings;
> >
> >       /**
> > -      * sysprof_active:
> > +      * @sysprof_active:
> >        *
> > -      * The count of contexts that have enabled system profiling.
> > +      * The count of contexts that have enabled system profiling plus =
one.
> > +      *
> > +      * Note: refcount_t does not like 0->1 transitions.. we want to k=
eep
> > +      * the under/overflow checks that refcount_t provides, but allow
> > +      * multiple on/off transitions so we track the logical value plus=
 one.)
> >        */
> >       refcount_t sysprof_active;
> >
> > +     /**
> > +      * @local_counters_active:
> > +      *
> > +      * The count of contexts that have requested local (intra-submit)
> > +      * performance counter usage plus one.
> > +      *
> > +      * Note: refcount_t does not like 0->1 transitions.. we want to k=
eep
> > +      * the under/overflow checks that refcount_t provides, but allow
> > +      * multiple on/off transitions so we track the logical value plus=
 one.)
> > +      */
> > +     refcount_t local_counters_active;
> > +
> >       /**
> >        * lock:
> >        *
> > @@ -383,6 +399,13 @@ struct msm_file_private {
> >        */
> >       int sysprof;
> >
> > +     /**
> > +      * @counters_requested:
> > +      *
> > +      * Has the context requested local perfcntr usage.
> > +      */
> > +     bool counters_requested;
> > +
> >       /**
> >        * comm: Overridden task comm, see MSM_PARAM_COMM
> >        *
> > @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
> >
> >  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >                                struct msm_gpu *gpu, int sysprof);
> > +int msm_file_private_request_counters(struct msm_file_private *ctx,
> > +                                   struct msm_gpu *gpu, int reqcntrs);
> >  void __msm_file_private_destroy(struct kref *kref);
> >
> >  static inline void msm_file_private_put(struct msm_file_private *ctx)
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/ms=
m/msm_submitqueue.c
> > index 7fed1de63b5d..1e1e21e6f7ae 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -10,6 +10,15 @@
> >  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> >                                struct msm_gpu *gpu, int sysprof)
> >  {
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&gpu->lock);
> > +
> > +     if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)) =
{
> > +             ret =3D UERR(EBUSY, gpu->dev, "Local counter usage active=
");
> > +             goto out_unlock;
> > +     }
> > +
> >       /*
> >        * Since pm_runtime and sysprof_active are both refcounts, we
> >        * call apply the new value first, and then unwind the previous
> > @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_priv=
ate *ctx,
> >
> >       switch (sysprof) {
> >       default:
> > -             return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysp=
rof);
> > +             ret =3D UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sys=
prof);
> > +             goto out_unlock;
> >       case 2:
> >               pm_runtime_get_sync(&gpu->pdev->dev);
> >               fallthrough;
> > @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_pri=
vate *ctx,
> >
> >       ctx->sysprof =3D sysprof;
> >
> > -     return 0;
> > +out_unlock:
> > +     mutex_unlock(&gpu->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +int msm_file_private_request_counters(struct msm_file_private *ctx,
> > +                                   struct msm_gpu *gpu, int reqctrs)
> > +{
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&gpu->lock);
> > +
> > +     if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
> > +             ret =3D UERR(EBUSY, gpu->dev, "System profiling active");
> > +             goto out_unlock;
> > +     }
> > +
> > +     if (reqctrs) {
> > +             if (ctx->counters_requested) {
> > +                     ret =3D UERR(EINVAL, gpu->dev, "Already requested=
");
> > +                     goto out_unlock;
> > +             }
> > +
> > +             ctx->counters_requested =3D true;
> > +             refcount_inc(&gpu->local_counters_active);
> > +     } else {
> > +             if (!ctx->counters_requested) {
> > +                     ret =3D UERR(EINVAL, gpu->dev, "Not requested");
> > +                     goto out_unlock;
> > +             }
> > +             refcount_dec(&gpu->local_counters_active);
> > +             ctx->counters_requested =3D false;
> > +     }
> > +
> > +out_unlock:
> > +     mutex_unlock(&gpu->lock);
> > +
> > +     return ret;
> >  }
> >
> >  void __msm_file_private_destroy(struct kref *kref)
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 2342cb90857e..ae7fb355e4a1 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -91,6 +91,7 @@ struct drm_msm_timespec {
> >  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> >  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> >  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-submit=
) perfcntr usage  */
> >
> >  /* For backwards compat.  The original support for preemption was base=
d on
> >   * a single ring per priority level so # of priority levels equals the=
 #
>
