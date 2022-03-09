Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FE4D2BBA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 10:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7678910E3C2;
	Wed,  9 Mar 2022 09:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93E410E3C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 09:22:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220309092212euoutp02b147cb19962f8c5d5aa65d521fb39a5e~arACIiKDr0136701367euoutp02E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 09:22:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220309092212euoutp02b147cb19962f8c5d5aa65d521fb39a5e~arACIiKDr0136701367euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646817732;
 bh=UI46KGUrMyLK0Lehg/lZ64ZNA433u9jmRQ9u6Bog22o=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=OY50spgGI/2bCde2nSNVPASm3Oc77GiQbIwPWOvLtvWlmKPSuiSiW0aqiXEI2pUH6
 Erlh4vg4bzjVbgHX0cigj017F4qkAc23bjEj+2It4m7fPoGRR8ArVj7hjPNYvYIPzE
 pBZbd4dz1F/e+GmOBj88FNDZJKS1MDuxzq87cGNY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220309092211eucas1p1b120ab083c6bd286aac0ad7263e37632~arABpZ5xT0834908349eucas1p1t;
 Wed,  9 Mar 2022 09:22:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CF.04.10009.3C178226; Wed,  9
 Mar 2022 09:22:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220309092210eucas1p28a37b106cfe144bfc65c052b4af16278~arABEre7i2899728997eucas1p25;
 Wed,  9 Mar 2022 09:22:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220309092210eusmtrp267e45953f30a7641108ea40991338fe9~arABClZfp0356203562eusmtrp2N;
 Wed,  9 Mar 2022 09:22:10 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-04-622871c35971
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0C.00.09404.2C178226; Wed,  9
 Mar 2022 09:22:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220309092210eusmtip10129e252869c02f275874ba3db66d8b1~arAAef2FT1002510025eusmtip1Z;
 Wed,  9 Mar 2022 09:22:10 +0000 (GMT)
Message-ID: <f318d57d-ef9e-295a-6865-eb0377a9bd07@samsung.com>
Date: Wed, 9 Mar 2022 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 javierm@redhat.com, geert@linux-m68k.org, sam@ravnborg.org,
 kraxel@redhat.com, ppaalanen@gmail.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7qHCzWSDH71SFj83zaR2eL+p9uM
 Fle+vmezeHZrL5PFwmnLGYGsk8wWJ/o+sFq0tlVbrPi5ldFiy5uJrA5cHnu/LWDx2DnrLrvH
 h49xHocOdzB63O8+zuSxZNpVNo/3+4DE5tPVHp83yQVwRnHZpKTmZJalFunbJXBlHN5whLXg
 gnnFnH1HGRsYF+p3MXJySAiYSMx4N5ERxBYSWMEoMfNMdBcjF5D9hVHiztONzBDOZ0aJD7M+
 sMF0fN3RzgqRWM4o0dp6jgXC+cgocXrhQ1aQKl4BO4nDi3+wgNgsAioSTycdgYoLSpyc+QQs
 LiqQJPHgQB87iC0s4Czx7/0bsDuYBcQlbj2ZzwQyVERgM6NEw6FWJoiEg8S/jsVgZ7AJGEp0
 ve0CszkFrCVmNV6FqpGXaN46G+xuCYF2TolFO7tZIe52kWhtOccOYQtLvDq+BcqWkfi/E2Kb
 hEAzo8TDc2vZIZweRonLTTMYIaqsJe6c+wW0jgNohabE+l3Q4HOUmHahnQkkLCHAJ3HjrSDE
 EXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1CCpdZSP6fheSdWQh7FzCyrGIUTy0t
 zk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMY6f/Hf+0g3Huq496hxiZOBgPMUpwMCuJ8DaFaiQJ
 8aYkVlalFuXHF5XmpBYfYpTmYFES503O3JAoJJCeWJKanZpakFoEk2Xi4JRqYJK5k+Da+XR1
 8rE/175cDr7xWnHuzmXHLr7JKFup/FFYv/HTU+eoiuWWRr+TCqpfVl9ammKd4ep3uWLS78DZ
 R7u0dpWunxQncXtdnZ5gtmO+1MStjBH5xuoXj5k1a5srWFhsulac9Db7QKeJEKcKRzOXea0B
 19Rzgem/Ja2cn939eEapu9XYaH6i+4S6FV4yCipO8X6zdp87cVS1YKJjHK9wv93rTd2fnuT/
 /W9xgeXQ/iLmC6HPLCS362h/K3hwtKLClHfZ45U3u1jLha59281/ReuhoHv3qWIz7yv2InE/
 besXRPcLlml9lkjy4n3vIxKsdMVo0t/0rV5xrZFimyUVNDZadScdFF/6IMJCiaU4I9FQi7mo
 OBEAWKswkNIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRmVeSWpSXmKPExsVy+t/xu7qHCjWSDFadMLT4v20is8X9T7cZ
 La58fc9m8ezWXiaLhdOWMwJZJ5ktTvR9YLVobau2WPFzK6PFljcTWR24PPZ+W8DisXPWXXaP
 Dx/jPA4d7mD0uN99nMljybSrbB7v9wGJzaerPT5vkgvgjNKzKcovLUlVyMgvLrFVija0MNIz
 tLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLOLzhCGvBBfOKOfuOMjYwLtTvYuTkkBAw
 kfi6o521i5GLQ0hgKaPEjwevGCESMhInpzWwQtjCEn+udbFBFL1nlDi5ZBY7SIJXwE7i8OIf
 LCA2i4CKxNNJR1gh4oISJ2c+AYuLCiRJvNy2ESwuLOAs8e/9G7AFzALiEreezGcCGSoisJlR
 YuKj98wQCQeJfx2LobZ9YpSY3gbicHKwCRhKdL3tArM5BawlZjVeZYJoMJPo2toFNVVeonnr
 bOYJjEKzkBwyC8nCWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwcrcd+7ll
 B+PKVx/1DjEycTAeYpTgYFYS4W0K1UgS4k1JrKxKLcqPLyrNSS0+xGgKDI2JzFKiyfnA1JFX
 Em9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cBksv3J/o27E1V+ak7p
 0lOMfl6W3bhQjqN+b9H7hNmf367bsPJtpOeHWNVOozAmbVPDiV0ts5tC/BbW3nDLKXScrPhF
 wFW14OrHvTsideVZov9PdKi7ejegatpPdbYrB6IXu05N1VixxjzGVfeE6eS2pK+eYewPv+l8
 vyt12jukWuul312P7vuPJZbPFPc0W9JjyrAzwec/37kjD1mVf6p+KlRas43hqo9WwxOlhODv
 8gvrFvWqS2lY6qfs6J7Ke7TM4LXbalfTiicViw18Z0XqPF4lqMn8Iu7ZxTkO5zZ/nBR81Kbq
 zI/dFguW7Kg1fP1ymcbFxJZS4VrtxR6/TvUssLXfarL4edDBZ9ocKxcqsRRnJBpqMRcVJwIA
 mHOt92UDAAA=
