Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61739333DC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 23:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5C10E8ED;
	Tue, 16 Jul 2024 21:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U8c4FOYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87FE10E8ED;
 Tue, 16 Jul 2024 21:50:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38027so6286694a12.1; 
 Tue, 16 Jul 2024 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721166643; x=1721771443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyXvBuWkFl7+fBJpGUNnFM5Z57w9S40Q8xfHQuAIhyY=;
 b=U8c4FOYoE+iDNrZH+hCjbScJdY03K4ob4EqKpfqVYwFiT6h5WNuAOJO4dqweqD/XeZ
 qMMLzhzjj7z3At+pgVNYWlC3bFMFv2Ju9JF6PDPWisjssak3n4Iv3ad0M1a7KgTcdwSE
 iN2fRk4Wwv7Js9S3hKzma6pEoEDaRO6NTcNxJE0xxAMq/+ABjB4UWY5SMmRJGap7xIvD
 kzsVC2+EHXEG1CCN+CPft5GIUG2EaYWJGvurE1HKs7VI291BYa1g9/v0Dpz82RNKF4I5
 bTvPStmm0two7pgJajsvpsO6uBwIHmMCujE7vervsQ1Hlc14RWKJiet2qDdHHTl95jBb
 O2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721166643; x=1721771443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyXvBuWkFl7+fBJpGUNnFM5Z57w9S40Q8xfHQuAIhyY=;
 b=Zp2uPHtZbWI9BCPxoEktRBxs9XEPwiYjloT25h2koLeLuibvVABqgQuoeSan/o/JV4
 Tl/5dp128MiFCMQ5IGWWP9PhVMFVRi3Hr3eJm9OL/0P/GcAlNhto2AT9OOLtoE06xoZ8
 jGImB8gS4bst53MNTNGn+UkmaXgz0LkCXA7+5RspjKLBPMF9MccGx5xRB6DPKSfpZxbl
 M1P5eI47Yx6Iy5thZCiOOCWBDEhGBt/9oNVlhfHR4LLimRMLzjBPY6i4kEwvJoGQcpUD
 JVV4OJO2a14hURw+a6gtqTX89bAoCkPNANmTzOqZVcI3eDURcNn/FHjmnRnVMhd6AsMQ
 0KDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVna+qjRuyW0kBz/CLR46AZfGXIiQ0tp+bJSvwAMMb64r9uxLx/jHEHEwxAeBhe8gOHIGLRWdTvBDXed49U3vrnX3z5hObIczvgGQAj7++Ebvo0dkjhnpGOyoN4eQsaOAiC/zxkH/vRHSziMAEQK0Vn
X-Gm-Message-State: AOJu0YzmPfyQbu/MQ2u/Y587aLTtJRqF3SzQJWsiLBTQYISg+ItuSXPy
 YQIKz+dIM3BDNE2fBIBO0FDh6MxwNbO7NfbZCs+/mdFHDKs/XIWuqkcg+3/r8UUPwcF9QvBqItC
 1t0uoSJ8lfx0vkXjcGvvgK6JuaHc=
X-Google-Smtp-Source: AGHT+IGOSFeYk5lokiAb+SUTHo13Ke4nMwkSdDmfplMaIf2MiIKKsehlw3Da3JwlhmTGBLrNwWhX77liKSLSBtoAOaw=
X-Received: by 2002:a05:6402:5106:b0:57c:5eed:4ebf with SMTP id
 4fb4d7f45d1cf-59eeec2c4f1mr2945406a12.19.1721166642931; Tue, 16 Jul 2024
 14:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
 <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
In-Reply-To: <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Jul 2024 14:50:30 -0700
Message-ID: <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 16, 2024 at 2:45=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
>
>
> On 7/15/2024 12:51 PM, Rob Clark wrote:
> > On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> >>> There is no recovery mechanism in place yet to recover from mmu
> >>> faults for DPU. We can only prevent the faults by making sure there
> >>> is no misconfiguration.
> >>>
> >>> Rate-limit the snapshot capture for mmu faults to once per
> >>> msm_kms_init_aspace() as that should be sufficient to capture
> >>> the snapshot for debugging otherwise there will be a lot of
> >>> dpu snapshots getting captured for the same fault which is
> >>> redundant and also might affect capturing even one snapshot
> >>> accurately.
> >>
> >> Please squash this into the first patch. There is no need to add code
> >> with a known defficiency.
> >>
> >> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
> >
> > So, in some ways devcoredump is ratelimited by userspace needing to
> > clear an existing devcore..
> >
>
> Yes, a new devcoredump device will not be created until the previous one
> is consumed or times out but here I am trying to limit even the DPU
> snapshot capture because DPU register space is really huge and the rate
> at which smmu faults occur is quite fast that its causing instability
> while snapshots are being captured.
>
> > What I'd suggest would be more useful is to limit the devcores to once
> > per atomic update, ie. if display state hasn't changed, maybe an
> > additional devcore isn't useful
> >
> > BR,
> > -R
> >
>
> By display state change, do you mean like the checks we have in
> drm_atomic_crtc_needs_modeset()?
>
> OR do you mean we need to cache the previous (currently picked up by hw)
> state and trigger a new devcores if the new state is different by
> comparing more things?
>
> This will help to reduce the snapshots to unique frame updates but I do
> not think it will reduce the rate enough for the case where DPU did not
> recover from the previous fault.

I was thinking the easy thing, of just resetting the counter in
msm_atomic_commit_tail().. I suppose we could be clever filter out
updates that only change scanout address.  Or hash the atomic state
and only generate devcoredumps for unique states.  But I'm not sure
how over-complicated we should make this.

BR,
-R

>
> >>
> >>>
> >>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
> >>>   drivers/gpu/drm/msm/msm_kms.h | 3 +++
> >>>   2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_=
kms.c
> >>> index d5d3117259cf..90a333920c01 100644
> >>> --- a/drivers/gpu/drm/msm/msm_kms.c
> >>> +++ b/drivers/gpu/drm/msm/msm_kms.c
> >>> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsi=
gned long iova, int flags, void
> >>>   {
> >>>        struct msm_kms *kms =3D arg;
> >>>
> >>> -     msm_disp_snapshot_state(kms->dev);
> >>> +     if (!kms->fault_snapshot_capture) {
> >>> +             msm_disp_snapshot_state(kms->dev);
> >>> +             kms->fault_snapshot_capture++;
> >>
> >> When is it decremented?
> >>
> >>> +     }
> >>>
> >>>        return -ENOSYS;
> >>>   }
> >>> @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace=
(struct drm_device *dev)
> >>>                mmu->funcs->destroy(mmu);
> >>>        }
> >>>
> >>> +     kms->fault_snapshot_capture =3D 0;
> >>>        msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_hand=
ler);
> >>>
> >>>        return aspace;
> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_=
kms.h
> >>> index 1e0c54de3716..240b39e60828 100644
> >>> --- a/drivers/gpu/drm/msm/msm_kms.h
> >>> +++ b/drivers/gpu/drm/msm/msm_kms.h
> >>> @@ -134,6 +134,9 @@ struct msm_kms {
> >>>        int irq;
> >>>        bool irq_requested;
> >>>
> >>> +     /* rate limit the snapshot capture to once per attach */
> >>> +     int fault_snapshot_capture;
> >>> +
> >>>        /* mapper-id used to request GEM buffer mapped for scanout: */
> >>>        struct msm_gem_address_space *aspace;
> >>>
> >>> --
> >>> 2.44.0
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
