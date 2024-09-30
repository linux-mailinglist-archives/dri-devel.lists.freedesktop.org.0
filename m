Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E198B0B0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79710E28F;
	Mon, 30 Sep 2024 23:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE1C10E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:18:23 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a0ce7e621aso45555435ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 16:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727738303; x=1728343103;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BL/akqr0deBZImvpvkuvpugvj/LkMhDf8lCR1uhO034=;
 b=B6X6fia8D68zQ90Qigd47QheReXBIYv8s47gsT5NgC+y/a03b7IeN49UpGvf34qs3f
 6iC52P6rMoywwJIjZkwyljh2fXJgzPSH7ezPMib0r2db7EfY7aNcZhx7nhFBjEQPw0BT
 rz7+iYaitqc+bG7Y9h8hT1Juvn2txwkXfd/02TY1E38n06hX7/IyXFL6LczChVsuWS1h
 4zkw4Vnwk7OBRI7viBU8ODJjBYUHuDkHurE0QFB5z0lPGsHt7d+D7+v0Wge2ir2zXstk
 8TtvO2EFyBVRri0ZwcZHxtrw7/f3hLldK4wSrm54w7E9G9xb8YUsVx3oC/+qf2Csa4Cx
 2pSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/DWFUAs2LAhP4WGZ0NkTv94v2aBqb80J0nyYibU6Wv+OLEJwTdE5D4yfyztMdmY6qB4rCAPSqYIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG9oFVFQsMfeK9XI7WV3h+uxOQBLk8+3QEe25B2O23KE5N/Zdo
 RjUDlJ4YyAaAbVKrq93aD4MyHlkQnHMDmTYKdiKWA54cjBDqkm1wwolyFko6mxwcQ9EWkiD4THh
 lo+0Gh27icJKWU+eq3gfouDmf4zQWlQkIIaf1XtoHzdlmfPfQDjrbLww=
X-Google-Smtp-Source: AGHT+IHgEXVmXvg4us0DXFmOfew5JJbOY+h0PbiM3uJT/6VBbaQbvbtJ8yPaDNMFxjaBy/4tMNvqm9xfZyskmnXv2I5XbKfzlplv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a82:b0:3a0:a3f0:ff57 with SMTP id
 e9e14a558f8ab-3a34517c867mr119944885ab.15.1727738303045; Mon, 30 Sep 2024
 16:18:23 -0700 (PDT)
Date: Mon, 30 Sep 2024 16:18:23 -0700
In-Reply-To: <00000000000094071d061e9d0f66@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66fb31bf.050a0220.6bad9.0044.GAE@google.com>
Subject: Re: [syzbot] [dri?] WARNING in drm_wait_one_vblank (2)
From: syzbot <syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    9852d85ec9d4 Linux 6.12-rc1
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=131f5dd0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=286b31f2cf1c36b5
dashboard link: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ae7d07980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124e1980580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da91d5641713/disk-9852d85e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5fc1f1ed3252/vmlinux-9852d85e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5affad2001eb/bzImage-9852d85e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com

platform vkms: [drm] vblank wait timed out on crtc 0
WARNING: CPU: 1 PID: 5311 at drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x97c/0xa00 drivers/gpu/drm/drm_vblank.c:1307
Modules linked in:
CPU: 1 UID: 0 PID: 5311 Comm: syz-executor171 Not tainted 6.12.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:drm_wait_one_vblank+0x97c/0xa00 drivers/gpu/drm/drm_vblank.c:1307
Code: 80 3c 08 00 74 08 4c 89 ff e8 c0 51 94 fc 49 8b 1f 48 c7 c7 40 96 73 8c 4c 89 f6 48 89 da 8b 5c 24 0c 89 d9 e8 c5 9c eb fb 90 <0f> 0b 90 90 49 be 00 00 00 00 00 fc ff df e9 68 fb ff ff 44 89 e9
RSP: 0018:ffffc900037cfac0 EFLAGS: 00010246
RAX: 080b7da53130ae00 RBX: 0000000000000000 RCX: ffff88804f0bda00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc900037cfc00 R08: ffffffff8155daa2 R09: fffffbfff1cf9fd8
R10: dffffc0000000000 R11: fffffbfff1cf9fd8 R12: 1ffff920006f9f64
R13: 0000000000000ed5 R14: ffffffff8c86d500 R15: ffff888025074010
FS:  00007faa906a96c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007faa9075a366 CR3: 000000004f7a8000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_fb_helper_ioctl+0x114/0x140 drivers/gpu/drm/drm_fb_helper.c:1093
 do_fb_ioctl+0x40a/0x7b0 drivers/video/fbdev/core/fb_chrdev.c:155
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7faa906f6109
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 1b 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007faa906a9208 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007faa907783e8 RCX: 00007faa906f6109
RDX: 0000000000000000 RSI: 0000000040044620 RDI: 0000000000000003
RBP: 00007faa907783e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffb0
R13: 0000000000000000 R14: 3062662f7665642f R15: 6d6f692f7665642f
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
