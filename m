Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB243668EE2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 08:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ED710E998;
	Fri, 13 Jan 2023 07:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A425F10E998
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 07:12:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C10EF62238;
 Fri, 13 Jan 2023 07:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE1AC433D2;
 Fri, 13 Jan 2023 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673593968;
 bh=QW1PY3rFgL7HIa1lrzMI5uksSAfbml0XYJbvQzFAuWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0oMMF0AsnNGVsfn35DXLDvgW2FFDBQctJVJeY8ZKTXb5ezzn7lhGkAftJpZH35IQL
 SnxMV96zvZ93p/8lbSuV6nhLT/2v6ajWOmV2dS1jXf/y0bbQOvb+apnJ6XXiXzoBRc
 F2PSRDe2WkZQdYDnszi1VWAGguwJrTfCgd0RBj8I=
Date: Fri, 13 Jan 2023 08:12:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
Message-ID: <Y8EEbCP6PRMzWP5y@kroah.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-3-hch@lst.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 07:23:19AM +0100, Christoph Hellwig wrote:
> USB_OHCI_SH is a dummy option that never builds any code, remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/usb/host/Kconfig | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 8d799d23c476e1..ca5f657c092cf4 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -548,17 +548,6 @@ config USB_OHCI_HCD_SSB
>  
>  	  If unsure, say N.
>  
> -config USB_OHCI_SH
> -	bool "OHCI support for SuperH USB controller (DEPRECATED)"
> -	depends on SUPERH || COMPILE_TEST
> -	select USB_OHCI_HCD_PLATFORM
> -	help
> -	  This option is deprecated now and the driver was removed, use
> -	  USB_OHCI_HCD_PLATFORM instead.
> -
> -	  Enables support for the on-chip OHCI controller on the SuperH.
> -	  If you use the PCI OHCI controller, this option is not necessary.
> -
>  config USB_OHCI_EXYNOS
>  	tristate "OHCI support for Samsung S5P/Exynos SoC Series"
>  	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> -- 
> 2.39.0
> 

Do you want all of these to go through a single tree, or can they go
through the different driver subsystem trees?

If single:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

If not, I'll be glad to take this.

thanks,

greg k-h
