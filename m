Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A230AC77
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 17:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7896E838;
	Mon,  1 Feb 2021 16:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97F66E825;
 Mon,  1 Feb 2021 16:18:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c12so17216475wrc.7;
 Mon, 01 Feb 2021 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tVx3P1GkJGLI1uKBNlxXY3RMDtB/IpyYjPT6P6zHw5s=;
 b=gS7cvhd9tIsWsQWamd844erzMzEv+0azffG4y1wnD7p6yHLCPnwK1aG4LbChngEOSC
 8/weiexIBXRCHk53nWXfv/Iyj8jDwsjtuplhe5CGty81EU/CxmmwQ9qj8Ad2xBUhkyoa
 BPLiuGV/g9R2Y7wGLkD2eEL7eY3SBOT0jaoYns5AV+pkP8mD83TDp1eXF5osBlCtAEfx
 Af01yVytJ4pAuQAfCOc/FCxZosdmRwhn4p6PIWo/9BtvnILStCOvKMcOVQbspyJmReZk
 zUXVtvGTZgeNd/BAfuhrvN9U1c7h8QzABedZOgYceTPH3Ot98yLe651CV1PaIFqQSYeN
 V5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tVx3P1GkJGLI1uKBNlxXY3RMDtB/IpyYjPT6P6zHw5s=;
 b=BuaIEGLLWzWFaVTA/oChTk1R6mjr49qXFRM3VvMPqFtel4KotW7PMzERs6wETfcq3q
 HVXpMi5jaF6FwfK6HX0Uzf0giSR9/yO0v3am9ERvTGE7d9ZuVtjNxtfMsU5uqjWIW8sP
 R9ptXT7r8OYlj6thgS5oqJjUukRW7c5oUwHTNZH/WZm/yCtg1IfZ6H8lxs2ERfX3caZc
 8vRinZFEI/aj5Ja6FePuZpEGVWtcjnoRchJ3yFsNnlMoPUO236fmUrAKeEOcoM0x5578
 xj82W0w1+B5chgHhUuagnCDsiB3h81fB21PtJT57fsZwmdgvCWmjFJU/ZN2AUb0Iy4XL
 +WJw==
X-Gm-Message-State: AOAM5305ugXanqf+vCYBlU34niNSmqY9eSLsho45hvV1tOIjxRrVlvLI
 eOlHMgbnTYV/lMg3ul3aPVlZrub3uwkZyDPdDbQ=
X-Google-Smtp-Source: ABdhPJx8q9wwVZBia3ylOOk6tIuKE9b+ySiZiBv3V7ppswlXm6ZEtFt5l8YWZ+VVvUpdPPdbcnjj4tChykQ3ODiG83E=
X-Received: by 2002:adf:dd07:: with SMTP id a7mr19293832wrm.83.1612196290263; 
 Mon, 01 Feb 2021 08:18:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
In-Reply-To: <20210201111556.GA7172@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Feb 2021 08:20:44 -0800
Message-ID: <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
To: Will Deacon <will@kernel.org>
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
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Kristian H Kristensen <hoegsberg@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > On 2021-01-29 14:35, Will Deacon wrote:
> > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > Add a new page protection flag IOMMU_LLC which can be used
> > > > by non-coherent masters to set cacheable memory attributes
> > > > for an outer level of cache called as last-level cache or
> > > > system cache. Initial user of this page protection flag is
> > > > the adreno gpu and then can later be used by other clients
> > > > such as video where this can be used for per-buffer based
> > > > mapping.
> > > >
> > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > > ---
> > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
> > > >  include/linux/iommu.h          | 6 ++++++
> > > >  2 files changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/iommu/io-pgtable-arm.c
> > > > b/drivers/iommu/io-pgtable-arm.c
> > > > index 7439ee7fdcdb..ebe653ef601b 100644
> > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
> > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
> > > >           else if (prot & IOMMU_CACHE)
> > > >                   pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
> > > >                           << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > > +         else if (prot & IOMMU_LLC)
> > > > +                 pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
> > > > +                         << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > >   }
> > > >
> > > >   if (prot & IOMMU_CACHE)
> > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > > index ffaa389ea128..1f82057df531 100644
> > > > --- a/include/linux/iommu.h
> > > > +++ b/include/linux/iommu.h
> > > > @@ -31,6 +31,12 @@
> > > >   * if the IOMMU page table format is equivalent.
> > > >   */
> > > >  #define IOMMU_PRIV       (1 << 5)
> > > > +/*
> > > > + * Non-coherent masters can use this page protection flag to set
> > > > cacheable
> > > > + * memory attributes for only a transparent outer level of cache,
> > > > also known as
> > > > + * the last-level or system cache.
> > > > + */
> > > > +#define IOMMU_LLC        (1 << 6)
> > >
> > > On reflection, I'm a bit worried about exposing this because I think it
> > > will
> > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > MAIR
> > > set up for this memory type). Now, we also have that issue for the PTW,
> > > but
> > > since we always use cache maintenance (i.e. the streaming API) for
> > > publishing the page-tables to a non-coheren walker, it works out.
> > > However,
> > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > allocation, then they're potentially in for a nasty surprise due to the
> > > mismatched outer-cacheability attributes.
> > >
> >
> > Can't we add the syscached memory type similar to what is done on android?
>
> Maybe. How does the GPU driver map these things on the CPU side?

Currently we use writecombine mappings for everything, although there
are some cases that we'd like to use cached (but have not merged
patches that would give userspace a way to flush/invalidate)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
