Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C130B9AA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7486E8F9;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so15.mailgun.net (so15.mailgun.net [198.61.254.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5256E8C8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 06:26:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612247190; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=z7Jt7mLpbCjEtcnUQ9bOehTzH3Sk9XSsW7oxWAsa7AE=;
 b=l2vHYpfgEv9Q/BCS9E8KamcVTQjNJQWn2VpHM/lonuXuPoVcQjlIKJxZUCyZf+EFljGmRz3U
 xjrZiWV9YlFVUMbqzLLJQs24IaiQNxiDQwzocJ53U55EWZMME4KBSuL6XBC6HJVhzMV/zeNj
 s0uiWinUCiSAv04FW1B/EUVY6e4=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6018f095f71e8b9934df4186 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 06:26:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A749C43464; Tue,  2 Feb 2021 06:26:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D118C433C6;
 Tue,  2 Feb 2021 06:26:27 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 02 Feb 2021 11:56:27 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
In-Reply-To: <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
Message-ID: <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "list@263.net:IOMMU DRIVERS , 
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-01 23:50, Jordan Crouse wrote:
> On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
>> On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
>> >
>> > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
>> > > On 2021-01-29 14:35, Will Deacon wrote:
>> > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
>> > > > > Add a new page protection flag IOMMU_LLC which can be used
>> > > > > by non-coherent masters to set cacheable memory attributes
>> > > > > for an outer level of cache called as last-level cache or
>> > > > > system cache. Initial user of this page protection flag is
>> > > > > the adreno gpu and then can later be used by other clients
>> > > > > such as video where this can be used for per-buffer based
>> > > > > mapping.
>> > > > >
>> > > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> > > > > ---
>> > > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
>> > > > >  include/linux/iommu.h          | 6 ++++++
>> > > > >  2 files changed, 9 insertions(+)
>> > > > >
>> > > > > diff --git a/drivers/iommu/io-pgtable-arm.c
>> > > > > b/drivers/iommu/io-pgtable-arm.c
>> > > > > index 7439ee7fdcdb..ebe653ef601b 100644
>> > > > > --- a/drivers/iommu/io-pgtable-arm.c
>> > > > > +++ b/drivers/iommu/io-pgtable-arm.c
>> > > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
>> > > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>> > > > >           else if (prot & IOMMU_CACHE)
>> > > > >                   pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>> > > > >                           << ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> > > > > +         else if (prot & IOMMU_LLC)
>> > > > > +                 pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
>> > > > > +                         << ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> > > > >   }
>> > > > >
>> > > > >   if (prot & IOMMU_CACHE)
>> > > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> > > > > index ffaa389ea128..1f82057df531 100644
>> > > > > --- a/include/linux/iommu.h
>> > > > > +++ b/include/linux/iommu.h
>> > > > > @@ -31,6 +31,12 @@
>> > > > >   * if the IOMMU page table format is equivalent.
>> > > > >   */
>> > > > >  #define IOMMU_PRIV       (1 << 5)
>> > > > > +/*
>> > > > > + * Non-coherent masters can use this page protection flag to set
>> > > > > cacheable
>> > > > > + * memory attributes for only a transparent outer level of cache,
>> > > > > also known as
>> > > > > + * the last-level or system cache.
>> > > > > + */
>> > > > > +#define IOMMU_LLC        (1 << 6)
>> > > >
>> > > > On reflection, I'm a bit worried about exposing this because I think it
>> > > > will
>> > > > introduce a mismatched virtual alias with the CPU (we don't even have a
>> > > > MAIR
>> > > > set up for this memory type). Now, we also have that issue for the PTW,
>> > > > but
>> > > > since we always use cache maintenance (i.e. the streaming API) for
>> > > > publishing the page-tables to a non-coheren walker, it works out.
>> > > > However,
>> > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
>> > > > allocation, then they're potentially in for a nasty surprise due to the
>> > > > mismatched outer-cacheability attributes.
>> > > >
>> > >
>> > > Can't we add the syscached memory type similar to what is done on android?
>> >
>> > Maybe. How does the GPU driver map these things on the CPU side?
>> 
>> Currently we use writecombine mappings for everything, although there
>> are some cases that we'd like to use cached (but have not merged
>> patches that would give userspace a way to flush/invalidate)
>> 
>> BR,
>> -R
> 
> LLC/system cache doesn't have a relationship with the CPU cache.  Its 
> just a
> little accelerator that sits on the connection from the GPU to DDR and 
> caches
> accesses. The hint that Sai is suggesting is used to mark the buffers 
> as
> 'no-write-allocate' to prevent GPU write operations from being cached 
> in the LLC
> which a) isn't interesting and b) takes up cache space for read 
> operations.
> 
> Its easiest to think of the LLC as a bonus accelerator that has no cost 
> for
> us to use outside of the unfortunate per buffer hint.
> 
> We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> different hint) and in that case we have all of concerns that Will 
> identified.
> 

For mismatched outer cacheability attributes which Will mentioned, I was
referring to [1] in android kernel.

[1] https://android-review.googlesource.com/c/kernel/common/+/1549097/3

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
