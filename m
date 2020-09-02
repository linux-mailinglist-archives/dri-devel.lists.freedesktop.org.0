Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CFC25BDD4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F506E5AE;
	Thu,  3 Sep 2020 08:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE0B6E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 22:38:57 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b14so1354818qkn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 15:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZrGjx4DbbIxjQut0FbGet7ftFue13Xv6bd/tit8Iut8=;
 b=J3OGGgljLpCGjFLaCbUzOiCwNHmaotg1L2h3BlFjbKgLd2UVWDCDEq/mhiQteDDAyN
 D64IDsGJc4kz0RVOAwapXuNQhtnUxGHa74UR33WSZQ0Q7d4oyOfwYsAvdMyG8iZ//ZRN
 AsPAUZ2s0V7fjRY84ECYBv0rh1oyqQ2a9Kcxnwf0MzNyAoHWwfZEIOQsuyEZMaZN+sKx
 sJAnVYtUg/QpJZjfJG7EKRmZ50R3rA/nBxiOVkY5T9HFLPNkJLHpA3FkwjGjJOaWYVb4
 LLXiZ31OthnHGDN67vo9kK8dMD60NZiDE4KyaXr4I8GHHKfFJCLLa0r4O/WVm5Ru6BS3
 D44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZrGjx4DbbIxjQut0FbGet7ftFue13Xv6bd/tit8Iut8=;
 b=tkoi0T8fnz1MsVpOk8E3oG3SaprR/SFVHoLHAeJdSTL82mpjgViTGOiaw+gbq+iYuf
 3k6wSHWqwCuKpCnmn0CGMoTkUeocAZ1OVQ3aRnffURba5J/mxr/JmIgB7dOzznaHvrsZ
 pTFKXxDm2yViuiZ9Vf74K6eQjG1bxAeMwiBhzRh4+tlTywG24C56wqusnrgMcdJTeyle
 f9YtxWJbNQcoW4paz2CfO9lsBt9DZsTANnYkPRR1lUcyymlv44vCH+c8ZbGDnfpJIRdd
 RDF9dwhyqTAZSCvGoicXt5PfqGZuPTg7Rj1vCq/jhbqb5pwMFm2AO41dGpD1nNpl2uOy
 Ac9w==
X-Gm-Message-State: AOAM532NCvVyrrdUCyPHTmvorB4pf6COsgXkWOovDzulQNhPCdvmv/jN
 pkxwh08g6IZMgdfpK5UbUnQ=
X-Google-Smtp-Source: ABdhPJzJRpCt+gFdZmoctCBk5XMgqmANlEGGfH9PVJcBlYlHLnYQiEDO9Ek/+wk5wtPsgCAoDU8seg==
X-Received: by 2002:ae9:e8c2:: with SMTP id a185mr238699qkg.435.1599086336420; 
 Wed, 02 Sep 2020 15:38:56 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id d20sm817568qkk.84.2020.09.02.15.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 15:38:55 -0700 (PDT)
Date: Wed, 2 Sep 2020 15:38:52 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
Message-ID: <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <20200824193036.6033-8-james.quinlan@broadcom.com>
 <20200902215314.GA881878@ubuntu-n2-xlarge-x86>
 <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2020 at 06:11:08PM -0400, Jim Quinlan wrote:
