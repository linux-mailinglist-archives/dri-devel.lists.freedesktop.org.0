Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E37C7370
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 18:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1803B10E507;
	Thu, 12 Oct 2023 16:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC8210E507
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 16:49:29 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c9d4f08d7cso4595ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697129369; x=1697734169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+ity2qTw7r/kpXykK9MCuhfw80NyC/9PfFPohTRZ0k=;
 b=WTCE8KmDHKkGpwXDgAobBDQq/Py4T8YwmXiahEJGNLw8WHgAsQIOdJCGRWq4X4gfD0
 k16bJ2RhJeP3+2OgYwbTuy2mSAuBx1MC1b+6imTQNz6A17gOqCGs24IHOT7KRvpvKidC
 XMapqA0EKA88Ek8AgrhQ66v/eWr9h6TGgadJntXKRnyHMBfCVkBWpf16uyWth8Eu5u69
 9GVptJjVhNfZX61Dya04hexhpGH+/+n4yiqdVj3Sf3k1ie4XfIEO9XtbhHirCySR8S73
 sL1LwYn1tFO6F1rutDFjI2Bfu9Gi9CtLE8DIZKPVYJRUNLshIs5SB2WMPfcCfyXSHlbX
 Pivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129369; x=1697734169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+ity2qTw7r/kpXykK9MCuhfw80NyC/9PfFPohTRZ0k=;
 b=dqIMazK+2Qhgrr0oGYY/Bevu7+QbHKWXtA2DJlyS0oS4wjnIUZov92hJLOrt+f/a+F
 HQkyn4g3xX04c9dd0UYP6M9OB/U8wDV9AGmQaUTX0B1S8FcyBdQ6Qj8ep7HmfigzhrRd
 MRf0G83sY14inueuMMzv/keVlN1ltCRwTv9pajJUTa/8kELYtAykEc39IHH5b5HcvLnW
 2uN9nVHoaqNC+UzvF3xMjC4A8dOjxVTRrDHnk1mRBXPZMv3BqcxrKvJbKj8VwSqsCAQy
 5jjrgWNBj0lFTTqTRngZVz+1vqezT4jx7R2CY58b5SunVhY3NSM3XbwoL6EpXuOA0pUg
 IgDQ==
X-Gm-Message-State: AOJu0YxPk/SXZjsA7au7+NaoUp6qgDP1c2hJkT/NtEjaFL8kXpZ/Kt3t
 Bq6qS6kGE9auQSkH4hXYfKVn/sBW6TbUbbKSDQLQew==
X-Google-Smtp-Source: AGHT+IEkh2osPD0bI28v9aMSShgDDKs5Lo9FYv9+wqXCGF/dtjKcb0biTQ2kHFhXhOmi20vmy2QIafWABrspTiXnehs=
X-Received: by 2002:a17:902:f68c:b0:1c4:1392:e4b5 with SMTP id
 l12-20020a170902f68c00b001c41392e4b5mr489049plg.21.1697129369120; Thu, 12 Oct
 2023 09:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008d231506067f6a78@google.com>
 <20230929133644.2072910-1-nogikh@google.com>
In-Reply-To: <20230929133644.2072910-1-nogikh@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 12 Oct 2023 18:49:17 +0200
Message-ID: <CANp29Y6O9Fwqn8YrTehriz2nujpasSpsECqofWFZwSdp5JHdVw@mail.gmail.com>
Subject: Re: [syzbot] upstream boot error: can't ssh into the instance (15)
To: syzbot+be9661ba81a9c1cf6b15@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the record: the problems were solved by switching to qemu v8.

#syz invalid

On Fri, Sep 29, 2023 at 3:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.com=
> wrote:
>
>
> On Fri, Sep 29, 2023 at 3:29 PM syzbot <syzbot+be9661ba81a9c1cf6b15@syzka=
ller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    9ed22ae6be81 Merge tag 'spi-fix-v6.6-rc3' of git://git.=
ker..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D14b37a7c680=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd4bdf71ec9a=
ec6cc
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbe9661ba81a9c=
1cf6b15
> > compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld=
 (GNU Binutils for Debian) 2.40
