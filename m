Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD81ADF09
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9386EC1C;
	Fri, 17 Apr 2020 14:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6286EC20
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140825euoutp025f0e760c83ec44b7425fbbdd02784333~GoJq1rriJ1553015530euoutp02x
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140825euoutp025f0e760c83ec44b7425fbbdd02784333~GoJq1rriJ1553015530euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132505;
 bh=R7Ur/56yFcr7YXkME4bM8JQPVy2Q7jo8CruJdpZeLM4=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=GtaNy2YZJGC9iO/7POSj8abHzal4DxGsT6o5mxuYAv95apR+wq2xoYB1Y86a4c+IU
 4YoF9YpFohRiENRHjavh9X8dNyfBiSZidEQrPyCocx/H4Rvaao5MJqNlw2KNDTRmgg
 NCMmwassC60ZIRAjwVkOfZCRvw4xGB5k9mwFPVu0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140824eucas1p15c9abdeb569eb28faa603877d192d210~GoJqqhz123049630496eucas1p1I;
 Fri, 17 Apr 2020 14:08:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 0F.5C.61286.858B99E5; Fri, 17
 Apr 2020 15:08:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140824eucas1p1201a34566f7ad6b5e6a931423af26e0a~GoJqE_BH82643526435eucas1p1m;
 Fri, 17 Apr 2020 14:08:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140824eusmtrp11b76d121f2c30c5f1f325a04ee2368ae~GoJqEc7l82228222282eusmtrp1h;
 Fri, 17 Apr 2020 14:08:24 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-8f-5e99b858fa29
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 35.D2.08375.858B99E5; Fri, 17
 Apr 2020 15:08:24 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140823eusmtip2881adae30a45d44627b3212c29464aa4~GoJp1PAmi2541125411eusmtip2U;
 Fri, 17 Apr 2020 14:08:23 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4] video: fbdev: vesafb: add missed release_region
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <0a42a3d3-fd71-2334-8c19-9455c0971c6f@samsung.com>
Date: Fri, 17 Apr 2020 16:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200329145839.20076-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOd2IHTPjDObtMrC48vU9m8XsQy+Z
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5issmJTUnsyy1SN8ugStje8N/5oI2iYr1
 XX9ZGhj7hbsYOTkkBEwkzn1ex9jFyMUhJLCCUeLm/NtMEM4XRomLC/6yQDifGSUOHdzDAtNy
 tLGXGSKxnFFi792NUC1vGSXuHr7JBFLFJmAlMbF9FdBgDg5hAXeJRT+rQMIiAuoSn3ftZAex
 mQUSJE4vuscCUsIrYCfxaYM0SJhFQFXi0vbDbCC2qECExKcHh1lBbF4BQYmTM5+A3cAJNL3l
 +QYWiDHiEreezGeCsOUltr+dA3abhEA3u8TV7r1g8yUEXCQ2rg+DuF9Y4tXxLewQtozE6ck9
 LBD16xgl/na8gGreziixfPI/Nogqa4k7536xgQxiFtCUWL9LH2Kmo8TmB8EQJp/EjbeCECfw
 SUzaNp0ZIswr0dEmBDFDTWLDsg1sMFu7dq5knsCoNAvJY7OQPDMLyTOzENYuYGRZxSieWlqc
 m55abJiXWq5XnJhbXJqXrpecn7uJEZhMTv87/mkH49dLSYcYBTgYlXh4DXpmxgmxJpYVV+Ye
 YpTgYFYS4T3oBhTiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomD
 U6qBccqtbaW975I55h35cetRBtPMgJfWE3OsYspvvOafU68bNeNM+BJ5c4Flsd3BnE81eaSn
 sG+5Z9hjoxX+TTBboPPwKa7MRx1epxfMdDhvMEtG/PAaX88D+e4+dpuytbRYlgfoelj8+Gkf
 0T8h8rlT+bzd9a6iOrWcdb8sDp0r3PglN8Hl+s9FSizFGYmGWsxFxYkAitB3tyIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7oRO2bGGUxcy21x5et7NovZh14y
 W5zo+8BqcXnXHDYHFo+ds+6ye9zvPs7k8XmTXABzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
 kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G9ob/zAVtEhXru/6yNDD2C3cxcnJICJhIHG3s
 Ze5i5OIQEljKKHFj5i/2LkYOoISMxPH1ZRA1whJ/rnWxQdS8ZpSYdHMVI0iCTcBKYmI7iM3B
 ISzgLrHoZxVIWERAXeLzrp1gY5gFEiSezUuBaO1llNj45ipYnFfATuLTBmmQchYBVYlL2w+z
 gdiiAhESh3fMApvOKyAocXLmExYQmxNoU8vzDWA2M9D4P/MuMUPY4hK3nsxngrDlJba/ncM8
 gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA6Nl27OfmHYyX
 NgYfYhTgYFTi4TXomRknxJpYVlyZe4hRgoNZSYT3oBtQiDclsbIqtSg/vqg0J7X4EKMp0HMT
 maVEk/OBkZ1XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHR9+LS
 ZQW8nGsDVh1byb1qf0Djwws1i46sK54wPeP5nzUz9Fdabl+qveJc2G6+pQFq+eW+oV/+JBpt
 8NcT1l98X6s7izuq3PzIvRXnPiZlPrxdzsdSs7nq+HYpxafHAtZwcvzcFHlXOq5/0d+VS2x8
 n5X6vLMpXTtv6sStG1a+15CZ+drlurRZqRJLcUaioRZzUXEiABoQjDy0AgAA
