Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC8D0EE47
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 13:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35F910E0E5;
	Sun, 11 Jan 2026 12:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com
 [209.85.161.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158E610E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 12:41:26 +0000 (UTC)
Received: by mail-oo1-f80.google.com with SMTP id
 006d021491bc7-65f6588abf4so6465315eaf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 04:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768135286; x=1768740086;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vvlqPFjwKVuyoAKjESzLQR9UIyYvql1opNXXHW2TfTM=;
 b=wn2gVRiQFT1gBuLu8QgkYqrP9qpYEi6cpS+cFH0aHrSz/E912KRyiosCpQci1PzLwx
 hLrbjNgFjg5Y568yH4k9VqmVRErBJbCaQcmxjacq+rU7dJQT1QSzQX/WnX+yvA69p+Ej
 lUa2tbJ0eKSqnlgMH06MJmvgiHcyAY9daITfPfdM8GykiWb8m5kZCRLBTRCbrgbhLY4S
 5DAVCq0DlUgw9v6olFoIMMaSQOIlH8TBqlBivtZsA6AyP1YZHL+7Kf04WX9fimbqHvBn
 9ApcLNIbadeAOw62kqAB8msn0/fxyfMaxxB9UrNm1jMMfLua0St+gmVgoQp2EIoz/nxh
 26Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtxUFb2PKWMazJnpJI5x6n3VdtvRYc12o3smuXdScd3pgy/C1QnlKpC4jdXBX8Y8tQeowVqdv4SyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgN9ayfKRFNa7jgQQ9vUWT2X0+YD/jN8wfp+PUrlDcR3K4HiSj
 1IALyW6VDK50MsgUEUu2WufOZOJFL5x9Fd1s+qPhomRf/4ZYpb79CJT9ROIUOwCKq+ZLrhZoBPY
 cD6cZXqnUgDd1kAnssrWFjjUh5o4edXNlbRHJmH/hiJL+YMp3vPNBeBZ+XDM=
X-Google-Smtp-Source: AGHT+IF/a5y1gXqEow/AfFBGKBT3lzwLYkZfhvkVxbuMbIpywh/blw41Si5JSlLXPgtY+F0p9qvHKDJwWmKCmUPFKpkG9uain01O
MIME-Version: 1.0
X-Received: by 2002:a05:6820:812:b0:65f:6d25:8e50 with SMTP id
 006d021491bc7-65f6d259570mr2846657eaf.24.1768135286248; Sun, 11 Jan 2026
 04:41:26 -0800 (PST)
Date: Sun, 11 Jan 2026 04:41:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69639a76.050a0220.eaf7.0069.GAE@google.com>
Subject: [syzbot] [dri?] WARNING in drm_wait_one_vblank (3)
From: syzbot <syzbot+f59157955aba9d0cb43b@syzkaller.appspotmail.com>
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

HEAD commit:    f0b9d8eb98df Merge tag 'nfsd-6.19-3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17ea1074580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f2b6fe1fdf1a00b
dashboard link: https://syzkaller.appspot.com/bug?extid=f59157955aba9d0cb43b
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10706922580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f89f92580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/200586687016/disk-f0b9d8eb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d56481335522/vmlinux-f0b9d8eb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12cfd8855d89/bzImage-f0b9d8eb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f59157955aba9d0cb43b@syzkaller.appspotmail.com

------------[ cut here ]------------
faux_driver vkms: [drm] vblank wait timed out on crtc 0
WARNING: drivers/gpu/drm/drm_vblank.c:1318 at drm_wait_one_vblank+0x39a/0x5c0 drivers/gpu/drm/drm_vblank.c:1318, CPU#0: kworker/0:0/9
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: events drm_fb_helper_damage_work
RIP: 0010:drm_wait_one_vblank+0x587/0x5c0 drivers/gpu/drm/drm_vblank.c:1318
Code: 03 48 b9 00 00 00 00 00 fc ff df 80 3c 08 00 74 08 4c 89 ef e8 ba c8 f6 fc 4d 8b 7d 00 48 89 df 4c 89 e6 4c 89 fa 8b 4c 24 04 <67> 48 0f b9 3a e9 d5 fc ff ff 44 89 f9 80 e1 07 80 c1 03 38 c1 0f
RSP: 0018:ffffc900000e7860 EFLAGS: 00010246
RAX: 1ffff110281e8400 RBX: ffffffff8ee5ae70 RCX: 0000000000000000
RDX: ffffffff8b569b80 RSI: ffffffff8b584ca0 RDI: ffffffff8ee5ae70
RBP: ffffc900000e7948 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1db66af R12: ffffffff8b584ca0
R13: ffff888140f42000 R14: 1ffff9200001cf10 R15: ffffffff8b569b80
FS:  0000000000000000(0000) GS:ffff888126cef000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055557a9da5c8 CR3: 0000000043562000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 drm_client_modeset_wait_for_vblank+0xc5/0xf0 drivers/gpu/drm/drm_client_modeset.c:1330
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:334 [inline]
 drm_fb_helper_damage_work+0xc9/0x650 drivers/gpu/drm/drm_fb_helper.c:369
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
   7:	fc ff df
   a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
   e:	74 08                	je     0x18
  10:	4c 89 ef             	mov    %r13,%rdi
  13:	e8 ba c8 f6 fc       	call   0xfcf6c8d2
  18:	4d 8b 7d 00          	mov    0x0(%r13),%r15
  1c:	48 89 df             	mov    %rbx,%rdi
  1f:	4c 89 e6             	mov    %r12,%rsi
  22:	4c 89 fa             	mov    %r15,%rdx
  25:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
* 29:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2e:	e9 d5 fc ff ff       	jmp    0xfffffd08
  33:	44 89 f9             	mov    %r15d,%ecx
  36:	80 e1 07             	and    $0x7,%cl
  39:	80 c1 03             	add    $0x3,%cl
  3c:	38 c1                	cmp    %al,%cl
  3e:	0f                   	.byte 0xf


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
