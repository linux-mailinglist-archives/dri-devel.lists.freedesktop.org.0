Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4AF20C3E9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 21:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68C66E249;
	Sat, 27 Jun 2020 19:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73966E143;
 Sat, 27 Jun 2020 19:55:41 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id ga4so12437484ejb.11;
 Sat, 27 Jun 2020 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOPfoXRxkPWp2u0z5mv5D29mlE3sBKTSjg6aVVNHMmI=;
 b=ADOMlQVgmyn0JbKIm7nurXpb8KAlP8vwxxcUdXLQDZaEWBo6nqINqhDqQzbDVtcuGu
 dcG4BcF6ktIIdoYhiVl5rZR9ZZxfZeXAJ90oi/HD374aYjhBBXXP2XESpFGCQLGWqHg9
 4I7qe4sQPaxIiQCiotoKnAwJT7aDVwt+rPgHcQcZFt9yz+Q+3MeZsYxzD3hmtCAlj+Lt
 bzhja5CD1NZpdVH1wtlZY0s6GYPUr5PxaR4DrE0PREvMK6OGxgkPE5oXcjdEdl7UjCWO
 6PUAXoefoiHafUucYJhqJyEPgRGt4xiipf82dkDZpQspI4KGFpZSEitw43zE1Mhzm6al
 NYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOPfoXRxkPWp2u0z5mv5D29mlE3sBKTSjg6aVVNHMmI=;
 b=oZ6aCQG2rWKz0Ip/Ed6MmjQnE10xXQEfGBIdDpFcnkS3AQFwqYneq5M9q8jfsHm25K
 cjXBlkkugP6M0emoqKOEm1/2uu1pFarxxi3yUrDEpd+CwMTzpTrYHmgKkrZtVBjVllWi
 pALvPmh9g4g9EDaEitGF85PcVCr+f3uXjx4sHETBoNh7F3w4IDPx0y4EkDir/hYIjk06
 juP837JPGhbFfKYZDfe5YlkuTZh7KTRJ1ZdWURDuSNpQNcpcL/158Hh2hIKY9cPvQmR0
 vYYt75fytgOk1SsB6HUrSGG2PIk7XlQj8hpuWV0jXzQfubBNJu9+GG2OxmQ8hAzG91Ye
 VRAg==
X-Gm-Message-State: AOAM531E32pc+q3NyoMJITUnneobRSttMG4rUH83bsfP2VY1LSfTyqXg
 HooeAeCIgsmAJ2S+o4mmpfMusmAGHXxg8cU1xCw=
X-Google-Smtp-Source: ABdhPJyr67bO1u4l0SujwKghbBcBSRSMmsE0uuFjMfuxxLWVEf5xomeGYdDv+Tk2qeoHV4EBherSjl1CPzPASNo+sb4=
X-Received: by 2002:a17:906:494a:: with SMTP id
 f10mr8135393ejt.428.1593287740217; 
 Sat, 27 Jun 2020 12:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-7-jcrouse@codeaurora.org>
In-Reply-To: <20200626200414.14382-7-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 27 Jun 2020 12:56:09 -0700
Message-ID: <CAF6AEGvFPtiFcBg5j3An5piPWy3Sg3=-o2k8Xzzf6anzVi9_ZA@mail.gmail.com>
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

On Fri, Jun 26, 2020 at 1:04 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add support for using per-instance pagetables if all the dependencies are
> available.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index aa53f47b7e8b..95ed2ceac121 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -79,6 +79,34 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>         OUT_RING(ring, upper_32_bits(iova));
>  }
>
> +static void a6xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> +               struct msm_file_private *ctx)
> +{
> +       phys_addr_t ttbr;
> +       u32 asid;
> +
> +       if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> +               return;
> +
> +       /* Execute the table update */
> +       OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> +       OUT_RING(ring, lower_32_bits(ttbr));
> +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> +       /* CONTEXTIDR is currently unused */
> +       OUT_RING(ring, 0);
> +       /* CONTEXTBANK is currently unused */
> +       OUT_RING(ring, 0);
> +
> +       /*
> +        * Write the new TTBR0 to the memstore. This is good for debugging.
> +        */
> +       OUT_PKT7(ring, CP_MEM_WRITE, 4);
> +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
> +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
> +       OUT_RING(ring, lower_32_bits(ttbr));
> +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> +}
> +
>  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>         struct msm_file_private *ctx)
>  {
> @@ -89,6 +117,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>         struct msm_ringbuffer *ring = submit->ring;
>         unsigned int i;
>
> +       a6xx_set_pagetable(gpu, ring, ctx);
> +
>         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
>                 rbmemptr_stats(ring, index, cpcycles_start));
>
> @@ -872,6 +902,18 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>         return (unsigned long)busy_time;
>  }
>
> +struct msm_gem_address_space *a6xx_address_space_instance(struct msm_gpu *gpu)
> +{
> +       struct msm_mmu *mmu;
> +
> +       mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> +       if (IS_ERR(mmu))
> +               return msm_gem_address_space_get(gpu->aspace);
> +
> +       return msm_gem_address_space_create(mmu,
> +               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> +}
> +
>  static const struct adreno_gpu_funcs funcs = {
>         .base = {
>                 .get_param = adreno_get_param,
> @@ -895,6 +937,7 @@ static const struct adreno_gpu_funcs funcs = {
>                 .gpu_state_put = a6xx_gpu_state_put,
>  #endif
>                 .create_address_space = adreno_iommu_create_address_space,
> +               .address_space_instance = a6xx_address_space_instance,

Hmm, maybe instead of .address_space_instance, something like
.create_context_address_space?

Since like .create_address_space, it is creating an address space..
the difference is that it is a per context/process aspace..

BR,
-R

>         },
>         .get_timestamp = a6xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 7764373d0ed2..0987d6bf848c 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
>         volatile uint32_t fence;
>
>         volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> +       volatile u64 ttbr0;
>  };
>
>  struct msm_ringbuffer {
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
