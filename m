Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADD5A0CBF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAE610F0A2;
	Thu, 25 Aug 2022 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D306D10F0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661420142;
 bh=g0hUjN3cAbARSzcql+JH8MKMfgvdS0bGxKwU4LFSaFY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FOqOE1ZNm6LVHdHa4dmoAtZ9KSTbyO2a/sAyTQIWvKQzfx8MBUObax/Q5Chn7lxES
 XCOP9TBABVNDCQfklrbL8AsfISLo5Gs/itW3zt3th2NtkkGZmj+6p4iR4FNxAT6Wzy
 e5/1O2JIbmL8n4toDYyOiXibDcKIhIdQFAi2MbkU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.19]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQe5u-1olNYU1UWc-00NfEJ; Wed, 24
 Aug 2022 21:56:24 +0200
Message-ID: <b696b6cc-7cd4-4f62-6289-6f29c1e40214@gmx.de>
Date: Wed, 24 Aug 2022 21:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] video: fbdev: omap: Remove unnecessary print function
 dev_err()
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20220824114455.5167-1-jiapeng.chong@linux.alibaba.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220824114455.5167-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QE/g5FKVqH/BMcj4p2uGLEVLJe07d8CPvlc2J2oLPTXty9ncQ5H
 /ZPNU7F171RI5/CWxYTZX3phnBs7+zNnMbiiAxYBPbcyIa2iwOo+at/4Io1xPsnxSp+aYEN
 pIN3NHdVCS5xwnFu8pSYwpyoUqp7qSPzdcBVl/cMq5y7S7awpt1abiQLwhdmD8/RDB/b307
 /QOvs9ZKgKOiSfCRwU0rQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZiBFfcNfKBY=:12SOjqhzNn1t/PZtGXW6jd
 90GgOPHyx3wrGIltTPAqywroyRIOEgbED1xVct7eXyGFIFexL5C4ODE/Alij+h2urL0I0xjGQ
 IMj+VQdcoSv8aaQtoMmBuK4XfLWNmn4DpRDbct+dT47yGkWe0dxkd65ImfNCA0fO91wL6pRmL
 64D4XypnBa912AU8drlQ0tdvlh2+tgPy7tBTlv8SVJlubT/+u1YuzVn9IveZIWU79aUAxkd+0
 X80txCr9Q613GE3Kjl74PU9Eu+qlAzV5t7GVyG5vOkDlP/1o2easeWdwQ0DxWzz0c7pUCje+A
 zYkWn50OdJj0K3oZUsKUXw+BOf9rJItXxvJpGlcJ6RU+sABXWsu333CnCyc3Bjk1RM3HifCIW
 b1mD+iV3hplmiTltkrG/cJMdPu5WpvOJtwbHphPGK/va7T6RIfeSIgLW/xhp4XRV37SccXxhC
 BqAFYpcbOZ0tsRc2ovII6ZQlPXfaEnY7YbUZCBUgjyDOx0RRQ/jb+RsQ7jaIKs/diaTS7zXtP
 QCe2M9SHcZgHVpzzRMTPO7Z2xoCEWCGlKZt5jXg6xAhPgekNqfDrF8iGqLuf8C+yfUxFvDWXN
 FEaiy/YVcGKtfyX1VA+Bly5BOzKRWM5gdF7FaVNn7lHqe7uNB1S6g2A5n374+p3qIVqFtWuM6
 5LxklpfI25tLLGud7Etp6SZr6d+KJKoYwl8IN/OZvtUWQZByY0g1RBSyPb18RaWkMWrSD8D3e
 3j67cTUSfuAsRexMp2INzYIuPte+JfCTzaLKcXVbRTRDPZ8kCo+7hlf4V8er2kUtv1OycNDaw
 4drZOgHRXSVLgtIkH6xhI0r+FHzjExUucbjH/ONRo7vTWrCRXIEzcHb52Ta5sVcVcf9AFLDsi
 BHmEND6HKbn4WK/dt1b5Jrg4OKr80Id5YJtbRvjNHxz7/9BSzcY45v6vV0Te3a20Vj59kPGUq
 7M9paS/YjogM9TIkF7woEdtQ0NkRROQU8MpxqswDE/l0C1ICyQeVR2Y39T2CAiJJhcw0nRX3J
 g79dshHRQ06sijuJmJXrdsWiJVPOxbYsRyy+zyU+GCZ3dTblnRkgHou88y+EjIyyoU30m5GA6
 1sF4TMcTQAJY6fedfkD7mhGidTkfRDW5tvmTj/iR+FCAnxEDz8vvON3mg==
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/22 13:44, Jiapeng Chong wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
>
> ./drivers/video/fbdev/omap/omapfb_main.c:1653:2-9: line 1653 is redundan=
t because platform_get_irq() already prints an error.
> ./drivers/video/fbdev/omap/omapfb_main.c:1646:2-9: line 1646 is redundan=
t because platform_get_irq() already prints an error.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D1957
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

applied.

Thanks!
Helge

> ---
>  drivers/video/fbdev/omap/omapfb_main.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbde=
v/omap/omapfb_main.c
> index fbb3af883d4d..17cda5765683 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1643,14 +1643,12 @@ static int omapfb_do_probe(struct platform_devic=
e *pdev,
>  	}
>  	fbdev->int_irq =3D platform_get_irq(pdev, 0);
>  	if (fbdev->int_irq < 0) {
> -		dev_err(&pdev->dev, "unable to get irq\n");
>  		r =3D ENXIO;
>  		goto cleanup;
>  	}
>
>  	fbdev->ext_irq =3D platform_get_irq(pdev, 1);
>  	if (fbdev->ext_irq < 0) {
> -		dev_err(&pdev->dev, "unable to get irq\n");
>  		r =3D ENXIO;
>  		goto cleanup;
>  	}

