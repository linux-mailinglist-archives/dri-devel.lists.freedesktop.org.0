Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373ACAC2EBC
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 12:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A77910E148;
	Sat, 24 May 2025 10:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40A910E148
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:05:34 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85b41b906b3so70853239f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 03:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748081134; x=1748685934;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HOUPLOp/mgaEeHOsdVwjiQHNiJzpzM5WYGVIL4kghHg=;
 b=onnbC4PPxYhVnM2IVS0EeNTgTRRaUMhlAU6vyBL+mX4O+pGp7eiAmozguWJYPog1uP
 vOY5EZpcxXCKr308ScgnYTIw1uTJNmJBBSEUTn2xsu9e2lADQObG2LiUkBeM/8bsi6qJ
 qigEJ8dOK4FgdYyySOXvGcpCWSIyUzRsC5IcyC8ZAYw7nViLV99YlSGzPE0G54Vm6+LG
 KEPGhOuPM5WrjqORiKmzhi2D3OisqTbgvoRZsO6bjiKxGHLamphAicwZhJ4PDVrdeWux
 QqtVZnL4LOI8eWnZhpMYEQSzGYGhkUCNCK0vhnny5p/6hO5gSRe4/6jVBm1XYNZdNmRR
 +NsQ==
X-Gm-Message-State: AOJu0Yzvo/rZyLi62pToZNA/jXl9KvRmMS0rropYxpod8Tywq0v4i1iQ
 wM0Xuq1Y/EpuVwCWxnkqErTOT4IXS65ZsWJ78WsNi3jw6FHO7cHUu72dggueP6DJKxqqbWQ5xgJ
 p1UANAnPCRI+PmOo/H1QGeLteGSGL2nQwUPz7TbS+ymwBsuPs0Hj9fPUtEpo=
X-Google-Smtp-Source: AGHT+IEjyol7pGrZK7T1hqfMrIh1rBdVrWIUERLaHrL0Abnvq+u8aU0br1N+Ngd7Dqnt1r/yZ9425iZeZ6W5oWI+pGLcgYCNQ9DJ
MIME-Version: 1.0
X-Received: by 2002:a05:6602:b8b:b0:85b:476e:ede2 with SMTP id
 ca18e2360f4ac-86cbb8c2689mr225095939f.13.1748081134195; Sat, 24 May 2025
 03:05:34 -0700 (PDT)
Date: Sat, 24 May 2025 03:05:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199ee.a70a0220.29d4a0.07f8.GAE@google.com>
Subject: [syzbot] Monthly dri report (May 2025)
From: syzbot <syzbot+list79ff4d7714e12d11809b@syzkaller.appspotmail.com>
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

During the period, 3 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 32 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4961    Yes   WARNING in __alloc_frozen_pages_noprof
                   https://syzkaller.appspot.com/bug?extid=03fb58296859d8dbab4d
<2>  431     Yes   WARNING in vkms_get_vblank_timestamp (2)
                   https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3>  79      Yes   WARNING in drm_wait_one_vblank (2)
                   https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<4>  72      Yes   WARNING in drm_mode_create_lease_ioctl
                   https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<5>  35      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<6>  21      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<7>  4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                   https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb
<8>  1       No    possible deadlock in drm_getunique
                   https://syzkaller.appspot.com/bug?extid=2e9aa2a09550887c9d40
<9>  1       No    possible deadlock in drm_mode_atomic_ioctl (2)
                   https://syzkaller.appspot.com/bug?extid=8c517b890398864b52ef
<10> 1       No    possible deadlock in drm_modeset_lock (3)
                   https://syzkaller.appspot.com/bug?extid=d1451ae6745bd92ed771

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
