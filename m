Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FEA95C176
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 01:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B75510EBEF;
	Thu, 22 Aug 2024 23:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cGOMvODy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45D510EBE8;
 Thu, 22 Aug 2024 23:15:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5bec7ee6f44so1960073a12.0; 
 Thu, 22 Aug 2024 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724368538; x=1724973338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlY1SNCKTKo0ttR05+nbVrXCxk2tU/xwtzki62FkZqk=;
 b=cGOMvODyevlWt2THlpKa3Q6fuabgQkHWUnpBSLv5wjprpOSNW3D/qvCIILrDgyN1cs
 x4PEUdJxGKcK3fjdI+3fMGOOrSxBSCIAfEW54O72hA7GttJj9zC1HzdMz9zIRj0+d6cp
 gXo1OlZM5ErdVyQCHpKl6pEY13/wOwdUT+8Sj63WQssnUVYiyxuko2ibIeAVWBjuNdWo
 l9I1Q2UgGW0NC+FnL1kdHGk4ac+j2x6z10dMOLY0DAs22M5PJvSdD29cQZNf+nQZCA5U
 WT736jfzSqKL4KvZpTIS8UNAmNKLRRRXnZ6twag/J2mMEz/uaRy17cHwOAbkQcRKMRmw
 5CQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724368538; x=1724973338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlY1SNCKTKo0ttR05+nbVrXCxk2tU/xwtzki62FkZqk=;
 b=i1dGWW9H818wQbAUx69C+Qigihb0jTd/FADuhj1MLptLGY1hUMkeOMaBmhFAw10FJq
 7ezdTQLeG/xYyzrckd+v2EO0L6rn/MrG1mMR8ej826FjZGxUlXUJVyozD3hLtfC9WSS/
 E18FxQQhQDRtTqENtJyVYMbkLkiLry7MLeIGqggFQYsiEei3ZAYCieGjAxZSMZlF8crj
 n3EN2EjOzzP9smlMxgMlGHYHukPwMmjLhmcOomfWLnnzplSRvzOiEoqzjk0VhWihQ5oi
 i3gkQObAgOrvggKQvmHkmNpggGQM6S2T2pECIWUD/byL48fJtnz5J1xm+t3oR2YK8B+2
 xmsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHBUQZ8yK/Tg3lBVgnqgK4ksGBXM9xv32OmpbAJsain9hWFu+8xEtK5N9zChFgBggrFHICJ1q9LyQ=@lists.freedesktop.org,
 AJvYcCVy/WWrh2ov48bPvqKZxS1x9/OvvfjxmRthGqBdxM3Kbu5xWiBOwc2uB5ibyWuxaERzuo0p+YMTrrqb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTVz0Rtrrl1e4opP68iB9FlpCM0CDP4NO8CrzSTBArC5dUj5DT
 x8w4cEnoXWNWcVFnvAAkFyz3AMeXc0/SQI2H3NFhdfxGnAxMOlQeBI9ThNBZtWgsuR6s9tcIr2z
 8GAmYxdiSHAcTnq5BhvTqqVOvcDc=
X-Google-Smtp-Source: AGHT+IHnSJYv0lPhOFFX0bl0T7rDppf3ajTMjwwg0WAsK4RjyNO+BvVGm1/RFj3FQoF0uV7st09q2ymgIkwION7q1MA=
X-Received: by 2002:a05:6402:40c5:b0:57c:9d54:67db with SMTP id
 4fb4d7f45d1cf-5c08916a094mr117351a12.9.1724368537311; Thu, 22 Aug 2024
 16:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240820171652.145673-1-robdclark@gmail.com>
 <20240820171652.145673-5-robdclark@gmail.com>
 <20240822203401.odfmdlqto6lsqefz@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240822203401.odfmdlqto6lsqefz@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Aug 2024 16:15:24 -0700
