Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B423402D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D3E6EA0A;
	Fri, 31 Jul 2020 07:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4D56E932
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 17:25:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so15093767wrc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sNCo6OJL+Y5+7WCILwksqAoVSYtXLlNGjRLNsvxRptk=;
 b=AkMCmmdx4ZYztnIqSxTU7eHQ7kz3Bgwfdvyvk3PbB8Ufzi1fnd6wpYsukRza3AjZKO
 f9GrP+jyVuj94/4zxrK7UVD3fTxTX4QTD6xD49ZS3okDsAmexy29Vj0VOeVrFGIWgf9c
 5J0nRQGVZGHveCiYa7R8OIsik4aMGkHCjpHrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sNCo6OJL+Y5+7WCILwksqAoVSYtXLlNGjRLNsvxRptk=;
 b=D6whonIYtCmtxY2aWHvfkXyw4+2wvDhz1K19zn60uuB3mZHs36Pdj9yjSs98vbJZ5W
 o+GqjAZq1sLS+UePCElPBxp05rdn7A/zUNBu+McMcbIXAcvthCSpGJB61HrDVEI+F4Oq
 JHgzPElWpSthdaDSxMrbITcBh5P0pvONDwnDf2IaunR3uV7C7HtGibewEaBCELCfY/oI
 eFTxv6If4wGkjAhjGh62sMITAl/P2AFDlctIo/N/11LRqexL6tV5Qk2/hqBMJPHQlS1h
 JTlC0JKSJBqBH+89q+K2kdCq/w0tRnDGx6jHAoWumLYd5SEufhkUGf6KM+Yxu2iSdF4U
 aqqA==
X-Gm-Message-State: AOAM530dSM2PQ/JF0CLDry4u5Hp7AWPl/rAwL4Nfu6gqS1SwX5NP8MFj
 Xps2agW4auLGF7tFQ7eZJmQ//Vsr43ltgP3i2DOQRA==
X-Google-Smtp-Source: ABdhPJxTkYgyrGJD0qoy7N/a5I5qMSrg3FcI44+ukNzAvdEAsGO6nqACjClSIjeMLjqunOwwyXtKLsvE1bArMJ5wOXQ=
X-Received: by 2002:adf:9501:: with SMTP id 1mr27386326wrs.413.1596129952322; 
 Thu, 30 Jul 2020 10:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <e0a46f4cd0a603801d343c15d807d0f08c42e900.camel@suse.de>
In-Reply-To: <e0a46f4cd0a603801d343c15d807d0f08c42e900.camel@suse.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 30 Jul 2020 13:25:40 -0400
Message-ID: <CA+-6iNzWYvX_7G8=EOMt5X5U8_csymyvDwKVUwRBzw_dF_YYjQ@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 1:05 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Jim,
>
> On Fri, 2020-07-24 at 16:33 -0400, Jim Quinlan wrote:
> >  static void __init of_unittest_pci_dma_ranges(void)
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> > index bfc2542d54a8..8dacb9d3b7b6 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -1197,6 +1197,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
> >       ret = brcm_phy_start(pcie);
> >       if (ret) {
> >               dev_err(pcie->dev, "failed to start phy\n");
> > +             reset_control_assert(pcie->rescal);
> >               return ret;
> >       }
>
> I think this sneaked in from another patch.
Thanks Nicolas.  BTW, at some point will you be able to test my
patchset on the RP4 to see if I broke anything?

Thanks again,
Jim

>
> Regards,
> Nicolas
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
