Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942B8BCECA
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9E910F044;
	Mon,  6 May 2024 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB56D10F044
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:18:33 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-36c8b8632b3so15807335ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 06:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715001513; x=1715606313;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7c7YmJFMZ55fSg7XNpDcD9Os2ihwoVxri7SE7ViUc0=;
 b=dRA7qE2Y4+E8cmSZIAwGtM4gSx5GSecUbA27tlNr3iZVngKhGLxlKHS4e0ANOChh8j
 qFq+GXisqpslQijAv1vX4xUDVNAeCY16ZpgugmnNvZBxqCyWQNjnCEYblWbgP9WQwymi
 09czN+ezQ6byT69It2Pvv8Yupqg/hPStt9o1vS6srd7XPDTnDYpxYNx9KcURQWq8sj1R
 O4xZsXIpB8A+5r56Iz9dsNtNHI4g2zHB07Rut15AVGsEqyb8T0tkULddEMQR38PgrvMc
 iesqYkOsiy1wR+DSM7rrzzec1Q0ssxtNZWl2eEvzDWgSr7eadQp0hBtneawdSKxAxEcW
 QJDA==
X-Gm-Message-State: AOJu0YzIdDk0taEqCe2kTbCvRAdFpb8wDg8T4LX5D//Wz2ojgqpDEWIr
 c1o5KmRd44SbqzHebY63AE7UPe5jBXeRT0KVagS4u2TgpiDLJll7sCVHokNEHcUw9FqsDbinq8k
 fWDMfxOKOkDhxIpFKe/f6AYJxVeDJPWAOdgG08SUtACyZ7r6mSsP7Ys0=
X-Google-Smtp-Source: AGHT+IE1Ro9qu+2Njle1sjA2cJLVkJudsME18R61IwZ4lgFiIPj0JN7vrupYRV9kn5vdZdLi2EpYYZaR3ePIt830GsucvgQq9ZeE
MIME-Version: 1.0
X-Received: by 2002:a92:c268:0:b0:36c:4c63:9c93 with SMTP id
 h8-20020a92c268000000b0036c4c639c93mr403952ild.3.1715001512900; Mon, 06 May
 2024 06:18:32 -0700 (PDT)
Date: Mon, 06 May 2024 06:18:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f748120617c8e723@google.com>
Subject: [syzbot] Monthly dri report (May 2024)
From: syzbot <syzbot+list81f184520f9f481c9488@syzkaller.appspotmail.com>
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
In total, 16 issues are still open and 31 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 460     Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2> 258     Yes   inconsistent lock state in sync_timeline_debug_remove
                  https://syzkaller.appspot.com/bug?extid=7dcd254b8987a29f6450
<3> 253     Yes   WARNING in vkms_get_vblank_timestamp (2)
                  https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<4> 206     Yes   inconsistent lock state in sync_info_debugfs_show
                  https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
<5> 24      Yes   kernel BUG in vmf_insert_pfn_prot (2)
                  https://syzkaller.appspot.com/bug?extid=398e17b61dab22cc56bc
<6> 16      Yes   WARNING in drm_gem_prime_fd_to_handle
                  https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<7> 9       Yes   divide error in drm_mode_vrefresh
                  https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
<8> 4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                  https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb
<9> 4       Yes   divide error in drm_mode_debug_printmodeline
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
