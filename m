Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B837D1ADEFE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E856EC10;
	Fri, 17 Apr 2020 14:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB606EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140756euoutp02e7b38d10f7cf2b1688689ece381a5d90~GoJQWOSr11553015530euoutp02h
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140756euoutp02e7b38d10f7cf2b1688689ece381a5d90~GoJQWOSr11553015530euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132476;
 bh=U6isxlo64PFJa4vVTOq4zR5g89yDZau5zSJd8NfSZ38=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=VU2fA1YEyF8mKDxMI//LiMgKVkQ3F6ndPdJv8c4vZWqwM95IwZCBVZntQWM2Xsdis
 b0tsik41hOYaXOLaM3So8uE1pkDYFMAoIBE+flKQ82z2xAEHTi7t1MP54RvIeT83BB
 AfeWjms+wPWPwaBqrQhZjFI8G1C3hVT705hhbG3Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200417140756eucas1p20913872d30b9ae37d4613b2be9867a5f~GoJQBckud1677816778eucas1p2W;
 Fri, 17 Apr 2020 14:07:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1A.4C.61286.C38B99E5; Fri, 17
 Apr 2020 15:07:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140755eucas1p25c5b548c689ff267fad693b568029e85~GoJPfdFpA1773817738eucas1p28;
 Fri, 17 Apr 2020 14:07:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140755eusmtrp150da5e7883cbac30ae58cabd7770b9fd~GoJPe6NKX2228222282eusmtrp1c;
 Fri, 17 Apr 2020 14:07:55 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-31-5e99b83c1f1e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F0.E0.07950.B38B99E5; Fri, 17
 Apr 2020 15:07:55 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140755eusmtip289d5a8ab55a01e95669f065c851c8e12~GoJPKsPPD0417604176eusmtip2J;
 Fri, 17 Apr 2020 14:07:55 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 0/6] video: fbdev: controlfb: small cleanup
