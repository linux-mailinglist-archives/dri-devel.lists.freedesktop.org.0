Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED81D3146
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 15:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6D46E91A;
	Thu, 14 May 2020 13:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85C089FEA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:28:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200514132808euoutp02aa811f8307c38f82f982f943440315cb~O6BN19qmi0810308103euoutp02H
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:28:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200514132808euoutp02aa811f8307c38f82f982f943440315cb~O6BN19qmi0810308103euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589462888;
 bh=yIrf21r7axTfbevhR2aw2TeYa13FPhahOKl3Ek3yiPY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=grakMfZg+KZ9kSQCS66P/FblZvSALFiyF0shFwYjteWhW4+iX1npWGZSREonC9aEz
 uS2v2QKpi2M9bVofvMJLCSrC5RyncfspAHH4FJfdHs+yb0wohG95P/bcKxkGP5w7pj
 CFndCan7CMP8zHQvkV2ZdoRXp1PAzBDg5B/5lo6Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200514132808eucas1p2f2d1b9673a0b47bdb6522b1724b9c3b8~O6BNrvo5p1563815638eucas1p2m;
 Thu, 14 May 2020 13:28:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DF.F2.60679.8674DBE5; Thu, 14
 May 2020 14:28:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200514132808eucas1p17d6555a3d8720d92576c028dec9b10cf~O6BNaqvJw1470214702eucas1p1z;
 Thu, 14 May 2020 13:28:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200514132808eusmtrp19b4c905fbc5a5986b6062e340ee8e0f8~O6BNaEM8W2700227002eusmtrp19;
 Thu, 14 May 2020 13:28:08 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-0a-5ebd4768b723
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 06.F0.07950.8674DBE5; Thu, 14
 May 2020 14:28:08 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200514132808eusmtip2700ba0844cff1fe9f5ad79be872eb02d~O6BNG86K42553625536eusmtip2p;
 Thu, 14 May 2020 13:28:07 +0000 (GMT)
Subject: Re: [PATCH] fbdev: annotate rivafb/nvidiafb as obsolete
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <178a203a-fc3e-0027-60c9-786c3e907407@samsung.com>
Date: Thu, 14 May 2020 15:28:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200513215342.2145495-1-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djP87oZ7nvjDJ61qlj87P7CZnHl63s2
 iz1X7zFZnOj7wOrA4rFz1l12j/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4MpY3PKbueC9ZsWn
 Lz9ZGxg3K3UxcnJICJhILJ7QytzFyMUhJLCCUeLElClQzhdGiblzZjJBOJ8ZJZZfuMwG03Ky
 YysrRGI5o8S3HW0sIAkhgbeMEv0XmEBsYQEHiRk9h9lBbBEBbYnpD+cwg9jMAukSZ56tB7PZ
 BKwkJravYgSxeQXsJD4vvgRmswioSlz4ORmsV1QgQuLTg8OsEDWCEidnPgHaxcHBCTR/yZc4
 iJHiEreezGeCsOUltr+dA/aBhEAzu8TCeYsYIY52kbj1/iE7hC0s8er4FihbRuL05B4WiIZ1
 jBJ/O15AdW8HennyP6iXrSXunPvFBrKZWUBTYv0ufYiwo8T/1lZGkLCEAJ/EjbeCEEfwSUza
 Np0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyT2BUmoXks1lI3pmF5J1ZCHsXMLKsYhRPLS3OTU8t
 NspLLdcrTswtLs1L10vOz93ECEwop/8d/7KDcdefpEOMAhyMSjy8Frd2xwmxJpYVV+YeYpTg
 YFYS4fVbDxTiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qB
 kfvNZYW5oZ1Hgp4f/2OvZ1XeGspecaysZoH4+fzElk3Fe0u//Oh1i3e46npT4PHc1Lf+jNd9
 Oz2eb32SwjHrcU/I1vLIFs8M86578+e1TTJaXFohOemZ6FPRd+J9F7fklGrGN9e8nvDK8ftv
 e99VVtUfv20oVGWeEmeeJhh8+9uSxpz16ZVKSizFGYmGWsxFxYkA54emJyQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7oZ7nvjDF7O4LX42f2FzeLK1/ds
 Fnuu3mOyONH3gdWBxWPnrLvsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexuOU3c8F7zYpPX36yNjBuVupi5OSQEDCRONmx
 lbWLkYtDSGApo8TNhrVADgdQQkbi+PoyiBphiT/Xutggal4zSrz9c5EVJCEs4CAxo+cwO4gt
 IqAtMf3hHGYQm1kgXaK/+QHU0MmMEo0NV8CK2ASsJCa2r2IEsXkF7CQ+L74EZrMIqEpc+DkZ
 rEZUIELi8I5ZUDWCEidnPmEBOYgTaNmSL3EQ89Ul/sy7BLVLXOLWk/lMELa8xPa3c5gnMArN
 QtI9C0nLLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYQduO/dyyg7HrXfAh
 RgEORiUeXotbu+OEWBPLiitzDzFKcDArifD6rQcK8aYkVlalFuXHF5XmpBYfYjQF+m0is5Ro
 cj4wuvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTBa7TK9GP5n
 UaTp5Z1TUiQWcLqFyskkcX3o9by23tZ+h9uknat321TUlofzaM9NSN/+vzy9IOR4tv7HK69k
 22MYUxTbS86yvdcT9VmyfWprW5+dkzSXa0tx2wXTL0/ZxGY2eWSdmpcYWuX46SLrhQkdMc8S
 Dty37qnuW7Kd4XXXDhfD3oPnrJRYijMSDbWYi4oTAfshwrG2AgAA
