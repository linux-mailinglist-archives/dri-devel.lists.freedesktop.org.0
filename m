Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414299BB38
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 21:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5FC10E1BA;
	Sun, 13 Oct 2024 19:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FC710E1BA
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 19:21:27 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3a3c5b90293so5182245ab.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 12:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728847286; x=1729452086;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4WU3kgEtTuMHg+8jTGa/m3Y0xT7Aassavqo9KaNTKhI=;
 b=QB6q9z14QooI0eXq6T3aK7BM3kR8CjbCdgtCI6PxdC3IERZO+gjGvYUesjuUhrz132
 3k54fimrr73kYb13nFGUFEQhR8cw9DUS1rAA0AuSql9MbErJxBp6F6BTBzFm0dSrcLpo
 ck18rZBpdpoPsmVKR3BAUYZUCXb6Yu4P4Cg/Q7GIuXAj7hOJG+f17WmfC04MEsCI5AHI
 UoCTJyiRppzdu4FwxAJBL2M0oIRu1krfcUwfIpWC4i0YGGbnm73c82gU8nJ7dKVDVI0E
 M+Z5YSKLGLUn2G+ARc96zQPMgu8IpfCjGoZ7BRcvGub313fRCum2zvBzQjP8quswLCTc
 xkrw==
X-Gm-Message-State: AOJu0YyKZ11Uwx17sVHJbs5qlksVNTpUAS40xwyFx7LUr2uATaQRly2/
 PiAUud2/twVDJjJdzQhCypAKblMBDoiLlqaWFc7HrJy8zNqpuAPjo8Ejf/bzd9iEBXudIsH+Qfz
 zKg69KaQSjv0fc9xA0Xo9Jh46+o7dPNqmyfMjDdyXraTjAi4+KiQujZ0=
X-Google-Smtp-Source: AGHT+IGM4P8g+P/xqgXlXPSOvSrmB/PNQ5Z6EW/IhzqSts0VYfiRKjLcz9UzpoSi75CVfI2RA6WVolB06KQIoaS4L4eU0xTQFoId
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8a:b0:3a0:c15f:7577 with SMTP id
 e9e14a558f8ab-3a3b5f4976fmr78978865ab.9.1728847286172; Sun, 13 Oct 2024
 12:21:26 -0700 (PDT)
Date: Sun, 13 Oct 2024 12:21:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670c1db6.050a0220.3e960.0044.GAE@google.com>
Subject: [syzbot] Monthly dri report (Oct 2024)
From: syzbot <syzbot+list6f950335a4c56f56249b@syzkaller.appspotmail.com>
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
In total, 18 issues are still open and 31 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 650     Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2> 298     Yes   WARNING in vkms_get_vblank_timestamp (2)
                  https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<3> 55      No    INFO: task hung in drm_atomic_get_plane_state
                  https://syzkaller.appspot.com/bug?extid=eee643fdccb7c015b3a6
<4> 18      Yes   WARNING in drm_gem_prime_fd_to_handle
                  https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<5> 17      Yes   WARNING in drm_wait_one_vblank (2)
                  https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
<6> 11      Yes   divide error in drm_mode_vrefresh
                  https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
<7> 4       Yes   divide error in drm_mode_debug_printmodeline
                  https://syzkaller.appspot.com/bug?extid=2e93e6fb36e6fdc56574
<8> 3       Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                  https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<9> 2       Yes   WARNING in drm_prime_destroy_file_private (2)
                  https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
