Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4321F0EE8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669736E19A;
	Sun,  7 Jun 2020 19:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972E76E8BE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 20:41:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c71so9535947wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n0dLEDcsQKGPvKzDLeUrtxbCh+UmpylB1JzsMXtkRB0=;
 b=PPqQPKP3lP/KvGYpaAD4Iw/mP/O0emsvgy0jaG43zHz70A9j1DfWJzQk46WfCJC3bs
 URrobrnzSjkOTdbzl4XlBl6XqKSc8VL35gPuSZ+IfJpZ0CnXPwgSLLKd3chSAaVQsKss
 nA0PTI0AceeziRoKUUjxbu2pYkCQ+EIVuRIYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0dLEDcsQKGPvKzDLeUrtxbCh+UmpylB1JzsMXtkRB0=;
 b=IkpclSZ7KML8QVXIjlqFhjl1K9ScsnkORyTpLFAX04wFVoyE6H4zoiwtqrCQVCOgkH
 3YpDdbDolQ4c/pwn+rwS3cNuqd7/Nr2xKgu8Xvx3jDaRi4tRyOI2XFFzFOHdy+oa9xat
 gI0jRsr8kmKcaQyqPcPGB9KrbdW8aliPShnH1TaIZk9b4aN96nx61Zu+w3K44YcSdn8h
 sNr6mIoQ61fxrOskrHLfqmxMiYL1gv9jO3twC22rPKMd8ck4rPizUYt9gbskwZV6fJd7
 wkG29U46JzsfQxjBKxYvPpaPSyWfloq3f2N0RITtfCORS2H2psZStyyy/mUSoa4f2gYS
 xEyA==
X-Gm-Message-State: AOAM531s98eZkQnaNPjoQZ8MK9zb7x1+Cn9FRQ03dHXVNuE8WFQiPNBU
 AtCPki6xh2QOplqXBLnKnNJbLafcyOasrfBIMNRXwA==
X-Google-Smtp-Source: ABdhPJxs+BxkS3AF0+q/b/Xo5ryvz7wOlPja9U3jS3XG5Ja4ITudzE9DCyXFmHodlRSajZra11uctLY+si5fPVfRA80=
X-Received: by 2002:a1c:e40a:: with SMTP id b10mr4208366wmh.41.1591389695905; 
 Fri, 05 Jun 2020 13:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
 <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
 <b6784faab54711eae215cfaf7433485f58d1d3f1.camel@suse.de>
 <CA+-6iNzutM0jfyHTOVZMn8_-MqHwJMAyoQTGMbU3vPnJKd8USA@mail.gmail.com>
 <f7278849ee08211a6446d7a5a8ffc163751b34bc.camel@suse.de>
In-Reply-To: <f7278849ee08211a6446d7a5a8ffc163751b34bc.camel@suse.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Fri, 5 Jun 2020 16:41:24 -0400
Message-ID: <CA+-6iNzBLKsX-n8m4Vsq0gJqnq25iWiq7c8ihzCQBO5NDF15-Q@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 David Kershner <david.kershner@unisys.com>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 5, 2020 at 1:27 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Christoph,
> a question arouse, is there a real value to dealing with PFNs (as opposed to
> real addresses) in the core DMA code/structures? I see that in some cases it
> eases interacting with mm, but the overwhelming usage of say,
> dev->dma_pfn_offset, involves shifting it.
>
> Hi Jim,
> On Thu, 2020-06-04 at 14:01 -0400, Jim Quinlan wrote:
> > Hi Nicolas,
>
> [...]
>
> > > I understand the need for dev to be around, devm_*() is key. But also it's
> > > important to keep the functions on purpose. And if of_dma_get_range() starts
> > > setting ranges it calls, for the very least, for a function rename. Although
> > > I'd rather split the parsing and setting of ranges as mentioned earlier.
> > > That
> > > said, I get that's a more drastic move.
> >
> > I agree with you.  I could do this from device.c:
> >
> >         of_dma_get_num_ranges(..., &num_ranges); /* new function */
> >         r = devm_kcalloc(dev, num_ranges + 1, sizeof(*r), GFP_KERNEL);
> >         of_dma_get_range(np, &dma_addr, &paddr, &size, r, num_ranges);
> >
> > The problem here is that there could be four ranges, all with
> > offset=0.  My current code would optimize this case out but the above
> > would have us holding useless memory and looping through the four
> > ranges on every dma <=> phys conversion only to add 0.
>
> Point taken. Ultimately it's setting the device's dma ranges in
> of_dma_get_range() that was really bothering me, so if we have to pass the
> device pointer for allocations, be it.
>
> > > Talking about drastic moves. How about getting rid of the concept of
> > > dma_pfn_offset for drivers altogether. Let them provide
> > > dma_pfn_offset_regions
> > > (even when there is only one). I feel it's conceptually nicer, as you'd be
> > > dealing only in one currency, so to speak, and you'd centralize the bus DMA
> > > ranges setter function which is always easier to maintain.
> > Do you agree that we have to somehow hang this info on the struct
> > device structure?  Because in the dma2phys() and phys2dma() all you
> > have is the dev parameter.  I don't see how this  can be done w/o
> > involving dev.
>
> Sorry I didn't make myself clear here. What bothers me is having two functions
> setting the same device parameter trough different means, I'd be happy to get
> rid of attach_uniform_dma_pfn_offset(), and always use the same function to set
> a device's bus dma regions. Something the likes of this comes to mind:
>
> dma_attach_pfn_offset_region(struct device *dev, struct dma_pfn_offset_regions *r)
>
> We could maybe use some helper macros for the linear case. But that's the gist
> of it.
>
> Also, it goes hand in hand with the comment below. Why having a special case
> for non sparse DMA offsets in struct dma_pfn_offset_regions? The way I see it,
> in this case, code simplicity is more interesting than a small optimization.
I've removed the special case and also need for 'dev' in
of_dma_get_range().  v4 is comming...
>
> > > I'd go as far as not creating a special case for uniform offsets. Let just
> > > set
> > > cpu_end and dma_end to -1 so we always get a match. It's slightly more
> > > compute
> > > heavy, but I don't think it's worth the optimization.
> > Well, there are two subcases here.  One where we do know the bounds
> > and one where we do not.  I suppose for the latter I could have the
> > drivers calling it with begin=0 and end=~(dma_addr_t)0.  Let me give
> > this some thought...
> >
> > > Just my two cents :)
> >
> > Worth much more than $0.02 IMO :-)
>
> BTW, would you consider renaming the DMA offset struct to something simpler
> like, struct bus_dma_region? It complements 'dev->bus_dma_limit' better IMO.
Will do

Thanks,
Jim
>
> > BTW, I tried putting the "if (dev->dma_pfn_offset_map)" clause inside
> > the inline functions but the problem is that it slows the fastpath;
> > consider the following code from dma-direct.h
> >
> >         if (dev->dma_pfn_offset_map) {
> >                 unsigned long dma_pfn_offset =
> dma_pfn_offset_from_phys_addr(dev, paddr);
> >
> >                 dev_addr -= ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
> >         }
> >         return dev_addr;
> >
> > becomes
> >
> >         unsigned long dma_pfn_offset = dma_pfn_offset_from_phys_addr(dev,
> paddr);
> >
> >         dev_addr -= ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
> >         return dev_addr;
> >
> > So those configurations that  have no dma_pfn_offsets are doing an
> > unnecessary shift and add.
>
> Fair enough. Still not a huge difference, but I see the value being the most
> common case.
>
> Regards,
> Nicolas
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
