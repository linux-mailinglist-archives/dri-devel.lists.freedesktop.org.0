Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC1CDD27F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 01:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04481113B58;
	Thu, 25 Dec 2025 00:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com
 [209.85.161.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B7A113B58
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 00:33:18 +0000 (UTC)
Received: by mail-oo1-f79.google.com with SMTP id
 006d021491bc7-65b37e173faso9864278eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 16:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766622797; x=1767227597;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5uhpoHrh3BvVX/j1akM/WBbeEEdFzi5EXt/jkxmHEMY=;
 b=OKsaC0szucwQg6t3AaFw2H+qp83pe1K04Bmr8PP+NRp5SfgzUSZVoDhFI+PnjogKDg
 1b8+ZkUzYfe89xUMJaz4plMFQ1L9fMctMcJ4qfoKyuDvaaCVmq+AbwFpFUBrXqf7huEa
 FKDAFKuLC3UhxJsL/6V7BJGqrhq7hbkYoZLcqP0nEPj25TcTJwpL9yD6Bo7JFP5i2tPN
 XVLhNydWmvFdZw3FuMCk1bOdMg1ZbcoKQtFbDGiyE6GrbkNNlRloPviRAZg8Vvz1Yqn6
 EYnfX67vvo07VhsSPgs2f9uiG3CW70sdXGPVX524m8pEjS9RMDUQfwstXMw8Q8qFFZsd
 jjtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHBrNlfTxP2VPkh48jFosl2DmuPwJYU8VyAwLGug5RIlkoFzjw0GD7RvOvVGG9fGGw0Sn+yhhLhxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwykJdArg0B4JperdEbxFNTD1IcEQml/Mofvn+z5LU9ZN9Q62Z4
 NS5xlg6HQFRv+dHivVpfUFpP1mIxuMOQ5bdGrSS0x3cKV4obGH0MwpfcSwdBHaXB1TryXXRQJbj
 L/1maKFSljD70oUk8v13KrtLp7qmKZxandT1lYSX9YxvtI66bAi/mKqO0Buw=
X-Google-Smtp-Source: AGHT+IE01I9ALrE5GxkCHSIXALgowbGo/bH+8/wJbshQN1+JbqcbtV1bx61FDCP61N+25tW5emzRU/TOsWnn0k+YtYnxk59vIm1A
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c51:b0:65c:fdbc:666c with SMTP id
 006d021491bc7-65d0ea9c59emr5685645eaf.42.1766622797552; Wed, 24 Dec 2025
 16:33:17 -0800 (PST)
Date: Wed, 24 Dec 2025 16:33:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <694c864d.050a0220.35954c.002e.GAE@google.com>
Subject: [syzbot] [dri?] WARNING in drm_crtc_wait_one_vblank
From: syzbot <syzbot+c9f3062e1f1e68af836a@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
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

HEAD commit:    cc3aa43b44bd Add linux-next specific files for 20251219
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=175fb77c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f7a09bf3b9133d9d
dashboard link: https://syzkaller.appspot.com/bug?extid=c9f3062e1f1e68af836a
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1b23d9783ee/disk-cc3aa43b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/07451939cf74/vmlinux-cc3aa43b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e5ddf385746f/bzImage-cc3aa43b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9f3062e1f1e68af836a@syzkaller.appspotmail.com

------------[ cut here ]------------
faux_driver vkms: [drm] vblank wait timed out on crtc 0
WARNING: drivers/gpu/drm/drm_vblank.c:1320 at drm_crtc_wait_one_vblank+0x33a/0x4f0 drivers/gpu/drm/drm_vblank.c:1320, CPU#1: kworker/1:2/19751
Modules linked in:
CPU: 1 UID: 0 PID: 19751 Comm: kworker/1:2 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: events drm_fb_helper_damage_work
RIP: 0010:drm_crtc_wait_one_vblank+0x4a3/0x4f0 drivers/gpu/drm/drm_vblank.c:1320
Code: 48 b9 00 00 00 00 00 fc ff df 80 3c 08 00 74 08 4c 89 ef e8 ff ee e1 fc 4d 8b 7d 00 4c 89 e7 48 8b 74 24 18 4c 89 fa 44 89 f1 <67> 48 0f b9 3a 48 8b 7c 24 28 44 89 f6 e8 8b f6 ff ff b8 92 ff ff
RSP: 0018:ffffc9000bc1f840 EFLAGS: 00010246
RAX: 1ffff11004a3da00 RBX: 1ffff92001783f10 RCX: 0000000000000000
RDX: ffffffff8c08f7a0 RSI: ffffffff8c0aa5c0 RDI: ffffffff8fced610
RBP: ffffc9000bc1f948 R08: ffffffff8fc3d077 R09: 1ffffffff1f87a0e
R10: dffffc0000000000 R11: fffffbfff1f87a0f R12: ffffffff8fced610
R13: ffff8880251ed000 R14: 0000000000000000 R15: ffffffff8c08f7a0
FS:  0000000000000000(0000) GS:ffff888125adc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005627ed0d9b20 CR3: 000000002e21a000 CR4: 00000000003526f0
DR0: ffffffffffffffff DR1: 00000000000001f8 DR2: 0000000000000083
DR3: ffffffffefffff15 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_client_modeset_wait_for_vblank+0xc5/0xf0 drivers/gpu/drm/drm_client_modeset.c:1330
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:236 [inline]
 drm_fb_helper_damage_work+0xc9/0x710 drivers/gpu/drm/drm_fb_helper.c:271
 process_one_work+0x93a/0x15a0 kernel/workqueue.c:3279
 process_scheduled_works kernel/workqueue.c:3362 [inline]
 worker_thread+0x9b0/0xee0 kernel/workqueue.c:3443
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
----------------
Code disassembly (best guess):
   0:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
   7:	fc ff df
   a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
   e:	74 08                	je     0x18
  10:	4c 89 ef             	mov    %r13,%rdi
  13:	e8 ff ee e1 fc       	call   0xfce1ef17
  18:	4d 8b 7d 00          	mov    0x0(%r13),%r15
  1c:	4c 89 e7             	mov    %r12,%rdi
  1f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  24:	4c 89 fa             	mov    %r15,%rdx
  27:	44 89 f1             	mov    %r14d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  34:	44 89 f6             	mov    %r14d,%esi
  37:	e8 8b f6 ff ff       	call   0xfffff6c7
  3c:	b8                   	.byte 0xb8
  3d:	92                   	xchg   %eax,%edx
  3e:	ff                   	(bad)
  3f:	ff                   	.byte 0xff


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
