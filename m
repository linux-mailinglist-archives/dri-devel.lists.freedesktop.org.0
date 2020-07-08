Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6E921996A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969F56EA27;
	Thu,  9 Jul 2020 07:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AE06E93D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 21:43:16 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id w10so25666818ilm.16
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 14:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=eoAn1HlYkwtbVVLjbIq4KVlzt4T6kCE2zsNOQ24E920=;
 b=htNJgU+3DfoeSV+efb1zZ6k8Y7TUheS+/yf4qAAOoGpF3vNS2Wsmv8XlYZDYmWB3Fo
 mH33hn+Dw2jVauWSDuSlItP4bp7BnWinKTPmCbfo8fm4iQihvJrWtCIBPKpIsdvEKJxJ
 ZCd7XKGBwm8Qt4/07dkbbvGRHii/2I8ppROTJf227cTJQl4e57Xu2+UBhfHWkLJLT5YN
 vd9S1IiabezuFcQqP0I48Crvqi2yIr0WR0XcEaQgRN4qmY48wrFk5D2Xa+FL175GGHoq
 eNf8PffaOhhrKwbxoq5DWhmc3qQtpLPUuABmv8X5F3AeT8KuaogMw5gNEbYjhqg3CM1V
 7Cjg==
X-Gm-Message-State: AOAM5309DAV59TfdbZx3X1XK8cRDyvXVdeXOqCsEWeK+NFNNiAt5kd+6
 FEqsR9mpi2ty0jFwC2VyBASBTGdyatDwodwIyQqWWKlnaBPa
X-Google-Smtp-Source: ABdhPJxtVs90avTmLhHuFTbp9SwkoETCGdzxpP2pm4glRJJsiB5Q8iHRT7JN6fzz2qPUpuTsElQF6l6PkypUKN+lP0QL06V+vWaG
MIME-Version: 1.0
X-Received: by 2002:a92:4101:: with SMTP id o1mr32609484ila.53.1594244595688; 
 Wed, 08 Jul 2020 14:43:15 -0700 (PDT)
Date: Wed, 08 Jul 2020 14:43:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cfab3705a9f4fef7@google.com>
Subject: general protection fault in dma_buf_release
From: syzbot <syzbot+4342719956b367864c91@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:06 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following crash on:

HEAD commit:    9e50b94b Add linux-next specific files for 20200703
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=121cf755100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f99cc0faa1476ed6
dashboard link: https://syzkaller.appspot.com/bug?extid=4342719956b367864c91
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1467c5e3100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=153f2283100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4342719956b367864c91@syzkaller.appspotmail.com

RBP: 00000000000103d6 R08: 0000000000000001 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402170
R13: 0000000000402200 R14: 0000000000000000 R15: 0000000000000000
general protection fault, probably for non-canonical address 0xdffffc0000000017: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000b8-0x00000000000000bf]
CPU: 1 PID: 6798 Comm: syz-executor223 Not tainted 5.8.0-rc3-next-20200703-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:dma_buf_release+0x51/0x3f0 drivers/dma-buf/dma-buf.c:63
Code: 03 80 3c 02 00 0f 85 30 03 00 00 48 8b ad e8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd b8 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e3 02 00 00 8b 9d b8 00 00 00
RSP: 0018:ffffc90001b87aa0 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffffff847e30a0 RCX: ffffffff81c58a83
RDX: 0000000000000017 RSI: ffffffff847e30b0 RDI: 00000000000000b8
RBP: 0000000000000000 R08: 0000000000000001 R09: ffff88808a53c80b
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88808b7dc550
R13: ffff88808b7dc4d8 R14: ffff88808b7dc520 R15: 0000000000000000
FS:  0000000001f09880(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cc090 CR3: 00000000a87d2000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __dentry_kill+0x42b/0x640 fs/dcache.c:584
 dentry_kill fs/dcache.c:705 [inline]
 dput+0x725/0xbc0 fs/dcache.c:878
 path_put+0x2d/0x60 fs/namei.c:496
 alloc_file_pseudo+0x20d/0x250 fs/file_table.c:236
 dma_buf_getfile drivers/dma-buf/dma-buf.c:439 [inline]
 dma_buf_export+0x5d8/0xae0 drivers/dma-buf/dma-buf.c:555
 udmabuf_create+0xb9d/0xe30 drivers/dma-buf/udmabuf.c:228
 udmabuf_ioctl_create_list drivers/dma-buf/udmabuf.c:284 [inline]
 udmabuf_ioctl+0x265/0x2c0 drivers/dma-buf/udmabuf.c:299
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:367
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x441229
Code: Bad RIP value.
RSP: 002b:00007ffe24394848 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000441229
RDX: 0000000020000000 RSI: 0000000040087543 RDI: 0000000000000004
RBP: 00000000000103d6 R08: 0000000000000001 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402170
R13: 0000000000402200 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 1a68562902844a66 ]---
RIP: 0010:dma_buf_release+0x51/0x3f0 drivers/dma-buf/dma-buf.c:63
Code: 03 80 3c 02 00 0f 85 30 03 00 00 48 8b ad e8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd b8 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e3 02 00 00 8b 9d b8 00 00 00
RSP: 0018:ffffc90001b87aa0 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffffff847e30a0 RCX: ffffffff81c58a83
RDX: 0000000000000017 RSI: ffffffff847e30b0 RDI: 00000000000000b8
RBP: 0000000000000000 R08: 0000000000000001 R09: ffff88808a53c80b
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88808b7dc550
R13: ffff88808b7dc4d8 R14: ffff88808b7dc520 R15: 0000000000000000
FS:  0000000001f09880(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cc090 CR3: 00000000a87d2000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
