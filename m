Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA11118297
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9B46E858;
	Tue, 10 Dec 2019 08:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6896E428
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:01:09 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id x2so11340230ilk.18
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 04:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=/5KO4nUeYu8oKg0JMtTVjDN33PVQp5q5hi7dGA2Dw+E=;
 b=A3I+KThqZ+SOF17SCMeheo6lDUxDe+uB+dkoJfNrQIPAbm9Yi1mls047oi9hrrYrAl
 GKfcgJQyCZrxnV9+/iNyH8e/eU9OPCLeznxnWGVn0Pz9GQ0V7ym34QomFEGaOk+kuzgQ
 4e4BGaT6ZjwkECPrGG8I7DUVv4x5WS2a+YPNp6X0NGX0l7UCcx8/U4rzgxUWymCAgJVT
 FFK7/bbdajOpbulzCzAoelxWIU8ZWVcWUV8AeGsqXCeyhXXtXWTh473MsqI+enL3e+pF
 LIoGrxl/a4EUzdMU5+dx9dq4myUjFdzAMh9iE3dddsaCB3f8rd9eUqmceaZHpURN9jz5
 Iajg==
X-Gm-Message-State: APjAAAUivxrj/sct8rj8O7xCFqZgfXNslAiPsHTA6aS3PmTlN/+IiBGu
 O+yHXQiSo4Xg7lUkTUe4jqDDxkVMqGyf07KXqJdjwvOBtrwg
X-Google-Smtp-Source: APXvYqzBxWu+RmcQ2MNK/kctsW7tqs/FL8kvc71wAUOguT1glbySNTrZ/djfQYKZ6PEnxFw5501mtlu/6hJrAqkhJqqkIy1S6LzP
MIME-Version: 1.0
X-Received: by 2002:a92:9951:: with SMTP id p78mr10429663ili.208.1575892869300; 
 Mon, 09 Dec 2019 04:01:09 -0800 (PST)
Date: Mon, 09 Dec 2019 04:01:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000adca7b0599442690@google.com>
Subject: general protection fault in fbcon_fb_blanked
From: syzbot <syzbot+f457c8344e5a2a121e78@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, ghalat@redhat.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, sam@ravnborg.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following crash on:

HEAD commit:    eea2d5da Merge tag 'for-linus' of git://git.armlinux.org.u..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1785042ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f07a23020fd7d21a
dashboard link: https://syzkaller.appspot.com/bug?extid=f457c8344e5a2a121e78
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f457c8344e5a2a121e78@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 12067 Comm: syz-executor.2 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:fbcon_fb_blanked+0xe5/0x260 drivers/video/fbdev/core/fbcon.c:3272
Code: 0f 85 79 01 00 00 48 8d 04 db 4c 8b 3c c5 80 79 0f 8c 48 b8 00 00 00  
00 00 fc ff df 49 8d bf 7c 03 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48  
89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 21 01 00 00
RSP: 0018:ffffc9000169fa30 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 000000000000003e RCX: ffffc9000dbd6000
RDX: 000000000000006f RSI: ffffffff83b2430a RDI: 000000000000037c
RBP: ffffc9000169fa60 R08: ffff8880a702c240 R09: ffffed10147fc003
R10: ffffc9000169fa60 R11: ffff8880a3fe0017 R12: ffff8880a3fe0000
R13: ffff8880a3f05400 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fe327bd5700(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000400200 CR3: 0000000058b49000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  do_fb_ioctl+0x18b/0x7d0 drivers/video/fbdev/core/fbmem.c:1158
  fb_ioctl+0xe6/0x130 drivers/video/fbdev/core/fbmem.c:1180
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a6f9
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fe327bd4c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a6f9
RDX: 0000000000000000 RSI: 0000000000004611 RDI: 0000000000000004
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fe327bd56d4
R13: 00000000004d09d8 R14: 00000000004dc698 R15: 00000000ffffffff
Modules linked in:
---[ end trace d8165df606abdd16 ]---
RIP: 0010:fbcon_fb_blanked+0xe5/0x260 drivers/video/fbdev/core/fbcon.c:3272
Code: 0f 85 79 01 00 00 48 8d 04 db 4c 8b 3c c5 80 79 0f 8c 48 b8 00 00 00  
00 00 fc ff df 49 8d bf 7c 03 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48  
89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 21 01 00 00
RSP: 0018:ffffc9000169fa30 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 000000000000003e RCX: ffffc9000dbd6000
RDX: 000000000000006f RSI: ffffffff83b2430a RDI: 000000000000037c
RBP: ffffc9000169fa60 R08: ffff8880a702c240 R09: ffffed10147fc003
R10: ffffc9000169fa60 R11: ffff8880a3fe0017 R12: ffff8880a3fe0000
R13: ffff8880a3f05400 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fe327bd5700(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa2ff0a3db8 CR3: 0000000058b49000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
