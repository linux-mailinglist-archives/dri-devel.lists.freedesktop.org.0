Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E0122CCA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9C89BBD;
	Tue, 17 Dec 2019 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7C089BBD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:25:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y11so11278041wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rCYYeF5GDXokZn0Gy5i/HzCHIhTqsDQM6kprBIsqwK8=;
 b=CwGRBguSR7o4PAZK3w11pKw52a8ux5kTPmhjNsU2Uw8U+2GztngqFb/rxOO8as/CgT
 7mXwrLQzWeoW7EFt9x4a1A/rGLQQs6Rpgf6G0mMAPQ8Dple50+2Iqa8AygMn4Z/A9GMw
 N4BAqvJQ3xYb3cxwxO7S8Dzcrr18gvFseb23U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=rCYYeF5GDXokZn0Gy5i/HzCHIhTqsDQM6kprBIsqwK8=;
 b=mYzaSejw8cZ7Icceog12xisWDO/V4LNeQxgFAt+6wMDg7eeU1npd89Rp66SJ7VrpXF
 r0eZM4RqrI7EwRGmpTqPoqSPdrvzTQiyBPnJYsa3P5i/2ExUkPTIKHJU8G/yx++dbzkN
 3dW3sIjZSVclp6V6wsqYcEuqagd3MmYD1Dn+/7aUfUG9r+mcUSxfSmgFxEuvL/N11zHA
 wkg58vW2OjQjouVAcs6rxv7sVJFeQTZU0yfgGwBcqvgKKN9yZo+SghkP5cwiI3RszPH8
 hu9lhYP3AmpzWCwv54LeyVeenHf4JU66T9rWxqmErv0DksoFdFGLtuE3RSBkgSqsAYf3
 Y+oQ==
X-Gm-Message-State: APjAAAXeiFtCtihHDKLFuebH++PMCR8SdzDoYaNv6AWvG/r4Vz6ynAcq
 mnfECPuHz5XGcCUw8a2430WSeQ==
X-Google-Smtp-Source: APXvYqyx24m9AQSwKCpQ4TLcbcuG8OOKifkNK3FFx1oM/JOCE+eVV/ysks87N6QJFIPkfu0bRC3FLQ==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr36106052wrm.107.1576589098937; 
 Tue, 17 Dec 2019 05:24:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id y20sm2858685wmi.25.2019.12.17.05.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:24:58 -0800 (PST)
Date: Tue, 17 Dec 2019 14:24:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Garry <john.garry@huawei.com>
Subject: Re: Warnings in DRM code when removing/unbinding a driver
Message-ID: <20191217132456.GA624164@phenom.ffwll.local>
Mail-Followup-To: John Garry <john.garry@huawei.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 "kongxinwei (A)" <kong.kongxinwei@hisilicon.com>,
 "Chenfeng (puck)" <puck.chen@hisilicon.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>, "xuwei (O)" <xuwei5@hisilicon.com>
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <d222115b-8fe7-75d9-ec88-c67bdaa2f0bf@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d222115b-8fe7-75d9-ec88-c67bdaa2f0bf@huawei.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linuxarm <linuxarm@huawei.com>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 "xuwei \(O\)" <xuwei5@hisilicon.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 09:20:43AM +0000, John Garry wrote:
> On 16/12/2019 17:23, John Garry wrote:
> =

> +, -
> =

> > Hi all,
> =

> xinliang <z.liuxinliang@hisilicon.com> is bouncing. We need to get his new
> mail address.
> =

> John
> =

> > =

> > Enabling CONFIG_DEBUG_TEST_DRIVER_REMOVE causes many warns on a system
> > with the HIBMC hw:
> > =

