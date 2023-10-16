Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E46D7CB512
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 23:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA1910E1E1;
	Mon, 16 Oct 2023 21:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4264F10E031
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697490548; x=1698095348; i=deller@gmx.de;
 bh=0l5HRln2aLrQCHUgzKay/9XIY0Mr4awYAadqROs/OAs=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=N5BdS+KWNPUf9/OfdjXUFTlr5rSCv5vppRovuPYZt+pf5CL9NNHFWru4ZeD6x1JuLw694COb1at
 JTLa3T5h84yqBSABtTXdSSToXnYC9UyHik1skJ1ShcQY8Ohr+xzGoqWkERNDJihHxdVFN6dLvyeJI
 khKZoa/VEIfQHBgnOWKob+cKWEeNEuyztdvtSzMU2YwYkMIPRiv88DARhMW+W/mwWHMnN378ngwI/
 /W+zY3rdxp5Y8iuTGaNaWhn/xgxFOk0NAn0vPziID1ercUVQ4CQUllrXmKDblV60pSq/9YoXil4+l
 UbfSVQznT1pNnP0ynF9jbUJpx+VExszunZqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.197]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1raOH61yrY-00zpwm; Mon, 16
 Oct 2023 23:09:08 +0200
Message-ID: <e1c6a19b-7587-4b99-b8d5-5572d946f185@gmx.de>
Date: Mon, 16 Oct 2023 23:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: fix some error codes
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <843b063c-ee4a-4e17-add6-75e2cc82c2f4@moroto.mountain>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <843b063c-ee4a-4e17-add6-75e2cc82c2f4@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FOyYUK4b2kQYxx/cAdXEvw+vAIrXHbwCICGIvD6Kz5Obv8fpWfo
 +yxSC1QHy9oSBBS+anxDLcgMYbDMpuj/kYNgRbd8u4EUTiQZExSABwuTZ6wpNJYTaAvH4w6
 GGzs305XXJBHWE3UgmezXl4gIZMEZ5HLU7AhntwUFtq5K6DpCiLi7tQr0NsAvpjdyEtnn2h
 ANIv4o7mbdykPwdII9uzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i3G6yuKsgbo=;HyJOwbkzpDfgVsMPYidrsW2Dbgm
 kXOBK3eWbsiNnbYRo1a9giCySikv94pxQPxGLaIEkO5kHowmkfxNzf2I8CTaY6KEm5tcrYsQ/
 Nsn/31TdVzmDfcENep2oouVDmdEwSy84IFV46FlD/V9p2Dy36l8o+XL2aCasQ8j+/J1eb9cPg
 a8SaCHvv6mn83gYgss9U5O99oWMButQKjkyiWsTPa+IoMuxkpaNQ6XYmGaKjsRnEAqghZpoK5
 zouLeu7r0iFkwrKu043Clb+4xpAbvrR/wzrp4klYxqr5cuBg5UxbpepzkE6jqRAlSn89dsOr+
 elGLbOe7eamMh7xq/AkFb0HGDX4x0GgP+LKORwh3sOErVbuqDW8U+jXTAX6FlvfqhfOVM+xfh
 ifl1xL9c2/DQg5WW3Dptf1VKijyP5yOqMMQwJibDOfr5lL63gOff+U7I7TDLZcgziKlFfDOpp
 7JmnmWYe1NYF0pFFmLjSlZ1vkhzl3tyoEVNjlwN24Bv9SLlS5MuXYPCFGYf9GZRdmIAQDsMCo
 wsX08Pw97zI45yA5V/w2gGmyALj2aoXDa31R1KotmNeWqOSCnQQuqxwIES3amgYzR8krjlutr
 64/CsF54D9iNMP6ZW/4n96u0O0Pu99CTl/EHrIW0CKE6o0JkqqIeSs8KfVSYKsiyzW2XqwEjq
 elpWv5O5oV0iQdSDW5+CdiB0ReQFP6GFcivKq+w7BeFaZ5mDsQ2cersNIVPtCe47J0h30AhKs
 XqWq8HbMACJTlJINQjKA5hYP9rXJw1zn8emqne9od2b9QTNJGxU0tL0fKR6J62cJl2M2oB5KF
 8m9eSV87Gk8LQGC4yRqIyUwLnwGbNVMa/prsO1IwsRFYobRSGHPzGXLTaqAjWVUHuxIoOQvRR
 TsWoyfWa7D4V4syb7xiT9VDV5dV1eb/cvDh3Jx/aeshpNsHTKuQKKSw6zND4rDbjFGvx4Blya
 xr7TDCJo9w8AjoRMvTvObtMroI0=
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
Cc: linux-fbdev@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>,
 Lucy Mielke <mielkesteven@icloud.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Yang Yang <yang.yang29@zte.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/23 13:19, Dan Carpenter wrote:
> Return negative -ENXIO instead of positive ENXIO.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

applied.

Thanks!
Helge

> ---
> No fixes tag because the caller doesn't check for errors.
>
>   drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbde=
v/omap/omapfb_main.c
> index f28cb90947a3..42c96f1cfc93 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1645,13 +1645,13 @@ static int omapfb_do_probe(struct platform_devic=
e *pdev,
>   	}
>   	fbdev->int_irq =3D platform_get_irq(pdev, 0);
>   	if (fbdev->int_irq < 0) {
> -		r =3D ENXIO;
> +		r =3D -ENXIO;
>   		goto cleanup;
>   	}
>
>   	fbdev->ext_irq =3D platform_get_irq(pdev, 1);
>   	if (fbdev->ext_irq < 0) {
> -		r =3D ENXIO;
> +		r =3D -ENXIO;
>   		goto cleanup;
>   	}
>

