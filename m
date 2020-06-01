Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A241C1EA4EB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE14D6E09E;
	Mon,  1 Jun 2020 13:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD646E09A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601132526euoutp01bca8f393af2f0d89e13d88ab8e60b71b~Ubl-nLEE72438624386euoutp01r
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200601132526euoutp01bca8f393af2f0d89e13d88ab8e60b71b~Ubl-nLEE72438624386euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591017926;
 bh=TuaZ/FMSRMc8jaoqARGan5ITQcdfWjxe4SBNTWo5W84=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=DbDyAXJRx/pI86p4mKkTuMOqdD9y+GfK0QKmOoom5qQGFOx+dbll27bsumETNR6vn
 YllYMHWn9woW0XdUkTQyabYpdlMd3O0+cg8OsBNXkGgVjG9nhq6qOWDpPpfJIMV+j8
 bhPwPs1nQDQZol5X+6HPX4zyFYa89IVItYbu6dt0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200601132526eucas1p10a9eb9a63d6bf0f09dfb9fce42055f6f~Ubl-cjn_z1281512815eucas1p1c;
 Mon,  1 Jun 2020 13:25:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 01.B6.60698.6C105DE5; Mon,  1
 Jun 2020 14:25:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132526eucas1p1b090b0907493f47fac8c74f475737442~Ubl-N-dhO1280212802eucas1p1n;
 Mon,  1 Jun 2020 13:25:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601132526eusmtrp11a120174b7dbfe1beefc4752a9a4ca16~Ubl-Hpo3J2383923839eusmtrp1F;
 Mon,  1 Jun 2020 13:25:26 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-11-5ed501c64f21
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B1.EB.08375.5C105DE5; Mon,  1
 Jun 2020 14:25:25 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132525eusmtip1e17e94cf11afce4ab69776e4998dca09~Ubl_zrsmn1117511175eusmtip1O;
 Mon,  1 Jun 2020 13:25:25 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: pxafb: Use correct return value for
 pxafb_probe()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <be2f65ba-e26c-fe3f-82d9-d9532db496eb@samsung.com>
Date: Mon, 1 Jun 2020 15:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1590390705-22898-1-git-send-email-yangtiezhu@loongson.cn>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87rHGK/GGbzbK2px5et7NosTfR9Y
 LS7vmsNmMfHXIzaLzYt2sDiwetzvPs7k0di0iMnj8ya5AOYoLpuU1JzMstQifbsErowPvekF
 P9gr3v5sZ2xg3M/WxcjJISFgInFz9UvmLkYuDiGBFYwSJ1dOhXK+MEpcfd7DBFIlJPCZUWLn
 Iw+YjjtvDjNCFC1nlGh/8BHKecsocexwGwtIFZuAlcTE9lWMILawQJjElIunweIiAhoSm+Zs
 YgNpYBZoYZS49PsVK0iCV8BO4tHds2DrWARUJF7/ngTWICoQIfHpwWGoGkGJkzOfgMU5Bdwl
 Nv46DFbPLCAucevJfChbXmL72zlgP0gITGaXWLL7BRPE3S4Ss3ZvYYGwhSVeHd/CDmHLSJye
 3MMC0bCOUeJvxwuo7u2MEssn/4OGk7XEnXO/gGwOoBWaEut36UOEHSXmrJ3OAhKWEOCTuPFW
 EOIIPolJ26YzQ4R5JTrahCCq1SQ2LNvABrO2a+dK5gmMSrOQvDYLyTuzkLwzC2HvAkaWVYzi
 qaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIHJ5fS/4193MO77k3SIUYCDUYmHd8P9K3FCrIll
 xZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFq
 EUyWiYNTqoHxfGfW34WSpXOe76+b5ik748m2pCPs3T+l0mf/aBI72fpwR+6nqXozLkw73RAR
 qaCh/+H+j/OX0qYfeLK28qVV85GeX/YLJ39RlPnq0LhrK+8e1VnNL0IKcrZ3fmaazbnsv3qs
 5XJHtz8lHEflFq2863o07Clbg7LksnneO+p/BTQ0zn4ZLzTFSomlOCPRUIu5qDgRACm8w4wq
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7pHGa/GGeyabGFx5et7NosTfR9Y
 LS7vmsNmMfHXIzaLzYt2sDiwetzvPs7k0di0iMnj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
 PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwPvekFP9gr3v5sZ2xg3M/WxcjJISFg
 InHnzWHGLkYuDiGBpYwSPy+eZe5i5ABKyEgcX18GUSMs8edaFxtEzWtGifVTroA1swlYSUxs
 X8UIYgsLhElMuXiaBcQWEdCQ2DRnE1gDs0ALUMPXBqgNsxglds39A1bFK2An8ejuWSYQm0VA
 ReL170lgcVGBCInDO2YxQtQISpyc+QQszingLrHx12GwemYBdYk/8y4xQ9jiEreezIeKy0ts
 fzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgdG07djP
 zTsYL20MPsQowMGoxMO74f6VOCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYf
 YjQFem4is5Rocj4w0vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBK
 NTAWG2wX3P1HO34Lr4/w/ET+FTNWG5RWrQ3v63vR+USX5ZKxj8KEoxrpJ6am/eZpYQ1y91Z7
 tmNevVzc56Mp+jpVkZzLpcUCUv7kmHq7fDC/dMFjyeJde2oO21ZoGfg9WPAlfN/O/zMnXYh2
 C6tcpSO7m/vhu1Mr/OKyXx+RYfn63OafeeOib55KLMUZiYZazEXFiQC10urivAIAAA==
X-CMS-MailID: 20200601132526eucas1p1b090b0907493f47fac8c74f475737442
X-Msg-Generator: CA
X-RootMTR: 20200525071149eucas1p271b0c64a9d44429978e2099257681b70
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200525071149eucas1p271b0c64a9d44429978e2099257681b70
References: <CGME20200525071149eucas1p271b0c64a9d44429978e2099257681b70@eucas1p2.samsung.com>
 <1590390705-22898-1-git-send-email-yangtiezhu@loongson.cn>
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
Cc: linux-fbdev@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/25/20 9:11 AM, Tiezhu Yang wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/pxafb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index 00b96a7..423331c 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2305,7 +2305,7 @@ static int pxafb_probe(struct platform_device *dev)
>  	fbi->mmio_base = devm_platform_ioremap_resource(dev, 0);
>  	if (IS_ERR(fbi->mmio_base)) {
>  		dev_err(&dev->dev, "failed to get I/O memory\n");
> -		ret = -EBUSY;
> +		ret = PTR_ERR(fbi->mmio_base);
>  		goto failed;
>  	}
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
