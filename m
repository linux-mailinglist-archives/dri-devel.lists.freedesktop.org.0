Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9593118294
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C836E850;
	Tue, 10 Dec 2019 08:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782A789D73
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 11:16:09 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id n26so5472219ioj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 03:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=ajT3D1Os5iKGeC5P4Qsk03YVLFhdx/JW0RgTUFoWDIk=;
 b=dQ+Ky31GLQlz7mImPRkV7TL2IixnPPu1BtK/V5q6AItn1uhxk48iIkm6rOiARUwhGi
 NPInDwI+4XFqw0wWqB+rmT9xPctBN3Tt07UDeZhpG9UVkzVISLmO1t9B0iIsfVjGY0G3
 jSoKjlUgi7ooUUqoXhKpyAnFL99PNqX83z2AESRJPfg8N83bYaRiIlBh7gyr/ZTxr865
 uITvbQtRXl3hh6AgDNksEftDOvCwiF0P6YL9Hj7LYHLsNcPodgbqCzwdg1sd9OMoYG8u
 NjFONrUZIm6zJNXQIIZUtxAuhDAXH+k42ELsllqKSvdsCgylKbMpKmqhfUKtGxrXKPK5
 B2mA==
X-Gm-Message-State: APjAAAVCKJDMk9pxaE5EdWWZ3dL0w3LH9Q5JXSpORY0OC4sjmmCcd3uz
 /FO6+RupNMKbeNsN7nc4EFumOXaivkgFGc2wNGGVhwI9aM8T
X-Google-Smtp-Source: APXvYqwxeexU2etQ1Podf0pBdSWQY1TFMdYdF3jJGHRbmqae38yASMxPelQ3Src5x5S+FJG0YqbX4MivuUPBBG+kXhVNQBFa1Mzm
MIME-Version: 1.0
X-Received: by 2002:a92:5e4b:: with SMTP id s72mr26985910ilb.211.1575890168802; 
 Mon, 09 Dec 2019 03:16:08 -0800 (PST)
Date: Mon, 09 Dec 2019 03:16:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b7773d0599438538@google.com>
Subject: BUG: unable to handle kernel paging request in
 drm_fb_helper_dirty_work
From: syzbot <syzbot+8a2039467425e497e64a@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sean@poorly.run, syzkaller-bugs@googlegroups.com
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

HEAD commit:    e42617b8 Linux 5.5-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126dc282e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3754e2c78c1adb82
dashboard link: https://syzkaller.appspot.com/bug?extid=8a2039467425e497e64a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8a2039467425e497e64a@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: fffff520015a7200
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 7ffcd067 P4D 7ffcd067 PUD 2cd1c067 PMD 76d10067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 18 Comm: kworker/1:0 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS  
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Workqueue: events drm_fb_helper_dirty_work
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:121 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:135 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:166 [inline]
RIP: 0010:check_memory_region_inline mm/kasan/generic.c:182 [inline]
RIP: 0010:check_memory_region+0x9c/0x1a0 mm/kasan/generic.c:192
Code: c9 4d 0f 49 c1 49 c1 f8 03 45 85 c0 0f 84 10 01 00 00 41 83 e8 01 4e  
8d 44 c0 08 eb 0d 48 83 c0 08 4c 39 c0 0f 84 a7 00 00 00 <48> 83 38 00 74  
ed 4c 8d 40 08 eb 09 48 83 c0 01 49 39 c0 74 53 80
RSP: 0018:ffffc900004cfc30 EFLAGS: 00010216
RAX: fffff520015a7200 RBX: fffff520015a7400 RCX: ffffffff83f94dec
RDX: 0000000000000001 RSI: 0000000000001000 RDI: ffffc9000ad39000
RBP: ffffc900004cfc48 R08: fffff520015a7400 R09: 0000000000000200
R10: fffff520015a73ff R11: ffffc9000ad39fff R12: fffff520015a7200
R13: ffffc9000ad39000 R14: ffffc9000a53a000 R15: ffffc9000a53a000
FS:  0000000000000000(0000) GS:ffff88802d100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520015a7200 CR3: 0000000052ea7000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
Call Trace:
  memcpy+0x38/0x50 mm/kasan/common.c:126
  memcpy include/linux/string.h:380 [inline]
  drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:399 [inline]
  drm_fb_helper_dirty_work+0x44c/0x780 drivers/gpu/drm/drm_fb_helper.c:428
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2264
  worker_thread+0x98/0xe40 kernel/workqueue.c:2410
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
CR2: fffff520015a7200
---[ end trace 1682650b38de1096 ]---
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:121 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:135 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:166 [inline]
RIP: 0010:check_memory_region_inline mm/kasan/generic.c:182 [inline]
RIP: 0010:check_memory_region+0x9c/0x1a0 mm/kasan/generic.c:192
Code: c9 4d 0f 49 c1 49 c1 f8 03 45 85 c0 0f 84 10 01 00 00 41 83 e8 01 4e  
8d 44 c0 08 eb 0d 48 83 c0 08 4c 39 c0 0f 84 a7 00 00 00 <48> 83 38 00 74  
ed 4c 8d 40 08 eb 09 48 83 c0 01 49 39 c0 74 53 80
RSP: 0018:ffffc900004cfc30 EFLAGS: 00010216
RAX: fffff520015a7200 RBX: fffff520015a7400 RCX: ffffffff83f94dec
RDX: 0000000000000001 RSI: 0000000000001000 RDI: ffffc9000ad39000
RBP: ffffc900004cfc48 R08: fffff520015a7400 R09: 0000000000000200
R10: fffff520015a73ff R11: ffffc9000ad39fff R12: fffff520015a7200
R13: ffffc9000ad39000 R14: ffffc9000a53a000 R15: ffffc9000a53a000
FS:  0000000000000000(0000) GS:ffff88802d100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520015a7200 CR3: 0000000052ea7000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600


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
