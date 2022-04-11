Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1A4FC239
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A9F10E3E3;
	Mon, 11 Apr 2022 16:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C4F10E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 16:25:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220411162555euoutp018e90dd6d16720953f9822710e1e3f8ec~k5EanaTv_1092410924euoutp019
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 16:25:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220411162555euoutp018e90dd6d16720953f9822710e1e3f8ec~k5EanaTv_1092410924euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649694355;
 bh=ZOnGPhjP4eRpgyBsRrE8QlSFuiADHoafOGxxHXTYx3g=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=sunlE+xlX2ybO+fxpdMZbJE30RBzD/ba7VfhCOizVQWhKP+ZEiZXhZDCHEJup38WO
 usiR+XloRomLkhh2tNijm0P7TtEj+/QQ0BdP30+bwPvo7er/k7KkP+D/ZpXr5DIE3n
 5geHjIAzdjub3o5ZwbHUSuS4zhn7NWsw58zchtoA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220411162555eucas1p13050dc751a7cb24c5f403b2443de8134~k5EaQMzd_2029820298eucas1p1P;
 Mon, 11 Apr 2022 16:25:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id DD.3F.10260.39654526; Mon, 11
 Apr 2022 17:25:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220411162554eucas1p2e709930ca43903efc00946c82569fbcd~k5EZHuEtr1498214982eucas1p2J;
 Mon, 11 Apr 2022 16:25:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220411162554eusmtrp1599df90e266d55b8e845bf0c9f10c62b~k5EZGyuf_3205632056eusmtrp1I;
 Mon, 11 Apr 2022 16:25:54 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-6a-625456930ed3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.76.09404.19654526; Mon, 11
 Apr 2022 17:25:53 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220411162552eusmtip2b225e68f44319f6f4121cad07f2f83e0~k5EX-w10z0970309703eusmtip2V;
 Mon, 11 Apr 2022 16:25:52 +0000 (GMT)
Message-ID: <bde95ab4-38d8-5249-053c-57fb58d1a200@samsung.com>
Date: Mon, 11 Apr 2022 18:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAHCN7xK_H-nLA5Z6hJW5V0Bpo8bDKPU6UpN05kMBkG+PXmwBBw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xbZRjO13N6enGth46Fb2yy2EV0Jiubw+UTFKfO5RiMKYm34K2lHIEM
 CmmHTueFYcqlAiljzl6IaMqgwihYytgcm6HiqoN1VFmlK6xsa5wUGLbADBCqtIcp/573ed/n
 fZ73y8fFRDVEIrdAeYhWKeWFYoKPn7646NrZ8OrLObsumXhozDeIIb95DkdTPguBmgZcbDSy
 MEug2pOr6Jhfh6N5m45Af1534+hy+TQHVdc3c1Cr7gKBbLc8bKRd+hZD+isXWOjSUQ2OHHVv
 oLDxBoY05wc4SN8wSSD3z2Fs3yaqI+RnU7OjGg7lqhknqLPGcQ5lqjKwKXPfJIuytVUT1MBV
 M5sa8/QRlP9zJ4vqbv6U+u7OGRZVZ28D1JwtSSrM5j+ZSxcWvEerUjJk/HxfVzlR4k09PH9O
 XgY0O7WAx4VkKnR8UcnWAj5XRFoAvGxrZzHFPIAG3XGcKeYAnA4M4/ckf1Tr1hqtAJ6yj60V
 IQCt585zolMCMgNarv3GimKcfAieCC0TDB8HfzEEYps2kTmwvbc9xm8k98MeTySmxcgEeC3Q
 FNPGk2I4PrQCogYYuUjAit+1INogyN1QO6ONiXlkFnRf/RJjxNvgZz0mLCqAZDkfum4HCSb3
 fmiucq7hjTDotHMYvBUONtSsJuKu4mK4ot/D0IehZ+oUxuB0OOZaIqIjGLkDdn6fwkw/A1uu
 ZzNQCEdn4pgAQnjsdDRMlBbAqgoRsyMZGp3W/yz7h3/FdEBsXPcmxnW3G9edYvzf9muAt4EE
 ulRdlEer9yjp9yVqeZG6VJknURQX2cDqhx2MOBfOAEswJHEAFhc4AORi4ngBypHmiAS58g8+
 pFXF76hKC2m1A2zh4uIEgaKgSy4i8+SH6IM0XUKr7nVZXF5iGeu55gmFs0svaZp/5ea+RFnT
 5hcowLaAHZG7ujjXg9n1E4HKDrV0OfJa5wMtlTc1haP1jVlJ96fGjxCC2wl1ew2zd+ci/qAq
 q0whvjIj5T3sVdCf2KWtgwvdb524yDvS+Pqdnqe923/AD/7YLc/nL/YPeJ8Nd8IbHwnLXrRO
 y2o3P7YtLdPkufX2WXplr+er7A0FYe/Jf/TuZT1PN0Qubf8mN3zgzY87ZtN6OobMf7stU4YN
 Jdy0QKMHSuwtmZW9I8p0X0V8ZuJP1VuO5rUkZVh3pQjTWcWy3uQjByZrHu97hC2bkIY8puTE
 YU1n8Hn2X9aX2p8Yf7f+qa39Pk7tfanpYlydL9/9KKZSy/8F5o+vnB8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7oTw0KSDE70W1jcuX2a2eL+4s8s
 Fq9vr2CzmH/kHKvFla/v2Sx6lwJZk+5PYLH4smkCm8WLexdZLM42vWG36Jy4hN1i+YR9bBab
 Hl9jtej6tZLZYsb5fUwWpxpbWSwO9UVbfJr1kNmide8RdosZk1+yWVw88YnZQdRj7cf7rB7v
 b7Sye5zrucvmsXPWXXaP2R0zWT0W73nJ5LFpVSebx5Gri1k97lzbw+Zxv/s4k8fmJfUeG9/t
 YPLo27KK0ePzJrkAvig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
 nMyy1CJ9uwS9jNsbmtgKbppUfNmd2MDYqtvFyMkhIWAi8axzAksXIxeHkMBSRokLvxcxQyRk
 JE5Oa2CFsIUl/lzrYoMoes8osbvpBViCV8BOYsWty0wgNouAqsS0j7/ZIOKCEidnPmEBsUUF
 kiQudbUzgtjCAi4SW6/9YwexmQXEJW49mQ/WKyKgJHH3zF9GkAXMAv/ZJNofrWKE2DaBSWL6
 qU9g29gEDCW63naBbeAUCJS4eHU6M8QkM4murV2MELa8RPPW2cwTGIVmITlkFpKFs5C0zELS
 soCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgYtl27OeWHYwrX33UO8TIxMF4iFGCg1lJ
 hNciKSBJiDclsbIqtSg/vqg0J7X4EKMpMDQmMkuJJucDU1teSbyhmYGpoYmZpYGppZmxkjiv
 Z0FHopBAemJJanZqakFqEUwfEwenVAOTrIp1f0ryiwNdW6RzplpoKt6o3P6CTcWpefPWnzvj
 ud42n6jpf5LJd2l5xOXUR14qpcWM/94s/7jub9Xzbxl5F3fdyNYpYOESb7zmckbs0PEjE94y
 33rW6aHalyd1TWLTTt+PR/gkDubOP75Y9PFd/t12S6q9+aWebNrhnVC5MTNqOsOtTnmryv1R
 N6t4sm2l/U6JvBLcfa7JNn7LqS+96t2rJizo+BvB0779flS38UffS88lmSvrItwljC4uvhJh
 Hae4tJEnmPfZM7E1a2M/TnoTO8Vd5vceVwVja4XlTh/fzzx7lVn7xvu/ba+EoreZ+CmnHnhs
 yuqTsLLx2XXNkn17Is/+c+9pEtn2anGeEktxRqKhFnNRcSIAJQb2QbUDAAA=
