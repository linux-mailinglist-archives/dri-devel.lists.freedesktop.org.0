Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C7475290
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 07:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421610E21C;
	Wed, 15 Dec 2021 06:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE61510E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 06:09:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211215060948euoutp01484fed831084f52274f27fdc63317823~A2MEWiY4s2143721437euoutp01y
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 06:09:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211215060948euoutp01484fed831084f52274f27fdc63317823~A2MEWiY4s2143721437euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639548588;
 bh=qwPgwWOQuUA9YdNyUHoozCqEEJ3lpXAHtKEXW9Re11w=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=us6L+U6W25O4wPt6GI7pgMOhssGUK+8wXyqYWjMlUHZ5T7CPm6to+y30r/X/2TxoU
 6GQvNJnTQ9+8Pdv8MGxl3KWaVkN+hon0X5UkMg8hATivu84QOX5SbfdF18M144L9Xh
 1b1zEL8C/Onap2YQUHc/eNQtn+wuqdXUIiU/gh1I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211215060947eucas1p1f7be4f6550a484d1db2e7e1fc061b279~A2MD82BrJ2835328353eucas1p1a;
 Wed, 15 Dec 2021 06:09:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 86.80.09887.CA689B16; Wed, 15
 Dec 2021 06:09:48 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211215060947eucas1p171b101e6a34a3dc4a0fe158213b67dea~A2MDUWIQd2835328353eucas1p1Z;
 Wed, 15 Dec 2021 06:09:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211215060947eusmtrp2ff72ced8bffa75a1f6f8bbd77e3c75f7~A2MDTZmC51038310383eusmtrp2f;
 Wed, 15 Dec 2021 06:09:47 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-c5-61b986ac2e30
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B4.E6.09404.AA689B16; Wed, 15
 Dec 2021 06:09:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211215060946eusmtip2430ab244153cc3289c7c88bafc54f4c7~A2MCrbt4k2162321623eusmtip2l;
 Wed, 15 Dec 2021 06:09:46 +0000 (GMT)
Message-ID: <018a4243-8815-120d-a151-09182e3ad486@samsung.com>
Date: Wed, 15 Dec 2021 07:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/7] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBDHs9JM9aZims97_Z213RWMUxcz_LUX_dZGeAYFE8Eew@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djPc7pr2nYmGnxYwG5xf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKK4bFJSczLLUov07RK4Mpb1zWcr
 2HeSsWLDxHcsDYxHtzB2MXJySAiYSLy4fpyli5GLQ0hgBaPE7IcPmCGcL4wSH6/NYIRwPjNK
 LNzVDNdy7sItdojEckaJSdffsUE4Hxklrvz4wgJSxStgJ7Fq0k5WEJtFQFXiwo/1UHFBiZMz
 n4DZogJJEq0df5hAbGEBB4n/Lz+B1TMLiEvcejIfLC4ioC3xbeZrsAXMAv+YJE5teQ1WxCZg
 KNH1tosNxOYUCJQ4/P82E0SzvETz1tlgT0gI9HNKTOheywxxt4vEgZ+H2CBsYYlXx7ewQ9gy
 Ev93gmwDaWhmlHh4bi07hNPDKHG5aQbU19YSd879AurmAFqhKbF+lz5E2FFi55I3YGEJAT6J
 G28FIY7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8gVFpFlK4zELy/ywk78xC2LuAkWUV
 o3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYCI7/e/4lx2My1991DvEyMTBeIhRgoNZSYR3
 qcHORCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8yZkbEoUE0hNLUrNTUwtSi2CyTBycUg1MYf4p
 /SUcgjVOi95Gpbg3tbxMdcmelrJjEds7r/MaMcVvLtY0pDllZzjlFe4N6Zy1bXbdX8Z4E2On
 v1JhWqvKjK85PJaIbK/vLN/Ixj8rIebe8vp11nqc/acm2jr0rdONPTPNdb+Im27Gc8VnTgzt
 u2cwPQ45e/ief6+r+43vomGL9z+csz9glovE4S+BV1UW6320jt5zo/SMUUY686Y70Sqq5vWd
 Lb8vPmo2ihDpX/XpNN92S7UzrDPkbva36zFH2CdWTfZYPG+SXqaG9VSW7RY7T4SK2N6/7CO9
 8vrhmaYcjJpV8skpRTK2pTy7HxzK4+BaYLpg+hcVi1O/XnDEStlxHtzxbfYjFo8EWSWW4oxE
 Qy3mouJEAA/6xxPTAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7qr2nYmGuyYpGZxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJUYyuLxaG+aItPsx4yW6z4uZXRgctj7cf7rB7vb7Sy
 e8zumMnqsXjPSyaPO9f2sHnc7z7O5LFk2lU2j74tqxgDOKL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mpb1zWcr2HeSsWLDxHcsDYxHtzB2MXJy
 SAiYSJy7cIu9i5GLQ0hgKaPExn8fmCASMhInpzWwQtjCEn+udbFBFL1nlHj/8QQbSIJXwE5i
 1aSdYEUsAqoSF36sZ4GIC0qcnPkEzBYVSJLYvW4rWL2wgIPE/5efwOqZBcQlbj2ZD7ZMREBb
 4tvM12ALmAWamCXaTiwHKxISaGWVmPY3EsRmEzCU6HrbBTaIUyBQ4vD/20wQg8wkurZ2MULY
 8hLNW2czT2AUmoXkjllI9s1C0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgXG7
 7djPLTsYV776qHeIkYmD8RCjBAezkgjvUoOdiUK8KYmVValF+fFFpTmpxYcYTYGBMZFZSjQ5
 H5g48kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamKKCypOyFt2J
 YHoul6/qqLT70xyhJUYvBO+9ynkjtPvV7Rfp/P/Wsbo+NgqY+jfsiplTaY145K5fHzumzbxr
 d+a5VZjmoc8sVgEBnZN3Xzl9PDC472/5zAyTPd4X/AvXal3rfxkRdHiDasnTR7+vZ4grvdxd
 n5JVckhbRtvo/uH52hfL3D7wmirsOnW6V+Gyzx/lU5tKlDZc9DYIDXvbuPzxie8hm1aFvItc
 4/34+OannUsjDcx3NKxnmFxt/WFF4fPT5zmXHc/atfarhuxT2Qqt66UvyysOzT/Fyq82cVrm
 Yj2Luqpfex1/nProWqxR9Px/85aITo17d675quvW7Cr6NenXvni3uhUNie9MnlcosRRnJBpq
 MRcVJwIAmfHFOmQDAAA=
