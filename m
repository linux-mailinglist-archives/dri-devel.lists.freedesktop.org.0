Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D947E15BA
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 19:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D69E10E136;
	Sun,  5 Nov 2023 18:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CBF10E136
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699208155; x=1699812955; i=deller@gmx.de;
 bh=OpuGHWHjo+z7zkLdJMq7rmnWSH4uTCXi2DFnckteg+E=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=ouCgQEWl4OU3qITKJagJYZnXWjAAeDbYso6hjsB0ZGA23yEuYuwr9IPLXXY6kiJM
 snDebPDCHf/2/7PD7+rJUdjL8pu+ZFWM8WnJaWABKYOv0sq8JT1Mv8L9E5yYZNu5A
 m8LNA2D6dZrb5Do/nDusvlpyQE9WoGNtE3lwTICn5TnFjj3gf8xkw2srGHm5LYB3w
 vYtH8gGESptlb345FLMx4U7XtISwT9VDPAwtpME9eJc27kF8v2cnMNQQk/8kE0OuW
 V3h5Q2AXsSksY9u1waIsIIZol2GfeSay8XkRBXe/c8mOsSHj1ObZ49zphJL2+Z+PZ
 Oyj0trW4X15wYLM6DQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.195]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KTo-1rPNQf2XMQ-010LFf; Sun, 05
 Nov 2023 19:15:55 +0100
Message-ID: <0c6dfd41-8ad9-4780-a327-c910d6214355@gmx.de>
Date: Sun, 5 Nov 2023 19:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: Drop unused remove function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231103173557.3639484-2-u.kleine-koenig@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231103173557.3639484-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tva4T/FttIwLqofolQVY7ZaEyS6uSg9AxEBPnxJrZKjJ2cUezVO
 0ckQPyp1yfMJY7v/abSN+gmWgOJNsipjdK8sKaIEq5Sl9Hwbxn4xDpCGbQD/Z164RoOOPDf
 /34q+87OPf85ica9b6rLchmBG9vOhyB/ry+uAHlLD4R3jPk0YaaOSvSbWkLZEi0owGzeqpm
 jhQgArtnWYe0f4Guzw33A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IlOivZGtjTo=;7SvbprnV9Vc+9+iowCdh8UM3hO3
 j3UhkwQa0UMK57JyNQ4SSwxKDZGoNk51gwvqWOw6nzan2URBOEFsmF7qagtJmHwGgIl4BM1A1
 Vo27cW+rQSWN43bOjZo6YgnDY2B2bVSzc0CgChT6UJBzJnVAijP3gEGr8532KmDHtJHpNWpaU
 Gz6CcvyEvsknfqA4KqHQxZPUi+hM/iCocoJL8mUzOJQMjz3vDSLM5+aFt0XadLzFrmjXxYB9y
 IebCOz4F4xU/ZdKQ0ew1p3zj7qgQQY3kDlfKO4EpWfdVxLk95Rpn7mTNbh2moxb9KaqWFbJcA
 s597kchLtfGpUosou5pp5MWSgdmzpy0409vh49CfbEi0t8MO08l6CDVQksWA1m4FsOAU4REW3
 wVC1BhKfYdyctWhdQG1npD3MBI2wcxi88fXnITcE24ERF8BzYq05I6o2g1TYwltEYkj2gh9MR
 w2H/12eD/5Cyov8rs3b5vkERkDcmUMa6GblgwfYQHyHhpFFLpRp5k6s7Vd64ShxRBNhQe7lPb
 hy8ZXxeKS3MAeiEPFWwuv0xl2HMnANKbhgu51bk8lSL/cNYUIz9HRKnVzJcuyQxwJcm6SQo0f
 HZNq5jw1pgFoIj2850wzHzX68mTlXj/QN/D9u6BCNMMvHLAIu9Y0KvxHsnx5rQxhJOJBkh4aW
 1rjKTGqBpMHib5p1DfSpf3/RB8jGZyu9WwVYo/vr4cNhwao8h074mm8XbjvfDC91mRajWOFVY
 nCkTGQS5h+RzD0zDieJUAHfn6id3WJ4OMT4W/aKYbGWVSGseX+TIcUka1keC8eNaD9Xqa3h0G
 oFHkY62Q/mSDEe/R86gVH48kr91OLYfSK3Mv9iM1zjHQllC9Gp3Q+zsUwzt3eQdMR+xrcAOFm
 BjUK4JIFwgFMdqghJDewONrUFg5N7ydiPEbJFmHHxoiiV2of2pIx3EH8nZF8Z4scdb/rPZ4E3
 qNiZxR05BxVMcXmiyr2mdE/KIN4=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/23 18:35, Uwe Kleine-K=C3=B6nig wrote:
> OMAP2_VRFB is a bool, so the vrfb driver can never be compiled as a
> module. With that __exit_p(vrfb_remove) always evaluates to NULL and
> vrfb_remove() is unused.
>
> If the driver was compilable as a module, it would fail to build because
> the type of vrfb_remove() isn't compatible with struct
> platform_driver::remove(). (The former returns void, the latter int.)
>
> Fixes: aa1e49a3752f ("OMAPDSS: VRFB: add omap_vrfb_supported()")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

applied.
Thanks!
Helge


> ---
>   drivers/video/fbdev/omap2/omapfb/vrfb.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/vrfb.c b/drivers/video/fbd=
ev/omap2/omapfb/vrfb.c
> index ee0dd4c6a646..568e6e1eca62 100644
> --- a/drivers/video/fbdev/omap2/omapfb/vrfb.c
> +++ b/drivers/video/fbdev/omap2/omapfb/vrfb.c
> @@ -368,17 +368,10 @@ static int __init vrfb_probe(struct platform_devic=
e *pdev)
>   	return 0;
>   }
>
> -static void __exit vrfb_remove(struct platform_device *pdev)
> -{
> -	vrfb_loaded =3D false;
> -}
> -
>   static struct platform_driver vrfb_driver =3D {
>   	.driver.name	=3D "omapvrfb",
> -	.remove		=3D __exit_p(vrfb_remove),
>   };
> -
> -module_platform_driver_probe(vrfb_driver, vrfb_probe);
> +builtin_platform_driver_probe(vrfb_driver, vrfb_probe);
>
>   MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
>   MODULE_DESCRIPTION("OMAP VRFB");
>
> base-commit: e27090b1413ff236ca1aec26d6b022149115de2c

