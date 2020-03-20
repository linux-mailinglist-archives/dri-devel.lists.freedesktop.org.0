Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B418CF32
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 14:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEBA6EB3F;
	Fri, 20 Mar 2020 13:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0CE6EB3F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:42:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200320134252euoutp02b23bfb5c471e41aa51564844a8167f5d~_BvXvmcgj2230922309euoutp02P
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 13:42:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200320134252euoutp02b23bfb5c471e41aa51564844a8167f5d~_BvXvmcgj2230922309euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584711772;
 bh=zSe/isC/PM9oRs1+Br6Xgz5fA/nqKrB160bD2MDddXw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=cN3wwlW+ppBfQVueoKsOmfG/mIVAyhUEWOBabCLy+xji2m/99BsH0PT3IeqeOyh9J
 /l8JgQyt1zgqLl87rdmFeABlPtZN0tiJznaQX6WxZtsl1eq+3USqfRqgI/v3hwKuLo
 ttQ/l6oTAQRN97xxae6WdlF0Z5MAoUFNytPVN9Ms=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200320134252eucas1p1fd681dd262aef4c17070b59592f4ce95~_BvXlI3732751827518eucas1p1s;
 Fri, 20 Mar 2020 13:42:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 74.16.60698.B58C47E5; Fri, 20
 Mar 2020 13:42:52 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200320134251eucas1p2960140f8f754fadb9189e035f4ff87f8~_BvXTj_tW2979229792eucas1p24;
 Fri, 20 Mar 2020 13:42:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200320134251eusmtrp189c731d631f40a4d0f1997131afe7a7b~_BvXS--I_2315923159eusmtrp13;
 Fri, 20 Mar 2020 13:42:51 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-25-5e74c85b1bd3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8C.E7.07950.B58C47E5; Fri, 20
 Mar 2020 13:42:51 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200320134251eusmtip2cd9b5f9c9fcb0f119858a6901e3eba64~_BvW_qOtE0831008310eusmtip29;
 Fri, 20 Mar 2020 13:42:51 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 0/3] video: Use scnprintf() for avoiding potential
 buffer overflow
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <85a0f31c-2e83-cf13-d5e8-2ea7f236f921@samsung.com>
Date: Fri, 20 Mar 2020 14:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hh7ykuyyg.wl-tiwai@suse.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduznOd2YEyVxBn/3M1lc+fqezeJE3wdW
 i5eb3zA5MHvc7z7O5LH5dLXH501yAcxRXDYpqTmZZalF+nYJXBk3P59kK2jgqHh6uJOtgXEp
 WxcjB4eEgInElNNGXYycHEICKxglPi3I6GLkArK/MEo82vyABSLxmVFi4elsEBukfsbSxWwQ
 RcsZJfqOHWSCcN4ySqzd3MEMUsUmYCUxsX0VI4gtLBAhsXPSO1YQW0RAQeLNq3tgcWYBB4l/
 HYvBruAVsJN4v9UeJMwioCpxdtlyJhBbFKj104PDYK28AoISJ2c+ATuIU0Bb4vK7e2wQY8Ql
 bj2ZzwRhy0tsfzuHGeQeCYFmdomuTzfZIa52kXh6biYLhC0s8er4Fqi4jMTpyT0sEA3rGCX+
 dryA6t7OKLF88j82iCpriTvnfoFdyiygKbF+lz5E2FGi+8E/Fkgw8knceCsIcQSfxKRt05kh
 wrwSHW1CENVqEhuWbWCDWdu1cyXzBEalWUhem4XknVlI3pmFsHcBI8sqRvHU0uLc9NRi47zU
 cr3ixNzi0rx0veT83E2MwARy+t/xrzsY9/1JOsQowMGoxMNrsbIkTog1say4MvcQowQHs5II
 r256cZwQb0piZVVqUX58UWlOavEhRmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjPvq
 iotXHRK4pbL4HaNYaMzJL5NP5n689KSGy11wkVBi1vLQY24178/G32o1/jN3k3Hsk/4vwYu/
 XOFWuHzn7U7Xpru5//pfe6kwh26UWK7+eN3S3+eb63yW2xexpj75L3DN90mk1KHvhz2kmhPY
 tU/PmWf92+Yd40bvhx/dg/W7xZayap+TklJiKc5INNRiLipOBAAXlvYvHAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsVy+t/xe7rRJ0riDFrna1pc+fqezeJE3wdW
 i5eb3zA5MHvc7z7O5LH5dLXH501yAcxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbm
 sVZGpkr6djYpqTmZZalF+nYJehk3P59kK2jgqHh6uJOtgXEpWxcjJ4eEgInEjKWLgWwuDiGB
 pYwS33//Yexi5ABKyEgcX18GUSMs8edaF1i9kMBrRomH8+RAbDYBK4mJ7avAyoUFIiR+vuAD
 CYsIKEi8eXWPEcRmFnCQ+NcBM345o8TiNbOYQOp5Bewk3m+1B6lhEVCVOLtsOROILQo05vCO
 WWC9vAKCEidnPmEBsTkFtCUuv7vHBjFTXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0W
 kpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBith37uWUHY9e74EOMAhyM
 Sjy8FitL4oRYE8uKK3MPMUpwMCuJ8OqmF8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4w
 mvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDO9ps68+P6YhXv
 z2X352f8TDbtXywzd5PJ9r91bi77Lm+Y7vX3xVrHZbN73J8wThZ3O8k0vXXakQk7e3f6m73n
 kz+Zva/k8WcD1/mRzOLhol25Z6O2byv/3HpxWpbyBfEz2Z7NLCozs9cdvFXBLnVrzsItpt8e
 vVE9O63k1/0bEbXeUxnCe8p/KrEUZyQaajEXFScCAAWLPmmuAgAA
X-CMS-MailID: 20200320134251eucas1p2960140f8f754fadb9189e035f4ff87f8
X-Msg-Generator: CA
X-RootMTR: 20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6
References: <20200311093230.24900-1-tiwai@suse.de>
 <CGME20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6@eucas1p2.samsung.com>
 <s5hh7ykuyyg.wl-tiwai@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/19/20 4:49 PM, Takashi Iwai wrote:
> On Wed, 11 Mar 2020 10:32:27 +0100,
> Takashi Iwai wrote:
>>
>> Hi,
>>
>> here is a series of trivial patches just to convert suspicious
>> snprintf() usages with the more safer one, scnprintf().
>>
>>
>> Takashi
>>
>> ===
>>
>> Takashi Iwai (3):
>>   video: omapfb: Use scnprintf() for avoiding potential buffer overflow
>>   video: omap2: Use scnprintf() for avoiding potential buffer overflow
>>   video: uvesafb: Use scnprintf() for avoiding potential buffer overflow
>>
>>  drivers/video/fbdev/omap/omapfb_main.c          | 14 +++++++-------
>>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  8 ++++----
>>  drivers/video/fbdev/uvesafb.c                   |  2 +-
>>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> Just a gentle ping about those patches.
> Let me know if any further changes needed.
Patches #1-3 queued for v5.7, thanks!

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
