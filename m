Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673891999B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFF510E0B1;
	Wed, 26 Jun 2024 21:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com
 [209.85.166.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C962110E0B1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:05:23 +0000 (UTC)
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-7e94cac3c71so1018277039f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719435922; x=1720040722;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=omCqdrKHC9uzHdZWn8d5VjrY3aw/1rvIIaZnUoHvFKA=;
 b=g902FHS05JoT7r6MsGPPhDxHT3s1qsl3Dna1VkCdIbN1q100Q9ADSS2iMFR//CC+L+
 xlwVRVag2wB/MIOZrFEBE8Jo4tPYXoYUacdZiBYp4C0J8CVbNj9QLT97VcJYVP+DciHc
 lhUE7JBOYq4HtW2RT6abaaVZyHbDiNK+7h41IsfPEslItFXdr61BW07KXDILETYa1/OW
 qlInMbKqK0NeuAaZz3HvQma/oAVDkojg0H88BOESh5qP6PxwbqM7BWXUJr6QA2BZ7vcj
 +n+DLnv0U8kEiXxYz0+WffjeOvlvCdkqVxD+Xd0hpXRMLX1yz/vOrOy6wFdczarNGrJX
 XSwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUutA5qTyGUKWaCOsd3l54nSNcg8/C2bEC9WHGwgvS0c9XvkG6vpWwEwPZZB4SlcJeRq/8sxb3t1R8fx0PB+7JKltpNQr7wBzWkGNAS3idQ
X-Gm-Message-State: AOJu0YyzpfJlTLpPoGPgznnFm/o1TWpnV4905f1m47ReTbnwH4VzMqGI
 pF3RODSY7iBNKV6RkMNfdHI+peOmlUf0Z86yPf4dG9UEV7RLXgYvdXlcwZOfylBWShAHXvHGK4h
 M2cExtUU+PlV9gFiK4oe9uD29mh4nDUh3H1rW+aI3/i/Ggk8jI1En5pk=
X-Google-Smtp-Source: AGHT+IFoMT6tJtVY+fXtOJsl8GG9kzXW2ldoxnXTNpwealYNmfj+vEzYul0qnuL3c1ZQTGgHUF2CpsYJw5qZuPMxwwQwvm2pf7mZ
MIME-Version: 1.0
X-Received: by 2002:a05:6638:9611:b0:4b9:bdfd:f15b with SMTP id
 8926c6da1cb9f-4b9ece1ba70mr1187592173.4.1719435922590; Wed, 26 Jun 2024
 14:05:22 -0700 (PDT)
Date: Wed, 26 Jun 2024 14:05:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000615c23061bd15fc4@google.com>
Subject: [syzbot] [dri?] WARNING in drm_mode_create_lease_ioctl
From: syzbot <syzbot+6754751ad05524dae739@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    ac2193b4b460 Merge branches 'for-next/misc', 'for-next/kse..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=101cc882980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36900d37ec67d13f
dashboard link: https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c17cd6980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15879c82980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2c4f87d36ca3/disk-ac2193b4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8410475de662/vmlinux-ac2193b4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/495a4ced254d/Image-ac2193b4.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6754751ad05524dae739@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 6281 at mm/page_alloc.c:4654 __alloc_pages_noprof+0x324/0x6c0 mm/page_alloc.c:4654
Modules linked in:
CPU: 0 PID: 6281 Comm: syz-executor181 Tainted: G        W          6.10.0-rc3-syzkaller-gac2193b4b460 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __alloc_pages_noprof+0x324/0x6c0 mm/page_alloc.c:4654
lr : __alloc_pages_noprof+0xc8/0x6c0 mm/page_alloc.c:4648
sp : ffff800099017600
x29: ffff8000990176f0 x28: ffff800099017620 x27: dfff800000000000
x26: ffff700013202ec4 x25: 0000000000000000 x24: ffff800099017640
x23: 0000000000000000 x22: 0000000000040dc0 x21: 1ffff00013202ec8
x20: ffff800099017660 x19: 000000000000000b x18: ffff8000990176e0
x17: 000000000000c88a x16: ffff80008afa5980 x15: 0000000000000005
x14: 1ffff00013202ecc x13: 0000000000000000 x12: 0000000000000000
x11: ffff700013202ed1 x10: 1ffff00013202ed0 x9 : 0000000000000001
x8 : ffff80009232a000 x7 : 0000000000000000 x6 : ffff0000e07d0900
x5 : ffff0000e07d0900 x4 : 0000000000000000 x3 : 0000000000000020
x2 : 0000000000000008 x1 : 0000000000000000 x0 : ffff800099017660
Call trace:
 __alloc_pages_noprof+0x324/0x6c0 mm/page_alloc.c:4654
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 __kmalloc_large_node+0xbc/0x200 mm/slub.c:4067
 __do_kmalloc_node mm/slub.c:4110 [inline]
 __kmalloc_noprof+0x360/0x494 mm/slub.c:4135
 kmalloc_noprof include/linux/slab.h:664 [inline]
 kmalloc_array_noprof include/linux/slab.h:699 [inline]
 fill_object_idr drivers/gpu/drm/drm_lease.c:389 [inline]
 drm_mode_create_lease_ioctl+0x4b0/0x17e4 drivers/gpu/drm/drm_lease.c:522
 drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x5e4/0xae4 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
irq event stamp: 14766
hardirqs last  enabled at (14765): [<ffff80008b0693e8>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:85 [inline]
hardirqs last  enabled at (14765): [<ffff80008b0693e8>] exit_to_kernel_mode+0xdc/0x10c arch/arm64/kernel/entry-common.c:95
hardirqs last disabled at (14766): [<ffff80008b066ee4>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:470
softirqs last  enabled at (8860): [<ffff8000801ea3cc>] softirq_handle_end kernel/softirq.c:400 [inline]
softirqs last  enabled at (8860): [<ffff8000801ea3cc>] handle_softirqs+0xa3c/0xbfc kernel/softirq.c:582
softirqs last disabled at (8855): [<ffff800080020de8>] __do_softirq+0x14/0x20 kernel/softirq.c:588
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
