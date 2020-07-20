Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C2227A64
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C70389A62;
	Tue, 21 Jul 2020 08:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7987089C8D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 23:28:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o11so19396140wrv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 16:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fALmHikCwdjyueFwfhicDSDPKSqtvisQ5e0TXQMf40k=;
 b=Pxpqz/mKMQrC/SefCwPUQFhpJMGbpMICDdu6+tKvoaGSIa6fZ7D2Tffemx8fPJ7sWC
 LYanf/0jhKzrDKywqduf61MhL5JflMFJZB2iM0S5iDYWxKqoplVKnIERsydku4ORuWQA
 fPOzJH7DK1fETCpubVgHcWIiefyi4QX264VzbfbxxWV44lKz5cHJc6yg/J1BQkoGl6TY
 S4N1ZuSTUTdng/5eoB8lN/6Bbibzm+oOZWEE8lW3xBHnO+6gxXQw747UpTxEcPBwyF+9
 nInOOHGj8P9MeUAizU8P8lo9eWOGogGmD/y+lR0AFAA61aqb8p0bqlRo0DLtyqjPWpaW
 q3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fALmHikCwdjyueFwfhicDSDPKSqtvisQ5e0TXQMf40k=;
 b=A6sPRtdMXeySaA+cu4JY4Fv7GoQFfaLkYIvBSe2vvzyJi+ZX9Li/4xlrnxF1oBwSuS
 yEru/+sZAJk7+I0sUjdycK1iGyJQp4rP39UJik5yHDgVRpU5q7L55ersOSbsuxWxqUbE
 2ZR1Qa+42sUbvHdmnibo6LnNTtKRPnVubsbZtNLf6lxA2UtmOJnMVxwQciuLhmRIxAOf
 Kk0Ym+8/th/zw5FN+XleJLJF2VopTb08DBZBkc9tFB+5OQBT/wiR4p4G2VJKg1sC7fCM
 rR09928BqooVztpdpH371fE3YrmEO+JltrhBzzkVGb7xX+Dn5P86xMwklXXG5h6rAXw3
 8fBg==
X-Gm-Message-State: AOAM531k6bs5DFpROe/Z4cSecJtxa0XRBHLC3vN6AFiQFraFUJywCLTp
 TGkqM8cSI6IiL9LbLGNogds=
X-Google-Smtp-Source: ABdhPJxoH03f8ZKKGZXRmnkhvID0cBIeVpRiroc+WTY3/KAECr9u8O6tpwd5dVhoyEO2dZ6RWQJIVQ==
X-Received: by 2002:a5d:400b:: with SMTP id n11mr23429848wrp.74.1595287690898; 
 Mon, 20 Jul 2020 16:28:10 -0700 (PDT)
Received: from [10.67.50.75] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id 31sm17243890wrj.94.2020.07.20.16.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 16:28:09 -0700 (PDT)
Subject: Re: [PATCH v8 00/12] PCI: brcmstb: enable PCIe for STB chips
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, bcm-kernel-feedback-list@broadcom.com,
 Robin Murphy <robin.murphy@arm.com>
References: <20200715143530.9702-1-james.quinlan@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <8e5be265-6029-3c43-989c-4a046dd60c50@gmail.com>
Date: Mon, 20 Jul 2020 16:27:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715143530.9702-1-james.quinlan@broadcom.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Julien Grall <julien.grall@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Oliver Neukum <oneukum@suse.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/20 7:35 AM, Jim Quinlan wrote:
> Patchset Summary:
>   Enhance a PCIe host controller driver.  Because of its unusual design
>   we are foced to change dev->dma_pfn_offset into a more general role
>   allowing multiple offsets.  See the 'v1' notes below for more info.

Christoph, Robin, are you happy with this version?

