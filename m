Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966D26ABDA1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DC110E218;
	Mon,  6 Mar 2023 11:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C40810E218
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:02:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230306110247euoutp0291296d1328165dca16fba1df0ed59477~Jz5NbDofT0108701087euoutp02M
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:02:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230306110247euoutp0291296d1328165dca16fba1df0ed59477~Jz5NbDofT0108701087euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678100568;
 bh=1km5nlWnrnhSWunyp26eXnLcxNzZvu+xWi0P60a0agY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=E0uQ0udjU/JmtDEWFsZ4w4AKbxq92pdVQNZ/d4ZcrCw7rXojZ9tbs2jpBaJtCqB1l
 POIcEAL5KjkfYffu/a5mluL0icKcjK7xBAvVTSeOoxpYGLCUJ2Mtpd3QPb8ynXRcGQ
 N3yIOQS9WhOnNOb2EZNeYX9sNsf0C4wQtAbsbjI4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230306110247eucas1p13dc3919f9017a1c1733508109b380ff8~Jz5NGi2GI0891808918eucas1p1F;
 Mon,  6 Mar 2023 11:02:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 78.92.09503.758C5046; Mon,  6
 Mar 2023 11:02:47 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230306110247eucas1p1dc0f813b7660e97c191948e5b5fe9892~Jz5Mr5DZi1508515085eucas1p1l;
 Mon,  6 Mar 2023 11:02:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230306110247eusmtrp1885cd7761fdb08c2f0027a827b1bf653~Jz5MrNCqA0699206992eusmtrp10;
 Mon,  6 Mar 2023 11:02:47 +0000 (GMT)
X-AuditID: cbfec7f2-e8fff7000000251f-ad-6405c8572c68
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CC.42.08862.758C5046; Mon,  6
 Mar 2023 11:02:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230306110245eusmtip1647f5a1e489630c6ca994cb787897e32~Jz5K1iCQ61700417004eusmtip1I;
 Mon,  6 Mar 2023 11:02:44 +0000 (GMT)
