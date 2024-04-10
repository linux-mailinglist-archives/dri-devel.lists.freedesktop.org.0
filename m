Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D289F41D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2042911338D;
	Wed, 10 Apr 2024 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="S3DCsCud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C20F11338C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1712755498; x=1713360298; i=deller@gmx.de;
 bh=AZ+e7abeuMAbqw5DuoP6+wi7y8hthSxtAmUf+jW6o2Q=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=S3DCsCudv3+cTiXQb4nAlzsx341FtS8rfjx76fVEVGmFqTSEL/AnyJvFxSs1VB9G
 5IRbXjCwBj8i7dWnAevyR515OmuTWnb1yK0W7Hhj0JxGDVw8uk/8Rm+7OUh4rg3OY
 v+exwBhp17cJy8mcxylOYMtDSyUfQJV/mdMlVJV7xSLwuO+4yJ9QlTWOe7lJXzF7Q
 fdoD5F7HG7GiO7FMbRZWEfXmgHGEbm7rkd7gMWqBOc8U5fmm067A1rZCzWXmGIUBW
 Cw6fW5mGobY66Pt5diWVp13yFiSEbD/5fr5uKRyXwB2REUsjHQjD5Hfrb16RQjzpH
 afIV/wlKSZPLkTwJ6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf0BG-1sQqYq1LDe-00gWPK; Wed, 10
 Apr 2024 15:24:58 +0200
Message-ID: <d701de84-8ee3-40a5-9dc8-575f516560e8@gmx.de>
Date: Wed, 10 Apr 2024 15:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] fbdev: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org
References: <20240410105626.2743168-1-schnelle@linux.ibm.com>
 <20240410105626.2743168-2-schnelle@linux.ibm.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240410105626.2743168-2-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rQPro57Z0kJml3t3HN1mQ0FvFH7vtFvCNogl7+aH8zpDy2cEFBy
 eQMW1T35AXZUaK7U0PXZL7EFvDzXZ4M/kHZY2eFCG6tGNBzVVlK+RadJd0gAgxhBXHihk/Q
 0gWUoq9ScbabBFtb4SpngDFQkKvzNQDRd1zSLM49sAOEY2pP1CCpyqeC3Zx0yqalrgZ9B0P
 oL2uqBIVGlK6E2Dk0Z42w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cjDSlXYddeI=;bDiKn/4hxaA4+RMSabL+P4ZVhsA
 d/7kasFxfO/I0VjxyUAEoy7EKAkxqAGcdPXAZATIq68BdV34qyNpC/Qfet/3iP6qACccia8JV
 u/vD9O0esAb7Nr939bjSR4wFIynTS0Kc1A9+4J71Lsj8pPZdBo6F3xnoqUIG2WwLR5A3emaRp
 PTEDnKF0p7uIb+c4Xm+tbhva39CSfM6XM2wwTskA15qW/iqxm+Xe1o84OylIezxpJ85fUPBe9
 rqXku6dclDTCIkaJQa0KL8kTW0l1VBTn09jQKypDaft4rTrYdV7Ro/o71JVeB6c1RXsYXQsW5
 VoriEQxfIQpLBzYgeagrSYvu/SrT1wbdKOSkAgKK07UANkrnPddQ7oPE5sceV3vcSS9GM6D0u
 NyLcx6V+960QOWbxE3Sg5D0uhT+ZJCUfbtR/gd9Uvu0642amORduJUiV920+1pn/RfTrQvaE8
 80uFJHatvmUtXshQViFbrkuM71bbiVIvzMlxtBoYW3Ed4NhmgEDzdW/eFeFqS8W6toXqj4hGR
 q3TFiOag+eTJSAF5U4yRPase3gbpRPRAqkW7Yzw8bbtgN5qrdNk9OHd8b8LMZALusudHbnI5X
 U4isBcQWEaphGTXOjr8Z72Ok2/0/7MgP4+IYoouhQM937MZLX8oaSNTl1iTtXPYC8q96AN+vv
 RdIDu+msZ6FxXA10HYFt+vXHCS8a0rHJiEwp6vi3Z1jRfu6oDNf+GsGYwAY90J4YEqlLL+Pw0
 S1EJxQBRS7S8jkqUM3Hnn8PzgWyut1+pvi3kZefm7FLqS7Esf7S+LVvALILGDII8zXI9HPJkY
 fnRrSCef/hjxe3VZcFWm0Tch+G8ue8Bu8RmvKrr0i7M/0=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/10/24 12:56, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friends a=
t
> compile time. We thus need to add HAS_IOPORT as dependency for those
> drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

added to fbdev git tree.

Thanks!
Helge


> ---
> Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
> and may be merged via subsystem specific trees at your earliest
> convenience.
>
> v1 -> v2:
> - Add dependency for FB_ARC
>
>   drivers/video/fbdev/Kconfig | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 197b6d5268e9..76bbfd3767da 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -157,7 +157,7 @@ config FB_IMX
>
>   config FB_CYBER2000
>   	tristate "CyberPro 2000/2010/5000 support"
> -	depends on FB && PCI && (BROKEN || !SPARC64)
> +	depends on FB && PCI && HAS_IOPORT && (BROKEN || !SPARC64)
>   	select FB_IOMEM_HELPERS
>   	help
>   	  This enables support for the Integraphics CyberPro 20x0 and 5000
> @@ -245,7 +245,7 @@ config FB_FM2
>
>   config FB_ARC
>   	tristate "Arc Monochrome LCD board support"
> -	depends on FB && (X86 || COMPILE_TEST)
> +	depends on FB && HAS_IOPORT && (X86 || COMPILE_TEST)
>   	select FB_SYSMEM_HELPERS_DEFERRED
>   	help
>   	  This enables support for the Arc Monochrome LCD board. The board
> @@ -1046,7 +1046,7 @@ config FB_ATY_BACKLIGHT
>
>   config FB_S3
>   	tristate "S3 Trio/Virge support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1107,7 +1107,7 @@ config FB_SAVAGE_ACCEL
>
>   config FB_SIS
>   	tristate "SiS/XGI display support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select BOOT_VESA_SUPPORT if FB_SIS =3D y
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
> @@ -1138,7 +1138,7 @@ config FB_SIS_315
>
>   config FB_VIA
>   	tristate "VIA UniChrome (Pro) and Chrome9 display support"
> -	depends on FB && PCI && GPIOLIB && I2C && (X86 || COMPILE_TEST)
> +	depends on FB && PCI && GPIOLIB && I2C && HAS_IOPORT && (X86 || COMPIL=
E_TEST)
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1177,7 +1177,7 @@ endif
>
>   config FB_NEOMAGIC
>   	tristate "NeoMagic display support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1204,7 +1204,7 @@ config FB_KYRO
>
>   config FB_3DFX
>   	tristate "3Dfx Banshee/Voodoo3/Voodoo5 display support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1252,7 +1252,7 @@ config FB_VOODOO1
>
>   config FB_VT8623
>   	tristate "VIA VT8623 support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1267,7 +1267,7 @@ config FB_VT8623
>
>   config FB_TRIDENT
>   	tristate "Trident/CyberXXX/CyberBlade support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1290,7 +1290,7 @@ config FB_TRIDENT
>
>   config FB_ARK
>   	tristate "ARK 2000PV support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -1814,7 +1814,7 @@ config FB_SSD1307
>
>   config FB_SM712
>   	tristate "Silicon Motion SM712 framebuffer support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_IOMEM_HELPERS
>   	help
>   	  Frame buffer driver for the Silicon Motion SM710, SM712, SM721

