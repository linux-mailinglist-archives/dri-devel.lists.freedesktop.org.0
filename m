Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE845929F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 17:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B6989DD5;
	Mon, 22 Nov 2021 16:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423689DD5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 16:04:08 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211122160406euoutp0297020f0241fa967840565c1d46af22e9~56dZ464d63026930269euoutp02M
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 16:04:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211122160406euoutp0297020f0241fa967840565c1d46af22e9~56dZ464d63026930269euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1637597046;
 bh=ZTdp1tFhwirmQv3XRDebQQINeu8oqGaURVYNjVg6624=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=AvXowIMOCufAtcjo7tXMhO3cUbkR7ChX2SjC1yxUQOaUKQHvgT4TYvYKe87s07okI
 lPHscOyFu+kv9grd035E/Oj2xbizoB+HibsUu5JgrZfaNhMXxiEBY/m40a4kDrSa77
 Drh8pUEqddzsSQvokKHSQ+mBuoFEQH/5zNiCIUAw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211122160406eucas1p18fac046acc60c5b26136899d1d6e6c23~56dZg7Tp61549715497eucas1p1J;
 Mon, 22 Nov 2021 16:04:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C7.D4.10260.67FBB916; Mon, 22
 Nov 2021 16:04:06 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211122160406eucas1p213f595c192e149838ff47180ef6249bb~56dZFTjt91048610486eucas1p2y;
 Mon, 22 Nov 2021 16:04:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211122160406eusmtrp1f3de495b5bd270e51bf4dcce594bcfc0~56dZEknAV2398423984eusmtrp1d;
 Mon, 22 Nov 2021 16:04:06 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-e1-619bbf76dd54
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BB.0F.09404.57FBB916; Mon, 22
 Nov 2021 16:04:05 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211122160405eusmtip17096890470a71a58a7fd75c4296db52e~56dYgRqg22869128691eusmtip1V;
 Mon, 22 Nov 2021 16:04:05 +0000 (GMT)