X-CMS-MailID: 20220411162554eucas1p2e709930ca43903efc00946c82569fbcd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3
References: <CGME20220408162213eucas1p158d7c7ee27006a61d4af95d3c72c58e3@eucas1p1.samsung.com>
 <20220408162108.184583-1-jagan@amarulasolutions.com>
 <4c693c6e-512b-a568-948a-4a1af6a1313a@samsung.com>
 <CAHCN7xK_H-nLA5Z6hJW5V0Bpo8bDKPU6UpN05kMBkG+PXmwBBw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.04.2022 16:39, Adam Ford wrote:
> On Mon, Apr 11, 2022 at 8:56 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 08.04.2022 18:20, Jagan Teki wrote:
>>> This series supports common bridge support for Samsung MIPI DSIM
>>> which is used in Exynos and i.MX8MM SoC's.
>>>
>>> Previous RFC can be available here [1].
>>>
>>> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>>>
>>> On, summary this patch-set break the entire DSIM driver into
>>> - platform specific glue code for platform ops, component_ops.
>>> - common bridge driver which handle platform glue init and invoke.
>>>
>>> Patch 0000:   Samsung DSIM bridge
>>>
>>> Patch 0001:   platform init flag via driver_data
>>>
>>> Patch 0002/9:   bridge fixes, atomic API's
>>>
>>> Patch 0010:   document fsl,imx8mm-mipi-dsim
>>>
>>> Patch 0011:   add i.MX8MM DSIM support
>>>
>>> Tested in Engicam i.Core MX8M Mini SoM.
>>>
>>> Anyone interested, please have a look on this repo [2]
>>>
>>> [2] https://protect2.fireeye.com/v1/url?k=930e329a-f28527b5-930fb9d5-74fe485cbfe7-b0c53e2d688ddbc5&q=1&e=e6aa727d-5ae2-4ca5-bff3-7f62d8fae87e&u=https%3A%2F%2Fgithub.com%2Fopenedev%2Fkernel%2Ftree%2Fimx8mm-dsi-v1
>>> [1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/
>>>
>>> Any inputs?
>> I wanted to test this on the Exynos, but I wasn't able to find what base
>> should I apply this patchset. I've tried linux-next as well as
>> 95a2441e4347 ("drm: exynos: dsi: Switch to atomic funcs").
>>
>> Please note that pointing a proper base for the patchset is really
>> essential if you really want others to test it.
> Can you clone his repo and test that?  He posted it above.  I was
> going to clone it at some point this week to give it a try.

Okay, my fault. I've missed that.

There is a trivial compilation issue, 
drivers/gpu/drm/exynos/exynos_drm_dsi.c lacks "#include 
<linux/gpio/consumer.h>" after conversion. Besides that, it simply nukes 
on the simplest Exynos setup (exynos4210-trats) during the initialization:

[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000048
[00000048] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
5.17.0-rc2-00577-g22e968113668-dirty #11635
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at exynos_dsi_bind+0x14/0x3c
LR is at component_bind_all+0x130/0x290
pc : [<c06924e0>]    lr : [<c06b0f6c>]    psr: 60000113
sp : c1cafcb8  ip : 00000002  fp : c0f4a53c
r10: c135e6a8  r9 : c1efd800  r8 : 00000000
r7 : c26d2100  r6 : c2c69fc0  r5 : 00000018  r4 : 00000000
r3 : c06924cc  r2 : 00000002  r1 : 00000000  r0 : c1efd800
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 4000404a  DAC: 00000051
Register r0 information: slab kmalloc-2k start c1efd800 pointer offset 0 
size 2048
Register r1 information: NULL pointer
Register r2 information: non-paged memory
Register r3 information: non-slab/vmalloc memory
Register r4 information: NULL pointer
Register r5 information: non-paged memory
Register r6 information: slab kmalloc-64 start c2c69fc0 pointer offset 0 
size 64
Register r7 information: slab kmalloc-64 start c26d2100 pointer offset 0 
size 64
Register r8 information: NULL pointer
Register r9 information: slab kmalloc-2k start c1efd800 pointer offset 0 
size 2048
Register r10 information: non-slab/vmalloc memory
Register r11 information: non-slab/vmalloc memory
Register r12 information: non-paged memory
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xc1cafcb8 to 0xc1cb0000)
...
  exynos_dsi_bind from component_bind_all+0x130/0x290
  component_bind_all from exynos_drm_bind+0xe8/0x194
  exynos_drm_bind from try_to_bring_up_master+0x208/0x2d0
  try_to_bring_up_master from component_master_add_with_match+0xd0/0x104
  component_master_add_with_match from exynos_drm_platform_probe+0xe8/0x118
  exynos_drm_platform_probe from platform_probe+0x80/0xc0
  platform_probe from really_probe+0xfc/0x440
  really_probe from __driver_probe_device+0xa4/0x204
  __driver_probe_device from driver_probe_device+0x34/0xd4
  driver_probe_device from __driver_attach+0x114/0x184
  __driver_attach from bus_for_each_dev+0x64/0xb0
  bus_for_each_dev from bus_add_driver+0x170/0x20c
  bus_add_driver from driver_register+0x78/0x10c
  driver_register from exynos_drm_init+0xe0/0x14c
  exynos_drm_init from do_one_initcall+0x6c/0x3a4
  do_one_initcall from kernel_init_freeable+0x1c4/0x214
  kernel_init_freeable from kernel_init+0x18/0x12c
  kernel_init from ret_from_fork+0x14/0x2c
Exception stack(0xc1caffb0 to 0xc1cafff8)
ffa0:                                     00000000 00000000 00000000 
00000000
ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e5904040 e1a00002 e3a02002 e1a01004 (e5945048)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU1: stopping
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D 
5.17.0-rc2-00577-g22e968113668-dirty #11635
Hardware name: Samsung Exynos (Flattened Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from do_handle_IPI+0x2ec/0x36c
  do_handle_IPI from ipi_handler+0x18/0x20
  ipi_handler from handle_percpu_devid_irq+0xd0/0x394
  handle_percpu_devid_irq from generic_handle_domain_irq+0x44/0x88
  generic_handle_domain_irq from gic_handle_irq+0x88/0xac
  gic_handle_irq from generic_handle_arch_irq+0x58/0x78
  generic_handle_arch_irq from __irq_svc+0x54/0x88
Exception stack(0xc1cd1f48 to 0xc1cd1f90)
1f40:                   00000001 c0eff5a4 00000001 c011ca80 c1208f0c 
c1353420
1f60: 00000000 c1d8d000 00000000 c0f34234 c1d8d000 00000000 c0eeee98 
c1cd1f98
1f80: c0109144 c0109148 20000013 ffffffff
  __irq_svc from arch_cpu_idle+0x40/0x44
  arch_cpu_idle from default_idle_call+0x74/0x2c4
  default_idle_call from do_idle+0x1cc/0x284
  do_idle from cpu_startup_entry+0x18/0x1c
  cpu_startup_entry from 0x401018b4
---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---


I will try to take a look into this later in the evening.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

