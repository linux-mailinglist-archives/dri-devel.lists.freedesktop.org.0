Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B09459066
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B8689E69;
	Mon, 22 Nov 2021 14:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D7789E69
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:41:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211122144116euoutp0185ae54bab39298a9ed0caeff5bbdc4db~55VFRXkn82122821228euoutp01b
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:41:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211122144116euoutp0185ae54bab39298a9ed0caeff5bbdc4db~55VFRXkn82122821228euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1637592076;
 bh=x2AfTh30TOQHk8og5cqG64DKy6jWn6//h/q6ANsAkaU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Un9uxrIGCjsXYiKmKgziBMeilHO0sM5u0J9d+uFIaETCfAEy9gin0HErVltwHwncK
 yZQOt8wKnZMYS9e8pHVXiTHWoTbuz8JsutaMo5eYtG8VqKql/TnxeZ9Hj2JUCGZwK3
 CMh4fwoySkd0+L23pbLd3f5FdCCjGuNAgMD1UrKU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211122144116eucas1p120464b6c6967f53a46428f8dd0f48337~55VE7Tf9s2745927459eucas1p1n;
 Mon, 22 Nov 2021 14:41:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A0.A1.09887.C0CAB916; Mon, 22
 Nov 2021 14:41:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211122144116eucas1p1babbd462e7b101a2ebc77835659ae175~55VEg5dl-1657316573eucas1p1U;
 Mon, 22 Nov 2021 14:41:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211122144116eusmtrp2c6eb8ae2499346737e834cd009120d47~55VEgJu7e1036610366eusmtrp2H;
 Mon, 22 Nov 2021 14:41:16 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-49-619bac0c5335
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3B.80.09404.C0CAB916; Mon, 22
 Nov 2021 14:41:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211122144115eusmtip22a28cc0657181d073ae22935bff66c1e~55VD_jN_11589615896eusmtip2L;
 Mon, 22 Nov 2021 14:41:15 +0000 (GMT)
Message-ID: <d075cbe2-8321-b7c1-89e5-1e5b0cf5ac9f@samsung.com>
Date: Mon, 22 Nov 2021 15:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTYRTM1122W6RmLRhewIM0HgEUFI+sqQfGI/tHrdF4RmWRDSClaku9
 olJFPIpHQUFbjKIQSlRABbkUgSpWNIIHVyumIsREBBsOD7yQdlH5N2/em8zMl4/EJKVuPmS0
 Mo5TKVmFlHDHix711071uJHOTjPfDKHtmb04Xf/ZQdApdj1O993WE/SJ5CwhbdLfJ2jz6Y10
 j7EVo3P676BQEZPbbXdjHM2JQib9uMGNybz3QcC0NN4jGHuSRcBkpTUQzOnCa0hObnCfG8Ep
 ondxquD5Ye5RD1LT8B0Zfnta874LtSjBV4dEJFAz4VKFFdchd1JC5SB4f6sF44c+BMaLlUJ+
 6EXw69Rl4q8kNTt/SGJCYDOkDUm6EWQeS3JzXomp+aBNLRc4MU5NhBtfC3CeHwU1hnYXHk2F
 w9PEFMyJPalF8PBTNnJijPIGW/tll9aLCoQvho+E0wCjKgWQVacXOhcENR10XTpXJBG1Ega+
 5Ql58Xgo7rroSgRUggguWAswPvdiuPu4eqiDJ3RYCoU8HgMDpU43lwBBa22ukB9OInh1+ALi
 r2TQUvt9UE0OWvhDflkwTy+EwrNXBU4aqJHQ3DWKDzESUorOYzwthuNHJfz1JDBa8v7ZVj1/
 iemR1DjsXYzD+huH1TH+981A+DXkzWnUsZGcOkTJ7Q5Ss7FqjTIyaOv22Nto8Hc9/W3pK0Gm
 ju4gMxKQyIyAxKRe4sasdFYijmD37uNU27eoNApObUa+JC71Fnv91LISKpKN42I4bgen+rsV
 kCIfrYDd3/+CtdRtGtG54nfyupU+IWMaC0srlzc1PZtV47FsXG14hcHuNenUjxll3k01wXM3
 rvFQTjg2ev+VS/GePYaBFQGK7K5yLGJBw6OD76JatR0picSC7hLPJVFk702PsN0f1yQ9aej8
 NHbnVJXDZDwSLpNrIqzx8WsPyEKqt+qtGza96TlX0+LXEX3W/61aVzBPhuRc+UELHCLabKUf
 fr3OXTW2eNvEye/bYsaX+RpyHFJbWNXkd9e/ZLChksoz6+X1U3CF7D6XHnq058XJ+tWahNTN
 S5Otjzc3BjLyzIYK68syNLvt8+qYcW0ZtgD5+cj2/Ft1Jv/AWSU/njs0jjzpHL0UV0ex0wMw
 lZr9A1qyd9/MAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7o8a2YnGhyaIG5xf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJQX7TFp1kPmS1W/NzK6MDpsfbjfVaP9zda2T1md8xk
 9Vi85yWTx51re9g87ncfZ/JYMu0qm0ffllWMARxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmHp05jKVigUPFw3S/2BsZm6S5GTg4JAROJqcvW
 s3QxcnEICSxllJj3vpUVIiEjcXJaA5QtLPHnWhcbRNF7RonmK5fAErwCdhINU/cygdgsAqoS
 a75vZoGIC0qcnPkEzBYVSJLo/76LGcQWFnCWOPJuGSOIzSwgLnHryXywXhEBbYlvM1+DLWAW
 OMAksen3DFaIbUeZJC6/vghWxSZgKNH1FuQMTg5OgUCJ/z/WsUNMMpPo2toFNVVeYvvbOcwT
 GIVmITlkFpKFs5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgrG479nPLDsaV
 rz7qHWJk4mA8xCjBwawkwnttyexEId6UxMqq1KL8+KLSnNTiQ4ymwNCYyCwlmpwPTBZ5JfGG
 ZgamhiZmlgamlmbGSuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MAk+Zb6112rTtXDvX8kWu
 7B1z50jwrOQ//J8z/vaiuKZ5/HfydvJHuLUdb1yUP9vwxf/+jG2L7gdu7tzXebmYNSb4N6ci
 11vWz4YqV49zbHolGhLoLvNE84zCsvoGxa3dyxd6KkhqnPZwidHvncsrt031Soip6RHv0od3
 py73S9V40NPuHB+2I8As8oRUgXmW9fvlVxYt5j9WwvWM46bS2ZL/T0IuL+CZoMb85XgT7/2+
 XXMFVy6ZbW+x85P3jYfuGos8hGL9Nky3veNxm7Wp4NHO9dtf8S4LWVbfd26T5tz7K/7+uWq8
 dYnpDp0tzf0sndxyjdd9W1V4tksV/Lp0uL+jKu72wpTX01lfHbqyXYmlOCPRUIu5qDgRAJF2
 hiteAwAA
