Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78717512288
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 21:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3F610E0FB;
	Wed, 27 Apr 2022 19:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD09210E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651087450;
 bh=1WKkkz5boexGE66WyTcovc/q02JTNjhvC/STKssriU4=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=apKY7mes5fswU3jsc/S4frysod3jkRqFfa2ItTU/o9PvnYpvIxrTD3ziwrAFnrUe5
 eZdneCHeTeyw5ct/o3k6e0w5aVFmftdnAnGR38K60tVaqVarO/sexOtgp1JtT8Td55
 lh8CDgtor0VuWwn0lUSGhfbVYcnO4OFcGgkEXDHM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1oF1YZ0Dxq-00nBKD; Wed, 27
 Apr 2022 21:24:09 +0200
Message-ID: <91effdc2-c357-5bd9-a355-7f1ad0a848e4@gmx.de>
Date: Wed, 27 Apr 2022 21:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB for
 Gen1
Content-Language: en-US
To: Saurabh Sengar <ssengar@linux.microsoft.com>, ssengar@microsoft.com,
 kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NP4L8msLdx8U0e+e7GVTQMFgO+dSXP/dsRIEL8hi8jeBIkovLvr
 tcgSZoxdyj48iwVzSbK1NAkZ2oYl+JzJowLnh0Bi/JHYA5awF0KtkLszeUflH6L44P312bN
 Menb8S2Ftw17Nhx16qd6aZcJ/HHBs00l6P35mJuc3AqReQlz/8z9v+rP3GDnGpeBnqOZybd
 D0WAAvwuR96PXrWW5YRbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UYU+qHpzt3w=:1u10l18WQsM8REM+mJ+FwL
 4A8xAvNR15Un7kaO6S44gkkK6RUdZljuVqDMUNVjWWGU3n8lgnz6b3s+cUyZc5d0L1GdSCIFk
 y+J79Qgg/JNdbU319Y4kDtpusuTQGYo6b1ck8enShtLL1lXrWIaAsyaSIu6lfOWFvSaaUbTKg
 TLS63Wq6lBwWadQc7WTTR2zF5Uebk+gAiHZQWL/2NqfnCpHg59/1gnSxZjy75YuVgApUhJCHU
 0N0vIvMzUPDmuYs3ohcEZdLOIy/yBKz8pX56yRNSZpesxXPmOnBUiNNVgKHH3iNAmEMmY5fOe
 GItaXjqIrP9ybEaGPIO55pG5RGLhh/DiJMunc3EQ6+W4xXbJhDcoMQqOyxvoYN4Nz+D2bvP6g
 exeK1dWIlCcpI4OlMsjmHfRr+xsAReDIzNcII3MyAkEQ5R0TLc5VC+Lo6BnSl2spHng5Q3Q9O
 DoctzYcUac76uzRDEBJrw1GVmUNtG3ddB//gAWngsGIp0+SyxBuS5jUoiE5VgSMuAqKeggGWZ
 yDwYSjr46KtoBHSfJyWouo65J17YVG9ugni+vxvTyt0eYrVBLTPIQpxVSsu4xkN03o2M8rbVI
 M6Cs0VbOgcQimx06KSZQXDQGoB1XBpJbDVueZia20kXv1sh7IttnF+KL3MK3/Se11l6fppCYI
 iygaJJhekdLLF4ly/L4i0HUiFsKCz2J0e8Fv8Ozp8lXy8qVcYdx+OVhQO+DoNOVa66ahCLQId
 DOeIoXWt3dxbLaaXPSF9+u40NPQ3XNuvDu6HN+XwSwTavQ3jDLEiGB7i53UUohVL969Ro+n7O
 ZzXexFTYnOSdHtOWJscM/S/0a/gnSHMaQpLXX2FXGcXTdlrUsekSEY5O1vy/OSAhnuoIIOvZ5
 zX4v973fUoIbwyY1pnml86SUN+5P8CwmBjwtSS6ybgc/VJ1HufYgLNB2aaSi7/4NFH7nHMKlG
 j5T3WfibQ6VLvmxYxOYwD55tPSCWfrcAvy6NytG2Ra/Bd7FaZ96elnhwv+zH+6su5bn8o4HIB
 fTZp/wiG60/sI/dFwdl8FaHYVFxqmQfRQaJ+8JjwmNXdRGe27rByGvhI/A0xTRS1N6dfTAi3d
 tUzSP3ba6CCYNU=
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

On 4/27/22 15:47, Saurabh Sengar wrote:
> This patch fixes a bug where GEN1 VMs doesn't allow resolutions greater
> than 64 MB size (eg 7680x4320). Unnecessary PCI check limits Gen1 VRAM
> to legacy PCI BAR size only (ie 64MB). Thus any, resolution requesting
> greater then 64MB (eg 7680x4320) would fail. MMIO region assigning this
> memory shouldn't be limited by PCI bar size.

Is that right?
Allocating more memory than what the PCI bar states?
That sounds to me that theoretically the "now bigger" memory framebuffer c=
ould
overwrite other memory areas or mapped PCI bars.
I'd like to see some other person from Microsoft to please comment/ack/nac=
k.

Helge

> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyper=
v_fb.c
> index c8e0ea2..58c304a 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1009,7 +1009,6 @@ static int hvfb_getmem(struct hv_device *hdev, str=
uct fb_info *info)
>  	struct pci_dev *pdev  =3D NULL;
>  	void __iomem *fb_virt;
>  	int gen2vm =3D efi_enabled(EFI_BOOT);
> -	resource_size_t pot_start, pot_end;
>  	phys_addr_t paddr;
>  	int ret;
>
> @@ -1060,23 +1059,7 @@ static int hvfb_getmem(struct hv_device *hdev, st=
ruct fb_info *info)
>  	dio_fb_size =3D
>  		screen_width * screen_height * screen_depth / 8;
>
> -	if (gen2vm) {
> -		pot_start =3D 0;
> -		pot_end =3D -1;
> -	} else {
> -		if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM) ||
> -		    pci_resource_len(pdev, 0) < screen_fb_size) {
> -			pr_err("Resource not available or (0x%lx < 0x%lx)\n",
> -			       (unsigned long) pci_resource_len(pdev, 0),
> -			       (unsigned long) screen_fb_size);
> -			goto err1;
> -		}
> -
> -		pot_end =3D pci_resource_end(pdev, 0);
> -		pot_start =3D pot_end - screen_fb_size + 1;
> -	}
> -
> -	ret =3D vmbus_allocate_mmio(&par->mem, hdev, pot_start, pot_end,
> +	ret =3D vmbus_allocate_mmio(&par->mem, hdev, 0, -1,
>  				  screen_fb_size, 0x100000, true);
>  	if (ret !=3D 0) {
>  		pr_err("Unable to allocate framebuffer memory\n");

