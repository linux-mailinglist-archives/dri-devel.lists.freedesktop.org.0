Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE753605771
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 08:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D3C10E124;
	Thu, 20 Oct 2022 06:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D213810E124
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 06:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666247881;
 bh=OqMwdufPGwQs3SZ5XSKCshZXXODiY918dQWd4ylZDZs=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JVa3ieWZEE9OvpyGRnNVyoorBN1pTJHqgOQCY4rvjrgbPYsCqrrcH4jIQ8sirLNBP
 JbkoK+QkrdJOntQQV2KyUNJrA5OM4xLvNtKqyqhJEzDm8LeSDwoiyhO67E0mqOBtDi
 Qk1rYF4lvMxRjNaeBxWloHMEfE/2MS2Mm8FTVU9c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XU1-1p7SKO2YhF-014VLA; Thu, 20
 Oct 2022 08:38:01 +0200
Message-ID: <7230fc3f-c064-7831-bd81-103f2b7406d6@gmx.de>
Date: Thu, 20 Oct 2022 08:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] Make xilinxfb_release() return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Michal Simek <michal.simek@xilinx.com>
References: <20221019132422.78505-1-u.kleine-koenig@pengutronix.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221019132422.78505-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SWi1cNiPaxDa8E3qOfO0lJaqHKKIzh5483DfDc4fGdBBS8D5C9O
 NG3sXlkA4W4VlvUnY4Pb5A8Ou+jOxnlEyVmBFw3clQmmKAq8VKUuL+jZ941wNCBiT+vo3ak
 DJ/04CAy2ExMJgBDMzfeClAluoo8vIDxDNPDS385Ucp4lQXXXFFYulhixv86TlpN6jMqTQ+
 NmePuUPYAwNitW6XZ695Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cLbAhjOQIFA=:0KtpMBxnsTWFo9WqnMRj23
 w15k2iepEznuy5qk4hIYr1GkYK7eSRVrkaJlVdj+qAzXiYbbp23+gsBC8EjhzwmoH8s/Q/8jg
 MVe/3XutRPRowFh8db4Rj3nrEe4w8XcdxpTHmzWRupiUPMTBQdyqd7GNtNsCoZ+ngzMOQz5T4
 MmlN9qtseQa7pn7+cq//98WA7KBJcF7JxARDs7H1CIG1CiN9N39fWbFwBp5nrxL8i+A2e/vN4
 /2uJu3tKsbVKlggWze5sRaS7tKFM3eqL7Cj5lGO1ie0xfIzKoNdtik0wdMVNj3RCNyohhvNGb
 j9ZZESPfO28V4A/acuW5NMgsJRWe8dV+A4xwX66fRdaTh/YCBXg5r4QC1Oz1vL5lC6/isK5py
 BQlaowWIH+SsAOXQ1utUTOBF3LlaPM+676xBGYXCvHKqM6Y2PFiYLrDEAw23c1SlDL9eQyMFJ
 myxR7SbRAhrTaEBShSorHxigVXnwU/FqPdu+iigkHGtL4y6hk9KBBMD6zrAE/yR7Iu8Q735b6
 Wc/8K6UMY3K43JjaD+WDymOlhvtjuUYzdfcaEZ1VMN+I5GDE86rJszIEc1DnFk26JH4uv6PRe
 mwSs6fvAveehAfc9eVH/SllAuHNvSkrz2EH2cb1vAjGh9QgBYdgvv7XQlcUsMfYLNyAtT0pJE
 XY0esVSIw6sOaafdq5M0kYgz2zNL9pIk00cxN4o7ydBl564WrE5oiecK32ylcinViXH+8i/dV
 AflR+NEk3q0d/T/4oCJtXzW68nvqdH9PcGUyLHLF1rWD9iDReIPt+0wdqcvdsapkNC9Silhfd
 zN13+atYwwPdBhDqKB7XS0RuUk+DcU88jfeHHMfIPxv1NFf1si0g6fokKQ0UkWyxXVSePbW7c
 RoabvurlO3v9+3nFh3QGz9E77L+LLtsL0vPkcZJsEu22qyhLQWJhpq7cwp6jMcPXJLHQTRXg5
 Q6HBmVNugyFlawPnNsUZKMP8Jgex74TJs81iKrJ1UMvn/PrdqH96ZanD6wX3zIho5id3FA3ao
 AvCGHk1mkXjyMNLo0sc1Yo36qmZdRMKogKta2X8aKlXhE3YZIBZKNXyvejj8+RgZtroNISXos
 EFfWoH8MSOgkN4MjDARNapj2pPGqlicQQptw9zfcDav5c4y0XBa0naZHpn3x6uczuTquDawCl
 q8c8XnhSIVT3wA+2xKAwpH59+AC0ygRkTolKiZGyqRY29nwQxKzsn74OLjhIPQzgAQhdvaaq6
 oqnUX1P1F3pMaXrErhMkh8Zc+wPNnHPB9TvklaJVm+cRDBajTOX38bWiGW6Qk+nq3n/vO//g2
 FL+p7rSbG0ZrL9pVzmHByb4HyMzSozUjwejX9Ko/BmS9rQpQvESZ3Z03stUi1a+TRRNtMSkRx
 F15PyNOCVemCsSErG9vLaq/LCAgr7mRlHTkYwAxtoq/EBToVnhmDkugB/KnNHQYjOatq/Gc75
 jhwhAjp87Vc/SEnIeo++RbVn72/z/fGuOAMnS9bohPoPSs+CmOgS4+nz3ow+4Tj0f1YXJUnsJ
 EV+PxKdBTa3wDHm/2bZLz99VoEd1rLoG3uQmTb7UABMlr
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/22 15:24, Uwe Kleine-K=C3=B6nig wrote:
> The function xilinxfb_release() returns zero unconditionally. Make it
> return void. There is no semantic change, the only effect is that it
> becomes obvious that the driver's .remove() callback always returns zero=
.
>
> This is a preparation for making platform remove callbacks return void.
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied, with the subject adjusted.

Thanks,
Helge


> ---
>   drivers/video/fbdev/xilinxfb.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinx=
fb.c
> index 438e2c78142f..1ac83900a21c 100644
> --- a/drivers/video/fbdev/xilinxfb.c
> +++ b/drivers/video/fbdev/xilinxfb.c
> @@ -376,7 +376,7 @@ static int xilinxfb_assign(struct platform_device *p=
dev,
>   	return rc;
>   }
>
> -static int xilinxfb_release(struct device *dev)
> +static void xilinxfb_release(struct device *dev)
>   {
>   	struct xilinxfb_drvdata *drvdata =3D dev_get_drvdata(dev);
>
> @@ -402,8 +402,6 @@ static int xilinxfb_release(struct device *dev)
>   	if (!(drvdata->flags & BUS_ACCESS_FLAG))
>   		dcr_unmap(drvdata->dcr_host, drvdata->dcr_len);
>   #endif
> -
> -	return 0;
>   }
>
>   /* -------------------------------------------------------------------=
--
> @@ -480,7 +478,9 @@ static int xilinxfb_of_probe(struct platform_device =
*pdev)
>
>   static int xilinxfb_of_remove(struct platform_device *op)
>   {
> -	return xilinxfb_release(&op->dev);
> +	xilinxfb_release(&op->dev);
> +
> +	return 0;
>   }
>
>   /* Match table for of_platform binding */
>
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780

