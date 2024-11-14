Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E69C8567
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA5710E7B9;
	Thu, 14 Nov 2024 08:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6798B10E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 08:59:23 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a7158d5c8aso4688535ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 00:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731574762; x=1732179562;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5zssj3quVVymKSXh7PyrXcZgz1qXWIQjEuhOq5pZc/Y=;
 b=UB4LwPwQDfKBgK3LtBNI+UyiOO0UQDhnHrsZ2kU7i7rmwBN8gHCHIomazWn846UcIT
 yGgxD4HtCvn783IT8s47O8zMJd81yE5iO+y0E/+yoBTIC6GRjyEqUnNXZ9FyKx8Fr4H4
 J+OVRisEbucLnBfA35SllhRczGc3xwSmS4O73fmtAENjXEGk5epijWtgp3Pizb1/KR01
 19cLfLdV8AwySk2957fC7IyBP5celPe5Tn0/9LdC5t1JtIVaZ5IwhHAQF2ZzZNem8bA5
 d1whz/lME9LveJAv7+aUn+MmbZNdyulMX0PWgisUBhu+1oTCESh0uk/rRXJn2o1wafze
 td2g==
X-Gm-Message-State: AOJu0YxzmAtpvAgWUEHSVJDp/CfizYF5cSbnMjE9f1fuBiwPPfpXBAYd
 3My1yW0Gnp38qIs0AfiRIIakMPvQk+9jm17fRbnbM5uPoUzJda6EbAMDZ8EM1vnRxESU854JAFq
 isCQIBZfeTwkzFLnDnV82kvP4xOxZ5hzI3V2ox3OvGYyuvfBOW7kxUo0=
X-Google-Smtp-Source: AGHT+IGLqFcQ2N114zaO5uZSvOpK4WNf3i7F922a3Pi+SDIsMrogj0l6hi3tzJPiqLwa/hL2lYKh7nuceo3OEb2uWfJ7RLcqSm1V
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154b:b0:3a0:4d1f:519c with SMTP id
 e9e14a558f8ab-3a7156d7c91mr73999395ab.3.1731574762607; Thu, 14 Nov 2024
 00:59:22 -0800 (PST)
Date: Thu, 14 Nov 2024 00:59:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6735bbea.050a0220.2a2fcc.0065.GAE@google.com>
Subject: [syzbot] Monthly dri report (Nov 2024)
From: syzbot <syzbot+lista02f0bac45ff1b3f6031@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
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

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 0 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 31 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  841     Yes   WARNING in drm_syncobj_array_find
                   https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2>  318     Yes   WARNING in vkms_get_vblank_timestamp (2)
                   https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3>  68      Yes   WARNING in drm_mode_create_lease_ioctl
                   https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<4>  62      No    INFO: task hung in drm_atomic_get_plane_state
                   https://syzkaller.appspot.com/bug?extid=eee643fdccb7c015b3a6
<5>  28      Yes   WARNING in drm_wait_one_vblank (2)
                   https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<6>  18      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<7>  12      Yes   divide error in drm_mode_vrefresh
                   https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
<8>  4       Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<9>  4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                   https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb
<10> 3       Yes   WARNING in drm_prime_fd_to_handle_ioctl
                   https://syzkaller.appspot.com/bug?extid=0da81ccba2345eeb7f48

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
