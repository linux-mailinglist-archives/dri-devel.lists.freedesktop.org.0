Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E391064A40F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 16:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98410E210;
	Mon, 12 Dec 2022 15:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4C310E210
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 15:23:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221212152340euoutp01ab79b0b403f2b34a886ac44d3b147182~wFRAHgSNj0031600316euoutp01S
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 15:23:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221212152340euoutp01ab79b0b403f2b34a886ac44d3b147182~wFRAHgSNj0031600316euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670858620;
 bh=Hf/cQ5uOcAiphfts85TFjfJiJXU3R2yySHAFM+dzu1o=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Fd99UL/rN+KQt86gKiQKUTwpWA/CQOU9TKG0+41LOIXXrdH9kpd3JCxl8mOQa59vi
 E+L+0JBmr0kEbRspxnVuVowge4xtFy8O3tiZtUqWphs7Ch/RMKkg0lxdrirA2KpK57
 8SbfkGHOYX7cUl+lRPoD97HENfd3TssjD9ajBQJk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221212152339eucas1p1f6c556e3d5888c31441b1553d85529f8~wFQ-m1Ukw1941519415eucas1p1p;
 Mon, 12 Dec 2022 15:23:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 11.12.10112.B7747936; Mon, 12
 Dec 2022 15:23:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221212152339eucas1p1c1ce022f3c8e511fcf19f4d5ccedd830~wFQ-DrgWT1940219402eucas1p1j;
 Mon, 12 Dec 2022 15:23:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221212152339eusmtrp2c5bff395b50762292fd2cefe94d592ff~wFQ-CvxFG0045600456eusmtrp2R;
 Mon, 12 Dec 2022 15:23:39 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-72-6397477bffec
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0E.AD.09026.B7747936; Mon, 12
 Dec 2022 15:23:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221212152337eusmtip2db52cfc911599f7207e7666c50f8117b~wFQ9tp9VK3196331963eusmtip2l;
 Mon, 12 Dec 2022 15:23:37 +0000 (GMT)
Message-ID: <941c2226-24d5-073f-efd3-15543b51e056@samsung.com>
Date: Mon, 12 Dec 2022 16:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 00/18] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVSTZRw9z/vFWGfwOqA9kmZRIlox4HTiMYw0K18/Tmr2pf5hc7wHCRg7
 G5iW1VbK1vhwCCqsITsNGMEBj0goiBxZIEPcHMuMZLizUEt05Bz4AZUxXiv+u7/7u/fc33PP
 w8OFB6loXoYsl1XIJFkxFJ9oPfvA8cKnqw5LE2odccg91I8jjzlAoJtDdRS6OPEHhYpqHCQ6
 4NETaLxZT6HfrwwQyP7lrRD0dUl1CLLoOynUPHKJRLrJ73BUfqETQ7fy1QD1/3oUR+fU+wjk
 KvuBQncM3ult6Q0KDdju4OjelB1f/jjT6PeQzBGDjWDKbN0k4ygcppg2w3AI8422gmTMHTcw
 pvsnM8m4L3VQjKegF2OOV3/BHBs7iTHFLfWACTQ/uSFsC39ZGpuVsZNViFM/5O8YNk7h8q5n
 dz0cuY2pQPs8HeDxIP0iPGV7Xgf4PCFdB2BLTyPFDeMAOjVOQgdCp4cAgA5NZhAHDV3tAwQn
 skzzFbUkJ/IDuNcdEsQCOhVeq34wYybohdCyf98jfg7sq7g6w0fRafBMmx0L4gh6FdRWNlFB
 jNMiePlqFRYMiKQbSVhcWzhzEh4MKLzvxYMqik6EOp9uxhFKr4B3y4dwzr0AnvAZ8aAB0sV8
 uNdaRnJ3vw6bCkooDkfA0d6WEA7Pgw/buDhIawA0TXkeDXoAVb9dBpwqBbodk1SwMpxeDI+2
 izl6BRwrKMa4JsPgoG8Od0QYPNB6GOdoAdTmCzl1LDT0Nv0X2+V04XoQY5hVjGFWAYZZzzH8
 n2sCRD0QsXnK7HRWmSRjP45XSrKVebL0eGlOdjOY/rn9f/eOnwSWUX+8FWA8YAWQh8dEChbG
 HZIKBWmS3Z+wipxtirwsVmkFT/CIGJGgrkwrFdLpklw2k2XlrOLfLcYLjVZh8z8biV5X8wp4
 a+3S+iOrTbKGrflEqk1l/f590+0/VbaUTLBZ36fdaZy7/ave0bkLJks730kavZ79WE+Hd+zY
 tXcPrTk/uHG91OAwZmhy9luSRHt2db4clZIS5SKPp3kzlyefn9jmi6x8qST8zNmVrR8l302m
 5wtMxsELxvfq1J8zYvsiyQmtNzz5ut35apV9z/0lNU0/E26y8i/+0h9Xyns0zg3lb66/94FH
 l2hWFQeGREVFMvnp1Nh+XUNA/VzVZrPRr+7zR/DF+VeeXsbjJ9wcKz2VIN69KfQ16ZaD4fjF
 7r7F636J2/rt2vG35U+dW/SGb6NerMltGDztesa7qc21fSI2hlDukCQuwRVKyT/Ej3P4KAQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xe7rV7tOTDU78YLO4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYy7c34zFxxUqfj/+ANTA+MumS5GTg4JAROJg7susnQxcnEICSxl
 lLhwfjETREJG4uS0BlYIW1jiz7UuNoii94wS7zbuZQdJ8ArYSTxd8pMFxGYRUJVY3t8KFReU
 ODnzCVhcVCBFor3nH9hQYQF3iY6569hAbGYBcYlbT+YzgQwVEdjMKrH33QQwh1ngI6PEpclb
 2CHWTWGUONx4D+wONgFDia63XWDtnAKOEt9m3GaGGGUm0bW1ixHClpfY/nYO8wRGoVlILpmF
 ZOMsJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJEZhoth37uWUH48pXH/UOMTJx
 MB5ilOBgVhLhVdWYlizEm5JYWZValB9fVJqTWnyI0RQYHBOZpUST84GpLq8k3tDMwNTQxMzS
 wNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUn+++Lj58Rio9UZa55dsspeEp7ueDz3
 YWWswOzNG3M7XjkEHd3R07LmpeSZ42Jp9jWzT+nUGNtl3/op6fcrJcue99W83GPmUyb+m7T5
 RqHoprXP9XaXLGB0/vKt2KzCJO9DSGS33vqdaWztFuyH4pbPk9CYkKiwtGw/+22+KJYHztc0
 ZjQHRPHVnW3ZfLNkzsbFld43Dq9KizPZ+ORWnMH3frsbl8I/fMivyDswN3Op92dl646I3PCj
 jpGG+6SXSZXoX+6ZnBzj+2BS+naZLua1CbufSF3efpxrZvvNizOOzrgsX7b7YUPh4X8hKTUP
 VJ4s4qx3Yj4pPFtq7sYYkWNHjCo5vJ3at9qzr+YVPaTEUpyRaKjFXFScCACRZJLvvQMAAA==
