Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBC3BAE45
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 20:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C213989A5C;
	Sun,  4 Jul 2021 18:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E196E89A5C;
 Sun,  4 Jul 2021 18:16:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t6so9273649wrm.9;
 Sun, 04 Jul 2021 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=miJU8b04qqipglFSfedfahzFO5P9/VuRwGLqZ5UonxA=;
 b=sadO98ciWj/6FqhCdSiYXg7eS3ipmrZ2bwJ3FAXgaAhoWhBPzbV+zMvsaChj7gP23C
 XQOkPXd65OjjNPZV2rIXp01e4FU2+nPoiCNBvlXmy2xzEoywupkzZOOHdpEMUja8I8SE
 AJE1Z/TmWfXPFtm3dCvO+aBBikKGryJ02zyI6zQ36zWIn2xzpIZIyeDCldXgjbT0Z3OX
 d0Ixb1PoaQ7zDQxIMg2Xwg5ji1KII2FugaR6OkpGiUs883u0ABnlYYgHI0GJGopadw16
 0eEMhd+B6iHPdg/LHOnlapBeFV3jJ64GeQ7rTPEMVgyYkxIhrc5HS9fW1VCQyoyUniAI
 +daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=miJU8b04qqipglFSfedfahzFO5P9/VuRwGLqZ5UonxA=;
 b=i42tYtKHTLXiHBoHlaRxMj+pMd8SFfuoVZECrhOA6YWZZcf5hnKA2k6fvIwzJF2rrr
 oNFT43gEzjWfW3XvAgFOG6H4C7S8iy2NoZjRSMWxcrtwkWBc0HJOvjJJRiFydJXiegfY
 krfv+xwdGzurM4/oXvyhIcwE5ZtzOn+K6oZksBtidgWACw14CFfaoS+iDjodOCfsolk0
 rLJLDgfR8dd3KI2EAkCDk7NzKxZSLQbGWwva4WHQdxuHxScBOBMfBwzIwmBtI7IaflAI
 WYONKM1kjk2d2s0Y5zWrmslizyOyr19n0FcH1hItk5KJl7fdLUsNeUWLILRngqe3SSkP
 Qwrw==
X-Gm-Message-State: AOAM531TUCYiJ98ZkSOhgSZib+q1iEIWW0Soi276YOm8Z2hMaGoIZirG
 oWCwXHR2Z8M365wPYuBp3Wi0oa/SLKywqLJSHFk=
X-Google-Smtp-Source: ABdhPJybAZlml4By7IUmHm+CwJj4AogiRenrlTNVsLwz2P5TR+I4uckHpD3LeJoevYMRoITwkCKKpvPkU3Zix9MNJIY=
X-Received: by 2002:adf:f48e:: with SMTP id l14mr7294511wro.28.1625422601605; 
 Sun, 04 Jul 2021 11:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com>
 <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
In-Reply-To: <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 4 Jul 2021 11:20:43 -0700
Message-ID: <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I suspect you are getting a dpu fault, and need:

https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/

I suppose Bjorn was expecting me to send that patch

BR,
-R

On Sun, Jul 4, 2021 at 5:53 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> I've had splash screen disabled on my RB3. However once I've enabled it,
> I've got the attached crash during the boot on the msm/msm-next. It
> looks like it is related to this particular set of changes.
>
> On 11/06/2021 00:44, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This picks up an earlier series[1] from Jordan, and adds additional
> > support needed to generate GPU devcore dumps on iova faults.  Original
> > description:
> >
> > This is a stack to add an Adreno GPU specific handler for pagefaults. The first
> > patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
> > a adreno-smmu-priv function hook to capture a handful of important debugging
> > registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
> > third patch to print more detailed information on page fault such as the TTBR0
> > for the pagetable that caused the fault and the source of the fault as
> > determined by a combination of the FSYNR1 register and an internal GPU
> > register.
> >
> > This code provides a solid base that we can expand on later for even more
> > extensive GPU side page fault debugging capabilities.
> >
> > v5: [Rob] Use RBBM_STATUS3.SMMU_STALLED_ON_FAULT to detect case where
> >      GPU snapshotting needs to avoid crashdumper, and check the
> >      RBBM_STATUS3.SMMU_STALLED_ON_FAULT in GPU hang irq paths
> > v4: [Rob] Add support to stall SMMU on fault, and let the GPU driver
> >      resume translation after it has had a chance to snapshot the GPUs
> >      state
> > v3: Always clear FSR even if the target driver is going to handle resume
> > v2: Fix comment wording and function pointer check per Rob Clark
> >
> > [1] https://lore.kernel.org/dri-devel/20210225175135.91922-1-jcrouse@codeaurora.org/
> >
> > Jordan Crouse (3):
> >    iommu/arm-smmu: Add support for driver IOMMU fault handlers
> >    iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault
> >      info
> >    drm/msm: Improve the a6xx page fault handler
> >
> > Rob Clark (2):
> >    iommu/arm-smmu-qcom: Add stall support
> >    drm/msm: devcoredump iommu fault support
> >
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  23 +++-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 110 +++++++++++++++++++-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  42 ++++++--
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
> >   drivers/gpu/drm/msm/msm_gem.h               |   1 +
> >   drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
> >   drivers/gpu/drm/msm/msm_gpu.c               |  48 +++++++++
> >   drivers/gpu/drm/msm/msm_gpu.h               |  17 +++
> >   drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
> >   drivers/gpu/drm/msm/msm_iommu.c             |  22 +++-
> >   drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
> >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 +++++++++
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
> >   include/linux/adreno-smmu-priv.h            |  38 ++++++-
> >   15 files changed, 367 insertions(+), 21 deletions(-)
> >
>
>
> --
> With best wishes
> Dmitry
