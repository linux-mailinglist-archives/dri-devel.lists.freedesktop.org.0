Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E646DCB73CC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 22:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7042210E2B3;
	Thu, 11 Dec 2025 21:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com
 [209.85.167.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F44010E2B3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 21:59:31 +0000 (UTC)
Received: by mail-oi1-f208.google.com with SMTP id
 5614622812f47-4537c9e1c14so471508b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490370; x=1766095170;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U4AgnaLYjAnPX60VeEMeIiPuS4yS1J2QZCjqgQ7udvI=;
 b=Gtbyn0/MVAmURv0i1dpBy4jC+2y+zD4Ye9dUX6zlYn93du3KazzDh5nfS9KfWMSHQA
 QNcO/MmJ4IbGIH+efeiY4oqsEh1wOhunB0u+KiNb9dTIm169pm2VmKjqVDzIcK7KoSDW
 xEWM4Wg1ybcPiOMFt0SOrGDty+Xe+omJzIPtDXVw4GU9blttLEXYgnfB5swda8jvkZII
 86Zo/Nd30H2Ci2EOVCHB4RS9ryJ3l52ReqnL2MabIx9BXnBEgNyyb7OnxKMpFebTuQjc
 C4pgK9TEbAbabP1k/uMxBXhz42ythXRIrr/CCTfR1Zqc66NitZj5fghF0JQ4pZa9ZJZG
 cUWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNzgO+i1rqZV0uVOlO0YzGl/GM2c0+piMPi9lCLyg1sh95A6Y00gqHbMZeSaiXjyaM30vRM7xfP+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTVX8RR/lhRbcnhjQwUog4f/HfTbQyKDgJyrR2QD8lJsxuJl+d
 mGe6hYmhIxdZgRuuQ8ojDg3VMSJxLiG43cjzgMBk4DZ87aVV6+vXarUfCb1qWpNpopRwT4Pvftc
 YrvJzxjoDQJ4PUNToLGqvJXHPgTDh3lvSraJbClaxs+clJcVHApbaFLOBMho=
X-Google-Smtp-Source: AGHT+IHAZf/avJYr88mrwodq4yuW4nXtfvbhuEGoWlnrDMSidJubs4yqaZyLBLL+kZX/DkVQu5t2GUa54BotdxF/DIZ2zpVDmLYC
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2019:b0:659:9a49:8dda with SMTP id
 006d021491bc7-65b451715aemr11630eaf.28.1765490370206; Thu, 11 Dec 2025
 13:59:30 -0800 (PST)
Date: Thu, 11 Dec 2025 13:59:30 -0800
In-Reply-To: <69381d6c.050a0220.4004e.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693b3ec2.a70a0220.33cd7b.0038.GAE@google.com>
Subject: Re: [syzbot] [dri?] WARNING in drm_atomic_helper_wait_for_vblanks (5)
From: syzbot <syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com>
To: airlied@gmail.com, chintanlike@gmail.com, dri-devel@lists.freedesktop.org, 
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

HEAD commit:    d358e5254674 Merge tag 'for-6.19/dm-changes' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13c2a61a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73d2ed7b46aaccf3
dashboard link: https://syzkaller.appspot.com/bug?extid=fcede535e7eb57cf5b43
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145d51c2580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-d358e525.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c0c4d1b8a322/vmlinux-d358e525.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2cdf67cb5df2/bzImage-d358e525.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com

------------[ cut here ]------------
[CRTC:37:crtc-0] vblank wait timed out
WARNING: drivers/gpu/drm/drm_atomic_helper.c:1844 at 0x0, CPU#3: syz.0.33/6143
Modules linked in:
CPU: 3 UID: 0 PID: 6143 Comm: syz.0.33 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:drm_atomic_helper_wait_for_vblanks.part.0+0x766/0x8c0 drivers/gpu/drm/drm_atomic_helper.c:1844
Code: 00 00 00 fc ff df 48 89 f9 48 c1 e9 03 0f b6 04 01 84 c0 74 08 3c 03 0f 8e 3f 01 00 00 48 8d 3d d0 d5 3a 0b 8b b5 d8 00 00 00 <67> 48 0f b9 3a e9 ed fc ff ff e8 1b 27 67 fc e9 81 fe ff ff e8 a1
RSP: 0018:ffffc90003fc77b0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffff11020b60023
RDX: ffff8881037eb860 RSI: 0000000000000025 RDI: ffffffff90929260
RBP: ffff888105b00040 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: ffff888028f5d4b0 R12: dffffc0000000000
R13: ffff888024b40e00 R14: 0000000000000000 R15: 0000000000000000
FS:  0000555589c49500(0000) GS:ffff8880d6bfd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6e38fc1f98 CR3: 00000000380b2000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1818 [inline]
 drm_atomic_helper_commit_tail+0xaa/0xd0 drivers/gpu/drm/drm_atomic_helper.c:1920
 commit_tail+0x334/0x410 drivers/gpu/drm/drm_atomic_helper.c:1997
 drm_atomic_helper_commit+0x300/0x380 drivers/gpu/drm/drm_atomic_helper.c:2235
 drm_atomic_commit+0x234/0x300 drivers/gpu/drm/drm_atomic.c:1743
 drm_client_modeset_commit_atomic+0x69d/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1103
 drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1206
 drm_client_modeset_commit+0x4f/0x80 drivers/gpu/drm/drm_client_modeset.c:1232
 __drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0x137/0x160 drivers/gpu/drm/drm_fb_helper.c:235
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:266 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked+0x93/0xc0 drivers/gpu/drm/drm_fb_helper.c:266
 drm_fbdev_client_restore+0x1b/0x30 drivers/gpu/drm/clients/drm_fbdev_client.c:45
 drm_client_dev_restore+0x200/0x2a0 drivers/gpu/drm/drm_client_event.c:118
 drm_lastclose drivers/gpu/drm/drm_file.c:408 [inline]
 drm_release+0x2c6/0x360 drivers/gpu/drm/drm_file.c:441
 __fput+0x402/0xb70 fs/file_table.c:468
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
 exit_to_user_mode_loop+0xfb/0x540 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x4ee/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6e3818f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff40d56468 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000010de4 RCX: 00007f6e3818f7c9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f6e383e7da0 R08: 0000000000000001 R09: 0000000540d5675f
R10: 0000001b2d720000 R11: 0000000000000246 R12: 00007f6e383e5fac
R13: 00007f6e383e5fa0 R14: ffffffffffffffff R15: 00007fff40d56580
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
  18:	48 8d 3d d0 d5 3a 0b 	lea    0xb3ad5d0(%rip),%rdi        # 0xb3ad5ef
  1f:	8b b5 d8 00 00 00    	mov    0xd8(%rbp),%esi
* 25:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2a:	e9 ed fc ff ff       	jmp    0xfffffd1c
  2f:	e8 1b 27 67 fc       	call   0xfc67274f
  34:	e9 81 fe ff ff       	jmp    0xfffffeba
  39:	e8                   	.byte 0xe8
  3a:	a1                   	.byte 0xa1


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