> > [=A0=A0 27.788806] WARNING: CPU: 24 PID: 1 at
> > drivers/gpu/drm/drm_gem_vram_helper.c:564
> > bo_driver_move_notify+0x8c/0x98
> > [=A0=A0 27.798969] Modules linked in:
> > [=A0=A0 27.802018] CPU: 24 PID: 1 Comm: swapper/0 Tainted: G=A0=A0=A0 B
> > =A05.5.0-rc1-dirty #565
> > [=A0=A0 27.810358] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 U=
EFI
> > RC0 - V1.16.01 03/15/2019
> > [=A0=A0 27.818872] pstate: 20c00009 (nzCv daif +PAN +UAO)
> > [=A0=A0 27.823654] pc : bo_driver_move_notify+0x8c/0x98
> > [=A0=A0 27.828262] lr : bo_driver_move_notify+0x40/0x98
> > [=A0=A0 27.832868] sp : ffff00236f0677e0
> > [=A0=A0 27.836173] x29: ffff00236f0677e0 x28: ffffa0001454e5e0
> > [=A0=A0 27.841476] x27: ffff002366e52128 x26: ffffa000149e67b0
> > [=A0=A0 27.846779] x25: ffff002366e523e0 x24: ffff002336936120
> > [=A0=A0 27.852082] x23: ffff0023346f4010 x22: ffff002336936128
> > [=A0=A0 27.857385] x21: ffffa000149c15c0 x20: ffff0023369361f8
> > [=A0=A0 27.862687] x19: ffff002336936000 x18: 0000000000001258
> > [=A0=A0 27.867989] x17: 0000000000001190 x16: 00000000000011d0
> > [=A0=A0 27.873292] x15: 0000000000001348 x14: ffffa00012d68190
> > [=A0=A0 27.878595] x13: 0000000000000006 x12: 1ffff40003241f91
> > [=A0=A0 27.883897] x11: ffff940003241f91 x10: dfffa00000000000
> > [=A0=A0 27.889200] x9 : ffff940003241f92 x8 : 0000000000000001
> > [=A0=A0 27.894502] x7 : ffffa0001920fc88 x6 : ffff940003241f92
> > [=A0=A0 27.899804] x5 : ffff940003241f92 x4 : ffff0023369363a0
> > [=A0=A0 27.905107] x3 : ffffa00010c104b8 x2 : dfffa00000000000
> > [=A0=A0 27.910409] x1 : 0000000000000003 x0 : 0000000000000001
> > [=A0=A0 27.915712] Call trace:
> > [=A0=A0 27.918151]=A0 bo_driver_move_notify+0x8c/0x98
> > [=A0=A0 27.922412]=A0 ttm_bo_cleanup_memtype_use+0x54/0x100
> > [=A0=A0 27.927194]=A0 ttm_bo_put+0x3a0/0x5d0
> > [=A0=A0 27.930673]=A0 drm_gem_vram_object_free+0xc/0x18
> > [=A0=A0 27.935109]=A0 drm_gem_object_free+0x34/0xd0
> > [=A0=A0 27.939196]=A0 drm_gem_object_put_unlocked+0xc8/0xf0
> > [=A0=A0 27.943978]=A0 hibmc_user_framebuffer_destroy+0x20/0x40
> > [=A0=A0 27.949020]=A0 drm_framebuffer_free+0x48/0x58
> > [=A0=A0 27.953194]=A0 drm_mode_object_put.part.1+0x90/0xe8
> > [=A0=A0 27.957889]=A0 drm_mode_object_put+0x28/0x38
> > [=A0=A0 27.961976]=A0 hibmc_fbdev_fini+0x54/0x78
> > [=A0=A0 27.965802]=A0 hibmc_unload+0x2c/0xd0
> > [=A0=A0 27.969281]=A0 hibmc_pci_remove+0x2c/0x40
> > [=A0=A0 27.973109]=A0 pci_device_remove+0x6c/0x140
> > [=A0=A0 27.977110]=A0 really_probe+0x174/0x548
> > [=A0=A0 27.980763]=A0 driver_probe_device+0x7c/0x148
> > [=A0=A0 27.984936]=A0 device_driver_attach+0x94/0xa0
> > [=A0=A0 27.989109]=A0 __driver_attach+0xa8/0x110
> > [=A0=A0 27.992935]=A0 bus_for_each_dev+0xe8/0x158
> > [=A0=A0 27.996849]=A0 driver_attach+0x30/0x40
> > [=A0=A0 28.000415]=A0 bus_add_driver+0x234/0x2f0
> > [=A0=A0 28.004241]=A0 driver_register+0xbc/0x1d0
> > [=A0=A0 28.008067]=A0 __pci_register_driver+0xbc/0xd0
> > [=A0=A0 28.012329]=A0 hibmc_pci_driver_init+0x20/0x28
> > [=A0=A0 28.016590]=A0 do_one_initcall+0xb4/0x254
> > [=A0=A0 28.020417]=A0 kernel_init_freeable+0x27c/0x328
> > [=A0=A0 28.024765]=A0 kernel_init+0x10/0x118
> > [=A0=A0 28.028245]=A0 ret_from_fork+0x10/0x18
> > [=A0=A0 28.031813] ---[ end trace 35a83b71b657878d ]---
> > [=A0=A0 28.036503] ------------[ cut here ]------------
> > [=A0=A0 28.041115] WARNING: CPU: 24 PID: 1 at
> > drivers/gpu/drm/drm_gem_vram_helper.c:40
> > ttm_buffer_object_destroy+0x4c/0x80
> > [=A0=A0 28.051537] Modules linked in:
> > [=A0=A0 28.054585] CPU: 24 PID: 1 Comm: swapper/0 Tainted: G=A0=A0=A0 B=
=A0=A0 W
> > =A05.5.0-rc1-dirty #565
> > [=A0=A0 28.062924] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 U=
EFI
> > RC0 - V1.16.01 03/15/2019
> > =

