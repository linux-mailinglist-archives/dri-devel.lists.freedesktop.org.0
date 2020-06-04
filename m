Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45D1EF1EB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F6B6E86A;
	Fri,  5 Jun 2020 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B116E530
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 18:01:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l11so7153883wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y1HOhau1QgJPY/iv80N48xA11IBhnwiT7E4izajriu4=;
 b=e0wo2l8l3gPkszsjBVUQvXwE5A7XjXu7ZrrLtCm+cM2IplpdBV+hToWEuaSjJJ9HL4
 EhUVFbyOoRWPbD5enXXAmzF24AUwMuUKLS5ZpqCnxSpXK/5wxJ6JAO2LEvQbQc2LvI7t
 /354l7Fx3IrqUBZyGg89M2iQ9+Zv33GeB8j1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1HOhau1QgJPY/iv80N48xA11IBhnwiT7E4izajriu4=;
 b=MEujb+Lm+EyV0ctbAg/BTP3cdcn+mAShL4+rB66tmq0ps5m59VPcWu+7BeDv89tD6Y
 uApeQsrZ8JzAdJSdQqfSzEjuKosEu+7Qig1VvdfmZlLpKckkxWt25py5cjUlJC1XEO/W
 2ScV1cE6kesTGGmndMEroPLJd2uPZBiRhOLC+VrrPc+lKtZjdaHoMQ0b24YomnNZRtLk
 CDKPly2Rq9tTlnai9gok4G8N9nUztB07XtXkavjWm2Boq6pJb5ugrSpJKiEyjRlMifm1
 oKBX1pzAq6MJgUjVNYXsY377jqOJpcPGh+goxJKOJ7VYAZ5AG8t42fXrCIMi8f5upfmt
 1ACQ==
X-Gm-Message-State: AOAM530jrnGEAt+84pZgkJKrMvf/eLNVbt3tTPtthCqfMk58NDpyYVIA
 BhEFK0+Wd0SP0but6cGMlGF09xqxZPqHseGPP9VBUQ==
X-Google-Smtp-Source: ABdhPJw2jc0AJSq8HJLm2ApWGNzk2RvcrPXJnulOO/CF/Fi3pKCLwQm/0V/O8FjzoORb6pXEWgz4gCNWpf92o+66In0=
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr5612872wrj.415.1591293705078; 
 Thu, 04 Jun 2020 11:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
 <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
 <b6784faab54711eae215cfaf7433485f58d1d3f1.camel@suse.de>
In-Reply-To: <b6784faab54711eae215cfaf7433485f58d1d3f1.camel@suse.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 4 Jun 2020 14:01:31 -0400
Message-ID: <CA+-6iNzutM0jfyHTOVZMn8_-MqHwJMAyoQTGMbU3vPnJKd8USA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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

Hi Nicolas,

