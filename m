Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92954447B52
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 08:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A87F6E4A7;
	Mon,  8 Nov 2021 07:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C136E203
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 22:13:17 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 x15-20020a056602160f00b005e1888842d5so10203971iow.14
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Nov 2021 14:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=bPfsg/Agpm0y6CwU65DpRj7Amo5nv5xgnrhep6n5zOk=;
 b=qHMFlNTpOnWhd6jTx8+kFKyWztmofLE7/p2DoNH1QMUHtmf40PjRsKzZczHuu1uecv
 7i7hYk67HAcNk1pSvUaqLL932YvzTWTCjm8CAancCCzf2E98q7HIJoeGGB4F61oztWiP
 7w9aoa9o1BZkeZ+s7rYkxh21nx7KFCyokDbMTgDgNAVsMKw8AEmgNv6SO1GPfQxfTvaN
 lLCDUEKbVQxq2ajmYHpRZY+M95v/kdNsWPehEexhY6sxUo8g06LNjpkR+mu05sCM0QwW
 gy0Zr1ALeIyfMDVf7YxD6+eBgESpBNuUXlGUdeTPDDy9oqhljDtBde5bBm+hqmLEAkxb
 LUeg==
X-Gm-Message-State: AOAM532JV5CuPtoFyfzljfZa4zC82YLOIOy6siql/jrdioYJTFkQKMw2
 mAVQbQpwamzVr1PPRbYCPKyxtEsnM1rbamfUy0bhSmgcuSAK
X-Google-Smtp-Source: ABdhPJz/hBFgCzrMekkTtxNCWnVF6Q3MnUiQG7J4I42pIzJXW0+nltqXGWhTrCLi0GK/jyKs7dTfXTGd4tWrKNuSfnAjQHJk80Yj
MIME-Version: 1.0
X-Received: by 2002:a92:c56b:: with SMTP id b11mr40405364ilj.243.1636323196684; 
 Sun, 07 Nov 2021 14:13:16 -0800 (PST)
Date: Sun, 07 Nov 2021 14:13:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e04f2f05d03a2e3f@google.com>
Subject: [syzbot] general protection fault in virtio_gpu_poll
From: syzbot <syzbot+4af2eec0d32a135ba67e@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 08 Nov 2021 07:46:12 +0000
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

HEAD commit:    fe91c4725aee Merge tag 'scsi-misc' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=173a8aeab00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d0e8aeec50207a6
dashboard link: https://syzkaller.appspot.com/bug?extid=4af2eec0d32a135ba67e
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4af2eec0d32a135ba67e@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 0 PID: 27453 Comm: syz-executor.3 Not tainted 5.15.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:virtio_gpu_poll+0x7c/0x440 drivers/gpu/drm/virtio/virtgpu_drv.c:169
Code: 48 c1 ea 03 80 3c 02 00 0f 85 2b 03 00 00 4c 8b ab b0 01 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d 7d 18 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 19 03 00 00 4d 8b 6d 18 31 ff 4c 89 ee e8 8c 50
RSP: 0018:ffffc90024f0f708 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff888078deb000 RCX: ffffc9002783b000
RDX: 0000000000000003 RSI: ffffffff8462b2d5 RDI: 0000000000000018
RBP: ffff88801f33ba80 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff81cd631d R11: 0000000000000000 R12: ffffc90024f0f898
R13: 0000000000000000 R14: 0000000000000010 R15: 0000000000000004
FS:  00007f5ce5906700(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5ce84009e8 CR3: 000000006c1f7000 CR4: 0000000000150ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vfs_poll include/linux/poll.h:90 [inline]
 do_select+0x8cb/0x16a0 fs/select.c:534
 core_sys_select+0x3c2/0x9c0 fs/select.c:677
 do_pselect.constprop.0+0x17b/0x1c0 fs/select.c:759
 __do_sys_pselect6 fs/select.c:800 [inline]
 __se_sys_pselect6 fs/select.c:791 [inline]
 __x64_sys_pselect6+0x1c5/0x2b0 fs/select.c:791
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f5ce8390ae9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5ce5906188 EFLAGS: 00000246 ORIG_RAX: 000000000000010e
RAX: ffffffffffffffda RBX: 00007f5ce84a3f60 RCX: 00007f5ce8390ae9
RDX: 0000000000000000 RSI: 00000000200001c0 RDI: 0000000000000040
RBP: 00007f5ce83eaf25 R08: 0000000020000380 R09: 0000000000000000
R10: 0000000020000140 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd10da36cf R14: 00007f5ce5906300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 1158ebbbb6efaa79 ]---
RIP: 0010:virtio_gpu_poll+0x7c/0x440 drivers/gpu/drm/virtio/virtgpu_drv.c:169
Code: 48 c1 ea 03 80 3c 02 00 0f 85 2b 03 00 00 4c 8b ab b0 01 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d 7d 18 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 19 03 00 00 4d 8b 6d 18 31 ff 4c 89 ee e8 8c 50
RSP: 0018:ffffc90024f0f708 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff888078deb000 RCX: ffffc9002783b000
RDX: 0000000000000003 RSI: ffffffff8462b2d5 RDI: 0000000000000018
RBP: ffff88801f33ba80 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff81cd631d R11: 0000000000000000 R12: ffffc90024f0f898
R13: 0000000000000000 R14: 0000000000000010 R15: 0000000000000004
FS:  00007f5ce5906700(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5ce84009e8 CR3: 000000006c1f7000 CR4: 0000000000150ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 c1 ea 03          	shr    $0x3,%rdx
   4:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   8:	0f 85 2b 03 00 00    	jne    0x339
   e:	4c 8b ab b0 01 00 00 	mov    0x1b0(%rbx),%r13
  15:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1c:	fc ff df
  1f:	49 8d 7d 18          	lea    0x18(%r13),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 19 03 00 00    	jne    0x34d
  34:	4d 8b 6d 18          	mov    0x18(%r13),%r13
  38:	31 ff                	xor    %edi,%edi
  3a:	4c 89 ee             	mov    %r13,%rsi
  3d:	e8                   	.byte 0xe8
  3e:	8c                   	.byte 0x8c
  3f:	50                   	push   %rax


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
