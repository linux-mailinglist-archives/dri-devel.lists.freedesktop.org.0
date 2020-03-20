Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F718CF06
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 14:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B1B6EB33;
	Fri, 20 Mar 2020 13:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C056EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:35:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200320133535euoutp023dc1792ab2b5f36af8b2b800258e3374~_BpA2QMj71768117681euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:35:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200320133535euoutp023dc1792ab2b5f36af8b2b800258e3374~_BpA2QMj71768117681euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584711335;
 bh=P/pAyaCFc+jZJwFlQQQA+VgQq0sbwFSfWyQNsVZTqbo=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=cm1XncswLtzqncB6GLzpfSpQfZbEM9ZiY1TgIYK750iPJ5PMjX9/rzp6LtxRCp4sT
 o8MgvGieB1kHfkUaYd8tJVcxk9sVw41Ri/sMpK8Ay9/KQ6W6gSLIy0Gu2bd274+gdE
 FGHSZwcZV85v4ceYbLOaeKpyHc6vS8P3J/Dd/AaI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200320133535eucas1p1a1427e91920496e58b83028dc8deda28~_BpAjzZn22390123901eucas1p1c;
 Fri, 20 Mar 2020 13:35:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id BF.32.61286.6A6C47E5; Fri, 20
 Mar 2020 13:35:34 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200320133534eucas1p20402f96ce9c1d9ee120ef700d7c4b40f~_BpAImpSA0621306213eucas1p2F;
 Fri, 20 Mar 2020 13:35:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200320133534eusmtrp112e16d0ce3643a896729ca71de78378f~_BpAIA0XC1841118411eusmtrp1t;
 Fri, 20 Mar 2020 13:35:34 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-ca-5e74c6a60576
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.78.08375.6A6C47E5; Fri, 20
 Mar 2020 13:35:34 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200320133534eusmtip284e819d4b7568e806631ff91537df226~_Bo-1SI1F1039110391eusmtip2K;
 Fri, 20 Mar 2020 13:35:34 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] Fix off by one in nvidia driver strncpy size arg
To: Dominik 'disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
Message-ID: <a0fdfd97-d3e2-3299-0d1c-df13158e799a@samsung.com>
Date: Fri, 20 Mar 2020 14:35:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200309124947.4502-1-dominik.b.czarnota@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djP87rLjpXEGVx6a2Pxs/sLm8WyTytZ
 LK58fc9mcaLvA6vF5V1z2BxYPXbOusvucb/7OJPH501yAcxRXDYpqTmZZalF+nYJXBmHZ55j
 LZggXNH36h9rA2MrfxcjJ4eEgInEt/krmLoYuTiEBFYwSvzr62eGcL4wSvxYf5MNwvnMKPHn
 xU5WmJadDw4yQiSWM0rMeXyNFcJ5yyhx8vdqRpAqNgEriYntq8BsYQFXid6fG9lBbBEBJ4mv
 R6+D7WAWaGWUuHNuCRNIglfATuL9j0ksIDaLgKrE6t2nwZpFBSIkPj04zApRIyhxcuYTsBpO
 AUeJ+XcOMIPYzALiEreezGeCsOUltr+dA7ZAQmA6u8SBvxMYIe52kZi2dAcThC0s8er4FnYI
 W0bi9OQeFoiGdYwSfzteQHVvZ5RYPvkfG0SVNdCpv4BsDqAVmhLrd+lDhB0ldvWDAoMDyOaT
 uPFWEOIIPolJ26YzQ4R5JTrahCCq1SQ2LNvABrO2a+dK5gmMSrOQvDYLyTuzkLwzC2HvAkaW
 VYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIEJ5vS/4592MH69lHSIUYCDUYmH12JlSZwQ
 a2JZcWXuIUYJDmYlEV7d9OI4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqem
 FqQWwWSZODilGhgz/GVmV/zfYHNcZY/CvrPxr1wZd5eu/KnO5c7hlPJvIr8So9LFfdlrZm+/
 O31x1OywSA6l1X3/dizty3pwQDT4+f6fHxgDOtRfnhK2SbmfWmp8hE8mavG02LXywvc3/eXR
 ZZvy0/3iFdMTgsuvuzqsvXbBaqJhg9O94qsVOqX7kr3fPNmobaytxFKckWioxVxUnAgADvgA
 aSwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xe7rLjpXEGcxskLP42f2FzWLZp5Us
 Fle+vmezONH3gdXi8q45bA6sHjtn3WX3uN99nMnj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
 PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzDM8+xFkwQruh79Y+1gbGVv4uRk0NC
 wERi54ODjF2MXBxCAksZJTafvsfexcgBlJCROL6+DKJGWOLPtS42iJrXjBJzV65gB0mwCVhJ
 TGxfxQhiCwu4SvT+3AgWFxFwkvh69DozSAOzQCujxMazX1khuqcwSjT+ucsMUsUrYCfx/sck
 FhCbRUBVYvXu02CTRAUiJA7vmMUIUSMocXLmE7AaTgFHifl3DoD1MguoS/yZdwnKFpe49WQ+
 E4QtL7H97RzmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIE
 xtO2Yz8372C8tDH4EKMAB6MSD6/FypI4IdbEsuLK3EOMEhzMSiK8uunFcUK8KYmVValF+fFF
 pTmpxYcYTYGem8gsJZqcD4z1vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
 fUwcnFINjB7Ptfs4NuufacksWitslZeqVbamwSWD6W5nbajbl3vJPxbNb0lZn+nVXpJy5ZVG
 xCmOmELegNB/Bl5bVO3c1z7SmfNNbEpRuPDRwAK+SHONbxIGaputXZ7F7o+vOjLpYZrBoSYX
 h5l289waVGftkHHfFt+vkBt9J8FKcH2p+QaxX43vfv5SYinOSDTUYi4qTgQAGmySZL0CAAA=