> > [snip]
> > =

> > Indeed, simply unbinding the device from the driver causes the same sort
> > of issue:
> > =

> > root@(none)$ cd ./bus/pci/drivers/hibmc-drm/
> > root@(none)$ ls
> > 0000:05:00.0=A0 bind=A0=A0=A0=A0=A0=A0=A0=A0=A0 new_id=A0=A0=A0=A0=A0=
=A0=A0 remove_id=A0=A0=A0=A0 uevent
> > unbind
> > root@(none)$ echo 0000\:05\:00.0 > unbind
> > [=A0 116.074352] ------------[ cut here ]------------
> > [=A0 116.078978] WARNING: CPU: 17 PID: 1178 at
> > drivers/gpu/drm/drm_gem_vram_helper.c:40
> > ttm_buffer_object_destroy+0x4c/0x80
> > [=A0 116.089661] Modules linked in:
> > [=A0 116.092711] CPU: 17 PID: 1178 Comm: sh Tainted: G=A0=A0=A0 B=A0=A0=
 W
> > 5.5.0-rc1-dirty #565
> > [=A0 116.100704] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI
> > RC0 - V1.16.01 03/15/2019
> > [=A0 116.109218] pstate: 20400009 (nzCv daif +PAN -UAO)
> > [=A0 116.114001] pc : ttm_buffer_object_destroy+0x4c/0x80
> > [=A0 116.118956] lr : ttm_buffer_object_destroy+0x18/0x80
> > [=A0 116.123910] sp : ffff0022e6cef8e0
> > [=A0 116.127215] x29: ffff0022e6cef8e0 x28: ffff00231b1fb000
> > [=A0 116.132519] x27: 0000000000000000 x26: ffff00231b1fb000
> > [=A0 116.137821] x25: ffff0022e6cefdc0 x24: 0000000000002480
> > [=A0 116.143124] x23: ffff0023682b6ab0 x22: ffff0023682b6800
> > [=A0 116.148427] x21: ffff0023682b6800 x20: 0000000000000000
> > [=A0 116.153730] x19: ffff0023682b6800 x18: 0000000000000000
> > [=A0 116.159032] x17: 000000000000000000000000001
> > [=A0 116.185545] x7 : ffff0023682b6b07 x6 : ffff80046d056d61
> > [=A0 116.190848] x5 : ffff80046d056d61 x4 : ffff0023682b6ba0
> > [=A0 116.196151] x3 : ffffa00010197338 x2 : dfffa00000000000
> > [=A0 116.201453] x1 : 0000000000000003 x0 : 0000000000000001
> > [=A0 116.206756] Call trace:
> > [=A0 116.209195]=A0 ttm_buffer_object_destroy+0x4c/0x80
> > [=A0 116.213803]=A0 ttm_bo_release_list+0x184/0x220
> > [=A0 116.218064]=A0 ttm_bo_put+0x410/0x5d0
> > [=A0 116.221544]=A0 drm_gem_vram_object_free+0xc/0x18
> > [=A0 116.225979]=A0 drm_gem_object_free+0x34/0xd0
> > [=A0 116.230066]=A0 drm_gem_object_put_unlocked+0xc8/0xf0
> > [=A0 116.234848]=A0 hibmc_user_framebuffer_destroy+0x20/0x40
> > [=A0 116.239890]=A0 drm_framebuffer_free+0x48/0x58
> > [=A0 116.244064]=A0 drm_mode_object_put.part.1+0x90/0xe8
> > [=A0 116.248759]=A0 drm_mode_object_put+0x28/0x38
> > [=A0 116.252846]=A0 hibmc_fbdev_fini+0x54/0x78
> > [=A0 116.256672]=A0 hibmc_unload+0x2c/0xd0
> > [=A0 116.260151]=A0 hibmc_pci_remove+0x2c/0x40
> > [=A0 116.263979]=A0 pci_device_remove+0x6c/0x140
> > [=A0 116.267980]=A0 device_release_driver_internal+0x134/0x250
> > [=A0 116.273196]=A0 device_driver_detach+0x28/0x38
> > [=A0 116.277369]=A0 unbind_store+0xfc/0x150
> > [=A0 116.280934]=A0 drv_attr_store+0x48/0x60
> > [=A0 116.284589]=A0 sysfs_kf_write+0x80/0xb0
> > [=A0 116.288241]=A0 kernfs_fop_write+0x1d4/0x320
> > [=A0 116.292243]=A0 __vfs_write+0x54/0x98
> > [=A0 116.295635]=A0 vfs_write+0xe8/0x270
> > [=A0 116.298940]=A0 ksys_write+0xc8/0x180
> > [=A0 116.302333]=A0 __arm64_sys_write+0x40/0x50
> > [=A0 116.306248]=A0 el0_svc_common.constprop.0+0xa4/0x1f8
> > [=A0 116.311029]=A0 el0_svc_handler+0x34/0xb0
> > [=A0 116.314770]=A0 el0_sync_handler+0x10c/0x1c8
> > [=A0 116.318769]=A0 el0_sync+0x140/0x180
> > [=A0 116.322074] ---[ end trace e60e43d0e316b5c8 ]---
> > [=A0 116.326868] ------------[ cut here ]------------
> > =

> > =

> > dmesg and .config is here:
> > https://pastebin.com/4P5yaZBS
> > =

> > I'm not sure if this is a HIBMC driver issue or issue with the framewor=
k.

Display-only drivers shouldn't go boom like this, the drm framework is
fixed for those. Unfortunately there's still many drivers that get their
unload sequence and resource refcounting totally wrong. For a start see
devm_drm_dev_init() and related documentation for recommendations for
current best practices:

https://dri.freedesktop.org/docs/drm/gpu/drm-internals.html#display-driver-=
example

Cheers, Daniel

> > =

> > john
> > =

> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