On Thu, Jun 4, 2020 at 12:52 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Jim,
>
> On Thu, 2020-06-04 at 10:35 -0400, Jim Quinlan wrote:
>
> [...]
>
> > > > --- a/arch/sh/kernel/dma-coherent.c
> > > > +++ b/arch/sh/kernel/dma-coherent.c
> > > > @@ -14,6 +14,8 @@ void *arch_dma_alloc(struct device *dev, size_t size,
> > > > dma_addr_t *dma_handle,
> > > >  {
> > > >       void *ret, *ret_nocache;
> > > >       int order = get_order(size);
> > > > +     unsigned long pfn;
> > > > +     phys_addr_t phys;
> > > >
> > > >       gfp |= __GFP_ZERO;
> > > >
> > > > @@ -34,11 +36,14 @@ void *arch_dma_alloc(struct device *dev, size_t size,
> > > > dma_addr_t *dma_handle,
> > > >               return NULL;
> > > >       }
> > > >
> > > > -     split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
> > > > +     phys = virt_to_phys(ret);
> > > > +     pfn =  phys >> PAGE_SHIFT;
> > >
> > > nit: not sure it really pays off to have a pfn variable here.
> > Did it for readability; the compiler's optimization should take care
> > of any extra variables.  But I can switch if you insist.
>
> No need.
>
> [...]
>
> > > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > index 055eb0b8e396..2d66d415b6c3 100644
> > > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > @@ -898,7 +898,10 @@ static int sun6i_csi_probe(struct platform_device
> > > > *pdev)
> > > >
> > > >       sdev->dev = &pdev->dev;
> > > >       /* The DMA bus has the memory mapped at 0 */
> > > > -     sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
> > > > +     ret = attach_uniform_dma_pfn_offset(sdev->dev,
> > > > +                                         PHYS_OFFSET >> PAGE_SHIFT);
> > > > +     if (ret)
> > > > +             return ret;
> > > >
> > > >       ret = sun6i_csi_resource_request(sdev, pdev);
> > > >       if (ret)
> > > > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > > > index 96d8cfb14a60..c89333b0a5fb 100644
> > > > --- a/drivers/of/address.c
> > > > +++ b/drivers/of/address.c
> > > > @@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct
> > > > device_node
> > > > *np, int index,
> > > >  }
> > > >  EXPORT_SYMBOL(of_io_request_and_map);
> > > >
> > > > +static int attach_dma_pfn_offset_map(struct device *dev,
> > > > +                                  struct device_node *node, int
> > > > num_ranges)
> > >
> > > As with the previous review, please take this comment with a grain of salt.
> > >
> > > I think there should be a clear split between what belongs to OF and what
> > > belongs to the core device infrastructure.
> > >
> > > OF's job should be to parse DT and provide a list/array of ranges, whereas
> > > the
> > > core device infrastructure should provide an API to assign a list of
> > > ranges/offset to a device.
> > >
> > > As a concrete example, you're forcing devices like the sta2x11 to build with
> > > OF
> > > support, which, being an Intel device, it's pretty odd. But I'm also
> > > thinking
> > > of how will all this fit once an ACPI device wants to use it.
> > To fix this I only have to move attach_uniform_dma_pfn_offset() from
> > of/address.c to say include/linux/dma-mapping.h.  It has no
> > dependencies on OF.  Do you agree?
>
> Yes that seems nicer. In case you didn't had it in mind already, I'd change the
> function name to match the naming scheme they use there.
>
> On the other hand, I'd also move the non OF parts of the non unifom dma_offset
> version of the function there.
>
> > > Expanding on this idea, once you have a split between the OF's and device
> > > core
> > > roles, it transpires that of_dma_get_range()'s job should only be to provide
> > > the ranges in a device understandable structure and of_dma_configre()'s to
> > > actually assign the device's parameters. This would obsolete patch #7.
> >
> > I think you mean patch #8.
>
> Yes, my bad.
>
> > I agree with you.  The reason I needed a "struct device *"  in the call is
> > because I wanted to make sure the memory that is alloc'd belongs to the
> > device that needs it.  If I do a regular kzalloc(), this memory  will become
> > a leak once someone starts unbinding/binding their device.  Also, in  all
> > uses of of_dma_rtange() -- there is only one --  a dev is required as one
> > can't attach an offset map to NULL.
> >
> > I do see that there are a number of functions in drivers/of/*.c that
> > take 'struct device *dev' as an argument so there is precedent for
> > something like this.  Regardless, I need an owner to the memory I
> > alloc().
>
> I understand the need for dev to be around, devm_*() is key. But also it's
> important to keep the functions on purpose. And if of_dma_get_range() starts
> setting ranges it calls, for the very least, for a function rename. Although
> I'd rather split the parsing and setting of ranges as mentioned earlier. That
> said, I get that's a more drastic move.

I agree with you.  I could do this from device.c:

        of_dma_get_num_ranges(..., &num_ranges); /* new function */
        r = devm_kcalloc(dev, num_ranges + 1, sizeof(*r), GFP_KERNEL);
        of_dma_get_range(np, &dma_addr, &paddr, &size, r, num_ranges);

The problem here is that there could be four ranges, all with
offset=0.  My current code would optimize this case out but the above
would have us holding useless memory and looping through the four
ranges on every dma <=> phys conversion only to add 0.

>
> Talking about drastic moves. How about getting rid of the concept of
> dma_pfn_offset for drivers altogether. Let them provide dma_pfn_offset_regions
> (even when there is only one). I feel it's conceptually nicer, as you'd be
> dealing only in one currency, so to speak, and you'd centralize the bus DMA
> ranges setter function which is always easier to maintain.
Do you agree that we have to somehow hang this info on the struct
device structure?  Because in the dma2phys() and phys2dma() all you
have is the dev parameter.  I don't see how this  can be done w/o
involving dev.
>
> I'd go as far as not creating a special case for uniform offsets. Let just set
> cpu_end and dma_end to -1 so we always get a match. It's slightly more compute
> heavy, but I don't think it's worth the optimization.
Well, there are two subcases here.  One where we do know the bounds
and one where we do not.  I suppose for the latter I could have the
drivers calling it with begin=0 and end=~(dma_addr_t)0.  Let me give
this some thought...

>
> Just my two cents :)

Worth much more than $0.02 IMO :-)

BTW, I tried putting the "if (dev->dma_pfn_offset_map)" clause inside
the inline functions but the problem is that it slows the fastpath;
consider the following code from dma-direct.h

        if (dev->dma_pfn_offset_map) {
                unsigned long dma_pfn_offset =
dma_pfn_offset_from_phys_addr(dev, paddr);

                dev_addr -= ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
        }
        return dev_addr;

becomes

        unsigned long dma_pfn_offset  =