X-CMS-MailID: 20200417140824eucas1p1201a34566f7ad6b5e6a931423af26e0a
X-Msg-Generator: CA
X-RootMTR: 20200329145851eucas1p13777aa6188fc6886d150d9834dd0b257
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200329145851eucas1p13777aa6188fc6886d150d9834dd0b257
References: <CGME20200329145851eucas1p13777aa6188fc6886d150d9834dd0b257@eucas1p1.samsung.com>
 <20200329145839.20076-1-hslester96@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/29/20 4:58 PM, Chuhong Yuan wrote:
> The driver forgets to free the I/O region in remove and probe
> failure.
> Add the missed calls to fix it.
> 
> Since the success of request_region() is optional, add the "region" field
> in vesafb_par to represent whether request_region() succeeds.
> Then only call release_region() when "region" is not null.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> Changes in v4:
>   - Add a field in vesafb_par to represent whether request_region() succeeds.
>   - Only call release_region() when request_region() succeeds.
>   - Adjust the order in the error handler of probe.
>   - Modify commit message.
> 
>  drivers/video/fbdev/vesafb.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index a1fe24ea869b..df6de5a9dd4c 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -32,6 +32,7 @@
>  struct vesafb_par {
>  	u32 pseudo_palette[256];
>  	int wc_cookie;
> +	struct resource *region;
>  };
>  
>  static struct fb_var_screeninfo vesafb_defined = {
> @@ -411,7 +412,7 @@ static int vesafb_probe(struct platform_device *dev)
>  
>  	/* request failure does not faze us, as vgacon probably has this
>  	 * region already (FIXME) */
> -	request_region(0x3c0, 32, "vesafb");
> +	par->region = request_region(0x3c0, 32, "vesafb");
>  
>  	if (mtrr == 3) {
>  		unsigned int temp_size = size_total;
> @@ -439,7 +440,7 @@ static int vesafb_probe(struct platform_device *dev)
>  		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
>  			vesafb_fix.smem_len, vesafb_fix.smem_start);
>  		err = -EIO;
> -		goto err;
> +		goto err_release_region;
>  	}
>  
>  	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
> @@ -458,19 +459,22 @@ static int vesafb_probe(struct platform_device *dev)
>  
>  	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>  		err = -ENOMEM;
> -		goto err;
> +		goto err_release_region;
>  	}
>  	if (register_framebuffer(info)<0) {
>  		err = -EINVAL;
>  		fb_dealloc_cmap(&info->cmap);
> -		goto err;
> +		goto err_release_region;
>  	}
>  	fb_info(info, "%s frame buffer device\n", info->fix.id);
>  	return 0;
> -err:
> +err_release_region:
>  	arch_phys_wc_del(par->wc_cookie);
>  	if (info->screen_base)
>  		iounmap(info->screen_base);
> +	if (par->region)
> +		release_region(0x3c0, 32);
> +err:
>  	framebuffer_release(info);
>  	release_mem_region(vesafb_fix.smem_start, size_total);
>  	return err;
> @@ -481,6 +485,8 @@ static int vesafb_remove(struct platform_device *pdev)
>  	struct fb_info *info = platform_get_drvdata(pdev);
>  
>  	unregister_framebuffer(info);
> +	if (((struct vesafb_par *)(info->par))->region)
> +		release_region(0x3c0, 32);
>  	framebuffer_release(info);
>  
>  	return 0;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
