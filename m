Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F01868543
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 01:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C0C10E850;
	Tue, 27 Feb 2024 00:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65C010E850
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:56:18 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7bad62322f0so379269739f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708995377; x=1709600177;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGS+TsgiaJJB+YR8NChc905gWzRgJqAKHS8Fgnayr7Q=;
 b=UasfHFe3oojP4bHcKUJuBBYMO7VnpfOnahFYnfEfvPP12lr56OU34G/iDN/mk64ivR
 gwP7zIH/l4ItXQXss0n6SGK4zf0oKlA8p0a6MfPscNYl6JILnBU7K2VatMpqzngBR8fl
 APpuTArAk+Fd0qnbj59I/OJfLy63iD9XhXx/igNnM3e5ag9wQx5BKsBwgd6Y2iH5A3tL
 hTw2II6w9a+tRG4xT+cv96hkbGb6Mks0OcPI91bs9+FoOnmkFJS5MX9RT2LRzhxUBKIr
 FvybXivajzUrjIjeV3r2LTe9rbVA+oWvooqqr92NmBbQEm8sjV9vEekqbO0HFiYAb1OE
 NWkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ5NpXFXU8wc3Fw2rkIN0f3qL3o5zhKFqk2Hw5ljEGFJSXZGEQCbCXgVQFiLbEeSNTCEdNkqEy4a4b0E+Xo4HOV8atT3WaH8LGZCjwnnXE
X-Gm-Message-State: AOJu0YwnPEe7GA2r7eRrtK6udahTJ8PrkjpALWaPhEXBy4MYKTAfp6Eo
 rsvHIJ5Zd+P2SjRySbFEdK5SSaPIWX6PLZENP7eDr+Vv9VzG3+vuKe9sWXp0oH08FomXFfc6mgg
 wM6rrCULxFMj5yN90V3HgGGes947yP+fKGdCdvDbkVVWR0qwOBQ8KQbo=
X-Google-Smtp-Source: AGHT+IFibvy0HGfjK3AZXWzszHJz5KeM8HEX+Rxvjkem2/PuwSGEwNBwChjEBm3f99nfHReI8DxFZCj8O15rYvZWT1wvvUnO4QjO
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2b24:b0:474:7fd9:6bf7 with SMTP id
 fm36-20020a0566382b2400b004747fd96bf7mr130994jab.4.1708995377537; Mon, 26 Feb
 2024 16:56:17 -0800 (PST)
Date: Mon, 26 Feb 2024 16:56:17 -0800
In-Reply-To: <0000000000000946190610bf7bd5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000066a91a0612527e6d@google.com>
Subject: Re: [syzbot] [dri?] [media?] inconsistent lock state in valid_state
 (2)
From: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 gustavo@padovan.org, linaro-mm-sig-bounces@lists.linaro.org, 
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

HEAD commit:    d206a76d7d27 Linux 6.8-rc6
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12eea106180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fad652894fc96962
dashboard link: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1537934a180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1704b3e2180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6fa98109295d/disk-d206a76d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/613b4087d09d/vmlinux-d206a76d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d8cd6514daf9/bzImage-d206a76d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
6.8.0-rc6-syzkaller #0 Not tainted
--------------------------------
inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
syz-executor120/5070 [HC1[1]:SC0[0]:HE0:SE1] takes:
ffffffff8ea8cd18 (sync_timeline_list_lock){?.+.}-{2:2}, at: sync_timeline_debug_remove+0x2c/0x150 drivers/dma-buf/sync_debug.c:31
{HARDIRQ-ON-W} state was registered at:
  trace_hardirqs_on+0x28/0x40 kernel/trace/trace_preemptirq.c:61
  __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
  _raw_spin_unlock_irq+0x23/0x50 kernel/locking/spinlock.c:202
  spin_unlock_irq include/linux/spinlock.h:401 [inline]
  sync_print_obj drivers/dma-buf/sync_debug.c:118 [inline]
  sync_info_debugfs_show+0x158/0x4d0 drivers/dma-buf/sync_debug.c:153
  seq_read_iter+0x445/0xd60 fs/seq_file.c:230
  seq_read+0x3a3/0x4f0 fs/seq_file.c:162
  vfs_read+0x204/0xb70 fs/read_write.c:474
  ksys_read+0x1a0/0x2c0 fs/read_write.c:619
  do_syscall_64+0xf9/0x240
  entry_SYSCALL_64_after_hwframe+0x6f/0x77
irq event stamp: 9608
hardirqs last  enabled at (9607): [<ffffffff8b71f113>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
hardirqs last  enabled at (9607): [<ffffffff8b71f113>] _raw_spin_unlock_irq+0x23/0x50 kernel/locking/spinlock.c:202
hardirqs last disabled at (9608): [<ffffffff8b66faee>] sysvec_irq_work+0xe/0xb0 arch/x86/kernel/irq_work.c:17
softirqs last  enabled at (9124): [<ffffffff81592641>] invoke_softirq kernel/softirq.c:427 [inline]
softirqs last  enabled at (9124): [<ffffffff81592641>] __irq_exit_rcu+0xf1/0x1c0 kernel/softirq.c:632
softirqs last disabled at (9119): [<ffffffff81592641>] invoke_softirq kernel/softirq.c:427 [inline]
softirqs last disabled at (9119): [<ffffffff81592641>] __irq_exit_rcu+0xf1/0x1c0 kernel/softirq.c:632

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sync_timeline_list_lock);
  <Interrupt>
    lock(sync_timeline_list_lock);

 *** DEADLOCK ***