dma_pfn_offset_from_phys_addr(dev, paddr);

        dev_addr -= ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
        return dev_addr;

So those configurations that  have no dma_pfn_offsets are doing an
unnecessary shift and add.

Thanks much,
Jim Quinlan

>
> > > > +{
> > > > +     struct of_range_parser parser;
> > > > +     struct of_range range;
> > > > +     struct dma_pfn_offset_region *r;
> > > > +
> > > > +     r = devm_kcalloc(dev, num_ranges + 1,
> > > > +                      sizeof(struct dma_pfn_offset_region), GFP_KERNEL);
> > > > +     if (!r)
> > > > +             return -ENOMEM;
> > > > +     dev->dma_pfn_offset_map = r;
> > > > +     of_dma_range_parser_init(&parser, node);
> > > > +
> > > > +     /*
> > > > +      * Record all info for DMA ranges array.  We could
> > > > +      * just use the of_range struct, but if we did that it
> > > > +      * would require more calculations for phys_to_dma and
> > > > +      * dma_to_phys conversions.
> > > > +      */
> > > > +     for_each_of_range(&parser, &range) {
> > > > +             r->cpu_start = range.cpu_addr;
> > > > +             r->cpu_end = r->cpu_start + range.size - 1;
> > > > +             r->dma_start = range.bus_addr;
> > > > +             r->dma_end = r->dma_start + range.size - 1;
> > > > +             r->pfn_offset = PFN_DOWN(range.cpu_addr)
> > > > +                     - PFN_DOWN(range.bus_addr);
> > > > +             r++;
> > > > +     }
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +
> > > > +
> > > > +/**
> > > > + * attach_dma_pfn_offset - Assign scalar offset for all addresses.
> > > > + * @dev:     device pointer; only needed for a corner case.
> > >
> > > That's a huge corner :P
> > Good point; I'm not really sure what percent of Linux configurations
> > require a dma_pfn_offset.  I'll drop the "corner".
> >
> > > > + * @dma_pfn_offset:  offset to apply when converting from phys addr
> > > > + *                   to dma addr and vice versa.
> > > > + *
> > > > + * It returns -ENOMEM if out of memory, otherwise 0.
> > > > + */
> > > > +int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long
> > > > pfn_offset)
> > >
> > > As I say above, does this really belong to of/address.c?
> > No it does not.  Will fix.
> >
> > > > +{
> > > > +     struct dma_pfn_offset_region *r;
> > > > +
> > > > +     if (!dev)
> > > > +             return -ENODEV;
> > > > +
> > > > +     if (!pfn_offset)
> > > > +             return 0;
> > > > +
> > > > +     r = devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region),
> > > > +                      GFP_KERNEL);
> > > > +     if (!r)
> > > > +             return -ENOMEM;
> > >
> > > I think you're missing this:
> > >
> > >         dev->dma_pfn_offset_map = r;
> > >
> > That's a showstopper!  DanC also pointed it out but I still didn't see
> > it.  Thanks!
> >
> > > > +
> > > > +     r->uniform_offset = true;
> > > > +     r->pfn_offset = pfn_offset;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
> > > > +
> > > >  /**
> > > >   * of_dma_get_range - Get DMA range info
> > > >   * @dev:     device pointer; only needed for a corner case.
> > > > @@ -933,7 +997,7 @@ EXPORT_SYMBOL(of_io_request_and_map);
> > > >   *   CPU addr (phys_addr_t)  : pna cells
> > > >   *   size                    : nsize cells
> > > >   *
> > > > - * It returns -ENODEV if "dma-ranges" property was not found
> > > > + * It returns -ENODEV if !dev or "dma-ranges" property was not found
> > > >   * for this device in DT.
> > > >   */
> > > >  int of_dma_get_range(struct device *dev, struct device_node *np, u64
> > > > *dma_addr,
> > > > @@ -946,7 +1010,13 @@ int of_dma_get_range(struct device *dev, struct
> > > > device_node *np, u64 *dma_addr,
> > > >       bool found_dma_ranges = false;
> > > >       struct of_range_parser parser;
> > > >       struct of_range range;
> > > > +     phys_addr_t cpu_start = ~(phys_addr_t)0;
> > > >       u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> > > > +     bool dma_multi_pfn_offset = false;
> > > > +     int num_ranges = 0;
> > > > +
> > > > +     if (!dev)
> > > > +             return -ENODEV;
> > >
> > > Shouldn't this be part of patch #7?
> > Do you mean #8?  Do you mean the test for !dev?   It is not required
> > for #8 so I thought I'd keep these two changes separate.  I could
> > squash them.
>
> #8, of course.
>
> It's more of a subjective matter, but to me it fits better #8's description and
> keeps this one more focused. That said, it's just a comment, do as you please.
>
> Regads,
> Nicolas
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
