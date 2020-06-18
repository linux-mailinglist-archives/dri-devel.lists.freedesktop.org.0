Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590BC20024C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3C16EC1C;
	Fri, 19 Jun 2020 06:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2846EB24
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 08:38:17 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id y16so3535236ilm.21
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 01:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=FTL5j6yPXfFni9d58QsALbqJhTpTc8DivuDW9RNIKrI=;
 b=pBpkuLkemy8G6q7yIMBQDBeOYgTP4JOTyT+rweKETzHIOhmoRZvlkVfLK/7V/Wp2tT
 pvw73i3a67gqJU/JXmB45Fu9iuUhTrjyi14mrbZLcCWmcWvONx/vwqrOIf1J1LBfdI5Q
 s7S8Mf/uO7nBuXkKnEv5UW9Der4CuWCi/vDMcQYgF2dDbdfNd2kOLfu1ZSMc51Npe3IJ
 YFC7Rb8S33lipQqMEx4twuZYO/P877xvIMVbW31L9fGfpz48cuCmC9kClUuJYgHV9gQG
 /1mIAL+EdspmPV3sdIdOcpqKR3ybJSz/uoy5/vZWP6qfxtDkDANbcOdGeNJUjPb1Gx74
 i4Uw==
X-Gm-Message-State: AOAM532jEjU+Q2otYudiVzVfVX19T8K+8kwc7bPiIJFDsUkuq8YYstK5
 zpYrH1HDZ/E9/99ZYOmqAWpP6vF0DE2tCUeZbWupVeMr7I9i
X-Google-Smtp-Source: ABdhPJxOX61H7E2J66acHXVBA5Ow8E89BMRmore6uGwEDFwRmsioC3OvN60NUlDqoOuDoHM00Tb7gzO0pyJ/ve7fY4AzHM3ZQPPD
MIME-Version: 1.0
X-Received: by 2002:a05:6638:209:: with SMTP id
 e9mr3468124jaq.48.1592469496537; 
 Thu, 18 Jun 2020 01:38:16 -0700 (PDT)
Date: Thu, 18 Jun 2020 01:38:16 -0700
In-Reply-To: <000000000000b7773d0599438538@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8260b05a857b25c@google.com>
Subject: Re: BUG: unable to handle kernel paging request in
 drm_fb_helper_dirty_work
From: syzbot <syzbot+8a2039467425e497e64a@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sean@poorly.run, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has found a reproducer for the following crash on:

HEAD commit:    435faf5c Merge tag 'riscv-for-linus-5.8-mw0' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14fed799100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dbb617b9c2a5bdf
dashboard link: https://syzkaller.appspot.com/bug?extid=8a2039467425e497e64a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15c1e011100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fed799100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8a2039467425e497e64a@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: fffff520016dec00
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 7ffcd067 P4D 7ffcd067 PUD 2c920067 PMD 28203067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 1221 Comm: kworker/1:2 Not tainted 5.7.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Workqueue: events drm_fb_helper_dirty_work
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:120 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:134 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:165 [inline]
RIP: 0010:check_memory_region_inline mm/kasan/generic.c:183 [inline]
RIP: 0010:check_memory_region+0x9d/0x190 mm/kasan/generic.c:192
Code: c9 4d 0f 49 c1 49 c1 f8 03 45 85 c0 0f 84 03 01 00 00 41 83 e8 01 4e 8d 44 c0 08 eb 0d 48 83 c0 08 4c 39 c0 0f 84 b2 00 00 00 <48> 83 38 00 74 ed 4c 8d 40 08 eb 09 48 83 c0 01 49 39 c0 74 69 80
RSP: 0018:ffffc90003f47c20 EFLAGS: 00010216
RAX: fffff520016dec00 RBX: fffff520016dec00 RCX: ffffffff840645bd
RDX: 0000000000000001 RSI: 0000000000001000 RDI: ffffc9000b6f6000
RBP: fffff520016dee00 R08: fffff520016dee00 R09: 0000000000000200
R10: ffffc9000b6f6fff R11: fffff520016dedff R12: 0000000000001000
R13: ffffc9000b6f6000 R14: ffffc90009b47000 R15: ffff888078c65a00
FS:  0000000000000000(0000) GS:ffff88802cf00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520016dec00 CR3: 00000000214d1000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 memcpy+0x39/0x60 mm/kasan/common.c:106
 memcpy include/linux/string.h:406 [inline]
 drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:386 [inline]
 drm_fb_helper_dirty_work+0x42d/0x760 drivers/gpu/drm/drm_fb_helper.c:415
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x388/0x470 kernel/kthread.c:268
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
Modules linked in:
CR2: fffff520016dec00
---[ end trace fdb627f1507ae2fd ]---
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:120 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:134 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:165 [inline]
RIP: 0010:check_memory_region_inline mm/kasan/generic.c:183 [inline]
RIP: 0010:check_memory_region+0x9d/0x190 mm/kasan/generic.c:192
Code: c9 4d 0f 49 c1 49 c1 f8 03 45 85 c0 0f 84 03 01 00 00 41 83 e8 01 4e 8d 44 c0 08 eb 0d 48 83 c0 08 4c 39 c0 0f 84 b2 00 00 00 <48> 83 38 00 74 ed 4c 8d 40 08 eb 09 48 83 c0 01 49 39 c0 74 69 80
RSP: 0018:ffffc90003f47c20 EFLAGS: 00010216
RAX: fffff520016dec00 RBX: fffff520016dec00 RCX: ffffffff840645bd
RDX: 0000000000000001 RSI: 0000000000001000 RDI: ffffc9000b6f6000
RBP: fffff520016dee00 R08: fffff520016dee00 R09: 0000000000000200
R10: ffffc9000b6f6fff R11: fffff520016dedff R12: 0000000000001000
R13: ffffc9000b6f6000 R14: ffffc90009b47000 R15: ffff888078c65a00
FS:  0000000000000000(0000) GS:ffff88802cf00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520016dec00 CR3: 00000000214d1000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
