Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9EF627658
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 08:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37A10E047;
	Mon, 14 Nov 2022 07:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9944B10E047
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668410809; bh=03wLu49cZv64GpemsqyWTBRjGEW6O/JGrtvIRDD80Eo=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=CfZ0aajqcuOfOhbOmAFNTe1bJks+CDNzf/Wf/FVM/djktXA7XWQGiQlDGq4a8i834
 dLMVNDcGuhfVezfl4FcH0K5QrWYbOlHZx1FowLBRyyFG0Pvv05xDY9BFX5xGtWaehX
 m3LzrUVde5XRuPmGIpQZpiXM9oCmSoeugP8PTRrsOIx6qI9X15yiplZMfEH4Y9GVZ4
 CUEYcvl1TmMtkaz5YgGVbgG3IfX7gArV1C9+XI/8UeJRCkHBlIdts6aGxJczOLP7M7
 iDN2G9Yz2Kv1ThjlniFHJnCUytYoNOTDn7LdrXyiBxbVV9WIZX5pY8OCoOmpZwEjW4
 nDC9UBNODYBag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.133.36]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1oUFty3PTH-00REWD; Mon, 14
 Nov 2022 08:26:49 +0100
Message-ID: <b0ebfdc4-f4d5-183a-eebc-b38703e89362@gmx.de>
Date: Mon, 14 Nov 2022 08:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] video: fbdev: via: Fix error in via_core_init()
To: Shang XiaoJing <shangxiaojing@huawei.com>, FlorianSchandinat@gmx.de,
 corbet@lwn.net, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221114010852.24654-1-shangxiaojing@huawei.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221114010852.24654-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sinvKU42+4Q97BLFIhtATFJzrZSQwk71g9NpLVmFpItcLrbOkAK
 EOs3VJ6B7LBXDEjh3G1KpGpYr9ULAjqKep61ceTg8uhwEnXceikgZ27r6/nH4NzGtLPANR4
 PSiKNQK3SLcEpLJFGFya5Z4KgJLJjXAhhdlH/Lt+PX2Mm3oCnrgFpgbkvGhgTvxDlkOk1IQ
 sBwL3zemDLZo9xRmRP3nw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SJm7yKAmtxg=;gb/FquGyS/lpbi+idyOsHycdixW
 rHJGMuw9rze5UA4Iqu5iBVM4xGau16uHupW6CAhRT2+IBOStcMD58JYgNh/mh1fahMc5FL6G5
 eigQq4YCXWrdJN5H2W5YT9geesGyUBC7Kaoyayw4g51XNJzvc11xD9TxUY90alDnDUIYh+jrQ
 uG7BMgufXz82NK69VE5+pzQmVk4EmR/Gj8ZHdJIFjmO4VYHqVAjDbUrNxJ6Q9e55FCln3feqj
 TBgvBlxI6KGcktrVx985y4DIEJUrlfkKDSfaGo6A/zcV3aO3hRGsm1TL+UwVX/L0ylRWPIZ8a
 Zsib380BpsRhZe5w+17umKGWOb2HxEy0f5jaBl0QCOuLxjsakbIxhdjxtonGNtT7RuV5TCVud
 Mykk0ezjiVRi+pUjxNIlSccT0zLacacBll5dUVrVblvhv+SXfiCg6UDGPJwYARlf6lds1UDA8
 EAQpW/b6FUlodtej4CS8NQe+9buQ6jFRNN4BrZlIMd+WCsryZHDn1xKw32o28ZDSjGXUXpZ2X
 vBtobPoVc4miFHp7QNrvY6NUnxEXt9+W6c0/6zdRX5A7C9ZAL/cCNNn0Yp9j+2gHv1HFuLYJM
 loT88IB6cez3nFt1cwRDVRW4K7EU9KkoYwPpjk2NpfDEURvYcs8tjShI9pGZGLwcyGdfCIgsd
 AhAgoaU2HbHtTOAe8pRDuWPXKi+PFtmmHqRqIchB1do/u5lEfKTK1VAwR5lOrbIGWPlc+ru5V
 Fj1Elahfek0NtDIO7WiJMP+kuKQNhWUrx7D1u75cIs1C/gca642v4zP5PQBNrJejpjZLiPxKH
 qBfcgzMUUBEdKoPVA5rba7Tq7x1AQaJ61tL2MboWna042epewHSoiokQaoOQAhcr9w0tMTcMW
 9oBv+pvKTRb/m5M1HWL8JHmA/z2dO1ThjogxtQkfpvpo8NHcWet+ZvmB/xfRV/T7AGQ2uYJDE
 A57DwA==
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

On 11/14/22 02:08, Shang XiaoJing wrote:
> via_core_init() won't exit the driver when pci_register_driver() failed.
> Exit the viafb-i2c and the viafb-gpio in failed path to prevent error.
>
> VIA Graphics Integration Chipset framebuffer 2.4 initializing
> Error: Driver 'viafb-i2c' is already registered, aborting...
> Error: Driver 'viafb-gpio' is already registered, aborting...
>
> Fixes: 7582eb9be85f ("viafb: Turn GPIO and i2c into proper platform devi=
ces")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/via/via-core.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/vi=
a/via-core.c
> index 2ee8fcae08df..b2e3b5df38cd 100644
> --- a/drivers/video/fbdev/via/via-core.c
> +++ b/drivers/video/fbdev/via/via-core.c
> @@ -730,7 +730,15 @@ static int __init via_core_init(void)
>   		return ret;
>   	viafb_i2c_init();
>   	viafb_gpio_init();
> -	return pci_register_driver(&via_driver);
> +	ret =3D pci_register_driver(&via_driver);
> +	if (ret) {
> +		viafb_gpio_exit();
> +		viafb_i2c_exit();
> +		viafb_exit();
> +		return ret;
> +	}
> +
> +	return 0;
>   }
>
>   static void __exit via_core_exit(void)