To: linux-fbdev@vger.kernel.org
Message-ID: <bf36874a-23d5-575a-c1b4-a4d2e3ae8861@samsung.com>
Date: Fri, 17 Apr 2020 16:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324134508.25120-1-b.zolnierkie@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XYuOy4nx6n4opJ1oOjqBYOGilREDKIIKlAh9ZgnFa/sqGUE
 KV3mPW2wcIjGkLQVU8bmrZuuUksZeclsWIppqTEyTU0padtR8r/f+7zPw/s98FGYrJbwo1Iz
 czhlJpvOkBK8pXvVejCyrToupLfUXW4zWAn58NIPUt5bMU/IhzpqSHnjqhkdIRTjpT0iRb3m
 PamoMOmRYtG4/QweK4lM4tJT8zhlcFSCJGVyqZDILth2xdjUQhagJaoEuVFAH4KGhmmsBEko
 Gd2I4POcjRCGXwjKJm1iYVhE0N8/hTYjt1Z0uLBoQDD6vY4UBjuCNYvZ5SLpcKhS6V3sRR+D
 ZZWJcLI3HQhP76hEzgBGFyN4on2LORdSOgpemcdcAZzeBR9mHoud7ENHw8LES0LweMKb6inc
 yW4Of7nG4spitC/YpupEAgdCq73G1QhonRgGJr6SwruPw7f6n5jAXjDXYxILHAB96jJcCBgQ
 /C2a2Ui3ImhQr2+kI2DMuuZgynFiLzR1BAvyUWis7BI5ZaA9YNTuKTzCA+623MMEWQpFt2WC
 ezc0P2gmN8+WtD/EKhGj3VJNu6WOdksd7f+79xGuR75cLp+RzPGhmdzlIJ7N4HMzk4MuZmUY
 kePX9K33LLShpcFEC6IpxLhLQ8qq42QEm8fnZ1gQUBjjLe064ZCkSWz+VU6ZFa/MTed4C/Kn
 cMZXGqabvSCjk9kcLo3jsjnl5lZEufkVIMY81dm7XHl4lu37ElSrjzjL+Nrlc5fEK+Wdwftp
 H117t3/M6fmdccPXKjSFJz28jK3t0vOf7KaBAzfGNSrReHyfKMGk+20NK44YfNb9Zz3cs2qH
 z56bibExI0Py4VN1AS/OmY2D16eH8g1VkYYR/XPT61mrOjitTv0uTB/96COD8yls6D5MybP/
 AAckFvoxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7rWO2bGGaydrGRxa905VosrX9+z
 WZzo+8BqcXnXHDaLFT+3MjqwetzvPs7ksWTaVTaPvi2rGD0+b5ILYInSsynKLy1JVcjILy6x
 VYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3j0tZG1oIG7YtP6bWwNjF85
 uhg5OSQETCRavy9i6WLk4hASWMoocfrKBeYuRg6ghIzE8fVlEDXCEn+udbFB1LxmlDjRvZQd
 JMEmYCUxsX0VI4gtLOAk8a19CyuILSIgL7Gnv50JpIFZoJNRYtnKVVDdExklNjxrB6viFbCT
 OLL1Dlg3i4CqxPUXa8CmigpESBzeMYsRokZQ4uTMJywgNidQfe+0Q8wgNrOAusSfeZegbHGJ
 W0/mM0HY8hLb385hnsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+
 7iZGYGRtO/Zzyw7GrnfBhxgFOBiVeHgNembGCbEmlhVX5h5ilOBgVhLhPegGFOJNSaysSi3K
 jy8qzUktPsRoCvTcRGYp0eR8YNTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1I
 LYLpY+LglGpgvCm7/ebTrfPtD1d1aTC+EvkrO3GWic7EaW2PL1Td5l7TKnvA3XZp2rSnAeW/
 NepYvHnXey28+5VrypSPok//O0/mUIhcfO/ykTPzGsyWa729a7mXf4FjHQ/nOu/vG34L8n+9
 5zh1/oMlF8/wzV+2p9jvW8+zP2xfkjb6zHyUKSfZZDbH0Npca7sSS3FGoqEWc1FxIgCTwOzo
 wgIAAA==
X-CMS-MailID: 20200417140755eucas1p25c5b548c689ff267fad693b568029e85
X-Msg-Generator: CA
X-RootMTR: 20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97
References: <CGME20200324134518eucas1p1440c92398ddcbe5ea72d6db3703d3f97@eucas1p1.samsung.com>
 <20200324134508.25120-1-b.zolnierkie@samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/20 2:45 PM, Bartlomiej Zolnierkiewicz wrote:
> Hi,
> 
> Small cleanup for controlfb driver:
> 
> - fix sparse warnings
> - remove not working module support
> - add COMPILE_TEST support
> - remove redundant function prototypes
> 
> Changes since v1
> (https://lore.kernel.org/lkml/20200116140900.26363-1-b.zolnierkie@samsung.com/):
> - use in_le32() instead of le32_to_cpup()
> - use eieio() and dcbf() helpers
> - add invalid_vram_cache() helper
> - add more dummy CONFIG_PPC_PMAC=n helpers to avoid ifdefs
> - add ACKs from Sam
> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> 
> Bartlomiej Zolnierkiewicz (6):
>   video: fbdev: controlfb: fix sparse warning about using incorrect type
>   video: fbdev: controlfb: add COMPILE_TEST support
>   video: fbdev: controlfb: remove obsolete module support
>   video: fbdev: controlfb: remove function prototypes part #1
>   video: fbdev: controlfb: remove function prototypes part #2
>   video: fbdev: controlfb: remove function prototypes part #3
> 
>  drivers/video/fbdev/Kconfig     |   2 +-
>  drivers/video/fbdev/controlfb.c | 828 +++++++++++++++-----------------
>  2 files changed, 391 insertions(+), 439 deletions(-)

Patches #1-6 queued for v5.8.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