Message-ID: <45de6555-7407-5f48-247b-4d093eb17fe2@samsung.com>
Date: Mon, 22 Nov 2021 17:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <1a195d36-3ac0-389e-442f-ebeb7f85ab40@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7pl+2cnGkxt5Le4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGoL9ri06yHzBYrfm5ldOD0WPvxPqvH+xut7B6zO2ay
 eize85LJ4861PWwe97uPM3ksmXaVzaNvyyrGAI4oLpuU1JzMstQifbsEroytD+YwFWyxrlj4
 8j1bA+MW4y5GDg4JAROJw8ejuxi5OIQEVjBKTJx7hAnC+cIo0TjlNAuE85lRYtqXVrYuRk6w
 jg+rLrFDJJYzShxYu4cRwvnIKNF7dQFYFa+AncStebeZQGwWAVWJbyc+M0HEBSVOznzCAmKL
 CiRJnG6dxAxiCws4Sxx5t4wRxGYWEJe49WQ+WD2bgKFE19susJkiAtoS32a+ZgNZxixwgEli
 yfkJ7CAJTgF7iQknetkhmuUlmrfOZgYpkhBo5pT4+3UxC8TdLhLTv05ngrCFJV4d38IOYctI
 nJ7cwwLVwCjx8Nxadginh1HictMMRogqa4k7536xgcKMWUBTYv0ufYiwo8SWyYuYIEHJJ3Hj
 rSDEEXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1CCpdZSP6fheSdWQh7FzCyrGIU
 Ty0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMXKf/Hf+6g3HFq496hxiZOBgPMUpwMCuJ8F5b
 MjtRiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/In4ZEIYH0xJLU7NTUgtQimCwTB6dUA1ODm1Ds
 2+25EWvtzn7+0KtU8Sn0jdvVCQ0Ki9nuugWJPp+XVJK579+WL784G0v2qE6p4/c9KbskbuXj
 4pgfK7dMfjhxNYfuZbvNk1J1n3kwyU0qktt5gG8a3x/psvubq5P7D7Ac2VybdrKNey2LH5ey
 3/fqOTvUZ3N/bxPIFLHatDfr9YNXi7dw7hKZPl92Qb1ENePq7atKnFyebn7m/GOa3cmpDyq5
 TDva/q9aPOfs3zQpZ7/qPDd+/etWmbqvxJmC6nR2BtYqdVjVfKwJ3rqdy7Kum+OUfXjrC/Wp
 5juZEnges1efntg5qfb2vA/mWsYRyqX6734krZ8keuXXhc+RojeT5//z+9vO7zhV+ZYSS3FG
 oqEWc1FxIgCySp5JywMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7ql+2cnGkw4rGtxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJQX7TFp1kPmS1W/NzK6MDpsfbjfVaP9zda2T1md8xk
 9Vi85yWTx51re9g87ncfZ/JYMu0qm0ffllWMARxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlbH8xhKthiXbHw5Xu2BsYtxl2MnBwSAiYSH1Zd
 Yu9i5OIQEljKKNHyYzorREJG4uS0BihbWOLPtS42iKL3jBILZ1xnAUnwCthJ3Jp3mwnEZhFQ
 lfh24jMTRFxQ4uTMJ2A1ogJJEv3fdzGD2MICzhJH3i1jBLGZBcQlbj2ZD1bPJmAo0fUWZAEn
 h4iAtsS3ma/BljELHGCS2PR7BivE5g4WiUurZ4CdxClgLzHhRC87xCQzia6tXVBT5SWat85m
 nsAoNAvJIbOQLJyFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAmN127GfW3Yw
 rnz1Ue8QIxMH4yFGCQ5mJRHea0tmJwrxpiRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGCyyCuJ
 NzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYIrwumKVttilqoHj/OOV
 UxWKlwiaiFXY1GvUWZ0S2um25MHSP0KbCs44pMUk9uvLTm1sV/4i+Jr5W8aO9J6bF3q1hNdu
 WyhmulAiNWj5a2Nb9S2dXHPEA7n3vzw093nUy0iBs+1vJdWUrtXxyjVM9nycxrvk/WNpvjyN
 p7HKepelyg1+bzUM1/gcvLybecffX9NWXdmbHiFwusPzaYwN8+8dK3l8LE7seqdYzcgStPSx
 z0t9a6PDvxUtg9peuL/P0vAzn5D1acL+WQ//+5csPiBs+987bKKIaeUBwy1/f9SesFpS9VTo
 bVZ36Rlh1qmh1dtt9zFXrZRZIvdUcJO6ySapMN09P3un1f1iXRRapMRSnJFoqMVcVJwIAKIt
 rqxeAwAA
X-CMS-MailID: 20211122160406eucas1p213f595c192e149838ff47180ef6249bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
 <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
 <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
 <CAMty3ZA_UsvmTprozT+MgfZ4Q4LthSk340rV_0YwcmTy1Vyk4w@mail.gmail.com>
 <CAMty3ZBp7_JFvsBcQTpRMBYS7oWcT0TagUW2uQRGMuaakzF+cQ@mail.gmail.com>
 <1a195d36-3ac0-389e-442f-ebeb7f85ab40@samsung.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.11.2021 16:07, Marek Szyprowski wrote:
