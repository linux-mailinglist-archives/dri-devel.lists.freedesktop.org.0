Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27EF7C97C5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 05:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6C910E07B;
	Sun, 15 Oct 2023 03:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com
 [209.85.167.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952010E07B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 03:37:48 +0000 (UTC)
Received: by mail-oi1-f208.google.com with SMTP id
 5614622812f47-3ae12e140f7so5446929b6e.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 20:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697341067; x=1697945867;
 h=content-transfer-encoding:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=foF8w8a+Sc3aMYEjJANWw1plNPjcJQbPnL865dnxUWo=;
 b=RIyDwPGHHNwhPqdlwoWxCslIFcjK4XbWXgVtNkSIRCE92n9BfZDqFAkpF8CopAIL2g
 +4kYsuq9yIVKjfKiypPsWW8X36ZRsSlerx6n+oguSYw6bOlBypxWQdkjv1Pj6LT7lw3z
 PXKDnzeLRMpjZTuDF7WOpDzCOwQrxoW+zP0RbTfwHnKhV/Fwm50oiMiaU2xACQCbUFf7
 L69uchMV1URBoOBLdAl2WJM/DMaoa6tMZs+f3sD/MYgcz6gZojMerrZu/gn/Wq71h4Zm
 j18sybhWdi6ROVT+nWKsiNSNnDFNqm7sob1ehxFBME2ySMkteQeN3ujZFKdigwRH6I1N
 yZGQ==
X-Gm-Message-State: AOJu0YzbSNLtLGL/j/z+Uv3Og76rQPDW63udWjAf1NbooTErdwj4oaTW
 VtBTayZPEa9vytERGfrBksZhe3DsycDB/NjPnExgQttiZflz
X-Google-Smtp-Source: AGHT+IGsyZ0CVZPQIKSBXE2Ngyt2bDz2pyzbCDr2Xsmei5tIBjt7D/9dE16CAQNT9YtnIs7GTSb7j6pgJXBjgsVW/asO6sA1JIcf
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2091:b0:3a1:c163:6022 with SMTP id
 s17-20020a056808209100b003a1c1636022mr1741075oiw.4.1697341067805; Sat, 14 Oct
 2023 20:37:47 -0700 (PDT)
Date: Sat, 14 Oct 2023 20:37:47 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000068c7730607b903b7@google.com>
Subject: [syzbot] [dri?] WARNING in drm_prime_fd_to_handle_ioctl
From: syzbot <syzbot+0da81ccba2345eeb7f48@syzkaller.appspotmail.com>
To: airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    1c8b86a3799f Merge tag 'xsa441-6.6-tag' of git://git.kerne.=
.
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D13005e31680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D32d0b9b42ceb8b1=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D0da81ccba2345eeb7=
f48
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D13c4834568000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D101b3679680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/45e9377886e9/disk-=
1c8b86a3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9511a41a6d1e/vmlinux-=
1c8b86a3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fac07e1c3c1a/bzI=
mage-1c8b86a3.xz

The issue was bisected to:

commit 85e26dd5100a182bf8448050427539c0a66ab793
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Jan 26 09:24:26 2023 +0000

    drm/client: fix circular reference counting issue

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D14cf17f16800=
00
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D16cf17f16800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D12cf17f1680000

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+0da81ccba2345eeb7f48@syzkaller.appspotmail.com
Fixes: 85e26dd5100a ("drm/client: fix circular reference counting issue")

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5040 at drivers/gpu/drm/drm_prime.c:326 drm_gem_prime_=
fd_to_handle drivers/gpu/drm/drm_prime.c:326 [inline]
WARNING: CPU: 0 PID: 5040 at drivers/gpu/drm/drm_prime.c:326 drm_prime_fd_t=
o_handle_ioctl+0x555/0x600 drivers/gpu/drm/drm_prime.c:374
Modules linked in:
CPU: 0 PID: 5040 Comm: syz-executor405 Not tainted 6.6.0-rc5-syzkaller-0005=
5-g1c8b86a3799f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 09/06/2023
RIP: 0010:drm_gem_prime_fd_to_handle drivers/gpu/drm/drm_prime.c:326 [inlin=
e]
RIP: 0010:drm_prime_fd_to_handle_ioctl+0x555/0x600 drivers/gpu/drm/drm_prim=
e.c:374
Code: 89 df e8 0e 9b 26 fd f0 48 ff 03 e9 7e fd ff ff e8 b0 dc d0 fc 4c 89 =
f7 44 89 eb e8 75 73 8b 05 e9 da fe ff ff e8 9b dc d0 fc <0f> 0b e9 5d fd f=
f ff e8 3f 94 26 fd e9 3a fc ff ff 48 8b 7c 24 08
RSP: 0018:ffffc90003a5fc70 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888018f14c00 RCX: 0000000000000000
RDX: ffff88801d691dc0 RSI: ffffffff84b6ea15 RDI: ffff8881476f3928
RBP: ffff88801fac5400 R08: 0000000000000007 R09: fffffffffffff000
R10: ffff8881476f3800 R11: 0000000000000000 R12: ffffc90003a5fe10
R13: ffff8881476f3800 R14: ffff88801c590c10 R15: 0000000000000000
FS:  00005555555d6380(0000) GS:ffff8880b9800000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555db75f4058 CR3: 0000000072209000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 drm_ioctl_kernel+0x280/0x4c0 drivers/gpu/drm/drm_ioctl.c:789
 drm_ioctl+0x5cb/0xbf0 drivers/gpu/drm/drm_ioctl.c:892
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x18f/0x210 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f0c8214be69
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff6f4156f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0c8214be69
RDX: 0000000020000000 RSI: 00000000c00c642e RDI: 0000000000000003
RBP: 0000000000000000 R08: 00000000000000a0 R09: 00000000000000a0
R10: 00000000000000a0 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0c821c3820 R14: 00007fff6f415720 R15: 00007fff6f415710
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