> 
> v8:
>   Commit: "device core: Introduce DMA range map, supplanting ..."
>   -- To satisfy a specific m68 compile configuration, I moved the 'struct
>      bus_dma_region; definition out of #ifdef CONFIG_HAS_DMA and also defined
>      three inline functions for !CONFIG_HAS_DMA (kernel test robot).
>   -- The sunXi drivers -- suc4i_csi, sun6i_csi, cedrus_hw -- set
>      a pfn_offset outside of_dma_configure() but the code offers no 
>      insight on the size of the translation window.  V7 had me using
>      SIZE_MAX as the size.  I have since contacted the sunXi maintainer and
>      he said that using a size of SZ_4G would cover sunXi configurations.
> 
> v7:
>   Commit: "device core: Introduce DMA range map, supplanting ..."
>   -- remove second kcalloc/copy in device.c (AndyS)
>   -- use PTR_ERR_OR_ZERO() and PHYS_PFN() (AndyS)
>   -- indentation, sizeof(struct ...) => sizeof(*r) (AndyS)
>   -- add pfn.h definitions: PFN_DMA_ADDR(), DMA_ADDR_PFN() (AndyS)
>   -- Fixed compile error in "sun6i_csi.c" (kernel test robot)
>   Commit "ata: ahci_brcm: Fix use of BCM7216 reset controller"
>   -- correct name of function in the commit msg (SergeiS)
>   
> v6:
>   Commit "device core: Introduce DMA range map":
>   -- of_dma_get_range() now takes a single argument and returns either
>      NULL, a valid map, or an ERR_PTR. (Robin)
>   -- offsets are no longer a PFN value but an actual address. (Robin)
>   -- the bus_dma_region struct stores the range size instead of
>      the cpu_end and pci_end values. (Robin)
>   -- devices that were setting a single offset with no boundaries
>      have been modified to have boundaries; in a few places
>      where this informatino was unavilable a /* FIXME: ... */
>      comment was added. (Robin)
>   -- dma_attach_offset_range() can be called when an offset
>      map already exists; if it's range is already present
>      nothing is done and success is returned. (Robin)
>   All commits:
>   -- Man name/style/corrections/etc changed (Bjorn)
>   -- rebase to Torvalds master
> 
> v5:
>   Commit "device core: Introduce multiple dma pfn offsets"
>   -- in of/address.c: "map_size = 0" => "*map_size = 0"
>   -- use kcalloc instead of kzalloc (AndyS)
>   -- use PHYS_ADDR_MAX instead of "~(phys_addr_t)0"
>   Commit "PCI: brcmstb: Set internal memory viewport sizes"
>   -- now gives error on missing dma-ranges property.
>   Commit "dt-bindings: PCI: Add bindings for more Brcmstb chips"
>   -- removed "Allof:" from brcm,scb-sizes definition (RobH)
>   All Commits:
>   -- indentation style, use max chars 100 (AndyS)
>   -- rebased to torvalds master
> 
> v4:
>   Commit "device core: Introduce multiple dma pfn offsets"
>   -- of_dma_get_range() does not take a dev param but instead
>      takes two "out" params: map and map_size.  We do this so
>      that the code that parses dma-ranges is separate from
>      the code that modifies 'dev'.   (Nicolas)
>   -- the separate case of having a single pfn offset has
>      been removed and is now processed by going through the
>      map array. (Nicolas)
>   -- move attach_uniform_dma_pfn_offset() from of/address.c to
>      dma/mapping.c so that it does not depend on CONFIG_OF. (Nicolas)
>   -- devm_kcalloc => devm_kzalloc (DanC)
>   -- add/fix assignment to dev->dma_pfn_offset_map for func
>      attach_uniform_dma_pfn_offset() (DanC, Nicolas)
>   -- s/struct dma_pfn_offset_region/struct bus_dma_region/ (Nicolas)
>   -- s/attach_uniform_dma_pfn_offset/dma_attach_uniform_pfn_offset/
>   -- s/attach_dma_pfn_offset_map/dma_attach_pfn_offset_map/
>   -- More use of PFN_{PHYS,DOWN,UP}. (AndyS)
>   Commit "of: Include a dev param in of_dma_get_range()"
>   -- this commit was sqaushed with "device core: Introduce ..."
> 
> v3:
>   Commit "device core: Introduce multiple dma pfn offsets"
>   Commit "arm: dma-mapping: Invoke dma offset func if needed"
>   -- The above two commits have been squashed.  More importantly,
>      the code has been modified so that the functionality for
>      multiple pfn offsets subsumes the use of dev->dma_pfn_offset.
>      In fact, dma_pfn_offset is removed and supplanted by
>      dma_pfn_offset_map, which is a pointer to an array.  The
>      more common case of a uniform offset is now handled as
>      a map with a single entry, while cases requiring multiple
>      pfn offsets use a map with multiple entries.  Code paths
>      that used to do this:
> 
>          dev->dma_pfn_offset = mydrivers_pfn_offset;
> 
>      have been changed to do this:
> 
>          attach_uniform_dma_pfn_offset(dev, pfn_offset);
> 
>   Commit "dt-bindings: PCI: Add bindings for more Brcmstb chips"
>   -- Add if/then clause for required props: resets, reset-names (RobH)
>   -- Change compatible list from const to enum (RobH)
>   -- Change list of u32-tuples to u64 (RobH)
> 
>   Commit "of: Include a dev param in of_dma_get_range()"
>   -- modify of/unittests.c to add NULL param in of_dma_get_range() call.
> 
>   Commit "device core: Add ability to handle multiple dma offsets"
>   -- align comment in device.h (AndyS).
>   -- s/cpu_beg/cpu_start/ and s/dma_beg/dma_start/ in struct
>      dma_pfn_offset_region (AndyS).
> 
> v2:
> Commit: "device core: Add ability to handle multiple dma offsets"
>   o Added helper func attach_dma_pfn_offset_map() in address.c (Chistoph)
>   o Helpers funcs added to __phys_to_dma() & __dma_to_phys() (Christoph)
>   o Added warning when multiple offsets are needed and !DMA_PFN_OFFSET_MAP
>   o dev->dma_pfn_map => dev->dma_pfn_offset_map
>   o s/frm/from/ for dma_pfn_offset_frm_{phys,dma}_addr() (Christoph)
>   o In device.h: s/const void */const struct dma_pfn_offset_region */
>   o removed 'unlikely' from unlikely(dev->dma_pfn_offset_map) since
>     guarded by CONFIG_DMA_PFN_OFFSET_MAP (Christoph)
>   o Since dev->dma_pfn_offset is copied in usb/core/{usb,message}.c, now
>     dev->dma_pfn_offset_map is copied as well.
>   o Merged two of the DMA commits into one (Christoph).
> 
> Commit "arm: dma-mapping: Invoke dma offset func if needed":
>   o Use helper functions instead of #if CONFIG_DMA_PFN_OFFSET
> 
> Other commits' changes:
>   o Removed need for carrying of_id var in priv (Nicolas)
>   o Commit message rewordings (Bjorn)
>   o Commit log messages filled to 75 chars (Bjorn)
>   o devm_reset_control_get_shared())
>     => devm_reset_control_get_optional_shared (Philipp)
>   o Add call to reset_control_assert() in PCIe remove routines (Philipp)
> 
> v1:
> This patchset expands the usefulness of the Broadcom Settop Box PCIe
> controller by building upon the PCIe driver used currently by the
> Raspbery Pi.  Other forms of this patchset were submitted by me years
> ago and not accepted; the major sticking point was the code required
> for the DMA remapping needed for the PCIe driver to work [1].
> 
> There have been many changes to the DMA and OF subsystems since that
> time, making a cleaner and less intrusive patchset possible.  This
> patchset implements a generalization of "dev->dma_pfn_offset", except
> that instead of a single scalar offset it provides for multiple
> offsets via a function which depends upon the "dma-ranges" property of
> the PCIe host controller.  This is required for proper functionality
> of the BrcmSTB PCIe controller and possibly some other devices.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/1516058925-46522-5-git-send-email-jim2101024@gmail.com/
> 
> Jim Quinlan (12):
>   PCI: brcmstb: PCIE_BRCMSTB depends on ARCH_BRCMSTB
>   ata: ahci_brcm: Fix use of BCM7216 reset controller
>   dt-bindings: PCI: Add bindings for more Brcmstb chips
>   PCI: brcmstb: Add bcm7278 register info
>   PCI: brcmstb: Add suspend and resume pm_ops
>   PCI: brcmstb: Add bcm7278 PERST# support
>   PCI: brcmstb: Add control of rescal reset
>   device core: Introduce DMA range map, supplanting dma_pfn_offset
>   PCI: brcmstb: Set additional internal memory DMA viewport sizes
>   PCI: brcmstb: Accommodate MSI for older chips
>   PCI: brcmstb: Set bus max burst size by chip type
>   PCI: brcmstb: Add bcm7211, bcm7216, bcm7445, bcm7278 to match list
> 
>  .../bindings/pci/brcm,stb-pcie.yaml           |  56 ++-
>  arch/arm/include/asm/dma-mapping.h            |   9 +-
>  arch/arm/mach-keystone/keystone.c             |  17 +-
>  arch/sh/drivers/pci/pcie-sh7786.c             |   9 +-
>  arch/sh/kernel/dma-coherent.c                 |  16 +-
>  arch/x86/pci/sta2x11-fixup.c                  |   7 +-
>  drivers/acpi/arm64/iort.c                     |   5 +-
>  drivers/ata/ahci_brcm.c                       |  11 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c         |   5 +-
>  drivers/iommu/io-pgtable-arm.c                |   2 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   5 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |   4 +-
>  drivers/of/address.c                          |  95 ++--
>  drivers/of/device.c                           |  47 +-
>  drivers/of/of_private.h                       |   9 +-
>  drivers/of/unittest.c                         |  35 +-
>  drivers/pci/controller/Kconfig                |   3 +-
>  drivers/pci/controller/pcie-brcmstb.c         | 408 +++++++++++++++---
>  drivers/remoteproc/remoteproc_core.c          |   2 +-
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   7 +-
>  drivers/usb/core/message.c                    |   4 +-
>  drivers/usb/core/usb.c                        |   2 +-
>  include/linux/device.h                        |   4 +-
>  include/linux/dma-direct.h                    |  10 +-
>  include/linux/dma-mapping.h                   |  43 ++
>  include/linux/pfn.h                           |   2 +
>  kernel/dma/coherent.c                         |  10 +-
>  kernel/dma/mapping.c                          |  53 +++
>  28 files changed, 683 insertions(+), 197 deletions(-)
> 


-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