X-CMS-MailID: 20211215060947eucas1p171b101e6a34a3dc4a0fe158213b67dea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0
References: <CGME20211212181442eucas1p2fe9d69d619f7f68be4473b79ddd136b0@eucas1p2.samsung.com>
 <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <9c1f6bed-2a62-4d85-1bd0-95c0bd5f6c89@samsung.com>
 <CAMty3ZAX2thXTBcpwtUwP16wteKE_1OwWqPBivWTuRKb=B8ghQ@mail.gmail.com>
 <2b5810d5-8af7-f960-94fb-bd08188a9ae8@samsung.com>
 <CAMty3ZAsmMd0Vou0GhM=PbHF7=bDztbR6TV8QfQ95WESum9QQQ@mail.gmail.com>
 <bd410fb0-6594-e9ea-4163-0d0f2fcdfabe@samsung.com>
 <CAMty3ZBR-n0QS5DETYRmDFkcFv2QdOL8BfTmbduq7kHK=hBmAw@mail.gmail.com>
 <10780d37-76eb-23bd-48e5-809ff3cd465e@samsung.com>
 <CAMty3ZBDHs9JM9aZims97_Z213RWMUxcz_LUX_dZGeAYFE8Eew@mail.gmail.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 14.12.2021 11:47, Jagan Teki wrote:
