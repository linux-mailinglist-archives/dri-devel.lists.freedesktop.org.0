Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A70138C9A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 09:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818AA895CA;
	Mon, 13 Jan 2020 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5661E895CA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 08:05:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06C16AD07;
 Mon, 13 Jan 2020 08:05:15 +0000 (UTC)
Subject: Re: Warnings in DRM code when removing/unbinding a driver
To: John Garry <john.garry@huawei.com>,
 "kongxinwei (A)" <kong.kongxinwei@hisilicon.com>,
 "Chenfeng (puck)" <puck.chen@hisilicon.com>,
 "airlied@linux.ie" <airlied@linux.ie>, daniel@ffwll.ch
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <381e28c2-f3e4-6f75-c632-96dd8a980c87@suse.de>
 <38ce1d99-e803-3693-adff-106dc438c973@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <a5ad7291-c369-fadb-a085-b5a6465024be@suse.de>
Date: Mon, 13 Jan 2020 09:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <38ce1d99-e803-3693-adff-106dc438c973@huawei.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1539482115=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1539482115==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dVciguu1FChPYLvY7s88zG41BmBe4opAY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dVciguu1FChPYLvY7s88zG41BmBe4opAY
Content-Type: multipart/mixed; boundary="U5doxGrPoTQDGAKQ4eASe1cI9wDjEVZ1c";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Garry <john.garry@huawei.com>,
 "kongxinwei (A)" <kong.kongxinwei@hisilicon.com>,
 "Chenfeng (puck)" <puck.chen@hisilicon.com>,
 "airlied@linux.ie" <airlied@linux.ie>, daniel@ffwll.ch
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <a5ad7291-c369-fadb-a085-b5a6465024be@suse.de>
Subject: Re: Warnings in DRM code when removing/unbinding a driver
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <381e28c2-f3e4-6f75-c632-96dd8a980c87@suse.de>
 <38ce1d99-e803-3693-adff-106dc438c973@huawei.com>
In-Reply-To: <38ce1d99-e803-3693-adff-106dc438c973@huawei.com>

--U5doxGrPoTQDGAKQ4eASe1cI9wDjEVZ1c
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi John

Am 10.01.20 um 13:54 schrieb John Garry:
>=20
>=20
> Hi Thomas,
>=20
>> drm-tip now contains
>=20
> I have tested today's linux-next, which includes this:
>=20
>>
>> commit a88248506a2bcfeaef6837a53cde19fe11970e6c
>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>> Date:=C2=A0=C2=A0 Tue Dec 3 09:38:15 2019 +0100
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 drm/hisilicon/hibmc: Switch to generic fbdev =
emulation
>>
>> which removes this entire code and switches hibmc to generic fbdev
>> emulation. Does that fix the problem?
>>
>=20
> And I see no warn, here's a dmesg snippet:

Great. So I'll consider this fixed. Thanks for reporting ad testing.

Best regards
Thomas

>=20
> [=C2=A0=C2=A0 20.672787] pci 0007:90:00.0: can't derive routing for PCI=
 INT A
> [=C2=A0=C2=A0 20.678831] hibmc-drm 0007:91:00.0: PCI INT A: no GSI
> [=C2=A0=C2=A0 20.686536] pci_bus 0007:90: 2-byte config write to 0007:9=
0:00.0
> offset 0x4 may corrupt adjacent RW1C bits
> [=C2=A0=C2=A0 20.696888] [TTM] Zone=C2=A0 kernel: Available graphics me=
mory: 57359458 KiB
> [=C2=A0=C2=A0 20.703545] [TTM] Zone=C2=A0=C2=A0 dma32: Available graphi=
cs memory: 2097152 KiB
> [=C2=A0=C2=A0 20.710108] [TTM] Initializing pool allocator
> [=C2=A0=C2=A0 20.714561] [TTM] Initializing DMA pool allocator
> [=C2=A0=C2=A0 20.720212] [drm] Supports vblank timestamp caching Rev 2 =
(21.10.2013).
> [=C2=A0=C2=A0 20.726863] [drm] No driver support for vblank timestamp q=
uery.
> [=C2=A0=C2=A0 20.754777] Console: switching to colour frame buffer devi=
ce 100x37
> [=C2=A0=C2=A0 20.778180] hibmc-drm 0007:91:00.0: fb0: hibmcdrmfb frame =
buffer device
> [=C2=A0=C2=A0 20.786447] [drm] Initialized hibmc 1.0.0 20160828 for 000=
7:91:00.0
> on minor 0
> [=C2=A0=C2=A0 20.794346] Console: switching to colour dummy device 80x2=
5
> [=C2=A0=C2=A0 20.801884] pci 0007:90:00.0: can't derive routing for PCI=
 INT A
