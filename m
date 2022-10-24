Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CD60B5B1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 20:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A6C10E09B;
	Mon, 24 Oct 2022 18:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 458 seconds by postgrey-1.36 at gabe;
 Mon, 24 Oct 2022 18:37:12 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9696310E09B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666636630;
 bh=icVbzJtZ9pqflJ14jNdNOlB/DYImZ+gyK6fC/SDHPeo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PrHiPhfAPKrLmyFhw1fuVlMIKLVIyMl6kOh1r2X/j76dnaxp5xuvxbXQ43DxdxFJx
 eJA9z/7/bwx+otUeFpRNOu3NuODfGe+NyKMwXG2lk0V9JqXgSHnRq8YKMoLJIsiz1n
 Ipj7CCM1Q0pevLdzVci00uUVPro1EGvmvmYQ7wsw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1oqd7434DN-00EaCt; Mon, 24
 Oct 2022 20:29:27 +0200
Message-ID: <ec8edb92-a21b-6291-4275-d7cba97d7ad7@gmx.de>
Date: Mon, 24 Oct 2022 20:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] video: fbdev: sis: use explicitly signed char
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
References: <20221024162901.535972-1-Jason@zx2c4.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221024162901.535972-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fgln+OSb5Fs7l921QypIIY6GvbB8Dpo8NbcH6CX//FlDdIZKoPn
 HTH8weoBRqVlYnQaJOUuVnLRopE3hTyC0rQ7NFop1qJoWADAuwh/gwd/DNyU80Z/nBkvvlj
 xLpYb1wKKdGZeA8sSZnuNeBXV4k3vo2v4nRR1R3a5fNPt5ryrwPOPk8q//T+CrXTBvb8tGY
 ylAA2rLff9VDqREvNVy4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BlVCzPTrI4s=:R08X7aCwdWQ65WvdZ07hqv
 ev095YtJMSk1W0IOSrWa+5fkybucrXmdCC6fyzIOrcwh5/YoeOTDl1y6mUH1lzL2G2Un4lUps
 KI5N2Xqzzd78cdgWYb68L3ukDOv8n4I0SS01Jqg8WXt9pGhvsL58yVVxAVZQ4915ztXlwMhtP
 ArO+wDxu4exNiM2IrMf1I9wHRS1+SiRE7mCqdNwQOMUHFFsHDsuBvMjfMWh1kmBPjBjTeHS9E
 AUiOaWGQYpJz7OV7UyWGmM7eu8bj9erLjn9bJjoiLhCIXb39bXE1MuI0szdaSe5zHd40bv1Oe
 pfY4nS2LBNToacF5SE9vCE7oxxKCD12nYTaR6Hjsix0rmwbUEFOTcGHmX/fA1Z10/Iqxu0E0V
 Vcq3ODhFPwGpNnlYTb2AbFVGqxqpcJDVaWib4LcOVYRceko8MNIA9Aii6LrYRWMyMmZPsDdtD
 MQArlytKOWrX1GgbOX6YZQv3dVL2uY8vteRph4PQcBjp+qonv6dutGjw41/Ln34B+p6LTqYWm
 b1XsxLE+wBcyGzC2RAWXRG0wDHBhtKeupp+5VBVGSKk3zv77UOJTqpCmtDk9a/QWk6LbpFoFy
 hhQ5GPcki9S8HDqctrFcDS/XIM2+FtAOF/Ktv2lNiQkEWFtjDjJjPXi0vkLcEYIMWh1OvPpF3
 vxTTsl+2+nn6ihJDCNn4Cyl88auZM1ucRrXhMQPlvQFhk8V3oREBYvaYwGTcChi5dKvW/Ish7
 gnhl5eTxnJcRIFgWOy69CIuAXz8P0UkmjQDFf0Jil0HIzly6i6qaVHouKfoVFbD6oaNu+D29Z
 QhfOiOB3OzlGb7SPsTlz/cXpMZ6Lb5sJK0dMFYX7jS5WGfazEZHbJVSANt9E7rk6aaduWVtg+
 fCewpnqorK9RWbSz7DALlwi13h4FVhXv2bT4axz7SV0D7Q93zh23H1fkMy/JRW4MrU1Jrr7vk
 RXcqrt+Ol1tBHxr+QgKcFUGe2v8TZsV0ZjvVOFdoLBg3mZWN/ITLYByAE1MpFDmL10wKnGYrz
 hzv8vgeUu2fpOrIYyI+ApTKTDL3di8hxGzqg/62nogvhRCCD0l3bFf27AgZZUOeN/N6rRPXHE
 NW3LQ5/Q3ptAe3FmXMmRTjZjFaWw9vmlHKr2rjgAvD0RdRWO4TLXoHzEfEWFzc67gwFwIfXMQ
 qLOOlX5B11iGT2euep7xpklf4FI+oeJaYL0EiAaj0oHQTPJJD73huUTu8egxqAl8R3N8g5pc/
 J1yz7Jbhe7eJLHpi31OMVVAbET7224OD+YiAGSsltiZgZjUA3RgFWVrBLGQsAcZq1GevzXyzc
 F7cpOz6N148SsqAV/NobMCK9atOZ0c0xvloUJ9lJDHngU9xvv98BOqkTyisyGB+1h+i1fLZ+E
 QcUKAn9rVMqpzwbvEeruwtMXUMXSSSpyFZly7Hv/NbcTgo/qta2rn/4bGnVfQGVYRpDZw8PxH
 L2PiM8XFAOzCz6ZypJXiRGNK+fPfDZDCbmoxWf15e0lJtpA9HamQEKA6SlropzZ7yFdZUtyfX
 OK1FCvZuZ7mzBjR+sUzpGCw8TaKwiJkVz6TtiW47/vYKP
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/22 18:29, Jason A. Donenfeld wrote:
> With char becoming unsigned by default, and with `char` alone being
> ambiguous and based on architecture, signed chars need to be marked
> explicitly as such. This fixes warnings like:
>
> drivers/video/fbdev/sis/init301.c:3549 SiS_GetCRT2Data301() warn: 'SiS_P=
r->SiS_EModeIDTable[ModeIdIndex]->ROMMODEIDX661' is unsigned
>
> Cc: Thomas Winischhofer <thomas@winischhofer.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Applied to linux-fbdev git tree.

