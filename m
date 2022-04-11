Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529734FBDE9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0158910F5FF;
	Mon, 11 Apr 2022 13:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E84C10F5F8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:56:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220411135613euoutp01614df352ca0ee6fbbb36fbddd6bdb4b7~k3BtNHEEQ1855118551euoutp01K
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:56:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220411135613euoutp01614df352ca0ee6fbbb36fbddd6bdb4b7~k3BtNHEEQ1855118551euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649685373;
 bh=iyvNnrEVC5QV7hJVIEWg2C1iilTYcEjLxCmISlfZI7Y=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HRg/ASFNWitBO+97Q4kGFIreOwsS7v2rFWw4w+P7a2o8BCi15ZcT33SonbsZErZ06
 nupfKLnQ/jngPjOd+VnlC/x5mbmaD2bXMzpiUyzTN2IezAA1z42ILhbQsNGdsKvubr
 wmjJ5q2RuEXUf5QHWZwPjsOZEGswzxe1OqzonQzE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220411135612eucas1p20ea262a87937b3385fa456341a0a2730~k3Bsybs3z2334723347eucas1p2J;
 Mon, 11 Apr 2022 13:56:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EE.6D.09887.C7334526; Mon, 11
 Apr 2022 14:56:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220411135612eucas1p14c90f07b2be642da630c03e7d7a79a6a~k3BsF0Rx-1536215362eucas1p1Z;
 Mon, 11 Apr 2022 13:56:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220411135612eusmtrp1e5cc8f4736b0463600d2c53f2f93ef67~k3BsEuZI73010530105eusmtrp1e;
 Mon, 11 Apr 2022 13:56:12 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-12-6254337cefd0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 89.6F.09522.B7334526; Mon, 11
 Apr 2022 14:56:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220411135610eusmtip2167d2bfdf2d79a0b0346484c69379b34~k3Bq6I1iw1417514175eusmtip2C;
 Mon, 11 Apr 2022 13:56:10 +0000 (GMT)
Message-ID: <4c693c6e-512b-a568-948a-4a1af6a1313a@samsung.com>
Date: Mon, 11 Apr 2022 15:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring
 <robh+dt@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplk+LIzCtJLcpLzFFi42LZduzned0a45Akg18nDS3u3D7NbHF/8WcW
 i9e3V7BZzD9yjtXiytf3bBa9S4GsSfcnsFh82TSBzeLFvYssFmeb3rBbdE5cwm6xfMI+NotN
 j6+xWnT9WslsMeP8PiaLU42tLBaH+qItPs16yGzRuvcIu8WMyS/ZLC6e+MTsIOqx9uN9Vo/3
 N1rZPc713GXz2DnrLrvH7I6ZrB6L97xk8ti0qpPN48jVxawed67tYfO4332cyWPzknqPje92
 MHn0bVnF6PF5k1wAXxSXTUpqTmZZapG+XQJXxvWpW5kK7ohV3D5yha2B8ZlgFyMnh4SAicSc
 ozvZuhi5OIQEVjBK7Gv5DuV8YZS4/vw1C4TzmVHixuWbrDAtx1e2sEIkljNKTP3/BKrqI6PE
 pWMb2EGqeAXsJB4tm8oCYrMIqEpsPtIPFReUODnzCVhcVCBJYvX21WwgtrCAi8TWa//AapgF
 xCVuPZnPBDJUROAPi8TvX/fYIBLPGCXO3GcEsdkEDCW63naBxTkFHCXm/jnIClEjL7H97Rxm
 kGYJgX+cEu+vH2GCuBtow7adzBC2sMSr41vYIWwZidOTe4Au4gCy8yX+zjCGCFdIXHu9Bqrc
 WuLOuV9sICXMApoS63fpQ1Q7Siy7FwVh8knceCsIcQCfxKRt05khwrwSHW1CEDPUJGYdXwe3
 8uCFS8wTGJVmIYXJLCS/z0LyyiyEtQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIE
 ptjT/45/2cG4/NVHvUOMTByMhxglOJiVRHgtkgKShHhTEiurUovy44tKc1KLDzFKc7AoifMm
 Z25IFBJITyxJzU5NLUgtgskycXBKNTD5F5bvce/7Lu+bohu//4zTC17WJTkTc5e5srW+0tu1
 4ULYD9VO7SlH45KCbrV5Z+0283073XdNZtryxbFiV04m1q7fqXDU1lhATrvvuOwUIaNVqZqV
 GvtObpznOH/Gj4xZN59Id33/c/Op12mWQ0KBb2tf8jx5OC/z1Pqu6x8LJ8tueNov3zi/zapC
 eFdCa3vTe6n9M/ULDiYazsg/vqdst06GV6+R9aTbLK9PPL6wZaau5QKjd1uaZDabnQkzf5Gq
 kdhXfE+oIYNX94X9gUb50uA5V46LdDy6ItgX6/lullbELN6wm5dfrC1kmJzfJLm/+avNd///
 jelXJB8L5Tlf9H+TqdJsxp765NzJV7OUWIozEg21mIuKEwGb4EeMIAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsVy+t/xe7o1xiFJBnMTLO7cPs1scX/xZxaL
 17dXsFnMP3KO1eLK1/dsFr1LgaxJ9yewWHzZNIHN4sW9iywWZ5vesFt0TlzCbrF8wj42i02P
 r7FadP1ayWwx4/w+JotTja0sFof6oi0+zXrIbNG69wi7xYzJL9ksLp74xOwg6rH2431Wj/c3
 Wtk9zvXcZfPYOesuu8fsjpmsHov3vGTy2LSqk83jyNXFrB53ru1h87jffZzJY/OSeo+N73Yw
 efRtWcXo8XmTXABflJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
 Zllqkb5dgl7G9albmQruiFXcPnKFrYHxmWAXIyeHhICJxPGVLaxdjFwcQgJLGSUWPZrJDpGQ
 kTg5rYEVwhaW+HOtiw2i6D2jxL7XW1lAErwCdhKPlk0Fs1kEVCU2H+lnh4gLSpyc+QQsLiqQ
 JHGpq50RxBYWcJHYeu0fWA2zgLjErSfzmUBsEYEGVolDF7kg4s8YJe7+SoNYNoVR4vrRV2AN
 bAKGEl1vQa7g5OAUcJSY++cgK0SDmUTX1i5GCFteYvvbOcwTGIVmIbljFpJ9s5C0zELSsoCR
 ZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgWtl27OfmHYzzXn3UO8TIxMF4iFGCg1lJhNci
 KSBJiDclsbIqtSg/vqg0J7X4EKMpMDAmMkuJJucDE1teSbyhmYGpoYmZpYGppZmxkjivZ0FH
 opBAemJJanZqakFqEUwfEwenVAPTMutF7OufZIXcCgjRWsR6r5E5uWKr2gTpq2//yT07dk9w
 j6U9S93mOwvqNqxcrKb8ewFTzhnR7W6Klb9mRlmfn3HlYkXhQff9Os90Jm3LLI6L/zElZqFp
 dqX9tVw7YdNcj3dTavc2+q91+KeifL3rebKD38EVGalr9OXE4k3vCB/5vktTe4aF7qrsc/4h
 xpwnNRfPvz83O5iXQcZs9Yn7qYs3TviyvoVNrNbWPGcqv7/gYan6G7v05nSvF3TZZGBUOc9m
 I9vnbTcj5vZq8XZWbKs+OInd8LHW/NTEzvtxx2Z8VdNZtKthQ63tPmW3Z9/8nwm7btrZ6Z3K
 IS2bl3z75of/S04c9bry/8Rt7sAKJZbijERDLeai4kQAfUM9ErQDAAA=
