Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05120CF42
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 16:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFDC89CE3;
	Mon, 29 Jun 2020 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62E289CE3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 14:52:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593442339; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SBDpthJsACP4X9l/XtUwp2evGNFSv28FhmlHvAnZ2bs=;
 b=sOUVcLIKd4v9XjFCcRhR5xrU9UAYju1b0/+ZsBHpB3i/h9vpzp83X0mZ2iVnj5HwVrZ+8HXN
 WP4/BIfUH3fTSxgSkyWXVnc5FIf81qEd0TsALaXIJbzS8pMpxUMmH7egsLhyhf5VqhT1SFfF
 ckhpivHXcpkuAE4gHL2QO5mBaJA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5efa001aa3d8a4474330b08c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 14:52:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DDF19C43391; Mon, 29 Jun 2020 14:52:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A262AC433C6;
 Mon, 29 Jun 2020 14:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A262AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 29 Jun 2020 08:52:04 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v9 6/7] drm/msm: Set the global virtual
 address range from the IOMMU domain
Message-ID: <20200629145203.GB25740@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Takashi Iwai <tiwai@suse.de>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 John Stultz <john.stultz@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-7-jcrouse@codeaurora.org>
 <CAF6AEGuNSAYNMG6CH6VMuyjiz5dfRoLWQ9OAFxPJrFmBrHe+Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuNSAYNMG6CH6VMuyjiz5dfRoLWQ9OAFxPJrFmBrHe+Wg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 10:10:14AM -0700, Rob Clark wrote:
> On Fri, Jun 26, 2020 at 1:01 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Use the aperture settings from the IOMMU domain to set up the virtual
> > address range for the GPU. This allows us to transparently deal with
> > IOMMU side features (like split pagetables).
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
> >  drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 5db06b590943..3e717c1ebb7f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -192,9 +192,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
> >         struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> >         struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> >         struct msm_gem_address_space *aspace;
> > +       u64 start, size;
> >
> > -       aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> > -               0xffffffff - SZ_16M);
> > +       /*
> > +        * Use the aperture start or SZ_16M, whichever is greater. This will
> > +        * ensure that we align with the allocated pagetable range while still
> > +        * allowing room in the lower 32 bits for GMEM and whatnot
> > +        */
> > +       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> > +       size = iommu->geometry.aperture_end - start + 1;
> > +
> > +       aspace = msm_gem_address_space_create(mmu, "gpu",
> > +               start & GENMASK(48, 0), size);
> 
> hmm, I kinda think this isn't going to play well for the 32b gpus
> (pre-a5xx).. possibly we should add address space size to 'struct
> adreno_info'?

I checked and qcom-iommu sets the aperture correctly so this should be okay for
everybody. To be honest, I'm nots sure if we even need to mask the start to 49
bits. It seems that all of the iommu implementations do the right thing.  Of
course it would be worth a check if you have a 4xx handy.

> Or I guess it is always going to be the same for all devices within a
> generation?  So it could just be passed in to adreno_gpu_init()

We can do that easily if we are worried about it (see also: a2xx). I just
figured this might save us a bit of code.

> Hopefully that makes things smoother if we someday had more than 48bits..

We'll be at 49 bits for as far ahead as I can see. 49 bits has a special
meaning in the SMMU so it is a natural fit for the GPU hardware. If we change in
N generations we can just shift to a family specific function at that point.

Jordan

> BR,
> -R
> 
> >
> >         if (IS_ERR(aspace) && !IS_ERR(mmu))
> >                 mmu->funcs->destroy(mmu);
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 3a381a9674c9..1b6635504069 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -36,6 +36,10 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
> >         struct msm_iommu *iommu = to_msm_iommu(mmu);
> >         size_t ret;
> >
> > +       /* The arm-smmu driver expects the addresses to be sign extended */
> > +       if (iova & BIT_ULL(48))
> > +               iova |= GENMASK_ULL(63, 49);
> > +
> >         ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> >         WARN_ON(!ret);
> >
> > @@ -46,6 +50,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
> >  {
> >         struct msm_iommu *iommu = to_msm_iommu(mmu);
> >
> > +       if (iova & BIT_ULL(48))
> > +               iova |= GENMASK_ULL(63, 49);
> > +
> >         iommu_unmap(iommu->domain, iova, len);
> >
> >         return 0;
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
