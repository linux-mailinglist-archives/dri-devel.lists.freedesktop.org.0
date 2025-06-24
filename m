Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CCAE5E0A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 09:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6B810E4EB;
	Tue, 24 Jun 2025 07:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67410E4EB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 07:38:28 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3ddbec809acso1178415ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 00:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750750707; x=1751355507;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pg2E10vssuCM+XsU6kDfEQQQvzjyCN2+uDtQavvqSw8=;
 b=DANM3EFSiAsQHXANMMJ/FhgeJlKC5gmCIVY0S0V+XDPYJL33UnoxBZfRAWK4ih6KWd
 +uDosznmClzUVIqmwfK4HkM+RAKK0yoEdd24fY6TnTJjxcaWSeEVBvuRY6NG9AXcjUps
 ANHZ6fA80f+mo3l609/z9G4rLWveg6zvkRStNHz+e+GKOB3tVh1u1igIOzMN7xHWdXYb
 79Crynm0EJmByjvitysO/WT/m9xvoMiFsmS4XjvyNULAQqoemItom1HEK7jGvlmpoGsq
 65J2LUExK1SN4zkGMVcXRT+L9HYTheiigCPiikZg+JHrYw1SEm3+LVMigQU+nU+/7rRw
 4ixA==
X-Gm-Message-State: AOJu0YzZzwFvo2eTeror1KDQ+VnSrkoi8mjNDjTj1OujYr0+/Rxyx5y3
 rcR+absaRWy/ocxKzta9XzRU4hG1ZlsBaCbx5t2+ygNbbWVtCvh8N5KRcR0hl5qyoZ5Lb9TTlc5
 cfYjo9d+dQopE280t4xjf/d/QzwCBMDafC65N1wa7dXp8tydJmeNaBna3+z4=
X-Google-Smtp-Source: AGHT+IGmXj1lteBVLizIUDVdDyviXUzthLi4evb2aGIxC4PQ6/+po4X29wL4ufQMIsMqILj6huXDzh9wYX6W4RHDWeLY0HijUubY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:32c1:b0:3dc:8b29:30bc with SMTP id
 e9e14a558f8ab-3de38cc3076mr176561655ab.21.1750750707384; Tue, 24 Jun 2025
 00:38:27 -0700 (PDT)
Date: Tue, 24 Jun 2025 00:38:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a55f3.050a0220.2303ee.0005.GAE@google.com>
Subject: [syzbot] Monthly dri report (Jun 2025)
From: syzbot <syzbot+listf9c7b18c782cecccf5a6@syzkaller.appspotmail.com>
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

During the period, 4 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 32 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 6097    Yes   WARNING in __alloc_frozen_pages_noprof
                  https://syzkaller.appspot.com/bug?extid=03fb58296859d8dbab4d
<2> 1518    Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<3> 446     Yes   WARNING in vkms_get_vblank_timestamp (2)
                  https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<4> 81      Yes   WARNING in drm_wait_one_vblank (2)
                  https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<5> 72      Yes   WARNING in drm_mode_create_lease_ioctl
                  https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<6> 36      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                  https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<7> 21      Yes   WARNING in drm_gem_prime_fd_to_handle
                  https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<8> 12      Yes   WARNING in drm_prime_destroy_file_private (2)
                  https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
<9> 4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                  https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
