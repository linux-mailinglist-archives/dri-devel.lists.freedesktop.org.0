Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E421B86F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F106EC5F;
	Fri, 10 Jul 2020 14:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792E36EC71
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:24:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142402euoutp02472fcab1827a9422452dec2e23f9261c~gajSaL3Vs0738007380euoutp02f
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:24:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200710142402euoutp02472fcab1827a9422452dec2e23f9261c~gajSaL3Vs0738007380euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594391042;
 bh=l4VBuZvttMg9X1rfHnqvoDtZuYsXdOmFYOnhfYffc90=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=pBitfaOfJvFT/H15szQ+oNtjo19lpzxtjAsDxaewp6a9rrG1esC9sIUeMum0odQGN
 DoqvRgF451nIUaKSJJWTPbpm4Jz1V2jyvDbx9zJxPsV64j+031L0dsVsvIP9IKVhUr
 PILlyddTLKHgzoC4Zjx3Ulc+wuLJ7zi7nNw/TENQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200710142401eucas1p122911df0f80e22f29983dcb2770ee682~gajSB78Qw0594505945eucas1p1a;
 Fri, 10 Jul 2020 14:24:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.DE.06318.10A780F5; Fri, 10
 Jul 2020 15:24:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200710142401eucas1p2e485a1a728dafeee04170cdcdff98402~gajRVrIO62124221242eucas1p2r;
 Fri, 10 Jul 2020 14:24:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200710142401eusmtrp293ccb06dff50233137963dce4ff2e2e1~gajRVCl_01267512675eusmtrp2A;
 Fri, 10 Jul 2020 14:24:01 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-50-5f087a01949e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 69.71.06017.00A780F5; Fri, 10
 Jul 2020 15:24:01 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142400eusmtip154c098a924e20c1290d928662ad67b81~gajQzr7663244132441eusmtip1a;
 Fri, 10 Jul 2020 14:24:00 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: da8xx-fb: go to proper label on error handling
 paths in probe