X-CMS-MailID: 20200320133534eucas1p20402f96ce9c1d9ee120ef700d7c4b40f
X-Msg-Generator: CA
X-RootMTR: 20200309125343eucas1p17700a344a70dedd4c8a04c6f9ba4c7ac
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200309125343eucas1p17700a344a70dedd4c8a04c6f9ba4c7ac
References: <CGME20200309125343eucas1p17700a344a70dedd4c8a04c6f9ba4c7ac@eucas1p1.samsung.com>
 <20200309124947.4502-1-dominik.b.czarnota@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/9/20 1:49 PM, Dominik 'disconnect3d' Czarnota wrote:
> From: disconnect3d <dominik.b.czarnota@gmail.com>
> 
> This patch fixes an off-by-one error in strncpy size argument in
> drivers/video/fbdev/nvidia/nvidia.c. The issue is that in:
> 
>         strncmp(this_opt, "noaccel", 6)
> 
> the passed string literal: "noaccel" has 7 bytes (without the NULL byte)
> and the passed size argument is 6. As a result, the logic will also
> match/accept string "noacce" or "noacceX".
> 
> This bug doesn't seem to have any security impact since its present in
> the driver's setup and just accepts slighty changed string to enable the
> `noaccel` flag.
> 
> Signed-off-by: disconnect3d <dominik.b.czarnota@gmail.com>

Patch looks fine but please fix 'From:' and 'S-o-b:' lines,

per Documentation/process/submitting-patches.rst:

...
then you just add a line saying::

        Signed-off-by: Random J Developer <random@developer.example.org>

using your real name (sorry, no pseudonyms or anonymous contributions.)
...

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> 
> Notes:
>     The bug could also be fixed by changing the size argument to
>     `sizeof("string literal")-1` but I am not proposing this change as that
>     would have to be changed in other places.
>     
>     There are also more cases like this in kernel sources which I
>     reported/will report soon.
>     
>     This bug has been found by running a massive grep-like search using
>     Google's BigQuery on GitHub repositories data. I am also going to work
>     on a CodeQL/Semmle query to be able to find more sophisticated cases
>     like this that can't be found via grepping.
> 
>  drivers/video/fbdev/nvidia/nvidia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> index c583c018304d..b77efeb33477 100644
> --- a/drivers/video/fbdev/nvidia/nvidia.c
> +++ b/drivers/video/fbdev/nvidia/nvidia.c
> @@ -1470,7 +1470,7 @@ static int nvidiafb_setup(char *options)
>  			flatpanel = 1;
>  		} else if (!strncmp(this_opt, "hwcur", 5)) {
>  			hwcur = 1;
> -		} else if (!strncmp(this_opt, "noaccel", 6)) {
> +		} else if (!strncmp(this_opt, "noaccel", 7)) {
>  			noaccel = 1;
>  		} else if (!strncmp(this_opt, "noscale", 7)) {
>  			noscale = 1;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
