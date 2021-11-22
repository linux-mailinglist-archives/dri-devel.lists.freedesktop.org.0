Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE74590EB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1556E051;
	Mon, 22 Nov 2021 15:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ED26E051
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:07:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211122150747euoutp0125a0050f8bedfcd24a76e6d952fd756a~55sO5RHkR1718617186euoutp01-
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:07:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211122150747euoutp0125a0050f8bedfcd24a76e6d952fd756a~55sO5RHkR1718617186euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1637593667;
 bh=XHwNaSgLtXUX3hSphFUL5C93RUhv9jMmdqgMf2Kn78w=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=kXQGSnmAm9qdB2a+3gg3rOUpQ/IpP+nZRWAo2UsfcUWFZTKW4EcZZ16pMaASf6JKY
 SkB0JFA+Q0BZvb3aCuIluiu8AC0UNGMPeI05g6IyERhS45pew+Tbdw68WAdy6m22pQ
 gIiNs8sKEt6tT8EfkF3r3CBuyQ6J/kKZgmuPyFSw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211122150747eucas1p1168769493e74936ab59fdf82cc8f2dd3~55sOmxt4l2693026930eucas1p16;
 Mon, 22 Nov 2021 15:07:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 12.E9.10260.342BB916; Mon, 22
 Nov 2021 15:07:47 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211122150747eucas1p23bd7b8aa703e1e4c2c8ce3e2461bed3d~55sOULPMg2689326893eucas1p2W;
 Mon, 22 Nov 2021 15:07:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211122150747eusmtrp21c8e993947205bbe52aa7bf66a7bf96f~55sOTUErr2615726157eusmtrp2V;
 Mon, 22 Nov 2021 15:07:47 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-22-619bb2430838
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.DA.09522.342BB916; Mon, 22
 Nov 2021 15:07:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211122150746eusmtip198f6632b08c53f078bf401a9516ef34e~55sNxnSGg1681716817eusmtip1Z;
 Mon, 22 Nov 2021 15:07:46 +0000 (GMT)
