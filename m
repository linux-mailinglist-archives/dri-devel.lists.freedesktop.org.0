Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C52610D8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A461F6E7EA;
	Tue,  8 Sep 2020 11:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109466E7EA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113741euoutp0147fcd4fdf60351043a680ac670472874~yy-LooMjl0798607986euoutp01W
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200908113741euoutp0147fcd4fdf60351043a680ac670472874~yy-LooMjl0798607986euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565061;
 bh=QuitxZQBOIQ19NncwIG/YnTvX6FhNS3m7J4VbZY5Bt0=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=NRCM9Lbih/VTmkZ3FE8ZJs8IkxsNhlrAJDrHK/az56zZenk9Kx7QSSfgbLhusVMc+
 hlwLkIzuAfh14RMcNBAAFxeiAy/nTwO6wExAgh2JH0F4lwfAj4Dd+vhxliYqC9FoQY
 FZf0eGnF//dsif9ala31OmhTaMgpcGnR4psytbh4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113741eucas1p1cfc35d4e53cbf9a9aab4ff993eb1e7f9~yy-Lf68pq0524005240eucas1p10;
 Tue,  8 Sep 2020 11:37:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 12.65.05997.50D675F5; Tue,  8
 Sep 2020 12:37:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113741eucas1p21d6fb2c42f863d634454ed326af248a9~yy-LHidDE1615916159eucas1p2z;
 Tue,  8 Sep 2020 11:37:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113741eusmtrp272ff657bcf89c57b5e34f4456e4f91af~yy-LG9axG3046530465eusmtrp2p;
 Tue,  8 Sep 2020 11:37:41 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-01-5f576d051c5e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.C4.06017.50D675F5; Tue,  8
 Sep 2020 12:37:41 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113740eusmtip1f9fe9174bcdd4e4fecd7f30db5724f5f~yy-KmQNB20553405534eusmtip1B;
 Tue,  8 Sep 2020 11:37:40 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] coccinelle: api: fix kobj_to_dev.cocci warnings
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <9e553578-a8dd-847e-0d19-8c34ce4bf1bc@samsung.com>
Date: Tue, 8 Sep 2020 13:37:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2008262252270.2522@hadrien>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djPc7qsueHxBm+a1C0u3v/GYnHl63s2
 iyundjNaNK3qZ7Y4232N0eJE3wdWi8u75rA5sHtMenGIxePJlelMHt2z/7F43O8+zuTxdGoX
 m8fnTXIBbFFcNimpOZllqUX6dglcGTMfT2csOMpXsfjPLLYGxjfcXYycHBICJhJ/v19m7mLk
 4hASWMEo0Xd0FQuE84VR4vz0JiYI5zOjxOLpdxm7GDnAWp5dlYaIL2eUePtmDiuE85ZR4sX6
 5Swgc9kErCQmtq9iBLGFBVwkLs1YBNYsIqAhsfmpMEg9s8BxRok9Wy+B1fAK2En8fzKLFcRm
 EVCRmLWphw3EFhWIkPj04DArRI2gxMmZT1hA5nAK2Eqs35oKEmYWEJe49WQ+E4QtL7H97Ryw
 dyQEDrFLtCx5yQbxp4vE7BfbmSFsYYlXx7ewQ9gyEv93zmeCaFjHKPG34wVU93ZGieWT/0F1
 W0vcOfeLDWQzs4CmxPpd+hBhR4klL0HqQaHCJ3HjrSDEEXwSk7ZNhwrzSnS0CUFUq0lsWLaB
 DWZt186VzBMYlWYh+WwWkndmIXlnFsLeBYwsqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3
 MQKT0el/x7/sYNz1J+kQowAHoxIP7wevsHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRbl
 xxeV5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cDoZckrpyy15rap4MU9mstE
 YldIqu6PcNv/ffGjZdWllqqfFZle6fmzFGot9y/zP3tqkdb8TsHruz/EvnjM8GbPPqfb7iXP
 i2tXX9flkuLu804s/DonutzG7uScIKGwb8yyNs3/GYwTVpycouC82f2DS4pk6CzTm7VV6t/f
 //1Sqc1YxBjc7KPEUpyRaKjFXFScCACLkr9TQgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xu7qsueHxBu83M1tcvP+NxeLK1/ds
 FldO7Wa0aFrVz2xxtvsao8WJvg+sFpd3zWFzYPeY9OIQi8eTK9OZPLpn/2PxuN99nMnj6dQu
 No/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov0
 7RL0MmY+ns5YcJSvYvGfWWwNjG+4uxg5OCQETCSeXZXuYuTiEBJYyijxeNtKVoi4jMTx9WVd
 jJxAprDEn2tdbBA1rxklTuw/zQSSYBOwkpjYvooRxBYWcJG4NGMRI0iviICGxOanwiD1zAJH
 GSUurJvHBNE8gVFi+r3nLCANvAJ2Ev+fzGIFsVkEVCRmbephA7FFBSIkDu+YxQhRIyhxcuYT
 FpChnAK2Euu3poKEmQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGoVlIumchaZmFpGUWkpYF
 jCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAmNv27GfW3Ywdr0LPsQowMGoxMP7wSssXog1
 say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BfpvILCWanA9MC3kl8YamhuYW
 lobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgjSiaUdzSxfenfaLd9zkRz/hYG
 AYP6X3MPCwvH/9lwU06x3+DKpYzZN6JPz//8RmrljLu9W859r32hWffz/KQbS6O+Vpwrzihw
 +qAeai4U+Frr/578asW/f72CWNoyZz6vdC9xy1DT/Fnmvvfi6nO9qlZXF29X2OtamLlYUV9e
 Uqn81PJanXNKLMUZiYZazEXFiQAjBPRy0wIAAA==
