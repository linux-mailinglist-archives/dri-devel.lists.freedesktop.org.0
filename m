Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EC211CDB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867126EA59;
	Thu,  2 Jul 2020 07:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701256E88B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:11:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593598283; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=amiqoJGPjX9RNHOLVHTe5Q2mOjhh5iGIl3d/MtXJOIs=;
 b=K5FEw/0y3uLKvgjdq2AkfWk5lniKbewDzaxui6l8XlQ7xH3tJjp6DWLdwYJIm9FGOeWhwF7g
 H3dnOoUIScL2mCLpOb0GQ/Cz/c7MeN/gAd1pf2z1FtH5HkRcfVBAvrzo+Y0PZmRlDlLMYBp8
 Rgrg0GQFzl4LTQ0AgSmhAj67jt8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5efc613a4c9690533a499f7f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 10:11:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1CCD9C433C6; Wed,  1 Jul 2020 10:11:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B6F35C433C8;
 Wed,  1 Jul 2020 10:11:03 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 01 Jul 2020 15:41:03 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>, Jordan Crouse
 <jcrouse@codeaurora.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v9 0/7] iommu/arm-smmu: Enable split pagetable support
In-Reply-To: <20200626200042.13713-1-jcrouse@codeaurora.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
Message-ID: <bdc2a4348230f430138d320e49e188c0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm-owner@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Will, Robin,

On 2020-06-27 01:30, Jordan Crouse wrote:
> Another iteration of the split-pagetable support for arm-smmu and the 
> Adreno GPU
> SMMU. After email discussions [1] we opted to make a arm-smmu 
> implementation for
> specifically for the Adreno GPU and use that to enable split pagetable 
> support
> and later other implementation specific bits that we need.
> 
> On the hardware side this is very close to the same code from before 
> [2] only
> the TTBR1 quirk is turned on by the implementation and not a domain 
> attribute.
> In drm/msm we use the returned size of the aperture as a clue to let us 
> know
> which virtual address space we should use for global memory objects.
> 
> There are two open items that you should be aware of. First, in the
> implementation specific code we have to check the compatible string of 
> the
> device so that we only enable TTBR1 for the GPU (SID 0) and not the GMU 
> (SID 4).
> I went back and forth trying to decide if I wanted to use the 
> compatible string
> or the SID as the filter and settled on the compatible string but I 
> could be
> talked out of it.
> 
> The other open item is that in drm/msm the hardware only uses 49 bits 
> of the
> address space but arm-smmu expects the address to be sign extended all 
> the way
> to 64 bits. This isn't a problem normally unless you look at the 
> hardware
> registers that contain a IOVA and then the upper bits will be zero. I 
> opted to
> restrict the internal drm/msm IOVA range to only 49 bits and then sign 
> extend
> right before calling iommu_map / iommu_unmap. This is a bit wonky but I 
> thought
> that matching the hardware would be less confusing when debugging a 
> hang.
> 
> v9: Fix bot-detected merge conflict
> v7: Add attached device to smmu_domain to pass to implementation 
> specific
> functions
> 
> [1] 
> https://lists.linuxfoundation.org/pipermail/iommu/2020-May/044537.html
> [2] https://patchwork.kernel.org/patch/11482591/
> 
> 
> Jordan Crouse (7):
>   iommu/arm-smmu: Pass io-pgtable config to implementation specific
>     function
>   iommu/arm-smmu: Add support for split pagetables
>   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
>   iommu/arm-smmu: Add a pointer to the attached device to smmu_domain
>   iommu/arm-smmu: Add implementation for the adreno GPU SMMU
>   drm/msm: Set the global virtual address range from the IOMMU domain
>   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml   |  4 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 13 +++++-
>  drivers/gpu/drm/msm/msm_iommu.c               |  7 +++
>  drivers/iommu/arm-smmu-impl.c                 |  6 ++-
>  drivers/iommu/arm-smmu-qcom.c                 | 45 ++++++++++++++++++-
>  drivers/iommu/arm-smmu.c                      | 38 +++++++++++-----
>  drivers/iommu/arm-smmu.h                      | 30 ++++++++++---
>  8 files changed, 120 insertions(+), 25 deletions(-)

Any chance reviewing this?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