> On Wed, Sep 2, 2020 at 5:53 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Mon, Aug 24, 2020 at 03:30:20PM -0400, Jim Quinlan wrote:
> > > The new field 'dma_range_map' in struct device is used to facilitate the
> > > use of single or multiple offsets between mapping regions of cpu addrs and
> > > dma addrs.  It subsumes the role of "dev->dma_pfn_offset" which was only
> > > capable of holding a single uniform offset and had no region bounds
> > > checking.
> > >
> > > The function of_dma_get_range() has been modified so that it takes a single
> > > argument -- the device node -- and returns a map, NULL, or an error code.
> > > The map is an array that holds the information regarding the DMA regions.
> > > Each range entry contains the address offset, the cpu_start address, the
> > > dma_start address, and the size of the region.
> > >
> > > of_dma_configure() is the typical manner to set range offsets but there are
> > > a number of ad hoc assignments to "dev->dma_pfn_offset" in the kernel
> > > driver code.  These cases now invoke the function
> > > dma_attach_offset_range(dev, cpu_addr, dma_addr, size).
> > >
> > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > ---
> > >  arch/arm/include/asm/dma-mapping.h            | 10 +--
> > >  arch/arm/mach-keystone/keystone.c             | 17 +++--
> > >  arch/sh/drivers/pci/pcie-sh7786.c             |  9 +--
> > >  arch/x86/pci/sta2x11-fixup.c                  |  7 +-
> > >  drivers/acpi/arm64/iort.c                     |  5 +-
> > >  drivers/base/core.c                           |  2 +
> > >  drivers/gpu/drm/sun4i/sun4i_backend.c         |  5 +-
> > >  drivers/iommu/io-pgtable-arm.c                |  2 +-
> > >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
> > >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  4 +-
> > >  drivers/of/address.c                          | 72 +++++++++----------
> > >  drivers/of/device.c                           | 43 ++++++-----
> > >  drivers/of/of_private.h                       | 10 +--
> > >  drivers/of/unittest.c                         | 34 ++++++---
> > >  drivers/remoteproc/remoteproc_core.c          |  8 ++-
> > >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
> > >  drivers/usb/core/message.c                    |  9 ++-
> > >  drivers/usb/core/usb.c                        |  7 +-
> > >  include/linux/device.h                        |  4 +-
> > >  include/linux/dma-direct.h                    |  8 +--
> > >  include/linux/dma-mapping.h                   | 36 ++++++++++
> > >  kernel/dma/coherent.c                         | 10 +--
> > >  kernel/dma/mapping.c                          | 66 +++++++++++++++++
> > >  23 files changed, 265 insertions(+), 115 deletions(-)
> >
> > Apologies if this has already been reported or is known but this commit
> > is now in next-20200902 and it causes my Raspberry Pi 4 to no longer
> > make it to userspace, instead spewing mmc errors:
> >
> > That commit causes my Raspberry Pi 4 to no longer make it to userspace,
> > instead spewing mmc errors:
> >
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> > [    0.000000] Linux version 5.9.0-rc3-00004-geef520b232c6-dirty (nathan@ubuntu-n2-xlarge-x86) (ClangBuiltLinux clang version 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb), LLD 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb)) #1 SMP PREEMPT Wed Sep 2 13:48:49 MST 2020
> > [    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.2
> > ...
> > [    1.459752] raspberrypi-firmware soc:firmware: Attached to firmware from 2020-08-24T18:50:56
> > [    1.500007] dwc2 fe980000.usb: supply vusb_d not found, using dummy regulator
> > [    1.507454] dwc2 fe980000.usb: supply vusb_a not found, using dummy regulator
> > [    1.615547] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
> > [    1.627537] sdhci-iproc fe300000.sdhci: allocated mmc-pwrseq
> > [    1.665497] mmc0: SDHCI controller on fe300000.sdhci [fe300000.sdhci] using PIO
> > [    1.690601] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
> > [    1.697892] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.705173] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.713788] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
> > [    1.721228] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.732062] mmc1: SDHCI controller on fe340000.emmc2 [fe340000.emmc2] using ADMA
> > [    1.741828] ALSA device list:
> > [    1.744885]   No soundcards found.
> > [    1.748540] Waiting for root device PARTUUID=45a8dd8a-02...
> > [    1.788865] random: fast init done
> > [    1.793489] mmc1: unrecognised SCR structure version 4
> > [    1.798814] mmc1: error -22 whilst initialising SD card
> > [    1.813969] mmc0: new high speed SDIO card at address 0001
> > [    1.883178] mmc1: unrecognised SCR structure version 2
> > [    1.888423] mmc1: error -22 whilst initialising SD card
> > [    1.964069] mmc1: unrecognised SCR structure version 4
> > [    1.969314] mmc1: error -22 whilst initialising SD card
> > [    2.061225] mmc1: unrecognised SCR structure version 4
> > [    2.066470] mmc1: error -22 whilst initialising SD card
> > [    3.160476] mmc1: unrecognised SCR structure version 4
> > [    3.165718] mmc1: error -22 whilst initialising SD card
> >
> > This is what it looks like before that commit:
> >
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> > [    0.000000] Linux version 5.9.0-rc3-00003-g2281f797f552-dirty (nathan@ubuntu-n2-xlarge-x86) (ClangBuiltLinux clang version 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb), LLD 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb)) #1 SMP PREEMPT Wed Sep 2 14:10:30 MST 2020
> > [    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.2
> > ...
> > [    1.459871] raspberrypi-firmware soc:firmware: Attached to firmware from 2020-08-24T18:50:56
> > [    1.500017] dwc2 fe980000.usb: supply vusb_d not found, using dummy regulator
> > [    1.507461] dwc2 fe980000.usb: supply vusb_a not found, using dummy regulator
> > [    1.615565] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
> > [    1.627571] sdhci-iproc fe300000.sdhci: allocated mmc-pwrseq
> > [    1.665549] mmc0: SDHCI controller on fe300000.sdhci [fe300000.sdhci] using PIO
> > [    1.690225] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
> > [    1.697516] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.704800] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.713412] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
> > [    1.720853] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> > [    1.731686] mmc1: SDHCI controller on fe340000.emmc2 [fe340000.emmc2] using ADMA
> > [    1.741484] ALSA device list:
> > [    1.744517]   No soundcards found.
> > [    1.748194] Waiting for root device PARTUUID=45a8dd8a-02...
> > [    1.788643] random: fast init done
> > [    1.805009] mmc0: new high speed SDIO card at address 0001
> > [    1.852305] mmc1: new ultra high speed DDR50 SDXC card at address aaaa
> > [    1.859647] mmcblk1: mmc1:aaaa SK64G 59.5 GiB
> > [    1.866190]  mmcblk1: p1 p2
> > [    1.892559] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mode. Opts: (null)
> >
> > Bisect log in case it is relevant:
> >
> > # bad: [4442749a203151a319a5bb8d0b983b84253a6931] Add linux-next specific files for 20200902
> > # good: [b765a32a2e9170702467747e290614be072c4f76] Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> > git bisect start '4442749a203151a319a5bb8d0b983b84253a6931' 'b765a32a2e9170702467747e290614be072c4f76'
> > # bad: [501c4123d9ecf8e38425fa2dae591d87f18a33f9] Merge remote-tracking branch 'wireless-drivers-next/master' into master
> > git bisect bad 501c4123d9ecf8e38425fa2dae591d87f18a33f9
> > # bad: [3722ace45f7d9a37631b6f5b9c591ea1e118a077] Merge remote-tracking branch 'pstore/for-next/pstore' into master
> > git bisect bad 3722ace45f7d9a37631b6f5b9c591ea1e118a077
> > # bad: [bcd6576526884cbe2f0798f9196eb2fd96fadb2b] Merge remote-tracking branch 'imx-mxs/for-next' into master
> > git bisect bad bcd6576526884cbe2f0798f9196eb2fd96fadb2b
> > # good: [f51293edaaf354f6de8836390cd4bd0407380c8d] Merge remote-tracking branch 'staging.current/staging-linus' into master
> > git bisect good f51293edaaf354f6de8836390cd4bd0407380c8d
> > # bad: [2b7f5289d46652f343f51e1853326876114f8647] Merge remote-tracking branch 'arm-soc/for-next' into master
> > git bisect bad 2b7f5289d46652f343f51e1853326876114f8647
> > # good: [137aded9aad7803fa48e9a9538b359012715e171] Merge remote-tracking branch 'pidfd-fixes/fixes' into master
> > git bisect good 137aded9aad7803fa48e9a9538b359012715e171
> > # good: [f5cb1ada6f986019d24037d9329c99445fcdd50a] Merge remote-tracking branch 'kbuild/for-next' into master
> > git bisect good f5cb1ada6f986019d24037d9329c99445fcdd50a
> > # good: [2694ca73fa41491762825ae7bba9b14ab0762415] ARM: Document merges
> > git bisect good 2694ca73fa41491762825ae7bba9b14ab0762415
> > # bad: [192ec9acc561411c6ec5d35b3ad225d40c8c39bd] Merge remote-tracking branch 'dma-mapping/for-next' into master
> > git bisect bad 192ec9acc561411c6ec5d35b3ad225d40c8c39bd
> > # bad: [eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7] dma-mapping: introduce DMA range map, supplanting dma_pfn_offset
> > git bisect bad eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7
> > # good: [c6303ab9b91e7ca20a49ff494338309259ed7c65] arm64: mm: reserve per-numa CMA to localize coherent dma buffers
> > git bisect good c6303ab9b91e7ca20a49ff494338309259ed7c65
> > # good: [2281f797f5524abb8fff66bf8540b4f4687332a2] mm: cma: use CMA_MAX_NAME to define the length of cma name array
> > git bisect good 2281f797f5524abb8fff66bf8540b4f4687332a2
> > # first bad commit: [eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7] dma-mapping: introduce DMA range map, supplanting dma_pfn_offset
> >
> > I am happy to provide further information for debugging if necessary.
> Hello Nathan,
> 
> Can you tell me how much memory your RPI has and if all of it is

