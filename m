Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47FA18605E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAF56E220;
	Sun, 15 Mar 2020 23:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DC56E0AF
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 01:25:35 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id n27so7631095vsa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 18:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5q5NJxK1YkNH+pX4pGGpfevVsHjGMQn3YcRCMhJk420=;
 b=WFp0OyOXY8uatgoc0lD0UtpsiT/M2ibXsP4DFaLKTxzHgDrQOjpBNK+NQIFMyq+8yt
 Sbj5xScpwknMxLhAF0eeXSzkz7GwxXYF9US+NAXo8FUGTplyeozx+jMlctZ2EyzUG4vE
 p9bzSiCm91ZbTPoOB19jDaaj9/CovJ9aadJiCF5icwsjABMC67iYwBivc7dpxhVZYo6o
 Xjd1cjhlgRLvqQSSLHw/wZKAnqObYF2+bWR/VtIrGxx4w18xDMZh7X+BgMdcsPedxqxn
 xSy9JoymEOe/nLyhyyYt8DjxP79DVIB0tY3b1Tb5iiSfihTrgDS8QPbvHS4kXoud1PHe
 38dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5q5NJxK1YkNH+pX4pGGpfevVsHjGMQn3YcRCMhJk420=;
 b=BngjGv+9J8qDXN5GGBReacCvV3V1IcU2rAG3Req/GplHlLI9nG8PNKQlMo5OnWYVZ7
 fyPl0O+2UZfL7pVPKoMeou83HiAWAsTOLEJjtoIMTJWQHVgU/wZCmxih8ydGdzjli8uk
 QQ+ZIWjZP1dDTo9Bxy4ryBz76tpNe7olUOak52IZySZ+E2gtxPbW570TJT6c2UcS7UdI
 ZBwCP3nqEo9nMQUg93AzmaPiFpA0ukbxosQTTiEFnRIN/NIvuN5NSgrtbevPAAlnIsuJ
 xKLFbZQeru8qwrXxc0u9GyHgj5QhPvbutVsYY6ItMvfI6tm6/lmKFvVGrGt6bFygVC5Q
 LoqA==
X-Gm-Message-State: ANhLgQ1tcWesHqLP/9G8ajIzJxLWPTFR3wleW7h6Pkue13o7mWyUJtui
 89TFXdLaU5ovyTAXy7j8AIj61Mw0TmdZ24p86B0=
X-Google-Smtp-Source: ADFU+vttEydWXPDZeK2Eh1MbJxDvyzAJL+v2bNjqnVh6uDbTRCRvwlHoixuJmVsQeyPsvPEEAeBFWch3OQ81dkWiVJ4=
X-Received: by 2002:a67:7182:: with SMTP id
 m124mr11015102vsc.150.1584149134414; 
 Fri, 13 Mar 2020 18:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002e20b9059fee8a94@google.com>
In-Reply-To: <0000000000002e20b9059fee8a94@google.com>
From: Qiujun Huang <anenbupt@gmail.com>
Date: Sat, 14 Mar 2020 09:25:23 +0800
Message-ID: <CADG63jD0cwOJGig0UyX1TJZh5-L6q=rqd2=qGACAnU_+Lk1gYA@mail.gmail.com>
Subject: Re: WARNING in idr_destroy
To: syzbot <syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, 
 daniel@ffwll.ch
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:17:18 +0000
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
Cc: willy@infradead.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to get idr_mutex first for idr_alloc.

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index b481cafdde28..aa72c8344ec7 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -420,6 +420,7 @@ static int fill_object_idr(struct drm_device *dev,

        /* add their IDs to the lease request - taking into account
           universal planes */
+       mutex_lock(&dev->mode_config.idr_mutex);
        for (o = 0; o < object_count; o++) {
                struct drm_mode_object *obj = objects[o];
                u32 object_id = objects[o]->id;
@@ -457,6 +458,7 @@ static int fill_object_idr(struct drm_device *dev,
                        }
                }
        }
+       mutex_unlock(&dev->mode_config.idr_mutex);

        ret = 0;
 out_free_objects:

On Tue, Mar 3, 2020 at 3:50 PM syzbot
<syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10e978e3e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
> dashboard link: https://syzkaller.appspot.com/bug?extid=05835159fe322770fe3d
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e978e3e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b1a819e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
>
> R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc2c
> R13: 00007fc6b3362d90 R14: 0000000000000004 R15: 000000000000002d
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 12260 at lib/radix-tree.c:682 radix_tree_free_nodes lib/radix-tree.c:682 [inline]
> WARNING: CPU: 0 PID: 12260 at lib/radix-tree.c:682 idr_destroy+0x1ae/0x260 lib/radix-tree.c:1572
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 0 PID: 12260 Comm: syz-executor386 Not tainted 5.6.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x1fb/0x318 lib/dump_stack.c:118
>  panic+0x264/0x7a9 kernel/panic.c:221
>  __warn+0x209/0x210 kernel/panic.c:582
>  report_bug+0x1b6/0x2f0 lib/bug.c:195
>  fixup_bug arch/x86/kernel/traps.c:174 [inline]
>  do_error_trap+0xcf/0x1c0 arch/x86/kernel/traps.c:267
>  do_invalid_op+0x36/0x40 arch/x86/kernel/traps.c:286
>  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
> RIP: 0010:radix_tree_free_nodes lib/radix-tree.c:682 [inline]
> RIP: 0010:idr_destroy+0x1ae/0x260 lib/radix-tree.c:1572
> Code: b5 63 f9 48 89 df 48 c7 c6 c0 0a 13 88 e8 6a ce 50 f9 4c 3b 65 b8 74 57 e8 cf b5 63 f9 4d 89 fc e9 67 ff ff ff e8 c2 b5 63 f9 <0f> 0b eb d5 89 f9 80 e1 07 38 c1 7c 84 e8 c0 de a0 f9 e9 7a ff ff
> RSP: 0018:ffffc90005107ba0 EFLAGS: 00010293
> RAX: ffffffff881363be RBX: ffff888087dba998 RCX: ffff888094062300
> RDX: 0000000000000000 RSI: 0000000000000040 RDI: ffff888087dba988
> RBP: ffffc90005107be8 R08: ffffffff88136330 R09: ffffed1012a78181
> R10: ffffed1012a78181 R11: 0000000000000000 R12: ffff888087dba980
> R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
>  drm_mode_create_lease_ioctl+0x1347/0x1860 drivers/gpu/drm/drm_lease.c:583
>  drm_ioctl_kernel+0x2cf/0x410 drivers/gpu/drm/drm_ioctl.c:786
>  drm_ioctl+0x52f/0x890 drivers/gpu/drm/drm_ioctl.c:886
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl fs/ioctl.c:763 [inline]
>  __do_sys_ioctl fs/ioctl.c:772 [inline]
>  __se_sys_ioctl+0x113/0x190 fs/ioctl.c:770
>  __x64_sys_ioctl+0x7b/0x90 fs/ioctl.c:770
>  do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x44a4b9
> Code: e8 0c e8 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 9b cc fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007fc6b3362d88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00000000006dbc28 RCX: 000000000044a4b9
> RDX: 0000000020000040 RSI: ffffffffffffffc6 RDI: 0000000000000003
> RBP: 00000000006dbc20 R08: 0000000000000001 R09: 0000000000000039
> R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc2c
> R13: 00007fc6b3362d90 R14: 0000000000000004 R15: 000000000000002d
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
