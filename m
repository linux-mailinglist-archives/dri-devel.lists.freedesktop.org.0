Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8E44CAB1E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAA710EC86;
	Wed,  2 Mar 2022 17:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB36310EC86;
 Wed,  2 Mar 2022 17:07:00 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso2202440ots.7; 
 Wed, 02 Mar 2022 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ez6WyL9F1jUYJ3lwjI5LoseBaGemqthQn8NeyAQi/A=;
 b=k2sTbLZtgUHm7BzG1bv5xZPCz9YsEeMyhAhcgtCW4cpaDA9faQlY97bI9u4zgAtJ/D
 Pq6urEO3TQbQ5a8IccWZFJzS5fPDqs+dy5GqaeCnDZuW0qJF+hvG7xeMm+CUguETjak6
 rs00ZR17XdP1fsUK9ZCwrQfxLzXdWkEcssKCwPw1K9/Lzpq/8y8OS917eO3WRLZXHj7l
 B/RTh9uowjHkbxSGDmI6R9qWC2Geytri6PzdcmBucZFdlBYBVBaKpQrUQ3LBkp4Lc6YS
 J38L1Qcork/bccQWUBv8FyVvuZk1x5NLDJkTqH0AxgBPtleytj1pCm0GT/mtaW3IkR50
 VvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ez6WyL9F1jUYJ3lwjI5LoseBaGemqthQn8NeyAQi/A=;
 b=aigoSaxhW74rWkpZ2Ptl6Xd6CVEm63Gkyp6kh+cKtBjkFfbwF53EqiY+/NVE3WDHvR
 OBy02ukPJmZdzFC22lWxcmgZiAMC2pgCQASSN0pFey0jWdOpJuMlBUL9e8grnDBWKzxN
 eDDodzldU7shLnzgmbrxVacYbrtiue87IqurX64Df6Y8dtvLBSOV7FhSjicVwHl7cpun
 Abu8rXx3+nDvUlARi/0kydbDb1a8WxJybxeH9eP/LAUbjWm4P6h+k2YMOgzHS8xB3zB6
 GIMOgxsa+bCySViLUsAz4hcDt2fTlZ9o9xil2T1vmCaVSDpD7kBLpcLr18iaA1gPqRis
 8PqA==
X-Gm-Message-State: AOAM532sNaLJwrVym2JKAEIYPIlaIFHpfS0gQSn3dfPiidUij1/41yI5
 CfqicRvOG9Qeudbpnpd6DX51yWNbViacAxOaZF8=
X-Google-Smtp-Source: ABdhPJxysHgKDsB4dSbLgvNNZTo4s2zTUPd66Id1zg8IPF8n3SHLBi5sx8GtFxTtZt4Y7f0DmqykPu5QwgjVXm6/Dl8=
X-Received: by 2002:a9d:5a06:0:b0:5af:b5fd:5b72 with SMTP id
 v6-20020a9d5a06000000b005afb5fd5b72mr16310414oth.200.1646240819901; Wed, 02
 Mar 2022 09:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <5c254623-98d2-75f3-52cb-209b8de304b6@arm.com>
 <3750c398-e8fb-c4e1-ba31-e6ac5fbc01d0@intel.com>
 <2f82d150-47c4-d7c3-50da-eaf4aa4a24af@arm.com>
 <49e4a740-c127-0d5d-e2e8-3ff482fdce3c@intel.com>
In-Reply-To: <49e4a740-c127-0d5d-e2e8-3ff482fdce3c@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Mar 2022 12:06:48 -0500
Message-ID: <CADnq5_MM0wdb+gU5ZKdFMh2X9LXoy=ayuu6Qn6J0r1dri_5K=A@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
To: Michael Cheng <michael.cheng@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 balasubramani.vivekanandan@intel.com, Will Deacon <will@kernel.org>,
 wayne.boyer@intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 casey.g.bowman@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 2, 2022 at 10:55 AM Michael Cheng <michael.cheng@intel.com> wrote:
>
> Thanks for the feedback Robin!
>
> Sorry my choices of word weren't that great, but what I meant is to
> understand how ARM flushes a range of dcache for device drivers, and not
> an equal to x86 clflush.
>
> I believe the concern is if the CPU writes an update, that update might
> only be sitting in the CPU cache and never make it to device memory
> where the device can see it; there are specific places that we are
> supposed to flush the CPU caches to make sure our updates are visible to
> the hardware.
>
> +Matt Roper
>
> Matt, Lucas, any feed back here?

MMIO (e.g., PCI BARs, etc.) should be mapped uncached.  If it's not
you'll have a lot of problems using a GPU on that architecture.  One
thing that you may want to check is if your device has its own caches
or write queues on the BAR aperture.  You may have to flush them after
CPU access to the BAR to make sure CPU updates land in device memory.
For system memory, PCI, per the spec, should be cache coherent with
the CPU.  If it's not, you'll have a lot of trouble using a GPU on
that platform.