> On 22.11.2021 15:55, Jagan Teki wrote:
>> On Mon, Nov 22, 2021 at 7:59 PM Jagan Teki 
>> <jagan@amarulasolutions.com> wrote:
>>> On Mon, Nov 22, 2021 at 7:51 PM Jagan Teki 
>>> <jagan@amarulasolutions.com> wrote:
>>>> On Mon, Nov 22, 2021 at 7:45 PM Marek Szyprowski
>>>> <m.szyprowski@samsung.com> wrote:
>>>>> On 22.11.2021 08:06, Jagan Teki wrote:
>>>>>> Some display panels would come up with a non-DSI output, those
>>>>>> can have an option to connect the DSI host by means of interface
>>>>>> bridge converter.
>>>>>>
>>>>>> This DSI to non-DSI interface bridge converter would requires
>>>>>> DSI Host to handle drm bridge functionalities in order to DSI
>>>>>> Host to Interface bridge.
>>>>>>
>>>>>> This patch convert the existing to a drm bridge driver with a
>>>>>> built-in encoder support for compatibility with existing
>>>>>> component drivers.
>>>>>>
>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>> ---
>>>>>> Note:
>>>>>> Hi Marek Szyprowski,
>>>>>>
>>>>>> Please test this on Panel and Bridge hardware.
>>>>> I don't have good news, t crashes:
>>>>>
>>>>> [drm] Exynos DRM: using 13800000.decon device for DMA mapping 
>>>>> operations
>>>>> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
>>>>> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
>>>>> exynos-drm exynos-drm: bound 13930000.mic (ops 
>>>>> exynos_mic_component_ops)
>>>>> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>>>>> /soc@0/dsi@13900000 to encoder TMDS-67: -22
>>>>> exynos-drm exynos-drm: failed to bind 13900000.dsi (ops
>>>>> exynos_dsi_component_ops): -22
>>>>> Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
>>>>> Modules linked in:
>>>>> CPU: 2 PID: 74 Comm: kworker/u16:1 Not tainted 5.16.0-rc1+ #4141
>>>>> Hardware name: Samsung TM2E board (DT)
>>>>> Workqueue: events_unbound deferred_probe_work_func
>>>>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> pc : decon_atomic_disable+0x58/0xd4
>>>>> lr : decon_atomic_disable+0x28/0xd4
>>>>> sp : ffff80001390b940
>>>>> x29: ffff80001390b940 x28: ffff80001259a000 x27: ffff000027f39e80
>>>>> input: stmfts as
>>>>> /devices/platform/soc@0/14ed0000.hsi2c/i2c-3/3-0049/input/input0
>>>>> x26: 00000000ffffffea x25: ffff000025a40280 x24: 0000000000000001
>>>>> x23: ffff800011b55f98 x22: ffff0000315dc000 x21: ffff00002695d100
>>>>> x20: ffff000027e7a080 x19: ffff0000315e6000 x18: 0000000000000000
>>>>> x17: 645f736f6e797865 x16: 2073706f28206973 x15: 0000000000028ee0
>>>>> x14: 0000000000000028 x13: 0000000000000001 x12: 0000000000000040
>>>>> x11: ffff000023c18920 x10: ffff000023c18922 x9 : ffff8000126352f0
>>>>> x8 : ffff000023c00270 x7 : 0000000000000000 x6 : ffff000023c00268
>>>>> x5 : ffff000027e7a3a0 x4 : 0000000000000001 x3 : ffff000027e7a080
>>>>> x2 : 0000000000000024 x1 : ffff800013bc8024 x0 : ffff0000246117c0
>>>>> Call trace:
>>>>>    decon_atomic_disable+0x58/0xd4
>>>>>    decon_unbind+0x1c/0x3c
>>>>>    component_unbind+0x38/0x60
>>>>>    component_bind_all+0x16c/0x25c
>>>>>    exynos_drm_bind+0x104/0x1bc
>>>>>    try_to_bring_up_master+0x164/0x1d0
>>>>>    __component_add+0xa8/0x174
>>>>>    component_add+0x14/0x20
>>>>>    hdmi_probe+0x438/0x710
>>>>>    platform_probe+0x68/0xe0
>>>>>    really_probe.part.0+0x9c/0x31c
>>>>>    __driver_probe_device+0x98/0x144
>>>>>    driver_probe_device+0xc8/0x160
>>>>>    __device_attach_driver+0xb8/0x120
>>>>>    bus_for_each_drv+0x78/0xd0
>>>>>    __device_attach+0xd8/0x180
>>>>>    device_initial_probe+0x14/0x20
>>>>>    bus_probe_device+0x9c/0xa4
>>>>>    deferred_probe_work_func+0x88/0xc4
>>>>>    process_one_work+0x288/0x6f0
>>>>>    worker_thread+0x74/0x470
>>>>>    kthread+0x188/0x194
>>>>>    ret_from_fork+0x10/0x20
>>>>> Code: 11002042 f9481c61 531e7442 8b020021 (88dffc21)
>>>>> ---[ end trace d73aff585b108954 ]---
>>>>> Kernel panic - not syncing: synchronous external abort: Fatal 
>>>>> exception
>>>>> SMP: stopping secondary CPUs
>>>>> Kernel Offset: disabled
>>>>> CPU features: 0x2,300071c2,00000846
>>>>> Memory Limit: none
>>>>> ---[ end Kernel panic - not syncing: synchronous external abort: 
>>>>> Fatal
>>>>> exception ]---
>>>> Is this with Bridge or normal DSI panel?
>>> Can you apply this patch and check?
>>> https://protect2.fireeye.com/v1/url?k=aad62f08-f54d1627-aad7a447-0cc47a31cdf8-ea5858ddb7f0ecfe&q=1&e=2d730862-2c56-4988-a252-8febd02da578&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Flinux%2Fcommit%2F412f226acd774356e8188c9e62b653672926ee0d 
>>>
>> Any news on this? just asking in case if you missed it.
>
> It is somehow better. System doesn't crash, but the DRM is not bound:
>
> # cat /sys/kernel/debug/device_component/exynos-drm
> master name                                            status
> -------------------------------------------------------------
> exynos-drm                                          not bound
>
> device name                                            status
> -------------------------------------------------------------
> 13800000.decon                                      not bound
> 13880000.decon                                      not bound
> 13930000.mic                                        not bound
> (unknown)                                      not registered
> (unknown)                                      not registered
>
Well, I also checked a much simpler case, the Samsung Trats board 
(arch/arm/boot/dts/exynos4210-trats.dts). It has only Exynos FIMD 
(CRTC), Exynos DSI (encoder) and s6e8aa0 panel. No bridges at all. With 
only the $subject patch applied I got the following errors:

