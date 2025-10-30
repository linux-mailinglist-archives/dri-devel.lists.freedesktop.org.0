Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C3C21B6C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A260710E32B;
	Thu, 30 Oct 2025 18:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="oVe0vObl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F57310E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761848028; x=1762452828; i=deller@gmx.de;
 bh=Bm8Zvv3W+EdVL6CpopIt62w5TWsOazDCaC9KpOQFQQQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oVe0vOblnbjno0N9MP7VOPtxNNCco4XvHrHKvdg4Ji+m5lj5YqzeQkIUbRyJpIEr
 pUS2CJ1sizk+1+FxEPMgDVk2uwQjsFr3Sn8jTZ2dFK1laAT/aRiC/Fslrr2A6dA5t
 TZUIgS8h/2Jk9UCfdUUPMAq2F4cse/j9BDvCsi9t7f//PogEoKIhvI9rDSl0Z97QX
 l5DvebwpOFfbRRjBNVeMeu5cqRe14dae19eZkCrVEzmmzja/S0zG3H+qo4kehJ5g1
 D7Hpatomw6ZJlpbtgT5gDnDD8d5qxKuuwsGt/VM0+tCf5t6Yq+dwgtP+DWQAWrjeY
 UXmiKZxECsG1V4HYpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.209]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhyS-1vRAD81JKM-0090FX; Thu, 30
 Oct 2025 19:13:48 +0100