Message-ID: <1a195d36-3ac0-389e-442f-ebeb7f85ab40@samsung.com>
Date: Mon, 22 Nov 2021 16:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBp7_JFvsBcQTpRMBYS7oWcT0TagUW2uQRGMuaakzF+cQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djP87rOm2YnGhxq17G4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGoL9ri06yHzBYrfm5ldOD0WPvxPqvH+xut7B6zO2ay
 eize85LJ4861PWwe97uPM3ksmXaVzaNvyyrGAI4oLpuU1JzMstQifbsEroz917azF+zTqfj6
 5hBzA+MltS5GTg4JAROJu5fvsnUxcnEICaxglDh8ZiYrhPMFyLm0jB3C+cwosf3fClaYlvcN
 axkhEssZJfbsvw/V8pFRYubhDhaQKl4BO4mu/m42EJtFQFXizKI1TBBxQYmTM5+A1YgKJEmc
 bp3EDGILCzhLHHm3jBHEZhYQl7j1ZD5YvYiAtsS3ma/BDmQWOMAkseT8BHaQBJuAoUTX2y6w
 BZwCgRLLZ+1mhmiWl2jeOpsZpEFCoJ1TYv6sw+wQd7tIHH90CMoWlnh1fAuULSPxfyfINpCG
 ZkaJh+fWskM4PYwSl5tmMEJUWUvcOfcLaB0H0ApNifW79CHCjhJbJi9iAglLCPBJ3HgrCHEE
 n8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5DCZRaS/2cheWcWwt4FjCyrGMVTS4tz
 01OLjfNSy/WKE3OLS/PS9ZLzczcxAlPX6X/Hv+5gXPHqo94hRiYOxkOMEhzMSiK815bMThTi
 TUmsrEotyo8vKs1JLT7EKM3BoiTOK/KnIVFIID2xJDU7NbUgtQgmy8TBKdXAZNwWcX1frcml
 ks//ZgvHf8ktmpSsuingmWB1bhjjJu7HLffY9iZHOaxesq7xrLzYvb05/PvMNONjNa9m+n/Y
 GFvBLC0ZalA08c+scls9/W9X8g+0Ztz6MknHOPvfXv9LTL6yW47+mhVhFnpIs+mWUfAlhV1f
 Ii2vP43dEPmG5Z5D8uJv9pw/rTZms5wPvZKYb6/xd62Y+SP3B1/lX05N051zhZFLXmp20b/O
 9EOKkge/sWyS1lx5wdbLMfyev92zNzavRPdPqMoJn1E84yTLzFVd1zdH8RWwcmzuOH5u2wfJ
 4lk9P4oiLxW4KeUw3eN27C73VGZeKFSq48617I7uupgpRR4q1ZaTli6407JViaU4I9FQi7mo
 OBEArhegicwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7rOm2YnGly+K25xf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJQX7TFp1kPmS1W/NzK6MDpsfbjfVaP9zda2T1md8xk
 9Vi85yWTx51re9g87ncfZ/JYMu0qm0ffllWMARxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehn7r21nL9inU/H1zSHmBsZLal2MnBwSAiYS7xvW
 MnYxcnEICSxllLjesZUJIiEjcXJaAyuELSzx51oXG0TRe0aJvo0bWUASvAJ2El393WwgNouA
 qsSZRWuYIOKCEidnPgGrERVIkuj/vosZxBYWcJY48m4ZI4jNLCAucevJfLB6EQFtiW8zX4Mt
 YBY4wCSx6fcMsM1CApeZJf4stwGx2QQMJbredoEt4xQIlFg+azczxCAzia6tXVBD5SWat85m
 nsAoNAvJHbOQ7JuFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAiN127Gfm3cw
 znv1Ue8QIxMH4yFGCQ5mJRHea0tmJwrxpiRWVqUW5ccXleakFh9iNAUGxkRmKdHkfGCqyCuJ
 NzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYGryeGc9ZYds/gZ71Wt5
 C66cXX+apX7CxQ+/rEs3ucnedpqocKT7XMAJ+/MFb3L6Xm53uRZqceCi5KHX2Us704MjfP9s
 1Dk8I8QlqZZnyv3QaQVvZy7Yn9jRoJT2OnmNxmTZSR9vnT51+n1Vl/MHhn3N9iUL+/95v2Vw
 Y/K4xRH8totZY0nnLIut+3ILpoQm9HxSj1i7u5Bvd1F0EeeXH0/e/vnkfl3N8sPflhfHpaSu
 LHu+lPPysuurpHzP7wt2Cbnxa3b7W6k58u09d0/ND1ZQ9myZxezRv+H8mYzyM1/eslVp1DxW
 Wf7R9epuzqTlcSlF0/pSuHV+rQ6JWBLmkXx9l9dxgfnz3rEY9E0zNPqkxFKckWioxVxUnAgA
 Og+ZDF0DAAA=
X-CMS-MailID: 20211122150747eucas1p23bd7b8aa703e1e4c2c8ce3e2461bed3d
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