X-CMS-MailID: 20200514132808eucas1p17d6555a3d8720d92576c028dec9b10cf
X-Msg-Generator: CA
X-RootMTR: 20200513215627eucas1p1c919a6175b210c13fe7b920c455ebb62
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513215627eucas1p1c919a6175b210c13fe7b920c455ebb62
References: <CGME20200513215627eucas1p1c919a6175b210c13fe7b920c455ebb62@eucas1p1.samsung.com>
 <20200513215342.2145495-1-emil.l.velikov@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi!

On 5/13/20 11:53 PM, Emil Velikov wrote:
> Drivers have not seen any love for years.
> 
> Be that fixes or improvements, or cosmetics like introducing symbolic
> names, style and code-flow polish.
> 
> Seemingly the maintainer has also disappeared years ago :-\
> 
> Considering nouveau supports all that hardware (modulo nv03) just mark
> these as obsolete/broken, referring to nouveau in the help text.
> 
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  MAINTAINERS                           | 3 +--
>  arch/powerpc/configs/g5_defconfig     | 2 --
>  arch/powerpc/configs/pasemi_defconfig | 2 --
>  arch/powerpc/configs/pmac32_defconfig | 2 --
>  arch/powerpc/configs/ppc6xx_defconfig | 3 ---
>  drivers/video/fbdev/Kconfig           | 6 ++++++
>  6 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 515a81fdb7d6..cc9da9a1e230 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11247,9 +11247,8 @@ F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
>  
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> -M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> -S:	Maintained
> +S:	Obsolete
>  F:	drivers/video/fbdev/riva/
>  F:	drivers/video/fbdev/nvidia/
>  
> diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
> index ceb3c770786f..24225e39662a 100644
> --- a/arch/powerpc/configs/g5_defconfig
> +++ b/arch/powerpc/configs/g5_defconfig
> @@ -130,8 +130,6 @@ CONFIG_FB=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_OF=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_RADEON=y
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
> index c0423b2cf7c0..36b242efae9a 100644
> --- a/arch/powerpc/configs/pasemi_defconfig
> +++ b/arch/powerpc/configs/pasemi_defconfig
> @@ -107,8 +107,6 @@ CONFIG_DRM_RADEON=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_VGA16=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_RADEON=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  CONFIG_VGACON_SOFT_SCROLLBACK=y
> diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
> index 50b610b48914..ef4470d44763 100644
> --- a/arch/powerpc/configs/pmac32_defconfig
> +++ b/arch/powerpc/configs/pmac32_defconfig
> @@ -211,8 +211,6 @@ CONFIG_FB_PLATINUM=y
>  CONFIG_FB_VALKYRIE=y
>  CONFIG_FB_CT65550=y
>  CONFIG_FB_IMSTT=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
>  CONFIG_FB_MATROX=y
>  CONFIG_FB_MATROX_MILLENIUM=y
>  CONFIG_FB_MATROX_MYSTIQUE=y
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index 7c6baf6df139..5b4e26de0bcf 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -752,9 +752,6 @@ CONFIG_FB_OF=y
>  CONFIG_FB_PLATINUM=y
>  CONFIG_FB_VALKYRIE=y
>  CONFIG_FB_CT65550=y
> -CONFIG_FB_NVIDIA=y
> -CONFIG_FB_NVIDIA_I2C=y
> -CONFIG_FB_RIVA=m
>  CONFIG_FB_MATROX=y
>  CONFIG_FB_MATROX_MILLENIUM=y
>  CONFIG_FB_MATROX_MYSTIQUE=y

defconfigs should be converted to use the nouveau driver
(in a separate patch please).

> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 1b2f5f31fb6f..cad3e4bc5e52 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -868,6 +868,7 @@ config FB_ATMEL
>  
>  config FB_NVIDIA
>  	tristate "nVidia Framebuffer Support"
> +	depends on BROKEN

Please don't add new users of BROKEN config option.

Either it is broken and should be removed right now (BROKEN config option
predates git and with git nothing is ever lost), or it still works and
should be left alone.

>  	depends on FB && PCI
>  	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>  	select FB_MODE_HELPERS
> @@ -877,6 +878,8 @@ config FB_NVIDIA
>  	select BITREVERSE
>  	select VGASTATE
>  	help
> +	  Obsolete, use nouveau instead.

"nouveau" -> "nouveau DRM driver"

Please also add a runtime warning in the driver probe function with a fixed
date for removal, i.e.:

	pr_warn("Legacy nvidiafb framebuffer driver will be removed in 2022\n
		"Please switch to nouveau DRM driver\n");

> +
>  	  This driver supports graphics boards with the nVidia chips, TNT
>  	  and newer. For very old chipsets, such as the RIVA128, then use
>  	  the rivafb.
> @@ -915,6 +918,7 @@ config FB_NVIDIA_BACKLIGHT
>  
>  config FB_RIVA
>  	tristate "nVidia Riva support"
> +	depends on BROKEN
>  	depends on FB && PCI
>  	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
>  	select FB_MODE_HELPERS
> @@ -924,6 +928,8 @@ config FB_RIVA
>  	select BITREVERSE
>  	select VGASTATE
>  	help
> +	  Obsolete, use nouveau instead.
> +

ditto

>  	  This driver supports graphics boards with the nVidia Riva/Geforce
>  	  chips.
>  	  Say Y if you have such a graphics board.
> 

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