X-CMS-MailID: 20220411135612eucas1p14c90f07b2be642da630c03e7d7a79a6a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3
References: <CGME20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3@eucas1p1.samsung.com>
 <20220408162108.184583-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.04.2022 18:20, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> Previous RFC can be available here [1].
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
>
> Patch 0000: 	Samsung DSIM bridge
>
> Patch 0001: 	platform init flag via driver_data
>
> Patch 0002/9:   bridge fixes, atomic API's
>
> Patch 0010:	document fsl,imx8mm-mipi-dsim
>
> Patch 0011:	add i.MX8MM DSIM support
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Anyone interested, please have a look on this repo [2]
>
> [2] https://protect2.fireeye.com/v1/url?k=930e329a-f28527b5-930fb9d5-74fe485cbfe7-b0c53e2d688ddbc5&q=1&e=e6aa727d-5ae2-4ca5-bff3-7f62d8fae87e&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v1
> [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
>
> Any inputs?

I wanted to test this on the Exynos, but I wasn't able to find what base 
should I apply this patchset. I've tried linux-next as well as 
95a2441e4347 ("drm: exynos: dsi: Switch to atomic funcs").

Please note that pointing a proper base for the patchset is really 
essential if you really want others to test it.


> Jagan.
>
> Jagan Teki (11):
>    drm: bridge: Add Samsung DSIM bridge driver
>    drm: bridge: samsung-dsim: Handle platform init via driver_data
>    drm: bridge: samsung-dsim: Mark PHY as optional
>    drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
>    drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
>    drm: bridge: samsung-dsim: Add module init, exit
>    drm: bridge: samsung-dsim: Add atomic_check
>    drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>    drm: bridge: samsung-dsim: Add input_bus_flags
>    dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>    drm: bridge: samsung-dsim: Add i.MX8MM support
>
>   .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>   MAINTAINERS                                   |   12 +
>   drivers/gpu/drm/bridge/Kconfig                |   12 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c         | 1803 +++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig                |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1704 +---------------
>   include/drm/bridge/samsung-dsim.h             |   97 +
>   8 files changed, 1982 insertions(+), 1649 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

