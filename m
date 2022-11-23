Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7D6354E3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDCC10E529;
	Wed, 23 Nov 2022 09:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354AB10E529
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:13:22 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 o10-20020a056e02102a00b003006328df7bso12632545ilj.17
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 01:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e5fAgmlcda0f4xm5PCv89wQFpDv+wwAWL/2hkwjR7XQ=;
 b=qL6mCUjTxA2zhY1hdF0otfxe7CVEc1GcV3LBry55K23QGKXhk9rBlqgqwe79E8wCll
 eYb69V/sbiMLhsKQ2OtAQZvG7RqKz7zlFjPdVxAWwOGv2aM2lTsovQNfQ2g9gcd8KsJV
 0iMP355MU3UsASQ8f+rsgkbAmRG/4/AUCsKIGjGjfPxU5Vh4bSxTi+ELjorzheEoyNBl
 OS9h3UX1iFsgG3hC3BXbHaM2VCT3nP7+XDypemRRINZ+Lls4HR5fLxw+wpujQHFoeafN
 td/xWErT7bwJZdztnEEqX2gNMWqlNzgliBULhFs8ZyKH3Wen+i+pG5oNsvpxpcylGjQ5
 Ga9Q==
X-Gm-Message-State: ANoB5pnQ5L4ep/kBuHJtPlkrdO4ajrubrXzI6eQs3POOWjOkqclQIjZP
 FVJB3Bd94sOZ22u7s1jY/gd0xR1TeKqHVQzL7EJs6c2uaiDm
X-Google-Smtp-Source: AA0mqf5WwU0U7OH1gTLg9Hapy1BfHoOHdZ/OJHD4W3sOBBiJxe0sESoHamXGD2VVwcZY6N6mb600A1risKLoxwRZFt6DWy2euvcD
MIME-Version: 1.0
X-Received: by 2002:a92:1941:0:b0:302:4cd9:c850 with SMTP id
 e1-20020a921941000000b003024cd9c850mr4585370ilm.69.1669194801456; Wed, 23 Nov
 2022 01:13:21 -0800 (PST)
Date: Wed, 23 Nov 2022 01:13:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000033ad1105ee1fb33d@google.com>
Subject: [syzbot] linux-next boot error: WARNING in
 fb_deferred_io_schedule_flush
From: syzbot <syzbot+62debf5fcd57b5a592e1@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 jayalk@intworks.biz, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
 sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    736b6d81d93c Add linux-next specific files for 20221123
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13780ab1880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84cf3b793149c9bf
dashboard link: https://syzkaller.appspot.com/bug?extid=62debf5fcd57b5a592e1
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1f9b28c7e06/disk-736b6d81.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/139697685008/vmlinux-736b6d81.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ff62230b292/bzImage-736b6d81.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62debf5fcd57b5a592e1@syzkaller.appspotmail.com

