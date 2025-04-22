Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362AFA96A4B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030B210E58E;
	Tue, 22 Apr 2025 12:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6344B10E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:41:30 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d81bc8ebc8so48992575ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745325689; x=1745930489;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XabI1/RqwgBmusfjMpa9WeWdHvqbiQieUH0AtSV1/ck=;
 b=tUnsW50BzR3NqVsFAKr069D8MrED4aTVbXacVq+a/YKjhmbKcUwseePGrTW0TBcwDn
 iixfsBIedD+relfkaQhftIFj5Sa7kHrmnhYOh+Er5ghsfeYjIIBVT8B4oOzqOGPfsTKE
 gOI85PQOJArSX2AMs3xz2Cd0HqtyWo1/mp/twJOyWq5tTD/Ywy/hYbdRSLiC1Kc+fLnf
 QcEMD8jL+bgXC9XSb5zZo3sTtSZiwg7So5V+zXdAjuaRalHmkKkfzgUkzEepfSPFcpTy
 Yl2UA22/28LKaKikXIubMHZo3tY9Jsebb5VhG7Q5cVeFxUhkwsTmQpQd/RCMtQMas2O5
 nYDg==
X-Gm-Message-State: AOJu0YwgjuPbxJH8hdwOoSGkR0uY2xyVsqjUDNCfUDSlwVbSaWhefqki
 QmDR2N17P1CxI5UCKLV/HzAOjQZtj0wIYXQZsD1fAKIrnxaMaFq5OQWklckn9z+T/e+Yr3flxtQ
 3AuGC3+tdAz0SNJbqffgJDemPrpfjAkOsiX9m+1IwGElyThmf8cXdoA0=
X-Google-Smtp-Source: AGHT+IHsJFmvhTE+LiZnbVa2m7xTT+ulUSnaA4+MC58bJXSsdd5Bs6X9iVu6jteEb71dc9qKl0tjv/rZShIRDajGk1e7O+3MrZwY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b49:b0:3d0:4b3d:75ba with SMTP id
 e9e14a558f8ab-3d88ed7c338mr138875475ab.4.1745325689577; Tue, 22 Apr 2025
 05:41:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 05:41:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68078e79.050a0220.8500a.0016.GAE@google.com>
Subject: [syzbot] Monthly dri report (Apr 2025)
From: syzbot <syzbot+listf1760c45c1a8a15cf5e1@syzkaller.appspotmail.com>
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

During the period, 1 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 32 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3442    Yes   WARNING in __alloc_frozen_pages_noprof
                   https://syzkaller.appspot.com/bug?extid=03fb58296859d8dbab4d
<2>  403     Yes   WARNING in vkms_get_vblank_timestamp (2)
                   https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3>  76      Yes   WARNING in drm_wait_one_vblank (2)
                   https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<4>  75      No    INFO: task hung in drm_atomic_get_plane_state
                   https://syzkaller.appspot.com/bug?extid=eee643fdccb7c015b3a6
<5>  72      Yes   WARNING in drm_mode_create_lease_ioctl
                   https://syzkaller.appspot.com/bug?extid=6754751ad05524dae739
<6>  35      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<7>  21      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<8>  4       Yes   WARNING in drm_prime_destroy_file_private (2)
                   https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
<9>  3       Yes   WARNING in drm_prime_fd_to_handle_ioctl
                   https://syzkaller.appspot.com/bug?extid=0da81ccba2345eeb7f48
<10> 1       No    WARNING in virtio_gpu_queue_fenced_ctrl_buffer
                   https://syzkaller.appspot.com/bug?extid=5afbc12ca70811c2bffb

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