Message-ID: <b33682e3-9869-4c35-82b8-9d80feabfad1@gmx.de>
Date: Thu, 30 Oct 2025 19:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] fdev: i810: use appropriate log interface pr_info
To: Shi Hao <i.shihao.999@gmail.com>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, adaplas@gmail.com
References: <20251015140845.31671-1-i.shihao.999@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251015140845.31671-1-i.shihao.999@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NwAs90T/HnTyp+Y6NwNTxpQc8fyRL7o5QRoy0nDElulWOXgZdaY
 f6DRTW8l6JtJ+56mytTCIH7No63Qav8Zw/BH8tZVs8GNrE3Vwn9Cbu4t3S2ynIpyPHFO/9l
 Yw4fd8+noILzYRDmhkRGoBoN5dfcAmFo2GhRj7EsXEV/I3OofDt/QBixyeGbK5mcYKRQSpb
 8bxKjALDeNpbJ3fY15YiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hW6dYSn6orc=;CXg3CZUoZ9sIuTQMlio57vA3p2A
 lqvW5T4eG7xfdSvdwIl6B7qsiIwIrZxD5shTiKaOKACMCMXTrr4eba6XYiMYdVF0j6bIfcY8f
 eUgqCXkbwotuLPOqwhxADcZ1RxYFtLpuf2nV8xWzPQRUejD5/4MCgWytpMepRcdKDWdzsJFIR
 WogKjqyp8rIxX2qisZFym1B1o632fZgStLdsYL4WhbL/pK77/qKAy9nF2sjsXBRdDA0zv12U0
 PCklvya8Jzagek2l43Kp1fHJb7HzGSg9ofWLeoFJMfESagpocihfVZq+rqtV3MIIx2oaILHyJ
 xVntS411catoIcH4E/wv3HW0fiaXSyuK7LDkmSgk6+2ONqZl7FVW23aJ4dFw7zURSwTyj8zmG
 HsUVpkpin+Xe2VEarf7otcWP/nYceEluppUtP6LvsZwkKaToG2HkLRHr09VYAsBh41QWiEakF
 NT7KakgSBJ4oWtOodH4cmGvrKdwAf+MIRt9qgdL5eKkn1H5BtQUyrvF7m3MZtyIfIyTM+Fzm5
 qJaVtaaB6ro/71hurMJrpZ5B7BsM5O/Wc26SHhKdJ7Z7uJj6VBA5foH+veZqzalBYOoeUw7an
 lh0fJu5IvbUUnRUtld2YbaHikZHceX58A9aZlVImJfnlpK6o8tKKuDx+Ti1dCJo8zfipJQH62
 TZlNyIgHV9VB3HfJHG73cB1F+lgUvvqL6/all8UdGwNFQGspi+VnJ1Yr+LJtGUKlZbYFCsfDK
 nhUL8GF35zViE+qsJcBOmrMPtiGInV1mhEx4Klqsbes4lNpQISgQw43SN3pbPxJge5SoRK6W5
 e77JWGxOcsnmCl2s2nqV654agdZJ78N4vHK0IdD/bGX/oXJEXHzmonBQ+q62/MddeFoaCDBil
 7HQdDXTa3qVPk3E1BDR77Br6i2HegbPmnnU4lY2cimFX4mqA1ss8ANr8+d/h7BF2aO1KH32R1
 9X0Yrn8fKBNv7GzaUZoNJoGNjgst1/p1Cc80mwOSwt+706dhyFjdoJyEsoaWGO23LBG8I4n7G
 Wlz9G448S9+Z8hYyQdhMI5YY0sMj/5Y8SiG6sliia6FfH3+N+B9azNs1CDqtJiGH/5ib3TVy8
 lcmTeNlu1PCSE/lBzeDRzcwXtSXzyedZ6h3+jlIXxE9lAef+KrtPetvWcjsriQBS5hQchEEMd
 fSINVX4ZqCMBh4V6prd6JArCtE//L08NEQSk45o+AixO45677fCzCL5c75AmQkgzLZwTzByV8
 oOEmM0MSZcCNaZimAPLT05QcIWKdFCeXfIsnphlDjLJWFE7sQShktO6FInBTCXU7aX4cbDqFp
 wZouhmjaj4BD31/YO+tKf49qgQ6ID6/BLxVKDvnqfhySGQq5FY/9VA1FP0NPk9Un9e2HOyxZw
 JCfbnxyi+SRq4K/plUKjp5zCjoZ4KGDONgu1cIp2w4TyAbxN22vPVp8Ut4/vcsDu+W2Vq6kk3
 Y7bt+GsHVGZBWsF/ICy1oS1mc2KH78Vr7PQQQGx2wij3v7trvtGfrU6irpvxYRrf7e5T5PLnp
 boxL0sNz0TohZTom3OiJrEmxhgo2nIGMFjeDqv4Ltp7zSpOtD3EdS3y4bttF3MWVeMPKlzMHb
 MTTV1lO3xVgaIPywte7CYgzavlsS7lrxj7U5SrxyIwI++ll3+UUsBvmLVEPecAYWxRMK76K1C
 /P+flO0R/n4SxoedmXwsshOkkWOLm5vtwkYyWjZqhv94kJhYUhYfAzO4HYwjLkL8BOOILTDId
 r4dzRn3+3Y5zCs8g1VfpKo+3Uzu8qF1P8VTsDRAn8frbja8NP0JEssRhPq8ivUt6K3WMeugom
 MOc/AKtQENwmu5ubyqNMa346hgKlf1sGGJpGxipT0YDAtye4IXoEaW+pdLj0ojrtR97q942FF
 69fCLpvGyLj6pEVEK5tGgWtataZrfqslUeqh4pRVVW4dhenA36ZTHm1ZH0mLVoHMvj/cjTSfS
 neYscbPo7q/QzogzJnUXaex4krxcBJ1B7TxmsVY/uny9mPeDCXt3rgIILIfhslc1+rgjhzki1
 CpgCrWXcmFYpDpZ4Oq6YgIqIEFN1P8ISdj6YtzCB6YDCcg1lLHm9fmdIu534YwmGhnm4OfiOf
 rmAcu+3kU8R7tLblr7CLPmdqWTyAIBxgqHP2JpxFEBF9SKkeiR/Ojg6z9c7tg41fMTMlWg6Bv
 uuyaIN3bu3IPt4mH40mEBhe/blcVyvSYZBoP5jqOyBdiaSlE/eA+EZKBgml4D5CNTceZs5WrR
 INtWDyBwJg4HVgr6TP6W13VuadHHl1RihMk/nu5YtrUEkpXSPySPFgChUOryoOTTWB/LGZNoN
 aPC34/JE6bhwoOx1jnV+i+/ggjn70vzBPrkndiEbCyEQUpF4F/m3zgIbO/LL0gc87MEbJSBXn
 i5qfeRoivtTbugLz2vU6jJ1JvRUcMbgFuh2oecqvoILYbUGmeX/quq2YEP0Xq3a9wS4ZvuINU
 P2zwVt4zF/rXEGq6uo7uK8tocxCydZ+lvse0Lw5chzNmJO+/Njvu3cqGw1nC607gUwwsQsUIg
 J/c2h7d7J1rf56iOTxec5nq/0bqBNeQLAKAyJGlWdniO0khbecX8KB5cWEp2g/chwcm3cANyB
 iANallMh2dqJBLNp6RMNmcUovnUmo4hcONho5XgNdHlhaMMv4y0mHN8obRHh7die6PLG5QJYg
 x2bh/Lu1jjIiSd6HVw+Ez+WHEGiUWjgwb0uU+u7Noc6blyL4gRWi+qktxNml0jdO8/uHN9oMC
 EyTHg5sw27CgF27M9OZr3EFYW006hnV0jjEBZCVX5U3cQELpJcC5dqeLu0fBAsOk4s0d2lH47
 QHlHxSiSvAt/gWkAY62D4z7x3x0f5kJ3J8phttEfMvtd0U4Axclu5Ai0Zo2QDNE1OgmmQheqf
 ieVFvnPb5d6tOqKYzg5qw+dkWbtRifs9Nk6aG8ZsTYUYftEu6XRNjFxKPpO1MbCKAGDafvf8K
 p80TdjSItSjwilVLlP1Mb0kPEWf1rSCO28e7wBaZJrZlA0OkGFO+pA8bPK0rY/wHjFT57UTAv
 kyvhHaMWseQoLDyQQCzWVS/3OnFJWN1TYCPkKqxVwvg8gEZcCPglF5QHkqG4xsvhdAbpaHSYl
 Xgoam8iMNWVOQjg60jrzPZdh2fSyQaCcX8XhDkRk8ToUVGAcZlguToqeFJIgwXa+gtFN2juFH
 eTQC1SATCmPU5JXalWM5YMkhboGQ5Ucb12a964byjm7ffT8TE0K+2kNksvrelnes2UmQiMdWo
 LerZCguC2CIdcGRk4quIE9tWragBip0EJmpB2X9dT9CKE3Wx+SK98U0NHJooFQBohSbesZLcY
 AVbaHqFB5NKRsBXN5KzbNL1A7I/o3ioGKyHkupUMZfuA3/6e7AjEkRUwPRtdomK0p65L7FLHM
 a59qvcab3+kFLFhL1D1juR8XzfwQEmGaIZdNbWXaddWxwTEJ+nd5zTEly4AjSm7lopQ43IFoi
 jSmstsEJwN8D5Yx66MaQL7JxkYBEx2EjiPyLAsHgqdr3U5gcZ5KTTA0XeOqs4OUUThsYHKzEz
 nvCJ9rX4kFSlTjlIHJGyVJb1fKgMfMO16goiw+tSJR77kLCxVsEPvbikXlehKcTFztDBBVIwW
 OOfeO7QvdocKCRJ5KH9EJf1kZli/jY7q49ofm3Pi4v8918gZYUZCfWxKGto2KaT2q/QipQ0kf
 w/6Pa5toimakqHxwxDC3DfPJRjIhCpc/+vJlkTjsQTOktaeBtP1eGvkV9g3V/nf1/OYm/TfuD
 NIsCrX8ACIrsAsSXRUmhN7aQbF08IFInCtMWycUIl6p7pT+m4CkkdCLDgGK2XVcC9wFzLTZbo
 Ujczvwqa5mAxfb/5dTbUrPnmizjZAUGMkRGDzH1gcRQZz+Wo4tTwGCDLrc1vVd0iicjf6iriz
 jiOUvg4TJ0SFQn1aiuBU+W8u7erXMR/l4aNudQmUi0nya/MF9Sn1diKF9IkYXbsE6kpxNODvG
 zLXzvDhdwQR5FjPGG0Cri7Eww1ZCRAMxyrc0FQo2z2yWJEzgtWcXSN8b36QbIxhjRb/4XCvdo
 9UVG5pN5k0fZbqfogDmCyJ5y5ss5/LHdzbLlFfTTOlS0Yvk+nJGuGrZYwLmVlAQ2I3hkIaQfz
 4F4Q/W6t6BMoeNYlS6EyY7otmdQ8VzPX4n2/y4I8lg4wHuAMvl8BmJmUg26IatcEURarxDZQO
 eHhwYZGL88YmIJxPih2+t2EMlcpwesrgNop2ul/ROP4c1B4+JAkO9NkFHEEojNdvu2VJRSFw7
 cR5Fh3dmFMmM6svwyXYVgN1GMM/IgUkC6zFZZevpLw2nQnnEh2A30mUl1gA1M5Q2qnBg+5+tA
 Q3i7qV+D6wqlGzczV9WW0H47KTFHi+u0u/Iu63YO0u0pHIP12lw39KkBr1Vb0N110b9Zvnwuu
 Pila9iM9NAFe5W+wTmzZTMsvVYQ0rLD/cXJBD8aZapMJMEUKbt+suLZ/ADqNbkuwMMyfQBeBA
 Ur4MCXA7DPyqb2hrAwloU0jMp1Bb7CrBh+zvsXaldTwlplnYr/5QVsv/XUnwIK7v0WyeMHVBf
 CFtsQQTeC6G+U0JxCbgwOI8UnZFXfThbTkmaIRvi1Q0mgB44HuA2J8sEcqCq+FD9Kc0noAXXv
 nB7XA/0Es1c7DcBXuTSdmqDz5xlirfZ5AV1+EVYpfAcklxVADqVgw+ebuWDoW93FV92enPVOx
 hQ7/1FFwrn3/yXogysiL3I42vfeuguWQEJCD+AF5tSMfUw2e+Hn5SsYGq2Y3MDK6mY3N+pHVq
 SxEuQE/6kvXZR8lobUPA8b9voc7/yIxrsyhT+4BsJc2uP2W75JUIG7Ilk2P2vtKHB4UaZgLpV
 W0NFmtzNidJpKyEBzjvutO+rQtwMeD9AIKz09XKMrkYKlwp1jw4AEjftpZZv9+we3WD+wD3tf
 +mplBezhPlRPvo7pFUpnwYicvcWoVctXF1+zL7/xr5iGwcwcj9ygVlEL2xIwFw3Am38/tqV9c
 dz21pQ86JzzxkEL43E2lTqEBLoMQ8RwbWU8tHuO2P5QsjyvzxQr0EeAdnbrhTWbLsj6wxad/g
 PAtOzKc4QK5Z6TmRB9Ti64bKR8=
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

