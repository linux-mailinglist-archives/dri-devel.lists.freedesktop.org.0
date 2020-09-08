Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B42610DD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98C6E7FE;
	Tue,  8 Sep 2020 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70216E7FE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:38:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113759euoutp0282e63258e6c418005dcc594f0f8d94c3~yy-cCbWWE0041600416euoutp02A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113759euoutp0282e63258e6c418005dcc594f0f8d94c3~yy-cCbWWE0041600416euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565079;
 bh=0s4Ik3+RTnNQIV6PDJ+CNOxzRLFQDzKVLXECY7JWkyM=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=Ci26dG2obB34PGBbpcoK3/8aXkWZccE2Q/NYKd9rxM/dP88l4hcJtM2441U11gcG+
 T4Gn8XsB0ZutjBOOcG1QFvWK+iQ86H08q5XaGMNJQdoJaiaOSVq0ul5/+zr9qNmKC0
 zZkubkZUIZJ14tCxrhmI3RprBLZ1cFyyFXcVN/4Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113758eucas1p1f922c5bbb2463f540d70f4e219a8362c~yy-bULu0c1732217322eucas1p1K;
 Tue,  8 Sep 2020 11:37:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D5.6E.06456.61D675F5; Tue,  8
 Sep 2020 12:37:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113758eucas1p29aad7c57574221fd154e74662a3bc75d~yy-a6Ng_02679626796eucas1p23;
 Tue,  8 Sep 2020 11:37:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113758eusmtrp11702a45991d6c386cce0918636f8b8e4~yy-a5eimt2072320723eusmtrp1K;
 Tue,  8 Sep 2020 11:37:58 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-43-5f576d16396f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.E1.06314.61D675F5; Tue,  8
 Sep 2020 12:37:58 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113757eusmtip2ecc970bf5132f075feb3c4300f5e357e~yy-aUvAui1663016630eusmtip2e;
 Tue,  8 Sep 2020 11:37:57 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade
 and fix-ups.
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <9798158d-ef29-e5a4-c792-fd51ba64b91b@samsung.com>
Date: Tue, 8 Sep 2020 13:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zk7O44mn2ttL7MSRhRJWVLRqcTK+nGQqP6YXShbdZiiW7I5
 SxHUylK7YKlJa6aJmVo5MfFaBCvTsK20K2lO0pWZy7GKtEjzdJT893zP5X3fBz6akPeJ1XSc
 IYkzGrQJGkpKNjwedy5X6qNjVrY6NIz3RBbBlJ+IZTJdXYh5+WOUYoaf3qGYjgteMZM7MEQy
 L1qsFHO/qELMjLdcI5me3/5MU2+OiCm/NyreJGObLe8lbGmdmW2wvybZcyOnxGxddQ7FPii+
 LWFdZ9tF7O+xfMSeP/mVYr/VLdwp3SsNO8IlxCVzxhXhB6WxnoEPosSRwOMFdhuZgcoUuciP
 Brwa2u67UC6S0nJcieCn1UsJj+8IPr90TD++IfDmjUtmIv23aiSCcBNBz6lCES/IsQdBTU8A
 jym8Hi6eqZ6aS9Nz8T4o7FLztAIvg+42i4jPEriPgKL+ZwQvyHA4vOooo3hM4kUw9thK8nge
 3g2+/odiwRMAT64MkvxMvym/79ICniawCt4NlogEHASNHivBzwecQ0NWhw0JR2+Fy1cd0wXm
 wnB7/TSeD53550ghUIPgT/bQdLoRwc38CUpwbYBe5y+K30zgpWBrWSHQm6HyyY1/JQH7w1tP
 gHCEP1xqKCIEWgbZp+WCezHUVtRSM2tzm6uIPKSxzGpmmVXHMquO5f/eUkRWIxVnNul1nCnU
 wB0LMWn1JrNBF3L4qL4OTf26zol2XxP60X3IjjCNNHNk3shdMXKxNtmUorcjoAmNQhbh6Dwg
 lx3RpqRyxqMxRnMCZ7KjQJrUqGSryj7vl2OdNomL57hEzjijimg/dQZaU79tY9BYnmvgj84d
 /FEd5yqJvtt3YOFklM2xhxt2BkWnOzIfnYyMf7NamZzlS6rIq5ImNp13y9MG20LtT8O/VJX0
 hj5PmySXdDW2Br/J7vbumCweK98y/1Mrjq9kAwqDwraoIppfX1+nWevcHpXq3r1HYX6gLIAR
 pTvsco4rXUOaYrWhwYTRpP0LxD5Yr3EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsVy+t/xe7piueHxBjuOsVl8aGpltljSlGHR
 eP8io8WVr+/ZLF6dWctmcaLvA6tF1+MXLBaXd81hs9g7fRmrxc9d81gsbv/ms9hxp5PJYsme
 96wOvB47Z91l91iwqdRj26FrLB49b1pYPTat6mTz2D93DbvH/e7jTB6/f0xm9Ohtfsfm8XmT
 XABXlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G
 28ePmAreSFdMObSepYFxkUgXIyeHhICJxIPV69i7GLk4hASWMkqsubqQtYuRAyghI3F8fRlE
 jbDEn2tdbBA1rxklGo5NZQRJsAlYSUxsX8UIUi8sEC0x9aIUSFhEQEfi0tFZTCD1zAIPmCUO
 vHjFDNE8kVFi34SNLCBVvAJ2EldPLGIDsVkEVCR+HJsDFhcViJA4vGMWI0SNoMTJmU9YQBZw
 AtV/miQLEmYWUJf4M+8SM4QtLnHryXwmCFteYvvbOcwTGIVmIemehaRlFpKWWUhaFjCyrGIU
 SS0tzk3PLTbUK07MLS7NS9dLzs/dxAiM7W3Hfm7ewXhpY/AhRgEORiUe3g9eYfFCrIllxZW5
 hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCvTbRGYp0eR8YNrJK4k3NDU0t7A0NDc2
 NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAGDfn++vtAsv3ZUzZ3DNtjUqo0xeBBVWz
 lT1srvYnZ0TfmTrvxKqZBuHpDHrfzLKE9996d6puAqc0e+G/j7t+9Tm/0b3/0/j9tjMi5uLm
 U06/4f+pHxwx7X6nou0DPYYp/D8uLpLWu7yNU/J/29U5irO49suyL1/KHP/k57Elz9qznt9d
 Pf2B13olluKMREMt5qLiRAClTHXlAwMAAA==
