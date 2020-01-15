Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5113C7F0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496DB6EA2D;
	Wed, 15 Jan 2020 15:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F317E6EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:35:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115153516euoutp02a3a50ddd35ef553a7dfc149a6d116609~qGV9KtUay1439314393euoutp02n
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:35:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115153516euoutp02a3a50ddd35ef553a7dfc149a6d116609~qGV9KtUay1439314393euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579102516;
 bh=5sG4GjBILFvXd/9O1RfHlJ+5tIqd8eAol+/n5yr61Mc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qsjZJfFwWa61TN9zzv2G66TSMdIbuzdQwxkol0rSJtem+LV5EJtZhlyGU2H7ifPbi
 dyl5sEPzRDVPIX7ngE/EDFCDMl1vqsyUmJZQ/wal8RU72q60KL2KwsSNExtBVKsOTs
 wSpmJuT5Y2hcyZm9pVnwTZ9TXD/MUc/lVe4x4ihA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115153516eucas1p10f1b4489d12c3c64364a2404791a3efc~qGV9Brx3Q1970319703eucas1p1q;
 Wed, 15 Jan 2020 15:35:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id FC.D3.60698.4313F1E5; Wed, 15
 Jan 2020 15:35:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115153515eucas1p2b32a48b04d3da7df6b1d8de9cf2c6a22~qGV8te4GB2166221662eucas1p2-;
 Wed, 15 Jan 2020 15:35:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115153515eusmtrp1edfa52ce328eb3514d8aa83a56d526cf~qGV8s0aqN2095320953eusmtrp18;
 Wed, 15 Jan 2020 15:35:15 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-b5-5e1f3134e669
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D2.DF.07950.3313F1E5; Wed, 15
 Jan 2020 15:35:15 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115153515eusmtip1389e3e869afd68a49093113061e775e5~qGV8QxZFL2759327593eusmtip1C;
 Wed, 15 Jan 2020 15:35:15 +0000 (GMT)
Subject: Re: [PATCH v3] video: Fix Kconfig indentation
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <c33046fc-c949-3705-a227-b9e2f8846d4d@samsung.com>
Date: Wed, 15 Jan 2020 16:35:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1574309383-31278-1-git-send-email-krzk@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87omhvJxBrO+8ViceXOX3eLK1/ds
 Fiu+zGS32HpL2uL8+Q3sFve/HmW0ONH3gdXi8q45bBbv919mcuD02DnrLrvHplWdbB53ru1h
 87jffZzJ4/MmuQDWKC6blNSczLLUIn27BK6MXV9rCjYFVJy6mN3A+NS6i5GTQ0LAROLcrfus
 XYxcHEICKxglrjf9YgdJCAl8YZQ4M9cVIvGZUWL6kkZWmI6+bauZIRLLGSVu/rvABOG8ZZR4
 vvoRE0iVsICZxNoLbSwgtoiApsT1v9/BdjALzGKS6Dx/FizBJmAlMbF9FSOIzStgJ/Hlxnuw
 OIuAqsTX1XPB7hAViJD49OAwK0SNoMTJmU/AajgFHCQ+XtsLtoxZQFzi1pP5ULa8xPa3c8DO
 kxA4xC7R8HEx1N0uEgvfTmKEsIUlXh3fwg5hy0icntzDAtGwjlHib8cLqO7tjBLLJ/9jg6iy
 lrhz7heQzQG0QlNi/S59EFNCwFFi6S4XCJNP4sZbQYgb+CQmbZvODBHmlehoE4KYoSaxYdkG
 NpitXTtXMk9gVJqF5LNZSL6ZheSbWQhrFzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/d
 xAhMSaf/Hf+6g3Hfn6RDjAIcjEo8vBl/5OKEWBPLiitzDzFKcDArifCenCEbJ8SbklhZlVqU
 H19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAPjoUXSBR+3G05a+7RCUuak
 zHZ5q4YTm81WhmozrbtxLFT0lZ5GdMvTsxKWAXw5hQmnVJkKj6deevPfVrA5/+OBk/4r9eq9
 Vza0dtuEnZ1+5KLZ6VvX973MSvwjaVeVfi15E9faL3wOywPVUvZKKv97ERvmeUHn2sI7u1rE
 OpRusSfG2dwWW3hDiaU4I9FQi7moOBEAwSk950UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7rGhvJxBhuXmFiceXOX3eLK1/ds
 Fiu+zGS32HpL2uL8+Q3sFve/HmW0ONH3gdXi8q45bBbv919mcuD02DnrLrvHplWdbB53ru1h
 87jffZzJ4/MmuQDWKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
 zLLUIn27BL2MXV9rCjYFVJy6mN3A+NS6i5GTQ0LARKJv22rmLkYuDiGBpYwSB15cYepi5ABK
 yEgcX18GUSMs8edaFxtEzWtGif/fJ7GDJIQFzCTWXmhjAbFFBDQlrv/9zgpSxCwwh0liz8ku
 VoiOyYwSmzeeZQOpYhOwkpjYvooRxOYVsJP4cuM9WDeLgKrE19VzwaaKCkRIHN4xC6pGUOLk
 zCdgNZwCDhIfr+1lArGZBdQl/sy7xAxhi0vcejIfKi4vsf3tHOYJjEKzkLTPQtIyC0nLLCQt
 CxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG4bZjP7fsYOx6F3yIUYCDUYmH98A/uTgh
 1sSy4srcQ4wSHMxKIrwnZ8jGCfGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MEHklcQbmhqa
 W1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgVHvWskfP6rh8IP/2WU43txzY
 euZYu7h46/Y5UjWbbf5+iFdM7KoLO37XeLId41H17AfMsvHeC2va47Lygmsm+X0Lqlkjo2B+
 ru6S5IOqVpeLYosjzjEF/XYQt14hoif0Pqttb19pQ+bbEMnjUlmrb213sZ7drN81tTBNJ2pD
 /wrDxfxinM+UWIozEg21mIuKEwE8CeVY2AIAAA==
