Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71B8D4411
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 05:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0B311AF80;
	Thu, 30 May 2024 03:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com
 [209.85.166.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ED811AF80
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 03:25:29 +0000 (UTC)
Received: by mail-io1-f80.google.com with SMTP id
 ca18e2360f4ac-7e8e558d366so49391839f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 20:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717039529; x=1717644329;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S4K7HM1D3AqG6NeUGOCxHtK8VbYgvci8iQeTeS4D2C0=;
 b=cGE9yPVQT+dvzPZZs4KnXB+hABiUnJdkz12n9m+P5UF1O99kOP0tmw5owbDDw5VbmQ
 VCQs5NLOkrIbD5qOaPQ28JWndZx/4nT/tksPIv7gThwSsHNAalkwXaVZ1vkoVHIAwD1o
 J/68FhWYeJIoD65hMRxsDohYy3u3ogmtFrDOfienCUIHs1NI5AcK+xv/i2AGH9ENSit5
 +DekhQzME/SCpzXkgBnMqLxsdyWPuFO0GP0NKXKG0scD6V4GBh1WGLsJWj1zhS1FM7bg
 z/BNyF6Tg6993xBJkxfzqsdeNnp6ZP8rUcdWk4Uo/F50zG7NAtXCPeXhwQyV+Z4VO0hO
 ZB2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt+rK6BVBp8RItY61UzVnRQ7wsE5HhjRZc2ussY7L8iaQNTPIbZgPFAcWSxn7wagM2YEyS7QojLcjjVvNZe/+yXOF6/eyMOy+edKo1MeK9
X-Gm-Message-State: AOJu0YzovOIfSj+jSIE6px633RQkej4PAaUrpenLByzy2ab47Fn8m3ob
 6XPy19O6CAITVwuWyYL1b6np6ewjmvD2HImKP6TC7VG92yj+hUU6RVYxiy9h9ZjlhdFIagvBNAg
 IeyuDWIqC/3HojoUWZ3JE7flyE6Y4J5x/3taTsNr5oYqIE9MgjK7ClGQ=
X-Google-Smtp-Source: AGHT+IEXUql0FXR+Lxaqa/6M5rhOpI0OL0iAbamY3PgObpec9S40jP00gT/th087johTJy7XjD35dWWqwVRAD56+EkC9yKg58FZD
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a46:b0:36c:11a0:7878 with SMTP id
 e9e14a558f8ab-3747dfb5aa8mr438305ab.2.1717039528943; Wed, 29 May 2024
 20:25:28 -0700 (PDT)
Date: Wed, 29 May 2024 20:25:28 -0700
In-Reply-To: <0000000000002174ba06197f39c1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003032c50619a36bd7@google.com>
Subject: Re: [syzbot] [dri?] [media?] general protection fault in
 udmabuf_create (2)
From: syzbot <syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    9d99040b1bc8 Add linux-next specific files for 20240529
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14c083e6980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=735e953fee00ec19
dashboard link: https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176b79d2980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10266eaa980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f0deeb27b28b/disk-9d99040b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5acd2205cee1/vmlinux-9d99040b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/222eebb6b9d8/bzImage-9d99040b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 5101 Comm: syz-executor479 Not tainted 6.10.0-rc1-next-20240529-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:PageTail include/linux/page-flags.h:284 [inline]
RIP: 0010:const_folio_flags include/linux/page-flags.h:312 [inline]
RIP: 0010:folio_test_head include/linux/page-flags.h:837 [inline]
RIP: 0010:folio_test_large include/linux/page-flags.h:858 [inline]
RIP: 0010:folio_nr_pages include/linux/mm.h:2076 [inline]
RIP: 0010:udmabuf_create+0xa54/0x11c0 drivers/dma-buf/udmabuf.c:376
Code: 01 00 00 48 8b 44 24 70 42 80 3c 28 00 48 8b 5c 24 68 74 08 48 89 df e8 9a 63 ed fb 4c 8b 3b 49 8d 5f 08 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 7d 63 ed fb 48 8b 1b 48 89 de 48
RSP: 0018:ffffc9000357fbe0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000008 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: ffff888022207028 RDI: ffff8880295ee248
RBP: ffffc9000357fd70 R08: ffffffff8fad8daf R09: 1ffffffff1f5b1b5
R10: dffffc0000000000 R11: fffffbfff1f5b1b6 R12: 0000000000000001
R13: dffffc0000000000 R14: ffff888022207028 R15: 0000000000000000
FS:  00005555645a9480(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feee7c0f0d0 CR3: 0000000022b26000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:420 [inline]
 udmabuf_ioctl+0x304/0x4f0 drivers/dma-buf/udmabuf.c:451
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feee7b981b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffda54957e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007feee7b981b9
RDX: 00000000200002c0 RSI: 0000000040187542 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 00007ffda5495820 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:PageTail include/linux/page-flags.h:284 [inline]
RIP: 0010:const_folio_flags include/linux/page-flags.h:312 [inline]
RIP: 0010:folio_test_head include/linux/page-flags.h:837 [inline]
RIP: 0010:folio_test_large include/linux/page-flags.h:858 [inline]
RIP: 0010:folio_nr_pages include/linux/mm.h:2076 [inline]
RIP: 0010:udmabuf_create+0xa54/0x11c0 drivers/dma-buf/udmabuf.c:376
Code: 01 00 00 48 8b 44 24 70 42 80 3c 28 00 48 8b 5c 24 68 74 08 48 89 df e8 9a 63 ed fb 4c 8b 3b 49 8d 5f 08 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 7d 63 ed fb 48 8b 1b 48 89 de 48
RSP: 0018:ffffc9000357fbe0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000008 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: ffff888022207028 RDI: ffff8880295ee248
RBP: ffffc9000357fd70 R08: ffffffff8fad8daf R09: 1ffffffff1f5b1b5
R10: dffffc0000000000 R11: fffffbfff1f5b1b6 R12: 0000000000000001
R13: dffffc0000000000 R14: ffff888022207028 R15: 0000000000000000
FS:  00005555645a9480(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005fdeb8 CR3: 0000000022b26000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	01 00                	add    %eax,(%rax)
   2:	00 48 8b             	add    %cl,-0x75(%rax)
   5:	44 24 70             	rex.R and $0x70,%al
   8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   d:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  12:	74 08                	je     0x1c
  14:	48 89 df             	mov    %rbx,%rdi
  17:	e8 9a 63 ed fb       	call   0xfbed63b6
  1c:	4c 8b 3b             	mov    (%rbx),%r15
  1f:	49 8d 5f 08          	lea    0x8(%r15),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 7d 63 ed fb       	call   0xfbed63b6
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48 89 de             	mov    %rbx,%rsi
  3f:	48                   	rex.W


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
