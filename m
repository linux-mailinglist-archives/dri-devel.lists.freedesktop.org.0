Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BB012F840
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F7B6E2E9;
	Fri,  3 Jan 2020 12:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A9D6E2E9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:33:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103123355euoutp02676171200fa963a64179c25a15ff4793~mYIMNotgA3264432644euoutp02c
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:33:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103123355euoutp02676171200fa963a64179c25a15ff4793~mYIMNotgA3264432644euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578054835;
 bh=wqpvlc5dc6EaKv/qmjbhZPAOqfxHg+4cZNkZ0Hpa7lM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jVIVL/paiDHrY+HwVpYzg4vCwmV3FhmiY4FM6u2Op3FPSX9iFV9Kn0DnBctzhht4S
 ZlHOcfB/dDJDjccLOwueSrjv36x4qc9juOk4zb0zh9O19IsQ1jEaL6QqoZ1AVk4Qco
 sJJv9f9DskIcfICJ/RFS7rwRX0ATe2bBagWt0MZ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200103123355eucas1p2873eb62ac1d4b07b38c59b5a721453ed~mYIL_wNCD1877118771eucas1p23;
 Fri,  3 Jan 2020 12:33:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 0C.6B.61286.3B43F0E5; Fri,  3
 Jan 2020 12:33:55 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103123354eucas1p28317fdf62e31014ea563baed8ff08c20~mYILqJyjU2296222962eucas1p2l;
 Fri,  3 Jan 2020 12:33:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103123354eusmtrp2ed33b4f922e74bb3f8cfcb50ec193fbd~mYILpJLNd0551105511eusmtrp2X;
 Fri,  3 Jan 2020 12:33:54 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-f6-5e0f34b32075
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1E.85.08375.2B43F0E5; Fri,  3
 Jan 2020 12:33:54 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103123354eusmtip16cd9c58f869a4d80172f5d6a5d37e2a8~mYILIz9bH1469514695eusmtip1l;
 Fri,  3 Jan 2020 12:33:54 +0000 (GMT)
Subject: Re: [PATCH] video: ocfb: Use devm_platform_ioremap_resource() in
 ocfb_probe()
