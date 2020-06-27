Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7820C400
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 22:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5C06E277;
	Sat, 27 Jun 2020 20:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E46E143;
 Sat, 27 Jun 2020 20:10:46 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id a1so12471213ejg.12;
 Sat, 27 Jun 2020 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvFGEF8OQKRNOdTThxO4mSS3pmEh4Sth0PxOZAiiU9w=;
 b=ZkczlMlYgLmDEIgpuMYVPxVUwH25OX4UkAbT8RGHyr8rOr2obCNmx/f0UdfXyfzJ6X
 tAjLhymak1PByU2agtLgQE1EyPFOiB8RQO1kFgOEiKzcgu7vtVzJ2woMpYqE1n6063kX
 V4AeTB2tXHcgrfgXj+Hj50l4m08Uj/RCM9m+1OrrFSy/sEZFIaA9gwMHcC0YzZaqUaaq
 Vi32+XBpEAoFb8zU+Jkof0bB6otMFaxT8A00j1SAANAhw1LbmK0+/hkT/3y7uvzKrVds
 6vSd+E2/LctVwj5vSNu7hlaGbxmyTu9jHCXLeSyAD/O6LsqJ/A9f5v+Veg6HGKx5UOW0
 2hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvFGEF8OQKRNOdTThxO4mSS3pmEh4Sth0PxOZAiiU9w=;
 b=DWmViHrC9p8hqdjI722O5FW3ACkjxMYV7e/uS9+q0FnVr5dBp7OrDwVkLmxL1jfZ5g
 5X4XbfH5fGBHpWmcw8OTvd6a9KTY9zUtANi97NXsqaY4TSjIeMoCRATUhPxJZwhGU66A
 lvqzaPhO1qDHzzFXt2z6eu4PtQ4AK/deBDcvp8yjN8ZZ1C8wGokZCViMVe7qr1XMJ0Aa
 RV5JtKpWV+B0cmMPIvgz+7Brlnu0gJ21klzC2mtUgiBTrW7KXM37mc63+FSRru/GQUHC
 kT7fty1h975qcP40QL7dijyQMcuEipvdtmC6e6a0EwgqeRyVd7HMzOcwqCJZA9P3K1mH
 Sziw==
X-Gm-Message-State: AOAM533AH7mEf+WOrSBqjVAdx5e3e2OWBis+yEBWZbMI304rHK6V4/TW
 adsFxhtLVrFzI1GFwikN1CnRKaOS9OyU/rux64s=
X-Google-Smtp-Source: ABdhPJwOxGplWLBlisk2UrHg/GYUedfqMRKzfwJp7QZyvgFLE2N26xAuVYH3A7+dfo+EXaqssd09fWyFab6CsSfI1Zs=
X-Received: by 2002:a17:906:ca4c:: with SMTP id
 jx12mr7211771ejb.231.1593288644820; 
 Sat, 27 Jun 2020 13:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-7-jcrouse@codeaurora.org>
 <CAF6AEGvFPtiFcBg5j3An5piPWy3Sg3=-o2k8Xzzf6anzVi9_ZA@mail.gmail.com>
In-Reply-To: <CAF6AEGvFPtiFcBg5j3An5piPWy3Sg3=-o2k8Xzzf6anzVi9_ZA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 27 Jun 2020 13:11:14 -0700
Message-ID: <CAF6AEGtOcA1V33KgaYKjn=FBk9_q4u8fF5Tgoyq7Y3vUp2pKjg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Add support for per-instance
 pagetables
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 12:56 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jun 26, 2020 at 1:04 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Add support for using per-instance pagetables if all the dependencies are
> > available.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
> >  2 files changed, 44 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index aa53f47b7e8b..95ed2ceac121 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -79,6 +79,34 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
> >         OUT_RING(ring, upper_32_bits(iova));
> >  }
> >
> > +static void a6xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> > +               struct msm_file_private *ctx)
> > +{
> > +       phys_addr_t ttbr;
> > +       u32 asid;
> > +
> > +       if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> > +               return;
> > +
> > +       /* Execute the table update */
> > +       OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> > +       OUT_RING(ring, lower_32_bits(ttbr));
> > +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> > +       /* CONTEXTIDR is currently unused */
> > +       OUT_RING(ring, 0);
> > +       /* CONTEXTBANK is currently unused */
> > +       OUT_RING(ring, 0);
> > +
> > +       /*
> > +        * Write the new TTBR0 to the memstore. This is good for debugging.
> > +        */
> > +       OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
> > +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
> > +       OUT_RING(ring, lower_32_bits(ttbr));
> > +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> > +}
> > +
> >  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> >         struct msm_file_private *ctx)
> >  {
> > @@ -89,6 +117,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> >         struct msm_ringbuffer *ring = submit->ring;
> >         unsigned int i;
> >
> > +       a6xx_set_pagetable(gpu, ring, ctx);
> > +
> >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> >                 rbmemptr_stats(ring, index, cpcycles_start));
> >
> > @@ -872,6 +902,18 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
> >         return (unsigned long)busy_time;
> >  }
> >
> > +struct msm_gem_address_space *a6xx_address_space_instance(struct msm_gpu *gpu)
> > +{
> > +       struct msm_mmu *mmu;
> > +
> > +       mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> > +       if (IS_ERR(mmu))
> > +               return msm_gem_address_space_get(gpu->aspace);
> > +
> > +       return msm_gem_address_space_create(mmu,
> > +               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> > +}
> > +
> >  static const struct adreno_gpu_funcs funcs = {
> >         .base = {
> >                 .get_param = adreno_get_param,
> > @@ -895,6 +937,7 @@ static const struct adreno_gpu_funcs funcs = {
> >                 .gpu_state_put = a6xx_gpu_state_put,
> >  #endif
> >                 .create_address_space = adreno_iommu_create_address_space,
> > +               .address_space_instance = a6xx_address_space_instance,
>
> Hmm, maybe instead of .address_space_instance, something like
> .create_context_address_space?
>
> Since like .create_address_space, it is creating an address space..
> the difference is that it is a per context/process aspace..
>


or maybe just .create_pgtable and return the 'struct msm_mmu' (which
is itself starting to become less of a great name)..

The only other thing a6xx_address_space_instance() adds is knowing
where the split is between the kernel and user pgtables, and I suppose
that isn't a thing that would really be changing between gens?

BR,
-R

> BR,
> -R
>
> >         },
> >         .get_timestamp = a6xx_get_timestamp,
> >  };
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > index 7764373d0ed2..0987d6bf848c 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
> >         volatile uint32_t fence;
> >
> >         volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> > +       volatile u64 ttbr0;
> >  };
> >
> >  struct msm_ringbuffer {
> > --
> > 2.17.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