Thanks,
Helge


> ---
>   drivers/usb/misc/sisusbvga/sisusb_struct.h | 2 +-
>   drivers/video/fbdev/sis/vstruct.h          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/misc/sisusbvga/sisusb_struct.h b/drivers/usb/mi=
sc/sisusbvga/sisusb_struct.h
> index 3df64d2a9d43..a86032a26d36 100644
> --- a/drivers/usb/misc/sisusbvga/sisusb_struct.h
> +++ b/drivers/usb/misc/sisusbvga/sisusb_struct.h
> @@ -91,7 +91,7 @@ struct SiS_Ext {
>   	unsigned char VB_ExtTVYFilterIndex;
>   	unsigned char VB_ExtTVYFilterIndexROM661;
>   	unsigned char REFindex;
> -	char ROMMODEIDX661;
> +	signed char ROMMODEIDX661;
>   };
>
>   struct SiS_Ext2 {
> diff --git a/drivers/video/fbdev/sis/vstruct.h b/drivers/video/fbdev/sis=
/vstruct.h
> index ea94d214dcff..d7a14e63ba5a 100644
> --- a/drivers/video/fbdev/sis/vstruct.h
> +++ b/drivers/video/fbdev/sis/vstruct.h
> @@ -148,7 +148,7 @@ struct SiS_Ext {
>   	unsigned char  VB_ExtTVYFilterIndex;
>   	unsigned char  VB_ExtTVYFilterIndexROM661;
>   	unsigned char  REFindex;
> -	char           ROMMODEIDX661;
> +	signed char    ROMMODEIDX661;
>   };
>
>   struct SiS_Ext2 {