To: Evgeny Novikov <novikov@ispras.ru>
Message-ID: <8f2d2497-2fd3-f3db-32b6-f74736b1ea2e@samsung.com>
Date: Fri, 10 Jul 2020 16:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200702160540.24546-1-novikov@ispras.ru>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjld+/d3d1q8nMafiwxGmkYOAsLLxVSEbh/tAwK6aHNvKmk03bV
 mkgtSfPRSyU0MZoN1CJ109C0paXUssegspBypfbUJVY+erpq3kn+d75zzsd3DnwMKe8RKZgU
 bSan02pSlbSUar37wx6Ccpj4laVFIezkhfsUWzPkINm+qXGatQ44EVtXUkyx905/FrFPO6pp
 1tRpELNdp8zEBol6vD9frL45baTUJusIoa50nUPqAeeMSP26xEaobf1thHqiOWArs1O6PpFL
 TcnmdKERe6XJNvtLUUbbgsMFTsqAaiTFSMIAXg19hhGyGEkZOa5HMGy6QQnDJILa+8cIYZhA
 8KXITM2t1BobPCt1CJ4Pv/G4xhDUX/9Gul00XgulJ64gN/bBu8DyzjnL++IgMOT3zt4gsZGA
 X45psVuQ4QhwlVr/CQxD4UBwOlLd9CIcC18He0SCxRt6z7+dTSHB4WBvqSDcmMR+8OLtRQ9e
 Am1j1aSQ9JUYqlv3C3gztEwaxAL2gVHbNQ/2hz/tF2cLAG5EMFP4kRSGNgR15S5acK2DAftP
 2h2OxMHQ1BEq0BuhcLqSdNOAvaB/zFvI4AVlrRUeWgaFBXLBHQTmWjM9d7a4/TJ5Fimr5jWr
 mtemal6bqv93jYi6gvy4LD4tiePDtNwhFa9J47O0Sap96WnN6N9rPXDZpq6jzt8J3QgzSLlQ
 ZtQw8XKRJpvXp3UjYEilr2zTowdxclmiRp/D6dLjdVmpHN+NFjOU0k8WdmlkjxwnaTK5AxyX
 wenmVIKRKAwoPDbg6ERr5LMMxpG3pffy1cC4qRjrp+NJ0fV21eTzHEXU9+3R4zmbRXrVji4x
 H/lZdicuuONjwrZRMY0VLiJG5dPU+MaUvEbv35A7bfHODZHn1Q5BdGLUsvBbD5uuNR+5bVlO
 v3zyPqvPUb40UCF5fHD9IcvgmewSbddu35MfypQUn6xZtYLU8Zq/qM740VYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xu7qMVRzxBr+OMVp8mXuKxWLhw7vM
 Fle+vmez2HPnNaPF8u4uFosTfR9YLS7vmsNmsXhfA7vF/t4NTA6cHu9vtLJ77P22gMVj8Z6X
 TB4z/k1l9Ljz+i+rx/3u40wex29sZ/L4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
 xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+P4udusBdu5K9peszQwLuTsYuTkkBAwkVi2YC1z
 FyMXh5DAUkaJ53NvMXUxcgAlZCSOry+DqBGW+HOtiw2i5jWjxN8jX9lAEmwCVhIT21cxgtjC
 AtESG5++ZgaxRQTUJBpaT7KANDALLGCSWLVvKQtEdxejxNUZC8C6eQXsJP5N3MMCso1FQFXi
 9d0ckLCoQITE4R2zGCFKBCVOznzCAmJzCphLnNs8nQnEZhZQl/gz7xIzhC0ucevJfKi4vMT2
 t3OYJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGKXbjv3c
 soOx613wIUYBDkYlHt4FiRzxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7E
 aAr020RmKdHkfGACySuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnV
 wMjr4qxe8X7m7DydT/dEj+V7XglSvHDu89uicomELQeWSKhvWNs/79627BvXjj4911Tn0N96
 7Etfs6lU9+YiuRUClqcr4iYeOfEl9Fgu6wvbfOFf7R57f/zf8ruC0cf54kSjjLWchjGnuH66
 dpv8D11rW341zuqjP+OkzGMzrIPi/E9fjveq3aXEUpyRaKjFXFScCADoZLw96AIAAA==
X-CMS-MailID: 20200710142401eucas1p2e485a1a728dafeee04170cdcdff98402
X-Msg-Generator: CA
X-RootMTR: 20200702160546eucas1p1b722eb071cdab13a7bfd47bd98a7d670
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702160546eucas1p1b722eb071cdab13a7bfd47bd98a7d670
References: <CGME20200702160546eucas1p1b722eb071cdab13a7bfd47bd98a7d670@eucas1p1.samsung.com>
 <20200702160540.24546-1-novikov@ispras.ru>
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
Cc: ldv-project@linuxtesting.org, linux-fbdev@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/2/20 6:05 PM, Evgeny Novikov wrote:
> fb_probe() can successfully allocate a new frame buffer, but then fail
> to perform some operations with regulator. In these cases fb_probe()
> goes to label err_pm_runtime_disable where the frame buffer is not
> released. The patch makes fb_probe() to go to label err_release_fb on
> corresponding error handling paths.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/da8xx-fb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
> index 73c3c4c8cc12..e38c0e3f9c61 100644
> --- a/drivers/video/fbdev/da8xx-fb.c
> +++ b/drivers/video/fbdev/da8xx-fb.c
> @@ -1402,14 +1402,14 @@ static int fb_probe(struct platform_device *device)
>  	if (IS_ERR(par->lcd_supply)) {
>  		if (PTR_ERR(par->lcd_supply) == -EPROBE_DEFER) {
>  			ret = -EPROBE_DEFER;
> -			goto err_pm_runtime_disable;
> +			goto err_release_fb;
>  		}
>  
>  		par->lcd_supply = NULL;
>  	} else {
>  		ret = regulator_enable(par->lcd_supply);
>  		if (ret)
> -			goto err_pm_runtime_disable;
> +			goto err_release_fb;
>  	}
>  
>  	fb_videomode_to_var(&da8xx_fb_var, lcdc_info);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