X-CMS-MailID: 20221212152339eucas1p1c1ce022f3c8e511fcf19f4d5ccedd830
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152436eucas1p15a9b0fe3b46e8e0eb8018b042094d6b1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152436eucas1p15a9b0fe3b46e8e0eb8018b042094d6b1
References: <CGME20221209152436eucas1p15a9b0fe3b46e8e0eb8018b042094d6b1@eucas1p1.samsung.com>
 <20221209152343.180139-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 09.12.2022 16:23, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Well, I think I've managed to fix the remaining bits to keep it working 
on Exynos and have all the features added in meantime between v1..v9. 
I've posted my comments in the individual patches, but to make think 
easier to test, I've also pushed my changes to the github:

https://github.com/mszyprow/linux/tree/v6.1-next-20221208-dsi-v9-fixed

With that fixes, feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

to all common/Exynos related patches.


> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>    list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
>
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
>
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
>
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
>
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
> t
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v9
>
> v8:
> https://lore.kernel.org/all/20221110183853.3678209-1-jagan@amarulasolutions.com/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (16):
>    drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
>    drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
>    drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
>    drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>    drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>    drm: bridge: samsung-dsim: Mark PHY as optional
>    drm: bridge: samsung-dsim: Add host init in pre_enable
>    drm: bridge: samsung-dsim: Init exynos host for first DSI transfer
>    drm: bridge: samsung-dsim: Add atomic_check
>    drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>    drm: bridge: samsung-dsim: Add input_bus_flags
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>    drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
>    drm: bridge: samsung-dsim: Add i.MX8M Plus support
>
> Marek Szyprowski (2):
>    drm/bridge: tc358764: Enable pre_enable_prev_first flag
>    drm: exynos: dsi: Restore proper bridge chain order
>
>   .../bindings/display/exynos/exynos_dsim.txt   |    2 +
>   MAINTAINERS                                   |    9 +
>   drivers/gpu/drm/bridge/Kconfig                |   12 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c         | 1934 +++++++++++++++++
>   drivers/gpu/drm/bridge/tc358764.c             |    1 +
>   drivers/gpu/drm/exynos/Kconfig                |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1769 +--------------
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c |    1 +
>   .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  |    1 +
>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c |    1 +
>   include/drm/bridge/samsung-dsim.h             |  116 +
>   12 files changed, 2195 insertions(+), 1653 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

