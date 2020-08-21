Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF824D699
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 15:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9416E140;
	Fri, 21 Aug 2020 13:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1E26E140
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:52:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200821135202euoutp01e997bc0ca9a7eb935cf2f8a6d4e7307b~tTNWNHbV-0851508515euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:52:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200821135202euoutp01e997bc0ca9a7eb935cf2f8a6d4e7307b~tTNWNHbV-0851508515euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598017922;
 bh=xSyw6j8uhqFc0rId8dLokmjX37Nhx2OesuMasUQmfDY=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=uweIq3LIubz94Hapmdt/GczZtE2EbZXtPCOadJuvWGR+gVO1hPxcU6K5KYqWwVyr5
 ZXG4raJ2BXA3HeUeTn10op3/NMmPIAp7fo3JAE5/g+1jW5inhPYmacAMRnhULeLMHg
 OMA/Qb6y5Ht5ypES5NTnc8JrVE0yeOEVBHxxIicE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200821135202eucas1p149727e705b4925a47a08bdc8b9ca3a13~tTNWHo1P31675816758eucas1p1s;
 Fri, 21 Aug 2020 13:52:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4D.74.06318.281DF3F5; Fri, 21
 Aug 2020 14:52:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200821135202eucas1p1dc2de0fb3e687899859e41787357e199~tTNV2G6as0667006670eucas1p1a;
 Fri, 21 Aug 2020 13:52:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200821135202eusmtrp2d3a7cde28c105c020cf66d27e5556562~tTNV1a6xY0859608596eusmtrp2I;
 Fri, 21 Aug 2020 13:52:02 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-59-5f3fd182afa8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C6.D9.06314.281DF3F5; Fri, 21
 Aug 2020 14:52:02 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200821135202eusmtip167e50593caedc04e8f3336c6ec977351~tTNVdBehL2857328573eusmtip1d;
 Fri, 21 Aug 2020 13:52:02 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 00/41] spi / fbdev / cpufreq / usb / mmc / hwmon /
 ARM: Prepare for multiplatform S3C
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <7caa287e-5e02-95d1-0397-5ae74e3138a1@samsung.com>
Date: Fri, 21 Aug 2020 15:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200820155913.GA21395@kozik-lap>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7pNF+3jDRZ/07b4O+kYu8WVr+/Z
 LM6f38BusenxNVaLE30fWC0u75rDZjHj/D4mi0NT9zI6cHhcvnaR2eP3r0mMHptWdbJ53O8+
 zuSxeUm9x+dNcgFsUVw2Kak5mWWpRfp2CVwZ7e/WMRbs4qz4eXo1awPjIfYuRk4OCQETiQ17
 XgHZXBxCAisYJS42z2eFcL4wSpzdtxQq85lRYtrmY3AtT86cZ4FILGeUmLXhPyOE85ZRou/r
 BkaQKjYBK4mJ7avAbGGBPImbjYvAbBEBTYnrf7+D7WAW+MQocWJpExNIglfATuL0/qesIDaL
 gKrE5MMHwNaJCkRIfHpwmBWiRlDi5MwnLCA2p4C+xLrOuWC9zALiEreezIey5SW2v53DDLJA
 QuAYu8TB3bNZIe52kZjc1wJlC0u8Or4F6h8Zif87QZpBGtYxSvzteAHVvZ1RYvnkf2wQVdYS
 d879ArI5gFZoSqzfpQ8RdpRo23aUESQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0lsWLaB
 DWZt186VzBMYlWYheW0WkndmIXlnFsLeBYwsqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3
 MQJT0+l/x7/uYNz3J+kQowAHoxIP749D9vFCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3K
 jy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoFRN8zvu4b4wXf+BUsUWXtT
 LE+mpZ0+GazOMPeJ+6Pzf6OUOicw/Ga69zr2xo+NzN6v+w2Cfc0eGCVJXVJ5u1V2zkJBB5+a
 lVbP385u/M89a+OzyI/rg7fdnTXLVDJq+Tszl/Uv98XHP9Dw4/tVxeX+4rTo5G1qrXMuVc5J
 PleUElHh6Hxieme4EktxRqKhFnNRcSIAybJdhEkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7pNF+3jDX6ckrL4O+kYu8WVr+/Z
 LM6f38BusenxNVaLE30fWC0u75rDZjHj/D4mi0NT9zI6cHhcvnaR2eP3r0mMHptWdbJ53O8+
 zuSxeUm9x+dNcgFsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5
 mWWpRfp2CXoZ7e/WMRbs4qz4eXo1awPjIfYuRk4OCQETiSdnzrN0MXJxCAksZZRY9/E8axcj
 B1BCRuL4+jKIGmGJP9e62CBqXjNKdF85wQaSYBOwkpjYvooRxBYWyJOY1NnDBGKLCGhKXP/7
 nRWkgVngE6PEt7ZPjBDdaxgldjUfAuvgFbCTOL3/KSuIzSKgKjH58AGwk0QFIiQO75gFVSMo
 cXLmExYQm1NAX2Jd51ywDcwC6hJ/5l1ihrDFJW49mQ8Vl5fY/nYO8wRGoVlI2mchaZmFpGUW
 kpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAiNx27Gfm3cwXtoYfIhRgINRiYf3xyH7
 eCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wSeSVxBua
 GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamCs/Cn8a3JwpJPFu+ruFaps
 Av+qbI0v/DjyTP3tm0fs377NzZnco/9i9bOJd7a1Zt4Tal2/kEFv1tcaf7+I+GOqKeX6h9c+
 0og50ya9qezmPJcH+luqVvOZCYu06Fu8P+moKh+wJsyZhamHQ/7S4gePrG5avDb2mt3l/4/f
 oMb72THmcrWdt5cpsRRnJBpqMRcVJwIAyy0cYNoCAAA=
X-CMS-MailID: 20200821135202eucas1p1dc2de0fb3e687899859e41787357e199
X-Msg-Generator: CA
X-RootMTR: 20200820155923eucas1p2f73e16e6321e3592bd702ea657ff0709
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200820155923eucas1p2f73e16e6321e3592bd702ea657ff0709
References: <20200806181932.2253-1-krzk@kernel.org>
 <CGME20200820155923eucas1p2f73e16e6321e3592bd702ea657ff0709@eucas1p2.samsung.com>
 <20200820155913.GA21395@kozik-lap>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ trimmed Cc: list ]

On 8/20/20 5:59 PM, Krzysztof Kozlowski wrote:
> On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:
>> Hi All,
>>
>> Shortly
>> =======
>> This is a continuation of Arnd's work from 2019 [1].  The goal is to
>> cleanup, merge and finally make the Samsung S3C24xx and S3C64xx
>> architectures multiplatform.  The multiplatform did not happen yet
>> here... just cleaning up and merging into one mach-s3c.
>>
>> I intend to take it through Samsung SoC tree so all Acks are welcomed.
>>
>> Changes since v1
>> ================
>> 1. Rebased,
>> 2. Addressed comments (including mine),
>> 3. Few new patches.
>>
>> Please see individual changelogs (per patch).
>>
>> [1] https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=185855&state=*
>>
> 
> Hi All,

Hi Krzysztof,

> I applied second part of the set which finishes this step of S3C
> cleanup. Thanks to Arnd for the work!

Thank you (& Arnd) for working on this!

PS I've checked fbdev related changes now and they all look good to me.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Best regards,
> Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
