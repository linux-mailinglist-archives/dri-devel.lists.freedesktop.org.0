Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53E47A660
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 09:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446BB1132A3;
	Mon, 20 Dec 2021 08:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E5C14A36C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 17:27:20 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 g14-20020a056e021e0e00b002a26cb56bd4so3892745ila.14
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 09:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=fobKgI55x5N/6ypkq6lMpwFjjU0O/kdcx+1Vs78g5RI=;
 b=eoRT8W8AMla/3o1SybrAqN0P9UCFUuWE/CkpRKTvmT2WaOkr7IWOPnrUu/E8Y/95Mt
 Sts/u7jZ247tCmWMJSUbzkel0uaHh6O/FF4pzMA7QbZj93mwIeCfTBenuYecyAKMqby2
 fkekZXAx4jlRMFkwWBRPEwJy8hupYLxNGZ5T7kDWX5KJdNjxeMaXZag9P7S3NK+1ApPJ
 z+YVTNAk8H/ZHAdA/VKQ/gQxRpe0fMVzcbambnn0Dn417xEVlVAcdQur2bEXqMkaxj9g
 mJ+hTyf7v+qlu9u3j+TPeQu12+qbn6lYLaqsp5YP2C1UPZ2AiFNAONlJ/l94GfM0P+IO
 tUaA==
X-Gm-Message-State: AOAM531WcJegoy3sjgFFfGGkCUBWgokkaQzVVMGAmtu7ZtWcutopnodl
 EVDlXmsCNutn1WO2ZJeouOC71467RqZF17k0yNpUbrran9sQ
X-Google-Smtp-Source: ABdhPJx8ukqJttrY60nUmmJkBmok2nx2uPQw8npuxHWX3fONNQj2BsAWACqIiCL5M7QHmmTp3QaNi8sM6wRI/S0I9zjf1GRf6PLC
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20ed:: with SMTP id
 q13mr2620758ilv.108.1639934839411; 
 Sun, 19 Dec 2021 09:27:19 -0800 (PST)
Date: Sun, 19 Dec 2021 09:27:19 -0800
In-Reply-To: <000000000000b0a1a605ce3ec5ad@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008ed93005d38315f5@google.com>
Subject: Re: [syzbot] general protection fault in
 sg_alloc_append_table_from_pages
From: syzbot <syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Dec 2021 08:57:56 +0000
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

HEAD commit:    3f667b5d4053 Merge tag 'tty-5.16-rc6' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=174324a3b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa556098924b78f0
dashboard link: https://syzkaller.appspot.com/bug?extid=2c56b725ec547fa9cb29
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14df5c71b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d67495b00000

The issue was bisected to:

commit 284562e1f34874e267d4f499362c3816f8f6bc3f
Author: Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Tue Dec 3 01:36:27 2019 +0000

    udmabuf: implement begin_cpu_access/end_cpu_access hooks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d68447300000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d68447300000
console output: https://syzkaller.appspot.com/x/log.txt?x=16d68447300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com
Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")