X-CMS-MailID: 20220309092210eucas1p28a37b106cfe144bfc65c052b4af16278
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
 <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 09.03.2022 09:22, Thomas Zimmermann wrote:
> Am 08.03.22 um 23:52 schrieb Marek Szyprowski:
>> On 23.02.2022 20:38, Thomas Zimmermann wrote:
>>> Improve the performance of cfb_imageblit() by manually unrolling
>>> the inner blitting loop and moving some invariants out. The compiler
>>> failed to do this automatically. This change keeps cfb_imageblit()
>>> in sync with sys_imagebit().
>>>
>>> A microbenchmark measures the average number of CPU cycles
>>> for cfb_imageblit() after a stabilizing period of a few minutes
>>> (i7-4790, FullHD, simpledrm, kernel with debugging).
>>>
>>> cfb_imageblit(), new: 15724 cycles
>>> cfb_imageblit(): old: 30566 cycles
>>>
>>> In the optimized case, cfb_imageblit() is now ~2x faster than before.
>>>
>>> v3:
>>>     * fix commit description (Pekka)
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> This patch landed recently in linux next-20220308 as commit 0d03011894d2
>> ("fbdev: Improve performance of cfb_imageblit()"). Sadly it causes a
>> freeze after DRM and emulated fbdev initialization on various Samsung
>> Exynos ARM 32bit based boards. This happens when kernel is compiled from
>> exynos_defconfig. Surprisingly when kernel is compiled from
>> multi_v7_defconfig all those boards boot fine, so this is a matter of
>> one of the debugging options enabled in the exynos_defconfig. I will try
>> to analyze this further and share the results. Reverting $subject on top
>> of next-20220308 fixes the boot issue.
>
> Thanks for reporting. I don't have the hardware to reproduce it and 
> there's no obvious difference to the original version. It's supposed 
> to be the same algorithm with a different implementation. Unless you 
> can figure out the issue, we can also revert the patch easily.

I've played a bit with .config options and found that the issue is 
caused by the compiled-in fonts used for the framebuffer. For some 
reasons (so far unknown to me), exynos_defconfig has the following odd 
setup:

CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
# CONFIG_FONT_8x8 is not set
# CONFIG_FONT_8x16 is not set
# CONFIG_FONT_6x11 is not set
CONFIG_FONT_7x14=y
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
# CONFIG_FONT_6x10 is not set
# CONFIG_FONT_10x18 is not set
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_FONT_TER16x32 is not set
# CONFIG_FONT_6x8 is not set

