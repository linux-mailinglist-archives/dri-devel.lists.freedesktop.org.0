Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA3211C50
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 08:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F317188525;
	Thu,  2 Jul 2020 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DEC6E107
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 06:58:03 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702065801euoutp02748dfe56eebc701a8502edf258732784~d3TlvG6lX1984319843euoutp02t
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200702065801euoutp02748dfe56eebc701a8502edf258732784~d3TlvG6lX1984319843euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593673081;
 bh=NzaDBQfr6WRKi/ptL89uBWwolYKgYnuCPeIKSeN9LuI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KR+prety+t2iAfFfCHgMVLYAnHRi8ZbR5e+5xYhZX0KLeuQkBLHiWxe9ggMUASjdZ
 PP0ahDjwFaxAlQzohByYq3aQlWVeuN+Z1K23e6ouRaPNcLkXMObWpFjniHTJrEDlLM
 Ne3tkIBO1+ur+HpO21bCChJgd70BvdxKdas2sxTo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702065801eucas1p2c22c35b32d3a7f13154a9a74ac1ac6c7~d3TlkWoce0034400344eucas1p2m;
 Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7B.2E.05997.9758DFE5; Thu,  2
 Jul 2020 07:58:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702065801eucas1p203cd0ed7dc1c7efd7f37624c24940082~d3Tk-2nPT0037400374eucas1p22;
 Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702065801eusmtrp2aa3b2154a9c6fb4d5f458198cff3e558~d3Tk-O52v1081310813eusmtrp2R;
 Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-9b-5efd8579f6c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 16.05.06314.8758DFE5; Thu,  2
 Jul 2020 07:58:00 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702065800eusmtip10a240e25b980d08ba755d2c71639018c~d3Tkc-O610867808678eusmtip1Y;
 Thu,  2 Jul 2020 06:58:00 +0000 (GMT)
Subject: Re: [PATCH] drm/vc4/vc4_hdmi: fill ASoC card owner
To: Stefan Wahren <stefan.wahren@i2se.com>, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b31f4a5e-98ec-cf57-5aaa-38df273d56d9@samsung.com>
Date: Thu, 2 Jul 2020 08:58:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89bb3b69-2c81-3f83-da68-0e3b9a068cf5@i2se.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO2duZ+LkuCm+aHQZGhakWRonFKlQWBDRjyAyU095mpKXtePM
 1Q9veWnWvP3QVtEKUzNMUZtNKHGFQ03TMpGpmBewhUNQ0wybbTta/nve93ufG3wELja6+REp
 6ZmMMp1OlfLdeYae9cFD6sI/8Yd15gDq/mAvRo0MmzBq01CBUyM/F/lUxXiLgDLo6vlUa8MY
 n7K2LWAnCFnLcj5f9nZVz5O9toTLOla/ucmmSs2YrK02R9bWf/ucINY9MolJTclilCFRie7J
 3/XrmKLBP7tnehLLRbWgQUICyDB4n9eOObGYbEBgKo3RIHcHXkFgH51344ZlBBXaErTNeDnc
 jXOMegRVdhV3tIhgaaLBJSUhIyB3strF9iaLEPyabUbOASfbEWjm61xSfDIUNDYN34lFZBQM
 NC24ZHlkAEyPrrmUfMh4aLZ2YNyNF/Q+mOM5sZCMhOd9jS4dnNwDHbZHOId9wTL3BHOaAdkn
 AGNXNY/LHQ0vWkq3Okjgh7ldwOFdsGncJhQgmB5sEnDDPQRf8mu2GBEwMfjbEZVwWByA5s4Q
 bn0SJvSjyLkG0hPGbF5cCE+oNFTj3FoEJUVi7no/6Myv/tl2D33Gy5FUt6Oabkcd3Y46uv++
 esRrRL6Mik2TM+yRdOZmMEunsap0efDVjLRW5PhQ/XbzyhvUuXHFhEgCST1Eydkb8WI3OotV
 p5kQELjUW3RqoD9eLEqi1bcYZUaCUpXKsCbkT/CkvqKjz6yXxaSczmSuM4yCUW6/YoTQLxfF
 1tV65MUdl9+wzzIZKVrjkkftpRrVHYYOfBqnGI+Y796tVu2L8fwoGJup6mKEd2eGbF+zrI+r
 gq6FB0o+UAsePpW07XzBUrl27WyY9mHx3tNBCSuKzTKttUxiyVQqwlrLCuTDzcWJ1k+FKOGi
 JyuZeldiib6g88shj51hOqQ8NpkOPYgrWfov/NbQEEwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xu7qVrX/jDA6tY7HoPXeSyeLKxUNM
 Fv+3TWS2uPL1PZvFxNsb2C22zVrOZrFpxQ02i5eb3zA5cHhs+NzE5rH32wIWj623TD22f3vA
 6nG/+ziTx+Yl9R6bT1cHsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb
 2aSk5mSWpRbp2yXoZbxY8JOpYIV0xbGHd5kaGJdIdDFyckgImEisvniQuYuRi0NIYCmjRNvZ
 LywQCRmJk9MaWCFsYYk/17rYIIreMkqcOP0WLCEsYC3RcHc6K0hCRKCNUeLRx26wUcwCWxgl
 3rzcwgLRcphRYvvue4wgLWwChhJdb0FmcXLwCthJnF37hhnEZhFQkXh47TsTiC0qECexfMt8
 dogaQYmTM5+A3cQpYCOx9NQqsDnMAmYS8zY/ZIaw5SW2v50DZYtL3Hoyn2kCo9AsJO2zkLTM
 QtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIFRue3Yz807GC9tDD7EKMDBqMTD
 m1HxJ06INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTBh5
 JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYGbvecd2+u+B80JYM
 rRb/30fepde/dNu3/fT6IKv1f/O8LR78C3l8fPMP/imbpmlo7pzrcehl9knV9I6Hj/iyeGRL
 yjVWbRNp+f3k3zypJSdu6iueM3U/OyPwN2fP7Wr5Wk8bxxW91b2v1pxPPsv/zlW9fZPcUQ3J
 rBu6KctvPlq4u05Dc8+VcCWW4oxEQy3mouJEAI2UgZbgAgAA
