Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B51F4F0A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FD26E115;
	Wed, 10 Jun 2020 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2B6E054
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c71so2778645wmd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edVNPE5DX3OyCq+2fyjI6ylHeS+GOPrCyMzTtU1/fzY=;
 b=gDaD4KM/t8KX5Al7J/BjBhHccNF2kg3Pg0xh6Ed7ue9e77HSVyYvClYpogccUWVa0o
 sqMFc5fMJ7AvbB7JFU4K1yuD3yD/zO0J0V9y9SHUHDSSvISS8BVLyTPvZRaUOKotLugh
 kY/jDSW0d+ynzLoQkWgw09J4fzf/weK6pnQL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edVNPE5DX3OyCq+2fyjI6ylHeS+GOPrCyMzTtU1/fzY=;
 b=SccUbNvvwbRKwpXLp15fGGeBMIAFw6Zcau/6a95jzwIEWhiMAgQMEClRgTjHbv3MRt
 5V8/wk/xaBE+BoHlpoGeNBEE3P8jsuNXJvZiLIpcA+kKH4wwDF1vdPt7TIsqFUG4WP1U
 /qI5a/FTsy1CY2oL2qAJFud4j3qXMGKpDZlTf9YUr5tg6Owbgj7NuDg16BgOV1E2U+wU
 KKWXWxEthPV/aSfl9rnLjBlC/HdMi0UrgZXh1kNbPVBrceiFC/WgY4rFf/w4UUrRFeWJ
 wsXHUiQM1sgo84rb9antKnrCoCyIa6oTKOw2RDFKzb4/WXzdExwPU8nXF43ZRbRv62d7
 upmA==
X-Gm-Message-State: AOAM532QNHk0ZGYEgGkLIXuSOoKgpStfRqLNg/rIA8Ms7MEbFgpFEqzq
 ue2aGE792NDjXduEOzouCAacZAgQN0Sl4xgNBa5ZYQ==
X-Google-Smtp-Source: ABdhPJwjOaQHBYP5HBHod5WDWXLMU0/xp0eCkWKGBg/hRiGblG95btpxH0ojmWyIZmWbwAeUqcEutxDqrlqPy0PnDd4=
X-Received: by 2002:a1c:7305:: with SMTP id d5mr4103395wmb.85.1591708448748;
 Tue, 09 Jun 2020 06:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200605212706.7361-1-james.quinlan@broadcom.com>
 <20200605212706.7361-9-james.quinlan@broadcom.com>
 <20200607164950.GX2428291@smile.fi.intel.com>
 <CA+-6iNyL12Z+igSrWnsmTzrwzyyeDtSK-9ULiZe0MwM5LO5bjQ@mail.gmail.com>
 <20200609111828.GI2428291@smile.fi.intel.com>
In-Reply-To: <20200609111828.GI2428291@smile.fi.intel.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 9 Jun 2020 09:13:57 -0400
Message-ID: <CA+-6iNxPGKFd84zK3k2SsgZcC=ExR=fPsSM8KAxPDswnjzi7QQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] device core: Introduce multiple dma pfn offsets
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
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

On Tue, Jun 9, 2020 at 7:18 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jun 08, 2020 at 11:48:51AM -0400, Jim Quinlan wrote:
> > On Sun, Jun 7, 2020 at 12:500f9bfe0fb8840b268af1bbcc51f1cd440514e PM
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Jun 05, 2020 at 05:26:48PM -0400, Jim Quinlan wrote:
>
> ...
>
> > > > +     *map_size = (num_ranges + 1) * sizeof(**map);
> > > > +     r = kzalloc(*map_size, GFP_KERNEL);
> > >
> > > kcalloc()
> > Since I have to calculate the size anyway I thought kzalloc was fine.
> > I'll switch.
>
> The point is to check multiplication overflow. See overflow.h for helpers.

I am aware of this check and didn't think of it as applicable here, as
the most dma-ranges I can envision is six. I suppose that it is
possible that this may change in the future to some big number.  At
any rate, the next version has kcalloc().

Regards,
Jim
>
>
> > > > +     if (!r)
> > > > +             return -ENOMEM;
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
