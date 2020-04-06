Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D919F103
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E360E6E2D8;
	Mon,  6 Apr 2020 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E376E233
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:07:57 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 14so11802126qtp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0JIAa3kWR0e+Q9qTBrl2ZROhFHWvllNmMEAIWw//rnA=;
 b=BlZICsBDOba8VGt6ntbjWdx2iSnkeBZJiKwwkcF+JmD/5iJDXfg/Ar7hvCpXxsMpMT
 VYxFRW5224r2Dvgm/LwEIjF6fhH8SkFFmVE/HVaz+tUhue6jOEtACIRtXxXUKI+G4M46
 oSLSLhyMLbYJ8I0WsK6jmsuoYknLFcyZrh0EU3kfc5scjlDFLslv95Xb/TAiD7WmTkgw
 Rl8bKBTNyRve2VFMTk+Xx4UJReaTAZ7pnmBzzjfNPpkUuRP8LpvQTwFv/L42NqOE0uEB
 CBk8UoH1s/WCGPFKQJYmrbuYdia/CcDfzcFB9SOhyyq+PVPvwQc6/JagpT2ZUkhD63Kg
 BOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0JIAa3kWR0e+Q9qTBrl2ZROhFHWvllNmMEAIWw//rnA=;
 b=DsXbLM8TpZlLsHPJ6tVDzKjeBDkj4z2myb09OqYmb2YWrEYMYlpPc+PVNKzhMqg7Tm
 dnUEdtBsPCYKe7x7/436pDc6wsE48BR1awSXRMXbrl+MYLlEaWTkFITKNLy0/hpShXwW
 Eu5rrfoaDTGiLo4sqctnlVga8uawJSAQAIZ/dNHY3vXcLk1IKra0He0E/uw0ZRAXkdB8
 JJVK+RTgeUZbmfJNcughuaLRiKIB4HVmmnlUTtR+3NsRhxye2VD95TqOG5R7XIpGFmez
 CWDqHFZoPsBa2TsibqZaB8+khE1qlr6HG888M229ngsl2lKPq5ZdMeSQwNP9fgTEyhVH
 06Gw==
X-Gm-Message-State: AGi0PubmZdtlgBiM6n7U0KiUZI+7JBHDvn+8gQtdt6Vh92KZbtVfKc+I
 cvHPaHQ9nffowserWhNNVWOX9bZHFz0/RU581tuH1w==
X-Google-Smtp-Source: APiQypKAOBcPEtY+9VgL94kyZS6tr3aB4uQ3KkeJqWLrTqsjWD5kNY0wwkbf25F4pA0BDO91IGlZVJKoHFnacb9XF20=
X-Received: by 2002:ac8:1b6a:: with SMTP id p39mr5649587qtk.158.1586156876162; 
 Mon, 06 Apr 2020 00:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000091056b05a2999f1e@google.com>
In-Reply-To: <00000000000091056b05a2999f1e@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 6 Apr 2020 09:07:44 +0200
Message-ID: <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
To: syzbot <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com>, 
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, DRI <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 8:46 AM syzbot
<syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    ffc1c20c Merge tag 'for-5.7/dm-changes' of git://git.kerne..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1690471fe00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a1e2f9a9986236
> dashboard link: https://syzkaller.appspot.com/bug?extid=d3a7951ed361037407db
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com


+drivers/gpu/drm/virtio/virtgpu_object.c maintainers
Now we have both mainline and linux-next boot broken (linux-next is
broken for the past 40 days).
No testing of new code happens.