On 22.11.2021 15:55, Jagan Teki wrote:
> On Mon, Nov 22, 2021 at 7:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>> On Mon, Nov 22, 2021 at 7:51 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>> On Mon, Nov 22, 2021 at 7:45 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 22.11.2021 08:06, Jagan Teki wrote:
>>>>> Some display panels would come up with a non-DSI output, those
>>>>> can have an option to connect the DSI host by means of interface
>>>>> bridge converter.
>>>>>
>>>>> This DSI to non-DSI interface bridge converter would requires
>>>>> DSI Host to handle drm bridge functionalities in order to DSI
>>>>> Host to Interface bridge.
>>>>>
>>>>> This patch convert the existing to a drm bridge driver with a
>>>>> built-in encoder support for compatibility with existing
>>>>> component drivers.
>>>>>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>> Note:
>>>>> Hi Marek Szyprowski,
>>>>>
>>>>> Please test this on Panel and Bridge hardware.
>>>> I don't have good news, t crashes:
>>>>
>>>> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
>>>> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
>>>> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
>>>> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
>>>> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>>>> /soc@0/dsi@13900000 to encoder TMDS-67: -22
>>>> exynos-drm exynos-drm: failed to bind 13900000.dsi (ops
>>>> exynos_dsi_component_ops): -22
>>>> Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
>>>> Modules linked in:
>>>> CPU: 2 PID: 74 Comm: kworker/u16:1 Not tainted 5.16.0-rc1+ #4141
>>>> Hardware name: Samsung TM2E board (DT)
>>>> Workqueue: events_unbound deferred_probe_work_func
>>>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> pc : decon_atomic_disable+0x58/0xd4
>>>> lr : decon_atomic_disable+0x28/0xd4
>>>> sp : ffff80001390b940
>>>> x29: ffff80001390b940 x28: ffff80001259a000 x27: ffff000027f39e80
>>>> input: stmfts as
>>>> /devices/platform/soc@0/14ed0000.hsi2c/i2c-3/3-0049/input/input0
>>>> x26: 00000000ffffffea x25: ffff000025a40280 x24: 0000000000000001
>>>> x23: ffff800011b55f98 x22: ffff0000315dc000 x21: ffff00002695d100
>>>> x20: ffff000027e7a080 x19: ffff0000315e6000 x18: 0000000000000000
>>>> x17: 645f736f6e797865 x16: 2073706f28206973 x15: 0000000000028ee0
>>>> x14: 0000000000000028 x13: 0000000000000001 x12: 0000000000000040
>>>> x11: ffff000023c18920 x10: ffff000023c18922 x9 : ffff8000126352f0
>>>> x8 : ffff000023c00270 x7 : 0000000000000000 x6 : ffff000023c00268
>>>> x5 : ffff000027e7a3a0 x4 : 0000000000000001 x3 : ffff000027e7a080
>>>> x2 : 0000000000000024 x1 : ffff800013bc8024 x0 : ffff0000246117c0
>>>> Call trace:
>>>>    decon_atomic_disable+0x58/0xd4
>>>>    decon_unbind+0x1c/0x3c
>>>>    component_unbind+0x38/0x60
>>>>    component_bind_all+0x16c/0x25c
>>>>    exynos_drm_bind+0x104/0x1bc
>>>>    try_to_bring_up_master+0x164/0x1d0
>>>>    __component_add+0xa8/0x174
>>>>    component_add+0x14/0x20
>>>>    hdmi_probe+0x438/0x710
>>>>    platform_probe+0x68/0xe0
>>>>    really_probe.part.0+0x9c/0x31c
>>>>    __driver_probe_device+0x98/0x144
>>>>    driver_probe_device+0xc8/0x160
>>>>    __device_attach_driver+0xb8/0x120
>>>>    bus_for_each_drv+0x78/0xd0
>>>>    __device_attach+0xd8/0x180
>>>>    device_initial_probe+0x14/0x20
>>>>    bus_probe_device+0x9c/0xa4
>>>>    deferred_probe_work_func+0x88/0xc4
>>>>    process_one_work+0x288/0x6f0
>>>>    worker_thread+0x74/0x470
>>>>    kthread+0x188/0x194
>>>>    ret_from_fork+0x10/0x20
>>>> Code: 11002042 f9481c61 531e7442 8b020021 (88dffc21)
>>>> ---[ end trace d73aff585b108954 ]---
>>>> Kernel panic - not syncing: synchronous external abort: Fatal exception
>>>> SMP: stopping secondary CPUs
>>>> Kernel Offset: disabled
>>>> CPU features: 0x2,300071c2,00000846
>>>> Memory Limit: none
>>>> ---[ end Kernel panic - not syncing: synchronous external abort: Fatal
>>>> exception ]---
>>> Is this with Bridge or normal DSI panel?
>> Can you apply this patch and check?
>> https://protect2.fireeye.com/v1/url?k=aad62f08-f54d1627-aad7a447-0cc47a31cdf8-ea5858ddb7f0ecfe&q=1&e=2d730862-2c56-4988-a252-8febd02da578&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Flinux%2Fcommit%2F412f226acd774356e8188c9e62b653672926ee0d
> Any news on this? just asking in case if you missed it.

It is somehow better. System doesn't crash, but the DRM is not bound:

# cat /sys/kernel/debug/device_component/exynos-drm
master name                                            status
-------------------------------------------------------------
exynos-drm                                          not bound

device name                                            status
-------------------------------------------------------------
13800000.decon                                      not bound
13880000.decon                                      not bound
13930000.mic                                        not bound
(unknown)                                      not registered
(unknown)                                      not registered

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

