Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85713C8D6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 17:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33AB898F3;
	Wed, 15 Jan 2020 16:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508CE898F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:10:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115161014euoutp0187332625b326d2d008425a81d5aa3a2e~qG0fiGiHV0809608096euoutp01E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:10:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200115161014euoutp0187332625b326d2d008425a81d5aa3a2e~qG0fiGiHV0809608096euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579104614;
 bh=SwsmES8/B7/gtwjkWBPVe1WG06nTczZJgPIYHkwKQt8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=E5jqhAlH1ka7RI76VWMRy7MmYHB4AQwX+ZhbpGpp8FKMKNhVGUddrvIFqnlLeTUQk
 kUclcnnN+yDI/OVADpjQwfrwMjghu2IwW2QHXBJGYfL/UmeLovDRSME+U/+XTiLuod
 /dKUz4E0S0u1sQA0d19N0Ibqb5Ta3lY/fNh8ALFQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115161014eucas1p1e69903f7054ec92d134ad000e451e177~qG0fOYulW3134931349eucas1p12;
 Wed, 15 Jan 2020 16:10:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B9.28.60698.6693F1E5; Wed, 15
 Jan 2020 16:10:14 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200115161014eucas1p12af23923229bcc615b0c24da8af3e01d~qG0e1hR_u2545225452eucas1p1J;
 Wed, 15 Jan 2020 16:10:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115161014eusmtrp28b7f87c1655bb2ccb2176d7d59e8bf2c~qG0e1AcE-2526025260eusmtrp2J;
 Wed, 15 Jan 2020 16:10:14 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-db-5e1f3966a853
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.D3.07950.6693F1E5; Wed, 15
 Jan 2020 16:10:14 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115161013eusmtip1c65aed0da24d6b1aa658b8b69341a52e~qG0elKdGG1743117431eusmtip1H;
 Wed, 15 Jan 2020 16:10:13 +0000 (GMT)
Subject: Re: [PATCH 07/10] video: fbdev: use resource_size
To: Julia Lawall <Julia.Lawall@inria.fr>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <b6cf85ce-895e-cfb0-fc59-c1814d276516@samsung.com>
Date: Wed, 15 Jan 2020 17:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1577900990-8588-8-git-send-email-Julia.Lawall@inria.fr>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87pplvJxBs135C2ufH3PZtG0qp/Z
 YustaYsTfR9YLS7vmsPmwOox6cUhFo/73ceZPD5vkgtgjuKySUnNySxLLdK3S+DK+PVpMVvB
 Ua6KWYe7GRsYD3B0MXJySAiYSNy+O5uli5GLQ0hgBaPEnG0r2SGcL4wSZ5+tZINwPjNKvPox
 lw2m5cXMbmaIxHJGiaNHVzCDJIQE3jJK/NjAA2ILC1hJbNuxmQXEFhHQkFi6cQXYDmaBRkaJ
 WVv2gE1iAyqa2L6KEcTmFbCTeLPhMFicRUBVoqfhNlhcVCBC4tODw6wQNYISJ2c+ARvKKeAq
 8WnyMTCbWUBc4taT+UwQtrzE9rdzwK6TEJjMLnHg9g2os10kHnXsY4GwhSVeHd/CDmHLSPzf
 CdIM0rCOUeJvxwuo7u2MEssn/4Pqtpa4c+4XkM0BtEJTYv0ufYiwo8Tx6wcZQcISAnwSN94K
 QhzBJzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaS12YheWcWkndmIexdwMiyilE8
 tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzC5nP53/OsOxn1/kg4xCnAwKvHwZvyRixNiTSwr
 rsw9xCjBwawkwntyhmycEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KL
 YLJMHJxSDYxKmi9n8TIdemM4R/j77974um2rFoTZP7xfy8f8j9ckzWvtugN9++7J3lZjS1q5
 OMVS7M3/XMPVyTIy2Ys2sG85smSN0/2YyXunrshnbN3Vmvpob/pFrv22uXLWCXYxz0qf3pXf
 7StZNmOOfY/3wTtO/7XvsXEvPn8pbcnSiphls7k2nXM/NDVYiaU4I9FQi7moOBEA/dsFPyoD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7pplvJxBl/XsFtc+fqezaJpVT+z
 xdZb0hYn+j6wWlzeNYfNgdVj0otDLB73u48zeXzeJBfAHKVnU5RfWpKqkJFfXGKrFG1oYaRn
 aGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8evTYraCo1wVsw53MzYwHuDoYuTkkBAw
 kXgxs5u5i5GLQ0hgKaPE6ls7gBwOoISMxPH1ZRA1whJ/rnWxQdS8ZpSY+esFC0hCWMBKYtuO
 zWC2iICGxNKNK1hAipgFGhkl+vdsZILouMwocWXCTFaQKjagjontqxhBbF4BO4k3Gw6zgdgs
 AqoSPQ23weKiAhESh3fMgqoRlDg58wnYBk4BV4lPk4+B2cwC6hJ/5l1ihrDFJW49mc8EYctL
 bH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHRtO3Y
 zy07GLveBR9iFOBgVOLhPfBPLk6INbGsuDL3EKMEB7OSCO/JGbJxQrwpiZVVqUX58UWlOanF
 hxhNgZ6byCwlmpwPjPS8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TByc
 Ug2MOv6dlXfV//hMW1780bT8icyM/Uax858IyVzVUxHsvFPyZ370onLmHUpOnrp551Pm5NaV
 /RQQ+rTx4/ENm1bMW+arXffx4YuignKbNtsTCotULp0yNrZ9MvHKRdNTlfafY/vjV7zY6pZ7
 51XIRMaUMwz585XyFZna2517TmXckPUQOtvh7DZZiaU4I9FQi7moOBEAQbOt4LwCAAA=
X-CMS-MailID: 20200115161014eucas1p12af23923229bcc615b0c24da8af3e01d
X-Msg-Generator: CA
X-RootMTR: 20200101182632eucas1p27d81f37ef59ae274ac54316823de212c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200101182632eucas1p27d81f37ef59ae274ac54316823de212c
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
 <CGME20200101182632eucas1p27d81f37ef59ae274ac54316823de212c@eucas1p2.samsung.com>
 <1577900990-8588-8-git-send-email-Julia.Lawall@inria.fr>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/1/20 6:49 PM, Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch queued for v5.6 (with patch summary modified slightly to
reflect that this a change for cg14fb fbdev driver), thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/cg14.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
> index a620b51cf7d0..6a745eb46ca1 100644
> --- a/drivers/video/fbdev/cg14.c
> +++ b/drivers/video/fbdev/cg14.c
> @@ -509,8 +509,7 @@ static int cg14_probe(struct platform_device *op)
>  	if (!par->regs || !par->clut || !par->cursor || !info->screen_base)
>  		goto out_unmap_regs;
>  
> -	is_8mb = (((op->resource[1].end - op->resource[1].start) + 1) ==
> -		  (8 * 1024 * 1024));
> +	is_8mb = (resource_size(&op->resource[1]) == (8 * 1024 * 1024));
>  
>  	BUILD_BUG_ON(sizeof(par->mmap_map) != sizeof(__cg14_mmap_map));
>  		
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
