Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46CA2627BF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046ED6E9C6;
	Wed,  9 Sep 2020 07:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769A6E861
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:59:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w2so17813554wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFCX2Fx3/ZhVK+MHCzMslsFFLX+ZTpr5SFfq/bucSTE=;
 b=L5de6DTjHrhWW1tiuojsLRMbF1lQE8xkIQS2sgiAFfGUDk0a4nZGsy6DA9vpTUVrVD
 TWVAYMaDdAikQ0XGrZ1rPYMiKq3E7QNXbmvaNEIuDe/676WFyyXuw8aAeCfxKpNvmcIR
 oOMvGXhP0YdPyjRGvHhGSzPFVfvoPyjAc9RkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFCX2Fx3/ZhVK+MHCzMslsFFLX+ZTpr5SFfq/bucSTE=;
 b=iRYl1taXK+3QdbfGwwv75hKpgPoYzNml9iDwBtogTQ4FvxH4KHZpUbd/U6v7VADhoi
 sam+ThVnLm44zkMLqZ8OOKvhLw8AugxdUFbACv0lANHPCHcoHmYQJ1ebIP22sCGqIwEv
 yGSMcM9japMa01P6ZuH2SdMazKed+3varsuVljFD4L0ZHvGdGlyYPbF08C6CCNrAMlAq
 HnsU6oOixXI5o/VaoxHrFrpWFR9iHVg6d6YVJRThsgr48/XXPXHV8k+JoLMN//1kVxpq
 s4TWnCyUhKWOa+W2Zt2Dx6MapNV22zsYm5DIf9vwmwH/GuPSeIA3hrMnk1iPLy6nfK7d
 n6ew==
X-Gm-Message-State: AOAM53186eC53TMYbgn9D+zta3NxLGuxWstip1+2nJM411CRyPygQdaL
 YvKimxI1DO1GU4ZmlDrPc9qpMSnRW4AGRR9x1xWvpg==
X-Google-Smtp-Source: ABdhPJwa1zAsXIysL/taf1Rf3+uFmxTFm5hzgWcGRQOlEC+E6qstK5Gdi4LiSkkqsjOISYSAvkgu7aDZT9q2XbYuB4E=
X-Received: by 2002:a1c:bad5:: with SMTP id k204mr192855wmf.111.1599580770266; 
 Tue, 08 Sep 2020 08:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
 <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
 <6922bc0b-1849-2f2f-ec2f-fe9f0124dcfc@gmail.com>
 <20200903005240.GA1118@Ryzen-9-3900X.localdomain>
 <CA+-6iNyv_sFJOxDi5OcYNWe=ovLnOnrZNsWFQk5b-bzQzA8T_Q@mail.gmail.com>
 <34aa0d6094e7d6fb3492d2cda0fec8ecc04790ed.camel@suse.de>
 <CA+-6iNyJ3ey0zPKj9nh8uL3AwTBhJqgD01wc=7G4NF35NXmV1Q@mail.gmail.com>
 <b4761ade39af346eebec917ca2a415c09681542a.camel@suse.de>
 <20200908072935.GA15119@lst.de>
 <20200908073203.GA15176@lst.de> <20200908094345.GA20959@lst.de>
In-Reply-To: <20200908094345.GA20959@lst.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 8 Sep 2020 11:59:18 -0400
Message-ID: <CA+-6iNwsLgpPG+-A8gnrnWxPZuc932PgF_L0ByRQjGz_0=bsbQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 5:43 AM Christoph Hellwig <hch@lst.de> wrote:
>
> And because I like replying to myself so much, here is a link to the
> version with the arm cleanup patch applied.  Unlike the previous two
> attempts this has at least survived very basic sanity testing:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-ranges.2
>
Tested-by: Jim Quinlan <james.quinlan@broadcom.com>

> Note that we'll still need to sort out the arm/keystone warnings from
> the original patch.  Do we have anyone on the CC list who knows that
> platform a little better to figure out if the ifdef solution would work?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