To: Markus Elfring <Markus.Elfring@web.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <94a71d4e-25c2-5aa4-208f-70e46b6a964e@samsung.com>
Date: Fri, 3 Jan 2020 13:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <61b75aa6-ff92-e0ed-53f2-50a95d93d1f6@web.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87qbTfjjDOZ/YbX4MvcUi8WVr+/Z
 LKataWG12HpL2uJE3wdWi8u75rBZ/J/1nNWB3eP9jVZ2j52z7rJ73O8+zuTxeZOcx+1n21gC
 WKO4bFJSczLLUov07RK4Mh6cO8tWsJmnYtbyacwNjBO4uhg5OSQETCTevX/M1sXIxSEksIJR
 4u6MHywQzhdGif9PW5khnM+MEvuv3WGEaTk45xAjRGI5o8Sv54vZIZy3jBIdj3+ygFQJC0RI
 LGtbyNTFyMEhIqAl8fSxCUgNs8BLRolNe64zgdSwCVhJTGxfBTaVV8BOYsqRWWC9LAIqEvtf
 z2AGsUWB5nx6cJgVokZQ4uTMJ2A1nEC917+uZgOxmQXEJW49mc8EYctLbH87B+xsCYFt7BKP
 9nexgxwhIeAiMeVcIMQHwhKvjm9hh7BlJP7vBOkFqV/HKPG34wVU83ZGieWT/7FBVFlL3Dn3
 iw1kELOApsT6XfoQYUeJ96cboObzSdx4KwhxA5/EpG3TmSHCvBIdbUIQ1WoSG5ZtYINZ27Vz
 JfMERqVZSD6bheSbWUi+mYWwdwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzAFHT6
 3/FPOxi/Xko6xCjAwajEw5ugzB8nxJpYVlyZe4hRgoNZSYS3PJA3Tog3JbGyKrUoP76oNCe1
 +BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQZGs7QrjS5m+yoNN/PMFs53E/TLluGu
 NFvKWjzjxZray5e02+S1n76tavFNmlNffGp51DS9I6Wr73ozpBibs/2frqnC5WBmbOepvCtf
 sXidqsy+sPun15yN717w3Iw7p3iLwceVbQk3ph6ZkP3vVKr68uS7bAcX7P8zfXOR9AGeB862
 d99WdMspsRRnJBpqMRcVJwIApoaJdj0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7qbTPjjDP5d07f4MvcUi8WVr+/Z
 LKataWG12HpL2uJE3wdWi8u75rBZ/J/1nNWB3eP9jVZ2j52z7rJ73O8+zuTxeZOcx+1n21gC
 WKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mh6c
 O8tWsJmnYtbyacwNjBO4uhg5OSQETCQOzjnE2MXIxSEksJRRYsv8H6xdjBxACRmJ4+vLIGqE
 Jf5c62KDqHnNKNH9Zx07SEJYIEJiWdtCJpB6EQEtiaePTUBqmAVeMkrc+fKYGaKhl1HiyNcu
 sAY2ASuJie2rGEFsXgE7iSlHZrGA2CwCKhL7X89gBrFFgYYe3jELqkZQ4uTMJ2A1nEC917+u
 ZgOxmQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz
 03OLDfWKE3OLS/PS9ZLzczcxAmNu27Gfm3cwXtoYfIhRgINRiYc3QZk/Tog1say4MvcQowQH
 s5IIb3kgb5wQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wPTQV5JvKGpobmFpaG5sbmxmYWS
 OG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkbGmaeWBmgUv7lb1f1BhXfe5opd0W9jzjWeF5KP
 Xhwmk3//ttu6mrNM0iymR0yKvkgnz/749GLssh9nHwatkRBOMnTY86RLfPGLnSl9D1w13gaG
 zjUM5066NPfXlcgqlcmMpQul2F7m3S+csfPX5cppHyddPJi9hcVl96sJXFzX7dR1p03/c0pT
 iaU4I9FQi7moOBEAIZLzu88CAAA=
X-CMS-MailID: 20200103123354eucas1p28317fdf62e31014ea563baed8ff08c20
X-Msg-Generator: CA
X-RootMTR: 20190919143339epcas5p2ca00bc034be8e478353a40475683de13
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190919143339epcas5p2ca00bc034be8e478353a40475683de13
References: <CGME20190919143339epcas5p2ca00bc034be8e478353a40475683de13@epcas5p2.samsung.com>
 <61b75aa6-ff92-e0ed-53f2-50a95d93d1f6@web.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Himanshu Jha <himanshujha199640@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/19/19 4:33 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Sep 2019 16:26:56 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, patch queued for v5.6 (also sorry for the delay).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/ocfb.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
> index a970edc2a6f8..be308b4dc91d 100644
> --- a/drivers/video/fbdev/ocfb.c
> +++ b/drivers/video/fbdev/ocfb.c
> @@ -297,7 +297,6 @@ static int ocfb_probe(struct platform_device *pdev)
>  {
>  	int ret = 0;
>  	struct ocfb_dev *fbdev;
> -	struct resource *res;
>  	int fbsize;
> 
>  	fbdev = devm_kzalloc(&pdev->dev, sizeof(*fbdev), GFP_KERNEL);
> @@ -319,13 +318,7 @@ static int ocfb_probe(struct platform_device *pdev)
>  	ocfb_init_var(fbdev);
>  	ocfb_init_fix(fbdev);
> 
> -	/* Request I/O resource */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "I/O resource request failed\n");
> -		return -ENXIO;
> -	}
> -	fbdev->regs = devm_ioremap_resource(&pdev->dev, res);
> +	fbdev->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(fbdev->regs))
>  		return PTR_ERR(fbdev->regs);
> 
> --
> 2.23.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