> On Mon, Dec 13, 2021 at 7:42 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 13.12.2021 14:56, Jagan Teki wrote:
>>> On Mon, Dec 13, 2021 at 6:51 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 13.12.2021 13:31, Jagan Teki wrote:
>>>>> On Mon, Dec 13, 2021 at 5:42 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 13.12.2021 13:08, Jagan Teki wrote:
>>>>>>> On Mon, Dec 13, 2021 at 5:34 PM Marek Szyprowski
>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>> On 12.12.2021 19:14, Jagan Teki wrote:
>>>>>>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>>>>>>
>>>>>>>>> Patch 1: panel checker
>>>>>>>>>
>>>>>>>>> Patch 2: panel_bridge API
>>>>>>>>>
>>>>>>>>> Patch 3: Bridge conversion
>>>>>>>>>
>>>>>>>>> Patch 4: pree_enable, post_disable
>>>>>>>>>
>>>>>>>>> Patch 5: Atomic functions
>>>>>>>>>
>>>>>>>>> Patch 6: atomic_set
>>>>>>>>>
>>>>>>>>> Patch 7: DSI init in enable
>>>>>>>>>
>>>>>>>>> [1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/
>>>>>>>>>
>>>>>>>>> Any inputs?
>>>>>>>> I've checked this patchset on Exynos based Trats2 board (the one with
>>>>>>>> simplest display pipeline: Exynos FIMD -> Exynos DSI -> s6e8aa0 DSI
>>>>>>>> panel). DRM stops working after the 2nd patch ("[PATCH v3 2/7] drm:
>>>>>>>> exynos: dsi: Use drm panel_bridge API"):
>>>>>>>>
>>>>>>>> > [...]
>>> Thanks for testing it.
>>>
>>> Can you test it on the downstream bridge, tc358764 and post the result?
>> There were 2 logs in my reply. One from trats2 board (just dsi panel)
>> and one from arndale (tc bridge + simple panel).
> Okay. Got it.
>
> Can you test this tc358764 panel_bridge patch on linux-next? don't
> apply this series, apply only below patch and test.
>
Yes, sure. Sadly, it also breaks display operation:

OF: graph: no port node found in /soc/hdmi@14530000
[drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
OF: graph: no port node found in /soc/dsi@14500000
exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
[drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
panfrost 11800000.gpu: clock rate = 533000000
panfrost 11800000.gpu: mali-t600 id 0x600 major 0x0 minor 0x0 status 0x1
panfrost 11800000.gpu: features: 00000000,10206000, issues: 
00000000,31b4dfff
panfrost 11800000.gpu: Features: L2:0x07110206 Shader:0x00000000 
Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xf JS:0x7
panfrost 11800000.gpu: shader_present=0xf l2_present=0x1
[drm] Initialized panfrost 1.2.0 20180908 for 11800000.gpu on minor 1
------------[ cut here ]------------
WARNING: CPU: 1 PID: 23 at drivers/gpu/drm/drm_atomic_state_helper.c:494 
drm_atomic_helper_connector_duplicate_state+0x60/0x68
Modules linked in:
CPU: 1 PID: 23 Comm: kworker/1:1 Not tainted 
5.16.0-rc5-next-20211213-00001-gac4117943791 #11072
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events output_poll_execute
[<c01110d0>] (unwind_backtrace) from [<c010cab0>] (show_stack+0x10/0x14)
[<c010cab0>] (show_stack) from [<c0b71b58>] (dump_stack_lvl+0x58/0x70)
[<c0b71b58>] (dump_stack_lvl) from [<c0126c9c>] (__warn+0x228/0x22c)
[<c0126c9c>] (__warn) from [<c0126d4c>] (warn_slowpath_fmt+0xac/0xb4)
[<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state+0x60/0x68)
[<c064e844>] (drm_atomic_helper_connector_duplicate_state) from 
[<c06685f4>] (drm_atomic_get_connector_state+0xd8/0x190)
[<c06685f4>] (drm_atomic_get_connector_state) from [<c066960c>] 
(__drm_atomic_helper_set_config+0x2a0/0x368)
[<c066960c>] (__drm_atomic_helper_set_config) from [<c0680a20>] 
(drm_client_modeset_commit_atomic+0x178/0x27c)
[<c0680a20>] (drm_client_modeset_commit_atomic) from [<c0680be0>] 
(drm_client_modeset_commit_locked+0x48/0x1d0)
[<c0680be0>] (drm_client_modeset_commit_locked) from [<c0680d8c>] 
(drm_client_modeset_commit+0x24/0x40)
[<c0680d8c>] (drm_client_modeset_commit) from [<c0652a94>] 
(__drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xc8)
[<c0652a94>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from 
[<c0652b60>] (drm_fb_helper_set_par+0x38/0x64)
[<c0652b60>] (drm_fb_helper_set_par) from [<c0652c34>] 
(drm_fb_helper_hotplug_event.part.5+0xa8/0xc0)
[<c0652c34>] (drm_fb_helper_hotplug_event.part.5) from [<c063dfbc>] 
(drm_kms_helper_hotplug_event+0x24/0x30)
[<c063dfbc>] (drm_kms_helper_hotplug_event) from [<c063e210>] 
(output_poll_execute+0x1ec/0x204)
[<c063e210>] (output_poll_execute) from [<c0148990>] 
(process_one_work+0x2c8/0x7ec)
[<c0148990>] (process_one_work) from [<c0148f04>] (worker_thread+0x50/0x584)
[<c0148f04>] (worker_thread) from [<c0151300>] (kthread+0x13c/0x19c)
[<c0151300>] (kthread) from [<c0100108>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc1d35fb0 to 0xc1d35ff8)
5fa0:                                     00000000 00000000 00000000 
00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 1287
hardirqs last  enabled at (1293): [<c01a3b94>] vprintk_emit+0x270/0x2b4
hardirqs last disabled at (1298): [<c01a3b50>] vprintk_emit+0x22c/0x2b4
softirqs last  enabled at (1260): [<c01016fc>] __do_softirq+0x4cc/0x5ec
softirqs last disabled at (1255): [<c01301c8>] irq_exit+0x1cc/0x200
---[ end trace 0fa33551718d667f ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 7 at drivers/gpu/drm/drm_atomic_state_helper.c:494 
drm_atomic_helper_connector_duplicate_state+0x60/0x68
Modules linked in:
CPU: 0 PID: 7 Comm: kworker/u4:0 Tainted: G        W 
5.16.0-rc5-next-20211213-00001-gac4117943791 #11072
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
[<c01110d0>] (unwind_backtrace) from [<c010cab0>] (show_stack+0x10/0x14)
[<c010cab0>] (show_stack) from [<c0b71b58>] (dump_stack_lvl+0x58/0x70)
[<c0b71b58>] (dump_stack_lvl) from [<c0126c9c>] (__warn+0x228/0x22c)
[<c0126c9c>] (__warn) from [<c0126d4c>] (warn_slowpath_fmt+0xac/0xb4)
[<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state+0x60/0x68)
[<c064e844>] (drm_atomic_helper_connector_duplicate_state) from 
[<c06685f4>] (drm_atomic_get_connector_state+0xd8/0x190)
[<c06685f4>] (drm_atomic_get_connector_state) from [<c066960c>] 
(__drm_atomic_helper_set_config+0x2a0/0x368)
[<c066960c>] (__drm_atomic_helper_set_config) from [<c0680a20>] 
(drm_client_modeset_commit_atomic+0x178/0x27c)
[<c0680a20>] (drm_client_modeset_commit_atomic) from [<c0680be0>] 
(drm_client_modeset_commit_locked+0x48/0x1d0)
[<c0680be0>] (drm_client_modeset_commit_locked) from [<c0680d8c>] 
(drm_client_modeset_commit+0x24/0x40)
[<c0680d8c>] (drm_client_modeset_commit) from [<c0652a94>] 
(__drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xc8)
[<c0652a94>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from 
[<c0652b60>] (drm_fb_helper_set_par+0x38/0x64)
[<c0652b60>] (drm_fb_helper_set_par) from [<c05bbf28>] 
(fbcon_init+0x48c/0x510)
[<c05bbf28>] (fbcon_init) from [<c0608b50>] (visual_init+0xc0/0x108)
[<c0608b50>] (visual_init) from [<c0609d78>] 
(do_bind_con_driver+0x1ac/0x388)
[<c0609d78>] (do_bind_con_driver) from [<c060a2b0>] 
(do_take_over_console+0x13c/0x1c8)
[<c060a2b0>] (do_take_over_console) from [<c05b90e0>] 
(do_fbcon_takeover+0x74/0xcc)
[<c05b90e0>] (do_fbcon_takeover) from [<c05b38f0>] 
(register_framebuffer+0x1c8/0x2d8)
[<c05b38f0>] (register_framebuffer) from [<c06524a4>] 
(__drm_fb_helper_initial_config_and_unlock+0x440/0x65c)
[<c06524a4>] (__drm_fb_helper_initial_config_and_unlock) from 
[<c063dfbc>] (drm_kms_helper_hotplug_event+0x24/0x30)
[<c063dfbc>] (drm_kms_helper_hotplug_event) from [<c0690fb8>] 
(exynos_dsi_host_attach+0x170/0x2a4)
[<c0690fb8>] (exynos_dsi_host_attach) from [<c069d064>] 
(tc358764_probe+0xe8/0x160)
[<c069d064>] (tc358764_probe) from [<c06b6fb0>] (really_probe+0x190/0x450)
[<c06b6fb0>] (really_probe) from [<c06b7314>] 
(__driver_probe_device+0xa4/0x204)
[<c06b7314>] (__driver_probe_device) from [<c06b74a8>] 
(driver_probe_device+0x34/0xd4)
[<c06b74a8>] (driver_probe_device) from [<c06b7884>] 
(__device_attach_driver+0xb0/0x11c)
[<c06b7884>] (__device_attach_driver) from [<c06b5094>] 
(bus_for_each_drv+0x70/0xb4)
[<c06b5094>] (bus_for_each_drv) from [<c06b6d80>] 
(__device_attach+0xe0/0x178)
[<c06b6d80>] (__device_attach) from [<c06b5e0c>] 
(bus_probe_device+0x88/0x90)
[<c06b5e0c>] (bus_probe_device) from [<c06b632c>] 
(deferred_probe_work_func+0x4c/0xe8)
[<c06b632c>] (deferred_probe_work_func) from [<c0148990>] 
(process_one_work+0x2c8/0x7ec)
[<c0148990>] (process_one_work) from [<c0148f04>] (worker_thread+0x50/0x584)
[<c0148f04>] (worker_thread) from [<c0151300>] (kthread+0x13c/0x19c)
[<c0151300>] (kthread) from [<c0100108>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc1cc1fb0 to 0xc1cc1ff8)
1fa0:                                     00000000 00000000 00000000 
00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 24321
hardirqs last  enabled at (24327): [<c01a3b94>] vprintk_emit+0x270/0x2b4
hardirqs last disabled at (24332): [<c01a3b50>] vprintk_emit+0x22c/0x2b4
softirqs last  enabled at (21880): [<c01016fc>] __do_softirq+0x4cc/0x5ec
softirqs last disabled at (21875): [<c01301c8>] irq_exit+0x1cc/0x200
---[ end trace 0fa33551718d6680 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 7 at drivers/gpu/drm/drm_atomic_state_helper.c:494 
drm_atomic_helper_connector_duplicate_state+0x60/0x68
Modules linked in:
CPU: 0 PID: 7 Comm: kworker/u4:0 Tainted: G        W 
5.16.0-rc5-next-20211213-00001-gac4117943791 #11072
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
[<c01110d0>] (unwind_backtrace) from [<c010cab0>] (show_stack+0x10/0x14)
[<c010cab0>] (show_stack) from [<c0b71b58>] (dump_stack_lvl+0x58/0x70)
[<c0b71b58>] (dump_stack_lvl) from [<c0126c9c>] (__warn+0x228/0x22c)
[<c0126c9c>] (__warn) from [<c0126d4c>] (warn_slowpath_fmt+0xac/0xb4)
[<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state+0x60/0x68)
[<c064e844>] (drm_atomic_helper_connector_duplicate_state) from 
[<c06685f4>] (drm_atomic_get_connector_state+0xd8/0x190)
[<c06685f4>] (drm_atomic_get_connector_state) from [<c066960c>] 
(__drm_atomic_helper_set_config+0x2a0/0x368)
[<c066960c>] (__drm_atomic_helper_set_config) from [<c0680a20>] 
(drm_client_modeset_commit_atomic+0x178/0x27c)
[<c0680a20>] (drm_client_modeset_commit_atomic) from [<c0680be0>] 
(drm_client_modeset_commit_locked+0x48/0x1d0)
[<c0680be0>] (drm_client_modeset_commit_locked) from [<c0651c60>] 
(drm_fb_helper_pan_display+0x90/0x1c4)
[<c0651c60>] (drm_fb_helper_pan_display) from [<c05b2ab0>] 
(fb_pan_display+0xcc/0x138)
[<c05b2ab0>] (fb_pan_display) from [<c05bd024>] (bit_update_start+0x14/0x30)
[<c05bd024>] (bit_update_start) from [<c05bac30>] (fbcon_switch+0x2d0/0x3e4)
[<c05bac30>] (fbcon_switch) from [<c0609afc>] (redraw_screen+0x15c/0x22c)
[<c0609afc>] (redraw_screen) from [<c05ba7e4>] 
(fbcon_prepare_logo+0x2d4/0x450)
[<c05ba7e4>] (fbcon_prepare_logo) from [<c05bbe50>] (fbcon_init+0x3b4/0x510)
[<c05bbe50>] (fbcon_init) from [<c0608b50>] (visual_init+0xc0/0x108)
[<c0608b50>] (visual_init) from [<c0609d78>] 
(do_bind_con_driver+0x1ac/0x388)
[<c0609d78>] (do_bind_con_driver) from [<c060a2b0>] 
(do_take_over_console+0x13c/0x1c8)
[<c060a2b0>] (do_take_over_console) from [<c05b90e0>] 
(do_fbcon_takeover+0x74/0xcc)
[<c05b90e0>] (do_fbcon_takeover) from [<c05b38f0>] 
(register_framebuffer+0x1c8/0x2d8)
[<c05b38f0>] (register_framebuffer) from [<c06524a4>] 
(__drm_fb_helper_initial_config_and_unlock+0x440/0x65c)
[<c06524a4>] (__drm_fb_helper_initial_config_and_unlock) from 
[<c063dfbc>] (drm_kms_helper_hotplug_event+0x24/0x30)
[<c063dfbc>] (drm_kms_helper_hotplug_event) from [<c0690fb8>] 
(exynos_dsi_host_attach+0x170/0x2a4)
[<c0690fb8>] (exynos_dsi_host_attach) from [<c069d064>] 
(tc358764_probe+0xe8/0x160)
[<c069d064>] (tc358764_probe) from [<c06b6fb0>] (really_probe+0x190/0x450)
[<c06b6fb0>] (really_probe) from [<c06b7314>] 
(__driver_probe_device+0xa4/0x204)
[<c06b7314>] (__driver_probe_device) from [<c06b74a8>] 
(driver_probe_device+0x34/0xd4)
[<c06b74a8>] (driver_probe_device) from [<c06b7884>] 
(__device_attach_driver+0xb0/0x11c)
[<c06b7884>] (__device_attach_driver) from [<c06b5094>] 
(bus_for_each_drv+0x70/0xb4)
[<c06b5094>] (bus_for_each_drv) from [<c06b6d80>] 
(__device_attach+0xe0/0x178)
[<c06b6d80>] (__device_attach) from [<c06b5e0c>] 
(bus_probe_device+0x88/0x90)
[<c06b5e0c>] (bus_probe_device) from [<c06b632c>] 
(deferred_probe_work_func+0x4c/0xe8)
[<c06b632c>] (deferred_probe_work_func) from [<c0148990>] 
(process_one_work+0x2c8/0x7ec)
[<c0148990>] (process_one_work) from [<c0148f04>] (worker_thread+0x50/0x584)
[<c0148f04>] (worker_thread) from [<c0151300>] (kthread+0x13c/0x19c)
[<c0151300>] (kthread) from [<c0100108>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc1cc1fb0 to 0xc1cc1ff8)
1fa0:                                     00000000 00000000 00000000 
00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 24393
hardirqs last  enabled at (24399): [<c01a3b94>] vprintk_emit+0x270/0x2b4
hardirqs last disabled at (24404): [<c01a3b50>] vprintk_emit+0x22c/0x2b4
softirqs last  enabled at (21880): [<c01016fc>] __do_softirq+0x4cc/0x5ec
softirqs last disabled at (21875): [<c01301c8>] irq_exit+0x1cc/0x200
---[ end trace 0fa33551718d6681 ]---
Console: switching to colour frame buffer device 146x42
------------[ cut here ]------------
WARNING: CPU: 0 PID: 7 at drivers/gpu/drm/drm_atomic_state_helper.c:494 
drm_atomic_helper_connector_duplicate_state+0x60/0x68
Modules linked in:
CPU: 0 PID: 7 Comm: kworker/u4:0 Tainted: G        W 
5.16.0-rc5-next-20211213-00001-gac4117943791 #11072
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
[<c01110d0>] (unwind_backtrace) from [<c010cab0>] (show_stack+0x10/0x14)
[<c010cab0>] (show_stack) from [<c0b71b58>] (dump_stack_lvl+0x58/0x70)
[<c0b71b58>] (dump_stack_lvl) from [<c0126c9c>] (__warn+0x228/0x22c)
[<c0126c9c>] (__warn) from [<c0126d4c>] (warn_slowpath_fmt+0xac/0xb4)
[<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state+0x60/0x68)
[<c064e844>] (drm_atomic_helper_connector_duplicate_state) from 
[<c06685f4>] (drm_atomic_get_connector_state+0xd8/0x190)
[<c06685f4>] (drm_atomic_get_connector_state) from [<c066960c>] 
(__drm_atomic_helper_set_config+0x2a0/0x368)
[<c066960c>] (__drm_atomic_helper_set_config) from [<c0680a20>] 
(drm_client_modeset_commit_atomic+0x178/0x27c)
[<c0680a20>] (drm_client_modeset_commit_atomic) from [<c0680be0>] 
(drm_client_modeset_commit_locked+0x48/0x1d0)
[<c0680be0>] (drm_client_modeset_commit_locked) from [<c0651c60>] 
(drm_fb_helper_pan_display+0x90/0x1c4)
[<c0651c60>] (drm_fb_helper_pan_display) from [<c05b2ab0>] 
(fb_pan_display+0xcc/0x138)
[<c05b2ab0>] (fb_pan_display) from [<c05bd024>] (bit_update_start+0x14/0x30)
[<c05bd024>] (bit_update_start) from [<c05bac30>] (fbcon_switch+0x2d0/0x3e4)
[<c05bac30>] (fbcon_switch) from [<c0609afc>] (redraw_screen+0x15c/0x22c)
[<c0609afc>] (redraw_screen) from [<c0609e84>] 
(do_bind_con_driver+0x2b8/0x388)
[<c0609e84>] (do_bind_con_driver) from [<c060a2b0>] 
(do_take_over_console+0x13c/0x1c8)
[<c060a2b0>] (do_take_over_console) from [<c05b90e0>] 
(do_fbcon_takeover+0x74/0xcc)
[<c05b90e0>] (do_fbcon_takeover) from [<c05b38f0>] 
(register_framebuffer+0x1c8/0x2d8)
[<c05b38f0>] (register_framebuffer) from [<c06524a4>] 
(__drm_fb_helper_initial_config_and_unlock+0x440/0x65c)
[<c06524a4>] (__drm_fb_helper_initial_config_and_unlock) from 
[<c063dfbc>] (drm_kms_helper_hotplug_event+0x24/0x30)
[<c063dfbc>] (drm_kms_helper_hotplug_event) from [<c0690fb8>] 
(exynos_dsi_host_attach+0x170/0x2a4)
[<c0690fb8>] (exynos_dsi_host_attach) from [<c069d064>] 
(tc358764_probe+0xe8/0x160)
[<c069d064>] (tc358764_probe) from [<c06b6fb0>] (really_probe+0x190/0x450)
[<c06b6fb0>] (really_probe) from [<c06b7314>] 
(__driver_probe_device+0xa4/0x204)
[<c06b7314>] (__driver_probe_device) from [<c06b74a8>] 
(driver_probe_device+0x34/0xd4)
[<c06b74a8>] (driver_probe_device) from [<c06b7884>] 
(__device_attach_driver+0xb0/0x11c)
[<c06b7884>] (__device_attach_driver) from [<c06b5094>] 
(bus_for_each_drv+0x70/0xb4)
[<c06b5094>] (bus_for_each_drv) from [<c06b6d80>] 
(__device_attach+0xe0/0x178)
[<c06b6d80>] (__device_attach) from [<c06b5e0c>] 
(bus_probe_device+0x88/0x90)
[<c06b5e0c>] (bus_probe_device) from [<c06b632c>] 
(deferred_probe_work_func+0x4c/0xe8)
[<c06b632c>] (deferred_probe_work_func) from [<c0148990>] 
(process_one_work+0x2c8/0x7ec)
[<c0148990>] (process_one_work) from [<c0148f04>] (worker_thread+0x50/0x584)
[<c0148f04>] (worker_thread) from [<c0151300>] (kthread+0x13c/0x19c)
[<c0151300>] (kthread) from [<c0100108>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc1cc1fb0 to 0xc1cc1ff8)
1fa0:                                     00000000 00000000 00000000 
00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 24477
hardirqs last  enabled at (24483): [<c01a3b94>] vprintk_emit+0x270/0x2b4
hardirqs last disabled at (24488): [<c01a3b50>] vprintk_emit+0x22c/0x2b4
softirqs last  enabled at (21880): [<c01016fc>] __do_softirq+0x4cc/0x5ec
softirqs last disabled at (21875): [<c01301c8>] irq_exit+0x1cc/0x200
---[ end trace 0fa33551718d6682 ]---


Again, there is something wrong with connector registration:

# ./modetest -C -Mexynos
[   69.085387] ------------[ cut here ]------------
[   69.088593] WARNING: CPU: 1 PID: 1299 at 
drivers/gpu/drm/drm_atomic_state_helper.c:494 
drm_atomic_helper_connector_duplicate_state+0x60/0x68
[   69.101211] Modules linked in: s5p_mfc exynos_gsc v4l2_mem2mem 
videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common 
videodev mc
[   69.114158] CPU: 1 PID: 1299 Comm: modetest Tainted: G W         
5.16.0-rc5-next-20211213-00002-ga010c46089fa #11073
[   69.125201] Hardware name: Samsung Exynos (Flattened Device Tree)
[   69.131279] [<c01110d0>] (unwind_backtrace) from [<c010cab0>] 
(show_stack+0x10/0x14)
[   69.139002] [<c010cab0>] (show_stack) from [<c0b71c00>] 
(dump_stack_lvl+0x58/0x70)
[   69.146554] [<c0b71c00>] (dump_stack_lvl) from [<c0126c9c>] 
(__warn+0x228/0x22c)
[   69.153932] [<c0126c9c>] (__warn) from [<c0126d4c>] 
(warn_slowpath_fmt+0xac/0xb4)
[   69.161396] [<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state+0x60/0x68)
[   69.172074] [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state) from [<c06685f4>] 
(drm_atomic_get_connector_state+0xd8/0x190)
[   69.183966] [<c06685f4>] (drm_atomic_get_connector_state) from 
[<c066960c>] (__drm_atomic_helper_set_config+0x2a0/0x368)
[   69.194814] [<c066960c>] (__drm_atomic_helper_set_config) from 
[<c0680a20>] (drm_client_modeset_commit_atomic+0x178/0x27c)
[   69.205839] [<c0680a20>] (drm_client_modeset_commit_atomic) from 
[<c0680be0>] (drm_client_modeset_commit_locked+0x48/0x1d0)
[   69.216949] [<c0680be0>] (drm_client_modeset_commit_locked) from 
[<c0680d8c>] (drm_client_modeset_commit+0x24/0x40)
[   69.227364] [<c0680d8c>] (drm_client_modeset_commit) from 
[<c0652a94>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xc8)
[   69.238735] [<c0652a94>] 
(__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0655ec8>] 
(drm_lastclose+0x30/0x4c)
[   69.249065] [<c0655ec8>] (drm_lastclose) from [<c0655ff4>] 
(drm_release+0x110/0x114)
[   69.256789] [<c0655ff4>] (drm_release) from [<c02e6058>] 
(__fput+0x88/0x258)
[   69.263821] [<c02e6058>] (__fput) from [<c014df0c>] 
(task_work_run+0x8c/0xc8)
[   69.270939] [<c014df0c>] (task_work_run) from [<c010c30c>] 
(do_work_pending+0x534/0x63c)
[   69.279010] [<c010c30c>] (do_work_pending) from [<c0100088>] 
(slow_work_pending+0xc/0x20)
[   69.287169] Exception stack(0xc3e4bfb0 to 0xc3e4bff8)
[   69.292205] bfa0:                                     00000000 
0000001f e4a15400 00000000
[   69.300364] bfc0: 00000001 00000003 00000000 00000006 00022188 
00000000 b6f2c000 00000000
[   69.308523] bfe0: b6e2daa0 bee27a98 0000e7c4 b6e2dac0 60000010 00000003
[   69.315292] irq event stamp: 3229
[   69.318419] hardirqs last  enabled at (3237): [<c01a0cfc>] 
__up_console_sem+0x50/0x60
[   69.326275] hardirqs last disabled at (3252): [<c01a0ce8>] 
__up_console_sem+0x3c/0x60
[   69.334076] softirqs last  enabled at (3250): [<c01016fc>] 
__do_softirq+0x4cc/0x5ec
[   69.341680] softirqs last disabled at (3245): [<c01301c8>] 
irq_exit+0x1cc/0x200
[   69.349066] ---[ end trace ab79782cf462efca ]---
could not get [   69.355098] ------------[ cut here ]------------
[   69.359389] WARNING: CPU: 1 PID: 1299 at 
drivers/gpu/drm/drm_atomic_state_helper.c:494 
drm_atomic_helper_connector_duplicate_state+0x60/0x68
[   69.372111] Modules linked in: s5p_mfc exynos_gsc v4l2_mem2mem 
videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common 
videodev mc
[   69.384964] CPU: 1 PID: 1299 Comm: modetest Tainted: G W         
5.16.0-rc5-next-20211213-00002-ga010c46089fa #11073
[   69.396017] Hardware name: Samsung Exynos (Flattened Device Tree)
[   69.402094] [<c01110d0>] (unwind_backtrace) from [<c010cab0>] 
(show_stack+0x10/0x14)
[   69.409818] [<c010cab0>] (show_stack) from [<c0b71c00>] 
(dump_stack_lvl+0x58/0x70)
[   69.417370] [<c0b71c00>] (dump_stack_lvl) from [<c0126c9c>] 
(__warn+0x228/0x22c)
[   69.424748] [<c0126c9c>] (__warn) from [<c0126d4c>] 
(warn_slowpath_fmt+0xac/0xb4)
[   69.432213] [<c0126d4c>] (warn_slowpath_fmt) from [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state+0x60/0x68)
[   69.442889] [<c064e844>] 
(drm_atomic_helper_connector_duplicate_state) from [<c06685f4>] 
(drm_atomic_get_connector_state+0xd8/0x190)
[   69.454781] [<c06685f4>] (drm_atomic_get_connector_state) from 
[<c066960c>] (__drm_atomic_helper_set_config+0x2a0/0x368)
[   69.465630] [<c066960c>] (__drm_atomic_helper_set_config) from 
[<c0680a20>] (drm_client_modeset_commit_atomic+0x178/0x27c)
[   69.476654] [<c0680a20>] (drm_client_modeset_commit_atomic) from 
[<c0680be0>] (drm_client_modeset_commit_locked+0x48/0x1d0)
[   69.487764] [<c0680be0>] (drm_client_modeset_commit_locked) from 
[<c0680d8c>] (drm_client_modeset_commit+0x24/0x40)
[   69.498181] [<c0680d8c>] (drm_client_modeset_commit) from 
[<c0652a94>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x64/0xc8)
[   69.509551] [<c0652a94>] 
(__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0655ec8>] 
(drm_lastclose+0x30/0x4c)
[   69.519881] [<c0655ec8>] (drm_lastclose) from [<c0655ff4>] 
(drm_release+0x110/0x114)
[   69.527605] [<c0655ff4>] (drm_release) from [<c02e6058>] 
(__fput+0x88/0x258)
[   69.534636] [<c02e6058>] (__fput) from [<c014df0c>] 
(task_work_run+0x8c/0xc8)
[   69.541754] [<c014df0c>] (task_work_run) from [<c012cb20>] 
(do_exit+0x3f8/0xc1c)
[   69.549133] [<c012cb20>] (do_exit) from [<c012e6b8>] 
(do_group_exit+0x2c/0xa0)
[   69.556337] [<c012e6b8>] (do_group_exit) from [<c013d09c>] 
(get_signal+0x1d0/0xe6c)
[   69.563976] [<c013d09c>] (get_signal) from [<c010bef4>] 
(do_work_pending+0x11c/0x63c)
[   69.571786] [<c010bef4>] (do_work_pending) from [<c0100088>] 
(slow_work_pending+0xc/0x20)
[   69.579945] Exception stack(0xc3e4bfb0 to 0xc3e4bff8)
[   69.584982] bfa0:                                     00000008 
0000005f 00000002 00023388
[   69.593140] bfc0: 00000001 000232a8 00000000 00023398 0000003e 
00000000 00023360 00000000
[   69.601299] bfe0: 00023590 bee27ae8 00009ec0 00009e9c 80000010 ffffffff
[   69.608150] irq event stamp: 3691
[   69.611237] hardirqs last  enabled at (3703): [<c015a6b0>] 
finish_task_switch+0xc4/0x264
[   69.619337] hardirqs last disabled at (3724): [<c01a0ce8>] 
__up_console_sem+0x3c/0x60
[   69.627123] softirqs last  enabled at (3722): [<c01016fc>] 
__do_softirq+0x4cc/0x5ec
[   69.634818] softirqs last disabled at (3711): [<c01301c8>] 
irq_exit+0x1cc/0x200
[   69.642009] ---[ end trace ab79782cf462efcb ]---
connector 62: No such file or directory
Segmentation fault


This reminds me a discussion from last year:

https://lore.kernel.org/all/f22146de-1660-035c-c476-f7b3354de7cb@samsung.com/


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