general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 PID: 3595 Comm: syz-executor559 Not tainted 5.16.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:sg_alloc_append_table_from_pages+0x821/0xdb0 lib/scatterlist.c:525 lib/scatterlist.c:525
Code: 0c 24 48 8b 4c 24 48 48 39 c8 48 0f 46 c8 89 f0 4c 8d 3c c7 48 89 4c 24 30 48 b9 00 00 00 00 00 fc ff df 4c 89 f8 48 c1 e8 03 <80> 3c 08 00 0f 85 24 05 00 00 4d 8b 3f 4c 89 e0 31 ff 83 e0 03 48
RSP: 0018:ffffc90002d0fc48 EFLAGS: 00010212
RAX: 0000000000000002 RBX: 0000000000000001 RCX: dffffc0000000000
RDX: ffff888021fd5700 RSI: 0000000000000000 RDI: 0000000000000010
RBP: 00000000fffff000 R08: fffffffffffff000 R09: ffff8880189ddb00
R10: ffffffff83d88b30 R11: 0000000000000000 R12: 0000000000000002
R13: ffff8880189ddb00 R14: 0000000000000000 R15: 0000000000000010
FS:  000055555652c300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020005b4c CR3: 00000000176ae000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 sg_alloc_table_from_pages_segment+0xc9/0x260 lib/scatterlist.c:573 lib/scatterlist.c:573
 sg_alloc_table_from_pages include/linux/scatterlist.h:331 [inline]
 sg_alloc_table_from_pages include/linux/scatterlist.h:331 [inline] drivers/dma-buf/udmabuf.c:67
 get_sg_table.isra.0+0xbb/0x160 drivers/dma-buf/udmabuf.c:67 drivers/dma-buf/udmabuf.c:67
 begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1175 drivers/dma-buf/dma-buf.c:1175
 dma_buf_ioctl+0x29a/0x380 drivers/dma-buf/dma-buf.c:374 drivers/dma-buf/dma-buf.c:374
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 vfs_ioctl fs/ioctl.c:51 [inline] fs/ioctl.c:860
 __do_sys_ioctl fs/ioctl.c:874 [inline] fs/ioctl.c:860
 __se_sys_ioctl fs/ioctl.c:860 [inline] fs/ioctl.c:860
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_x64 arch/x86/entry/common.c:50 [inline] arch/x86/entry/common.c:80
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f57966b60a9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffea34a0a78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f57966b60a9
RDX: 0000000020000000 RSI: 0000000040086200 RDI: 0000000000000004
RBP: 00007f579667a090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f579667a120
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace ed55bd5e5ccee2ad ]---
RIP: 0010:sg_alloc_append_table_from_pages+0x821/0xdb0 lib/scatterlist.c:525 lib/scatterlist.c:525
Code: 0c 24 48 8b 4c 24 48 48 39 c8 48 0f 46 c8 89 f0 4c 8d 3c c7 48 89 4c 24 30 48 b9 00 00 00 00 00 fc ff df 4c 89 f8 48 c1 e8 03 <80> 3c 08 00 0f 85 24 05 00 00 4d 8b 3f 4c 89 e0 31 ff 83 e0 03 48
RSP: 0018:ffffc90002d0fc48 EFLAGS: 00010212
RAX: 0000000000000002 RBX: 0000000000000001 RCX: dffffc0000000000
RDX: ffff888021fd5700 RSI: 0000000000000000 RDI: 0000000000000010
RBP: 00000000fffff000 R08: fffffffffffff000 R09: ffff8880189ddb00
R10: ffffffff83d88b30 R11: 0000000000000000 R12: 0000000000000002
R13: ffff8880189ddb00 R14: 0000000000000000 R15: 0000000000000010
FS:  000055555652c300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c8ef357220 CR3: 00000000176ae000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	0c 24                	or     $0x24,%al
   2:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   7:	48 39 c8             	cmp    %rcx,%rax
   a:	48 0f 46 c8          	cmovbe %rax,%rcx
   e:	89 f0                	mov    %esi,%eax
  10:	4c 8d 3c c7          	lea    (%rdi,%rax,8),%r15
  14:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
  19:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  20:	fc ff df
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	0f 85 24 05 00 00    	jne    0x558
  34:	4d 8b 3f             	mov    (%r15),%r15
  37:	4c 89 e0             	mov    %r12,%rax
  3a:	31 ff                	xor    %edi,%edi
  3c:	83 e0 03             	and    $0x3,%eax
  3f:	48                   	rex.W
----------------
Code disassembly (best guess):
   0:	0c 24                	or     $0x24,%al
   2:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   7:	48 39 c8             	cmp    %rcx,%rax
   a:	48 0f 46 c8          	cmovbe %rax,%rcx
   e:	89 f0                	mov    %esi,%eax
  10:	4c 8d 3c c7          	lea    (%rdi,%rax,8),%r15
  14:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
  19:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  20:	fc ff df
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	0f 85 24 05 00 00    	jne    0x558
  34:	4d 8b 3f             	mov    (%r15),%r15
  37:	4c 89 e0             	mov    %r12,%rax
  3a:	31 ff                	xor    %edi,%edi
  3c:	83 e0 03             	and    $0x3,%eax
  3f:	48                   	rex.W