Such setup causes a freeze during framebuffer initialization (or just 
after it got registered). I've reproduced this even on Raspberry Pi 3B 
with multi_v7_defconfig and changed fonts configuration (this also 
required to disable vivid driver, which forces 8x16 font), where I got 
the following panic:

simple-framebuffer 3eace000.framebuffer: framebuffer at 0x3eace000, 
0x12c000 bytes
simple-framebuffer 3eace000.framebuffer: format=a8r8g8b8, 
mode=640x480x32, linelength=2560
8<--- cut here ---
Unable to handle kernel paging request at virtual address f0aac000
[f0aac000] *pgd=01d8b811, *pte=00000000, *ppte=00000000
Internal error: Oops: 807 [#1] SMP ARM
Modules linked in:
CPU: 3 PID: 1 Comm: swapper/0 Not tainted 
5.17.0-rc7-next-20220308-00002-g9e9894c98f8c #11471
Hardware name: BCM2835
PC is at cfb_imageblit+0x52c/0x64c
LR is at 0x1
pc : [<c0603dd8>]    lr : [<00000001>]    psr: a0000013
sp : f081da68  ip : c1d5ffff  fp : f081dad8
r10: f0980000  r9 : c1d69600  r8 : fffb5007
r7 : 00000000  r6 : 00000001  r5 : 00000a00  r4 : 00000001
r3 : 00000055  r2 : f0aac000  r1 : f081dad8  r0 : 00000007
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5383d  Table: 0000406a  DAC: 00000051
Register r0 information: non-paged memory
Register r1 information: 2-page vmalloc region starting at 0xf081c000 
allocated at kernel_clone+0xc0/0x428
Register r2 information: 0-page vmalloc region starting at 0xf0980000 
allocated at simplefb_probe+0x284/0x9b0
Register r3 information: non-paged memory
Register r4 information: non-paged memory
Register r5 information: non-paged memory
Register r6 information: non-paged memory
Register r7 information: NULL pointer
Register r8 information: non-paged memory
Register r9 information: non-slab/vmalloc memory
Register r10 information: 0-page vmalloc region starting at 0xf0980000 
allocated at simplefb_probe+0x284/0x9b0
Register r11 information: 2-page vmalloc region starting at 0xf081c000 
allocated at kernel_clone+0xc0/0x428
Register r12 information: non-slab/vmalloc memory
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xf081da68 to 0xf081e000)
...
  cfb_imageblit from soft_cursor+0x164/0x1cc
  soft_cursor from bit_cursor+0x4c0/0x4fc
  bit_cursor from fbcon_cursor+0xf8/0x108
  fbcon_cursor from hide_cursor+0x34/0x94
  hide_cursor from redraw_screen+0x13c/0x22c
  redraw_screen from fbcon_prepare_logo+0x164/0x444
  fbcon_prepare_logo from fbcon_init+0x38c/0x4bc
  fbcon_init from visual_init+0xc0/0x108
  visual_init from do_bind_con_driver+0x1ac/0x38c
  do_bind_con_driver from do_take_over_console+0x13c/0x1c8
  do_take_over_console from do_fbcon_takeover+0x74/0xcc
  do_fbcon_takeover from register_framebuffer+0x1bc/0x2cc
  register_framebuffer from simplefb_probe+0x8dc/0x9b0
  simplefb_probe from platform_probe+0x80/0xc0
  platform_probe from really_probe+0xc0/0x304
  really_probe from __driver_probe_device+0x88/0xe0
  __driver_probe_device from driver_probe_device+0x34/0xd4
  driver_probe_device from __driver_attach+0x8c/0xe0
  __driver_attach from bus_for_each_dev+0x64/0xb0
  bus_for_each_dev from bus_add_driver+0x160/0x1e4
  bus_add_driver from driver_register+0x78/0x10c
  driver_register from do_one_initcall+0x44/0x1e0
  do_one_initcall from kernel_init_freeable+0x1bc/0x20c
  kernel_init_freeable from kernel_init+0x18/0x12c
  kernel_init from ret_from_fork+0x14/0x2c
Code: e28db070 e00473a3 e08b7107 e5177044 (e5827000)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU0: stopping
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D 
5.17.0-rc7-next-20220308-00002-g9e9894c98f8c #11471
Hardware name: BCM2835
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from 0xc1201e64
CPU2: stopping
CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D 
5.17.0-rc7-next-20220308-00002-g9e9894c98f8c #11471
Hardware name: BCM2835
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from 0xf0809f5c
CPU1: stopping
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D 
5.17.0-rc7-next-20220308-00002-g9e9894c98f8c #11471
Hardware name: BCM2835
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from 0xf0805f5c
---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

