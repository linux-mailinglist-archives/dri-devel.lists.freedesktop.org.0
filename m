Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D353BDEF6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 23:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D616E5B4;
	Tue,  6 Jul 2021 21:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCAE6E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 21:36:30 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u11so964838oiv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g1JVJiy081ll+MGQFYrIQnx64nTijHCUrQkv8Wk47Uc=;
 b=SyDsjtI7l4Qry4skD2wvLmbuIkvNN1DlMY1bPGWVilUzHBLHLszzbhcD+3jRO1BOeL
 lPlxDNr9OBbxW7Z4hlnB9l48IidslH2YiYqrethULXiC1PNWksDnRHAeao6WJawnXMNd
 1CCd7Akwq1gi9MNdYTkbDsmSHc0mGNT0DCDNTAOSAUbdYORIfQAqrlv+kEyM+BltHMrD
 lwqGEKx+C7f4LfErjREh2fdktEV49PtQKKMkYjan0SLl4E4KU/d2PUfDCskbx3eEj3Vc
 Rx7q4Tj40TD2dFd/+OuyoTCY1cDXjN/i4QianJReUl7zhzm2mzMaWDbTrh9HtraTluUN
 ntjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g1JVJiy081ll+MGQFYrIQnx64nTijHCUrQkv8Wk47Uc=;
 b=JMEruDfF7cMxfAbZpcgJHSImfA9SHWvJ5DiK4Bm0gadaBUCBfX2ttgIs4TqIg8eBgn
 YKTFjKxJRBOP11yg6/HyB95lpaZtBKH4Uv5QdKYWbPLAKpiyW7JZiCrcvKwQ70V+yMRV
 +4MP6JswWL5O/1bMevakhKpu36I+8++yVpabcri1MCB0wCSm76ENN5m/5OnRAbL4bQqJ
 7sW+5c1wj0xvtbrIgYEhTRPh77NRhPfUdWW/KeBjjuKOZQPqTiQRDM7qKc7tmDXVj3Fp
 dxm9EqS3cEvOnrWgAzVz/ahCiWaDqUdCSe7hReAytCJGlmzu3L9bo9pHC8AFY4g5d57G
 lotg==
X-Gm-Message-State: AOAM530jQXN2oIhlN++1Ezhtozcn4Ml4V9TW/guRIJzVTKwhDP28uPgw
 fdtnuM0BvuCrovrydaY3fPzyfg==
X-Google-Smtp-Source: ABdhPJxF6cWhxvYgLYDEaV3IFuw7TC+iaZZc2k3kqPOFIabTy82sv63HUgNyNOI+CBJ6updHj0tIvA==
X-Received: by 2002:a05:6808:f0a:: with SMTP id
 m10mr302995oiw.145.1625607390057; 
 Tue, 06 Jul 2021 14:36:30 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v134sm289352oie.28.2021.07.06.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:36:29 -0700 (PDT)
Date: Tue, 6 Jul 2021 16:36:26 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
Message-ID: <YOTM2g9t0/gvNxuh@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
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
 Zhenzhong Duan <zhenzhong.duan@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun 04 Jul 13:20 CDT 2021, Rob Clark wrote:

> I suspect you are getting a dpu fault, and need:
> 
> https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
> 
> I suppose Bjorn was expecting me to send that patch
> 

No, I left that discussion with the same understanding as you... But I
ended up side tracked by some other craziness.

Did you post this somewhere or would you still like me to test it and
spin a patch?

Regards,
Bjorn

> BR,
> -R
> 
> On Sun, Jul 4, 2021 at 5:53 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Hi,
> >
> > I've had splash screen disabled on my RB3. However once I've enabled it,
> > I've got the attached crash during the boot on the msm/msm-next. It
> > looks like it is related to this particular set of changes.
> >
> > On 11/06/2021 00:44, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This picks up an earlier series[1] from Jordan, and adds additional
> > > support needed to generate GPU devcore dumps on iova faults.  Original
> > > description:
> > >
> > > This is a stack to add an Adreno GPU specific handler for pagefaults. The first
> > > patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
> > > a adreno-smmu-priv function hook to capture a handful of important debugging
> > > registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
> > > third patch to print more detailed information on page fault such as the TTBR0
> > > for the pagetable that caused the fault and the source of the fault as
> > > determined by a combination of the FSYNR1 register and an internal GPU
> > > register.
> > >
> > > This code provides a solid base that we can expand on later for even more
> > > extensive GPU side page fault debugging capabilities.
> > >
> > > v5: [Rob] Use RBBM_STATUS3.SMMU_STALLED_ON_FAULT to detect case where
> > >      GPU snapshotting needs to avoid crashdumper, and check the
> > >      RBBM_STATUS3.SMMU_STALLED_ON_FAULT in GPU hang irq paths
> > > v4: [Rob] Add support to stall SMMU on fault, and let the GPU driver
> > >      resume translation after it has had a chance to snapshot the GPUs
> > >      state
> > > v3: Always clear FSR even if the target driver is going to handle resume
> > > v2: Fix comment wording and function pointer check per Rob Clark
> > >
> > > [1] https://lore.kernel.org/dri-devel/20210225175135.91922-1-jcrouse@codeaurora.org/
> > >
> > > Jordan Crouse (3):
> > >    iommu/arm-smmu: Add support for driver IOMMU fault handlers
> > >    iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault
> > >      info
> > >    drm/msm: Improve the a6xx page fault handler
> > >
> > > Rob Clark (2):
> > >    iommu/arm-smmu-qcom: Add stall support
> > >    drm/msm: devcoredump iommu fault support
> > >
> > >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  23 +++-
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 110 +++++++++++++++++++-
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  42 ++++++--
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
> > >   drivers/gpu/drm/msm/msm_gem.h               |   1 +
> > >   drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
> > >   drivers/gpu/drm/msm/msm_gpu.c               |  48 +++++++++
> > >   drivers/gpu/drm/msm/msm_gpu.h               |  17 +++
> > >   drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
> > >   drivers/gpu/drm/msm/msm_iommu.c             |  22 +++-
> > >   drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
> > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 +++++++++
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
> > >   include/linux/adreno-smmu-priv.h            |  38 ++++++-
> > >   15 files changed, 367 insertions(+), 21 deletions(-)
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