> [=C2=A0=C2=A0 20.807963] hibmc-drm 0007:91:00.0: PCI INT A: no GSI
> [=C2=A0=C2=A0 20.813656] [TTM] Finalizing pool allocator
> [=C2=A0=C2=A0 20.817905] [TTM] Finalizing DMA pool allocator
> [=C2=A0=C2=A0 20.822576] [TTM] Zone=C2=A0 kernel: Used memory at exit: =
0 KiB
> [=C2=A0=C2=A0 20.828760] [TTM] Zone=C2=A0=C2=A0 dma32: Used memory at e=
xit: 0 KiB
> [=C2=A0=C2=A0 20.834978] pci 0007:90:00.0: can't derive routing for PCI=
 INT A
> [=C2=A0=C2=A0 20.841021] hibmc-drm 0007:91:00.0: PCI INT A: no GSI
> [=C2=A0=C2=A0 20.848858] [TTM] Zone=C2=A0 kernel: Available graphics me=
mory: 57359458 KiB
> [=C2=A0=C2=A0 20.855516] [TTM] Zone=C2=A0=C2=A0 dma32: Available graphi=
cs memory: 2097152 KiB
> [=C2=A0=C2=A0 20.862079] [TTM] Initializing pool allocator
> [=C2=A0=C2=A0 20.866525] [TTM] Initializing DMA pool allocator
> [=C2=A0=C2=A0 20.872064] [drm] Supports vblank timestamp caching Rev 2 =
(21.10.2013).
> [=C2=A0=C2=A0 20.878716] [drm] No driver support for vblank timestamp q=
uery.
> [=C2=A0=C2=A0 20.905996] Console: switching to colour frame buffer devi=
ce 100x37
> [=C2=A0=C2=A0 20.929385] hibmc-drm 0007:91:00.0: fb0: hibmcdrmfb frame =
buffer device
> [=C2=A0=C2=A0 20.937241] [drm] Initialized hibmc 1.0.0 20160828 for 000=
7:91:00.0
> on minor 0
> [=C2=A0=C2=A0 21.171906] loop: module loaded
>=20
> Thanks,
> John
>=20
>> Best regards
>> Thomas
>>
>>> [=C2=A0=C2=A0 27.965802]=C2=A0 hibmc_unload+0x2c/0xd0
>>> [=C2=A0=C2=A0 27.969281]=C2=A0 hibmc_pci_remove+0x2c/0x40
>>> [=C2=A0=C2=A0 27.973109]=C2=A0 pci_device_remove+0x6c/0x140
>>> [=C2=A0=C2=A0 27.977110]=C2=A0 really_probe+0x174/0x548
>>> [=C2=A0=C2=A0 27.980763]=C2=A0 driver_probe_device+0x7c/0x148
>>> [=C2=A0=C2=A0 27.984936]=C2=A0 device_driver_attach+0x94/0xa0
>>> [=C2=A0=C2=A0 27.989109]=C2=A0 __driver_attach+0xa8/0x110
>>> [=C2=A0=C2=A0 27.992935]=C2=A0 bus_for_each_dev+0xe8/0x158
>>> [=C2=A0=C2=A0 27.996849]=C2=A0 driver_attach+0x30/0x40
>>> [=C2=A0=C2=A0 28.000415]=C2=A0 bus_add_driver+0x234/0x2f0
>>> [=C2=A0=C2=A0 28.004241]=C2=A0 driver_register+0xbc/0x1d0
>>> [=C2=A0=C2=A0 28.008067]=C2=A0 __pci_register_driver+0xbc/0xd0
>>> [=C2=A0=C2=A0 28.012329]=C2=A0 hibmc_pci_driver_init+0x20/0x28
>>> [=C2=A0=C2=A0 28.016590]=C2=A0 do_one_initcall+0xb4/0x254
>>> [=C2=A0=C2=A0 28.020417]=C2=A0 kernel_init_freeable+0x27c/0x328
>>> [=C2=A0=C2=A0 28.024765]=C2=A0 kernel_init+0x10/0x118
>>> [=C2=A0=C2=A0 28.028245]=C2=A0 ret_from_fork+0x10/0x18
>>> [=C2=A0=C2=A0 28.031813] ---[ end trace 35a83b71b657878d ]---
>>> [=C2=A0=C2=A0 28.036503] ------------[ cut here ]------------
>>> [=C2=A0=C2=A0 28.041115] WARNING: CPU: 24 PID: 1 at
>>> drivers/gpu/drm/drm_gem_vram_helper.c:40
>>> ttm_buffer_object_destroy+0x4c/0x80
>>> [=C2=A0=C2=A0 28.051537] Modules linked in:
>>> [=C2=A0=C2=A0 28.054585] CPU: 24 PID: 1 Comm: swapper/0 Tainted: G=C2=
=A0=C2=A0=C2=A0 B=C2=A0=C2=A0 W
>>> =C2=A0=C2=A05.5.0-rc1-dirty #565
>>> [=C2=A0=C2=A0 28.062924] Hardware name: Huawei D06 /D06, BIOS Hisilic=
on D06 UEFI
>>> RC0 - V1.16.01 03/15/2019
>>>
>>> [snip]
>>>
>>> Indeed, simply unbinding the device from the driver causes the same s=
ort
>>> of issue:
>>>
>>> root@(none)$ cd ./bus/pci/drivers/hibmc-drm/
>>> root@(none)$ ls
>>> 0000:05:00.0=C2=A0 bind=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 new_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove_id=C2=A0=C2=
=A0=C2=A0=C2=A0 uevent
>>> unbind
>>> root@(none)$ echo 0000\:05\:00.0 > unbind
>>> [=C2=A0 116.074352] ------------[ cut here ]------------
>>> [=C2=A0 116.078978] WARNING: CPU: 17 PID: 1178 at
>>> drivers/gpu/drm/drm_gem_vram_helper.c:40
>>> ttm_buffer_object_destroy+0x4c/0x80
>>> [=C2=A0 116.089661] Modules linked in:
>>> [=C2=A0 116.092711] CPU: 17 PID: 1178 Comm: sh Tainted: G=C2=A0=C2=A0=
=C2=A0 B=C2=A0=C2=A0 W
>>> 5.5.0-rc1-dirty #565
>>> [=C2=A0 116.100704] Hardware name: Huawei D06 /D06, BIOS Hisilicon D0=
6 UEFI
>>> RC0 - V1.16.01 03/15/2019
>>> [=C2=A0 116.109218] pstate: 20400009 (nzCv daif +PAN -UAO)
>>> [=C2=A0 116.114001] pc : ttm_buffer_object_destroy+0x4c/0x80
>>> [=C2=A0 116.118956] lr : ttm_buffer_object_destroy+0x18/0x80
>>> [=C2=A0 116.123910] sp : ffff0022e6cef8e0
>>> [=C2=A0 116.127215] x29: ffff0022e6cef8e0 x28: ffff00231b1fb000
>>> [=C2=A0 116.132519] x27: 0000000000000000 x26: ffff00231b1fb000
>>> [=C2=A0 116.137821] x25: ffff0022e6cefdc0 x24: 0000000000002480
>>> [=C2=A0 116.143124] x23: ffff0023682b6ab0 x22: ffff0023682b6800
>>> [=C2=A0 116.148427] x21: ffff0023682b6800 x20: 0000000000000000
>>> [=C2=A0 116.153730] x19: ffff0023682b6800 x18: 0000000000000000
>>> [=C2=A0 116.159032] x17: 000000000000000000000000001
>>> [=C2=A0 116.185545] x7 : ffff0023682b6b07 x6 : ffff80046d056d61
>>> [=C2=A0 116.190848] x5 : ffff80046d056d61 x4 : ffff0023682b6ba0
>>> [=C2=A0 116.196151] x3 : ffffa00010197338 x2 : dfffa00000000000
>>> [=C2=A0 116.201453] x1 : 0000000000000003 x0 : 0000000000000001
>>> [=C2=A0 116.206756] Call trace:
>>> [=C2=A0 116.209195]=C2=A0 ttm_buffer_object_destroy+0x4c/0x80
>>> [=C2=A0 116.213803]=C2=A0 ttm_bo_release_list+0x184/0x220
>>> [=C2=A0 116.218064]=C2=A0 ttm_bo_put+0x410/0x5d0
>>> [=C2=A0 116.221544]=C2=A0 drm_gem_vram_object_free+0xc/0x18
>>> [=C2=A0 116.225979]=C2=A0 drm_gem_object_free+0x34/0xd0
>>> [=C2=A0 116.230066]=C2=A0 drm_gem_object_put_unlocked+0xc8/0xf0
>>> [=C2=A0 116.234848]=C2=A0 hibmc_user_framebuffer_destroy+0x20/0x40
>>> [=C2=A0 116.239890]=C2=A0 drm_framebuffer_free+0x48/0x58
>>> [=C2=A0 116.244064]=C2=A0 drm_mode_object_put.part.1+0x90/0xe8
>>> [=C2=A0 116.248759]=C2=A0 drm_mode_object_put+0x28/0x38
>>> [=C2=A0 116.252846]=C2=A0 hibmc_fbdev_fini+0x54/0x78
>>> [=C2=A0 116.256672]=C2=A0 hibmc_unload+0x2c/0xd0
>>> [=C2=A0 116.260151]=C2=A0 hibmc_pci_remove+0x2c/0x40
>>> [=C2=A0 116.263979]=C2=A0 pci_device_remove+0x6c/0x140
>>> [=C2=A0 116.267980]=C2=A0 device_release_driver_internal+0x134/0x250
>>> [=C2=A0 116.273196]=C2=A0 device_driver_detach+0x28/0x38
>>> [=C2=A0 116.277369]=C2=A0 unbind_store+0xfc/0x150
>>> [=C2=A0 116.280934]=C2=A0 drv_attr_store+0x48/0x60
>>> [=C2=A0 116.284589]=C2=A0 sysfs_kf_write+0x80/0xb0
>>> [=C2=A0 116.288241]=C2=A0 kernfs_fop_write+0x1d4/0x320
>>> [=C2=A0 116.292243]=C2=A0 __vfs_write+0x54/0x98
>>> [=C2=A0 116.295635]=C2=A0 vfs_write+0xe8/0x270
>>> [=C2=A0 116.298940]=C2=A0 ksys_write+0xc8/0x180
>>> [=C2=A0 116.302333]=C2=A0 __arm64_sys_write+0x40/0x50
>>> [=C2=A0 116.306248]=C2=A0 el0_svc_common.constprop.0+0xa4/0x1f8
>>> [=C2=A0 116.311029]=C2=A0 el0_svc_handler+0x34/0xb0
>>> [=C2=A0 116.314770]=C2=A0 el0_sync_handler+0x10c/0x1c8
>>> [=C2=A0 116.318769]=C2=A0 el0_sync+0x140/0x180
>>> [=C2=A0 116.322074] ---[ end trace e60e43d0e316b5c8 ]---
>>> [=C2=A0 116.326868] ------------[ cut here ]------------
>>>
>>>
>>> dmesg and .config is here:
>>> https://pastebin.com/4P5yaZBS
>>>
>>> I'm not sure if this is a HIBMC driver issue or issue with the
>>> framework.
>>>
>>> john
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--U5doxGrPoTQDGAKQ4eASe1cI9wDjEVZ1c--

--dVciguu1FChPYLvY7s88zG41BmBe4opAY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4cJLoACgkQaA3BHVML
eiOzbwf/cxN8G+eXYNP1H73zzZkYqYm64JXQieQ4R2MQXAWC87oerf0AZyQ96hZ1
VwC01p5rK/23y8wfMQc9U1YUu1FCSF/b8etcixy5zKPwoXzC+L1vUa6fFcDB69AB
t3/Gf0/vNoptMTObF4AO2lAb2WOhovpsW5gOZ2IaYWYe3CgTPT9EQ7ClRrvsaIG2
tjivfiFqD5QcS+sOBYgNqE+RiQA0mMReJgleO9LCwtM7bym7CNo5EmxZ4d8LlDdJ
FFjIWIihpTS2AyUSkWyf9NrUNE0Gn/QZvtvLYhcuWQWLQv5u6rMICItLBi7UFNzo
YQWGtb7DsvOnefImm7d5fWnzen4H7A==
=4tjJ
-----END PGP SIGNATURE-----

--dVciguu1FChPYLvY7s88zG41BmBe4opAY--

--===============1539482115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1539482115==--
