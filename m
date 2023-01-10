Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA3663856
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 05:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140910E529;
	Tue, 10 Jan 2023 04:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1CC10E529
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 04:53:37 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9-20020a056e020b2900b003036757d5caso7667764ilu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 20:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HYT5ZbF2o1QUR84Jk6KZ8n+w9iIKKy5jZcxTavcpj1w=;
 b=hV59Xl1WJ6moIdNsMUI22Scul56dYu4wzg91y84aC286R5mwfzClJ8NUX1nYRPWS5U
 yQ9Gc2PPJGFuAqIl3eQkGCfbgzgBnLof2bCqYIPKIHnVEdjucgKjIZFAvfNbfRetE0HR
 XdMXKZueNG7Y+3hNsqH8XWiK2ccvbFMtAHIg5jUXc0gIaso5qHoJXf2FUQbsMDpcbNOm
 Nna5Dwx20QPc/ZqLtkWcBSV+Ymf8/i3L/bPZd2Zm6n06Pjt255jURrBXOfUK3hI02Jgb
 rW8aS9ItffI03NNxOQJKh8Z02idMo9fmXXaOjkARSmC0PW1BzqZScD/NcFnisEjrr2Gm
 pzbw==
X-Gm-Message-State: AFqh2krnGr+UZixKhp991jrzTO8fnegmhIYli5ccd4x0L37GK2FBgwAx
 HoM9wZ/gRZliHatVI491KW4Z0F4QbKU0e/SSIHv5dKj5XGug
X-Google-Smtp-Source: AMrXdXsBp5JaM3gTALsiqCGdGFTWPnsowpVxtCgj9OHdzrZIPCOJlMi2Kbvqda4s+2ACZX6OQE9BTmGG1K6wcwAkrHgN1wpqmPkl
MIME-Version: 1.0
X-Received: by 2002:a5d:870b:0:b0:6bf:e736:22a with SMTP id
 u11-20020a5d870b000000b006bfe736022amr5615604iom.94.1673326416927; Mon, 09
 Jan 2023 20:53:36 -0800 (PST)
Date: Mon, 09 Jan 2023 20:53:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aca1bb05f1e1aac1@google.com>
Subject: [syzbot] linux-next boot error: WARNING in
 __drm_atomic_helper_set_config
From: syzbot <syzbot+0bf79afd497528c0df0d@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 linux-next@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, sfr@canb.auug.org.au, 
 syzkaller-bugs@googlegroups.com
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

HEAD commit:    469a89fd3bb7 Add linux-next specific files for 20230106
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=121d2432480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a94f9b6b8eb07a36
dashboard link: https://syzkaller.appspot.com/bug?extid=0bf79afd497528c0df0d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2df1b88ce6c4/disk-469a89fd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ea2517e6b476/vmlinux-469a89fd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7539708cb8ba/bzImage-469a89fd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0bf79afd497528c0df0d@syzkaller.appspotmail.com

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
platform vkms: [drm] bpp/depth value of 32/0 not supported
platform vkms: [drm] No compatible format found
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_atomic.c:1604 __drm_atomic_helper_set_config+0xa2d/0xe80 drivers/gpu/drm/drm_atomic.c:1604
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc2-next-20230106-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:__drm_atomic_helper_set_config+0xa2d/0xe80 drivers/gpu/drm/drm_atomic.c:1604
Code: b6 04 02 84 c0 74 09 3c 03 7f 05 e8 dd cb 48 fd 45 89 75 38 e9 0f fb ff ff e8 6f e4 fa fc 0f 0b e9 a5 f7 ff ff e8 63 e4 fa fc <0f> 0b e9 4f f7 ff ff e8 57 e4 fa fc 48 8d 7d 08 48 b8 00 00 00 00
RSP: 0000:ffffc90000067808 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888146916380 RCX: 0000000000000000
RDX: ffff888140190000 RSI: ffffffff8486c8fd RDI: 0000000000000007
RBP: ffff888146917500 R08: 0000000000000007 R09: fffffffffffff000
R10: ffff888146985000 R11: 0000000000000005 R12: ffff88814691b700
R13: ffff888146985000 R14: ffff888146985800 R15: ffff88801deccdc0
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000c48e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_client_modeset_commit_atomic+0x535/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1026
 drm_client_modeset_commit_locked+0x149/0x580 drivers/gpu/drm/drm_client_modeset.c:1148
 drm_client_modeset_commit+0x51/0x80 drivers/gpu/drm/drm_client_modeset.c:1174
 drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1944 [inline]
 __drm_fb_helper_initial_config_and_unlock.cold+0x2ef/0x386 drivers/gpu/drm/drm_fb_helper.c:2130
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:2225 [inline]
 drm_fb_helper_initial_config+0x4a/0x60 drivers/gpu/drm/drm_fb_helper.c:2217
 drm_fbdev_client_hotplug+0x2b4/0x3d0 drivers/gpu/drm/drm_fbdev_generic.c:406
 drm_fbdev_generic_setup+0x166/0x400 drivers/gpu/drm/drm_fbdev_generic.c:491
 vkms_create drivers/gpu/drm/vkms/vkms_drv.c:204 [inline]
 vkms_init+0x587/0x62f drivers/gpu/drm/vkms/vkms_drv.c:230
 do_one_initcall+0x141/0x7d0 init/main.c:1306
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