X-CMS-MailID: 20200908113758eucas1p29aad7c57574221fd154e74662a3bc75d
X-Msg-Generator: CA
X-RootMTR: 20200907070432eucas1p27ce44eec5f3eaf3644c868c7a965ee74
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200907070432eucas1p27ce44eec5f3eaf3644c868c7a965ee74
References: <CGME20200907070432eucas1p27ce44eec5f3eaf3644c868c7a965ee74@eucas1p2.samsung.com>
 <20200907070221.29938-1-vaibhavgupta40@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/7/20 9:02 AM, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management. 
> 
> The original goal of the patch series is to upgrade the power management
> framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
> and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
> redundant. This was introduced in the commit
> 42ddb453a0cd ("radeon: Conditionally compile PM code").
> 
> ------------
> 
> Before 42ddb453a0cd:
> $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> 
> Based on output in terminal:
> 
> 547:#ifdef CONFIG_PM
>        |-- 959:#ifdef CONFIG_PPC_PMAC
>        |-- 972:#endif
>        |-- 1291:#ifdef CONFIG_PPC_OF
>        |-- 1301:#endif /* CONFIG_PPC_OF */
>        |-- 1943:#ifdef CONFIG_PPC_OF
>                    |-- 2206:#if 0 /* Not ready yet */
>                    |-- 2508:#endif /* 0 */
>        |-- 2510:#endif /* CONFIG_PPC_OF */
>        |-- 2648:#ifdef CONFIG_PPC_PMAC
>        |-- 2654:#endif /* CONFIG_PPC_PMAC */
>        |-- 2768:#ifdef CONFIG_PPC_PMAC
>        |-- 2774:#endif /* CONFIG_PPC_PMAC */
>        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
>        |-- 2801:#endif /* CONFIG_PPC_OF */
> 2803:#endif /* CONFIG_PM */
> 
> ------------
> 
> After 42ddb453a0cd:
> $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> 
> Based on output in terminal:
> 
> 547:#ifdef CONFIG_PM
>        |-- 959:#ifdef CONFIG_PPC_PMAC
>        |-- 972:#endif
>        |-- 1291:#ifdef CONFIG_PPC_OF
>        |-- 1301:#endif /* CONFIG_PPC_OF */
>        |-- 1430:#if defined(CONFIG_PM)
>                    |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
>                    |-- 1944:#endif
>                    |-- 1946:#ifdef CONFIG_PPC_OF
>                                |-- 1947:#ifdef CONFIG_PPC_PMAC
>                                |-- 2208:#endif
>                    |-- 2209:#endif
>                    |-- 2211:#if 0 /* Not ready yet */
>                    |-- 2513:#endif /* 0 */
>        |-- 2515:#endif /* CONFIG_PPC_OF */
>        |-- 2653:#ifdef CONFIG_PPC_PMAC
>        |-- 2659:#endif /* CONFIG_PPC_PMAC */
>        |-- 2773:#ifdef CONFIG_PPC_PMAC
>        |-- 2779:#endif /* CONFIG_PPC_PMAC */
>        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
>        |-- 2806:#endif /* CONFIG_PPC_OF */
> 2808:#endif /* CONFIG_PM */
> 
> ------------
> 
> This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)
> 
> The patch-series fixes it along with PM upgrade.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> Vaibhav Gupta (2):
>   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
>   fbdev: radeonfb:use generic power management
> 
>  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
>  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
>  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
>  3 files changed, 35 insertions(+), 16 deletions(-)

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
