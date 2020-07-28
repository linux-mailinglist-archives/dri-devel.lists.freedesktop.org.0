Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06262319EA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876356E451;
	Wed, 29 Jul 2020 06:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5496E2D3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=VQf79G5Y1eYYYZQ+c40JhTQR5eeF5fS1GIEoN0sdVjk=; b=qNSCo0+U6rD0tp0Ek4aGz0TfvO
 nBazLgngluGnmrQvDaWmDjleBMz00xP9QsQFHnb+GVs3CKYaAVvoeK7srjo8B/4lcwr5O3MFVhp2Z
 2spINP4Pz/cvKMIc/qeVCe9qLmlV99cTY/icHc95162qvT247FfYrbATkZdrR0JMN7ZnVmCGaZt5d
 JEJGEsp4XwYW6Y9lo9HqoQhv+f+N6iMeWK/QRJj6l7MuO6U30XDyjQRAH6ovlaUooY0g8JQlkCc0i
 jgYVnFY5GdMamKazIcXDM9ucJUjPJ9Bz7OH6EsDvRfV6NTBmSu8hVeXe1z9/y+LvDaeaORvVTMytD
 Gbmadllg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0YSG-0000aH-TF; Tue, 28 Jul 2020 22:52:28 +0000
Subject: Re: linux-next: Tree for Jul 27 (drivers/gpu/drm/xlnx/zynqmp-dpsub)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200727232346.0106c375@canb.auug.org.au>
 <9122c7ca-86a6-1def-0ddc-536ba97b49b8@infradead.org>
 <20200728223243.GS13753@pendragon.ideasonboard.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20d362b1-eef5-0376-0d51-a4e661a60dca@infradead.org>