Message-ID: <CAF6AEGtGCT=TSp2XRmPaqb23dk42V_ic06OCB+JLEp6f5Y4tNg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] drm/msm: Extend gpu devcore dumps with pgtbl info
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Mostafa Saleh <smostafa@google.com>, 
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Aug 22, 2024 at 1:34=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Aug 20, 2024 at 10:16:47AM -0700, Rob Clark wrote: > From: Rob Cl=
ark <robdclark@chromium.org>
> >
> > In the case of iova fault triggered devcore dumps, include additional
> > debug information based on what we think is the current page tables,
> > including the TTBR0 value (which should match what we have in
> > adreno_smmu_fault_info unless things have gone horribly wrong), and
> > the pagetable entries traversed in the process of resolving the
> > faulting iova.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
> >  drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
> >  drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
> >  drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
> >  5 files changed, 51 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 1c6626747b98..3848b5a64351 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -864,6 +864,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_g=
pu_state *state,
> >               drm_printf(p, "  - dir=3D%s\n", info->flags & IOMMU_FAULT=
_WRITE ? "WRITE" : "READ");
> >               drm_printf(p, "  - type=3D%s\n", info->type);
> >               drm_printf(p, "  - source=3D%s\n", info->block);
> > +
> > +             /* Information extracted from what we think are the curre=
nt
> > +              * pgtables.  Hopefully the TTBR0 matches what we've extr=
acted
> > +              * from the SMMU registers in smmu_info!
> > +              */
> > +             drm_puts(p, "pgtable-fault-info:\n");
> > +             drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_tt=
br0);
>
> "0x" prefix? Otherwise, it is a bit confusing when the below one is
> decimal.

mixed feelings, the extra 0x is annoying when pasting into calc which
is a simple way to get binary decoding

OTOH none of this is machine decoded so I guess we could change it

> > +             drm_printf(p, "  - asid: %d\n", info->asid);
> > +             drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\=
n",
> > +                        info->ptes[0], info->ptes[1], info->ptes[2], i=
nfo->ptes[3]);
>
> Does crashdec decodes this?

No, it just passed thru for human eyeballs

crashdec _does_ have some logic to flag buffers that are "near" the
faulting iova to help identify if the fault is an underflow/overflow
(which has been, along with the pte trail, useful to debug some
issues)

BR,
-R

> -Akhil.
>
> >       }
> >
> >       drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 3666b42b4ecd..bf2f8b2a7ccc 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_=
gpu *gpu,
> >       if (submit) {
> >               int i;
> >
> > +             if (state->fault_info.ttbr0) {
> > +                     struct msm_gpu_fault_info *info =3D &state->fault=
_info;
> > +                     struct msm_mmu *mmu =3D submit->aspace->mmu;
> > +
> > +                     msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr=
0,
> > +                                                &info->asid);
> > +                     msm_iommu_pagetable_walk(mmu, info->iova, info->p=
tes);
> > +             }
> > +
> >               state->bos =3D kcalloc(submit->nr_bos,
> >                       sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gp=
u.h
> > index 1f02bb9956be..82e838ba8c80 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
> >       int flags;
> >       const char *type;
> >       const char *block;
> > +
> > +     /* Information about what we think/expect is the current SMMU sta=
te,
> > +      * for example expected_ttbr0 should match smmu_info.ttbr0 which
> > +      * was read back from SMMU registers.
> > +      */
> > +     phys_addr_t pgtbl_ttbr0;
> > +     u64 ptes[4];
> > +     int asid;
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_=
iommu.c
> > index 2a94e82316f9..3e692818ba1f 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geomet=
ry(struct msm_mmu *mmu)
> >       return &iommu->domain->geometry;
> >  }
> >
> > +int
> > +msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint=
64_t ptes[4])
> > +{
> > +     struct msm_iommu_pagetable *pagetable;
> > +     struct arm_lpae_io_pgtable_walk_data wd =3D {};
> > +
> > +     if (mmu->type !=3D MSM_MMU_IOMMU_PAGETABLE)
> > +             return -EINVAL;
> > +
> > +     pagetable =3D to_pagetable(mmu);
> > +
> > +     if (!pagetable->pgtbl_ops->pgtable_walk)
> > +             return -EINVAL;
> > +
> > +     pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &w=
d);
> > +
> > +     for (int i =3D 0; i < ARRAY_SIZE(wd.ptes); i++)
> > +             ptes[i] =3D wd.ptes[i];
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct msm_mmu_funcs pagetable_funcs =3D {
> >               .map =3D msm_iommu_pagetable_map,
> >               .unmap =3D msm_iommu_pagetable_unmap,
> > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mm=
u.h
> > index 88af4f490881..96e509bd96a6 100644
> > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > @@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct m=
sm_mmu *mmu, void *arg,
> >  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> >
> >  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> > -             int *asid);
> > +                            int *asid);
> > +int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, =
uint64_t ptes[4]);
> >  struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *m=
mu);
> >
> >  #endif /* __MSM_MMU_H__ */
> > --
> > 2.46.0
> >
