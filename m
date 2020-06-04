Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286261EF1D3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73546E852;
	Fri,  5 Jun 2020 07:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB166E509
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 16:28:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r15so6319378wmh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvFBAxlrt2J9jb0QdDsGu7K922VoXgCGTJpM/HBK+Qk=;
 b=Nwm8d//+sjH3Z9mufLz/+WKylqV8GnlqZP5cDZilNehMRs3XQT7l8Tg489oBe2Bv5H
 K23RVr8/sl/WjZcrBeLCXT1Z5LKkPJSqD059Mdrq9I69Yz6Dg0doVUUnBcL4wDHjhYva
 Qf30ZckaVxPcfdXWBXJlmMCnpDqNXJqy90Nhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvFBAxlrt2J9jb0QdDsGu7K922VoXgCGTJpM/HBK+Qk=;
 b=AT0pCO8uPQOl7aWIz5ToOkAJJjfjz2Z1uNN/3VYida+peVeLpx+9huUW4fOe242U/U
 Is0xDPfqinSG4feFtmr3SLbyorhnYBYFykqwTh8V1YntahFlhwQGhuLmkDekVpG2FORY
 DFG1AbLYf9tRs567x2FQ2sS+1gwioTMOnVP2s+7PvP1hlR53uHxT1J/HUnXlQQIrkAsw
 asIOAbEVvkajKui1g9nZFFdRLS7uo8kIi+rde5WT4aUcVQQ31W4wq1mzHTLyJDTFsLpb
 cQreUJcx4T6FbENEzzw2bnd1DjPkKmVsuQNWALXuprNICHpHqBj7nELq400TeTuBaaZp
 ZW3w==
X-Gm-Message-State: AOAM533eZ91VcsXwM9ZfNW8CPJbPxc/zNdjsBEW4PlUPx0D07k38o/7D
 Gc8Cr0S5QBLVFTkpIVvWvP1hrI2K+CLll4EDWguxkg==
X-Google-Smtp-Source: ABdhPJxNGHB1SSXPUoFwXoNSi05e8v/wl0KgveYrZK14zPrtDm8asHl5Z5GTJTxfyjyWg62aQanc89ULkV9YeVvY+YQ=
X-Received: by 2002:a1c:62d6:: with SMTP id w205mr4493336wmb.97.1591288126871; 
 Thu, 04 Jun 2020 09:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
 <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
 <20200604150535.GB2428291@smile.fi.intel.com>
In-Reply-To: <20200604150535.GB2428291@smile.fi.intel.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 4 Jun 2020 12:28:34 -0400
Message-ID: <CA+-6iNxze_tfWBsE0FkSFcWgihx=CHgNBiHi=BUC+9_=x-TtUA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
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
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
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
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Thu, Jun 4, 2020 at 11:05 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 04, 2020 at 10:35:12AM -0400, Jim Quinlan wrote:
> > On Thu, Jun 4, 2020 at 9:53 AM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > On Wed, 2020-06-03 at 15:20 -0400, Jim Quinlan wrote:
>
> ...
>
> > > > +     phys = virt_to_phys(ret);
> > > > +     pfn =  phys >> PAGE_SHIFT;
> > >
> > > nit: not sure it really pays off to have a pfn variable here.
> > Did it for readability; the compiler's optimization should take care
> > of any extra variables.  But I can switch if you insist.
>
> One side note: please, try to get familiar with existing helpers in the kernel.
> For example, above line is like
>
>         pfn = PFN_DOWN(phys);
I just used the term in the original code; will change to PFN_DOWN().

>
> ...
>
> > > > +     if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
>
> > > > +             *dma_handle -= PFN_PHYS(
> > > > +                     dma_pfn_offset_from_phys_addr(dev, phys));
>
> Don't do such indentation, esp. we have now 100! :-)

Got it.  Thanks,
Jim Quinlan
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
