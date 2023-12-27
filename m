Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6D81F1FB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Dec 2023 21:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F25B10E040;
	Wed, 27 Dec 2023 20:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD5810E040
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 20:51:19 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-35fd87e7a04so66787385ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 12:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703710278; x=1704315078;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6RH1fku3ryMWl5b9TQPsta4gwjT0JdL0o1tj9ksa+sc=;
 b=Kw5F8CaOlrEd+zU2eCuMEKwInmPBxkb7YskhF/MvUTn5jaaU9Ucz9c5kTy1GZNAO8P
 L7mSOd9uxXzTZH+uZKbtJ/u4HjPrCW/XLIRcqXFUueXEnByIyTj6iP4Ypdrdjhdb+gDn
 iQYRsT/dJWdHTHiqSOBTEM8xA0EhtEJwWAEr1hcq9sH9Ns6A/5Bm80W2XQ7PON8DelwF
 BIrxGpQj+eymdhZIKWU7fem3ewLUfFm1x/rlclhzvHK6XaQoGWqSGMq0S/ll0k6wIYoO
 vfyVgrc/3hmg5Y9jaI2GMBYoAVXO4j752vMsuujI7xL2E0Y7U5jHBF3KObDle8jnvJZP
 RkMA==
X-Gm-Message-State: AOJu0YzIssygQZ0hQ+VPgQxvJKr1MlROI3Xgj+oVg6d9bCsYN81JP/IY
 ieZ+G7PyQxPeHplZ15pCa1TrjfEuq2NsUKYBkOqCYfgIfBqv
X-Google-Smtp-Source: AGHT+IGEybVICjOUX9vJrIn3vsaTDFrBGnGLBuGyYO3KpsmGmcX5pyhDob4xgjJ+ckmag9X3Q7pKJU3Y6cDN0rvpfuWwemWyUZn5
MIME-Version: 1.0
X-Received: by 2002:a92:c548:0:b0:35f:f01e:bb18 with SMTP id
 a8-20020a92c548000000b0035ff01ebb18mr1252426ilj.6.1703710278611; Wed, 27 Dec
 2023 12:51:18 -0800 (PST)
Date: Wed, 27 Dec 2023 12:51:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4faa2060d83f582@google.com>
Subject: [syzbot] [dri?] WARNING in drm_prime_destroy_file_private (2)
From: syzbot <syzbot+59dcc2e7283a6f5f5ba1@syzkaller.appspotmail.com>
To: airlied@gmail.com, akinobu.mita@gmail.com, akpm@linux-foundation.org, 
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 jgg@nvidia.com, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de, zhengqi.arch@bytedance.com
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

HEAD commit:    5254c0cbc92d Merge tag 'block-6.7-2023-12-22' of git://git..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10cc6995e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=314e9ad033a7d3a7
dashboard link: https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e35809e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=155d5fd6e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ebe09a5995ee/disk-5254c0cb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/02178d7f5f98/vmlinux-5254c0cb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12307f47d87c/bzImage-5254c0cb.xz

The issue was bisected to:

commit ea4452de2ae987342fadbdd2c044034e6480daad
Author: Qi Zheng <zhengqi.arch@bytedance.com>
Date:   Fri Nov 18 10:00:11 2022 +0000

    mm: fix unexpected changes to {failslab|fail_page_alloc}.attr

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13027f76e80000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10827f76e80000
console output: https://syzkaller.appspot.com/x/log.txt?x=17027f76e80000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+59dcc2e7283a6f5f5ba1@syzkaller.appspotmail.com
Fixes: ea4452de2ae9 ("mm: fix unexpected changes to {failslab|fail_page_alloc}.attr")

R10: 0000000000000000 R11: 0000000000000246 R12: 00007efe98069194
R13: 00007efe97fd2210 R14: 0000000000000002 R15: 6972642f7665642f
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5107 at drivers/gpu/drm/drm_prime.c:227 drm_prime_destroy_file_private+0x43/0x60 drivers/gpu/drm/drm_prime.c:227
Modules linked in:
CPU: 0 PID: 5107 Comm: syz-executor227 Not tainted 6.7.0-rc6-syzkaller-00248-g5254c0cbc92d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
RIP: 0010:drm_prime_destroy_file_private+0x43/0x60 drivers/gpu/drm/drm_prime.c:227
Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 21 48 8b 83 90 00 00 00 48 85 c0 75 06 5b e9 13 f1 93 fc e8 0e f1 93 fc 90 <0f> 0b 90 5b e9 04 f1 93 fc e8 3f 9b ea fc eb d8 66 66 2e 0f 1f 84
RSP: 0018:ffffc90003bdf9e0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888019f28378 RCX: ffffc90003bdf9b0
RDX: ffff888018ff9dc0 RSI: ffffffff84f380c2 RDI: ffff888019f28408
RBP: ffff888019f28000 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8f193a57 R11: 0000000000000000 R12: ffff88814829a000
R13: ffff888019f282a8 R14: ffff88814829a068 R15: ffff88814829a0a0
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007efe98050410 CR3: 000000006d1ff000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 drm_file_free.part.0+0x738/0xb90 drivers/gpu/drm/drm_file.c:290
 drm_file_free drivers/gpu/drm/drm_file.c:247 [inline]
 drm_close_helper.isra.0+0x180/0x1f0 drivers/gpu/drm/drm_file.c:307
 drm_release+0x22a/0x4f0 drivers/gpu/drm/drm_file.c:494
 __fput+0x270/0xb70 fs/file_table.c:394
 task_work_run+0x14d/0x240 kernel/task_work.c:180
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0xa8a/0x2ad0 kernel/exit.c:869
 do_group_exit+0xd4/0x2a0 kernel/exit.c:1018
 get_signal+0x23b5/0x2790 kernel/signal.c:2904
 arch_do_signal_or_restart+0x90/0x7f0 arch/x86/kernel/signal.c:309
 exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
 exit_to_user_mode_prepare+0x121/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
 syscall_exit_to_user_mode+0x1e/0x60 kernel/entry/common.c:296
 do_syscall_64+0x4d/0x110 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7efe98014769
Code: Unable to access opcode bytes at 0x7efe9801473f.
RSP: 002b:00007efe97fd2208 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007efe9809c408 RCX: 00007efe98014769
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007efe9809c408
RBP: 00007efe9809c400 R08: 0000000000003131 R09: 0000000000003131
R10: 0000000000000000 R11: 0000000000000246 R12: 00007efe98069194
R13: 00007efe97fd2210 R14: 0000000000000002 R15: 6972642f7665642f
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