no locks held by syz-executor120/5070.

stack backtrace:
CPU: 0 PID: 5070 Comm: syz-executor120 Not tainted 6.8.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2e0 lib/dump_stack.c:106
 valid_state+0x13a/0x1c0 kernel/locking/lockdep.c:4013
 mark_lock_irq+0xbb/0xc20 kernel/locking/lockdep.c:4216
 mark_lock+0x223/0x350 kernel/locking/lockdep.c:4678
 mark_usage kernel/locking/lockdep.c:4564 [inline]
 __lock_acquire+0xb8d/0x1fd0 kernel/locking/lockdep.c:5091
 lock_acquire+0x1e3/0x530 kernel/locking/lockdep.c:5754
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0xd5/0x120 kernel/locking/spinlock.c:162
 sync_timeline_debug_remove+0x2c/0x150 drivers/dma-buf/sync_debug.c:31
 sync_timeline_free drivers/dma-buf/sw_sync.c:125 [inline]
 kref_put include/linux/kref.h:65 [inline]
 sync_timeline_put drivers/dma-buf/sw_sync.c:137 [inline]
 timeline_fence_release+0x204/0x250 drivers/dma-buf/sw_sync.c:165
 kref_put include/linux/kref.h:65 [inline]
 dma_fence_put include/linux/dma-fence.h:297 [inline]
 dma_fence_array_release+0x13e/0x240 drivers/dma-buf/dma-fence-array.c:120
 irq_work_single+0xe1/0x240 kernel/irq_work.c:221
 irq_work_run_list kernel/irq_work.c:252 [inline]
 irq_work_run+0x18b/0x350 kernel/irq_work.c:261
 __sysvec_irq_work+0xa8/0x3e0 arch/x86/kernel/irq_work.c:22
 sysvec_irq_work+0x8f/0xb0 arch/x86/kernel/irq_work.c:17
 </IRQ>
 <TASK>
 asm_sysvec_irq_work+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:__raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
RIP: 0010:_raw_spin_unlock_irq+0x29/0x50 kernel/locking/spinlock.c:202
Code: 90 f3 0f 1e fa 53 48 89 fb 48 83 c7 18 48 8b 74 24 08 e8 da 4b ff f5 48 89 df e8 92 8b 00 f6 e8 ad aa 28 f6 fb bf 01 00 00 00 <e8> 62 5c f2 f5 65 8b 05 e3 cd 91 74 85 c0 74 06 5b c3 cc cc cc cc
RSP: 0018:ffffc90003a87b50 EFLAGS: 00000282
RAX: 9ede7a61d4cee000 RBX: ffff888015fb5f30 RCX: ffffffff94485303
RDX: dffffc0000000000 RSI: ffffffff8baab640 RDI: 0000000000000001
RBP: ffff88807f87c63c R08: ffffffff8f8568af R09: 1ffffffff1f0ad15
R10: dffffc0000000000 R11: fffffbfff1f0ad16 R12: ffff888015fb5f20
R13: ffff88807f87c600 R14: dffffc0000000000 R15: ffff888015fb5ee0
 spin_unlock_irq include/linux/spinlock.h:401 [inline]
 sw_sync_debugfs_release+0x14b/0x1d0 drivers/dma-buf/sw_sync.c:359
 __fput+0x429/0x8a0 fs/file_table.c:376
 task_work_run+0x24e/0x310 kernel/task_work.c:180
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0xa2c/0x2740 kernel/exit.c:871
 do_group_exit+0x206/0x2c0 kernel/exit.c:1020
 __do_sys_exit_group kernel/exit.c:1031 [inline]
 __se_sys_exit_group kernel/exit.c:1029 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1029
 do_syscall_64+0xf9/0x240
 entry_SYSCALL_64_after_hwframe+0x6f/0x77
RIP: 0033:0x7fb8001b9f39
Code: Unable to access opcode bytes at 0x7fb8001b9f0f.
RSP: 002b:00007ffdaf45d478 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 000000000000000
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	f3 0f 1e fa          	endbr64
   5:	53                   	push   %rbx
   6:	48 89 fb             	mov    %rdi,%rbx
   9:	48 83 c7 18          	add    $0x18,%rdi
   d:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  12:	e8 da 4b ff f5       	call   0xf5ff4bf1
  17:	48 89 df             	mov    %rbx,%rdi
  1a:	e8 92 8b 00 f6       	call   0xf6008bb1
  1f:	e8 ad aa 28 f6       	call   0xf628aad1
  24:	fb                   	sti
  25:	bf 01 00 00 00       	mov    $0x1,%edi
* 2a:	e8 62 5c f2 f5       	call   0xf5f25c91 <-- trapping instruction
  2f:	65 8b 05 e3 cd 91 74 	mov    %gs:0x7491cde3(%rip),%eax        # 0x7491ce19
  36:	85 c0                	test   %eax,%eax
  38:	74 06                	je     0x40
  3a:	5b                   	pop    %rbx
  3b:	c3                   	ret
  3c:	cc                   	int3
  3d:	cc                   	int3
  3e:	cc                   	int3
  3f:	cc                   	int3


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
