Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF012F808
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0EB6E2DC;
	Fri,  3 Jan 2020 12:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E3A6E2DC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:14:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103121409euoutp01f3673b54ce15010599323705c9727f51~mX28CPKTu0267602676euoutp01k
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:14:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200103121409euoutp01f3673b54ce15010599323705c9727f51~mX28CPKTu0267602676euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578053649;
 bh=F5xn8C8mO5od4XXRPCeuooxSRNesDBnBt53jiPRnVS8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=k7ysTGsb+SSGwoiFM4ZiFoDZv6767sYgFcRqkTlbjWq3QBbw26WVPA/vs24o0A/Kc
 lndB9iLpiJYIqVq5RHp7XC/5ppbOU/AXdYUVH3y1h7OXUT/+41nd1RqnDYEuCZeg2i
 U4MnmJwV6M/Y6w2Zwhr9jcJCYlldT31okU+5Vy94=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103121409eucas1p1fb62a8416cf17799b8ff02fe2185f041~mX27yqC6J0795507955eucas1p1b;
 Fri,  3 Jan 2020 12:14:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.46.60679.1103F0E5; Fri,  3
 Jan 2020 12:14:09 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103121409eucas1p2ca69ad02ed77474da487db7d0beee52c~mX27dRDOd3262832628eucas1p2B;
 Fri,  3 Jan 2020 12:14:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103121409eusmtrp283c58bd8c0cc28a411994cd236197597~mX27cGzyE2555325553eusmtrp2K;
 Fri,  3 Jan 2020 12:14:09 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-07-5e0f3011daaa
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FA.83.07950.1103F0E5; Fri,  3
 Jan 2020 12:14:09 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200103121408eusmtip267866366d0b68b73471ed8ed2544d6d0~mX266-F-90409104091eusmtip2d;
 Fri,  3 Jan 2020 12:14:08 +0000 (GMT)
Subject: Re: [PATCH -next] fbdev: omapfb: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3f75dae1-181f-3935-0b1d-40839392226e@samsung.com>
Date: Fri, 3 Jan 2020 13:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904115406.23880-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djP87qCBvxxBivuyVjsu7uP3WLliX8s
 Fle+vmezaF68ns3iRN8HVovLu+awWcxe0s9isXnTVGaLO1+fszhwerQcecvqsXjPSyaPd+fO
 sXvsn7uG3eN+93Emj49vnrB7fN4kF8AexWWTkpqTWZZapG+XwJXxrHcSY8FEzoo/i28yNzCe
 Z+9i5OSQEDCRWL7jAXMXIxeHkMAKRont1xaxQThfGCX+7brLCuF8ZpRYeHY9I0zLmceTWEFs
 IYHljBJTGyQhit4ySvTt6WMCSQgLJEqc2PMarEhEQE2i5dQWsB3MAvcZJeac/84GkmATsJKY
 2L4KbCqvgJ3E7l3XwOIsAioS77ufgB0oKhAh8enBYVaIGkGJkzOfsIDYnALWEsdOnACLMwuI
 S9x6Mp8JwpaX2P52DtgyCYFr7BJ/j+xjhjjbReLSnQ1QXwtLvDq+BcqWkfi/E6QZpGEdo8Tf
 jhdQ3dsZJZZP/scGUWUtcefcLyCbA2iFpsT6XfoQYUeJaTs/sIKEJQT4JG68FYQ4gk9i0rbp
 zBBhXomONiGIajWJDcs2sMGs7dq5knkCo9IsJK/NQvLOLCTvzELYu4CRZRWjeGppcW56arFR
 Xmq5XnFibnFpXrpecn7uJkZgujr97/iXHYy7/iQdYhTgYFTi4U1Q5o8TYk0sK67MPcQowcGs
 JMJbHsgbJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAOj
 TGKR0pWAPTMtK3nMOKK4/I9caGST+H7h8qvoVym8R3ZOX9USZdw+MXSdyyEOhpe+QYZW+z1D
 o/cl9jpMu+bHw8GRpbPQMYkp8/SsP5M0L798PEVWJHar6V7fJb7/Et6530uvffTBtalRftnb
 Z7e879dufFlv/6bGUm6uq6jiicTfGiZTzrUosRRnJBpqMRcVJwIAZg3WEFMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7qCBvxxBkv62S323d3HbrHyxD8W
 iytf37NZNC9ez2Zxou8Dq8XlXXPYLGYv6Wex2LxpKrPFna/PWRw4PVqOvGX1WLznJZPHu3Pn
 2D32z13D7nG/+ziTx8c3T9g9Pm+SC2CP0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2
 j7UyMlXSt7NJSc3JLEst0rdL0Mt41juJsWAiZ8WfxTeZGxjPs3cxcnJICJhInHk8ibWLkYtD
 SGApo0TfxDvMXYwcQAkZiePryyBqhCX+XOtig6h5zSjxZM4lVpCEsECixNF928FsEQE1iZZT
 W5hBipgF7jNKdL/6ywySEBLoY5RYsTMaxGYTsJKY2L6KEcTmFbCT2L3rGhuIzSKgIvG++wnY
 RaICERKHd8yCqhGUODnzCQuIzSlgLXHsxAmwZcwC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kC
 o9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHRue3Yzy07GLve
 BR9iFOBgVOLh5VDkjxNiTSwrrsw9xCjBwawkwlseyBsnxJuSWFmVWpQfX1Sak1p8iNEU6LmJ
 zFKiyfnAxJFXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFxwjIW
 mSWK7ZbeF49/Ym9uCXZPTjrIll5gsm3tl/Nqj0qniSTsPPujLpX512bVJrVKxWi5ljkn84u8
 pnQ9eLR3743Sh4Y1sne2V9hXfLrqKjufY9KZpJSdqXvczE4L1DLEuSxNsb198V/UOqv9jwLO
 Ks786NTzuPaO8pK5r1cdjNvttvNU4wlxJZbijERDLeai4kQAO0/K4+QCAAA=
X-CMS-MailID: 20200103121409eucas1p2ca69ad02ed77474da487db7d0beee52c
X-Msg-Generator: CA
X-RootMTR: 20190904115507epcas1p42d4d5b2f6ee58db0ccf3b1ee27063ac1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904115507epcas1p42d4d5b2f6ee58db0ccf3b1ee27063ac1
References: <CGME20190904115507epcas1p42d4d5b2f6ee58db0ccf3b1ee27063ac1@epcas1p4.samsung.com>
 <20190904115406.23880-1-yuehaibing@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexios.zavras@intel.com, tglx@linutronix.de, linux-omap@vger.kernel.org,
 allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/4/19 1:54 PM, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks, patch queued for v5.6 (also sorry for the delay).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/omap2/omapfb/vrfb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/vrfb.c b/drivers/video/fbdev/omap2/omapfb/vrfb.c
> index 819e0bc..ee0dd4c 100644
> --- a/drivers/video/fbdev/omap2/omapfb/vrfb.c
> +++ b/drivers/video/fbdev/omap2/omapfb/vrfb.c
> @@ -339,9 +339,7 @@ static int __init vrfb_probe(struct platform_device *pdev)
>  	int i;
>  
>  	/* first resource is the register res, the rest are vrfb contexts */
> -
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	vrfb_base = devm_ioremap_resource(&pdev->dev, mem);
> +	vrfb_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vrfb_base))
>  		return PTR_ERR(vrfb_base);
>  
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