X-CMS-MailID: 20211122144116eucas1p1babbd462e7b101a2ebc77835659ae175
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

Hi Jagan,

On 22.11.2021 15:21, Jagan Teki wrote:
> On Mon, Nov 22, 2021 at 7:45 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 22.11.2021 08:06, Jagan Teki wrote:
>>> Some display panels would come up with a non-DSI output, those
>>> can have an option to connect the DSI host by means of interface
>>> bridge converter.
>>>
>>> This DSI to non-DSI interface bridge converter would requires
>>> DSI Host to handle drm bridge functionalities in order to DSI
>>> Host to Interface bridge.
>>>
>>> This patch convert the existing to a drm bridge driver with a
>>> built-in encoder support for compatibility with existing
>>> component drivers.
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>> Note:
>>> Hi Marek Szyprowski,
>>>
>>> Please test this on Panel and Bridge hardware.
>> I don't have good news, t crashes:
>>
>> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
>> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
>> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
>> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
>> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>> /soc@0/dsi@13900000 to encoder TMDS-67: -22
>> exynos-drm exynos-drm: failed to bind 13900000.dsi (ops
>> exynos_dsi_component_ops): -22
>> Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
>> Modules linked in:
>> CPU: 2 PID: 74 Comm: kworker/u16:1 Not tainted 5.16.0-rc1+ #4141
>> Hardware name: Samsung TM2E board (DT)
>> Workqueue: events_unbound deferred_probe_work_func
>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : decon_atomic_disable+0x58/0xd4
>> lr : decon_atomic_disable+0x28/0xd4
>> sp : ffff80001390b940
>> x29: ffff80001390b940 x28: ffff80001259a000 x27: ffff000027f39e80
>> input: stmfts as
>> /devices/platform/soc@0/14ed0000.hsi2c/i2c-3/3-0049/input/input0
>> x26: 00000000ffffffea x25: ffff000025a40280 x24: 0000000000000001
>> x23: ffff800011b55f98 x22: ffff0000315dc000 x21: ffff00002695d100
>> x20: ffff000027e7a080 x19: ffff0000315e6000 x18: 0000000000000000
>> x17: 645f736f6e797865 x16: 2073706f28206973 x15: 0000000000028ee0
>> x14: 0000000000000028 x13: 0000000000000001 x12: 0000000000000040
>> x11: ffff000023c18920 x10: ffff000023c18922 x9 : ffff8000126352f0
>> x8 : ffff000023c00270 x7 : 0000000000000000 x6 : ffff000023c00268
>> x5 : ffff000027e7a3a0 x4 : 0000000000000001 x3 : ffff000027e7a080
>> x2 : 0000000000000024 x1 : ffff800013bc8024 x0 : ffff0000246117c0
>> Call trace:
>>    decon_atomic_disable+0x58/0xd4
>>    decon_unbind+0x1c/0x3c
>>    component_unbind+0x38/0x60
>>    component_bind_all+0x16c/0x25c
>>    exynos_drm_bind+0x104/0x1bc
>>    try_to_bring_up_master+0x164/0x1d0
>>    __component_add+0xa8/0x174
>>    component_add+0x14/0x20
>>    hdmi_probe+0x438/0x710
>>    platform_probe+0x68/0xe0
>>    really_probe.part.0+0x9c/0x31c
>>    __driver_probe_device+0x98/0x144
>>    driver_probe_device+0xc8/0x160
>>    __device_attach_driver+0xb8/0x120
>>    bus_for_each_drv+0x78/0xd0
>>    __device_attach+0xd8/0x180
>>    device_initial_probe+0x14/0x20
>>    bus_probe_device+0x9c/0xa4
>>    deferred_probe_work_func+0x88/0xc4
>>    process_one_work+0x288/0x6f0
>>    worker_thread+0x74/0x470
>>    kthread+0x188/0x194
>>    ret_from_fork+0x10/0x20
>> Code: 11002042 f9481c61 531e7442 8b020021 (88dffc21)
>> ---[ end trace d73aff585b108954 ]---
>> Kernel panic - not syncing: synchronous external abort: Fatal exception
>> SMP: stopping secondary CPUs
>> Kernel Offset: disabled
>> CPU features: 0x2,300071c2,00000846
>> Memory Limit: none
>> ---[ end Kernel panic - not syncing: synchronous external abort: Fatal
>> exception ]---
> Is this with Bridge or normal DSI panel?

This log is from the TM2e board 
(arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts) with a normal DSI panel 
and Exynos MIC bridge between Exynos Decon and Exynos DSI.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

