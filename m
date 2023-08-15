Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080E77D500
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 23:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9C010E296;
	Tue, 15 Aug 2023 21:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD3610E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692134232; x=1692739032; i=deller@gmx.de;
 bh=3ivwaXlTsJW7ULOyEawP6D/akptlsXKdCXNCq6ZAg3Q=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=A3k+hoKCyrqz8rxZuaZ+XxjLXxNTHRgn8bAYcbf13HTzD9fSR1q+0hy5DltSg5Mqi/rAZKF
 19GPwjMX69PdbMk6rJE3kVPUr0OnBkgCo2LTgSYqCahaw1mnlIhgoiCWgE8R6H2K7r11AkLVV
 Ja5xhrTae7UEU1z7+i/3ZFNTqntDQkg8o+QHhsu3332i4rGAv3gmQ+pALVeMQne7qRsxZV7Hr
 z4mlhZOhRKFy5Bl/K7QS8YISbirHRzwrLh7dgM2i9qM/7f6vS3Md+RDI7RVP+oxJN4vUEy25Y
 PEWfmcnURziT8xSShgLX06LSzjOq1LXk8/GAGMErJFl0C2O8KUAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.222]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1qUdpl0QyT-003dBJ; Tue, 15
 Aug 2023 23:17:12 +0200
Message-ID: <2655ffdd-e799-1bda-2ca5-311406f5312c@gmx.de>
Date: Tue, 15 Aug 2023 23:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] video: fbdev: goldfishfb: Do not check 0 for
 platform_get_irq()
Content-Language: en-US
To: Zhu Wang <wangzhu9@huawei.com>, u.kleine-koenig@pengutronix.de,
 tzimmermann@suse.de, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230803071006.87235-1-wangzhu9@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230803071006.87235-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cwQSGf082AszFwUBx5Xp45uzsFLZyppQ80Hyiu2HPQTMEYigdKi
 0UMnU1WnltfsjhXLaEksxXO1IDZ+ub2efD/JQV0HSw6e14IPd7cnrbrlOJSWYYUXr0el16c
 z5qm0cdwkeq4fNbBW1w3RzFk/2dMNt5wMLSlduQPFOeIRuwaCPyxbIidzchKsFC8DCVugxY
 aD8UBQouKk97QA4a4hoNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uGta/BvuBJk=;iDqYOoGBJ0XDqHRz+osL4+tcOfH
 KGvvD5XL5Wd+AYjp8yVJ4hj+jzOEWV9J+0r7jVh+0YYlpBH8aLSxaqzoeqzz0w/SNKvIF6wQA
 ltvXl8OWnzlnsLEjYtpRZhijc9tPrfrIktPj801f0XNS/fZvM3MYGw/euTUN/w0COxPckXrIM
 Mic5DqkXtQeC8HSYkDZp+5jyswx/fO3q1UzgzhSFx7b4cJTZ1iliE3vmlQo1eIwSrLEgQ+Nvf
 9pqyYy7jts1fNXGowGzqJWue68qyUEfrYIm32SdbLqQRCnmOdqgDMInfICc/PWU+oD/EU4gLc
 vPPcCj9OFDWDvbvvZoM6Rx7MHCHuPDzmcxAbiD3qUkrFhIhdcp8a1cXwP17bCtOxiTfqd6vus
 sBDxcTqdZCcOeqlzfBrcKL0n5schPvo0K4c5T7LUSuSowFbc8oO04GV3Y7DhtOtLuYEwC0eU4
 dedCZA5dN/IFlqz/aXf4h/7tcWfJ3fHNfb9UfFCIMZfgwDIgJbsF5por3pki9V0rCfRzYos6Q
 sADzORyonMT59q0R0z/8TBocsrHmbc4SsIodRn9Cxc7yhP5IWfvx3iO6akEVhwRs1ol0SV+U2
 HCQTuPrcvm9V825YczUjFDR9qCvATVwZYVLY8WM4Tga/HixHihsnxRj+yGVEzfsysI1Em8th5
 a5/xr6Y8qsF7sURFRaLD7a/xGmJTuiB3XI1F4W8B/NKDibjGvVChVPd7SV8g2fCOQkn44+Md0
 EWMMitsZ7mxuQv23obYVqUo9RteAdHcoR2eCfZQRWC0GMvpwPTqt8dO4tXov7bAfP914SVKno
 i2EXs6rZEkXH0sYowOgBe7vSbm/WipMFtK501X5+wh41mzg8fBNiTUABS0C6EBvcNMamuQf6P
 7TSPxtzN+dBinYeCdDcIls0dTSQQugxHRPtF2hDehx8l9jPOaWm5TVT2jhLFc7RlXnwr0WYwz
 3vNnYPXeUW5Of4k1N2aM957Wwe4=
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

On 8/3/23 09:10, Zhu Wang wrote:
> Since platform_get_irq() never returned zero, so it need not to check
> whether it returned zero, and we use the return error code of
> platform_get_irq() to replace the current return error code.
>
> Please refer to the commit a85a6c86c25b ("driver core: platform: Clarify
> that IRQ 0 is invalid") to get that platform_get_irq() never returned
> zero.
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/goldfishfb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/gold=
fishfb.c
> index ef2528c3faa9..c3091ce26e5c 100644
> --- a/drivers/video/fbdev/goldfishfb.c
> +++ b/drivers/video/fbdev/goldfishfb.c
> @@ -203,8 +203,8 @@ static int goldfish_fb_probe(struct platform_device =
*pdev)
>   	}
>
>   	fb->irq =3D platform_get_irq(pdev, 0);
> -	if (fb->irq <=3D 0) {
> -		ret =3D -ENODEV;
> +	if (fb->irq < 0) {
> +		ret =3D fb->irq;
>   		goto err_no_irq;
>   	}
>