Date: Tue, 28 Jul 2020 15:52:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728223243.GS13753@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Bounine <alex.bou9@gmail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 dmaengine@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/20 3:32 PM, Laurent Pinchart wrote:
> Hi Randy,
> 
> (adding a few people to the CC list to discuss the proposed solution
> below)
> 
> Thanks for the report.
> 
> On Mon, Jul 27, 2020 at 05:49:41PM -0700, Randy Dunlap wrote:
>> On 7/27/20 6:23 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200724:
>>
>> on x86_64:
>>
>> WARNING: unmet direct dependencies detected for DMA_ENGINE
>>   Depends on [n]: DMADEVICES [=n]
>>   Selected by [m]:
>>   - DRM_ZYNQMP_DPSUB [=m] && HAS_IOMEM [=y] && (ARCH_ZYNQMP || COMPILE_TEST [=y]) && COMMON_CLK [=y] && DRM [=m] && OF [=y]
>>
>> and about 45 "undefined reference" build errors (here's a sample):
>>
>> ld: drivers/misc/mic/scif/scif_dma.o: in function `scif_sync_dma.constprop.11':
>> scif_dma.c:(.text+0x672): undefined reference to `dma_sync_wait'
>> ld: drivers/spi/spi-bcm2835.o: in function `bcm2835_dma_release.isra.9':
>> spi-bcm2835.c:(.text+0xb34): undefined reference to `dma_release_channel'
>> ld: spi-bcm2835.c:(.text+0xc17): undefined reference to `dma_release_channel'
>> ld: drivers/spi/spi-bcm2835.o: in function `bcm2835_dma_init':
>> spi-bcm2835.c:(.text+0xd3c): undefined reference to `dma_request_chan'
>> ld: spi-bcm2835.c:(.text+0xd8b): undefined reference to `dma_request_chan'
>> ld: spi-bcm2835.c:(.text+0xf8a): undefined reference to `dma_get_slave_caps'
>> ld: spi-bcm2835.c:(.text+0x11d0): undefined reference to `dma_get_slave_caps'
>> ld: drivers/spi/spi-ep93xx.o: in function `ep93xx_spi_release_dma':
>> spi-ep93xx.c:(.text+0x1fc): undefined reference to `dma_release_channel'
>> ld: spi-ep93xx.c:(.text+0x220): undefined reference to `dma_release_channel'
>> ERROR: modpost: "dma_release_channel" [drivers/gpu/drm/xlnx/zynqmp-dpsub.ko] undefined!
>>
>>
>>
>> I tried adding
>> 	depends on DMADEVICES
>> to DRM_ZYNQMP_DPSUB
>>
>> but that just gets into messy/ugly Kconfig
>> 	error: recursive dependency detected!
> 
> drivers/i2c/Kconfig:8:error: recursive dependency detected!
> drivers/i2c/Kconfig:8:  symbol I2C is selected by FB_DDC
> drivers/video/fbdev/Kconfig:63: symbol FB_DDC depends on FB
> drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_ZYNQMP_DPSUB
> drivers/gpu/drm/xlnx/Kconfig:1: symbol DRM_ZYNQMP_DPSUB depends on DMA_ENGINE
> drivers/dma/Kconfig:44: symbol DMA_ENGINE depends on DMADEVICES
> drivers/dma/Kconfig:6:  symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> sound/soc/sh/Kconfig:30:        symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> sound/soc/sh/Kconfig:60:        symbol SND_SIU_MIGOR depends on I2C
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"
> 
>> BTW, adding
>> 	select DMADEVICES
>> is not a good solution.  We try very hard not to enable entire
>> subsystems with one driver "select".  (No doubt you can find a
>> few examples that do just that, but it is strongly discouraged.)
> 
> If this isn't allowed, then we need to fix this where used, as that's
> what seems to cause the recursive dependency. Would the following
> patches be acceptable in your opinion ? If so I'll submit them proper.

Yes, they look like they do the right thing and I tested them.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for doing this.

> commit 410e29afd54fd23ee94cd1842b51b7a9e2f96cd8
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Jul 29 01:19:40 2020 +0300
> 
>     treewide: kconfig: Replace 'select' DMAENGINES 'with depends on'
>     
>     Enabling a whole subsystem from a single driver 'select' is frowned
>     upon and won't be accepted in new drivers, that need to use 'depends on'
>     instead. Existing selection of DMAENGINES will then cause circular
>     dependencies. Replace them with a dependency.
>     
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> diff --git a/drivers/rapidio/Kconfig b/drivers/rapidio/Kconfig
> index e4c422d806be..b9f8514909bf 100644
> --- a/drivers/rapidio/Kconfig
> +++ b/drivers/rapidio/Kconfig
> @@ -37,7 +37,7 @@ config RAPIDIO_ENABLE_RX_TX_PORTS
>  config RAPIDIO_DMA_ENGINE
>  	bool "DMA Engine support for RapidIO"
>  	depends on RAPIDIO
> -	select DMADEVICES
> +	depends on DMADEVICES
>  	select DMA_ENGINE
>  	help
>  	  Say Y here if you want to use DMA Engine frameork for RapidIO data
> diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
> index dc20f0f7080a..ef8a29b9f641 100644
> --- a/sound/soc/sh/Kconfig
> +++ b/sound/soc/sh/Kconfig
> @@ -30,8 +30,8 @@ config SND_SOC_SH4_FSI
>  config SND_SOC_SH4_SIU
>  	tristate
>  	depends on ARCH_SHMOBILE && HAVE_CLK
> +	depends on DMADEVICES
>  	select DMA_ENGINE
> -	select DMADEVICES
>  	select SH_DMAE
>  	select FW_LOADER
>  
> commit 3e68c8fc7a2f3f7992c7fa8b30108d3831c7fb3b
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Jul 29 01:23:32 2020 +0300
> 
>     drm: xlnx: dpsub: Fix DMADEVICES Kconfig dependency
> 
>     The dpsub driver uses the DMA engine API, and thus selects DMA_ENGINE to
>     provide that API. DMA_ENGINE depends on DMADEVICES, which can be
>     deselected by the user, creating a possibly unmet indirect dependency:
> 
>     WARNING: unmet direct dependencies detected for DMA_ENGINE
>       Depends on [n]: DMADEVICES [=n]
>       Selected by [m]:
>       - DRM_ZYNQMP_DPSUB [=m] && HAS_IOMEM [=y] && (ARCH_ZYNQMP || COMPILE_TEST [=y]) && COMMON_CLK [=y] && DRM [=m] && OF [=y]
> 
>     Add a dependency on DMADEVICES to fix this.
> 
>     Reported-by: Randy Dunlap <rdunlap@infradead.org>
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> index aa6cd889bd11..b52c6cdfc0b8 100644
> --- a/drivers/gpu/drm/xlnx/Kconfig
> +++ b/drivers/gpu/drm/xlnx/Kconfig
> @@ -2,6 +2,7 @@ config DRM_ZYNQMP_DPSUB
>  	tristate "ZynqMP DisplayPort Controller Driver"
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>  	depends on COMMON_CLK && DRM && OF
> +	depends on DMADEVICES
>  	select DMA_ENGINE
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_CMA_HELPER
> 
>> Full randconfig file is attached.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> [snip]
> 


-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