X-CMS-MailID: 20200702065801eucas1p203cd0ed7dc1c7efd7f37624c24940082
X-Msg-Generator: CA
X-RootMTR: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
References: <CGME20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba@eucas1p1.samsung.com>
 <20200701073949.28941-1-m.szyprowski@samsung.com>
 <89bb3b69-2c81-3f83-da68-0e3b9a068cf5@i2se.com>
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
Cc: David Airlie <airlied@linux.ie>, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.07.2020 20:49, Stefan Wahren wrote:
> Am 01.07.20 um 09:39 schrieb Marek Szyprowski:
>> card->owner is a required property and since commit 81033c6b584b ("ALSA:
>> core: Warn on empty module") a warning is issued if it is empty. Fix lack
>> of it. This fixes following warning observed on RaspberryPi 3B board
>> with ARM 32bit kernel and multi_v7_defconfig:
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 210 at sound/core/init.c:207 snd_card_new+0x378/0x398 [snd]
>> Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine bluetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore ecdh_generic ecc bcm2835_thermal phy_generic
>> CPU: 1 PID: 210 Comm: systemd-udevd Not tainted 5.8.0-rc1-00027-g81033c6b584b #1087
>> Hardware name: BCM2835
>> [<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0x14)
>> [<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
>> [<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
>> [<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
>> [<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>] (snd_card_new+0x378/0x398 [snd])
>> [<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>] (snd_soc_bind_card+0x280/0x99c [snd_soc_core])
>> [<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>] (devm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
>> [<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf165654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
>> [<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>] (component_bind_all+0xec/0x24c)
>> [<c09d660c>] (component_bind_all) from [<bf15c44c>] (vc4_drm_bind+0xd4/0x174 [vc4])
>> [<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>] (try_to_bring_up_master+0x160/0x1b0)
>> [<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>] (component_master_add_with_match+0xd0/0x104)
>> [<c09d6f38>] (component_master_add_with_match) from [<bf15c588>] (vc4_platform_drm_probe+0x9c/0xbc [vc4])
>> [<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>] (platform_drv_probe+0x6c/0xa4)
>> [<c09df740>] (platform_drv_probe) from [<c09dd6f0>] (really_probe+0x210/0x350)
>> [<c09dd6f0>] (really_probe) from [<c09dd940>] (driver_probe_device+0x5c/0xb4)
>> [<c09dd940>] (driver_probe_device) from [<c09ddb38>] (device_driver_attach+0x58/0x60)
>> [<c09ddb38>] (device_driver_attach) from [<c09ddbc0>] (__driver_attach+0x80/0xbc)
>> [<c09ddbc0>] (__driver_attach) from [<c09db820>] (bus_for_each_dev+0x68/0xb4)
>> [<c09db820>] (bus_for_each_dev) from [<c09dc9f8>] (bus_add_driver+0x130/0x1e8)
>> [<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x78/0x110)
>> [<c09de648>] (driver_register) from [<c0302038>] (do_one_initcall+0x50/0x220)
>> [<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x60/0x210)
>> [<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/0x2338)
>> [<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/0xbc)
>> [<c03dac00>] (sys_finit_module) from [<c03000c0>] (ret_fast_syscall+0x0/0x54)
>> Exception stack(0xeded9fa8 to 0xeded9ff0)
>> ...
>> ---[ end trace 6414689569c2bc08 ]---
>>
>> Suggested-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> thanks for this patch. Any chance for a fixes tag here?

Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