QNX4 filesystem 0.2.3 registered.
qnx6: QNX6 filesystem 1.0.0 registered.
fuse: init (API version 7.38)
orangefs_debugfs_init: called with debug mask: :none: :0:
orangefs_init: module version upstream loaded
JFS: nTxBlock = 8192, nTxLock = 65536
SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
9p: Installing v9fs 9p2000 file system support
NILFS version 2 loaded
befs: version: 0.9.3
ocfs2: Registered cluster interface o2cb
ocfs2: Registered cluster interface user
OCFS2 User DLM kernel interface loaded
gfs2: GFS2 installed
ceph: loaded (mds proto 32)
NET: Registered PF_ALG protocol family
xor: automatically using best checksumming function   avx       
async_tx: api initialized (async)
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Asymmetric key parser 'pkcs8' registered
Key type pkcs7_test registered
alg: self-tests for CTR-KDF (hmac(sha256)) passed
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 240)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
ACPI: button: Power Button [PWRF]
input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/input/input1
ACPI: button: Sleep Button [SLPF]
ACPI: \_SB_.LNKC: Enabled at IRQ 11
virtio-pci 0000:00:03.0: virtio_pci: leaving for legacy driver
ACPI: \_SB_.LNKD: Enabled at IRQ 10
virtio-pci 0000:00:04.0: virtio_pci: leaving for legacy driver
ACPI: \_SB_.LNKB: Enabled at IRQ 10
virtio-pci 0000:00:06.0: virtio_pci: leaving for legacy driver
virtio-pci 0000:00:07.0: virtio_pci: leaving for legacy driver
N_HDLC line discipline registered with maxframe=4096
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
00:05: ttyS2 at I/O 0x3e8 (irq = 6, base_baud = 115200) is a 16550A
00:06: ttyS3 at I/O 0x2e8 (irq = 7, base_baud = 115200) is a 16550A
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
ACPI: bus type drm_connector registered
[drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
[drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/video/fbdev/core/fb_defio.c:340 fb_deferred_io_schedule_flush+0x9f/0xf0 drivers/video/fbdev/core/fb_defio.c:340
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc6-next-20221123-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:fb_deferred_io_schedule_flush+0x9f/0xf0 drivers/video/fbdev/core/fb_defio.c:340
Code: c1 e8 03 80 3c 30 00 75 38 48 8b 35 43 81 27 0a bf 08 00 00 00 e8 c1 05 06 fd 48 83 c4 10 5b 5d e9 66 76 34 fd e8 61 76 34 fd <0f> 0b 48 83 c4 10 5b 5d e9 54 76 34 fd e8 6f 97 82 fd e9 7a ff ff
RSP: 0000:ffffc900000672d8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88801e2d0000 RCX: 0000000000000000
RDX: ffff888140150000 RSI: ffffffff844c552f RDI: ffff88801e2d0418
RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff9133aa47
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000008 R14: ffff88801e281940 R15: 00000000000000d0
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000c48e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_fb_helper_damage drivers/gpu/drm/drm_fb_helper.c:602 [inline]
 drm_fb_helper_sys_imageblit+0x2c9/0x380 drivers/gpu/drm/drm_fb_helper.c:883
 drm_fbdev_fb_imageblit+0x17d/0x260 drivers/gpu/drm/drm_fbdev_generic.c:157
 soft_cursor+0x514/0xa30 drivers/video/fbdev/core/softcursor.c:74
 bit_cursor+0xf13/0x17a0 drivers/video/fbdev/core/bitblit.c:377
 fbcon_cursor+0x3e0/0x550 drivers/video/fbdev/core/fbcon.c:1330
 hide_cursor+0x85/0x280 drivers/tty/vt/vt.c:907
 redraw_screen+0x5b8/0x740 drivers/tty/vt/vt.c:1012
 vc_do_resize+0xed6/0x1170 drivers/tty/vt/vt.c:1342
 fbcon_init+0x1061/0x1920 drivers/video/fbdev/core/fbcon.c:1125
 visual_init+0x326/0x620 drivers/tty/vt/vt.c:1074
 do_bind_con_driver.isra.0+0x52f/0x910 drivers/tty/vt/vt.c:3694
 do_take_over_console+0x450/0x5c0 drivers/tty/vt/vt.c:4273
 do_fbcon_takeover+0xe8/0x210 drivers/video/fbdev/core/fbcon.c:530
 do_fb_registered drivers/video/fbdev/core/fbcon.c:3008 [inline]
 fbcon_fb_registered+0x34a/0x460 drivers/video/fbdev/core/fbcon.c:3028
 do_register_framebuffer drivers/video/fbdev/core/fbmem.c:1597 [inline]
 register_framebuffer+0x6b7/0xb60 drivers/video/fbdev/core/fbmem.c:1703
 __drm_fb_helper_initial_config_and_unlock+0xe30/0x13e0 drivers/gpu/drm/drm_fb_helper.c:2117
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:2183 [inline]
 drm_fb_helper_initial_config+0x4a/0x60 drivers/gpu/drm/drm_fb_helper.c:2175
 drm_fbdev_client_hotplug+0x2b4/0x3d0 drivers/gpu/drm/drm_fbdev_generic.c:406
 drm_fbdev_generic_setup+0x165/0x440 drivers/gpu/drm/drm_fbdev_generic.c:488
 vkms_create drivers/gpu/drm/vkms/vkms_drv.c:208 [inline]
 vkms_init+0x569/0x5ed drivers/gpu/drm/vkms/vkms_drv.c:233
 do_one_initcall+0x141/0x790 init/main.c:1306
 do_initcall_level init/main.c:1379 [inline]
 do_initcalls init/main.c:1395 [inline]
 do_basic_setup init/main.c:1414 [inline]
 kernel_init_freeable+0x6f9/0x782 init/main.c:1634
 kernel_init+0x1e/0x1d0 init/main.c:1522
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
