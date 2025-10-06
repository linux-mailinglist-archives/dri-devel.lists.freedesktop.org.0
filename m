Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32565BBFCBC
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 01:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C13A10E03C;
	Mon,  6 Oct 2025 23:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="NEOMhWh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E3310E03C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 23:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759794780; x=1760399580; i=deller@gmx.de;
 bh=0nMDAkCMkMyVn4U+qzwNKHiKogAqSb9/vLmkBTxL0ZE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NEOMhWh7DhoJFOd6thRqjGFE6s+bXZuB6/1DE8iVMIAf6vKgAkTD9lbIigw2+hKR
 PTj1Jf9z69M1fIXKHXBO/qhE6Upak7KI7YodEU7zOXEIXNqLABsrxZcPR7d22RR0h
 r6QjDWN7IZ7wi5lekmrb99xKyO3SjqM4c5Y2pOgOmqUcvuQ5cnEF42cLAVcFPooxN
 Ws45LP3qOvmWiNNr7xRmgHvtYXHz2XJ//zy7eGmw5wFnpwdQD0JsGK1KGUzqev/4b
 /XOTZoI92KGaVSBnQz2L9xb/SM+dePGKMaG/JF2YUoic+CGrB+EKjPvciVYYErQJG
 ElsuxHoAHkmS3+adAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.168]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1v3Sq32xl1-001ZIG; Tue, 07
 Oct 2025 01:53:00 +0200
Message-ID: <8f6ff11d-0107-4036-bd09-9d87c948e9c5@gmx.de>
Date: Tue, 7 Oct 2025 01:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
To: Javier Garcia <rampxxxx@gmail.com>, u.kleine-koenig@baylibre.com,
 tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251006164143.1187434-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251006164143.1187434-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V1bSgP3K3v7XNI3Jn1GGWabijKUkGqTNudD4V9pEvjVj027RKbM
 KcJhLFy7u1e6DcaXnWDJXZ6aVArY/8hB2YWFE8Frf/F+KJi6xRJ3vsWQVsBIcntPKKM2+ec
 Xb/UIFzG/MD6aPRbfi8BMVW3lvqaLaaezKTELPoXpAp8LNlXgrojOQNrjzXbmwJKKQQ7BmF
 363SfNHx6kRB5pHBfalKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+n4cGm/zNtM=;AbpZcABsHRQwgGl0qNqHm9D7D88
 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
 ZtnCnFJAL9UvUHClw=
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

Hi Javier,

thanks for the updated patch!
Some notes:

On 10/6/25 18:41, Javier Garcia wrote:
> This patch wraps the relevant code blocks with `IS_ENABLED(ifdef CONFIG_=
FB_DEVICE)`,
> allowing the driver to be built and used even if CONFIG_FB_DEVICE is not=
 selected.
>=20
> The sysfs only give access to show some controller and cursor registers =
so
> it's not needed to allow driver works correctly.
>=20
> This align with Documentation/drm/todo.rst
> "Remove driver dependencies on FB_DEVICE"

Can you make this commit message more crisp?
E.g. what is the benefit? Something new possible or fixed?
Also, the driver can be built without CONFIG_FB_DEVICE, but it will
then probably not work.
Do you have that card and tested it?
Maybe something like:

Allow the driver to be used for framebuffer text console, even if
support for the /dev/fb device isn't compiled-in (CONFIG_FB_DEVICE=3Dn).=
=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
> v1 -> v2:
>        * Fix error and improvement , thanks Uwe Kleine-Koenig.
>        * v1 https://lore.kernel.org/lkml/20251005173812.1169436-1-rampxx=
xx@gmail.com
>=20
>=20
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/=
fbdev/mb862xx/mb862xxfbdrv.c
> index ade88e7bc760..dc99b8c9ff0f 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -17,6 +17,7 @@
>   #include <linux/module.h>
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> +#include "linux/kconfig.h"
>   #include <linux/pci.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> @@ -759,7 +760,7 @@ static int of_platform_mb862xx_probe(struct platform=
_device *ofdev)
>  =20
>   	dev_set_drvdata(dev, info);
>  =20
> -	if (device_create_file(dev, &dev_attr_dispregs))
> +	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_=
dispregs))
>   		dev_err(dev, "Can't create sysfs regdump file\n");
>   	return 0;
>  =20
> @@ -801,7 +802,8 @@ static void of_platform_mb862xx_remove(struct platfo=
rm_device *ofdev)
>   	free_irq(par->irq, (void *)par);
>   	irq_dispose_mapping(par->irq);
>  =20
> -	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
> +	if(IS_ENABLED(CONFIG_FB_DEVICE))
> +		device_remove_file(&ofdev->dev, &dev_attr_dispregs);
>  =20
>   	unregister_framebuffer(fbi);
>   	fb_dealloc_cmap(&fbi->cmap);
> @@ -1101,7 +1103,7 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
>  =20
>   	pci_set_drvdata(pdev, info);
>  =20
> -	if (device_create_file(dev, &dev_attr_dispregs))
> +	if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_attr_=
dispregs))
>   		dev_err(dev, "Can't create sysfs regdump file\n");
>  =20
>   	if (par->type =3D=3D BT_CARMINE)
> @@ -1151,7 +1153,8 @@ static void mb862xx_pci_remove(struct pci_dev *pde=
v)
>  =20
>   	mb862xx_i2c_exit(par);
>  =20
> -	device_remove_file(&pdev->dev, &dev_attr_dispregs);
> +	if(IS_ENABLED(CONFIG_FB_DEVICE))

a space is missign after "if".

Helge