Message-ID: <4b2624f6-b904-4daa-29ca-380cc7dbfc45@samsung.com>
Date: Mon, 6 Mar 2023 12:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZC1U3eDmtWa_sx0Sop_V1vU3fSM=r21U9qPf0UmCYTOkA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7djPc7rhJ1hTDB7vl7e4c/s0s8X9xZ9Z
 LK58fc9m0bv0HKvFpPsTWCy+bJrAZnG26Q27xfIJ+9gsZpzfx2Txpq2R0eL0o/XMFm2dy1gt
 3u+8xWgxY/JLNouLJz4xO/B7rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wei/e8ZPLYtKqT
 zePI1cWsHneu7WHzuN99nMmjb8sqRo/Pm+QCeKK4bFJSczLLUov07RK4Mpquv2Er2KJcMX/3
 EfYGxneyXYycHBICJhL3j31h6mLk4hASWMEo8XT5JTYI5wujxIGjm6Eynxkllp7exATTsvPx
 VTYQW0hgOaPE7OUuEEUfGSW6+26ygiR4Bewkjj7/ygJiswioSOya1cYOEReUODnzCVhcVCBF
 Ysf53WBxYQEHifMrjjKC2MwC4hK3nswHWyYioC3xbeZrNoj4WhaJb1d8QWw2AUOJrrddYHFO
 gUCJq/NXM0HUyEs0b53NDHKQhMAlTom3526yQFztIvFpzneoD4QlXh3fwg5hy0icntzDAtHQ
 ziix4Pd9JghnAqNEw/NbjBBV1hJ3zv0CWscBtEJTYv0ufYiwo8SFGyvZQcISAnwSN94KQhzB
 JzFp23RmiDCvREebEES1msSs4+vg1h68cIl5AqPSLKRgmYXk/VlI3pmFsHcBI8sqRvHU0uLc
 9NRiw7zUcr3ixNzi0rx0veT83E2MwNR4+t/xTzsY5776qHeIkYmD8RCjBAezkggvTylLihBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXFebduTyUIC6YklqdmpqQWpRTBZJg5OqQamvINNd6f+Ebws
 E+t8cOnZc+cy9pgcvveoRCXnrc7/c7X3dnvE7GO83Xr8T3Am7/kUMd6Atwe0nmeFnVkmJDZR
 OerS7VXe8XWvTi5ckMVwtu3znXBdD9FwJ3W3UzU/Qnf89rnBfuYX1yzXp/P+8epctLsh01VW
 7HLkKMOre39qA4683vrqYIMj44uwIOcHXG+815e0MrUcjZ295kmkf9H/eZc5lxrW/RJ6LX50
 8t/z7ReOmIVUyW2S/71oC8vXVeuu6vlHyBld8+ytfuMcG5DBPPfCx7tGEuZeGdlP+k81H7zw
 /8sMfoUL12cc+/1lYlvgD+Zf9Z43S3zjGqWus7L3HZhi1lDGU3gowzlc56hipRJLcUaioRZz
 UXEiABc6Zzn8AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsVy+t/xu7rhJ1hTDP7tYbW4c/s0s8X9xZ9Z
 LK58fc9m0bv0HKvFpPsTWCy+bJrAZnG26Q27xfIJ+9gsZpzfx2Txpq2R0eL0o/XMFm2dy1gt
 3u+8xWgxY/JLNouLJz4xO/B7rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wei/e8ZPLYtKqT
 zePI1cWsHneu7WHzuN99nMmjb8sqRo/Pm+QCeKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxM
 LPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mpquv2Er2KJcMX/3EfYGxneyXYycHBICJhI7H19l
 62Lk4hASWMoocXvbIiaIhIzEyWkNrBC2sMSfa11sILaQwHtGicsHuUBsXgE7iaPPv7KA2CwC
 KhK7ZrWxQ8QFJU7OfAIU5+AQFUiRmN2lAxIWFnCQOL/iKCOIzSwgLnHryXywVSIC2hLfZr4G
 u4FZYD2LxL+tE5ghDupnkviw/x7YUDYBQ4mutxBHcAoESlydv5oJYpKZRNfWLqip8hLNW2cz
 T2AUmoXkjllIFs5C0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgalg27Gfm3cw
 znv1Ue8QIxMH4yFGCQ5mJRFenlKWFCHelMTKqtSi/Pii0pzU4kOMpsDAmMgsJZqcD0xGeSXx
 hmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTNIdEzfxSb5KcHnFd/TJ
 +5zgs1wrfPefUbl7NCgg0UOxe/aGqNIZExZz2TodV5t9dgYvw5Gi8/ty9ssfK+mvOyy96/cZ
 py0+J9z0j+bdOfZMcveWBvG4Ndw/eYr2svs/T+t662VwzLR44YMj8uwnM87eUvds2JAs/XGl
 4Ns7GdfXTuabXTn50YGiiXN2WLXfM8suvHB8q+CNgLLDNSdK3vyMfTr357WVPS4vYoJuhfy+
 zK3TaHQ9M2PL1aamzJLr18qqMzcY39jCdj1x1jk9xo8/dxZ7fQ9ZP8PEe4eO/zOV2Y8++Rpk
 bbfvsVxStrMuhOuVbYHBim9mWnucdC+Kcuxhey109FbkZLN41eLo4iYlluKMREMt5qLiRAAu
 /iLUjgMAAA==
X-CMS-MailID: 20230306110247eucas1p1dc0f813b7660e97c191948e5b5fe9892
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230303145219eucas1p218c2e302e41464432627c8ac074302f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230303145219eucas1p218c2e302e41464432627c8ac074302f8
References: <CGME20230303145219eucas1p218c2e302e41464432627c8ac074302f8@eucas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
 <CAMty3ZC1U3eDmtWa_sx0Sop_V1vU3fSM=r21U9qPf0UmCYTOkA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 04.03.2023 19:59, Jagan Teki wrote:
