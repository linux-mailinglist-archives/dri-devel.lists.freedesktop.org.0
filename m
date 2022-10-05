Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187995F5B3C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 22:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931B10E77D;
	Wed,  5 Oct 2022 20:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373F710E77D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 20:51:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221005205141euoutp028ccfe2202d20bad90ba3abac299474ef~bR3___JYq1007910079euoutp02d
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 20:51:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221005205141euoutp028ccfe2202d20bad90ba3abac299474ef~bR3___JYq1007910079euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1665003101;
 bh=cQNGMtqQFBkTNScPS65gyxAsjUi1UutqGrOCsqr+bVU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=PpVyc+Gb3lGqLNhOFsN7Kql1dhGmN+ssxUSZ5xNnMHmmq9Qh8OezUBtLYUTrR5J2Y
 kh7Uc6IEWJ2QWG6fCkfRIO3orPOL++aNK1kXRXnAyODWbAdFkjYtJU6kWiDyP7g3Ja
 q2QcMzAIqYCLHbxEJC8J346H6t7S3hyWOUKKmQOU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221005205140eucas1p27c9a5e5caa30f7a45bb809592c33c79b~bR3_bKVFA0336003360eucas1p2s;
 Wed,  5 Oct 2022 20:51:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.C8.29727.C5EED336; Wed,  5
 Oct 2022 21:51:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221005205139eucas1p1a83656ce99d30d32568ba2b2f7a5ed09~bR39J4S9n2379023790eucas1p1I;
 Wed,  5 Oct 2022 20:51:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221005205139eusmtrp152e9a1d9da257f3f7a579d2681ef2c87~bR39IxhlK0757707577eusmtrp1H;
 Wed,  5 Oct 2022 20:51:39 +0000 (GMT)
X-AuditID: cbfec7f2-205ff7000001741f-35-633dee5c5cf2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.CC.07473.B5EED336; Wed,  5
 Oct 2022 21:51:39 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221005205138eusmtip149a8b933f7a26f75379a3005138e409f~bR38G8MuW0716607166eusmtip1T;
 Wed,  5 Oct 2022 20:51:38 +0000 (GMT)
