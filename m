Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF031EF1DF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EDA6E858;
	Fri,  5 Jun 2020 07:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA036E3EF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 14:43:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l26so5489477wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrASyIBKHCebzBxwD+z9Y0Sx5KbX3AIS9EOUj/OsSEo=;
 b=Zo3wvxog4XFHb/YVpFj4s9xIrygC0gzFBySBqQZNw7sr6x//M1pIwpzb6eQiSawvt/
 lXxfDok/0izwAEybNnTwAlSClKsymf6ZNbvvqTZLcPoh0JmS53YoboI/Bc0cBmXUvBbS
 47R63jy0oSFePYBS0HLNUfVRO7FXvurSl7qQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrASyIBKHCebzBxwD+z9Y0Sx5KbX3AIS9EOUj/OsSEo=;
 b=XFy92mHVvAyNtol2cpvUlxixIGRZk6UsNBeppWmnN4E/1w/TvQKsQ3myimu7EgaYtI
 UKx4M2E3TUOBP+C2RjBzgn8xNC2rasw1von4u+Yh7pduBHjRtDcEhJ5J1i7vFKt4BFr5
 S5pY65JpEJ7yEC/hdADSsDy/x1FOrmmnfIfjPQLBz2kXoXNFQNReXzCGr7gSt1N4zHRI
 13QBHMPNR5uhudK/Q6YBt1pM62/CvPw/l/B8r0/SSCvjIMAm5ZN/3k3fHiSwJ5K37wb6
 RcraYOFbENFC8n8/1g0cSpapS5uushU3DmA5zUJ3lAxefUik3vRs29oUkKFKNcDPHmc1
 CpDw==
X-Gm-Message-State: AOAM5328U3nbU9DAbfFOdhmyJImmgW9BOvZs/xtphX5vcJnT0o6xSptK
 aUX9dIO3eZrHUu2fNlQK6dmBj7lVXSaJ4AgeoojEDg==
X-Google-Smtp-Source: ABdhPJy6GhgxHSoger2ydUB8Z1ZADSP9s4xA+lVSOwpsNuaVTZK6gajJRSMryuNCt8+GdDFZpv9MjKz43PH9YKwUNdE=
X-Received: by 2002:a1c:4405:: with SMTP id r5mr4582574wma.72.1591281832459;
 Thu, 04 Jun 2020 07:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <20200604110455.GO30374@kadam>
 <CA+-6iNyaL8izv5eHJyYkhwu9diPsqT0AD08UU_ECexNcdrT+jA@mail.gmail.com>
 <20200604141857.GH22511@kadam>
In-Reply-To: <20200604141857.GH22511@kadam>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 4 Jun 2020 10:43:40 -0400
Message-ID: <CA+-6iNwF6gwkCVBtbWcp-frCG01LddFprqo7UeWJZ3bzDwG8zw@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
To: Dan Carpenter <dan.carpenter@oracle.com>
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
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 10:20 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Jun 04, 2020 at 09:48:49AM -0400, Jim Quinlan wrote:
> > > > +     r = devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region),
> > > > +                      GFP_KERNEL);
> > >
> > > Use:    r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
> > Will fix.
> >
> > >
> > >
> > > > +     if (!r)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     r->uniform_offset = true;
> > > > +     r->pfn_offset = pfn_offset;
> > > > +
> > > > +     return 0;
> > > > +}
> > >
> > > This function doesn't seem to do anything useful.  Is part of it
> > > missing?
> > No, the uniform pfn offset is a special case.
>
> Sorry, I wasn't clear.  We're talking about different things.  The code
> does:
>
>         r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
>         if (!r)
>                 return -ENOMEM;
>
>         r->uniform_offset = true;
>         r->pfn_offset = pfn_offset;
>
>         return 0;
>
> The code allocates "r" and then doesn't save it anywhere so there is
> no point.
You are absolutely right, sorry I missed your point.  Will fix.

Thanks,
Jim Quinlan

>
> regards,
> dan carpenter
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
