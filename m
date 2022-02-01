Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D24A6529
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 20:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB30A10E188;
	Tue,  1 Feb 2022 19:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50C510E188
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643744868;
 bh=6dETGNc8tOx9qyOBIiW32FnU/euninP5MXdRcl9TR3k=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Tf6tuYmMDdGmNXQS+QUp3oh/2jHb9mbycZ5gKz3zvhkhL+z2v0fL2gQ8uGmKXOsTM
 FOCGtiA1RITXgMddu8zqQjxjozh/LndLHh7GHJe+qsaVpzajDegmwCoCXpu2+Dd4+e
 S8ZMCarmt7TGDIC920bMhn3tAEpZHd3dcZzkFvi0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1mMjW50K69-00ubTt; Tue, 01
 Feb 2022 20:47:48 +0100
Message-ID: <f19c3e3d-f26e-3e89-7539-5c50fa2a1bf6@gmx.de>
Date: Tue, 1 Feb 2022 20:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH -next 1/2 v2] video: fbdev: pxa168fb: Remove unnecessary
 print function dev_err()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
References: <20220201123202.95055-1-yang.lee@linux.alibaba.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220201123202.95055-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P0O8w4mueeB2YQ2V6D1Q5t5hIBTe2tcDQlCSuH/dkYTXWINI0bm
 372+pusaAjBH22M5izyEvjE73Pgbj+Jvhg4BNbBgiGOansG79ouhKLYb5TEphaiX88Nhvlh
 RknvaW6xUoLdCz6V9YJBNKqw5MDE3YjQD/Rc7FO1DZO8wvsrdiOTFlQKrNaHU1m/pOY334Q
 5PDTPNyGkv9NXyHFQzaow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eN6+SjDvE+Y=:RX/19qHPU7/f8s0hrRFvZU
 9yct+1Hdk8A8yxRtk/aopG7aFPKgajm/ELRu+MjQo7K5b58b14mwrN3BMJuHdvM5hqq6yNpwp
 wIL6IdbyJHhMmzCoPXvtkBVJS/eQjBvRLO7TsZOJbw60wHVDCsUHqeii3dmyiaxEP3qWdyo9D
 k6K1zIqmA3IA6nCe7QyNisTbWnjUeb7JKFTZQQqN6PtIN7nfVCTGtrlKr3jD/LhcMJZj8/toS
 kr03U+pQhLykIpNcGKWFcXJ7r7hc9IQ8smQsOYbzLpPLPKZv3/eb9HC7T1GjcVByf54SuUdho
 P9KgbxCNRZp2WiGQaVOJWQmTz3H7bVkvjVx4VJQ5FJf3ySzVC+HVd26iunmjfIE7NpEAGdOBw
 yM8tISv5Ms7D6HXQC8qm2vccV5uJ+nSADABqa48feHBGVurSsZkQutUqMB9fHgayQAVT2mSGJ
 d9FJeF6X/IWIQLzzTSCdD43DT0BLIYQSJr3NdFiWRJrMVAHrp4A+zXkhpJh2cZNhko16MtiTU
 d4DkwxQkuufFto9+1IL9XiP6H9hVB/pFQilJy2TkBPq/wkzCt+rhQF4rszkFC/E0eelIQlDQw
 L3CoWDUXaK5ltKxRB++iYUBp5d+0IG6fyostbsqLhonlLNwCy5Kqhecu95gopGzfEOT0pO+jA
 WOO4QuL9ljKmRj3xZpj76QEnENWMhdbecTLylPS3VrlA4jIYHdi8qygX165WXdEe/J9cZk7M1
 jyk0oquAD3M3iSAjNfW2Lz2LhkLfZSJXXBJhMgovb5HGlVltn/J4yW2N1e8S5AvxdqZtUz3JF
 A1YgSdEuD6r9T5jLU8GG3jZrmtZ7Jl16eNTWoAy7zjqy0UzqEVcvBOCfE8Kicy36lZas4w3Rb
 NwJ67kRC3HR9ZW67Bks8Vf0qjs0kVJt3e7ERcxrsy+I+RbTgUkoVNY4Vs102S0UHXSAHvU+la
 ItTTgbJhQ+sp9sFS0S5rByLwhpocEP7RXC0iZamnZPr6JXd5Jd1vVgalEpCub5bRz8Bg61n+0
 tH/L3gt4hJ7EDC1J+XtBosjdh+A5tnbG2bzS06jkAf4wQeES8dmqTAAHPBXBkX9Hwis8MGhwY
 IiM/6HC05agMBM=
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
Cc: linux-fbdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 13:32, Yang Li wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
>
> Eliminate the follow coccicheck warning:
> ./drivers/video/fbdev/pxa168fb.c:621:2-9: line 621 is redundant because
> platform_get_irq() already prints an error
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>
> -Change in v2:
> drop the surrounding braces

Both applied to fbdev-next tree.

Thanks,
Helge


>
>  drivers/video/fbdev/pxa168fb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168=
fb.c
> index c25739f6934d..e943300d23e8 100644
> --- a/drivers/video/fbdev/pxa168fb.c
> +++ b/drivers/video/fbdev/pxa168fb.c
> @@ -617,10 +617,8 @@ static int pxa168fb_probe(struct platform_device *p=
dev)
>  	}
>
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "no IRQ defined\n");
> +	if (irq < 0)
>  		return -ENOENT;
> -	}
>
>  	info =3D framebuffer_alloc(sizeof(struct pxa168fb_info), &pdev->dev);
>  	if (info =3D=3D NULL) {
>

