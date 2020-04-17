Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF641ADEFC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC36EC0D;
	Fri, 17 Apr 2020 14:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDE6EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140748euoutp0267177c4863658540c46e669846f63338~GoJIk4kx81573015730euoutp02J
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140748euoutp0267177c4863658540c46e669846f63338~GoJIk4kx81573015730euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132468;
 bh=tcydotx9zf7WxaKtdGgefsTNHzk/a03FVU17JH9/zW4=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=OiTzveGoI3AAXjL5o2uV90WjzSFptKCqTQ0ywyd5IbVB/zIm53ZZPiL4VyHV1cKo6
 SFYMaZuiFslXCk0p/aKDlHCJH07CSzicH35y0DyJlaLef98pmoqq4M2IZWqmDe+rPS
 q//stlaJz1kuOepgeIelL2t7YPZFdhEfsN850sdE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200417140747eucas1p2cbafe4a7845d1abee9e60d6864892931~GoJIVsdC31677816778eucas1p2Q;
 Fri, 17 Apr 2020 14:07:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 16.CA.60698.338B99E5; Fri, 17
 Apr 2020 15:07:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140747eucas1p1e11563e8303d502f19f515779b02d261~GoJH8o8V01657316573eucas1p14;
 Fri, 17 Apr 2020 14:07:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140747eusmtrp1ff6eacbd0af92c9739d6192619b248bd~GoJH8BkLo2210922109eusmtrp1U;
 Fri, 17 Apr 2020 14:07:47 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-99-5e99b8336a3b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.D0.07950.338B99E5; Fri, 17
 Apr 2020 15:07:47 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140747eusmtip208f1f12fe5a85cb5ea336d72afc871f3~GoJHoyHev0114701147eusmtip2B;
 Fri, 17 Apr 2020 14:07:47 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 5/5] video: ssd1307fb: Remove redundant forward
 declaration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <cb6b7219-e9df-3f1a-dc25-67b0c52ed720@samsung.com>
Date: Fri, 17 Apr 2020 16:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170532.44384-5-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7rGO2bGGdxeamHR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wASxSXTUpqTmZZapG+XQJXxoK9b9gL
 utgr1v94ytjA+IS1i5GTQ0LAROLN07lMXYxcHEICKxgl+rZ2QDlfGCUu3fjJDlIlJPCZUaLl
 RSRMx68HB9gg4ssZJQ4dkIVoeMsoseTEMWaQBJuAlcTE9lWMILawQIjEry3vweIiAuYS6yYt
 AmtmFgiV2NDwHmwBr4CdxLyVb8HqWQRUJc5s/coCYosKREh8enCYFaJGUOLkzCdgcU4Bd4kP
 XftYIeaIS9x6Mp8JwpaX2P52DjPIQRIC/ewSl7/tZ4K42kVi3alJbBC2sMSr41vYIWwZidOT
 e1ggGtYxSvzteAHVvZ1RYvnkf1Ad1hJ3zv0CsjmAVmhKrN+lDxF2lPje/J0RJCwhwCdx460g
 xBF8EpO2TWeGCPNKdLQJQVSrSWxYtoENZm3XzpXMExiVZiF5bRaSd2YheWcWwt4FjCyrGMVT
 S4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAhPL6X/Hv+5g3Pcn6RCjAAejEg+vQc/MOCHWxLLi
 ytxDjBIczEoivAfdgEK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJ
 MnFwSjUwxkRcFbzuvvOn77uNyj6+e87oT5VLPlQfr+Z62f55T59dT0Zb1VTpD03vmKp3BrM6
 6SsckFo0rVL37aVZJhe8d6j8evRP5LlWd7nOjyVB91kcc/tl5AMEHd/q6K7cLnOoy4S9+LxA
 UHiY54dTxat4y3O/nf7BvkK+bP7sA40Kv5uv8t00C/ujxFKckWioxVxUnAgAjWKJ9CgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7rGO2bGGbydLGvR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
 oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexoK9b9gLutgr1v94ytjA+IS1i5GTQ0LA
 ROLXgwNsXYxcHEICSxkl/vxdBeRwACVkJI6vL4OoEZb4c60LquY1o8SLc0eZQBJsAlYSE9tX
 MYLYwgIhEr+2vGcGsUUEzCXWTVrEBmIzC4RK3L+9DqxeSOA6o8TpafogNq+AncS8lW/BelkE
 VCXObP3KAmKLCkRIHN4xixGiRlDi5MwnYHFOAXeJD137WCFmqkv8mXeJGcIWl7j1ZD4ThC0v
 sf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG0rZj
 P7fsYOx6F3yIUYCDUYmH16BnZpwQa2JZcWXuIUYJDmYlEd6DbkAh3pTEyqrUovz4otKc1OJD
 jKZAz01klhJNzgdGeV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6p
 BkZn8xLWWWVCpt120RtvXW8JymjQe9Ou4Rhf13zE/NVe8Wze83ZsEd3Ze/3nZ6xW8L62IvT9
 9BeCtkK5UlPck/i2em5aWNzZ8juq5bBabdJaScU3yxfftSmSXZWZE3ZB3MHo/426wxGya3z0
 87IeC4UGxUbJeebErnqmfqly66618gV6K+3ClFiKMxINtZiLihMBtj33BLoCAAA=
X-CMS-MailID: 20200417140747eucas1p1e11563e8303d502f19f515779b02d261
X-Msg-Generator: CA
X-RootMTR: 20200324170539eucas1p19f81f8c31975734ab56e19d15033be77
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324170539eucas1p19f81f8c31975734ab56e19d15033be77
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
 <CGME20200324170539eucas1p19f81f8c31975734ab56e19d15033be77@eucas1p1.samsung.com>
 <20200324170532.44384-5-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, xllacyx@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added dri-devel ML to Cc: ]

On 3/24/20 6:05 PM, Andy Shevchenko wrote:
> There is no need to have forward declaration of struct ssd1307fb_par.
> Drop it for good.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/ssd1307fb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 6e543396002a..509cab2c8b6c 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -48,8 +48,6 @@
>  static u_int refreshrate = REFRESHRATE;
>  module_param(refreshrate, uint, 0);
>  
> -struct ssd1307fb_par;
> -
>  struct ssd1307fb_deviceinfo {
>  	u32 default_vcomh;
>  	u32 default_dclk_div;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
