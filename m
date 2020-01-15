Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B905F13C692
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 15:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6AF8932A;
	Wed, 15 Jan 2020 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097D78932A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:50:20 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115145018euoutp02822f68740365e2c61d9fe25acdb55714~qFuseYa961796617966euoutp02f
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:50:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115145018euoutp02822f68740365e2c61d9fe25acdb55714~qFuseYa961796617966euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579099818;
 bh=NXPvp1zYgb9gUmV9qAl2ZhCLamS6Ygtjex83I12F2Xk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=cRTE0535aT5viddPt8EH6g7TTxAc7M9OM6bH+ROgfHtUtEQWFVJuKJdUOa/hbB7V6
 m1Rp/v0uyvoUih/9wM1lYEpTUoXTkcUmaR8PGa4bxyB5fiutZ9V25H5e2A1ivhSku2
 KI9hb54+lIU0piv5tdSUNdMPdDNMeW6oOZM+C+fU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115145018eucas1p19c95153872d7a1895718036fa17c8918~qFusYbRyR2783327833eucas1p1R;
 Wed, 15 Jan 2020 14:50:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7E.7E.61286.AA62F1E5; Wed, 15
 Jan 2020 14:50:18 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115145018eucas1p260f7cb61e0dc9738cc5fd3bff9dd3b27~qFusJbuO81408814088eucas1p28;
 Wed, 15 Jan 2020 14:50:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115145018eusmtrp21b96c9875b5a8e01641a8242416f3216~qFusI7DwW0683306833eusmtrp2M;
 Wed, 15 Jan 2020 14:50:18 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-2d-5e1f26aa99c5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FF.4A.07950.AA62F1E5; Wed, 15
 Jan 2020 14:50:18 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200115145016eusmtip271834eddaaa45ebe9074e4e891b665e8~qFuquTwu52322023220eusmtip2g;
 Wed, 15 Jan 2020 14:50:16 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: vesafb: add missed release_region
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <69c018bc-b51b-0eab-39bc-6cd14a0245e5@samsung.com>
Date: Wed, 15 Jan 2020 15:50:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191205160712.32245-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87qr1OTjDNrnC1hc+fqezWL2oZfM
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcxWWTkpqTWZZapG+XwJXxoPkFW8FH7oqt
 v6obGM9xdjFycEgImEg83FTWxcjFISSwglFiyZlGZgjnC6PEihv/2boYOYGcz4wSz96lgdgg
 DY+ub2WBKFrOKNH19SOU85ZR4sWSHawgVcIC7hLPl81jAbFFBNQlPu/ayQ5iMwskSJxedA8s
 ziZgJTGxfRUjiM0rYCdx5Pg8ZhCbRUBVYsnjzUwgtqhAhMSnB4dZIWoEJU7OfALWywnUO+XK
 AzaImeISt57MZ4Kw5SW2v50D9oKEQD+7xM41XawQZ7tINB3dwwhhC0u8Or6FHcKWkfi/E6QZ
 pGEdo8TfjhdQ3dsZJZZP/scGUWUtcefcLzZQiDELaEqs36UPEXaUWHHiFCskIPkkbrwVhDiC
 T2LStunMEGFeiY42IYhqNYkNyzawwazt2rmSeQKj0iwkr81C8s4sJO/MQti7gJFlFaN4amlx
 bnpqsWFearlecWJucWleul5yfu4mRmA6Of3v+KcdjF8vJR1iFOBgVOLhzfgjFyfEmlhWXJl7
 iFGCg1lJhPfkDNk4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZ
 ODilGhg7YnbP8k2fpnw3eNLzJcUXM97uizputXjxdJv2S+ubOTKyXoTJrXoy4eXMw8u7VsTW
 xfC+r7aROde3zezEm6cFzHv7LWeql2s902F99db20/5D1+4VH7cuu+EZU1jqbN6yg8fAT8Ty
 16d+lw38laJm76PLtauMGyNsZBPm8TxYkO2tsfPvogtKLMUZiYZazEXFiQA0v5uIIwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7qr1OTjDM40MFtc+fqezWL2oZfM
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxoPkFW8FH7oqtv6obGM9xdjFyckgImEg8ur6V
 pYuRi0NIYCmjxMsve5i7GDmAEjISx9eXQdQIS/y51sUGUfOaUeJ832F2kISwgLvE82XzWEBs
 EQF1ic+7drKD9DILJEg8m5cCUd/LKPFhxSlWkBo2ASuJie2rGEFsXgE7iSPH5zGD2CwCqhJL
 Hm9mArFFBSIkDu+YBVUjKHFy5hOw+ZxAvVOuPGADsZmBdv2Zd4kZwhaXuPVkPhOELS+x/e0c
 5gmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBMbPtmM/t+xg
 7HoXfIhRgINRiYf3wD+5OCHWxLLiytxDjBIczEoivCdnyMYJ8aYkVlalFuXHF5XmpBYfYjQF
 em4is5Rocj4wtvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTCy
 bzl0+/ABvxXRkw70i8zzvx8WzjnX98ae4JZiof98mRfFpCQFWaq3vj/lL3qaT+Dh/OOGPR4O
 S5fMn7j7D8d0viCvKfwS894+UPryb0Yf4781lpLFz5e25ZzIW/tOoVuhcPm74usO4n/ncwgH
 //OxYypsVXwZf1R3lq7Goa1s1aE5h76IGF1TYinOSDTUYi4qTgQA/uL3LLUCAAA=
X-CMS-MailID: 20200115145018eucas1p260f7cb61e0dc9738cc5fd3bff9dd3b27
X-Msg-Generator: CA
X-RootMTR: 20191205160725eucas1p226595a8d3043f48183a0a646bda61b4c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191205160725eucas1p226595a8d3043f48183a0a646bda61b4c
References: <CGME20191205160725eucas1p226595a8d3043f48183a0a646bda61b4c@eucas1p2.samsung.com>
 <20191205160712.32245-1-hslester96@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/5/19 5:07 PM, Chuhong Yuan wrote:
> The driver forgets to free the requested irq in remove and probe
> failure.

This is I/O region not IRQ.

> Add the missed calls to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>   - Modify commit message.
> 
>  drivers/video/fbdev/vesafb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index d9c08f6c2155..fbb196a8bbf6 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -468,6 +468,7 @@ static int vesafb_probe(struct platform_device *dev)
>  	fb_info(info, "%s frame buffer device\n", info->fix.id);
>  	return 0;
>  err:
> +	release_region(0x3c0, 32);

There is one 'goto err;' instance before request_region() which
needs to be taken care of first.

>  	arch_phys_wc_del(par->wc_cookie);
>  	if (info->screen_base)
>  		iounmap(info->screen_base);
> @@ -480,6 +481,7 @@ static int vesafb_remove(struct platform_device *pdev)
>  {
>  	struct fb_info *info = platform_get_drvdata(pdev);
>  
> +	release_region(0x3c0, 32);
>  	unregister_framebuffer(info);

The order of operations on remove should be the reverse of
order of operations on probe.

[ We cannot release I/O region while framebuffer is active. ]

>  	framebuffer_release(info);

Please fix the patch and re-submit.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
