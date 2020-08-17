Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23D246D3F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 18:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F082F89FCE;
	Mon, 17 Aug 2020 16:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F409D89FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 16:51:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597683076; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=7bT9k4r7Uf7DXP/z36+oB2Hl/lOdAosQQ1wDQbvtgKs=;
 b=FRHJvVYMe/kNvI5bEDPbSDlrMxU7lsktIDFOuWDG2PGi4G7SSLMeAEPCPhHMf40wvKeC1+2v
 QIZTFo8g8shzePrgxKN0epo4Chm7qHGHUAiCYn3y4iXZf3+Eg4YtIDzwPyPThg6p0TB0XgJP
 0eiCc5RQdCArxWMcrSpYd5C8seA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f3ab57f2b87d66049da3d24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 16:51:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6A042C43395; Mon, 17 Aug 2020 16:51:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87A36C433CB;
 Mon, 17 Aug 2020 16:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87A36C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 10:51:05 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 00/19] iommu/arm-smmu + drm/msm: per-process GPU pgtables
Message-ID: <20200817165105.GF3221@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 iommu@lists.linux-foundation.org, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 07:40:55PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> NOTE: Since Jordan was out today, and I wanted to keep things moving on
>       this, I took the liberty of respinning his series (originally
>       titled "iommu/arm-smmu: Add Adreno SMMU specific implementation")
>       with updates based on Will's review comments, and some fixes and
>       extra bits that I found in stress testing the series.  Original
>       commit msg and updated version history below.
> 
>       In general I like the private interface between adreno-smmu and
>       the GPU driver.  It should make for a more straightforward way
>       to extend things to optimize TLB invalidation in the future, for
>       example, rather than shoe-horning everything thru domain attrs.
>       And it lets us describe the get_ttbr1_cfg/set_ttrb0_cfg dance
>       more clearly.  Although it is going to make landing this via
>       iommu vs drm tree a bit more difficult.  Maybe there are some
>       arm-smmu parts of this series that could be pulled out to make
>       it not conflicty to land the private interface and adreno-smmu
>       bits via the drm tree?  (But I'm jumping a bit ahead here.  Just
>       wanted to point out that issue.)
> 
>       The complete series can be found at:
>       https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-pgtables
> 
> This series adds an Adreno SMMU implementation to arm-smmu to allow GPU hardware
> pagetable switching.
> 
> The Adreno GPU has built in capabilities to switch the TTBR0 pagetable during
> runtime to allow each individual instance or application to have its own
> pagetable.  In order to take advantage of the HW capabilities there are certain
> requirements needed of the SMMU hardware.
> 
> This series adds support for an Adreno specific arm-smmu implementation. The new
> implementation 1) ensures that the GPU domain is always assigned context bank 0,
> 2) enables split pagetable support (TTBR1) so that the instance specific
> pagetable can be swapped while the global memory remains in place and 3) shares
> the current pagetable configuration with the GPU driver to allow it to create
> its own io-pgtable instances.
> 
> The series then adds the drm/msm code to enable these features. For targets that
> support it allocate new pagetables using the io-pgtable configuration shared by
> the arm-smmu driver and swap them in during runtime.
> 
> This version of the series merges the previous patchset(s) [1] and [2]
> with the following improvements:
> 
> v13: (Respin by Rob)
>   - Switch to a private interface between adreno-smmu and GPU driver,
>     dropping the custom domain attr (Will Deacon)
>   - Rework the SCTLR.HUPCF patch to add new fields in smmu_domain->cfg
>     rather than adding new impl hook (Will Deacon)
>   - Drop for_each_cfg_sme() in favor of plain for() loop (Will Deacon)
>   - Fix context refcnt'ing issue which was causing problems with GPU
>     crash recover stress testing.
>   - Spiff up $debugfs/gem to show process information associated with
>     VMAs

I'll add the tags to Rob's code but in general I ack all these changes. I also 
like the private interface - it gives us the most flexibility without either
changing the IOMMU API or giving up entirely and making an internal SMMU
implementation inside drm/msm.

<snip>

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
