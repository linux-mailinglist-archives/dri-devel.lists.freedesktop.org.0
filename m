Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5286A2B1D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 18:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED0810E60D;
	Sat, 25 Feb 2023 17:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA9810E60D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1677346146; i=deller@gmx.de;
 bh=ydbPDJcHWeZTcYVlzmYYqStnw+/P96AIc5NwdbKyn40=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=Ylf++ifsZJ6czzGbOleDxAUc6KtZGLAORulj2lrG4xxLkArOQcxAermWIgGYRI/R4
 Dxl34SW1bPB3QnYiyDBv1kDeSzRpwB86iw6mMPycwUXHK22LcDrn89AvkZR2VVOuH7
 hxCgxqWNGIXGywdB5eP2h5LFAkYvl4/HaqQEVXe8SGLUiBVMML7dfv4KcaUMyTvj87
 CnpjTV3zXDyyleqPuff7xZweJefe7q0rVE1OOB5k1qKnKF/XXXe0bhzNYMxvvfmyhw
 AqvFIRdQ46QfDUKirFBqWUw+543o3Y8szHCZLRCD761FDwqHz3AlnH/k1rxvG6axrC
 shG3cenVjBXew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.139.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1ojDS30LI2-00nAWR; Sat, 25
 Feb 2023 18:23:49 +0100
Message-ID: <eb6900d5-148f-85cb-eebc-c20d99802c75@gmx.de>
Date: Sat, 25 Feb 2023 18:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Lucy Mielke <mielkesteven@icloud.com>, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230207100630.11644-1-mielkesteven@icloud.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: omapfb: cleanup inconsistent indentation
In-Reply-To: <20230207100630.11644-1-mielkesteven@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qIG4lpqWeR7O/1JJ/i5c5OuLExiquuoNnoBBFoR/goYZhYz6ASu
 J46WSrD3h8hcBp+bUVxTN2ZG9FWJJOxYkKR7ZMOFUzdoustA8L5toWMxKWbh60u2WO770Mp
 Eu+GXwCDZVW2RY1Lfg8NlAm9Md5UYls9XkSJT+5W0H6TzsQDmEM2LYkMw4GN68e956hd9rz
 ZNhh2OW+ZSUa3OGzMFk1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IdPvLEAkLXo=;yp7a0+PCNiHVHR10L4h4GFTHhlH
 gp9OzZRmVkE+rIlgW4YMqGWplav+QIAB+woRnMxcGYNZXziT2rfdAXhSlJwhnO+5+iyVr/VtT
 WDP0orXXq5WKnhY5FUf8FyGEXzGkjWClC+bjArMK8e0+y6nVj6UJTZxt+EutvnJx318v0YMBf
 xGn4TmVSEj2fDdodk/b68mINUnTI210eQSPmvlom5YIzxB7kI2YFpfTyTui9AqKIAr11oApV8
 3y6mQvStPli292TbyNIAdG2bZNLJfgib2IWgAhyrOLA3Wrx+HFCFb0EvuKJVP5vse7KTxVPd7
 O+mhaU3MgscarxERRup3huT7eALAbKuin9Jyw8tTfWCfXfeN2Ne04yi45D5MToK+nt2M54l7z
 rz42t3tY2IuSDm0ei/f6lkjsj14mOeO87qdt5eeHZe6Wj1BT1bQkbfTzQGqBlDWFjOh2beBbA
 l4MqFPlFOHm6riXv+8Rttl1f6fUs42C/a68XObqsq9Chrcv8hCl/oPv44qlMdm3bajU3PoFiM
 IV7j2KshGKY7bhFGYWTFVVIzUwGVhWt2xM+drKvOeuF4QxU/5NQnu0R3z/VWFugnTMawtiDMj
 DHM90zwbjUQDvl/6FJW3Y2bsuqSTzx7lrYrSuni0iVYtatntaK6czpPxoqoxe7LWYHh5kkKgG
 WlW0sOmXlctwSs7GU1WAzwcrB4kwZP8o1LeGU9czjVMlY+wb0+k3qyHJJFtZos7iD0niCQb/a
 vJKLs3jO2NtKa/yQHr8Urdl9Ys+CltalH6JpYuQlGSjS9pyGPN201rQsI6JKANnaA7tw6Y3r0
 jAdd9qt9UORlSuDDzT1LgQlTLsAsrNd31pUaRaFGM9OAZnOAL9YaoA9UTuWHNmRqn8xhlGnyB
 l1iXnZKZ1JyrwnKPuj2TM2OaCfilVSC++xym4WD56CJaxqy7smerfcgORtfvAU/ihFKnmQ7h/
 e/wWs9Ut7DJV3AXPU0Bn+AOmaKs=
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
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucy,

On 2/7/23 11:06, Lucy Mielke wrote:
> This cleans up the indentation according to the Linux kernel coding
> style, and should fix the warning created by the kernel test robot.
>
> Fixes: 8b08cf2b64f5a60594b07795b2ad518c6d044566 ("OMAP: add TI OMAP
> 	framebuffer driver")
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Lucy Mielke <mielkesteven@icloud.com>
> ---
>   drivers/video/fbdev/omap/omapfb_main.c | 32 +++++++++++++++-----------
>   1 file changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbde=
v/omap/omapfb_main.c
> index 1f3df2055ff0..4b673daa32cb 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -78,7 +78,7 @@ static struct platform_device omapdss_device =3D {
>   	.name		=3D "omapdss_dss",
>   	.id		=3D -1,
>   	.dev            =3D {
> -		.release =3D omapdss_release,
> +	.release	=3D omapdss_release,>   	},

This is wrong. "release" belongs inside the .dev
variable, so the previous indenting is correct.

The changes below seem correct.

Helge

>   };
>
> @@ -544,19 +544,25 @@ static int set_fb_var(struct fb_info *fbi,
>   		var->yoffset =3D var->yres_virtual - var->yres;
>
>   	if (plane->color_mode =3D=3D OMAPFB_COLOR_RGB444) {
> -		var->red.offset	  =3D 8; var->red.length	 =3D 4;
> -						var->red.msb_right   =3D 0;
> -		var->green.offset =3D 4; var->green.length =3D 4;
> -						var->green.msb_right =3D 0;
> -		var->blue.offset  =3D 0; var->blue.length  =3D 4;
> -						var->blue.msb_right  =3D 0;
> +		var->red.offset		=3D 8;
> +		var->red.length		=3D 4;
> +		var->red.msb_right	=3D 0;
> +		var->green.offset	=3D 4;
> +		var->green.length	=3D 4;
> +		var->green.msb_right	=3D 0;
> +		var->blue.offset	=3D 0;
> +		var->blue.length	=3D 4;
> +		var->blue.msb_right	=3D 0;
>   	} else {
> -		var->red.offset	 =3D 11; var->red.length	 =3D 5;
> -						var->red.msb_right   =3D 0;
> -		var->green.offset =3D 5;  var->green.length =3D 6;
> -						var->green.msb_right =3D 0;
> -		var->blue.offset =3D 0;  var->blue.length  =3D 5;
> -						var->blue.msb_right  =3D 0;
> +		var->red.offset		=3D 11;
> +		var->red.length		=3D 5;
> +		var->red.msb_right	=3D 0;
> +		var->green.offset	=3D 5;
> +		var->green.length	=3D 6;
> +		var->green.msb_right	=3D 0;
> +		var->blue.offset	=3D 0;
> +		var->blue.length	=3D 5;
> +		var->blue.msb_right	=3D 0;
>   	}
>
>   	var->height		=3D -1;

