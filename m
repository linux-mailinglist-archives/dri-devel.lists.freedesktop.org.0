Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EB86B9083
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3564E10E76D;
	Tue, 14 Mar 2023 10:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F86310E76D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678790882; i=deller@gmx.de;
 bh=+H999tQFo7smOtY8vl9Sq4foFE7+8XAXs6vN0vwnsCg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=oBLE1QyMpuuoR1cS0O6DRUI4nCpZeHo3qlFTw5vK3WrqsQZipdvY9g5+d4RWFww0I
 Swc3UNSbl+OmGDETIsRw55tlCgIoVUSkO4OoG3ppY+ZQNYVcU2dj3shQbAyjkiL07R
 hIHroHTBQxiH1LmCorORaZJt09iE5YqrFjhmftq5vLDIGqr0q77GnMq1uv9dX9AI6M
 k+BLiBY+YFMQ+06MqLUESm3+5ehmkLpcLyfs4OBTsq1+VUTazjQ+SDSkJzoiBmPm7e
 04wTTspujkcMMC8uQhLgTT63nIohVQoJZG5h3KbxRD64h4YKH+BcS+ftsGboIdQAh0
 KcxxWXeSOja6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.156.222]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wyy-1pYiog0gIG-005cDM; Tue, 14
 Mar 2023 11:48:02 +0100
Message-ID: <8e402daa-a9ba-59c2-92c4-f1ecd155acda@gmx.de>
Date: Tue, 14 Mar 2023 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH -next 1/3] video: fbdev: pxa3xx-gcu: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
References: <20230314054219.80441-1-yang.lee@linux.alibaba.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230314054219.80441-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:COWrltcDftZwEH+WQ+1z1WpXjeLD2DaQry6p1pznqypdP8qXABj
 KHU3O/ZUN9Uj6ZJSbYFEVW0shSyut/P2oppX/bSeAJ6qvvvuuDHCcEQcGepkptijfFAtxhN
 obVm/UHfvmd34X0TXZClEK6rQ4WEA745BZH5QXrXUmwQBWrno5VOAHaNNlhdlV+DHun2X9I
 8FKOBmS+7G3WCklyeuFnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bhN6TB1bLJM=;Oh5EPKU3hhF4QPWCwTgxxnd+FXV
 OXFu+/UM6E2zVQmLXUeI1jUknJIytDkupCrY6XRlK1A+RcBOmUD3JsXZQg0fntH8jPgd3j+0i
 qcVmDCcUDFRbWGatbuJ3pVjfOSdXyK11nQF8lzKTOQQv2WjiombRfog+MHGARMPWfN5faKYbA
 9ahYXk+KYxKH0ARONCoQC7KLyFeLjmlad2dU/xZrLNAgQhyzoQD+mApYfLgVZtx/aACLL50SK
 xk9fgzPomHDl/9SHvZUuqgt9DuU7Hmi8g3rDkQa2m5K+yIay786YaJx+VyLjlmrrb/7Wj57K2
 hjYttI8GVQbhfdubtx3Eq6kUBq2YossvdQ4FUAXgq+hRmSj8z7oyMvfHCbtZOSRFoe1cQ4AYU
 IIj6F2x/VPBLFBfpfa+VUSouA33RZl9y5Lamvi25S9IG32EXt4ci9oKIj+dp6mojzDrkJ7xMX
 chGrWHcCgONZolf7D9g1x5iWrmurnxY9jOtAI1crIDKM/JgrjST0ar3lP4faU8F1uyzHewOeV
 xAtAt/nJ6qpm1LT1wtQy+qi+TrNyABIRfYT7wDa0JjU1H0RO1i/W4Sz3ivt36HwNV+UNrRPAN
 JjTZ42M54wi6xNnHeFEI1So5pEfN7/Cvft756QyPYMdn32aiTnnUZTnm/CV0qy625ZMUdS4BC
 UrptGxSqlN5Ys5tdD3aU0VQwY9BkOJZGqOZfdiCNY3J5BkF/KBppRGawCh4xhCgfNq0wrNwir
 at7i+GwCtA0PhEYSm8WPpwdpYGQDQR+Jy0RkLExm4hBJsR4owH4p3D4oZVZcGg+qLP1WJg13p
 5DDttsuxqJQRWFJC6Y1J01ykz/FJMU9Rf0ti0lDeM7T99F4Yoc2BdTYgF46/fICo5b69PWy4m
 QI6Z7s4JLfHZT49jU0c7AoxisEd0YH31zFsMldo2QGXPh1jyESFCj84thEub4QoNvEI4BTiOc
 /pbthbU65VjJtHWoWjhUEiVEXAg=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/14/23 06:42, Yang Li wrote:
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

series applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/pxa3xx-gcu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3=
xx-gcu.c
> index c3cd1e1cc01b..d16729215423 100644
> --- a/drivers/video/fbdev/pxa3xx-gcu.c
> +++ b/drivers/video/fbdev/pxa3xx-gcu.c
> @@ -599,8 +599,7 @@ static int pxa3xx_gcu_probe(struct platform_device *=
pdev)
>   	priv->misc_dev.fops	=3D &pxa3xx_gcu_miscdev_fops;
>
>   	/* handle IO resources */
> -	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->mmio_base =3D devm_ioremap_resource(dev, r);
> +	priv->mmio_base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &r=
);
>   	if (IS_ERR(priv->mmio_base))
>   		return PTR_ERR(priv->mmio_base);
>