> > userspace arch: arm64
> >
> > Downloadable assets:
> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets=
/384ffdcca292/non_bootable_disk-9ed22ae6.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/2c3d5eea45bd/vmli=
nux-9ed22ae6.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/54444f361432=
/Image-9ed22ae6.gz.xz
>
> This appears on qemu-system-aarch64 with virt,virtualization=3Don,mte=3Do=
n,graphics=3Don,usb=3Don.
>
> I've run it locally using the assets above and it seems there are actuall=
y two problems behind the report.
>
> 1) For some reason, v7.2 of qemu-system-aarch64 just hangs with "-smp 2" =
and prints no output.
>
> Interestingly, it all works fine on qemu v8.0.4, so I don't know if it's =
a qemu or a kernel problem.
> Qemu v8 is unfortunately still too new for many distributions (we use deb=
ian:bookworm on syzbot
> and v7.2 is the latest there).
>
> 2) If I set "-smp 1", it begins to boot, but quickly fails with several m=
essages. First with
>
> [    0.000000][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.000000][    T0] BUG: KASAN: slab-out-of-bounds in __kasan_slab_all=
oc+0x7c/0xcc
> [    0.000000][    T0] Read at addr fcff000002c01008 by task swapper/0
> [    0.000000][    T0] Pointer tag: [fc], memory tag: [f5]
> [    0.000000][    T0]
> [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc3-=
syzkaller-00055-g9ed22ae6be81 #0
> [    0.000000][    T0] Hardware name: linux,dummy-virt (DT)
> [    0.000000][    T0] Call trace:
> [    0.000000][    T0]  dump_backtrace+0x94/0xec
> [    0.000000][    T0]  show_stack+0x18/0x24
> [    0.000000][    T0]  dump_stack_lvl+0x48/0x60
> [    0.000000][    T0]  print_report+0x108/0x618
> [    0.000000][    T0]  kasan_report+0x88/0xac
> [    0.000000][    T0]  __do_kernel_fault+0x17c/0x1e8
> [    0.000000][    T0]  do_tag_check_fault+0x78/0x8c
> [    0.000000][    T0]  do_mem_abort+0x44/0x94
> [    0.000000][    T0]  el1_abort+0x40/0x60
> [    0.000000][    T0]  el1h_64_sync_handler+0xd8/0xe4
> [    0.000000][    T0]  el1h_64_sync+0x64/0x68
> [    0.000000][    T0]  __kasan_slab_alloc+0x7c/0xcc
> [    0.000000][    T0]  kmem_cache_alloc+0x144/0x290
> [    0.000000][    T0]  bootstrap+0x2c/0x174
> [    0.000000][    T0]  kmem_cache_init+0x144/0x1c8
> [    0.000000][    T0]  mm_core_init+0x240/0x2d4
> [    0.000000][    T0]  start_kernel+0x220/0x5fc
> [    0.000000][    T0]  __primary_switched+0xb4/0xbc
> [    0.000000][    T0]
> [    0.000000][    T0] Allocated by task 0:
> [    0.000000][    T0]  kasan_save_stack+0x3c/0x64
> [    0.000000][    T0]  save_stack_info+0x38/0x118
> [    0.000000][    T0]  kasan_save_alloc_info+0x14/0x20
> [    0.000000][    T0]  __kasan_slab_alloc+0x94/0xcc
> [    0.000000][    T0]  kmem_cache_alloc+0x144/0x290
> [    0.000000][    T0]  bootstrap+0x2c/0x174
> [    0.000000][    T0]  kmem_cache_init+0x134/0x1c8
> [    0.000000][    T0]  mm_core_init+0x240/0x2d4
> [    0.000000][    T0]  start_kernel+0x220/0x5fc
> [    0.000000][    T0]  __primary_switched+0xb4/0xbc
> [    0.000000][    T0]
> [    0.000000][    T0] The buggy address belongs to the object at ffff000=
002c01000
> [    0.000000][    T0]  which belongs to the cache kmem_cache of size 208
> [    0.000000][    T0] The buggy address is located 8 bytes inside of
> [    0.000000][    T0]  208-byte region [ffff000002c01000, ffff000002c010=
d0)
> [    0.000000][    T0]
> [    0.000000][    T0] The buggy address belongs to the physical page:
> [    0.000000][    T0] page:(____ptrval____) refcount:1 mapcount:0 mappin=
g:0000000000000000 index:0x0 pfn:0x42c01
> [    0.000000][    T0] flags: 0x1ffc00000000800(slab|node=3D0|zone=3D0|la=
stcpupid=3D0x7ff|kasantag=3D0x0)
> [    0.000000][    T0] page_type: 0xffffffff()
> [    0.000000][    T0] raw: 01ffc00000000800 fcff000002c01000 dead0000000=
00100 dead000000000122
> [    0.000000][    T0] raw: 0000000000000000 0000000080100010 00000001fff=
fffff 0000000000000000
> [    0.000000][    T0] page dumped because: kasan: bad access detected
> [    0.000000][    T0]
> [    0.000000][    T0] Memory state around the buggy address:
> [    0.000000][    T0]  ffff000002c00e00: f0 f0 f0 f0 f0 f0 f0 f0 f0 f0 f=
0 f0 f0 f0 f0 f0
> [    0.000000][    T0]  ffff000002c00f00: f0 f0 f0 f0 f0 f0 f0 f0 f0 f0 f=
0 f0 f0 f0 f0 f0
> [    0.000000][    T0] >ffff000002c01000: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f=
5 f5 f5 f5 f5 f5
> [    0.000000][    T0]                    ^
> [    0.000000][    T0]  ffff000002c01100: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f=
5 f5 f5 f5 f5 f5
> [    0.000000][    T0]  ffff000002c01200: f5 f5 f5 f5 f5 f5 f5 f5 f5 f5 f=
5 f5 f5 f5 f5 f5
> [    0.000000][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> And then with
>
> [    8.765595][    T1] ------------[ cut here ]------------
> [    8.766137][    T1] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_mana=
ged.c:133 drmm_add_final_kfree+0x7c/0x98
> [    8.767715][    T1] Modules linked in:
> [    8.768946][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B     =
         6.6.0-rc3-syzkaller-00055-g9ed22ae6be81 #0
> [    8.769970][    T1] Hardware name: linux,dummy-virt (DT)
> [    8.770655][    T1] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -S=
SBS BTYPE=3D--)
> [    8.771383][    T1] pc : drmm_add_final_kfree+0x7c/0x98
> [    8.771878][    T1] lr : drmm_add_final_kfree+0x30/0x98
> [    8.772388][    T1] sp : ffff80008000bcd0
> [    8.772772][    T1] x29: ffff80008000bcd0 x28: 0000000000000000 x27: f=
fff8000823c6068
> [    8.773750][    T1] x26: ffff8000822c00b0 x25: ffff8000821eed90 x24: f=
fff800082299df0
> [    8.774586][    T1] x23: ffff8000823c6078 x22: faff000003c53010 x21: 0=
000000000000000
> [    8.775410][    T1] x20: f6ff000003850800 x19: f6ff000003850800 x18: f=
fffffffffffffff
> [    8.776238][    T1] x17: ffff80008082a678 x16: ffff8000808dbae8 x15: f=
fff8000808db33c
> [    8.777061][    T1] x14: ffff800080248568 x13: ffff800080015698 x12: f=
fff800081893acc
> [    8.777884][    T1] x11: ffff8000822c110c x10: ffff8000800145b4 x9 : f=
fff8000802b8dcc
> [    8.778747][    T1] x8 : ffff80008000bc90 x7 : 0000000000000000 x6 : 0=
000000000008000
> [    8.779554][    T1] x5 : f1ff000003794f00 x4 : 0000000000000000 x3 : 0=
000000000000020
> [    8.780369][    T1] x2 : 0000000000000000 x1 : f6ff000003850e38 x0 : f=
6ff000003850800
> [    8.781301][    T1] Call trace:
> [    8.781667][    T1]  drmm_add_final_kfree+0x7c/0x98
> [    8.782209][    T1]  __devm_drm_dev_alloc+0xb4/0xd4
> [    8.782692][    T1]  vgem_init+0xac/0x140
> [    8.783141][    T1]  do_one_initcall+0x80/0x1c4
> [    8.783614][    T1]  kernel_init_freeable+0x1c8/0x290
> [    8.784114][    T1]  kernel_init+0x24/0x1e0
> [    8.784556][    T1]  ret_from_fork+0x10/0x20
> [    8.785109][    T1] ---[ end trace 0000000000000000 ]---
>
> For what it's worth, here are the commands I used to boot qemu:
>
> $ cd /tmp
> $ wget -O - 'https://storage.googleapis.com/syzbot-assets/7153da9da559/Im=
age-9ed22ae6.gz.xz' | unxz > Image-9ed22ae6
> $ wget -O - 'https://storage.googleapis.com/syzbot-assets/384ffdcca292/no=
n_bootable_disk-9ed22ae6.raw.xz' | unxz > non_bootable_disk-9ed22ae6.raw
> $ qemu-system-aarch64 -machine virt,virtualization=3Don,mte=3Don,graphics=
=3Don,usb=3Don -cpu max -smp 1 -m 2048 -display none -serial stdio -drive f=
ile=3D/tmp/non_bootable_disk-9ed22ae6.raw,if=3Dnone,format=3Draw,id=3Dhd0 -=
device virtio-blk-device,drive=3Dhd0 -snapshot -kernel /tmp/Image-9ed22ae6
>
>
> I'll tag the report as follows, feel free to update.
>
> #syz set subsystems: arm, dri