This is the 4GB version.

> accessible by the PCIe device?  Could you also please include the DTS
> of the PCIe node?  IIRC, the RPI firmware does some mangling of the
> PCIe DT before Linux boots -- could you describe what is going on
> there?

Unfortunately, I am not familiar with how to get this information. If
you could provide some instructions for how to do so, I am more than
happy to. I am not very knowleagable about the inner working of the Pi,
I mainly use it as a test platform for making sure that LLVM does not
cause problems on real devices.

> Finally, can you attach the text of the full boot log?

I have attached a working and broken boot log. Thank you for the quick
response!

Cheers,
Nathan

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pi-boot-bad.txt"

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 5.9.0-rc3-next-20200902-dirty (nathan@ubuntu-n2-xlarge-x86) (ClangBuiltLinux clang version 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb), LLD 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb)) #1 SMP PREEMPT Wed Sep 2 15:17:43 MST 2020
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.2
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x0000000037400000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x00000000fbffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xfb81f100-0xfb820fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000fbffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000003b3fffff]
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000fbffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000fbffffff]
[    0.000000] percpu: Embedded 23 pages/cpu s54168 r8192 d31848 u94208
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: EL2 vector hardening
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 996912
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line:  dma.dmachans=0x71f5 bcm2709.boardrev=0xc03112 bcm2709.serial=0xb78d398 bcm2709.uart_clock=48000000 bcm2709.disk_led_gpio=42 bcm2709.disk_led_active_low=0 smsc95xx.macaddr=DC:A6:32:60:6C:87 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  console=ttyS1,115200 console=tty1 root=PARTUUID=45a8dd8a-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait plymouth.ignore-serial-consoles
[    0.000000] Kernel parameter elevator= does not have any effect anymore.
[    0.000000] Please use sysfs to set IO scheduler for individual devices.
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: mapped [mem 0x33400000-0x37400000] (64MB)
[    0.000000] Memory: 3812260K/4050944K available (14524K kernel code, 2636K rwdata, 7540K rodata, 1600K init, 615K bss, 173148K reserved, 65536K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] random: get_random_bytes called from start_kernel+0x1cc/0x3f4 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000006] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000196] Console: colour dummy device 80x25
[    0.000680] printk: console [tty1] enabled
[    0.000779] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=216000)
[    0.000809] pid_max: default: 32768 minimum: 301
[    0.000896] LSM: Security Framework initializing
[    0.001029] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.001115] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.002874] rcu: Hierarchical SRCU implementation.
[    0.005100] EFI services will not be available.
[    0.005396] smp: Bringing up secondary CPUs ...
[    0.005904] Detected PIPT I-cache on CPU1
[    0.005963] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.006505] Detected PIPT I-cache on CPU2
[    0.006544] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.007060] Detected PIPT I-cache on CPU3
[    0.007098] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.007182] smp: Brought up 1 node, 4 CPUs
[    0.007251] SMP: Total of 4 processors activated.
[    0.007267] CPU features: detected: 32-bit EL0 Support
[    0.007283] CPU features: detected: CRC32 instructions
[    0.007299] CPU features: detected: 32-bit EL1 Support
[    0.030649] CPU: All CPU(s) started at EL2
[    0.030710] alternatives: patching kernel code
[    0.032692] devtmpfs: initialized
[    0.037827] KASLR enabled
[    0.038277] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.038312] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.040163] pinctrl core: initialized pinctrl subsystem
[    0.041597] DMI not present or invalid.
[    0.042151] NET: Registered protocol family 16
[    0.043673] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.043826] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.044107] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.044163] audit: initializing netlink subsys (disabled)
[    0.044352] audit: type=2000 audit(0.040:1): state=initialized audit_enabled=0 res=1
[    0.045463] thermal_sys: Registered thermal governor 'step_wise'
[    0.045470] thermal_sys: Registered thermal governor 'power_allocator'
[    0.045807] cpuidle: using governor menu
[    0.046145] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.046246] ASID allocator initialised with 32768 entries
[    0.047838] Serial: AMBA PL011 UART driver
[    0.083072] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.083108] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.083126] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.083143] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.084507] cryptd: max_cpu_qlen set to 1000
[    0.087192] ACPI: Interpreter disabled.
[    0.089180] iommu: Default domain type: Translated 
[    0.089450] vgaarb: loaded
[    0.089800] SCSI subsystem initialized
[    0.090203] usbcore: registered new interface driver usbfs
[    0.090263] usbcore: registered new interface driver hub
[    0.090343] usbcore: registered new device driver usb
[    0.090520] usb_phy_generic phy: supply vcc not found, using dummy regulator
[    0.091346] pps_core: LinuxPPS API ver. 1 registered
[    0.091364] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.091394] PTP clock support registered
[    0.091552] EDAC MC: Ver: 3.0.0
[    0.092935] FPGA manager framework
[    0.093050] Advanced Linux Sound Architecture Driver Initialized.
[    0.093880] clocksource: Switched to clocksource arch_sys_counter
[    0.094112] VFS: Disk quotas dquot_6.6.0
[    0.094190] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.094401] pnp: PnP ACPI: disabled
[    0.100876] NET: Registered protocol family 2
[    0.101384] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.101444] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.101652] TCP bind hash table entries: 32768 (order: 7, 524288 bytes, linear)
[    0.102173] TCP: Hash tables configured (established 32768 bind 32768)
[    0.102384] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.102454] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.102668] NET: Registered protocol family 1
[    0.103174] RPC: Registered named UNIX socket transport module.
[    0.103193] RPC: Registered udp transport module.
[    0.103206] RPC: Registered tcp transport module.
[    0.103220] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.103241] PCI: CLS 0 bytes, default 64
[    0.104437] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 counters available
[    0.104591] kvm [1]: IPA Size Limit: 44bits
[    0.105723] kvm [1]: vgic interrupt IRQ1
[    0.105910] kvm [1]: Hyp mode initialized successfully
[    0.107799] Initialise system trusted keyrings
[    0.107975] workingset: timestamp_bits=44 max_order=20 bucket_order=0
[    0.114780] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.115569] NFS: Registering the id_resolver key type
[    0.115614] Key type id_resolver registered
[    0.115629] Key type id_legacy registered
[    0.115747] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.115926] 9p: Installing v9fs 9p2000 file system support
[    0.177452] Key type asymmetric registered
[    0.177472] Asymmetric key parser 'x509' registered
[    0.177527] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.177547] io scheduler mq-deadline registered
[    0.177560] io scheduler kyber registered
[    0.190013] EINJ: ACPI disabled.
[    0.208072] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.210194] printk: console [ttyS1] disabled
[    0.210297] fe215040.serial: ttyS1 at MMIO 0xfe215040 (irq = 18, base_baud = 24999999) is a 16550
[    1.115569] printk: console [ttyS1] enabled
[    1.121263] SuperH (H)SCI(F) driver initialized
[    1.126522] msm_serial: driver initialized
[    1.132301] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.146949] loop: module loaded
[    1.151363] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains driver
[    1.159671] megasas: 07.714.04.00-rc1
[    1.168505] libphy: Fixed MDIO Bus: probed
[    1.174118] tun: Universal TUN/TAP device driver, 1.6
[    1.180090] thunder_xcv, ver 1.0
[    1.183434] thunder_bgx, ver 1.0
[    1.186768] nicpf, ver 1.0
[    1.190746] hclge is initializing
[    1.194178] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    1.201546] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.207017] e1000: Intel(R) PRO/1000 Network Driver
[    1.211992] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.217901] e1000e: Intel(R) PRO/1000 Network Driver
[    1.222962] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.229030] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.234535] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.240248] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    1.246633] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.253038] sky2: driver version 1.30
[    1.257975] VFIO - User Level meta-driver version: 0.3
[    1.265257] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.271935] ehci-pci: EHCI PCI platform driver
[    1.276511] ehci-platform: EHCI generic platform driver
[    1.281987] ehci-orion: EHCI orion driver
[    1.286186] ehci-exynos: EHCI Exynos driver
[    1.290552] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.296868] ohci-pci: OHCI PCI platform driver
[    1.301436] ohci-platform: OHCI generic platform driver
[    1.306891] ohci-exynos: OHCI Exynos driver
[    1.311695] usbcore: registered new interface driver usb-storage
[    1.320736] i2c /dev entries driver
[    1.329662] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    1.338167] sdhci: Secure Digital Host Controller Interface driver
[    1.344475] sdhci: Copyright(c) Pierre Ossman
[    1.349524] Synopsys Designware Multimedia Card Interface Driver
[    1.356759] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.375177] ledtrig-cpu: registered to indicate activity on CPUs
[    1.383060] usbcore: registered new interface driver usbhid
[    1.388747] usbhid: USB HID core driver
[    1.393728] bcm2835-mbox fe00b880.mailbox: mailbox enabled
[    1.403725] NET: Registered protocol family 17
[    1.408495] 9pnet: Installing 9P2000 support
[    1.412912] Key type dns_resolver registered
[    1.417632] registered taskstats version 1
[    1.421822] Loading compiled-in X.509 certificates
[    1.431630] fe201000.serial: ttyAMA0 at MMIO 0xfe201000 (irq = 16, base_baud = 0) is a PL011 rev2
[    1.440890] serial serial0: tty port ttyAMA0 registered
[    1.462581] raspberrypi-firmware soc:firmware: Attached to firmware from 2020-08-24T18:50:56
[    1.503538] dwc2 fe980000.usb: supply vusb_d not found, using dummy regulator
[    1.510983] dwc2 fe980000.usb: supply vusb_a not found, using dummy regulator
[    1.619098] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
[    1.631122] sdhci-iproc fe300000.sdhci: allocated mmc-pwrseq
[    1.669127] mmc0: SDHCI controller on fe300000.sdhci [fe300000.sdhci] using PIO
[    1.694102] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
[    1.701389] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.708672] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.717293] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
[    1.724735] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.735564] mmc1: SDHCI controller on fe340000.emmc2 [fe340000.emmc2] using ADMA
[    1.745322] ALSA device list:
[    1.748390]   No soundcards found.
[    1.752060] Waiting for root device PARTUUID=45a8dd8a-02...
[    1.792429] random: fast init done
[    1.797033] mmc1: unrecognised SCR structure version 4
[    1.802357] mmc1: error -22 whilst initialising SD card
[    1.817686] mmc0: new high speed SDIO card at address 0001
[    1.886941] mmc1: unrecognised SCR structure version 2
[    1.892189] mmc1: error -22 whilst initialising SD card
[    1.967866] mmc1: unrecognised SCR structure version 4
[    1.973113] mmc1: error -22 whilst initialising SD card
[    2.065006] mmc1: unrecognised SCR structure version 4
[    2.070252] mmc1: error -22 whilst initialising SD card
[    3.161820] mmc1: unrecognised SCR structure version 4
[    3.167064] mmc1: error -22 whilst initialising SD card
[    3.237380] mmc1: unrecognised SCR structure version 4
[    3.242625] mmc1: error -22 whilst initialising SD card
[    3.318280] mmc1: unrecognised SCR structure version 4
[    3.323525] mmc1: error -22 whilst initialising SD card
[    3.415425] mmc1: unrecognised SCR structure version 4
[    3.420669] mmc1: error -22 whilst initialising SD card
[    4.505842] mmc1: unrecognised SCR structure version 4
[    4.511090] mmc1: error -22 whilst initialising SD card
[    4.581408] mmc1: unrecognised SCR structure version 4
[    4.586652] mmc1: error -22 whilst initialising SD card
[    4.662344] mmc1: unrecognised SCR structure version 4
[    4.667588] mmc1: error -22 whilst initialising SD card
[    4.759556] mmc1: unrecognised SCR structure version 4
[    4.764800] mmc1: error -22 whilst initialising SD card
[    5.851270] mmc1: unrecognised SCR structure version 4
[    5.856517] mmc1: error -22 whilst initialising SD card
[    5.926793] mmc1: unrecognised SCR structure version 4
[    5.932038] mmc1: error -22 whilst initialising SD card
[    6.007687] mmc1: unrecognised SCR structure version 4
[    6.012930] mmc1: error -22 whilst initialising SD card
[    6.104759] mmc1: unrecognised SCR structure version 4
[    6.110006] mmc1: error -22 whilst initialising SD card
[    7.193797] mmc1: unrecognised SCR structure version 4
[    7.199043] mmc1: error -22 whilst initialising SD card
[    7.269330] mmc1: unrecognised SCR structure version 4
[    7.274574] mmc1: error -22 whilst initialising SD card
[    7.350192] mmc1: unrecognised SCR structure version 4
[    7.355435] mmc1: error -22 whilst initialising SD card
[    7.447355] mmc1: unrecognised SCR structure version 4
[    7.452598] mmc1: error -22 whilst initialising SD card
[    8.537815] mmc1: unrecognised SCR structure version 4
[    8.543060] mmc1: error -22 whilst initialising SD card
[    8.613360] mmc1: unrecognised SCR structure version 4
[    8.618604] mmc1: error -22 whilst initialising SD card
[    8.694255] mmc1: unrecognised SCR structure version 4
[    8.699499] mmc1: error -22 whilst initialising SD card
[    8.791399] mmc1: unrecognised SCR structure version 4
[    8.796642] mmc1: error -22 whilst initialising SD card
[    9.881840] mmc1: unrecognised SCR structure version 4
[    9.887088] mmc1: error -22 whilst initialising SD card
[    9.957402] mmc1: unrecognised SCR structure version 4
[    9.962646] mmc1: error -22 whilst initialising SD card
[   10.038303] mmc1: unrecognised SCR structure version 4
[   10.043547] mmc1: error -22 whilst initialising SD card
[   10.135464] mmc1: unrecognised SCR structure version 4
[   10.140707] mmc1: error -22 whilst initialising SD card
[   11.225815] mmc1: unrecognised SCR structure version 4
[   11.231062] mmc1: error -22 whilst initialising SD card
[   11.301373] mmc1: unrecognised SCR structure version 4
[   11.306617] mmc1: error -22 whilst initialising SD card
[   11.382264] mmc1: unrecognised SCR structure version 4
[   11.387507] mmc1: error -22 whilst initialising SD card
[   11.479430] mmc1: unrecognised SCR structure version 4
[   11.484673] mmc1: error -22 whilst initialising SD card
[   12.569813] mmc1: unrecognised SCR structure version 4
[   12.575059] mmc1: error -22 whilst initialising SD card
[   12.645354] mmc1: unrecognised SCR structure version 4
[   12.650598] mmc1: error -22 whilst initialising SD card
[   12.726254] mmc1: unrecognised SCR structure version 4
[   12.731497] mmc1: error -22 whilst initialising SD card
[   12.823417] mmc1: unrecognised SCR structure version 4
[   12.828661] mmc1: error -22 whilst initialising SD card
[   13.913815] mmc1: unrecognised SCR structure version 4
[   13.919059] mmc1: error -22 whilst initialising SD card
[   13.989375] mmc1: unrecognised SCR structure version 4
[   13.994620] mmc1: error -22 whilst initialising SD card
[   14.070314] mmc1: unrecognised SCR structure version 4
[   14.075557] mmc1: error -22 whilst initialising SD card
[   14.167479] mmc1: unrecognised SCR structure version 4
[   14.172722] mmc1: error -22 whilst initialising SD card
[   15.257839] mmc1: unrecognised SCR structure version 4
[   15.263086] mmc1: error -22 whilst initialising SD card
[   15.333397] mmc1: unrecognised SCR structure version 4
[   15.338642] mmc1: error -22 whilst initialising SD card
[   15.414259] mmc1: unrecognised SCR structure version 4
[   15.419500] mmc1: error -22 whilst initialising SD card
[   15.511418] mmc1: unrecognised SCR structure version 4
[   15.516662] mmc1: error -22 whilst initialising SD card
[   16.601839] mmc1: unrecognised SCR structure version 4
[   16.607086] mmc1: error -22 whilst initialising SD card
[   16.677414] mmc1: unrecognised SCR structure version 4
[   16.682658] mmc1: error -22 whilst initialising SD card
[   16.758280] mmc1: unrecognised SCR structure version 4
[   16.763524] mmc1: error -22 whilst initialising SD card
[   16.855411] mmc1: unrecognised SCR structure version 4
[   16.860657] mmc1: error -22 whilst initialising SD card
[   17.945838] mmc1: unrecognised SCR structure version 4
[   17.951084] mmc1: error -22 whilst initialising SD card
[   18.022951] mmc1: unrecognised SCR structure version 4
[   18.028196] mmc1: error -22 whilst initialising SD card
[   18.103836] mmc1: unrecognised SCR structure version 4
[   18.109079] mmc1: error -22 whilst initialising SD card
[   18.200919] mmc1: unrecognised SCR structure version 4
[   18.206165] mmc1: error -22 whilst initialising SD card
[   19.289820] mmc1: unrecognised SCR structure version 4
[   19.295068] mmc1: error -22 whilst initialising SD card
[   19.365404] mmc1: unrecognised SCR structure version 4
[   19.370648] mmc1: error -22 whilst initialising SD card
[   19.446261] mmc1: unrecognised SCR structure version 4
[   19.451504] mmc1: error -22 whilst initialising SD card
[   19.543415] mmc1: unrecognised SCR structure version 4
[   19.548658] mmc1: error -22 whilst initialising SD card
[   20.633815] mmc1: unrecognised SCR structure version 4
[   20.639065] mmc1: error -22 whilst initialising SD card
[   20.709375] mmc1: unrecognised SCR structure version 4
[   20.714619] mmc1: error -22 whilst initialising SD card
[   20.790313] mmc1: unrecognised SCR structure version 4
[   20.795557] mmc1: error -22 whilst initialising SD card
[   20.887466] mmc1: unrecognised SCR structure version 4
[   20.892710] mmc1: error -22 whilst initialising SD card
[   21.977834] mmc1: unrecognised SCR structure version 4
[   21.983081] mmc1: error -22 whilst initialising SD card
[   22.053392] mmc1: unrecognised SCR structure version 4
[   22.058637] mmc1: error -22 whilst initialising SD card
[   22.134244] mmc1: unrecognised SCR structure version 4
[   22.139488] mmc1: error -22 whilst initialising SD card
[   22.231412] mmc1: unrecognised SCR structure version 4
[   22.236656] mmc1: error -22 whilst initialising SD card
[   23.321810] mmc1: unrecognised SCR structure version 4
[   23.327056] mmc1: error -22 whilst initialising SD card
[   23.397372] mmc1: unrecognised SCR structure version 4
[   23.402617] mmc1: error -22 whilst initialising SD card
[   23.478248] mmc1: unrecognised SCR structure version 4
[   23.483492] mmc1: error -22 whilst initialising SD card
[   23.575406] mmc1: unrecognised SCR structure version 4
[   23.580650] mmc1: error -22 whilst initialising SD card
[   24.665836] mmc1: unrecognised SCR structure version 4
[   24.671080] mmc1: error -22 whilst initialising SD card
[   24.741396] mmc1: unrecognised SCR structure version 4
[   24.746641] mmc1: error -22 whilst initialising SD card
[   24.822248] mmc1: unrecognised SCR structure version 4
[   24.827492] mmc1: error -22 whilst initialising SD card
[   24.919406] mmc1: unrecognised SCR structure version 4
[   24.924650] mmc1: error -22 whilst initialising SD card
[   26.009818] mmc1: unrecognised SCR structure version 4
[   26.015064] mmc1: error -22 whilst initialising SD card
[   26.085377] mmc1: unrecognised SCR structure version 4
[   26.090621] mmc1: error -22 whilst initialising SD card
[   26.166270] mmc1: unrecognised SCR structure version 4
[   26.171514] mmc1: error -22 whilst initialising SD card
[   26.263190] mmc1: unrecognised SCR structure version 4
[   26.268434] mmc1: error -22 whilst initialising SD card
[   27.353799] mmc1: unrecognised SCR structure version 4
[   27.359045] mmc1: error -22 whilst initialising SD card
[   27.429363] mmc1: unrecognised SCR structure version 4
[   27.434607] mmc1: error -22 whilst initialising SD card
[   27.512614] mmc1: unrecognised SCR structure version 4
[   27.517858] mmc1: error -22 whilst initialising SD card
[   27.609855] mmc1: unrecognised SCR structure version 4
[   27.615102] mmc1: error -22 whilst initialising SD card
[   28.697337] mmc1: unrecognised SCR structure version 4
[   28.702583] mmc1: error -22 whilst initialising SD card
[   28.772895] mmc1: unrecognised SCR structure version 4
[   28.778139] mmc1: error -22 whilst initialising SD card
[   28.854654] mmc1: unrecognised SCR structure version 4
[   28.859900] mmc1: error -22 whilst initialising SD card
[   28.951809] mmc1: unrecognised SCR structure version 4
[   28.957049] mmc1: error -22 whilst initialising SD card
[   30.041823] mmc1: unrecognised SCR structure version 4
[   30.047070] mmc1: error -22 whilst initialising SD card
[   30.117387] mmc1: unrecognised SCR structure version 4
[   30.122631] mmc1: error -22 whilst initialising SD card
[   30.198244] mmc1: unrecognised SCR structure version 4
[   30.203488] mmc1: error -22 whilst initialising SD card
[   30.295391] mmc1: unrecognised SCR structure version 4
[   30.300638] mmc1: error -22 whilst initialising SD card

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pi-boot-good.txt"

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 5.9.0-rc3-next-20200902-dirty (nathan@ubuntu-n2-xlarge-x86) (ClangBuiltLinux clang version 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb), LLD 12.0.0 (https://github.com/llvm/llvm-project.git b21ddded8f04fee925bbf9e6458347104b5b99eb)) #1 SMP PREEMPT Wed Sep 2 15:28:17 MST 2020
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.2
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x0000000037400000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x00000000fbffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xfb81f100-0xfb820fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000fbffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000003b3fffff]
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000fbffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000fbffffff]
[    0.000000] percpu: Embedded 23 pages/cpu s54168 r8192 d31848 u94208
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: EL2 vector hardening
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 996912
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line:  dma.dmachans=0x71f5 bcm2709.boardrev=0xc03112 bcm2709.serial=0xb78d398 bcm2709.uart_clock=48000000 bcm2709.disk_led_gpio=42 bcm2709.disk_led_active_low=0 smsc95xx.macaddr=DC:A6:32:60:6C:87 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  console=ttyS1,115200 console=tty1 root=PARTUUID=45a8dd8a-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait plymouth.ignore-serial-consoles
[    0.000000] Kernel parameter elevator= does not have any effect anymore.
[    0.000000] Please use sysfs to set IO scheduler for individual devices.
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: mapped [mem 0x33400000-0x37400000] (64MB)
[    0.000000] Memory: 3812260K/4050944K available (14524K kernel code, 2636K rwdata, 7540K rodata, 1600K init, 615K bss, 173148K reserved, 65536K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] random: get_random_bytes called from start_kernel+0x1cc/0x3f4 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000006] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
[    0.000195] Console: colour dummy device 80x25
[    0.000678] printk: console [tty1] enabled
[    0.000778] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=216000)
[    0.000808] pid_max: default: 32768 minimum: 301
[    0.000894] LSM: Security Framework initializing
[    0.001030] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.001116] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.002878] rcu: Hierarchical SRCU implementation.
[    0.005048] EFI services will not be available.
[    0.005338] smp: Bringing up secondary CPUs ...
[    0.005844] Detected PIPT I-cache on CPU1
[    0.005903] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.006454] Detected PIPT I-cache on CPU2
[    0.006493] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.007012] Detected PIPT I-cache on CPU3
[    0.007051] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.007133] smp: Brought up 1 node, 4 CPUs
[    0.007198] SMP: Total of 4 processors activated.
[    0.007214] CPU features: detected: 32-bit EL0 Support
[    0.007229] CPU features: detected: CRC32 instructions
[    0.007245] CPU features: detected: 32-bit EL1 Support
[    0.030492] CPU: All CPU(s) started at EL2
[    0.030550] alternatives: patching kernel code
[    0.032524] devtmpfs: initialized
[    0.037648] KASLR enabled
[    0.038091] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.038125] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.039986] pinctrl core: initialized pinctrl subsystem
[    0.041393] DMI not present or invalid.
[    0.041944] NET: Registered protocol family 16
[    0.043458] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.043610] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.043887] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.043939] audit: initializing netlink subsys (disabled)
[    0.044132] audit: type=2000 audit(0.040:1): state=initialized audit_enabled=0 res=1
[    0.045217] thermal_sys: Registered thermal governor 'step_wise'
[    0.045225] thermal_sys: Registered thermal governor 'power_allocator'
[    0.045555] cpuidle: using governor menu
[    0.045877] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.045978] ASID allocator initialised with 32768 entries
[    0.047544] Serial: AMBA PL011 UART driver
[    0.082787] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.082822] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.082840] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.082856] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.084212] cryptd: max_cpu_qlen set to 1000
[    0.086893] ACPI: Interpreter disabled.
[    0.088884] iommu: Default domain type: Translated 
[    0.089151] vgaarb: loaded
[    0.089505] SCSI subsystem initialized
[    0.089896] usbcore: registered new interface driver usbfs
[    0.089955] usbcore: registered new interface driver hub
[    0.090035] usbcore: registered new device driver usb
[    0.090208] usb_phy_generic phy: supply vcc not found, using dummy regulator
[    0.091009] pps_core: LinuxPPS API ver. 1 registered
[    0.091026] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.091055] PTP clock support registered
[    0.091238] EDAC MC: Ver: 3.0.0
[    0.092605] FPGA manager framework
[    0.092719] Advanced Linux Sound Architecture Driver Initialized.
[    0.093558] clocksource: Switched to clocksource arch_sys_counter
[    0.093791] VFS: Disk quotas dquot_6.6.0
[    0.093865] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.094072] pnp: PnP ACPI: disabled
[    0.100547] NET: Registered protocol family 2
[    0.101063] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.101121] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.101328] TCP bind hash table entries: 32768 (order: 7, 524288 bytes, linear)
[    0.101841] TCP: Hash tables configured (established 32768 bind 32768)
[    0.102055] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.102123] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.102329] NET: Registered protocol family 1
[    0.102824] RPC: Registered named UNIX socket transport module.
[    0.102842] RPC: Registered udp transport module.
[    0.102855] RPC: Registered tcp transport module.
[    0.102868] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.102888] PCI: CLS 0 bytes, default 64
[    0.104073] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 counters available
[    0.104224] kvm [1]: IPA Size Limit: 44bits
[    0.105353] kvm [1]: vgic interrupt IRQ1
[    0.105504] kvm [1]: Hyp mode initialized successfully
[    0.107404] Initialise system trusted keyrings
[    0.107581] workingset: timestamp_bits=44 max_order=20 bucket_order=0
[    0.114285] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.115072] NFS: Registering the id_resolver key type
[    0.115111] Key type id_resolver registered
[    0.115125] Key type id_legacy registered
[    0.115242] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.115415] 9p: Installing v9fs 9p2000 file system support
[    0.178130] Key type asymmetric registered
[    0.178149] Asymmetric key parser 'x509' registered
[    0.178205] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.178225] io scheduler mq-deadline registered
[    0.178239] io scheduler kyber registered
[    0.190560] EINJ: ACPI disabled.
[    0.208427] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.210486] printk: console [ttyS1] disabled
[    0.210587] fe215040.serial: ttyS1 at MMIO 0xfe215040 (irq = 18, base_baud = 24999999) is a 16550
[    1.115809] printk: console [ttyS1] enabled
[    1.121521] SuperH (H)SCI(F) driver initialized
[    1.126760] msm_serial: driver initialized
[    1.132523] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.147108] loop: module loaded
[    1.151491] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains driver
[    1.159778] megasas: 07.714.04.00-rc1
[    1.168551] libphy: Fixed MDIO Bus: probed
[    1.174162] tun: Universal TUN/TAP device driver, 1.6
[    1.180136] thunder_xcv, ver 1.0
[    1.183480] thunder_bgx, ver 1.0
[    1.186813] nicpf, ver 1.0
[    1.190780] hclge is initializing
[    1.194215] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    1.201583] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.207048] e1000: Intel(R) PRO/1000 Network Driver
[    1.212023] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.217916] e1000e: Intel(R) PRO/1000 Network Driver
[    1.222976] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.229054] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.234559] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.240268] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    1.246653] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.253048] sky2: driver version 1.30
[    1.257983] VFIO - User Level meta-driver version: 0.3
[    1.265221] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.271898] ehci-pci: EHCI PCI platform driver
[    1.276471] ehci-platform: EHCI generic platform driver
[    1.281934] ehci-orion: EHCI orion driver
[    1.286133] ehci-exynos: EHCI Exynos driver
[    1.290505] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.296820] ohci-pci: OHCI PCI platform driver
[    1.301386] ohci-platform: OHCI generic platform driver
[    1.306836] ohci-exynos: OHCI Exynos driver
[    1.311632] usbcore: registered new interface driver usb-storage
[    1.320631] i2c /dev entries driver
[    1.329492] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    1.337993] sdhci: Secure Digital Host Controller Interface driver
[    1.344303] sdhci: Copyright(c) Pierre Ossman
[    1.349337] Synopsys Designware Multimedia Card Interface Driver
[    1.356563] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.374853] ledtrig-cpu: registered to indicate activity on CPUs
[    1.382707] usbcore: registered new interface driver usbhid
[    1.388393] usbhid: USB HID core driver
[    1.393348] bcm2835-mbox fe00b880.mailbox: mailbox enabled
[    1.403299] NET: Registered protocol family 17
[    1.408070] 9pnet: Installing 9P2000 support
[    1.412487] Key type dns_resolver registered
[    1.417194] registered taskstats version 1
[    1.421390] Loading compiled-in X.509 certificates
[    1.431180] fe201000.serial: ttyAMA0 at MMIO 0xfe201000 (irq = 16, base_baud = 0) is a PL011 rev2
[    1.440427] serial serial0: tty port ttyAMA0 registered
[    1.461855] raspberrypi-firmware soc:firmware: Attached to firmware from 2020-08-24T18:50:56
[    1.505592] dwc2 fe980000.usb: supply vusb_d not found, using dummy regulator
[    1.513027] dwc2 fe980000.usb: supply vusb_a not found, using dummy regulator
[    1.621089] dwc2 fe980000.usb: EPs: 8, dedicated fifos, 4080 entries in SPRAM
[    1.633123] sdhci-iproc fe300000.sdhci: allocated mmc-pwrseq
[    1.671111] mmc0: SDHCI controller on fe300000.sdhci [fe300000.sdhci] using PIO
[    1.696128] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
[    1.703412] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.710695] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.719313] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
[    1.726750] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
[    1.737585] mmc1: SDHCI controller on fe340000.emmc2 [fe340000.emmc2] using ADMA
[    1.747325] ALSA device list:
[    1.750387]   No soundcards found.
[    1.754070] Waiting for root device PARTUUID=45a8dd8a-02...
[    1.793779] random: fast init done
[    1.810764] mmc0: new high speed SDIO card at address 0001
[    1.858064] mmc1: new ultra high speed DDR50 SDXC card at address aaaa
[    1.865420] mmcblk1: mmc1:aaaa SK64G 59.5 GiB 
[    1.871966]  mmcblk1: p1 p2
[    1.897160] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mode. Opts: (null)
[    1.905492] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    1.913206] devtmpfs: mounted
[    1.917652] Freeing unused kernel memory: 1600K
[    1.933776] Run /sbin/init as init process
[    2.314733] systemd[1]: System time before build time, advancing clock.
[    2.661797] NET: Registered protocol family 10
[    2.667365] Segment Routing with IPv6
[    2.730477] systemd[1]: systemd 241 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 default-hierarchy=hybrid)
[    2.752685] systemd[1]: Detected architecture arm64.
[    2.792164] systemd[1]: Set hostname to <raspberrypi>.
[    3.017532] systemd[1]: File /lib/systemd/system/systemd-journald.service:12 configures an IP firewall (IPAddressDeny=any), but the local system does not support BPF/cgroup based firewalling.
[    3.034988] systemd[1]: Proceeding WITHOUT firewalling in effect! (This warning is only shown for the first loaded unit using IP firewalling.)
[    3.309831] random: systemd: uninitialized urandom read (16 bytes read)
[    3.321952] random: systemd: uninitialized urandom read (16 bytes read)
[    3.329307] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.335968] random: systemd: uninitialized urandom read (16 bytes read)
[    3.345903] systemd[1]: Created slice system-serial\x2dgetty.slice.
[    3.353269] systemd[1]: Listening on Journal Audit Socket.
[    3.360213] systemd[1]: Created slice system-getty.slice.
[    3.366141] systemd[1]: Reached target Swap.

--wac7ysb48OaltWcw
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--wac7ysb48OaltWcw--