Alex

>
> On 2022-03-02 4:49 a.m., Robin Murphy wrote:
> > On 2022-02-25 19:27, Michael Cheng wrote:
> >> Hi Robin,
> >>
> >> [ +arm64 maintainers for their awareness, which would have been a
> >> good thing to do from the start ]
> >>
> >>   * Thanks for adding the arm64 maintainer and sorry I didn't rope them
> >>     in sooner.
> >>
> >> Why does i915 need to ensure the CPU's instruction cache is coherent
> >> with its data cache? Is it a self-modifying driver?
> >>
> >>   * Also thanks for pointing this out. Initially I was using
> >>     dcache_clean_inval_poc, which seem to be the equivalently to what
> >>     x86 is doing for dcache flushing, but it was giving me build errors
> >>     since its not on the global list of kernel symbols. And after
> >>     revisiting the documentation for caches_clean_inval_pou, it won't
> >>     fly for what we are trying to do. Moving forward, what would you (or
> >>     someone in the ARM community) suggest we do? Could it be possible to
> >>     export dcache_clean_inval_poc as a global symbol?
> >
> > Unlikely, unless something with a legitimate need for CPU-centric
> > cache maintenance like kexec or CPU hotplug ever becomes modular.
> >
> > In the case of a device driver, it's not even the basic issues of
> > assuming to find direct equivalents to x86 semantics in other CPU
> > architectures, or effectively reinventing parts of the DMA API, it's
> > even bigger than that. Once you move from being integrated in a single
> > vendor's system architecture to being on a discrete card, you
> > fundamentally *no longer have any control over cache coherency*.
> > Whether the host CPU architecture happens to be AArch64, RISC-V, or
> > whatever doesn't really matter, you're at the mercy of 3rd-party PCIe
> > and interconnect IP vendors, and SoC integrators. You'll find yourself
> > in systems where PCIe simply cannot snoop any caches, where you'd
> > better have the correct DMA API calls in place to have any hope of
> > even the most basic functionality working properly; you'll find
> > yourself in systems where even if the PCIe root complex claims to
> > support No Snoop, your uncached traffic will still end up snooping
> > stale data that got prefetched back into caches you thought you'd
> > invalidated; you'll find yourself in systems where your memory
> > attributes may or may not get forcibly rewritten by an IOMMU depending
> > on the kernel config and/or command line.
> >
> > It's not about simply finding a substitute for clflush, it's that the
> > reasons you have for using clflush in the first place can no longer be
> > assumed to be valid.
> >
> > Robin.
> >
> >> On 2022-02-25 10:24 a.m., Robin Murphy wrote:
> >>> [ +arm64 maintainers for their awareness, which would have been a
> >>> good thing to do from the start ]
> >>>
> >>> On 2022-02-25 03:24, Michael Cheng wrote:
> >>>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
> >>>> performs a flush by first performing a clean, follow by an
> >>>> invalidation
> >>>> operation.
> >>>>
> >>>> v2 (Michael Cheng): Use correct macro for cleaning and invalidation
> >>>> the
> >>>>             dcache. Thanks Tvrtko for the suggestion.
> >>>>
> >>>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
> >>>>
> >>>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
> >>>>             symbol that could be use by other modules, thus use
> >>>>             caches_clean_inval_pou instead. Also this version
> >>>>                 removes include for cacheflush, since its already
> >>>>             included base on architecture type.
> >>>>
> >>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> >>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> >>>> ---
> >>>>   drivers/gpu/drm/drm_cache.c | 5 +++++
> >>>>   1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> >>>> index c3e6e615bf09..81c28714f930 100644
> >>>> --- a/drivers/gpu/drm/drm_cache.c
> >>>> +++ b/drivers/gpu/drm/drm_cache.c
> >>>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned
> >>>> long length)
> >>>>         if (wbinvd_on_all_cpus())
> >>>>           pr_err("Timed out waiting for cache flush\n");
> >>>> +
> >>>> +#elif defined(CONFIG_ARM64)
> >>>> +    void *end = addr + length;
> >>>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
> >>>
> >>> Why does i915 need to ensure the CPU's instruction cache is coherent
> >>> with its data cache? Is it a self-modifying driver?
> >>>
> >>> Robin.
> >>>
> >>> (Note that the above is somewhat of a loaded question, and I do
> >>> actually have half an idea of what you're trying to do here and why
> >>> it won't fly, but I'd like to at least assume you've read the
> >>> documentation of the function you decided was OK to use)
> >>>
> >>>> +
> >>>>   #else
> >>>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
> >>>>   #endif
