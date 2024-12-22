Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA29FA455
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 07:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E92410E18F;
	Sun, 22 Dec 2024 06:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="dF+KTpgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986F010E18F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1734849070; x=1735453870; i=deller@gmx.de;
 bh=bQc7ufe2asdu6tITElRdznUrVyFMBvZ5I/wmp5S0EKM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dF+KTpgKHX9XizYHcqYui6ugagBQPJniktmdfoN564rrjRXygyYLw4H6eiv7PIQ0
 yU87fP7MnDWOUV86c38go2B/CFYuMGhL2v7SIiPGRxscMxixj55ZiJO/9rFpm88Z2
 NgayWvpXu56YvABk4dNFmCLgZweRbykEoBnmH3RamafUDhIbErW4sIM8tTVc7kIP5
 PlvwMa+sA5DfvE9yLUG5nm4VPLUU912IoCdITAYEWoixmPsOEHa4PlsxdOxVEzbk7
 oeCcOMb5DLZ4Y9Wf28LwujDxkouk2AoOsLWC92uEjS7rkH7/bZynTuzVxVdSsZCHn
 DlhrmQ3McrEUILoR9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1tplKs46iF-00hDVK; Sun, 22
 Dec 2024 07:31:10 +0100
Message-ID: <6ed9693e-e8f5-4786-b440-4e27c6d31da3@gmx.de>
Date: Sun, 22 Dec 2024 07:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, jani.nikula@linux.intel.com, christophe.leroy@csgroup.eu,
 simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241216074450.8590-1-tzimmermann@suse.de>
 <20241216074450.8590-2-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241216074450.8590-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gxbxn0N+y9m/f9DhaH+wIp20cnsWdQ+6EfdndwhFtwCWpAa396t
 5PYD/pCb/fnJcPvyiYN459rEsGotmvGrRjxaa0KfHK32N73R89hXDbaQOzQxxLgMDkxVNhL
 4eiBjn7t2DfQ66k4dI+nz+RH/UQeSeBWTPMbQG9a2HntEH6o6uLA2X+ZfoieLkQtoNSw0bf
 2sZVXg7D/yaVEdYrnT0uA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:po+TEuw0EAE=;Yo7MmV9DC1PX/mABjNt9B6WcM6l
 IEvSVXcC0gZbbUvyofbDIgqV3VjZTC3h3o+3EmwJyvElTW5HorpP0Q0ezZ8ZfXL36BdcY6NBB
 oS2hRVOiP8DiyWNLmlo/257sIwQ0nIkiJl6undBIBEg4S8s1Mbf4drRjQcJPkRWKwOrTLVUSP
 h/Zm7h+chB1rzSEl9eSiBFsJQMPAXka55yslF8nn6ZDxgtsaBIg2EjOu7LUYmnzBKgpLxjzt6
 J7y1ufgoYrEsboDUjiOWaLrV0R6HPHQee6feuEHmbHyk86rF/RHfZXeqgKaN0x2IoUVLJFjsH
 xr+MMJogwwU0gjRP3IJhLbgtM2g6rvGNbhhHrsqDiGnQc8i40PudeNAKmYCYeenZymz/SKnQL
 KABBX2e7oDGvtytCTrfL2wyq72DOmMCVmwy+qCK4vnDwcnvuJm5lwErnJfD+m2uUUiWHx7Q/J
 rhMbnGi864pBTBpMRW78embb+jjPJCP4sqmGfGm7SnyEWb7pHOz9qptqiAlMK3MeHzq14viy+
 fwO2g+f6tJL+LvcVhzOoRKQdXAzasUF7Kn0k6DjYaCuwy5jrUBavzz9ImZKrBRH0FUEKCEVWC
 RsW2ccljJegvPe+w5Y1iO/Ygl7KYJzgJwJ/FbZ4R/2N60X3VVPeCjnCaIAmpKvuFbyOcclTxP
 6U7AO0fW3eC4mhzh4WR9AQXiRVKipgDPoxVEoEmNhMZTG16VagTm3a9V8YhzfzQZQnqRgj9+T
 epYl/6LK7dPPQPwI/HZenhi6Ax++QwyvrHvjFy3IEcYDINkp8vrwdebPv2/gN+8irtsKQgBZn
 OmRZ3wqMgOfCznIMkBQjpTlgBvrO7AkT4ed4DyDtOce9S5YgR50HiwejkWAtVyiC3OLKFo0gU
 ym0LwCIdVkCCl6Pk3kQSd0Stb9bCDzVtoxoppYIpUiuonDzhTNwQ3qKVnmArhfEopqYxbE49l
 5DETwOIZPMP+g8mIlprlo2H6p+3F6GYEND3LYIgDjoyRghNY1738HeNxVYeyKLN9q9cIiMYtl
 4oTjcqT7nqTYXxfDHTg9SAZzbB9eJioG2OBO47vO2qsu2VhewHrmRFYv6LbzhcKG7Tw6DciBQ
 nBAFyx8FnmqgwS4Mz59GuIUjxdr5yR
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

On 12/16/24 08:42, Thomas Zimmermann wrote:
> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
> only controls backlight support within fbdev core code and data
> structures.
>
> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
> select it explicitly. Fixes warnings about recursive dependencies,
> such as
>
> error: recursive dependency detected!
> 	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
> 	symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
> 	symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
> 	symbol FB_DEVICE depends on FB_CORE
> 	symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
> 	symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
> 	symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>
> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
> it is the correct approach in any case. For most drivers, backlight
> support is also configurable separately.
>
> v3:
> - Select BACKLIGHT_CLASS_DEVICE in PowerMac defconfigs (Christophe)
> - Fix PMAC_BACKLIGHT module dependency corner cases (Christophe)
> v2:
> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
> - Fix fbdev driver-dependency corner case (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/powerpc/configs/pmac32_defconfig |  1 +
>   arch/powerpc/configs/ppc6xx_defconfig |  1 +
>   drivers/auxdisplay/Kconfig            |  2 +-
>   drivers/macintosh/Kconfig             |  1 +
>   drivers/staging/fbtft/Kconfig         |  1 +
>   drivers/video/fbdev/Kconfig           | 18 +++++++++++++-----
>   drivers/video/fbdev/core/Kconfig      |  3 +--
>   7 files changed, 19 insertions(+), 8 deletions(-)
>
> ...
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index de035071fedb..55c6686f091e 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -649,6 +649,7 @@ config FB_S1D13XXX
>   config FB_ATMEL
>   	tristate "AT91 LCD Controller support"
>   	depends on FB && OF && HAVE_CLK && HAS_IOMEM
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on HAVE_FB_ATMEL || COMPILE_TEST
>   	select FB_BACKLIGHT
>   	select FB_IOMEM_HELPERS
> @@ -660,7 +661,6 @@ config FB_ATMEL
>   config FB_NVIDIA
>   	tristate "nVidia Framebuffer Support"
>   	depends on FB && PCI
> -	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>   config FB_NVIDIA_BACKLIGHT
>   	bool "Support for backlight control"
>   	depends on FB_NVIDIA
> +	depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT_CLASS_DEVICE=3DFB_N=
VIDIA

Seems wrong. BACKLIGHT_CLASS_DEVICE is of type tristate.
There are more of those, please check.

Helge