X-CMS-MailID: 20200908113741eucas1p21d6fb2c42f863d634454ed326af248a9
X-Msg-Generator: CA
X-RootMTR: 20200826205412eucas1p16c748e9d73f4cd924aae1d6386ab450c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826205412eucas1p16c748e9d73f4cd924aae1d6386ab450c
References: <CGME20200826205412eucas1p16c748e9d73f4cd924aae1d6386ab450c@eucas1p1.samsung.com>
 <alpine.DEB.2.22.394.2008262252270.2522@hadrien>
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
Cc: linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org,
 Bernie Thompson <bernie@plugable.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/26/20 10:54 PM, Julia Lawall wrote:
> From: kernel test robot <lkp@intel.com>
> 
>  Use kobj_to_dev() instead of container_of()
> 
> Generated by: scripts/coccinelle/api/kobj_to_dev.cocci
> 
> Fixes: a2fc3718bc22 ("coccinelle: api: add kobj_to_dev.cocci script")
> CC: Denis Efremov <efremov@linux.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@inria.fr>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlawall/linux.git for-5.10
> head:   a2fc3718bc22e85378085568ecc5765fb28cabce
> commit: a2fc3718bc22e85378085568ecc5765fb28cabce [3/3] coccinelle: api: add kobj_to_dev.cocci script
> :::::: branch date: 5 days ago
> :::::: commit date: 5 days ago
> 
>  udlfb.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -1457,7 +1457,7 @@ static ssize_t edid_show(
>  			struct file *filp,
>  			struct kobject *kobj, struct bin_attribute *a,
>  			 char *buf, loff_t off, size_t count) {
> -	struct device *fbdev = container_of(kobj, struct device, kobj);
> +	struct device *fbdev = kobj_to_dev(kobj);
>  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
>  	struct dlfb_data *dlfb = fb_info->par;
> 
> @@ -1479,7 +1479,7 @@ static ssize_t edid_store(
>  			struct file *filp,
>  			struct kobject *kobj, struct bin_attribute *a,
>  			char *src, loff_t src_off, size_t src_size) {
> -	struct device *fbdev = container_of(kobj, struct device, kobj);
> +	struct device *fbdev = kobj_to_dev(kobj);
>  	struct fb_info *fb_info = dev_get_drvdata(fbdev);
>  	struct dlfb_data *dlfb = fb_info->par;
>  	int ret;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