Message-ID: <df3abb7c-66ae-4495-4a73-c59880a6fdff@samsung.com>
Date: Wed, 5 Oct 2022 22:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
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
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxbVRjO6b29LTXt7gqOMxBnGjWKWycO3PED1AS3mxgT/hgjGrGWu65K
 C7YUhUVlyjaowFpgrLSAuIKUKZ8iICMVWLMWOwrjy43BuvEhDgdIWzM+ks22lyn/nvd5z/M+
 z/vmcDFhORHBlSszaZVSkiYieHjHpfWhfe8tx0ufdc1EoqnrTgy5zV4c/XXdQqCxf1YIVFTn
 YqMStw5HvjYdgf68cQVHg1/d4aACfS0H1eusBGqbnWAj7UYDhgxDVha6c/I4QM6ZZgz9dvwE
 jkbKLhLIY7zl75beJtAVhwdDdzcHsVd3UY2rbjZVbXTgVJnDxqZchdME9YtxmkOZ8ivYlLnn
 NouyjZvZ1NRED0G5v7GzqJ9qv6Ral7tYVHH7eUB52x5NEiTzXk6l0+RZtGp/wge8oz2jdpBx
 afdnNvc9Ti6whWpBCBeSsbCjzMoOYCFpAdCnxxnsA3Az75AW8PzYC+Dqz0PYA8F8VT3ONOoB
 7LP1c5hiFUBLpzM4ik8mwK7GZhDAOPk4NP3u2+J3woGKuaDFw6QUrmt7iQAOJQ9Ds3UsyGNk
 OJyc+5YVGBpGNrJh8feFRKDAAg6Fa7eCOQgyBmqXtEF1CPkKvHx3jcOo98DOpUosIIBkMQ9a
 HD9wmOCJsLypFTA4FC7a27f4R6CztBBnBKcArNl0s5hCB2DuwuSW4iU45drw23H9Fk/D5u79
 DP0a9I1fAwEakgJ4dWknE0IASzrOYgzNh/knhczrJ6HR3vSfbd/wCKYDIuO2wxi3HcC4bR3j
 /741AD8PwmmNWiGj1TFK+lOxWqJQa5QysTRd0Qb8X9d5z+7pAlWLq+J+wOKCfgC5mCiMrzXF
 S4X8VEl2Dq1KT1Fp0mh1P4jk4qJwPmGIlgpJmSST/pimM2jVgy6LGxKRy9IkTTz05khouZ4v
 T98bfWPvM7JQ/ER800fd3qsV00lRyXPzsrHupNbnNwWjr5/7sSCOH9Ygtla16JX3l//oPrZ7
 8oy2NWUFRZ6dLuKX7jDJOs7UXEgZPyWyDm+UKGL7pvJNvbz3nxrec98Rd9nwd8S+FkdlXdTC
 kXeSHTkHTYbeQcXpY4b42JA1c1aBJ0WydOHFFz5pn2x5q/qiIHpef3B0fRFZLSmPJYotwwtf
 v10r/jX1iYHECbBDtlzZ6f3wwNjMgVJyJQ7NHyEGVPriw1kZnuovDrmuhc3KM+Vv4LPZN7uI
 /pupu2Z1nBxFAl2U/dy7de2Teee+i9Kcrs5rCP98DBPh6qOSmGhMpZb8Cz4EwBspBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xu7rR72yTDQ6u5ba4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYw9l48zFhyTrDhy/x97A+MR4S5GTg4JAROJp3OXs3QxcnEICSxl
 lFh8vY0VIiEjcXJaA5QtLPHnWhcbRNF7Roll7w+wgyR4BewkdqxdzwhiswioSMy+/oUVIi4o
 cXLmExYQW1QgWeLln4lg9cIC7hKL910BizMLiEvcejKfCWSoiMBmVom97yaAOcwCHxklLk3e
 AtYhJDCJUeLcBTcQm03AUKLrLcgZnBycAvYSZ77/YIeYZCbRtbWLEcKWl9j+dg7zBEahWUgO
 mYVk4SwkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRmGa2Hfu5eQfjvFcf9Q4x
 MnEwHmKU4GBWEuHtmm2bLMSbklhZlVqUH19UmpNafIjRFBgaE5mlRJPzgYkuryTe0MzA1NDE
 zNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qB6ciTU9yWCu7PufJqpZcfNVbM3tcY
 rxCf9H55y/TPHBV7/vS3f3y9s5Xx1ZXzhnu296byyXnZHfk10bTLumrDEvGFNy0s73YalrTv
 3Gj48Ef6mexr21MXHEma+L9ez7T51Vc20emZiSackRkP9+oyTCph6RYTfajR+r+DedYU3Uuv
 Xs2a7fjQ5rH8sV8Kt6e5MtcsaT4XzZu9Y8PZ7k0Ga75qli/wiN3xpmbnHpOVKU+15R57yTXf
 TD/471rp80cb2xfyTDh984DKBo3VXPJvfXN3rPztvT0g68qkqTFvT5dX5y5cWBrPmHWmRE5H
 +ZnCU7/HSx040r+sMeNxFhIItuCeWtI5w+KdREvfFbem50osxRmJhlrMRcWJAIMkB6e8AwAA
X-CMS-MailID: 20221005205139eucas1p1a83656ce99d30d32568ba2b2f7a5ed09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35
References: <CGME20221005151323eucas1p2c69fc9989b84a9d74d568469ccd81f35@eucas1p2.samsung.com>
 <20221005151309.7278-1-jagan@amarulasolutions.com>
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

On 05.10.2022 17:12, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
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
>
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
> Patch 0001: 	Samsung DSIM bridge
>
> Patch 0002:	PHY optional
>
> Patch 0003:	OF-graph or Child node lookup
>
> Patch 0004: 	DSI host initialization
>
> Patch 0005:	atomic check
>
> Patch 0006:	PMS_P offset via plat data
>
> Patch 0007:	atomic_get_input_bus_fmts
>
> Patch 0008:	input_bus_flags
>
> Patch 0009:	document fsl,imx8mm-mipi-dsim
>
> Patch 0010:	add i.MX8MM DSIM support
>
> Tested in Engicam i.Core MX8M Mini SoM.

This finally doesn't break Exynos DSI. :) Feel free to add:

Acked-by: Marek Szyprowski

Tested-by: Marek Szyprowski

The next step would be to merge Dave's patchset and remove the hacks 
added here and there. Otherwise we will end up adding even more hacks soon.

> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
>
> Any inputs?
> Jagan.
>
> Jagan Teki (10):
>    drm: bridge: Add Samsung DSIM bridge driver
>    drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>    drm: bridge: samsung-dsim: Mark PHY as optional
>    drm: bridge: samsung-dsim: Handle proper DSI host initialization
>    drm: bridge: samsung-dsim: Add atomic_check
>    drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>    drm: bridge: samsung-dsim: Add input_bus_flags
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>    drm: bridge: samsung-dsim: Add i.MX8MM support
>
>   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>   MAINTAINERS                                   |    9 +
>   drivers/gpu/drm/bridge/Kconfig                |   12 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig                |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
>   include/drm/bridge/samsung-dsim.h             |  115 +
>   8 files changed, 2108 insertions(+), 1653 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

