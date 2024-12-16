Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699759F2D2D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC51210E568;
	Mon, 16 Dec 2024 09:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA8510E568
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:44:21 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3ac98b49e4dso38202045ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734342261; x=1734947061;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQTFow5kBgqg7MVcn2fDaYhYjBgMHcFLjw9h5v8S15E=;
 b=lyiCwyRIzjFvDHLLceZLG5oUwvbQX6CtUsdoKjTbAX1hespbHEbwQfMf9HTh4E2qcO
 Yvhndx9CBm0t0CcmzSDjjci+ESjJ5eW/FTqECq8Aynue3UjZ+ErzRNSxfVb2D8tcxrGX
 YW0b1mNG61FS9BaVWHpT/F1xTKRy3pV00c+K59Pez46LQQQo49KnkuO4LlI6kvaKxfiS
 AHKNQVdc+cMZ4iNBPeCQnbcbvy+A4Yu60MLLRGqCvYN40XGHDgDarijTIRy9aBIP2Lyx
 T3jdnokcNFuW20oTFFF+EaY2J49CzdYO9lZwmy72qthk57rICT4fpsyX/a8q6kGSEgGv
 y1eA==
X-Gm-Message-State: AOJu0YxozCPHZ+y1TeTI4R3ZMX70ESbOzm91JAZxSb4Z2tCalYhib6vO
 lUGemAP7vMGatf5ZUZDx+8a81U63kkdMFgD9Cch9LjIIPXQ3XX+moiY2kq1c8okCDoB92jHGfCZ
 MTaWqt0FQn6JpS5PnDrIROIa3mJTEsyDO+a9OkQtkgMu/9JBorcdtXDg=
X-Google-Smtp-Source: AGHT+IE32lVajrmmFMsx2oL8z54XtOUSw3a/mH6s1PlqARarrcIulnuMxdV5kYWZXeAofjzJ+wcZ6adrpUZlojlsIK+gxeTLyRSm
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:248c:b0:3a7:8d8e:e730 with SMTP id
 e9e14a558f8ab-3aff2dd5e5fmr108753445ab.22.1734342261004; Mon, 16 Dec 2024
 01:44:21 -0800 (PST)
Date: Mon, 16 Dec 2024 01:44:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675ff674.050a0220.37aaf.0122.GAE@google.com>
Subject: [syzbot] Monthly dri report (Dec 2024)
From: syzbot <syzbot+listbe2d42c16524143e5dc9@syzkaller.appspotmail.com>
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

During the period, 2 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 31 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  1064    Yes   WARNING in drm_syncobj_array_find
                   https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2>  331     Yes   WARNING in vkms_get_vblank_timestamp (2)
                   https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3>  70      Yes   WARNING in drm_mode_create_lease_ioctl
                   https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<4>  64      No    INFO: task hung in drm_atomic_get_plane_state
                   https://syzkaller.appspot.com/bug?extid=eee643fdccb7c015b3a6
<5>  47      Yes   WARNING in drm_wait_one_vblank (2)
                   https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<6>  19      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<7>  14      Yes   divide error in drm_mode_vrefresh
                   https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
<8>  4       Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<9>  4       Yes   WARNING in drm_prime_destroy_file_private (2)
                   https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
<10> 4       Yes   divide error in drm_mode_debug_printmodeline
                   https://syzkaller.appspot.com/bug?extid=2e93e6fb36e6fdc56574

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
