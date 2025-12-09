Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F8CAFFE4
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 14:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5010E545;
	Tue,  9 Dec 2025 13:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com
 [209.85.167.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D9C10E545
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 13:00:29 +0000 (UTC)
Received: by mail-oi1-f208.google.com with SMTP id
 5614622812f47-45066f4a4ecso7541811b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 05:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765285229; x=1765890029;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IgkAPKSvAQZY01CR/qIafL5O9J5jQd9ok5ZYS8aYFb4=;
 b=oAVb2m+od4z2YUUcrZe2xqChTquw7i2hVAuUiEinfu4Tx6XjcsB8Lbbf5JZ+MWjiVt
 XDNsz0lQC+VFMY0AzsqscnJ6CKX7aERusEM2oIBwQVffSILVNUQb4gPM38+CipHxmXcb
 GH/QSdSDZK60E7t4SOeIqlDm4evv99QEiQESnjxGrMH3nsqT0Ta0eyBTVk6YbQwgCGJG
 fW4A/b+c6zHeQY1epTjevtX4xx7pX8k2pLDJl6RSTx2W/UzM+20S81MBRhYMoinPSaSW
 g8pjGIrJvNUlJYyfPdaYziVdvA2g9Umhi9DbwZ3VUKP8K7pZgQm/msL2LqdkmjlLFGx6
 jEKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwYjr2FsZmJ9p7C5nZ4yXCCHVG70y8jI/RB2LihU/bPhzSa/THyHI3yq//twT8YfGLCcCekMG2UlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQyvEf/5b4UIhoCY2NZwxJgcNVDOxUnoo9C8PCupYt5/MfwemE
 iVcA7D/c/TBLAIyx0eTYMHCyN0twyuVez3oh6hCr9ZN75uP8KL1wEno28MfP2TC6upEyqciiyxA
 26em9KfwvaCnqWDyjd34bJlb+1Yy66vU4bhUxK1l6n0hfAmOa2uAHE1fi41c=
X-Google-Smtp-Source: AGHT+IENDf0JdXqk4crRDAsLmtnAtug3K4mxrW5Jd7SpkLLuhvPfIO1Ri7vvCUepiIJaNqpV/tWk8qzWsMAUmv9+HXtjC3cqDPAY
MIME-Version: 1.0
X-Received: by 2002:a4a:ee89:0:b0:659:9a49:9027 with SMTP id
 006d021491bc7-6599a9aa373mr3961337eaf.84.1765285228656; Tue, 09 Dec 2025
 05:00:28 -0800 (PST)
Date: Tue, 09 Dec 2025 05:00:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69381d6c.050a0220.4004e.0017.GAE@google.com>
Subject: [syzbot] [dri?] WARNING in drm_atomic_helper_wait_for_vblanks (5)
From: syzbot <syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com>
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

HEAD commit:    cb015814f8b6 Merge tag 'f2fs-for-6.19-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16269a1a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dbcb767d1e1208ac
dashboard link: https://syzkaller.appspot.com/bug?extid=fcede535e7eb57cf5b43
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-cb015814.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/81f7cff430d3/vmlinux-cb015814.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1252ad8ea70f/bzImage-cb015814.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com

------------[ cut here ]------------
[CRTC:37:crtc-0] vblank wait timed out
WARNING: drivers/gpu/drm/drm_atomic_helper.c:1844 at 0x0, CPU#3: kworker/3:0/34
Modules linked in:
CPU: 3 UID: 0 PID: 34 Comm: kworker/3:0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events drm_fb_helper_damage_work
RIP: 0010:drm_atomic_helper_wait_for_vblanks.part.0+0x766/0x8c0 drivers/gpu/drm/drm_atomic_helper.c:1844
Code: 00 00 00 fc ff df 48 89 f9 48 c1 e9 03 0f b6 04 01 84 c0 74 08 3c 03 0f 8e 3f 01 00 00 48 8d 3d f0 9b 3a 0b 8b b5 d8 00 00 00 <67> 48 0f b9 3a e9 ed fc ff ff e8 8b 66 67 fc e9 81 fe ff ff e8 b1
RSP: 0018:ffffc900006df688 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffff11004e34023
RDX: ffff8880264b9cc0 RSI: 0000000000000025 RDI: ffffffff909219c0
RBP: ffff8880271a0040 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: ffff88801e6bd4b0 R12: dffffc0000000000
R13: ffff88802b42d300 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d6c07000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5e2cb4af98 CR3: 00000000578af000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1818 [inline]
 drm_atomic_helper_commit_tail+0xaa/0xd0 drivers/gpu/drm/drm_atomic_helper.c:1920
 commit_tail+0x334/0x410 drivers/gpu/drm/drm_atomic_helper.c:1997
 drm_atomic_helper_commit+0x300/0x380 drivers/gpu/drm/drm_atomic_helper.c:2235
 drm_atomic_commit+0x234/0x300 drivers/gpu/drm/drm_atomic.c:1743
 drm_atomic_helper_dirtyfb+0x5fd/0x780 drivers/gpu/drm/drm_damage_helper.c:183
 drm_fbdev_shmem_helper_fb_dirty+0x1cc/0x310 drivers/gpu/drm/drm_fbdev_shmem.c:117
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:346 [inline]
 drm_fb_helper_damage_work+0x2a2/0x5e0 drivers/gpu/drm/drm_fb_helper.c:369
 process_one_work+0x9ba/0x1b20 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3421
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x983/0xb10 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
----------------
Code disassembly (best guess), 5 bytes skipped:
   0:	df 48 89             	fisttps -0x77(%rax)
   3:	f9                   	stc
   4:	48 c1 e9 03          	shr    $0x3,%rcx
   8:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
   c:	84 c0                	test   %al,%al
   e:	74 08                	je     0x18
  10:	3c 03                	cmp    $0x3,%al
  12:	0f 8e 3f 01 00 00    	jle    0x157
  18:	48 8d 3d f0 9b 3a 0b 	lea    0xb3a9bf0(%rip),%rdi        # 0xb3a9c0f
  1f:	8b b5 d8 00 00 00    	mov    0xd8(%rbp),%esi
* 25:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2a:	e9 ed fc ff ff       	jmp    0xfffffd1c
  2f:	e8 8b 66 67 fc       	call   0xfc6766bf
  34:	e9 81 fe ff ff       	jmp    0xfffffeba
  39:	e8                   	.byte 0xe8
  3a:	b1                   	.byte 0xb1


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