On 10/15/25 16:08, Shi Hao wrote:
> use appropriate logging interface pr_info instead of printk
> without KERN_INFO with it. It could be updated with proper
> logging interfaces.
>=20
> Legacy printk() calls in the i810 fbdev driver can be replaced
> with the standard kernel logging interface pr_info() which will
> help to allow proper log level handling, making messages easier
> to filter and manage.
>=20
> No functional changes to the driver behavior are introduced.
> Only the logging method has been updated to follow modern
> kernel coding guidelines.
>=20
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---
>   drivers/video/fbdev/i810/i810_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/=
i810/i810_main.c
> index d73a795fe1be..8c4b9eae151d 100644
> --- a/drivers/video/fbdev/i810/i810_main.c
> +++ b/drivers/video/fbdev/i810/i810_main.c
> @@ -2137,7 +2137,7 @@ static void i810fb_remove_pci(struct pci_dev *dev)
>=20
>   	unregister_framebuffer(info);
>   	i810fb_release_resource(info, par);
> -	printk("cleanup_module:  unloaded i810 framebuffer device\n");
> +	pr_info("cleanup_module: unloaded i810 framebuffer device\n");

Thanks for your patch!
It's possible to change it like this, but I wonder:
Why did you choose to change that specific line?
What about the other printk() in this file ?
Ideally we then should use dev_info() or dev_warn() [...] instead.
and most important:
There is no actual reason to change it. Usually we touch such lines
and clean then up when we anyway change code in this area.

So, your patch is appreciated, but I'm a little hesitant to take it
(although it's basically correct!).

Helge