exynos4-fb 11c00000.fimd: Adding to iommu group 0
OF: graph: no port node found in /soc/fimd@11c00000
[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
[drm:drm_bridge_attach] *ERROR* failed to attach bridge 
/soc/dsi@11c80000 to encoder TMDS-50: -22
exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops 
exynos_dsi_component_ops): -22
exynos-drm exynos-drm: master bind failed: -22
exynos-drm: probe of exynos-drm failed with error -22
lima 13000000.gpu: gp - mali400 version major 1 minor 1
lima 13000000.gpu: pp0 - mali400 version major 1 minor 1
lima 13000000.gpu: pp1 - mali400 version major 1 minor 1
lima 13000000.gpu: pp2 - mali400 version major 1 minor 1
lima 13000000.gpu: pp3 - mali400 version major 1 minor 1
lima 13000000.gpu: l2 cache 128K, 4-way, 64byte cache line, 64bit 
external bus
lima 13000000.gpu: bus rate = 200000000
lima 13000000.gpu: mod rate = 100000000
lima 13000000.gpu: dev_pm_opp_set_regulators: no regulator (mali) found: -19
[drm] Initialized lima 1.1.0 20191231 for 13000000.gpu on minor 0


After applying "drm: exynos: dsi: Add component only once DSI device 
attached" the Exynos DRM is not even tried to bind:

# dmesg | grep drm
[    2.495898] [drm] Initialized lima 1.1.0 20191231 for 13000000.gpu on 
minor 0

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

