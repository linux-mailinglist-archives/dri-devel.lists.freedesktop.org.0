Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EEA33DA62
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 18:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0197489C08;
	Tue, 16 Mar 2021 17:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AAA89C08;
 Tue, 16 Mar 2021 17:13:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g8so10529454wmd.4;
 Tue, 16 Mar 2021 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zecumvBBM4+jVU12iC+gdz4LVIAiUhdUepbui1YKwE=;
 b=E9aoOV82C58+vaomBtbFVxX//WtC3oq/ii16cozwGQo5aEbhaTgmAldW+aw7I98vg4
 iYF6cs+3/dK28hr0j1LfquxkSBvAqydxt/vjxdfCX5Q8tn8MPdC4Uev+OyNyxdkpejAt
 zN9G+ZHogme9EflISXLdlQCf9KBBiEQWsnPAN5dHR2KT+RJyTfWEQYQl3UE41yVbJtqv
 //7I753ACb+diOJQIym4kWqsA96g4+Jf5tgXuk5pS2h56otAWBajUeaxuZ1e6/UlxWHJ
 w+cTwNsEw6TmAq9SL5UOwpppopOe1RDeemgT/TgHcN/bh6oEz3SZZFprtCpOKqVHyjk4
 Hy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zecumvBBM4+jVU12iC+gdz4LVIAiUhdUepbui1YKwE=;
 b=TsUNGC6Q8sLbxzdUq6Lc1kffGdSDZ//wwBl9xjsNBOlPoUrirMGNDZiO12myMgATSF
 hxtXH389NwWaRt0kUvUdICSrHVLDb5McOWjLJ/p+gFdRlYdu6ua1saipw61Iy4E8BHaP
 BlGzPTzF0uSDQ4XsJRhe4SXE4vZyj6NRAzaBHj09HHkbVD00B5wwgp6NSV895k/SZehS
 CL5PMNUScHUijU6RKM/QNOeAEecRz6UgjwBdNiVVBvkIB1AoSdjkl2GPAbI4J0T7mU3C
 VCvDy15CotUEPHt5eZS65XWGjBa+VNE15gveB9uVMKCnxc6e/cmJAStFrSK5RH7+I+f9
 gtUw==
X-Gm-Message-State: AOAM533+pscxD8fkhNkCohhU8Kz5yTr6IJp3DCUwkbhaAMRAxSMhdb3G
 dyW1w0J96L2pbj7k8PWGYyL+2yDaGyzUBy1opFc=
X-Google-Smtp-Source: ABdhPJxX7uiSPb/8phuyYwT9i6WAojMMq9tsUcba9CYDVfdj11bpGhVidfFXQpZ80Dq5Zc09ZeZxka/LY26IxCQ0nic=
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr81494wmk.49.1615914802934;
 Tue, 16 Mar 2021 10:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck>
 <CAF6AEGvjzkRqr8-z56tJdMs-LsoLMr1m5cVAq_++xCdHjTPKrQ@mail.gmail.com>
 <CAF6AEGveB=t0gQ0-WZn_qy=scYR60DEcum53saovg5h31ZMHog@mail.gmail.com>
In-Reply-To: <CAF6AEGveB=t0gQ0-WZn_qy=scYR60DEcum53saovg5h31ZMHog@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Mar 2021 10:16:31 -0700
Message-ID: <CAF6AEGuc5i9hMtfU3HSpLVWi_e=emJTPLqntzJfAH69dO_gagA@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 10:04 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Feb 3, 2021 at 2:14 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Feb 3, 2021 at 1:46 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2021-02-01 23:50, Jordan Crouse wrote:
> > > > > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
> > > > > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
> > > > > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > On 2021-01-29 14:35, Will Deacon wrote:
> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > > > +#define IOMMU_LLC        (1 << 6)
> > > > > > > > >
> > > > > > > > > On reflection, I'm a bit worried about exposing this because I think it
> > > > > > > > > will
> > > > > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > > > > > > > MAIR
> > > > > > > > > set up for this memory type). Now, we also have that issue for the PTW,
> > > > > > > > > but
> > > > > > > > > since we always use cache maintenance (i.e. the streaming API) for
> > > > > > > > > publishing the page-tables to a non-coheren walker, it works out.
> > > > > > > > > However,
> > > > > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > > > > > > > allocation, then they're potentially in for a nasty surprise due to the
> > > > > > > > > mismatched outer-cacheability attributes.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Can't we add the syscached memory type similar to what is done on android?
> > > > > > >
> > > > > > > Maybe. How does the GPU driver map these things on the CPU side?
> > > > > >
> > > > > > Currently we use writecombine mappings for everything, although there
> > > > > > are some cases that we'd like to use cached (but have not merged
> > > > > > patches that would give userspace a way to flush/invalidate)
> > > > > >
> > > > >
> > > > > LLC/system cache doesn't have a relationship with the CPU cache.  Its
> > > > > just a
> > > > > little accelerator that sits on the connection from the GPU to DDR and
> > > > > caches
> > > > > accesses. The hint that Sai is suggesting is used to mark the buffers as
> > > > > 'no-write-allocate' to prevent GPU write operations from being cached in
> > > > > the LLC
> > > > > which a) isn't interesting and b) takes up cache space for read
> > > > > operations.
> > > > >
> > > > > Its easiest to think of the LLC as a bonus accelerator that has no cost
> > > > > for
> > > > > us to use outside of the unfortunate per buffer hint.
> > > > >
> > > > > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> > > > > different hint) and in that case we have all of concerns that Will
> > > > > identified.
> > > > >
> > > >
> > > > For mismatched outer cacheability attributes which Will mentioned, I was
> > > > referring to [1] in android kernel.
> > >
> > > I've lost track of the conversation here :/
> > >
> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also mapped
> > > into the CPU and with what attributes? Rob said "writecombine for
> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
> >
> > Currently userspace asks for everything WC, so pgprot_writecombine()
> >
> > The kernel doesn't enforce this, but so far provides no UAPI to do
> > anything useful with non-coherent cached mappings (although there is
> > interest to support this)
> >
>
> btw, I'm looking at a benchmark (gl_driver2_off) where (after some
> other in-flight optimizations land) we end up bottlenecked on writing
> to WC cmdstream buffers.  I assume in the current state, WC goes all
> the way to main memory rather than just to system cache?
>

oh, I guess this (mentioned earlier in thread) is what I really want
for this benchmark:

https://android-review.googlesource.com/c/kernel/common/+/1549097/3

> BR,
> -R
>
> > BR,
> > -R
> >
> > > Finally, we need to be careful when we use the word "hint" as "allocation
> > > hint" has a specific meaning in the architecture, and if we only mismatch on
> > > those then we're actually ok. But I think IOMMU_LLC is more than just a
> > > hint, since it actually drives eviction policy (i.e. it enables writeback).
> > >
> > > Sorry for the pedantry, but I just want to make sure we're all talking
> > > about the same things!
> > >
> > > Cheers,
> > >
> > > Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
