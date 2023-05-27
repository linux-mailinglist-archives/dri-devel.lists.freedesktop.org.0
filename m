Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B5E7132CC
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 08:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2C610E047;
	Sat, 27 May 2023 06:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB0110E047
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685168469; i=deller@gmx.de;
 bh=UoXkXQYTuDFEb+ua/hM8Edl1rN08rKCcRv0BImu9d10=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JWVitJ9mmIYUXR2U2wO0l4eXJZ9eEurCv+2TMA+VZDZOSdjs39kf+RGfQCFoduZSC
 jjpEMZe1SY6gEfxGN1KxW4nyYi76hLXhIjF0vz6ixPjiCO4p0saI+0ItL9RWpcKVSr
 WVFEE0Vhyk3NR26tZVHu4EFmPInQO0OUdLv4bvUgM3ynDn8ckE5gRpuNFh6sdo0z5j
 Sx8dNooocr6BWzh/mDc70kXmEBHq85QKXoavJYC5Y9C4bIxL4acZEQ2i9GUjA5veVa
 yUKpTTiUpAS17zpT2UzC5rChBt97AzCDa6Ko6S8+iWAQ1WxWAu/OYH4wUtqXbEsqHU
 8bY20m+3j6ecw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.182]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1pjdqp00t8-00OnUK; Sat, 27
 May 2023 08:21:09 +0200
Message-ID: <860e4fa1-bf97-c156-0ba3-84d1a68a745f@gmx.de>
Date: Sat, 27 May 2023 08:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbdev: Switch i2c drivers back to use .probe()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230526054123.1013439-1-u.kleine-koenig@pengutronix.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230526054123.1013439-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0UzHq2Op0pEsyA+h82SHssNtXg63xuJgDdJOCP3mhdknKZldKqf
 E4BmP6Yt1YpV9N2yLeOOrLnqtv1IlsFJoeaXw8exDK9jPT6zcW4kp9IRj3tjVkf4iwBhl2a
 mtklrqJgxgbYVUYPm/bbRuR+hS48VNqjz+bDszHNKF9LnMDKtzyT7gXHL04OVMl9vskZGyo
 fx5R1oojKrVFHycIZBG0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zeCLr3maCjQ=;WnfdbOM+SaAeZsMjPh/NlSOwkRa
 fGfHxbvfCiEeYkelvz+iXa73zN2rVgYl0qJtoyt86ONZ8yeONbduClPYQJROyaHlJ9H4ougRW
 3oD0/VFw0OgE9/7vA3VvGToNE/j2ItqYaALT+rrxJ17rgSAUJr8zqujvAz0LntDtWlcBNUlNY
 KRAblvxyY9WYm1WJ8UhHV9PuYqHByS9aaX0QZw2BtDFbOPtFe+XV1x3vGY0nBlEhi+vCMcWc0
 etrUPZEvQ4/3pXPfW4zn7cmeMby/PVe78BtoX6fccdBVhOFXBoPyxLs123qocOM6/TX55WvI3
 uQh00nta93u0E9mSTI1pbaBbg1a7rOYDDWfVZXVhz6C6q0YHlSUuU8baKy6FEqIZAypmBrF20
 VCBT6X5wITMjQF848e5AfId26KmKCqW77hg4UMBNT0/52wR+OVTU0SpfhY8E+S3bTvGDNomom
 3y9RB31WyaOg9vt04h3EJYDpO9r7/YZ/EjdopJZ59UsyXSoeMXfkxkDZ3KyVlNlT+8Xr4tkXl
 AzzXXpIv6jmLdfew52ks0YasB9a/ye7OMoyfaJmiPOE5x+H3D3tgNokpeHK/bZOgoal3yQQAY
 KAE3AqDjcsWYXkrYKQC8iJzAv9pbY1X0g+S/ATPMNKf5DxEW5LibrlePXlJxUQjQKxesisZTx
 Q+X4E8Do2LuiiWSJIYIUF1lNOovr8IAWI+/UjCfbnsg8obJTYdQhYniLl9rqdXpXhoZrW0Leu
 weyqmo3ftWuVLDS33fRk0lVJUUreANR21Cw5Cp1saJudVkWWldjaM4QxwdabtEPdRagKB0cXS
 P3ludVlKqWNu2aMfFCUPVT3/ump8LpY84zo4D2ss8gNfrwIU8ieWw8kBg9H0tRycgmcj9gFHy
 M6fyoO3WRBzJiGwMGLZ4ngAnpWTMF7TTQlYDQ0PQbKus5T1PIA1tAWEzguHfIn3XokOExTY8F
 7lYFvg==
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
Cc: linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, Ajay Gupta <ajayg@nvidia.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vladimir Oltean <olteanv@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/26/23 07:41, Uwe Kleine-K=C3=B6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/matrox/matroxfb_maven.c | 2 +-
>   drivers/video/fbdev/ssd1307fb.c             | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/matrox/matroxfb_maven.c b/drivers/video=
/fbdev/matrox/matroxfb_maven.c
> index 727a10a59811..b15a8ad92ba7 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_maven.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_maven.c
> @@ -1291,7 +1291,7 @@ static struct i2c_driver maven_driver=3D{
>   	.driver =3D {
>   		.name	=3D "maven",
>   	},
> -	.probe_new	=3D maven_probe,
> +	.probe		=3D maven_probe,
>   	.remove		=3D maven_remove,
>   	.id_table	=3D maven_id,
>   };
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd13=
07fb.c
> index 046b9990d27c..132d1a205011 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -844,7 +844,7 @@ static const struct i2c_device_id ssd1307fb_i2c_id[]=
 =3D {
>   MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);
>
>   static struct i2c_driver ssd1307fb_driver =3D {
> -	.probe_new =3D ssd1307fb_probe,
> +	.probe =3D ssd1307fb_probe,
>   	.remove =3D ssd1307fb_remove,
>   	.id_table =3D ssd1307fb_i2c_id,
>   	.driver =3D {
>
> base-commit: ac9a78681b921877518763ba0e89202254349d1b