> NET: Registered protocol family 38
> async_tx: api initialized (async)
> Key type asymmetric registered
> Asymmetric key parser 'x509' registered
> Asymmetric key parser 'pkcs8' registered
> Key type pkcs7_test registered
> Asymmetric key parser 'tpm_parser' registered
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
> io scheduler mq-deadline registered
> io scheduler kyber registered
> io scheduler bfq registered
> hgafb: HGA card not detected.
> hgafb: probe of hgafb.0 failed with error -22
> usbcore: registered new interface driver udlfb
> uvesafb: failed to execute /sbin/v86d
> uvesafb: make sure that the v86d helper is installed and executable
> uvesafb: Getting VBE info block failed (eax=0x4f00, err=-2)
> uvesafb: vbe_init() failed with -22
> uvesafb: probe of uvesafb.0 failed with error -22
> vga16fb: mapped to 0x00000000ab381a8e
> Console: switching to colour frame buffer device 80x30
> fb0: VGA16 VGA frame buffer device
> input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
> ACPI: Power Button [PWRF]
> ioatdma: Intel(R) QuickData Technology Driver 5.00
> PCI Interrupt Link [GSIF] enabled at IRQ 21
> PCI Interrupt Link [GSIH] enabled at IRQ 23
> N_HDLC line discipline registered with maxframe=4096
> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> Cyclades driver 2.6
> Initializing Nozomi driver 2.1d
> RocketPort device driver module, version 2.09, 12-June-2003
> No rocketport ports found; unloading driver
> Non-volatile memory driver v1.3
> Linux agpgart interface v0.103
> [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
> usbcore: registered new interface driver udl
> [drm] pci: virtio-vga detected at 0000:00:01.0
> fb0: switching to virtiodrmfb from VGA16 VGA
> Console: switching to colour VGA+ 80x25
> virtio-pci 0000:00:01.0: vgaarb: deactivate vga console
> Console: switching to colour dummy device 80x25
> [drm] features: -virgl +edid
> [drm] number of scanouts: 1
> [drm] number of cap sets: 0
> [drm] Initialized virtio_gpu 0.1.0 0 for virtio0 on minor 2
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> BUG: KASAN: slab-out-of-bounds in virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230
> Write of size 8 at addr ffff888027f7a388 by task swapper/0/1
>
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x188/0x20d lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xd3/0x315 mm/kasan/report.c:374
>  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:506
>  kasan_report+0xe/0x20 mm/kasan/common.c:641
>  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
>  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230
>  virtio_gpu_gem_create+0xaa/0x1d0 drivers/gpu/drm/virtio/virtgpu_gem.c:42
>  virtio_gpu_mode_dumb_create+0x21e/0x360 drivers/gpu/drm/virtio/virtgpu_gem.c:82
>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_client_buffer_create drivers/gpu/drm/drm_client.c:267 [inline]
>  drm_client_framebuffer_create+0x1b7/0x770 drivers/gpu/drm/drm_client.c:412
>  drm_fb_helper_generic_probe+0x1e4/0x810 drivers/gpu/drm/drm_fb_helper.c:2039
>  drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1588 [inline]
>  __drm_fb_helper_initial_config_and_unlock+0xb56/0x11e0 drivers/gpu/drm/drm_fb_helper.c:1746
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1841 [inline]
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1833 [inline]
>  drm_fbdev_client_hotplug+0x30f/0x580 drivers/gpu/drm/drm_fb_helper.c:2133
>  drm_fbdev_generic_setup drivers/gpu/drm/drm_fb_helper.c:2212 [inline]
>  drm_fbdev_generic_setup+0x18b/0x295 drivers/gpu/drm/drm_fb_helper.c:2185
>  virtio_gpu_probe+0x28f/0x2de drivers/gpu/drm/virtio/virtgpu_drv.c:127
>  virtio_dev_probe+0x463/0x710 drivers/virtio/virtio.c:248
>  really_probe+0x281/0x6d0 drivers/base/dd.c:527
>  driver_probe_device+0x104/0x210 drivers/base/dd.c:701
>  device_driver_attach+0x108/0x140 drivers/base/dd.c:975
>  __driver_attach+0xda/0x240 drivers/base/dd.c:1052
>  bus_for_each_dev+0x14b/0x1d0 drivers/base/bus.c:305
>  bus_add_driver+0x4a2/0x5a0 drivers/base/bus.c:622
>  driver_register+0x1c4/0x330 drivers/base/driver.c:171
>  do_one_initcall+0x10a/0x7d0 init/main.c:1152
>  do_initcall_level init/main.c:1225 [inline]
>  do_initcalls init/main.c:1241 [inline]
>  do_basic_setup init/main.c:1261 [inline]
>  kernel_init_freeable+0x501/0x5ae init/main.c:1445
>  kernel_init+0xd/0x1bb init/main.c:1352
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Allocated by task 1:
>  save_stack+0x1b/0x80 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  __kasan_kmalloc mm/kasan/common.c:515 [inline]
>  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:488
>  kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
>  kmalloc include/linux/slab.h:555 [inline]
>  kzalloc include/linux/slab.h:669 [inline]
>  virtio_gpu_create_object+0x3c/0xe0 drivers/gpu/drm/virtio/virtgpu_object.c:128
>  drm_gem_shmem_create+0x83/0x330 drivers/gpu/drm/drm_gem_shmem_helper.c:58
>  virtio_gpu_object_create+0xa5/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:199
>  virtio_gpu_gem_create+0xaa/0x1d0 drivers/gpu/drm/virtio/virtgpu_gem.c:42
>  virtio_gpu_mode_dumb_create+0x21e/0x360 drivers/gpu/drm/virtio/virtgpu_gem.c:82
>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_client_buffer_create drivers/gpu/drm/drm_client.c:267 [inline]
>  drm_client_framebuffer_create+0x1b7/0x770 drivers/gpu/drm/drm_client.c:412
>  drm_fb_helper_generic_probe+0x1e4/0x810 drivers/gpu/drm/drm_fb_helper.c:2039
>  drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1588 [inline]
>  __drm_fb_helper_initial_config_and_unlock+0xb56/0x11e0 drivers/gpu/drm/drm_fb_helper.c:1746
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1841 [inline]
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1833 [inline]
>  drm_fbdev_client_hotplug+0x30f/0x580 drivers/gpu/drm/drm_fb_helper.c:2133
>  drm_fbdev_generic_setup drivers/gpu/drm/drm_fb_helper.c:2212 [inline]
>  drm_fbdev_generic_setup+0x18b/0x295 drivers/gpu/drm/drm_fb_helper.c:2185
>  virtio_gpu_probe+0x28f/0x2de drivers/gpu/drm/virtio/virtgpu_drv.c:127
>  virtio_dev_probe+0x463/0x710 drivers/virtio/virtio.c:248
>  really_probe+0x281/0x6d0 drivers/base/dd.c:527
>  driver_probe_device+0x104/0x210 drivers/base/dd.c:701
>  device_driver_attach+0x108/0x140 drivers/base/dd.c:975
>  __driver_attach+0xda/0x240 drivers/base/dd.c:1052
>  bus_for_each_dev+0x14b/0x1d0 drivers/base/bus.c:305
>  bus_add_driver+0x4a2/0x5a0 drivers/base/bus.c:622
>  driver_register+0x1c4/0x330 drivers/base/driver.c:171
>  do_one_initcall+0x10a/0x7d0 init/main.c:1152
>  do_initcall_level init/main.c:1225 [inline]
>  do_initcalls init/main.c:1241 [inline]
>  do_basic_setup init/main.c:1261 [inline]
>  kernel_init_freeable+0x501/0x5ae init/main.c:1445
>  kernel_init+0xd/0x1bb init/main.c:1352
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 0:
> (stack is not available)
>
> The buggy address belongs to the object at ffff888027f7a000
>  which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 904 bytes inside of
>  1024-byte region [ffff888027f7a000, ffff888027f7a400)
> The buggy address belongs to the page:
> page:ffffea00009fde80 refcount:1 mapcount:0 mapping:ffff88802c800c40 index:0x0
> flags: 0xfffe0000000200(slab)
> raw: 00fffe0000000200 ffffea0000a49408 ffff88802c801850 ffff88802c800c40
> raw: 0000000000000000 ffff888027f7a000 0000000100000002 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  ffff888027f7a280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  ffff888027f7a300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffff888027f7a380: 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                       ^
>  ffff888027f7a400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888027f7a480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000091056b05a2999f1e%40google.com.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
