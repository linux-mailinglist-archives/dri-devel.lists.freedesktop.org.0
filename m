Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7ED186068
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B4B6E29B;
	Sun, 15 Mar 2020 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CB089F8E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 20:10:28 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e18so16263733ljn.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lRwIkYyeNprMt8DWmLWBzVfj8AZnQd3LF/J/aShk9VM=;
 b=kgGA/JESCip8lrxXEnRTfZzlPJwsyk7nOjBVwO4CbPsb9clrZncvWRie4e/cuyDcDY
 resIyKX4tHuADWHlcIVKm69VeiwsAEbAiCLoiJw6oXfY2+b0gqdKm+ZP6Cn2GgUhL9Jb
 uon4i9xZ6aNtE9g2JM2xVWMCEdhprtQ2FmWVA0hcgot2SfJf5Ya/lN1NzQLyOOHbkiR7
 EqDFtL+UTCjYXb7qin6LUiQqob+4SsJoK2nbUaZ3mT5DHAwA4UoQPnC6q6mi0BVkoZ7B
 mIZJXSO3pYssNAAdNtjd75TuprEOCQoemX1Zo8IdiwIr4UknI8+leUveU1BVq0cDPqDJ
 d7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lRwIkYyeNprMt8DWmLWBzVfj8AZnQd3LF/J/aShk9VM=;
 b=SI8XjqbX7d9W3gPQFxu2KsuaJMuS42FbVR7XFKjXdQPHIyBBy76ZWJhW80IF6Hemyo
 9FHRq3ueUZPDryXp6ypih6Vgb4XPg1xzr5EIt117BXya0/3BP7HHKoY+2MLnUhZfFe+6
 jFZQgYesvOPLQPGL84sMK8SQo6vZuPeoHIad0zCvrdYBJGkygfe3TpSkF1WhBpHh7nGJ
 yUH6zP+QDi9lJ4+PkrQrTudZCftTez8jP4zGQFh2TFTC6oJdBd8Jhq4Goz3qmDf0nzYP
 f1zoAKUABwUgCv39f74dnu3aErfXcwXPg8hRfj+8If2t0DKaEW0HpzcS/ZG+2oLQqQyu
 PO5Q==
X-Gm-Message-State: ANhLgQ0FBIIFjv+gWbwZ5zhkkd0xiepohhsjpVHe2+9BArQZVrySpGcX
 OyTIuK3GtnQ5eTlIhctPj52xh5YmlHoDURQBRvI=
X-Google-Smtp-Source: ADFU+vuOU0nDpcIYyZZDkVFuO3aoP2icoygtRs95VKsrUcSKB4wAycKv34gIqeaN5hFL4IgJDMIdimGLvKiMtM1IcRs=
X-Received: by 2002:a2e:a551:: with SMTP id e17mr14406827ljn.86.1584303026831; 
 Sun, 15 Mar 2020 13:10:26 -0700 (PDT)
MIME-Version: 1.0
From: Entropy Moe <3ntr0py1337@gmail.com>
Date: Mon, 16 Mar 2020 00:10:16 +0400
Message-ID: <CALzBtjJjSh8ryexUhJnxrzcbt-huQ7W709Z4ButBme=Om6c4HA@mail.gmail.com>
Subject: KASAN: use-after-free in vgacon.c 669
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
Content-Type: multipart/mixed; boundary="===============0173022689=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0173022689==
Content-Type: multipart/alternative; boundary="00000000000021838905a0ea4bad"

--00000000000021838905a0ea4bad
Content-Type: text/plain; charset="UTF-8"

Hello team,
i want to report a bug on linux kernel on vgacon.c:669

==================================================================
BUG: KASAN: use-after-free in vgacon_invert_region+0xda/0xe0
drivers/video/console/vgacon.c:669
Read of size 2 at addr ffff888000107ec0 by task syz-executor.6/31018

