Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCC630C8A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 07:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED110E163;
	Sat, 19 Nov 2022 06:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1504110E163
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668839994; bh=l+WsbfLURdjYJd9P5p3v7g6Q4AV62aE2sA1DFwUojDk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=tnMEwqGwhsRTSm4HzdENLCLBCbVgUIRtxSa2y5ZVm6sUdBL3TwQiXl5MeVqxQ8Rk8
 rkttyM49dUedBlHWfHZgwDM4v3369ljSapgxLkbkWxRV1h1lmauxEDV7WEg8fg6Qla
 52Lgxe8Jm3fv519XwTgsq4318xdFPo5puxnyPdgX6Tf+bJrDz2ZUkdHQ63RS43IxYu
 1l5zIn7yfTwQ5Zasqp28eG2Tj02D1Ro927ZfSJJ5Z7geazGJihTk7tx28xIZ2g4Mx7
 JUVoq7XWyoFkrVM3GTDBjFYK2qJ0khvaRmKCEz6usS2afgv83m9hz4eSffw5qbT+0N
 K9A7vyplAFDPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.184.159]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1p6DiY0nTQ-010rWZ; Sat, 19
 Nov 2022 07:39:54 +0100
Message-ID: <75f7bba1-8dca-ff17-f922-e3465759ba66@gmx.de>
Date: Sat, 19 Nov 2022 07:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 594/606] video: fbdev: matrox: Convert to i2c's
 .probe_new()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-595-uwe@kleine-koenig.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221118224540.619276-595-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VZ7IAwxjDCqR+1ZSYMAULZDjKb3OwL/bJQZZP+mRsalty8QZ/n8
 aRf6cSjyfqRQ+eJ4DdRt/b8yLK9hE9sDjXnP1lADZaX+7AchVX/zAp7c0alNrR19ntr+5lW
 mcDhca1dxVuRnKqnMxVEG6lTqET/fLW97TumFBs2qvuwibf3DunzSCp+jdW8GwooXCNSLM7
 Xa9AjRa57SmDBaQEiqeKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H8sX/ATSKvQ=;oTX6ETbOe4jXDHYbibatzVli/xH
 8NThLqA8TssXhDfdFQ052wf434YbMGPp7X+Ond7PwhjiRY2K8CEeQOL0DYsVsqzuX32HO3TtR
 XhYNttThSIkAFO6YKox7hk6wfxBx8pQVU3WZUo/3eEGD3qUmDpUfL12ihvDBvAPL/wL1z044T
 fpHvxPUF601m8oqoO8lIcWJHrrtzx+hgNks5qXo2JdHWDBeeWrw0o8D8jTIiX/M6oAZOgRTBt
 IP2iUs70vI5ErJqj/9gq2abaP9EdKUY8Zgkne3Ti89D4bgg4Dv8SJN2+mIBty4Z561DYrn3Dk
 rCPwhxS8JCiLEG6Z384QOmi+XXMjOGaCozKODFYlAwGm8ygZR4MNn2Vpef88EUoMI48H6ckC2
 U6+PC9TMFXIEAWD/Syn/Cic2gpwlVv5ToourVoe5q6gYwLoiGykdFJwxfqTIr47E5zOF3CdPw
 gv+OnSg5LI/UWCVKxeKKMUYxbd+AxWcJXa6ExCK3baSlhTWGegoC/DpXE7WgQi0zfKtXpEopS
 nl3Py7y3Lxdi8xZlwdQL9g/LSCL0qS6p7ae15Tkk56AzfZDNGB2KmXRiPDVvHeFs9wBZm/ilZ
 kZMo5Cy4aMV9uJRQ76xxkjoxfu/kC8Zx31mC0jnaeoarAVAJP0mAJwk5D+sMWhudRX2cIutCm
 sYIujEZsSMayOkndCqJxef3uEAwnQQBapS+i9bUdIdHRGRNz6AnA5BIsMzZWNtWzaLpRRzUyn
 kJwh1EqZRqC6cFIMmfw7HE7v8faSVjFWd/ZftScNRLM5jak1PE7A+NcbJSgtpRzHiBlk+iCtG
 x/p50WRXEq6lTx6BGQDIVTh0FOtKnFgdnSdv9xDwTeBuYAP9liks/Q8XbEFAl1ooUsbOom5qr
 KkxPpsH4uCeZ+lJc5CIqRo6w6qUD8Q3cj5Koh7mT44S1Les6BFAcs33pS2O9WMR/Jwhygh7cu
 TF8xE6f+tA+lrXwB8Gw/E6P4xI4=
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
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 23:45, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so =
it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied.

Thanks!
Helge


> ---
>   drivers/video/fbdev/matrox/matroxfb_maven.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/matrox/matroxfb_maven.c b/drivers/video=
/fbdev/matrox/matroxfb_maven.c
> index f2e02958673d..727a10a59811 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_maven.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_maven.c
> @@ -1249,8 +1249,7 @@ static int maven_shutdown_client(struct i2c_client=
* clnt) {
>   	return 0;
>   }
>
> -static int maven_probe(struct i2c_client *client,
> -		       const struct i2c_device_id *id)
> +static int maven_probe(struct i2c_client *client)
>   {
>   	struct i2c_adapter *adapter =3D client->adapter;
>   	int err =3D -ENODEV;
> @@ -1292,7 +1291,7 @@ static struct i2c_driver maven_driver=3D{
>   	.driver =3D {
>   		.name	=3D "maven",
>   	},
> -	.probe		=3D maven_probe,
> +	.probe_new	=3D maven_probe,
>   	.remove		=3D maven_remove,
>   	.id_table	=3D maven_id,
>   };