> On Sat, Mar 4, 2023 at 3:56 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 03.03.2023 15:51, Jagan Teki wrote:
>>> This series supports common bridge support for Samsung MIPI DSIM
>>> which is used in Exynos and i.MX8MM SoC's.
>>>
>>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>>>
>>> Inki Dae: please note that this series added on top of exynos-drm-next
>>> since few exynos dsi changes are not been part of drm-misc-next.
>>> Request you to pick these via exynos-drm-next, or let me know if you
>>> have any comments?
>> I gave it a try on Exynos TM2e and unfortunately it nukes again:
>>
>> exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops)
>> Unable to handle kernel paging request at virtual address 003d454d414e5675
>> ...
>> [003d454d414e5675] address between user and kernel address ranges
>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> Modules linked in:
>> CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+ #13341
>> Hardware name: Samsung TM2E board (DT)
>> Workqueue: events_unbound deferred_probe_work_func
>> pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : drm_connector_list_iter_next+0x58/0x100
>> lr : drm_connector_list_iter_next+0x2c/0x100
>> sp : ffff80000bbab910
>> ...
>> Call trace:
>>    drm_connector_list_iter_next+0x58/0x100
>>    drm_mode_config_reset+0xfc/0x144
>>    exynos_drm_bind+0x160/0x1b8
>>    try_to_bring_up_aggregate_device+0x168/0x1d4
>>    __component_add+0xa8/0x170
>>    component_add+0x14/0x20
>>    hdmi_probe+0x3fc/0x6d4
>>    platform_probe+0x68/0xd8
>>    really_probe+0x148/0x2b4
>>    __driver_probe_device+0x78/0xe0
>>    driver_probe_device+0xd8/0x160
>>    __device_attach_driver+0xb8/0x138
>>    bus_for_each_drv+0x84/0xe0
>>    __device_attach+0xa8/0x1b0
>>    device_initial_probe+0x14/0x20
>>    bus_probe_device+0xb0/0xb4
>>    deferred_probe_work_func+0x8c/0xc8
>>    process_one_work+0x288/0x6c8
>>    worker_thread+0x24c/0x450
>>    kthread+0x118/0x11c
>>    ret_from_fork+0x10/0x20
> This looks not related to dsi to me since there is no exynos_drm_dsi
> call in the trace. look hdmi related. Moreover, I think the exynos dsi
> worked well on v10 and I couldn't find any potential differences in
> terms of call flow change.
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10

Well, the issue is definitely related to this patchset. On Friday, due 
to other kernel messages, I missed the most important part of the log:

[drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2 
device
exynos-dsi 13900000.dsi: request interrupt failed with -22
panel-samsung-s6e3ha2: probe of 13900000.dsi.0 failed with error -22
exynos-drm exynos-drm: bound 13900000.dsi (ops exynos_dsi_component_ops)
exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)

It looks that the are at least 2 issues. The first one related to TE 
interrupt registration, the second is broken error path, which should 
free allocated resources and stop DRM from binding/initialization.

This patch fixes the issue (TE gpio/interrupt is optional!):

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index b4a5348b763c..ed83495fe105 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1518,7 +1518,9 @@ static int samsung_dsim_register_te_irq(struct 
samsung_dsim *dsi, struct device
         int ret;

         dsi->te_gpio = devm_gpiod_get_optional(dev, "te", GPIOD_IN);
-       if (IS_ERR(dsi->te_gpio))
+       if (!dsi->te_gpio)
+               return 0;
+       else if (IS_ERR(dsi->te_gpio))
                 return dev_err_probe(dev, PTR_ERR(dsi->te_gpio), 
"failed to get te GPIO\n");

         te_gpio_irq = gpiod_to_irq(dsi->te_gpio);


The error path in samsung_dsim_host_attach() after 
samsung_dsim_register_te_irq() failure is wrong. It lacks cleaning up 
the allocated resources (removing the bridge, detaing the dsi device).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