CPU: 1 PID: 31018 Comm: syz-executor.6 Not tainted 5.6.0-rc3 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xc6/0x11e lib/dump_stack.c:118
 print_address_description.constprop.5+0x16/0x310 mm/kasan/report.c:374
 __kasan_report+0x158/0x1c0 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 vgacon_invert_region+0xda/0xe0 drivers/video/console/vgacon.c:669
 invert_screen+0x16c/0x580 drivers/tty/vt/vt.c:763
 highlight drivers/tty/vt/selection.c:57 [inline]
 set_selection_kernel+0x9d0/0x11b0 drivers/tty/vt/selection.c:304
 set_selection_user+0x87/0xd0 drivers/tty/vt/selection.c:181
 tioclinux+0x359/0x480 drivers/tty/vt/vt.c:3050
 vt_ioctl+0x13c2/0x24f0 drivers/tty/vt/vt_ioctl.c:364
 tty_ioctl+0x27b/0x13f0 drivers/tty/tty_io.c:2660
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0xeb/0x120 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0x9b/0x520 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c679
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ff254c8fc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ff254c906d4 RCX: 000000000045c679
RDX: 0000000020000200 RSI: 000000000000541c RDI: 0000000000000003
RBP: 000000000076bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000574 R14: 00000000004c7eac R15: 000000000076bf0c

The buggy address belongs to the page:
page:ffffea00000041c0 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0x0()
raw: 0000000000000000 ffff88802587fab0 ffff88802587fab0 0000000000000000
raw: 0000000000000000 ffff88806778ee00 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888000107d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888000107e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff888000107e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                           ^
 ffff888000107f00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888000107f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================

--00000000000021838905a0ea4bad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello team, <br></div><div>i want to report a bug on =
linux kernel on vgacon.c:669</div><div><br></div><div><pre style=3D"color:r=
gb(0,0,0);font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;word-spacing:0px;text-decoration-style:initial;text=
-decoration-color:initial;white-space:pre-wrap">=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in vgacon_invert_region+0xda/0xe0 drivers/video/=
console/vgacon.c:669
Read of size 2 at addr ffff888000107ec0 by task syz-executor.6/31018

CPU: 1 PID: 31018 Comm: syz-executor.6 Not tainted 5.6.0-rc3 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1u=
buntu1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xc6/0x11e lib/dump_stack.c:118
 print_address_description.constprop.5+0x16/0x310 mm/kasan/report.c:374
 __kasan_report+0x158/0x1c0 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 vgacon_invert_region+0xda/0xe0 drivers/video/console/vgacon.c:669
 invert_screen+0x16c/0x580 drivers/tty/vt/vt.c:763
 highlight drivers/tty/vt/selection.c:57 [inline]
 set_selection_kernel+0x9d0/0x11b0 drivers/tty/vt/selection.c:304
 set_selection_user+0x87/0xd0 drivers/tty/vt/selection.c:181
 tioclinux+0x359/0x480 drivers/tty/vt/vt.c:3050
 vt_ioctl+0x13c2/0x24f0 drivers/tty/vt/vt_ioctl.c:364
 tty_ioctl+0x27b/0x13f0 drivers/tty/tty_io.c:2660
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0xeb/0x120 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0x9b/0x520 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c679
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48&gt; 3d 01 f=
0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ff254c8fc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ff254c906d4 RCX: 000000000045c679
RDX: 0000000020000200 RSI: 000000000000541c RDI: 0000000000000003
RBP: 000000000076bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000574 R14: 00000000004c7eac R15: 000000000076bf0c

The buggy address belongs to the page:
page:ffffea00000041c0 refcount:0 mapcount:0 mapping:0000000000000000 index:=
0x0
flags: 0x0()
raw: 0000000000000000 ffff88802587fab0 ffff88802587fab0 0000000000000000
raw: 0000000000000000 ffff88806778ee00 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888000107d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888000107e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
&gt;ffff888000107e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                           ^
 ffff888000107f00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888000107f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</pre></div><br></div>

--00000000000021838905a0ea4bad--

--===============0173022689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0173022689==--