X-CMS-MailID: 20200115153515eucas1p2b32a48b04d3da7df6b1d8de9cf2c6a22
X-Msg-Generator: CA
X-RootMTR: 20191121040952eucas1p195a72ff781aab1fdca00871bfe8a66c2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191121040952eucas1p195a72ff781aab1fdca00871bfe8a66c2
References: <CGME20191121040952eucas1p195a72ff781aab1fdca00871bfe8a66c2@eucas1p1.samsung.com>
 <1574309383-31278-1-git-send-email-krzk@kernel.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jiri Kosina <trivial@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/21/19 5:09 AM, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Patch queued for v5.6, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> 
> Changes since v2:
> 1. Add Bartlomiej's ack.
> 
> Changes since v1:
> 1. Fix also 7-space and tab+1 space indentation issues.
> ---
>  drivers/video/Kconfig           |   4 +-
>  drivers/video/backlight/Kconfig |  16 ++---
>  drivers/video/console/Kconfig   | 132 ++++++++++++++++++++--------------------
>  3 files changed, 76 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 427a993c7f57..74c2f39cec90 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -26,8 +26,8 @@ endmenu
>  source "drivers/video/backlight/Kconfig"
>  
>  config VGASTATE
> -       tristate
> -       default n
> +	tristate
> +	default n
>  
>  config VIDEOMODE_HELPERS
>  	bool
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 403707a3e503..e25fdd8ce3e7 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -9,7 +9,7 @@ menu "Backlight & LCD device support"
>  # LCD
>  #
>  config LCD_CLASS_DEVICE
> -        tristate "Lowlevel LCD controls"
> +	tristate "Lowlevel LCD controls"
>  	help
>  	  This framework adds support for low-level control of LCD.
>  	  Some framebuffer devices connect to platform-specific LCD modules
> @@ -141,10 +141,10 @@ endif # LCD_CLASS_DEVICE
>  # Backlight
>  #
>  config BACKLIGHT_CLASS_DEVICE
> -        tristate "Lowlevel Backlight controls"
> +	tristate "Lowlevel Backlight controls"
>  	help
>  	  This framework adds support for low-level control of the LCD
> -          backlight. This includes support for brightness and power.
> +	  backlight. This includes support for brightness and power.
>  
>  	  To have support for your specific LCD panel you will have to
>  	  select the proper drivers which depend on this option.
> @@ -269,11 +269,11 @@ config BACKLIGHT_MAX8925
>  	  WLED output, say Y here to enable this driver.
>  
>  config BACKLIGHT_APPLE
> -       tristate "Apple Backlight Driver"
> -       depends on X86 && ACPI
> -       help
> -         If you have an Intel-based Apple say Y to enable a driver for its
> -	 backlight.
> +	tristate "Apple Backlight Driver"
> +	depends on X86 && ACPI
> +	help
> +	  If you have an Intel-based Apple say Y to enable a driver for its
> +	  backlight.
>  
>  config BACKLIGHT_TOSA
>  	tristate "Sharp SL-6000 Backlight Driver"
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index c10e17fb9a9a..ed8480d324b1 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -23,26 +23,26 @@ config VGA_CONSOLE
>  	  Say Y.
>  
>  config VGACON_SOFT_SCROLLBACK
> -       bool "Enable Scrollback Buffer in System RAM"
> -       depends on VGA_CONSOLE
> -       default n
> -       help
> -         The scrollback buffer of the standard VGA console is located in
> -	 the VGA RAM.  The size of this RAM is fixed and is quite small.
> -	 If you require a larger scrollback buffer, this can be placed in
> -	 System RAM which is dynamically allocated during initialization.
> -	 Placing the scrollback buffer in System RAM will slightly slow
> -	 down the console.
> -
> -	 If you want this feature, say 'Y' here and enter the amount of
> -	 RAM to allocate for this buffer.  If unsure, say 'N'.
> +	bool "Enable Scrollback Buffer in System RAM"
> +	depends on VGA_CONSOLE
> +	default n
> +	help
> +	  The scrollback buffer of the standard VGA console is located in
> +	  the VGA RAM.  The size of this RAM is fixed and is quite small.
> +	  If you require a larger scrollback buffer, this can be placed in
> +	  System RAM which is dynamically allocated during initialization.
> +	  Placing the scrollback buffer in System RAM will slightly slow
> +	  down the console.
> +
> +	  If you want this feature, say 'Y' here and enter the amount of
> +	  RAM to allocate for this buffer.  If unsure, say 'N'.
>  
>  config VGACON_SOFT_SCROLLBACK_SIZE
> -       int "Scrollback Buffer Size (in KB)"
> -       depends on VGACON_SOFT_SCROLLBACK
> -       range 1 1024
> -       default "64"
> -       help
> +	int "Scrollback Buffer Size (in KB)"
> +	depends on VGACON_SOFT_SCROLLBACK
> +	range 1 1024
> +	default "64"
> +	help
>  	  Enter the amount of System RAM to allocate for scrollback
>  	  buffers of VGA consoles. Each 64KB will give you approximately
>  	  16 80x25 screenfuls of scrollback buffer.
> @@ -84,12 +84,12 @@ config MDA_CONSOLE
>  	  If unsure, say N.
>  
>  config SGI_NEWPORT_CONSOLE
> -        tristate "SGI Newport Console support"
> +	tristate "SGI Newport Console support"
>  	depends on SGI_IP22 && HAS_IOMEM
> -        select FONT_SUPPORT
> -        help
> -          Say Y here if you want the console on the Newport aka XL graphics
> -          card of your Indy.  Most people say Y here.
> +	select FONT_SUPPORT
> +	help
> +	  Say Y here if you want the console on the Newport aka XL graphics
> +	  card of your Indy.  Most people say Y here.
>  
>  config DUMMY_CONSOLE
>  	bool
> @@ -97,24 +97,24 @@ config DUMMY_CONSOLE
>  	default y
>  
>  config DUMMY_CONSOLE_COLUMNS
> -        int "Initial number of console screen columns"
> -        depends on DUMMY_CONSOLE && !ARM
> -        default 160 if PARISC
> -        default 80
> -        help
> -          On PA-RISC, the default value is 160, which should fit a 1280x1024
> -          monitor.
> -          Select 80 if you use a 640x480 resolution by default.
> +	int "Initial number of console screen columns"
> +	depends on DUMMY_CONSOLE && !ARM
> +	default 160 if PARISC
> +	default 80
> +	help
> +	  On PA-RISC, the default value is 160, which should fit a 1280x1024
> +	  monitor.
> +	  Select 80 if you use a 640x480 resolution by default.
>  
>  config DUMMY_CONSOLE_ROWS
> -        int "Initial number of console screen rows"
> -        depends on DUMMY_CONSOLE && !ARM
> -        default 64 if PARISC
> -        default 25
> -        help
> -          On PA-RISC, the default value is 64, which should fit a 1280x1024
> -          monitor.
> -          Select 25 if you use a 640x480 resolution by default.
> +	int "Initial number of console screen rows"
> +	depends on DUMMY_CONSOLE && !ARM
> +	default 64 if PARISC
> +	default 25
> +	help
> +	  On PA-RISC, the default value is 64, which should fit a 1280x1024
> +	  monitor.
> +	  Select 25 if you use a 640x480 resolution by default.
>  
>  config FRAMEBUFFER_CONSOLE
>  	bool "Framebuffer Console support"
> @@ -126,30 +126,30 @@ config FRAMEBUFFER_CONSOLE
>  	  Low-level framebuffer-based console driver.
>  
>  config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
> -       bool "Map the console to the primary display device"
> -       depends on FRAMEBUFFER_CONSOLE
> -       default n
> -       ---help---
> -         If this option is selected, the framebuffer console will
> -         automatically select the primary display device (if the architecture
> -	 supports this feature).  Otherwise, the framebuffer console will
> -         always select the first framebuffer driver that is loaded. The latter
> -         is the default behavior.
> +	bool "Map the console to the primary display device"
> +	depends on FRAMEBUFFER_CONSOLE
> +	default n
> +	---help---
> +	  If this option is selected, the framebuffer console will
> +	  automatically select the primary display device (if the architecture
> +	  supports this feature).  Otherwise, the framebuffer console will
> +	  always select the first framebuffer driver that is loaded. The latter
> +	  is the default behavior.
>  
> -	 You can always override the automatic selection of the primary device
> -	 by using the fbcon=map: boot option.
> +	  You can always override the automatic selection of the primary device
> +	  by using the fbcon=map: boot option.
>  
> -	 If unsure, select n.
> +	  If unsure, select n.
>  
>  config FRAMEBUFFER_CONSOLE_ROTATION
> -       bool "Framebuffer Console Rotation"
> -       depends on FRAMEBUFFER_CONSOLE
> -       help
> -         Enable display rotation for the framebuffer console.  This is done
> -         in software and may be significantly slower than a normally oriented
> -         display.  Note that the rotation is done at the console level only
> -         such that other users of the framebuffer will remain normally
> -         oriented.
> +	bool "Framebuffer Console Rotation"
> +	depends on FRAMEBUFFER_CONSOLE
> +	help
> +	  Enable display rotation for the framebuffer console.  This is done
> +	  in software and may be significantly slower than a normally oriented
> +	  display.  Note that the rotation is done at the console level only
> +	  such that other users of the framebuffer will remain normally
> +	  oriented.
>  
>  config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>  	bool "Framebuffer Console Deferred Takeover"
> @@ -163,14 +163,14 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>  	  black screen as soon as fbcon loads.
>  
>  config STI_CONSOLE
> -        bool "STI text console"
> +	bool "STI text console"
>  	depends on PARISC && HAS_IOMEM
> -        select FONT_SUPPORT
> -        default y
> -        help
> -          The STI console is the builtin display/keyboard on HP-PARISC
> -          machines.  Say Y here to build support for it into your kernel.
> -          The alternative is to use your primary serial port as a console.
> +	select FONT_SUPPORT
> +	default y
> +	help
> +	  The STI console is the builtin display/keyboard on HP-PARISC
> +	  machines.  Say Y here to build support for it into your kernel.
> +	  The alternative is to use your primary serial port as a console.
>  
>  endmenu
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
