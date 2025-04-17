Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F285DA920EA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735B810E2BA;
	Thu, 17 Apr 2025 15:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com
 [209.85.166.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA3C10E2BA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:10:26 +0000 (UTC)
Received: by mail-io1-f80.google.com with SMTP id
 ca18e2360f4ac-849d26dd331so180564139f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744902626; x=1745507426;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TUjzBO5ydnB/W6FtODgX9yEBNVVZZQFEaYNiWI1bNw0=;
 b=AZUwd0Fdx9c+WMLrZMB9csbR92hW1VXG/ieu1leCXsELyAwWnjbvAS7/JpTNBGnb9x
 19NNbQJH/5DsN/kziuMfrrqSCBe0tuOHg0jGe/oGY+YlNHMvZneuth7CnFSbKX37gp69
 aTJ0jlzsU1BGuKdIlZ+iGw6zP/2CxeP/VljmW4uu1G2fzA+oMID/AXPDRcpN7o0xqGEV
 oOx5/DBj1BvpKopknAYVdE1a5futdYG+xda61LzAkM+ZzaMaLRO2vRXGg7EKuUacetma
 R3dT8ZL4uALCJPNArhzMILUv7+uvZyOHYsXi108J5uG88RlphLzw39/I+sP9BLCTapjw
 AF8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCCB7gmLUmQFv+Nky7GvpLLaveWiHz6yjtpeFCNxyq5g9f1Igatwe8faNsiQ4ohRawBJTIk/oQgMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywquc3vApxy8ls4sxFmG8VCEXkmOkNKXNhOvehHrW7ieEP7a6n0
 UgD5l2fs9Hfq6Hcp88qG/h0kWXFaYCsnanuWI5QEhRUZ1pqPIdWn9k536QG5AZMBj8xn9BWVc7U
 xZx2BFGNbeHFMDpQXjDIGIAvwxlMfWiMkfIPpS4xo6T+SZRY8i+q3AF0=
X-Google-Smtp-Source: AGHT+IGZU5H5xeXB3WqaLpJtOEzTMwvl9FOcphlngfzZaGtW+CRzNzUbjQZwcPyUIQN+JeoMHBCgGeib9R8pPPZIn/s4z4eUb2Yf
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c67:b0:3d2:ed3c:67a8 with SMTP id
 e9e14a558f8ab-3d821d3070emr2138045ab.4.1744902625994; Thu, 17 Apr 2025
 08:10:25 -0700 (PDT)
Date: Thu, 17 Apr 2025 08:10:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680119e1.050a0220.243d89.0011.GAE@google.com>
Subject: [syzbot] [dri?] [virt?] WARNING in virtio_gpu_queue_fenced_ctrl_buffer
From: syzbot <syzbot+5afbc12ca70811c2bffb@syzkaller.appspotmail.com>
To: airlied@redhat.com, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, olvaffe@gmail.com, 
 simona@ffwll.ch, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, 
 virtualization@lists.linux.dev
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

HEAD commit:    7cdabafc0012 Merge tag 'trace-v6.15-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108e7870580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c918722cb7e3d7
dashboard link: https://syzkaller.appspot.com/bug?extid=5afbc12ca70811c2bffb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-7cdabafc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0a779724c40f/vmlinux-7cdabafc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/00583806b168/bzImage-7cdabafc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5afbc12ca70811c2bffb@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 3 PID: 34 at drivers/gpu/drm/virtio/virtgpu_vq.c:414 virtio_gpu_queue_ctrl_sgs drivers/gpu/drm/virtio/virtgpu_vq.c:414 [inline]
WARNING: CPU: 3 PID: 34 at drivers/gpu/drm/virtio/virtgpu_vq.c:414 virtio_gpu_queue_fenced_ctrl_buffer+0xbcf/0xfc0 drivers/gpu/drm/virtio/virtgpu_vq.c:497
Modules linked in:
CPU: 3 UID: 0 PID: 34 Comm: kworker/3:0 Not tainted 6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events drm_fb_helper_damage_work
RIP: 0010:virtio_gpu_queue_ctrl_sgs drivers/gpu/drm/virtio/virtgpu_vq.c:414 [inline]
RIP: 0010:virtio_gpu_queue_fenced_ctrl_buffer+0xbcf/0xfc0 drivers/gpu/drm/virtio/virtgpu_vq.c:497
Code: df e8 a5 45 d5 fe 48 89 9c 24 a8 01 00 00 c7 44 24 30 02 00 00 00 48 c7 44 24 18 00 00 00 00 e9 4f f6 ff ff e8 f2 97 c3 fb 90 <0f> 0b 90 e9 02 fa ff ff e8 e4 97 c3 fb 90 0f 0b e8 dc 97 c3 fb 90
RSP: 0018:ffffc900006df488 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000fffffffb RCX: ffffffff85f79f81
RDX: ffff88801e2d4880 RSI: ffffffff85f7a57e RDI: 0000000000000005
RBP: ffff888104ea7c00 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000fffffffb R11: 0000000000000000 R12: ffffed10209d4f85
R13: ffff8880245976f8 R14: ffff888025553ac8 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880d6cb2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa4a49be440 CR3: 000000000e182000 CR4: 0000000000352ef0
DR0: 00000000000007ff DR1: 0000000000000009 DR2: 0002000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 virtio_gpu_update_dumb_bo drivers/gpu/drm/virtio/virtgpu_plane.c:175 [inline]
 virtio_gpu_primary_plane_update+0xda0/0x1540 drivers/gpu/drm/virtio/virtgpu_plane.c:264
 drm_atomic_helper_commit_planes+0x954/0x1010 drivers/gpu/drm/drm_atomic_helper.c:2838
 drm_atomic_helper_commit_tail+0x69/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1788
 commit_tail+0x35b/0x400 drivers/gpu/drm/drm_atomic_helper.c:1873
 drm_atomic_helper_commit+0x2fd/0x380 drivers/gpu/drm/drm_atomic_helper.c:2111
 drm_atomic_commit+0x231/0x300 drivers/gpu/drm/drm_atomic.c:1518
 drm_atomic_helper_dirtyfb+0x5fd/0x780 drivers/gpu/drm/drm_damage_helper.c:181
 drm_fbdev_shmem_helper_fb_dirty+0x1c9/0x340 drivers/gpu/drm/drm_fbdev_shmem.c:117
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:379 [inline]
 drm_fb_helper_damage_work+0x27b/0x5f0 drivers/gpu/drm/drm_fb_helper.c:402
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
